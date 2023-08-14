// -------------------------------------------------------------------- 
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<< 
// -------------------------------------------------------------------- 
// Copyright (c) 2002-2010 by Lattice Semiconductor Corporation 
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
// Header files for SC/SCM family.
// 
// -------------------------------------------------------------------- 

module AGEB2 (A0, A1, B0, B1, CI, GE)/* synthesis syn_black_box */; 
input  A0, A1, B0, B1, CI;
output GE;
endmodule // AGEB2

module ALEB2 (A0, A1, B0, B1, CI, LE) /* synthesis syn_black_box */; 
input  A0, A1, B0, B1, CI;
output LE;
endmodule // ALEB2

module AND2(A, B, Z) /* synthesis syn_black_box */ ;
input A;
input B;
output Z;
endmodule // AND2

module AND3(A, B, C, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
output Z;
endmodule // AND3

module AND4(A, B, C, D, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
output Z;
endmodule // AND4

module AND5(A, B, C, D, E, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule // AND5

module ANEB2 (A0, A1, B0, B1, CI, NE) /* synthesis syn_black_box */; 
input  A0, A1, B0, B1, CI;
output NE;
endmodule // ANEB2

module BB (I, T, O, B) /* synthesis syn_black_box black_box_pad_pin="B" */;
input  I, T;
output O;
inout  B /* synthesis .ispad=1 */;
endmodule // BB

module BBPD (I, T, O, B) /* synthesis syn_black_box black_box_pad_pin="B" */;
input  I, T;
output O;
inout  B /* synthesis .ispad=1 */;
endmodule // BBPD

module BBPU (I, T, O, B) /* synthesis syn_black_box black_box_pad_pin="B" */;
input  I, T;
output O;
inout  B /* synthesis .ispad=1 */;
endmodule // BBPU

module BBW (I, T, O, B) /* synthesis syn_black_box black_box_pad_pin="B" */ ;
input  I, T;
output O;
inout  B /* synthesis .ispad=1 */;
endmodule // BBW

module CD2 (CI, PC0, PC1, CO, NC0, NC1) /* synthesis syn_black_box */;
input  CI, PC0, PC1;
output CO, NC0, NC1;
endmodule // CD2

module CLKDET(CLK, RST, Q)/* synthesis syn_black_box syn_tpd1 = "RST->Q=0.0"*/;
   input CLK, RST;
   output Q;
endmodule // CLKDET

module CLKDIV(CLKI, LSR, CLKO, ELSR) /* synthesis syn_black_box syn_tpd1 = "CLKI->CLKO=0.0" */;
   input CLKI, LSR;
   output CLKO, ELSR;
endmodule // CLKDIV

module CLKCNTL(D, CE, CLK, Q) /* synthesis syn_black_box syn_tpd1 = "D->Q=0.0" */ ;
   parameter CLKMODE = "ECLK";
   input D, CE, CLK;
   output Q;
endmodule

module CU2 (CI, PC0, PC1, CO, NC0, NC1) /* synthesis syn_black_box */;
input  CI, PC0, PC1;
output CO, NC0, NC1;
endmodule // CU2

module DELAY (A, DCNTL0, DCNTL1, DCNTL2, DCNTL3, DCNTL4, DCNTL5, DCNTL6, DCNTL7, DCNTL8, Z) /* synthesis syn_black_box syn_tpd1 = "A->Z=0.0" */;
input A, DCNTL0, DCNTL1, DCNTL2, DCNTL3, DCNTL4, DCNTL5, DCNTL6, DCNTL7, DCNTL8;
output Z;
  
endmodule // DELAY


module DPR16X2(DI0, DI1, WAD0, WAD1, WAD2, WAD3, WRE, WPE, WCK, RAD0,
	RAD1, RAD2, RAD3, WDO0, WDO1, RDO0, RDO1) /* synthesis syn_black_box */;
parameter [63:0] initval = 64'h0000000000000000;
parameter GSR = "ENABLED";

input  DI0, DI1, WAD0, WAD1, WAD2, WAD3, WRE, WPE, WCK, RAD0, RAD1, RAD2, RAD3;
output WDO0, WDO1, RDO0, RDO1;


endmodule // DPR16X2

module FADD2 (A0, A1,  B0, B1, CI, 
       COUT0, COUT1, S0, S1) /* synthesis syn_black_box */;
input  A0, A1, B0, B1, CI;
output COUT0, COUT1, S0, S1;
endmodule // FADD2

module FD1P3AX(D, SP, CK, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input CK;
output Q;
endmodule // FD1P3AX

module FD1P3AY(D, SP, CK, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input CK;
output Q;
endmodule // FD1P3AY

module FD1P3BX(D, SP, CK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input CK;
input PD;
output Q;
endmodule // FD1P3BX

module FD1P3DX(D, SP, CK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input CK;
input CD;
output Q;
endmodule // FD1P3DX

module FD1P3IX(D, SP, CK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input CK;
input CD;
output Q;
endmodule // FD1P3IX

module FD1P3JX(D, SP, CK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input CK;
input PD;
output Q;
endmodule // FD1P3JX

module FD1S1A(D, CK, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
output Q;
endmodule // FD1S1A

module FD1S1AY(D, CK, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
output Q;
endmodule // FD1S1AY

module FD1S1B(D, CK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
input PD;
output Q;
endmodule // FD1S1B

module FD1S1D(D, CK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
input CD;
output Q;
endmodule // FD1S1D

module FD1S1I(D, CK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
input CD;
output Q;
endmodule // FD1S1I

module FD1S1J(D, CK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
input PD;
output Q;
endmodule // FD1S1J

module FD1S3AX(D, CK, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
output Q;
endmodule // FD1S3AX

module FD1S3AY(D, CK, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
output Q;
endmodule // FD1S3AY

module FD1S3BX(D, CK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
input PD;
output Q;
endmodule // FD1S3BX

module FD1S3DX(D, CK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
input CD;
output Q;
endmodule // FD1S3DX

module FD1S3IX(D, CK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
input CD;
output Q;
endmodule // FD1S3IX

module FD1S3JX(D, CK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input CK;
input PD;
output Q;
endmodule // FD1S3JX

module FL1P3AY(D0, D1, SP, CK, SD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input SP;
input CK;
input SD;
output Q;
endmodule // FL1P3AY

module FL1P3AZ(D0, D1, SP, CK, SD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input SP;
input CK;
input SD;
output Q;
endmodule // FL1P3AZ

module FL1P3BX(D0, D1, SP, CK, SD, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input SP;
input CK;
input SD;
input PD;
output Q;
endmodule // FL1P3BX

module FL1P3DX(D0, D1, SP, CK, SD, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input SP;
input CK;
input SD;
input CD;
output Q;
endmodule // FL1P3DX

module FL1P3IY(D0, D1, SP, CK, SD, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input SP;
input CK;
input SD;
input CD;
output Q;
endmodule // FL1P3IY

module FL1P3JY(D0, D1, SP, CK, SD, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input SP;
input CK;
input SD;
input PD;
output Q;
endmodule // FL1P3JY

module FL1S1A(D0, D1, CK, SD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input CK;
input SD;
output Q;
endmodule // FL1S1A

module FL1S1AY(D0, D1, CK, SD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input CK;
input SD;
output Q;
endmodule // FL1S1AY

module FL1S1B(D0, D1, CK, SD, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input CK;
input SD;
input PD;
output Q;
endmodule // FL1S1B

module FL1S1D(D0, D1, CK, SD, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input CK;
input SD;
input CD;
output Q;
endmodule // FL1S1D

module FL1S1I(D0, D1, CK, SD, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input CK;
input SD;
input CD;
output Q;
endmodule // FL1S1I

module FL1S1J(D0, D1, CK, SD, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input CK;
input SD;
input PD;
output Q;
endmodule // FL1S1J

module FL1S3AX(D0, D1, CK, SD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input CK;
input SD;
output Q;
endmodule // FL1S3AX

module FL1S3AY(D0, D1, CK, SD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D0;
input D1;
input CK;
input SD;
output Q;
endmodule // FL1S3AY

module FSUB2 (A0, A1, B0, B1, BI, BOUT0, BOUT1, S0, S1) /* synthesis syn_black_box */;
  input  A0, A1, B0, B1, BI;
  output BOUT0, BOUT1, S0, S1;
endmodule // FSUB2


module GSR(GSR) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */; 
input GSR;
endmodule // GSR

module PVTIOCTRL(UPDATE) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */;
input UPDATE;
endmodule // PVTIOCTRL

module IB (I, O) /* synthesis syn_black_box black_box_pad_pin="I" */;
  input  I /* synthesis .ispad=1 */;
  output O;
endmodule // IB

module IBPD (I, O) /* synthesis syn_black_box black_box_pad_pin="I" */;
  input  I /* synthesis .ispad=1 */ ;
  output O;
endmodule

module IBPU(I, O) /* synthesis syn_black_box black_box_pad_pin="I" */ ;
input I /* synthesis .ispad=1 */;
output O;
endmodule // IBPU

module IFS1P3BX(D, SP, SCLK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule // IFS1P3BX

module IFS1P3DX(D, SP, SCLK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule // IFS1P3DX

module IFS1P3IX(D, SP, SCLK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule // IFS1P3IX

module IFS1P3JX(D, SP, SCLK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule // IFS1P3JX

module IFS1S1B(D, SCLK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SCLK;
input PD;
output Q;
endmodule // IFS1S1B

module IFS1S1D(D, SCLK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SCLK;
input CD;
output Q;
endmodule // IFS1S1D

module IFS1S1I(D, SCLK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SCLK;
input CD;
output Q;
endmodule // IFS1S1I

module IFS1S1J(D, SCLK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SCLK;
input PD;
output Q;
endmodule // IFS1S1J

module ILF2P3BX(D, SP, ECLK, SCLK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input ECLK;
input SCLK;
input PD;
output Q;
endmodule // ILF2P3BX

module ILF2P3DX(D, SP, ECLK, SCLK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input ECLK;
input SCLK;
input CD;
output Q;
endmodule // ILF2P3DX

module ILF2P3IX(D, SP, ECLK, SCLK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input ECLK;
input SCLK;
input CD;
output Q;
endmodule // ILF2P3IX

module ILF2P3JX(D, SP, ECLK, SCLK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input ECLK;
input SCLK;
input PD;
output Q;
endmodule // ILF2P3JX

module ILVDS (A, AN, Z) /* synthesis syn_black_box black_box_pad_pin="A,AN"*/ ;
  input  A, AN ;
  output Z;
endmodule // ILVDS

module IDDRA (D, CLK, RST, RUNAIL, RSTAIL, QA, QB, UPDATE, LOCK) /* synthesis syn_black_box syn_tpd1 = "D->LOCK=0.0" */;
   input D, CLK, RST, RUNAIL, RSTAIL;
   output QA, QB, LOCK, UPDATE;

   parameter AILRST = "ENABLED";
endmodule

module IDDRXA (D, CLK, RST, RUNAIL, RSTAIL, QA, QB, UPDATE, LOCK) /* synthesis syn_black_box syn_tpd1 = "D->LOCK=0.0" */;
   input D, CLK, RST, RUNAIL, RSTAIL;
   output QA, QB, LOCK, UPDATE;

   parameter AILRST = "ENABLED";
endmodule // IDDRXA

module IDDRX1A (D, ECLK, SCLK, RST, RUNAIL, RSTAIL, QA, QB, UPDATE, LOCK) /* synthesis syn_black_box syn_tpd1 = "D->LOCK=0.0" */;
  input D, ECLK, SCLK, RST, RUNAIL, RSTAIL;
   output QA, QB, LOCK, UPDATE;

   parameter AILRST = "ENABLED";
endmodule // IDDRX1

module IDDRX2A (D, ECLK, SCLK, RST, RUNAIL, RSTAIL, QA0, QB0, QA1, QB1, UPDATE, LOCK) /* synthesis syn_black_box syn_tpd1 = "D->LOCK=0.0" */;
   input D, ECLK, SCLK, RST, RUNAIL, RSTAIL;
   output QA0, QA1, QB0, QB1, UPDATE, LOCK;

   parameter AILRST = "ENABLED";
   parameter LSRMODE = "LOCAL";
   parameter UPDT = "POS";
endmodule

module IDDRX4A (D, ECLK, SCLK, RST, RUNAIL, RSTAIL, QA0, QB0, QA1, QB1, QA2, QB2, QA3, QB3, UPDATE, LOCK) /* synthesis syn_black_box syn_tpd1 = "D->LOCK=0.0" */; 
   input D, ECLK, SCLK, RST, RUNAIL, RSTAIL;
   output QA0, QA1, QA2, QA3, QB0, QB1, QB2, QB3, UPDATE, LOCK;

   parameter AILRST = "ENABLED";
   parameter LSRMODE = "LOCAL";
   parameter UPDT = "POS";
endmodule // IDDRX4A

module INV(A, Z) /* synthesis syn_black_box */ ;
input A;
output Z;
endmodule // INV

module ISRX1A (D, CLK, RST, RUNAIL, RSTAIL, Q, UPDATE, LOCK) /* synthesis syn_black_box syn_tpd1 = "D->LOCK=0.0" */;
   input D, CLK, RST, RUNAIL, RSTAIL;
   output Q, LOCK, UPDATE;

   parameter AILRST = "ENABLED";
endmodule // ISRX1A

module ISRX2A (D, ECLK, SCLK, RST, RUNAIL, RSTAIL, Q0, Q1, UPDATE, LOCK) /* synthesis syn_black_box syn_tpd1 = "D->LOCK=0.0" */;
   input D, ECLK, SCLK, RST, RUNAIL, RSTAIL;
   output Q0, Q1, UPDATE, LOCK;

   parameter AILRST = "ENABLED";
   parameter LSRMODE = "LOCAL";
   parameter UPDT = "POS";
endmodule // ISRX2A

module ISRX4A (D, ECLK, SCLK, RST, RUNAIL, RSTAIL, Q0, Q1, Q2, Q3, UPDATE, LOCK) /* synthesis syn_black_box syn_tpd1 = "D->LOCK=0.0" */;
   input D, ECLK, SCLK, RST, RUNAIL, RSTAIL;
   output Q0, Q1, Q2, Q3, UPDATE, LOCK;

   parameter AILRST = "ENABLED";
   parameter LSRMODE = "LOCAL";
   parameter UPDT = "POS";
endmodule // ISRX4A

module JTAGA (TCK, TMS, TDI, PSROUT1, PSROUT2, PSROUT3, JTDO1, JTDO2, JTDO3, JTDO4, 
	      JTDO5, JTDO6, JTDO7, JTDO8, TDO,
              TRESET, PSRSFTN, PSRCAP, PSRENABLE1, PSRENABLE2, PSRENABLE3,
              SCANENABLE1, SCANENABLE2, SCANENABLE3, SCANENABLE4, SCANENABLE5,
              SCANENABLE6, SCANENABLE7, SCANENABLE8, SCANI, 
              JTCK, JTDI, JSHIFT, JUPDATE, JRSTN,
              JCE1, JCE2, JCE3, JCE4, JCE5, JCE6, JCE7, JCE8,
              JRTI1, JRTI2, JRTI3, JRTI4, JRTI5, JRTI6, JRTI7, JRTI8)/* synthesis syn_black_box */ /* synthesis syn_noprune=1 */; 
 parameter JTAG_FLASH_PRGRM = "ENABLED";
 input   TCK, TMS, TDI, PSROUT1, PSROUT2, PSROUT3, JTDO1, JTDO2, JTDO3;
 input   JTDO4, JTDO5, JTDO6, JTDO7, JTDO8;

 output  TDO, TRESET, PSRSFTN, PSRCAP, PSRENABLE1, PSRENABLE2, PSRENABLE3;
 output  SCANENABLE1, SCANENABLE2, SCANENABLE3, SCANENABLE4, SCANENABLE5;
 output  SCANENABLE6, SCANENABLE7, SCANENABLE8,SCANI;
 output  JTCK, JTDI, JSHIFT, JUPDATE, JRSTN;
 output  JCE1, JCE2, JCE3, JCE4, JCE5, JCE6, JCE7, JCE8;
 output  JRTI1, JRTI2, JRTI3, JRTI4, JRTI5, JRTI6, JRTI7, JRTI8;
endmodule // JTAGA

module L6MUX21 (D0, D1, SD, Z) /* synthesis syn_black_box */;
  input  D0, D1, SD;
  output Z;
endmodule // L6MUX21


module MUX161 (D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, 
   D10, D11, D12, D13, D14, D15, SD1, SD2, SD3, SD4, Z) /* synthesis syn_black_box */ ;
  input  D0, D1, D2, D3, D4, D5, D6, D7;
  input  D8, D9, D10, D11, D12, D13, D14, D15, SD1, SD2, SD3, SD4;
  output Z;
endmodule // MUX161

module MUX21 (D0, D1, SD, Z) /* synthesis syn_black_box */ ;
input D0;
input D1;
input SD;
output Z;
endmodule // MUX21

module MUX321 (D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, 
   D10, D11, D12, D13, D14, D15, 
   D16, D17, D18, D19, D20, D21, D22, D23, D24,
   D25, D26, D27, D28, D29, D30, D31, SD1, SD2, SD3, SD4, SD5, Z) /* synthesis syn_black_box */ ;
  input  D0, D1, D2, D3, D4, D5, D6, D7;
  input  D8, D9, D10, D11, D12, D13, D14, D15;
  input  D16, D17, D18, D19, D20, D21, D22, D23, D24;
  input  D25, D26, D27, D28, D29, D30, D31, SD1, SD2, SD3, SD4, SD5;
  output Z;
endmodule // MUX321

module MUX41 (D0, D1, D2, D3, SD1, SD2, Z) /* synthesis syn_black_box */ ;
input D0;
input D1;
input D2;
input D3;
input SD1;
input SD2;
output Z;
endmodule // MUX41


module MUX81 (D0, D1, D2, D3, D4, D5, D6, D7, SD1, SD2, SD3, Z) /* synthesis syn_black_box */ ;
  input  D0, D1, D2, D3, D4, D5, D6, D7, SD1, SD2, SD3;
  output Z;
endmodule // MUX81

module ND2 (A, B, Z) /* synthesis syn_black_box */ ;
input A;
input B;
output Z;
endmodule // ND2

module ND3 (A, B, C, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
output Z;
endmodule // ND3

module ND4 (A, B, C, D, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
output Z;
endmodule // ND4

module ND5 (A, B, C, D, E, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule // ND5

module NR2 (A, B, Z) /* synthesis syn_black_box */ ;
input A;
input B;
output Z;
endmodule // NR2

module NR3 (A, B, C, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
output Z;
endmodule // NR3

module NR4 (A, B, C, D, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
output Z;
endmodule // NR4

module NR5 (A, B, C, D, E, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule // NR5

module OB (I, O) /* synthesis syn_black_box black_box_pad_pin="O" */;
  input  I;
  output O /* synthesis .ispad=1 */;
endmodule // OB

module OBW (I, T, O) /* synthesis syn_black_box black_box_pad_pin="O" */;
  input  I, T;
  output O /* synthesis .ispad=1 */;
endmodule // OBW

module OBZ (I, T, O) /* synthesis syn_black_box black_box_pad_pin="O"*/;
  input  I, T;
  output O /* synthesis .ispad=1 */;
endmodule // OBZ


module OBZPD (I, T, O) /* synthesis syn_black_box black_box_pad_pin="O" */ ;
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule // OBZPD

module OBZPU (I, T, O) /* synthesis syn_black_box black_box_pad_pin="O" */ ;
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule // OBZPU

module OFE1P3BX (D, SP, ECLK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input ECLK;
input PD;
output Q;
endmodule // OFE1P3BX

module OFE1P3DX (D, SP, ECLK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input ECLK;
input CD;
output Q;
endmodule // OFE1P3DX

module OFE1P3IX (D, SP, ECLK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input ECLK;
input CD;
output Q;
endmodule // OFE1P3IX

module OFE1P3JX (D, SP, ECLK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input ECLK;
input PD;
output Q;
endmodule // OFE1P3JX

module OFS1P3BX (D, SP, SCLK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule // OFS1P3BX

module OFS1P3DX (D, SP, SCLK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule // OFS1P3DX

module OFS1P3IX (D, SP, SCLK, CD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule // OFS1P3IX

module OFS1P3JX (D, SP, SCLK, PD, Q) /* synthesis syn_black_box */ ;
  parameter GSR = "ENABLED";
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule // OFS1P3JX

module OLVDS (A, Z, ZN) /* synthesis syn_black_box black_box_pad_pin="Z,ZN" */ ;
  input  A;
  output Z, ZN ;
endmodule // OLVDS

module OR2 (A, B, Z) /* synthesis syn_black_box */ ;
input A;
input B;
output Z;
endmodule // OR2

module OR3 (A, B, C, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
output Z;
endmodule // OR3

module OR4 (A, B, C, D, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
output Z;
endmodule // OR4

module OR5 (A, B, C, D, E, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule // OR5

module OSCA (OSC) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */;
parameter DIV = 1;
output OSC;
endmodule // OSCIL

module OSRX1A(D, CLK, RST, Q) /* synthesis syn_black_box syn_tpd1 = "RST->Q=0.0" */ ;
   parameter REGSET = "RESET";    // "RESET" or "SET"

   input D, CLK, RST;
   output Q;
endmodule // OSRX1A

module OSRX2A (D0, D1, ECLK, SCLK, RST, Q, UPDATE) /* synthesis syn_black_box syn_tpd1 = "RST->Q=0.0" */;
   parameter LSRMODE = "LOCAL";
   parameter UPDT = "POS";
   parameter REGSET = "RESET";    // "RESET" or "SET"

   input D0, D1, ECLK, SCLK, RST;
   output Q, UPDATE;
endmodule // OSRX2A

module OSRX4A (D0, D1, D2, D3, ECLK, SCLK, RST, Q, UPDATE) /* synthesis syn_black_box syn_tpd1 = "RST->Q=0.0" */;
   parameter LSRMODE = "LOCAL";
   parameter UPDT = "POS";
   parameter REGSET = "RESET";    // "RESET" or "SET"

   input D0, D1, D2, D3, ECLK, SCLK, RST;
   output Q, UPDATE;
endmodule // OSRX4A

module ODDRA (DA, DB, CLK, RST, Q) /* synthesis syn_black_box syn_tpd1 = "RST->Q=0.0" */;
   parameter REGSET = "RESET";    // "RESET" or "SET"

   input DA, DB, CLK, RST;
   output Q;
endmodule // ODDRA

module ODDRXA (DA, DB, CLK, RST, Q) /* synthesis syn_black_box syn_tpd1 = "RST->Q=0.0" */;
   parameter REGSET = "RESET";    // "RESET" or "SET"

   input DA, DB, CLK, RST;
   output Q;
endmodule // ODDRXA

module ODDRX2A(DA0, DB0, DA1, DB1, ECLK, SCLK, RST, Q, UPDATE)/* synthesis syn_black_box syn_tpd1 = "RST->Q=0.0" */;
   parameter LSRMODE = "LOCAL";
   parameter UPDT = "POS";
   parameter REGSET = "RESET";    // "RESET" or "SET"

   input DA0, DA1, DB0, DB1, ECLK, SCLK, RST;
   output Q, UPDATE;
endmodule // ODDRX2A

module ODDRX4A (DA0, DB0, DA1, DB1, DA2, DB2, DA3, DB3, ECLK, SCLK, RST, Q, UPDATE) /* synthesis syn_black_box syn_tpd1 = "RST->Q=0.0" */;
   parameter LSRMODE = "LOCAL";
   parameter UPDT = "POS";
   parameter REGSET = "RESET";    // "RESET" or "SET"

   input DA0, DA1, DA2, DA3, DB0, DB1, DB2, DB3, ECLK, SCLK, RST;
   output Q, UPDATE;
endmodule // ODDRX4A

module PFUMX (ALUT, BLUT, C0, Z) /* synthesis syn_black_box */ ;
input ALUT;
input BLUT;
input C0;
output Z;
endmodule // PFUMX

module PUR (PUR) /* synthesis syn_black_box syn_noprune=1 */ ;
  parameter RST_PULSE = 1;
  input PUR;
endmodule // PUR

module RDBK (RDCFGN, FFRDCFG, FFRDCFGCLK, RDDATA) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */; 
input  RDCFGN;
input  FFRDCFG;
input  FFRDCFGCLK;
output RDDATA;
endmodule // READBK

module ROM128X1(AD0, AD1, AD2, AD3, AD4, AD5, AD6, DO0) /* synthesis syn_black_box */ ;
   parameter [127:0] initval = 128'h00000000000000000000000000000000;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input AD5;
input AD6;
output DO0;
endmodule // ROM128X1

module ROM16X1(AD0, AD1, AD2, AD3, DO0) /* synthesis syn_black_box */ ;
   parameter [15:0] initval = 16'h0000;
input AD0;
input AD1;
input AD2;
input AD3;
output DO0;
endmodule // ROM16X1

module ROM256X1 ( AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, DO0) /* synthesis syn_black_box */;
   parameter [255:0] initval = 256'h0000000000000000000000000000000000000000000000000000000000000000;
   input AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7;
   output DO0;
endmodule // ROM256X1

module ROM32X1(AD0, AD1, AD2, AD3, AD4, DO0) /* synthesis syn_black_box */ ;
   parameter [31:0] initval = 32'h00000000;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
output DO0;
endmodule // ROM32X1

module ROM32X4(AD0, AD1, AD2, AD3, AD4, CK, DO0, DO1, DO2, DO3, QDO0, QDO1, QDO2, QDO3) /* synthesis syn_black_box */ ;
   parameter [127:0] initval = 128'h00000000000000000000000000000000;
   parameter GSR = "ENABLED";

input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input CK;
output DO0;
output DO1;
output DO2;
output DO3;
output QDO0;
output QDO1;
output QDO2;
output QDO3;
endmodule // ROM32X4

module ROM64X1(AD0, AD1, AD2, AD3, AD4, AD5, DO0) /* synthesis syn_black_box */ ;
   parameter [63:0] initval = 64'h0000000000000000;

input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input AD5;
output DO0;
endmodule // ROM64X1

module SGSR (GSR, CLK) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */;
  input GSR, CLK;
endmodule // SGSR

module SPR16X2 (DI0, DI1, AD0, AD1, AD2, AD3, WRE, WPE, CK,
		DO0, DO1) /* synthesis syn_black_box */ ;
parameter [63:0] initval = 64'h0000000000000000;
parameter GSR = "ENABLED";

input DI0, DI1, AD0, AD1, AD2, AD3, WRE, WPE, CK;
output DO0, DO1;
endmodule // SPR16X2

module STRTUP (UCLK) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */;
input UCLK;
endmodule // STRTUP

module TSALL(TSALLN) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */; 
input TSALLN;
endmodule // TSALL

module VHI(Z) /* synthesis syn_black_box */ ;
output Z;
endmodule // VHI

module VLO(Z) /* synthesis syn_black_box */ ;
output Z;
endmodule // VLO

module XNOR2(A, B, Z) /* synthesis syn_black_box */ ;
input A;
input B;
output Z;
endmodule // XNOR2

module XNOR3(A, B, C, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
output Z;
endmodule // XNOR3

module XNOR4(A, B, C, D, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
output Z;
endmodule // XNOR4

module XNOR5(A, B, C, D, E, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule // XNOR5

module XOR11(A, B, C, D, E, F, G, H, I, J, K, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
input E;
input F;
input G;
input H;
input I;
input J;
input K;
output Z;
endmodule // XOR11

module XOR2(A, B, Z) /* synthesis syn_black_box */ ;
input A;
input B;
output Z;
endmodule // XOR2

module XOR21(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
input E;
input F;
input G;
input H;
input I;
input J;
input K;
input L;
input M;
input N;
input O;
input P;
input Q;
input R;
input S;
input T;
input U;
output Z;
endmodule // XOR21

module XOR3(A, B, C, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
output Z;
endmodule // XOR3

module XOR4(A, B, C, D, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
output Z;
endmodule // XOR4

module XOR5(A, B, C, D, E, Z) /* synthesis syn_black_box */ ;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule // XOR5

//Block RAM Based Elements

module SP16KA (DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8,
         AD9,  AD10,  AD11, AD12, AD13,
         CE, CLK, WE, CS0, CS1, CS2, RST, 
         DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17)/* synthesis syn_black_box */;
   parameter  DATA_WIDTH = 18;
   parameter  REGMODE = "NOREG";
   parameter  RESETMODE = "SYNC";
   parameter  CSDECODE = 3'b000;
   parameter  WRITEMODE = "NORMAL";
   parameter  GSR = "DISABLED";

parameter INITVAL_00 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_01 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_02 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_03 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_04 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_05 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_06 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_07 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_08 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_09 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_10 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_11 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_12 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_13 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_14 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_15 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_16 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_17 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_18 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_19 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_20 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_21 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_22 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_23 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_24 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_25 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_26 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_27 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_28 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_29 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_30 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_31 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_32 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_33 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_34 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_35 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_36 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_37 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_38 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_39 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;


input    DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8,
         AD9,  AD10,  AD11, AD12, AD13,
         CE, CLK, WE, CS0, CS1, CS2, RST;

output   DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17;

endmodule // SP16KA

module DP16KA (DIA0, DIA1, DIA2, DIA3, DIA4, DIA5, DIA6, DIA7, DIA8,
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
         DOB9, DOB10, DOB11, DOB12, DOB13, DOB14, DOB15, DOB16, DOB17) /* synthesis syn_black_box */;

   parameter  DATA_WIDTH_A = 18;            //1, 2, 4, 9, 18, 36
   parameter  DATA_WIDTH_B = 18;            //1, 2, 4, 9, 18, 36
   parameter  REGMODE_A = "NOREG";          // "NOREG", "OUTREG"
   parameter  REGMODE_B = "NOREG";          // "NOREG", "OUTREG"
   parameter  RESETMODE = "SYNC";          // "ASYNC", "SYNC"
   parameter  CSDECODE_A = 3'b000;          // 3'b000, 3'b001, 3'b010.......3'b111
   parameter  CSDECODE_B = 3'b000;          // 3'b000, 3'b001, 3'b010.......3'b111
   parameter  WRITEMODE_A = "NORMAL";       // "NORMAL", "READBEFOREWRITE", "WRITETHROUGH"
   parameter  WRITEMODE_B = "NORMAL";       // "NORMAL", "READBEFOREWRITE", "WRITETHROUGH"
   parameter  GSR = "DISABLED";             // 

parameter INITVAL_00 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_01 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_02 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_03 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_04 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_05 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_06 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_07 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_08 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_09 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_10 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_11 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_12 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_13 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_14 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_15 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_16 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_17 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_18 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_19 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_20 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_21 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_22 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_23 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_24 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_25 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_26 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_27 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_28 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_29 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_30 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_31 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_32 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_33 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_34 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_35 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_36 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_37 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_38 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_39 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;


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



endmodule // DP16KA

module PDP16KA (DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26,
         DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35,
         ADW0, ADW1, ADW2, ADW3, ADW4, ADW5, ADW6, ADW7, ADW8,
         ADW9,  ADW10,  ADW11, ADW12, ADW13,
         CEW, CLKW, WE, CSW0, CSW1, CSW2,  
         ADR0, ADR1, ADR2, ADR3, ADR4, ADR5, ADR6, ADR7, ADR8,
         ADR9,  ADR10,  ADR11, ADR12, ADR13,
         CER, CLKR, CSR0, CSR1, CSR2, RST, 
         DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17,
         DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26,
         DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35)/* synthesis syn_black_box */;

   parameter  DATA_WIDTH_W = 18;            //1, 2, 4, 9, 18, 36
   parameter  DATA_WIDTH_R = 18;            //1, 2, 4, 9, 18, 36
   parameter  REGMODE = "NOREG";          // "NOREG", "OUTREG"
   parameter  RESETMODE = "SYNC";          // "ASYNC", "SYNC"
   parameter  CSDECODE_W = 3'b000;          // 3'b000, 3'b001, 3'b010.......3'b111
   parameter  CSDECODE_R = 3'b000;          // 3'b000, 3'b001, 3'b010.......3'b111
   parameter  GSR = "DISABLED";             // 

parameter INITVAL_00 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_01 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_02 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_03 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_04 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_05 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_06 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_07 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_08 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_09 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_0F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_10 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_11 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_12 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_13 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_14 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_15 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_16 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_17 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_18 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_19 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_1F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_20 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_21 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_22 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_23 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_24 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_25 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_26 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_27 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_28 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_29 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_2F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_30 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_31 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_32 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_33 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_34 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_35 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_36 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_37 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_38 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_39 = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3A = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3B = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3C = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3D = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3E = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
parameter INITVAL_3F = 320'hXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;


input    DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26,
         DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35,
         ADW0, ADW1, ADW2, ADW3, ADW4, ADW5, ADW6, ADW7, ADW8,
         ADW9,  ADW10,  ADW11, ADW12, ADW13,
         CEW, CLKW, WE, CSW0, CSW1, CSW2, 
         ADR0, ADR1, ADR2, ADR3, ADR4, ADR5, ADR6, ADR7, ADR8,
         ADR9,  ADR10,  ADR11, ADR12, ADR13,
         CER, CLKR, CSR0, CSR1, CSR2, RST; 

output   DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17,
         DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26,
         DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35;

endmodule // PDP16KA

module FIFO16KA (DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26,
         DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35,
         FULLI, CSW0, CSW1, EMPTYI, CSR0, CSR1, WE, RE, CLKW, 
	 CLKR, RST, RPRST,  
         DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17,
         DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26,
         DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35,
         EF, AEF, AFF, FF) /* synthesis syn_black_box */ ;

parameter  DATA_WIDTH_W = 18;
parameter  DATA_WIDTH_R = 18;
parameter  REGMODE = "NOREG";
parameter  RESETMODE = "ASYNC";
parameter  CSDECODE_W = 2'b00;
parameter  CSDECODE_R = 2'b00;
parameter  AEPOINTER = 15'b000000000000000;
parameter  AEPOINTER1 = 15'b000000000000000;
parameter  AFPOINTER = 15'b000000000000000;
parameter  AFPOINTER1 = 15'b000000000000000;
parameter  FULLPOINTER = 15'b000000000000000;
parameter  FULLPOINTER1 = 15'b000000000000000;
parameter GSR = "DISABLED";


input    DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8,
         DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17,
         DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26,
         DI27, DI28, DI29, DI30, DI31, DI32, DI33, DI34, DI35,
         FULLI, CSW0, CSW1, EMPTYI, CSR0, CSR1, WE, RE, CLKW, 
	 CLKR, RST, RPRST;
output   DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8,
         DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17,
         DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26,
         DO27, DO28, DO29, DO30, DO31, DO32, DO33, DO34, DO35,
         EF, AEF, AFF, FF;

endmodule // FIFO16KA

module DCS (CLK0, CLK1, SEL, DCSOUT)/* synthesis syn_black_box syn_tpd1 = "SEL->DCSOUT=0.0" */;
  input  CLK0, CLK1, SEL;
  output DCSOUT;
parameter DCSMODE = "NEG";
endmodule
  
module EHXPLLA (SMIADDR9, SMIADDR8, SMIADDR7, SMIADDR6, SMIADDR5, SMIADDR4, 
             SMIADDR3, SMIADDR2, SMIADDR1, SMIADDR0,
             SMIRD, SMIWR, SMICLK, SMIWDATA, SMIRSTN, CLKI, CLKFB, RSTN,
             CLKOS, CLKOP, LOCK, CLKINTFB, SMIRDATA)/* synthesis syn_black_box syn_tpd1 = "CLKI->CLKOP=0.0" */;

input SMIADDR9, SMIADDR8, SMIADDR7, SMIADDR6, SMIADDR5, SMIADDR4; 
input SMIADDR3, SMIADDR2, SMIADDR1, SMIADDR0;
input SMIRD, SMIWR, SMICLK, SMIWDATA, SMIRSTN, CLKI, CLKFB, RSTN;
output CLKOS, CLKOP, LOCK, CLKINTFB, SMIRDATA;

parameter CLKI_DIV = 1;    // 1 to 64
parameter CLKFB_DIV = 1; 
parameter CLKOP_DIV = 1; 
parameter CLKOS_DIV = 1; 
parameter CLKI_FDEL = 0;   //0, 100, 200, ....700 ps 
parameter CLKFB_FDEL = 0;   //0, 100, 200, ....700 ps 
parameter CLKOS_FDEL = 0;   //0, 100, 200, ....700 ps 
parameter CLKOP_MODE = "BYPASS";   //"BYPASS", "FDEL0", "VCO", "DIV" 
parameter CLKOS_MODE = "BYPASS";   //"BYPASS", "FDEL", "VCO", "DIV" 
parameter PHASEADJ = 0;   //0, 45, 90, 135, 180, 225, 270, 315 
parameter GSR = "ENABLED";
parameter LOCK_DELAY = 100;
parameter CLKOS_VCODEL = 0; // 0, 1, 2, ... 31  0 => disabled
parameter [11:0] SMI_OFFSET = 12'h410;
parameter module_type = "EHXPLLA";
parameter ip_type = "EHXPLLA";
endmodule

module CIDDLLA (CLKI, CLKFB, RSTN, ALUHOLD, SMIADDR9, SMIADDR8, SMIADDR7, SMIADDR6, 
               SMIADDR5, SMIADDR4, SMIADDR3, SMIADDR2, SMIADDR1, SMIADDR0, SMIRD, 
	       SMIWR, SMICLK, SMIWDATA, SMIRSTN,
               CLKOP, CLKOS, LOCK, SMIRDATA)/* synthesis syn_black_box syn_tpd1 = "CLKI->CLKOP=0.0" */;
input CLKI, CLKFB, RSTN, ALUHOLD, SMIADDR9, SMIADDR8, SMIADDR7, SMIADDR6;
input SMIADDR5, SMIADDR4, SMIADDR3, SMIADDR2, SMIADDR1, SMIADDR0, SMIRD, SMIWR;
input SMICLK, SMIWDATA, SMIRSTN;
output CLKOP, CLKOS, LOCK, SMIRDATA;

parameter CLKOP_PHASE = 0;
parameter CLKOS_PHASE = 0;
parameter CLKOS_FPHASE = 0;
parameter CLKOP_DUTY50 = "DISABLED";
parameter CLKOS_DUTY50 = "DISABLED";
parameter CLKI_DIV = 1;
parameter CLKOS_DIV = 1;
parameter GSR = "DISABLED";
parameter CLKOS_FDEL_ADJ = "DISABLED";
parameter ALU_LOCK_CNT = 3;
parameter ALU_UNLOCK_CNT = 3;
parameter GLITCH_TOLERANCE = 0;
parameter ALU_INIT_CNTVAL = 0;
parameter LOCK_DELAY=100;
parameter [11:0] SMI_OFFSET = 12'h410;
parameter module_type = "CIDDLLA";
parameter ip_type = "CIDDLLA";
endmodule

module CIMDLLA (CLKI, CLKFB, RSTN, ALUHOLD, UDDCNTL, SMIADDR9, SMIADDR8, SMIADDR7, 
		SMIADDR6, SMIADDR5, SMIADDR4, SMIADDR3, SMIADDR2, SMIADDR1, 
		SMIADDR0, SMIRD, SMIWR, SMICLK, SMIWDATA, SMIRSTN,
                CLKOP, CLKOS, LOCK, DCNTL0, DCNTL1, DCNTL2, DCNTL3, DCNTL4, DCNTL5, 
		DCNTL6, DCNTL7, DCNTL8, SMIRDATA)/* synthesis syn_black_box syn_tpd1 = "CLKI->CLKOP=0.0" */;
input CLKI, CLKFB, RSTN, ALUHOLD, UDDCNTL, SMIADDR9, SMIADDR8, SMIADDR7, SMIADDR6;
input SMIADDR5, SMIADDR4, SMIADDR3, SMIADDR2, SMIADDR1, SMIADDR0, SMIRD, SMIWR;
input SMICLK, SMIWDATA, SMIRSTN;
output CLKOP, CLKOS, LOCK, DCNTL0, DCNTL1, DCNTL2, DCNTL3, DCNTL4, DCNTL5, DCNTL6;
output DCNTL7, DCNTL8, SMIRDATA;

parameter CLKOS_FPHASE = 0;
parameter CLKOS_DIV = 1;
parameter GSR = "DISABLED";
parameter ALU_LOCK_CNT = 3;
parameter ALU_UNLOCK_CNT = 3;
parameter GLITCH_TOLERANCE = 0;
parameter DCNTL_ADJVAL = 0;
parameter LOCK_DELAY=100;
parameter CLKOS_FDEL_ADJ = "DISABLED";
parameter [11:0] SMI_OFFSET = 12'h410;
parameter module_type = "CIMDLLA";
parameter ip_type = "CIMDLLA";

endmodule

module TRDLLA (CLKI, RSTN, ALUHOLD, UDDCNTL, SMIADDR9, SMIADDR8, SMIADDR7, SMIADDR6,
               SMIADDR5, SMIADDR4, SMIADDR3, SMIADDR2, SMIADDR1, SMIADDR0, SMIRD, 
	       SMIWR, SMICLK, SMIWDATA, SMIRSTN, CLKOP, CLKOS, LOCK, DCNTL0, 
	       DCNTL1, DCNTL2, DCNTL3, DCNTL4, DCNTL5, DCNTL6, DCNTL7, DCNTL8, 
	       SMIRDATA)/* synthesis syn_black_box syn_tpd1 = "CLKI->CLKOP=0.0"*/;
input CLKI, RSTN, ALUHOLD, UDDCNTL, SMIADDR9, SMIADDR8, SMIADDR7, SMIADDR6;
input SMIADDR5, SMIADDR4, SMIADDR3, SMIADDR2, SMIADDR1, SMIADDR0, SMIRD, SMIWR;
input SMICLK, SMIWDATA, SMIRSTN;
output CLKOP, CLKOS, LOCK, DCNTL0, DCNTL1, DCNTL2, DCNTL3, DCNTL4, DCNTL5, DCNTL6;
output DCNTL7, DCNTL8, SMIRDATA;

parameter CLKOP_PHASE = 0;
parameter CLKOS_PHASE = 0;
parameter CLKOS_FPHASE = 0;
parameter CLKOP_DUTY50 = "DISABLED";
parameter CLKOS_DUTY50 = "DISABLED";
parameter CLKOS_DIV = 1;
parameter GSR = "DISABLED";
parameter CLKOS_FDEL_ADJ = "DISABLED";
parameter CLKOS_FPHASE_ADJVAL = 0;
parameter ALU_LOCK_CNT = 3;
parameter ALU_UNLOCK_CNT = 3;
parameter GLITCH_TOLERANCE = 0;
parameter DCNTL_ADJVAL = 0;
parameter LOCK_DELAY=100;
parameter [11:0] SMI_OFFSET = 12'h410;
parameter module_type = "TRDLLA";
parameter ip_type = "TRDLLA";

endmodule

module SDCDLLA (CLKI, CLKFB, RSTN, ALUHOLD, UDDCNTL, SMIADDR9, SMIADDR8, SMIADDR7, SMIADDR6, SMIADDR5, SMIADDR4, SMIADDR3, SMIADDR2, SMIADDR1, SMIADDR0, SMIRD, SMIWR, SMICLK, SMIWDATA, SMIRSTN, CLKOP, CLKOS, LOCK, DCNTL8, DCNTL7, DCNTL6, DCNTL5, DCNTL4, DCNTL3, DCNTL2, DCNTL1, DCNTL0, SMIRDATA)/* synthesis syn_black_box syn_tpd1 = "CLKI->CLKOP=0.0" */;

input CLKI, CLKFB, RSTN, ALUHOLD, UDDCNTL, SMIADDR9, SMIADDR8, SMIADDR7, SMIADDR6;
input SMIADDR5, SMIADDR4, SMIADDR3, SMIADDR2, SMIADDR1, SMIADDR0, SMIRD, SMIWR;
input SMICLK, SMIWDATA, SMIRSTN;
output CLKOP, CLKOS, LOCK, DCNTL8, DCNTL7, DCNTL6, DCNTL5, DCNTL4, DCNTL3, DCNTL2, DCNTL1, DCNTL0, SMIRDATA;

parameter CLKOS_FPHASE = 0;
parameter CLKI_DIV = 1;
parameter CLKOS_DIV = 1;
parameter GSR = "DISABLED";
parameter CLKOS_FDEL_ADJ = "DISABLED";
parameter ALU_LOCK_CNT = 3;
parameter ALU_UNLOCK_CNT = 3;
parameter GLITCH_TOLERANCE = 0;
parameter DCNTL_ADJVAL = 0;
parameter ALU_INIT_CNTVAL = 0;
parameter LOCK_DELAY=100;
parameter [11:0] SMI_OFFSET = 12'h410;
parameter module_type = "SDCDLLA";
parameter ip_type = "SDCDLLA";
endmodule

module CB2 (CI, PC0, PC1, CON, CO, NC0, NC1)/* synthesis syn_black_box */;
input  CI, PC0, PC1, CON;
output CO, NC0, NC1;
endmodule 

module CB4 (CI, PC0, PC1, PC2, PC3, CON, CO, NC0, NC1, NC2, NC3)/* synthesis syn_black_box syn_noprune=1 */;
input  CI, PC0, PC1, PC2, PC3, CON;
output CO, NC0, NC1, NC2, NC3;
endmodule

module LB2P3AX (D0, D1, CI, SP, CK, SD, CON, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3AY (D0, D1, CI, SP, CK, SD, CON, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3BX (D0, D1, CI, SP, CK, SD, PD, CON, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3DX (D0, D1, CI, SP, CK, SD, CD, CON, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3IX (D0, D1, CI, SP, CK, SD, CD, CON, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD, CON;
output CO, Q0, Q1;
endmodule

module LB2P3JX (D0, D1, CI, SP, CK, SD, PD, CON, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD, CON;
output CO, Q0, Q1;
endmodule

module LB4P3AX (D0, D1, D2, D3, CI, SP, CK, SD, CON, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LB4P3AY (D0, D1, D2, D3, CI, SP, CK, SD, CON, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LB4P3BX (D0, D1, D2, D3, CI, SP, CK, SD, PD, CON, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, PD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LB4P3DX (D0, D1, D2, D3, CI, SP, CK, SD, CD, CON, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, CD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LB4P3IX (D0, D1, D2, D3, CI, SP, CK, SD, CD, CON, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, CD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LB4P3JX (D0, D1, D2, D3, CI, SP, CK, SD, PD, CON, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, PD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule


module LD2P3AX (D0, D1, CI, SP, CK, SD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LD2P3AY (D0, D1, CI, SP, CK, SD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LD2P3BX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule

module LD2P3DX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LD2P3IX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LD2P3JX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule

module LD4P3AX (D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LD4P3AY (D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LD4P3BX (D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, PD;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LD4P3DX (D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, CD;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LD4P3IX (D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, CD;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LD4P3JX (D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, PD;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LU2P3AX (D0, D1, CI, SP, CK, SD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LU2P3AY (D0, D1, CI, SP, CK, SD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD;
output CO, Q0, Q1;
endmodule

module LU2P3BX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule

module LU2P3DX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LU2P3IX (D0, D1, CI, SP, CK, SD, CD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, CD;
output CO, Q0, Q1;
endmodule

module LU2P3JX (D0, D1, CI, SP, CK, SD, PD, CO, Q0, Q1)/* synthesis syn_black_box */;
  parameter GSR = "ENABLED";
input  D0, D1, CI, SP, CK, SD, PD;
output CO, Q0, Q1;
endmodule

module LU4P3AX (D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LU4P3AY (D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LU4P3BX (D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, PD;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LU4P3DX (D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, CD;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LU4P3IX (D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, CD;
output CO, Q0, Q1, Q2, Q3;
endmodule

module LU4P3JX (D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3)/* synthesis syn_black_box syn_noprune=1 */;
  parameter GSR = "ENABLED";
input  D0, D1, D2, D3, CI, SP, CK, SD, PD;
output CO, Q0, Q1, Q2, Q3;
endmodule

