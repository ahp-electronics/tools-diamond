//Reveal ECP5 counter and trigger modules
//32 bit counter with asynchronous reset and MSB toggle to LED output
module counter_top 
 (input rstn, 
  output LEDPIO_OUT0,
  output LEDPIO_OUT1,
  output LEDPIO_OUT2,
  output LEDPIO_OUT3
 );
// ECP5 internal oscillator generates platform clock
wire clk1;
reg [31:0] cnt;

OSCG OSCinst0 (.OSC(clk1));
defparam OSCinst0.DIV = 4 ;   

always@(posedge clk1 or negedge rstn)
 begin 
  if (!rstn)
   cnt = 0;
  else 
   cnt = cnt + 1; 
 end 

assign LEDPIO_OUT0 = cnt[28];
assign LEDPIO_OUT1 = cnt[29];
assign LEDPIO_OUT2 = cnt[30];
assign LEDPIO_OUT3 = cnt[31];

endmodule
