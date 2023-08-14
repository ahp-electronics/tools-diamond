module MUX2(O,I0,I1,S0);  // synthesis syn_black_box
input I0,I1,S0;
output O;
endmodule
module MUX4(O,I0,I1,I2,I3,S0,S1);  // synthesis syn_black_box
input I0,I1,I2,I3,S0,S1;
output O;
endmodule
module AND2 (O,I0,I1);   // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule
module AND3 (O,I0,I1,I2);   // synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule
module AND4 (O,I0,I1,I2,I3);   // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule
module AND5 (O,I0,I1,I2,I3,I4);   // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule
module AND6 (O,I0,I1,I2,I3,I4,I5);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule
module AND7 (O,I0,I1,I2,I3,I4,I5,I6);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule
module AND8 (O,I0,I1,I2,I3,I4,I5,I6,I7);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
endmodule
module BI_DIR (O,I0,IO,OE);  // synthesis syn_black_box black_box_pad_pin="IO"
input I0,OE; 
inout IO; 
output O; 
endmodule
module BUFF (O,I0);   // synthesis syn_black_box 
input I0; 
output O; 
endmodule
module BUFTH (O,I0,OE);   // synthesis syn_black_box black_box_pad_pin="O"
input I0,OE; 
output O; 
endmodule
module BUFTI (O,I0,OE);  // synthesis syn_black_box black_box_pad_pin="O" 
input I0,OE; 
output O; 
endmodule
module BUFTL (O,I0,OE);   // synthesis syn_black_box black_box_pad_pin="O"
input I0,OE; 
output O; 
endmodule
module CLKI(O,PAD);   // synthesis syn_black_box black_box_pad_pin="PAD"
input PAD; 
output O; 
endmodule
module DFF (Q,D,CLK);   // synthesis syn_black_box
input D,CLK; 
output Q; 
endmodule
module DFFC (Q,D,CLK,CE);   // synthesis syn_black_box
input D,CLK,CE; 
output Q; 
endmodule
module DFFCR (Q,D,CLK,CE,R);   // synthesis syn_black_box
input D,CLK,CE,R; 
output Q; 
endmodule
module DFFCRH (Q,D,CLK,CE,R);   // synthesis syn_black_box
input D,CLK,CE,R; 
output Q; 
endmodule
module DFFCRS (Q,D,CLK,CE,R,S);   // synthesis syn_black_box
input D,CLK,CE,R,S; 
output Q; 
endmodule
module DFFCRSH (Q,D,CLK,CE,R,S);   // synthesis syn_black_box
input D,CLK,CE,R,S; 
output Q; 
endmodule
module DFFCS (Q,D,CLK,CE,S);   // synthesis syn_black_box
input D,CLK,CE,S; 
output Q; 
endmodule
module DFFCSH (Q,D,CLK,CE,S);   // synthesis syn_black_box
input D,CLK,CE,S; 
output Q; 
endmodule
module DFFR (Q,D,CLK,R);   // synthesis syn_black_box
input D,CLK,R; 
output Q; 
endmodule
module DFFRH (Q,D,CLK,R);   // synthesis syn_black_box
input D,CLK,R; 
output Q; 
endmodule
module DFFRS (Q,D,CLK,R,S);   // synthesis syn_black_box
input D,CLK,R,S; 
output Q; 
endmodule
module DFFRSH (Q,D,CLK,R,S);   // synthesis syn_black_box
input D,CLK,R,S; 
output Q; 
endmodule
module DFFS (Q,D,CLK,S);   // synthesis syn_black_box
input D,CLK,S; 
output Q;
endmodule
module DFFSH (Q,D,CLK,S);   // synthesis syn_black_box
input D,CLK,S; 
output Q; 
endmodule
module DLAT (Q,D,LAT);   // synthesis syn_black_box
input D,LAT; 
output Q; 
endmodule
module DLATR (Q,D,LAT,R);   // synthesis syn_black_box
input D,LAT,R; 
output Q; 
endmodule 
module DLATRH (Q,D,LAT,R);   // synthesis syn_black_box
input D,LAT,R; 
output Q; 
endmodule 
module DLATRS (Q,D,LAT,R,S);   // synthesis syn_black_box
input D,LAT,R,S; 
output Q; 
endmodule 
module DLATRSH (Q,D,LAT,R,S);   // synthesis syn_black_box
input D,LAT,R,S; 
output Q; 
endmodule 
module DLATS (Q,D,LAT,S);   // synthesis syn_black_box
input D,LAT,S; 
output Q; 
endmodule 
module DLATSH (Q,D,LAT,S);   // synthesis syn_black_box
input D,LAT,S; 
output Q; 
endmodule 
module VCC (X);  // synthesis syn_black_box
output X; 
endmodule 
module GND (X);   // synthesis syn_black_box
output X; 
endmodule 
module GSRBUF (O,SRI);   // synthesis syn_black_box black_box_pad_pin="SRI"
input SRI; 
output O; 
endmodule 
module IBUF (O,I0);   // synthesis syn_black_box black_box_pad_pin="I0"
input I0; 
output O; 
endmodule 
module INV (O,I0);   // synthesis syn_black_box
input I0; 
output O; 
endmodule 
module INVTH (O,I0,OE);   // synthesis syn_black_box black_box_pad_pin="O"
input I0,OE; 
output O; 
endmodule 
module LVPECLIN (O,P_IN,N_IN);   // synthesis syn_black_box black_box_pad_pin="P_IN,N_IN"
input P_IN,N_IN; 
output O; 
endmodule 
module LVPECLOUT (P_OUT,N_OUT,I);    // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I; 
output P_OUT,N_OUT; 
endmodule 
module LVPECLTRI (N_OUT,P_OUT,I,OE);    // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I,OE; 
output N_OUT, P_OUT; 
endmodule 
module INVTL (O,I0,OE);    // synthesis syn_black_box black_box_pad_pin="O"
input I0,OE; 
output O; 
endmodule 
module NAN2 (O,I0,I1);   // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module NAN3 (O,I0,I1,I2);   // synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule 
module NAN4 (O,I0,I1,I2,I3);   // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule 
module NAN5 (O,I0,I1,I2,I3,I4);   // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule 
module NAN6 (O,I0,I1,I2,I3,I4,I5);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule 
module NAN7 (O,I0,I1,I2,I3,I4,I5,I6);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule 
module NAN8 (O,I0,I1,I2,I3,I4,I5,I6,I7);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
endmodule 
module NOR2 (O,I0,I1);   // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module NOR3 (O,I0,I1,I2);   // synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule 
module NOR4 (O,I0,I1,I2,I3);   // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule 
module NOR5 (O,I0,I1,I2,I3,I4);   // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule 
module NOR6 (O,I0,I1,I2,I3,I4,I5);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule 
module NOR7 (O,I0,I1,I2,I3,I4,I5,I6);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule 
module NOR8 (O,I0,I1,I2,I3,I4,I5,I6,I7);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
endmodule 
module OBUF (O,I0);    // synthesis syn_black_box black_box_pad_pin="O"
input I0; 
output O; 
endmodule 
module OR2 (O,I0,I1);   // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module OR3 (O,I0,I1,I2);   // synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule 
module OR4 (O,I0,I1,I2,I3);   // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule 
module OR5 (O,I0,I1,I2,I3,I4);   // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule 
module OR6 (O,I0,I1,I2,I3,I4,I5);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule 
module OR7 (O,I0,I1,I2,I3,I4,I5,I6);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule 
module OR8 (O,I0,I1,I2,I3,I4,I5,I6,I7);   // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
endmodule 
module TFF (Q,T,CLK);   // synthesis syn_black_box
input T,CLK; 
output Q; 
endmodule 
module TFFR (Q,T,CLK,R);   // synthesis syn_black_box
input T,CLK,R; 
output Q; 
endmodule 
module TFFRH (Q,T,CLK,R);   // synthesis syn_black_box
input T,CLK,R; 
output Q; 
endmodule 
module TFFRS (Q,T,CLK,R,S);   // synthesis syn_black_box
input T,CLK,R,S; 
output Q; 
endmodule 
module TFFRSH (Q,T,CLK,R,S);   // synthesis syn_black_box
input T,CLK,R,S; 
output Q; 
endmodule 
module TFFS (Q,T,CLK,S);   // synthesis syn_black_box
input T,CLK,S; 
output Q; 
endmodule 
module TFFSH (Q,T,CLK,S);   // synthesis syn_black_box
input T,CLK,S; 
output Q; 
endmodule 
module XOR2 (O,I0,I1);   // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module XORSOFT (O,I0,I1);   // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
//PLL BLOCK cells
//SPLL Software Usage Model 7.09 -QQ
module SPLL(CLK_IN, CLK_OUT);    // synthesis syn_black_box black_box_pad_pin="CLK_IN"
parameter in_freq = "1";
parameter clk_out_to_pin =  "OFF";
parameter wake_on_lock = "OFF";
input  CLK_IN;
output CLK_OUT;
endmodule
//STDPLL Software Usage Model 7.09 -QQ
module STDPLL(CLK_IN, PLL_LOCK, CLK_OUT);   // synthesis syn_black_box black_box_pad_pin="CLK_IN"
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
module STDPLLX(CLK_IN, PLL_FBK, PLL_RST, PLL_LOCK, SEC_OUT, CLK_OUT);   // synthesis syn_black_box black_box_pad_pin="CLK_IN"
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
//
//HSI BLOCK cells
//
module RX_SS_4(SIN, SS_CLKIN, RXD0, RXD1, RXD2, RXD3, RECCLK, CSLOCK);// synthesis syn_black_box
parameter   in_freq    = "100.0";
input SIN;
input SS_CLKIN;
output RXD0;
output RXD1;
output RXD2;
output RXD3;
output RECCLK;
output CSLOCK;
endmodule 
module RX_SS_6(SIN, SS_CLKIN, RXD0, RXD1, RXD2, RXD3, RXD4, RXD5, RECCLK, CSLOCK);// synthesis syn_black_box
parameter   in_freq    = "100.0";
input SIN;
input SS_CLKIN;
output RXD0;
output RXD1;
output RXD2;
output RXD3;
output RXD4;
output RXD5;
output RECCLK;
output CSLOCK;
endmodule 
module RX_SS_8(SIN, SS_CLKIN, RXD0, RXD1, RXD2, RXD3, RXD4, RXD5, RXD6, RXD7, RECCLK, CSLOCK);// synthesis syn_black_box
parameter   in_freq    = "100.0";
input SIN;
input SS_CLKIN;
output RXD0;
output RXD1;
output RXD2;
output RXD3;
output RXD4;
output RXD5;
output RXD6;
output RXD7;
output RECCLK;
output CSLOCK;
endmodule 
module CDRX_SS_4(SIN, SS_CLKIN, CAL, RXD0, RXD1, RXD2, RXD3, RECCLK, CSLOCK, SYDT);// synthesis syn_black_box
parameter   in_freq    = "100.0";
parameter   sympat     = "00110011001111111111";
input SIN;
input SS_CLKIN;
input CAL;
output RXD0;
output RXD1;
output RXD2;
output RXD3;
output RECCLK;
output CSLOCK;
output SYDT;
endmodule 
module CDRX_SS_6(SIN, SS_CLKIN, CAL, RXD0, RXD1, RXD2, RXD3, RXD4, RXD5, RECCLK, CSLOCK, SYDT);// synthesis syn_black_box
parameter   in_freq    = "100.0";
parameter   sympat     = "00011100011111111111";
input SIN;
input SS_CLKIN;
input CAL;
output RXD0;
output RXD1;
output RXD2;
output RXD3;
output RXD4;
output RXD5;
output RECCLK;
output CSLOCK;
output SYDT;
endmodule 
module CDRX_SS_8(SIN, SS_CLKIN, CAL, RXD0, RXD1, RXD2, RXD3, RXD4, RXD5, RXD6, RXD7, RECCLK, CSLOCK, SYDT);// synthesis syn_black_box
parameter   in_freq    = "100.0";
parameter   sympat     = "00001111000011111111";
input SIN;
input SS_CLKIN;
input CAL;
output RXD0;
output RXD1;
output RXD2;
output RXD3;
output RXD4;
output RXD5;
output RXD6;
output RXD7;
output RECCLK;
output CSLOCK;
output SYDT;
endmodule 
module CDRX_SS_10(SIN, SS_CLKIN, CAL, RXD0, RXD1, RXD2, RXD3, RXD4, RXD5, RXD6, RXD7, RXD8, RXD9, RECCLK, CSLOCK, SYDT);// synthesis syn_black_box
parameter   in_freq    = "100.0";
parameter   sympat     = "00001111000011111111";
input SIN;
input SS_CLKIN;
input CAL;
output RXD0;
output RXD1;
output RXD2;
output RXD3;
output RXD4;
output RXD5;
output RXD6;
output RXD7;
output RXD8;
output RXD9;
output RECCLK;
output CSLOCK;
output SYDT;
endmodule 
module TX_SS_4(TXD0, TXD1, TXD2, TXD3, REFCLK, SOUT, SS_CLKOUT, CSLOCK);// synthesis syn_black_box
parameter   in_freq    = "100.0";
input TXD0;
input TXD1;
input TXD2;
input TXD3;
input REFCLK;
output SOUT;
output SS_CLKOUT;
output CSLOCK;
endmodule 
module TX_SS_6(TXD0, TXD1, TXD2, TXD3, TXD4, TXD5, REFCLK, SOUT, SS_CLKOUT, CSLOCK);// synthesis syn_black_box
parameter   in_freq    = "100.0";
input TXD0;
input TXD1;
input TXD2;
input TXD3;
input TXD4;
input TXD5;
input REFCLK;
output SOUT;
output SS_CLKOUT;
output CSLOCK;
endmodule 
module TX_SS_8(TXD0, TXD1, TXD2, TXD3, TXD4, TXD5, TXD6, TXD7, REFCLK, SOUT, SS_CLKOUT, CSLOCK);// synthesis syn_black_box
parameter   in_freq    = "100.0";
input TXD0;
input TXD1;
input TXD2;
input TXD3;
input TXD4;
input TXD5;
input TXD6;
input TXD7;
input REFCLK;
output SOUT;
output SS_CLKOUT;
output CSLOCK;
endmodule 
module TX_SS_10(TXD0, TXD1, TXD2, TXD3, TXD4, TXD5, TXD6, TXD7, TXD8, TXD9, REFCLK, SOUT, SS_CLKOUT, CSLOCK);// synthesis syn_black_box
parameter   in_freq    = "100.0";
input TXD0;
input TXD1;
input TXD2;
input TXD3;
input TXD4;
input TXD5;
input TXD6;
input TXD7;
input TXD8;
input TXD9;
input REFCLK;
output SOUT;
output SS_CLKOUT;
output CSLOCK;
endmodule 
module CDRX_8B10B(SIN, REFCLK, CDRRST, RXD0, RXD1, RXD2, RXD3, RXD4, RXD5, RXD6, RXD7, RXD8, RXD9, RECCLK, CSLOCK, SYDT);// synthesis syn_black_box
parameter   in_freq    = "100.0";
parameter   sympat     = "01011111001010000011";
input SIN;
input REFCLK;
input CDRRST;
output RXD0;
output RXD1;
output RXD2;
output RXD3;
output RXD4;
output RXD5;
output RXD6;
output RXD7;
output RXD8;
output RXD9;
output RECCLK;
output CSLOCK;
output SYDT;
endmodule 
module CDRX_10B12B(SIN, REFCLK, CDRRST, RXD0, RXD1, RXD2, RXD3, RXD4, RXD5, RXD6, RXD7, RXD8, RXD9, RECCLK, CSLOCK, SYDT);// synthesis syn_black_box
parameter   in_freq    = "100.0";
parameter   sympat     = "00000011111111111111";
input SIN;
input REFCLK;
input CDRRST;
output RXD0;
output RXD1;
output RXD2;
output RXD3;
output RXD4;
output RXD5;
output RXD6;
output RXD7;
output RXD8;
output RXD9;
output RECCLK;
output CSLOCK;
output SYDT;
endmodule 
module TX_8B10B(TXD0, TXD1, TXD2, TXD3, TXD4, TXD5, TXD6, TXD7, TXD8, TXD9, REFCLK, SOUT, CSLOCK);// synthesis syn_black_box
parameter   in_freq    = "100.0";
input TXD0;
input TXD1;
input TXD2;
input TXD3;
input TXD4;
input TXD5;
input TXD6;
input TXD7;
input TXD8;
input TXD9;
input REFCLK;
output SOUT;
output CSLOCK;
endmodule 
module TX_10B12B(TXD0, TXD1, TXD2, TXD3, TXD4, TXD5, TXD6, TXD7, TXD8, TXD9, REFCLK, SOUT, CSLOCK);// synthesis syn_black_box
parameter   in_freq    = "100.0";
input TXD0;
input TXD1;
input TXD2;
input TXD3;
input TXD4;
input TXD5;
input TXD6;
input TXD7;
input TXD8;
input TXD9;
input REFCLK;
output SOUT;
output CSLOCK;
endmodule 
module HSLB_10B12B (REFCLK,CDRRST,TXD0,TXD1,TXD2,TXD3,TXD4,TXD5,TXD6,TXD7,TXD8,TXD9,RXD0,RXD1,RXD2,RXD3,RXD4,RXD5,RXD6,RXD7,RXD8,RXD9,RECCLK,CSLOCK);
parameter   in_freq    = "100.0";
input  REFCLK,CDRRST;
input TXD0,TXD1,TXD2,TXD3,TXD4,TXD5,TXD6,TXD7,TXD8,TXD9;
output RECCLK,CSLOCK;
output RXD0,RXD1,RXD2,RXD3,RXD4,RXD5,RXD6,RXD7,RXD8,RXD9;
endmodule 
module HSLB_8B10B (REFCLK,CDRRST,TXD0,TXD1,TXD2,TXD3,TXD4,TXD5,TXD6,TXD7,TXD8,TXD9,RXD0,RXD1,RXD2,RXD3,RXD4,RXD5,RXD6,RXD7,RXD8,RXD9,RECCLK,CSLOCK);
parameter   in_freq    = "100.0";
input  REFCLK,CDRRST;
input TXD0,TXD1,TXD2,TXD3,TXD4,TXD5,TXD6,TXD7,TXD8,TXD9;
output RECCLK,CSLOCK;
output RXD0,RXD1,RXD2,RXD3,RXD4,RXD5,RXD6,RXD7,RXD8,RXD9;
endmodule 
//LVDS BLOCK cells
module LVDSIN (O, P_IN,N_IN);   // synthesis syn_black_box black_box_pad_pin="P_IN,N_IN"
input P_IN,N_IN; 
output O; 
endmodule 
module LVDSOUT (P_OUT,N_OUT, I);    // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I; 
output P_OUT,N_OUT; 
endmodule 
module LVDSTRI (P_OUT,N_OUT, I,OE);   // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I,OE; 
output P_OUT,N_OUT; 
endmodule 
module LVDSIO (O, P_IO, N_IO, I, OE); // synthesis syn_black_box black_box_pad_pin="P_IO,N_IO"
input I,OE; 
inout P_IO,N_IO; 
output O;
endmodule 
module BLVDSIN (O, P_IN,N_IN);   // synthesis syn_black_box black_box_pad_pin="P_IN,N_IN"
input P_IN,N_IN; 
output O; 
endmodule 
module BLVDSOUT (P_OUT,N_OUT, I);   // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I; 
output P_OUT,N_OUT; 
endmodule 
module BLVDSTRI (P_OUT,N_OUT, I,OE);   // synthesis syn_black_box black_box_pad_pin="P_OUT,N_OUT"
input I,OE; 
output P_OUT,N_OUT; 
endmodule 
module BLVDSIO (O, P_IO, N_IO, I, OE); // synthesis syn_black_box black_box_pad_pin="P_IO,N_IO"
input I,OE; 
inout P_IO,N_IO; 
output O;
endmodule 
//FIFO for GDX2
module FIFO15X10A(WE, WCLK, RE, RST, RCLK, DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8, DI9, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, FULL, EMPTY, START_RD);// synthesis syn_black_box
input WE;
input WCLK;
input RE;
input RST;
input RCLK;
input DI0;
input DI1;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
output DO0;
output DO1;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
output FULL;
output EMPTY;
output START_RD;
endmodule 