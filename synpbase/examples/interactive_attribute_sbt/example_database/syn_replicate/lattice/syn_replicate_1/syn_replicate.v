module norep (Reset, Clk, enable,Datain1, Datain2,Datain3, Datain4, Dataout);

parameter size=8;

input Reset, Clk, enable;
input [size-1:0] Datain1;
input [size-1:0] Datain2;
input [size-1:0] Datain3;
input [size-1:0] Datain4;
output [size-1:0] Dataout;


reg [size-1:0] Datain1_tmp,Datain2_tmp,Datain3_tmp,Datain4_tmp;
reg enable_tmp;
reg [size-1:0] Dataout;
wire [size-1:0] Dataout_tmp;


always @(posedge Clk or negedge Reset)
begin
	if ( !Reset )
    begin
   	enable_tmp <= 0;
   	Datain1_tmp <= 0;
   	Datain2_tmp <= 0;
   	Datain3_tmp <= 0;
   	Datain4_tmp <= 0;
   	Dataout <= 0;
  	end
 	else
  	begin
  	enable_tmp <= enable;
  	Datain1_tmp <= Datain1;
  	Datain2_tmp <= Datain2;
  	Datain3_tmp <= Datain3;
  	Datain4_tmp <= Datain4;
   	Dataout <= Dataout_tmp;	
  	end
end

assign Dataout_tmp = enable_tmp? Datain1_tmp + Datain2_tmp:
								 Datain3_tmp + Datain4_tmp;



endmodule