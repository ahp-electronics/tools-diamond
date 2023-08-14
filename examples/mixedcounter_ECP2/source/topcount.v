module count8(clk, reset, direction, count);
	input clk, reset, direction; 
	output [7:0] count;
endmodule

module topcount (clk, reset, direction, count, count2, count3);
	input clk, reset, direction; 
	output [7:0] count;
	output [15:0] count2;
	output [31:0] count3;
	wire [7:0] countt;
	wire [15:0] count2t;
	wire [31:0] count3ai;

	count8 counter8 (clk, reset, direction, countt);
	count16 counter16 (clk, reset, direction, count2t);

	assign count = countt;
	assign count2 = count2t;
	assign count3ai = {count2t, countt, countt};
	assign count3 = count3ai;
endmodule
