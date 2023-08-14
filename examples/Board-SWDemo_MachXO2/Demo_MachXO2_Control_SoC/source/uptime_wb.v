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
// V1.0 | R.P.   |10/25/09    |Initial ver
// V1.1 | S.H.   |01/13/10    |Added parameter CLK_FREQ for greater accuracy
//
// --------------------------------------------------------------------

`include "timescale.v"
module uptime_wb(clk_i, rst_i, wb_adr_i, wb_dat_o, wb_cyc_i, wb_stb_i, wb_we_i, wb_ack_o);
  parameter CLK_FREQ = 27'd25000000;  // in Hz
  parameter CLK_IN_HZ = 25;		// counter size in bits where 2^CLK_IN_HZ > CLK_FREQ
  input                      clk_i;
  input                      rst_i;
  input                [1:0] wb_adr_i;
  output               [7:0] wb_dat_o;
  input                      wb_cyc_i;
  input                      wb_stb_i;
  input                      wb_we_i;
  output                     wb_ack_o;
  
  reg [7:0] seconds;
  reg [7:0] minutes;
  reg [7:0] hours;
  reg [7:0] seconds_reg;
  reg [7:0] minutes_reg;
  reg [7:0] hours_reg;
  
  reg       sec_clock;
  reg [7:0] dat_o;

  assign wb_ack_o = wb_stb_i;
  assign wb_dat_o = dat_o;


    
  always@(negedge clk_i or posedge rst_i) 
   begin
    if (rst_i) 
      dat_o <= 0;
    else 
        case (wb_adr_i[1:0])
          2'b00: dat_o <= seconds_reg;
          2'b01: dat_o <= minutes_reg;
          2'b10: dat_o <= hours_reg;
          default: dat_o <= seconds_reg;
        endcase
   end


  always@(negedge clk_i or posedge rst_i) 
   begin
    if (rst_i) begin
      seconds_reg <= 0;
      minutes_reg <= 0;
      hours_reg   <= 0;
    end
    else begin
        seconds_reg <= seconds;
        minutes_reg <= minutes;
        hours_reg   <= hours;
    end
  end
 


  reg [CLK_IN_HZ-1:0] counter;

    
  always@(posedge clk_i or posedge rst_i) 
   begin
    if (rst_i) begin
      counter <= 0;
      sec_clock <= 0;
    end else begin
      if (counter >= (CLK_FREQ/2)) begin
      	counter <= 0;
      	sec_clock <= !sec_clock;
      end else begin
  	  	counter <= counter + 1;
  	  end
    end
   end
  
//  assign sec_clock = counter[CLK_IN_HZ-1];  
    
  always@(posedge sec_clock or posedge rst_i) begin
    if (rst_i) begin
      hours <= 0;
      minutes <= 0;
      seconds <= 0;
    end
    else begin
      if (seconds[7:0] < 59) begin
        seconds <= seconds + 1;
      end
      else begin
        minutes <= minutes + 1;
        seconds <= 0;
        if (minutes > 58) begin
          minutes <= 0;
          hours <= hours + 1;
        end
      end
    end
  end
  
endmodule

