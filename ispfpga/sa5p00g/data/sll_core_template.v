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
//                         1. Changed all the PLOL status logic and FSM to run
//                            on sli_refclk. 
//                         2. Added the HB logic for presence of tx_pclk 
//                         3. Changed the lparam assignment scheme for 
//                            simulation purposes. 
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
  ); //synthesis syn_black_box
  
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


endmodule    