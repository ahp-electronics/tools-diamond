
//   ===========================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//   ---------------------------------------------------------------------------
//   Copyright (c) 2016 by Lattice Semiconductor Corporation
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
// Project               : RSL- Reset Sequence Logic
// File                  : rsl_core.v
// Title                 : Top-level file for RSL
// Dependencies          : 1.
//                       : 2.
// Description           :
// =============================================================================
//                        REVISION HISTORY
// Version               : 1.0
// Author(s)             : BM
// Mod. Date             : October 28, 2013
// Changes Made          : Initial Creation
// -----------------------------------------------------------------------------
// Version               : 1.1
// Author(s)             : BM
// Mod. Date             : November 06, 2013
// Changes Made          : Tx/Rx separation, ready port code exclusion
// -----------------------------------------------------------------------------
// Version               : 1.2
// Author(s)             : BM
// Mod. Date             : June 13, 2014
// Changes Made          : Updated Rx PCS reset method
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// Version               : 1.3
// Author(s)             : UA
// Mod. Date             : Dec 19, 2014
// Changes Made          : Added new parameter fro PCIE
// -----------------------------------------------------------------------------
// Version               : 1.31
// Author(s)             : BM/UM
// Mod. Date             : Feb 23, 2016
// Changes Made          : Behavior of rx_rdy output modified. The output rx_rdy
//                         and the rx_rdy wait counter are reset to zero on
//                         LOL or LOS. Reverted back the counter value change for PCIE.
// -----------------------------------------------------------------------------
// Version               : 1.4
// Author(s)             : EB
// Mod. Date:            : March 21, 2017
// Changes Made          :
// -----------------------------------------------------------------------------
// Version               : 1.5
// Author(s)             : ES
// Mod. Date:            : May 8, 2017
// Changes Made          : Implemented common RSL behaviour as proposed by BM.
// =============================================================================

`timescale 1ns/10ps

module rsl_core (
      // ------------ Inputs
      // Common
      rui_rst,               // Active high reset for the RSL module
      rui_serdes_rst_dual_c, // SERDES macro reset user command
      rui_rst_dual_c,        // PCS dual reset user command
      rui_rsl_disable,       // Active high signal that disables all reset outputs of RSL
      // Tx
      rui_tx_ref_clk,        // Tx reference clock
      rui_tx_serdes_rst_c,   // Tx SERDES reset user command
      rui_tx_pcs_rst_c,      // Tx lane reset user command
      rdi_pll_lol,           // Tx PLL Loss of Lock status input from the SERDES
      // Rx
      rui_rx_ref_clk,        // Rx reference clock
      rui_rx_serdes_rst_c,   // SERDES Receive channel reset user command
      rui_rx_pcs_rst_c,      // Rx lane reset user command
      rdi_rx_los_low_s,      // Receive loss of signal status input from SERDES
      rdi_rx_cdr_lol_s,      // Receive CDR loss of lock status input from SERDES

      // ------------ Outputs
      // Common
      rdo_serdes_rst_dual_c, // SERDES macro reset command output
      rdo_rst_dual_c,        // PCS dual reset command output
      // Tx
      ruo_tx_rdy,            // Tx lane ready status output
      rdo_tx_serdes_rst_c,   // SERDES Tx reset command output
      rdo_tx_pcs_rst_c,      // PCS Tx lane reset command output
      // Rx
      ruo_rx_rdy,            // Rx lane ready status output
      rdo_rx_serdes_rst_c,   // SERDES Rx channel reset command output
      rdo_rx_pcs_rst_c       // PCS Rx lane reset command output
      );

// ------------ Module parameters
`ifdef NUM_CHANNELS
   parameter pnum_channels = `NUM_CHANNELS;    // 1,2,4
`else
   parameter pnum_channels = 1;
`endif

`ifdef PCIE
   parameter pprotocol    = "PCIE";
`else
   parameter pprotocol    = "";
`endif

`ifdef RX_ONLY
   parameter pserdes_mode    = "RX ONLY";
`else
   `ifdef TX_ONLY
      parameter pserdes_mode = "TX ONLY";
   `else
      parameter pserdes_mode = "RX AND TX";
   `endif
`endif

`ifdef PORT_TX_RDY
   parameter pport_tx_rdy = "ENABLED";
`else
   parameter pport_tx_rdy = "DISABLED";
`endif

`ifdef WAIT_TX_RDY
   parameter pwait_tx_rdy = `WAIT_TX_RDY;
`else
   parameter pwait_tx_rdy = 3000;
`endif

`ifdef PORT_RX_RDY
   parameter pport_rx_rdy = "ENABLED";
