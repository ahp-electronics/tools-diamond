//***************************************************************
// 2-bit down counters with synchronous clear, enable, parallel data load,
// synchronous preset, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBD42(Q0, Q1, CAO, D0, D1, CAI, CLK, PS, LD, EN,	CS);
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
  input CS;
  reg [1:0] Q_i;

always @(posedge CLK)
begin
  if (PS) 
    Q_i = 2'b11;
  else if (CS) 
    Q_i = 2'b00;	
  else if (LD) 
    Q_i = {D1,D0};
  else if (CAI && EN) 
    Q_i = Q_i - 1;
end

assign Q0 = Q_i[0];
assign Q1 = Q_i[1];
assign CAO = CAI && EN && !Q_i[0] && !Q_i[1];

endmodule
