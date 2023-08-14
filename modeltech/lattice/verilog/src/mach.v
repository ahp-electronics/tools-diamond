`timescale 1ns / 1ps // TIMESCALE FOR THE LIBRARY
`define PUC
// 1.2 Added default timing to work around the zero time loop
// 1.3 Default propagation delay time is changed to zero
// 1.4 Change default pulse width and period to 1ns

`celldefine 
 
module AND2 (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) =  0:0:0, 0:0:0; 
(I1 => O) =  0:0:0, 0:0:0; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module AND3 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2); 
 
specify 
 
(I0 => O) =  0:0:0, 0:0:0;
(I1 => O) =  0:0:0, 0:0:0;
(I2 => O) =  0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND4 (O,I0,I1,I2,I3); 
input I0,I1,I2,I3; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND5 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND6 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND7 (O,I0,I1,I2,I3,I4,I5,I6); 
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
(I6 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND8 (O,I0,I1,I2,I3,I4,I5,I6,I7); 
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
(I6 => O) = 0:0:0, 0:0:0;
(I7 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module BI_DIR (O,I0,IO,OE); 
input I0,OE; 
inout IO; 
output O; 
 
supply0 GND; 
supply1 VCC; 
 
buf INS1 (O, IO); 
bufif1 INS2 (IO, I0, OE); 
 
specify 
 
(I0 => IO) = 0:0:0, 0:0:0;
(OE => IO) = 0:0:0, 0:0:0;
(IO => O) =  0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module BUFF (O,I0); 
input I0; 
output O; 
supply0 GND; 
supply1 VCC; 
buf INS1 (O, I0); 
 
specify 
 
(I0 => O) =  0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module BUFTH (O,I0,OE); 
input I0,OE; 
output O; 
supply0 GND; 
supply1 VCC; 
bufif1 INS1 (O, I0, OE); 
 
specify 
 
(I0 => O) =  0:0:0, 0:0:0;
(OE => O) =  0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module BUFTI (O,I0,OE); 
input I0,OE; 
output O; 
supply0 GND; 
supply1 VCC; 
bufif1 INS1 (O, I0, OE); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(OE => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module BUFTL (O,I0,OE); 
input I0,OE; 
output O; 
supply0 GND; 
supply1 VCC; 
bufif0 INS1 (O, I0, OE); 
 
specify 
 
(I0 => O) =  0:0:0, 0:0:0;
(OE => O) =  0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
`celldefine 
  
module CLKI(O,PAD); 
input PAD; 
output O; 
supply0 GND; 
supply1 VCC; 
buf INS1 (O, PAD); 
  
specify 
  
(PAD => O) =  0:0:0, 0:0:0;
  
endspecify 
  
  
endmodule 
`endcelldefine 
 
`celldefine 
 
