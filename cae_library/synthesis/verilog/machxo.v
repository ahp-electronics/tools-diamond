// -------------------------------------------------------------------- 
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<< 
// -------------------------------------------------------------------- 
// Copyright (c) 2002-2007 by Lattice Semiconductor Corporation 
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
// Header files for MACHO family.
// 
// -------------------------------------------------------------------- 

module ILVDS (A, AN, Z); //synthesis syn_black_box black_box_pad_pin="A,AN"
  input  A;
  input  AN;
  output Z;
endmodule

module OLVDS (A, Z, ZN); //synthesis syn_black_box  black_box_pad_pin="Z,ZN"
  input  A;
  output Z;
  output ZN;
endmodule

module FL1S1A (D0, D1, CK, SD, Q); //synthesis syn_black_box
  parameter GSR = "ENABLED";
  input  D0;
  input  D1;
  input  CK;
  input  SD;
  output Q;
endmodule

module FL1S1AY (D0, D1, CK, SD, Q); //synthesis syn_black_box
  parameter GSR = "ENABLED";
  input  D0;
  input  D1;
  input  CK;
  input  SD;
  output Q;
endmodule

module FL1S1B (D0, D1, CK, SD, PD, Q); //synthesis syn_black_box
  parameter GSR = "ENABLED";
  input  D0;
  input  D1;
  input  CK;
  input  SD;
  input  PD;
  output Q;
endmodule

module FL1S1D (D0, D1, CK, SD, CD, Q); //synthesis syn_black_box
  parameter GSR = "ENABLED";
  input  D0;
  input  D1;
  input  CK;
  input  SD;
  input  CD;
  output Q;
endmodule

module FL1S1I (D0, D1, CK, SD, CD, Q); //synthesis syn_black_box
  parameter GSR = "ENABLED";
  input  D0;
  input  D1;
  input  CK;
  input  SD;
  input  CD;
  output Q;
endmodule

module FL1S1J (D0, D1, CK, SD, PD, Q); //synthesis syn_black_box
  parameter GSR = "ENABLED";
  input  D0;
  input  D1;
  input  CK;
  input  SD;
  input  PD;
  output Q;
endmodule

module FL1S3AX (D0, D1, CK, SD, Q); //synthesis syn_black_box
  parameter GSR = "ENABLED";
  input  D0;
  input  D1;
  input  CK;
  input  SD;
  output Q;
endmodule

module FL1S3AY (D0, D1, CK, SD, Q); //synthesis syn_black_box
  parameter GSR = "ENABLED";
  input  D0;
  input  D1;
  input  CK;
  input  SD;
  output Q;
endmodule

module SPR16X2B ( DI0, DI1, AD0, AD1, AD2, AD3, WRE, CK, DO0, DO1); //synthesis syn_black_box
 
  input AD0;
  input AD1;
  input AD2;
  input AD3;
  input DI0;
  input DI1;
  input CK;
  input WRE;
  output DO0;
  output DO1;
endmodule

module DPR16X2B ( DI0, DI1, WAD0, WAD1, WAD2, WAD3, WRE, WCK,
                 RAD0, RAD1, RAD2, RAD3, WDO0, WDO1, RDO0, RDO1); //synthesis syn_black_box
 
  input WAD0;
  input WAD1;
  input WAD2;
  input WAD3;
  input DI0;
  input DI1;
  input WCK;
  input WRE;
  input RAD0;
  input RAD1;
  input RAD2;
  input RAD3;
  output WDO0;
  output WDO1;
  output RDO0;
  output RDO1;

endmodule

module MULT2 (P0, P1,CO, A0, A1, A2, A3, B0, B1, B2, B3, CI); //synthesis syn_black_box
input  A0;
input  A1;
input  A2;
input  A3;
input  B0;
input  B1;
input  B2;
input  B3;
input  CI;
output P0; 
output P1; 
output CO; 
endmodule

module CB2 (CI, PC0, PC1, CON, CO, NC0, NC1); //synthesis syn_black_box
  input  CI;
  input  PC0;
  input  PC1;
  input  CON;
  output CO;
  output NC0;
  output NC1;
