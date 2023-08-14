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
// Header files for WILSON family
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

module MIPI (
input AP, AN, TP,TN,HSSEL,
output OLSP,OLSN,OHS,
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

module DELAYF (
input A, LOADN, MOVE, DIRECTION,
output Z, CFLAG );  //synthesis syn_black_box
parameter  DEL_MODE = "USER_DEFINED";
parameter  DEL_VALUE = 0;
endmodule

module DELAYG (
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




module MIPIDPHYA (
inout CKP,	
inout CKN,	
output CLKHSBYTE,  
input CLKRXHSEN,   
output CLKDRXLPP,  
input CLKRXLPEN,   
output CLKDRXLPN,  
input CLKCDEN,	   
output CLKDCDN,	  
input CLKDTXLPP,  

input CLKTXLPEN,  
input CLKDTXLPN, 	
input CLKTXHSEN,   
input CLKTXHSGATE,	 

input CLKTXHSPD,  
output CLKDRXHS,  	
output HSBYTECLKD,															
output HSBYTECLKS, 
input LBEN,																
input PDDPHY,     																
input PDBIAS,														
input PDCKG,																
input CLKREF,																
output LOCK,															
input PDPLL,	  

inout DP0,DP1,DP2,DP3,		  
inout DN0,DN1,DN2,DN3,			
output D0DRXLPP,  
input D0RXLPEN,	  
output D0DRXLPN,  
output D0DCDP,	  
input D0CDEN,	  
output D0DCDN,	  
input D0DTXLPP,		   
input D0TXLPEN,		   
input D0DTXLPN,		   
input D0RXHSEN,		   
output D0HSRXDATA15,   
output D0HSRXDATA14, D0HSRXDATA13, D0HSRXDATA12, D0HSRXDATA11, D0HSRXDATA10,
output D0HSRXDATA9, D0HSRXDATA8, D0HSRXDATA7, D0HSRXDATA6, D0HSRXDATA5,		
output D0HSRXDATA4, D0HSRXDATA3, D0HSRXDATA2, D0HSRXDATA1, D0HSRXDATA0,																	
output D0SYNC,																
output D0ERRSYNC,															
output D0NOSYNC,															
input D0HSDESEREN,															
input D0TXHSEN,																
input D0HSTXDATA15,															
input D0HSTXDATA14, D0HSTXDATA13, D0HSTXDATA12, D0HSTXDATA11, D0HSTXDATA10,	
input D0HSTXDATA9, D0HSTXDATA8, D0HSTXDATA7, D0HSTXDATA6, D0HSTXDATA5,		
input D0HSTXDATA4, D0HSTXDATA3, D0HSTXDATA2, D0HSTXDATA1, D0HSTXDATA0,		
input D0HSSEREN,															
input D0TXHSPD,																
output D0DRXHS,	

output D1DRXLPP,  
input D1RXLPEN,	  
output D1DRXLPN,  
output D1DCDP,	  
input D1CDEN,	  
output D1DCDN,	  
input D1DTXLPP,		   
input D1TXLPEN,		   
input D1DTXLPN,		   
input D1RXHSEN,		   
output D1HSRXDATA15,   
output D1HSRXDATA14, D1HSRXDATA13, D1HSRXDATA12, D1HSRXDATA11, D1HSRXDATA10,
output D1HSRXDATA9, D1HSRXDATA8, D1HSRXDATA7, D1HSRXDATA6, D1HSRXDATA5,		
output D1HSRXDATA4, D1HSRXDATA3, D1HSRXDATA2, D1HSRXDATA1, D1HSRXDATA0,																	
output D1SYNC,																
output D1ERRSYNC,															
output D1NOSYNC,															
input D1HSDESEREN,															
input D1TXHSEN,																
input D1HSTXDATA15,															
input D1HSTXDATA14, D1HSTXDATA13, D1HSTXDATA12, D1HSTXDATA11, D1HSTXDATA10,	
input D1HSTXDATA9, D1HSTXDATA8, D1HSTXDATA7, D1HSTXDATA6, D1HSTXDATA5,		
input D1HSTXDATA4, D1HSTXDATA3, D1HSTXDATA2, D1HSTXDATA1, D1HSTXDATA0,		
input D1HSSEREN,															
input D1TXHSPD,																
output D1DRXHS,

output D2DRXLPP,  
input D2RXLPEN,	  
output D2DRXLPN,  
output D2DCDP,	  
input D2CDEN,	  
output D2DCDN,	  
input D2DTXLPP,		   
input D2TXLPEN,		   
input D2DTXLPN,		   
input D2RXHSEN,		   
output D2HSRXDATA15,   
output D2HSRXDATA14, D2HSRXDATA13, D2HSRXDATA12, D2HSRXDATA11, D2HSRXDATA10,
output D2HSRXDATA9, D2HSRXDATA8, D2HSRXDATA7, D2HSRXDATA6, D2HSRXDATA5,		
output D2HSRXDATA4, D2HSRXDATA3, D2HSRXDATA2, D2HSRXDATA1, D2HSRXDATA0,																	
output D2SYNC,																
output D2ERRSYNC,															
output D2NOSYNC,															
input D2HSDESEREN,															
input D2TXHSEN,																
input D2HSTXDATA15,															
input D2HSTXDATA14, D2HSTXDATA13, D2HSTXDATA12, D2HSTXDATA11, D2HSTXDATA10,	
input D2HSTXDATA9, D2HSTXDATA8, D2HSTXDATA7, D2HSTXDATA6, D2HSTXDATA5,		
input D2HSTXDATA4, D2HSTXDATA3, D2HSTXDATA2, D2HSTXDATA1, D2HSTXDATA0,		
input D2HSSEREN,															
input D2TXHSPD,																
output D2DRXHS,

output D3DRXLPP,  
input D3RXLPEN,	  
output D3DRXLPN,  
output D3DCDP,	  
input D3CDEN,	  
output D3DCDN,	  
input D3DTXLPP,		   
input D3TXLPEN,		   
input D3DTXLPN,		   
input D3RXHSEN,		   
output D3HSRXDATA15,   
output D3HSRXDATA14, D3HSRXDATA13, D3HSRXDATA12, D3HSRXDATA11, D3HSRXDATA10,
output D3HSRXDATA9, D3HSRXDATA8, D3HSRXDATA7, D3HSRXDATA6, D3HSRXDATA5,		
output D3HSRXDATA4, D3HSRXDATA3, D3HSRXDATA2, D3HSRXDATA1, D3HSRXDATA0,																	
output D3SYNC,																
output D3ERRSYNC,															
output D3NOSYNC,															
input D3HSDESEREN,															
input D3TXHSEN,																
input D3HSTXDATA15,															
input D3HSTXDATA14, D3HSTXDATA13, D3HSTXDATA12, D3HSTXDATA11, D3HSTXDATA10,	
input D3HSTXDATA9, D3HSTXDATA8, D3HSTXDATA7, D3HSTXDATA6, D3HSTXDATA5,		
input D3HSTXDATA4, D3HSTXDATA3, D3HSTXDATA2, D3HSTXDATA1, D3HSTXDATA0,		
input D3HSSEREN,															
input D3TXHSPD,																
output D3DRXHS
);//synthesis syn_black_box black_box_pad_pin="DP0, DN0, DP1, DN1, DP2, DN2, DP3, DN3, CKP, CKN"
														
parameter HSEL = 1;														
parameter HS_16BIT_EN = 1;													
parameter CN = 0;										
parameter CM = 0;										
parameter CO = 0;										
parameter PLL_TST = 9;  
parameter ENP_DESER = 0;        

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
 
