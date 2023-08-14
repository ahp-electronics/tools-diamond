//***************************************************************
// 4-bit down counters with asynchronous preset, enable, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBD84(Q0, Q1, Q2, Q3, CAO, CAI, CLK, EN, SD);
  output Q0;
  output Q1;
  output Q2;
  output Q3;
  output CAO;
  input CAI;
  input CLK;
  input EN;
  input SD;
  reg [3:0] Q_i;

always @(posedge CLK or posedge SD)
begin
  if (SD) 
    Q_i = 4'b1111;		
  else if (EN && CAI) 
    Q_i = Q_i - 1;
end

assign Q0 = Q_i[0];
assign Q1 = Q_i[1];
assign Q2 = Q_i[2];
assign Q3 = Q_i[3];
assign CAO = CAI && EN && !Q_i[0] && !Q_i[1] && !Q_i[2] && !Q_i[3];

endmodule

