//***************************************************************
// 4-bit decade up/down counters with asynchronous clear, synchronous clear, enable, and parallel data load.
// XiaoQiu ZHOU
//***************************************************************
module CDUD4(Q0, Q1, Q2, Q3, D0, D1, D2, D3, CLK, LD, EN, DNUP, CD, CS);
  output Q0;
  output Q1;
  output Q2;
  output Q3;  
  input D0;
  input D1; 
  input D2;
  input D3;  
  input CLK;
  input LD;
  input EN;
  input DNUP;  
  input CD;  
  input CS;
  reg [3:0] Q_i;

always @(posedge CLK or posedge CD)
begin
  if (CD) 
    Q_i = 0;	
  else if (CS) 
    Q_i = 0;	
  else if (LD) 
    Q_i = {D3,D2,D1,D0};
  else if (EN && (!Q_i[3]||(!Q_i[2]&&!Q_i[1]))) 
    if (DNUP)
      if (Q_i == 4'b0000)
        Q_i = 4'b1001;
      else
        Q_i = Q_i - 1;
    else
      if (Q_i == 4'b1001)
        Q_i = 4'b0000;
      else
        Q_i = Q_i + 1;
end

assign Q0 = Q_i[0];
assign Q1 = Q_i[1];
assign Q2 = Q_i[2];
assign Q3 = Q_i[3];

endmodule