`else
   parameter pport_rx_rdy = "DISABLED";
`endif

`ifdef WAIT_RX_RDY
   parameter pwait_rx_rdy = `WAIT_RX_RDY;
`else
   parameter pwait_rx_rdy = 3000;
`endif

// ------------ Local parameters
   localparam wa_num_cycles      = 1024;
   localparam dac_num_cycles     = 3;
   localparam lreset_pwidth      = 3;      // reset pulse width-1, default=4-1=3
   localparam lwait_b4_trst      = 781250; // 5ms wait with worst-case Fmax=156 MHz
   localparam lwait_b4_trst_s    = 781;    // for simulation
   localparam lplol_cnt_width    = 20;     // width for lwait_b4_trst
   localparam lwait_after_plol0  = 4;
   localparam lwait_b4_rrst      = 180224; // total calibration time
   localparam lrrst_wait_width   = 20;
   localparam lwait_after_rrst   = 800000; // For CPRI- unused
   localparam lwait_b4_rrst_s    = 460;    // wait cycles provided by design team
   localparam lrlol_cnt_width    = 19;     // width for lwait_b4_rrst
   localparam lwait_after_lols   = (16384 * dac_num_cycles) + wa_num_cycles;  // 16384 cycles * dac_num_cycles + 1024 cycles
   localparam lwait_after_lols_s = 150;    // wait cycles provided by design team
   localparam llols_cnt_width    = 18;     // lols count width
   localparam lrdb_max           = 15;     // maximum debounce count
   localparam ltxr_wait_width    = 12;     // width of tx ready wait counter
   localparam lrxr_wait_width    = 12;     // width of tx ready wait counter

// ------------ input ports
   input                         rui_rst;
   input                         rui_serdes_rst_dual_c;
   input                         rui_rst_dual_c;
   input                         rui_rsl_disable;

   input                         rui_tx_ref_clk;
   input                         rui_tx_serdes_rst_c;
   input  [3:0]                  rui_tx_pcs_rst_c;
   input                         rdi_pll_lol;

   input                         rui_rx_ref_clk;
   input  [3:0]                  rui_rx_serdes_rst_c;
   input  [3:0]                  rui_rx_pcs_rst_c;
   input  [3:0]                  rdi_rx_los_low_s;
   input  [3:0]                  rdi_rx_cdr_lol_s;

// ------------ output ports
   output                        rdo_serdes_rst_dual_c;
   output                        rdo_rst_dual_c;

   output                        ruo_tx_rdy;
   output                        rdo_tx_serdes_rst_c;
   output [3:0]                  rdo_tx_pcs_rst_c;

   output                        ruo_rx_rdy;
   output [3:0]                  rdo_rx_serdes_rst_c;
   output [3:0]                  rdo_rx_pcs_rst_c;

