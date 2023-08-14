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
// Header files for XP2 family.
// 
// -------------------------------------------------------------------- 

module ILVDS (A, AN, Z); //synthesis syn_black_box black_box_pad_pin="A,AN"
  input  A;
  input  AN;
  output Z;
endmodule

module OLVDS (A, Z, ZN); //synthesis syn_black_box black_box_pad_pin="Z,ZN"
  input  A;
  output Z;
  output ZN;
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

module DPR16X4A ( DI0, DI1, DI2, DI3, WAD0, WAD1, WAD2, WAD3, WRE, WCK,
                 RAD0, RAD1, RAD2, RAD3, DO0, DO1, DO2, DO3); //synthesis syn_black_box
 
  input WAD0,WAD1,WAD2,WAD3,DI0, DI1, DI2, DI3, WCK, WRE;
  input RAD0,RAD1,RAD2,RAD3;
  output DO0, DO1, DO2, DO3;
endmodule

module DPR16X4B ( DI0, DI1, DI2, DI3, WAD0, WAD1, WAD2, WAD3, WRE, WCK,
                 RAD0, RAD1, RAD2, RAD3, DO0, DO1, DO2, DO3); //synthesis syn_black_box
 
  input WAD0,WAD1,WAD2,WAD3,DI0, DI1, DI2, DI3, WCK, WRE;
  input RAD0,RAD1,RAD2,RAD3;
  output DO0, DO1, DO2, DO3;

  parameter [63:0] initval = 64'h0000000000000000;
endmodule

module SPR16X4A (DI0, DI1, DI2, DI3, AD0, AD1, AD2, AD3, WRE, CK,
                 DO0, DO1, DO2, DO3);  //synthesis syn_black_box
 
  input AD0,AD1,AD2,AD3,DI0, DI1, DI2, DI3, CK, WRE;
  output DO0, DO1, DO2, DO3;

endmodule

module SPR16X4B (DI0, DI1, DI2, DI3, AD0, AD1, AD2, AD3, WRE, CK,
                 DO0, DO1, DO2, DO3);  //synthesis syn_black_box
 
  input AD0,AD1,AD2,AD3,DI0, DI1, DI2, DI3, CK, WRE;
  output DO0, DO1, DO2, DO3;

  parameter [63:0] initval = 64'h0000000000000000;
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

module BBW (I, T, O, B);  //synthesis syn_black_box black_box_pad_pin="B"
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

module DCS (CLK0, CLK1, SEL, DCSOUT);  //synthesis syn_black_box

parameter   DCSMODE  = "NEG";

input  CLK0 ;
input  CLK1 ;
input  SEL ;
output DCSOUT ;
endmodule

module EPLLD (CLKI, CLKFB, RST, RSTK, DPAMODE, DRPAI3, DRPAI2, DRPAI1, DRPAI0,
DFPAI3, DFPAI2, DFPAI1, DFPAI0, CLKOP, CLKOS, CLKOK, LOCK, CLKINTFB);  //synthesis syn_black_box

input  CLKI, CLKFB, RST, RSTK, DPAMODE, DRPAI3, DRPAI2, DRPAI1, DRPAI0;
input  DFPAI3, DFPAI2, DFPAI1, DFPAI0;
output CLKOP, CLKOS, CLKOK, LOCK, CLKINTFB;
parameter FIN = "100.0000";
parameter CLKI_DIV = 1;
parameter CLKFB_DIV = 1;
parameter CLKOP_DIV = 8;
parameter CLKOK_DIV = 2;
parameter PHASEADJ = "0.0";
parameter DUTY = 8;
parameter PHASE_CNTL = "STATIC";
parameter PLLCAP = "DISABLED";
parameter CLKOP_BYPASS = "DISABLED";
parameter CLKOS_BYPASS = "DISABLED";
parameter CLKOK_BYPASS = "DISABLED";
parameter PLLTYPE  = "AUTO";
endmodule

module EPLLD1 (CLKI, CLKFB, RST, RSTK, DPAMODE, DRPAI3, DRPAI2, DRPAI1, DRPAI0,
DFPAI3, DFPAI2, DFPAI1, DFPAI0, PWD, CLKOP, CLKOS, CLKOK, LOCK, CLKINTFB);  //synthesis syn_black_box

input  CLKI, CLKFB, RST, RSTK, DPAMODE, DRPAI3, DRPAI2, DRPAI1, DRPAI0;
input  DFPAI3, DFPAI2, DFPAI1, DFPAI0, PWD;
output CLKOP, CLKOS, CLKOK, LOCK, CLKINTFB;
parameter FIN = "100.0000";
parameter CLKI_DIV = 1;
parameter CLKFB_DIV = 1;
parameter CLKOP_DIV = 8;
parameter CLKOK_DIV = 2;
parameter PHASEADJ = "0.0";
parameter DUTY = 8;
parameter PHASE_CNTL = "STATIC";
parameter PLLCAP = "DISABLED";
parameter CLKOP_BYPASS = "DISABLED";
parameter CLKOS_BYPASS = "DISABLED";
parameter CLKOK_BYPASS = "DISABLED";
parameter PLLTYPE  = "AUTO";
endmodule

module EHXPLLE (CLKI, CLKFB, RST, RSTK, WRDEL, DRPAI3, DRPAI2, DRPAI1, DRPAI0,
DFPAI3, DFPAI2, DFPAI1, DFPAI0,
CLKOP, CLKOS, CLKOK, CLKOK2, LOCK, CLKINTFB); //synthesis syn_black_box

input  CLKI, CLKFB, RST, RSTK, WRDEL, DRPAI3, DRPAI2, DRPAI1, DRPAI0;
input  DFPAI3, DFPAI2, DFPAI1, DFPAI0;
output CLKOP, CLKOS, CLKOK, CLKOK2, LOCK, CLKINTFB;

parameter FIN = "100.0000";
parameter CLKI_DIV = 1;
parameter CLKFB_DIV = 1;
parameter CLKOP_DIV = 8;
parameter CLKOK_DIV = 2;
parameter PHASEADJ = "0.0";
parameter DUTY = 8;
parameter PHASE_CNTL = "STATIC";
parameter CLKOP_BYPASS = "DISABLED";
parameter CLKOS_BYPASS = "DISABLED";
parameter CLKOK_BYPASS = "DISABLED";
parameter CLKOP_TRIM_POL = "FALLING";
parameter CLKOP_TRIM_DELAY = 0;
parameter CLKOS_TRIM_POL = "RISING";
parameter CLKOS_TRIM_DELAY = 0;

endmodule

module EHXPLLE1 (CLKI, CLKFB, RST, RSTK, WRDEL, DRPAI3, DRPAI2, DRPAI1, DRPAI0,
DFPAI3, DFPAI2, DFPAI1, DFPAI0, PWD,
CLKOP, CLKOS, CLKOK, CLKOK2, LOCK, CLKINTFB); //synthesis syn_black_box

input  CLKI, CLKFB, RST, RSTK, WRDEL, DRPAI3, DRPAI2, DRPAI1, DRPAI0;
input  DFPAI3, DFPAI2, DFPAI1, DFPAI0, PWD;
output CLKOP, CLKOS, CLKOK, CLKOK2, LOCK, CLKINTFB;

