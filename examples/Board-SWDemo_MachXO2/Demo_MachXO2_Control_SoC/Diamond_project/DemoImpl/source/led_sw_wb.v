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
module led_sw_wb(
  input clk_i,
  input rst_i,
  input [7:0] dat_i,
  input [7:0] sw,
  input stb_i,
  input we_i,
  input cyc_i,
  output [7:0] dat_o,
  output reg [7:0] led,
  output ack_o
  );
  
always@(posedge clk_i or posedge rst_i) begin
  if (rst_i)
    led <= 8'h00;
  else if (stb_i && cyc_i && we_i)
    led <= dat_i;
end

  assign dat_o = sw;
  assign ack_o = stb_i;
  
endmodule