//***************************************************************
// 4-bit up counters with asynchronous clear, enable, parallel data load,
// synchronous preset, CAI, and CAO.
// XiaoQiu ZHOU
//***************************************************************
module CBU34(Q0, Q1, Q2, Q3, CAO, D0, D1, D2, D3, CAI, CLK, PS, LD, EN,	CD);
  output Q0;
  output Q1;
  output Q2;
  output Q3;  
  output CAO;
  input D0;
  input D1; 
  input D2;
  input D3;  
  input CAI;
  input CLK;
  input PS;
  input LD;
  input EN;
  input CD;
  reg [3:0] Q_i;

always @(posedge CLK or posedge CD)
begin
  if (CD) 
    Q_i = 4'b0000;	
  else if (PS) 
    Q_i = 4'b1111;
  else if (LD) 
    Q_i = {D3,D2,D1,D0};
  else if (CAI && EN) 
    Q_i = Q_i + 1;
end

assign Q0 = Q_i[0];
assign Q1 = Q_i[1];
assign Q2 = Q_i[2];
assign Q3 = Q_i[3];
assign CAO = CAI && EN && Q_i[0] && Q_i[1] && Q_i[2] && Q_i[3];

endmodule
