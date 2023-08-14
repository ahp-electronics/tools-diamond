//***************************************************************
// 4-bit gray code up/down counter with asynchronous clear and preset, synchronous clear , enable, and parallel data load.
// XiaoQiu ZHOU
//***************************************************************
module CGUD4S(Q0, Q1, Q2, Q3, D0, D1, D2, D3, CLK, LD, EN, SD, DNUP, CD, CS);
  output Q0;
  output Q1;
  output Q2;
  output Q3;  
  input D0;
  input D1; 
  input D2;
  input D3;  
  input CLK;
  input LD;
  input EN;
  input SD;
  input DNUP;
  input CD;
  input CS;
  reg [3:0] Q_i;

always @(posedge CLK or posedge CD or posedge SD)
begin
  if (CD) 
    Q_i = 4'b0000;
  else if (SD) 
    Q_i = 4'b1111;	
  else if (CS) 
    Q_i = 4'b0000;
  else if (LD) 
    Q_i = {D3,D2,D1,D0};
  else if (EN) 
    if (DNUP)
      case (Q_i)
        4'b0000: Q_i=4'b1000;
        4'b0001: Q_i=4'b0000;
        4'b0011: Q_i=4'b0001;                
        4'b0010: Q_i=4'b0011;
        4'b0110: Q_i=4'b0010;
        4'b0111: Q_i=4'b0110;                
        4'b0101: Q_i=4'b0111;
        4'b0100: Q_i=4'b0101;
        4'b1100: Q_i=4'b0100;                
        4'b1101: Q_i=4'b1100;
        4'b1111: Q_i=4'b1101;
        4'b1110: Q_i=4'b1111;                
        4'b1010: Q_i=4'b1110;                
        4'b1011: Q_i=4'b1010;
        4'b1001: Q_i=4'b1011;
        4'b1000: Q_i=4'b1001;                
        default: Q_i=4'b0000;
      endcase  
    else
      case (Q_i)
        4'b0000: Q_i=4'b0001;
        4'b0001: Q_i=4'b0011;
        4'b0011: Q_i=4'b0010;                
        4'b0010: Q_i=4'b0110;
        4'b0110: Q_i=4'b0111;
        4'b0111: Q_i=4'b0101;                
        4'b0101: Q_i=4'b0100;
        4'b0100: Q_i=4'b1100;
        4'b1100: Q_i=4'b1101;                
        4'b1101: Q_i=4'b1111;
        4'b1111: Q_i=4'b1110;
        4'b1110: Q_i=4'b1010;                
        4'b1010: Q_i=4'b1011;                
        4'b1011: Q_i=4'b1001;
        4'b1001: Q_i=4'b1000;
        4'b1000: Q_i=4'b0000;                
        default: Q_i=4'b0000;
      endcase  
end

assign Q0 = Q_i[0];
assign Q1 = Q_i[1];
assign Q2 = Q_i[2];
assign Q3 = Q_i[3];

endmodule
