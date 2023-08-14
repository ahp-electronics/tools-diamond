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
// Header files for ECP5U family
//
// --------------------------------------------------------------------

module AND2 (A, B, Z);  //synthesis syn_black_box syn_lib_cell=1
   input A ;
   input B ;
   output Z ;
endmodule

module AND3  (A, B, C, Z);  //synthesis syn_black_box syn_lib_cell=1
   input A ;
   input B ;
   input C ;
   output Z ;
endmodule 

module AND4  (A, B, C, D, Z);  //synthesis syn_black_box syn_lib_cell=1
   input A ;
   input B ;
   input C ;
   input D ;
   output Z ;
endmodule 

module AND5  (A, B, C, D, E, Z);  //synthesis syn_black_box syn_lib_cell=1
   input A ;
   input B ;
   input C ;
   input D ;
   input E ;
   output Z ;
endmodule 

module BB (I, T, O, B);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="B"
   input  I ;
   input  T ;
   output O ;
   inout  B ;
endmodule 

module BBPD (I, T, O, B);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="B"
   input  I ;
   input  T ;
   output O;
   inout  B ;
endmodule

module BBPU (I, T, O, B);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="B"
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
);   //synthesis syn_black_box syn_lib_cell=1 syn_unconnected_inputs  = "CIN"

   input CIN;
   input A0, B0, C0, D0;
   input A1, B1, C1, D1;
   output S0, S1, COUT;
   parameter [15:0] INIT0 = 16'h0000;
   parameter [15:0] INIT1 = 16'h0000;
   parameter INJECT1_0 = "YES";
   parameter INJECT1_1 = "YES";
endmodule


