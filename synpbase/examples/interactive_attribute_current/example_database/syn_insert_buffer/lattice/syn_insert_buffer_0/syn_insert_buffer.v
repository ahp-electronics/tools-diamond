// Interactive attribute example for syn_insert_buffer attribute
// This example shows how to insert buffer in NET/PORT for Lattice devices.

`define SIZE 4

module insert_buffer (
		rst_a,
		clk,
		enable,
		input1,
		input2,
		data_out
);

//--------------------------
//Input Ports
//--------------------------
input				rst_a;
input	[`SIZE:0]	input1, input2;
input 				clk;
input 				enable;

//--------------------------
//Output Ports
//--------------------------
output	[`SIZE:0]	data_out;

//--------------------------
//Signal Declarations : wire
//--------------------------
wire 				chip_sel;

//--------------------------
//Signal Declarations : reg
//--------------------------
reg		[`SIZE:0]	data_out;
reg		[`SIZE:0]	reg1;
reg		[`SIZE:0]	reg2;

assign chip_sel = rst_a & enable; 

always @(posedge clk or posedge chip_sel) 
begin
	if (chip_sel)
		begin
			reg1		<= 0;
			reg2		<= 0;
			data_out	<= 0;
		end
	else
		begin
			reg1 <= input1;
			reg2 <= input2;
			data_out <= reg1 + reg2;
		end
end

endmodule