module DFF (Q,D,CLK); 
input D,CLK; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
MACH_DFF_X INS1 (Q_int, D, CLK, VCC, VCC, notifier); 
`else 
MACH_DFF INS4 (Q_int, D, CLK, VCC, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0); 
$setup(D , posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, D , 0:0:0, notifier); 
$width(posedge CLK, 1:1:1, 0, notifier); 
$period(posedge CLK, 1:1:1, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFC (Q,D,CLK,CE); 
input D,CLK,CE; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_DFF_CE_X INS1 (Q_int, D, CLK, VCC, VCC, CE, notifier); 
`else 
MACH_DFF_CE INS4 (Q_int, D, CLK, VCC, VCC, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0); 
$setup(D , posedge CLK &&& (CE == 1), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE == 1), D , 0:0:0, notifier); 
$setup(posedge CE , posedge CLK , 0.1:0.1:0.1, notifier); 
$hold(posedge CLK , posedge CE , 0:0:0, notifier); 
$width(posedge CLK &&& (CE == 1), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (CE == 1), 1:1:1, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCR (Q,D,CLK,CE,R); 
input D,CLK,CE,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_DFF_CE_X INS1 (Q_int, D, CLK, R, VCC, CE, notifier); 
`else 
MACH_DFF_CE INS5 (Q_int, D, CLK, R, VCC, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (CE_R, CE, R); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0); 
(R => Q) = ( 0:0:0, 0:0:0); 
$width(negedge R, 1:1:1, 0, notifier); 
$setup(D  &&& (CE_R), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE_R), D , 0:0:0, notifier); 
$setup(posedge CE , posedge CLK , 0.1:0.1:0.1, notifier); 
$hold(posedge CLK , posedge CE , 0:0:0, notifier); 
$width(posedge CLK &&& (CE_R), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (CE_R), 1:1:1, notifier); 
$recovery(posedge R , posedge CLK &&& (CE == 1), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE == 1), posedge R , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCRH (Q,D,CLK,CE,R); 
input D,CLK,CE,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_DFF_CE_X INS1 (Q_int, D, CLK, R1, VCC, CE, notifier); 
`else 
MACH_DFF_CE INS7 (Q_int, D, CLK, R1, VCC, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
not INS5 (R2, R); 
and INS6 (CE_NR, CE, R2); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0); 
(R => Q) = ( 0:0:0, 0:0:0); 
$width(posedge R, 1:1:1, 0, notifier); 
$setup(D , posedge CLK &&& (CE_NR), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE_NR), D , 0:0:0, notifier); 
$setup(posedge CE , posedge CLK , 0.1:0.1:0.1, notifier); 
$hold(posedge CLK , posedge CE , 0:0:0, notifier); 
$width(posedge CLK &&& (CE_NR), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (CE_NR), 1:1:1, notifier); 
$recovery(negedge R , posedge CLK &&& (CE == 1), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE == 1), negedge R , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCRS (Q,D,CLK,CE,R,S); 
input D,CLK,CE,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
MACH_DFF_CE_X INS1 (Q_int, D, CLK, R, S, CE, notifier); 
`else 
MACH_DFF_CE INS7 (Q_int, D, CLK, R, S, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (CE_R_S, CE, R, S); 
and INS5 (CE_R, CE, R); 
and INS6 (CE_S, CE, S); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0); 
(R => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(negedge R, 1:1:1, 0, notifier); 
$width(negedge S, 1:1:1, 0, notifier); 
$setup(D , posedge CLK &&& (CE_R_S), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE_R_S), D , 0:0:0, notifier); 
$width(posedge CLK &&& (CE_R_S), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (CE_R_S), 1:1:1, notifier); 
$recovery(posedge R , posedge CLK &&& (CE_S), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE_S), posedge R , 0:0:0, notifier); 
$recovery(posedge S , posedge CLK &&& (CE_R), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE_R), posedge S , 0:0:0, notifier); 
 
$setup(posedge CE , posedge CLK , 0.1:0.1:0.1, notifier); 
$hold(posedge CLK , posedge CE , 0:0:0, notifier); 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCRSH (Q,D,CLK,CE,R,S); 
input D,CLK,CE,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
MACH_DFF_CE_X INS1 (Q_int, D, CLK, R1,S1, CE, notifier); 
`else 
MACH_DFF_CE INS11 (Q_int, D, CLK, R1, S1, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
not INS5 (R1, R); 
and INS8 (CE_NR_NS, CE, R1, S1); 
and INS9 (CE_NR, CE, R1); 
and INS10 (CE_NS, CE, S1); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(posedge R, 1:1:1, 0, notifier); 
$width(posedge S, 1:1:1, 0, notifier); 
$setup(D , posedge CLK &&& (CE_NR_NS), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE_NR_NS), D , 0:0:0, notifier); 
$width(posedge CLK &&& (CE_NR_NS), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (CE_NR_NS), 1:1:1, notifier); 
$recovery(negedge R , posedge CLK &&& (CE_NS), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE_NS), negedge R , 0:0:0, notifier); 
$recovery(negedge S , posedge CLK &&& (CE_NR), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE_NR), negedge S , 0:0:0, notifier); 
$setup(posedge CE , posedge CLK , 0.1:0.1:0.1, notifier); 
$hold(posedge CLK , posedge CE , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCS (Q,D,CLK,CE,S); 
input D,CLK,CE,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_DFF_CE_X INS1 (Q_int, D, CLK, VCC, S, CE, notifier); 
`else 
MACH_DFF_CE INS5 (Q_int, D, CLK, VCC, S, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (CE_S, CE, S); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(negedge S, 1:1:1, 0, notifier); 
$setup(D , posedge CLK &&& (CE_S), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE_S), D , 0:0:0, notifier); 
$width(posedge CLK &&& (CE_S), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (CE_S), 1:1:1, notifier); 
$recovery(posedge S , posedge CLK &&& (CE == 1), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE == 1), posedge S , 0:0:0, notifier); 
$setup(posedge CE , posedge CLK , 0.1:0.1:0.1, notifier); 
$hold(posedge CLK , posedge CE , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCSH (Q,D,CLK,CE,S); 
input D,CLK,CE,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_DFF_CE_X INS1 (Q_int, D, CLK, VCC, S1, CE, notifier); 
`else 
MACH_DFF_CE INS7 (Q_int, D, CLK, VCC, S1, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
not INS5 (S2, S); 
and INS6 (CE_NS, CE, S2); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(posedge S, 1:1:1, 0, notifier); 
$setup(D , posedge CLK &&& (CE_NS), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE_NS), D , 0:0:0, notifier); 
$width(posedge CLK &&& (CE_NS), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (CE_NS), 1:1:1, notifier); 
$recovery(negedge S , posedge CLK &&& (CE == 1), 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (CE == 1), negedge S , 0:0:0, notifier); 
$setup(posedge CE , posedge CLK , 0.1:0.1:0.1, notifier); 
$hold(posedge CLK ,posedge  CE , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFR (Q,D,CLK,R); 
input D,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_DFF_X INS1 (Q_int, D, CLK, R, VCC, notifier); 
`else 
MACH_DFF INS4 (Q_int, D, CLK, R, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);

$width(negedge R, 1:1:1, 0, notifier); 
$setup(D  &&& R, posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& R, D , 0:0:0, notifier); 
$width(posedge CLK &&& R, 1:1:1, 0, notifier); 
$period(posedge CLK &&& R, 1:1:1, notifier); 
$recovery(posedge R, posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, posedge R , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFRH (Q,D,CLK,R); 
input D,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_DFF_X INS1 (Q_int, D, CLK, R1, VCC, notifier); 
`else 
MACH_DFF INS1 (Q_int, D, CLK, R1, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
not INS5 (R2, R); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
$width(posedge  R, 1:1:1, 0, notifier); 
$setup(D  &&& R2, posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& R2, D , 0:0:0, notifier); 
$width(posedge CLK &&& R2, 1:1:1, 0, notifier); 
$period(posedge CLK &&& R2, 1:1:1, notifier); 
$recovery(negedge R, posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, negedge R , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFRS (Q,D,CLK,R,S); 
input D,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
MACH_DFF_X INS1 (Q_int, D, CLK, R, S, notifier); 
`else 
MACH_DFF INS5 (Q_int, D, CLK, R, S, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (R_S, R, S); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(negedge S, 1:1:1, 0, notifier); 
$width(negedge R, 1:1:1, 0, notifier); 
$setup(D  &&& (R_S), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (R_S), D , 0:0:0, notifier); 
$width(posedge CLK &&& (R_S), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (R_S), 1:1:1, notifier); 
$recovery(posedge R &&& (S), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (S), posedge R , 0:0:0, notifier); 
$recovery(posedge S &&& (R), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (R), posedge S , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFRSH (Q,D,CLK,R,S); 
input D,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
MACH_DFF_X INS1 (Q_int, D, CLK, R1, S1, notifier); 
`else 
MACH_DFF INS7 (Q_int, D, CLK, R1, S1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
not INS5 (S1, S); 
and INS6 (NR_NS, R1, S1); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(posedge S, 1:1:1, 0, notifier); 
$width(posedge R, 1:1:1, 0, notifier); 
$setup(D  &&& (NR_NS), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (NR_NS), D , 0:0:0, notifier); 
$width(posedge CLK &&& (NR_NS), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (NR_NS), 1:1:1, notifier); 
$recovery(negedge R &&& (S1), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (S1), negedge R , 0:0:0, notifier); 
$recovery(negedge S &&& (R1), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (R1), negedge S , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFS (Q,D,CLK,S); 
input D,CLK,S; 
output Q;
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_DFF_X INS7 (Q_int, D, CLK, VCC, S, notifier); 
`else 
MACH_DFF INS4 (Q_int, D, CLK, VCC, S, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(negedge S, 1:1:1, 0, notifier); 
$setup(D  &&& (S), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (S), D , 0:0:0, notifier); 
$width(posedge CLK &&& (S), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (S), 1:1:1, notifier); 
$recovery(posedge S, posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, posedge S , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFSH (Q,D,CLK,S); 
input D,CLK,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_DFF_X INS1 (Q_int, D, CLK, VCC, S1, notifier); 
`else 
MACH_DFF INS5 (Q_int, D, CLK, VCC, S1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(posedge S, 1:1:1, 0, notifier); 
$setup(D  &&& (S1), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK &&& (S1), D , 0:0:0, notifier); 
$width(posedge CLK &&& (S1), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (S1), 1:1:1, notifier); 
$recovery(negedge S, posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, negedge S , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DLAT (Q,D,LAT); 
input D,LAT; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_LATCH_X INS1 (Q_int, D, LAT, VCC, VCC, notifier); 
`else 
MACH_LATCH INS4 (Q_int, D, LAT, VCC, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(LAT => Q) = ( 0:0:0, 0:0:0);
(D => Q) = ( 0:0:0, 0:0:0);
$setup(D , negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, D , 0:0:0, notifier); 
$width(posedge LAT, 1:1:1, 0, notifier); 
$period(posedge LAT, 1:1:1, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
`celldefine 
 
module DLATR (Q,D,LAT,R); 
input D,LAT,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_LATCH_X INS1 (Q_int, D, LAT, R, VCC, notifier); 
`else 
MACH_LATCH INS4 (Q_int, D, LAT, R, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(LAT => Q) = ( 0:0:0, 0:0:0);
(D => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
$width(negedge R, 1:1:1, 0, notifier); 
$setup(D &&& R, negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT &&& R, D , 0:0:0, notifier); 
$width(posedge LAT &&& R, 1:1:1, 0, notifier); 
$period(posedge LAT &&& R, 1:1:1, notifier); 
$recovery(posedge R, negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, posedge R , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DLATRH (Q,D,LAT,R); 
input D,LAT,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_LATCH_X INS1 (Q_int, D, LAT, R1, VCC, notifier); 
`else 
MACH_LATCH INS5 (Q_int, D, LAT, R1, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
 
specify 
 
(LAT => Q) = ( 0:0:0, 0:0:0);
(D => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
$width(posedge R, 1:1:1, 0, notifier); 
$setup(D &&& R1, negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, D &&& R1, 0:0:0, notifier); 
$width(posedge LAT &&& R1, 1:1:1, 0, notifier); 
$period(posedge LAT &&& R1, 1:1:1, notifier); 
$recovery(negedge R, negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, negedge R , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
  
 
`celldefine 
 
module DLATRS (Q,D,LAT,R,S); 
input D,LAT,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
not INS8 (NOT_S, S); 
or INS9 (D_in, NOT_S, D); 
 
`ifdef xmodel 
MACH_LATCH_X INS1 (Q_int, D, LAT, R, S, notifier); 
`else 
MACH_LATCH INS5 (Q_int, D, LAT, R, S, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS6 (R_S, R, S); 
specify 
 
(LAT => Q) = ( 0:0:0, 0:0:0);
(D => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
$width(negedge R, 1:1:1, 0, notifier); 
$width(negedge S, 1:1:1, 0, notifier); 
$setup(D &&& R_S, negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, D &&& R_S, 0:0:0, notifier); 
$width(posedge LAT &&& R_S, 1:1:1, 0, notifier); 
$period(posedge LAT &&& R_S, 1:1:1, notifier); 
$recovery(posedge R &&& (S == 1), negedge LAT, 0.1:0.1:0.1, notifier); 
$recovery(posedge S &&& (R == 1), negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT &&& (S == 1), posedge R , 0:0:0, notifier); 
$hold(negedge LAT &&& (R == 1), posedge S , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DLATRSH (Q,D,LAT,R,S); 
input D,LAT,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
or INS20 (D_in, S, D); 
 
`ifdef xmodel 
MACH_LATCH_X INS1 (Q_int, D, LAT, R1, S1, notifier); 
`else 
MACH_LATCH INS7 (Q_int, D, LAT, R1, S1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
not INS5 (R1, R); 
and INS6 (NR_NS , R1, S1); 
specify 
 
(LAT => Q) = ( 0:0:0, 0:0:0);
(D => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
$width(posedge R, 1:1:1, 0, notifier); 
$width(posedge S, 1:1:1, 0, notifier); 
$setup(D &&& NR_NS, negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, D &&& NR_NS, 0:0:0, notifier); 
$width(posedge LAT &&& NR_NS, 1:1:1, 0, notifier); 
$period(posedge LAT &&& NR_NS, 1:1:1, notifier); 
$recovery(negedge R &&& (S == 0), negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, negedge R  &&& (S == 0), 1:1:1, notifier); 
$recovery(negedge S &&& (R == 0), negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, negedge S  &&& (R == 0), 1:1:1, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DLATS (Q,D,LAT,S); 
input D,LAT,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_LATCH_X INS1 (Q_int, D, LAT, VCC, S, notifier); 
`else 
MACH_LATCH INS4 (Q_int, D, LAT, VCC, S, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(LAT => Q) = ( 0:0:0, 0:0:0);
(D => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(negedge S, 1:1:1, 0, notifier); 
$setup(D &&& S, negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, D &&& S, 0:0:0, notifier); 
$width(posedge LAT &&& S, 1:1:1, 0, notifier); 
$period(posedge LAT &&& S, 1:1:1, notifier); 
$recovery(posedge S, negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, posedge S , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DLATSH (Q,D,LAT,S); 
input D,LAT,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_LATCH_X INS1 (Q_int, D, LAT, VCC, S1, notifier); 
`else 
MACH_LATCH INS5 (Q_int, D, LAT, VCC, S1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
 
specify 
 
(LAT => Q) = ( 0:0:0, 0:0:0);
(D => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(posedge S, 1:1:1, 0, notifier); 
$setup(D &&& S1, negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, D &&& S1, 0:0:0, notifier); 
$width(posedge LAT &&& S1, 1:1:1, 0, notifier); 
$period(posedge LAT &&& S1, 1:1:1, notifier); 
$recovery(negedge S, negedge LAT, 0.1:0.1:0.1, notifier); 
$hold(negedge LAT, negedge S , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
`celldefine 
 
module VCC (X); 
output X; 
 
supply0 GND; 
supply1 VCC; 
 
assign X = VCC; 
 
specify 
 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module GND (X); 
output X; 
 
supply0 GND; 
supply1 VCC; 
 
assign X = GND; 
 
specify 
 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
  
  
`celldefine 
  
module GSRBUF (O,SRI); 
input SRI; 
output O; 
supply0 GND; 
supply1 VCC; 
buf INS1 (O, SRI); 
  
specify 
  
(SRI => O) =  0:0:0, 0:0:0;
  
endspecify 
  
  
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module IBUF (O,I0); 
input I0; 
output O; 
supply0 GND; 
supply1 VCC; 
buf INS1 (O, I0); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module INV (O,I0); 
input I0; 
output O; 
supply0 GND; 
supply1 VCC; 
not INS1 (O, I0); 
 
specify 
 
(I0 => O) =  0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module INVTH (O,I0,OE); 
input I0,OE; 
output O; 
supply0 GND; 
supply1 VCC; 
bufif1 INS1 (O, O1, OE); 
not INS2 (O1,I0); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(OE => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module INVTL (O,I0,OE); 
input I0,OE; 
output O; 
supply0 GND; 
supply1 VCC; 
bufif0 INS1 (O, O1, OE); 
not INS2 (O1, I0); 
 
specify 
 
(I0 => O) =  0:0:0, 0:0:0;
(OE => O) =  0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
`celldefine 
 
module NAN2 (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) =  0:0:0, 0:0:0;
(I1 => O) =  0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN3 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2); 
 
specify 
 
(I0 => O) =  0:0:0, 0:0:0;
(I1 => O) =  0:0:0, 0:0:0;
(I2 => O) =  0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN4 (O,I0,I1,I2,I3); 
input I0,I1,I2,I3; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2, I3); 
 
specify 
 
(I0 => O) =  0:0:0, 0:0:0;
(I1 => O) =  0:0:0, 0:0:0;
(I2 => O) =  0:0:0, 0:0:0;
(I3 => O) =  0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN5 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2, I3, I4); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN6 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2, I3, I4, I5); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN7 (O,I0,I1,I2,I3,I4,I5,I6); 
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2, I3, I4, I5, I6); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
(I6 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN8 (O,I0,I1,I2,I3,I4,I5,I6,I7); 
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
(I6 => O) = 0:0:0, 0:0:0;
(I7 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
`celldefine 
 
module NOR2 (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR3 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR4 (O,I0,I1,I2,I3); 
input I0,I1,I2,I3; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2, I3); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR5 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2, I3, I4); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR6 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2, I3, I4, I5); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR7 (O,I0,I1,I2,I3,I4,I5,I6); 
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2, I3, I4, I5, I6); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
(I6 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR8 (O,I0,I1,I2,I3,I4,I5,I6,I7); 
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
(I6 => O) = 0:0:0, 0:0:0;
(I7 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
`celldefine 
 
module OBUF (O,I0); 
input I0; 
output O; 
supply0 GND; 
supply1 VCC; 
buf INS1 (O, I0); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
`celldefine 
 
module OR2 (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR3 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR4 (O,I0,I1,I2,I3); 
input I0,I1,I2,I3; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2, I3); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR5 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2, I3, I4); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR6 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2, I3, I4, I5); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR7 (O,I0,I1,I2,I3,I4,I5,I6); 
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2, I3, I4, I5, I6); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
(I6 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR8 (O,I0,I1,I2,I3,I4,I5,I6,I7); 
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
(I2 => O) = 0:0:0, 0:0:0;
(I3 => O) = 0:0:0, 0:0:0;
(I4 => O) = 0:0:0, 0:0:0;
(I5 => O) = 0:0:0, 0:0:0;
(I6 => O) = 0:0:0, 0:0:0;
(I7 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFF (Q,T,CLK); 
input T,CLK; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_DFF_X INS1 (Q_int, T_int,CLK, VCC, VCC, notifier); 
`else 
MACH_DFF INS4 (Q_int, T_int,CLK, VCC, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
xor INS2 (T_int,Q_reg,T);
buf INS3 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
$setup(T , posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, T , 0:0:0, notifier); 
$width(posedge CLK, 1:1:1, 0, notifier); 
$period(posedge CLK, 1:1:1, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFR (Q,T,CLK,R); 
input T,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_TFF_X INS1 (Q_int, CLK, T, VCC, R, notifier); 
`else 
MACH_TFF INS4 (Q_int, CLK, T, VCC, R, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
$width(negedge R, 1:1:1, 0, notifier); 
$setup(T  &&& (R), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, T  &&& (R), 0:0:0, notifier); 
$width(posedge CLK &&& (R), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (R), 1:1:1, notifier); 
$recovery(posedge R, posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, posedge R , 0:0:0, notifier ); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFRH (Q,T,CLK,R); 
input T,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_TFF_X INS1 (Q_int, CLK, T, VCC, R1, notifier); 
`else 
MACH_TFF INS5 (Q_int, CLK, T, VCC, R1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
$width(posedge R, 1:1:1, 0, notifier); 
$setup(T  &&& (R == 0), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, T  &&& (R == 0), 0:0:0, notifier); 
$width(posedge CLK &&& (R == 0), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (R == 0), 1:1:1, notifier); 
$recovery(negedge R, posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, negedge R , 0:0:0, notifier ); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFRS (Q,T,CLK,R,S); 
input T,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_TFF_X INS1 (Q_int, CLK, T, S, R, notifier); 
`else 
MACH_TFF INS4 (Q_int, CLK, T, S, R, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS5 (S_R, S, R); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(negedge R, 1:1:1, 0, notifier); 
$width(negedge S, 1:1:1, 0, notifier); 
$setup(T  &&& (S_R), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, T  &&& (S_R), 0:0:0, notifier); 
$width(posedge CLK &&& (S_R), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (S_R), 1:1:1, notifier); 
$recovery(posedge R &&& (S), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, posedge R  &&& (S), 0:0:0, notifier); 
$recovery(posedge S &&& (R), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, posedge S  &&& (R), 0:0:0, notifier); 
 
endspecify 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFRSH (Q,T,CLK,R,S); 
input T,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_TFF_X INS1 (Q_int, CLK, T, S1, R1, notifier); 
`else 
MACH_TFF INS2 (Q_int, CLK, T, S1, R1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS3 (Q, Q_reg); 
not INS5 (R1, R); 
not INS6 (S1, S); 
and INS7 (S_R, S1, R1); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(R => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(posedge R, 1:1:1, 0, notifier); 
$width(posedge S, 1:1:1, 0, notifier); 
$setup(T  &&& (S_R), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, T  &&& (S_R), 0:0:0, notifier); 
$width(posedge CLK &&& (S_R), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (S_R), 1:1:1, notifier); 
$recovery(negedge R &&& (S1), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, negedge R  &&& (S1), 0:0:0, notifier); 
$recovery(negedge S &&& (R1), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, negedge S  &&& (R1), 0:0:0, notifier); 
 
endspecify 
 
endmodule 
`endcelldefine 
 
`celldefine 
 
module TFFS (Q,T,CLK,S); 
input T,CLK,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_TFF_X INS1 (Q_int, CLK, T, S, VCC, notifier); 
`else 
MACH_TFF INS4 (Q_int, CLK, T, S, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(negedge S, 1:1:1, 0, notifier); 
$setup(T  &&& (S), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, T  &&& (S), 0:0:0, notifier); 
$width(posedge CLK &&& (S), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (S), 1:1:1, notifier); 
$recovery(posedge S, posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, posedge S , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFSH (Q,T,CLK,S); 
input T,CLK,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
MACH_TFF_X INS1 (Q_int, CLK, T, S1, VCC, notifier); 
`else 
MACH_TFF INS5 (Q_int, CLK, T, S1, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
 
specify 
 
(CLK => Q) = ( 0:0:0, 0:0:0);
(S => Q) = ( 0:0:0, 0:0:0);
$width(posedge S, 1:1:1, 0, notifier); 
$setup(T  &&& (S == 0), posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, T  &&& (S == 0), 0:0:0, notifier); 
$width(posedge CLK &&& (S == 0), 1:1:1, 0, notifier); 
$period(posedge CLK &&& (S == 0), 1:1:1, notifier); 
$recovery(negedge S, posedge CLK, 0.1:0.1:0.1, notifier); 
$hold(posedge CLK, negedge S , 0:0:0, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
`celldefine 
 
module XOR2 (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
xor INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module XORSOFT (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
xor INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) = 0:0:0, 0:0:0;
(I1 => O) = 0:0:0, 0:0:0;
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
primitive  MACH_DFF(Q,D,CLK,R,S,NOTIFIER);
output Q;
reg Q;
input CLK,
      D,
      R,S,
      NOTIFIER;

// FUNCTION : POSITIVE EDGE TRIGGERED D-FLIP FLOP WITH ACTIVE LOW 
//              ASYNCHRONOUS SET AND CLEAR
 table
//D      CLK     R   S   NOTIFIER      Q(t)    Q(t+1)
       
  1      (01)    1   ?      ?       :   ?   :   1;  // clocked data
  0      (01)    ?   1      ?       :   ?   :   0;  // clocked data

  1       ?      1   *      ?       :   1   :   1;  // pessimism
  ?       0      1   *      ?       :   1   :   1;  // pessimism
  ?       1      1   *      ?       :   1   :   1;  // pessimism
  1       ?      0   (10)      ?       :   0   :   x;  // pessimism
  ?       0      0   (10)      ?       :   0   :   x;  // pessimism
  ?       1      0   (10)      ?       :   0   :   x;  // pessimism

  0       ?      *   1      ?       :   0   :   0;  // pessimism
  ?       0      *   1      ?       :   0   :   0;  // pessimism
  ?       1      *   1      ?       :   0   :   0;  // pessimism
  0       ?      (10)   0      ?       :   1   :   x;  // pessimism
  ?       0      (10)   0      ?       :   1   :   x;  // pessimism
  ?       1      (10)   0      ?       :   1   :   x;  // pessimism

  1       p      1   1      ?       :   1   :   1;  // reducing pessimism
  0       p      1   1      ?       :   0   :   0;
 
  ?       ?      0   1      ?       :   ?   :   0;  // asynchronous clear
  ?       ?      1   0      ?       :   ?   :   1;  // asynchronous set

  ?      (?0)    ?   ?      ?       :   ?   :   -;  // ignore falling clock
  0      (?x)    ?   ?      ?       :   0   :   -;  // retain state when D == Qt
  1      (?x)    ?   ?      ?       :   1   :   -;  // retain state when D == Qt
  *       1      ?   ?      ?       :   ?   :   -;  // ignore data edges
  *       0      ?   ?      ?       :   ?   :   -;  // ignore data edges
  ?       ?      ?   ?      *       :   ?   :   -;
 
endtable
endprimitive
primitive  MACH_DFF_CE(Q,D,CLK,R,S,CE,NOTIFIER);
output Q;
reg Q;
input CLK,
      D,
      R,S,
      CE,  //clock enable active high
      NOTIFIER;

// FUNCTION : POSITIVE EDGE TRIGGERED D-FLIP FLOP WITH ACTIVE HIGH CLOCK ENABLE 
//              AND ACTIVE LOW ASYNCHRONOUS SET AND RESET

 table
//D      CLK     R   S   CE   NOTIFIER      Q(t)    Q(t+1)
       
  1      (01)    1   ?   1       ?       :   ?   :   1;  // clocked data
  0      (01)    ?   1   1       ?       :   ?   :   0;  // clocked data

  1       ?      1   *   1       ?       :   1   :   1;  // pessimism
  ?       0      1   *   1       ?       :   1   :   1;  // pessimism
  ?       1      1   *   1       ?       :   1   :   1;  // pessimism

  0       ?      *   1   1       ?       :   0   :   0;  // pessimism
  ?       0      *   1   1       ?       :   0   :   0;  // pessimism
  ?       1      *   1   1       ?       :   0   :   0;  // pessimism

  1       p      1   1   1       ?       :   1   :   1;  // reducing pessimism
  0       p      1   1   1       ?       :   0   :   0;
 
  ?       ?      0   1   ?       ?       :   ?   :   0;  // asynchronous clear
  ?       ?      1   0   ?       ?       :   ?   :   1;  // asynchronous set

  ?      (?0)    ?   ?   1       ?       :   ?   :   -;  // ignore falling clock
  0      (?x)    ?   ?   1       ?       :   0   :   -;  // retain state when D == Qt
  1      (?x)    ?   ?   1       ?       :   1   :   -;  // retain state when D == Qt
  *       1      ?   ?   1       ?       :   ?   :   -;  // ignore data edges
  *       0      ?   ?   1       ?       :   ?   :   -;  // ignore data edges
  ?       ?      1   1   0       ?       :   ?   :   -;
  ?	  ?      ?   ?   ?       *       :   ?   :   -;
  ?       ?      1   1   *       ?       :   ?   :   -; 
endtable
endprimitive
primitive  MACH_DFF_CE_X(Q,D,CLK,R,S,CE,NOTIFIER);
output Q;
reg Q;
input CLK, D, R,S, CE, NOTIFIER;  //clock enable active high

// FUNCTION : POSITIVE EDGE TRIGGERED D-FLIP FLOP WITH ACTIVE HIGH CLOCK ENABLE 
//              AND ACTIVE LOW ASYNCHRONOUS SET AND RESET

 table
//D      CLK     R   S   CE   NOTIFIER Q(t)    Q(t+1)
       
  1      (01)    1   ?   1      ?:   ?   :   1;  // clocked data
  0      (01)    ?   1   1      ?:   ?   :   0;  // clocked data

  1       ?      1   *   1      ?:   1   :   1;  // pessimism
  ?       0      1   *   1      ?:   1   :   1;  // pessimism
  ?       1      1   *   1      ?:   1   :   1;  // pessimism

  
  0       ?      *   1   1      ?:   0   :   0;  // pessimism
  ?       0      *   1   1      ?:   0   :   0;  // pessimism
  ?       1      *   1   1      ?:   0   :   0;  // pessimism

  1       p      1   1   1      ?:   1   :   1;  // reducing pessimism
  0       p      1   1   1      ?:   0   :   0;
 
  ?       ?      0   1   ?      ?:   ?   :   0;  // asynchronous clear
  ?       ?      1   0   ?      ?:   ?   :   1;  // asynchronous set

  ?      (?0)    ?   ?   1      ?:   ?   :   -;  // ignore falling clock
  0      (?x)    ?   ?   1      ?:   0   :   -;  // retain state when D == Qt
  1      (?x)    ?   ?   1      ?:   1   :   -;  // retain state when D == Qt
  *       1      ?   ?   1      ?:   ?   :   -;  // ignore data edges
  *       0      ?   ?   1      ?:   ?   :   -;  // ignore data edges
  ?       ?      1   1   0      ?:   ?   :   -;
  ?       ?      ?   ?   ?      *:   ?   :   x;
  ?       ?      1   1   *      ?:   ?   :   -; 
 
endtable
endprimitive
primitive  MACH_DFF_X (Q,D,CLK,R,S,NOTIFIER);
output Q;
reg Q;
input D, CLK, R,S, NOTIFIER;

// FUNCTION : POSITIVE EDGE TRIGGERED D-FLIP FLOP WITH ACTIVE LOW 
//              ASYNCHRONOUS SET AND CLEAR
 table
//D      CLK     R   S   NOTIFIER      Q(t)    Q(t+1)
       
  1      (01)    1   ?      ?       :   ?   :   1;  // clocked data
  0      (01)    ?   1      ?       :   ?   :   0;  // clocked data

  1       ?      1   *      ?       :   1   :   1;  // pessimism
  ?       0      1   *      ?       :   1   :   1;  // pessimism
  ?       1      1   *      ?       :   1   :   1;  // pessimism
  1       ?      0   *      ?       :   0   :   0;  // pessimism
  ?       0      0   *      ?       :   0   :   0;  // pessimism
  ?       1      0   *      ?       :   0   :   0;  // pessimism

  0       ?      *   1      ?       :   0   :   0;  // pessimism
  ?       0      *   1      ?       :   0   :   0;  // pessimism
  ?       1      *   1      ?       :   0   :   0;  // pessimism
  0       ?      *   0      ?       :   1   :   1;  // pessimism
  ?       0      *   0      ?       :   1   :   1;  // pessimism
  ?       1      *   0      ?       :   1   :   1;  // pessimism

  1       p      1   1      ?       :   1   :   1;  // reducing pessimism
  0       p      1   1      ?       :   0   :   0;
 
  ?       ?      0   1      ?       :   ?   :   0;  // asynchronous clear
  ?       ?      1   0      ?       :   ?   :   1;  // asynchronous set

  ?      (?0)    ?   ?      ?       :   ?   :   -;  // ignore falling clock
  0      (?x)    ?   ?      ?       :   0   :   -;  // retain state when D == Qt
  1      (?x)    ?   ?      ?       :   1   :   -;  // retain state when D == Qt
  *       1      ?   ?      ?       :   ?   :   -;  // ignore data edges
  *       0      ?   ?      ?       :   ?   :   -;  // ignore data edges
  ?       ?      ?   ?      *       :   ?   :   x;
 
endtable
endprimitive
primitive MACH_JKFF(Q,CLK,J,K,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      J,K,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;

 //POSITIVE EDGE TRIGGERED JK-FLIP FLOP WITH ACTIVE LOW ASYNCHRONOUS SET AND CLEAR

table

// CLK  J   K   S   R  NOTIFIER   Q(t)   Q(t+1) 
    ?   ?   ?   0   1     ?       : ? :    1;
    ?   ?   ?   *   1     ?       : 1 :    1; // Reset logic
    ?   ?   ?   1   0     ?       : ? :    0;
    ?   ?   ?   1   *     ?       : 0 :    0;
                                       // normal clocking cases
    r   0   0   1   1     ?       : ? :    -;
    r   0   1   1   1     ?       : ? :    0;
    r   1   0   1   1     ?       : ? :    1;
    r   1   1   1   1     ?       : 1 :    0;
    r   1   1   1   1     ?       : 0 :    1;
    f   ?   ?   ?   ?     ?       : ? :    - ;   
                                   // J K transition cases
    b   *   ?   ?   ?     ?       : ? :    -;
    b   ?   *   ?   ?     ?       : ? :    -;
                                    // cases reducing pessimism
    p   0   0   1   1     ?       : ? :    -;
    p   0   ?   1   ?     ?       : 0 :    -;
    p   ?   0   ?   1     ?       : 1 :    -;
   (x0) ?   ?   ?   ?     ?       : ? :    -;
   (1x) 0   0   1   1     ?       : ? :    -;
   (1x) 0   ?   1   ?     ?       : 0 :    -;
   (1x) ?   0   ?   1     ?       : 1 :    -;
     x  *   0   ?   1     ?       : 1 :    -;
     x  0   *   1   ?     ?       : 0 :    -;
     ?  ?   ?   ?   ?     *       : ? :    -;

endtable
endprimitive 
   
primitive MACH_JKFF_X(Q,CLK,J,K,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      J,K,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;

 //POSITIVE EDGE TRIGGERED JK-FLIP FLOP WITH ACTIVE LOW ASYNCHRONOUS SET AND CLEAR

table

// CLK  J   K   S   R  NOTIFIER   Q(t)   Q(t+1) 
    ?   ?   ?   0   1     ?       : ? :    1;
    ?   ?   ?   *   1     ?       : 1 :    1; // Reset logic
    ?   ?   ?   1   0     ?       : ? :    0;
    ?   ?   ?   1   *     ?       : 0 :    0;
                                       // normal clocking cases
    r   0   0   1   1     ?       : ? :    -;
    r   0   1   1   1     ?       : ? :    0;
    r   1   0   1   1     ?       : ? :    1;
    r   1   1   1   1     ?       : 1 :    0;
    r   1   1   1   1     ?       : 0 :    1;
    f   ?   ?   ?   ?     ?       : ? :    - ;   
                                   // J K transition cases
    b   *   ?   ?   ?     ?       : ? :    -;
    b   ?   *   ?   ?     ?       : ? :    -;
                                    // cases reducing pessimism
    p   0   0   1   1     ?       : ? :    -;
    p   0   ?   1   ?     ?       : 0 :    -;
    p   ?   0   ?   1     ?       : 1 :    -;
   (x0) ?   ?   ?   ?     ?       : ? :    -;
   (1x) 0   0   1   1     ?       : ? :    -;
   (1x) 0   ?   1   ?     ?       : 0 :    -;
   (1x) ?   0   ?   1     ?       : 1 :    -;
     x  *   0   ?   1     ?       : 1 :    -;
     x  0   *   1   ?     ?       : 0 :    -;
     ?  ?   ?   ?   ?     *       : ? :    x;  
endtable
endprimitive 
   
primitive MACH_LATCH(Q,D,LAT,R,S,NOTIFIER);
output Q;
reg Q;
input D,                                     // D input
      LAT,                                   //  Clock input
      R,S,                                   //   Active Low RESET and SET
      NOTIFIER;

// FUNCTION : POSITIVE LEVEL SENSITIVE D-TYPE LATCH WITH ACTIVE LOW ASYNCHRONOUS
//            RESET AND SET. (Q OUTPUT UDP)
table
//  D  LAT   R   S    NOTIFIER  :Q(t) :  Q(t+1)
    *   0    1   1      ?       :  ?  :  -  ;
    ?   ?    0   1      ?       :  ?  :  0  ;
    ?   ?    1   0      ?       :  ?  :  1  ;
    ?  (?0)  1   1      ?       :  ?  :  -  ;
    ?  (1x)  1   1      ?       :  ?  :  -  ;
    0  (x1)  ?   1      ?       :  ?  :  0  ;
    1  (x1)  1   ?      ?       :  ?  :  1  ;
    0  (0x)  1   1      ?       :  0  :  0  ;
    1  (0x)  1   1      ?       :  1  :  1  ;
  (?0)  1    ?   1      ?       :  ?  :  0  ;
  (?1)  1    1   ?      ?       :  ?  :  1  ;
    0  (01)  ?   1      ?       :  ?  :  0  ;
    1  (01)  1   ?      ?       :  ?  :  1  ;
    ?   0    1  (?1)    ?       :  ?  :  -  ; // ignore edge on SE
    ?   0   (?1) 1      ?       :  ?  :  -  ; // ignore edge on RE
    0   1    ?  (?1)    ?       :  ?  :  0  ;
    1   1   (?1) ?      ?       :  ?  :  1  ;
    1   1    1  (?1)    ?       :  ?  :  1  ;
    0   1   (?1) 1      ?       :  ?  :  0  ;
   (?1) x    1   ?      ?       :  1  :  1  ;
   (?0) x    ?   1      ?       :  0  :  0  ;
    ?   ?    ?   ?      *       :  ?  :  -  ;

endtable
 
endprimitive
primitive MACH_LATCH_X(Q,D,LAT,R,S,NOTIFIER);
output Q;
reg Q;
input D,                                     // D input
      LAT,                                   //  Clock input
      R,S,                                   //   Active Low RESET and SET
      NOTIFIER;

// FUNCTION : POSITIVE LEVEL SENSITIVE D-TYPE LATCH WITH ACTIVE LOW ASYNCHRONOUS
//            RESET AND SET. (Q OUTPUT UDP)
table
//  D  LAT   R   S    NOTIFIER  :Q(t) :  Q(t+1)
    *   0    1   1      ?       :  ?  :  -  ;
    ?   ?    0   1      ?       :  ?  :  0  ;
    ?   ?    1   0      ?       :  ?  :  1  ;
    ?  (?0)  1   1      ?       :  ?  :  -  ;
    ?  (1x)  1   1      ?       :  ?  :  -  ;
    0  (x1)  ?   1      ?       :  ?  :  0  ;
    1  (x1)  1   ?      ?       :  ?  :  1  ;
    0  (0x)  1   1      ?       :  0  :  0  ;
    1  (0x)  1   1      ?       :  1  :  1  ;
  (?0)  1    ?   1      ?       :  ?  :  0  ;
  (?1)  1    1   ?      ?       :  ?  :  1  ;
    0  (01)  ?   1      ?       :  ?  :  0  ;
    1  (01)  1   ?      ?       :  ?  :  1  ;
    ?   0    1  (?1)    ?       :  ?  :  -  ; // ignore edge on SE
    ?   0   (?1) 1      ?       :  ?  :  -  ; // ignore edge on RE
    0   1    ?  (?1)    ?       :  ?  :  0  ;
    1   1   (?1) ?      ?       :  ?  :  1  ;
    1   1    1  (?1)    ?       :  ?  :  1  ;
    0   1   (?1) 1      ?       :  ?  :  0  ;
   (?1) x    1   ?      ?       :  1  :  1  ;
   (?0) x    ?   1      ?       :  0  :  0  ;
    ?   ?    ?   ?      *       :  ?  :  x  ;
endtable
 
endprimitive
primitive MACH_RSFF(Q,CLK,RE,SE,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      RE,SE,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;

 //POSITIVE EDGE TRIGGERED SR-FLIP FLOP WITH ACTIVE LOW ASYNCHRONOUS SET AND CLEAR

table

// CLK  RE  SE  S   R  NOTIFIER   Q(t)   Q(t+1) 
                                         // Set logic
    ?   ?   ?   0   1     ?       : ? :    1;
    ?   ?   ?   *   1     ?       : 1 :    1;
                                        // Reset logic
    ?   ?   ?   1   0     ?       : ? :    0;
    ?   ?   ?   1   *     ?       : 0 :    0;
                                       // normal clocking cases
    r   0   0   1   1     ?       : ? :    -;
    r   0   1   1   1     ?       : ? :    1;
    r   1   0   1   1     ?       : ? :    0;
    f   ?   ?   ?   ?     ?       : ? :    - ;   
                                   // S R transition cases

                                    // cases reducing pessimism
    p   0   0   1   1     ?       : ? :    -;
    p   1   1   1   ?     ?       : 0 :    x;
//  p   ?   1   ?   1     ?       : 1 :    x;
   (x0) ?   ?   ?   ?     ?       : ? :    -;
   (1x) 0   0   1   1     ?       : ? :    -;
   (1x) 0   ?   1   ?     ?       : 0 :    -;
   (1x) ?   0   ?   1     ?       : 1 :    -;
     x  *   0   ?   1     ?       : 1 :    -;
     x  0   *   1   ?     ?       : 0 :    -;
     ?  ?   ?   ?   ?     *	  : ? :    -;
     ?  *   ?   1   1     ?       : ? :    -;
     ?  ?   *   1   1     ?       : ? :    -;

endtable
endprimitive 
primitive MACH_RSFF_X(Q,CLK,RE,SE,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      RE,SE,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;

 //POSITIVE EDGE TRIGGERED SR-FLIP FLOP WITH ACTIVE LOW ASYNCHRONOUS SET AND CLEAR

table

// CLK  RE  SE  S   R  NOTIFIER   Q(t)   Q(t+1) 
                                         // Set logic
    ?   ?   ?   0   1     ?       : ? :    1;
//  ?   ?   ? (?1)   1     ?      : ? :    -;
    ?   1   1 (?1)   1     ?      : ? :    x;
//  ?   ?   ?   *   1     ?       : 1 :    1;
                                        // Reset logic
    ?   ?   ?   1   0     ?       : ? :    0;
//  ?   ?   ?   1   *     ?       : 0 :    0;
//  ?   ?   ?   1 (?1)    ?       : ? :    -;
    ?   1   1   1 (?1)    ?       : ? :    x;
                                       // normal clocking cases
    r   0   0   1   1     ?       : ? :    -;
    r   0   1   1   1     ?       : ? :    1;
    r   1   0   1   1     ?       : ? :    0;
    f   ?   ?   ?   ?     ?       : ? :    - ;   
                                   // S R transition cases
                                    // cases reducing pessimism
    p   0   0   1   1     ?       : ? :    -;
    p   1   1   1   ?     ?       : 0 :    x;
//  p   ?   1   ?   1     ?       : 1 :    -;
   (x0) ?   ?   ?   ?     ?       : ? :    -;
   (1x) 0   0   1   1     ?       : ? :    -;
   (1x) 0   ?   1   ?     ?       : 0 :    -;
   (1x) ?   0   ?   1     ?       : 1 :    -;
     x  *   0   ?   1     ?       : 1 :    -;
     x  0   *   1   ?     ?       : 0 :    -;
     ?  ?   ?   ?   ?     *       : ? :    x;
     ?  *   ?   1   1     ?       : ? :    -;
     ?  ?   *   1   1     ?       : ? :    -;
endtable
endprimitive 
primitive MACH_TFF(Q,CLK,T,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      T,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;


table

// CLK  T      S   R  NOTIFIER   Q(t)   Q(t+1) 
                                         // Set logic
    ?   ?      0   1     ?       : ? :    1;
    ?   ?      *   1     ?       : 1 :    1;
                                        // Reset logic
    ?   ?      1   0     ?       : ? :    0;
    ?   ?      1   *     ?       : 0 :    0;
                                       // normal clocking cases
    r   0      1   1     ?       : ? :    -;
    r   1      1   1     ?       : 1 :    0;
    r   1      1   1     ?       : 0 :    1;
    f   ?      ?   ?     ?       : ? :    - ;   
                                   // T  transition cases
    b   *      ?   ?     ?       : ? :    -;
                                    // cases reducing pessimism
    p   0      1   1     ?       : ? :    -;
    p   0      1   ?     ?       : 0 :    -;
    p   0      ?   1     ?       : 1 :    -;
   (x0) ?      ?   ?     ?       : ? :    -;
   (1x) 0      1   1     ?       : ? :    -;
   (1x) ?      ?   1     ?       : 1 :    -;
     x  0      1   ?     ?       : 0 :    -;
     ?  ?      ?   ?     *       : ? :    -;

endtable
endprimitive 
primitive MACH_TFF_X(Q,CLK,T,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      T,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;


table

// CLK  T      S   R  NOTIFIER   Q(t)   Q(t+1) 
                                         // Set logic
    ?   ?      0   1     ?       : ? :    1;
    ?   ?      *   1     ?       : 1 :    1;
                                        // Reset logic
    ?   ?      1   0     ?       : ? :    0;
    ?   ?      1   *     ?       : 0 :    0;
                                       // normal clocking cases
    r   0      1   1     ?       : ? :    -;
    r   1      1   1     ?       : 1 :    0;
    r   1      1   1     ?       : 0 :    1;
    f   ?      ?   ?     ?       : ? :    - ;   
                                   // T  transition cases
    b   *      ?   ?     ?       : ? :    -;
                                    // cases reducing pessimism
    p   0      1   1     ?       : ? :    -;
    p   0      1   ?     ?       : 0 :    -;
    p   0      ?   1     ?       : 1 :    -;
   (x0) ?      ?   ?     ?       : ? :    -;
   (1x) 0      1   1     ?       : ? :    -;
   (1x) ?      ?   1     ?       : 1 :    -;
     x  0      1   ?     ?       : 0 :    -;
     ?  ?      ?   ?     *       : ? :    x;
endtable
endprimitive 