// ------------ Internal registers and wires
   // inputs
   wire                          rui_rst;
   wire                          rui_serdes_rst_dual_c;
   wire                          rui_rst_dual_c;
   wire                          rui_rsl_disable;
   wire                          rui_tx_ref_clk;
   wire                          rui_tx_serdes_rst_c;
   wire   [3:0]                  rui_tx_pcs_rst_c;
   wire                          rdi_pll_lol;
   wire                          rui_rx_ref_clk;
   wire   [3:0]                  rui_rx_serdes_rst_c;
   wire   [3:0]                  rui_rx_pcs_rst_c;
   wire   [3:0]                  rdi_rx_los_low_s;
   wire   [3:0]                  rdi_rx_cdr_lol_s;

   // outputs
   wire                          rdo_serdes_rst_dual_c;
   wire                          rdo_rst_dual_c;
   wire                          ruo_tx_rdy;
   wire                          rdo_tx_serdes_rst_c;
   wire   [3:0]                  rdo_tx_pcs_rst_c;
   wire                          ruo_rx_rdy;
   wire   [3:0]                  rdo_rx_serdes_rst_c;
   wire   [3:0]                  rdo_rx_pcs_rst_c;

   // internal signals
   // common
   wire                          rsl_enable;
   wire   [lplol_cnt_width-1:0]  wait_b4_trst;
   wire   [lrlol_cnt_width-1:0]  wait_b4_rrst;
   wire   [llols_cnt_width-1:0]  wait_after_lols;
   reg                           pll_lol_p1;
   reg                           pll_lol_p2;
   reg                           pll_lol_p3;
   // ------------ Tx
   // rdo_tx_serdes_rst_c
   reg    [lplol_cnt_width-1:0]  plol_cnt;
   wire                          plol_cnt_tc;

   reg    [2:0]                  txs_cnt;
   reg                           txs_rst;
   wire                          txs_cnt_tc;
   // rdo_tx_pcs_rst_c
   wire                          plol_fedge;
   wire                          plol_redge;
   reg                           waita_plol0;
   reg    [2:0]                  plol0_cnt;
   wire                          plol0_cnt_tc;
   reg    [2:0]                  txp_cnt;
   reg                           txp_rst;
   wire                          txp_cnt_tc;
   // ruo_tx_rdy
   wire                          dual_or_serd_rst;
   wire                          tx_any_pcs_rst;
   wire                          tx_any_rst;
   reg                           txsr_appd /* synthesis syn_keep=1 */;
   reg                           txdpr_appd;
   reg    [pnum_channels-1:0]    txpr_appd;
   reg                           txr_wt_en;
   reg    [ltxr_wait_width-1:0]  txr_wt_cnt;
   wire                          txr_wt_tc;
   reg                           ruo_tx_rdyr;

   // ------------ Rx
   wire                          comb_rlos;
   wire                          comb_rlol;
   //wire                          rlols;
   wire                          rx_all_well;

   //reg                           rlols_p1;
   //reg                           rlols_p2;
   //reg                           rlols_p3;

   reg                           rlol_p1;
   reg                           rlol_p2;
   reg                           rlol_p3;
   reg                           rlos_p1;
   reg                           rlos_p2;
   reg                           rlos_p3;

   //reg    [3:0]                  rdb_cnt;
   //wire                          rdb_cnt_max;
   //wire                          rdb_cnt_zero;
   //reg                           rlols_db;
   //reg                           rlols_db_p1;

   reg    [3:0]                  rlol_db_cnt;
   wire                          rlol_db_cnt_max;
   wire                          rlol_db_cnt_zero;
   reg                           rlol_db;
   reg 	                         rlol_db_p1;

   reg    [3:0]                  rlos_db_cnt;
   wire                          rlos_db_cnt_max;
   wire                          rlos_db_cnt_zero;
   reg                           rlos_db;
   reg 	                         rlos_db_p1;

   // rdo_rx_serdes_rst_c
   reg    [lrlol_cnt_width-1:0]  rlol1_cnt;
   wire                          rlol1_cnt_tc;
   reg    [2:0]                  rxs_cnt;
   reg                           rxs_rst;
   wire                          rxs_cnt_tc;
   reg    [lrrst_wait_width-1:0] rrst_cnt;
   wire                          rrst_cnt_tc;
   reg                           rrst_wait;
   // rdo_rx_pcs_rst_c
   //wire                          rlols_fedge;
   //wire                          rlols_redge;
   wire                          rlol_fedge;
   wire                          rlol_redge;
   wire                          rlos_fedge;
   wire                          rlos_redge;

   reg                           wait_calib;
   reg                           waita_rlols0;
   reg    [llols_cnt_width-1:0]  rlols0_cnt;
   wire                          rlols0_cnt_tc;
   reg    [2:0]                  rxp_cnt;
   reg                           rxp_rst;
   wire                          rxp_cnt_tc;

   wire                          rx_any_serd_rst;
   reg    [llols_cnt_width-1:0]  rlolsz_cnt;
   wire                          rlolsz_cnt_tc;
   reg [2:0] 			 rxp_cnt2;
   reg                           rxp_rst2;
   wire                          rxp_cnt2_tc;
   reg [15:0]                    data_loop_b_cnt;
   reg                           data_loop_b;
   wire                          data_loop_b_tc;

   // ruo_rx_rdy
   reg    [pnum_channels-1:0]    rxsr_appd;
   reg    [pnum_channels-1:0]    rxpr_appd;
   reg                           rxsdr_appd /* synthesis syn_keep=1 */;
   reg                           rxdpr_appd;
   wire                          rxsdr_or_sr_appd;
   wire                          dual_or_rserd_rst;
   wire                          rx_any_pcs_rst;
   wire                          rx_any_rst;
   reg                           rxr_wt_en;
   reg    [lrxr_wait_width-1:0]  rxr_wt_cnt;
   wire                          rxr_wt_tc;
   reg                           ruo_rx_rdyr;

// ==================================================================
//                          Start of code
// ==================================================================
   assign rsl_enable = ~rui_rsl_disable;

// ------------ rdo_serdes_rst_dual_c
   assign rdo_serdes_rst_dual_c = (rui_rst&rsl_enable) | rui_serdes_rst_dual_c;

// ------------ rdo_rst_dual_c
   assign rdo_rst_dual_c = rui_rst_dual_c;

