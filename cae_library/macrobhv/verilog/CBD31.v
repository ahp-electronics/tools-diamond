//***************************************************************
// 1-bit down counters with asynchronous clear, enable, parallel data load,
// synchronous preset, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBD31(Q0, CAO, D0, CAI, CLK, PS, LD, EN,	CD);
  output Q0;
  output CAO;
  input D0;
  input CAI;
  input CLK;
  input PS;
  input LD;
  input EN;
  input CD;
  reg Q_i;

always @(posedge CLK or posedge CD)
begin
  if (CD) 
    Q_i = 0;	
  else if (PS) 
    Q_i = 1;
  else if (LD) 
    Q_i = D0;
  else if (CAI && EN) 
    Q_i = Q_i - 1;
end

assign Q0 = Q_i;
assign CAO = CAI && EN && !Q_i;

endmodule
