module count(c_up,c_down,clk,rst,c_up_2,c_down_2,c_down_3);

input clk,rst;
output [2:0]c_up;
output [2:0]c_down;
output [2:0]c_up_2;
output [2:0]c_down_2;
output [2:0]c_down_3;

count_up count_up_inst (.clk(clk), .rst(rst), .c_up(c_up));
count_down count_down_inst (.clk(clk), .rst(rst), .c_down(c_down));
count_up_2 count_up_2_inst (.clk(clk), .rst(rst), .c_up(c_up_2));
count_down_2 count_down_2_inst (.clk(clk), .rst(rst), .c_down(c_down_2));
count_down_3 count_down_3_inst (.clk(clk), .rst(rst), .c_down(c_down_3));

GSR GSR_INST( .GSR(rst));

endmodule