module FD1P3AX (D, SP, CK, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   output Q ;
endmodule

module FD1P3AY (D, SP, CK, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   output Q ;
endmodule

module FD1P3BX (D, SP, CK, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   input PD ;
   output Q ;
endmodule

module FD1P3DX (D, SP, CK, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   input CD ;
   output Q ;
endmodule

module FD1P3IX (D, SP, CK, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   input CD ;
   output Q ;
endmodule

module FD1P3JX (D, SP, CK, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input CK ;
   input PD ;
   output Q ;
endmodule

module FD1S3AX (D, CK, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   output Q ;
endmodule

module FD1S3AY (D, CK, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   output Q ;
endmodule

module FD1S3BX (D, CK, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   input  PD ;
   output Q ;
endmodule

module FD1S3DX (D, CK, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   input  CD ;
   output Q ;
endmodule

module FD1S3IX (D, CK, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   input  CD ;
   output Q ;
endmodule

module FD1S3JX (D, CK, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input  D ;
   input  CK ;
   input  PD ;
   output Q ;
endmodule

module FL1P3AY (D1, D0, SP, CK, SD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   output Q ;
endmodule

module FL1P3AZ (D1, D0, SP, CK, SD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   output Q ;
endmodule

module FL1P3BX (D1, D0, SP, CK, SD, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   input PD ;
   output Q ;
endmodule

module FL1P3DX (D1, D0, SP, CK, SD, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   input CD ;
   output Q ;
endmodule

module FL1P3IY (D1, D0, SP, CK, SD, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   input CD ;
   output Q ;
endmodule

module FL1P3JY (D1, D0, SP, CK, SD, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D1 ;
   input D0 ;
   input SP ;
   input CK ;
   input SD ;
   input PD ;
   output Q ;
endmodule

module FL1S3AX (D1, D0, CK, SD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input  D1;
   input  D0;
   input  CK;
   input  SD;
   output Q;
endmodule

module FL1S3AY (D1, D0, CK, SD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input  D1;
   input  D0;
   input  CK;
   input  SD;
   output Q;
endmodule

module GSR (GSR);  //synthesis syn_black_box syn_lib_cell=1 syn_noprune=1
   input GSR ;
endmodule

module IB (I, O);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="I"
   input  I ;
   output O ;
endmodule

module IBPD (I, O);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="I"
   input  I ;
   output O ;
endmodule

module IBPU (I, O);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="I"
   input  I;
   output O;
endmodule

module IFS1P3BX (D, SP, SCLK, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D;
   input SP;
   input SCLK;
   input PD;
   output Q;
endmodule

module IFS1P3DX (D, SP, SCLK, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D;
   input SP;
   input SCLK;
   input CD;
   output Q;
endmodule

module IFS1P3IX (D, SP, SCLK, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D;
   input SP;
   input SCLK;
   input CD;
   output Q;
endmodule

module IFS1P3JX (D, SP, SCLK, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D;
   input SP;
   input SCLK;
   input PD;
   output Q;
endmodule

module IFS1S1B (D, SCLK, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D;
   input SCLK;
   input PD;
   output Q;
endmodule

module IFS1S1D (D, SCLK, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D;
   input SCLK;
   input CD;
   output Q;
endmodule

module IFS1S1I (D, SCLK, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D;
   input SCLK;
   input CD;
   output Q;
endmodule

module IFS1S1J (D, SCLK, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D;
   input SCLK;
   input PD;
   output Q;
endmodule

module ILVDS (A, AN, Z);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="A,AN"
   input  A;
   input  AN;
   output Z;
endmodule

module INV (A, Z);  //synthesis syn_black_box syn_lib_cell=1
   input A;
   output Z;
endmodule

module L6MUX21 (D0, D1, SD, Z);  //synthesis syn_black_box syn_lib_cell=1
   input D0;
   input D1;
   input SD;
   output Z;
endmodule

module LUT4 (A, B, C, D, Z);  //synthesis syn_black_box syn_lib_cell=1
   parameter [15:0] init = 16'h0000 ;
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   output Z ;
endmodule

module LUT5 (Z, A, B, C, D, E);  //synthesis syn_black_box syn_lib_cell=1
   parameter [31:0] init = 32'h00000000 ;
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   output Z ;
endmodule

module LUT6 (Z, A, B, C, D, E, F);  //synthesis syn_black_box syn_lib_cell=1
   parameter [63:0] init = 64'h0000000000000000 ;
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   input  F ;
   output Z ;
endmodule

module LUT7 (Z, A, B, C, D, E, F, G);  //synthesis syn_black_box syn_lib_cell=1
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

module LUT8 (Z, A, B, C, D, E, F, G, H);  //synthesis syn_black_box syn_lib_cell=1
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

module MUX161 (D15, D14, D13, D12, D11, D10, D9, D8, D7, D6, D5, D4, D3, D2, D1, D0, SD4, SD3, SD2, SD1, Z);  //synthesis syn_black_box syn_lib_cell=1
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

module MUX21 (D1, D0, SD, Z);  //synthesis syn_black_box syn_lib_cell=1
   input D1;
   input D0;
   input SD;
   output Z;
endmodule

module MUX321 (D31, D30, D29, D28, D27, D26, D25, D24, D23, D22, D21, D20, D19, D18, D17, D16, D15, D14, D13, D12, D11, D10, D9, D8, D7, D6, D5, D4, D3, D2, D1, D0, SD5, SD4, SD3, SD2, SD1, Z);  //synthesis syn_black_box syn_lib_cell=1
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

module MUX41 (D3, D2, D1, D0, SD2, SD1, Z);  //synthesis syn_black_box syn_lib_cell=1
   input D3 ;
   input D2 ;
   input D1 ;
   input D0 ;
   input SD2 ;
   input SD1 ;
   output Z ;
endmodule

module MUX81 (D7, D6, D5, D4, D3, D2, D1, D0, SD3, SD2, SD1, Z);  //synthesis syn_black_box syn_lib_cell=1
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

module ND2 (A, B, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   output Z ;
endmodule

module ND3  (A, B, C, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   output Z ;
endmodule 

module ND4  (A, B, C, D, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   output Z ;
endmodule 

module ND5  (A, B, C, D, E, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   output Z ;
endmodule 

module NR2 (A, B, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   output Z ;
endmodule 

module NR3 (A, B, C, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   output Z ;
endmodule 

module NR4 (A, B, C, D, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   output Z ;
endmodule 

module NR5 (A, B, C, D, E, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   output Z ;
endmodule 

module OB (I, O);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="O"
   input  I ;
   output O ;
endmodule 

module OBCO (I, OT, OC);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="OT,OC"
   input  I ;
   output OT ;
   output OC ;
endmodule 

module OBZ (I, T, O);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="O"
   input I ;
   input T ;
   output O ;
endmodule 

module OBZPU (I, T, O);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="O"
   input I ;
   input T ;
   output O ;
endmodule

module OFS1P3BX (D, SP, SCLK, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input SCLK ;
   input PD ;
   output Q ;
endmodule

module OFS1P3DX (D, SP, SCLK, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input SCLK ;
   input CD ;
   output Q ;
endmodule

module OFS1P3IX (D, SP, SCLK, CD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input SCLK ;
   input CD ;
   output Q ;
endmodule

module OFS1P3JX (D, SP, SCLK, PD, Q);  //synthesis syn_black_box syn_lib_cell=1
   parameter GSR = "ENABLED";
   input D ;
   input SP ;
   input SCLK ;
   input PD ;
   output Q ;
endmodule

module OLVDS (A, Z, ZN);  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="Z,ZN"
   input  A;
   output Z;
   output ZN;
endmodule

module OR2 (A, B, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   output Z ;
endmodule 

module OR3 (A, B, C, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   output Z ;
endmodule 

module OR4 (A, B, C, D, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   output Z ;
endmodule 

module OR5 (A, B, C, D, E, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   output Z ;
endmodule 

module PFUMX (ALUT, BLUT, C0, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  ALUT ;
   input  BLUT ;
   input  C0 ;
   output Z ;
endmodule

module PUR (PUR)/* synthesis syn_black_box syn_lib_cell=1 syn_noprune=1 */;
  parameter RST_PULSE = 1;
  input PUR;
endmodule

module ROM128X1A (AD6, AD5, AD4, AD3, AD2, AD1, AD0, DO0);  //synthesis syn_black_box syn_lib_cell=1
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

module ROM16X1A (AD3, AD2, AD1, AD0, DO0);  //synthesis syn_black_box syn_lib_cell=1
   parameter [15:0] initval = 16'h0000;
   input AD3 ;
   input AD2 ;
   input AD1 ;
   input AD0 ;
   output DO0 ;
endmodule

module ROM256X1A (AD7, AD6, AD5, AD4, AD3, AD2, AD1, AD0, DO0);  //synthesis syn_black_box syn_lib_cell=1
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

module ROM32X1A (AD4, AD3, AD2, AD1, AD0, DO0);  //synthesis syn_black_box syn_lib_cell=1
   parameter [31:0] initval = 32'h00000000;
   input AD4 ;
   input AD3 ;
   input AD2 ;
   input AD1 ;
   input AD0 ;
   output DO0 ;
endmodule

module ROM64X1A (AD5, AD4, AD3, AD2, AD1, AD0, DO0);  //synthesis syn_black_box syn_lib_cell=1
   parameter [63:0] initval = 64'h0000000000000000;
   input AD5 ;
   input AD4 ;
   input AD3 ;
   input AD2 ;
   input AD1 ;
   input AD0 ;
   output DO0 ;
endmodule

module SGSR (GSR, CLK);  //synthesis syn_black_box syn_lib_cell=1 syn_noprune=1
   input GSR, CLK;
endmodule

module VHI (Z);  //synthesis syn_black_box syn_lib_cell=1
   output Z ;
endmodule 

module VLO (Z);  //synthesis syn_black_box syn_lib_cell=1
   output Z ;
endmodule

module XNOR2 (A, B, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   output Z;
endmodule 

module XNOR3 (A, B, C, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   output Z;
endmodule 

module XNOR4 (A, B, C, D, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   output Z;
endmodule 

module XNOR5 (A, B, C, D, E, Z);  //synthesis syn_black_box syn_lib_cell=1
   input  A ;
   input  B ;
   input  C ;
   input  D ;
   input  E ;
   output Z;
endmodule 

module XOR11 (A, B, C, D, E, F, G, H, I, J, K, Z);  //synthesis syn_black_box syn_lib_cell=1
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

module XOR2 (A, B, Z);  //synthesis syn_black_box syn_lib_cell=1
   input A ;
   input B ;
   output Z;
endmodule 

module XOR21 (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, Z);  //synthesis syn_black_box syn_lib_cell=1 
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

module XOR3 (A, B, C, Z);  //synthesis syn_black_box syn_lib_cell=1
   input A ;
   input B ;
   input C ;
   output Z;
endmodule 

module XOR4 (A, B, C, D, Z);  //synthesis syn_black_box syn_lib_cell=1
   input A ;
   input B ;
   input C ;
   input D ;
   output Z;
endmodule 

module XOR5 (A, B, C, D, E, Z);  //synthesis syn_black_box syn_lib_cell=1
   input A ;
   input B ;
   input C ;
   input D ;
   input E ;
   output Z;
endmodule 
// End of Basic Elements

module DP16KD (
input   DIA17, DIA16, DIA15, DIA14, DIA13, DIA12, DIA11, DIA10, DIA9,
         DIA8, DIA7, DIA6, DIA5, DIA4, DIA3, DIA2, DIA1, DIA0,
         ADA13, ADA12, ADA11, ADA10, ADA9, ADA8, ADA7, ADA6, ADA5,
         ADA4,  ADA3,  ADA2, ADA1, ADA0,
         CEA, OCEA, CLKA, WEA, CSA2, CSA1, CSA0, RSTA,
         DIB17, DIB16, DIB15, DIB14, DIB13, DIB12, DIB11, DIB10, DIB9,
         DIB8, DIB7, DIB6, DIB5, DIB4, DIB3, DIB2, DIB1, DIB0,
         ADB13, ADB12, ADB11, ADB10, ADB9, ADB8, ADB7, ADB6, ADB5,
         ADB4,  ADB3,  ADB2, ADB1, ADB0,
         CEB, OCEB, CLKB, WEB, CSB2, CSB1, CSB0, RSTB,
output  DOA17, DOA16, DOA15, DOA14, DOA13, DOA12, DOA11, DOA10, DOA9,
         DOA8, DOA7, DOA6, DOA5, DOA4, DOA3, DOA2, DOA1, DOA0,
         DOB17, DOB16, DOB15, DOB14, DOB13, DOB12, DOB11, DOB10, DOB9,
         DOB8, DOB7, DOB6, DOB5, DOB4, DOB3, DOB2, DOB1, DOB0 );  //synthesis syn_black_box syn_lib_cell=1
parameter  DATA_WIDTH_A = 18;
parameter  DATA_WIDTH_B = 18;
parameter  REGMODE_A = "NOREG";
parameter  REGMODE_B = "NOREG";
parameter  RESETMODE = "SYNC";
parameter  ASYNC_RESET_RELEASE = "SYNC";
parameter  WRITEMODE_A = "NORMAL";
parameter  WRITEMODE_B = "NORMAL";
parameter  CSDECODE_A = "0b000";
parameter  CSDECODE_B = "0b000";
parameter  GSR = "ENABLED"; 
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
parameter INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INIT_DATA = "STATIC";
endmodule

module PDPW16KD (
input    DI35, DI34, DI33, DI32, DI31, DI30, DI29, DI28, DI27,
         DI26, DI25, DI24, DI23, DI22, DI21, DI20, DI19, DI18,
         DI17, DI16, DI15, DI14, DI13, DI12, DI11, DI10, DI9,
         DI8, DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0,
         ADW8, ADW7, ADW6, ADW5, ADW4, ADW3, ADW2, ADW1, ADW0,
         BE3,  BE2,  BE1, BE0,
         CEW, CLKW, CSW2, CSW1, CSW0,
         ADR13, ADR12, ADR11, ADR10, ADR9, ADR8, ADR7, ADR6, ADR5,
         ADR4,  ADR3,  ADR2, ADR1, ADR0,
         CER, OCER, CLKR, CSR2, CSR1, CSR0, RST,
output   DO35, DO34, DO33, DO32, DO31, DO30, DO29, DO28, DO27,
         DO26, DO25, DO24, DO23, DO22, DO21, DO20, DO19, DO18,
         DO17, DO16, DO15, DO14, DO13, DO12, DO11, DO10, DO9,
         DO8, DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0 );  //synthesis syn_black_box syn_lib_cell=1
parameter  DATA_WIDTH_W = 36;
parameter  DATA_WIDTH_R = 36;
parameter  GSR = "ENABLED"; 
parameter  REGMODE = "NOREG";
parameter  RESETMODE = "SYNC";
parameter  ASYNC_RESET_RELEASE = "SYNC";
parameter  CSDECODE_W = "0b000";
parameter  CSDECODE_R = "0b000";
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
parameter INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
parameter INIT_DATA = "STATIC";
endmodule

module DPR16X4C (
input  DI3, DI2, DI1, DI0, WAD3,WAD2,WAD1,WAD0, WCK, WRE,
input  RAD3,RAD2,RAD1,RAD0,
output DO3, DO2, DO1, DO0 );  //synthesis syn_black_box syn_lib_cell=1
parameter  initval = "0x0000000000000000";
endmodule

module SPR16X4C (
input  DI3, DI2, DI1, DI0, AD3, AD2, AD1, AD0, CK, WRE,
output DO3, DO2, DO1, DO0 );  //synthesis syn_black_box syn_lib_cell=1
parameter  initval = "0x0000000000000000";
endmodule

module LVDSOB (
input  D,
input  E,
output  Q );  //synthesis syn_black_box syn_lib_cell=1
endmodule

module IMIPI (
input A, AN, HSSEL,
output OHSOLS1, OLS0 );  //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="A,AN"
endmodule

module MULT9X9C (
input A8,A7,A6,A5,A4,A3,A2,A1,A0,
input B8,B7,B6,B5,B4,B3,B2,B1,B0,
input SIGNEDA, SIGNEDB, SOURCEA, SOURCEB,
input CLK3,CLK2,CLK1,CLK0,CE3,CE2,CE1,CE0,RST3,RST2,RST1,RST0,
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
output ROA8,ROA7,ROA6,ROA5,ROA4,ROA3,ROA2,ROA1,ROA0,
output ROB8,ROB7,ROB6,ROB5,ROB4,ROB3,ROB2,ROB1,ROB0,
output P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,
output SIGNEDP );  //synthesis syn_black_box syn_lib_cell=1
parameter REG_INPUTA_CLK = "NONE";
parameter REG_INPUTA_CE = "CE0";
parameter REG_INPUTA_RST = "RST0";
parameter REG_INPUTB_CLK = "NONE";
parameter REG_INPUTB_CE = "CE0";
parameter REG_INPUTB_RST = "RST0";
parameter REG_PIPELINE_CLK = "NONE";
parameter REG_PIPELINE_CE = "CE0";
parameter REG_PIPELINE_RST = "RST0";
parameter REG_OUTPUT_CLK = "NONE";
parameter REG_OUTPUT_CE = "CE0";
parameter REG_OUTPUT_RST = "RST0";
parameter GSR = "ENABLED";
parameter CAS_MATCH_REG = "FALSE";
parameter MULT_BYPASS = "DISABLED";
parameter RESETMODE = "SYNC";
endmodule

module MULT9X9D (
input A8,A7,A6,A5,A4,A3,A2,A1,A0,
input B8,B7,B6,B5,B4,B3,B2,B1,B0,
input C8,C7,C6,C5,C4,C3,C2,C1,C0,
input SIGNEDA, SIGNEDB, SOURCEA, SOURCEB,
input CLK3,CLK2,CLK1,CLK0,CE3,CE2,CE1,CE0,RST3,RST2,RST1,RST0,
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
output ROA8,ROA7,ROA6,ROA5,ROA4,ROA3,ROA2,ROA1,ROA0,
output ROB8,ROB7,ROB6,ROB5,ROB4,ROB3,ROB2,ROB1,ROB0,
output ROC8,ROC7,ROC6,ROC5,ROC4,ROC3,ROC2,ROC1,ROC0,
output P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,
output SIGNEDP );  //synthesis syn_black_box syn_lib_cell=1
parameter REG_INPUTA_CLK = "NONE";
parameter REG_INPUTA_CE = "CE0";
parameter REG_INPUTA_RST = "RST0";
parameter REG_INPUTB_CLK = "NONE";
parameter REG_INPUTB_CE = "CE0";
parameter REG_INPUTB_RST = "RST0";
parameter REG_INPUTC_CLK = "NONE";
parameter REG_INPUTC_CE = "CE0";
parameter REG_INPUTC_RST = "RST0";
parameter REG_PIPELINE_CLK = "NONE";
parameter REG_PIPELINE_CE = "CE0";
parameter REG_PIPELINE_RST = "RST0";
parameter REG_OUTPUT_CLK = "NONE";
parameter REG_OUTPUT_CE = "CE0";
parameter REG_OUTPUT_RST = "RST0";
parameter CLK0_DIV = "ENABLED";
parameter CLK1_DIV = "ENABLED";
parameter CLK2_DIV = "ENABLED";
parameter CLK3_DIV = "ENABLED";
parameter HIGHSPEED_CLK = "NONE";
parameter GSR = "ENABLED";
parameter CAS_MATCH_REG = "FALSE";
parameter SOURCEB_MODE = "B_SHIFT";
parameter MULT_BYPASS = "DISABLED";
parameter RESETMODE = "SYNC";
endmodule

module MULT18X18C (
input A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0,
input B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0,
input SIGNEDA, SIGNEDB, SOURCEA, SOURCEB,
input CLK3,CLK2,CLK1,CLK0,CE3,CE2,CE1,CE0,RST3,RST2,RST1,RST0,
input SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9,
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
input SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9,
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,
output SROA17,SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9,
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
output SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9,
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
output ROA17,ROA16,ROA15,ROA14,ROA13,ROA12,ROA11,ROA10,ROA9,
output ROA8,ROA7,ROA6,ROA5,ROA4,ROA3,ROA2,ROA1,ROA0,
output ROB17,ROB16,ROB15,ROB14,ROB13,ROB12,ROB11,ROB10,ROB9,
output ROB8,ROB7,ROB6,ROB5,ROB4,ROB3,ROB2,ROB1,ROB0,
output P35,P34,P33,P32,P31,P30,P29,P28,P27,P26,P25,P24,P23,P22,P21,P20,P19,P18,
output P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,
output SIGNEDP );  //synthesis syn_black_box syn_lib_cell=1
parameter REG_INPUTA_CLK = "NONE";
parameter REG_INPUTA_CE = "CE0";
parameter REG_INPUTA_RST = "RST0";
parameter REG_INPUTB_CLK = "NONE";
parameter REG_INPUTB_CE = "CE0";
parameter REG_INPUTB_RST = "RST0";
parameter REG_PIPELINE_CLK = "NONE";
parameter REG_PIPELINE_CE = "CE0";
parameter REG_PIPELINE_RST = "RST0";
parameter REG_OUTPUT_CLK = "NONE";
parameter REG_OUTPUT_CE = "CE0";
parameter REG_OUTPUT_RST = "RST0";
parameter CAS_MATCH_REG = "FALSE";
parameter MULT_BYPASS = "DISABLED";
parameter GSR = "ENABLED";
parameter RESETMODE = "SYNC";
endmodule

module MULT18X18D (
input A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0,
input B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0,
input C17,C16,C15,C14,C13,C12,C11,C10,C9,C8,C7,C6,C5,C4,C3,C2,C1,C0,
input SIGNEDA, SIGNEDB, SOURCEA, SOURCEB,
input CLK3,CLK2,CLK1,CLK0,CE3,CE2,CE1,CE0,RST3,RST2,RST1,RST0,
input SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9,
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
input SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9,
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,
output SROA17,SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9,
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
output SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9,
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
output ROA17,ROA16,ROA15,ROA14,ROA13,ROA12,ROA11,ROA10,ROA9,
output ROA8,ROA7,ROA6,ROA5,ROA4,ROA3,ROA2,ROA1,ROA0,
output ROB17,ROB16,ROB15,ROB14,ROB13,ROB12,ROB11,ROB10,ROB9,
output ROB8,ROB7,ROB6,ROB5,ROB4,ROB3,ROB2,ROB1,ROB0,
output ROC17,ROC16,ROC15,ROC14,ROC13,ROC12,ROC11,ROC10,ROC9,
output ROC8,ROC7,ROC6,ROC5,ROC4,ROC3,ROC2,ROC1,ROC0,
output P35,P34,P33,P32,P31,P30,P29,P28,P27,P26,P25,P24,P23,P22,P21,P20,P19,P18,
output P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,
output SIGNEDP );  //synthesis syn_black_box syn_lib_cell=1
parameter REG_INPUTA_CLK = "NONE";
parameter REG_INPUTA_CE = "CE0";
parameter REG_INPUTA_RST = "RST0";
parameter REG_INPUTB_CLK = "NONE";
parameter REG_INPUTB_CE = "CE0";
parameter REG_INPUTB_RST = "RST0";
parameter REG_INPUTC_CLK = "NONE";
parameter REG_INPUTC_CE = "CE0";
parameter REG_INPUTC_RST = "RST0";
parameter REG_PIPELINE_CLK = "NONE";
parameter REG_PIPELINE_CE = "CE0";
parameter REG_PIPELINE_RST = "RST0";
parameter REG_OUTPUT_CLK = "NONE";
parameter REG_OUTPUT_CE = "CE0";
parameter REG_OUTPUT_RST = "RST0";
parameter CLK0_DIV = "ENABLED";
parameter CLK1_DIV = "ENABLED";
parameter CLK2_DIV = "ENABLED";
parameter CLK3_DIV = "ENABLED";
parameter HIGHSPEED_CLK = "NONE";
parameter GSR = "ENABLED";
parameter CAS_MATCH_REG = "FALSE";
parameter SOURCEB_MODE = "B_SHIFT";
parameter MULT_BYPASS = "DISABLED";
parameter RESETMODE = "SYNC";
endmodule

module ALU24A (
input CE3,CE2,CE1,CE0,CLK3,CLK2,CLK1,CLK0,RST3,RST2,RST1,RST0,SIGNEDIA,SIGNEDIB,
input MA17,MA16,MA15,MA14,MA13,MA12,MA11,MA10,MA9,MA8,MA7,MA6,MA5,MA4,MA3,MA2,MA1,MA0,
input MB17,MB16,MB15,MB14,MB13,MB12,MB11,MB10,MB9,MB8,MB7,MB6,MB5,MB4,MB3,MB2,MB1,MB0,
input CIN23,CIN22,CIN21,CIN20,CIN19,CIN18,CIN17,CIN16,CIN15,CIN14,
input CIN13,CIN12,CIN11,CIN10,CIN9,CIN8,CIN7,CIN6,CIN5,CIN4,CIN3,CIN2,CIN1,CIN0,
input OPADDNSUB, OPCINSEL,
output R23,R22,R21,R20,R19,R18,
output R17,R16,R15,R14,R13,R12,R11,R10,R9,R8,R7,R6,R5,R4,R3,R2,R1,R0 );  //synthesis syn_black_box syn_lib_cell=1
parameter REG_OUTPUT_CLK = "NONE";
parameter REG_OUTPUT_CE = "CE0";
parameter REG_OUTPUT_RST = "RST0";
parameter REG_OPCODE_0_CLK = "NONE"; 
parameter REG_OPCODE_0_CE = "CE0";  
parameter REG_OPCODE_0_RST = "RST0"; 
parameter REG_OPCODE_1_CLK = "NONE"; 
parameter REG_OPCODE_1_CE = "CE0";  
parameter REG_OPCODE_1_RST = "RST0"; 
parameter GSR = "ENABLED";
parameter RESETMODE = "SYNC";
endmodule

module ALU54A (
input CE3,CE2,CE1,CE0,CLK3,CLK2,CLK1,CLK0,RST3,RST2,RST1,RST0,SIGNEDIA,SIGNEDIB,SIGNEDCIN,
input A35,A34,A33,A32,A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18,
input A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0,
input B35,B34,B33,B32,B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18,
input B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0,
input C53,C52,C51,C50,C49,C48,C47,C46,C45,C44,C43,C42,C41,C40,C39,C38,C37,C36,
input C35,C34,C33,C32,C31,C30,C29,C28,C27,C26,C25,C24,C23,C22,C21,C20,C19,C18,
input C17,C16,C15,C14,C13,C12,C11,C10,C9,C8,C7,C6,C5,C4,C3,C2,C1,C0,
input MA35,MA34,MA33,MA32,MA31,MA30,MA29,MA28,MA27,MA26,MA25,MA24,MA23,MA22,MA21,MA20,MA19,MA18,
input MA17,MA16,MA15,MA14,MA13,MA12,MA11,MA10,MA9,MA8,MA7,MA6,MA5,MA4,MA3,MA2,MA1,MA0,
input MB35,MB34,MB33,MB32,MB31,MB30,MB29,MB28,MB27,MB26,MB25,MB24,MB23,MB22,MB21,MB20,MB19,MB18,
input MB17,MB16,MB15,MB14,MB13,MB12,MB11,MB10,MB9,MB8,MB7,MB6,MB5,MB4,MB3,MB2,MB1,MB0,
input CIN53,CIN52,CIN51,CIN50,CIN49,CIN48,CIN47,CIN46,CIN45,CIN44,CIN43,CIN42,CIN41,CIN40,CIN39,
input CIN38,CIN37,CIN36,CIN35,CIN34,CIN33,CIN32,CIN31,CIN30,CIN29,CIN28,
input CIN27,CIN26,CIN25,CIN24,CIN23,CIN22,CIN21,CIN20,CIN19,CIN18,CIN17,CIN16,CIN15,CIN14,
input CIN13,CIN12,CIN11,CIN10,CIN9,CIN8,CIN7,CIN6,CIN5,CIN4,CIN3,CIN2,CIN1,CIN0,
input OP10,OP9,OP8,OP7,OP6,OP5,OP4,OP3,OP2,OP1,OP0,
output R53,R52,R51,R50,R49,R48,R47,R46,R45,R44,R43,R42,R41,R40,R39,R38,R37,R36,
output R35,R34,R33,R32,R31,R30,R29,R28,R27,R26,R25,R24,R23,R22,R21,R20,R19,R18,
output R17,R16,R15,R14,R13,R12,R11,R10,R9,R8,R7,R6,R5,R4,R3,R2,R1,R0,
output EQZ,EQZM,EQOM,EQPAT,EQPATB,OVER,UNDER,OVERUNDER,
output SIGNEDR );  //synthesis syn_black_box syn_lib_cell=1
parameter REG_INPUTC0_CLK = "NONE"; // C[26:0]
parameter REG_INPUTC0_CE = "CE0";      // C[26:0]
parameter REG_INPUTC0_RST = "RST0";  // C[26:0]
parameter REG_INPUTC1_CLK = "NONE"; // C[53:27]
parameter REG_INPUTC1_CE = "CE0";      // C[53:27]
parameter REG_INPUTC1_RST = "RST0";  // C[53:27]
parameter REG_OPCODEOP0_0_CLK = "NONE"; // Input reg of OPCODE oper[0]
parameter REG_OPCODEOP0_0_CE = "CE0";   // Input reg of OPCODE oper[3:0]
parameter REG_OPCODEOP0_0_RST = "RST0"; // Input reg of OPCODE oper[3:0] 
parameter REG_OPCODEOP1_0_CLK = "NONE"; // Input reg of OPCODE oper [3:1]
parameter REG_OPCODEOP0_1_CLK = "NONE"; // Pipeline reg of OPCODE oper[0] 
parameter REG_OPCODEOP0_1_CE = "CE0";   // Pipeline reg of OPCODE oper[3:0]
parameter REG_OPCODEOP0_1_RST = "RST0"; // Pipeline reg of OPCODE oper[3:0]
parameter REG_OPCODEOP1_1_CLK = "NONE"; // Pipeline reg of OPCODE oper[3:1]
parameter REG_OPCODEIN_0_CLK = "NONE"; // Input reg of OPCODE InA[1:0], InB[1:0] and InC[2:0]
parameter REG_OPCODEIN_0_CE = "CE0";   // Input reg of OPCODE InA[1:0], InB[1:0] and InC[2:0]
parameter REG_OPCODEIN_0_RST = "RST0"; // Input reg of OPCODE InA[1:0], InB[1:0] and InC[2:0] 
parameter REG_OPCODEIN_1_CLK = "NONE"; // Pipeline reg of OPCODE InA[1:0], InB[1:0] and InC[2:0]
parameter REG_OPCODEIN_1_CE = "CE0";   // Pipeline reg of OPCODE InA[1:0], InB[1:0] and InC[2:0]
parameter REG_OPCODEIN_1_RST = "RST0"; // Pipeline reg of OPCODE InA[1:0], InB[1:0] and InC[2:0] 
parameter REG_OUTPUT0_CLK = "NONE";
parameter REG_OUTPUT0_CE = "CE0";
parameter REG_OUTPUT0_RST = "RST0";
parameter REG_OUTPUT1_CLK = "NONE";
parameter REG_OUTPUT1_CE = "CE0";
parameter REG_OUTPUT1_RST = "RST0";
parameter REG_FLAG_CLK = "NONE";
parameter REG_FLAG_CE = "CE0";
parameter REG_FLAG_RST = "RST0";
parameter MCPAT_SOURCE = "STATIC";
parameter MASKPAT_SOURCE = "STATIC";
parameter MASK01 = "0x00000000000000";
parameter MCPAT = "0x00000000000000";
parameter MASKPAT = "0x00000000000000";
parameter RNDPAT = "0x00000000000000";
parameter GSR = "ENABLED";
parameter RESETMODE = "SYNC";
parameter MULT9_MODE = "DISABLED";
parameter FORCE_ZERO_BARREL_SHIFT = "DISABLED";
parameter LEGACY = "DISABLED";
endmodule

module ALU24B (
input CE3,CE2,CE1,CE0,CLK3,CLK2,CLK1,CLK0,RST3,RST2,RST1,RST0,SIGNEDIA,SIGNEDIB,
input MA17,MA16,MA15,MA14,MA13,MA12,MA11,MA10,MA9,MA8,MA7,MA6,MA5,MA4,MA3,MA2,MA1,MA0,
input MB17,MB16,MB15,MB14,MB13,MB12,MB11,MB10,MB9,MB8,MB7,MB6,MB5,MB4,MB3,MB2,MB1,MB0,
input CFB23,CFB22,CFB21,CFB20,CFB19,CFB18,CFB17,CFB16,CFB15,CFB14,
input CFB13,CFB12,CFB11,CFB10,CFB9,CFB8,CFB7,CFB6,CFB5,CFB4,CFB3,CFB2,CFB1,CFB0,
input CIN23,CIN22,CIN21,CIN20,CIN19,CIN18,CIN17,CIN16,CIN15,CIN14,
input CIN13,CIN12,CIN11,CIN10,CIN9,CIN8,CIN7,CIN6,CIN5,CIN4,CIN3,CIN2,CIN1,CIN0,
input OPADDNSUB, OPCINSEL,
output R23,R22,R21,R20,R19,R18,
output R17,R16,R15,R14,R13,R12,R11,R10,R9,R8,R7,R6,R5,R4,R3,R2,R1,R0,
output CO23,CO22,CO21,CO20,CO19,CO18,
output CO17,CO16,CO15,CO14,CO13,CO12,CO11,CO10,CO9,CO8,CO7,CO6,CO5,CO4,CO3,CO2,CO1,CO0 );  //synthesis syn_black_box syn_lib_cell=1
parameter REG_OUTPUT_CLK = "NONE";
parameter REG_OUTPUT_CE = "CE0";
parameter REG_OUTPUT_RST = "RST0";
parameter REG_OPCODE_0_CLK = "NONE"; 
parameter REG_OPCODE_0_CE = "CE0";  
parameter REG_OPCODE_0_RST = "RST0"; 
parameter REG_OPCODE_1_CLK = "NONE"; 
parameter REG_OPCODE_1_CE = "CE0";  
parameter REG_OPCODE_1_RST = "RST0"; 
parameter REG_INPUTCFB_CLK = "NONE";
parameter REG_INPUTCFB_CE  = "CE0";
parameter REG_INPUTCFB_RST = "RST0";
parameter CLK0_DIV = "ENABLED";
parameter CLK1_DIV = "ENABLED";
parameter CLK2_DIV = "ENABLED";
parameter CLK3_DIV = "ENABLED";
parameter GSR = "ENABLED";
parameter RESETMODE = "SYNC";
endmodule

module ALU54B (
input CE3,CE2,CE1,CE0,CLK3,CLK2,CLK1,CLK0,RST3,RST2,RST1,RST0,SIGNEDIA,SIGNEDIB,SIGNEDCIN,
input A35,A34,A33,A32,A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18,
input A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0,
input B35,B34,B33,B32,B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18,
input B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0,
input C53,C52,C51,C50,C49,C48,C47,C46,C45,C44,C43,C42,C41,C40,C39,C38,C37,C36,
input C35,C34,C33,C32,C31,C30,C29,C28,C27,C26,C25,C24,C23,C22,C21,C20,C19,C18,
input C17,C16,C15,C14,C13,C12,C11,C10,C9,C8,C7,C6,C5,C4,C3,C2,C1,C0,
input CFB53,CFB52,CFB51,CFB50,CFB49,CFB48,CFB47,CFB46,CFB45,CFB44,CFB43,CFB42,CFB41,
input CFB40,CFB39,CFB38,CFB37,CFB36,CFB35,CFB34,CFB33,CFB32,CFB31,CFB30,CFB29,CFB28,
input CFB27,CFB26,CFB25,CFB24,CFB23,CFB22,CFB21,CFB20,CFB19,CFB18,CFB17,CFB16,CFB15,
input CFB14,CFB13,CFB12,CFB11,CFB10,CFB9,CFB8,CFB7,CFB6,CFB5,CFB4,CFB3,CFB2,CFB1,CFB0,
input MA35,MA34,MA33,MA32,MA31,MA30,MA29,MA28,MA27,MA26,MA25,MA24,MA23,MA22,MA21,MA20,MA19,MA18,
input MA17,MA16,MA15,MA14,MA13,MA12,MA11,MA10,MA9,MA8,MA7,MA6,MA5,MA4,MA3,MA2,MA1,MA0,
input MB35,MB34,MB33,MB32,MB31,MB30,MB29,MB28,MB27,MB26,MB25,MB24,MB23,MB22,MB21,MB20,MB19,MB18,
input MB17,MB16,MB15,MB14,MB13,MB12,MB11,MB10,MB9,MB8,MB7,MB6,MB5,MB4,MB3,MB2,MB1,MB0,
input CIN53,CIN52,CIN51,CIN50,CIN49,CIN48,CIN47,CIN46,CIN45,CIN44,CIN43,CIN42,CIN41,
input CIN40,CIN39,CIN38,CIN37,CIN36,CIN35,CIN34,CIN33,CIN32,CIN31,CIN30,CIN29,CIN28,
input CIN27,CIN26,CIN25,CIN24,CIN23,CIN22,CIN21,CIN20,CIN19,CIN18,CIN17,CIN16,CIN15,
input CIN14,CIN13,CIN12,CIN11,CIN10,CIN9,CIN8,CIN7,CIN6,CIN5,CIN4,CIN3,CIN2,CIN1,CIN0,
input OP10,OP9,OP8,OP7,OP6,OP5,OP4,OP3,OP2,OP1,OP0,
output R53,R52,R51,R50,R49,R48,R47,R46,R45,R44,R43,R42,R41,R40,R39,R38,R37,R36,
output R35,R34,R33,R32,R31,R30,R29,R28,R27,R26,R25,R24,R23,R22,R21,R20,R19,R18,
output R17,R16,R15,R14,R13,R12,R11,R10,R9,R8,R7,R6,R5,R4,R3,R2,R1,R0,
output CO53,CO52,CO51,CO50,CO49,CO48,CO47,CO46,CO45,CO44,CO43,CO42,CO41,CO40,CO39,CO38,CO37,CO36,
output CO35,CO34,CO33,CO32,CO31,CO30,CO29,CO28,CO27,CO26,CO25,CO24,CO23,CO22,CO21,CO20,CO19,CO18,
output CO17,CO16,CO15,CO14,CO13,CO12,CO11,CO10,CO9,CO8,CO7,CO6,CO5,CO4,CO3,CO2,CO1,CO0,
output EQZ,EQZM,EQOM,EQPAT,EQPATB,OVER,UNDER,OVERUNDER,
output SIGNEDR );  //synthesis syn_black_box syn_lib_cell=1
parameter REG_INPUTC0_CLK = "NONE"; // C[26:0]
parameter REG_INPUTC0_CE = "CE0";      // C[26:0]
parameter REG_INPUTC0_RST = "RST0";  // C[26:0]
parameter REG_INPUTC1_CLK = "NONE"; // C[53:27]
parameter REG_INPUTC1_CE = "CE0";      // C[53:27]
parameter REG_INPUTC1_RST = "RST0";  // C[53:27]
parameter REG_OPCODEOP0_0_CLK = "NONE"; // Input reg of OPCODE oper[0]
parameter REG_OPCODEOP0_0_CE = "CE0";   // Input reg of OPCODE oper[3:0]
parameter REG_OPCODEOP0_0_RST = "RST0"; // Input reg of OPCODE oper[3:0] 
parameter REG_OPCODEOP1_0_CLK = "NONE"; // Input reg of OPCODE oper [3:1]
parameter REG_OPCODEOP0_1_CLK = "NONE"; // Pipeline reg of OPCODE oper[0] 
parameter REG_OPCODEOP0_1_CE = "CE0";   // Pipeline reg of OPCODE oper[3:0]
parameter REG_OPCODEOP0_1_RST = "RST0"; // Pipeline reg of OPCODE oper[3:0]
parameter REG_OPCODEOP1_1_CLK = "NONE"; // Pipeline reg of OPCODE oper[3:1]
parameter REG_OPCODEIN_0_CLK = "NONE"; // Input reg of OPCODE InA[1:0], InB[1:0] and InC[2:0]
parameter REG_OPCODEIN_0_CE = "CE0";   // Input reg of OPCODE InA[1:0], InB[1:0] and InC[2:0]
parameter REG_OPCODEIN_0_RST = "RST0"; // Input reg of OPCODE InA[1:0], InB[1:0] and InC[2:0] 
parameter REG_OPCODEIN_1_CLK = "NONE"; // Pipeline reg of OPCODE InA[1:0], InB[1:0] and InC[2:0]
parameter REG_OPCODEIN_1_CE = "CE0";   // Pipeline reg of OPCODE InA[1:0], InB[1:0] and InC[2:0]
parameter REG_OPCODEIN_1_RST = "RST0"; // Pipeline reg of OPCODE InA[1:0], InB[1:0] and InC[2:0] 
parameter REG_OUTPUT0_CLK = "NONE";
parameter REG_OUTPUT0_CE = "CE0";
parameter REG_OUTPUT0_RST = "RST0";
parameter REG_OUTPUT1_CLK = "NONE";
parameter REG_OUTPUT1_CE = "CE0";
parameter REG_OUTPUT1_RST = "RST0";
parameter REG_FLAG_CLK = "NONE";
parameter REG_FLAG_CE = "CE0";
parameter REG_FLAG_RST = "RST0";
parameter MCPAT_SOURCE = "STATIC";
parameter MASKPAT_SOURCE = "STATIC";
parameter MASK01 = "0x00000000000000";
parameter REG_INPUTCFB_CLK = "NONE";
parameter REG_INPUTCFB_CE = "CE0";
parameter REG_INPUTCFB_RST = "RST0";
parameter CLK0_DIV = "ENABLED";
parameter CLK1_DIV = "ENABLED";
parameter CLK2_DIV = "ENABLED";
parameter CLK3_DIV = "ENABLED";
parameter MCPAT = "0x00000000000000";
parameter MASKPAT = "0x00000000000000";
parameter RNDPAT = "0x00000000000000";
parameter GSR = "ENABLED";
parameter RESETMODE = "SYNC";
parameter MULT9_MODE = "DISABLED";
parameter FORCE_ZERO_BARREL_SHIFT = "DISABLED";
parameter LEGACY = "DISABLED";
endmodule

module PRADD9A (
input PA8,PA7,PA6,PA5,PA4,PA3,PA2,PA1,PA0,
input PB8,PB7,PB6,PB5,PB4,PB3,PB2,PB1,PB0,
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,
input C8,C7,C6,C5,C4,C3,C2,C1,C0,
input SOURCEA,OPPRE,
input CLK3,CLK2,CLK1,CLK0,
input CE3,CE2,CE1,CE0,
input RST3,RST2,RST1,RST0,
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
output PO8,PO7,PO6,PO5,PO4,PO3,PO2,PO1,PO0 );  //synthesis syn_black_box syn_lib_cell=1
parameter REG_INPUTA_CLK = "NONE";
parameter REG_INPUTA_CE = "CE0";
parameter REG_INPUTA_RST = "RST0";
parameter REG_INPUTB_CLK = "NONE";
parameter REG_INPUTB_CE = "CE0";
parameter REG_INPUTB_RST = "RST0";
parameter REG_INPUTC_CLK = "NONE";
parameter REG_INPUTC_CE = "CE0";
parameter REG_INPUTC_RST = "RST0";
parameter REG_OPPRE_CLK = "NONE";
parameter REG_OPPRE_CE = "CE0";
parameter REG_OPPRE_RST = "RST0";
parameter CLK0_DIV = "ENABLED";
parameter CLK1_DIV = "ENABLED";
parameter CLK2_DIV = "ENABLED";
parameter CLK3_DIV = "ENABLED";
parameter HIGHSPEED_CLK = "NONE";
parameter GSR = "ENABLED";
parameter CAS_MATCH_REG = "FALSE";
parameter SOURCEA_MODE = "A_SHIFT";
parameter SOURCEB_MODE = "SHIFT";
parameter FB_MUX = "SHIFT";
parameter RESETMODE = "SYNC";
parameter SYMMETRY_MODE = "DIRECT";
endmodule

module PRADD18A (
input PA17,PA16,PA15,PA14,PA13,PA12,PA11,PA10,PA9,PA8,PA7,PA6,
      PA5,PA4,PA3,PA2,PA1,PA0,
input PB17,PB16,PB15,PB14,PB13,PB12,PB11,PB10,PB9,PB8,PB7,PB6,
      PB5,PB4,PB3,PB2,PB1,PB0,
input SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9,SRIA8,SRIA7,SRIA6,
      SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,
input SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9,SRIB8,SRIB7,SRIB6,
      SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,
input C17,C16,C15,C14,C13,C12,C11,C10,C9,C8,C7,C6,C5,C4,C3,C2,C1,C0,
input SOURCEA,OPPRE,
input CLK3,CLK2,CLK1,CLK0,
input CE3,CE2,CE1,CE0,
input RST3,RST2,RST1,RST0,
output SROA17,SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9,SROA8,SROA7,SROA6,
      SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
output SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9,SROB8,SROB7,SROB6,
      SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,
output PO17,PO16,PO15,PO14,PO13,PO12,PO11,PO10,PO9,PO8,PO7,PO6,
      PO5,PO4,PO3,PO2,PO1,PO0 );  //synthesis syn_black_box syn_lib_cell=1
parameter REG_INPUTA_CLK = "NONE";
parameter REG_INPUTA_CE = "CE0";
parameter REG_INPUTA_RST = "RST0";
parameter REG_INPUTB_CLK = "NONE";
parameter REG_INPUTB_CE = "CE0";
parameter REG_INPUTB_RST = "RST0";
parameter REG_INPUTC_CLK = "NONE";
parameter REG_INPUTC_CE = "CE0";
parameter REG_INPUTC_RST = "RST0";
parameter REG_OPPRE_CLK = "NONE";
parameter REG_OPPRE_CE = "CE0";
parameter REG_OPPRE_RST = "RST0";
parameter CLK0_DIV = "ENABLED";
parameter CLK1_DIV = "ENABLED";
parameter CLK2_DIV = "ENABLED";
parameter CLK3_DIV = "ENABLED";
parameter HIGHSPEED_CLK = "NONE";
parameter GSR = "ENABLED";
parameter CAS_MATCH_REG = "FALSE";
parameter SOURCEA_MODE = "A_SHIFT";
parameter SOURCEB_MODE = "SHIFT";
parameter FB_MUX = "SHIFT";
parameter RESETMODE = "SYNC";
parameter SYMMETRY_MODE = "DIRECT";
endmodule

module BCINRD (
input  INRDENI );  //synthesis syn_black_box syn_lib_cell=1 syn_noprune=1
parameter  BANKID=2;
endmodule

module BCLVDSOB (
input LVDSENI );  //synthesis syn_black_box syn_lib_cell=1 syn_noprune=1
parameter BANKID=2;
endmodule

module INRDB (
input  D,
input  E,
output  Q );  //synthesis syn_black_box syn_lib_cell=1
endmodule

module CLKDIVF (
input   CLKI, RST, ALIGNWD,
output  CDIVX );  //synthesis syn_black_box syn_lib_cell=1
parameter  GSR = "DISABLED";
parameter  DIV = "2.0";
endmodule

module PCSCLKDIV (
input   CLKI, RST, SEL2, SEL1, SEL0,
output  CDIV1, CDIVX );  //synthesis syn_black_box syn_lib_cell=1
parameter  GSR = "DISABLED";
endmodule

module DCSC (
input   CLK1, CLK0, SEL1, SEL0, MODESEL,
output  DCSOUT );  //synthesis syn_black_box syn_lib_cell=1
parameter  DCSMODE = "POS";
endmodule

module DCCA (
input CLKI, CE,
output CLKO );  //synthesis syn_black_box syn_lib_cell=1
endmodule

module ECLKSYNCB (
input  ECLKI, STOP,
output ECLKO );  //synthesis syn_black_box syn_lib_cell=1
endmodule

module ECLKBRIDGECS (
input  CLK0, CLK1, SEL,
output ECSOUT );  //synthesis syn_black_box syn_lib_cell=1
endmodule

module PLLREFCS (
input CLK0,CLK1,SEL,
output PLLCSOUT );  //synthesis syn_black_box syn_lib_cell=1
endmodule

module DELAYF (
input A, LOADN, MOVE, DIRECTION,
output Z, CFLAG );  //synthesis syn_black_box syn_lib_cell=1
parameter  DEL_MODE = "USER_DEFINED";
parameter  DEL_VALUE = 0;
endmodule

module DELAYG (
input  A,
output  Z );  //synthesis syn_black_box syn_lib_cell=1
parameter  DEL_MODE = "USER_DEFINED";
parameter  DEL_VALUE = 0;
endmodule

module START (
input  STARTCLK );  //synthesis syn_black_box syn_lib_cell=1 syn_noprune=1
endmodule

module USRMCLK (
input  USRMCLKI, USRMCLKTS );  //synthesis syn_black_box syn_lib_cell=1 syn_noprune=1
endmodule

module DQSBUFM (
input   DQSI,READ1,READ0,READCLKSEL2,READCLKSEL1,READCLKSEL0,DDRDEL,ECLK,SCLK, RST,
input   DYNDELAY7, DYNDELAY6, DYNDELAY5, DYNDELAY4, DYNDELAY3, DYNDELAY2, DYNDELAY1, DYNDELAY0,
input   PAUSE,RDLOADN,RDMOVE,RDDIRECTION,WRLOADN,WRMOVE,WRDIRECTION,
output  DQSR90,DQSW,DQSW270,RDPNTR2,RDPNTR1,RDPNTR0,WRPNTR2,WRPNTR1,WRPNTR0,
output  DATAVALID, BURSTDET,RDCFLAG,WRCFLAG );  //synthesis syn_black_box syn_lib_cell=1
parameter DQS_LI_DEL_VAL = 4;
parameter DQS_LI_DEL_ADJ  = "FACTORYONLY";
parameter DQS_LO_DEL_VAL = 0;
parameter DQS_LO_DEL_ADJ  = "FACTORYONLY";
parameter GSR = "ENABLED";
endmodule

module DDRDLLA (
input   CLK, RST, UDDCNTLN, FREEZE,
output  DDRDEL, LOCK,
output  DCNTL7,DCNTL6,DCNTL5,DCNTL4,DCNTL3,DCNTL2,DCNTL1,DCNTL0 );  //synthesis syn_black_box syn_lib_cell=1
parameter FORCE_MAX_DELAY = "NO";
parameter GSR = "ENABLED";
endmodule

module DLLDELD (
input   A, DDRDEL,LOADN,MOVE,DIRECTION,
output  Z, CFLAG );  //synthesis syn_black_box syn_lib_cell=1
endmodule

module IDDRX1F (
input D, SCLK, RST,
output Q0, Q1 );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
endmodule

module IDDRX2F (
input D, SCLK, ECLK, RST, ALIGNWD,
output Q3, Q2, Q1, Q0 );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
endmodule

module IDDR71B (
input  D, SCLK,ECLK,RST,ALIGNWD,
output  Q6,Q5,Q4,Q3,Q2,Q1,Q0 );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
endmodule

module IDDRX2DQA (
input  SCLK,ECLK,DQSR90,D,RST,
input  RDPNTR2,RDPNTR1,RDPNTR0,WRPNTR2,WRPNTR1,WRPNTR0,
output Q3,Q2,Q1,Q0,QWL );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
endmodule

module ODDRX1F (
input SCLK, RST, D0, D1,
output Q );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
endmodule

module ODDRX2F (
input SCLK,ECLK,RST,D3,D2,D1,D0,
output Q );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
endmodule

module ODDR71B (
input SCLK,ECLK,RST,D6,D5,D4,D3,D2,D1,D0,
output Q );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
endmodule

module OSHX2A (
input  D1,D0,SCLK,ECLK,RST,
output  Q );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
endmodule

module TSHX2DQA (
input  T1,T0,SCLK,ECLK,DQSW270,RST,
output  Q );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
parameter REGSET = "SET";
endmodule

module TSHX2DQSA (
input T1,T0,SCLK,ECLK,DQSW,RST,
output Q );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
parameter REGSET = "SET";
endmodule

module ODDRX2DQA (
input  D3,D2,D1,D0,DQSW270,SCLK,ECLK,RST,
output  Q );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
endmodule

module ODDRX2DQSB (
input  D3,D2,D1,D0,SCLK,ECLK,DQSW,RST,
output  Q );  //synthesis syn_black_box syn_lib_cell=1
parameter GSR = "ENABLED";
endmodule

module EHXPLLL (
input  CLKI, CLKFB, PHASESEL1, PHASESEL0, PHASEDIR, PHASESTEP, PHASELOADREG,
input  STDBY, PLLWAKESYNC,
input  RST, ENCLKOP, ENCLKOS, ENCLKOS2, ENCLKOS3,
output CLKOP,CLKOS,CLKOS2,CLKOS3,LOCK,INTLOCK,
output REFCLK, CLKINTFB );  //synthesis syn_black_box syn_lib_cell=1
parameter CLKI_DIV = 1;
parameter CLKFB_DIV = 1;
parameter CLKOP_DIV = 8;
parameter CLKOS_DIV = 8;
parameter CLKOS2_DIV = 8;
parameter CLKOS3_DIV = 8;
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
parameter STDBY_ENABLE = "DISABLED";
parameter REFIN_RESET = "DISABLED";
parameter SYNC_ENABLE = "DISABLED";
parameter INT_LOCK_STICKY = "ENABLED";
parameter DPHASE_SOURCE = "DISABLED";
parameter PLLRST_ENA = "DISABLED";
parameter INTFB_WAKE = "DISABLED";
endmodule

module DTR (
input  STARTPULSE,
output  DTROUT7,DTROUT6,DTROUT5,DTROUT4,DTROUT3,DTROUT2,DTROUT1,DTROUT0 );  //synthesis syn_black_box syn_lib_cell=1
parameter DTR_TEMP = 25;
endmodule

module OSCG (
output  OSC);  //synthesis syn_black_box syn_lib_cell=1
parameter  DIV = 128;
endmodule

module EXTREFB (
   input  REFCLKP, REFCLKN,
   output REFCLKO
  ); //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="REFCLKP,REFCLKN"
   parameter REFCK_PWDNB = "DONTCARE"; 
   parameter REFCK_RTERM = "DONTCARE"; 
   parameter REFCK_DCBIAS_EN = "DONTCARE"; 
endmodule

module JTAGG (
input TCK, TMS, TDI, JTDO2, JTDO1,
output TDO, JTDI, JTCK, JRTI2, JRTI1,
output JSHIFT, JUPDATE, JRSTN, JCE2, JCE1 );  //synthesis syn_black_box syn_lib_cell=1
parameter ER1 = "ENABLED";
parameter ER2 = "ENABLED";
endmodule

module SEDGA (
input   SEDENABLE, SEDSTART, SEDFRCERR,
output  SEDCLKOUT, SEDDONE, SEDINPROG, SEDERR
);  //synthesis syn_black_box syn_lib_cell=1
parameter SED_CLK_FREQ = "2.4";
parameter CHECKALWAYS  = "DISABLED";
parameter DEV_DENSITY  = "85KUM";
endmodule



module DCUA (
   // Channel and Dual Pins
   input  CH0_HDINP, CH1_HDINP, CH0_HDINN, CH1_HDINN, D_TXBIT_CLKP_FROM_ND, D_TXBIT_CLKN_FROM_ND, D_SYNC_ND, D_TXPLL_LOL_FROM_ND,
          CH0_RX_REFCLK, CH1_RX_REFCLK, CH0_FF_RXI_CLK, CH1_FF_RXI_CLK, CH0_FF_TXI_CLK, CH1_FF_TXI_CLK, CH0_FF_EBRD_CLK, CH1_FF_EBRD_CLK,
          CH0_FF_TX_D_0, CH1_FF_TX_D_0, CH0_FF_TX_D_1, CH1_FF_TX_D_1, CH0_FF_TX_D_2, CH1_FF_TX_D_2, CH0_FF_TX_D_3, CH1_FF_TX_D_3,
          CH0_FF_TX_D_4, CH1_FF_TX_D_4, CH0_FF_TX_D_5, CH1_FF_TX_D_5, CH0_FF_TX_D_6, CH1_FF_TX_D_6, CH0_FF_TX_D_7, CH1_FF_TX_D_7,
          CH0_FF_TX_D_8, CH1_FF_TX_D_8, CH0_FF_TX_D_9, CH1_FF_TX_D_9, CH0_FF_TX_D_10, CH1_FF_TX_D_10, CH0_FF_TX_D_11, CH1_FF_TX_D_11,
          CH0_FF_TX_D_12, CH1_FF_TX_D_12, CH0_FF_TX_D_13, CH1_FF_TX_D_13, CH0_FF_TX_D_14, CH1_FF_TX_D_14, CH0_FF_TX_D_15, CH1_FF_TX_D_15,
          CH0_FF_TX_D_16, CH1_FF_TX_D_16, CH0_FF_TX_D_17, CH1_FF_TX_D_17, CH0_FF_TX_D_18, CH1_FF_TX_D_18, CH0_FF_TX_D_19, CH1_FF_TX_D_19,
          CH0_FF_TX_D_20, CH1_FF_TX_D_20, CH0_FF_TX_D_21, CH1_FF_TX_D_21, CH0_FF_TX_D_22, CH1_FF_TX_D_22, CH0_FF_TX_D_23, CH1_FF_TX_D_23,
          CH0_FFC_EI_EN, CH1_FFC_EI_EN, CH0_FFC_PCIE_DET_EN, CH1_FFC_PCIE_DET_EN, CH0_FFC_PCIE_CT, CH1_FFC_PCIE_CT, CH0_FFC_SB_INV_RX, CH1_FFC_SB_INV_RX,
          CH0_FFC_ENABLE_CGALIGN, CH1_FFC_ENABLE_CGALIGN, CH0_FFC_SIGNAL_DETECT, CH1_FFC_SIGNAL_DETECT, CH0_FFC_FB_LOOPBACK, CH1_FFC_FB_LOOPBACK, CH0_FFC_SB_PFIFO_LP, CH1_FFC_SB_PFIFO_LP,
          CH0_FFC_PFIFO_CLR, CH1_FFC_PFIFO_CLR, CH0_FFC_RATE_MODE_RX, CH1_FFC_RATE_MODE_RX, CH0_FFC_RATE_MODE_TX, CH1_FFC_RATE_MODE_TX, CH0_FFC_DIV11_MODE_RX, CH1_FFC_DIV11_MODE_RX, CH0_FFC_RX_GEAR_MODE, CH1_FFC_RX_GEAR_MODE, CH0_FFC_TX_GEAR_MODE, CH1_FFC_TX_GEAR_MODE,
          CH0_FFC_DIV11_MODE_TX, CH1_FFC_DIV11_MODE_TX, CH0_FFC_LDR_CORE2TX_EN, CH1_FFC_LDR_CORE2TX_EN, CH0_FFC_LANE_TX_RST, CH1_FFC_LANE_TX_RST, CH0_FFC_LANE_RX_RST, CH1_FFC_LANE_RX_RST,
          CH0_FFC_RRST, CH1_FFC_RRST, CH0_FFC_TXPWDNB, CH1_FFC_TXPWDNB, CH0_FFC_RXPWDNB, CH1_FFC_RXPWDNB, CH0_LDR_CORE2TX, CH1_LDR_CORE2TX,
          D_SCIWDATA0, D_SCIWDATA1, D_SCIWDATA2, D_SCIWDATA3, D_SCIWDATA4, D_SCIWDATA5, D_SCIWDATA6, D_SCIWDATA7,
          D_SCIADDR0, D_SCIADDR1, D_SCIADDR2, D_SCIADDR3, D_SCIADDR4, D_SCIADDR5, D_SCIENAUX, D_SCISELAUX,
          CH0_SCIEN, CH1_SCIEN, CH0_SCISEL, CH1_SCISEL, D_SCIRD, D_SCIWSTN, D_CYAWSTN, D_FFC_SYNC_TOGGLE,
          D_FFC_DUAL_RST, D_FFC_MACRO_RST, D_FFC_MACROPDB, D_FFC_TRST, CH0_FFC_CDR_EN_BITSLIP, CH1_FFC_CDR_EN_BITSLIP, D_SCAN_ENABLE, D_SCAN_IN_0,
          D_SCAN_IN_1, D_SCAN_IN_2, D_SCAN_IN_3, D_SCAN_IN_4, D_SCAN_IN_5, D_SCAN_IN_6, D_SCAN_IN_7, D_SCAN_MODE,
          D_SCAN_RESET, D_CIN0, D_CIN1, D_CIN2, D_CIN3, D_CIN4, D_CIN5, D_CIN6,
          D_CIN7, D_CIN8, D_CIN9, D_CIN10, D_CIN11,
   output CH0_HDOUTP, CH1_HDOUTP, CH0_HDOUTN, CH1_HDOUTN, D_TXBIT_CLKP_TO_ND, D_TXBIT_CLKN_TO_ND, D_SYNC_PULSE2ND, D_TXPLL_LOL_TO_ND,
          CH0_FF_RX_F_CLK, CH1_FF_RX_F_CLK, CH0_FF_RX_H_CLK, CH1_FF_RX_H_CLK, CH0_FF_TX_F_CLK, CH1_FF_TX_F_CLK, CH0_FF_TX_H_CLK, CH1_FF_TX_H_CLK,
          CH0_FF_RX_PCLK, CH1_FF_RX_PCLK, CH0_FF_TX_PCLK, CH1_FF_TX_PCLK, CH0_FF_RX_D_0, CH1_FF_RX_D_0, CH0_FF_RX_D_1, CH1_FF_RX_D_1,
          CH0_FF_RX_D_2, CH1_FF_RX_D_2, CH0_FF_RX_D_3, CH1_FF_RX_D_3, CH0_FF_RX_D_4, CH1_FF_RX_D_4, CH0_FF_RX_D_5, CH1_FF_RX_D_5,
          CH0_FF_RX_D_6, CH1_FF_RX_D_6, CH0_FF_RX_D_7, CH1_FF_RX_D_7, CH0_FF_RX_D_8, CH1_FF_RX_D_8, CH0_FF_RX_D_9, CH1_FF_RX_D_9,
          CH0_FF_RX_D_10, CH1_FF_RX_D_10, CH0_FF_RX_D_11, CH1_FF_RX_D_11, CH0_FF_RX_D_12, CH1_FF_RX_D_12, CH0_FF_RX_D_13, CH1_FF_RX_D_13,
          CH0_FF_RX_D_14, CH1_FF_RX_D_14, CH0_FF_RX_D_15, CH1_FF_RX_D_15, CH0_FF_RX_D_16, CH1_FF_RX_D_16, CH0_FF_RX_D_17, CH1_FF_RX_D_17,
          CH0_FF_RX_D_18, CH1_FF_RX_D_18, CH0_FF_RX_D_19, CH1_FF_RX_D_19, CH0_FF_RX_D_20, CH1_FF_RX_D_20, CH0_FF_RX_D_21, CH1_FF_RX_D_21,
          CH0_FF_RX_D_22, CH1_FF_RX_D_22, CH0_FF_RX_D_23, CH1_FF_RX_D_23, CH0_FFS_PCIE_DONE, CH1_FFS_PCIE_DONE, CH0_FFS_PCIE_CON, CH1_FFS_PCIE_CON,
          CH0_FFS_RLOS, CH1_FFS_RLOS, CH0_FFS_LS_SYNC_STATUS, CH1_FFS_LS_SYNC_STATUS, CH0_FFS_CC_UNDERRUN, CH1_FFS_CC_UNDERRUN, CH0_FFS_CC_OVERRUN, CH1_FFS_CC_OVERRUN,
          CH0_FFS_RXFBFIFO_ERROR, CH1_FFS_RXFBFIFO_ERROR, CH0_FFS_TXFBFIFO_ERROR, CH1_FFS_TXFBFIFO_ERROR, CH0_FFS_RLOL, CH1_FFS_RLOL, CH0_FFS_SKP_ADDED, CH1_FFS_SKP_ADDED,
          CH0_FFS_SKP_DELETED, CH1_FFS_SKP_DELETED, CH0_LDR_RX2CORE, CH1_LDR_RX2CORE, D_SCIRDATA0, D_SCIRDATA1, D_SCIRDATA2, D_SCIRDATA3,
          D_SCIRDATA4, D_SCIRDATA5, D_SCIRDATA6, D_SCIRDATA7, D_SCIINT, D_SCAN_OUT_0, D_SCAN_OUT_1, D_SCAN_OUT_2,
          D_SCAN_OUT_3, D_SCAN_OUT_4, D_SCAN_OUT_5, D_SCAN_OUT_6, D_SCAN_OUT_7, D_COUT0, D_COUT1, D_COUT2,
          D_COUT3, D_COUT4, D_COUT5, D_COUT6, D_COUT7, D_COUT8, D_COUT9, D_COUT10,
          D_COUT11, D_COUT12, D_COUT13, D_COUT14, D_COUT15, D_COUT16, D_COUT17, D_COUT18,
          D_COUT19,
   // No of ports = 157 inputs + 129 outputs = 286

   // PLL Pins
   input  D_REFCLKI,
   output D_FFS_PLOL
   // No of ports = 1 inputs + 1 outputs = 2

   // Total no of ports = 288
  ); //synthesis syn_black_box syn_lib_cell=1 black_box_pad_pin="CH0_HDINP, CH1_HDINP, CH0_HDINN, CH1_HDINN, CH0_HDOUTP, CH1_HDOUTP, CH0_HDOUTN, CH1_HDOUTN"


   // Ch_Dual_Attr
   parameter D_MACROPDB = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter D_IB_PWDNB = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter D_XGE_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter D_LOW_MARK = "DONTCARE"; //"DONTCARE" "0d0"-"0d15"
   parameter D_HIGH_MARK = "DONTCARE"; //"DONTCARE" "0d0"-"0d15"
   parameter D_BUS8BIT_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter D_CDR_LOL_SET = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter D_BITCLK_LOCAL_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter D_BITCLK_ND_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter D_BITCLK_FROM_ND_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter D_SYNC_LOCAL_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter D_SYNC_ND_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_UC_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_UC_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_PCIE_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_PCIE_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RIO_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RIO_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_WA_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_WA_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_INVERT_RX = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_INVERT_RX = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_INVERT_TX = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_INVERT_TX = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_PRBS_SELECTION = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_PRBS_SELECTION = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_GE_AN_ENABLE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_GE_AN_ENABLE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_PRBS_LOCK = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_PRBS_LOCK = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_PRBS_ENABLE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_PRBS_ENABLE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_ENABLE_CG_ALIGN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_ENABLE_CG_ALIGN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_TX_GEAR_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_TX_GEAR_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RX_GEAR_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RX_GEAR_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_PCS_DET_TIME_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_PCS_DET_TIME_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_PCIE_EI_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_PCIE_EI_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_TX_GEAR_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_TX_GEAR_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_ENC_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_ENC_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_SB_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_SB_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RX_SB_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RX_SB_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_WA_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_WA_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_DEC_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_DEC_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_CTC_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_CTC_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RX_GEAR_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RX_GEAR_BYPASS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_LSM_DISABLE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_LSM_DISABLE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_MATCH_2_ENABLE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_MATCH_2_ENABLE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_MATCH_4_ENABLE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_MATCH_4_ENABLE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_MIN_IPG_CNT = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_MIN_IPG_CNT = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_CC_MATCH_1 = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH1_CC_MATCH_1 = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH0_CC_MATCH_2 = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH1_CC_MATCH_2 = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH0_CC_MATCH_3 = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH1_CC_MATCH_3 = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH0_CC_MATCH_4 = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH1_CC_MATCH_4 = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH0_UDF_COMMA_MASK = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH1_UDF_COMMA_MASK = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH0_UDF_COMMA_A = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH1_UDF_COMMA_A = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH0_UDF_COMMA_B = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH1_UDF_COMMA_B = "DONTCARE"; //"DONTCARE" "0x000"-"0x3ff"
   parameter CH0_RX_DCO_CK_DIV = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_RX_DCO_CK_DIV = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH0_RCV_DCC_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RCV_DCC_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_REQ_LVL_SET = "DONTCARE"; //"DONTCARE" "0b00" "0b11"
   parameter CH1_REQ_LVL_SET = "DONTCARE"; //"DONTCARE" "0b00" "0b11"
   parameter CH0_REQ_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_REQ_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RTERM_RX = "DONTCARE"; //"DONTCARE" "0d0"-"0d31"
   parameter CH1_RTERM_RX = "DONTCARE"; //"DONTCARE" "0d0"-"0d31"
   parameter CH0_PDEN_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_PDEN_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_LDR_RX2CORE_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_LDR_RX2CORE_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_LDR_CORE2TX_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_LDR_CORE2TX_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_TPWDNB = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_TPWDNB = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RATE_MODE_TX = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RATE_MODE_TX = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RTERM_TX = "DONTCARE"; //"DONTCARE" "0d0"-"0d31
   parameter CH1_RTERM_TX = "DONTCARE"; //"DONTCARE" "0d0"-"0d31"
   parameter CH0_TX_CM_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TX_CM_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TDRV_PRE_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_TDRV_PRE_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_TDRV_SLICE0_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TDRV_SLICE0_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TDRV_SLICE1_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TDRV_SLICE1_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TDRV_SLICE2_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TDRV_SLICE2_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TDRV_SLICE3_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TDRV_SLICE3_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TDRV_SLICE4_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TDRV_SLICE4_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TDRV_SLICE5_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TDRV_SLICE5_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TDRV_SLICE0_CUR = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_TDRV_SLICE0_CUR = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH0_TDRV_SLICE1_CUR = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_TDRV_SLICE1_CUR = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH0_TDRV_SLICE2_CUR = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TDRV_SLICE2_CUR = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TDRV_SLICE3_CUR = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TDRV_SLICE3_CUR = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TDRV_SLICE4_CUR = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TDRV_SLICE4_CUR = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TDRV_SLICE5_CUR = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TDRV_SLICE5_CUR = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TDRV_DAT_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_TDRV_DAT_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_TX_DIV11_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_TX_DIV11_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RPWDNB = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RPWDNB = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RATE_MODE_RX = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RATE_MODE_RX = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RLOS_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RLOS_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RX_LOS_LVL = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_RX_LOS_LVL = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH0_RX_LOS_CEQ = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_RX_LOS_CEQ = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_RX_LOS_HYST_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RX_LOS_HYST_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RX_LOS_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RX_LOS_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RX_DIV11_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_RX_DIV11_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_SEL_SD_RX_CLK = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_SEL_SD_RX_CLK = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_FF_RX_H_CLK_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_FF_RX_H_CLK_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_FF_RX_F_CLK_DIS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_FF_RX_F_CLK_DIS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_FF_TX_H_CLK_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_FF_TX_H_CLK_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_FF_TX_F_CLK_DIS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_FF_TX_F_CLK_DIS = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RX_RATE_SEL = "DONTCARE"; //"DONTCARE" "0d0"-"0d15"
   parameter CH1_RX_RATE_SEL = "DONTCARE"; //"DONTCARE" "0d0"-"0d15"
   parameter CH0_TDRV_POST_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_TDRV_POST_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_TX_POST_SIGN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_TX_POST_SIGN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_TX_PRE_SIGN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_TX_PRE_SIGN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_RXTERM_CM = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_RXTERM_CM = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_RXIN_CM = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_RXIN_CM = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_LEQ_OFFSET_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_LEQ_OFFSET_SEL = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_LEQ_OFFSET_TRIM = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_LEQ_OFFSET_TRIM = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter D_TX_MAX_RATE = "DONTCARE"; //"DONTCARE" "0.27"-"3.125"
   parameter CH0_CDR_MAX_RATE = "DONTCARE"; //"DONTCARE" "0.27"-"3.125"
   parameter CH1_CDR_MAX_RATE = "DONTCARE"; //"DONTCARE" "0.27"-"3.125"
   parameter CH0_TXAMPLITUDE = "DONTCARE"; //"DONTCARE" "0d0"-"0d9"
   parameter CH1_TXAMPLITUDE = "DONTCARE"; //"DONTCARE" "0d0"-"0d9"
   parameter CH0_TXDEPRE = "DONTCARE"; //"DONTCARE" "0d0"-"0d9"
   parameter CH1_TXDEPRE = "DONTCARE"; //"DONTCARE" "0d0"-"0d9"
   parameter CH0_TXDEPOST = "DONTCARE"; //"DONTCARE" "0d0"-"0d9"
   parameter CH1_TXDEPOST = "DONTCARE"; //"DONTCARE" "0d0"-"0d9"
   parameter CH0_PROTOCOL = "DONTCARE"; //"DONTCARE" "0d0"-"0d9"
   parameter CH1_PROTOCOL = "DONTCARE"; //"DONTCARE" "0d0"-"0d9"
   // No of parameters = 172

   // Analog_Attr
   parameter D_ISETLOS = "DONTCARE"; //"DONTCARE" "0d0"-"0d255"
   parameter D_SETIRPOLY_AUX = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter D_SETICONST_AUX = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter D_SETIRPOLY_CH = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter D_SETICONST_CH = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter D_REQ_ISET = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter D_PD_ISET = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter D_DCO_CALIB_TIME_SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_DCOCTLGI = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_DCOCTLGI = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH0_DCOATDDLY = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_DCOATDDLY = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_DCOATDCFG = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_DCOATDCFG = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_DCOBYPSATD = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_DCOBYPSATD = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_DCOSCALEI = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_DCOSCALEI = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_DCOITUNE4LSB = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_DCOITUNE4LSB = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH0_DCOIOSTUNE = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_DCOIOSTUNE = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH0_DCODISBDAVOID = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_DCODISBDAVOID = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_DCOCALDIV = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_DCOCALDIV = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH0_DCONUOFLSB = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_DCONUOFLSB = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH0_DCOIUPDNX2 = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_DCOIUPDNX2 = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_DCOSTEP = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_DCOSTEP = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_DCOSTARTVAL = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_DCOSTARTVAL = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH0_DCOFLTDAC = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_DCOFLTDAC = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_DCOITUNE = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_DCOITUNE = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_DCOFTNRG = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH1_DCOFTNRG = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter CH0_CDR_CNT4SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_CDR_CNT4SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_CDR_CNT8SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH1_CDR_CNT8SEL = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter CH0_BAND_THRESHOLD = "DONTCARE"; //"DONTCARE" "0d0"-"0d63"
   parameter CH1_BAND_THRESHOLD = "DONTCARE"; //"DONTCARE" "0d0"-"0d63"
   parameter CH0_AUTO_FACQ_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_AUTO_FACQ_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_AUTO_CALIB_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_AUTO_CALIB_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_CALIB_CK_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_CALIB_CK_MODE = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH0_REG_BAND_OFFSET = "DONTCARE"; //"DONTCARE" "0d0"-"0d15"
   parameter CH1_REG_BAND_OFFSET = "DONTCARE"; //"DONTCARE" "0d0"-"0d15"
   parameter CH0_REG_BAND_SEL = "DONTCARE"; //"DONTCARE" "0d0"-"0d63"
   parameter CH1_REG_BAND_SEL = "DONTCARE"; //"DONTCARE" "0d0"-"0d63"
   parameter CH0_REG_IDAC_SEL = "DONTCARE"; //"DONTCARE" "0d0"-"0d1023"
   parameter CH1_REG_IDAC_SEL = "DONTCARE"; //"DONTCARE" "0d0"-"0d1023"
   parameter CH0_REG_IDAC_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter CH1_REG_IDAC_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   // No of parameters = 60

   // PLL Attr
   parameter D_TXPLL_PWDNB = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter D_SETPLLRC = "DONTCARE"; //"DONTCARE" "0d0"-"0d63"
   parameter D_REFCK_MODE = "DONTCARE"; //"DONTCARE" "0b000"-"0b100"
   parameter D_TX_VCO_CK_DIV = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter D_PLL_LOL_SET = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter D_RG_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter D_RG_SET = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter D_CMUSETISCL4VCO = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter D_CMUSETI4VCO = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter D_CMUSETINITVCT = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter D_CMUSETZGM = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter D_CMUSETP2AGM = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter D_CMUSETP1GM = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter D_CMUSETI4CPZ = "DONTCARE"; //"DONTCARE" "0d0" "0d15"
   parameter D_CMUSETI4CPP = "DONTCARE"; //"DONTCARE" "0d0" "0d15"
   parameter D_CMUSETICP4Z = "DONTCARE"; //"DONTCARE" "0b000"-"0b111"
   parameter D_CMUSETICP4P = "DONTCARE"; //"DONTCARE" "0b00"-"0b11"
   parameter D_CMUSETBIASI = "DONTCARE"; //"DONTCARE" "0b00" "0b11"
   // No of parameters = 18

   // Total no of parameters = 250
endmodule

