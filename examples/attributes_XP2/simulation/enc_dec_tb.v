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
//
// Version 		  : 2.0  Added the smart test bench to show pass or fail
// 
// Date: 4/17/07  -- by P.C.	   
// =============================================================================
`timescale 1 ns / 100 ps
// `timescale 1 ns/ 1 ps

module enc_dec_tb ();


reg        enc_clk ;
reg        dec_clk ;
reg        rst_n ;

reg [15:0] tx_dword ;
reg        tx_csw ;
reg        tx_dw ;

wire       tx_data ;
wire       tx_dval ;

wire [15:0] rx_dword ;
// reg [15:0] rx_dword ;

wire       rx_dval ;
wire       rx_csw ;
wire       rx_dw ;
wire       rx_perr ;

//wire 	   rx_data;
wire       dec_lock;
wire       enc_lock;
			

`define addrSize 65536
// dataSize = 8, addrSize = 65536
reg [15:0] MEM_TXD_IN [`addrSize - 1:0];   // declare a MEMORY for TXD (INPUT)

reg [7:0] N = 0;


reg fail = 0;

integer sim_results;

//always @ (posedge tx_clk
assign rx_data = (tx_data & tx_dval) ;

 
top enc_dec (
			//inputs
			.rst_n(rst_n), 
			
			//inputs for decoder
			.dec_clk(dec_clk), 
	  //		.rx_data(rx_data), 
			
			//outputs for decoder
			.rx_dword(rx_dword),
			.rx_dval(rx_dval), 
			.rx_csw(rx_csw), 
			.rx_dw(rx_dw), 
			.rx_perr(rx_perr), 
			
			//inputs for encoder
			.enc_clk(enc_clk), 
			.tx_dword(tx_dword),
			.tx_csw(tx_csw), 
			.tx_dw(tx_dw), 

			//outputs for encoder
			.tx_busy(tx_busy), 
			.tx_data(tx_data), 
			.tx_dval(tx_dval),
			.dec_lock(dec_lock),
			.enc_lock(enc_lock)
			
			);


initial begin
   enc_clk  <= 1'b0 ;
   dec_clk  <= 1'b0 ;
   rst_n    <= 1'b0 ;
   tx_dword <= 16'd0 ;
   tx_csw   <= 1'b0 ;
   tx_dw    <= 1'b0 ;
//   reset    <= 1'b1 ;

   sim_results = $fopen("sim_results.out");


end




always #500 enc_clk = ~enc_clk ;
always #125 dec_clk = ~dec_clk ;


initial begin
   repeat (10) @(posedge enc_clk) ;
   rst_n   <= 1'b1;
