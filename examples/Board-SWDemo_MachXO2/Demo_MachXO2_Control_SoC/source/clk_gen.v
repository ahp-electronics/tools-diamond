`define CNT_SIZE 14

module audio_clk_gen(clkin,rst,clkout,sample_clkout);
input clkin;
input rst;
output reg clkout;
output sample_clkout;
parameter CLK_IN_HZ = 1000000;
// parameter SAMPLE_CLK_OUT_HZ = 8000;
parameter SAMPLE_CLK_OUT_HZ = 16000;

reg[`CNT_SIZE-1:0] clk_count;

localparam COUNT_MAX = CLK_IN_HZ / (SAMPLE_CLK_OUT_HZ * 2 * 256);

always@(posedge clkin or posedge rst) begin
  if (rst) begin
    clk_count <= 0;
    clkout   <= 0;
  end
  else begin
    if (clk_count < COUNT_MAX) begin
      clk_count <= clk_count + 1;
    end
    else begin
      clk_count <= 0;
      clkout   <= !clkout;
    end
  end
end

reg [7:0] sample_clk_count;
assign sample_clkout = sample_clk_count[7];

always@(posedge clkout or posedge rst) begin
    if (rst)
      sample_clk_count <= 0;
    else
      sample_clk_count <= sample_clk_count + 1;
end

endmodule

