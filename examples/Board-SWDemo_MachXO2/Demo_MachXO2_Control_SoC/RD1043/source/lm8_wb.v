
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
// V1.0 | J.O.   |12/19/08  |Initial ver
// V2.0 | R.P.   |5/14/10   |Added lm8_ext_io_datain register
// --------------------------------------------------------------------


`timescale 1ns / 1ns
module lm8_wb(clk_i, rst_i, wb_ack_i, wb_dat_i, wb_stb_o, wb_we_o, wb_sel_o, wb_cyc_o, wb_dat_o, wb_adr_o,
              lm8_addr, lm8_ext_io_rd, lm8_ext_io_wr, lm8_ext_io_din, lm8_ext_io_dout, lm8_io_ready);
  
  // User-specified parameters -- can be changed to adapt to different uses
  parameter LM8_ADDR_W = 16;
  parameter NUM_DECODE = 3; // Number of address lines used to decode slaves
                            // Number of slaves = 2^NUM_DECODE
  // Derived parameters -- should not normally need to be changed
  localparam WB_ADDR_W  = LM8_ADDR_W - NUM_DECODE;  // Number of address bits leftover for WB
  localparam NUM_SLAVES = 2**NUM_DECODE;
  input                    clk_i;
  input                    rst_i;
  // Wishbone side signals
  input   [NUM_SLAVES-1:0] wb_ack_i;
  input [8*NUM_SLAVES-1:0] wb_dat_i;  // Input combining 8-bit data of all slave devices
  output  [NUM_SLAVES-1:0] wb_stb_o;
  output                   wb_we_o;
  output                   wb_sel_o;
  output                   wb_cyc_o;
  output             [7:0] wb_dat_o;
  output   [WB_ADDR_W-1:0] wb_adr_o;
  
  // Lattice Mico8 side signals
  input   [LM8_ADDR_W-1:0] lm8_addr;
  input                    lm8_ext_io_rd;
  input                    lm8_ext_io_wr;
  output             [7:0] lm8_ext_io_din;
  input              [7:0] lm8_ext_io_dout;
  output                   lm8_io_ready;

  wire  ack_internal;
  reg  ack_reg;
  wire wb_stb_int;
  wire [NUM_DECODE-1:0] addr_decode = lm8_addr[LM8_ADDR_W-1:WB_ADDR_W];
  wire [8*NUM_SLAVES-1:0] data_mux;
  
  wire [7:0] lm8_ext_io_datain;
  reg  [7:0] lm8_ext_io_din;


  always@(posedge clk_i) begin
    if (rst_i) begin
      ack_reg <= 1'b0;
    end
    else begin
      ack_reg <= ack_internal;
    end
  end
  





  assign wb_stb_int = (lm8_ext_io_rd || lm8_ext_io_wr) && !ack_reg;






  assign ack_internal = (wb_ack_i > 0) ? 1'b1 : 1'b0; // 'OR' the individual acknowledge outputs from each slave
    

  // Common signals driven out to all WB slaves
  assign wb_cyc_o = lm8_ext_io_rd || lm8_ext_io_wr;   // Indicate WB cycle during LM8 reads or writes
  assign wb_sel_o = lm8_ext_io_rd || lm8_ext_io_wr;   // For an 8-bit databus, byte enable selected for any transfer
  assign wb_we_o  = !lm8_ext_io_rd && lm8_ext_io_wr;  // Set WB WE signal high only during write cycles
  assign wb_dat_o = lm8_ext_io_dout;                  // LM8 data sent to all WB slaves
  assign wb_adr_o = lm8_addr[WB_ADDR_W-1:0];          // LM8 lower address bits sent to all WB slaves
  
  // Combined signals sent back LM8
  assign lm8_io_ready = ack_internal;
  assign data_mux = wb_dat_i >> (addr_decode*8);      // Shift right places the desired data from the combined data
                                                      //   input into the [7:0] position 
  assign lm8_ext_io_datain = data_mux[7:0];              // Multiplex the data sent to LM8 based on the address 
  assign wb_stb_o = wb_stb_int << addr_decode;        // Generate the WB strobe for the selected device
  


  //Sync data to posedge of clock
  always@(posedge clk_i) begin
    if (rst_i) begin
      lm8_ext_io_din <= 1'b0;
    end
    else begin
      lm8_ext_io_din <= lm8_ext_io_datain;
    end
  end
  

  
endmodule

