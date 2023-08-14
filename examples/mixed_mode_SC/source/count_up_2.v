module count_up_2 (clk,rst,c_up)/* synthesis GSR="FORCEENABLE" */;
input clk, rst;
output [2:0]c_up;

reg [2:0]c_up;

always @(posedge clk or posedge rst)
     begin
        if (rst)
           c_up = 3'b000;
          else
           c_up = c_up + 2;
      end
endmodule