parameter FIN = "100.0000";
parameter CLKI_DIV = 1;
parameter CLKFB_DIV = 1;
parameter CLKOP_DIV = 8;
parameter CLKOK_DIV = 2;
parameter PHASEADJ = "0.0";
parameter DUTY = 8;
parameter PHASE_CNTL = "STATIC";
parameter CLKOP_BYPASS = "DISABLED";
parameter CLKOS_BYPASS = "DISABLED";
parameter CLKOK_BYPASS = "DISABLED";
parameter CLKOP_TRIM_POL = "FALLING";
parameter CLKOP_TRIM_DELAY = 0;
parameter CLKOS_TRIM_POL = "RISING";
parameter CLKOS_TRIM_DELAY = 0;

endmodule

module FADD2B (A0, A1,  B0, B1, CI, 
       COUT, S0, S1);  //synthesis syn_black_box
input  A0, A1, B0, B1, CI;
output COUT, S0, S1;
endmodule

module CCU2B (
   CIN,
   A0, B0, C0, D0,
   A1, B1, C1, D1,
   S0, S1, COUT 
); //synthesis syn_black_box syn_unconnected_inputs  = "CIN"

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

module FSUB2B (A0, A1, B0, B1, BI, BOUT, S0, S1); //synthesis syn_black_box

  input  A0, A1, B0, B1, BI;
  output BOUT, S0, S1;
endmodule 

module SGSR (GSR, CLK)  /* synthesis syn_black_box syn_noprune=1 */;
input GSR, CLK;
endmodule

module GSR (GSR)  /* synthesis syn_black_box syn_noprune=1 */;
input GSR ;
endmodule

module JTAGE ( TCK, TMS, TDI, JTDO1, JTDO2,
  TDO, JTDI, JTCK, JRTI1, JRTI2, JSHIFT, JUPDATE, JRSTN, JCE1, JCE2)  /* synthesis syn_black_box syn_noprune=1 */;
 parameter ER1 = "ENABLED";
 parameter ER2 = "ENABLED";
input TCK, TMS, TDI, JTDO1, JTDO2;
output TDO, JTDI, JTCK, JRTI1, JRTI2;
output JSHIFT, JUPDATE, JRSTN, JCE1, JCE2;
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

module IDDRXC (D, CLK, RST, CE, QA, QB); //synthesis syn_black_box
input  D, CLK, RST, CE;
output QA, QB;
endmodule

module IDDRFXA (D, CLK1, CLK2, RST, CE, QA, QB); //synthesis syn_black_box
input  D, CLK1, CLK2, RST, CE;
output QA, QB;
endmodule

module IDDRX2B (D, ECLK, SCLK, RST, CE, QA0, QA1, QB0, QB1); //synthesis syn_black_box
input  D, ECLK, SCLK, RST, CE;
output QA0, QA1, QB0, QB1;
endmodule

module IDDRMX1A (D, ECLK, SCLK, RST, CE, DDRCLKPOL, QA, QB); //synthesis syn_black_box
input  D, ECLK, SCLK, RST, CE, DDRCLKPOL;
output  QA, QB;
endmodule

module IDDRMFX1A (D, ECLK, CLK1, CLK2, RST, CE, DDRCLKPOL, QA, QB); //synthesis syn_black_box
input   D, ECLK, CLK1, CLK2, RST, CE, DDRCLKPOL;
output  QA, QB;
endmodule

module ODDRXC (DA, DB, CLK, RST, Q); //synthesis syn_black_box
input   DA, DB, CLK, RST;
output  Q;
endmodule

module ODDRMXA (DA, DB, CLK, RST, DQSXFER, Q); //synthesis syn_black_box
input   DA, DB, CLK, RST, DQSXFER;
output  Q;
endmodule

module ODDRX2B (DA0, DB0, DA1, DB1, ECLK, SCLK, RST, Q); //synthesis syn_black_box
input   DA0, DB0, DA1, DB1, ECLK, SCLK, RST;
output  Q;
endmodule

module DQSDLL (CLK, RST, UDDCNTL, LOCK, DQSDEL); //synthesis syn_black_box
parameter DEL_ADJ = "PLUS";
parameter DEL_VAL = "0";
parameter LOCK_SENSITIVITY = "LOW";
input   CLK, RST, UDDCNTL;
output  LOCK, DQSDEL;
endmodule

module DQSBUFC (DQSI, CLK, XCLK, READ, DQSDEL, DQSO, DDRCLKPOL, DQSC, PRMBDET, DQSXFER, DATAVALID); //synthesis syn_black_box
input   DQSI, CLK, XCLK, READ, DQSDEL;
output  DQSO, DDRCLKPOL, DQSC, PRMBDET, DQSXFER, DATAVALID;
parameter DQS_LI_DEL_VAL = "4";
parameter DQS_LI_DEL_ADJ = "MINUS";
parameter DQS_LO_DEL_VAL = "4";
parameter DQS_LO_DEL_ADJ = "MINUS";
endmodule

module CLKDIVB (CLKI, RST, RELEASE, CDIV1, CDIV2, CDIV4, CDIV8); //synthesis syn_black_box
input   CLKI, RST, RELEASE;
output  CDIV1, CDIV2, CDIV4, CDIV8;
parameter  GSR = "DISABLED";
endmodule

module OSCE (OSC); //synthesis syn_black_box
output   OSC;
parameter  NOM_FREQ = "2.5" ;
endmodule

module IOWAKEUPA (UWKUP)/* synthesis syn_black_box syn_noprune=1 */;
input   UWKUP;
endmodule

module DELAYB (A, DEL0, DEL1, DEL2, DEL3,Z); //synthesis syn_black_box
input  A, DEL0, DEL1, DEL2, DEL3;
output  Z;
endmodule

module STFA (STOREN, UFMFAIL, UFMBUSYN); //synthesis syn_black_box
input  STOREN;
output  UFMFAIL, UFMBUSYN;
endmodule

module SEDBA (SEDENABLE, SEDSTART, SEDFRCERRN, SEDERR, SEDDONE, SEDINPROG, SEDCLKOUT); //synthesis syn_black_box
input SEDENABLE, SEDSTART, SEDFRCERRN; 
output SEDERR, SEDDONE, SEDINPROG, SEDCLKOUT;
parameter OSC_DIV = 1;
parameter CHECKALWAYS = "DISABLED";
parameter AUTORECONFIG = "OFF";
parameter MCCLK_FREQ = "2.5";
parameter DEV_DENSITY = "17K";
parameter BOOT_OPTION = "INTERNAL";
endmodule

module SEDBB (SEDERR, SEDDONE, SEDINPROG)/* synthesis syn_black_box syn_noprune=1 */;
output  SEDERR, SEDDONE, SEDINPROG;
endmodule

module SSPIA (SI, CLK, CS, SO); //synthesis syn_black_box
input SI, CLK, CS; 
output SO;
parameter TAG_INITSIZE = 2184;
parameter TAG_INITIALIZATION = "DISABLED";
parameter TAG_INITVAL_00 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_01 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_02 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_03 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_04 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_05 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_06 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_07 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_08 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_09 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_0A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_0B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter TAG_INITVAL_0C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
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

