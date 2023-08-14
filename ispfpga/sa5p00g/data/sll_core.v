//   ===========================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//   ---------------------------------------------------------------------------
//   Copyright (c) 2015 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED 
//   ------------------------------------------------------------------
//
//   Permission:
//
//      Lattice SG Pte. Ltd. grants permission to use this code
//      pursuant to the terms of the Lattice Reference Design License Agreement. 
//
//
//   Disclaimer:
//
//      This VHDL or Verilog source code is intended as a design reference
//      which illustrates how these types of functions can be implemented.
//      It is the user's responsibility to verify their design for
//      consistency and functionality through the use of formal
//      verification methods.  Lattice provides no warranty
//      regarding the use or functionality of this code.
//
//   ---------------------------------------------------------------------------
//
//                  Lattice SG Pte. Ltd.
//                  101 Thomson Road, United Square #07-02 
//                  Singapore 307591
//
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                       +65-6631-2000 (Singapore)
//                       +1-503-268-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
//   ---------------------------------------------------------------------------
//
// =============================================================================
//                         FILE DETAILS         
// Project               : SLL - Soft Loss Of Lock(LOL) Logic
// File                  : sll_core.v
// Title                 : Top-level file for SLL 
// Dependencies          : 1.
//                       : 2.
// Description           : 
// =============================================================================
//                         REVISION HISTORY
// Version               : 1.0
// Author(s)             : AV
// Mod. Date             : March 2, 2015
// Changes Made          : Initial Creation
// =============================================================================
//                         REVISION HISTORY
// Version               : 1.1
// Author(s)             : AV
// Mod. Date             : June 8, 2015
// Changes Made          : Following updates were made 
//                       : 1. Changed all the PLOL status logic and FSM to run
//                       :    on sli_refclk. 
//                       : 2. Added the HB logic for presence of tx_pclk 
//                       : 3. Changed the lparam assignment scheme for 
//                       :    simulation purposes. 
// =============================================================================
//                         REVISION HISTORY
// Version               : 1.2
// Author(s)             : AV
// Mod. Date             : June 24, 2015
// Changes Made          : Updated the gearing logic for SDI dynamic rate change
// =============================================================================
//                         REVISION HISTORY
// Version               : 1.3
// Author(s)             : AV
// Mod. Date             : July 14, 2015
// Changes Made          : Added the logic for dynamic rate change in CPRI
// =============================================================================
//                         REVISION HISTORY
// Version               : 1.4
// Author(s)             : AV
// Mod. Date             : August 21, 2015
// Changes Made          : Added the logic for dynamic rate change of 5G CPRI & 
//                         PCIe.
// =============================================================================
//                         REVISION HISTORY
// Version               : 1.5
// Author(s)             : ES/EB
// Mod. Date             : March 21, 2017
// Changes Made          : 1. Added pdiff_sync signal to syncrhonize pcount_diff 
//                       :    to sli_refclk.
//                       : 2. Updated terminal count logic for PCIe 5G
//                       : 3. Modified checking of pcount_diff in SLL state
//                       :    machine to cover actual count
//                       :    (from 16-bits to 22-bits)
// =============================================================================
//                         REVISION HISTORY
// Version               : 1.6
// Author(s)             : ES
// Mod. Date             : April 19, 2017
// Changes Made          : 1. Added registered lock and unlock signal from
//                            pdiff_sync to totally decouple pcount_diff from
//                            SLL state machine.
//                       : 2. Modified LPCLK_TC_4 to 1:1 clock ratio when CPRI
//                            is operating @ 4.9125Gbps data rate.
// =============================================================================
`timescale 1ns/10ps

module sll_core ( 
  //Reset and Clock inputs
  sli_rst,         //Active high asynchronous reset input
  sli_refclk,      //Refclk input to the Tx PLL
  sli_pclk,        //Tx pclk output from the PCS
  
  //Control inputs
  sli_div2_rate,   //Divide by 2 control; 0 - Full rate; 1 - Half rate
  sli_div11_rate,  //Divide by 11 control; 0 - Full rate; 1 - Div by 11
  sli_gear_mode,   //Gear mode control for PCS; 0 - 8/10; 1- 16/20
  sli_cpri_mode,   //Mode of operation specific to CPRI protocol
  sli_pcie_mode,   //Mode of operation specific to PCIe mode (2.5G or 5G)
  
  //LOL Output
  slo_plol         //Tx PLL Loss of Lock output to the user logic
  );
  
// Inputs
input       sli_rst;
input       sli_refclk;
input       sli_pclk;
input       sli_div2_rate;
input       sli_div11_rate;
input       sli_gear_mode;
input [2:0] sli_cpri_mode;
input       sli_pcie_mode;

// Outputs
output      slo_plol;


// Parameters
parameter PPROTOCOL              = "PCIE";     //Protocol selected by the User
parameter PLOL_SETTING           = 0;          //PLL LOL setting. Possible values are 0,1,2,3
parameter PDYN_RATE_CTRL         = "DISABLED"; //PCS Dynamic Rate control
parameter PPCIE_MAX_RATE         = "2.5";      //PCIe max data rate
parameter PDIFF_VAL_LOCK         = 20;         //Differential count value for Lock
parameter PDIFF_VAL_UNLOCK       = 39;         //Differential count value for Unlock
parameter PPCLK_TC               = 65535;      //Terminal count value for counter running on sli_pclk
parameter PDIFF_DIV11_VAL_LOCK   = 3;          //Differential count value for Lock for SDI Div11
parameter PDIFF_DIV11_VAL_UNLOCK = 3;          //Differential count value for Unlock for SDI Div11
parameter PPCLK_DIV11_TC         = 2383;       //Terminal count value (SDI Div11) for counter running on sli_pclk


// Local Parameters
localparam [1:0]  LPLL_LOSS_ST         = 2'b00;       //PLL Loss state
localparam [1:0]  LPLL_PRELOSS_ST      = 2'b01;       //PLL Pre-Loss state
localparam [1:0]  LPLL_PRELOCK_ST      = 2'b10;       //PLL Pre-Lock state
localparam [1:0]  LPLL_LOCK_ST         = 2'b11;       //PLL Lock state
`ifdef RSL_SIM_MODE
localparam [15:0] LRCLK_TC             = 16'd63;   //Terminal count value for counter running on sli_refclk
`else
localparam [15:0] LRCLK_TC             = 16'd65535;   //Terminal count value for counter running on sli_refclk
`endif
localparam [15:0] LRCLK_TC_PUL_WIDTH   = 16'd50;      //Pulse width for the Refclk terminal count pulse
localparam [7:0]  LHB_WAIT_CNT         = 8'd255;      //Wait count for the Heartbeat signal

