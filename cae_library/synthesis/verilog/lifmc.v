// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2002-2012 by Lattice Semiconductor Corporation
// --------------------------------------------------------------------
//
//
//                     Lattice Semiconductor Corporation
//                     5555 NE Moore Court
//                     Hillsboro, OR 97214
//                     U.S.A
//
//                     TEL: 1-800-Lattice (USA and Canada)
//                          408-826-6000 (other locations)
//
//                     web: http://www.latticesemi.com/
//                     email: techsupport@latticesemi.com
//
// --------------------------------------------------------------------
//
// Header files for RIALTO family
//
// --------------------------------------------------------------------

module AND2 (A, B, Z);  //synthesis syn_black_box
   input A ;
   input B ;
   output Z ;
endmodule

module AND3  (A, B, C, Z);  //synthesis syn_black_box
   input A ;
   input B ;
   input C ;
   output Z ;
endmodule 

module AND4  (A, B, C, D, Z);  //synthesis syn_black_box
   input A ;
   input B ;
   input C ;
   input D ;
   output Z ;
endmodule 

module AND5  (A, B, C, D, E, Z);  //synthesis syn_black_box
   input A ;
   input B ;
   input C ;
   input D ;
   input E ;
   output Z ;
endmodule 

module BB (I, T, O, B);  //synthesis syn_black_box black_box_pad_pin="B"
   input  I ;
   input  T ;
   output O ;
   inout  B ;
endmodule 

module BBPU (I, T, O, B);  //synthesis syn_black_box black_box_pad_pin="B"
   input  I ;
   input  T ;
   output O;
   inout  B ;
endmodule

module I3CBB (I, T, RESEN, PULLUPEN, O, B);  //synthesis syn_black_box black_box_pad_pin="B"
   input  I ;
   input  T ;
   input  RESEN ;
   input  PULLUPEN ;
   output O ;
   inout  B ;
endmodule 

module CCU2C (
   CIN,
   A0, B0, C0, D0,
   A1, B1, C1, D1,
   S0, S1, COUT
);   //synthesis syn_black_box syn_unconnected_inputs  = "CIN"

   input CIN;
   input A0, B0, C0, D0;
   input A1, B1, C1, D1;
   output S0, S1, COUT;
   parameter [15:0] INIT0 = 16'h0000;
   parameter [15:0] INIT1 = 16'h0000;
   parameter INJECT1_0 = "YES";
   parameter INJECT1_1 = "YES";
endmodule