endmodule

module FADSU2 (A0, A1, B0, B1, BCI, CON, BCO, S0, S1); //synthesis syn_black_box
  input  A0;
  input  A1;
  input  B0;
  input  B1;
  input  BCI;
  input  CON;
  output BCO;
  output S0;
  output S1;
endmodule
module AGEB2 (A0, A1, B0, B1, CI, GE);  //synthesis syn_black_box 
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  CI ;
output GE ;
endmodule

module ALEB2 (A0, A1, B0, B1, CI, LE);  //synthesis syn_black_box 
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  CI ;
output LE ;
endmodule

module AND2 (A, B, Z);  //synthesis syn_black_box
  input A ;
  input B ;
  output Z ;
endmodule

module  AND3  (A, B, C, Z);  //synthesis syn_black_box
  input A ;
  input B ;
  input C ;
  output Z ;
endmodule 

module  AND4  (A, B, C, D, Z);  //synthesis syn_black_box
  input A ;
  input B ;
  input C ;
  input D ;
  output Z ;
endmodule 

module  AND5  (A, B, C, D, E, Z);  //synthesis syn_black_box
  input A ;
  input B ;
  input C ;
  input D ;
  input E ;
  output Z ;
endmodule 

module ANEB2 (A0, A1, B0, B1, CI, NE);  //synthesis syn_black_box 
input  A0 ;
input  A1 ;
input  B0 ;
input  B1 ;
input  CI ;
output NE ;
endmodule

module BB (I, T, O, B);  //synthesis syn_black_box black_box_pad_pin="B"
input  I ;
input  T ;
output O ;
inout  B ;
endmodule 

module BBW (I, T, O, B);  //synthesis syn_black_box black_box_pad_pin="B"
input  I ;
input  T ;
output O ;
inout  B ;
endmodule 

module BBPD (I, T, O, B);  //synthesis syn_black_box black_box_pad_pin="B"
input  I ;
input  T ;
output O;
inout  B ;
endmodule

module BBPU (I, T, O, B);  //synthesis syn_black_box black_box_pad_pin="B"
input  I ;
input  T ;
output O;
inout  B ;
endmodule

module CD2 (CI, PC0, PC1, CO, NC0, NC1);  //synthesis syn_black_box
input  CI ;
input  PC0 ;
input  PC1 ;
output CO ;
output NC0 ;
output NC1 ;
endmodule 

module CU2 (CI, PC0, PC1, CO, NC0, NC1);  //synthesis syn_black_box
input  CI ;
input  PC0 ;
input  PC1 ;
output CO ;
output NC0 ;
output NC1 ;
endmodule 

module FADD2 (A0, A1,  B0, B1, CI, COUT0, COUT1, S0, S1);  //synthesis syn_black_box
input  A0;
input  A1;
input  B0;
input  B1;
input  CI;
output COUT0 ;
output COUT1 ;
output S0 ;
output S1 ;
endmodule

module CCU2 (
   CIN,
   A0, B0, C0, D0,
   A1, B1, C1, D1,
   S0, S1, COUT0, COUT1
); //synthesis syn_black_box

input CIN;
input A0, B0, C0, D0;
input A1, B1, C1, D1;
output S0, S1, COUT0, COUT1;

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

