// 3 bit counter with asynchronous reset
`ifndef DEBUG
`include "msb.v"
`endif
module count(c,clk,rst);

input clk,rst;
output [`MSB:0]c;
reg [`MSB:0]c;

always @(posedge clk or posedge rst)
     begin
        if (rst)
           c = 3'b000;
          else
           c = c + 1;
      end

endmodule

