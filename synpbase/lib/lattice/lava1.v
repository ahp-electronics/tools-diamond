
// Copyright (c) 2000 Synplicity, Inc.
// $Header: //synplicity/map202003lat/mappers/lattice/lib/lava1.v#1 $

// library lava1;
//Combinatorial Cells
module BUFF(I0,O); // synthesis syn_black_box
input I0;
output O;
endmodule
module INV(I0,O); // synthesis syn_black_box
input I0;
output O;
endmodule
module BUFTI(I0,OE,O); // synthesis syn_black_box
input I0;
input OE;
output O;
endmodule
module BUFEI(I0,OE,O); // synthesis syn_black_box
input I0;
input OE;
output O;
endmodule
module MUX2(I0,I1,S0,O); // synthesis syn_black_box
input I0;
input I1;
input S0;
output O;
endmodule
module MUX2A(I0,I1,S0,O); // synthesis syn_black_box
input I0;
input I1;
input S0;
output O;
endmodule
module MUX2B(I0,I1,S0,O); // synthesis syn_black_box
input I0;
input I1;
input S0;
output O;
endmodule
module MUX4(I0,I1,I2,I3,S0,S1,O); // synthesis syn_black_box
input I0;
input I1;
input I2;
input I3;
input S0;
input S1;
output O;
endmodule
module MUX8(I0,I1,I2,I3,I4,I5,I6,I7,S0,S1,S2,O); // synthesis syn_black_box
input I0;
input I1;
input I2;
input I3;
input I4;
input I5;
input I6;
input I7;
input S0;
input S1;
input S2;
output O;
endmodule
module MUX8C(I0,I1,I2,I3,I4,I5,I6,I7,MI,S0,S1,S2,S3,O); // synthesis syn_black_box
input I0;
input I1;
input I2;
input I3;
input I4;
input I5;
input I6;
input I7;
input MI;
input S0;
input S1;
input S2;
input S3;
output O;
endmodule
module LUT2(I0,I1,O); // synthesis syn_black_box
input I0;
input I1;
output O;
endmodule
module LUT3(I0,I1,I2,O); // synthesis syn_black_box
input I0;
input I1;
input I2;
output O;
endmodule
module LUT4(I0,I1,I2,I3,O); // synthesis syn_black_box
input I0;
input I1;
input I2;
input I3;
output O;
endmodule
module LUT5(I0,I1,I2,I3,I4,O); // synthesis syn_black_box
input I0;
input I1;
input I2;
input I3;
input I4;
output O;
endmodule
module LUT6(I0,I1,I2,I3,I4,I5,O); // synthesis syn_black_box
input I0;
input I1;
input I2;
input I3;
input I4;
input I5;
output O;
endmodule
module CYAND2(I0,I1,O); // synthesis syn_black_box
input I0;
input I1;
output O;
endmodule
module CYOR2(I0,I1,O); // synthesis syn_black_box
input I0;
input I1;
output O;
endmodule
module MULTAND2(I0,I1,O);//synthesis syn_black_box
input I0;
input I1;
output O;
endmodule
module GSROR2(I0,I1,O);//synthesis syn_black_box
input I0;
input I1;
output O;
endmodule
module CYXOR2(I0,I1,O); // synthesis syn_black_box
input I0;
input I1;
output O;
endmodule
module MUXL5(I0,I1,S0,O); // synthesis syn_black_box
input I0;
input I1;
input S0;
output O;
endmodule
module MUXL6(I0,I1,S0,O); // synthesis syn_black_box
input I0;
input I1;
input S0;
output O;
endmodule
//Sequential Cells
module DFF(D,CLK,Q); // synthesis syn_black_box
input D;
input CLK;
output Q;
endmodule
module DFF_1(D,CLK,Q); // synthesis syn_black_box
input D;
input CLK;
output Q;
endmodule
module DFFRH(D,CLK,R,Q); // synthesis syn_black_box
input D;
input CLK;
input R;
output Q;
endmodule
module DFFRH_1(D,CLK,R,Q); // synthesis syn_black_box
input D;
input CLK;
input R;
output Q;
endmodule
module DFFSRH(D,SR,CLK,Q); // synthesis syn_black_box
input D;
input SR;
input CLK;
output Q;
endmodule
module DFFSRH_1(D,SR,CLK,Q); // synthesis syn_black_box
input D;
input SR;
input CLK;
output Q;
endmodule
module DFFSH(D,CLK,S,Q); // synthesis syn_black_box
input D;
input CLK;
input S;
output Q;
endmodule
module DFFSH_1(D,CLK,S,Q); // synthesis syn_black_box
input D;
input CLK;
input S;
output Q;
endmodule
module DFFSSH(D,SS,CLK,Q); // synthesis syn_black_box
input D;
input SS;
input CLK;
output Q;
endmodule
module DFFSSH_1(D,SS,CLK,Q); // synthesis syn_black_box
input D;
input SS;
input CLK;
output Q;
endmodule
module DFFLSH(D,SD,LD,CLK,Q); // synthesis syn_black_box
input D;
input SD;
input LD;
input CLK;
output Q;
endmodule
module DFFLSH_1(D,SD,LD,CLK,Q); // synthesis syn_black_box
input D;
input SD;
input LD;
input CLK;
output Q;
endmodule
module DFFCB(CE,D,CLK,Q); // synthesis syn_black_box
input CE;
input D;
input CLK;
output Q;
endmodule
module DFFCB_1(CE,D,CLK,Q); // synthesis syn_black_box
input CE;
input D;
input CLK;
output Q;
endmodule
module DFFCBRH(CE,D,CLK,R,Q); // synthesis syn_black_box
input CE;
input D;
input CLK;
input R;
output Q;
endmodule
module DFFCBRH_1(CE,D,CLK,R,Q); // synthesis syn_black_box
input CE;
input D;
input CLK;
input R;
output Q;
endmodule
module DFFCBSRH(CE,D,SR,CLK,Q); // synthesis syn_black_box
input CE;
input D;
input SR;
input CLK;
output Q;
endmodule
module DFFCBSRH_1(CE,D,SR,CLK,Q); // synthesis syn_black_box
input CE;
input D;
input SR;
input CLK;
output Q;
endmodule
module DFFCBSH(CE,D,CLK,S,Q); // synthesis syn_black_box
input CE;
input D;
input CLK;
input S;
output Q;
endmodule
module DFFCBSH_1(CE,D,CLK,S,Q); // synthesis syn_black_box
input CE;
input D;
input CLK;
input S;
output Q;
endmodule
module DFFCBSSH(CE,D,SS,CLK,Q); // synthesis syn_black_box
input CE;
input D;
input SS;
input CLK;
output Q;
endmodule
module DFFCBSSH_1(CE,D,SS,CLK,Q); // synthesis syn_black_box
input CE;
input D;
input SS;
input CLK;
output Q;
endmodule
module DFFCBLSH(D,SD,CE,LD,CLK,Q); // synthesis syn_black_box
input D;
input SD;
input CE;
input LD;
input CLK;
output Q;
endmodule
module DFFCBLSH_1(D,SD,CE,LD,CLK,Q); // synthesis syn_black_box
input D;
input SD;
input CE;
input LD;
input CLK;
output Q;
endmodule
module DLAT(D,LAT,Q); // synthesis syn_black_box
input D;
input LAT;
output Q;
endmodule
module DLAT_1(D,LAT,Q); // synthesis syn_black_box
input D;
input LAT;
output Q;
endmodule
module DLATRH(D,LAT,R,Q); // synthesis syn_black_box
input D;
input LAT;
input R;
output Q;
endmodule
module DLATRH_1(D,LAT,R,Q); // synthesis syn_black_box
input D;
input LAT;
input R;
output Q;
endmodule
module DLATSRH(D,SR,LAT,Q); // synthesis syn_black_box
input D;
input SR;
input LAT;
output Q;
endmodule
module DLATSRH_1(D,SR,LAT,Q); // synthesis syn_black_box
input D;
input SR;
input LAT;
output Q;
endmodule
module DLATSSH(D,SS,LAT,Q); // synthesis syn_black_box
input D;
input SS;
input LAT;
output Q;
endmodule
module DLATSSH_1(D,SS,LAT,Q); // synthesis syn_black_box
input D;
input SS;
input LAT;
output Q;
endmodule
module DLATSH(D,LAT,S,Q); // synthesis syn_black_box
input D;
input LAT;
input S;
output Q;
endmodule
module DLATSH_1(D,LAT,S,Q); // synthesis syn_black_box
input D;
input LAT;
input S;
output Q;
endmodule
//Carry Chain
module CCU_AGB(A0,B0,CIN,COUT); // synthesis syn_black_box
input A0;
input B0;
input CIN;
output COUT;
endmodule
module CCU_AGBS(A0,B0,CIN,COUT,S0); // synthesis syn_black_box
input A0;
input B0;
input CIN;
output COUT;
output S0;
endmodule
module CCU_ABS(D,PN,CIN,S0,COUT); // synthesis syn_black_box
input D;
input PN;
input CIN;
output S0;
output COUT;
endmodule
module AS_LSB(A0,B0,CIN,AS,S0,COUT); // synthesis syn_black_box
input A0;
input B0;
input CIN;
input AS;
output S0;
output COUT;
endmodule
module CCU_AS_LSB(A0,B0,AS,S0,COUT); // synthesis syn_black_box
input A0;
input B0;
input AS;
output S0;
output COUT;
endmodule
module CCU_AS(A0,B0,CIN,AS,S0,COUT); // synthesis syn_black_box
input A0;
input B0;
input CIN;
input AS;
output S0;
output COUT;
endmodule
module CCU_ADD(A0,B0,CIN,S0,COUT); // synthesis syn_black_box
input A0;
input B0;
input CIN;
output S0;
output COUT;
endmodule
module CCU_ADD_2S(A0,B0,SEL,CIN,S0,COUT); // synthesis syn_black_box
input A0;
input B0;
input SEL;
input CIN;
output S0;
output COUT;
endmodule
module CCU_GEN(A0,B0,CIN,S0,COUT);// synthesis syn_black_box
input A0;
input B0;
input CIN;
output S0;
output COUT;
endmodule
module CCU_GEN1(A0,B0,CIN,D,S0,COUT);// synthesis syn_black_box
input A0;
input B0;
input CIN;
input D;
output S0;
output COUT;
endmodule
module CCU_GEN2(A0,B0,CIN,D,S0,COUT);// synthesis syn_black_box
input A0;
input B0;
input CIN;
input D;
output S0;
output COUT;
endmodule
module CCU_SUB(A0,B0,CIN,S0,COUT); // synthesis syn_black_box
input A0;
input B0;
input CIN;
output S0;
output COUT;
endmodule
module CCU_UDCP(D,SD,LOAD,UD,CIN,S0,COUT); // synthesis syn_black_box
input D;
input SD;
input LOAD;
input UD;
input CIN;
output S0;
output COUT;
endmodule
module CCU_UDC(D,UD,CIN,S0,COUT); // synthesis syn_black_box
input D;
input UD;
input CIN;
output S0;
output COUT;
endmodule
module CCU_DC(D,CIN,S0,COUT); // synthesis syn_black_box
input D;
input CIN;
output S0;
output COUT;
endmodule
module CCU_UC(D,CIN,S0,COUT); // synthesis syn_black_box
input D;
input CIN;
output S0;
output COUT;
endmodule
module DC_LSB(D,CIN,S0,COUT); // synthesis syn_black_box
input D;
input CIN;
output S0;
output COUT;
endmodule
module UC_LSB(D,CIN,S0,COUT); // synthesis syn_black_box
input D;
input CIN;
output S0;
output COUT;
endmodule
module LSB_CY(I0,COUT); // synthesis syn_black_box
input I0;
output COUT;
endmodule
module LSB_CYI(I0,COUT); // synthesis syn_black_box
input I0;
output COUT;
endmodule
module CCU_BUF(CI,COUT); // synthesis syn_black_box
input CI;
output COUT;
endmodule
module CCU_OUT(CI,O); // synthesis syn_black_box
input CI;
output O;
endmodule
module UDC_LSB(D,UD,CYIBAR,S0,COUT); // synthesis syn_black_box
input D;
input UD;
input CYIBAR;
output S0;
output COUT;
endmodule
module CCU_UCP(D,SD,LOAD,CIN,S0,COUT); // synthesis syn_black_box
input D;
input SD;
input LOAD;
input CIN;
output S0;
output COUT;
endmodule
module UCP_LSB(D,SD,LOAD,CYIBAR,S0,COUT); // synthesis syn_black_box
input D;
input SD;
input LOAD;
input CYIBAR;
output S0;
output COUT;
endmodule
module CCU_DCP(D,SD,LOAD,CIN,S0,COUT); // synthesis syn_black_box
input D;
input SD;
input LOAD;
input CIN;
output S0;
output COUT;
endmodule
module CCU_BTH(A0,A1,D0,CIN,AS,SH,NOP,P,COUT); // synthesis syn_black_box
input A0;
input A1;
input D0;
input CIN;
input AS;
input SH;
input NOP;
output P;
output COUT;
endmodule
module CCU_BTH_TC_LSB(A0,A1,CIN,AS,SH,NOP,P,COUT); // synthesis syn_black_box
input A0;
input A1;
input CIN;
input AS;
input SH;
input NOP;
output P;
output COUT;
endmodule
module CCU_BTH_TC_MSB(A0,D0,CIN,AS,NOP,P,COUT); // synthesis syn_black_box
input A0;
input D0;
input CIN;
input AS;
input NOP;
output P;
output COUT;
endmodule
module CCU_BTH_UNS_LSB(A0,A1,CIN,B0,B1,P,COUT); // synthesis syn_black_box
input A0;
input A1;
input CIN;
input B0;
input B1;
output P;
output COUT;
endmodule
module CCU_BTH_UNS_MSB(D0,CIN,AS,NOP,P,COUT); // synthesis syn_black_box
input D0;
input CIN;
input AS;
input NOP;
output P;
output COUT;
endmodule
module CCU_BTH_LSTC(A0,A1,CIN,ADD,P,COUT); // synthesis syn_black_box
input A0;
input A1;
input CIN;
input ADD;
output P;
output COUT;
endmodule
module CCU_MULT(A0,A1,B0,B1,CIN,P,COUT); // synthesis syn_black_box
input A0;
input A1;
input B0;
input B1;
input CIN;
output P;
output COUT;
endmodule
module CCU_RCD(B0,B1,B2,AS,SH,NOP); // synthesis syn_black_box
input B0;
input B1;
input B2;
output AS;
output SH;
output NOP;
endmodule
module CCU_RCD_LSB(B1,B2,AS,SH,NOP); // synthesis syn_black_box
input B1;
input B2;
output AS;
output SH;
output NOP;
endmodule
//IO Pad Cells
module IBUF(I0,O); // synthesis syn_black_box
input I0;
output O;
endmodule
module IBUFINV(I0,O); // synthesis syn_black_box
input I0;
output O;
endmodule
module LVDSIN(N_IN,P_IN,O); // synthesis syn_black_box
input N_IN;
input P_IN;
output O;
endmodule
module BLVDSIN(N_IN,P_IN,O); // synthesis syn_black_box
input N_IN;
input P_IN;
output O;
endmodule
module OBUF(I0,O); // synthesis syn_black_box
input I0;
output O;
endmodule
module OBUFINV(I0,O); // synthesis syn_black_box
input I0;
output O;
endmodule
module LVDSOUT(I,N_OUT,P_OUT); // synthesis syn_black_box
input I;
output N_OUT;
output P_OUT;
endmodule
module BLVDSOUT(I,N_OUT,P_OUT); // synthesis syn_black_box
input I;
output N_OUT;
output P_OUT;
endmodule
module BUFTH(I0,OE,O); // synthesis syn_black_box
input I0;
input OE;
output O;
endmodule
module BUFTL(I0,OE,O); // synthesis syn_black_box
input I0;
input OE;
output O;
endmodule
module LVDSTRI(I,OE,N_OUT,P_OUT); // synthesis syn_black_box
input I;
input OE;
output N_OUT;
output P_OUT;
endmodule
module BLVDSTRI(I,OE,N_OUT,P_OUT); // synthesis syn_black_box
input I;
input OE;
output N_OUT;
output P_OUT;
endmodule
module INVTH(I0,OE,O); // synthesis syn_black_box
input I0;
input OE;
output O;
endmodule
module INVTL(I0,OE,O); // synthesis syn_black_box
input I0;
input OE;
output O;
endmodule
module LVDSIO(I,OE,P_IO,N_IO,O); // synthesis syn_black_box
input I;
input OE;
inout P_IO;
inout N_IO;
output O;
endmodule
module BLVDSIO(I,OE,P_IO,N_IO,O); // synthesis syn_black_box
input I;
input OE;
inout P_IO;
inout N_IO;
output O;
endmodule
module GCLKBUF(CI,O); // synthesis syn_black_box
input CI;
output O;
endmodule
module GCLKBUFI(I0,O); // synthesis syn_black_box
input I0;
output O;
endmodule
module GSRBUF(SRI,O); // synthesis syn_black_box
input SRI;
output O;
endmodule
module GSRBUFINV(SRI,O); // synthesis syn_black_box
input SRI;
output O;
endmodule
module GSRBUFI(I0,O); // synthesis syn_black_box
input I0;
output O;
endmodule
module GSRBUFIINV(I0,O); // synthesis syn_black_box
input I0;
output O;
endmodule
module BI_DIR(I0,OE,IO,O); // synthesis syn_black_box
input I0;
input OE;
inout IO;
output O;
endmodule
//Misc Cells
//Power
module VCC(X); // synthesis syn_black_box
output X;
endmodule
module GND(X); // synthesis syn_black_box
output X;
endmodule
//PLL Cells
module SPLL(CLK_IN,CLK_OUT);//synthesis syn_black_box
input CLK_IN;
output CLK_OUT;
endmodule
module STDPLL(CLK_IN,CLK_OUT,PLL_LOCK);//synthesis syn_black_box
input CLK_IN;
output CLK_OUT;
output PLL_LOCK;
endmodule
module STDPLLX(CLK_IN,PLL_FBK,PLL_RST,CLK_OUT,SEC_OUT,PLL_LOCK);//synthesis syn_black_box
input CLK_IN;
input PLL_FBK;
input PLL_RST;
output CLK_OUT;
output SEC_OUT;
output PLL_LOCK;
endmodule
//HSIF BLOCK
module RX_SS_4(SIN,SS_CLKIN,RXD3,RXD2,RXD1,RXD0,RECCLK,CSLOCK);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
output RXD3;
output RXD2;
output RXD1;
output RXD0;
output RECCLK;
output CSLOCK;
endmodule 
module RX_SS_6(SIN,SS_CLKIN,RXD5,RXD4,RXD3,RXD2,RXD1,RXD0,RECCLK,CSLOCK);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
output RXD5;
output RXD4;
output RXD3;
output RXD2;
output RXD1;
output RXD0;
output RECCLK;
output CSLOCK;
endmodule 
module RX_SS_8(SIN,SS_CLKIN,RXD7,RXD6,RXD5,RXD4,RXD3,RXD2,RXD1,RXD0,RECCLK,CSLOCK);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
output RXD7;
output RXD6;
output RXD5;
output RXD4;
output RXD3;
output RXD2;
output RXD1;
output RXD0;
output RECCLK;
output CSLOCK;
endmodule 
module CDRX_SS_4(SIN,SS_CLKIN,CAL,RXD3,RXD2,RXD1,RXD0,RECCLK,CSLOCK,CDRLOCK,SYDT);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
input CAL;
output RXD3;
output RXD2;
output RXD1;
output RXD0;
output RECCLK;
output CSLOCK;
output CDRLOCK;
output SYDT;
endmodule 
module CDRX_SS_6(SIN,SS_CLKIN,CAL,RXD5,RXD4,RXD3,RXD2,RXD1,RXD0,RECCLK,CSLOCK,CDRLOCK,SYDT);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
input CAL;
output RXD5;
output RXD4;
output RXD3;
output RXD2;
output RXD1;
output RXD0;
output RECCLK;
output CSLOCK;
output CDRLOCK;
output SYDT;
endmodule 
module CDRX_SS_8(SIN,SS_CLKIN,CAL,RXD7,RXD6,RXD5,RXD4,RXD3,RXD2,RXD1,RXD0,RECCLK,CSLOCK,CDRLOCK,SYDT);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
input CAL;
output RXD7;
output RXD6;
output RXD5;
output RXD4;
output RXD3;
output RXD2;
output RXD1;
output RXD0;
output RECCLK;
output CSLOCK;
output CDRLOCK;
output SYDT;
endmodule 
module TX_SS_4(TXD3,TXD2,TXD1,TXD0,REFCLK,SOUT,SS_CLKOUT,CSLOCK);// synthesis syn_black_box
input TXD3;
input TXD2;
input TXD1;
input TXD0;
input REFCLK;
output SOUT;
output SS_CLKOUT;
output CSLOCK;
endmodule 
module TX_SS_6(TXD5,TXD4,TXD3,TXD2,TXD1,TXD0,REFCLK,SOUT,SS_CLKOUT,CSLOCK);// synthesis syn_black_box
input TXD5;
input TXD4;
input TXD3;
input TXD2;
input TXD1;
input TXD0;
input REFCLK;
output SOUT;
output SS_CLKOUT;
output CSLOCK;
endmodule 
module TX_SS_8(TXD7,TXD6,TXD5,TXD4,TXD3,TXD2,TXD1,TXD0,REFCLK,SOUT,SS_CLKOUT,CSLOCK);// synthesis syn_black_box
input TXD7;
input TXD6;
input TXD5;
input TXD4;
input TXD3;
input TXD2;
input TXD1;
input TXD0;
input REFCLK;
output SOUT;
output SS_CLKOUT;
output CSLOCK;
endmodule 
module CDRX_8B10B(SIN,REFCLK,CDRRST,EXLOSS,RXD9,RXD8,RXD7,RXD6,RXD5,RXD4,RXD3,RXD2,RXD1,RXD0,RECCLK,CSLOCK,CDRLOCK,LOSS,SYDT);// synthesis syn_black_box
input SIN;
input REFCLK;
input CDRRST;
input EXLOSS;
output RXD9;
output RXD8;
output RXD7;
output RXD6;
output RXD5;
output RXD4;
output RXD3;
output RXD2;
output RXD1;
output RXD0;
output RECCLK;
output CSLOCK;
output CDRLOCK;
output LOSS;
output SYDT;
endmodule 
module CDRX_10B12B(SIN,REFCLK,CDRRST,SYDTRST,RXD9,RXD8,RXD7,RXD6,RXD5,RXD4,RXD3,RXD2,RXD1,RXD0,RECCLK,CSLOCK,CDRLOCK,LOSS,SYDT);// synthesis syn_black_box
input SIN;
input REFCLK;
input CDRRST;
input SYDTRST;
output RXD9;
output RXD8;
output RXD7;
output RXD6;
output RXD5;
output RXD4;
output RXD3;
output RXD2;
output RXD1;
output RXD0;
output RECCLK;
output CSLOCK;
output CDRLOCK;
output LOSS;
output SYDT;
endmodule 
module TX_8B10B(TXD9,TXD8,TXD7,TXD6,TXD5,TXD4,TXD3,TXD2,TXD1,TXD0,REFCLK,SOUT,CSLOCK);// synthesis syn_black_box
input TXD9;
input TXD8;
input TXD7;
input TXD6;
input TXD5;
input TXD4;
input TXD3;
input TXD2;
input TXD1;
input TXD0;
input REFCLK;
output SOUT;
output CSLOCK;
endmodule 
module TX_10B12B(TXD9,TXD8,TXD7,TXD6,TXD5,TXD4,TXD3,TXD2,TXD1,TXD0,REFCLK,SOUT,CSLOCK);// synthesis syn_black_box
input TXD9;
input TXD8;
input TXD7;
input TXD6;
input TXD5;
input TXD4;
input TXD3;
input TXD2;
input TXD1;
input TXD0;
input REFCLK;
output SOUT;
output CSLOCK;
endmodule 
//Memory Cells
module RAM16X1S(WE,WDATA,WCLK,AD0,AD1,AD2,AD3,RDATA); //synthesis syn_black_box
input WE;
input WDATA;
input WCLK;
input AD0;
input AD1;
input AD2;
input AD3;
output RDATA;
endmodule
module RAM16X1S_1(WE,WDATA,WCLK,AD0,AD1,AD2,AD3,RDATA); //synthesis syn_black_box
input WE;
input WDATA;
input WCLK;
input AD0;
input AD1;
input AD2;
input AD3;
output RDATA;
endmodule
module RAM32X1S(WE,WDATA,WCLK,AD0,AD1,AD2,AD3,AD4,RDATA); //synthesis syn_black_box
input WE;
input WDATA;
input WCLK;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
output RDATA;
endmodule
module RAM32X1S_1(WE,WDATA,WCLK,AD0,AD1,AD2,AD3,AD4,RDATA); //synthesis syn_black_box
input WE;
input WDATA;
input WCLK;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
output RDATA;
endmodule
module RAM64X1S(WE,WDATA,WCLK,AD0,AD1,AD2,AD3,AD4,AD5,RDATA); //synthesis syn_black_box
input WE;
input WDATA;
input WCLK;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input AD5;
output RDATA;
endmodule
module RAM64X1S_1(WE,WDATA,WCLK,AD0,AD1,AD2,AD3,AD4,AD5,RDATA); //synthesis syn_black_box
input WE;
input WDATA;
input WCLK;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input AD5;
output RDATA;
endmodule
module RAM16X1D(WE,WDATA,WCLK,AD0,AD1,AD2,AD3,DPAD0,DPAD1,DPAD2,DPAD3,RDATA,DPRDATA); //synthesis syn_black_box
input WE;
input WDATA;
input WCLK;
input AD0;
input AD1;
input AD2;
input AD3;
input DPAD0;
input DPAD1;
input DPAD2;
input DPAD3;
output RDATA;
output DPRDATA;
endmodule
module RAM16X1D_1(WE,WDATA,WCLK,AD0,AD1,AD2,AD3,DPAD0,DPAD1,DPAD2,DPAD3,RDATA,DPRDATA); //synthesis syn_black_box
input WE;
input WDATA;
input WCLK;
input AD0;
input AD1;
input AD2;
input AD3;
input DPAD0;
input DPAD1;
input DPAD2;
input DPAD3;
output RDATA;
output DPRDATA;
endmodule
module RAM32X1D(WE,WDATA,WCLK,AD0,AD1,AD2,AD3,AD4,DPAD0,DPAD1,DPAD2,DPAD3,DPAD4,RDATA,DPRDATA); //synthesis syn_black_box
input WE;
input WDATA;
input WCLK;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input DPAD0;
input DPAD1;
input DPAD2;
input DPAD3;
input DPAD4;
output RDATA;
output DPRDATA;
endmodule
module RAM32X1D_1(WE,WDATA,WCLK,AD0,AD1,AD2,AD3,AD4,DPAD0,DPAD1,DPAD2,DPAD3,DPAD4,RDATA,DPRDATA); //synthesis syn_black_box
input WE;
input WDATA;
input WCLK;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input DPAD0;
input DPAD1;
input DPAD2;
input DPAD3;
input DPAD4;
output RDATA;
output DPRDATA;
endmodule
module SHIFT8(SI,A0,A1,A2,EN,CLK,SO); //synthesis syn_black_box
input SI;
input A0;
input A1;
input A2;
input EN;
input CLK;
output SO;
endmodule
module RAMB256X18DSR(WEN0,WEN1,RWCLK0,RWCLK1,CE0,CE1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,DA8,DA9,DA10,DA11,DA12,DA13,DA14,DA15,EDA0,EDA1,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,DB8,DB9,DB10,DB11,DB12,DB13,DB14,DB15,EDB0,EDB1); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input CE0;
input CE1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout DA8;
inout DA9;
inout DA10;
inout DA11;
inout DA12;
inout DA13;
inout DA14;
inout DA15;
inout EDA0;
inout EDA1;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout DB8;
inout DB9;
inout DB10;
inout DB11;
inout DB12;
inout DB13;
inout DB14;
inout DB15;
inout EDB0;
inout EDB1;
endmodule
module RAMB256X18DSR_1(WEN0,WEN1,RWCLK0,RWCLK1,CE0,CE1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,DA8,DA9,DA10,DA11,DA12,DA13,DA14,DA15,EDA0,EDA1,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,DB8,DB9,DB10,DB11,DB12,DB13,DB14,DB15,EDB0,EDB1); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input CE0;
input CE1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout DA8;
inout DA9;
inout DA10;
inout DA11;
inout DA12;
inout DA13;
inout DA14;
inout DA15;
inout EDA0;
inout EDA1;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout DB8;
inout DB9;
inout DB10;
inout DB11;
inout DB12;
inout DB13;
inout DB14;
inout DB15;
inout EDB0;
inout EDB1;
endmodule
module RAMB256X18DSF(WEN0,WEN1,RWCLK0,RWCLK1,CE0,CE1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,DA8,DA9,DA10,DA11,DA12,DA13,DA14,DA15,EDA0,EDA1,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,DB8,DB9,DB10,DB11,DB12,DB13,DB14,DB15,EDB0,EDB1); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input CE0;
input CE1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout DA8;
inout DA9;
inout DA10;
inout DA11;
inout DA12;
inout DA13;
inout DA14;
inout DA15;
inout EDA0;
inout EDA1;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout DB8;
inout DB9;
inout DB10;
inout DB11;
inout DB12;
inout DB13;
inout DB14;
inout DB15;
inout EDB0;
inout EDB1;
endmodule
module RAMB256X18DSF_1(WEN0,WEN1,RWCLK0,RWCLK1,CE0,CE1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,DA8,DA9,DA10,DA11,DA12,DA13,DA14,DA15,EDA0,EDA1,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,DB8,DB9,DB10,DB11,DB12,DB13,DB14,DB15,EDB0,EDB1); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input CE0;
input CE1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout DA8;
inout DA9;
inout DA10;
inout DA11;
inout DA12;
inout DA13;
inout DA14;
inout DA15;
inout EDA0;
inout EDA1;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout DB8;
inout DB9;
inout DB10;
inout DB11;
inout DB12;
inout DB13;
inout DB14;
inout DB15;
inout EDB0;
inout EDB1;
endmodule
module RAMB256X18DAR(WEN0,WEN1,RWCLK0,RWCLK1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,DA8,DA9,DA10,DA11,DA12,DA13,DA14,DA15,EDA0,EDA1,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,DB8,DB9,DB10,DB11,DB12,DB13,DB14,DB15,EDB0,EDB1); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout DA8;
inout DA9;
inout DA10;
inout DA11;
inout DA12;
inout DA13;
inout DA14;
inout DA15;
inout EDA0;
inout EDA1;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout DB8;
inout DB9;
inout DB10;
inout DB11;
inout DB12;
inout DB13;
inout DB14;
inout DB15;
inout EDB0;
inout EDB1;
endmodule
module RAMB256X18DAR_1(WEN0,WEN1,RWCLK0,RWCLK1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,DA8,DA9,DA10,DA11,DA12,DA13,DA14,DA15,EDA0,EDA1,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,DB8,DB9,DB10,DB11,DB12,DB13,DB14,DB15,EDB0,EDB1); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout DA8;
inout DA9;
inout DA10;
inout DA11;
inout DA12;
inout DA13;
inout DA14;
inout DA15;
inout EDA0;
inout EDA1;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout DB8;
inout DB9;
inout DB10;
inout DB11;
inout DB12;
inout DB13;
inout DB14;
inout DB15;
inout EDB0;
inout EDB1;
endmodule
module RAMB256X18DAF(WEN0,WEN1,RWCLK0,RWCLK1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,DA8,DA9,DA10,DA11,DA12,DA13,DA14,DA15,EDA0,EDA1,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,DB8,DB9,DB10,DB11,DB12,DB13,DB14,DB15,EDB0,EDB1); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout DA8;
inout DA9;
inout DA10;
inout DA11;
inout DA12;
inout DA13;
inout DA14;
inout DA15;
inout EDA0;
inout EDA1;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout DB8;
inout DB9;
inout DB10;
inout DB11;
inout DB12;
inout DB13;
inout DB14;
inout DB15;
inout EDB0;
inout EDB1;
endmodule
module RAMB256X18DAF_1(WEN0,WEN1,RWCLK0,RWCLK1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,DA8,DA9,DA10,DA11,DA12,DA13,DA14,DA15,EDA0,EDA1,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,DB8,DB9,DB10,DB11,DB12,DB13,DB14,DB15,EDB0,EDB1); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout DA8;
inout DA9;
inout DA10;
inout DA11;
inout DA12;
inout DA13;
inout DA14;
inout DA15;
inout EDA0;
inout EDA1;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout DB8;
inout DB9;
inout DB10;
inout DB11;
inout DB12;
inout DB13;
inout DB14;
inout DB15;
inout EDB0;
inout EDB1;
endmodule
module RAMB512X9DSR(WEN0,WEN1,RWCLK0,RWCLK1,CE0,CE1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDA8,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,ADDB8,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,EDA0,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,EDB0); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input CE0;
input CE1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDA8;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
input ADDB8;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout EDA0;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout EDB0;
endmodule
module RAMB512X9DSR_1(WEN0,WEN1,RWCLK0,RWCLK1,CE0,CE1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDA8,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,ADDB8,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,EDA0,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,EDB0); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input CE0;
input CE1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDA8;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
input ADDB8;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout EDA0;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout EDB0;
endmodule
module RAMB512X9DSF(WEN0,WEN1,RWCLK0,RWCLK1,CE0,CE1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDA8,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,ADDB8,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,EDA0,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,EDB0); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input CE0;
input CE1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDA8;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
input ADDB8;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout EDA0;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout EDB0;
endmodule
module RAMB512X9DSF_1(WEN0,WEN1,RWCLK0,RWCLK1,CE0,CE1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDA8,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,ADDB8,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,EDA0,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,EDB0); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input CE0;
input CE1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDA8;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
input ADDB8;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout EDA0;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout EDB0;
endmodule
module RAMB512X9DAR(WEN0,WEN1,RWCLK0,RWCLK1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDA8,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,ADDB8,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,EDA0,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,EDB0); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDA8;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
input ADDB8;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout EDA0;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout EDB0;
endmodule
module RAMB512X9DAR_1(WEN0,WEN1,RWCLK0,RWCLK1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDA8,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,ADDB8,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,EDA0,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,EDB0); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDA8;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
input ADDB8;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout EDA0;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout EDB0;
endmodule
module RAMB512X9DAF(WEN0,WEN1,RWCLK0,RWCLK1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDA8,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,ADDB8,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,EDA0,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,EDB0); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDA8;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
input ADDB8;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout EDA0;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout EDB0;
endmodule
module RAMB512X9DAF_1(WEN0,WEN1,RWCLK0,RWCLK1,OE0,OE1,ADDA0,ADDA1,ADDA2,ADDA3,ADDA4,ADDA5,ADDA6,ADDA7,ADDA8,ADDB0,ADDB1,ADDB2,ADDB3,ADDB4,ADDB5,ADDB6,ADDB7,ADDB8,DA0,DA1,DA2,DA3,DA4,DA5,DA6,DA7,EDA0,DB0,DB1,DB2,DB3,DB4,DB5,DB6,DB7,EDB0); //synthesis syn_black_box
input WEN0;
input WEN1;
input RWCLK0;
input RWCLK1;
input OE0;
input OE1;
input ADDA0;
input ADDA1;
input ADDA2;
input ADDA3;
input ADDA4;
input ADDA5;
input ADDA6;
input ADDA7;
input ADDA8;
input ADDB0;
input ADDB1;
input ADDB2;
input ADDB3;
input ADDB4;
input ADDB5;
input ADDB6;
input ADDB7;
input ADDB8;
inout DA0;
inout DA1;
inout DA2;
inout DA3;
inout DA4;
inout DA5;
inout DA6;
inout DA7;
inout EDA0;
inout DB0;
inout DB1;
inout DB2;
inout DB3;
inout DB4;
inout DB5;
inout DB6;
inout DB7;
inout EDB0;
endmodule
module RAMB256X18SSR(WEN,RWCLK,CE,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,ED0,ED1); //synthesis syn_black_box
input WEN;
input RWCLK;
input CE;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout D8;
inout D9;
inout D10;
inout D11;
inout D12;
inout D13;
inout D14;
inout D15;
inout ED0;
inout ED1;
endmodule
module RAMB256X18SSR_1(WEN,RWCLK,CE,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,ED0,ED1); //synthesis syn_black_box
input WEN;
input RWCLK;
input CE;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout D8;
inout D9;
inout D10;
inout D11;
inout D12;
inout D13;
inout D14;
inout D15;
inout ED0;
inout ED1;
endmodule
module RAMB256X18SSF(WEN,RWCLK,CE,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,ED0,ED1); //synthesis syn_black_box
input WEN;
input RWCLK;
input CE;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout D8;
inout D9;
inout D10;
inout D11;
inout D12;
inout D13;
inout D14;
inout D15;
inout ED0;
inout ED1;
endmodule
module RAMB256X18SSF_1(WEN,RWCLK,CE,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,ED0,ED1); //synthesis syn_black_box
input WEN;
input RWCLK;
input CE;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout D8;
inout D9;
inout D10;
inout D11;
inout D12;
inout D13;
inout D14;
inout D15;
inout ED0;
inout ED1;
endmodule
module RAMB256X18SAR(WEN,RWCLK,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,ED0,ED1); //synthesis syn_black_box
input WEN;
input RWCLK;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout D8;
inout D9;
inout D10;
inout D11;
inout D12;
inout D13;
inout D14;
inout D15;
inout ED0;
inout ED1;
endmodule
module RAMB256X18SAR_1(WEN,RWCLK,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,ED0,ED1); //synthesis syn_black_box
input WEN;
input RWCLK;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout D8;
inout D9;
inout D10;
inout D11;
inout D12;
inout D13;
inout D14;
inout D15;
inout ED0;
inout ED1;
endmodule
module RAMB256X18SAF(WEN,RWCLK,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,ED0,ED1); //synthesis syn_black_box
input WEN;
input RWCLK;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout D8;
inout D9;
inout D10;
inout D11;
inout D12;
inout D13;
inout D14;
inout D15;
inout ED0;
inout ED1;
endmodule
module RAMB256X18SAF_1(WEN,RWCLK,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,ED0,ED1); //synthesis syn_black_box
input WEN;
input RWCLK;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout D8;
inout D9;
inout D10;
inout D11;
inout D12;
inout D13;
inout D14;
inout D15;
inout ED0;
inout ED1;
endmodule
module RAMB512X9SSR(WEN,RWCLK,CE,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,ADD8,D0,D1,D2,D3,D4,D5,D6,D7,ED0); //synthesis syn_black_box
input WEN;
input RWCLK;
input CE;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
input ADD8;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout ED0;
endmodule
module RAMB512X9SSR_1(WEN,RWCLK,CE,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,ADD8,D0,D1,D2,D3,D4,D5,D6,D7,ED0); //synthesis syn_black_box
input WEN;
input RWCLK;
input CE;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
input ADD8;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout ED0;
endmodule
module RAMB512X9SSF(WEN,RWCLK,CE,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,ADD8,D0,D1,D2,D3,D4,D5,D6,D7,ED0); //synthesis syn_black_box
input WEN;
input RWCLK;
input CE;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
input ADD8;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout ED0;
endmodule
module RAMB512X9SSF_1(WEN,RWCLK,CE,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,ADD8,D0,D1,D2,D3,D4,D5,D6,D7,ED0); //synthesis syn_black_box
input WEN;
input RWCLK;
input CE;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
input ADD8;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout ED0;
endmodule
module RAMB512X9SAR(WEN,RWCLK,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,ADD8,D0,D1,D2,D3,D4,D5,D6,D7,ED0); //synthesis syn_black_box
input WEN;
input RWCLK;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
input ADD8;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout ED0;
endmodule
module RAMB512X9SAR_1(WEN,RWCLK,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,ADD8,D0,D1,D2,D3,D4,D5,D6,D7,ED0); //synthesis syn_black_box
input WEN;
input RWCLK;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
input ADD8;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout ED0;
endmodule
module RAMB512X9SAF(WEN,RWCLK,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,ADD8,D0,D1,D2,D3,D4,D5,D6,D7,ED0); //synthesis syn_black_box
input WEN;
input RWCLK;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
input ADD8;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout ED0;
endmodule
module RAMB512X9SAF_1(WEN,RWCLK,OE,ADD0,ADD1,ADD2,ADD3,ADD4,ADD5,ADD6,ADD7,ADD8,D0,D1,D2,D3,D4,D5,D6,D7,ED0); //synthesis syn_black_box
input WEN;
input RWCLK;
input OE;
input ADD0;
input ADD1;
input ADD2;
input ADD3;
input ADD4;
input ADD5;
input ADD6;
input ADD7;
input ADD8;
inout D0;
inout D1;
inout D2;
inout D3;
inout D4;
inout D5;
inout D6;
inout D7;
inout ED0;
endmodule