module FD1S1A (D, CK, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D ;
input CK ;
output Q ;
endmodule

module FD1S1AY (D, CK, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D ;
input CK ;
output Q ;
endmodule

module FD1S1B (D, CK, PD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D ;
input CK ;
input PD ;
output Q ;
endmodule

module FD1S1D (D, CK, CD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D ;
input CK ;
input CD ;
output Q ;
endmodule

module FD1S1I (D, CK, CD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D ;
input CK ;
input CD ;
output Q ;
endmodule

module FD1S1J (D, CK, PD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D ;
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

module FL1P3AY (D0, D1, SP, CK, SD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D0 ;
input D1 ;
input SP ;
input CK ;
input SD ;
output Q ;
endmodule

module FL1P3AZ (D0, D1, SP, CK, SD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D0 ;
input D1 ;
input SP ;
input CK ;
input SD ;
output Q ;
endmodule

module FL1P3BX (D0, D1, SP, CK, SD, PD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D0 ;
input D1 ;
input SP ;
input CK ;
input SD ;
input PD ;
output Q ;
endmodule

module FL1P3DX (D0, D1, SP, CK, SD, CD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D0 ;
input D1 ;
input SP ;
input CK ;
input SD ;
input CD ;
output Q ;
endmodule

module FL1P3IY (D0, D1, SP, CK, SD, CD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D0 ;
input D1 ;
input SP ;
input CK ;
input SD ;
input CD ;
output Q ;
endmodule

module FL1P3JY (D0, D1, SP, CK, SD, PD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D0 ;
input D1 ;
input SP ;
input CK ;
input SD ;
input PD ;
output Q ;
endmodule

module FSUB2 (A0, A1, B0, B1, BI, BOUT0, BOUT1, S0, S1);  //synthesis syn_black_box
input A0 ;
input A1 ;
input B0 ;
input B1 ;
input BI ;
output BOUT0 ;
output BOUT1 ;
output S0 ;
output S1 ;
endmodule 

module GSR (GSR)  /* synthesis syn_black_box syn_noprune=1 */;
input GSR ;
endmodule

module JTAGD ( TCK, TMS, TDI, JTDO1, JTDO2,
  TDO, JTCK, JTDI, JSHIFT, JUPDATE, JRST, JCE1, JCE2, JRTI1, JRTI2)  /* synthesis syn_black_box syn_noprune=1 */;
 parameter ER1 = "ENABLED";
 parameter ER2 = "ENABLED";
input TCK, TMS, TDI, JTDO1, JTDO2;
output TDO, JTCK, JTDI, JSHIFT, JUPDATE, JRST;
output JCE1, JCE2, JRTI1, JRTI2;
endmodule

module IB (I, O);  //synthesis syn_black_box black_box_pad_pin="I"
input  I ;
output O ;
endmodule

module IBPD (I, O);  //synthesis syn_black_box black_box_pad_pin="I"
input  I ;
output O ;
endmodule

module IBPU (I, O);  //synthesis syn_black_box black_box_pad_pin="I"
input  I;
output O;
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

module MUX161 (D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, SD1, SD2, SD3, SD4, Z);  //synthesis syn_black_box

input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input SD1;
input SD2;
input SD3;
input SD4;
input D8;
input D9;
input D10;
input D11;
input D12;
input D13;
input D14;
input D15;
output Z;
endmodule

module MUX21 (D0, D1, SD, Z);  //synthesis syn_black_box

input D0;
input D1;
input SD;
output Z;
endmodule

module MUX321 (D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, SD1, SD2, SD3, SD4, SD5, Z);  //synthesis syn_black_box

input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input SD1;
input SD2;
input SD3;
input SD4;
input SD5;
input D8;
input D9;
input D10;
input D11;
input D12;
input D13;
input D14;
input D15;
input D16;
input D17;
input D18;
input D19;
input D20;
input D21;
input D22;
input D23;
input D24;
input D25;
input D26;
input D27;
input D28;
input D29;
input D30;
input D31;
output Z;
endmodule

module MUX41 (D0, D1, D2, D3, SD1, SD2, Z);  //synthesis syn_black_box
input D0 ;
input D1 ;
input D2 ;
input D3 ;
input SD1 ;
input SD2 ;
output Z ;
endmodule

module MUX81 (D0, D1, D2, D3, D4, D5, D6, D7, SD1, SD2, SD3, Z);  //synthesis syn_black_box
input D0 ;
input D1 ;
input D2 ;
input D3 ;
input D4 ;
input D5 ;
input D6 ;
input D7 ;
input SD1 ;
input SD2 ;
input SD3 ;
output Z ;
endmodule

module ND2 (A, B, Z);  //synthesis syn_black_box
input  A ;
input  B ;
output Z ;
endmodule

module  ND3  (A, B, C, Z);  //synthesis syn_black_box
input  A ;
input  B ;
input  C ;
output Z ;
endmodule 

module  ND4  (A, B, C, D, Z);  //synthesis syn_black_box
input  A ;
input  B ;
input  C ;
input  D ;
output Z ;
endmodule 

module  ND5  (A, B, C, D, E, Z);  //synthesis syn_black_box
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

module OBW (I, T, O);  //synthesis syn_black_box black_box_pad_pin="O"
input I ;
input T ;
output O ;
endmodule 

module OBZ (I, T, O);  //synthesis syn_black_box black_box_pad_pin="O"
input I ;
input T ;
output O ;
endmodule 

module OBZPD (I, T, O);  //synthesis syn_black_box black_box_pad_pin="O"
input I ;
input T ;
output O ;
endmodule

module OBZPU (I, T, O);  //synthesis syn_black_box black_box_pad_pin="O"
input I ;
input T ;
output O ;
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

module ORCALUT4 (A, B, C, D, Z);  //synthesis syn_black_box

parameter  [15:0]init = 16'h0000 ;

input  A ;
input  B ;
input  C ;
input  D ;
output Z ;
endmodule

module ORCALUT5 (Z, A, B, C, D, E);  //synthesis syn_black_box

parameter  [31:0]init = 32'h0000_0000 ;

input  A ;
input  B ;
input  C ;
input  D ;
input  E ;
output Z ;
endmodule

module ORCALUT6 (Z, A, B, C, D, E, F);  //synthesis syn_black_box

parameter  [63:0]init = 64'h0000_0000_0000_0000 ;

input  A ;
input  B ;
input  C ;
input  D ;
input  E ;
input  F ;
output Z ;
endmodule

module ORCALUT7 (Z, A, B, C, D, E, F, G);  //synthesis syn_black_box

parameter  [127:0]init = 128'h0000_0000_0000_0000_0000_0000_0000_0000 ;

input  A ;
input  B ;
input  C ;
input  D ;
input  E ;
input  F ;
input  G ;
output  Z ;
endmodule

module ORCALUT8 (Z, A, B, C, D, E, F, G, H);  //synthesis syn_black_box

parameter  [255:0]init = 256'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000 ;

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

module PFUMX (ALUT, BLUT, C0, Z);  //synthesis syn_black_box
input  ALUT ;
input  BLUT ;
input  C0 ;
output Z ;
endmodule

module PUR (PUR) /* synthesis syn_black_box syn_noprune=1 */;
  parameter RST_PULSE = 1;
  input PUR;
endmodule

module ROM128X1 ( AD0, AD1, AD2, AD3, AD4, AD5, AD6, DO0);  //synthesis syn_black_box

parameter [127:0] initval = 128'h00000000000000000000000000000000;

input AD0 ;
input AD1 ;
input AD2 ;
input AD3 ;
input AD4 ;
input AD5 ;
input AD6 ;
output DO0 ;
endmodule

module ROM16X1 ( AD0, AD1, AD2, AD3, DO0);  //synthesis syn_black_box

parameter [15:0] initval = 16'h0000;

input AD0 ;
input AD1 ;
input AD2 ;
input AD3 ;
output DO0 ;
endmodule

module ROM256X1 ( AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, DO0);  //synthesis syn_black_box

parameter [255:0] initval = 256'h0000000000000000000000000000000000000000000000000000000000000000;

input AD0 ;
input AD1 ;
input AD2 ;
input AD3 ;
input AD4 ;
input AD5 ;
input AD6 ;
input AD7 ;
output DO0 ;
endmodule

module ROM32X1 ( AD0, AD1, AD2, AD3, AD4, DO0);  //synthesis syn_black_box

parameter [31:0] initval = 32'h00000000;

input AD0 ;
input AD1 ;
input AD2 ;
input AD3 ;
input AD4 ;
output DO0 ;
endmodule

module ROM64X1 ( AD0, AD1, AD2, AD3, AD4, AD5, DO0);  //synthesis syn_black_box

parameter [63:0] initval = 64'h0000000000000000;

input AD0 ;
input AD1 ;
input AD2 ;
input AD3 ;
input AD4 ;
input AD5 ;
output DO0 ;
endmodule

module VHI ( Z );  //synthesis syn_black_box

    output Z ;
endmodule 

module VLO ( Z );  //synthesis syn_black_box

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

module XOR11 ( A, B, C, D, E, F, G, H, I, J, K, Z);  //synthesis syn_black_box
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

module XOR21 ( A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, Z); //synthesis syn_black_box 
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

//For mojo
module SP8KB (CE,CLK,WE,CS0,CS1,CS2,RST,
              DI0,DI1,DI2,DI3,DI4,DI5,DI6,DI7,DI8,
              DI9,DI10,DI11,DI12,DI13,DI14,DI15,DI16,DI17,
              AD0,AD1,AD2,AD3,AD4,AD5,AD6,AD7,AD8,AD9,AD10,AD11,AD12,
              DO0,DO1,DO2,DO3,DO4,DO5,DO6,DO7,DO8,
              DO9,DO10,DO11,DO12,DO13,DO14,DO15,DO16,DO17); //synthesis syn_black_box


   parameter  DATA_WIDTH = 18;
   parameter  REGMODE = "NOREG";
   parameter  RESETMODE = "SYNC";
   parameter  CSDECODE = 3'b000;
   parameter  WRITEMODE = "NORMAL";
   parameter  GSR = "DISABLED";

parameter INITVAL_00 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_01 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_02 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_03 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_04 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_05 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_06 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_07 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_08 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_09 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_10 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_11 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_12 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_13 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_14 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_15 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_16 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_17 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_18 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_19 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;

input    DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8,
         AD9,  AD10,  AD11, AD12, 
         CE, CLK, WE, CS0, CS1, CS2, RST;

output   DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17;
endmodule

module DP8KB (CEA,CLKA,WEA,CSA0,CSA1,CSA2,RSTA,
              CEB,CLKB,WEB,CSB0,CSB1,CSB2,RSTB,
              DIA0,DIA1,DIA2,DIA3,DIA4,DIA5,DIA6,DIA7,DIA8,
              DIA9,DIA10,DIA11,DIA12,DIA13,DIA14,DIA15,DIA16,DIA17,
              ADA0,ADA1,ADA2,ADA3,ADA4,ADA5,ADA6,ADA7,ADA8,ADA9,ADA10,ADA11,ADA12,
              DIB0,DIB1,DIB2,DIB3,DIB4,DIB5,DIB6,DIB7,DIB8,
              DIB9,DIB10,DIB11,DIB12,DIB13,DIB14,DIB15,DIB16,DIB17,
              ADB0,ADB1,ADB2,ADB3,ADB4,ADB5,ADB6,ADB7,ADB8,ADB9,ADB10,ADB11,ADB12,
              DOA0,DOA1,DOA2,DOA3,DOA4,DOA5,DOA6,DOA7,DOA8,
              DOA9,DOA10,DOA11,DOA12,DOA13,DOA14,DOA15,DOA16,DOA17,
              DOB0,DOB1,DOB2,DOB3,DOB4,DOB5,DOB6,DOB7,DOB8,
              DOB9,DOB10,DOB11,DOB12,DOB13,DOB14,DOB15,DOB16,DOB17); //synthesis syn_black_box


   parameter  DATA_WIDTH_A = 18;            //1, 2, 4, 9, 18
   parameter  DATA_WIDTH_B = 18;            //1, 2, 4, 9, 18
   parameter  REGMODE_A = "NOREG";          // "NOREG", "OUTREG"
   parameter  REGMODE_B = "NOREG";          // "NOREG", "OUTREG"
   parameter  RESETMODE = "SYNC";          // "ASYNC", "SYNC"
   parameter  CSDECODE_A = 3'b000;          // 3'b000, 3'b001, 3'b010.......3'b111
   parameter  CSDECODE_B = 3'b000;          // 3'b000, 3'b001, 3'b010.......3'b111
   parameter  WRITEMODE_A = "NORMAL";       // "NORMAL", "READBEFOREWRITE", "WRITETHROUGH"
   parameter  WRITEMODE_B = "NORMAL";       // "NORMAL", "READBEFOREWRITE", "WRITETHROUGH"
   parameter  GSR = "DISABLED";             // "ENABLED", "DISABLED" 

parameter INITVAL_00 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_01 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_02 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_03 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_04 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_05 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_06 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_07 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_08 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_09 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_10 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_11 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_12 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_13 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_14 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_15 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_16 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_17 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_18 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_19 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;

input    DIA0, DIA1, DIA2, DIA3, DIA4, DIA5, DIA6, DIA7, DIA8,
         DIA9, DIA10, DIA11, DIA12, DIA13, DIA14, DIA15, DIA16, DIA17,
         ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8,
         ADA9,  ADA10,  ADA11, ADA12, 
         CEA, CLKA, WEA, CSA0, CSA1, CSA2, RSTA, 
         DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, DIB8,
         DIB9, DIB10, DIB11, DIB12, DIB13, DIB14, DIB15, DIB16, DIB17,
         ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8,
         ADB9,  ADB10,  ADB11, ADB12, 
         CEB, CLKB, WEB, CSB0, CSB1, CSB2, RSTB; 
output   DOA0, DOA1, DOA2, DOA3, DOA4, DOA5, DOA6, DOA7, DOA8,
         DOA9, DOA10, DOA11, DOA12, DOA13, DOA14, DOA15, DOA16, DOA17,
         DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7, DOB8,
         DOB9, DOB10, DOB11, DOB12, DOB13, DOB14, DOB15, DOB16, DOB17;
endmodule

module PDP8KB (CEW,CLKW,CSW0,CSW1,CSW2,WE,CER,CLKR,CSR0,CSR1,CSR2,RST,
               DI0,DI1,DI2,DI3,DI4,DI5,DI6,DI7,DI8,
               DI9,DI10,DI11,DI12,DI13,DI14,DI15,DI16,DI17,
               DI18,DI19,DI20,DI21,DI22,DI23,DI24,DI25,DI26,
               DI27,DI28,DI29,DI30,DI31,DI32,DI33,DI34,DI35,
               ADW0,ADW1,ADW2,ADW3,ADW4,ADW5,ADW6,ADW7,ADW8,ADW9,ADW10,ADW11,ADW12,
               ADR0,ADR1,ADR2,ADR3,ADR4,ADR5,ADR6,ADR7,ADR8,ADR9,ADR10,ADR11,ADR12,
               DO0,DO1,DO2,DO3,DO4,DO5,DO6,DO7,DO8,
               DO9,DO10,DO11,DO12,DO13,DO14,DO15,DO16,DO17,
               DO18,DO19,DO20,DO21,DO22,DO23,DO24,DO25,DO26,
               DO27,DO28,DO29,DO30,DO31,DO32,DO33,DO34,DO35); //synthesis syn_black_box


   parameter  DATA_WIDTH_W = 18;
   parameter  DATA_WIDTH_R = 18;
   parameter  REGMODE = "NOREG";
   parameter  RESETMODE = "SYNC";
   parameter  CSDECODE_W = 3'b000;
   parameter  CSDECODE_R = 3'b000;
   parameter  GSR = "DISABLED";

parameter INITVAL_00 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_01 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_02 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_03 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_04 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_05 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_06 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_07 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_08 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_09 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_0F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_10 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_11 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_12 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_13 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_14 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_15 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_16 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_17 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_18 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_19 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_1F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;

input    DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26,
         DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35,
         ADW0, ADW1, ADW2, ADW3, ADW4, ADW5, ADW6, ADW7, ADW8,
         ADW9,  ADW10,  ADW11, ADW12, 
         CEW, CLKW, WE, CSW0, CSW1, CSW2, 
         ADR0, ADR1, ADR2, ADR3, ADR4, ADR5, ADR6, ADR7, ADR8,
         ADR9,  ADR10,  ADR11, ADR12, 
         CER, CLKR, CSR0, CSR1, CSR2, RST; 

output   DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17,
         DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26,
         DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35;
endmodule

module FIFO8KA (DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26,
         DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35,
         FULLI, CSW0, CSW1, EMPTYI, CSR0, CSR1, WE, RE, CLKW, CLKR, RST, RPRST,  
         DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17,
         DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26,
         DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35,
         EF, AEF, AFF, FF); //synthesis syn_black_box

   parameter  DATA_WIDTH_W = 18;
   parameter  DATA_WIDTH_R = 18;
   parameter  REGMODE = "NOREG";
   parameter  RESETMODE = "SYNC";
   parameter  CSDECODE_W = 2'b00;
   parameter  CSDECODE_R = 2'b00;
   parameter  AEPOINTER = 14'b00000000000000;
   parameter  AEPOINTER1 = 14'b00000000000000;
   parameter  AFPOINTER = 14'b00000000000000;
   parameter  AFPOINTER1 = 14'b00000000000000;
   parameter  FULLPOINTER = 14'b00000000000000;
   parameter  FULLPOINTER1 = 14'b00000000000000;
   parameter GSR = "DISABLED";

input    DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26,
         DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35,
         FULLI, CSW0, CSW1, EMPTYI, CSR0, CSR1, WE, RE, CLKW, CLKR, RST, RPRST;
output   DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17,
         DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26,
         DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35,
         EF, AEF, AFF, FF;
endmodule

module EHXPLLC(RST, CLKI, CLKFB, DDAMODE, DDAIZR, DDAILAG, DDAIDEL0, DDAIDEL1, DDAIDEL2,
   CLKOP, CLKOK, CLKOS, LOCK, CLKINTFB)
/* synthesis syn_black_box
   syn_tpd1="CLKI->CLKOP=0.1"
   syn_tpd2="RST->LOCK=0.1" */;

parameter FIN = "100.0000";
parameter CLKFB_DIV = 1;
parameter CLKI_DIV = 1;
parameter CLKOP_DIV = 1;
parameter CLKOK_DIV = 1;
parameter DELAY_CNTL = "STATIC";
parameter FDEL = 0;
parameter WAKE_ON_LOCK = "ON";
parameter PHASEADJ = 0;             //0, 45, 90, 135, 180, 225, 270, 315
parameter DUTY = 4;
//parameter FB_MODE = "CLOCKTREE";

//parameter   LOCK_CYC   = 2;
//parameter LOCK_DELAY = 100;

input CLKI, CLKFB, RST;
input DDAMODE, DDAIZR, DDAILAG;
input DDAIDEL0, DDAIDEL1, DDAIDEL2;

output CLKOP, CLKOK, CLKOS, LOCK, CLKINTFB;
endmodule

module TSALL (TSALL) /* synthesis syn_black_box syn_noprune=1 */;
  input TSALL;
endmodule

module OSCC (OSC); //synthesis syn_black_box
  output OSC;
endmodule

module LB2P3AX (D0, D1, CI, SP, CK, SD, CON, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3AY (D0, D1, CI, SP, CK, SD, CON, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3BX (D0, D1, CI, SP, CK, SD, PD, CON, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3DX (D0, D1, CI, SP, CK, SD, CD, CON, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3IX (D0, D1, CI, SP, CK, SD, CD, CON, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3JX (D0, D1, CI, SP, CK, SD, PD, CON, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD, CON;
output CO, Q0, Q1;
endmodule

module LD2P3AX (D0, D1, CI, SP, CK, SD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LD2P3AY (D0, D1, CI, SP, CK, SD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LD2P3BX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule

module LD2P3DX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LD2P3IX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LD2P3JX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule

module LU2P3AX (D0, D1, CI, SP, CK, SD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LU2P3AY (D0, D1, CI, SP, CK, SD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LU2P3BX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule

module LU2P3DX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LU2P3IX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LU2P3JX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1);
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule


