//***************************************************************
// 2-bit up counters with asynchronous clear, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBU12(Q0, Q1, CAO, CAI, CLK, CD);
  output Q0;
  output Q1;
  output CAO;
  input CAI;
  input CLK;
  input CD;
  reg [1:0] Q_i;

always @(posedge CLK or posedge CD)
begin
  if (CD) 
    Q_i = 2'b00;		
  else if (CAI) 
    Q_i = Q_i + 1;
end

assign Q0 = Q_i[0];
assign Q1 = Q_i[1];
assign CAO = CAI && Q_i[0] && Q_i[1];

endmodule