// Local Parameters related to the CPRI dynamic modes
// Terminal count values for the four CPRI modes
localparam LPCLK_TC_0 = 32768;
localparam LPCLK_TC_1 = 65536;
localparam LPCLK_TC_2 = 131072;
localparam LPCLK_TC_3 = 163840;
localparam LPCLK_TC_4 = 65536;

// Lock values count values for the four CPRI modes and four PLOL settings (4x5)
// CPRI rate mode 0                CPRI rate mode 1                   CPRI rate mode 2                    CPRI rate mode 3                     CPRI rate mode 4
localparam LPDIFF_LOCK_00 = 9;     localparam LPDIFF_LOCK_10 = 19;    localparam LPDIFF_LOCK_20 = 39;     localparam LPDIFF_LOCK_30 = 49;      localparam LPDIFF_LOCK_40 = 19;
localparam LPDIFF_LOCK_01 = 9;     localparam LPDIFF_LOCK_11 = 19;    localparam LPDIFF_LOCK_21 = 39;     localparam LPDIFF_LOCK_31 = 49;      localparam LPDIFF_LOCK_41 = 19;
localparam LPDIFF_LOCK_02 = 49;    localparam LPDIFF_LOCK_12 = 98;    localparam LPDIFF_LOCK_22 = 196;    localparam LPDIFF_LOCK_32 = 245;     localparam LPDIFF_LOCK_42 = 98;
localparam LPDIFF_LOCK_03 = 131;   localparam LPDIFF_LOCK_13 = 262;   localparam LPDIFF_LOCK_23 = 524;    localparam LPDIFF_LOCK_33 = 655;     localparam LPDIFF_LOCK_43 = 262;

