//Interactive attribute example for syn_srlstyle attribute
module test(input clk, enable,
			input [3:0] dataIn,
			output [3:0] result);

reg [3:0] regBank[15:0]; 

integer i; 

always @(posedge clk) begin
   if (enable == 1) begin
      for (i=15; i>0; i=i-1) begin
         regBank[i] <= regBank[i-1];
      end
   regBank[0] <= dataIn;

   end
end 

assign result= regBank[15];


endmodule