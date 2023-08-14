//Interactive attribute example for syn_pipeline attribute

module test(input clk,
   			input [3:0] a,b,
   			output [7:0] r);


reg [7:0] temp2, temp3;
reg [3:0] a_reg,b_reg;
wire [7:0] temp1 = a_reg * b_reg;

always @ (posedge clk)
begin
   	  a_reg<=a;
   	  b_reg<=b;
      temp2 <= temp1;
      temp3 <= temp2;
      
  
end


assign r=temp3;

endmodule