// Unlock values count values for the four CPRI modes and four PLOL settings (4x5)
// CPRI rate mode 0                  CPRI rate mode 1                      CPRI rate mode 2                       CPRI rate mode 3                         CPRI rate mode 4
localparam LPDIFF_UNLOCK_00 = 19;    localparam LPDIFF_UNLOCK_10 = 39;     localparam LPDIFF_UNLOCK_20 = 78;      localparam LPDIFF_UNLOCK_30 = 98;        localparam LPDIFF_UNLOCK_40 = 39;
localparam LPDIFF_UNLOCK_01 = 65;    localparam LPDIFF_UNLOCK_11 = 131;    localparam LPDIFF_UNLOCK_21 = 262;     localparam LPDIFF_UNLOCK_31 = 327;       localparam LPDIFF_UNLOCK_41 = 131;
localparam LPDIFF_UNLOCK_02 = 72;    localparam LPDIFF_UNLOCK_12 = 144;    localparam LPDIFF_UNLOCK_22 = 288;     localparam LPDIFF_UNLOCK_32 = 360;       localparam LPDIFF_UNLOCK_42 = 144;
localparam LPDIFF_UNLOCK_03 = 196;   localparam LPDIFF_UNLOCK_13 = 393;    localparam LPDIFF_UNLOCK_23 = 786;     localparam LPDIFF_UNLOCK_33 = 983;       localparam LPDIFF_UNLOCK_43 = 393;

// Input and Output reg and wire declarations
wire       sli_rst;
wire       sli_refclk;
wire       sli_pclk;
wire       sli_div2_rate;
wire       sli_div11_rate;
wire       sli_gear_mode;
wire [2:0] sli_cpri_mode;
wire       sli_pcie_mode;
wire       slo_plol;

//-------------- Internal signals reg and wire declarations --------------------

//Signals running on sli_refclk
reg  [15:0] rcount;           //16-bit Counter
reg         rtc_pul;          //Terminal count pulse
reg         rtc_pul_p1;       //Terminal count pulse pipeline
reg         rtc_ctrl;         //Terminal count pulse control

reg  [7:0]  rhb_wait_cnt;     //Heartbeat wait counter

//Heatbeat synchronization and pipeline registers
wire        rhb_sync;
reg         rhb_sync_p2;
reg         rhb_sync_p1;

//Pipeling registers for dynamic control mode
wire        rgear;
wire        rdiv2;
wire        rdiv11;
reg         rgear_p1;
reg         rdiv2_p1;
reg         rdiv11_p1;

reg         rstat_pclk;        //Pclk presence/absence status

reg  [21:0] rcount_tc;         //Tx_pclk terminal count register
reg  [15:0] rdiff_comp_lock;   //Differential comparison value for Lock
reg  [15:0] rdiff_comp_unlock; //Differential compariosn value for Unlock

wire        rpcie_mode;        //PCIe mode signal synchronized to refclk
reg         rpcie_mode_p1;     //PCIe mode pipeline register

wire        rcpri_mod_ch_sync; //CPRI mode change synchronized to refclk
reg         rcpri_mod_ch_p1;   //CPRI mode change pipeline register
reg         rcpri_mod_ch_p2;   //CPRI mode change pipeline register
reg         rcpri_mod_ch_st;   //CPRI mode change status

reg  [1:0]  sll_state;         //Current-state register for LOL FSM

reg         pll_lock;          //PLL Lock signal

//Signals running on sli_pclk
//Synchronization and pipeline registers
wire        ppul_sync;
reg         ppul_sync_p1;
reg         ppul_sync_p2;
reg         ppul_sync_p3;

wire        pdiff_sync;
reg         pdiff_sync_p1;
   
reg  [21:0] pcount;            //22-bit counter
reg  [21:0] pcount_diff;       //Differential value between Tx_pclk counter and theoritical value

//Heartbeat counter and heartbeat signal running on pclk
reg  [2:0]  phb_cnt;
reg         phb;

//CPRI dynamic mode releated signals
reg  [2:0]  pcpri_mode;
reg         pcpri_mod_ch;

//Assignment scheme changed mainly for simulation purpose
wire [15:0] LRCLK_TC_w;
assign LRCLK_TC_w = LRCLK_TC;

reg         unlock;
reg         lock;

//Heartbeat synchronization
sync # (.PDATA_RST_VAL(0)) phb_sync_inst ( 
  .clk     (sli_refclk),
  .rst     (sli_rst),
  .data_in (phb),
  .data_out(rhb_sync)
  );
  
  
//Terminal count pulse synchronization
sync # (.PDATA_RST_VAL(0)) rtc_sync_inst ( 
  .clk     (sli_pclk),
  .rst     (sli_rst),
  .data_in (rtc_pul),
  .data_out(ppul_sync)
  );

//Differential value logic update synchronization
sync # (.PDATA_RST_VAL(0)) pdiff_sync_inst ( 
  .clk     (sli_refclk),
  .rst     (sli_rst),
  .data_in (ppul_sync),
  .data_out(pdiff_sync)
  );

