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
`define REGISTERS_16
module isp8 #(
              parameter FAMILY_NAME  = "XO2",
              parameter PROM_FILE    = "prom_init.hex",
              parameter PORT_AW      = 8,
              parameter EXT_AW       = 16,
              parameter PROM_AW      = 9,
              parameter PROM_AD      = 512,
              parameter REGISTERS_16 = 0,
              parameter PGM_STACK_AW = 4,
              parameter PGM_STACK_AD = 16)
           (
              clk           ,
              rst_n         ,
              ext_io_din    ,
              ext_io_ready  ,
              intr          ,
              ext_addr      ,
              ext_addr_cyc  ,
              ext_io_dout   ,
              ext_io_wr     ,
              ext_io_rd     ,
              intr_ack
              );
 input              clk   ;
 input              rst_n ;
 input              ext_io_ready ;
 input [7:0]        ext_io_din ;
 input              intr ;

 output [EXT_AW-1:0]ext_addr     ;
 output             ext_addr_cyc ;
 output [7:0]       ext_io_dout  ;
 output             ext_io_wr    ;
 output             ext_io_rd    ;
 output             intr_ack     ;

wire [EXT_AW-1:0]   ext_addr_int ;
wire [7:0]          ext_dout     ;
wire [7:0]          ext_mem_dout ;
wire [7:0]          ext_mem_din  ;
wire                ext_mem_wr   ;
wire                ext_mem_rd   ;

assign   ext_addr     = ext_addr_int;
assign   ext_io_dout  = ext_dout;
assign   ext_mem_dout = ext_dout;

  isp8_core # (
               .FAMILY_NAME  (FAMILY_NAME),
               .PROM_FILE    (PROM_FILE),
               .PORT_AW      (PORT_AW),
               .EXT_AW       (EXT_AW),
               .PROM_AW      (PROM_AW),
               .PROM_AD      (PROM_AD),
               .REGISTERS_16 (REGISTERS_16),
               .PGM_STACK_AW (PGM_STACK_AW),
               .PGM_STACK_AD (PGM_STACK_AD)
               ) u1_isp8
              (
                 .clk           ( clk           ),
                 .rst_n         ( rst_n         ),
                 .ext_mem_din   ( ext_mem_din   ),
                 .ext_io_din    ( ext_io_din    ),
                 .ext_mem_ready ( ext_io_ready || ext_mem_wr || ext_mem_rd ),
                 .intr          ( intr          ),
                 .ext_addr      ( ext_addr_int  ),
                 .ext_addr_cyc  ( ext_addr_cyc  ),
                 .ext_dout      ( ext_dout      ),
                 .ext_mem_wr    ( ext_mem_wr    ),
                 .ext_mem_rd    ( ext_mem_rd    ),
                 .ext_io_wr     ( ext_io_wr     ),
                 .ext_io_rd     ( ext_io_rd     ),
                 .intr_ack      ( intr_ack      )
                 );

 pmi_distributed_spram # (
                          .pmi_addr_depth       (32),
                          .pmi_addr_width       (5),
                          .pmi_data_width       (8),
                          .pmi_regmode          ("noreg"),
                          .pmi_init_file        ("none"),
                          .pmi_init_file_format ("binary"),
                          .pmi_family           (FAMILY_NAME),
                          .module_type          ("pmi_distributed_spram")
                   ) U2_scratchpad
                  (
                  .Address( ext_addr_int[4:0]),
                  .Data   ( ext_mem_dout),
                  .Clock  ( clk         ),
                  .ClockEn( 1'b1        ),
                  .WE     ( ext_mem_wr  ),
                  .Reset  ( 1'b0        ),
                  .Q      ( ext_mem_din )
                  ) ;
endmodule

module pmi_distributed_spram
  #(parameter pmi_addr_depth = 32,
    parameter pmi_addr_width = 5,
    parameter pmi_data_width = 8,
    parameter pmi_regmode = "reg",
    parameter pmi_init_file = "none",
    parameter pmi_init_file_format = "binary",
    parameter pmi_family = "EC",
    parameter module_type = "pmi_distributed_spram")

    (
     input [(pmi_addr_width-1):0] Address,
     input [(pmi_data_width-1):0] Data,
     input Clock,
     input ClockEn,
     input WE,
     input Reset,
     output [(pmi_data_width-1):0] Q)/* synthesis syn_black_box */;

endmodule // pmi_distributed_spram

