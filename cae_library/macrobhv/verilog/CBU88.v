//***************************************************************
// 8-bit up counters with asynchronous preset, enable, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBU88(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, CAO, CAI, CLK, EN, SD);
  output Q0;
  output Q1;
  output Q2;
  output Q3;
  output Q4;
  output Q5;
  output Q6;
  output Q7;
  output CAO;
  input CAI;
  input CLK;
  input EN;
  input SD;
  reg [7:0] Q_i;

always @(posedge CLK or posedge SD)
begin
  if (SD) 
    Q_i = 8'b11111111;		
  else if (EN && CAI) 
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
assign CAO = CAI && EN && Q_i[0] && Q_i[1] && Q_i[2] && Q_i[3] 
&& Q_i[4] && Q_i[5] && Q_i[6] && Q_i[7];

endmodule