//Gear mode synchronization
sync # (.PDATA_RST_VAL(0)) gear_sync_inst ( 
  .clk     (sli_refclk),
  .rst     (sli_rst),
  .data_in (sli_gear_mode),
  .data_out(rgear)
  );
  
//Div2 synchronization
sync # (.PDATA_RST_VAL(0)) div2_sync_inst ( 
  .clk     (sli_refclk),
  .rst     (sli_rst),
  .data_in (sli_div2_rate),
  .data_out(rdiv2)
  );
  
//Div11 synchronization
sync # (.PDATA_RST_VAL(0)) div11_sync_inst ( 
  .clk     (sli_refclk),
  .rst     (sli_rst),
  .data_in (sli_div11_rate),
  .data_out(rdiv11)
  );
  
//CPRI mode change synchronization
sync # (.PDATA_RST_VAL(0)) cpri_mod_sync_inst ( 
  .clk     (sli_refclk),
  .rst     (sli_rst),
  .data_in (pcpri_mod_ch),
  .data_out(rcpri_mod_ch_sync)
  );
  
//PCIe mode change synchronization
sync # (.PDATA_RST_VAL(0)) pcie_mod_sync_inst ( 
  .clk     (sli_refclk),
  .rst     (sli_rst),
  .data_in (sli_pcie_mode),
  .data_out(rpcie_mode)
  );  

