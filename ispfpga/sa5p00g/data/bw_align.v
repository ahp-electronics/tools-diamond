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
// -----------------------------------------------------------------------------
// Version               : 1.0
// Author(s)             : 
// Mod. Date:            : 
// Changes Made          : - Initial version for Sapphire
// -----------------------------------------------------------------------------
// Version               : 1.1
// Author(s)             : ES
// Mod. Date:            : May 17, 2017
// Changes Made          : - Added phase step compensation to account for
//                       :   PVT variation.
//                       : - Enhancement of PLL phase step and DELAYF 
//                       :   adjustment for optimal SU & HD
// =============================================================================
`timescale 1ns/1ps 
`define SHORT_SIM
module bw_align (
  // inputs
  rst,            // Asynchronous reset
  rx_sclk,        // Receive divided clock after the CLKDIVlock_chk
  update,         // Start the procedure, or re-start if need to optimize again
  sync_ready,     // Start bit/word alignment. After word lock, use to start over
  rxclk_word,     // Clk phase of IDDRX71/IDDRX141

  // outputs
  phasedir,       // connected to PLL phasedir port,controls dir of phase shift
  ready,          // '1' indicates alignment is done
  phasestep,      // Pulse to PLL to perform phase shift
  bit_lock,       // '1' means Bit alignment is achieved
  alignword,      // To IDDRX71/IDDRX141 and CLKDIV for word alignment rotation
  window_size,    // assumed to be 4 bits, inidicates size of valid window
  word_lock       // '1' means Word alignment is achieved
);

  parameter RX_GEAR      = 7;   // set LVDS gearing to 1:7 by default
                                // valid values are 7 & 14 only
  parameter POLARITY     = 0;   // 0: left(+) | 1: right(-)
  parameter COMPENSATION = 1;   // adjustment from center alignment

//-----------------------------------------------------------------------------
// PORTS DECLARATIONS
//-----------------------------------------------------------------------------
// input ports
input        rst; 
input        rx_sclk;  
input        sync_ready; 
input        update; 
input [RX_GEAR-1:0]  rxclk_word; 

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
  parameter pgen_cnt_width = 7; 
  //parameter pgen_cnt_width = 8;
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
wire                     rst;
wire                     sync_ready;   
wire                     rx_sclk;
wire                     update;
wire [RX_GEAR-1:0]       rxclk_word;
wire                     phasedir;
wire [RX_GEAR-1:0]       rxclkwd_aligned;
wire                     rxclk_word_change;
wire                     rxclk_word_err;

reg                      ready;
reg [3:0]                window_size;
reg                      phasestep;
reg                      bit_lock; 
reg                      alignword;
reg                      word_lock;
                         
// Internal reg          
wire                     pll_lock;
reg [3:0]                start_phase;
reg [3:0]                end_phase/* synthesis syn_noprune=1 */;
reg [3:0]                center_phase;
reg [RX_GEAR-1:0]        rxclk_word_buf;
reg                      bad;
reg                      check;
reg                      done_check;
reg                      time_out;
reg [4:0]                tout_cnt;
reg [2:0]                cs_bwalign;
reg [2:0]                ns_bwalign;
reg                      move;
reg [3:0]                phase;
reg [pgen_cnt_width-1:0] gen_cnt;
reg [1:0]                findbad_cycle_cnt;
reg                      update_r0; 
reg                      update_r1; 
reg                      pll_lock_r0; 
reg                      pll_lock_r1;

reg                      phase_direction;
reg [4:0]                phase_step_cnt;
reg [3:0]                phase_step_cnt_div2;

wire [4:0]               phase_step_cnt_total;
wire [3:0]               phase_minus1;
wire                     phase_polarity;
wire [2:0]               phase_compensation;

//-----------------------------------------------------------------------------
// WIRE ASSIGNMENTS
//-----------------------------------------------------------------------------
assign phase_minus1     = phase - 1;
// port renamed from pll_lock to sync_ready
// internally, use pll_lock signal to avoid major modification in the code    
assign pll_lock         = sync_ready;   
assign phasedir         = phase_direction;
                               
//For 1:7 gearing: 7'h63   
//For 1:14 gearing: 14'h31E3
assign rxclkwd_aligned  = (RX_GEAR == 7 ) ? 
                          7'b1100011 : 14'b11000111100011 ; 

// determines of the receiver's clk word is same as the buffered  
assign rxclk_word_change = (rxclk_word != rxclk_word_buf) ? 1'b1 : 1'b0;