module OBCO (I, OT, OC);  //synthesis syn_black_box black_box_pad_pin="OT,OC"
input  I ;
output OT ;
output OC ;
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

module OFE1P3BX (D, SP, ECLK, PD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D ;
input SP ;
input ECLK ;
input PD ;
output Q ;
endmodule

module OFE1P3DX (D, SP, ECLK, CD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D ;
input SP ;
input ECLK ;
input CD ;
output Q ;
endmodule

module OFE1P3IX (D, SP, ECLK, CD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D ;
input SP ;
input ECLK ;
input CD ;
output Q ;
endmodule

module OFE1P3JX (D, SP, ECLK, PD, Q);  //synthesis syn_black_box

  parameter GSR = "ENABLED";

input D ;
input SP ;
input ECLK ;
input PD ;
output Q ;
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

module PUR (PUR)/* synthesis syn_black_box syn_noprune=1 */;
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

module START (STARTCLK) /* synthesis syn_black_box syn_noprune=1 */;
input  STARTCLK;
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

module SP16KB (DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8,
         AD9,  AD10,  AD11, AD12, AD13,
         CE, CLK, WE, CS0, CS1, CS2, RST, 
         DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17);  //synthesis syn_black_box

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
parameter INITVAL_20 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_21 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_22 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_23 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_24 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_25 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_26 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_27 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_28 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_29 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_30 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_31 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_32 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_33 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_34 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_35 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_36 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_37 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_38 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_39 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;

input    DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8,
         AD9,  AD10,  AD11, AD12, AD13,
         CE, CLK, WE, CS0, CS1, CS2, RST;

output   DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17;
endmodule

module PDPW16KB (DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26,
         DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35,
         ADW0, ADW1, ADW2, ADW3, ADW4, ADW5, ADW6, ADW7, ADW8,
         BE0, BE1, BE2, BE3,
         CEW, CLKW, CSW0, CSW1, CSW2,  
         ADR0, ADR1, ADR2, ADR3, ADR4, ADR5, ADR6, ADR7, ADR8,
         ADR9,  ADR10,  ADR11, ADR12, ADR13,
         CER, CLKR, CSR0, CSR1, CSR2, RST, 
         DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17,
         DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26,
         DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35); //synthesis syn_black_box

   parameter  DATA_WIDTH_W = 36;
   parameter  DATA_WIDTH_R = 36;
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
parameter INITVAL_20 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_21 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_22 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_23 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_24 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_25 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_26 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_27 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_28 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_29 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_30 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_31 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_32 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_33 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_34 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_35 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_36 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_37 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_38 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_39 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;

input    DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26,
         DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35,
         ADW0, ADW1, ADW2, ADW3, ADW4, ADW5, ADW6, ADW7, ADW8,
	 BE0, BE1, BE2, BE3,
         CEW, CLKW, CSW0, CSW1, CSW2, 
         ADR0, ADR1, ADR2, ADR3, ADR4, ADR5, ADR6, ADR7, ADR8,
         ADR9,  ADR10,  ADR11, ADR12, ADR13,
         CER, CLKR, CSR0, CSR1, CSR2, RST; 

output   DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17,
         DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26,
         DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35;
endmodule

module DP16KB (DIA0, DIA1, DIA2, DIA3, DIA4, DIA5, DIA6, DIA7, DIA8,
         DIA9, DIA10, DIA11, DIA12, DIA13, DIA14, DIA15, DIA16, DIA17,
         ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8,
         ADA9,  ADA10,  ADA11, ADA12, ADA13,
         CEA, CLKA, WEA, CSA0, CSA1, CSA2, RSTA, 
         DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, DIB8,
         DIB9, DIB10, DIB11, DIB12, DIB13, DIB14, DIB15, DIB16, DIB17,
         ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8,
         ADB9,  ADB10,  ADB11, ADB12, ADB13,
         CEB, CLKB, WEB, CSB0, CSB1, CSB2, RSTB, 
         DOA0, DOA1, DOA2, DOA3, DOA4, DOA5, DOA6, DOA7, DOA8,
         DOA9, DOA10, DOA11, DOA12, DOA13, DOA14, DOA15, DOA16, DOA17,
         DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7, DOB8,
         DOB9, DOB10, DOB11, DOB12, DOB13, DOB14, DOB15, DOB16, DOB17); //synthesis syn_black_box

   parameter  DATA_WIDTH_A = 18;            //1, 2, 4, 9, 18
   parameter  DATA_WIDTH_B = 18;            //1, 2, 4, 9, 18
   parameter  REGMODE_A = "NOREG";          // "NOREG", "OUTREG"
   parameter  REGMODE_B = "NOREG";          // "NOREG", "OUTREG"
   parameter  RESETMODE = "SYNC";           // "ASYNC", "SYNC"
   parameter  CSDECODE_A = 3'b000;          // 3'b000, 3'b001, 3'b010.......3'b111
   parameter  CSDECODE_B = 3'b000;          // 3'b000, 3'b001, 3'b010.......3'b111
   parameter  WRITEMODE_A = "NORMAL";       // "NORMAL", "READBEFOREWRITE", "WRITETHROUGH"
   parameter  WRITEMODE_B = "NORMAL";       // "NORMAL", "READBEFOREWRITE", "WRITETHROUGH"
   parameter  GSR = "DISABLED";             // 

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
parameter INITVAL_20 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_21 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_22 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_23 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_24 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_25 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_26 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_27 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_28 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_29 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_2F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_30 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_31 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_32 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_33 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_34 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_35 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_36 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_37 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_38 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_39 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INITVAL_3F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000;

input    DIA0, DIA1, DIA2, DIA3, DIA4, DIA5, DIA6, DIA7, DIA8,
         DIA9, DIA10, DIA11, DIA12, DIA13, DIA14, DIA15, DIA16, DIA17,
         ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8,
         ADA9,  ADA10,  ADA11, ADA12, ADA13,
         CEA, CLKA, WEA, CSA0, CSA1, CSA2, RSTA, 
         DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, DIB8,
         DIB9, DIB10, DIB11, DIB12, DIB13, DIB14, DIB15, DIB16, DIB17,
         ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8,
         ADB9,  ADB10,  ADB11, ADB12, ADB13,
         CEB, CLKB, WEB, CSB0, CSB1, CSB2, RSTB; 
output   DOA0, DOA1, DOA2, DOA3, DOA4, DOA5, DOA6, DOA7, DOA8,
         DOA9, DOA10, DOA11, DOA12, DOA13, DOA14, DOA15, DOA16, DOA17,
         DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7, DOB8,
         DOB9, DOB10, DOB11, DOB12, DOB13, DOB14, DOB15, DOB16, DOB17;
endmodule

module MULT9X9B (P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,
SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,SROB8,SROB7,SROB6,SROB5,SROB4,
SROB3,SROB2,SROB1,SROB0,A8,A7,A6,A5,A4,A3,A2,A1,A0,B8,B7,B6,B5,B4,B3,B2,B1,B0,SRIA8,
SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,
SRIB2,SRIB1,SRIB0,SIGNEDA,SIGNEDB,CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,
RST3,SOURCEA,SOURCEB); //synthesis syn_black_box
input A8,A7,A6,A5,A4,A3,A2,A1,A0;
input B8,B7,B6,B5,B4,B3,B2,B1,B0;
input SIGNEDA,SIGNEDB,SOURCEA,SOURCEB;
input CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3;
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0;
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0;
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0;
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0;
output P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0; 

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
parameter REG_SIGNEDA_CLK = "NONE";
parameter REG_SIGNEDA_CE = "CE0";
parameter REG_SIGNEDA_RST = "RST0";
parameter REG_SIGNEDB_CLK = "NONE";
parameter REG_SIGNEDB_CE = "CE0";
parameter REG_SIGNEDB_RST = "RST0";
parameter GSR = "ENABLED";
endmodule

module MULT9X9ADDSUBB (SUM18,SUM17,SUM16,SUM15,SUM14,SUM13,SUM12,SUM11,SUM10,SUM9,SUM8,
SUM7,SUM6,SUM5,SUM4,SUM3,SUM2,SUM1,SUM0,SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,
SROA0,SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,A08,A07,A06,A05,A04,A03,A02,
A01,A00,A18,A17,A16,A15,A14,A13,A12,A11,A10,B08,B07,B06,B05,B04,B03,B02,B01,B00,B18,B17,
B16,B15,B14,B13,B12,B11,B10,SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,SRIB8,
SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,SIGNEDA,SIGNEDB,ADDNSUB,CE0,CE1,CE2,CE3,
CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3,SOURCEA0, SOURCEA1, SOURCEB0, SOURCEB1);  //synthesis syn_black_box
input A08,A07,A06,A05,A04,A03,A02,A01,A00;
input A18,A17,A16,A15,A14,A13,A12,A11,A10;
input B08,B07,B06,B05,B04,B03,B02,B01,B00;
input B18,B17,B16,B15,B14,B13,B12,B11,B10;
input SIGNEDA,SIGNEDB,ADDNSUB,SOURCEA0, SOURCEA1, SOURCEB0, SOURCEB1;
input CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3;
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0;
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0;
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0;
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0;
output SUM18,SUM17,SUM16,SUM15,SUM14,SUM13,SUM12,SUM11,SUM10,SUM9,SUM8,SUM7,SUM6,SUM5,SUM4,SUM3,SUM2,SUM1,SUM0; 

parameter REG_INPUTA0_CLK = "NONE";
parameter REG_INPUTA0_CE = "CE0";
parameter REG_INPUTA0_RST = "RST0";
parameter REG_INPUTA1_CLK = "NONE";
parameter REG_INPUTA1_CE = "CE0";
parameter REG_INPUTA1_RST = "RST0";
parameter REG_INPUTB0_CLK = "NONE";
parameter REG_INPUTB0_CE = "CE0";
parameter REG_INPUTB0_RST = "RST0";
parameter REG_INPUTB1_CLK = "NONE";
parameter REG_INPUTB1_CE = "CE0";
parameter REG_INPUTB1_RST = "RST0";
parameter REG_PIPELINE0_CLK = "NONE";
parameter REG_PIPELINE0_CE = "CE0";
parameter REG_PIPELINE0_RST = "RST0";
parameter REG_PIPELINE1_CLK = "NONE";
parameter REG_PIPELINE1_CE = "CE0";
parameter REG_PIPELINE1_RST = "RST0";
parameter REG_OUTPUT_CLK = "NONE";
parameter REG_OUTPUT_CE = "CE0";
parameter REG_OUTPUT_RST = "RST0";
parameter REG_SIGNEDA_0_CLK = "NONE";
parameter REG_SIGNEDA_0_CE = "CE0";
parameter REG_SIGNEDA_0_RST = "RST0";
parameter REG_SIGNEDA_1_CLK = "NONE";
parameter REG_SIGNEDA_1_CE = "CE0";
parameter REG_SIGNEDA_1_RST = "RST0";
parameter REG_SIGNEDB_0_CLK = "NONE";
parameter REG_SIGNEDB_0_CE = "CE0";
parameter REG_SIGNEDB_0_RST = "RST0";
parameter REG_SIGNEDB_1_CLK = "NONE";
parameter REG_SIGNEDB_1_CE = "CE0";
parameter REG_SIGNEDB_1_RST = "RST0";
parameter REG_ADDNSUB_0_CLK = "NONE";
parameter REG_ADDNSUB_0_CE = "CE0";
parameter REG_ADDNSUB_0_RST = "RST0";
parameter REG_ADDNSUB_1_CLK = "NONE";
parameter REG_ADDNSUB_1_CE = "CE0";
parameter REG_ADDNSUB_1_RST = "RST0";
parameter GSR = "ENABLED";
endmodule

module MULT9X9ADDSUBSUMB (SUM19,SUM18,SUM17,SUM16,SUM15,SUM14,SUM13,SUM12,SUM11,SUM10,SUM9,SUM8,
SUM7,SUM6,SUM5,SUM4,SUM3,SUM2,SUM1,SUM0,SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,
SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,A08,A07,A06,A05,A04,A03,A02,A01,A00,A18,
A17,A16,A15,A14,A13,A12,A11,A10,A28,A27,A26,A25,A24,A23,A22,A21,A20,A38,A37,A36,A35,A34,A33,A32,
A31,A30,B08,B07,B06,B05,B04,B03,B02,B01,B00,B18,B17,B16,B15,B14,B13,B12,B11,B10,B28,B27,B26,B25,
B24,B23,B22,B21,B20,B38,B37,B36,B35,B34,B33,B32,B31,B30,SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,
SRIA2,SRIA1,SRIA0,SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,SIGNEDA,SIGNEDB,ADDNSUB1,
ADDNSUB3,CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3,SOURCEA0, SOURCEA1, SOURCEA2, 
SOURCEA3,SOURCEB0, SOURCEB1, SOURCEB2, SOURCEB3); //synthesis syn_black_box
input A08,A07,A06,A05,A04,A03,A02,A01,A00;
input A18,A17,A16,A15,A14,A13,A12,A11,A10;
input A28,A27,A26,A25,A24,A23,A22,A21,A20;
input A38,A37,A36,A35,A34,A33,A32,A31,A30;
input B08,B07,B06,B05,B04,B03,B02,B01,B00;
input B18,B17,B16,B15,B14,B13,B12,B11,B10;
input B28,B27,B26,B25,B24,B23,B22,B21,B20;
input B38,B37,B36,B35,B34,B33,B32,B31,B30;
input SIGNEDA,SIGNEDB,ADDNSUB1,ADDNSUB3;
input SOURCEA0, SOURCEA1, SOURCEA2,SOURCEA3,SOURCEB0, SOURCEB1, SOURCEB2, SOURCEB3;
input CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3;
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0;
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0;
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0;
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0;
output SUM19,SUM18,SUM17,SUM16,SUM15,SUM14,SUM13,SUM12,SUM11,SUM10,SUM9,SUM8,SUM7,SUM6,SUM5,SUM4,SUM3,SUM2,SUM1,SUM0; 

parameter REG_INPUTA0_CLK = "NONE";
parameter REG_INPUTA0_CE = "CE0";
parameter REG_INPUTA0_RST = "RST0";
parameter REG_INPUTA1_CLK = "NONE";
parameter REG_INPUTA1_CE = "CE0";
parameter REG_INPUTA1_RST = "RST0";
parameter REG_INPUTA2_CLK = "NONE";
parameter REG_INPUTA2_CE = "CE0";
parameter REG_INPUTA2_RST = "RST0";
parameter REG_INPUTA3_CLK = "NONE";
parameter REG_INPUTA3_CE = "CE0";
parameter REG_INPUTA3_RST = "RST0";
parameter REG_INPUTB0_CLK = "NONE";
parameter REG_INPUTB0_CE = "CE0";
parameter REG_INPUTB0_RST = "RST0";
parameter REG_INPUTB1_CLK = "NONE";
parameter REG_INPUTB1_CE = "CE0";
parameter REG_INPUTB1_RST = "RST0";
parameter REG_INPUTB2_CLK = "NONE";
parameter REG_INPUTB2_CE = "CE0";
parameter REG_INPUTB2_RST = "RST0";
parameter REG_INPUTB3_CLK = "NONE";
parameter REG_INPUTB3_CE = "CE0";
parameter REG_INPUTB3_RST = "RST0";
parameter REG_PIPELINE0_CLK = "NONE";
parameter REG_PIPELINE0_CE = "CE0";
parameter REG_PIPELINE0_RST = "RST0";
parameter REG_PIPELINE1_CLK = "NONE";
parameter REG_PIPELINE1_CE = "CE0";
parameter REG_PIPELINE1_RST = "RST0";
parameter REG_PIPELINE2_CLK = "NONE";
parameter REG_PIPELINE2_CE = "CE0";
parameter REG_PIPELINE2_RST = "RST0";
parameter REG_PIPELINE3_CLK = "NONE";
parameter REG_PIPELINE3_CE = "CE0";
parameter REG_PIPELINE3_RST = "RST0";
parameter REG_OUTPUT_CLK = "NONE";
parameter REG_OUTPUT_CE = "CE0";
parameter REG_OUTPUT_RST = "RST0";
parameter REG_SIGNEDA_0_CLK = "NONE";
parameter REG_SIGNEDA_0_CE = "CE0";
parameter REG_SIGNEDA_0_RST = "RST0";
parameter REG_SIGNEDA_1_CLK = "NONE";
parameter REG_SIGNEDA_1_CE = "CE0";
parameter REG_SIGNEDA_1_RST = "RST0";
parameter REG_SIGNEDB_0_CLK = "NONE";
parameter REG_SIGNEDB_0_CE = "CE0";
parameter REG_SIGNEDB_0_RST = "RST0";
parameter REG_SIGNEDB_1_CLK = "NONE";
parameter REG_SIGNEDB_1_CE = "CE0";
parameter REG_SIGNEDB_1_RST = "RST0";
parameter REG_ADDNSUB1_0_CLK = "NONE";
parameter REG_ADDNSUB1_0_CE = "CE0";
parameter REG_ADDNSUB1_0_RST = "RST0";
parameter REG_ADDNSUB1_1_CLK = "NONE";
parameter REG_ADDNSUB1_1_CE = "CE0";
parameter REG_ADDNSUB1_1_RST = "RST0";
parameter REG_ADDNSUB3_0_CLK = "NONE";
parameter REG_ADDNSUB3_0_CE = "CE0";
parameter REG_ADDNSUB3_0_RST = "RST0";
parameter REG_ADDNSUB3_1_CLK = "NONE";
parameter REG_ADDNSUB3_1_CE = "CE0";
parameter REG_ADDNSUB3_1_RST = "RST0";
parameter GSR = "ENABLED";
endmodule

module MULT18X18B (P35,P34,P33,P32,P31,P30,P29,P28,P27,P26,P25,P24,P23,P22,P21,P20,P19,
P18,P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,SROA17,SROA16,SROA15,
SROA14,SROA13,SROA12,SROA11,SROA10,SROA9,SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,
SROA1,SROA0,SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9,SROB8,SROB7,
SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,
A5,A4,A3,A2,A1,A0,B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0,SRIA17,
SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9,SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,
SRIA3,SRIA2,SRIA1,SRIA0,SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9,
SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,SIGNEDA,SIGNEDB,CE0,CE1,CE2,CE3,
CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3,SOURCEA,SOURCEB); //synthesis syn_black_box
input A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0;
input B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0;
input SIGNEDA,SIGNEDB,SOURCEA,SOURCEB;
input CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3;
input SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9;
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0;
input SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9;
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0;
output SROA17,SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9;
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0;
output SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9;
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0;
output P35,P34,P33,P32,P31,P30,P29,P28,P27,P26,P25,P24,P23,P22,P21,P20,P19,P18; 
output P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0; 

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
parameter REG_SIGNEDA_CLK = "NONE";
parameter REG_SIGNEDA_CE = "CE0";
parameter REG_SIGNEDA_RST = "RST0";
parameter REG_SIGNEDB_CLK = "NONE";
parameter REG_SIGNEDB_CE = "CE0";
parameter REG_SIGNEDB_RST = "RST0";
parameter GSR = "ENABLED";
endmodule

module MULT18X18ADDSUBB (SUM36,SUM35,SUM34,SUM33,SUM32,SUM31,SUM30,SUM29,SUM28,SUM27,SUM26,SUM25,SUM24,SUM23,SUM22,SUM21,SUM20,SUM19,SUM18,SUM17,SUM16,SUM15,SUM14,SUM13,SUM12,SUM11,SUM10,SUM9,SUM8,SUM7,SUM6,SUM5,SUM4,SUM3,SUM2,SUM1,SUM0,SROA17,SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9,SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0,SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9,SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,A017,A016,A015,A014,A013,A012,A011,A010,A09,A08,A07,A06,A05,A04,A03,A02,A01,A00,A117,A116,A115,A114,A113,A112,A111,A110,A19,A18,A17,A16,A15,A14,A13,A12,A11,A10,B017,B016,B015,B014,B013,B012,B011,B010,B09,B08,B07,B06,B05,B04,B03,B02,B01,B00,B117,B116,B115,B114,B113,B112,B111,B110,B19,B18,B17,B16,B15,B14,B13,B12,B11,B10,SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9,SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9,SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,SIGNEDA,SIGNEDB,ADDNSUB,CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3,SOURCEA0, SOURCEA1, SOURCEB0, SOURCEB1);  //synthesis syn_black_box
input A017,A016,A015,A014,A013,A012,A011,A010,A09;
input A08,A07,A06,A05,A04,A03,A02,A01,A00;
input A117,A116,A115,A114,A113,A112,A111,A110,A19;
input A18,A17,A16,A15,A14,A13,A12,A11,A10;
input B017,B016,B015,B014,B013,B012,B011,B010,B09;
input B08,B07,B06,B05,B04,B03,B02,B01,B00;
input B117,B116,B115,B114,B113,B112,B111,B110,B19;
input B18,B17,B16,B15,B14,B13,B12,B11,B10;
input SIGNEDA,SIGNEDB,ADDNSUB,SOURCEA0, SOURCEA1, SOURCEB0, SOURCEB1;
input CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3;
input SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9;
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0;
input SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9;
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0;
output SROA17,SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9;
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0;
output SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9;
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0;
output SUM36,SUM35,SUM34,SUM33,SUM32,SUM31,SUM30,SUM29,SUM28,SUM27,SUM26,SUM25,SUM24,SUM23,SUM22,SUM21,SUM20,SUM19,SUM18,SUM17,SUM16,SUM15,SUM14,SUM13,SUM12,SUM11,SUM10,SUM9,SUM8,SUM7,SUM6,SUM5,SUM4,SUM3,SUM2,SUM1,SUM0; 

parameter REG_INPUTA0_CLK = "NONE";
parameter REG_INPUTA0_CE = "CE0";
parameter REG_INPUTA0_RST = "RST0";
parameter REG_INPUTA1_CLK = "NONE";
parameter REG_INPUTA1_CE = "CE0";
parameter REG_INPUTA1_RST = "RST0";
parameter REG_INPUTB0_CLK = "NONE";
parameter REG_INPUTB0_CE = "CE0";
parameter REG_INPUTB0_RST = "RST0";
parameter REG_INPUTB1_CLK = "NONE";
parameter REG_INPUTB1_CE = "CE0";
parameter REG_INPUTB1_RST = "RST0";
parameter REG_PIPELINE0_CLK = "NONE";
parameter REG_PIPELINE0_CE = "CE0";
parameter REG_PIPELINE0_RST = "RST0";
parameter REG_PIPELINE1_CLK = "NONE";
parameter REG_PIPELINE1_CE = "CE0";
parameter REG_PIPELINE1_RST = "RST0";
parameter REG_OUTPUT_CLK = "NONE";
parameter REG_OUTPUT_CE = "CE0";
parameter REG_OUTPUT_RST = "RST0";
parameter REG_SIGNEDA_0_CLK = "NONE";
parameter REG_SIGNEDA_0_CE = "CE0";
parameter REG_SIGNEDA_0_RST = "RST0";
parameter REG_SIGNEDA_1_CLK = "NONE";
parameter REG_SIGNEDA_1_CE = "CE0";
parameter REG_SIGNEDA_1_RST = "RST0";
parameter REG_SIGNEDB_0_CLK = "NONE";
parameter REG_SIGNEDB_0_CE = "CE0";
parameter REG_SIGNEDB_0_RST = "RST0";
parameter REG_SIGNEDB_1_CLK = "NONE";
parameter REG_SIGNEDB_1_CE = "CE0";
parameter REG_SIGNEDB_1_RST = "RST0";
parameter REG_ADDNSUB_0_CLK = "NONE";
parameter REG_ADDNSUB_0_CE = "CE0";
parameter REG_ADDNSUB_0_RST = "RST0";
parameter REG_ADDNSUB_1_CLK = "NONE";
parameter REG_ADDNSUB_1_CE = "CE0";
parameter REG_ADDNSUB_1_RST = "RST0";
parameter GSR = "ENABLED";
endmodule

module MULT18X18ADDSUBSUMB (SUM37,SUM36,SUM35,SUM34,SUM33,SUM32,SUM31,SUM30,SUM29,SUM28,
SUM27,SUM26,SUM25,SUM24,SUM23,SUM22,SUM21,SUM20,SUM19,SUM18,SUM17,SUM16,SUM15,SUM14,SUM13,
SUM12,SUM11,SUM10,SUM9,SUM8,SUM7,SUM6,SUM5,SUM4,SUM3,SUM2,SUM1,SUM0,SROA17,SROA16,SROA15,
SROA14,SROA13,SROA12,SROA11,SROA10,SROA9,SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,
SROA0,SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9,SROB8,SROB7,SROB6,
SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,A017,A016,A015,A014,A013,A012,A011,A010,A09,A08,A07,
A06,A05,A04,A03,A02,A01,A00,A117,A116,A115,A114,A113,A112,A111,A110,A19,A18,A17,A16,A15,
A14,A13,A12,A11,A10,A217,A216,A215,A214,A213,A212,A211,A210,A29,A28,A27,A26,A25,A24,A23,
A22,A21,A20,A317,A316,A315,A314,A313,A312,A311,A310,A39,A38,A37,A36,A35,A34,A33,A32,A31,
A30,B017,B016,B015,B014,B013,B012,B011,B010,B09,B08,B07,B06,B05,B04,B03,B02,B01,B00,B117,
B116,B115,B114,B113,B112,B111,B110,B19,B18,B17,B16,B15,B14,B13,B12,B11,B10,B217,B216,B215,
B214,B213,B212,B211,B210,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B317,B316,B315,B314,B313,
B312,B311,B310,B39,B38,B37,B36,B35,B34,B33,B32,B31,B30,SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,
SRIA12,SRIA11,SRIA10,SRIA9,SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,SRIB17,
SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9, SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,
SRIB3,SRIB2,SRIB1,SRIB0,SIGNEDA,SIGNEDB,ADDNSUB1,ADDNSUB3,CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,
CLK3,RST0,RST1,RST2,RST3,SOURCEA0, SOURCEA1, SOURCEA2, SOURCEA3,SOURCEB0, SOURCEB1, SOURCEB2, SOURCEB3);  //synthesis syn_black_box
input A017,A016,A015,A014,A013,A012,A011,A010,A09;
input A08,A07,A06,A05,A04,A03,A02,A01,A00;
input A117,A116,A115,A114,A113,A112,A111,A110,A19;
input A18,A17,A16,A15,A14,A13,A12,A11,A10;
input A217,A216,A215,A214,A213,A212,A211,A210,A29;
input A28,A27,A26,A25,A24,A23,A22,A21,A20;
input A317,A316,A315,A314,A313,A312,A311,A310,A39;
input A38,A37,A36,A35,A34,A33,A32,A31,A30;
input B017,B016,B015,B014,B013,B012,B011,B010,B09;
input B08,B07,B06,B05,B04,B03,B02,B01,B00;
input B117,B116,B115,B114,B113,B112,B111,B110,B19;
input B18,B17,B16,B15,B14,B13,B12,B11,B10;
input B217,B216,B215,B214,B213,B212,B211,B210,B29;
input B28,B27,B26,B25,B24,B23,B22,B21,B20;
input B317,B316,B315,B314,B313,B312,B311,B310,B39;
input B38,B37,B36,B35,B34,B33,B32,B31,B30;
input SIGNEDA,SIGNEDB,ADDNSUB1,ADDNSUB3;
input SOURCEA0,SOURCEA1,SOURCEA2,SOURCEA3,SOURCEB0,SOURCEB1,SOURCEB2,SOURCEB3;
input CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3;
input SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9;
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0;
input SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9;
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0;
output SROA17,SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9;
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0;
output SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9;
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0;
output SUM37,SUM36,SUM35,SUM34,SUM33,SUM32,SUM31,SUM30,SUM29,SUM28,SUM27,SUM26,SUM25,SUM24,SUM23,SUM22,SUM21,SUM20,SUM19,SUM18,SUM17,SUM16,SUM15,SUM14,SUM13,SUM12,SUM11,SUM10,SUM9,SUM8,SUM7,SUM6,SUM5,SUM4,SUM3,SUM2,SUM1,SUM0; 

parameter REG_INPUTA0_CLK = "NONE";
parameter REG_INPUTA0_CE = "CE0";
parameter REG_INPUTA0_RST = "RST0";
parameter REG_INPUTA1_CLK = "NONE";
parameter REG_INPUTA1_CE = "CE0";
parameter REG_INPUTA1_RST = "RST0";
parameter REG_INPUTA2_CLK = "NONE";
parameter REG_INPUTA2_CE = "CE0";
parameter REG_INPUTA2_RST = "RST0";
parameter REG_INPUTA3_CLK = "NONE";
parameter REG_INPUTA3_CE = "CE0";
parameter REG_INPUTA3_RST = "RST0";
parameter REG_INPUTB0_CLK = "NONE";
parameter REG_INPUTB0_CE = "CE0";
parameter REG_INPUTB0_RST = "RST0";
parameter REG_INPUTB1_CLK = "NONE";
parameter REG_INPUTB1_CE = "CE0";
parameter REG_INPUTB1_RST = "RST0";
parameter REG_INPUTB2_CLK = "NONE";
parameter REG_INPUTB2_CE = "CE0";
parameter REG_INPUTB2_RST = "RST0";
parameter REG_INPUTB3_CLK = "NONE";
parameter REG_INPUTB3_CE = "CE0";
parameter REG_INPUTB3_RST = "RST0";
parameter REG_PIPELINE0_CLK = "NONE";
parameter REG_PIPELINE0_CE = "CE0";
parameter REG_PIPELINE0_RST = "RST0";
parameter REG_PIPELINE1_CLK = "NONE";
parameter REG_PIPELINE1_CE = "CE0";
parameter REG_PIPELINE1_RST = "RST0";
parameter REG_PIPELINE2_CLK = "NONE";
parameter REG_PIPELINE2_CE = "CE0";
parameter REG_PIPELINE2_RST = "RST0";
parameter REG_PIPELINE3_CLK = "NONE";
parameter REG_PIPELINE3_CE = "CE0";
parameter REG_PIPELINE3_RST = "RST0";
parameter REG_OUTPUT_CLK = "NONE";
parameter REG_OUTPUT_CE = "CE0";
parameter REG_OUTPUT_RST = "RST0";
parameter REG_SIGNEDA_0_CLK = "NONE";
parameter REG_SIGNEDA_0_CE = "CE0";
parameter REG_SIGNEDA_0_RST = "RST0";
parameter REG_SIGNEDA_1_CLK = "NONE";
parameter REG_SIGNEDA_1_CE = "CE0";
parameter REG_SIGNEDA_1_RST = "RST0";
parameter REG_SIGNEDB_0_CLK = "NONE";
parameter REG_SIGNEDB_0_CE = "CE0";
parameter REG_SIGNEDB_0_RST = "RST0";
parameter REG_SIGNEDB_1_CLK = "NONE";
parameter REG_SIGNEDB_1_CE = "CE0";
parameter REG_SIGNEDB_1_RST = "RST0";
parameter REG_ADDNSUB1_0_CLK = "NONE";
parameter REG_ADDNSUB1_0_CE = "CE0";
parameter REG_ADDNSUB1_0_RST = "RST0";
parameter REG_ADDNSUB1_1_CLK = "NONE";
parameter REG_ADDNSUB1_1_CE = "CE0";
parameter REG_ADDNSUB1_1_RST = "RST0";
parameter REG_ADDNSUB3_0_CLK = "NONE";
parameter REG_ADDNSUB3_0_CE = "CE0";
parameter REG_ADDNSUB3_0_RST = "RST0";
parameter REG_ADDNSUB3_1_CLK = "NONE";
parameter REG_ADDNSUB3_1_CE = "CE0";
parameter REG_ADDNSUB3_1_RST = "RST0";
parameter GSR = "ENABLED";
endmodule

module MULT18X18MACB (ACCUM51,ACCUM50,ACCUM49,ACCUM48,ACCUM47,ACCUM46,ACCUM45,ACCUM44,
ACCUM43,ACCUM42,ACCUM41,ACCUM40,ACCUM39,ACCUM38,ACCUM37,ACCUM36,ACCUM35,ACCUM34,ACCUM33,
ACCUM32,ACCUM31,ACCUM30,ACCUM29,ACCUM28,ACCUM27,ACCUM26,ACCUM25,ACCUM24,ACCUM23,ACCUM22,
ACCUM21,ACCUM20,ACCUM19,ACCUM18,ACCUM17,ACCUM16,ACCUM15,ACCUM14,ACCUM13,ACCUM12,ACCUM11,
ACCUM10,ACCUM9,ACCUM8,ACCUM7,ACCUM6,ACCUM5,ACCUM4,ACCUM3,ACCUM2,ACCUM1,ACCUM0,SROA17,
SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9,SROA8,SROA7,SROA6,SROA5,SROA4,
SROA3,SROA2,SROA1,SROA0,SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9,
SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0,OVERFLOW,A17,A16,A15,A14,A13,A12,
A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0,B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,
B3,B2,B1,B0,SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9,SRIA8,SRIA7,
SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0,SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,
SRIB11,SRIB10,SRIB9,SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0,ADDNSUB,
SIGNEDA,SIGNEDB,ACCUMSLOAD,CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3,
SOURCEA, SOURCEB, LD51, LD50, LD49, LD48, LD47, LD46, LD45, LD44, LD43, LD42, LD41, 
LD40, LD39, LD38, LD37, LD36, LD35, LD34, LD33, LD32, LD31, LD30, LD29, LD28, LD27,
 LD26, LD25, LD24, LD23, LD22, LD21, LD20, LD19, LD18, LD17, LD16, LD15, LD14, LD13,
 LD12, LD11, LD10, LD9, LD8, LD7, LD6, LD5, LD4, LD3, LD2, LD1, LD0); //synthesis syn_black_box
input A17,A16,A15,A14,A13,A12,A11,A10,A9;
input A8,A7,A6,A5,A4,A3,A2,A1,A0;
input B17,B16,B15,B14,B13,B12,B11,B10,B9;
input B8,B7,B6,B5,B4,B3,B2,B1,B0;
input LD51, LD50, LD49, LD48, LD47, LD46, LD45, LD44, LD43, LD42, LD41, LD40;
input LD39, LD38, LD37, LD36, LD35, LD34, LD33, LD32, LD31, LD30;
input LD29, LD28, LD27, LD26, LD25, LD24, LD23, LD22, LD21, LD20;
input LD19, LD18, LD17, LD16, LD15, LD14, LD13, LD12, LD11, LD10;
input LD9, LD8, LD7, LD6, LD5, LD4, LD3, LD2, LD1, LD0;
input ADDNSUB, SIGNEDA,SIGNEDB,ACCUMSLOAD,SOURCEA, SOURCEB;
input CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3;
input SRIA17,SRIA16,SRIA15,SRIA14,SRIA13,SRIA12,SRIA11,SRIA10,SRIA9;
input SRIA8,SRIA7,SRIA6,SRIA5,SRIA4,SRIA3,SRIA2,SRIA1,SRIA0;
input SRIB17,SRIB16,SRIB15,SRIB14,SRIB13,SRIB12,SRIB11,SRIB10,SRIB9;
input SRIB8,SRIB7,SRIB6,SRIB5,SRIB4,SRIB3,SRIB2,SRIB1,SRIB0;
output SROA17,SROA16,SROA15,SROA14,SROA13,SROA12,SROA11,SROA10,SROA9;
output SROA8,SROA7,SROA6,SROA5,SROA4,SROA3,SROA2,SROA1,SROA0;
output SROB17,SROB16,SROB15,SROB14,SROB13,SROB12,SROB11,SROB10,SROB9;
output SROB8,SROB7,SROB6,SROB5,SROB4,SROB3,SROB2,SROB1,SROB0;
output ACCUM51,ACCUM50,ACCUM49,ACCUM48,ACCUM47,ACCUM46,ACCUM45,ACCUM44,ACCUM43,ACCUM42,ACCUM41,ACCUM40,ACCUM39,ACCUM38,ACCUM37,ACCUM36,ACCUM35,ACCUM34,ACCUM33,ACCUM32,ACCUM31,ACCUM30,ACCUM29,ACCUM28,ACCUM27,ACCUM26,ACCUM25,ACCUM24,ACCUM23,ACCUM22,ACCUM21,ACCUM20,ACCUM19,ACCUM18,ACCUM17,ACCUM16,ACCUM15,ACCUM14,ACCUM13,ACCUM12,ACCUM11,ACCUM10,ACCUM9,ACCUM8,ACCUM7,ACCUM6,ACCUM5,ACCUM4,ACCUM3,ACCUM2,ACCUM1,ACCUM0,OVERFLOW; 

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
parameter REG_SIGNEDA_0_CLK = "NONE";
parameter REG_SIGNEDA_0_CE = "CE0";
parameter REG_SIGNEDA_0_RST = "RST0";
parameter REG_SIGNEDA_1_CLK = "NONE";
parameter REG_SIGNEDA_1_CE = "CE0";
parameter REG_SIGNEDA_1_RST = "RST0";
parameter REG_SIGNEDB_0_CLK = "NONE";
parameter REG_SIGNEDB_0_CE = "CE0";
parameter REG_SIGNEDB_0_RST = "RST0";
parameter REG_SIGNEDB_1_CLK = "NONE";
parameter REG_SIGNEDB_1_CE = "CE0";
parameter REG_SIGNEDB_1_RST = "RST0";
parameter REG_ACCUMSLOAD_0_CLK = "NONE";
parameter REG_ACCUMSLOAD_0_CE = "CE0";
parameter REG_ACCUMSLOAD_0_RST = "RST0";
parameter REG_ACCUMSLOAD_1_CLK = "NONE";
parameter REG_ACCUMSLOAD_1_CE = "CE0";
parameter REG_ACCUMSLOAD_1_RST = "RST0";
parameter REG_ADDNSUB_0_CLK = "NONE";
parameter REG_ADDNSUB_0_CE = "CE0";
parameter REG_ADDNSUB_0_RST = "RST0";
parameter REG_ADDNSUB_1_CLK = "NONE";
parameter REG_ADDNSUB_1_CE = "CE0";
parameter REG_ADDNSUB_1_RST = "RST0";
parameter GSR = "ENABLED";
endmodule

module MULT36X36B (P71,P70,P69,P68,P67,P66,P65,P64,P63,P62,P61,P60,P59,P58,P57,P56,
P55,P54,P53,P52,P51,P50,P49,P48,P47,P46,P45,P44,P43,P42,P41,P40,P39,P38,P37,P36,P35,
P34,P33,P32,P31,P30,P29,P28,P27,P26,P25,P24,P23,P22,P21,P20,P19,P18,P17,P16,P15,P14,
P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,A35,A34,A33,A32,A31,A30,A29,A28,A27,
A26,A25,A24,A23,A22,A21,A20,A19,A18,A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,
A4,A3,A2,A1,A0,B35,B34,B33,B32,B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,
B18,B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0,SIGNEDA,SIGNEDB,
CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3); //synthesis syn_black_box
input A35,A34,A33,A32,A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18;
input A17,A16,A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0;
input B35,B34,B33,B32,B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18;
input B17,B16,B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0;
input SIGNEDA,SIGNEDB;
input CE0,CE1,CE2,CE3,CLK0,CLK1,CLK2,CLK3,RST0,RST1,RST2,RST3;
output P71,P70,P69,P68,P67,P66,P65,P64,P63,P62,P61,P60,P59,P58,P57,P56,P55,P54; 
output P53,P52,P51,P50,P49,P48,P47,P46,P45,P44,P43,P42,P41,P40,P39,P38,P37,P36; 
output P35,P34,P33,P32,P31,P30,P29,P28,P27,P26,P25,P24,P23,P22,P21,P20,P19,P18; 
output P17,P16,P15,P14,P13,P12,P11,P10,P9,P8,P7,P6,P5,P4,P3,P2,P1,P0; 

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
parameter REG_SIGNEDA_0_CLK = "NONE";
parameter REG_SIGNEDA_0_CE = "CE0";
parameter REG_SIGNEDA_0_RST = "RST0";
parameter REG_SIGNEDA_1_CLK = "NONE";
parameter REG_SIGNEDA_1_CE = "CE0";
parameter REG_SIGNEDA_1_RST = "RST0";
parameter REG_SIGNEDB_0_CLK = "NONE";
parameter REG_SIGNEDB_0_CE = "CE0";
parameter REG_SIGNEDB_0_RST = "RST0";
parameter REG_SIGNEDB_1_CLK = "NONE";
parameter REG_SIGNEDB_1_CE = "CE0";
parameter REG_SIGNEDB_1_RST = "RST0";
parameter GSR = "ENABLED";
endmodule

module LB2P3AX (D0, D1, CI, SP, CK, SD, CON, CO, Q0, Q1);  //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3AY (D0, D1, CI, SP, CK, SD, CON, CO, Q0, Q1);  //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3BX (D0, D1, CI, SP, CK, SD, PD, CON, CO, Q0, Q1);  //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3DX (D0, D1, CI, SP, CK, SD, CD, CON, CO, Q0, Q1);  //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3IX (D0, D1, CI, SP, CK, SD, CD, CON, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3JX (D0, D1, CI, SP, CK, SD, PD, CON, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD, CON;
output CO, Q0, Q1;
endmodule

module LD2P3AX (D0, D1, CI, SP, CK, SD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LD2P3AY (D0, D1, CI, SP, CK, SD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LD2P3BX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule

module LD2P3DX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LD2P3IX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LD2P3JX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule

module LU2P3AX (D0, D1, CI, SP, CK, SD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LU2P3AY (D0, D1, CI, SP, CK, SD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LU2P3BX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule

module LU2P3DX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LU2P3IX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LU2P3JX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1); //synthesis syn_black_box
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule

