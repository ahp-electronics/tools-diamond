
module d_ff ( d,clk,q,rst,set);
input clk,d,rst,set;
output reg q;

always @(posedge clk or posedge rst)
begin
   if(rst)
     q<=0;
   else if(set)
     q<=1;
   else
     q<=d;
     
end

endmodule 