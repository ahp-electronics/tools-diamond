//***************************************************************
// 1-bit down counters with asynchronous clear, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBD11(Q0, CAO, CAI, CLK,	CD);
  output Q0;
  output CAO;
  input CAI;
  input CLK;
  input CD;
  reg Q_i;

always @(posedge CLK or posedge CD)
begin
  if (CD) 
    Q_i = 0;		
  else if (CAI) 
    Q_i = Q_i - 1;
end

assign Q0 = Q_i;
assign CAO = CAI && !Q_i;

endmodule
