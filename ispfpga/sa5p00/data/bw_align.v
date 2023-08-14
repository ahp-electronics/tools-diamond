// ============================================================================
//                           COPYRIGHT NOTICE
// Copyright 2013 Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// This confidential and proprietary software may be used only as authorized by
// a licensing agreement from Lattice Semiconductor Corporation.
// The entire notice above must be reproduced on all authorized copies and
// copies may only be made to the extent permitted by a licensing agreement
// from Lattice Semiconductor Corporation.
//
// Lattice Semiconductor Corporation      TEL  : 1-800-Lattice (USA and Canada)
// 5555 NE Moore Court                           408-826-6000 (other locations)
// Hillsboro, OR 97124                    web  : http://www.latticesemi.com/
// U.S.A                                  email: techsupport@latticesemi.com
// =============================================================================
// Module     : bw_align.v
// Description:
//   - Bit-Word alignment logic for video 7:1 for Sapphire
// =============================================================================

`timescale 1ns/1ps
`define SHORT_SIM

module bw_align (
  // inputs
  rst,          // Asynchronous reset
  rx_sclk,      // Receive divided clock after the clkdiv
  update,       // Start the procedure, or re-start if need to optimize again
  pll_lock,     // Start bit/word alignment. After word lock, use to start over
  rxclk_word,   // Clk phase of IDDR71; output word for 7'b1100011 fixed pattern

  // outputs
  phasedir,     // connected to PLL phasedir port,controls dir of phase shift
  ready,        // Indicates alignment is done
  phasestep,    // Pulse to PLL to perform phase shift
  bit_lock,     // Bit alignment is achieved
  alignword,    // To IDDR71 and CLKDIV for word alignment rotation
  window_size,  // assumed to be 4 bits, inidicates size of valid window
  word_lock     // Word alignment is achieved
);

//-----------------------------------------------------------------------------
// PORTS DECLARATIONS
//-----------------------------------------------------------------------------
// input ports
input        rst; 
input        rx_sclk;  
input        pll_lock; 
input        update; 
input [6:0]  rxclk_word; 

// output ports
output       phasestep;
output       bit_lock;
output       alignword;
output       word_lock;
output [3:0] window_size;
output       phasedir;
output       ready;

//-----------------------------------------------------------------------------
// PARAMETERS
//-----------------------------------------------------------------------------
// Module parameters
`ifdef SHORT_SIM
  parameter pgen_cnt_width = 8;
`else
  parameter pgen_cnt_width = 16;
