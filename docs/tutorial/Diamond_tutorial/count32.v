
module count32(	clk,
				direction,
				reset,
				count
				);
				
  input clk, direction,reset;
  output reg [31:0] count;
  reg [31:0] countai; 


  always@(posedge clk or posedge reset)
  begin 
	if(reset) begin
		countai <= 31'b0;
	end
	else begin
		if(direction) countai <= countai + 1'b1;
		else begin
			countai <= countai - 1'b1; 
		end
	count <= countai;
	end
  end
 endmodule 
