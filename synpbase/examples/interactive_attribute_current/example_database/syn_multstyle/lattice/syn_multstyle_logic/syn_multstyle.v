//Interactive attribute example for syn_multstyle attribute

module mult(a,b,c,r,en);
input [7:0] a,b;
output [15:0] r;
input [15:0] c;
input en;
wire [15:0] temp;
assign temp = a*b;
assign r = en ? temp : c;
endmodule 