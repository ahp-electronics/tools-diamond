module count_down (clk,rst,c_down)/* synthesis GSR="DISABLED" */;
input clk, rst;
output [2:0]c_down;

reg [2:0]c_down;

always @(posedge clk or posedge rst)
     begin
        if (rst)
           c_down = 3'b111;
          else
           c_down = c_down - 1;
      end
endmodule

