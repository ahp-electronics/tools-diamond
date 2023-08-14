// Simple flip-flop example without set or reset

module dff(q, data, clk);
output q /* synthesis dout="" */;
input data /* synthesis din="" */;
input  clk;
reg q;

always @(posedge clk)
begin
	q = data;
end

endmodule
