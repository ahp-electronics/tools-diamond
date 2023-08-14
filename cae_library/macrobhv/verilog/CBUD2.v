//***************************************************************
// 2-bit up/down counters with asynchronous clear, synchronous clear, enable, 
// parallel data load, synchronous preset, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBUD2(Q0, Q1, CAO, D0, D1, CAI, CLK, PS, LD, EN,	DNUP, CD, CS);
  output Q0;
  output Q1;  
  output CAO;
  input D0;
  input D1;  
  input CAI;
  input CLK;
  input PS;
  input LD;
  input EN;
  input DNUP;
  input CD;  
  input CS;
  reg [1:0] Q_i;

always @(posedge CLK or posedge CD)
begin
  if (CD) 
    Q_i = 2'b00;	
  else if (PS) 
    Q_i = 2'b11;
  else if (CS) 
    Q_i = 2'b00;	
  else if (LD) 
    Q_i = {D1,D0};
  else if (CAI && EN) 
    if (DNUP)
      Q_i = Q_i - 1;
    else
      Q_i = Q_i + 1;
end

assign Q0 = Q_i[0];
assign Q1 = Q_i[1];
assign CAO = CAI && EN && (( DNUP && !Q_i[0] && !Q_i[1] )||( !DNUP && Q_i[0] && Q_i[1]));

endmodule