// =============================================================================
// Synchronized Lock/Unlock signals
// =============================================================================
always @(posedge sli_refclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    unlock        <= 1'b0;
    lock          <= 1'b0;
    pdiff_sync_p1 <= 1'b0;
  end
  else begin
    pdiff_sync_p1 <= pdiff_sync;
    if (unlock) begin
      unlock <= ~pdiff_sync && pdiff_sync_p1 ? 1'b0 : unlock;
    end
    else begin
      unlock <= pdiff_sync ? (pcount_diff[21:0] > {6'd0, rdiff_comp_unlock}) : 1'b0;
    end
    if (lock) begin
      lock <= ~pdiff_sync && pdiff_sync_p1 ? 1'b0 : lock;
    end
    else begin
      lock <= pdiff_sync ? (pcount_diff[21:0] <= {6'd0, rdiff_comp_lock}) : 1'b0;
    end
  end
end

// =============================================================================
// Refclk Counter, pulse generation logic and Heartbeat monitor logic
// =============================================================================
always @(posedge sli_refclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    rcount     <= 16'd0;
    rtc_pul    <= 1'b0;
    rtc_ctrl   <= 1'b0;
    rtc_pul_p1 <= 1'b0;
  end
  else begin
    //Counter logic
    if ((rgear_p1^rgear == 1'b1) || (rdiv2_p1^rdiv2 == 1'b1) || (rdiv11_p1^rdiv11 == 1'b1) || (rcpri_mod_ch_p1^rcpri_mod_ch_p2 == 1'b1) || (rpcie_mode_p1^rpcie_mode == 1'b1)) begin
      if (rtc_ctrl == 1'b1) begin
        rcount <= LRCLK_TC_PUL_WIDTH;
      end  
    end
    else begin
      if (rcount != LRCLK_TC_w) begin
        rcount <= rcount + 1;
      end
      else begin
        rcount <= 16'd0;   
      end
    end
    
    //Pulse control logic
    if (rcount == LRCLK_TC_w - 1) begin
      rtc_ctrl <= 1'b1;
    end
    
    //Pulse Generation logic
    if (rtc_ctrl == 1'b1) begin
      if ((rcount == LRCLK_TC_w) || (rcount < LRCLK_TC_PUL_WIDTH)) begin
        rtc_pul <= 1'b1;
    end  
      else begin
        rtc_pul <= 1'b0;  
      end
    end
    
    rtc_pul_p1 <= rtc_pul;  
  end  
end


// =============================================================================
// Heartbeat synchronization & monitor logic and Dynamic mode pipeline logic 
// =============================================================================
always @(posedge sli_refclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    rhb_sync_p1     <= 1'b0;
    rhb_sync_p2     <= 1'b0;
    rhb_wait_cnt    <= 8'd0;
    rstat_pclk      <= 1'b0;
    rgear_p1        <= 1'b0;
    rdiv2_p1        <= 1'b0;
    rdiv11_p1       <= 1'b0;
    rcpri_mod_ch_p1 <= 1'b0;
    rcpri_mod_ch_p2 <= 1'b0;
    rcpri_mod_ch_st <= 1'b0;
    rpcie_mode_p1   <= 1'b0;
    
  end
  else begin
    //Pipeline stages for the Heartbeat
    rhb_sync_p1 <= rhb_sync;
    rhb_sync_p2 <= rhb_sync_p1;
    
    //Pipeline stages of the Dynamic rate control signals
    rgear_p1  <= rgear;
    rdiv2_p1  <= rdiv2;
    rdiv11_p1 <= rdiv11;
    
    //Pipeline stage for PCIe mode
    rpcie_mode_p1 <= rpcie_mode;
    
    //Pipeline stage for CPRI mode change
    rcpri_mod_ch_p1 <= rcpri_mod_ch_sync;
    rcpri_mod_ch_p2 <= rcpri_mod_ch_p1;
    
    //CPRI mode change status logic
    if (rcpri_mod_ch_p1^rcpri_mod_ch_sync == 1'b1) begin
      rcpri_mod_ch_st <= 1'b1;
    end 
    
    //Heartbeat wait counter and monitor logic
    if (rtc_ctrl == 1'b1) begin
      if (rhb_sync_p1 == 1'b1 && rhb_sync_p2 == 1'b0) begin
        rhb_wait_cnt <= 8'd0;
        rstat_pclk   <= 1'b1;
      end
      else if (rhb_wait_cnt == LHB_WAIT_CNT) begin
        rhb_wait_cnt <= 8'd0;
        rstat_pclk   <= 1'b0;
      end
      else begin
        rhb_wait_cnt <= rhb_wait_cnt + 1;
      end
    end
  end  
end


// =============================================================================
// Pipleline registers for the TC pulse and CPRI mode change logic
// =============================================================================
always @(posedge sli_pclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    ppul_sync_p1 <= 1'b0;
    ppul_sync_p2 <= 1'b0;
    ppul_sync_p3 <= 1'b0;
    pcpri_mode   <= 3'b0;
    pcpri_mod_ch <= 1'b0;
  end
  else begin
    ppul_sync_p1 <= ppul_sync;
    ppul_sync_p2 <= ppul_sync_p1;
    ppul_sync_p3 <= ppul_sync_p2;
    
    //CPRI mode change logic
    pcpri_mode <= sli_cpri_mode;
    
    if (pcpri_mode != sli_cpri_mode) begin
      pcpri_mod_ch <= ~pcpri_mod_ch;
    end 
  end  
end
   

// =============================================================================
// Terminal count logic
// =============================================================================

//For SDI protocol with Dynamic rate control enabled
generate
if ((PDYN_RATE_CTRL == "ENABLED") && (PPROTOCOL == "SDI")) begin
always @(posedge sli_refclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    rcount_tc         <= 22'd0;
    rdiff_comp_lock   <= 16'd0;
    rdiff_comp_unlock <= 16'd0;
  end
  else begin
    //Terminal count logic
    //Div by 11 is enabled
    if (rdiv11 == 1'b1) begin
      //Gear mode is 16/20
      if (rgear == 1'b1) begin
        rcount_tc         <= PPCLK_DIV11_TC;
        rdiff_comp_lock   <= PDIFF_DIV11_VAL_LOCK;
        rdiff_comp_unlock <= PDIFF_DIV11_VAL_UNLOCK;
      end
      else begin
        rcount_tc         <= {PPCLK_DIV11_TC[20:0], 1'b0};
        rdiff_comp_lock   <= {PDIFF_DIV11_VAL_LOCK[14:0], 1'b0};
        rdiff_comp_unlock <= {PDIFF_DIV11_VAL_UNLOCK[14:0], 1'b0};
      end
    end
    //Div by 2 is enabled
    else if (rdiv2 == 1'b1) begin
      //Gear mode is 16/20
      if (rgear == 1'b1) begin
        rcount_tc         <= {1'b0,PPCLK_TC[21:1]};
        rdiff_comp_lock   <= {1'b0,PDIFF_VAL_LOCK[15:1]};
        rdiff_comp_unlock <= {1'b0,PDIFF_VAL_UNLOCK[15:1]};
      end
      else begin
        rcount_tc         <= PPCLK_TC;
        rdiff_comp_lock   <= PDIFF_VAL_LOCK;
        rdiff_comp_unlock <= PDIFF_VAL_UNLOCK;
      end
    end
    //Both div by 11 and div by 2 are disabled
    else begin
      //Gear mode is 16/20
      if (rgear == 1'b1) begin
        rcount_tc         <= PPCLK_TC;
        rdiff_comp_lock   <= PDIFF_VAL_LOCK;
        rdiff_comp_unlock <= PDIFF_VAL_UNLOCK;
      end
      else begin
        rcount_tc         <= {PPCLK_TC[20:0],1'b0};
        rdiff_comp_lock   <= {PDIFF_VAL_LOCK[14:0],1'b0};
        rdiff_comp_unlock <= {PDIFF_VAL_UNLOCK[14:0],1'b0};
      end
    end
  end  
end
end
endgenerate

//For G8B10B protocol with Dynamic rate control enabled
generate
if ((PDYN_RATE_CTRL == "ENABLED") && (PPROTOCOL == "G8B10B")) begin
always @(posedge sli_refclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    rcount_tc         <= 22'd0;
    rdiff_comp_lock   <= 16'd0;
    rdiff_comp_unlock <= 16'd0;
  end
  else begin
    //Terminal count logic
    //Div by 2 is enabled
    if (rdiv2 == 1'b1) begin
      rcount_tc         <= {1'b0,PPCLK_TC[21:1]};
      rdiff_comp_lock   <= {1'b0,PDIFF_VAL_LOCK[15:1]};
      rdiff_comp_unlock <= {1'b0,PDIFF_VAL_UNLOCK[15:1]};
    end
    else begin
      rcount_tc         <= PPCLK_TC;
      rdiff_comp_lock   <= PDIFF_VAL_LOCK;
      rdiff_comp_unlock <= PDIFF_VAL_UNLOCK;
    end
  end  
end
end
endgenerate


//For CPRI protocol with Dynamic rate control is disabled
generate
if ((PDYN_RATE_CTRL == "DISABLED") && (PPROTOCOL == "CPRI")) begin
always @(posedge sli_refclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    rcount_tc         <= 22'd0;
    rdiff_comp_lock   <= 16'd0;
    rdiff_comp_unlock <= 16'd0;
  end
  else begin
    //Terminal count logic for CPRI protocol
    //Only if there is a change in the rate mode from the default
    if (rcpri_mod_ch_st == 1'b1) begin
      if (rcpri_mod_ch_p1^rcpri_mod_ch_p2 == 1'b1) begin
        case(sli_cpri_mode)
          3'd0 : begin //For 0.6Gbps
            rcount_tc         <= LPCLK_TC_0;
            case(PLOL_SETTING)
              'd0 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_00;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_00;
              end
              
              'd1 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_01;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_01;
              end
              
              'd2 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_02;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_02;
              end
              
              'd3 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_03;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_03;
              end
              
              default : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_00;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_00;
              end
            endcase
          end
          
          3'd1 : begin //For 1.2Gbps
            rcount_tc         <= LPCLK_TC_1;
            case(PLOL_SETTING)
              'd0 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_10;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_10;
              end
              
              'd1 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_11;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_11;
              end
              
              'd2 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_12;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_12;
              end
              
              'd3 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_13;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_13;
              end
              
              default : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_10;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_10;
              end
            endcase
          end
          
          3'd2 : begin //For 2.4Gbps
            rcount_tc         <= LPCLK_TC_2;
            case(PLOL_SETTING)
              'd0 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_20;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_20;
              end
              
              'd1 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_21;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_21;
              end
              
              'd2 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_22;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_22;
              end
              
              'd3 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_23;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_23;
              end
              
              default : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_20;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_20;
              end
            endcase
          end
          
          3'd3 : begin //For 3.07Gbps
            rcount_tc         <= LPCLK_TC_3;
            case(PLOL_SETTING)
              'd0 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_30;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_30;
              end
              
              'd1 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_31;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_31;
              end
              
              'd2 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_32;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_32;
              end
              
              'd3 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_33;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_33;
              end
            endcase
          end    
              
          3'd4 : begin //For 4.9125bps
            rcount_tc         <= LPCLK_TC_4;
            case(PLOL_SETTING)
              'd0 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_40;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_40;
              end
              
              'd1 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_41;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_41;
              end
              
              'd2 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_42;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_42;
              end
              
              'd3 : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_43;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_43;
              end  
            
              default : begin
                rdiff_comp_lock   <= LPDIFF_LOCK_40;
                rdiff_comp_unlock <= LPDIFF_UNLOCK_40;
              end
            endcase
          end
        
          default : begin
            rcount_tc         <= LPCLK_TC_0;
            rdiff_comp_lock   <= LPDIFF_LOCK_00;
            rdiff_comp_unlock <= LPDIFF_UNLOCK_00;
          end
        endcase
      end
    end
    else begin
      //If there is no change in the CPRI rate mode from default
      rcount_tc         <= PPCLK_TC;
      rdiff_comp_lock   <= PDIFF_VAL_LOCK;
      rdiff_comp_unlock <= PDIFF_VAL_UNLOCK;
    end  
  end  
end
end
endgenerate

//For PCIe protocol with Dynamic rate control disabled
generate
if ((PDYN_RATE_CTRL == "DISABLED") && (PPROTOCOL == "PCIE")) begin
always @(posedge sli_refclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    rcount_tc         <= 22'd0;
    rdiff_comp_lock   <= 16'd0;
    rdiff_comp_unlock <= 16'd0;
  end
  else begin
    //Terminal count logic
    if (PPCIE_MAX_RATE == "2.5") begin
      //2.5G mode is enabled
      rcount_tc         <= PPCLK_TC;
      rdiff_comp_lock   <= PDIFF_VAL_LOCK;
      rdiff_comp_unlock <= PDIFF_VAL_UNLOCK;
    end
    else begin
      //5G mode is enabled
      if (rpcie_mode == 1'b1) begin
        rcount_tc         <= PPCLK_TC;
        rdiff_comp_lock   <= PDIFF_VAL_LOCK;
        rdiff_comp_unlock <= PDIFF_VAL_UNLOCK;
      end
      else begin
        //2.5G mode is enabled
        rcount_tc         <= {1'b0,PPCLK_TC[21:1]};
        rdiff_comp_lock   <= {1'b0,PDIFF_VAL_LOCK[15:1]};
        rdiff_comp_unlock <= {1'b0,PDIFF_VAL_UNLOCK[15:1]};
      end 
    end 	  
  end  
end
end
endgenerate

//For all protocols other than CPRI & PCIe
generate
if ((PDYN_RATE_CTRL == "DISABLED") && ((PPROTOCOL != "CPRI") && (PPROTOCOL != "PCIE"))) begin
always @(posedge sli_refclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    rcount_tc         <= 22'd0;
    rdiff_comp_lock   <= 16'd0;
    rdiff_comp_unlock <= 16'd0;
  end
  else begin
    //Terminal count logic for all protocols other than CPRI & PCIe
    rcount_tc         <= PPCLK_TC;
    rdiff_comp_lock   <= PDIFF_VAL_LOCK;
    rdiff_comp_unlock <= PDIFF_VAL_UNLOCK;
  end  
end
end
endgenerate


// =============================================================================
// Tx_pclk counter, Heartbeat and Differential value logic
// =============================================================================
always @(posedge sli_pclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    pcount      <= 22'd0;
    pcount_diff <= 22'd65535;
    phb_cnt     <= 3'd0;
    phb         <= 1'b0;
  end
  else begin
    //Counter logic
    if (ppul_sync_p1 == 1'b1 && ppul_sync_p2 == 1'b0) begin
      pcount <= 22'd0;
    end
    else begin
      pcount <= pcount + 1;
    end
    
    //Heartbeat logic
    phb_cnt <= phb_cnt + 1;
    
    if ((phb_cnt < 3'd4) && (phb_cnt >= 3'd0)) begin
      phb <= 1'b1;
    end  
    else begin
      phb <= 1'b0;  
    end 
    
    //Differential value logic
    if (ppul_sync_p1 == 1'b1 && ppul_sync_p2 == 1'b0) begin
      pcount_diff <= rcount_tc + ~(pcount) + 1;
    end  
    else if (ppul_sync_p2 == 1'b1 && ppul_sync_p3 == 1'b0) begin
      if (pcount_diff[21] == 1'b1) begin
        pcount_diff <= ~(pcount_diff) + 1;
      end
    end
  end  
end


// =============================================================================
// State transition logic for SLL FSM
// =============================================================================
always @(posedge sli_refclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    sll_state <= LPLL_LOSS_ST; 
  end
  else begin
    //Reasons to declare an immediate loss - Absence of Tx_pclk, Dynamic rate change for SDI or CPRI
    if ((rstat_pclk == 1'b0) || (rgear_p1^rgear == 1'b1) || (rdiv2_p1^rdiv2 == 1'b1) || 
    (rdiv11_p1^rdiv11 == 1'b1) || (rcpri_mod_ch_p1^rcpri_mod_ch_p2 == 1'b1) || (rpcie_mode_p1^rpcie_mode == 1'b1)) begin
      sll_state <= LPLL_LOSS_ST;
    end
    else begin  
      case(sll_state)
        LPLL_LOSS_ST : begin
          if (rtc_pul_p1 == 1'b1 && rtc_pul == 1'b0) begin
            if (unlock) begin
              sll_state <= LPLL_LOSS_ST;
            end
            else if (lock) begin
              if (PLOL_SETTING == 2'd0) begin
                sll_state <= LPLL_PRELOCK_ST;
              end
              else begin
                sll_state <= LPLL_LOCK_ST;
              end
            end
          end
        end
        
        LPLL_LOCK_ST : begin
          if (rtc_pul_p1 == 1'b1 && rtc_pul == 1'b0) begin
            if (lock) begin
              sll_state <= LPLL_LOCK_ST;
            end
            else begin
              if (PLOL_SETTING == 2'd0) begin
                sll_state <= LPLL_LOSS_ST;
              end
              else begin
                sll_state <= LPLL_PRELOSS_ST;
              end
            end
          end
        end
        
        LPLL_PRELOCK_ST : begin
          if (rtc_pul_p1 == 1'b1 && rtc_pul == 1'b0) begin
            if (lock) begin
              sll_state <= LPLL_LOCK_ST;
            end
            else begin
              sll_state <= LPLL_PRELOSS_ST;
            end
          end
        end
        
        LPLL_PRELOSS_ST : begin
          if (rtc_pul_p1 == 1'b1 && rtc_pul == 1'b0) begin
            if (unlock) begin
              sll_state <= LPLL_PRELOSS_ST;
            end
            else if (lock) begin
              sll_state <= LPLL_LOCK_ST;
            end
          end
        end
        
        default: begin
          sll_state <= LPLL_LOSS_ST;
        end
      endcase
    end  
  end  
end


// =============================================================================
// Logic for Tx PLL Lock
// =============================================================================
always @(posedge sli_refclk or posedge sli_rst) begin
  if (sli_rst == 1'b1) begin
    pll_lock <= 1'b0; 
  end
  else begin
    case(sll_state)
      LPLL_LOSS_ST : begin
        pll_lock <= 1'b0;
      end
      
      LPLL_LOCK_ST : begin
        pll_lock <= 1'b1;
      end
      
      LPLL_PRELOSS_ST : begin
        pll_lock <= 1'b0;
      end
      
      default: begin
        pll_lock <= 1'b0;
      end
    endcase
  end  
end

assign slo_plol = ~(pll_lock);

endmodule  


//   ===========================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//   ---------------------------------------------------------------------------
//   Copyright (c) 2015 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED 
//   ------------------------------------------------------------------
//
//   Permission:
//
//      Lattice SG Pte. Ltd. grants permission to use this code
//      pursuant to the terms of the Lattice Reference Design License Agreement. 
//
//
//   Disclaimer:
//
//      This VHDL or Verilog source code is intended as a design reference
//      which illustrates how these types of functions can be implemented.
//      It is the user's responsibility to verify their design for
//      consistency and functionality through the use of formal
//      verification methods.  Lattice provides no warranty
//      regarding the use or functionality of this code.
//
//   ---------------------------------------------------------------------------
//
//                  Lattice SG Pte. Ltd.
//                  101 Thomson Road, United Square #07-02 
//                  Singapore 307591
//
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                       +65-6631-2000 (Singapore)
//                       +1-503-268-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
//   ---------------------------------------------------------------------------
//
// =============================================================================
//                         FILE DETAILS
// Project               : Synchronizer Logic
// File                  : sync.v
// Title                 : Synchronizer module
// Description           : 
// =============================================================================
//                         REVISION HISTORY
// Version               : 1.0
// Author(s)             : AV
// Mod. Date             : July 7, 2015
// Changes Made          : Initial Creation
// -----------------------------------------------------------------------------
// Version               : 1.1
// Author(s)             : EB
// Mod. Date             : March 21, 2017
// Changes Made          : 
// =============================================================================

`ifndef PCS_SYNC_MODULE
`define PCS_SYNC_MODULE
module sync ( 
  clk,
  rst,
  data_in,
  data_out
  );
  
input  clk;                  //Clock in which the async data needs to be synchronized to
input  rst;                  //Active high reset
input  data_in;              //Asynchronous data
output data_out;             //Synchronized data

parameter PDATA_RST_VAL = 0; //Reset value for the registers

reg data_p1;
reg data_p2;

// =============================================================================
// Synchronization logic
// =============================================================================
always @(posedge clk or posedge rst) begin
  if (rst == 1'b1) begin
    data_p1 <= PDATA_RST_VAL;
    data_p2 <= PDATA_RST_VAL; 
  end
  else begin
    data_p1 <= data_in;
    data_p2 <= data_p1;
  end  
end

assign data_out = data_p2; 

endmodule    
`endif