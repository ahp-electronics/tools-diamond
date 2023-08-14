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
module reset_gen(
  input  clk,
  input  rst_in,
  output rst1_out,
  output rst2_out
);

localparam COUNT_BITS = 4;
localparam MAX_COUNT = (2 ** COUNT_BITS) - 1;
localparam RST_VAL1 =  2 ** (COUNT_BITS - 1);
localparam RST_VAL2 = MAX_COUNT;


reg [COUNT_BITS-1:0] reset_counter;
reg rst1_out;
reg rst2_out;

always@(posedge clk or posedge rst_in) begin
  if (rst_in) begin
    reset_counter <= 0;
  end
  else begin
    if (reset_counter < MAX_COUNT) begin
      reset_counter <= reset_counter + 1;
    end
  end
end

always@(posedge clk or posedge rst_in) begin
  if (rst_in) begin
    rst1_out <= 1'b1;
  end
  else begin
    if (reset_counter < RST_VAL1) begin
      rst1_out <= 1'b1;
    end
    else begin
      rst1_out <= 1'b0;
    end
  end
end
  
always@(posedge clk or posedge rst_in) begin
  if (rst_in) begin
    rst2_out <= 1'b1;
  end
  else begin
    if (reset_counter < RST_VAL2) begin
      rst2_out <= 1'b1;
    end
    else begin
      rst2_out <= 1'b0;
    end
  end
end

endmodule