module FD1P3AX (D, SP, CK, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   output Q ;
endmodule

module FD1P3AY (D, SP, CK, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   output Q ;
endmodule

module FD1P3BX (D, SP, CK, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   input PD ;
   output Q ;
endmodule

module FD1P3DX (D, SP, CK, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   input CD ;
   output Q ;
endmodule

module FD1P3IX (D, SP, CK, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   input CD ;
   output Q ;
endmodule

module FD1P3JX (D, SP, CK, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   input PD ;
   output Q ;
endmodule

module FD1S3AX (D, CK, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   output Q ;
endmodule

module FD1S3AY (D, CK, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   output Q ;
endmodule

module FD1S3BX (D, CK, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   input  PD ;
   output Q ;
endmodule

module FD1S3DX (D, CK, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   input  CD ;
   output Q ;
endmodule

module FD1S3IX (D, CK, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   input  CD ;
   output Q ;
endmodule

module FD1S3JX (D, CK, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   input  PD ;
   output Q ;
endmodule

module FL1P3AY (D1, D0, SP, CK, SD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   output Q ;
endmodule

module FL1P3AZ (D1, D0, SP, CK, SD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   output Q ;
endmodule

module FL1P3BX (D1, D0, SP, CK, SD, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   input PD ;
   output Q ;
endmodule

module FL1P3DX (D1, D0, SP, CK, SD, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   input CD ;
   output Q ;
endmodule

module FL1P3IY (D1, D0, SP, CK, SD, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   input CD ;
   output Q ;
endmodule

module FL1P3JY (D1, D0, SP, CK, SD, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   input PD ;
   output Q ;
endmodule

module FL1S3AX (D1, D0, CK, SD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input  D1;
   input  D0;
   input  CK;
   input  SD;
   output Q;
endmodule

module FL1S3AY (D1, D0, CK, SD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input  D1;
   input  D0;
   input  CK;
   input  SD;
   output Q;
endmodule

module GSR (GSR);  //synthesis syn_black_box syn_noprune=1
   input GSR ;
endmodule

module IB (I, O);  //synthesis syn_black_box black_box_pad_pin="I"
   input  I ;
   output O ;
endmodule


module IBPU (I, O);  //synthesis syn_black_box black_box_pad_pin="I"
   input  I;
   output O;
endmodule

module IFS1P3BX (D, SP, SCLK, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D;
   input SP;
   input SCLK;
   input PD;
   output Q;
endmodule

module IFS1P3DX (D, SP, SCLK, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D;
   input SP;
   input SCLK;
   input CD;
   output Q;
endmodule

module IFS1P3IX (D, SP, SCLK, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D;
   input SP;
   input SCLK;
   input CD;
   output Q;
endmodule

module IFS1P3JX (D, SP, SCLK, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D;
   input SP;
   input SCLK;
   input PD;
   output Q;
endmodule

module IFS1S1B (D, SCLK, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D;
   input SCLK;
   input PD;
   output Q;
endmodule

module IFS1S1D (D, SCLK, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D;
   input SCLK;
   input CD;
   output Q;
endmodule

module IFS1S1I (D, SCLK, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D;
   input SCLK;
   input CD;
   output Q;
endmodule

module IFS1S1J (D, SCLK, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D;
   input SCLK;
   input PD;
   output Q;
endmodule

module ILVDS (A, AN, Z);  //synthesis syn_black_box black_box_pad_pin="A,AN"
   input  A;
   input  AN;
   output Z;
endmodule

module INV (A, Z);  //synthesis syn_black_box
   input A;
   output Z;
endmodule

module L6MUX21 (D0, D1, SD, Z);  //synthesis syn_black_box
   input D0;
   input D1;
   input SD;
   output Z;
endmodule

module LUT4 (A, B, C, D, Z);  //synthesis syn_black_box
   parameter [15:0] init = 16'h0000 ;
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   output Z ;
endmodule

module LUT5 (Z, A, B, C, D, E);  //synthesis syn_black_box
   parameter [31:0] init = 32'h00000000 ;
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   output Z ;
endmodule

module LUT6 (Z, A, B, C, D, E, F);  //synthesis syn_black_box
   parameter [63:0] init = 64'h0000000000000000 ;
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   input  F ;
   output Z ;
endmodule

module LUT7 (Z, A, B, C, D, E, F, G);  //synthesis syn_black_box
   parameter [127:0] init = 128'h00000000000000000000000000000000 ;
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   input  F ;
   input  G ;
   output  Z ;
endmodule

module LUT8 (Z, A, B, C, D, E, F, G, H);  //synthesis syn_black_box
   parameter [255:0] init = 256'h0000000000000000000000000000000000000000000000000000000000000000;
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   input  F ;
   input  G ;
   input  H ;
   output  Z ;
endmodule

module MUX161 (D15, D14, D13, D12, D11, D10, D9, D8, D7, D6, D5, D4, D3, D2, D1, D0, SD4, SD3, SD2, SD1, Z);  //synthesis syn_black_box
   input D15;
   input D14;
   input D13;
   input D12;
   input D11;
   input D10;
   input D9;
   input D8;
   input D7;
   input D6;
   input D5;
   input D4;
   input D3;
   input D2;
   input D1;
   input D0;
   input SD4;
   input SD3;
   input SD2;
   input SD1;
   output Z;
endmodule

module MUX21 (D1, D0, SD, Z);  //synthesis syn_black_box
   input D1;
   input D0;
   input SD;
   output Z;
endmodule

module MUX321 (D31, D30, D29, D28, D27, D26, D25, D24, D23, D22, D21, D20, D19, D18, D17, D16, D15, D14, D13, D12, D11, D10, D9, D8, D7, D6, D5, D4, D3, D2, D1, D0, SD5, SD4, SD3, SD2, SD1, Z);  //synthesis syn_black_box
   input D31;
   input D30;
   input D29;
   input D28;
   input D27;
   input D26;
   input D25;
   input D24;
   input D23;
   input D22;
   input D21;
   input D20;
   input D19;
   input D18;
   input D17;
   input D16;
   input D15;
   input D14;
   input D13;
   input D12;
   input D11;
   input D10;
   input D9;
   input D8;
   input D7;
   input D6;
   input D5;
   input D4;
   input D3;
   input D2;
   input D1;
   input D0;
   input SD5;
   input SD4;
   input SD3;
   input SD2;
   input SD1;
   output Z;
endmodule

module MUX41 (D3, D2, D1, D0, SD2, SD1, Z);  //synthesis syn_black_box
   input D3 ;
   input D2 ;
   input D1 ;
   input D0 ;
   input SD2 ;
   input SD1 ;
   output Z ;
endmodule

module MUX81 (D7, D6, D5, D4, D3, D2, D1, D0, SD3, SD2, SD1, Z);  //synthesis syn_black_box
   input D7 ;
   input D6 ;
   input D5 ;
   input D4 ;
   input D3 ;
   input D2 ;
   input D1 ;
   input D0 ;
   input SD3 ;
   input SD2 ;
   input SD1 ;
   output Z ;
endmodule

module ND2 (A, B, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   output Z ;
endmodule

module ND3  (A, B, C, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   output Z ;
endmodule 

module ND4  (A, B, C, D, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   output Z ;
endmodule 

module ND5  (A, B, C, D, E, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   output Z ;
endmodule 

module NR2 (A, B, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   output Z ;
endmodule 

module NR3 (A, B, C, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   output Z ;
endmodule 

module NR4 (A, B, C, D, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   output Z ;
endmodule 

module NR5 (A, B, C, D, E, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   output Z ;
endmodule 

module OB (I, O);  //synthesis syn_black_box black_box_pad_pin="O"
   input  I ;
   output O ;
endmodule 

module OBCO (I, OT, OC);  //synthesis syn_black_box black_box_pad_pin="OT,OC"
   input  I ;
   output OT ;
   output OC ;
endmodule 

module OBZ (I, T, O);  //synthesis syn_black_box black_box_pad_pin="O"
   input I ;
   input T ;
   output O ;
endmodule 

module OBZPU (I, T, O);  //synthesis syn_black_box black_box_pad_pin="O"
   input I ;
   input T ;
   output O ;
endmodule

module OFS1P3BX (D, SP, SCLK, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input SCLK ;
   input PD ;
   output Q ;
endmodule

module OFS1P3DX (D, SP, SCLK, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input SCLK ;
   input CD ;
   output Q ;
endmodule

module OFS1P3IX (D, SP, SCLK, CD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input SCLK ;
   input CD ;
   output Q ;
endmodule

module OFS1P3JX (D, SP, SCLK, PD, Q);  //synthesis syn_black_box
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input SCLK ;
   input PD ;
   output Q ;
endmodule

module OLVDS (A, Z, ZN);  //synthesis syn_black_box black_box_pad_pin="Z,ZN"
   input  A;
   output Z;
   output ZN;
endmodule

module OR2 (A, B, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   output Z ;
endmodule 

module OR3 (A, B, C, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   output Z ;
endmodule 

module OR4 (A, B, C, D, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   output Z ;
endmodule 

module OR5 (A, B, C, D, E, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   output Z ;
endmodule 

module PFUMX (ALUT, BLUT, C0, Z);  //synthesis syn_black_box
   input  ALUT ;
   input  BLUT ;
   input  C0 ;
   output Z ;
endmodule

module PUR (PUR)/* synthesis syn_black_box syn_noprune=1 */;
  parameter RST_PULSE = 1;
  input PUR;
endmodule

module ROM128X1A (AD6, AD5, AD4, AD3, AD2, AD1, AD0, DO0);  //synthesis syn_black_box
   parameter [127:0] initval = 128'h00000000000000000000000000000000;
   input AD6 ;
   input AD5 ;
   input AD4 ;
   input AD3 ;
   input AD2 ;
   input AD1 ;
   input AD0 ;
   output DO0 ;
endmodule

module ROM16X1A (AD3, AD2, AD1, AD0, DO0);  //synthesis syn_black_box
   parameter [15:0] initval = 16'h0000;
   input AD3 ;
   input AD2 ;
   input AD1 ;
   input AD0 ;
   output DO0 ;
endmodule

module ROM256X1A (AD7, AD6, AD5, AD4, AD3, AD2, AD1, AD0, DO0);  //synthesis syn_black_box
   parameter [255:0] initval = 256'h0000000000000000000000000000000000000000000000000000000000000000;
   input AD7 ;
   input AD6 ;
   input AD5 ;
   input AD4 ;
   input AD3 ;
   input AD2 ;
   input AD1 ;
   input AD0 ;
   output DO0 ;
endmodule

module ROM32X1A (AD4, AD3, AD2, AD1, AD0, DO0);  //synthesis syn_black_box
   parameter [31:0] initval = 32'h00000000;
   input AD4 ;
   input AD3 ;
   input AD2 ;
   input AD1 ;
   input AD0 ;
   output DO0 ;
endmodule

module ROM64X1A (AD5, AD4, AD3, AD2, AD1, AD0, DO0);  //synthesis syn_black_box
   parameter [63:0] initval = 64'h0000000000000000;
   input AD5 ;
   input AD4 ;
   input AD3 ;
   input AD2 ;
   input AD1 ;
   input AD0 ;
   output DO0 ;
endmodule

module SGSR (GSR, CLK);  //synthesis syn_black_box syn_noprune=1
   input GSR, CLK;
endmodule

module VHI (Z);  //synthesis syn_black_box
   output Z ;
endmodule 

module VLO (Z);  //synthesis syn_black_box
   output Z ;
endmodule

module XNOR2 (A, B, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   output Z;
endmodule 

module XNOR3 (A, B, C, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   output Z;
endmodule 

module XNOR4 (A, B, C, D, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   output Z;
endmodule 

module XNOR5 (A, B, C, D, E, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   output Z;
endmodule 

module XOR11 (A, B, C, D, E, F, G, H, I, J, K, Z);  //synthesis syn_black_box
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   input  F ;
   input  G ;
   input  H ;
   input  I ;
   input  J ;
   input  K ;
   output Z;
endmodule 

module XOR2 (A, B, Z);  //synthesis syn_black_box
   input A ;
   input B ;
   output Z;
endmodule 

module XOR21 (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, Z);  //synthesis syn_black_box 
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   input  F ;
   input  G ;
   input  H ;
   input  I ;
   input  J ;
   input  K ;
   input  L ;
   input  M ;
   input  N ;
   input  O ; 
   input  P ; 
   input  Q ; 
   input  R ; 
   input  S ; 
   input  T ; 
   input  U ; 
   output Z ;
endmodule 

module XOR3 (A, B, C, Z);  //synthesis syn_black_box
   input A ;
   input B ;
   input C ;
   output Z;
endmodule 

module XOR4 (A, B, C, D, Z);  //synthesis syn_black_box
   input A ;
   input B ;
   input C ;
   input D ;
   output Z;
endmodule 

module XOR5 (A, B, C, D, E, Z);  //synthesis syn_black_box
   input A ;
   input B ;
   input C ;
   input D ;
   input E ;
   output Z;
endmodule 
// End of Basic Elements

module DPR16X4C (
input  DI3, DI2, DI1, DI0, WAD3,WAD2,WAD1,WAD0, WCK, WRE,
input  RAD3,RAD2,RAD1,RAD0,
output DO3, DO2, DO1, DO0 );  //synthesis syn_black_box
parameter  initval = "0x0000000000000000";
endmodule

module SPR16X4C (
input  DI3, DI2, DI1, DI0, AD3, AD2, AD1, AD0, CK, WRE,
output DO3, DO2, DO1, DO0 );  //synthesis syn_black_box
parameter  initval = "0x0000000000000000";
endmodule

module LVDSOB (
input  D,
input  E,
output  Q );  //synthesis syn_black_box
endmodule

module MIPIRX (
input AP, AN, TP,TN,HSSEL,
output OLSP,OLSN,OHS,
inout BN,BP);  //synthesis syn_black_box black_box_pad_pin="BP,BN"
endmodule

module MIPITX (
input AP, AN, TP,TN,HSSEL,
output OLSP,OLSN,
inout BN,BP);  //synthesis syn_black_box black_box_pad_pin="BP,BN"
endmodule

module BCINRD (
input  INRDENI );  //synthesis syn_black_box syn_noprune=1
parameter  BANKID=2;
endmodule

module BCLVDSOB (
input LVDSENI );  //synthesis syn_black_box syn_noprune=1
parameter BANKID = 2;
endmodule

module INRDB (
input  D,
input  E,
output  Q );  //synthesis syn_black_box
endmodule

module CLKDIVG (
        CLKI, RST, ALIGNWD, CDIVX);//synthesis syn_black_box
   input CLKI, RST, ALIGNWD;
   output CDIVX;

   parameter GSR = "DISABLED";
   parameter DIV = "2.0";
endmodule

module DCSC (
input   CLK1, CLK0, SEL1, SEL0, MODESEL,
output  DCSOUT );  //synthesis syn_black_box
parameter  DCSMODE = "POS";
endmodule

module DCCA (
input CLKI, CE,
output CLKO );  //synthesis syn_black_box
endmodule

module ECLKSYNCB (
input  ECLKI, STOP,
output ECLKO );  //synthesis syn_black_box
endmodule

module PLLREFCS (
input CLK0,CLK1,SEL,
output PLLCSOUT );  //synthesis syn_black_box
endmodule

module DELAYH (
input A, LOADN, MOVE, DIRECTION,
output Z, CFLAG );  //synthesis syn_black_box
parameter  DEL_MODE = "USER_DEFINED";
parameter  DEL_VALUE = 0;
endmodule

module DELAYI (
input  A,
output  Z );  //synthesis syn_black_box
parameter  DEL_MODE = "USER_DEFINED";
parameter  DEL_VALUE = 0;
endmodule

module DDRDLLA (
input   CLK, RST, UDDCNTLN, FREEZE,
output  DDRDEL, LOCK,
output  DCNTL7,DCNTL6,DCNTL5,DCNTL4,DCNTL3,DCNTL2,DCNTL1,DCNTL0 );  //synthesis syn_black_box
parameter FORCE_MAX_DELAY = "NO";
parameter GSR = "ENABLED";
endmodule

module DLLDELD (
input   A, DDRDEL,LOADN,MOVE,DIRECTION,
output  Z, CFLAG );  //synthesis syn_black_box
endmodule

module IDDRX1F (
input D, SCLK, RST,
output Q0, Q1 );  //synthesis syn_black_box
parameter GSR = "ENABLED";
endmodule

module IDDRX2F (
input D, SCLK, ECLK, RST, ALIGNWD,
output Q3, Q2, Q1, Q0 );  //synthesis syn_black_box
parameter GSR = "ENABLED";
endmodule

module IDDR71B (
input  D, SCLK,ECLK,RST,ALIGNWD,
output  Q6,Q5,Q4,Q3,Q2,Q1,Q0 );  //synthesis syn_black_box
parameter GSR = "ENABLED";
endmodule

module ODDRX1F (
input SCLK, RST, D0, D1,
output Q );  //synthesis syn_black_box
parameter GSR = "ENABLED";
endmodule

module ODDRX2F (
input SCLK,ECLK,RST,D3,D2,D1,D0,
output Q );  //synthesis syn_black_box
parameter GSR = "ENABLED";
endmodule

module ODDR71B (
input SCLK,ECLK,RST,D6,D5,D4,D3,D2,D1,D0,
output Q );  //synthesis syn_black_box
parameter GSR = "ENABLED";
endmodule

module EHXPLLM (
input    CLKI, CLKFB, PHASESEL1, PHASESEL0, PHASEDIR, PHASESTEP, PHASELOADREG,
 PLLWAKESYNC, RST, ENCLKOP, ENCLKOS, ENCLKOS2, ENCLKOS3, USRSTDBY,
output   CLKOP, CLKOS, CLKOS2, CLKOS3, LOCK, INTLOCK, REFCLK, CLKINTFB);//synthesis syn_black_box

parameter FIN = "100.0000";
parameter CLKI_DIV = 1;
parameter CLKFB_DIV = 1;
parameter CLKOP_DIV = 1;
parameter CLKOS_DIV = 1;
parameter CLKOS2_DIV = 1;
parameter CLKOS3_DIV = 1;
parameter CLKOP_ENABLE = "ENABLED";
parameter CLKOS_ENABLE = "DISABLED";
parameter CLKOS2_ENABLE = "DISABLED";
parameter CLKOS3_ENABLE = "DISABLED";
parameter CLKOP_CPHASE = 0;
parameter CLKOS_CPHASE = 0;
parameter CLKOS2_CPHASE = 0;
parameter CLKOS3_CPHASE = 0;
parameter CLKOP_FPHASE = 0;
parameter CLKOS_FPHASE = 0;
parameter CLKOS2_FPHASE = 0;
parameter CLKOS3_FPHASE = 0;
parameter FEEDBK_PATH = "CLKOP";
parameter CLKOP_TRIM_POL = "RISING";
parameter CLKOP_TRIM_DELAY = 0;
parameter CLKOS_TRIM_POL = "RISING";
parameter CLKOS_TRIM_DELAY = 0;
parameter OUTDIVIDER_MUXA = "DIVA";
parameter OUTDIVIDER_MUXB = "DIVB";
parameter OUTDIVIDER_MUXC = "DIVC";
parameter OUTDIVIDER_MUXD = "DIVD";
parameter PLL_LOCK_MODE = 0;
parameter PLL_LOCK_DELAY = 200;
parameter REFIN_RESET = "DISABLED";
parameter SYNC_ENABLE = "DISABLED";
parameter INT_LOCK_STICKY = "ENABLED";
parameter DPHASE_SOURCE = "DISABLED";
parameter STDBY_ENABLE = "DISABLED";
parameter PLLRST_ENA = "DISABLED";
parameter INTFB_WAKE = "DISABLED";

endmodule

module OSCI(
input   HFOUTEN,
output   HFCLKOUT, LFCLKOUT);//synthesis syn_black_box
  parameter HFCLKDIV = 1;
endmodule

module DP8KE (
input    DIA8, DIA7, DIA6, DIA5, DIA4, DIA3, DIA2, DIA1, DIA0,
         ADA12, ADA11, ADA10, ADA9, ADA8, ADA7, ADA6, ADA5,
         ADA4,  ADA3,  ADA2, ADA1, ADA0,
         CEA, OCEA, CLKA, WEA, CSA2, CSA1, CSA0, RSTA, 
         DIB8, DIB7, DIB6, DIB5, DIB4, DIB3, DIB2, DIB1, DIB0,
         ADB12, ADB11, ADB10, ADB9, ADB8, ADB7, ADB6, ADB5,
         ADB4,  ADB3,  ADB2, ADB1, ADB0,
         CEB, OCEB, CLKB, WEB, CSB2, CSB1, CSB0, RSTB,
output   DOA8, DOA7, DOA6, DOA5, DOA4, DOA3, DOA2, DOA1, DOA0,
         DOB8, DOB7, DOB6, DOB5, DOB4, DOB3, DOB2, DOB1, DOB0);//synthesis syn_black_box

parameter  DATA_WIDTH_A = 9;
parameter  DATA_WIDTH_B = 9;
parameter  REGMODE_A = "NOREG";
parameter  REGMODE_B = "NOREG";
parameter  CSDECODE_A = "0b000";
parameter  CSDECODE_B = "0b000";
parameter  WRITEMODE_A = "NORMAL";
parameter  WRITEMODE_B = "NORMAL";
parameter  GSR = "ENABLED";
parameter RESETMODE = "SYNC";
parameter  ASYNC_RESET_RELEASE = "SYNC";
parameter  INIT_DATA = "STATIC";

parameter INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
endmodule 

module PDPW8KE (
input    DI17, DI16, DI15, DI14, DI13, DI12, DI11, DI10, DI9,
         DI8, DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0,
         BE1, BE0, 
         ADW8, ADW7, ADW6, ADW5, ADW4, ADW3, ADW2, ADW1, ADW0,
         CEW, CLKW, CSW2, CSW1, CSW0,
         ADR12, ADR11, ADR10, ADR9, ADR8, ADR7, ADR6, ADR5,
         ADR4, ADR3, ADR2, ADR1, ADR0,
         CER, OCER, CLKR, CSR2, CSR1, CSR0, RST,

output   DO17, DO16, DO15, DO14, DO13, DO12, DO11, DO10, DO9,
         DO8, DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0);//synthesis syn_black_box

parameter  DATA_WIDTH_W = 18;
parameter  DATA_WIDTH_R = 18;
parameter  REGMODE = "NOREG";
parameter  CSDECODE_W = "0b000";
parameter  CSDECODE_R = "0b000";
parameter  GSR = "ENABLED";
parameter RESETMODE = "SYNC";
parameter  ASYNC_RESET_RELEASE = "SYNC";
parameter  INIT_DATA = "STATIC";

parameter INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
endmodule

module IDDRX4C(
        D, ECLK, SCLK, RST, ALIGNWD, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7);//synthesis syn_black_box

input  D, ECLK, SCLK, RST, ALIGNWD;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;

   parameter  GSR = "ENABLED";           
endmodule

module IDDR141A(
        D, ECLK, SCLK, RST, ALIGNWD, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13);//synthesis syn_black_box

input  D, ECLK, SCLK, RST, ALIGNWD;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13;

   parameter  GSR = "ENABLED";
endmodule

module IDDRX8A(
        D, ECLK, SCLK, RST, ALIGNWD, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15);//synthesis syn_black_box

input  D, ECLK, SCLK, RST, ALIGNWD;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15;

   parameter  GSR = "ENABLED";
endmodule

module ODDRX4C(
        D0, D1, D2, D3, D4, D5, D6, D7, RST, ECLK, SCLK, Q);//synthesis syn_black_box

   input D0, D1, D2, D3, D4, D5, D6, D7, RST, ECLK, SCLK;
   output Q;
  parameter GSR = "ENABLED";
endmodule
module ODDR141A(
        D0, D1, D2, D3, D4, D5, D6, D7,D8, D9, D10, D11, D12, D13, RST, ECLK, SCLK, Q);//synthesis syn_black_box

   input D0, D1, D2, D3, D4, D5, D6, D7,D8, D9, D10, D11, D12, D13, RST, ECLK, SCLK;
   output Q;

  parameter GSR = "ENABLED";
endmodule 

module ODDRX8A(
        D0, D1, D2, D3, D4, D5, D6, D7,D8, D9, D10, D11, D12, D13, D14, D15, RST, ECLK, SCLK, Q);//synthesis syn_black_box

   input D0, D1, D2, D3, D4, D5, D6, D7,D8, D9, D10, D11, D12, D13, D14, D15, RST, ECLK, SCLK;
   output Q;

  parameter GSR = "ENABLED";
endmodule

module PMUA(
input USRWKUPN,PMUWKUP,PMUCLK, USRCLK, USRCS, USRSTB, USRADR3, USRADR2,
USRADR1, USRADR0,USRDATA7, USRDATA6, USRDATA5, USRDATA4, USRDATA3, USRDATA2, USRDATA1,
USRDATA0,SLEEP, output USRWDTDONE, USRWDTINT);//synthesis syn_black_box

//parameter CLKSRC ="INTCLK";
parameter UWDTEN = "DISABLED";
parameter UWDTMD = "COUNT_ONCE";
parameter UWDTINT = "ENABLED";
parameter EXTEN = "DISABLED";
parameter I2CEN = "ENABLED";
parameter WDTEN = "ENABLED";
parameter SLPCNT = "COUNTER_1";

parameter PMUWDTCNT1 = "0x00000000";
parameter PMUWDTCNT2 = "0x00000000";
parameter PMUWDTCNT3 = "0x00000000";

endmodule





module I2CA(
	input CSI,
	input CLKI,
	input STBI,
	input WEI,
	input ADRI3, ADRI2, ADRI1, ADRI0,
	input DATI9, DATI8, DATI7, DATI6, DATI5, DATI4, DATI3, DATI2, DATI1, DATI0,
	output DATO9, DATO8, DATO7, DATO6, DATO5, DATO4, DATO3, DATO2, DATO1, DATO0,
	output ACKO,
	output I2CIRQ,
	output I2CWKUP,
	output PMUWKUP,
	
	input FIFORST,
	output MRDCMPL,
	output SRDWR,
	output TXFIFOAE,
	output TXFIFOE,
	output TXFIFOF,
	output RXFIFOE,
	output RXFIFOAF,
	output RXFIFOF,
	
	input SCLI,
	output SCLO,
	output SCLOEN,
	input SDAI,
	output SDAO,
	output SDAOEN
);//synthesis syn_black_box
	  parameter I2C_ADDRESSING = "7BIT";		  //
	  parameter I2C_SLAVE_ADDR = "0b1000001";		 
//	  parameter I2C_FIFO_SLAVE_ADDR	= "0b1000001";
	  parameter I2C_BUS_PERF = "100kHz";		  //core
	  parameter I2C_CLK_DIVIDER = 1;			   
	  parameter I2C_GEN_CALL = "DISABLED";
//	  parameter I2C_WAKEUP = "DISABLED";
	
	  parameter I2C_INTR_ARBIT = "DISABLED";
	  parameter I2C_INTR_TXRXRDY = "DISABLED";
	  parameter I2C_INTR_NACK = "DISABLED";
	  parameter I2C_INTR_GC = "DISABLED";
	 
	  parameter I2C_WAKEUP_SLAVE = "DISABLED";// "ENABLED" 
	  parameter I2C_WAKEUP_MASTER = "DISABLED";// "ENABLED" 	 
	  parameter SDA_I_DELAY = 0; //50 									 //core
	  parameter SDA_O_DELAY =0;// 50, 75, 125, 150, 200, 300, 350		 //core

	  
	  parameter I2C_FIFO_ENB = "DISABLED";
	  parameter I2C_FIFO_CLKSTR = "DISABLED";
	  parameter I2C_FIFO_RXALMOSTF = 30;
	  parameter I2C_FIFO_TXALMOSTE = 3;
	  parameter I2C_FIFO_INTR_GC = "DISABLED";		 	 //I2CFIFOINTCR[4]
	  parameter I2C_FIFO_INTR_NACK = "DISABLED";		
	  parameter I2C_FIFO_MRXRDY = "DISABLED";			 
	  parameter I2C_FIFO_INTR_ARBIT = "DISABLED";		 
	  parameter I2C_FIFO_TXSYNC = "DISABLED";
	  parameter I2C_FIFO_TXUNDER = "DISABLED";
	  parameter I2C_FIFO_RXOVER = "DISABLED";
endmodule 


module ANEB2 (A1, A0, B1, B0, CI, NE);  //synthesis syn_black_box
input  A1 ;
input  A0 ;
input  B1 ;
input  B0 ;
input  CI ;
output NE ;
endmodule


module MIPICDPHYA (
	input UENABLE,
	input P1,
	input P2,
	input P3,
	input P4,
	input P5,
	input P6,
	input P7,
	input P8,
	input P9,
	input P10,
	input P11,
	input UTXREQUESTHS,
	input UTXSKEWCALHS,
	input UTXREQUESTESC,
	input UTXLPDTESC,
	input UTXULPSESC,
	input UTXVALIDESC,
	input UTXULPSEXIT,
	input UTURNREQUEST,
	input UTURNDISABLE,
	input UTXTRIGESC0,
	input UTXTRIGESC1,
	input UTXTRIGESC2,
	input UTXTRIGESC3,
	input UFRCRXMOD,
	input UFRCTXSTOPMOD,
	input URXCLKINESC,
	input UTXCLKESC,
	input UTXDATAESC0,
	input UTXDATAESC1,
	input UTXDATAESC2,
	input UTXDATAESC3,
	input UTXDATAESC4,
	input UTXDATAESC5,
	input UTXDATAESC6,
	input UTXDATAESC7,
	input UTXWRDVALIDHS3,
	input UTXWRDVALIDHS2,
	input UTXWRDVALIDHS1,
	input UTXWRDVALIDHS0,
	input UTXSNDSYNCHS3,
	input UTXSNDSYNCHS2,
	input UTXSNDSYNCHS1,
	input UTXSNDSYNCHS0,
	input UTXDATAHS63,
	input UTXDATAHS62,
	input UTXDATAHS61,
	input UTXDATAHS60,
	input UTXDATAHS59,
	input UTXDATAHS58,
	input UTXDATAHS57,
	input UTXDATAHS56,
	input UTXDATAHS55,
	input UTXDATAHS54,
	input UTXDATAHS53,
	input UTXDATAHS52,
	input UTXDATAHS51,
	input UTXDATAHS50,
	input UTXDATAHS49,
	input UTXDATAHS48,
	input UTXDATAHS47,
	input UTXDATAHS46,
	input UTXDATAHS45,
	input UTXDATAHS44,
	input UTXDATAHS43,
	input UTXDATAHS42,
	input UTXDATAHS41,
	input UTXDATAHS40,
	input UTXDATAHS39,
	input UTXDATAHS38,
	input UTXDATAHS37,
	input UTXDATAHS36,
	input UTXDATAHS35,
	input UTXDATAHS34,
	input UTXDATAHS33,
	input UTXDATAHS32,
	input UTXDATAHS31,
	input UTXDATAHS30,
	input UTXDATAHS29,
	input UTXDATAHS28,
	input UTXDATAHS27,
	input UTXDATAHS26,
	input UTXDATAHS25,
	input UTXDATAHS24,
	input UTXDATAHS23,
	input UTXDATAHS22,
	input UTXDATAHS21,
	input UTXDATAHS20,
	input UTXDATAHS19,
	input UTXDATAHS18,
	input UTXDATAHS17,
	input UTXDATAHS16,
	input UTXDATAHS15,
	input UTXDATAHS14,
	input UTXDATAHS13,
	input UTXDATAHS12,
	input UTXDATAHS11,
	input UTXDATAHS10,
	input UTXDATAHS9,
	input UTXDATAHS8,
	input UTXDATAHS7,
	input UTXDATAHS6,
	input UTXDATAHS5,
	input UTXDATAHS4,
	input UTXDATAHS3,
	input UTXDATAHS2,
	input UTXDATAHS1,
	input UTXDATAHS0,
	input U1ENABLE,
	input U1TXREQUESTHS,
	input U1TXSKEWCALHS,
	input U1TXREQUESTESC,
	input U1TXLPDTESC,
	input U1TXULPSESC,
	input U1TXVALIDESC,
	input U1TXULPSEXIT,
	input U1TURNREQUEST,
	input U1TURNDISABLE,
	input U1TXTRIGESC0,
	input U1TXTRIGESC1,
	input U1TXTRIGESC2,
	input U1TXTRIGESC3,
	input U1FRCRXMOD,
	input U1FRCTXSTOPMOD,
	input U1TXDATAESC0,
	input U1TXDATAESC1,
	input U1TXDATAESC2,
	input U1TXDATAESC3,
	input U1TXDATAESC4,
	input U1TXDATAESC5,
	input U1TXDATAESC6,
	input U1TXDATAESC7,
	input U1TXWRDVLDHS3,
	input U1TXWRDVLDHS2,
	input U1TXWRDVLDHS1,
	input U1TXWRDVLDHS0,
	input U1TXSNDSYNCHS3,
	input U1TXSNDSYNCHS2,
	input U1TXSNDSYNCHS1,
	input U1TXSNDSYNCHS0,
	input U1TXDATAHS63,
	input U1TXDATAHS62,
	input U1TXDATAHS61,
	input U1TXDATAHS60,
	input U1TXDATAHS59,
	input U1TXDATAHS58,
	input U1TXDATAHS57,
	input U1TXDATAHS56,
	input U1TXDATAHS55,
	input U1TXDATAHS54,
	input U1TXDATAHS53,
	input U1TXDATAHS52,
	input U1TXDATAHS51,
	input U1TXDATAHS50,
	input U1TXDATAHS49,
	input U1TXDATAHS48,
	input U1TXDATAHS47,
	input U1TXDATAHS46,
	input U1TXDATAHS45,
	input U1TXDATAHS44,
	input U1TXDATAHS43,
	input U1TXDATAHS42,
	input U1TXDATAHS41,
	input U1TXDATAHS40,
	input U1TXDATAHS39,
	input U1TXDATAHS38,
	input U1TXDATAHS37,
	input U1TXDATAHS36,
	input U1TXDATAHS35,
	input U1TXDATAHS34,
	input U1TXDATAHS33,
	input U1TXDATAHS32,
	input U1TXDATAHS31,
	input U1TXDATAHS30,
	input U1TXDATAHS29,
	input U1TXDATAHS28,
	input U1TXDATAHS27,
	input U1TXDATAHS26,
	input U1TXDATAHS25,
	input U1TXDATAHS24,
	input U1TXDATAHS23,
	input U1TXDATAHS22,
	input U1TXDATAHS21,
	input U1TXDATAHS20,
	input U1TXDATAHS19,
	input U1TXDATAHS18,
	input U1TXDATAHS17,
	input U1TXDATAHS16,
	input U1TXDATAHS15,
	input U1TXDATAHS14,
	input U1TXDATAHS13,
	input U1TXDATAHS12,
	input U1TXDATAHS11,
	input U1TXDATAHS10,
	input U1TXDATAHS9,
	input U1TXDATAHS8,
	input U1TXDATAHS7,
	input U1TXDATAHS6,
	input U1TXDATAHS5,
	input U1TXDATAHS4,
	input U1TXDATAHS3,
	input U1TXDATAHS2,
	input U1TXDATAHS1,
	input U1TXDATAHS0,
	input U2ENABLE,
	input U2TXREQUESTHS,
	input U2TXSKEWCALHS,
	input U2TXREQUESTESC,
	input U2TXLPDTESC,
	input U2TXULPSESC,
	input U2TXVALIDESC,
	input U2TXULPSEXIT,
	input U2TURNREQUEST,
	input U2TURNDISABLE,
	input U2TXTRIGESC0,
	input U2TXTRIGESC1,
	input U2TXTRIGESC2,
	input U2TXTRIGESC3,
	input U2FRCRXMOD,
	input U2FRCTXSTOPMOD,
	input U2TXDATAESC0,
	input U2TXDATAESC1,
	input U2TXDATAESC2,
	input U2TXDATAESC3,
	input U2TXDATAESC4,
	input U2TXDATAESC5,
	input U2TXDATAESC6,
	input U2TXDATAESC7,
	input U2TXWRDVLDHS3,
	input U2TXWRDVLDHS2,
	input U2TXWRDVLDHS1,
	input U2TXWRDVLDHS0,
	input U2TXSNDSYNCHS3,
	input U2TXSNDSYNCHS2,
	input U2TXSNDSYNCHS1,
	input U2TXSNDSYNCHS0,
	input U2TXDATAHS31,
	input U2TXDATAHS30,
	input U2TXDATAHS29,
	input U2TXDATAHS28,
	input U2TXDATAHS27,
	input U2TXDATAHS26,
	input U2TXDATAHS25,
	input U2TXDATAHS24,
	input U2TXDATAHS23,
	input U2TXDATAHS22,
	input U2TXDATAHS21,
	input U2TXDATAHS20,
	input U2TXDATAHS19,
	input U2TXDATAHS18,
	input U2TXDATAHS17,
	input U2TXDATAHS16,
	input U2TXDATAHS15,
	input U2TXDATAHS14,
	input U2TXDATAHS13,
	input U2TXDATAHS12,
	input U2TXDATAHS11,
	input U2TXDATAHS10,
	input U2TXDATAHS9,
	input U2TXDATAHS8,
	input U2TXDATAHS7,
	input U2TXDATAHS6,
	input U2TXDATAHS5,
	input U2TXDATAHS4,
	input U2TXDATAHS3,
	input U2TXDATAHS2,
	input U2TXDATAHS1,
	input U2TXDATAHS0,
	input U3ENABLE,
	input U3TXREQUESTHS,
	input U3TXSKEWCALHS,
	input U3TXREQUESTESC,
	input U3TXTRIGESC0,
	input U3TXTRIGESC1,
	input U3TXTRIGESC2,
	input U3TXTRIGESC3,
	input U3FRCRXMOD,
	input U3FRCTXSTOPMOD,
	input U3TURNDISABLE,
	input U3TURNREQUEST,
	input U3TXVALIDESC,
	input U3TXULPSESC,
	input U3TXULPSEXIT,
	input U3TXLPDTESC,
	input U3TXDATAESC0,
	input U3TXDATAESC1,
	input U3TXDATAESC2,
	input U3TXDATAESC3,
	input U3TXDATAESC4,
	input U3TXDATAESC5,
	input U3TXDATAESC6,
	input U3TXDATAESC7,
	input U3TXWRDVLDHS3,
	input U3TXWRDVLDHS2,
	input U3TXWRDVLDHS1,
	input U3TXWRDVLDHS0,
	input U3TXDATAHS31,
	input U3TXDATAHS30,
	input U3TXDATAHS29,
	input U3TXDATAHS28,
	input U3TXDATAHS27,
	input U3TXDATAHS26,
	input U3TXDATAHS25,
	input U3TXDATAHS24,
	input U3TXDATAHS23,
	input U3TXDATAHS22,
	input U3TXDATAHS21,
	input U3TXDATAHS20,
	input U3TXDATAHS19,
	input U3TXDATAHS18,
	input U3TXDATAHS17,
	input U3TXDATAHS16,
	input U3TXDATAHS15,
	input U3TXDATAHS14,
	input U3TXDATAHS13,
	input U3TXDATAHS12,
	input U3TXDATAHS11,
	input U3TXDATAHS10,
	input U3TXDATAHS9,
	input U3TXDATAHS8,
	input U3TXDATAHS7,
	input U3TXDATAHS6,
	input U3TXDATAHS5,
	input U3TXDATAHS4,
	input U3TXDATAHS3,
	input U3TXDATAHS2,
	input U3TXDATAHS1,
	input U3TXDATAHS0,
	input UCENABLE,
	input UCTXREQUESTHS,
	input UCTXULPSCLK,
	input UCRXCLKACTVHS,
	input UCTXULPSEXIT,
	input PDPLL,
	input CLKREF,
	input PDPHY,
	input PDBIAS,
	input SCANMODIN,
	input SCANCLKIN,
	input SCANRSTNIN,
	input BITCLKEXT,
	input TST3,
	input TST2,
	input TST1,
	input TST0,
	input CN4,
	input CN3,
	input CN2,
	input CN1,
	input CN0,
	input CM7,
	input CM6,
	input CM5,
	input CM4,
	input CM3,
	input CM2,
	input CM1,
	input CM0,
	input CO1,
	input CO0,
	input C0MAPDATASEL,
	input C1MAPDATASEL,
	input C2MAPDATASEL,
	input PDCKG,
	input PDTXHS,
	input LB,
	input ENPDESER,
	input P11CDEN,
	input D0DTXHS,
	input D1DTXHS,
	input D2DTXHS,
	input D3DTXHS,
	input CLKDTXHS,
	input C0DTXHSA,
	input C0DTXHSB,
	input C0DTXHSC,
	input C1DTXHSA,
	input C1DTXHSB,
	input C1DTXHSC,
	input C2DTXHSA,
	input C2DTXHSB,
	input C2DTXHSC,
	input SLEEPN,
	input STOP,
	output UTXREADYSKEW,
	output URXSKEWCALHS,
	output UERRESC,
	output UERRSOTHS,
	output UERRSOTSYNCHS,
	output UTXREADYESC,
	output UERRSYNCESC,
	output UERRCONTROL,
	output UDIRECTION,
	output URXLPDTESC,
	output URXULPSESC,
	output URXVALIDESC,
	output URXWORDCLKHS,
	output UTXBYTECLKHS,
	output UTXREADYHS,
	output URXSKEWCALHSD,
	output URXTRIGESC0,
	output URXTRIGESC1,
	output URXTRIGESC2,
	output URXTRIGESC3,
	output USTOPSTATE,
	output URXVALIDHS3,
	output URXVALIDHS2,
	output URXVALIDHS1,
	output URXVALIDHS0,
	output URXINVLDCDHS3,
	output URXINVLDCDHS2,
	output URXINVLDCDHS1,
	output URXINVLDCDHS0,
	output URXACTVHS,
	output URXSYNCHS3,
	output URXSYNCHS2,
	output URXSYNCHS1,
	output URXSYNCHS0,
	output URXCLKESC,
	output URXDATAESC7,
	output URXDATAESC6,
	output URXDATAESC5,
	output URXDATAESC4,
	output URXDATAESC3,
	output URXDATAESC2,
	output URXDATAESC1,
	output URXDATAESC0,
	output UULPSACTVNOT,
	output UERRCONTENLP0,
	output UERRCONTENLP1,
	output URXDATAHS63,
	output URXDATAHS62,
	output URXDATAHS61,
	output URXDATAHS60,
	output URXDATAHS59,
	output URXDATAHS58,
	output URXDATAHS57,
	output URXDATAHS56,
	output URXDATAHS55,
	output URXDATAHS54,
	output URXDATAHS53,
	output URXDATAHS52,
	output URXDATAHS51,
	output URXDATAHS50,
	output URXDATAHS49,
	output URXDATAHS48,
	output URXDATAHS47,
	output URXDATAHS46,
	output URXDATAHS45,
	output URXDATAHS44,
	output URXDATAHS43,
	output URXDATAHS42,
	output URXDATAHS41,
	output URXDATAHS40,
	output URXDATAHS39,
	output URXDATAHS38,
	output URXDATAHS37,
	output URXDATAHS36,
	output URXDATAHS35,
	output URXDATAHS34,
	output URXDATAHS33,
	output URXDATAHS32,
	output URXDATAHS31,
	output URXDATAHS30,
	output URXDATAHS29,
	output URXDATAHS28,
	output URXDATAHS27,
	output URXDATAHS26,
	output URXDATAHS25,
	output URXDATAHS24,
	output URXDATAHS23,
	output URXDATAHS22,
	output URXDATAHS21,
	output URXDATAHS20,
	output URXDATAHS19,
	output URXDATAHS18,
	output URXDATAHS17,
	output URXDATAHS16,
	output URXDATAHS15,
	output URXDATAHS14,
	output URXDATAHS13,
	output URXDATAHS12,
	output URXDATAHS11,
	output URXDATAHS10,
	output URXDATAHS9,
	output URXDATAHS8,
	output URXDATAHS7,
	output URXDATAHS6,
	output URXDATAHS5,
	output URXDATAHS4,
	output URXDATAHS3,
	output URXDATAHS2,
	output URXDATAHS1,
	output URXDATAHS0,
	output U1TXREADYSKEW,
	output U1RXSKEWCALHS,
	output U1ERRESC,
	output U1ERRSOTHS,
	output U1ERRSOTSYNCHS,
	output U1TXREADYESC,
	output U1ERRSYNCESC,
	output U1ERRCONTROL,
	output U1DIRECTION,
	output U1RXLPDTESC,
	output U1RXULPSESC,
	output U1RXVALIDESC,
	output U1ULPSACTVNOT,
	output U1RXWORDCLKHS,
	output U1TXREADYHS,
	output U1RXSKEWCALHSD,
	output U1RXTRIGESC0,
	output U1RXTRIGESC1,
	output U1RXTRIGESC2,
	output U1RXTRIGESC3,
	output U1STOPSTATE,
	output U1RXVLDHS3,
	output U1RXVLDHS2,
	output U1RXVLDHS1,
	output U1RXVLDHS0,
	output U1RXINVLDCDHS3,
	output U1RXINVLDCDHS2,
	output U1RXINVLDCDHS1,
	output U1RXINVLDCDHS0,
	output U1RXACTVHS,
	output U1RXSYNCHS3,
	output U1RXSYNCHS2,
	output U1RXSYNCHS1,
	output U1RXSYNCHS0,
	output U1RXCLKESC,
	output U1RXDATAESC7,
	output U1RXDATAESC6,
	output U1RXDATAESC5,
	output U1RXDATAESC4,
	output U1RXDATAESC3,
	output U1RXDATAESC2,
	output U1RXDATAESC1,
	output U1RXDATAESC0,
	output U1ERRCONTENLP0,
	output U1ERRCONTENLP1,
	output U1RXDATAHS63,
	output U1RXDATAHS62,
	output U1RXDATAHS61,
	output U1RXDATAHS60,
	output U1RXDATAHS59,
	output U1RXDATAHS58,
	output U1RXDATAHS57,
	output U1RXDATAHS56,
	output U1RXDATAHS55,
	output U1RXDATAHS54,
	output U1RXDATAHS53,
	output U1RXDATAHS52,
	output U1RXDATAHS51,
	output U1RXDATAHS50,
	output U1RXDATAHS49,
	output U1RXDATAHS48,
	output U1RXDATAHS47,
	output U1RXDATAHS46,
	output U1RXDATAHS45,
	output U1RXDATAHS44,
	output U1RXDATAHS43,
	output U1RXDATAHS42,
	output U1RXDATAHS41,
	output U1RXDATAHS40,
	output U1RXDATAHS39,
	output U1RXDATAHS38,
	output U1RXDATAHS37,
	output U1RXDATAHS36,
	output U1RXDATAHS35,
	output U1RXDATAHS34,
	output U1RXDATAHS33,
	output U1RXDATAHS32,
	output U1RXDATAHS31,
	output U1RXDATAHS30,
	output U1RXDATAHS29,
	output U1RXDATAHS28,
	output U1RXDATAHS27,
	output U1RXDATAHS26,
	output U1RXDATAHS25,
	output U1RXDATAHS24,
	output U1RXDATAHS23,
	output U1RXDATAHS22,
	output U1RXDATAHS21,
	output U1RXDATAHS20,
	output U1RXDATAHS19,
	output U1RXDATAHS18,
	output U1RXDATAHS17,
	output U1RXDATAHS16,
	output U1RXDATAHS15,
	output U1RXDATAHS14,
	output U1RXDATAHS13,
	output U1RXDATAHS12,
	output U1RXDATAHS11,
	output U1RXDATAHS10,
	output U1RXDATAHS9,
	output U1RXDATAHS8,
	output U1RXDATAHS7,
	output U1RXDATAHS6,
	output U1RXDATAHS5,
	output U1RXDATAHS4,
	output U1RXDATAHS3,
	output U1RXDATAHS2,
	output U1RXDATAHS1,
	output U1RXDATAHS0,
	output U2TXREADYSKEW,
	output U2RXSKEWCALHS,
	output U2ERRESC,
	output U2ERRSOTHS,
	output U2ERRSOTSYNCHS,
	output U2TXREADYESC,
	output U2ERRSYNCESC,
	output U2ERRCONTROL,
	output U2DIRECTION,
	output U2RXLPDTESC,
	output U2RXULPSESC,
	output U2RXVALIDESC,
	output U2ULPSACTVNOT,
	output U2RXWORDCLKHS,
	output U2TXREADYHS,
	output U2RXSKEWCALHSD,
	output U2RXTRIGESC0,
	output U2RXTRIGESC1,
	output U2RXTRIGESC2,
	output U2RXTRIGESC3,
	output U2STOPSTATE,
	output U2RXVALIDHS,
	output U2RXINVLDCDHS3,
	output U2RXINVLDCDHS2,
	output U2RXINVLDCDHS1,
	output U2RXINVLDCDHS0,
	output U2RXACTVHS,
	output U2RXSYNCHS3,
	output U2RXSYNCHS2,
	output U2RXSYNCHS1,
	output U2RXSYNCHS0,
	output U2RXCLKESC,
	output U2RXDATAESC7,
	output U2RXDATAESC6,
	output U2RXDATAESC5,
	output U2RXDATAESC4,
	output U2RXDATAESC3,
	output U2RXDATAESC2,
	output U2RXDATAESC1,
	output U2RXDATAESC0,
	output U2ERRCONTENLP0,
	output U2ERRCONTENLP1,
	output U2RXDATAHS31,
	output U2RXDATAHS30,
	output U2RXDATAHS29,
	output U2RXDATAHS28,
	output U2RXDATAHS27,
	output U2RXDATAHS26,
	output U2RXDATAHS25,
	output U2RXDATAHS24,
	output U2RXDATAHS23,
	output U2RXDATAHS22,
	output U2RXDATAHS21,
	output U2RXDATAHS20,
	output U2RXDATAHS19,
	output U2RXDATAHS18,
	output U2RXDATAHS17,
	output U2RXDATAHS16,
	output U2RXDATAHS15,
	output U2RXDATAHS14,
	output U2RXDATAHS13,
	output U2RXDATAHS12,
	output U2RXDATAHS11,
	output U2RXDATAHS10,
	output U2RXDATAHS9,
	output U2RXDATAHS8,
	output U2RXDATAHS7,
	output U2RXDATAHS6,
	output U2RXDATAHS5,
	output U2RXDATAHS4,
	output U2RXDATAHS3,
	output U2RXDATAHS2,
	output U2RXDATAHS1,
	output U2RXDATAHS0,
	output U3TXREADYSKEW,
	output U3RXSKEWCALHS,
	output U3ERRESC,
	output U3ERRSOTHS,
	output U3ERRSOTSYNCHS,
	output U3TXREADYESC,
	output U3ULPSACTVNOT,
	output U3RXTRIGESC0,
	output U3RXTRIGESC1,
	output U3RXTRIGESC2,
	output U3RXTRIGESC3,
	output U3TXREADYHS,
	output U3RXVLDHS3,
	output U3RXVLDHS2,
	output U3RXVLDHS1,
	output U3RXVLDHS0,
	output U3RXACTVHS,
	output U3RXSYNCHS3,
	output U3RXSYNCHS2,
	output U3RXSYNCHS1,
	output U3RXSYNCHS0,
	output U3RXSKEWCALHSD,
	output U3RXCLKESC,
	output U3RXLPDTESC,
	output U3RXULPSESC,
	output U3RXDATAESC7,
	output U3RXDATAESC6,
	output U3RXDATAESC5,
	output U3RXDATAESC4,
	output U3RXDATAESC3,
	output U3RXDATAESC2,
	output U3RXDATAESC1,
	output U3RXDATAESC0,
	output U3RXVALIDESC,
	output U3DIRECTION,
	output U3STOPSTATE,
	output U3ERRSYNCESC,
	output U3ERRCONTROL,
	output U3ERRCONTENLP0,
	output U3ERRCONTENLP1,
	output U3RXDATAHS31,
	output U3RXDATAHS30,
	output U3RXDATAHS29,
	output U3RXDATAHS28,
	output U3RXDATAHS27,
	output U3RXDATAHS26,
	output U3RXDATAHS25,
	output U3RXDATAHS24,
	output U3RXDATAHS23,
	output U3RXDATAHS22,
	output U3RXDATAHS21,
	output U3RXDATAHS20,
	output U3RXDATAHS19,
	output U3RXDATAHS18,
	output U3RXDATAHS17,
	output U3RXDATAHS16,
	output U3RXDATAHS15,
	output U3RXDATAHS14,
	output U3RXDATAHS13,
	output U3RXDATAHS12,
	output U3RXDATAHS11,
	output U3RXDATAHS10,
	output U3RXDATAHS9,
	output U3RXDATAHS8,
	output U3RXDATAHS7,
	output U3RXDATAHS6,
	output U3RXDATAHS5,
	output U3RXDATAHS4,
	output U3RXDATAHS3,
	output U3RXDATAHS2,
	output U3RXDATAHS1,
	output U3RXDATAHS0,
	output U3RXBYTECLKHS,
	output UCULPSACTVNOT,
	output UCRXULPSCLKNOT,
	output UCSTOPSTATE,
	output D0LBPASS1,
	output D0LBPASS0,
	output D1LBPASS1,
	output D1LBPASS0,
	output D2LBPASS1,
	output D2LBPASS0,
	output D3LBPASS1,
	output D3LBPASS0,
	output D0LBERRCNT9,
	output D0LBERRCNT8,
	output D0LBERRCNT7,
	output D0LBERRCNT6,
	output D0LBERRCNT5,
	output D0LBERRCNT4,
	output D0LBERRCNT3,
	output D0LBERRCNT2,
	output D0LBERRCNT1,
	output D0LBERRCNT0,
	output D1LBERRCNT9,
	output D1LBERRCNT8,
	output D1LBERRCNT7,
	output D1LBERRCNT6,
	output D1LBERRCNT5,
	output D1LBERRCNT4,
	output D1LBERRCNT3,
	output D1LBERRCNT2,
	output D1LBERRCNT1,
	output D1LBERRCNT0,
	output D2LBERRCNT9,
	output D2LBERRCNT8,
	output D2LBERRCNT7,
	output D2LBERRCNT6,
	output D2LBERRCNT5,
	output D2LBERRCNT4,
	output D2LBERRCNT3,
	output D2LBERRCNT2,
	output D2LBERRCNT1,
	output D2LBERRCNT0,
	output D3LBERRCNT9,
	output D3LBERRCNT8,
	output D3LBERRCNT7,
	output D3LBERRCNT6,
	output D3LBERRCNT5,
	output D3LBERRCNT4,
	output D3LBERRCNT3,
	output D3LBERRCNT2,
	output D3LBERRCNT1,
	output D3LBERRCNT0,
	output D0LBBYTECNT9,
	output D0LBBYTECNT8,
	output D0LBBYTECNT7,
	output D0LBBYTECNT6,
	output D0LBBYTECNT5,
	output D0LBBYTECNT4,
	output D0LBBYTECNT3,
	output D0LBBYTECNT2,
	output D0LBBYTECNT1,
	output D0LBBYTECNT0,
	output D1LBBYTECNT9,
	output D1LBBYTECNT8,
	output D1LBBYTECNT7,
	output D1LBBYTECNT6,
	output D1LBBYTECNT5,
	output D1LBBYTECNT4,
	output D1LBBYTECNT3,
	output D1LBBYTECNT2,
	output D1LBBYTECNT1,
	output D1LBBYTECNT0,
	output D2LBBYTECNT9,
	output D2LBBYTECNT8,
	output D2LBBYTECNT7,
	output D2LBBYTECNT6,
	output D2LBBYTECNT5,
	output D2LBBYTECNT4,
	output D2LBBYTECNT3,
	output D2LBBYTECNT2,
	output D2LBBYTECNT1,
	output D2LBBYTECNT0,
	output D3LBBYTECNT9,
	output D3LBBYTECNT8,
	output D3LBBYTECNT7,
	output D3LBBYTECNT6,
	output D3LBBYTECNT5,
	output D3LBBYTECNT4,
	output D3LBBYTECNT3,
	output D3LBBYTECNT2,
	output D3LBBYTECNT1,
	output D3LBBYTECNT0,
	output D0LBACTV,
	output D1LBACTV,
	output D2LBACTV,
	output D3LBACTV,
	output DCTESTOUT9,
	output DCTESTOUT8,
	output DCTESTOUT7,
	output DCTESTOUT6,
	output DCTESTOUT5,
	output DCTESTOUT4,
	output DCTESTOUT3,
	output DCTESTOUT2,
	output DCTESTOUT1,
	output DCTESTOUT0,
	output LOCK,
	output CLKHSBYTE
); //synthesis syn_black_box 

parameter CPHY_CMTERM = "ENABLE";
parameter DESKW_EN = "ENABLE";
parameter LOCK_BYP = "ENABLE";
parameter PLLCLKBYPASS = "ENABLE";
parameter CPHY_DPHY = "ENABLE";
parameter CONT_CLK_MODE = "ENABLE";
parameter LANE0_SEL = "ENABLE";
parameter EN_PRGSEQ = "ENABLE";
parameter MASTER_SLAVE = "ENABLE";
parameter DSI_CSI = "ENABLE";
parameter RTERM_SEL = "ENABLE";
parameter AUTO_PD_EN = "ENABLE";
parameter DEC_BYPASS = "ENABLE";
parameter ENC_BYPASS = "ENABLE";
parameter UC_PRG_HS_PREPARE = "ENABLE";
parameter EN_CIL = "ENABLE";
parameter SOFTTRIM = "ENABLE";
parameter BIST_EN = "ENABLE";
parameter HSEL = "0b00";
parameter RSEL = "0b00";
parameter PRGSEQ_SYMBOLS = "0x00000000000";
parameter CFG_NUM_LANES = "0b00";
parameter TXDATAWIDTHHS = "0b00";
parameter RXDATAWIDTHHS = "0b00";
parameter UC_PRG_HS_ZERO = "0b0000000";
parameter UC_PRG_HS_TRAIL = "0b00000";
parameter U_PRG_RXHS_SETTLE = "0b000000";
parameter U_PRG_HS_PREPARE = "0b00";
parameter U_PRG_HS_ZERO = "0b000000";
parameter U_PRG_HS_TRAIL = "0b000000";
parameter EN_ALIGN = "0x0";
parameter CLK_DESKW_DLYCAL = "0b00000";
parameter CN = "0b00000";
parameter CM = "0x00";
parameter CO = "0b00";
parameter TST = "0x0";
endmodule
 
