// =============================================================================
//                           COPYRIGHT NOTICE
// Copyright 2000-2001 (c) Lattice Semiconductor Corporation
//
// Permission :
// 
// Lattice Semiconductor grants permission to use this code for use in synthesis
// for Lattice programmable logic product. Other use of this code, including 
// the selling or duplication of any portion ia strictly prohibited.
// 
// Disclaimer :
//
// This VHDL or Verilog source code is intended as a design reference which
// illustrares how these types of functions can be implemeted. It is the 
// user's responsibility to verify their design for consistency and 
// functionality through the use of formal verification methods. 
// Lattice Semiconductor provides no waranty regarding the use or 
// functionality of this code. 
// =============================================================================
//
//                     Lattice Semiconductor Corporation    
//                     5555 NE Moore Court                    
//                     Hillsboro, OR 97124                  
//                     U.S.A                               
//
//                     TEL : 1-800-Lattice (USA and Canada)
//                           408-826-6000 (other locations)
//                     web  : http://www.latticesemi.com/
//                     email: techsupport@latticesemi.com
// =============================================================================
// Project          : 1553_enc_dec
// File             : test_1553.v
// Title            : 
// Dependencies     : encoder_1553.v
//                    decoder_1553.v 
// Description      : This is a simple non-automated test bench to test
//                    1553 encoder and decoder connected to eachother.
//                    Look for generated waveform file "test_1553.trn" 
// =============================================================================
// REVISION HISTORY
// Version          : 1.0
// =============================================================================
`timescale 1 ns / 1 ps
module top (
			//inputs
			rst_n, 
			
			//inputs for decoder
			dec_clk, 
			//rx_data, 
			
			//outputs for decoder
			rx_dword,
			rx_dval, 
			rx_csw, 
			rx_dw, 
			rx_perr, 
			
			//inputs for encoder
			enc_clk, 
			tx_dword,
			tx_csw, 
			tx_dw, 

			//outputs for encoder
			tx_busy, 
			tx_data, 
			tx_dval,
		
			dec_lock,
			enc_lock
			
			);

input      enc_clk ;
input      dec_clk ;
input      rst_n ;

//input      rx_data;

input  [15:0] tx_dword;
input	   tx_csw; 
input      tx_dw; 

//outputs for encoder
output	   tx_busy; 
output	   tx_data; 
output	   tx_dval;

//outputs for the decoder
output [15:0] rx_dword;
output    rx_dval;
output    rx_csw;
output    rx_dw;
output    rx_perr;

output enc_lock;
output dec_lock;

wire enc_pll_clk;
wire dec_pll_clk;

wire rst;

assign rst = ~rst_n;

//For XP2, ECP2, ECP2M
`define XP2

//For XP, EC, ECP
//`define XP


PUR PUR_INST (.PUR(1'b1));
GSR GSR_INST (.GSR(1'b1));

`ifdef XP2
	clk_pll_xp2 enc_pll (
					 .CLK(enc_clk), 
					 .RESET(rst), 
					 .CLKOP(enc_pll_clk), 
					 .LOCK(enc_lock)
					);

	clk_pll_xp2 dec_pll (
					 .CLK(dec_clk), 
					 .RESET(rst), 
					 .CLKOP(dec_pll_clk), 
					 .LOCK(dec_lock)
					);
`endif

`ifdef XP
	clk_pll_xp enc_pll (
					 .CLK(enc_clk), 
					 .RESET(rst), 
					 .CLKOP(enc_pll_clk), 
					 .LOCK(enc_lock)
					);

	clk_pll_xp dec_pll (
					 .CLK(dec_clk), 
					 .RESET(rst), 
					 .CLKOP(dec_pll_clk), 
					 .LOCK(dec_lock)
					);
`endif

`ifdef XO
	clk_pll_xo enc_pll (
					 .CLK(enc_clk), 
					 .RESET(rst), 
					 .CLKOP(enc_pll_clk), 
					 .LOCK(enc_lock)
					);

	clk_pll_xo dec_pll (
					 .CLK(dec_clk), 
					 .RESET(rst), 
					 .CLKOP(dec_pll_clk), 
					 .LOCK(dec_lock)
					);
`endif

`ifdef SC
	clk_pll_sc enc_pll (
					 .clk(enc_clk), 
					 .resetn(rst_n), 
					 .clkop(enc_pll_clk), 
					 .clkos(),
					 .lock(enc_lock)
					);

	clk_pll_sc dec_pll (
					 .clk(dec_clk), 
					 .resetn(rst_n), 
					 .clkop(dec_pll_clk),
					 .clkos(), 
					 .lock(dec_lock)
					);
`endif




encoder_1553 u1_encoder (
            // Clock and Reset
            .enc_clk    ( enc_pll_clk ),
            .rst_n      ( rst_n ),

            // Inputs
            .tx_dword   ( tx_dword ),
            .tx_csw     ( tx_csw ),
            .tx_dw      ( tx_dw ),

            // Outputs
            .tx_busy    ( tx_busy ),
            .tx_data    ( tx_data ), 
            .tx_dval    ( tx_dval )
            ) ;

assign serial_data = (tx_data & tx_dval) ;

decoder_1553 u1_decoder (
            // Clock and Reset
            .dec_clk    ( dec_pll_clk ),
            .rst_n      ( rst_n ),

            // Inputs
 //           .rx_data    ( rx_data ),
            .rx_data    ( serial_data ),

            // Outputs
            .rx_dword   ( rx_dword ), 
            .rx_dval    ( rx_dval ),
            .rx_csw     ( rx_csw ),
            .rx_dw      ( rx_dw ),
            .rx_perr    ( rx_perr )
            ) ;



endmodule