// ------------ Setting counter values for RSL_SIM_MODE
   `ifdef RSL_SIM_MODE
      assign wait_b4_trst    = lwait_b4_trst_s;
      assign wait_b4_rrst    = lwait_b4_rrst_s;
      assign wait_after_lols = lwait_after_lols_s;
   `else
      assign wait_b4_trst    = lwait_b4_trst;
      assign wait_b4_rrst    = lwait_b4_rrst;
      assign wait_after_lols = lwait_after_lols;
   `endif

// ==================================================================
//                                 Tx
// ==================================================================
   generate
   if((pserdes_mode=="RX AND TX")||(pserdes_mode=="TX ONLY")) begin

// ------------ Synchronizing pll_lol to the tx clock
   always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1) begin
         pll_lol_p1 <= 1'd0;
         pll_lol_p2 <= 1'd0;
         pll_lol_p3 <= 1'd0;
      end
      else begin
         pll_lol_p1 <= rdi_pll_lol;
         pll_lol_p2 <= pll_lol_p1;
         pll_lol_p3 <= pll_lol_p2;
      end
   end

// ------------ rdo_tx_serdes_rst_c
   always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         plol_cnt    <= 'd0;
      else if((pll_lol_p2==0)||(plol_cnt_tc==1)||(rdo_tx_serdes_rst_c==1))
         plol_cnt    <= 'd0;
      else
         plol_cnt    <= plol_cnt+1;
   end
   assign plol_cnt_tc = (plol_cnt==wait_b4_trst)?1'b1:1'b0;

   always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1) begin
         txs_cnt  <= 'd0;   // tx serdes reset pulse count
         txs_rst  <= 1'b0;  // tx serdes reset
      end
      else if(plol_cnt_tc==1)
         txs_rst  <= 1'b1;
      else if(txs_cnt_tc==1) begin
         txs_cnt  <= 'd0;
         txs_rst  <= 1'b0;
      end
      else if(txs_rst==1)
         txs_cnt  <= txs_cnt+1;
   end
   assign txs_cnt_tc = (txs_cnt==lreset_pwidth)?1'b1:1'b0;

   assign rdo_tx_serdes_rst_c = (rsl_enable&txs_rst)| rui_tx_serdes_rst_c;

// ------------ rdo_tx_pcs_rst_c
   assign plol_fedge = ~pll_lol_p2 & pll_lol_p3;
   assign plol_redge = pll_lol_p2 & ~pll_lol_p3;
   always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         waita_plol0  <= 1'd0;
      else if(plol_fedge==1'b1)
         waita_plol0  <= 1'b1;
      else if((plol0_cnt_tc==1)||(plol_redge==1))
         waita_plol0  <= 1'd0;
   end
   always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         plol0_cnt    <= 'd0;
      else if((pll_lol_p2==1)||(plol0_cnt_tc==1))
         plol0_cnt    <= 'd0;
      else if(waita_plol0==1'b1)
         plol0_cnt    <= plol0_cnt+1;
   end
   assign plol0_cnt_tc = (plol0_cnt==lwait_after_plol0)?1'b1:1'b0;

   always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1) begin
         txp_cnt  <= 'd0;   // tx serdes reset pulse count
         txp_rst  <= 1'b0;  // tx serdes reset
      end
      else if(plol0_cnt_tc==1)
         txp_rst  <= 1'b1;
      else if(txp_cnt_tc==1) begin
         txp_cnt  <= 'd0;
         txp_rst  <= 1'b0;
      end
      else if(txp_rst==1)
         txp_cnt  <= txp_cnt+1;
   end
   assign txp_cnt_tc = (txp_cnt==lreset_pwidth)?1'b1:1'b0;

   genvar i;
   for(i=0;i<pnum_channels;i=i+1) begin : ifor
      assign rdo_tx_pcs_rst_c[i] = (rsl_enable&txp_rst)| rui_tx_pcs_rst_c[i];
   end
   if(pnum_channels==1)
      assign rdo_tx_pcs_rst_c[3:1] = 3'b000;
   else if(pnum_channels==2)
      assign rdo_tx_pcs_rst_c[3:2] = 2'b00;

   // ------------ ruo_tx_rdy
   if(pport_tx_rdy=="ENABLED") begin
   assign dual_or_serd_rst = rdo_serdes_rst_dual_c|rdo_tx_serdes_rst_c;
   assign tx_any_pcs_rst = rdo_rst_dual_c|(|rdo_tx_pcs_rst_c[pnum_channels-1:0]);
   assign tx_any_rst = dual_or_serd_rst | tx_any_pcs_rst;

   always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         txsr_appd <= 1'b1; // tx serdes reset applied
      else if(dual_or_serd_rst==1)
         txsr_appd <= 1'b1;
   end
   always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         txdpr_appd <= 1'b0; // tx dual (pcs) reset applied
      else if(pll_lol_p2|rdo_serdes_rst_dual_c|rdo_tx_serdes_rst_c)
         txdpr_appd <= 1'b0;
      else if(rdo_rst_dual_c==1)
         txdpr_appd <= 1'b1;
   end

   genvar m;
   for(m=0;m<pnum_channels;m=m+1) begin :mfor
      always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         txpr_appd[m] <= 1'b0; // tx pcs reset applied
      else if(pll_lol_p2|rdo_serdes_rst_dual_c|rdo_tx_serdes_rst_c)
         txpr_appd[m] <= 1'b0;
      else if(txsr_appd&(rdo_tx_pcs_rst_c[m]|txdpr_appd))
         txpr_appd[m] <= 1'b1;
      end
   end

   always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         txr_wt_en  <= 0;  // tx ready wait counter enable
      else if((txr_wt_tc==1)||(dual_or_serd_rst==1))
         txr_wt_en  <= 0;
      else if((~ruo_tx_rdyr)&(~pll_lol_p2)&(&txpr_appd))
         txr_wt_en  <= 1;
   end
   always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         txr_wt_cnt  <= 'd0;  // tx ready wait count
      else if((txr_wt_tc==1)||(tx_any_rst==1))
         txr_wt_cnt  <= 'd0;
      else if(txr_wt_en==1)
         txr_wt_cnt  <= txr_wt_cnt+1;
   end
   assign txr_wt_tc = (txr_wt_cnt==pwait_tx_rdy)?1'b1:1'b0;

   always @(posedge rui_tx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         ruo_tx_rdyr <= 1'b0; // tx serdes reset applied
      else if((tx_any_rst==1)||(pll_lol_p2==1))
         ruo_tx_rdyr <= 1'b0;
      else if(txr_wt_tc==1)
         ruo_tx_rdyr <= 1'b1;
   end
   assign ruo_tx_rdy = ruo_tx_rdyr;
   end         // if pport_tx_rdy
   else
      assign ruo_tx_rdy = 1'b0;
   end         // generate if(Rx and Tx) or (Tx only)
   else begin  // generate else (Rx only)
      assign rdo_tx_serdes_rst_c = 1'b0;
      assign rdo_tx_pcs_rst_c = 4'd0;
      assign ruo_tx_rdy = 1'b0;
   end
   endgenerate

// ==================================================================
//                                 Rx
// ==================================================================
   generate
   if((pserdes_mode=="RX AND TX")||(pserdes_mode=="RX ONLY")) begin
   assign comb_rlos = |rdi_rx_los_low_s[pnum_channels-1:0];
   assign comb_rlol = |rdi_rx_cdr_lol_s[pnum_channels-1:0];
   //assign rlols     = comb_rlos|comb_rlol;

   // ------------ Synchronizing rlols to the rx ref clock
   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1) begin
        //rlols_p1    <= 1'd0;
        //rlols_p2    <= 1'd0;
        //rlols_p3    <= 1'd0;
        //rlols_db_p1 <= 1'd1;

        rlol_p1     <= 1'd0;
        rlol_p2     <= 1'd0;
        rlol_p3     <= 1'd0;
        rlol_db_p1  <= 1'd1;

        rlos_p1    <= 1'd0;
        rlos_p2    <= 1'd0;
        rlos_p3    <= 1'd0;
        rlos_db_p1 <= 1'd1;
      end
      else begin
        //rlols_p1    <= rlols;
        //rlols_p2    <= rlols_p1;
        //rlols_p3    <= rlols_p2;
        //rlols_db_p1 <= rlols_db;

        rlol_p1     <= comb_rlol;
        rlol_p2     <= rlol_p1;
        rlol_p3     <= rlol_p2;
	rlol_db_p1  <= rlol_db;

        rlos_p1    <= comb_rlos;
        rlos_p2    <= rlos_p1;
        rlos_p3    <= rlos_p2;
        rlos_db_p1 <= rlos_db;
      end
   end
   assign rx_all_well = ~rlol_db && ~rlos_db;

//******************************************************************************
// [ES:05.03.17] Unused registers for clean-up
//------------------------------------------------------------------------------
// ------------ Debouncing rlols
//   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
//      if(rui_rst==1'b1) rdb_cnt  <= lrdb_max;
//      else if(rlols_p2==1) begin
//         if(!rdb_cnt_max) rdb_cnt <= rdb_cnt+1;
//      end
//      else if(!rdb_cnt_zero) rdb_cnt <= rdb_cnt-1;
//   end
//   assign rdb_cnt_max  = (rdb_cnt==lrdb_max);
//   assign rdb_cnt_zero = (rdb_cnt==0);
//   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
//      if(rui_rst==1'b1) rlols_db <= 1;
//      else if(rdb_cnt_max)  rlols_db <= 1;
//      else if(rdb_cnt_zero) rlols_db <= 0;
//   end
//******************************************************************************

// ------------ Debouncing rlol
   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1) rlol_db_cnt  <= lrdb_max;
      else if(rlol_p2==1) begin
         if(!rlol_db_cnt_max) rlol_db_cnt <= rlol_db_cnt+1;
      end
      else if(!rlol_db_cnt_zero) rlol_db_cnt <= rlol_db_cnt-1;
   end
   assign rlol_db_cnt_max  = (rlol_db_cnt==lrdb_max);
   assign rlol_db_cnt_zero = (rlol_db_cnt==0);
   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1) rlol_db <= 1;
      else if(rlol_db_cnt_max)  rlol_db <= 1;
      else if(rlol_db_cnt_zero) rlol_db <= 0;
   end

// ------------ Debouncing rlos
   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1) rlos_db_cnt  <= lrdb_max;
      else if(rlos_p2==1) begin
         if(!rlos_db_cnt_max) rlos_db_cnt <= rlos_db_cnt+1;
      end
      else if(!rlos_db_cnt_zero) rlos_db_cnt <= rlos_db_cnt-1;
   end
   assign rlos_db_cnt_max  = (rlos_db_cnt==lrdb_max);
   assign rlos_db_cnt_zero = (rlos_db_cnt==0);
   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1) rlos_db <= 1;
      else if(rlos_db_cnt_max)  rlos_db <= 1;
      else if(rlos_db_cnt_zero) rlos_db <= 0;
   end

// ------------ Calib time trigger
   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
     if (rui_rst==1'b1) begin
       wait_calib <= 1'd1;
     end
     else begin
       if (rlol1_cnt_tc) begin
         if (rlol_db)
           wait_calib <= 1'd1;
         else
           wait_calib <= 1'd0;
       end
       else if (rlos_redge)
         wait_calib <= 1'd0;
       else if (rlos_fedge) begin
         wait_calib <= 1'd1;
       end
     end
   end

   //***************************************************************************
   // Total calibration time counter
   // - this covers the band calibration time (256 cycles * 64) and
   //   DAC calibration time (16384 cycles * 10 bits)
   //---------------------------------------------------------------------------
   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
     if (rui_rst==1'b1) begin
       rlol1_cnt  <= 'd0;  // Counting when Rx LOL is 1 and Rx LOS is 0
     end
     else begin
       if(rxs_rst || rlol1_cnt_tc || rlos_redge)
         rlol1_cnt  <= 'd0;
       else if (wait_calib)
         rlol1_cnt <= rlol1_cnt+1;
     end
   end
   assign rlol1_cnt_tc = (rlol1_cnt==wait_b4_rrst);

// ------------ rdo_rx_serdes_rst_c
   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
     if (rui_rst==1'b1) begin
       rxs_cnt  <= 'd0;   // rx serdes reset pulse count
       rxs_rst  <= 1'b0;  // rx serdes reset
     end
     else begin
       if (rlos_db)
         rxs_rst <= 1'b0;
       else if (rlol1_cnt_tc && rlol_db)
         rxs_rst <= 1'b1;
       else if (rxs_cnt_tc==1) begin
         rxs_rst  <= 1'b0;
       end

       if (rxs_cnt_tc)
         rxs_cnt <= 'd0;
       else
         if (rxs_rst==1)
           rxs_cnt <= rxs_cnt+1;
     end
   end
   assign rxs_cnt_tc  = (rxs_cnt==lreset_pwidth)?1'b1:1'b0;

   //***************************************************************************
   // [ES:05.03.17] Unused logic from CPRI rrst_wait
   //---------------------------------------------------------------------------
   // always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
   //    if(rui_rst==1'b1)
   //       rrst_cnt    <= 'd0;
   //    else if(rlol1_cnt_tc)
   //       rrst_cnt    <= 'd0;
   //    else if(rrst_wait)
   //       rrst_cnt    <= rrst_cnt+1;
   // end
   // assign rrst_cnt_tc = (rrst_cnt==lwait_after_rrst) ? 1'b1 : 1'b0;
   // always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
   //    if(rui_rst==1'b1)
   //       rrst_wait    <= 0;
   //    else if(pprotocol != "CPRI")
   //       rrst_wait    <= 0;
   //    else if(rlol1_cnt_tc)
   //       rrst_wait    <= 1;
   //    else if(rrst_cnt_tc==1)
   //       rrst_wait    <= 0;
   // end
   //***************************************************************************

   genvar j;
   for(j=0;j<pnum_channels;j=j+1) begin :jfor
      assign rdo_rx_serdes_rst_c[j] = (rsl_enable&rxs_rst)| rui_rx_serdes_rst_c[j];
   end
   if(pnum_channels==1)
      assign rdo_rx_serdes_rst_c[3:1] = 3'b000;
   else if(pnum_channels==2)
      assign rdo_rx_serdes_rst_c[3:2] = 2'b00;

// ------------ rdo_rx_pcs_rst_c
   //assign rlols_fedge = ~rlols_db & rlols_db_p1;
   //assign rlols_redge = rlols_db & ~rlols_db_p1;

   assign rlol_fedge  = ~rlol_db & rlol_db_p1;
   assign rlol_redge  = rlol_db & ~rlol_db_p1;
   assign rlos_fedge  = ~rlos_db & rlos_db_p1;
   assign rlos_redge  = rlos_db & ~rlos_db_p1;

   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if (rui_rst==1'b1) begin
        waita_rlols0 <= 1'd0;
      end
      else begin
        if ((rlos_fedge && ~rlol_db) || (rlol_fedge && ~rlos_db))
          waita_rlols0 <= 1'b1;
        else if (rlos_redge || rlol_redge)
          waita_rlols0 <= 1'd0;
        else if (rlols0_cnt_tc==1)
          waita_rlols0 <= 1'd0;
      end
   end

   //***************************************************************************
   // Post RLOL check before pcs_rst deassertion
   // - allowance of 2-4 DAC calibration cycles + 1024 cycles for WA module
   //   (word alignment).
   //---------------------------------------------------------------------------
   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
     if (rui_rst==1'b1) begin
       rlols0_cnt <= 'd0;
     end
     else begin
       if (rlol_redge || rlos_redge || rlols0_cnt_tc)
         rlols0_cnt <= 'd0;
       else if (waita_rlols0==1)
         rlols0_cnt <= rlols0_cnt+1;
     end
   end
   assign rlols0_cnt_tc   = (rlols0_cnt == wait_after_lols);
   assign rx_any_serd_rst = rdo_serdes_rst_dual_c|(|rdo_rx_serdes_rst_c);

   //***************************************************************************
   // [ES:05.03.17] Unused registers for clean-up
   //---------------------------------------------------------------------------
   // always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
   //    if(rui_rst==1'b1)
   //       rlolsz_cnt  <= 'd0;  // Counting when both Rx LOL is 0 and Rx LOS is 0
   //    else if((rlol_db|rx_any_serd_rst)||(rlolsz_cnt_tc==1))
   //       rlolsz_cnt  <= 'd0;
   //    else if((rlolsz_cnt_tc==0)&&(rlol_db==0))
   //       rlolsz_cnt  <= rlolsz_cnt+1;
   // end
   // assign rlolsz_cnt_tc = (rlolsz_cnt==wait_after_lols);
   //***************************************************************************

   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
     if (rui_rst==1'b1) begin
       rxp_cnt2  <= 'd0;   // pcs serdes reset pulse count
       rxp_rst2  <= 1'b1;  // rx pcs reset
     end
     else begin
       if (rx_any_serd_rst || rlos_redge) begin
         rxp_rst2 <= 1'b1;
       end
       else if (rlols0_cnt_tc) begin
         rxp_rst2 <= 1'b0;
       end
       //***********************************************************************
       // [ES:05.03.17] No need for pulse width
       //-----------------------------------------------------------------------
       // else if(rxp_cnt2_tc==1) begin
       //   rxp_cnt2  <= 'd0;
       //   rxp_rst2  <= 1'b0;
       // end
       //***********************************************************************
       // [ES:05.03.17] No need for pulse width
       //-----------------------------------------------------------------------
       // else if (rxp_rst2==1)
       //   rxp_cnt2 <= rxp_cnt2+1;
       //***********************************************************************
     end // else: !if(rui_rst==1'b1)
   end // always @ (posedge rui_rx_ref_clk or posedge rui_rst)
   //assign rxp_cnt2_tc = (rxp_cnt2==lreset_pwidth)?1'b1:1'b0;

   //***************************************************************************
   // [ES:05.03.17] No need for pulse width
   //---------------------------------------------------------------------------
   //else begin
   //   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
   //      if(rui_rst==1'b1)
   //         rxp_rst2  <= 1'b1;  // rx pcs reset
   //      else if(rx_any_serd_rst)
   //         rxp_rst2  <= 1'b1;
   //      else if(rlolsz_cnt_tc==1)
   //         rxp_rst2  <= 1'b0;
   //   end
   //end
   //***************************************************************************

   genvar k;
   for(k=0;k<pnum_channels;k=k+1) begin: kfor
      assign rdo_rx_pcs_rst_c[k] = (rsl_enable&rxp_rst2)| rui_rx_pcs_rst_c[k];
   end
   if(pnum_channels==1)
      assign rdo_rx_pcs_rst_c[3:1] = 3'b000;
   else if(pnum_channels==2)
      assign rdo_rx_pcs_rst_c[3:2] = 2'b00;

// ------------ ruo_rx_rdy
   if(pport_rx_rdy=="ENABLED") begin
   assign dual_or_rserd_rst = rdo_serdes_rst_dual_c|(|rdo_rx_serdes_rst_c[pnum_channels-1:0]);
   assign rx_any_pcs_rst = rdo_rst_dual_c|(|rdo_rx_pcs_rst_c[pnum_channels-1:0]);
   assign rx_any_rst = dual_or_rserd_rst | rx_any_pcs_rst;

   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         rxsdr_appd <= 1'b1;  // Serdes dual reset (macro reset) applied
      else if(rdo_serdes_rst_dual_c==1)
         rxsdr_appd <= 1'b1;
   end
   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         rxdpr_appd <= 1'b0;  // Rx dual PCS reset (dual reset) applied
      else if(~rx_all_well|dual_or_rserd_rst)
         rxdpr_appd <= 1'b0;
      else if(rdo_rst_dual_c==1)
         rxdpr_appd <= 1'b1;
   end

   genvar l;
   for(l=0;l<pnum_channels;l=l+1) begin : lfor
      always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
         if(rui_rst==1'b1)
            rxsr_appd[l] <= 1'b0; // rx serdes reset applied
         else if(rdo_rx_serdes_rst_c[l]==1)
            rxsr_appd[l] <= 1'b1;
      end
      always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         rxpr_appd[l] <= 1'b0; // rx pcs reset applied
      else if(rdi_rx_los_low_s[l]|rdi_rx_cdr_lol_s[l]|rdo_serdes_rst_dual_c|rdo_rx_serdes_rst_c[l])
         rxpr_appd[l] <= 1'b0;
      else if(rxsdr_or_sr_appd&(~rx_all_well)&rdo_rx_pcs_rst_c[l])
         rxpr_appd[l] <= 1'b1;
      end
   end

   assign rxsdr_or_sr_appd = rxsdr_appd|(&rxsr_appd);

   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         rxr_wt_en  <= 0;  // rx ready wait counter enable
      //else if((rxr_wt_tc==1)||(dual_or_rserd_rst==1))
      else if((rxr_wt_tc==1)||(dual_or_rserd_rst==1)||(rx_all_well==0)) // BM, 2/4/16
         rxr_wt_en  <= 0;
      else if(~ruo_rx_rdyr&rx_all_well&((&rxpr_appd)|rxdpr_appd))
         rxr_wt_en  <= 1;
   end
   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         rxr_wt_cnt  <= 'd0;  // rx ready wait count
      //else if((rxr_wt_tc==1)||(rx_any_rst==1))
      else if((rxr_wt_tc==1)||(rx_any_rst==1)||(rx_all_well==0)) // BM, 2/4/16
         rxr_wt_cnt  <= 'd0;
      else if(rxr_wt_en==1)
         rxr_wt_cnt  <= rxr_wt_cnt+1;
   end
   assign rxr_wt_tc = (rxr_wt_cnt==pwait_rx_rdy)?1'b1:1'b0;

   always @(posedge rui_rx_ref_clk or posedge rui_rst) begin
      if(rui_rst==1'b1)
         ruo_rx_rdyr <= 1'b0; // rx serdes reset applied
      else if((rx_any_rst==1)||(rx_all_well==0))
         ruo_rx_rdyr <= 1'b0;
      else if(rxr_wt_tc==1)
         ruo_rx_rdyr <= 1'b1;
   end
   assign ruo_rx_rdy = ruo_rx_rdyr;
   end         // if pport_rx_rdy
   else
      assign ruo_rx_rdy = 1'b0;
   end // if ((pserdes_mode=="RX AND TX")||(pserdes_mode=="RX ONLY"))

   else begin  // generate else (Tx only)
      assign rdo_rx_serdes_rst_c = 4'd0;
      assign rdo_rx_pcs_rst_c = 4'd0;
      assign ruo_rx_rdy = 1'b0;
   end // else: !if((pserdes_mode=="RX AND TX")||(pserdes_mode=="RX ONLY"))

   endgenerate

endmodule
