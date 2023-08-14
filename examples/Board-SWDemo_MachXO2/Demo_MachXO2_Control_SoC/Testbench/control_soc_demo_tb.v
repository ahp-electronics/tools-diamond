// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2001 - 2011 by Lattice Semiconductor Corporation  
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
// V1.0 | S.H.   |04/11/11    |Initial ver
//  
// --------------------------------------------------------------------

`timescale 1ns / 1ps

module control_soc_demo_tb(	);

// Instantiate GSR & PUR     
GSR GSR_INST (.GSR (1'b1) );
PUR PUR_INST (.PUR (1'b1) );

/************************************/
/*		Interconnect				*/
/************************************/

//Clock
reg clk ; 

//Reset
reg rst;


/************************************/
/*		Clock Generation			*/
/************************************/

//  3.5x clock, reset generation
initial
begin
      clk = 1'b0;
      rst = 1'b1;
      # 101;
      rst = 1'b0;
    
      forever #(5) clk = ~ clk; 
end 




/************************************/
/*		Instantiating DUT   		*/
/*			Modules					*/
/************************************/

control_soc_demo DUT (
	.xin           (clk),
	.xout          (),
	.rst_n         (!rst),
	.sw            (4'b0),
	.led           (),
	.uart_rx       (1'b1),
	.uart_tx       (),
	.spi_sclk      (),
	.spi_csn       (),
	.spi_mosi      (),
	.spi_miso      (1'b1),
	.scl           (),
	.sda           (),
	.analog_cmp_n  (1'b1),
	.analog_cmp_p  (1'b0),
	.analog_out    (),
	.audio_pwm_out (),
	.clk           (),
	.clk_pll       (),
	.lock_pll      ()
);

endmodule

