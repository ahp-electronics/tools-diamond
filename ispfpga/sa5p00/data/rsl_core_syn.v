//   ===========================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//   ---------------------------------------------------------------------------
//   Copyright (c) 2014 by Lattice Semiconductor Corporation
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
      ); //synthesis syn_black_box

// ------------ Module parameters

   parameter pnum_channels = 1;
   parameter pprotocol    = "PCIE";
   parameter pserdes_mode = "RX AND TX";
   parameter pport_tx_rdy = "DISABLED";
   parameter pwait_tx_rdy = 3000;
   parameter pport_rx_rdy = "DISABLED";
   parameter pwait_rx_rdy = 3000;

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

endmodule

