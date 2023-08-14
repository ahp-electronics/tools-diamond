//
// File			: top.v
// Author		: Lattice Semiconductor Corporation
// Date		: February 25, 2011
// Version	: 1.0
// Abstract	: Sample MachXO2 design for use with the LSE tutorial, including
// all changes to be done in the tutorial.
// 
// Samples the data port at regular intervals and stores the value.
// If a read command comes in, the sampling is blocked.
// Sampling is every 1000 clock cycles. 
// 
// This VHDL or Verilog source code is intended as a design reference which
// illustrares how these types of functions can be implemeted. It is the user's 
// responsibility to verify their design for consistency and functionality through 
// the use of formal verification methods. Lattice Semiconductor provides no 
// warranty regarding the use or functionality of this code. 
//
// Modification History:
// Date  		Version 	Change Description
// ===========================================================
// 2/25/11 	1.0 			Original
// 
// ===========================================================

module top (addr, data, clk, clock_en, read_en) /* synthesis GSR=”ENABLED” */;
	input [4:0] addr;
	input clk, clock_en, read_en;
	
	// Define bidirectional port for data.
	inout [7:0] data;
	wire [7:0] data_out;
	wire [7:0] data_in;
	assign data = read_en ? data_out : 8'bz;
	assign data_in = data;
	
	// Instantiate counter module.
	counter_EFB counter (.tc_clki(clk), .tc_rstn(tc_rstn), .tc_int(write_en), .tc_oc( ));
	assign tc_rstn = 1'b1;

	// Combine the external read enable and the internal write enable (from the 
	// counter) so that the read command overrides the write.
	assign read_write = ~read_en & write_en;
	
	// Instantiate memory module.
	RAM_single_port memory (.Address(addr), .Data(data_in), .Clock(clk), 
		.WE(read_write), .ClockEn(clock_en), .Q(data_out)) 
		/* synthesis syn_ramstyle=”block_ram” */;
	
endmodule


// RAM that can be inferred by LSE.
module RAM_single_port (Address, Data, Clock, WE, ClockEn, Q);
	parameter addr_width = 5;
	parameter data_width = 8;
	input [addr_width-1:0] Address;
	input [data_width-1:0] Data, Q;
	input WE, Clock, ClockEn;
	reg [data_width-1:0] mem [(1<<addr_width)-1:0];
		// Define RAM as an indexed memory array.

	always @(posedge Clock) // Control with a clock edge.
	begin
		if (ClockEn)
			if (WE) // And control with a write enable.
				mem[(Address)] <= Data;
	end
  
	assign Q = mem[Address];
endmodule