// should be 4 1's and 3 0's, otherwise it is duty cycle induced error.  
// used to check if the receiver's clock word is 4 1's and 3 0's, asserts if not
// For 1:14, repeat the 1:7 pattern 2X   
generate
  if (RX_GEAR == 7 ) begin
    assign rxclk_word_err = (  rxclk_word == 7'b1100011 ) ?
                           1'b0 : 1'b1; 
  end
  else if (RX_GEAR == 14) begin
    assign rxclk_word_err = (  rxclk_word == 14'b11000111100011 ) ?
                           1'b0 : 1'b1;
  end
endgenerate			

assign phase_polarity       = POLARITY;
assign phase_compensation   = COMPENSATION;
assign phase_step_cnt_total = phase_polarity
                              ? phase_step_cnt_div2 - phase_compensation
							  : phase_step_cnt_div2 + phase_compensation;

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

always @(posedge pll_lock_r1) begin
  $display("// ========START BIT ALIGNMENT: %0d ns ================\n", $time); 
end
 
always @(posedge word_lock) begin
  // $display("// %t : Word alignment achieved.\n", $time); 
  $display("// ==========WORD ALIGNMENT ACHIEVED: %0d ns ==========\n", $time); 
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
      7: $display("// Next State: 7: CENTER_ADJUST\n");
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
  else if (pll_lock_r1== 1'b1)
  begin  
    rxclk_word_buf  <= rxclk_word;
  end
end

// synchronizing pll_lock and update signals
always @(posedge rx_sclk or posedge rst) begin
  if (rst==1'b1)
  begin
    update_r0   <= 1'b0; 
    update_r1   <= 1'b0; 
    pll_lock_r0 <= 1'b0; 
    pll_lock_r1 <= 1'b0;
  end 
  else 
  begin  
    update_r0   <= update; 
    update_r1   <= update_r0; 
    pll_lock_r0 <= pll_lock; 
    pll_lock_r1 <= pll_lock_r0;
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
  //Modified to minimize switching when word lock is already achieved 
  //else if (cs_bwalign==INIT) 
  else if ((cs_bwalign==INIT) || ((cs_bwalign==WORD_LOCKED) && (ns_bwalign==WORD_LOCKED)))
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
  //7:1 gearing  
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
    if (pll_lock_r1==1'b1)
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
    //if ((done_check==1) && (phase > center_phase))
    if ((done_check==1) && (phase_step_cnt == phase_step_cnt_total))
    begin
       ns_bwalign = BIT_LOCKED;  
       //ns_bwalign = CENTER_ADJUST;
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
  begin  // 7
     
    if ( (pll_lock_r1==0)||((pll_lock_r1==1) && (update_r1==1) && ((done_check && bad)||
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

// Module output determination
always @(posedge rx_sclk or posedge rst) begin
  if(rst==1'b1)
  begin
    move                <= 1'b0;
    phasestep           <= 1'b0;
    phase               <= preset_phase;
    start_phase         <= 0;
    end_phase           <= 0;
    window_size         <= 0;
    center_phase        <= 0;
    alignword           <= 1'b0;
    bit_lock            <= 1'b0;
    word_lock           <= 1'b0;
    phase_direction     <= 1'b0;
    phase_step_cnt      <= 0;
    phase_step_cnt_div2 <= 0;
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

    if ((cs_bwalign==FIND_BAD)&&(ns_bwalign==FIND_CENTER)) begin
      window_size  <= 15; // 15 steps to the left and 15 steps to the right
    end

    if ((cs_bwalign==FIND_BAD2GUD)&&(ns_bwalign==FIND_GUD2BAD)) begin
      start_phase <= phase;
    end

    if ((cs_bwalign==FIND_GUD2BAD)&&(ns_bwalign==FIND_CENTER)&&(time_out==1'b1)) begin
      window_size <= 7;
    end
      
    if ((cs_bwalign==FIND_GUD2BAD)&&(ns_bwalign==FIND_CENTER)&&(time_out==1'b0)) begin
      phase_direction <= 1'b1;
      end_phase       <= phase_minus1;
      window_size     <= phase_step_cnt_div2;
    end

    if((cs_bwalign==FIND_CENTER)&&(ns_bwalign==BIT_LOCKED)) begin
      phase_direction <= 1'b0;
    end
    
    // connected to IDDRX71/141 ALIGNWD pin, used for word alignment
    if ( (gen_cnt>=8)&&(gen_cnt<16)&&(cs_bwalign==BIT_LOCKED) )
    begin
      alignword    <= 1'b1;
    end
    else
    begin
      alignword    <= 1'b0;
    end
	
    // bit_lock = 1'b1 means bit alignment is achieved
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

    // word_lock = 1'b1 means word alignment is achieved
    if (cs_bwalign==WORD_LOCKED)
    begin
      word_lock <= 1'b1;
    end
    else
    begin
      word_lock <= 1'b0;
    end

    if ((cs_bwalign==FIND_BAD2GUD) && (ns_bwalign==FIND_GUD2BAD)) begin
      phase_step_cnt <= phase_step_cnt + 1;
    end
    else if ((done_check==1'b1) && (cs_bwalign==FIND_GUD2BAD)) begin
      if (bad)
        phase_step_cnt <= 0;
      else
        phase_step_cnt <= phase_step_cnt + 1;
    end
    else if ((done_check==1'b1) && (cs_bwalign==FIND_CENTER)) begin
      phase_step_cnt <= phase_step_cnt + 1;
    end
    phase_step_cnt_div2 <= (cs_bwalign==FIND_GUD2BAD)
                           ? (phase_step_cnt / 2) - 1
                           : phase_step_cnt_div2;
  end
end

// output ready is asserted when word alignment is achieved   
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