`endif
  parameter pgen_cnt_max   = { pgen_cnt_width{1'b1} };
  parameter preset_phase   = 0;
   
// Local parameters
// Bit/Word alignment SM's states
localparam  INIT           = 0;
localparam  FIND_BAD       = 1;
localparam  FIND_BAD2GUD   = 2;
localparam  FIND_GUD2BAD   = 3;
localparam  FIND_CENTER    = 4;
localparam  BIT_LOCKED     = 5;
localparam  WORD_LOCKED    = 6;


//-----------------------------------------------------------------------------
// SIGNAL DECLARATIONS
//-----------------------------------------------------------------------------
wire       rst;
wire       rx_sclk;
wire       pll_lock;
wire       update;
wire [6:0] rxclk_word;
wire       phasedir;
wire [6:0] rxclkwd_aligned;
wire       rxclk_word_change;
wire       rxclk_word_err;

reg        ready;
reg  [3:0] window_size;
reg        phasestep;
reg        bit_lock; 
reg        alignword;
reg        word_lock;

// Internal reg  
reg  [3:0] start_phase;
reg  [3:0] end_phase/* synthesis syn_noprune=1 */;
reg  [3:0] center_phase;
reg  [6:0] rxclk_word_buf;
reg        bad;
reg        check;
reg        done_check;
reg        time_out;
reg  [4:0] tout_cnt;
reg  [2:0] cs_bwalign;
reg  [2:0] ns_bwalign;
reg        move;
reg  [3:0] phase;
reg  [pgen_cnt_width-1:0]   gen_cnt;
reg  [1:0] findbad_cycle_cnt;

// Module output determination
// Used for phase computations
reg  [3:0] ph_ms_m8          /* synthesis syn_preserve=1 */;
reg  [3:0] s_p_ph_ms_m8_b2   /* synthesis syn_preserve=1 */;
reg  [3:0] ph_ms             /* synthesis syn_preserve=1 */;
reg  [3:0] s_p_ph_ms_b2      /* synthesis syn_preserve=1 */;
reg  [3:0] e_pph_ms          /* synthesis syn_preserve=1 */;
reg  [3:0] s_p_8_pph_ms_b2   /* synthesis syn_preserve=1 */;
reg  [3:0] si_pph_ms         /* synthesis syn_preserve=1 */;
reg  [3:0] s_p_16_pph_ms_b2  /* synthesis syn_preserve=1 */;
   
//-----------------------------------------------------------------------------
// WIRE ASSIGNMENTS
//-----------------------------------------------------------------------------
assign phasedir         = 1'b0;       // sets dir of phase shift in later phase
assign rxclkwd_aligned  = 7'b1100011; // h63 basis that it is already aligned

// determines of the receiver's clk word is same as the buffered  
assign rxclk_word_change = (rxclk_word != rxclk_word_buf) ? 1'b1 : 1'b0;
   
// should be 4 1's and 3 0's, otherwise it is duty cycle induced error.  
// used to check if the receiver's clock word is 4 1's and 3 0's, asserts if not
assign rxclk_word_err = (  rxclk_word == 7'b1100011 ) ?
                           1'b0 : 1'b1; 
						   
//-----------------------------------------------------------------------------
// DEBUG DISPLAYS IN SIMULATION
//-----------------------------------------------------------------------------
// Comment out if don't want to display in simulation
always @(posedge bit_lock) begin
  //$display("// %t : bit alignment achieved", $time);
  $display("// ========= BIT ALIGNMENT ACHIEVED: %0d ns ===========\n", $time); 
  $display("// \t\tValid Window Size = %d\n", window_size);
  $display("// \t\tStart Phase : %d\tCenter Phase : %d\tEnd Phase : %d\n", 
           start_phase, center_phase, end_phase);
  $display("// =========START WORD ALIGNMENT: %0d ns ==============\n", $time); 
  // $display("// \t\tAlign status : %d",align_status);
end

always @(posedge pll_lock) begin
  $display("// ========START BIT ALIGNMENT: %0d ns ================\n", $time); 
end
 
always @(posedge word_lock) begin
  // $display("// %t : Word alignment achieved.\n", $time); 
  $display("// ==========WORD ALIGNMENT ACHIEVED: %0d ns ==========\n", $time); 
end
 
always @(posedge phasestep) begin
  $display("// Rotate: \tStart Phase : %d\tCenter Phase : %d\tEnd Phase : %d\tPhase : %d\n", 
           start_phase, center_phase, end_phase, phase);
end

always @(posedge alignword) begin
  $display("// SLIP: \trxclk_word : %h\n", rxclk_word);
end

always @(posedge rx_sclk) begin
  if (ns_bwalign != cs_bwalign)
  begin
    case(ns_bwalign)
      0: $display("// Next State: 0: INIT\n");
      1: $display("// Next State: 1: FIND_BAD\n");
      2: $display("// Next State: 2: FIND_BAD2GUD\n");
      3: $display("// Next State: 3: FIND_GUD2BAD\n");
      4: $display("// Next State: 4: FIND_CENTER\n");
      5: $display("// Next State: 5: BIT_LOCKED\n");
      6: $display("// Next State: 6: WORD_LOCKED\n");
      default: $display("// Next State: X: Unknown\n");
    endcase
  end
end 

//-----------------------------------------------------------------------------
// REGISTER ASSIGNMENTS
//-----------------------------------------------------------------------------  
// Buffering rxclk_word
always @(posedge rx_sclk or posedge rst) begin
  if (rst==1'b1)
  begin
    rxclk_word_buf <= 0;
  end 
  else if (pll_lock== 1'b1)
  begin  
    rxclk_word_buf  <= rxclk_word;
  end
end
   
// block used to determine if there is a bad phase for the bit alignment
always @(posedge rx_sclk or posedge  rst) begin
  if (rst==1'b1)
  begin	  
    bad <= 0; 
  end		 
  else if (check == 1'b1)
  begin
    if (rxclk_word_change || rxclk_word_err)
    begin
      bad <= 1'b1;	
    end			
  end
  else if((check==1'b0)&&(done_check==1'b0))
  begin
    bad <=1'b0;
  end
end

// Input to Bit/Word Alignment SM
// General timing counter
always @(posedge rx_sclk or posedge  rst) begin
  if(rst==1'b1)
  begin
    gen_cnt <= 'b0;
  end
  else if (cs_bwalign==INIT)
  begin
    gen_cnt <= 'b0;
  end
  else if ( (cs_bwalign==WORD_LOCKED)&&(ns_bwalign==FIND_CENTER) ) 
  begin
    gen_cnt <= 'd1;
  end
  else
  begin
    gen_cnt <= gen_cnt+1;
  end
end

// Timing signals
always @(posedge rx_sclk or posedge  rst) begin
  if(rst==1'b1)
  begin
    check      <= 1'b0;
    done_check <= 1'b0;
    time_out   <= 1'b0;
  end
  else
  begin
    if ((gen_cnt >=32) && (gen_cnt!=pgen_cnt_max) && (cs_bwalign != BIT_LOCKED))
    begin
      check <= 1'b1;
    end
    else
    begin
      check <=1'b0;
    end

    // asserts every time general counter is maximum (FF)		   
    if (gen_cnt==pgen_cnt_max)
    begin
      done_check <= 1'b1;
    end
    else
    begin
      done_check <= 1'b0;
    end
  
    // assert time_out when bad phase cannot be found
    if (tout_cnt >18)
    begin
      time_out    <= 1'b1;
    end
    else
    begin
      time_out    <= 1'b0;
    end
	
  end
end

// Time out counter, when bad cannot be found
always @(posedge rx_sclk or posedge  rst) begin
  if(rst==1'b1)
  begin
    tout_cnt <= 'b0;
  end
  else if ((done_check==1'b1) && (cs_bwalign==FIND_BAD) &&
           (phase==4'b1111)&&(findbad_cycle_cnt!=2'b11)) 
  begin
    tout_cnt <= 0;
  end 
  else if ((done_check==1'b1) && ((cs_bwalign==FIND_BAD) ||
           (cs_bwalign==FIND_GUD2BAD)) )
  begin
    tout_cnt <= tout_cnt+1;
  end
  else if (done_check==1'b1)
  begin
    tout_cnt <= 'b0;
  end
end

// Time out reiteration counter when bad cannot be found
always @(posedge rx_sclk or posedge  rst) begin
  if(rst==1'b1)
  begin
    findbad_cycle_cnt <= 'b0;
  end
  else if (findbad_cycle_cnt==2'b11)
  begin
    findbad_cycle_cnt <= findbad_cycle_cnt;
  end
  else if ((done_check==1'b1)&&(phase=='b1111)&&(cs_bwalign==FIND_BAD))
  begin
    findbad_cycle_cnt <= findbad_cycle_cnt+1;
  end
  else 
  begin
    findbad_cycle_cnt <= findbad_cycle_cnt;
  end
end
   

// Bit/Word Alignment SM
// Sequential part
always @(posedge rx_sclk or posedge rst) begin
  if(rst==1'b1)
  begin
    cs_bwalign <= INIT;    // cs_bwalign- current bit alignement state
  end
  else
  begin
    cs_bwalign <= ns_bwalign; // ns_bwalign- next bit alignment state
  end
end

// Bit/Word Alignment SM
// Combinational part
// current and next state determination based on state machine algorithm
always @(*) begin
  case (cs_bwalign)
  INIT:
  begin // 0
    if (pll_lock==1'b1)
    begin
      ns_bwalign = FIND_BAD;
    end
    else
    begin
      ns_bwalign = INIT;
    end
  end
  FIND_BAD:
  begin // 1
    if (done_check & bad)
    begin
      ns_bwalign = FIND_BAD2GUD;
    end
    else if ((time_out==1'b1)&&(findbad_cycle_cnt==2'b11))
    begin
      ns_bwalign = FIND_CENTER;
    end
    else
    begin
      ns_bwalign = FIND_BAD;
    end
  end
  FIND_BAD2GUD:
  begin // 2
    if (done_check & ~bad)
    begin
      ns_bwalign = FIND_GUD2BAD;
    end
    else
    begin
      ns_bwalign = FIND_BAD2GUD;
    end
  end
  FIND_GUD2BAD: 
  begin // 3
    if (done_check & bad)
    begin
      ns_bwalign = FIND_CENTER;
    end
    else if (time_out==1'b1) 
    begin
      ns_bwalign = FIND_CENTER;
    end
    else
    begin
      ns_bwalign = FIND_GUD2BAD;
    end
  end
  FIND_CENTER: 
  begin  // 4
    if ( (done_check==1) && (phase == center_phase))
    begin
      ns_bwalign = BIT_LOCKED;	   
    end
    else
    begin
      ns_bwalign = FIND_CENTER;
    end
  end
  BIT_LOCKED: 
  begin  // 5
    if ( (done_check==1'b1)&&(rxclk_word==rxclkwd_aligned) )
    begin
      ns_bwalign = WORD_LOCKED;	 
    end			   
    else
    begin
      ns_bwalign = BIT_LOCKED;
    end
  end
  WORD_LOCKED: 
  begin  // 6
    if ( (pll_lock==0)||((pll_lock==1) && (update==1) && ((done_check && bad)||
         (rxclk_word != rxclkwd_aligned))) ) 
    begin
        ns_bwalign = INIT;
    end
    else
    begin
      ns_bwalign = WORD_LOCKED;
    end
  end
  default:
  begin
    ns_bwalign = INIT;
  end
  endcase
end

// Module outputs
// Intermediate phase computations (to improve Fmax)
always @(posedge rx_sclk or posedge  rst) begin  
  if(rst==1'b1)
  begin
    ph_ms_m8           <= 'b0;
    s_p_ph_ms_m8_b2    <= 'b0;
    ph_ms              <= 'b0;
    s_p_ph_ms_b2       <= 'b0;
    e_pph_ms           <= 'b0;
    s_p_8_pph_ms_b2    <= 'b0;
    si_pph_ms          <= 'b0;
    s_p_16_pph_ms_b2   <= 'b0;
  end
  else
  begin
    ph_ms_m8           <= phase - start_phase -8;
    s_p_ph_ms_m8_b2    <= start_phase + (phase - start_phase-8)/2;
    ph_ms              <= phase - start_phase;
    s_p_ph_ms_b2       <= start_phase + (phase - start_phase)/2;
    e_pph_ms           <= (8+phase) - start_phase;
    s_p_8_pph_ms_b2    <= start_phase + (8+phase - start_phase)/2;
    si_pph_ms          <= (16+phase) - start_phase;
    s_p_16_pph_ms_b2   <= start_phase + (16+phase - start_phase)/2;
  end 
end

// Module output determination
always @(posedge rx_sclk or posedge rst) begin
  if(rst==1'b1)
  begin
    move           <= 1'b0;
    phasestep      <= 1'b0;
    phase          <= preset_phase;
    start_phase    <= 0;
    end_phase      <= 0;
    window_size    <= 0;
    center_phase   <= 0;
    alignword      <= 1'b0;
    bit_lock       <= 1'b0;
    word_lock      <= 1'b0;
  end
  else 
  begin
    if ( (cs_bwalign==FIND_BAD)||(cs_bwalign ==FIND_BAD2GUD)||
	     (cs_bwalign==FIND_GUD2BAD)||(cs_bwalign==FIND_CENTER) )
    begin
      move <=1'b1;
    end
    else
    begin
      move <=1'b0;
    end
     
    // connected to PLL (PHASESTEP) to shift the output clock of pll (clkos)
    if ( (gen_cnt>=8)&&(gen_cnt<16)&&(move==1) )
    begin
      phasestep <=1'b1;
    end
    else
    begin
      phasestep <=1'b0;
    end

    if ( (gen_cnt==24)&&(move==1'b1) )
    begin
      phase <= phase + 1;
    end

    // set 12 phasesteps 
    if ( (cs_bwalign==FIND_BAD)&&(ns_bwalign==FIND_CENTER) )
    begin
      center_phase <= preset_phase + 4;
      window_size  <= 7;
    end

    if ( (cs_bwalign==FIND_BAD)&&(ns_bwalign==FIND_BAD2GUD) )
    begin
      center_phase <= phase + 4;
    end

    if ( (cs_bwalign==FIND_BAD2GUD)&&(ns_bwalign==FIND_GUD2BAD) )
    begin
      start_phase <= phase;
    end

    if((cs_bwalign==FIND_GUD2BAD)&&(ns_bwalign==FIND_CENTER)&&(time_out==1'b1)) 
    begin
      window_size   <= 7;
    end
      
    if((cs_bwalign==FIND_GUD2BAD)&&(ns_bwalign==FIND_CENTER)&&(time_out==1'b0)) 
    begin
      end_phase <= phase-1;
      if (phase >= start_phase) 
      begin
        if((phase-start_phase)>8)
        begin
          window_size    <= ph_ms_m8;      // phase - start_phase -8;
          center_phase <= s_p_ph_ms_m8_b2; // start_phase+(phase-start_phase-8)/2;
        end
        else
        begin
          window_size     <= ph_ms;        // phase - start_phase;
          center_phase <= s_p_ph_ms_b2;    // start_phase+(phase-start_phase)/2;
        end
      end
      else
      begin
        if ((16+phase-start_phase)>8)
        begin
          window_size     <= e_pph_ms;      // (8+phase) - start_phase;
          center_phase <= s_p_8_pph_ms_b2;  // start_phase+(8+phase-start_phase)/2;
        end
        else
        begin
          window_size  <= si_pph_ms;        // (16+phase) - start_phase;
          center_phase <= s_p_16_pph_ms_b2; // start_phase+(16+phase-start_phase)/2;
        end
      end
    end

    // connected to IDDR71 ALIGNWD pin, used for word alignment
    if ( (gen_cnt>=8)&&(gen_cnt<16)&&(cs_bwalign==BIT_LOCKED) )
    begin
      alignword    <= 1'b1;
    end
    else
    begin
      alignword    <= 1'b0;
    end
	
    // bit alignment is achieved
    if (((cs_bwalign==BIT_LOCKED)||(ns_bwalign==WORD_LOCKED))&&(findbad_cycle_cnt==2'b11))
    begin
      bit_lock <= 1'b0;
    end
    else if ( (cs_bwalign==BIT_LOCKED)||(ns_bwalign==WORD_LOCKED) )
    begin
      bit_lock <= 1'b1;
    end
    else
    begin
      bit_lock <= 1'b0;
    end

    // word alignment is achieved
    if (cs_bwalign==WORD_LOCKED)
    begin
      word_lock <= 1'b1;
    end
    else
    begin
      word_lock <= 1'b0;
    end

  end
end
   
always @(posedge rx_sclk or posedge rst) begin
  if(rst==1'b1) 
  begin
    ready <= 1'b0;
  end
  else if (word_lock == 1'b1)
  begin
    ready <= 1'b1;
  end
  else 
  begin
    ready <= 1'b0;
  end
end
   
endmodule // bw_align