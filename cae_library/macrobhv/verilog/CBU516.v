//***************************************************************
// 16-bit up counters with asynchronous clear and enable.
// XiaoQiu ZHOU
//***************************************************************
module CBU516(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, CLK, EN, CD);
  output Q0;
  output Q1;
  output Q2;
  output Q3;
  output Q4;
  output Q5;
  output Q6;
  output Q7;
  output Q8;
  output Q9;
  output Q10;
  output Q11;
  output Q12;
  output Q13;
  output Q14;
  output Q15;
  input EN;
  input CLK;
  input CD;
  reg [15:0] Q_i;

always @(posedge CLK or posedge CD)
begin
  if (CD) 
    Q_i = 16'b0000000000000000;		
  else if (EN) 
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
assign Q8 = Q_i[8];
assign Q9 = Q_i[9];
assign Q10 = Q_i[10];
assign Q11 = Q_i[11];
assign Q12 = Q_i[12];
assign Q13 = Q_i[13];
assign Q14 = Q_i[14];
assign Q15 = Q_i[15];

endmodule

