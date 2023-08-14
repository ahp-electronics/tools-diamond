//***************************************************************
// 1-bit up/down counters with asynchronous clear, synchronous clear, enable, 
// parallel data load, synchronous preset, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBUD1(Q0, CAO, D0, CAI, CLK, PS, LD, EN,	DNUP, CD, CS);
  output Q0;
  output CAO;
  input D0;
  input CAI;
  input CLK;
  input PS;
  input LD;
  input EN;
  input DNUP;
  input CD;  
  input CS;
  reg Q_i;

always @(posedge CLK or posedge CD)
begin
  if (CD) 
    Q_i = 0;	
  else if (PS) 
    Q_i = 1;
  else if (CS) 
    Q_i = 0;	
  else if (LD) 
    Q_i = D0;
  else if (CAI && EN) 
    if (DNUP)
      Q_i = Q_i - 1;
    else
      Q_i = Q_i + 1;
end

assign Q0 = Q_i;
assign CAO = CAI && EN && (( DNUP && !Q_i)||( !DNUP && Q_i));

endmodule
