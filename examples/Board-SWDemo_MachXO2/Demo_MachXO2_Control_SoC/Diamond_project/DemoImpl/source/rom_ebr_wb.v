// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2001 - 2008 by Lattice Semiconductor Corporation
// --------------------------------------------------------------------
//
// Permission:
//
// Lattice Semiconductor grants permission to use this code for use
// in synthesis for any Lattice programmable logic product. Other
// use of this code, including the selling or duplication of any
// portion is strictly prohibited.
//
// Disclaimer:
//
// This VHDL or Verilog source code is intended as a design reference
// which illustrates how these types of functions can be implemented.
// It is the user's responsibility to verify their design for
// consistency and functionality through the use of formal
// verification methods. Lattice Semiconductor provides no warranty
// regarding the use or functionality of this code.
//
// --------------------------------------------------------------------
//
// Lattice Semiconductor Corporation
// 5555 NE Moore Court
// Hillsboro, OR 97214
// U.S.A
//
// TEL: 1-800-Lattice (USA and Canada)
// 503-268-8001 (other locations)
//
// web: http://www.latticesemi.com/
// email: techsupport@latticesemi.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Ver: | Author |Mod. Date |Changes Made:
// V1.0 | J.O.   |2/9/09    |Initial ver
//
// --------------------------------------------------------------------

`include "timescale.v"
module rom_ebr_wb(wb_clk_i, wb_rst_i, wb_adr_i, wb_dat_o, wb_stb_i, wb_we_i, wb_ack_o
                   );
input        wb_clk_i;
input        wb_rst_i;
input  [9:0] wb_adr_i;
output [7:0] wb_dat_o;
input        wb_stb_i;
input        wb_we_i;
output       wb_ack_o;

wire rom_ce = wb_stb_i && !wb_we_i;

pmi_rom #(
          .pmi_addr_depth(1024),
          .pmi_addr_width(10),
          .pmi_data_width(8),
          .pmi_regmode("noreg"),
          .pmi_gsr("disable"),
          .pmi_resetmode("sync"),
          .pmi_init_file("menu.hex"),
          .pmi_init_file_format("hex"),
          .pmi_family("XO2"),
          .module_type("pmi_rom")
          ) EXT_ROM_INST
          (
           .Address    (wb_adr_i),
           .OutClock   (wb_clk_i),
           .OutClockEn (rom_ce),
           .Reset      (wb_rst_i),
           .Q          (wb_dat_o)
       );

  assign wb_ack_o = wb_stb_i;


endmodule

//module pmi_rom
//   #(parameter pmi_addr_depth = 512,
//     parameter pmi_addr_width = 9,
//     parameter pmi_data_width = 8,
//     parameter pmi_regmode = "reg",
//     parameter pmi_gsr = "disable",
//     parameter pmi_resetmode = "sync",
//     parameter pmi_init_file = "none",
//     parameter pmi_init_file_format = "binary",
//     parameter pmi_family = "EC",
//     parameter module_type = "pmi_rom")
//
//   (input [(pmi_addr_width-1):0]	Address,
//    input OutClock,
//    input OutClockEn,
//    input Reset,
//    output [(pmi_data_width-1):0] Q)/*synthesis syn_black_box*/;
//
//endmodule // pmi_rom
