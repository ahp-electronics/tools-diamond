//***************************************************************
// 1-bit up counters with synchronous clear, enable, parallel data load,
// synchronous preset, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBU41(Q0, CAO, D0, CAI, CLK, PS, LD, EN,	CS);
  output Q0;
  output CAO;
  input D0;
  input CAI;
  input CLK;
  input PS;
  input LD;
  input EN;
  input CS;
  reg Q_i;

always @(posedge CLK)
begin
  if (PS) 
    Q_i = 1;
  else if (CS) 
    Q_i = 0;	
  else if (LD) 
    Q_i = D0;
  else if (CAI && EN) 
    Q_i = Q_i + 1;
end

assign Q0 = Q_i;
assign CAO = CAI && EN && Q_i;

endmodule
