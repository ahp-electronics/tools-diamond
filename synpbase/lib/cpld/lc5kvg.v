module MUX2(O,I0,I1,S0);   // synthesis syn_black_box
input I0,I1,S0;
output O;
endmodule
module MUX4(O,I0,I1,I2,I3,S0,S1);   // synthesis syn_black_box
input I0,I1,I2,I3,S0,S1;
output O;
endmodule
module AND2 (O,I0,I1);    // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule
module AND3 (O,I0,I1,I2);    // synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule
module AND4 (O,I0,I1,I2,I3);    // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule
module AND5 (O,I0,I1,I2,I3,I4);    // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule
module AND6 (O,I0,I1,I2,I3,I4,I5);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule
module AND7 (O,I0,I1,I2,I3,I4,I5,I6);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule
module AND8 (O,I0,I1,I2,I3,I4,I5,I6,I7);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
endmodule
module BI_DIR (O,I0,IO,OE);    // synthesis syn_black_box black_box_pad_pin="IO"
input I0,OE; 
inout IO; 
output O; 
endmodule
module BUFF (O,I0);    // synthesis syn_black_box
input I0; 
output O; 
endmodule
module BUFTH (O,I0,OE);    // synthesis syn_black_box black_box_pad_pin="O"
input I0,OE; 
output O; 
endmodule
module BUFTI (O,I0,OE);     // synthesis syn_black_box black_box_pad_pin="O"
input I0,OE; 
output O; 
endmodule
module BUFTL (O,I0,OE);     // synthesis syn_black_box black_box_pad_pin="O"
input I0,OE; 
output O; 
endmodule
module CLKI(O,PAD);     // synthesis syn_black_box black_box_pad_pin="PAD"
input PAD; 
output O; 
endmodule
module DFF (Q,D,CLK);    // synthesis syn_black_box
input D,CLK; 
output Q; 
endmodule
module DFFC (Q,D,CLK,CE);    // synthesis syn_black_box
input D,CLK,CE; 
output Q; 
endmodule
module DFFCR (Q,D,CLK,CE,R);    // synthesis syn_black_box
input D,CLK,CE,R; 
output Q; 
endmodule
module DFFCRH (Q,D,CLK,CE,R);    // synthesis syn_black_box
input D,CLK,CE,R; 
output Q; 
endmodule
module DFFCRS (Q,D,CLK,CE,R,S);    // synthesis syn_black_box
input D,CLK,CE,R,S; 
output Q; 
endmodule
module DFFCRSH (Q,D,CLK,CE,R,S);    // synthesis syn_black_box
input D,CLK,CE,R,S; 
output Q; 
endmodule
module DFFCS (Q,D,CLK,CE,S);    // synthesis syn_black_box
input D,CLK,CE,S; 
output Q; 
endmodule
module DFFCSH (Q,D,CLK,CE,S);    // synthesis syn_black_box
input D,CLK,CE,S; 
output Q; 
endmodule
module DFFR (Q,D,CLK,R);    // synthesis syn_black_box
input D,CLK,R; 
output Q; 
endmodule
module DFFRH (Q,D,CLK,R);    // synthesis syn_black_box
input D,CLK,R; 
output Q; 
endmodule
module DFFRS (Q,D,CLK,R,S);    // synthesis syn_black_box
input D,CLK,R,S; 
output Q; 
endmodule
module DFFRSH (Q,D,CLK,R,S);    // synthesis syn_black_box
input D,CLK,R,S; 
output Q; 
endmodule
module DFFS (Q,D,CLK,S);    // synthesis syn_black_box
input D,CLK,S; 
output Q;
endmodule
module DFFSH (Q,D,CLK,S);    // synthesis syn_black_box
input D,CLK,S; 
output Q; 
endmodule
module DLAT (Q,D,LAT);    // synthesis syn_black_box
input D,LAT; 
output Q; 
endmodule
module DLATR (Q,D,LAT,R);    // synthesis syn_black_box
input D,LAT,R; 
output Q; 
endmodule 
module DLATRH (Q,D,LAT,R);    // synthesis syn_black_box
input D,LAT,R; 
output Q; 
endmodule 
module DLATRS (Q,D,LAT,R,S);    // synthesis syn_black_box
input D,LAT,R,S; 
output Q; 
endmodule 
module DLATRSH (Q,D,LAT,R,S);    // synthesis syn_black_box
input D,LAT,R,S; 
output Q; 
endmodule 
module DLATS (Q,D,LAT,S);    // synthesis syn_black_box
input D,LAT,S; 
output Q; 
endmodule 
module DLATSH (Q,D,LAT,S);    // synthesis syn_black_box
input D,LAT,S; 
output Q; 
endmodule 
module VCC (X);   // synthesis syn_black_box
output X; 
endmodule 
module GND (X);    // synthesis syn_black_box
output X; 
endmodule 
module GSRBUF (O,SRI);     // synthesis syn_black_box black_box_pad_pin="SRI"
input SRI; 
output O; 
endmodule 
module IBUF (O,I0);     // synthesis syn_black_box black_box_pad_pin="I0"
input I0; 
output O; 
endmodule 
module INV (O,I0);    // synthesis syn_black_box
input I0; 
output O; 
endmodule 
module INVTH (O,I0,OE);     // synthesis syn_black_box black_box_pad_pin="O"
input I0,OE; 
output O; 
endmodule 
module LVPECLIN (O,P_IN,N_IN);     // synthesis syn_black_box black_box_pad_pin="P_IN,N_IN"
input P_IN,N_IN; 
output O; 
endmodule 
module LVPECLOUT (P_OUT,N_OUT,I);     // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I; 
output P_OUT,N_OUT; 
endmodule 
module LVPECLTRI (N_OUT,P_OUT,I,OE);      // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I,OE; 
output N_OUT, P_OUT; 
endmodule 
module INVTL (O,I0,OE);      // synthesis syn_black_box black_box_pad_pin="O"
input I0,OE; 
output O; 
endmodule 
module NAN2 (O,I0,I1);    // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module NAN3 (O,I0,I1,I2);    // synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule 
module NAN4 (O,I0,I1,I2,I3);    // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule 
module NAN5 (O,I0,I1,I2,I3,I4);    // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule 
module NAN6 (O,I0,I1,I2,I3,I4,I5);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule 
module NAN7 (O,I0,I1,I2,I3,I4,I5,I6);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule 
module NAN8 (O,I0,I1,I2,I3,I4,I5,I6,I7);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
endmodule 
module NOR2 (O,I0,I1);    // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module NOR3 (O,I0,I1,I2);    // synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule 
module NOR4 (O,I0,I1,I2,I3);    // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule 
module NOR5 (O,I0,I1,I2,I3,I4);    // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule 
module NOR6 (O,I0,I1,I2,I3,I4,I5);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule 
module NOR7 (O,I0,I1,I2,I3,I4,I5,I6);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule 
module NOR8 (O,I0,I1,I2,I3,I4,I5,I6,I7);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
endmodule 
module OBUF (O,I0);      // synthesis syn_black_box black_box_pad_pin="O"
input I0; 
output O; 
endmodule 
module OR2 (O,I0,I1);    // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module OR3 (O,I0,I1,I2);    // synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule 
module OR4 (O,I0,I1,I2,I3);    // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule 
module OR5 (O,I0,I1,I2,I3,I4);    // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule 
module OR6 (O,I0,I1,I2,I3,I4,I5);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule 
module OR7 (O,I0,I1,I2,I3,I4,I5,I6);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule 
module OR8 (O,I0,I1,I2,I3,I4,I5,I6,I7);    // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
endmodule 
module TFF (Q,T,CLK);    // synthesis syn_black_box
input T,CLK; 
output Q; 
endmodule 
module TFFR (Q,T,CLK,R);    // synthesis syn_black_box
input T,CLK,R; 
output Q; 
endmodule 
module TFFRH (Q,T,CLK,R);    // synthesis syn_black_box
input T,CLK,R; 
output Q; 
endmodule 
module TFFRS (Q,T,CLK,R,S);    // synthesis syn_black_box
input T,CLK,R,S; 
output Q; 
endmodule 
module TFFRSH (Q,T,CLK,R,S);    // synthesis syn_black_box
input T,CLK,R,S; 
output Q; 
endmodule 
module TFFS (Q,T,CLK,S);    // synthesis syn_black_box
input T,CLK,S; 
output Q; 
endmodule 
module TFFSH (Q,T,CLK,S);    // synthesis syn_black_box
input T,CLK,S; 
output Q; 
endmodule 
module XOR2 (O,I0,I1);    // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module XORSOFT (O,I0,I1);    // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
//PLL BLOCK cells
//SPLL Software Usage Model 7.09 -QQ
module SPLL(CLK_IN, CLK_OUT);     // synthesis syn_black_box black_box_pad_pin="CLK_IN"
parameter in_freq = "1";
parameter clk_out_to_pin =  "OFF";
parameter wake_on_lock = "OFF";
input  CLK_IN;
output CLK_OUT;
endmodule
//STDPLL Software Usage Model 7.09 -QQ
module STDPLL(CLK_IN, PLL_LOCK, CLK_OUT);    // synthesis syn_black_box black_box_pad_pin="CLK_IN"
parameter in_freq = "1";
parameter mult = "1";
parameter div = "1";
parameter post = "1";
parameter pll_dly = "1";
parameter clk_out_to_pin = "OFF";
parameter wake_on_lock = "OFF";
input  CLK_IN;
output CLK_OUT;
output PLL_LOCK;
endmodule
//STDPLLX Software Usage Model 7.09 -QQ
module STDPLLX(CLK_IN, PLL_FBK, PLL_RST, PLL_LOCK, SEC_OUT, CLK_OUT);    // synthesis syn_black_box black_box_pad_pin="CLK_IN"
parameter in_freq = "1";
parameter mult = "1";
parameter div = "1";
parameter post = "1";
parameter pll_dly = "1";
parameter secdiv = "1";
parameter clk_out_to_pin = "ON";
parameter wake_on_lock = "OFF";
input  CLK_IN;	
input  PLL_FBK;		 
input  PLL_RST;		
output CLK_OUT;
output PLL_LOCK;
output SEC_OUT;
endmodule
//LVDS BLOCK cells
module LVDSIN (O, P_IN,N_IN);     // synthesis syn_black_box black_box_pad_pin="P_IN,N_IN"
input P_IN,N_IN; 
output O; 
endmodule 
module LVDSOUT (P_OUT,N_OUT, I); // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I; 
output P_OUT,N_OUT; 
endmodule 
module LVDSTRI (P_OUT,N_OUT, I,OE); // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I,OE; 
output P_OUT,N_OUT; 
endmodule 
module LVDSIO (O, P_IO, N_IO, I, OE); // synthesis syn_black_box black_box_pad_pin="P_IO,N_IO"
input I,OE; 
inout P_IO,N_IO; 
output O;
endmodule 
module BLVDSIN (O, P_IN,N_IN); // synthesis syn_black_box black_box_pad_pin="P_IN,N_IN"
input P_IN,N_IN; 
output O; 
endmodule 
module BLVDSOUT (P_OUT,N_OUT, I); // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I; 
output P_OUT,N_OUT; 
endmodule 
module BLVDSTRI (P_OUT,N_OUT, I,OE); // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I,OE; 
output P_OUT,N_OUT; 
endmodule 
module BLVDSIO (O, P_IO, N_IO, I, OE); // synthesis syn_black_box black_box_pad_pin="P_IO,N_IO"
input I,OE; 
inout P_IO,N_IO; 
output O;
endmodule 
