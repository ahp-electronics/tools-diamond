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
// V1.0 | R.P.   |6/25/10    |Initial ver
//
// --------------------------------------------------------------------


`include "timescale.v"
module adc_wb(
  input clk_i,
  input rst_i,
  input [7:0] dat_i,
  input stb_i,
  input cyc_i,
  input we_i,
  output [7:0] dat_o,
  output reg [7:0] led,
  output ack_o,

  input analog_cmp,
  output analog_out);

  wire [7:0] adc_dig_data;
  
assign dat_o = ~adc_dig_data;
assign ack_o = stb_i;
  
ADC_top adc_inst(
	.clk_in(clk_i),
	.rstn(1'b1),
	.digital_out(adc_dig_data),
	.analog_cmp(analog_cmp),	
	.analog_out(analog_out),
	.sample_rdy());

endmodule
