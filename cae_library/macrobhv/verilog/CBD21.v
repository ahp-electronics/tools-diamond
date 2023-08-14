//***************************************************************
// 1-bit down counters with asynchronous clear, enable, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBD21(Q0, CAO, CAI, CLK,	EN, CD);
  output Q0;
  output CAO;
  input CAI;
  input CLK;
  input EN;
  input CD;
  reg Q_i;

always @(posedge CLK or posedge CD)
begin
  if (CD) 
    Q_i = 0;		
  else if (CAI && EN) 
    Q_i = Q_i - 1;
end

assign Q0 = Q_i;
assign CAO = CAI && EN && !Q_i;

endmodule
