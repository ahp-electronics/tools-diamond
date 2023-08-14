module top(
	CLK,
	CE,
	RST,
	A, B,
	SUM
	);

parameter WIDTH4 = 4;

input CLK, CE, RST;
input [WIDTH4-1:0] A, B;

output [WIDTH4-1:0] SUM;

wire [WIDTH4-1:0] adder1_in1, adder1_in2, adder1_sum;


defparam U_serial_reg_custom_in_1A.WIDTH = WIDTH4;
serial_reg_custom U_serial_reg_custom_in_1A(.D(A), .CLK(CLK), .CE(CE), .RST(RST), .Q(adder1_in1));
defparam U_serial_reg_custom_in_1B.WIDTH = WIDTH4;
serial_reg_custom U_serial_reg_custom_in_1B(.D(B), .CLK(CLK), .CE(CE), .RST(RST), .Q(adder1_in2));

defparam U_add_custom_1.WIDTH = WIDTH4;
add_custom U_add_custom_1(.A(adder1_in1), .B(adder1_in2), .SUM(adder1_sum));

defparam U_serial_reg_custom_out_1.WIDTH = WIDTH4;
serial_reg_custom U_serial_reg_custom_out_1(.D(adder1_sum), .CLK(CLK), .CE(CE), .RST(RST), .Q(SUM));


endmodule


module reg_custom(
	D,
	CLK,
	CE,
	RST,
	Q
	);

parameter WIDTH = 1;

input [WIDTH-1:0] D;
input CLK, CE, RST;
output [WIDTH-1:0] Q;

reg [WIDTH-1:0] Q;
always@(posedge CLK)
	if(RST)
		Q <= 0;
	else if(CE)
		Q <= D;
		
endmodule

module serial_reg_custom(
	D,
	CLK,
	CE,
	RST,
	Q
	);

parameter WIDTH = 1;

input [WIDTH-1:0] D;
input CLK, CE, RST;
output [WIDTH-1:0] Q;

wire [WIDTH-1:0] D_1;

defparam U_reg_custom_in.WIDTH = WIDTH;
reg_custom U_reg_custom_in(.D(D), .CLK(CLK), .CE(CE), .RST(RST), .Q(D_1));
defparam U_reg_custom_out.WIDTH = WIDTH;
reg_custom U_reg_custom_out(.D(D_1), .CLK(CLK), .CE(CE), .RST(RST), .Q(Q));

endmodule

module add_custom(
	A,
	B,
	SUM
	);

parameter WIDTH = 1;
	
input [WIDTH-1:0] A, B;	
output [WIDTH-1:0] SUM;	
assign SUM = A + B;
	
endmodule