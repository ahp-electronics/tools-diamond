module count_down_2 (clk,rst,c_down)/* synthesis GSR="IPENABLE" */;
input clk, rst;
output [2:0]c_down;

reg [2:0]c_down;

always @(posedge clk or posedge rst)
     begin
        if (rst)
           c_down = 3'b111;
          else
           c_down = c_down - 2;
      end
endmodule


