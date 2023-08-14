//***************************************************************
// 16-bit down counters with asynchronous clear, enable, parallel data load,
// asynchronous preset, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBDA16(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, CAO, D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, CAI, CLK, SD, LD, EN, CD);
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
  output CAO;
  input D0;
  input D1; 
  input D2;
  input D3;
  input D4;
  input D5; 
  input D6;
  input D7;
  input D8;
  input D9; 
  input D10;
  input D11;
  input D12;
  input D13; 
  input D14;
  input D15;  
  input CAI;
  input CLK;
  input SD;
  input LD;
  input EN;
  input CD;
  reg [15:0] Q_i;

always @(posedge CLK or posedge CD or posedge SD)
begin
  if (CD) 
    Q_i = 16'b0000000000000000;
  else if (SD) 
    Q_i = 16'b1111111111111111;    	
  else if (LD) 
    Q_i = {D15,D14,D13,D12,D11,D10,D9,D8,D7,D6,D5,D4,D3,D2,D1,D0};
  else if (CAI && EN) 
    Q_i = Q_i - 1;
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
assign CAO = CAI && EN && !Q_i[0] && !Q_i[1] && !Q_i[2] && !Q_i[3]
&& !Q_i[4] && !Q_i[5] && !Q_i[6] && !Q_i[7]
&& !Q_i[8] && !Q_i[9] && !Q_i[10] && !Q_i[11]
&& !Q_i[12] && !Q_i[13] && !Q_i[14] && !Q_i[15];

endmodule
