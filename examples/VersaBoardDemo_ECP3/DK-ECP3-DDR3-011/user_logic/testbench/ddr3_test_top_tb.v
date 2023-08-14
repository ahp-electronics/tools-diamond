// =============================================================================
//                           COPYRIGHT NOTICE
// Copyright 2011 (c) Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// This confidential and proprietary software may be used only as authorised by
// a licensing agreement from Lattice Semiconductor Corporation.
// The entire notice above must be reproduced on all authorized copies and
// copies may only be made to the extent permitted by a licensing agreement from
// Lattice Semiconductor Corporation.
//
// Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
// 5555 NE Moore Court                            408-826-6000 (other locations)
// Hillsboro, OR 97124                     web  : http://www.latticesemi.com/
// U.S.A                                   email: techsupport@latticesemi.com
// =============================================================================
//                         FILE DETAILS
// Project          : DDR3 Memory Controller Demo TB Top
// File             : ddr3_test_top_tb.v 
// Title            : ddr3_test_top_tb
// Dependencies     : 
// Description      : top-level testbench
//            
//
// =============================================================================
//                        REVISION HISTORY
// Version          : 1.0
// Author(s)        : Kyoho Lee/ LSV Apps
// Mod. Date        : February, 2011
// Changes Made     :
//
// =============================================================================

`timescale 1 ns / 100 ps

 `include "ddr3_test_params.v" 

module ddr3_test_top_tb ( );

// ==============================================================================
// testbench input/out 
// ==============================================================================
// inputs
reg                         clk_in;
reg                         reset_n;
reg     [5:0]               dip_sw;
                            
// outputs                  
wire    [`CS_WIDTH-1:0]     em_ddr_clk;
`ifdef  DIFF
wire    [`DATA_WIDTH/8-1:0] em_ddr_dqs_n;
wire    [`CS_WIDTH-1:0]     em_ddr_clk_n;
`endif
wire    [`CS_WIDTH-1:0]     em_ddr_cke;
wire                        em_ddr_ras_n;
wire                        em_ddr_cas_n;
wire                        em_ddr_we_n;
wire    [`CS_WIDTH-1:0]     em_ddr_cs_n;
wire                        em_ddr_reset_n;
wire    [`CS_WIDTH -1 :0]   em_ddr_odt;
wire    [`DATA_WIDTH/8-1:0] em_ddr_dm;
wire    [`BANK_WIDTH-1:0]   em_ddr_ba;
wire    [`ROW_WIDTH-1:0]    em_ddr_addr;
wire    [`DATA_WIDTH-1:0]   em_ddr_data;
wire    [`DATA_WIDTH/8-1:0] em_ddr_dqs;

wire   [`DQS_WIDTH-1:0]     inv_ddr_dqs;

assign inv_ddr_dqs = ~em_ddr_dqs;
// ==============================================================================
// instantiate the UUT
// ==============================================================================
ddr3_test_top UUT (
    .clk_in             (clk_in),
    .reset_n            (reset_n),
   `ifdef SIM
    .sclk               (sclk),
   `endif    
    .oled               (),
    .seg                (),
    .dip_sw             (dip_sw),
    .em_ddr_data        (em_ddr_data), 
    .em_ddr_dqs         (em_ddr_dqs), 
    .em_ddr_clk         (em_ddr_clk), 
    .em_ddr_cke         (em_ddr_cke),
    .em_ddr_reset_n     (em_ddr_reset_n),
    .em_ddr_ras_n       (em_ddr_ras_n), 
    .em_ddr_cas_n       (em_ddr_cas_n), 
    .em_ddr_we_n        (em_ddr_we_n), 
    .em_ddr_cs_n        (em_ddr_cs_n), 
    .em_ddr_odt         (em_ddr_odt),
    .em_ddr_dm          (em_ddr_dm), 
    .em_ddr_ba          (em_ddr_ba), 
    .em_ddr_addr        (em_ddr_addr)
    );

// ==============================================================================
// reference clock generation
// ==============================================================================
parameter c = 10;    // 100MHz
always #(c/2) clk_in   = ~clk_in;

// ==============================================================================
// instantiate the memory
// ==============================================================================

`ifdef DATA_SIZE_64
    ddr3_dimm_64
`endif
`ifdef DATA_SIZE_32
    ddr3_dimm_32
`endif
`ifdef DATA_SIZE_16
    ddr3_dimm_16
`endif
`ifdef DATA_SIZE_8
    ddr3_dimm_8
`endif
    U0_ddr3_dimm (
        .rst_n              (em_ddr_reset_n),
        .ddr_dq             (em_ddr_data),
        .ddr_dqs            (em_ddr_dqs),
        .ddr_dqs_n          (inv_ddr_dqs),
        .ddr_dm_tdqs        (em_ddr_dm),
        .ddr_ad             (em_ddr_addr),
        .ddr_ba             (em_ddr_ba),
        .ddr_ras_n          (em_ddr_ras_n),
        .ddr_cas_n          (em_ddr_cas_n), 
        .ddr_we_n           (em_ddr_we_n), 
        .ddr_cs_n           (em_ddr_cs_n),
        .ddr_clk            (em_ddr_clk),
        .ddr_clk_n          (~em_ddr_clk),
        .ddr_cke            (em_ddr_cke),
        .ddr_odt            (em_ddr_odt) 
    );

// ====================================================================
// Initialize the static parameters
// ====================================================================
GSR GSR_INST (.GSR   (reset_n));
PUR PUR_INST (.PUR   (reset_n));

task init_reset;
begin
    clk_in = 0;
    reset_n = 0;
    #200;
    reset_n = 1;
    #200;
end
endtask

initial begin
    init_reset;
    // dip switch setting 
    dip_sw[5] 	=   1;      	// 15-Seg Enable
    dip_sw[4] 	=   1;      	// Data_Mode
    dip_sw[3] 	=   1;      	// MaxCmd_Siz
    dip_sw[2] 	=   1;      	// CmdBurst_En
    dip_sw[1] 	=   1;      	// Fixed BL/OTF (0:OTF Enabled)
    dip_sw[0] 	=   1;      	// BL Select
    wait (UUT.init_done);
    $display ($time, ": INITIALIZATION DONE, IGNORE ALL WARNINGS UP TO THIS POINT");
end

initial begin
    #10000;              // run for 10 us
    $stop;
end

endmodule