//   reset   <= 1'b0;

   repeat (39) @(posedge enc_clk) ;
   tx_dword <= 16'h5555 ;
   tx_csw   <= 1'b1 ;
   tx_dw    <= 1'b0 ;
   repeat (1) @(posedge enc_clk) ;
   tx_dword <= 16'h0000 ;
   tx_csw   <= 1'b0 ;
   tx_dw    <= 1'b0 ;

   repeat (39) @(posedge enc_clk) ;
   tx_dword <= 16'hABCD ;
   tx_csw   <= 1'b1 ;
   tx_dw    <= 1'b0 ;
   repeat (1) @(posedge enc_clk) ;
   tx_dword <= 16'h0000 ;
   tx_csw   <= 1'b0 ;
   tx_dw    <= 1'b0 ;

   repeat (39) @(posedge enc_clk) ;
   tx_dword <= 16'hFFFF ;
   tx_csw   <= 1'b0 ;
   tx_dw    <= 1'b1 ;
   repeat (1) @(posedge enc_clk) ;
   tx_dword <= 16'h0000 ;
   tx_csw   <= 1'b0 ;
   tx_dw    <= 1'b0 ;

   repeat (39) @(posedge enc_clk) ;
   tx_dword <= 16'h1234 ;
   tx_csw   <= 1'b0 ;
   tx_dw    <= 1'b1 ;
   repeat (1) @(posedge enc_clk) ;
   tx_dword <= 16'h0000 ;
   tx_csw   <= 1'b0 ;
   tx_dw    <= 1'b0 ;

   repeat (5) @(posedge enc_clk) ;
   repeat (39) @(posedge enc_clk) ;
   tx_dword <= 16'h5678 ;
   tx_csw   <= 1'b1 ;
   tx_dw    <= 1'b0 ;
   repeat (1) @(posedge enc_clk) ;
   tx_dword <= 16'h0000 ;
   tx_csw   <= 1'b0 ;
   tx_dw    <= 1'b0 ;

   repeat (5) @(posedge enc_clk) ;
   repeat (39) @(posedge enc_clk) ;
   tx_dword <= 16'hAAAA ;
   tx_csw   <= 1'b0 ;
   tx_dw    <= 1'b1 ;
   repeat (1) @(posedge enc_clk) ;
   tx_dword <= 16'h0000 ;
   tx_csw   <= 1'b0 ;
   tx_dw    <= 1'b0 ;


   repeat (100) @(posedge enc_clk) ;
   $display("---INFO : Simulation Ended, Check waveform");
   $fdisplay(sim_results, "\tAt %d ---INFO : Simulation Ended, Check waveform", $time);
    if (fail) begin
     	$fdisplay(sim_results, "\tAt %d   Data NOT Match\!\n\nSimulation Failed\!\n", $time);$fdisplay(sim_results, "\tAt %d   Data NOT Match\!\n", $time);
 	   $display("\tAt %d   Data NOT Match\!\n\nSimulation Failed\!\n", $time);
 	      end
     else
	    $fdisplay(sim_results, "\tAt %d   Data Matches\!\n\nSimulation Passed\!\n", $time);
	    $display("\tAt %d   Data Match\!\n\nSimulation Passed\!\n", $time);
	    
		
    $fclose(sim_results);
   $finish ;
end


// ** Decoder output Data **
// Capture valid rx_dword (output) data from decoder

always @(posedge dec_clk)
 begin
   if (rx_csw || rx_dw)
   // if (rx_dval)
 	begin 	                          
  		 if (rx_dword !== MEM_TXD_IN[rx_dword])                 
		     begin
	  		    fail = 1'b1;
	  		    $fdisplay(sim_results,"\tData does NOT match at %t\!\n", $time);
	  		    $fdisplay(sim_results,"\t\t tx_dword= %h  rx_dword= %h\n",
				          MEM_TXD_IN[rx_dword],  rx_dword);  
				 $display("\tData does NOT match at %t\!\n", $time);
             $display("\t\t tx_dword= %h \t\t rx_dword= %h\n",
                        MEM_TXD_IN[rx_dword],  rx_dword);  
	   		   end
      		     else 
		     	  	$fdisplay(sim_results,"\tAt %d \t\t tx_dword= %h \t\t rx_dword= %h\n",
				              $time, MEM_TXD_IN[rx_dword],  rx_dword);  
				   $display("\tAt %d \t\t tx_dword= %h \t\t rx_dword= %h\n",
                         $time, MEM_TXD_IN[rx_dword],  rx_dword);  

  	 end
 end

// Capture valid tx_dword (Input) data and write it to memory 
always @(posedge enc_clk)
		begin
   	    if (tx_csw || tx_dw)
      		       // if (tx_dval)
			 begin
		  		MEM_TXD_IN[tx_dword] = tx_dword;
//			   $fdisplay(sim_results,"\tAt %d \t\t MEM_TXD_IN= %h \t\t tx_dword= %h\n",
//					  $time, MEM_TXD_IN[tx_dword], tx_dword); 
//				$display("\tAt %d \t\t MEM_TXD_IN= %h \t\t tx_dword= %h\n",
//					              $time, MEM_TXD_IN[tx_dword], tx_dword); 
            

			    end

       	end

endmodule



