module topcount (input	reset,
				 input	direction,
				 output LOCK, 
				 output [7:0]count3t, 
				 output [31:0]count2t
				);

	wire [2:0] countt;
	reg directionR;
	wire CLKOP, clk_1Hz;
	wire [31:0] count2t_o;
	wire [31:0] countt_o;

	assign count2t = count2t_o;
	
	OSCH OSCinst0 (.STDBY(1'b0), .OSC(clk), .SEDSTDBY());
	defparam OSCinst0.NOM_FREQ = "20.46";
	
	my_pll my_pll_inst (.CLKI(clk), .CLKOP(CLKOP), .LOCK(LOCK));
	
	count8 counter1 (CLKOP, reset, directionR, count3t);
	count32 counter2 (CLKOP, directionR, reset, count2t_o);
	
	always @(posedge CLKOP )begin
		directionR <= direction;
	end
	
endmodule