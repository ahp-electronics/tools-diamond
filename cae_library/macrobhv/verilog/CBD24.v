//***************************************************************
// 4-bit down counters with asynchronous clear, enable, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBD24(Q0, Q1, Q2, Q3, CAO, CAI, CLK, EN, CD);
  output Q0;
  output Q1;
  output Q2;
  output Q3;
  output CAO;
  input CAI;
  input CLK;
  input EN;
  input CD;
  reg [3:0] Q_i;

always @(posedge CLK or posedge CD)
begin
  if (CD) 
    Q_i = 4'b0000;		
  else if (CAI && EN) 
    Q_i = Q_i - 1;
end

assign Q0 = Q_i[0];
assign Q1 = Q_i[1];
assign Q2 = Q_i[2];
assign Q3 = Q_i[3];
assign CAO = CAI && EN && !Q_i[0] && !Q_i[1] && !Q_i[2] && !Q_i[3];

endmodule

