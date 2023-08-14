//***************************************************************
// 8-bit decade up counters with asynchronous clear, enable and parallel data load.
// XiaoQiu ZHOU
//***************************************************************
module CDU18(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, D0, D1, D2, D3, D4, D5, D6, D7, CLK, LD, EN, CD);
  output Q0;
  output Q1;
  output Q2;
  output Q3;  
  output Q4;
  output Q5;
  output Q6;
  output Q7;  
  input D0;
  input D1; 
  input D2;
  input D3;  
  input D4;
  input D5; 
  input D6;
  input D7;  
  input CLK;
  input LD;
  input EN;
  input CD;
  reg [7:0] Q_i;

always @(posedge CLK or posedge CD)
begin
  if (CD) 
    Q_i = 8'b00000000;	
  else if (LD) 
    Q_i = {D7,D6,D5,D4,D3,D2,D1,D0};
  else if (EN && ((!Q_i[7]&&!Q_i[3])||(!Q_i[7]&&!Q_i[2]&&!Q_i[1])||(!Q_i[6]&&!Q_i[5]&&!Q_i[3])||(!Q_i[6]&&!Q_i[5]&&!Q_i[2]&&!Q_i[1]))) 
    if (Q_i == 8'b01100011)
      Q_i = 8'b00000000;
    else
      Q_i = Q_i + 1;
end

assign Q0 = Q_i[0];
assign Q1 = Q_i[1];
assign Q2 = Q_i[2];
assign Q3 = Q_i[3];
assign Q4 = Q_i[4];
assign Q5 = Q_i[5];
assign Q6 = Q_i[6];
assign Q7 = Q_i[7];

endmodule
