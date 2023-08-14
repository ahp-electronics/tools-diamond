//
// Copyright (c) 1994 - 2003 Synplicity Inc
// $Header: //synplicity/map202003lat/mappers/att/lib/orca4.v#1 $
//

module XOR5(A, B, C, D, E, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module XOR4(A, B, C, D, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
output Z;
endmodule
module XOR21(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, Z) /* synthesis syn_black_box */;
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
endmodule
module XOR2(A, B, Z) /* synthesis syn_black_box */;
input A;
input B;
output Z;
endmodule
module XOR11(A, B, C, D, E, F, G, H, I, J, K, Z) /* synthesis syn_black_box */;
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
endmodule
module XNOR5(A, B, C, D, E, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module XNOR4(A, B, C, D, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
output Z;
endmodule
module XNOR3(A, B, C, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
output Z;
endmodule
module XNOR2(A, B, Z) /* synthesis syn_black_box */;
input A;
input B;
output Z;
endmodule
module VLO(Z) /* synthesis syn_black_box */;
output Z;
endmodule
module VHI(Z) /* synthesis syn_black_box */;
output Z;
endmodule
module TSALL(TSALL) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */;
input TSALL;
endmodule
module TIBUF(I, T, O) /* synthesis syn_black_box */;
input I;
input T;
output O /* synthesis syn_tristate=1 */;
endmodule
module TBUF(I, T, O) /* synthesis syn_black_box */;
input I;
input T;
output O /* synthesis syn_tristate=1 */;
endmodule
module STRTUP(UCLK) /* synthesis syn_black_box */;
input UCLK;
endmodule
module SOR8(A, B, C, D, E, F, G, H, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
input E;
input F;
input G;
input H;
output Z;
endmodule
module SOR6(A, B, C, D, E, F, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
input E;
input F;
output Z;
endmodule
module SOR4(A, B, C, D, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
output Z;
endmodule
module SOR2(A, B, Z) /* synthesis syn_black_box */;
input A;
input B;
output Z;
endmodule
module SOR10(A, B, C, D, E, F, G, H, I, J, Z) /* synthesis syn_black_box */;
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
output Z;
endmodule
module SAOI442(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, Z) /* synthesis syn_black_box */;
input A1;
input A2;
input A3;
input A4;
input B1;
input B2;
input B3;
input B4;
input C1;
input C2;
output Z;
endmodule
module SAOI44(A1, A2, A3, A4, B1, B2, B3, B4, Z) /* synthesis syn_black_box */;
input A1;
input A2;
input A3;
input A4;
input B1;
input B2;
input B3;
input B4;
output Z;
endmodule
module SAOI42(A1, A2, A3, A4, B1, B2, Z) /* synthesis syn_black_box */;
input A1;
input A2;
input A3;
input A4;
input B1;
input B2;
output Z;
endmodule
module SAND8(A, B, C, D, E, F, G, H, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
input E;
input F;
input G;
input H;
output Z;
endmodule
module SAND6(A, B, C, D, E, F, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
input E;
input F;
output Z;
endmodule
module SAND4(A, B, C, D, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
output Z;
endmodule
module SAND2(A, B, Z) /* synthesis syn_black_box */;
input A;
input B;
output Z;
endmodule
module SAND10(A, B, C, D, E, F, G, H, I, J, Z) /* synthesis syn_black_box */;
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
output Z;
endmodule
module ROM32X4(AD0, AD1, AD2, AD3, AD4, CK, DO0, DO1, DO2, DO3, QDO0, QDO1, QDO2, QDO3) /* synthesis syn_black_box */;
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
endmodule
module ROM32X1(AD0, AD1, AD2, AD3, AD4, DO0) /* synthesis syn_black_box */;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
output DO0;
endmodule
module ROM16X1(AD0, AD1, AD2, AD3, DO0) /* synthesis syn_black_box */;
input AD0;
input AD1;
input AD2;
input AD3;
output DO0;
endmodule
module READBK(RDCFGN, CAPT, PRDDATA, RDBO) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */;
input RDCFGN;
input CAPT;
output PRDDATA;
output RDBO;
endmodule
module RCE32X4(AD0, AD1, AD2, AD3, AD4, DI0, DI1, DI2, DI3, CK, WREN, WPE0, WPE1, DO0, DO1, DO2, DO3, QDO0, QDO1, QDO2, QDO3) /* synthesis syn_black_box */;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input DI0;
input DI1;
input DI2;
input DI3;
input CK;
input WREN;
input WPE0;
input WPE1;
output DO0;
output DO1;
output DO2;
output DO3;
output QDO0;
output QDO1;
output QDO2;
output QDO3;
endmodule
module PLLT(CLKIN, FB, ECLK, SCLK, LOCK) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */;
input CLKIN;
input FB;
output ECLK;
output SCLK;
output LOCK;
endmodule
module PLLB(CLKIN, FB, ECLK, SCLK, LOCK) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */;
input CLKIN;
input FB;
output ECLK;
output SCLK;
output LOCK;
endmodule
module PCMB (CLKIN, FB, WE, RE, A2, A1, A0,
             DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0,
             DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0,
             ECLK, SCLK, LOCK
             ) /* synthesis syn_black_box */;

input     CLKIN, FB, WE, RE, A2, A1, A0;
input     DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0;
output    DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0;
output    ECLK, SCLK, LOCK;
endmodule
module PCMT (CLKIN, FB, WE, RE, A2, A1, A0,
             DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0,
             DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0,
             ECLK, SCLK, LOCK
             ) /* synthesis syn_black_box */;
input     CLKIN, FB, WE, RE, A2, A1, A0;
input     DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0;
output    DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0;
output    ECLK, SCLK, LOCK;
endmodule
module PFUMX(ALUT, BLUT, C0, Z) /* synthesis syn_black_box */;
input ALUT;
input BLUT;
input C0;
output Z;
endmodule
module PFUMX41 (D0, D1, D2, D3, SD1, SD2, Z) /* synthesis syn_black_box */;
input  D0, D1, D2, D3, SD1, SD2;
output Z;
endmodule
module PCMBUFT(CLKIN, ECLK, SCLK) /* synthesis syn_black_box */;
input CLKIN;
output ECLK;
output SCLK;
endmodule
module PCMBUFB(CLKIN, ECLK, SCLK) /* synthesis syn_black_box */;
input CLKIN;
output ECLK;
output SCLK;
endmodule
module OSXOR2(A, SCLK, Z) /* synthesis syn_black_box */;
input A;
input SCLK;
output Z;
endmodule
module OSXNOR2(A, SCLK, Z) /* synthesis syn_black_box */;
input A;
input SCLK;
output Z;
endmodule
module OSOR2(A, SCLK, Z) /* synthesis syn_black_box */;
input A;
input SCLK;
output Z;
endmodule
module OSNR2(A, SCLK, Z) /* synthesis syn_black_box */;
input A;
input SCLK;
output Z;
endmodule
module OSND2(A, SCLK, Z) /* synthesis syn_black_box */;
input A;
input SCLK;
output Z;
endmodule
module OSMUX21(D0, D1, SCLK, Z) /* synthesis syn_black_box */;
input D0;
input D1;
input SCLK;
output Z;
endmodule
module OSCIL(TEST, OSC) /* synthesis syn_black_box */;
input TEST;
output OSC;
endmodule
module OSAND2(A, SCLK, Z) /* synthesis syn_black_box */;
input A;
input SCLK;
output Z;
endmodule
module OR5(A, B, C, D, E, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module OR4(A, B, C, D, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
output Z;
endmodule
module OR2(A, B, Z) /* synthesis syn_black_box */;
input A;
input B;
output Z;
endmodule
module OFS1S1B (D, SCLK, PD, Q) /* synthesis syn_black_box */;
input  D, SCLK, PD;
output Q;
endmodule
module OFS1S1D (D, SCLK, CD, Q) /* synthesis syn_black_box */;
input  D, SCLK, CD;
output Q;
endmodule
module OFS1S1I (D, SCLK, CD, Q) /* synthesis syn_black_box */;
input  D, SCLK, CD;
output Q;
endmodule
module OFS1S1J (D, SCLK, PD, Q) /* synthesis syn_black_box */;
input  D, SCLK, PD;
output Q;
endmodule
module OFE1S1B (D, ECLK, PD, Q) /* synthesis syn_black_box */;
input  D, ECLK, PD;
output Q;
endmodule
module OFE1S1D (D, ECLK, CD, Q) /* synthesis syn_black_box */;
input  D, ECLK, CD;
output Q;
endmodule
module OFE1S1I (D, ECLK, CD, Q) /* synthesis syn_black_box */;
input  D, ECLK, CD;
output Q;
endmodule
module OFE1S1J (D, ECLK, PD, Q) /* synthesis syn_black_box */;
input  D, ECLK, PD;
output Q;
endmodule
module OFS1P3JZ(D, SP, SCLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module OFS1P3JX(D, SP, SCLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module OFS1P3IZ(D, SP, SCLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module OFS1P3IX(D, SP, SCLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module OFS1P3DX(D, SP, SCLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module OFS1P3BX(D, SP, SCLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module OFE1P3JZ(D, SP, ECLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input PD;
output Q; 
endmodule
module OFE1P3JX(D, SP, ECLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input PD;
output Q;
endmodule
module OFE1P3IZ(D, SP, ECLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input CD;
output Q;
endmodule
module OFE1P3IX(D, SP, ECLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input CD;
output Q;
endmodule
module OFE1P3DX(D, SP, ECLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input CD;
output Q;
endmodule
module OFE1P3BX(D, SP, ECLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input PD;
output Q;
endmodule
module OEXOR2(A, ECLK, Z) /* synthesis syn_black_box */;
input A;
input ECLK;
output Z;
endmodule
module OEXNOR2(A, ECLK, Z) /* synthesis syn_black_box */;
input A;
input ECLK;
output Z;
endmodule
module OEOR2(A, ECLK, Z) /* synthesis syn_black_box */;
input A;
input ECLK;
output Z;
endmodule
module OENR2(A, ECLK, Z) /* synthesis syn_black_box */;
input A;
input ECLK;
output Z;
endmodule
module OEND2(A, ECLK, Z) /* synthesis syn_black_box */;
input A;
input ECLK;
output Z;
endmodule
module OEMUX21(D0, D1, ECLK, Z) /* synthesis syn_black_box */;
input D0;
input D1;
input ECLK;
output Z;
endmodule
module OEAND2(A, ECLK, Z) /* synthesis syn_black_box */;
input A;
input ECLK;
output Z;
endmodule
module OBZ6PU(I, T, O) /* synthesis syn_black_box */;
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ6PD(I, T, O) /* synthesis syn_black_box */;
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ6(I, T, O) /* synthesis syn_black_box */;
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12PU(I, T, O) /* synthesis syn_black_box */;
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12PD(I, T, O) /* synthesis syn_black_box */;
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12FPU(I, T, O) /* synthesis syn_black_box */;
input I;
input T;
output O;
endmodule
module OBZ12FPD(I, T, O) /* synthesis syn_black_box */;
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12F(I, T, O) /* synthesis syn_black_box */;
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12(I, T, O) /* synthesis syn_black_box */;
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OB6(I, O) /* synthesis syn_black_box */;
input I;
output O /* synthesis .ispad=1 */;
endmodule
module OB12F(I, O) /* synthesis syn_black_box */;
input I;
output O /* synthesis .ispad=1 */;
endmodule
module OB12(I, O) /* synthesis syn_black_box */;
input I;
output O /* synthesis .ispad=1 */;
endmodule
module NR5(A, B, C, D, E, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module NR4(A, B, C, D, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
output Z;
endmodule
module NR3(A, B, C, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
output Z;
endmodule
module NR2(A, B, Z) /* synthesis syn_black_box */;
input A;
input B;
output Z;
endmodule
module ND5(A, B, C, D, E, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module ND4(A, B, C, D, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
output Z;
endmodule
module ND3(A, B, C, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
output Z;
endmodule
module ND2(A, B, Z) /* synthesis syn_black_box */;
input A;
input B;
output Z;
endmodule
module MUX41E(D0, D1, D2, D3, SD1, SD2, E, Z) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input SD1;
input SD2;
input E;
output Z;
endmodule
module MUX41(D0, D1, D2, D3, SD1, SD2, Z) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input SD1;
input SD2;
output Z;
endmodule
module MUX21E(D0, D1, SD, E, Z) /* synthesis syn_black_box */;
input D0;
input D1;
input SD;
input E;
output Z;
endmodule
module MUX21(D0, D1, SD, Z) /* synthesis syn_black_box */;
input D0;
input D1;
input SD;
output Z;
endmodule
module LU8P3JX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LU8P3IX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LU8P3DX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LU8P3BX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LU4P3JX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LU4P3IX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LU4P3DX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LU4P3BX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LU4P3AY(D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LU4P3AX(D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LD8P3JX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LD8P3IX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LD8P3DX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LD8P3BX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LD4P3JX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LD4P3IX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LD4P3DX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LD4P3BX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LD4P3AY(D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LD4P3AX(D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LB8P3JX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input PD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LB8P3IX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input CD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LB8P3DX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input CD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LB8P3BX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input D4;
input D5;
input D6;
input D7;
input CI;
input SP;
input CK;
input SD;
input PD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module LB4P3JX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CON, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input PD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LB4P3IX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CON, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input CD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LB4P3DX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CON, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input CD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LB4P3BX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CON, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input PD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LB4P3AY(D0, D1, D2, D3, CI, SP, CK, SD, CON, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module LB4P3AX(D0, D1, D2, D3, CI, SP, CK, SD, CON, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input D0;
input D1;
input D2;
input D3;
input CI;
input SP;
input CK;
input SD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module INV(A, Z) /* synthesis syn_black_box */;
input A;
output Z;
endmodule
module INCDEC8(CI, PC0, PC1, PC2, PC3, PC4, PC5, PC6, PC7, CON, CO, NC0, NC1, NC2, NC3, NC4, NC5, NC6, NC7) /* synthesis syn_black_box */;
input CI;
input PC0;
input PC1;
input PC2;
input PC3;
input PC4;
input PC5;
input PC6;
input PC7;
input CON;
output CO;
output NC0;
output NC1;
output NC2;
output NC3;
output NC4;
output NC5;
output NC6;
output NC7;
endmodule
module INCDEC4(CI, PC0, PC1, PC2, PC3, CON, CO, NC0, NC1, NC2, NC3) /* synthesis syn_black_box */;
input CI;
input PC0;
input PC1;
input PC2;
input PC3;
input CON;
output CO;
output NC0;
output NC1;
output NC2;
output NC3;
endmodule
module INC8(CI, PC0, PC1, PC2, PC3, PC4, PC5, PC6, PC7, CO, NC0, NC1, NC2, NC3, NC4, NC5, NC6, NC7) /* synthesis syn_black_box */;
input CI;
input PC0;
input PC1;
input PC2;
input PC3;
input PC4;
input PC5;
input PC6;
input PC7;
output CO;
output NC0;
output NC1;
output NC2;
output NC3;
output NC4;
output NC5;
output NC6;
output NC7;
endmodule
module INC4(CI, PC0, PC1, PC2, PC3, CO, NC0, NC1, NC2, NC3) /* synthesis syn_black_box */;
input CI;
input PC0;
input PC1;
input PC2;
input PC3;
output CO;
output NC0;
output NC1;
output NC2;
output NC3;
endmodule
module ILF2P3JZ(D, SP, ECLK, SCLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input SCLK;
input PD;
output Q;
endmodule
module ILF2P3JX(D, SP, ECLK, SCLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input SCLK;
input PD;
output Q;
endmodule
module ILF2P3IZ(D, SP, ECLK, SCLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input SCLK;
input CD;
output Q;
endmodule
module ILF2P3IX(D, SP, ECLK, SCLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input SCLK;
input CD;
output Q;
endmodule
module ILF2P3DX(D, SP, ECLK, SCLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input SCLK;
input CD;
output Q;
endmodule
module ILF2P3BX(D, SP, ECLK, SCLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input ECLK;
input SCLK;
input PD;
output Q;
endmodule
module IFS1S1J(D, SCLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SCLK;
input PD;
output Q;
endmodule
module IFS1S1I(D, SCLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SCLK;
input CD;
output Q;
endmodule
module IFS1S1D(D, SCLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SCLK;
input CD;
output Q;
endmodule
module IFS1S1B(D, SCLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SCLK;
input PD;
output Q;
endmodule
module IFS1P3JZ(D, SP, SCLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module IFS1P3JX(D, SP, SCLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module IFS1P3IZ(D, SP, SCLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module IFS1P3IX(D, SP, SCLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module IFS1P3DX(D, SP, SCLK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module IFS1P3BX(D, SP, SCLK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module IBTS(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPUS(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPU(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPDS(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPD(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBT(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMS(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPUS(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPU(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPDS(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPD(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBM(I, O) /* synthesis syn_black_box */;
input I /* synthesis .ispad=1 */;
output O;
endmodule
module FSUB8O(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, BI, OFL, S0, S1, S2, S3, S4, S5, S6, S7) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input A4;
input A5;
input A6;
input A7;
input B0;
input B1;
input B2;
input B3;
input B4;
input B5;
input B6;
input B7;
input BI;
output OFL;
output S0;
output S1;
output S2;
output S3;
output S4;
output S5;
output S6;
output S7;
endmodule
module FSUB8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, BI, BO, S0, S1, S2, S3, S4, S5, S6, S7) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input A4;
input A5;
input A6;
input A7;
input B0;
input B1;
input B2;
input B3;
input B4;
input B5;
input B6;
input B7;
input BI;
output BO;
output S0;
output S1;
output S2;
output S3;
output S4;
output S5;
output S6;
output S7;
endmodule
module FSUB4O(A0, A1, A2, A3, B0, B1, B2, B3, BI, OFL, S0, S1, S2, S3) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input B0;
input B1;
input B2;
input B3;
input BI;
output OFL;
output S0;
output S1;
output S2;
output S3;
endmodule
module FSUB4(A0, A1, A2, A3, B0, B1, B2, B3, BI, BO, S0, S1, S2, S3) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input B0;
input B1;
input B2;
input B3;
input BI;
output BO;
output S0;
output S1;
output S2;
output S3;
endmodule
module FMULT81(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, MULT, CI, CO, P0, P1, P2, P3, P4, P5, P6, P7) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input A4;
input A5;
input A6;
input A7;
input B0;
input B1;
input B2;
input B3;
input B4;
input B5;
input B6;
input B7;
input MULT;
input CI;
output CO;
output P0;
output P1;
output P2;
output P3;
output P4;
output P5;
output P6;
output P7;
endmodule
module FMULT41(A0, A1, A2, A3, B0, B1, B2, B3, MULT, CI, CO, P0, P1, P2, P3) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input B0;
input B1;
input B2;
input B3;
input MULT;
input CI;
output CO;
output P0;
output P1;
output P2;
output P3;
endmodule
module XOR3(A, B, C, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
output Z;
endmodule
module OR3(A, B, C, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
output Z;
endmodule
module FL1S3AY(D0, D1, CK, SD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input CK;
input SD;
output Q;
output QN;
endmodule
module FL1S3AX(D0, D1, CK, SD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input CK;
input SD;
output Q;
output QN;
endmodule
module FL1S1J(D0, D1, CK, SD, PD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input CK;
input SD;
input PD;
output Q;
output QN;
endmodule
module FL1S1I(D0, D1, CK, SD, CD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input CK;
input SD;
input CD;
output Q;
output QN;
endmodule
module FL1S1D(D0, D1, CK, SD, CD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input CK;
input SD;
input CD;
output Q;
output QN;
endmodule
module FL1S1B(D0, D1, CK, SD, PD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input CK;
input SD;
input PD;
output Q;
output QN;
endmodule
module FL1S1AY(D0, D1, CK, SD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input CK;
input SD;
output Q;
output QN;
endmodule
module FL1S1A(D0, D1, CK, SD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input CK;
input SD;
output Q;
output QN;
endmodule
module FL1P3JZ(D0, D1, SP, CK, SD, PD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input SP;
input CK;
input SD;
input PD;
output Q;
output QN;
endmodule
module FL1P3JY(D0, D1, SP, CK, SD, PD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input SP;
input CK;
input SD;
input PD;
output Q;
output QN;
endmodule
module FL1P3IZ(D0, D1, SP, CK, SD, CD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input SP;
input CK;
input SD;
input CD;
output Q;
output QN;
endmodule
module FL1P3IY(D0, D1, SP, CK, SD, CD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input SP;
input CK;
input SD;
input CD;
output Q;
output QN;
endmodule
module FL1P3DX(D0, D1, SP, CK, SD, CD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input SP;
input CK;
input SD;
input CD;
output Q;
output QN;
endmodule
module FL1P3BX(D0, D1, SP, CK, SD, PD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input SP;
input CK;
input SD;
input PD;
output Q;
output QN;
endmodule
module FL1P3AZ(D0, D1, SP, CK, SD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input SP;
input CK;
input SD;
output Q;
output QN;
endmodule
module FL1P3AY(D0, D1, SP, CK, SD, Q, QN) /* synthesis syn_black_box */;
input D0;
input D1;
input SP;
input CK;
input SD;
output Q;
output QN;
endmodule
module FD1S3JX(D, CK, PD, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1S3IX(D, CK, CD, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1S3DX(D, CK, CD, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1S3BX(D, CK, PD, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1S3AY(D, CK, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
output Q;
output QN;
endmodule
module FD1S3AX(D, CK, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
output Q;
output QN;
endmodule
module FD1S1J(D, CK, PD, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1S1I(D, CK, CD, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1S1D(D, CK, CD, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1S1B(D, CK, PD, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1S1AY(D, CK, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
output Q;
output QN;
endmodule
module FD1S1A(D, CK, Q, QN) /* synthesis syn_black_box */;
input D;
input CK;
output Q;
output QN;
endmodule
module FD1P3JZ(D, SP, CK, PD, Q, QN) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1P3JX(D, SP, CK, PD, Q, QN) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1P3IZ(D, SP, CK, CD, Q, QN) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1P3IX(D, SP, CK, CD, Q, QN) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1P3DX(D, SP, CK, CD, Q, QN) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1P3BX(D, SP, CK, PD, Q, QN) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1P3AY(D, SP, CK, Q, QN) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
output Q;
output QN;
endmodule
module FADSU8O(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, BCI, CON, OFL, S0, S1, S2, S3, S4, S5, S6, S7) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input A4;
input A5;
input A6;
input A7;
input B0;
input B1;
input B2;
input B3;
input B4;
input B5;
input B6;
input B7;
input BCI;
input CON;
output OFL;
output S0;
output S1;
output S2;
output S3;
output S4;
output S5;
output S6;
output S7;
endmodule
module FADSU8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, BCI, CON, BCO, S0, S1, S2, S3, S4, S5, S6, S7) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input A4;
input A5;
input A6;
input A7;
input B0;
input B1;
input B2;
input B3;
input B4;
input B5;
input B6;
input B7;
input BCI;
input CON;
output BCO;
output S0;
output S1;
output S2;
output S3;
output S4;
output S5;
output S6;
output S7;
endmodule
module FADSU4O(A0, A1, A2, A3, B0, B1, B2, B3, BCI, CON, OFL, S0, S1, S2, S3) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input B0;
input B1;
input B2;
input B3;
input BCI;
input CON;
output OFL;
output S0;
output S1;
output S2;
output S3;
endmodule
module FADSU4(A0, A1, A2, A3, B0, B1, B2, B3, BCI, CON, BCO, S0, S1, S2, S3) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input B0;
input B1;
input B2;
input B3;
input BCI;
input CON;
output BCO;
output S0;
output S1;
output S2;
output S3;
endmodule
module FADD8O(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, CI, OFL, S0, S1, S2, S3, S4, S5, S6, S7) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input A4;
input A5;
input A6;
input A7;
input B0;
input B1;
input B2;
input B3;
input B4;
input B5;
input B6;
input B7;
input CI;
output OFL;
output S0;
output S1;
output S2;
output S3;
output S4;
output S5;
output S6;
output S7;
endmodule
module FADD8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, CI, CO, S0, S1, S2, S3, S4, S5, S6, S7) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input A4;
input A5;
input A6;
input A7;
input B0;
input B1;
input B2;
input B3;
input B4;
input B5;
input B6;
input B7;
input CI;
output CO;
output S0;
output S1;
output S2;
output S3;
output S4;
output S5;
output S6;
output S7;
endmodule
module FADD4O(A0, A1, A2, A3, B0, B1, B2, B3, CI, OFL, S0, S1, S2, S3) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input B0;
input B1;
input B2;
input B3;
input CI;
output OFL;
output S0;
output S1;
output S2;
output S3;
endmodule
module FADD4(A0, A1, A2, A3, B0, B1, B2, B3, CI, CO, S0, S1, S2, S3) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input B0;
input B1;
input B2;
input B3;
input CI;
output CO;
output S0;
output S1;
output S2;
output S3;
endmodule
module DLLPDT(CLKIN, ECLK, SCLK, LOCK) /* synthesis syn_black_box */;
input CLKIN;
output ECLK;
output SCLK;
output LOCK;
endmodule
module DLLPDB(CLKIN, ECLK, SCLK, LOCK) /* synthesis syn_black_box */;
input CLKIN;
output ECLK;
output SCLK;
output LOCK;
endmodule
module DLL1XT(CLKIN, ECLK, SCLK, LOCK) /* synthesis syn_black_box */;
input CLKIN;
output ECLK;
output SCLK;
output LOCK;
endmodule
module DLL1XB(CLKIN, ECLK, SCLK, LOCK) /* synthesis syn_black_box */;
input CLKIN;
output ECLK;
output SCLK;
output LOCK;
endmodule
module DEC8(CI, PC0, PC1, PC2, PC3, PC4, PC5, PC6, PC7, CO, NC0, NC1, NC2, NC3, NC4, NC5, NC6, NC7) /* synthesis syn_black_box */;
input CI;
input PC0;
input PC1;
input PC2;
input PC3;
input PC4;
input PC5;
input PC6;
input PC7;
output CO;
output NC0;
output NC1;
output NC2;
output NC3;
output NC4;
output NC5;
output NC6;
output NC7;
endmodule
module DEC4(CI, PC0, PC1, PC2, PC3, CO, NC0, NC1, NC2, NC3) /* synthesis syn_black_box */;
input CI;
input PC0;
input PC1;
input PC2;
input PC3;
output CO;
output NC0;
output NC1;
output NC2;
output NC3;
endmodule
module DCE32X4(WAD0, WAD1, WAD2, WAD3, WAD4, DI0, DI1, DI2, DI3, CK, WREN, WPE0, WPE1, RAD0, RAD1, RAD2, RAD3, RAD4, DO0, DO1, DO2, DO3, QDO0, QDO1, QDO2, QDO3) /* synthesis syn_black_box */;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input DI0;
input DI1;
input DI2;
input DI3;
input CK;
input WREN;
input WPE0;
input WPE1;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
output DO0;
output DO1;
output DO2;
output DO3;
output QDO0;
output QDO1;
output QDO2;
output QDO3;
endmodule
module CU8P3JX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CU8P3IX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CU8P3DX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CU8P3BX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CU4P3JX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CU4P3IX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CU4P3DX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CU4P3BX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CU4(CI, PC0, PC1, PC2, PC3, CO, NC0, NC1, NC2, NC3) /* synthesis syn_black_box */;
input CI;
input PC0;
input PC1;
input PC2;
input PC3;
output CO;
output NC0;
output NC1;
output NC2;
output NC3;
endmodule
module CFD1P3JZ(D, SP, CK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input PD;
output Q;
endmodule
module CFD1P3JX(D, SP, CK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input PD;
output Q;
endmodule
module CFD1P3IZ(D, SP, CK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input CD;
output Q;
endmodule
module CFD1P3IX(D, SP, CK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input CD;
output Q;
endmodule
module CFD1P3DX(D, SP, CK, CD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input CD;
output Q;
endmodule
module CFD1P3BX(D, SP, CK, PD, Q) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
input PD;
output Q;
endmodule
module CD8P3JX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CD8P3IX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CD8P3DX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CD8P3BX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CD4P3JX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CD4P3IX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CD4P3DX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CD4P3BX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CD4(CI, PC0, PC1, PC2, PC3, CO, NC0, NC1, NC2, NC3) /* synthesis syn_black_box */;
input CI;
input PC0;
input PC1;
input PC2;
input PC3;
output CO;
output NC0;
output NC1;
output NC2;
output NC3;
endmodule
module CB8P3JX(CI, SP, CK, PD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CB8P3IX(CI, SP, CK, CD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CB8P3DX(CI, SP, CK, CD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CB8P3BX(CI, SP, CK, PD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
output Q4;
output Q5;
output Q6;
output Q7;
endmodule
module CB4P3JX(CI, SP, CK, PD, CON, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CB4P3IX(CI, SP, CK, CD, CON, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CB4P3DX(CI, SP, CK, CD, CON, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input CD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CB4P3BX(CI, SP, CK, PD, CON, CO, Q0, Q1, Q2, Q3) /* synthesis syn_black_box */;
input CI;
input SP;
input CK;
input PD;
input CON;
output CO;
output Q0;
output Q1;
output Q2;
output Q3;
endmodule
module CB4(CI, PC0, PC1, PC2, PC3, CON, CO, NC0, NC1, NC2, NC3) /* synthesis syn_black_box */;
input CI;
input PC0;
input PC1;
input PC2;
input PC3;
input CON;
output CO;
output NC0;
output NC1;
output NC2;
output NC3;
endmodule
module BTZ6PU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ6PD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ6(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12PU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12PD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12FPU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12FPD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12F(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS6PU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS6PD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS6(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12PU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12PD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12FPU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12FPD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12F(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ6PU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ6PD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ6(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12PU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12PD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12FPU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12FPD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12F(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS6PU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS6PD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS6(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12PU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12PD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12FPU(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12FPD(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12F(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12(I, T, O, B) /* synthesis syn_black_box */;
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module ANEB8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, CI, NE) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input A4;
input A5;
input A6;
input A7;
input B0;
input B1;
input B2;
input B3;
input B4;
input B5;
input B6;
input B7;
input CI;
output NE;
endmodule
module ANEB4(A0, A1, A2, A3, B0, B1, B2, B3, CI, NE) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input B0;
input B1;
input B2;
input B3;
input CI;
output NE;
endmodule
module AND5(A, B, C, D, E, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module AND4(A, B, C, D, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
input D;
output Z;
endmodule
module AND3(A, B, C, Z) /* synthesis syn_black_box */;
input A;
input B;
input C;
output Z;
endmodule
module AND2(A, B, Z) /* synthesis syn_black_box */;
input A;
input B;
output Z;
endmodule
module ALEB8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, CI, LE) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input A4;
input A5;
input A6;
input A7;
input B0;
input B1;
input B2;
input B3;
input B4;
input B5;
input B6;
input B7;
input CI;
output LE;
endmodule
module ALEB4(A0, A1, A2, A3, B0, B1, B2, B3, CI, LE) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input B0;
input B1;
input B2;
input B3;
input CI;
output LE;
endmodule
module AGEB8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, CI, GE) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input A4;
input A5;
input A6;
input A7;
input B0;
input B1;
input B2;
input B3;
input B4;
input B5;
input B6;
input B7;
input CI;
output GE;
endmodule
module AGEB4(A0, A1, A2, A3, B0, B1, B2, B3, CI, GE) /* synthesis syn_black_box */;
input A0;
input A1;
input A2;
input A3;
input B0;
input B1;
input B2;
input B3;
input CI;
output GE;
endmodule
module PUR(PUR) /* synthesis syn_black_box */;
input PUR;
endmodule
module FD1P3AX(D, SP, CK, Q, QN) /* synthesis syn_black_box */;
input D;
input SP;
input CK;
output Q;
output QN;
endmodule
module GSR(GSR) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */;
input GSR;
endmodule
module BNDSCAN (PTDI, PTMS, PTCK, BSO1, BSO2, TDI, TCK, BSEN1, BSEN2, TDO) /* synthesis syn_black_box */ /* synthesis syn_noprune=1 */;
input PTDI, PTMS, PTCK, BSO1, BSO2;
output TDI, TCK, BSEN1, BSEN2, TDO;
endmodule
module BUFBA (A, Z) /* synthesis syn_black_box */;
input A;
output Z;
endmodule

module PPLL (CLKIN, FB, MCLK, NCLK, LOCK, INTFB) /* synthesis syn_black_box */;
input CLKIN, FB;
output MCLK, NCLK, LOCK, INTFB;
endmodule

module HPPLL (CLKIN, FB, MCLK, NCLK, LOCK, INTFB) /* synthesis syn_black_box */;
input CLKIN, FB;
output MCLK, NCLK, LOCK, INTFB;
endmodule

module PLL1 (CLKIN, CLKOUT, LOCK) /* synthesis syn_black_box */; 
input  CLKIN;
output CLKOUT, LOCK;
endmodule

module PLL2 (CLKIN, CLKOUT, LOCK) /* synthesis syn_black_box */;
input  CLKIN;
output CLKOUT, LOCK;
endmodule


module BMW6 (I, T, O, B) /* synthesis syn_black_box */;
  input  I, T;
  output O;
  inout  B /* synthesis .ispad=1 */;
endmodule

module OBW6 (I, T, O) /* synthesis syn_black_box */;
  input  I, T;
  output O /* synthesis .ispad=1 */;
endmodule

module ILVDS (A, AN, Z) /* synthesis syn_black_box */;
  input  A /* synthesis .ispad=1 */;
  input  AN /* synthesis .ispad=1 */;
  output Z;
endmodule

module OLVDS (A, Z, ZN) /* synthesis syn_black_box */;
  input  A;
  output Z /* synthesis .ispad=1 */;
  output ZN /* synthesis .ispad=1 */;
endmodule

module IODDR (IND0, IND1, IND2, IND3, OUT1D0, OUT1D1, OUT2D0, OUT2D1, OUT3D0,
OUT3D1, OUT4D0, OUT4D1, CK, IN1Q0, IN1Q1, IN2Q0, IN2Q1, IN3Q0, IN3Q1, IN4Q0, IN4Q1, OUTQ0, OUTQ1, OUTQ2, OUTQ3) /* synthesis syn_black_box */;

input  IND0, IND1, IND2, IND3, OUT1D0, OUT1D1, OUT2D0, OUT2D1;
input  OUT3D0, OUT3D1, OUT4D0, OUT4D1, CK;
output IN1Q0, IN1Q1, IN2Q0, IN2Q1, IN3Q0, IN3Q1;
output IN4Q0, IN4Q1, OUTQ0, OUTQ1, OUTQ2, OUTQ3;

endmodule

module HIODDR (IND0, IND1, IND2, IND3, OUT1D0, OUT1D1, OUT2D0, OUT2D1,
OUT3D0, OUT3D1, OUT4D0, OUT4D1, CK, 
IN1Q0, IN1Q1, IN2Q0, IN2Q1, IN3Q0, IN3Q1,
IN4Q0, IN4Q1, OUTQ0, OUTQ1, OUTQ2, OUTQ3) /* synthesis syn_black_box */;

input  IND0, IND1, IND2, IND3, OUT1D0, OUT1D1, OUT2D0, OUT2D1;
input  OUT3D0, OUT3D1, OUT4D0, OUT4D1, CK;
output IN1Q0, IN1Q1, IN2Q0, IN2Q1, IN3Q0, IN3Q1;
output IN4Q0, IN4Q1, OUTQ0, OUTQ1, OUTQ2, OUTQ3;

endmodule
module OSR2X2 (D10, D11, D20, D21, CK, UPDATE, Q1, Q2)/* synthesis syn_black_box */ ;
input  D10, D11, D20, D21, CK, UPDATE;
output Q1, Q2;
endmodule
module HOSR2X2 (D10, D11, D20, D21, CK, UPDATE, Q1, Q2)/* synthesis syn_black_box */;
input  D10, D11, D20, D21, CK, UPDATE;
output Q1, Q2;
endmodule
module HIOSR2 (IND, OUTD0, OUTD1, CK, UPDATE, INQ0, INQ1, OUTQ) /* synthesis syn_black_box */;

input  IND, OUTD0, OUTD1, CK, UPDATE;
output INQ0, INQ1, OUTQ;

endmodule

module HIOSR4 (IND, OUTD0, OUTD1, OUTD2, OUTD3, CK, UPDATE, 
        	INQ0, INQ1, INQ2, INQ3, OUTQ)/* synthesis syn_black_box */;

input  IND, OUTD0, OUTD1, OUTD2, OUTD3, CK, UPDATE;
output INQ0, INQ1, INQ2, INQ3, OUTQ;

endmodule

module IOSR2 (IND, OUTD0, OUTD1, CK, UPDATE, INQ0, INQ1, OUTQ) /* synthesis syn_black_box */;
input  IND, OUTD0, OUTD1, CK, UPDATE;
output INQ0, INQ1, OUTQ;
endmodule

module IOSR4 (IND, OUTD0, OUTD1, OUTD2, OUTD3, CK, UPDATE, INQ0, INQ1, INQ2,
INQ3, OUTQ) /* synthesis syn_black_box */;

input  IND, OUTD0, OUTD1, OUTD2, OUTD3, CK, UPDATE;
output INQ0, INQ1, INQ2, INQ3, OUTQ;

endmodule

module MUX81 (D0, D1, D2, D3, D4, D5, D6, D7, SD1, SD2, SD3, Z) /* synthesis syn_black_box */;
  input  D0, D1, D2, D3, D4, D5, D6, D7, SD1, SD2, SD3;
  output Z;
endmodule

module DDR (IND0, IND1, IND2, IND3, OUTD0, OUTD1, OUTD2, OUTD3, CK, INQ0, INQ1, INQ2, INQ3, OUTQ0, OUTQ1, OUTQ2, OUTQ3) /* synthesis syn_black_box */;

  input  IND0, IND1, IND2, IND3, OUTD0, OUTD1, OUTD2, OUTD3, CK;
  output INQ0, INQ1, INQ2, INQ3, OUTQ0, OUTQ1, OUTQ2, OUTQ3;

endmodule

module BR512X18 (AW18, AW17, AW16, AW15, AW14, AW13, AW12, AW11, AW10,
                 AW08, AW07, AW06, AW05, AW04, AW03, AW02, AW01, AW00,
                 D117, D116, D115, D114, D113, D112, D111, D110, D19,
                 D18, D17, D16, D15, D14, D13, D12, D11, D10,
                 D017, D016, D015, D014, D013, D012, D011, D010, D09,
                 D08, D07, D06, D05, D04, D03, D02, D01, D00,
                 BW11, BW10, BW01, BW00,
                 AR18, AR17, AR16, AR15, AR14, AR13, AR12, AR11, AR10,
                 AR08, AR07, AR06, AR05, AR04, AR03, AR02, AR01, AR00,
                 CKW1, CKW0, CKR1, CKR0, CSW1, CSW0, CSR1, CSR0,
                 Q117, Q116, Q115, Q114, Q113, Q112, Q111, Q110, Q19,
                 Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10,
                 Q017, Q016, Q015, Q014, Q013, Q012, Q011, Q010, Q09,
                 Q08, Q07, Q06, Q05, Q04, Q03, Q02, Q01, Q00, BUSY) /* synthesis syn_black_box */;

input AW08, AW07, AW06, AW05, AW04, AW03, AW02, AW01, AW00;
input AR08, AR07, AR06, AR05, AR04, AR03, AR02, AR01, AR00;
input AW18, AW17, AW16, AW15, AW14, AW13, AW12, AW11, AW10;
input AR18, AR17, AR16, AR15, AR14, AR13, AR12, AR11, AR10;
input D017, D016, D015, D014, D013, D012, D011, D010, D09;
input D08, D07, D06, D05, D04, D03, D02, D01, D00;
input D117, D116, D115, D114, D113, D112, D111, D110, D19;
input D18, D17, D16, D15, D14, D13, D12, D11, D10;
input BW00, BW01, CKW0, CKR0, CSW0, CSR0,BW10, BW11, CKW1, CKR1, CSW1, CSR1;

output Q017, Q016, Q015, Q014, Q013, Q012, Q011, Q010, Q09, Q08, Q07, Q06;
output Q05, Q04, Q03, Q02, Q01, Q00, Q117, Q116, Q115, Q114, Q113, Q112, Q111;
output Q110, Q19, Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, BUSY;

endmodule

module BR1024X18 (AW19, AW18, AW17, AW16, AW15, AW14, AW13, AW12, AW11, AW10,
                  AW09, AW08, AW07, AW06, AW05, AW04, AW03, AW02, AW01, AW00,
                  D117, D116, D115, D114, D113, D112, D111, D110, D19,
                  D18, D17, D16, D15, D14, D13, D12, D11, D10,
                  D017, D016, D015, D014, D013, D012, D011, D010, D09,
                  D08, D07, D06, D05, D04, D03, D02, D01, D00,
                  BW11, BW10, BW01, BW00,
                  AR19, AR18, AR17, AR16, AR15, AR14, AR13, AR12, AR11, AR10,
                  AR09, AR08, AR07, AR06, AR05, AR04, AR03, AR02, AR01, AR00,
                  CKW1, CKW0, CKR1, CKR0, CSW1, CSW0, CSR1, CSR0,
                  Q117, Q116, Q115, Q114, Q113, Q112, Q111, Q110, Q19,
                  Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10,
                  Q017, Q016, Q015, Q014, Q013, Q012, Q011, Q010, Q09,
                  Q08, Q07, Q06, Q05, Q04, Q03, Q02, Q01, Q00, BUSY) /* synthesis syn_black_box */;

input AW09, AW08, AW07, AW06, AW05, AW04, AW03, AW02, AW01, AW00;
input AR09, AR08, AR07, AR06, AR05, AR04, AR03, AR02, AR01, AR00;
input AW19, AW18, AW17, AW16, AW15, AW14, AW13, AW12, AW11, AW10;
input AR19, AR18, AR17, AR16, AR15, AR14, AR13, AR12, AR11, AR10;
input D017, D016, D015, D014, D013, D012, D011, D010, D09;
input D08, D07, D06, D05, D04, D03, D02, D01, D00;
input D117, D116, D115, D114, D113, D112, D111, D110, D19;
input D18, D17, D16, D15, D14, D13, D12, D11, D10;
input BW00, BW01, CKW0, CKR0, CSW0, CSR0,BW10, BW11, CKW1, CKR1, CSW1, CSR1;

output Q017, Q016, Q015, Q014, Q013, Q012, Q011, Q010, Q09, Q08, Q07, Q06;
output Q05, Q04, Q03, Q02, Q01, Q00, Q117, Q116, Q115, Q114, Q113, Q112, Q111;
output Q110, Q19, Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, BUSY;

endmodule

module CAM2X256X16 (DW17, DW16, DW15, DW14, DW13, DW12, DW11, DW10,
                    AD13, AD12, AD11, AD10, CD1, SM1, WRE1, CKW1,
                    DM17, DM16, DM15, DM14, DM13, DM12, DM11, DM10, RDE1, CKR1,
                    DW07, DW06, DW05, DW04, DW03, DW02, DW01, DW00,
                    AD03, AD02, AD01, AD00, CD0, SM0, WRE0, CKW0,
                    DM07, DM06, DM05, DM04, DM03, DM02, DM01, DM00, RDE0, CKR0,
                    Q115, Q114, Q113, Q112, Q111, Q110, Q19, Q18,
                    Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10,
                    Q015, Q014, Q013, Q012, Q011, Q010, Q09, Q08,
                    Q07, Q06, Q05, Q04, Q03, Q02, Q01, Q00) /* synthesis syn_black_box */;

input DW17, DW16, DW15, DW14, DW13, DW12, DW11, DW10;
input AD13, AD12, AD11, AD10, CD1, SM1, WRE1, CKW1;
input DM17, DM16, DM15, DM14, DM13, DM12, DM11, DM10, RDE1, CKR1;
input DW07, DW06, DW05, DW04, DW03, DW02, DW01, DW00;
input AD03, AD02, AD01, AD00, CD0, SM0, WRE0, CKW0;
input DM07, DM06, DM05, DM04, DM03, DM02, DM01, DM00, RDE0, CKR0;

output Q115, Q114, Q113, Q112, Q111, Q110, Q19, Q18;
output Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10;
output Q015, Q014, Q013, Q012, Q011, Q010, Q09, Q08;
output Q07, Q06, Q05, Q04, Q03, Q02, Q01, Q00;

endmodule

module FF1024X9 (D8, D7, D6, D5, D4, D3, D2, D1, D0,
                 CKW, CKR, WRE, RDE, RSTN,
                 PF9, PF8, PF7, PF6, PF5, PF4, PF3, PF2, PF1, PF0,
                 PE9, PE8, PE7, PE6, PE5, PE4, PE3, PE2, PE1, PE0,
                 Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0,
                 EF, FF, PEF, PFF) /* synthesis syn_black_box */;
input D8, D7, D6, D5, D4, D3, D2, D1, D0;
input CKW, CKR, WRE, RDE, RSTN, PF9, PF8, PF7, PF6, PF5, PF4, PF3, PF2, PF1, PF0;
input PE9, PE8, PE7, PE6, PE5, PE4, PE3, PE2, PE1, PE0;

output Q8, Q7, Q6;
output Q5, Q4, Q3, Q2, Q1, Q0, EF, FF, PEF, PFF;

endmodule

module FF256X36 (D35, D34, D33, D32, D31, D30, D29, D28, D27,
                 D26, D25, D24, D23, D22, D21, D20, D19, D18,
                 D17, D16, D15, D14, D13, D12, D11, D10, D9,
                 D8, D7, D6, D5, D4, D3, D2, D1, D0,
                 CKW, CKR, WRE, RDE, RSTN,
                 PF7, PF6, PF5, PF4, PF3, PF2, PF1, PF0,
                 PE7, PE6, PE5, PE4, PE3, PE2, PE1, PE0,
                 Q35, Q34, Q33, Q32, Q31, Q30, Q29, Q28, Q27,
                 Q26, Q25, Q24, Q23, Q22, Q21, Q20, Q19, Q18,
                 Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, Q9,
                 Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0,
                 EF, FF, PEF, PFF) /* synthesis syn_black_box */;

input D35, D34, D33, D32, D31, D30, D29, D28, D27;
input D26, D25, D24, D23, D22, D21, D20, D19, D18;
input D17, D16, D15, D14, D13, D12, D11, D10, D9;
input D8, D7, D6, D5, D4, D3, D2, D1, D0;
input CKW, CKR, WRE, RDE, RSTN, PF7, PF6, PF5, PF4, PF3, PF2, PF1, PF0;
input PE7, PE6, PE5, PE4, PE3, PE2, PE1, PE0;
output Q35, Q34, Q33, Q32, Q31, Q30, Q29, Q28, Q27;
output Q26, Q25, Q24, Q23, Q22, Q21, Q20, Q19, Q18;
output Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, Q9, Q8, Q7, Q6;
output Q5, Q4, Q3, Q2, Q1, Q0, EF, FF, PEF, PFF;

endmodule

module FF2X512X9 (D18, D17, D16, D15, D14, D13, D12, D11, D10,
                  CKW1, CKR1, WRE1, RDE1, RSTN1,
                  PF18, PF17, PF16, PF15, PF14, PF13, PF12, PF11, PF10,
                  PE18, PE17, PE16, PE15, PE14, PE13, PE12, PE11, PE10,
                  D08, D07, D06, D05, D04, D03, D02, D01, D00,
                  CKW0, CKR0, WRE0, RDE0, RSTN0,
                  PF08, PF07, PF06, PF05, PF04, PF03, PF02, PF01, PF00,
                  PE08, PE07, PE06, PE05, PE04, PE03, PE02, PE01, PE00,
                  Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, EF1, FF1, PEF1,
		 PFF1, Q08, Q07, Q06, Q05, Q04, Q03, Q02, Q01, Q00, EF0, FF0,
                PEF0, PFF0) /* synthesis syn_black_box */;

input D18, D17, D16, D15, D14, D13, D12, D11, D10;
input D08, D07, D06, D05, D04, D03, D02, D01, D00;
input CKW1, CKR1, WRE1, RDE1, RSTN1;
input CKW0, CKR0, WRE0, RDE0, RSTN0;
input PF18, PF17, PF16, PF15, PF14, PF13, PF12, PF11, PF10;
input PE18, PE17, PE16, PE15, PE14, PE13, PE12, PE11, PE10;
input PF08, PF07, PF06, PF05, PF04, PF03, PF02, PF01, PF00;
input PE08, PE07, PE06, PE05, PE04, PE03, PE02, PE01, PE00;
output Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, EF1, FF1, PEF1, PFF1;
output Q08, Q07, Q06, Q05, Q04, Q03, Q02, Q01, Q00, EF0, FF0, PEF0, PFF0;

endmodule

module FF512X18 (D17, D16, D15, D14, D13, D12, D11, D10, D9,
                 D8, D7, D6, D5, D4, D3, D2, D1, D0,
                 CKW, CKR, WRE, RDE, RSTN,
                 PF8, PF7, PF6, PF5, PF4, PF3, PF2, PF1, PF0,
                 PE8, PE7, PE6, PE5, PE4, PE3, PE2, PE1, PE0,
                 Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, Q9,
                 Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0,
                 EF, FF, PEF, PFF) /* synthesis syn_black_box */;

input D17, D16, D15, D14, D13, D12, D11, D10, D9;
input D8, D7, D6, D5, D4, D3, D2, D1, D0;
input CKW, CKR, WRE, RDE, RSTN, PF8, PF7, PF6, PF5, PF4, PF3, PF2, PF1, PF0;
input PE8, PE7, PE6, PE5, PE4, PE3, PE2, PE1, PE0;

output Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, Q9, Q8, Q7, Q6;
output Q5, Q4, Q3, Q2, Q1, Q0, EF, FF, PEF, PFF;

endmodule

module CMULT16 (M15, M14, M13, M12, M11, M10, M9, M8,
                M7, M6, M5, M4, M3, M2, M1, M0, MCK, EN,
                AW08, AW07, AW06, AW05, AW04, AW03, AW02, AW01, AW00,
                D015, D014, D013, D012, D011, D010, D09, D08,
                D07, D06, D05, D04, D03, D02, D01, D00, CKW0, CSW0,
                AW18, AW17, AW16, AW15, AW14, AW13, AW12, AW11, AW10,
                D115, D114, D113, D112, D111, D110, D19, D18,
                D17, D16, D15, D14, D13, D12, D11, D10, CKW1, CSW1,
                P23, P22, P21, P20, P19, P18, P17, P16,
                P15, P14, P13, P12, P11, P10, P9, P8,
                P7, P6, P5, P4, P3, P2, P1, P0) /* synthesis syn_black_box */;
input M15, M14, M13, M12, M11, M10, M9, M8;
input M7, M6, M5, M4, M3, M2, M1, M0, MCK, EN;
input AW08, AW07, AW06, AW05, AW04, AW03, AW02, AW01, AW00;
input D015, D014, D013, D012, D011, D010, D09, D08;
input D07, D06, D05, D04, D03, D02, D01, D00, CKW0, CSW0;
input AW18, AW17, AW16, AW15, AW14, AW13, AW12, AW11, AW10;
input D115, D114, D113, D112, D111, D110, D19, D18;
input D17, D16, D15, D14, D13, D12, D11, D10, CKW1, CSW1;


output P23, P22, P21, P20, P19, P18, P17, P16;
output P15, P14, P13, P12, P11, P10, P9, P8;
output P7, P6, P5, P4, P3, P2, P1, P0;

endmodule

module MULT8X8 (A7, A6, A5, A4, A3, A2, A1, A0,
                B7, B6, B5, B4, B3, B2, B1, B0, CK, EN,
                P15, P14, P13, P12, P11, P10, P9, P8,
                P7, P6, P5, P4, P3, P2, P1, P0) /* synthesis syn_black_box */;

input A7, A6, A5, A4, A3, A2, A1, A0;
input B7, B6, B5, B4, B3, B2, B1, B0, CK, EN;

output P15, P14, P13, P12, P11, P10, P9, P8;
output P7, P6, P5, P4, P3, P2, P1, P0;

endmodule

module SBR1024X18  (AW0, AW1, AW2, AW3, AW4, AW5, AW6, AW7, AW8, AW9,
                    AR0, AR1, AR2, AR3, AR4, AR5, AR6, AR7, AR8, AR9,
                    D0, D1, D2, D3, D4, D5, D6, D7, D8,
                    D9, D10, D11, D12, D13, D14, D15, D16, D17,
                    BW0, BW1, CKW, CKR, CSW, CSR,
                    SQ0, SQ1, SQ2, SQ3, SQ4, SQ5, SQ6, SQ7, SQ8,
                    SQ9, SQ10, SQ11, SQ12, SQ13, SQ14, SQ15, SQ16, SQ17, SBUSY,
                    Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8,
                    Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, BUSY,
                    SAW0, SAW1, SAW2, SAW3, SAW4, SAW5, SAW6, SAW7, SAW8, SAW9,
                    SAR0, SAR1, SAR2, SAR3, SAR4, SAR5, SAR6, SAR7, SAR8, SAR9,
                    SD0, SD1, SD2, SD3, SD4, SD5, SD6, SD7, SD8,
                    SD9, SD10, SD11, SD12, SD13, SD14, SD15, SD16, SD17,
                    SBW0, SBW1, SCKW, SCKR, SCSW, SCSR,
                    MC0, MC1, ARBITER) /* synthesis syn_black_box */;
input AW0, AW1, AW2, AW3, AW4, AW5, AW6, AW7, AW8, AW9;
input AR0, AR1, AR2, AR3, AR4, AR5, AR6, AR7, AR8, AR9;
input D0, D1, D2, D3, D4, D5, D6, D7, D8;
input D9, D10, D11, D12, D13, D14, D15, D16, D17;
input BW0, BW1, CKW, CKR, CSW, CSR;
input SQ0, SQ1, SQ2, SQ3, SQ4, SQ5, SQ6, SQ7, SQ8;
input SQ9, SQ10, SQ11, SQ12, SQ13, SQ14, SQ15, SQ16, SQ17, SBUSY;

output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8;
output Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, BUSY;
output SAW0, SAW1, SAW2, SAW3, SAW4, SAW5, SAW6, SAW7, SAW8, SAW9;
output SAR0, SAR1, SAR2, SAR3, SAR4, SAR5, SAR6, SAR7, SAR8, SAR9;
output SD0, SD1, SD2, SD3, SD4, SD5, SD6, SD7, SD8;
output SD9, SD10, SD11, SD12, SD13, SD14, SD15, SD16, SD17;
output SBW0, SBW1, SCKW, SCKR, SCSW, SCSR;
output MC0, MC1, ARBITER;

endmodule

module SBR512X18 (AW0, AW1, AW2, AW3, AW4, AW5, AW6, AW7, AW8,
                    AR0, AR1, AR2, AR3, AR4, AR5, AR6, AR7, AR8,
                    D0, D1, D2, D3, D4, D5, D6, D7, D8,
                    D9, D10, D11, D12, D13, D14, D15, D16, D17,
                    BW0, BW1, CKW, CKR, CSW, CSR,
                    SQ0, SQ1, SQ2, SQ3, SQ4, SQ5, SQ6, SQ7, SQ8,
                    SQ9, SQ10, SQ11, SQ12, SQ13, SQ14, SQ15, SQ16, SQ17, SBUSY,
                    Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8,
                    Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, BUSY,
                    SAW0, SAW1, SAW2, SAW3, SAW4, SAW5, SAW6, SAW7, SAW8,
                    SAR0, SAR1, SAR2, SAR3, SAR4, SAR5, SAR6, SAR7, SAR8,
                    SD0, SD1, SD2, SD3, SD4, SD5, SD6, SD7, SD8,
                    SD9, SD10, SD11, SD12, SD13, SD14, SD15, SD16, SD17,
                    SBW0, SBW1, SCKW, SCKR, SCSW, SCSR,
                    MC0, MC1, ARBITER) /* synthesis syn_black_box */;
input AW0, AW1, AW2, AW3, AW4, AW5, AW6, AW7, AW8;
input AR0, AR1, AR2, AR3, AR4, AR5, AR6, AR7, AR8;
input D0, D1, D2, D3, D4, D5, D6, D7, D8;
input D9, D10, D11, D12, D13, D14, D15, D16, D17;
input BW0, BW1, CKW, CKR, CSW, CSR;
input SQ0, SQ1, SQ2, SQ3, SQ4, SQ5, SQ6, SQ7, SQ8;
input SQ9, SQ10, SQ11, SQ12, SQ13, SQ14, SQ15, SQ16, SQ17, SBUSY;

output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8;
output Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, BUSY;
output SAW0, SAW1, SAW2, SAW3, SAW4, SAW5, SAW6, SAW7, SAW8;
output SAR0, SAR1, SAR2, SAR3, SAR4, SAR5, SAR6, SAR7, SAR8;
output SD0, SD1, SD2, SD3, SD4, SD5, SD6, SD7, SD8;
output SD9, SD10, SD11, SD12, SD13, SD14, SD15, SD16, SD17;
output SBW0, SBW1, SCKW, SCKR, SCSW, SCSR;
output MC0, MC1, ARBITER;

endmodule

module SYSBUS (
	      CS0_N,
	      CS1,
              MPC_CLK,
              MPC_RW_N,
              MPC_STRB_N,
              MPC_TSIZ_1,
              MPC_TSIZ_0,
              MPC_BURST,
              MPC_BDIP,
              MPC_ADDR_31,
              MPC_ADDR_30,
              MPC_ADDR_29,
              MPC_ADDR_28,
              MPC_ADDR_27,
              MPC_ADDR_26,
              MPC_ADDR_25,
              MPC_ADDR_24,
              MPC_ADDR_23,
              MPC_ADDR_22,
              MPC_ADDR_21,
              MPC_ADDR_20,
              MPC_ADDR_19,
              MPC_ADDR_18,
              MPC_ADDR_17,
              MPC_ADDR_16,
              MPC_ADDR_15,
              MPC_ADDR_14,
              MPC_WR_DATA_31,
              MPC_WR_DATA_30,
              MPC_WR_DATA_29,
              MPC_WR_DATA_28,
              MPC_WR_DATA_27,
              MPC_WR_DATA_26,
              MPC_WR_DATA_25,
              MPC_WR_DATA_24,
              MPC_WR_DATA_23,
              MPC_WR_DATA_22,
              MPC_WR_DATA_21,
              MPC_WR_DATA_20,
              MPC_WR_DATA_19,
              MPC_WR_DATA_18,
              MPC_WR_DATA_17,
              MPC_WR_DATA_16,
              MPC_WR_DATA_15,
              MPC_WR_DATA_14,
              MPC_WR_DATA_13,
              MPC_WR_DATA_12,
              MPC_WR_DATA_11,
              MPC_WR_DATA_10,
              MPC_WR_DATA_9,
              MPC_WR_DATA_8,
              MPC_WR_DATA_7,
              MPC_WR_DATA_6,
              MPC_WR_DATA_5,
              MPC_WR_DATA_4,
              MPC_WR_DATA_3,
              MPC_WR_DATA_2,
              MPC_WR_DATA_1,
              MPC_WR_DATA_0,
              MPC_WR_PARITY_3,
              MPC_WR_PARITY_2,
              MPC_WR_PARITY_1,
              MPC_WR_PARITY_0,
	      USR_CLK,
	      USR_IRQ_GENERAL,
              FMADDR_0,
              FMADDR_1,
              FMADDR_2,
              FMADDR_3,
              FMADDR_4,
              FMADDR_5,
              FMADDR_6,
              FMADDR_7,
              FMADDR_8,
              FMADDR_9,
              FMADDR_10,
              FMADDR_11,
              FMADDR_12,
              FMADDR_13,
              FMADDR_14,
              FMADDR_15,
              FMADDR_16,
              FMADDR_17,
              FMWDATA_0,
              FMWDATA_1,
              FMWDATA_2,
              FMWDATA_3,
              FMWDATA_4,
              FMWDATA_5,
              FMWDATA_6,
              FMWDATA_7,
              FMWDATA_8,
              FMWDATA_9,
              FMWDATA_10,
              FMWDATA_11,
              FMWDATA_12,
              FMWDATA_13,
              FMWDATA_14,
              FMWDATA_15,
              FMWDATA_16,
              FMWDATA_17,
              FMWDATA_18,
              FMWDATA_19,
              FMWDATA_20,
              FMWDATA_21,
              FMWDATA_22,
              FMWDATA_23,
              FMWDATA_24,
              FMWDATA_25,
              FMWDATA_26,
              FMWDATA_27,
              FMWDATA_28,
              FMWDATA_29,
              FMWDATA_30,
              FMWDATA_31,
              FMWDATA_32,
              FMWDATA_33,
              FMWDATA_34,
              FMWDATA_35,
              FMCLK,
              FMRESET,
              FMWRITE,
              FMREAD,
              FMBURST,
              FMRDY,
              FMSIZE_0,
              FMSIZE_1,
              FMLOCK,
              FMIRQI,
              FSRDATA_0,
              FSRDATA_1,
              FSRDATA_2,
              FSRDATA_3,
              FSRDATA_4,
              FSRDATA_5,
              FSRDATA_6,
              FSRDATA_7,
              FSRDATA_8,
              FSRDATA_9,
              FSRDATA_10,
              FSRDATA_11,
              FSRDATA_12,
              FSRDATA_13,
              FSRDATA_14,
              FSRDATA_15,
              FSRDATA_16,
              FSRDATA_17,
              FSRDATA_18,
              FSRDATA_19,
              FSRDATA_20,
              FSRDATA_21,
              FSRDATA_22,
              FSRDATA_23,
              FSRDATA_24,
              FSRDATA_25,
              FSRDATA_26,
              FSRDATA_27,
              FSRDATA_28,
              FSRDATA_29,
              FSRDATA_30,
              FSRDATA_31,
              FSRDATA_32,
              FSRDATA_33,
              FSRDATA_34,
              FSRDATA_35,
              FSCLK,
              FSRESET,
              FSACK,
              FSRETRY,
              FSERR,
              FSIRQI,
              A_AW0_0_TOP_0,
              A_AW0_0_TOP_1,
              A_AW0_0_TOP_2,
              A_AW0_0_TOP_3,
              A_AW0_0_TOP_4,
              A_AW0_0_TOP_5,
              A_AW0_0_TOP_6,
              A_AW0_0_TOP_7,
              A_AW0_0_TOP_8,
              A_AW0_0_TOP_9,
              A_AR0_0_TOP_0,
              A_AR0_0_TOP_1,
              A_AR0_0_TOP_2,
              A_AR0_0_TOP_3,
              A_AR0_0_TOP_4,
              A_AR0_0_TOP_5,
              A_AR0_0_TOP_6,
              A_AR0_0_TOP_7,
              A_AR0_0_TOP_8,
              A_AR0_0_TOP_9,
              A_D0_0_TOP_0,
              A_D0_0_TOP_1,
              A_D0_0_TOP_2,
              A_D0_0_TOP_3,
              A_D0_0_TOP_4,
              A_D0_0_TOP_5,
              A_D0_0_TOP_6,
              A_D0_0_TOP_7,
              A_D0_0_TOP_8,
              A_D0_0_TOP_9,
              A_D0_0_TOP_10,
              A_D0_0_TOP_11,
              A_D0_0_TOP_12,
              A_D0_0_TOP_13,
              A_D0_0_TOP_14,
              A_D0_0_TOP_15,
              A_D0_0_TOP_16,
              A_D0_0_TOP_17,
              A_BW0_0_TOP_0,
              A_BW0_0_TOP_1,
              A_CKW_0_TOP_0,
              A_CKR_0_TOP_0,
              A_CSW_0_TOP_0,
              A_CSR_0_TOP_0,
              B_AW0_0_TOP_0,
              B_AW0_0_TOP_1,
              B_AW0_0_TOP_2,
              B_AW0_0_TOP_3,
              B_AW0_0_TOP_4,
              B_AW0_0_TOP_5,
              B_AW0_0_TOP_6,
              B_AW0_0_TOP_7,
              B_AW0_0_TOP_8,
              B_AW0_0_TOP_9,
              B_AR0_0_TOP_0,
              B_AR0_0_TOP_1,
              B_AR0_0_TOP_2,
              B_AR0_0_TOP_3,
              B_AR0_0_TOP_4,
              B_AR0_0_TOP_5,
              B_AR0_0_TOP_6,
              B_AR0_0_TOP_7,
              B_AR0_0_TOP_8,
              B_AR0_0_TOP_9,
              B_D0_0_TOP_0,
              B_D0_0_TOP_1,
              B_D0_0_TOP_2,
              B_D0_0_TOP_3,
              B_D0_0_TOP_4,
              B_D0_0_TOP_5,
              B_D0_0_TOP_6,
              B_D0_0_TOP_7,
              B_D0_0_TOP_8,
              B_D0_0_TOP_9,
              B_D0_0_TOP_10,
              B_D0_0_TOP_11,
              B_D0_0_TOP_12,
              B_D0_0_TOP_13,
              B_D0_0_TOP_14,
              B_D0_0_TOP_15,
              B_D0_0_TOP_16,
              B_D0_0_TOP_17,
              B_BW0_0_TOP_0,
              B_BW0_0_TOP_1,
              B_CKW_0_TOP_0,
              B_CKR_0_TOP_0,
              B_CSW_0_TOP_0,
              B_CSR_0_TOP_0,
              MC1_0_TOP_0,
              MC1_0_TOP_1,
              MC1_0_TOP_9,
              MC1_0_TOP_12,
              MC1_0_TOP_13,
              MC1_0_TOP_19,
              MC1_0_TOP_22,
              A_AW0_1_TOP_0,
              A_AW0_1_TOP_1,
              A_AW0_1_TOP_2,
              A_AW0_1_TOP_3,
              A_AW0_1_TOP_4,
              A_AW0_1_TOP_5,
              A_AW0_1_TOP_6,
              A_AW0_1_TOP_7,
              A_AW0_1_TOP_8,
              A_AW0_1_TOP_9,
              A_AR0_1_TOP_0,
              A_AR0_1_TOP_1,
              A_AR0_1_TOP_2,
              A_AR0_1_TOP_3,
              A_AR0_1_TOP_4,
              A_AR0_1_TOP_5,
              A_AR0_1_TOP_6,
              A_AR0_1_TOP_7,
              A_AR0_1_TOP_8,
              A_AR0_1_TOP_9,
              A_D0_1_TOP_0,
              A_D0_1_TOP_1,
              A_D0_1_TOP_2,
              A_D0_1_TOP_3,
              A_D0_1_TOP_4,
              A_D0_1_TOP_5,
              A_D0_1_TOP_6,
              A_D0_1_TOP_7,
              A_D0_1_TOP_8,
              A_D0_1_TOP_9,
              A_D0_1_TOP_10,
              A_D0_1_TOP_11,
              A_D0_1_TOP_12,
              A_D0_1_TOP_13,
              A_D0_1_TOP_14,
              A_D0_1_TOP_15,
              A_D0_1_TOP_16,
              A_D0_1_TOP_17,
              A_BW0_1_TOP_0,
              A_BW0_1_TOP_1,
              A_CKW_1_TOP_0,
              A_CKR_1_TOP_0,
              A_CSW_1_TOP_0,
              A_CSR_1_TOP_0,
              B_AW0_1_TOP_0,
              B_AW0_1_TOP_1,
              B_AW0_1_TOP_2,
              B_AW0_1_TOP_3,
              B_AW0_1_TOP_4,
              B_AW0_1_TOP_5,
              B_AW0_1_TOP_6,
              B_AW0_1_TOP_7,
              B_AW0_1_TOP_8,
              B_AW0_1_TOP_9,
              B_AR0_1_TOP_0,
              B_AR0_1_TOP_1,
              B_AR0_1_TOP_2,
              B_AR0_1_TOP_3,
              B_AR0_1_TOP_4,
              B_AR0_1_TOP_5,
              B_AR0_1_TOP_6,
              B_AR0_1_TOP_7,
              B_AR0_1_TOP_8,
              B_AR0_1_TOP_9,
              B_D0_1_TOP_0,
              B_D0_1_TOP_1,
              B_D0_1_TOP_2,
              B_D0_1_TOP_3,
              B_D0_1_TOP_4,
              B_D0_1_TOP_5,
              B_D0_1_TOP_6,
              B_D0_1_TOP_7,
              B_D0_1_TOP_8,
              B_D0_1_TOP_9,
              B_D0_1_TOP_10,
              B_D0_1_TOP_11,
              B_D0_1_TOP_12,
              B_D0_1_TOP_13,
              B_D0_1_TOP_14,
              B_D0_1_TOP_15,
              B_D0_1_TOP_16,
              B_D0_1_TOP_17,
              B_BW0_1_TOP_0,
              B_BW0_1_TOP_1,
              B_CKW_1_TOP_0,
              B_CKR_1_TOP_0,
              B_CSW_1_TOP_0,
              B_CSR_1_TOP_0,
              MC1_1_TOP_0,
              MC1_1_TOP_1,
              MC1_1_TOP_9,
              MC1_1_TOP_12,
              MC1_1_TOP_13,
              MC1_1_TOP_19,
              MC1_1_TOP_22,
              A_AW0_2_TOP_0,
              A_AW0_2_TOP_1,
              A_AW0_2_TOP_2,
              A_AW0_2_TOP_3,
              A_AW0_2_TOP_4,
              A_AW0_2_TOP_5,
              A_AW0_2_TOP_6,
              A_AW0_2_TOP_7,
              A_AW0_2_TOP_8,
              A_AW0_2_TOP_9,
              A_AR0_2_TOP_0,
              A_AR0_2_TOP_1,
              A_AR0_2_TOP_2,
              A_AR0_2_TOP_3,
              A_AR0_2_TOP_4,
              A_AR0_2_TOP_5,
              A_AR0_2_TOP_6,
              A_AR0_2_TOP_7,
              A_AR0_2_TOP_8,
              A_AR0_2_TOP_9,
              A_D0_2_TOP_0,
              A_D0_2_TOP_1,
              A_D0_2_TOP_2,
              A_D0_2_TOP_3,
              A_D0_2_TOP_4,
              A_D0_2_TOP_5,
              A_D0_2_TOP_6,
              A_D0_2_TOP_7,
              A_D0_2_TOP_8,
              A_D0_2_TOP_9,
              A_D0_2_TOP_10,
              A_D0_2_TOP_11,
              A_D0_2_TOP_12,
              A_D0_2_TOP_13,
              A_D0_2_TOP_14,
              A_D0_2_TOP_15,
              A_D0_2_TOP_16,
              A_D0_2_TOP_17,
              A_BW0_2_TOP_0,
              A_BW0_2_TOP_1,
              A_CKW_2_TOP_0,
              A_CKR_2_TOP_0,
              A_CSW_2_TOP_0,
              A_CSR_2_TOP_0,
              B_AW0_2_TOP_0,
              B_AW0_2_TOP_1,
              B_AW0_2_TOP_2,
              B_AW0_2_TOP_3,
              B_AW0_2_TOP_4,
              B_AW0_2_TOP_5,
              B_AW0_2_TOP_6,
              B_AW0_2_TOP_7,
              B_AW0_2_TOP_8,
              B_AW0_2_TOP_9,
              B_AR0_2_TOP_0,
              B_AR0_2_TOP_1,
              B_AR0_2_TOP_2,
              B_AR0_2_TOP_3,
              B_AR0_2_TOP_4,
              B_AR0_2_TOP_5,
              B_AR0_2_TOP_6,
              B_AR0_2_TOP_7,
              B_AR0_2_TOP_8,
              B_AR0_2_TOP_9,
              B_D0_2_TOP_0,
              B_D0_2_TOP_1,
              B_D0_2_TOP_2,
              B_D0_2_TOP_3,
              B_D0_2_TOP_4,
              B_D0_2_TOP_5,
              B_D0_2_TOP_6,
              B_D0_2_TOP_7,
              B_D0_2_TOP_8,
              B_D0_2_TOP_9,
              B_D0_2_TOP_10,
              B_D0_2_TOP_11,
              B_D0_2_TOP_12,
              B_D0_2_TOP_13,
              B_D0_2_TOP_14,
              B_D0_2_TOP_15,
              B_D0_2_TOP_16,
              B_D0_2_TOP_17,
              B_BW0_2_TOP_0,
              B_BW0_2_TOP_1,
              B_CKW_2_TOP_0,
              B_CKR_2_TOP_0,
              B_CSW_2_TOP_0,
              B_CSR_2_TOP_0,
              MC1_2_TOP_0,
              MC1_2_TOP_1,
              MC1_2_TOP_9,
              MC1_2_TOP_12,
              MC1_2_TOP_13,
              MC1_2_TOP_19,
              MC1_2_TOP_22,
              A_AW0_3_TOP_0,
              A_AW0_3_TOP_1,
              A_AW0_3_TOP_2,
              A_AW0_3_TOP_3,
              A_AW0_3_TOP_4,
              A_AW0_3_TOP_5,
              A_AW0_3_TOP_6,
              A_AW0_3_TOP_7,
              A_AW0_3_TOP_8,
              A_AW0_3_TOP_9,
              A_AR0_3_TOP_0,
              A_AR0_3_TOP_1,
              A_AR0_3_TOP_2,
              A_AR0_3_TOP_3,
              A_AR0_3_TOP_4,
              A_AR0_3_TOP_5,
              A_AR0_3_TOP_6,
              A_AR0_3_TOP_7,
              A_AR0_3_TOP_8,
              A_AR0_3_TOP_9,
              A_D0_3_TOP_0,
              A_D0_3_TOP_1,
              A_D0_3_TOP_2,
              A_D0_3_TOP_3,
              A_D0_3_TOP_4,
              A_D0_3_TOP_5,
              A_D0_3_TOP_6,
              A_D0_3_TOP_7,
              A_D0_3_TOP_8,
              A_D0_3_TOP_9,
              A_D0_3_TOP_10,
              A_D0_3_TOP_11,
              A_D0_3_TOP_12,
              A_D0_3_TOP_13,
              A_D0_3_TOP_14,
              A_D0_3_TOP_15,
              A_D0_3_TOP_16,
              A_D0_3_TOP_17,
              A_BW0_3_TOP_0,
              A_BW0_3_TOP_1,
              A_CKW_3_TOP_0,
              A_CKR_3_TOP_0,
              A_CSW_3_TOP_0,
              A_CSR_3_TOP_0,
              B_AW0_3_TOP_0,
              B_AW0_3_TOP_1,
              B_AW0_3_TOP_2,
              B_AW0_3_TOP_3,
              B_AW0_3_TOP_4,
              B_AW0_3_TOP_5,
              B_AW0_3_TOP_6,
              B_AW0_3_TOP_7,
              B_AW0_3_TOP_8,
              B_AW0_3_TOP_9,
              B_AR0_3_TOP_0,
              B_AR0_3_TOP_1,
              B_AR0_3_TOP_2,
              B_AR0_3_TOP_3,
              B_AR0_3_TOP_4,
              B_AR0_3_TOP_5,
              B_AR0_3_TOP_6,
              B_AR0_3_TOP_7,
              B_AR0_3_TOP_8,
              B_AR0_3_TOP_9,
              B_D0_3_TOP_0,
              B_D0_3_TOP_1,
              B_D0_3_TOP_2,
              B_D0_3_TOP_3,
              B_D0_3_TOP_4,
              B_D0_3_TOP_5,
              B_D0_3_TOP_6,
              B_D0_3_TOP_7,
              B_D0_3_TOP_8,
              B_D0_3_TOP_9,
              B_D0_3_TOP_10,
              B_D0_3_TOP_11,
              B_D0_3_TOP_12,
              B_D0_3_TOP_13,
              B_D0_3_TOP_14,
              B_D0_3_TOP_15,
              B_D0_3_TOP_16,
              B_D0_3_TOP_17,
              B_BW0_3_TOP_0,
              B_BW0_3_TOP_1,
              B_CKW_3_TOP_0,
              B_CKR_3_TOP_0,
              B_CSW_3_TOP_0,
              B_CSR_3_TOP_0,
              MC1_3_TOP_0,
              MC1_3_TOP_1,
              MC1_3_TOP_9,
              MC1_3_TOP_12,
              MC1_3_TOP_13,
              MC1_3_TOP_19,
              MC1_3_TOP_22,
              A_AW0_0_BOT_0,
              A_AW0_0_BOT_1,
              A_AW0_0_BOT_2,
              A_AW0_0_BOT_3,
              A_AW0_0_BOT_4,
              A_AW0_0_BOT_5,
              A_AW0_0_BOT_6,
              A_AW0_0_BOT_7,
              A_AW0_0_BOT_8,
              A_AW0_0_BOT_9,
              A_AR0_0_BOT_0,
              A_AR0_0_BOT_1,
              A_AR0_0_BOT_2,
              A_AR0_0_BOT_3,
              A_AR0_0_BOT_4,
              A_AR0_0_BOT_5,
              A_AR0_0_BOT_6,
              A_AR0_0_BOT_7,
              A_AR0_0_BOT_8,
              A_AR0_0_BOT_9,
              A_D0_0_BOT_0,
              A_D0_0_BOT_1,
              A_D0_0_BOT_2,
              A_D0_0_BOT_3,
              A_D0_0_BOT_4,
              A_D0_0_BOT_5,
              A_D0_0_BOT_6,
              A_D0_0_BOT_7,
              A_D0_0_BOT_8,
              A_D0_0_BOT_9,
              A_D0_0_BOT_10,
              A_D0_0_BOT_11,
              A_D0_0_BOT_12,
              A_D0_0_BOT_13,
              A_D0_0_BOT_14,
              A_D0_0_BOT_15,
              A_D0_0_BOT_16,
              A_D0_0_BOT_17,
              A_BW0_0_BOT_0,
              A_BW0_0_BOT_1,
              A_CKW_0_BOT_0,
              A_CKR_0_BOT_0,
              A_CSW_0_BOT_0,
              A_CSR_0_BOT_0,
              B_AW0_0_BOT_0,
              B_AW0_0_BOT_1,
              B_AW0_0_BOT_2,
              B_AW0_0_BOT_3,
              B_AW0_0_BOT_4,
              B_AW0_0_BOT_5,
              B_AW0_0_BOT_6,
              B_AW0_0_BOT_7,
              B_AW0_0_BOT_8,
              B_AW0_0_BOT_9,
              B_AR0_0_BOT_0,
              B_AR0_0_BOT_1,
              B_AR0_0_BOT_2,
              B_AR0_0_BOT_3,
              B_AR0_0_BOT_4,
              B_AR0_0_BOT_5,
              B_AR0_0_BOT_6,
              B_AR0_0_BOT_7,
              B_AR0_0_BOT_8,
              B_AR0_0_BOT_9,
              B_D0_0_BOT_0,
              B_D0_0_BOT_1,
              B_D0_0_BOT_2,
              B_D0_0_BOT_3,
              B_D0_0_BOT_4,
              B_D0_0_BOT_5,
              B_D0_0_BOT_6,
              B_D0_0_BOT_7,
              B_D0_0_BOT_8,
              B_D0_0_BOT_9,
              B_D0_0_BOT_10,
              B_D0_0_BOT_11,
              B_D0_0_BOT_12,
              B_D0_0_BOT_13,
              B_D0_0_BOT_14,
              B_D0_0_BOT_15,
              B_D0_0_BOT_16,
              B_D0_0_BOT_17,
              B_BW0_0_BOT_0,
              B_BW0_0_BOT_1,
              B_CKW_0_BOT_0,
              B_CKR_0_BOT_0,
              B_CSW_0_BOT_0,
              B_CSR_0_BOT_0,
              MC1_0_BOT_0,
              MC1_0_BOT_1,
              MC1_0_BOT_9,
              MC1_0_BOT_12,
              MC1_0_BOT_13,
              MC1_0_BOT_19,
              MC1_0_BOT_22,
              A_AW0_1_BOT_0,
              A_AW0_1_BOT_1,
              A_AW0_1_BOT_2,
              A_AW0_1_BOT_3,
              A_AW0_1_BOT_4,
              A_AW0_1_BOT_5,
              A_AW0_1_BOT_6,
              A_AW0_1_BOT_7,
              A_AW0_1_BOT_8,
              A_AW0_1_BOT_9,
              A_AR0_1_BOT_0,
              A_AR0_1_BOT_1,
              A_AR0_1_BOT_2,
              A_AR0_1_BOT_3,
              A_AR0_1_BOT_4,
              A_AR0_1_BOT_5,
              A_AR0_1_BOT_6,
              A_AR0_1_BOT_7,
              A_AR0_1_BOT_8,
              A_AR0_1_BOT_9,
              A_D0_1_BOT_0,
              A_D0_1_BOT_1,
              A_D0_1_BOT_2,
              A_D0_1_BOT_3,
              A_D0_1_BOT_4,
              A_D0_1_BOT_5,
              A_D0_1_BOT_6,
              A_D0_1_BOT_7,
              A_D0_1_BOT_8,
              A_D0_1_BOT_9,
              A_D0_1_BOT_10,
              A_D0_1_BOT_11,
              A_D0_1_BOT_12,
              A_D0_1_BOT_13,
              A_D0_1_BOT_14,
              A_D0_1_BOT_15,
              A_D0_1_BOT_16,
              A_D0_1_BOT_17,
              A_BW0_1_BOT_0,
              A_BW0_1_BOT_1,
              A_CKW_1_BOT_0,
              A_CKR_1_BOT_0,
              A_CSW_1_BOT_0,
              A_CSR_1_BOT_0,
              B_AW0_1_BOT_0,
              B_AW0_1_BOT_1,
              B_AW0_1_BOT_2,
              B_AW0_1_BOT_3,
              B_AW0_1_BOT_4,
              B_AW0_1_BOT_5,
              B_AW0_1_BOT_6,
              B_AW0_1_BOT_7,
              B_AW0_1_BOT_8,
              B_AW0_1_BOT_9,
              B_AR0_1_BOT_0,
              B_AR0_1_BOT_1,
              B_AR0_1_BOT_2,
              B_AR0_1_BOT_3,
              B_AR0_1_BOT_4,
              B_AR0_1_BOT_5,
              B_AR0_1_BOT_6,
              B_AR0_1_BOT_7,
              B_AR0_1_BOT_8,
              B_AR0_1_BOT_9,
              B_D0_1_BOT_0,
              B_D0_1_BOT_1,
              B_D0_1_BOT_2,
              B_D0_1_BOT_3,
              B_D0_1_BOT_4,
              B_D0_1_BOT_5,
              B_D0_1_BOT_6,
              B_D0_1_BOT_7,
              B_D0_1_BOT_8,
              B_D0_1_BOT_9,
              B_D0_1_BOT_10,
              B_D0_1_BOT_11,
              B_D0_1_BOT_12,
              B_D0_1_BOT_13,
              B_D0_1_BOT_14,
              B_D0_1_BOT_15,
              B_D0_1_BOT_16,
              B_D0_1_BOT_17,
              B_BW0_1_BOT_0,
              B_BW0_1_BOT_1,
              B_CKW_1_BOT_0,
              B_CKR_1_BOT_0,
              B_CSW_1_BOT_0,
              B_CSR_1_BOT_0,
              MC1_1_BOT_0,
              MC1_1_BOT_1,
              MC1_1_BOT_9,
              MC1_1_BOT_12,
              MC1_1_BOT_13,
              MC1_1_BOT_19,
              MC1_1_BOT_22,
              A_AW0_2_BOT_0,
              A_AW0_2_BOT_1,
              A_AW0_2_BOT_2,
              A_AW0_2_BOT_3,
              A_AW0_2_BOT_4,
              A_AW0_2_BOT_5,
              A_AW0_2_BOT_6,
              A_AW0_2_BOT_7,
              A_AW0_2_BOT_8,
              A_AW0_2_BOT_9,
              A_AR0_2_BOT_0,
              A_AR0_2_BOT_1,
              A_AR0_2_BOT_2,
              A_AR0_2_BOT_3,
              A_AR0_2_BOT_4,
              A_AR0_2_BOT_5,
              A_AR0_2_BOT_6,
              A_AR0_2_BOT_7,
              A_AR0_2_BOT_8,
              A_AR0_2_BOT_9,
              A_D0_2_BOT_0,
              A_D0_2_BOT_1,
              A_D0_2_BOT_2,
              A_D0_2_BOT_3,
              A_D0_2_BOT_4,
              A_D0_2_BOT_5,
              A_D0_2_BOT_6,
              A_D0_2_BOT_7,
              A_D0_2_BOT_8,
              A_D0_2_BOT_9,
              A_D0_2_BOT_10,
              A_D0_2_BOT_11,
              A_D0_2_BOT_12,
              A_D0_2_BOT_13,
              A_D0_2_BOT_14,
              A_D0_2_BOT_15,
              A_D0_2_BOT_16,
              A_D0_2_BOT_17,
              A_BW0_2_BOT_0,
              A_BW0_2_BOT_1,
              A_CKW_2_BOT_0,
              A_CKR_2_BOT_0,
              A_CSW_2_BOT_0,
              A_CSR_2_BOT_0,
              B_AW0_2_BOT_0,
              B_AW0_2_BOT_1,
              B_AW0_2_BOT_2,
              B_AW0_2_BOT_3,
              B_AW0_2_BOT_4,
              B_AW0_2_BOT_5,
              B_AW0_2_BOT_6,
              B_AW0_2_BOT_7,
              B_AW0_2_BOT_8,
              B_AW0_2_BOT_9,
              B_AR0_2_BOT_0,
              B_AR0_2_BOT_1,
              B_AR0_2_BOT_2,
              B_AR0_2_BOT_3,
              B_AR0_2_BOT_4,
              B_AR0_2_BOT_5,
              B_AR0_2_BOT_6,
              B_AR0_2_BOT_7,
              B_AR0_2_BOT_8,
              B_AR0_2_BOT_9,
              B_D0_2_BOT_0,
              B_D0_2_BOT_1,
              B_D0_2_BOT_2,
              B_D0_2_BOT_3,
              B_D0_2_BOT_4,
              B_D0_2_BOT_5,
              B_D0_2_BOT_6,
              B_D0_2_BOT_7,
              B_D0_2_BOT_8,
              B_D0_2_BOT_9,
              B_D0_2_BOT_10,
              B_D0_2_BOT_11,
              B_D0_2_BOT_12,
              B_D0_2_BOT_13,
              B_D0_2_BOT_14,
              B_D0_2_BOT_15,
              B_D0_2_BOT_16,
              B_D0_2_BOT_17,
              B_BW0_2_BOT_0,
              B_BW0_2_BOT_1,
              B_CKW_2_BOT_0,
              B_CKR_2_BOT_0,
              B_CSW_2_BOT_0,
              B_CSR_2_BOT_0,
              MC1_2_BOT_0,
              MC1_2_BOT_1,
              MC1_2_BOT_9,
              MC1_2_BOT_12,
              MC1_2_BOT_13,
              MC1_2_BOT_19,
              MC1_2_BOT_22,
              A_AW0_3_BOT_0,
              A_AW0_3_BOT_1,
              A_AW0_3_BOT_2,
              A_AW0_3_BOT_3,
              A_AW0_3_BOT_4,
              A_AW0_3_BOT_5,
              A_AW0_3_BOT_6,
              A_AW0_3_BOT_7,
              A_AW0_3_BOT_8,
              A_AW0_3_BOT_9,
              A_AR0_3_BOT_0,
              A_AR0_3_BOT_1,
              A_AR0_3_BOT_2,
              A_AR0_3_BOT_3,
              A_AR0_3_BOT_4,
              A_AR0_3_BOT_5,
              A_AR0_3_BOT_6,
              A_AR0_3_BOT_7,
              A_AR0_3_BOT_8,
              A_AR0_3_BOT_9,
              A_D0_3_BOT_0,
              A_D0_3_BOT_1,
              A_D0_3_BOT_2,
              A_D0_3_BOT_3,
              A_D0_3_BOT_4,
              A_D0_3_BOT_5,
              A_D0_3_BOT_6,
              A_D0_3_BOT_7,
              A_D0_3_BOT_8,
              A_D0_3_BOT_9,
              A_D0_3_BOT_10,
              A_D0_3_BOT_11,
              A_D0_3_BOT_12,
              A_D0_3_BOT_13,
              A_D0_3_BOT_14,
              A_D0_3_BOT_15,
              A_D0_3_BOT_16,
              A_D0_3_BOT_17,
              A_BW0_3_BOT_0,
              A_BW0_3_BOT_1,
              A_CKW_3_BOT_0,
              A_CKR_3_BOT_0,
              A_CSW_3_BOT_0,
              A_CSR_3_BOT_0,
              B_AW0_3_BOT_0,
              B_AW0_3_BOT_1,
              B_AW0_3_BOT_2,
              B_AW0_3_BOT_3,
              B_AW0_3_BOT_4,
              B_AW0_3_BOT_5,
              B_AW0_3_BOT_6,
              B_AW0_3_BOT_7,
              B_AW0_3_BOT_8,
              B_AW0_3_BOT_9,
              B_AR0_3_BOT_0,
              B_AR0_3_BOT_1,
              B_AR0_3_BOT_2,
              B_AR0_3_BOT_3,
              B_AR0_3_BOT_4,
              B_AR0_3_BOT_5,
              B_AR0_3_BOT_6,
              B_AR0_3_BOT_7,
              B_AR0_3_BOT_8,
              B_AR0_3_BOT_9,
              B_D0_3_BOT_0,
              B_D0_3_BOT_1,
              B_D0_3_BOT_2,
              B_D0_3_BOT_3,
              B_D0_3_BOT_4,
              B_D0_3_BOT_5,
              B_D0_3_BOT_6,
              B_D0_3_BOT_7,
              B_D0_3_BOT_8,
              B_D0_3_BOT_9,
              B_D0_3_BOT_10,
              B_D0_3_BOT_11,
              B_D0_3_BOT_12,
              B_D0_3_BOT_13,
              B_D0_3_BOT_14,
              B_D0_3_BOT_15,
              B_D0_3_BOT_16,
              B_D0_3_BOT_17,
              B_BW0_3_BOT_0,
              B_BW0_3_BOT_1,
              B_CKW_3_BOT_0,
              B_CKR_3_BOT_0,
              B_CSW_3_BOT_0,
              B_CSR_3_BOT_0,
              MC1_3_BOT_0,
              MC1_3_BOT_1,
              MC1_3_BOT_9,
              MC1_3_BOT_12,
              MC1_3_BOT_13,
              MC1_3_BOT_19,
              MC1_3_BOT_22,
              HADDR_ASBI_0,
              HADDR_ASBI_1,
              HADDR_ASBI_2,
              HADDR_ASBI_3,
              HADDR_ASBI_4,
              HADDR_ASBI_5,
              HADDR_ASBI_6,
              HADDR_ASBI_7,
              HADDR_ASBI_8,
              HADDR_ASBI_9,
              HADDR_ASBI_10,
              HADDR_ASBI_11,
              HADDR_ASBI_12,
              HADDR_ASBI_13,
              HADDR_ASBI_14,
              HADDR_ASBI_15,
              HADDR_ASBI_16,
              HADDR_ASBI_17,
              HTRANS_ASBI_0,
              HTRANS_ASBI_1,
              HWRITE_ASBI,
              HSIZE_ASBI_0,
              HSIZE_ASBI_1,
              HBURST_ASBI,
              HWDATA_ASBI_0,
              HWDATA_ASBI_1,
              HWDATA_ASBI_2,
              HWDATA_ASBI_3,
              HWDATA_ASBI_4,
              HWDATA_ASBI_5,
              HWDATA_ASBI_6,
              HWDATA_ASBI_7,
              HWDATA_ASBI_8,
              HWDATA_ASBI_9,
              HWDATA_ASBI_10,
              HWDATA_ASBI_11,
              HWDATA_ASBI_12,
              HWDATA_ASBI_13,
              HWDATA_ASBI_14,
              HWDATA_ASBI_15,
              HWDATA_ASBI_16,
              HWDATA_ASBI_17,
              HWDATA_ASBI_18,
              HWDATA_ASBI_19,
              HWDATA_ASBI_20,
              HWDATA_ASBI_21,
              HWDATA_ASBI_22,
              HWDATA_ASBI_23,
              HWDATA_ASBI_24,
              HWDATA_ASBI_25,
              HWDATA_ASBI_26,
              HWDATA_ASBI_27,
              HWDATA_ASBI_28,
              HWDATA_ASBI_29,
              HWDATA_ASBI_30,
              HWDATA_ASBI_31,
              HWDATA_ASBI_32,
              HWDATA_ASBI_33,
              HWDATA_ASBI_34,
              HWDATA_ASBI_35,
              HBUSREQ_ASBI,
              HLOCK_ASBI,
              HRDATA_ASBI_0,
              HRDATA_ASBI_1,
              HRDATA_ASBI_2,
              HRDATA_ASBI_3,
              HRDATA_ASBI_4,
              HRDATA_ASBI_5,
              HRDATA_ASBI_6,
              HRDATA_ASBI_7,
              HRDATA_ASBI_8,
              HRDATA_ASBI_9,
              HRDATA_ASBI_10,
              HRDATA_ASBI_11,
              HRDATA_ASBI_12,
              HRDATA_ASBI_13,
              HRDATA_ASBI_14,
              HRDATA_ASBI_15,
              HRDATA_ASBI_16,
              HRDATA_ASBI_17,
              HRDATA_ASBI_18,
              HRDATA_ASBI_19,
              HRDATA_ASBI_20,
              HRDATA_ASBI_21,
              HRDATA_ASBI_22,
              HRDATA_ASBI_23,
              HRDATA_ASBI_24,
              HRDATA_ASBI_25,
              HRDATA_ASBI_26,
              HRDATA_ASBI_27,
              HRDATA_ASBI_28,
              HRDATA_ASBI_29,
              HRDATA_ASBI_30,
              HRDATA_ASBI_31,
              HRDATA_ASBI_32,
              HRDATA_ASBI_33,
              HRDATA_ASBI_34,
              HRDATA_ASBI_35,
              HREADY_OUT_ASBI,
              HRESP_ASBI_0,
              HRESP_ASBI_1,
              HCLK_FRA,
              GSR_FRA,
	      ASB_EN_SLI, 
              ASB_IRQ_MRI, 
              ASB_IRQ_SLI,
	      HBURST_ASBO,
              MPC_TA,
              MPC_RETRY,
              MPC_TEA,
              MPC_RD_DATA_31,
              MPC_RD_DATA_30,
              MPC_RD_DATA_29,
              MPC_RD_DATA_28,
              MPC_RD_DATA_27,
              MPC_RD_DATA_26,
              MPC_RD_DATA_25,
              MPC_RD_DATA_24,
              MPC_RD_DATA_23,
              MPC_RD_DATA_22,
              MPC_RD_DATA_21,
              MPC_RD_DATA_20,
              MPC_RD_DATA_19,
              MPC_RD_DATA_18,
              MPC_RD_DATA_17,
              MPC_RD_DATA_16,
              MPC_RD_DATA_15,
              MPC_RD_DATA_14,
              MPC_RD_DATA_13,
              MPC_RD_DATA_12,
              MPC_RD_DATA_11,
              MPC_RD_DATA_10,
              MPC_RD_DATA_9,
              MPC_RD_DATA_8,
              MPC_RD_DATA_7,
              MPC_RD_DATA_6,
              MPC_RD_DATA_5,
              MPC_RD_DATA_4,
              MPC_RD_DATA_3,
              MPC_RD_DATA_2,
              MPC_RD_DATA_1,
              MPC_RD_DATA_0,
              PD2_0_TS,
              PD7_3_TS,
              PD15_8_TS,
              PD31_16_TS,
              MPC_RD_PARITY_3,
              MPC_RD_PARITY_2,
              MPC_RD_PARITY_1,
              MPC_RD_PARITY_0,
              MPC_DP_TS_0,
              MPC_DP_TS_1,
              MPC_DP_TS_2,
              MPC_IRQ,
              MPC_CNTL_TS,
	      USR_IRQ,
              FMRDATA_0,
              FMRDATA_1,
              FMRDATA_2,
              FMRDATA_3,
              FMRDATA_4,
              FMRDATA_5,
              FMRDATA_6,
              FMRDATA_7,
              FMRDATA_8,
              FMRDATA_9,
              FMRDATA_10,
              FMRDATA_11,
              FMRDATA_12,
              FMRDATA_13,
              FMRDATA_14,
              FMRDATA_15,
              FMRDATA_16,
              FMRDATA_17,
              FMRDATA_18,
              FMRDATA_19,
              FMRDATA_20,
              FMRDATA_21,
              FMRDATA_22,
              FMRDATA_23,
              FMRDATA_24,
              FMRDATA_25,
              FMRDATA_26,
              FMRDATA_27,
              FMRDATA_28,
              FMRDATA_29,
              FMRDATA_30,
              FMRDATA_31,
              FMRDATA_32,
              FMRDATA_33,
              FMRDATA_34,
              FMRDATA_35,
              FMGRNTED,
              FMACK,
              FMRETRY,
              FMERR,
              FSWDATA_0,
              FSWDATA_1,
              FSWDATA_2,
              FSWDATA_3,
              FSWDATA_4,
              FSWDATA_5,
              FSWDATA_6,
              FSWDATA_7,
              FSWDATA_8,
              FSWDATA_9,
              FSWDATA_10,
              FSWDATA_11,
              FSWDATA_12,
              FSWDATA_13,
              FSWDATA_14,
              FSWDATA_15,
              FSWDATA_16,
              FSWDATA_17,
              FSWDATA_18,
              FSWDATA_19,
              FSWDATA_20,
              FSWDATA_21,
              FSWDATA_22,
              FSWDATA_23,
              FSWDATA_24,
              FSWDATA_25,
              FSWDATA_26,
              FSWDATA_27,
              FSWDATA_28,
              FSWDATA_29,
              FSWDATA_30,
              FSWDATA_31,
              FSWDATA_32,
              FSWDATA_33,
              FSWDATA_34,
              FSWDATA_35,
              FSADDR_0,
              FSADDR_1,
              FSADDR_2,
              FSADDR_3,
              FSADDR_4,
              FSADDR_5,
              FSADDR_6,
              FSADDR_7,
              FSADDR_8,
              FSADDR_9,
              FSADDR_10,
              FSADDR_11,
              FSADDR_12,
              FSADDR_13,
              FSADDR_14,
              FSADDR_15,
              FSADDR_16,
              FSADDR_17,
              FSBURST,
              FSRDY,
              FSWR,
              FSSIZE_0,
              FSSIZE_1,
              A_Q0_0_TOP_0,
              A_Q0_0_TOP_1,
              A_Q0_0_TOP_2,
              A_Q0_0_TOP_3,
              A_Q0_0_TOP_4,
              A_Q0_0_TOP_5,
              A_Q0_0_TOP_6,
              A_Q0_0_TOP_7,
              A_Q0_0_TOP_8,
              A_Q0_0_TOP_9,
              A_Q0_0_TOP_10,
              A_Q0_0_TOP_11,
              A_Q0_0_TOP_12,
              A_Q0_0_TOP_13,
              A_Q0_0_TOP_14,
              A_Q0_0_TOP_15,
              A_Q0_0_TOP_16,
              A_Q0_0_TOP_17,
              B_Q0_0_TOP_0,
              B_Q0_0_TOP_1,
              B_Q0_0_TOP_2,
              B_Q0_0_TOP_3,
              B_Q0_0_TOP_4,
              B_Q0_0_TOP_5,
              B_Q0_0_TOP_6,
              B_Q0_0_TOP_7,
              B_Q0_0_TOP_8,
              B_Q0_0_TOP_9,
              B_Q0_0_TOP_10,
              B_Q0_0_TOP_11,
              B_Q0_0_TOP_12,
              B_Q0_0_TOP_13,
              B_Q0_0_TOP_14,
              B_Q0_0_TOP_15,
              B_Q0_0_TOP_16,
              B_Q0_0_TOP_17,
              A_BUSY0_0_TOP,
              B_BUSY0_0_TOP,
              A_Q0_1_TOP_0,
              A_Q0_1_TOP_1,
              A_Q0_1_TOP_2,
              A_Q0_1_TOP_3,
              A_Q0_1_TOP_4,
              A_Q0_1_TOP_5,
              A_Q0_1_TOP_6,
              A_Q0_1_TOP_7,
              A_Q0_1_TOP_8,
              A_Q0_1_TOP_9,
              A_Q0_1_TOP_10,
              A_Q0_1_TOP_11,
              A_Q0_1_TOP_12,
              A_Q0_1_TOP_13,
              A_Q0_1_TOP_14,
              A_Q0_1_TOP_15,
              A_Q0_1_TOP_16,
              A_Q0_1_TOP_17,
              B_Q0_1_TOP_0,
              B_Q0_1_TOP_1,
              B_Q0_1_TOP_2,
              B_Q0_1_TOP_3,
              B_Q0_1_TOP_4,
              B_Q0_1_TOP_5,
              B_Q0_1_TOP_6,
              B_Q0_1_TOP_7,
              B_Q0_1_TOP_8,
              B_Q0_1_TOP_9,
              B_Q0_1_TOP_10,
              B_Q0_1_TOP_11,
              B_Q0_1_TOP_12,
              B_Q0_1_TOP_13,
              B_Q0_1_TOP_14,
              B_Q0_1_TOP_15,
              B_Q0_1_TOP_16,
              B_Q0_1_TOP_17,
              A_BUSY0_1_TOP,
              B_BUSY0_1_TOP,
              A_Q0_2_TOP_0,
              A_Q0_2_TOP_1,
              A_Q0_2_TOP_2,
              A_Q0_2_TOP_3,
              A_Q0_2_TOP_4,
              A_Q0_2_TOP_5,
              A_Q0_2_TOP_6,
              A_Q0_2_TOP_7,
              A_Q0_2_TOP_8,
              A_Q0_2_TOP_9,
              A_Q0_2_TOP_10,
              A_Q0_2_TOP_11,
              A_Q0_2_TOP_12,
              A_Q0_2_TOP_13,
              A_Q0_2_TOP_14,
              A_Q0_2_TOP_15,
              A_Q0_2_TOP_16,
              A_Q0_2_TOP_17,
              B_Q0_2_TOP_0,
              B_Q0_2_TOP_1,
              B_Q0_2_TOP_2,
              B_Q0_2_TOP_3,
              B_Q0_2_TOP_4,
              B_Q0_2_TOP_5,
              B_Q0_2_TOP_6,
              B_Q0_2_TOP_7,
              B_Q0_2_TOP_8,
              B_Q0_2_TOP_9,
              B_Q0_2_TOP_10,
              B_Q0_2_TOP_11,
              B_Q0_2_TOP_12,
              B_Q0_2_TOP_13,
              B_Q0_2_TOP_14,
              B_Q0_2_TOP_15,
              B_Q0_2_TOP_16,
              B_Q0_2_TOP_17,
              A_BUSY0_2_TOP,
              B_BUSY0_2_TOP,
              A_Q0_3_TOP_0,
              A_Q0_3_TOP_1,
              A_Q0_3_TOP_2,
              A_Q0_3_TOP_3,
              A_Q0_3_TOP_4,
              A_Q0_3_TOP_5,
              A_Q0_3_TOP_6,
              A_Q0_3_TOP_7,
              A_Q0_3_TOP_8,
              A_Q0_3_TOP_9,
              A_Q0_3_TOP_10,
              A_Q0_3_TOP_11,
              A_Q0_3_TOP_12,
              A_Q0_3_TOP_13,
              A_Q0_3_TOP_14,
              A_Q0_3_TOP_15,
              A_Q0_3_TOP_16,
              A_Q0_3_TOP_17,
              B_Q0_3_TOP_0,
              B_Q0_3_TOP_1,
              B_Q0_3_TOP_2,
              B_Q0_3_TOP_3,
              B_Q0_3_TOP_4,
              B_Q0_3_TOP_5,
              B_Q0_3_TOP_6,
              B_Q0_3_TOP_7,
              B_Q0_3_TOP_8,
              B_Q0_3_TOP_9,
              B_Q0_3_TOP_10,
              B_Q0_3_TOP_11,
              B_Q0_3_TOP_12,
              B_Q0_3_TOP_13,
              B_Q0_3_TOP_14,
              B_Q0_3_TOP_15,
              B_Q0_3_TOP_16,
              B_Q0_3_TOP_17,
              A_BUSY0_3_TOP,
              B_BUSY0_3_TOP,
              A_Q0_0_BOT_0,
              A_Q0_0_BOT_1,
              A_Q0_0_BOT_2,
              A_Q0_0_BOT_3,
              A_Q0_0_BOT_4,
              A_Q0_0_BOT_5,
              A_Q0_0_BOT_6,
              A_Q0_0_BOT_7,
              A_Q0_0_BOT_8,
              A_Q0_0_BOT_9,
              A_Q0_0_BOT_10,
              A_Q0_0_BOT_11,
              A_Q0_0_BOT_12,
              A_Q0_0_BOT_13,
              A_Q0_0_BOT_14,
              A_Q0_0_BOT_15,
              A_Q0_0_BOT_16,
              A_Q0_0_BOT_17,
              B_Q0_0_BOT_0,
              B_Q0_0_BOT_1,
              B_Q0_0_BOT_2,
              B_Q0_0_BOT_3,
              B_Q0_0_BOT_4,
              B_Q0_0_BOT_5,
              B_Q0_0_BOT_6,
              B_Q0_0_BOT_7,
              B_Q0_0_BOT_8,
              B_Q0_0_BOT_9,
              B_Q0_0_BOT_10,
              B_Q0_0_BOT_11,
              B_Q0_0_BOT_12,
              B_Q0_0_BOT_13,
              B_Q0_0_BOT_14,
              B_Q0_0_BOT_15,
              B_Q0_0_BOT_16,
              B_Q0_0_BOT_17,
              A_BUSY0_0_BOT,
              B_BUSY0_0_BOT,
              A_Q0_1_BOT_0,
              A_Q0_1_BOT_1,
              A_Q0_1_BOT_2,
              A_Q0_1_BOT_3,
              A_Q0_1_BOT_4,
              A_Q0_1_BOT_5,
              A_Q0_1_BOT_6,
              A_Q0_1_BOT_7,
              A_Q0_1_BOT_8,
              A_Q0_1_BOT_9,
              A_Q0_1_BOT_10,
              A_Q0_1_BOT_11,
              A_Q0_1_BOT_12,
              A_Q0_1_BOT_13,
              A_Q0_1_BOT_14,
              A_Q0_1_BOT_15,
              A_Q0_1_BOT_16,
              A_Q0_1_BOT_17,
              B_Q0_1_BOT_0,
              B_Q0_1_BOT_1,
              B_Q0_1_BOT_2,
              B_Q0_1_BOT_3,
              B_Q0_1_BOT_4,
              B_Q0_1_BOT_5,
              B_Q0_1_BOT_6,
              B_Q0_1_BOT_7,
              B_Q0_1_BOT_8,
              B_Q0_1_BOT_9,
              B_Q0_1_BOT_10,
              B_Q0_1_BOT_11,
              B_Q0_1_BOT_12,
              B_Q0_1_BOT_13,
              B_Q0_1_BOT_14,
              B_Q0_1_BOT_15,
              B_Q0_1_BOT_16,
              B_Q0_1_BOT_17,
              A_BUSY0_1_BOT,
              B_BUSY0_1_BOT,
              A_Q0_2_BOT_0,
              A_Q0_2_BOT_1,
              A_Q0_2_BOT_2,
              A_Q0_2_BOT_3,
              A_Q0_2_BOT_4,
              A_Q0_2_BOT_5,
              A_Q0_2_BOT_6,
              A_Q0_2_BOT_7,
              A_Q0_2_BOT_8,
              A_Q0_2_BOT_9,
              A_Q0_2_BOT_10,
              A_Q0_2_BOT_11,
              A_Q0_2_BOT_12,
              A_Q0_2_BOT_13,
              A_Q0_2_BOT_14,
              A_Q0_2_BOT_15,
              A_Q0_2_BOT_16,
              A_Q0_2_BOT_17,
              B_Q0_2_BOT_0,
              B_Q0_2_BOT_1,
              B_Q0_2_BOT_2,
              B_Q0_2_BOT_3,
              B_Q0_2_BOT_4,
              B_Q0_2_BOT_5,
              B_Q0_2_BOT_6,
              B_Q0_2_BOT_7,
              B_Q0_2_BOT_8,
              B_Q0_2_BOT_9,
              B_Q0_2_BOT_10,
              B_Q0_2_BOT_11,
              B_Q0_2_BOT_12,
              B_Q0_2_BOT_13,
              B_Q0_2_BOT_14,
              B_Q0_2_BOT_15,
              B_Q0_2_BOT_16,
              B_Q0_2_BOT_17,
              A_BUSY0_2_BOT,
              B_BUSY0_2_BOT,
              A_Q0_3_BOT_0,
              A_Q0_3_BOT_1,
              A_Q0_3_BOT_2,
              A_Q0_3_BOT_3,
              A_Q0_3_BOT_4,
              A_Q0_3_BOT_5,
              A_Q0_3_BOT_6,
              A_Q0_3_BOT_7,
              A_Q0_3_BOT_8,
              A_Q0_3_BOT_9,
              A_Q0_3_BOT_10,
              A_Q0_3_BOT_11,
              A_Q0_3_BOT_12,
              A_Q0_3_BOT_13,
              A_Q0_3_BOT_14,
              A_Q0_3_BOT_15,
              A_Q0_3_BOT_16,
              A_Q0_3_BOT_17,
              B_Q0_3_BOT_0,
              B_Q0_3_BOT_1,
              B_Q0_3_BOT_2,
              B_Q0_3_BOT_3,
              B_Q0_3_BOT_4,
              B_Q0_3_BOT_5,
              B_Q0_3_BOT_6,
              B_Q0_3_BOT_7,
              B_Q0_3_BOT_8,
              B_Q0_3_BOT_9,
              B_Q0_3_BOT_10,
              B_Q0_3_BOT_11,
              B_Q0_3_BOT_12,
              B_Q0_3_BOT_13,
              B_Q0_3_BOT_14,
              B_Q0_3_BOT_15,
              B_Q0_3_BOT_16,
              B_Q0_3_BOT_17,
              A_BUSY0_3_BOT,
              B_BUSY0_3_BOT,
              HCLK_MR_ASBO,
              HRESET_N_MR_ASBO,
              HREADY_ASBO,
              HRESP_ASBO_0,
              HRESP_ASBO_1,
              HGRANT_ASBO,
              HRDATA_ASBO_0,
              HRDATA_ASBO_1,
              HRDATA_ASBO_2,
              HRDATA_ASBO_3,
              HRDATA_ASBO_4,
              HRDATA_ASBO_5,
              HRDATA_ASBO_6,
              HRDATA_ASBO_7,
              HRDATA_ASBO_8,
              HRDATA_ASBO_9,
              HRDATA_ASBO_10,
              HRDATA_ASBO_11,
              HRDATA_ASBO_12,
              HRDATA_ASBO_13,
              HRDATA_ASBO_14,
              HRDATA_ASBO_15,
              HRDATA_ASBO_16,
              HRDATA_ASBO_17,
              HRDATA_ASBO_18,
              HRDATA_ASBO_19,
              HRDATA_ASBO_20,
              HRDATA_ASBO_21,
              HRDATA_ASBO_22,
              HRDATA_ASBO_23,
              HRDATA_ASBO_24,
              HRDATA_ASBO_25,
              HRDATA_ASBO_26,
              HRDATA_ASBO_27,
              HRDATA_ASBO_28,
              HRDATA_ASBO_29,
              HRDATA_ASBO_30,
              HRDATA_ASBO_31,
              HRDATA_ASBO_32,
              HRDATA_ASBO_33,
              HRDATA_ASBO_34,
              HRDATA_ASBO_35,
              HCLK_SL_ASBO,
              HRESET_N_SL_ASBO,
              HADDR_ASBO_0,
              HADDR_ASBO_1,
              HADDR_ASBO_2,
              HADDR_ASBO_3,
              HADDR_ASBO_4,
              HADDR_ASBO_5,
              HADDR_ASBO_6,
              HADDR_ASBO_7,
              HADDR_ASBO_8,
              HADDR_ASBO_9,
              HADDR_ASBO_10,
              HADDR_ASBO_11,
              HADDR_ASBO_12,
              HADDR_ASBO_13,
              HADDR_ASBO_14,
              HADDR_ASBO_15,
              HADDR_ASBO_16,
              HADDR_ASBO_17,
              HTRANS_ASBO_0,
              HTRANS_ASBO_1,
              HWRITE_ASBO,
              HSIZE_ASBO_0,
              HSIZE_ASBO_1,
              HWDATA_ASBO_0,
              HWDATA_ASBO_1,
              HWDATA_ASBO_2,
              HWDATA_ASBO_3,
              HWDATA_ASBO_4,
              HWDATA_ASBO_5,
              HWDATA_ASBO_6,
              HWDATA_ASBO_7,
              HWDATA_ASBO_8,
              HWDATA_ASBO_9,
              HWDATA_ASBO_10,
              HWDATA_ASBO_11,
              HWDATA_ASBO_12,
              HWDATA_ASBO_13,
              HWDATA_ASBO_14,
              HWDATA_ASBO_15,
              HWDATA_ASBO_16,
              HWDATA_ASBO_17,
              HWDATA_ASBO_18,
              HWDATA_ASBO_19,
              HWDATA_ASBO_20,
              HWDATA_ASBO_21,
              HWDATA_ASBO_22,
              HWDATA_ASBO_23,
              HWDATA_ASBO_24,
              HWDATA_ASBO_25,
              HWDATA_ASBO_26,
              HWDATA_ASBO_27,
              HWDATA_ASBO_28,
              HWDATA_ASBO_29,
              HWDATA_ASBO_30,
              HWDATA_ASBO_31,
              HWDATA_ASBO_32,
              HWDATA_ASBO_33,
              HWDATA_ASBO_34,
              HWDATA_ASBO_35,
              HSEL_ASBO,
              HREADY_IN_ASBO,
              ASB_IRQ_TOA,
              PWRUPRES_TOA,
              INITN_TOA,
              TRIIO_TOA,
              DONE_TOA,
              GSRN_TOA
              ) /* synthesis syn_black_box */;
   input  CS0_N;
   input  CS1;
   input  MPC_CLK;
   input  MPC_RW_N;
   input  MPC_STRB_N;
   input  MPC_TSIZ_1;
   input  MPC_TSIZ_0;
   input  MPC_BURST;
   input  MPC_BDIP;
   input  MPC_ADDR_31;
   input  MPC_ADDR_30;
   input  MPC_ADDR_29;
   input  MPC_ADDR_28;
   input  MPC_ADDR_27;
   input  MPC_ADDR_26;
   input  MPC_ADDR_25;
   input  MPC_ADDR_24;
   input  MPC_ADDR_23;
   input  MPC_ADDR_22;
   input  MPC_ADDR_21;
   input  MPC_ADDR_20;
   input  MPC_ADDR_19;
   input  MPC_ADDR_18;
   input  MPC_ADDR_17;
   input  MPC_ADDR_16;
   input  MPC_ADDR_15;
   input  MPC_ADDR_14;
   input  MPC_WR_DATA_31;
   input  MPC_WR_DATA_30;
   input  MPC_WR_DATA_29;
   input  MPC_WR_DATA_28;
   input  MPC_WR_DATA_27;
   input  MPC_WR_DATA_26;
   input  MPC_WR_DATA_25;
   input  MPC_WR_DATA_24;
   input  MPC_WR_DATA_23;
   input  MPC_WR_DATA_22;
   input  MPC_WR_DATA_21;
   input  MPC_WR_DATA_20;
   input  MPC_WR_DATA_19;
   input  MPC_WR_DATA_18;
   input  MPC_WR_DATA_17;
   input  MPC_WR_DATA_16;
   input  MPC_WR_DATA_15;
   input  MPC_WR_DATA_14;
   input  MPC_WR_DATA_13;
   input  MPC_WR_DATA_12;
   input  MPC_WR_DATA_11;
   input  MPC_WR_DATA_10;
   input  MPC_WR_DATA_9;
   input  MPC_WR_DATA_8;
   input  MPC_WR_DATA_7;
   input  MPC_WR_DATA_6;
   input  MPC_WR_DATA_5;
   input  MPC_WR_DATA_4;
   input  MPC_WR_DATA_3;
   input  MPC_WR_DATA_2;
   input  MPC_WR_DATA_1;
   input  MPC_WR_DATA_0;
   input  MPC_WR_PARITY_3;
   input  MPC_WR_PARITY_2;
   input  MPC_WR_PARITY_1;
   input  MPC_WR_PARITY_0;
   input  USR_CLK;
   input  USR_IRQ_GENERAL;
   input  FMADDR_0;
   input  FMADDR_1;
   input  FMADDR_2;
   input  FMADDR_3;
   input  FMADDR_4;
   input  FMADDR_5;
   input  FMADDR_6;
   input  FMADDR_7;
   input  FMADDR_8;
   input  FMADDR_9;
   input  FMADDR_10;
   input  FMADDR_11;
   input  FMADDR_12;
   input  FMADDR_13;
   input  FMADDR_14;
   input  FMADDR_15;
   input  FMADDR_16;
   input  FMADDR_17;
   input  FMWDATA_0;
   input  FMWDATA_1;
   input  FMWDATA_2;
   input  FMWDATA_3;
   input  FMWDATA_4;
   input  FMWDATA_5;
   input  FMWDATA_6;
   input  FMWDATA_7;
   input  FMWDATA_8;
   input  FMWDATA_9;
   input  FMWDATA_10;
   input  FMWDATA_11;
   input  FMWDATA_12;
   input  FMWDATA_13;
   input  FMWDATA_14;
   input  FMWDATA_15;
   input  FMWDATA_16;
   input  FMWDATA_17;
   input  FMWDATA_18;
   input  FMWDATA_19;
   input  FMWDATA_20;
   input  FMWDATA_21;
   input  FMWDATA_22;
   input  FMWDATA_23;
   input  FMWDATA_24;
   input  FMWDATA_25;
   input  FMWDATA_26;
   input  FMWDATA_27;
   input  FMWDATA_28;
   input  FMWDATA_29;
   input  FMWDATA_30;
   input  FMWDATA_31;
   input  FMWDATA_32;
   input  FMWDATA_33;
   input  FMWDATA_34;
   input  FMWDATA_35;
   input  FMCLK;
   input  FMRESET;
   input  FMWRITE;
   input  FMREAD;
   input  FMBURST;
   input  FMRDY;
   input  FMSIZE_0;
   input  FMSIZE_1;
   input  FMLOCK;
   input  FMIRQI;
   input  FSRDATA_0;
   input  FSRDATA_1;
   input  FSRDATA_2;
   input  FSRDATA_3;
   input  FSRDATA_4;
   input  FSRDATA_5;
   input  FSRDATA_6;
   input  FSRDATA_7;
   input  FSRDATA_8;
   input  FSRDATA_9;
   input  FSRDATA_10;
   input  FSRDATA_11;
   input  FSRDATA_12;
   input  FSRDATA_13;
   input  FSRDATA_14;
   input  FSRDATA_15;
   input  FSRDATA_16;
   input  FSRDATA_17;
   input  FSRDATA_18;
   input  FSRDATA_19;
   input  FSRDATA_20;
   input  FSRDATA_21;
   input  FSRDATA_22;
   input  FSRDATA_23;
   input  FSRDATA_24;
   input  FSRDATA_25;
   input  FSRDATA_26;
   input  FSRDATA_27;
   input  FSRDATA_28;
   input  FSRDATA_29;
   input  FSRDATA_30;
   input  FSRDATA_31;
   input  FSRDATA_32;
   input  FSRDATA_33;
   input  FSRDATA_34;
   input  FSRDATA_35;
   input  FSCLK;
   input  FSRESET;
   input  FSACK;
   input  FSRETRY;
   input  FSERR;
   input  FSIRQI;
   input  A_AW0_0_TOP_0;
   input  A_AW0_0_TOP_1;
   input  A_AW0_0_TOP_2;
   input  A_AW0_0_TOP_3;
   input  A_AW0_0_TOP_4;
   input  A_AW0_0_TOP_5;
   input  A_AW0_0_TOP_6;
   input  A_AW0_0_TOP_7;
   input  A_AW0_0_TOP_8;
   input  A_AW0_0_TOP_9;
   input  A_AR0_0_TOP_0;
   input  A_AR0_0_TOP_1;
   input  A_AR0_0_TOP_2;
   input  A_AR0_0_TOP_3;
   input  A_AR0_0_TOP_4;
   input  A_AR0_0_TOP_5;
   input  A_AR0_0_TOP_6;
   input  A_AR0_0_TOP_7;
   input  A_AR0_0_TOP_8;
   input  A_AR0_0_TOP_9;
   input  A_D0_0_TOP_0;
   input  A_D0_0_TOP_1;
   input  A_D0_0_TOP_2;
   input  A_D0_0_TOP_3;
   input  A_D0_0_TOP_4;
   input  A_D0_0_TOP_5;
   input  A_D0_0_TOP_6;
   input  A_D0_0_TOP_7;
   input  A_D0_0_TOP_8;
   input  A_D0_0_TOP_9;
   input  A_D0_0_TOP_10;
   input  A_D0_0_TOP_11;
   input  A_D0_0_TOP_12;
   input  A_D0_0_TOP_13;
   input  A_D0_0_TOP_14;
   input  A_D0_0_TOP_15;
   input  A_D0_0_TOP_16;
   input  A_D0_0_TOP_17;
   input  A_BW0_0_TOP_0;
   input  A_BW0_0_TOP_1;
   input  A_CKW_0_TOP_0;
   input  A_CKR_0_TOP_0;
   input  A_CSW_0_TOP_0;
   input  A_CSR_0_TOP_0;
   input  B_AW0_0_TOP_0;
   input  B_AW0_0_TOP_1;
   input  B_AW0_0_TOP_2;
   input  B_AW0_0_TOP_3;
   input  B_AW0_0_TOP_4;
   input  B_AW0_0_TOP_5;
   input  B_AW0_0_TOP_6;
   input  B_AW0_0_TOP_7;
   input  B_AW0_0_TOP_8;
   input  B_AW0_0_TOP_9;
   input  B_AR0_0_TOP_0;
   input  B_AR0_0_TOP_1;
   input  B_AR0_0_TOP_2;
   input  B_AR0_0_TOP_3;
   input  B_AR0_0_TOP_4;
   input  B_AR0_0_TOP_5;
   input  B_AR0_0_TOP_6;
   input  B_AR0_0_TOP_7;
   input  B_AR0_0_TOP_8;
   input  B_AR0_0_TOP_9;
   input  B_D0_0_TOP_0;
   input  B_D0_0_TOP_1;
   input  B_D0_0_TOP_2;
   input  B_D0_0_TOP_3;
   input  B_D0_0_TOP_4;
   input  B_D0_0_TOP_5;
   input  B_D0_0_TOP_6;
   input  B_D0_0_TOP_7;
   input  B_D0_0_TOP_8;
   input  B_D0_0_TOP_9;
   input  B_D0_0_TOP_10;
   input  B_D0_0_TOP_11;
   input  B_D0_0_TOP_12;
   input  B_D0_0_TOP_13;
   input  B_D0_0_TOP_14;
   input  B_D0_0_TOP_15;
   input  B_D0_0_TOP_16;
   input  B_D0_0_TOP_17;
   input  B_BW0_0_TOP_0;
   input  B_BW0_0_TOP_1;
   input  B_CKW_0_TOP_0;
   input  B_CKR_0_TOP_0;
   input  B_CSW_0_TOP_0;
   input  B_CSR_0_TOP_0;
   input  MC1_0_TOP_0;
   input  MC1_0_TOP_1;
   input  MC1_0_TOP_9;
   input  MC1_0_TOP_12;
   input  MC1_0_TOP_13;
   input  MC1_0_TOP_19;
   input  MC1_0_TOP_22;
   input  A_AW0_1_TOP_0;
   input  A_AW0_1_TOP_1;
   input  A_AW0_1_TOP_2;
   input  A_AW0_1_TOP_3;
   input  A_AW0_1_TOP_4;
   input  A_AW0_1_TOP_5;
   input  A_AW0_1_TOP_6;
   input  A_AW0_1_TOP_7;
   input  A_AW0_1_TOP_8;
   input  A_AW0_1_TOP_9;
   input  A_AR0_1_TOP_0;
   input  A_AR0_1_TOP_1;
   input  A_AR0_1_TOP_2;
   input  A_AR0_1_TOP_3;
   input  A_AR0_1_TOP_4;
   input  A_AR0_1_TOP_5;
   input  A_AR0_1_TOP_6;
   input  A_AR0_1_TOP_7;
   input  A_AR0_1_TOP_8;
   input  A_AR0_1_TOP_9;
   input  A_D0_1_TOP_0;
   input  A_D0_1_TOP_1;
   input  A_D0_1_TOP_2;
   input  A_D0_1_TOP_3;
   input  A_D0_1_TOP_4;
   input  A_D0_1_TOP_5;
   input  A_D0_1_TOP_6;
   input  A_D0_1_TOP_7;
   input  A_D0_1_TOP_8;
   input  A_D0_1_TOP_9;
   input  A_D0_1_TOP_10;
   input  A_D0_1_TOP_11;
   input  A_D0_1_TOP_12;
   input  A_D0_1_TOP_13;
   input  A_D0_1_TOP_14;
   input  A_D0_1_TOP_15;
   input  A_D0_1_TOP_16;
   input  A_D0_1_TOP_17;
   input  A_BW0_1_TOP_0;
   input  A_BW0_1_TOP_1;
   input  A_CKW_1_TOP_0;
   input  A_CKR_1_TOP_0;
   input  A_CSW_1_TOP_0;
   input  A_CSR_1_TOP_0;
   input  B_AW0_1_TOP_0;
   input  B_AW0_1_TOP_1;
   input  B_AW0_1_TOP_2;
   input  B_AW0_1_TOP_3;
   input  B_AW0_1_TOP_4;
   input  B_AW0_1_TOP_5;
   input  B_AW0_1_TOP_6;
   input  B_AW0_1_TOP_7;
   input  B_AW0_1_TOP_8;
   input  B_AW0_1_TOP_9;
   input  B_AR0_1_TOP_0;
   input  B_AR0_1_TOP_1;
   input  B_AR0_1_TOP_2;
   input  B_AR0_1_TOP_3;
   input  B_AR0_1_TOP_4;
   input  B_AR0_1_TOP_5;
   input  B_AR0_1_TOP_6;
   input  B_AR0_1_TOP_7;
   input  B_AR0_1_TOP_8;
   input  B_AR0_1_TOP_9;
   input  B_D0_1_TOP_0;
   input  B_D0_1_TOP_1;
   input  B_D0_1_TOP_2;
   input  B_D0_1_TOP_3;
   input  B_D0_1_TOP_4;
   input  B_D0_1_TOP_5;
   input  B_D0_1_TOP_6;
   input  B_D0_1_TOP_7;
   input  B_D0_1_TOP_8;
   input  B_D0_1_TOP_9;
   input  B_D0_1_TOP_10;
   input  B_D0_1_TOP_11;
   input  B_D0_1_TOP_12;
   input  B_D0_1_TOP_13;
   input  B_D0_1_TOP_14;
   input  B_D0_1_TOP_15;
   input  B_D0_1_TOP_16;
   input  B_D0_1_TOP_17;
   input  B_BW0_1_TOP_0;
   input  B_BW0_1_TOP_1;
   input  B_CKW_1_TOP_0;
   input  B_CKR_1_TOP_0;
   input  B_CSW_1_TOP_0;
   input  B_CSR_1_TOP_0;
   input  MC1_1_TOP_0;
   input  MC1_1_TOP_1;
   input  MC1_1_TOP_9;
   input  MC1_1_TOP_12;
   input  MC1_1_TOP_13;
   input  MC1_1_TOP_19;
   input  MC1_1_TOP_22;
   input  A_AW0_2_TOP_0;
   input  A_AW0_2_TOP_1;
   input  A_AW0_2_TOP_2;
   input  A_AW0_2_TOP_3;
   input  A_AW0_2_TOP_4;
   input  A_AW0_2_TOP_5;
   input  A_AW0_2_TOP_6;
   input  A_AW0_2_TOP_7;
   input  A_AW0_2_TOP_8;
   input  A_AW0_2_TOP_9;
   input  A_AR0_2_TOP_0;
   input  A_AR0_2_TOP_1;
   input  A_AR0_2_TOP_2;
   input  A_AR0_2_TOP_3;
   input  A_AR0_2_TOP_4;
   input  A_AR0_2_TOP_5;
   input  A_AR0_2_TOP_6;
   input  A_AR0_2_TOP_7;
   input  A_AR0_2_TOP_8;
   input  A_AR0_2_TOP_9;
   input  A_D0_2_TOP_0;
   input  A_D0_2_TOP_1;
   input  A_D0_2_TOP_2;
   input  A_D0_2_TOP_3;
   input  A_D0_2_TOP_4;
   input  A_D0_2_TOP_5;
   input  A_D0_2_TOP_6;
   input  A_D0_2_TOP_7;
   input  A_D0_2_TOP_8;
   input  A_D0_2_TOP_9;
   input  A_D0_2_TOP_10;
   input  A_D0_2_TOP_11;
   input  A_D0_2_TOP_12;
   input  A_D0_2_TOP_13;
   input  A_D0_2_TOP_14;
   input  A_D0_2_TOP_15;
   input  A_D0_2_TOP_16;
   input  A_D0_2_TOP_17;
   input  A_BW0_2_TOP_0;
   input  A_BW0_2_TOP_1;
   input  A_CKW_2_TOP_0;
   input  A_CKR_2_TOP_0;
   input  A_CSW_2_TOP_0;
   input  A_CSR_2_TOP_0;
   input  B_AW0_2_TOP_0;
   input  B_AW0_2_TOP_1;
   input  B_AW0_2_TOP_2;
   input  B_AW0_2_TOP_3;
   input  B_AW0_2_TOP_4;
   input  B_AW0_2_TOP_5;
   input  B_AW0_2_TOP_6;
   input  B_AW0_2_TOP_7;
   input  B_AW0_2_TOP_8;
   input  B_AW0_2_TOP_9;
   input  B_AR0_2_TOP_0;
   input  B_AR0_2_TOP_1;
   input  B_AR0_2_TOP_2;
   input  B_AR0_2_TOP_3;
   input  B_AR0_2_TOP_4;
   input  B_AR0_2_TOP_5;
   input  B_AR0_2_TOP_6;
   input  B_AR0_2_TOP_7;
   input  B_AR0_2_TOP_8;
   input  B_AR0_2_TOP_9;
   input  B_D0_2_TOP_0;
   input  B_D0_2_TOP_1;
   input  B_D0_2_TOP_2;
   input  B_D0_2_TOP_3;
   input  B_D0_2_TOP_4;
   input  B_D0_2_TOP_5;
   input  B_D0_2_TOP_6;
   input  B_D0_2_TOP_7;
   input  B_D0_2_TOP_8;
   input  B_D0_2_TOP_9;
   input  B_D0_2_TOP_10;
   input  B_D0_2_TOP_11;
   input  B_D0_2_TOP_12;
   input  B_D0_2_TOP_13;
   input  B_D0_2_TOP_14;
   input  B_D0_2_TOP_15;
   input  B_D0_2_TOP_16;
   input  B_D0_2_TOP_17;
   input  B_BW0_2_TOP_0;
   input  B_BW0_2_TOP_1;
   input  B_CKW_2_TOP_0;
   input  B_CKR_2_TOP_0;
   input  B_CSW_2_TOP_0;
   input  B_CSR_2_TOP_0;
   input  MC1_2_TOP_0;
   input  MC1_2_TOP_1;
   input  MC1_2_TOP_9;
   input  MC1_2_TOP_12;
   input  MC1_2_TOP_13;
   input  MC1_2_TOP_19;
   input  MC1_2_TOP_22;
   input  A_AW0_3_TOP_0;
   input  A_AW0_3_TOP_1;
   input  A_AW0_3_TOP_2;
   input  A_AW0_3_TOP_3;
   input  A_AW0_3_TOP_4;
   input  A_AW0_3_TOP_5;
   input  A_AW0_3_TOP_6;
   input  A_AW0_3_TOP_7;
   input  A_AW0_3_TOP_8;
   input  A_AW0_3_TOP_9;
   input  A_AR0_3_TOP_0;
   input  A_AR0_3_TOP_1;
   input  A_AR0_3_TOP_2;
   input  A_AR0_3_TOP_3;
   input  A_AR0_3_TOP_4;
   input  A_AR0_3_TOP_5;
   input  A_AR0_3_TOP_6;
   input  A_AR0_3_TOP_7;
   input  A_AR0_3_TOP_8;
   input  A_AR0_3_TOP_9;
   input  A_D0_3_TOP_0;
   input  A_D0_3_TOP_1;
   input  A_D0_3_TOP_2;
   input  A_D0_3_TOP_3;
   input  A_D0_3_TOP_4;
   input  A_D0_3_TOP_5;
   input  A_D0_3_TOP_6;
   input  A_D0_3_TOP_7;
   input  A_D0_3_TOP_8;
   input  A_D0_3_TOP_9;
   input  A_D0_3_TOP_10;
   input  A_D0_3_TOP_11;
   input  A_D0_3_TOP_12;
   input  A_D0_3_TOP_13;
   input  A_D0_3_TOP_14;
   input  A_D0_3_TOP_15;
   input  A_D0_3_TOP_16;
   input  A_D0_3_TOP_17;
   input  A_BW0_3_TOP_0;
   input  A_BW0_3_TOP_1;
   input  A_CKW_3_TOP_0;
   input  A_CKR_3_TOP_0;
   input  A_CSW_3_TOP_0;
   input  A_CSR_3_TOP_0;
   input  B_AW0_3_TOP_0;
   input  B_AW0_3_TOP_1;
   input  B_AW0_3_TOP_2;
   input  B_AW0_3_TOP_3;
   input  B_AW0_3_TOP_4;
   input  B_AW0_3_TOP_5;
   input  B_AW0_3_TOP_6;
   input  B_AW0_3_TOP_7;
   input  B_AW0_3_TOP_8;
   input  B_AW0_3_TOP_9;
   input  B_AR0_3_TOP_0;
   input  B_AR0_3_TOP_1;
   input  B_AR0_3_TOP_2;
   input  B_AR0_3_TOP_3;
   input  B_AR0_3_TOP_4;
   input  B_AR0_3_TOP_5;
   input  B_AR0_3_TOP_6;
   input  B_AR0_3_TOP_7;
   input  B_AR0_3_TOP_8;
   input  B_AR0_3_TOP_9;
   input  B_D0_3_TOP_0;
   input  B_D0_3_TOP_1;
   input  B_D0_3_TOP_2;
   input  B_D0_3_TOP_3;
   input  B_D0_3_TOP_4;
   input  B_D0_3_TOP_5;
   input  B_D0_3_TOP_6;
   input  B_D0_3_TOP_7;
   input  B_D0_3_TOP_8;
   input  B_D0_3_TOP_9;
   input  B_D0_3_TOP_10;
   input  B_D0_3_TOP_11;
   input  B_D0_3_TOP_12;
   input  B_D0_3_TOP_13;
   input  B_D0_3_TOP_14;
   input  B_D0_3_TOP_15;
   input  B_D0_3_TOP_16;
   input  B_D0_3_TOP_17;
   input  B_BW0_3_TOP_0;
   input  B_BW0_3_TOP_1;
   input  B_CKW_3_TOP_0;
   input  B_CKR_3_TOP_0;
   input  B_CSW_3_TOP_0;
   input  B_CSR_3_TOP_0;
   input  MC1_3_TOP_0;
   input  MC1_3_TOP_1;
   input  MC1_3_TOP_9;
   input  MC1_3_TOP_12;
   input  MC1_3_TOP_13;
   input  MC1_3_TOP_19;
   input  MC1_3_TOP_22;
   input  A_AW0_0_BOT_0;
   input  A_AW0_0_BOT_1;
   input  A_AW0_0_BOT_2;
   input  A_AW0_0_BOT_3;
   input  A_AW0_0_BOT_4;
   input  A_AW0_0_BOT_5;
   input  A_AW0_0_BOT_6;
   input  A_AW0_0_BOT_7;
   input  A_AW0_0_BOT_8;
   input  A_AW0_0_BOT_9;
   input  A_AR0_0_BOT_0;
   input  A_AR0_0_BOT_1;
   input  A_AR0_0_BOT_2;
   input  A_AR0_0_BOT_3;
   input  A_AR0_0_BOT_4;
   input  A_AR0_0_BOT_5;
   input  A_AR0_0_BOT_6;
   input  A_AR0_0_BOT_7;
   input  A_AR0_0_BOT_8;
   input  A_AR0_0_BOT_9;
   input  A_D0_0_BOT_0;
   input  A_D0_0_BOT_1;
   input  A_D0_0_BOT_2;
   input  A_D0_0_BOT_3;
   input  A_D0_0_BOT_4;
   input  A_D0_0_BOT_5;
   input  A_D0_0_BOT_6;
   input  A_D0_0_BOT_7;
   input  A_D0_0_BOT_8;
   input  A_D0_0_BOT_9;
   input  A_D0_0_BOT_10;
   input  A_D0_0_BOT_11;
   input  A_D0_0_BOT_12;
   input  A_D0_0_BOT_13;
   input  A_D0_0_BOT_14;
   input  A_D0_0_BOT_15;
   input  A_D0_0_BOT_16;
   input  A_D0_0_BOT_17;
   input  A_BW0_0_BOT_0;
   input  A_BW0_0_BOT_1;
   input  A_CKW_0_BOT_0;
   input  A_CKR_0_BOT_0;
   input  A_CSW_0_BOT_0;
   input  A_CSR_0_BOT_0;
   input  B_AW0_0_BOT_0;
   input  B_AW0_0_BOT_1;
   input  B_AW0_0_BOT_2;
   input  B_AW0_0_BOT_3;
   input  B_AW0_0_BOT_4;
   input  B_AW0_0_BOT_5;
   input  B_AW0_0_BOT_6;
   input  B_AW0_0_BOT_7;
   input  B_AW0_0_BOT_8;
   input  B_AW0_0_BOT_9;
   input  B_AR0_0_BOT_0;
   input  B_AR0_0_BOT_1;
   input  B_AR0_0_BOT_2;
   input  B_AR0_0_BOT_3;
   input  B_AR0_0_BOT_4;
   input  B_AR0_0_BOT_5;
   input  B_AR0_0_BOT_6;
   input  B_AR0_0_BOT_7;
   input  B_AR0_0_BOT_8;
   input  B_AR0_0_BOT_9;
   input  B_D0_0_BOT_0;
   input  B_D0_0_BOT_1;
   input  B_D0_0_BOT_2;
   input  B_D0_0_BOT_3;
   input  B_D0_0_BOT_4;
   input  B_D0_0_BOT_5;
   input  B_D0_0_BOT_6;
   input  B_D0_0_BOT_7;
   input  B_D0_0_BOT_8;
   input  B_D0_0_BOT_9;
   input  B_D0_0_BOT_10;
   input  B_D0_0_BOT_11;
   input  B_D0_0_BOT_12;
   input  B_D0_0_BOT_13;
   input  B_D0_0_BOT_14;
   input  B_D0_0_BOT_15;
   input  B_D0_0_BOT_16;
   input  B_D0_0_BOT_17;
   input  B_BW0_0_BOT_0;
   input  B_BW0_0_BOT_1;
   input  B_CKW_0_BOT_0;
   input  B_CKR_0_BOT_0;
   input  B_CSW_0_BOT_0;
   input  B_CSR_0_BOT_0;
   input  MC1_0_BOT_0;
   input  MC1_0_BOT_1;
   input  MC1_0_BOT_9;
   input  MC1_0_BOT_12;
   input  MC1_0_BOT_13;
   input  MC1_0_BOT_19;
   input  MC1_0_BOT_22;
   input  A_AW0_1_BOT_0;
   input  A_AW0_1_BOT_1;
   input  A_AW0_1_BOT_2;
   input  A_AW0_1_BOT_3;
   input  A_AW0_1_BOT_4;
   input  A_AW0_1_BOT_5;
   input  A_AW0_1_BOT_6;
   input  A_AW0_1_BOT_7;
   input  A_AW0_1_BOT_8;
   input  A_AW0_1_BOT_9;
   input  A_AR0_1_BOT_0;
   input  A_AR0_1_BOT_1;
   input  A_AR0_1_BOT_2;
   input  A_AR0_1_BOT_3;
   input  A_AR0_1_BOT_4;
   input  A_AR0_1_BOT_5;
   input  A_AR0_1_BOT_6;
   input  A_AR0_1_BOT_7;
   input  A_AR0_1_BOT_8;
   input  A_AR0_1_BOT_9;
   input  A_D0_1_BOT_0;
   input  A_D0_1_BOT_1;
   input  A_D0_1_BOT_2;
   input  A_D0_1_BOT_3;
   input  A_D0_1_BOT_4;
   input  A_D0_1_BOT_5;
   input  A_D0_1_BOT_6;
   input  A_D0_1_BOT_7;
   input  A_D0_1_BOT_8;
   input  A_D0_1_BOT_9;
   input  A_D0_1_BOT_10;
   input  A_D0_1_BOT_11;
   input  A_D0_1_BOT_12;
   input  A_D0_1_BOT_13;
   input  A_D0_1_BOT_14;
   input  A_D0_1_BOT_15;
   input  A_D0_1_BOT_16;
   input  A_D0_1_BOT_17;
   input  A_BW0_1_BOT_0;
   input  A_BW0_1_BOT_1;
   input  A_CKW_1_BOT_0;
   input  A_CKR_1_BOT_0;
   input  A_CSW_1_BOT_0;
   input  A_CSR_1_BOT_0;
   input  B_AW0_1_BOT_0;
   input  B_AW0_1_BOT_1;
   input  B_AW0_1_BOT_2;
   input  B_AW0_1_BOT_3;
   input  B_AW0_1_BOT_4;
   input  B_AW0_1_BOT_5;
   input  B_AW0_1_BOT_6;
   input  B_AW0_1_BOT_7;
   input  B_AW0_1_BOT_8;
   input  B_AW0_1_BOT_9;
   input  B_AR0_1_BOT_0;
   input  B_AR0_1_BOT_1;
   input  B_AR0_1_BOT_2;
   input  B_AR0_1_BOT_3;
   input  B_AR0_1_BOT_4;
   input  B_AR0_1_BOT_5;
   input  B_AR0_1_BOT_6;
   input  B_AR0_1_BOT_7;
   input  B_AR0_1_BOT_8;
   input  B_AR0_1_BOT_9;
   input  B_D0_1_BOT_0;
   input  B_D0_1_BOT_1;
   input  B_D0_1_BOT_2;
   input  B_D0_1_BOT_3;
   input  B_D0_1_BOT_4;
   input  B_D0_1_BOT_5;
   input  B_D0_1_BOT_6;
   input  B_D0_1_BOT_7;
   input  B_D0_1_BOT_8;
   input  B_D0_1_BOT_9;
   input  B_D0_1_BOT_10;
   input  B_D0_1_BOT_11;
   input  B_D0_1_BOT_12;
   input  B_D0_1_BOT_13;
   input  B_D0_1_BOT_14;
   input  B_D0_1_BOT_15;
   input  B_D0_1_BOT_16;
   input  B_D0_1_BOT_17;
   input  B_BW0_1_BOT_0;
   input  B_BW0_1_BOT_1;
   input  B_CKW_1_BOT_0;
   input  B_CKR_1_BOT_0;
   input  B_CSW_1_BOT_0;
   input  B_CSR_1_BOT_0;
   input  MC1_1_BOT_0;
   input  MC1_1_BOT_1;
   input  MC1_1_BOT_9;
   input  MC1_1_BOT_12;
   input  MC1_1_BOT_13;
   input  MC1_1_BOT_19;
   input  MC1_1_BOT_22;
   input  A_AW0_2_BOT_0;
   input  A_AW0_2_BOT_1;
   input  A_AW0_2_BOT_2;
   input  A_AW0_2_BOT_3;
   input  A_AW0_2_BOT_4;
   input  A_AW0_2_BOT_5;
   input  A_AW0_2_BOT_6;
   input  A_AW0_2_BOT_7;
   input  A_AW0_2_BOT_8;
   input  A_AW0_2_BOT_9;
   input  A_AR0_2_BOT_0;
   input  A_AR0_2_BOT_1;
   input  A_AR0_2_BOT_2;
   input  A_AR0_2_BOT_3;
   input  A_AR0_2_BOT_4;
   input  A_AR0_2_BOT_5;
   input  A_AR0_2_BOT_6;
   input  A_AR0_2_BOT_7;
   input  A_AR0_2_BOT_8;
   input  A_AR0_2_BOT_9;
   input  A_D0_2_BOT_0;
   input  A_D0_2_BOT_1;
   input  A_D0_2_BOT_2;
   input  A_D0_2_BOT_3;
   input  A_D0_2_BOT_4;
   input  A_D0_2_BOT_5;
   input  A_D0_2_BOT_6;
   input  A_D0_2_BOT_7;
   input  A_D0_2_BOT_8;
   input  A_D0_2_BOT_9;
   input  A_D0_2_BOT_10;
   input  A_D0_2_BOT_11;
   input  A_D0_2_BOT_12;
   input  A_D0_2_BOT_13;
   input  A_D0_2_BOT_14;
   input  A_D0_2_BOT_15;
   input  A_D0_2_BOT_16;
   input  A_D0_2_BOT_17;
   input  A_BW0_2_BOT_0;
   input  A_BW0_2_BOT_1;
   input  A_CKW_2_BOT_0;
   input  A_CKR_2_BOT_0;
   input  A_CSW_2_BOT_0;
   input  A_CSR_2_BOT_0;
   input  B_AW0_2_BOT_0;
   input  B_AW0_2_BOT_1;
   input  B_AW0_2_BOT_2;
   input  B_AW0_2_BOT_3;
   input  B_AW0_2_BOT_4;
   input  B_AW0_2_BOT_5;
   input  B_AW0_2_BOT_6;
   input  B_AW0_2_BOT_7;
   input  B_AW0_2_BOT_8;
   input  B_AW0_2_BOT_9;
   input  B_AR0_2_BOT_0;
   input  B_AR0_2_BOT_1;
   input  B_AR0_2_BOT_2;
   input  B_AR0_2_BOT_3;
   input  B_AR0_2_BOT_4;
   input  B_AR0_2_BOT_5;
   input  B_AR0_2_BOT_6;
   input  B_AR0_2_BOT_7;
   input  B_AR0_2_BOT_8;
   input  B_AR0_2_BOT_9;
   input  B_D0_2_BOT_0;
   input  B_D0_2_BOT_1;
   input  B_D0_2_BOT_2;
   input  B_D0_2_BOT_3;
   input  B_D0_2_BOT_4;
   input  B_D0_2_BOT_5;
   input  B_D0_2_BOT_6;
   input  B_D0_2_BOT_7;
   input  B_D0_2_BOT_8;
   input  B_D0_2_BOT_9;
   input  B_D0_2_BOT_10;
   input  B_D0_2_BOT_11;
   input  B_D0_2_BOT_12;
   input  B_D0_2_BOT_13;
   input  B_D0_2_BOT_14;
   input  B_D0_2_BOT_15;
   input  B_D0_2_BOT_16;
   input  B_D0_2_BOT_17;
   input  B_BW0_2_BOT_0;
   input  B_BW0_2_BOT_1;
   input  B_CKW_2_BOT_0;
   input  B_CKR_2_BOT_0;
   input  B_CSW_2_BOT_0;
   input  B_CSR_2_BOT_0;
   input  MC1_2_BOT_0;
   input  MC1_2_BOT_1;
   input  MC1_2_BOT_9;
   input  MC1_2_BOT_12;
   input  MC1_2_BOT_13;
   input  MC1_2_BOT_19;
   input  MC1_2_BOT_22;
   input  A_AW0_3_BOT_0;
   input  A_AW0_3_BOT_1;
   input  A_AW0_3_BOT_2;
   input  A_AW0_3_BOT_3;
   input  A_AW0_3_BOT_4;
   input  A_AW0_3_BOT_5;
   input  A_AW0_3_BOT_6;
   input  A_AW0_3_BOT_7;
   input  A_AW0_3_BOT_8;
   input  A_AW0_3_BOT_9;
   input  A_AR0_3_BOT_0;
   input  A_AR0_3_BOT_1;
   input  A_AR0_3_BOT_2;
   input  A_AR0_3_BOT_3;
   input  A_AR0_3_BOT_4;
   input  A_AR0_3_BOT_5;
   input  A_AR0_3_BOT_6;
   input  A_AR0_3_BOT_7;
   input  A_AR0_3_BOT_8;
   input  A_AR0_3_BOT_9;
   input  A_D0_3_BOT_0;
   input  A_D0_3_BOT_1;
   input  A_D0_3_BOT_2;
   input  A_D0_3_BOT_3;
   input  A_D0_3_BOT_4;
   input  A_D0_3_BOT_5;
   input  A_D0_3_BOT_6;
   input  A_D0_3_BOT_7;
   input  A_D0_3_BOT_8;
   input  A_D0_3_BOT_9;
   input  A_D0_3_BOT_10;
   input  A_D0_3_BOT_11;
   input  A_D0_3_BOT_12;
   input  A_D0_3_BOT_13;
   input  A_D0_3_BOT_14;
   input  A_D0_3_BOT_15;
   input  A_D0_3_BOT_16;
   input  A_D0_3_BOT_17;
   input  A_BW0_3_BOT_0;
   input  A_BW0_3_BOT_1;
   input  A_CKW_3_BOT_0;
   input  A_CKR_3_BOT_0;
   input  A_CSW_3_BOT_0;
   input  A_CSR_3_BOT_0;
   input  B_AW0_3_BOT_0;
   input  B_AW0_3_BOT_1;
   input  B_AW0_3_BOT_2;
   input  B_AW0_3_BOT_3;
   input  B_AW0_3_BOT_4;
   input  B_AW0_3_BOT_5;
   input  B_AW0_3_BOT_6;
   input  B_AW0_3_BOT_7;
   input  B_AW0_3_BOT_8;
   input  B_AW0_3_BOT_9;
   input  B_AR0_3_BOT_0;
   input  B_AR0_3_BOT_1;
   input  B_AR0_3_BOT_2;
   input  B_AR0_3_BOT_3;
   input  B_AR0_3_BOT_4;
   input  B_AR0_3_BOT_5;
   input  B_AR0_3_BOT_6;
   input  B_AR0_3_BOT_7;
   input  B_AR0_3_BOT_8;
   input  B_AR0_3_BOT_9;
   input  B_D0_3_BOT_0;
   input  B_D0_3_BOT_1;
   input  B_D0_3_BOT_2;
   input  B_D0_3_BOT_3;
   input  B_D0_3_BOT_4;
   input  B_D0_3_BOT_5;
   input  B_D0_3_BOT_6;
   input  B_D0_3_BOT_7;
   input  B_D0_3_BOT_8;
   input  B_D0_3_BOT_9;
   input  B_D0_3_BOT_10;
   input  B_D0_3_BOT_11;
   input  B_D0_3_BOT_12;
   input  B_D0_3_BOT_13;
   input  B_D0_3_BOT_14;
   input  B_D0_3_BOT_15;
   input  B_D0_3_BOT_16;
   input  B_D0_3_BOT_17;
   input  B_BW0_3_BOT_0;
   input  B_BW0_3_BOT_1;
   input  B_CKW_3_BOT_0;
   input  B_CKR_3_BOT_0;
   input  B_CSW_3_BOT_0;
   input  B_CSR_3_BOT_0;
   input  MC1_3_BOT_0;
   input  MC1_3_BOT_1;
   input  MC1_3_BOT_9;
   input  MC1_3_BOT_12;
   input  MC1_3_BOT_13;
   input  MC1_3_BOT_19;
   input  MC1_3_BOT_22;
   input  HADDR_ASBI_0;
   input  HADDR_ASBI_1;
   input  HADDR_ASBI_2;
   input  HADDR_ASBI_3;
   input  HADDR_ASBI_4;
   input  HADDR_ASBI_5;
   input  HADDR_ASBI_6;
   input  HADDR_ASBI_7;
   input  HADDR_ASBI_8;
   input  HADDR_ASBI_9;
   input  HADDR_ASBI_10;
   input  HADDR_ASBI_11;
   input  HADDR_ASBI_12;
   input  HADDR_ASBI_13;
   input  HADDR_ASBI_14;
   input  HADDR_ASBI_15;
   input  HADDR_ASBI_16;
   input  HADDR_ASBI_17;
   input  HTRANS_ASBI_0;
   input  HTRANS_ASBI_1;
   input  HWRITE_ASBI;
   input  HSIZE_ASBI_0;
   input  HSIZE_ASBI_1;
   input  HBURST_ASBI;
   input  HWDATA_ASBI_0;
   input  HWDATA_ASBI_1;
   input  HWDATA_ASBI_2;
   input  HWDATA_ASBI_3;
   input  HWDATA_ASBI_4;
   input  HWDATA_ASBI_5;
   input  HWDATA_ASBI_6;
   input  HWDATA_ASBI_7;
   input  HWDATA_ASBI_8;
   input  HWDATA_ASBI_9;
   input  HWDATA_ASBI_10;
   input  HWDATA_ASBI_11;
   input  HWDATA_ASBI_12;
   input  HWDATA_ASBI_13;
   input  HWDATA_ASBI_14;
   input  HWDATA_ASBI_15;
   input  HWDATA_ASBI_16;
   input  HWDATA_ASBI_17;
   input  HWDATA_ASBI_18;
   input  HWDATA_ASBI_19;
   input  HWDATA_ASBI_20;
   input  HWDATA_ASBI_21;
   input  HWDATA_ASBI_22;
   input  HWDATA_ASBI_23;
   input  HWDATA_ASBI_24;
   input  HWDATA_ASBI_25;
   input  HWDATA_ASBI_26;
   input  HWDATA_ASBI_27;
   input  HWDATA_ASBI_28;
   input  HWDATA_ASBI_29;
   input  HWDATA_ASBI_30;
   input  HWDATA_ASBI_31;
   input  HWDATA_ASBI_32;
   input  HWDATA_ASBI_33;
   input  HWDATA_ASBI_34;
   input  HWDATA_ASBI_35;
   input  HBUSREQ_ASBI;
   input  HLOCK_ASBI;
   input  HRDATA_ASBI_0;
   input  HRDATA_ASBI_1;
   input  HRDATA_ASBI_2;
   input  HRDATA_ASBI_3;
   input  HRDATA_ASBI_4;
   input  HRDATA_ASBI_5;
   input  HRDATA_ASBI_6;
   input  HRDATA_ASBI_7;
   input  HRDATA_ASBI_8;
   input  HRDATA_ASBI_9;
   input  HRDATA_ASBI_10;
   input  HRDATA_ASBI_11;
   input  HRDATA_ASBI_12;
   input  HRDATA_ASBI_13;
   input  HRDATA_ASBI_14;
   input  HRDATA_ASBI_15;
   input  HRDATA_ASBI_16;
   input  HRDATA_ASBI_17;
   input  HRDATA_ASBI_18;
   input  HRDATA_ASBI_19;
   input  HRDATA_ASBI_20;
   input  HRDATA_ASBI_21;
   input  HRDATA_ASBI_22;
   input  HRDATA_ASBI_23;
   input  HRDATA_ASBI_24;
   input  HRDATA_ASBI_25;
   input  HRDATA_ASBI_26;
   input  HRDATA_ASBI_27;
   input  HRDATA_ASBI_28;
   input  HRDATA_ASBI_29;
   input  HRDATA_ASBI_30;
   input  HRDATA_ASBI_31;
   input  HRDATA_ASBI_32;
   input  HRDATA_ASBI_33;
   input  HRDATA_ASBI_34;
   input  HRDATA_ASBI_35;
   input  HREADY_OUT_ASBI;
   input  HRESP_ASBI_0;
   input  HRESP_ASBI_1;
   input  HCLK_FRA;
   input  GSR_FRA;
   input  ASB_EN_SLI;
   input  ASB_IRQ_MRI;
   input  ASB_IRQ_SLI;
   output HBURST_ASBO;
   output MPC_TA;
   output MPC_RETRY;
   output MPC_TEA;
   output MPC_RD_DATA_31;
   output MPC_RD_DATA_30;
   output MPC_RD_DATA_29;
   output MPC_RD_DATA_28;
   output MPC_RD_DATA_27;
   output MPC_RD_DATA_26;
   output MPC_RD_DATA_25;
   output MPC_RD_DATA_24;
   output MPC_RD_DATA_23;
   output MPC_RD_DATA_22;
   output MPC_RD_DATA_21;
   output MPC_RD_DATA_20;
   output MPC_RD_DATA_19;
   output MPC_RD_DATA_18;
   output MPC_RD_DATA_17;
   output MPC_RD_DATA_16;
   output MPC_RD_DATA_15;
   output MPC_RD_DATA_14;
   output MPC_RD_DATA_13;
   output MPC_RD_DATA_12;
   output MPC_RD_DATA_11;
   output MPC_RD_DATA_10;
   output MPC_RD_DATA_9;
   output MPC_RD_DATA_8;
   output MPC_RD_DATA_7;
   output MPC_RD_DATA_6;
   output MPC_RD_DATA_5;
   output MPC_RD_DATA_4;
   output MPC_RD_DATA_3;
   output MPC_RD_DATA_2;
   output MPC_RD_DATA_1;
   output MPC_RD_DATA_0;
   output PD2_0_TS;
   output PD7_3_TS;
   output PD15_8_TS;
   output PD31_16_TS;
   output MPC_RD_PARITY_3;
   output MPC_RD_PARITY_2;
   output MPC_RD_PARITY_1;
   output MPC_RD_PARITY_0;
   output MPC_DP_TS_0;
   output MPC_DP_TS_1;
   output MPC_DP_TS_2;
   output MPC_IRQ;
   output MPC_CNTL_TS;
   output USR_IRQ;
   output FMRDATA_0;
   output FMRDATA_1;
   output FMRDATA_2;
   output FMRDATA_3;
   output FMRDATA_4;
   output FMRDATA_5;
   output FMRDATA_6;
   output FMRDATA_7;
   output FMRDATA_8;
   output FMRDATA_9;
   output FMRDATA_10;
   output FMRDATA_11;
   output FMRDATA_12;
   output FMRDATA_13;
   output FMRDATA_14;
   output FMRDATA_15;
   output FMRDATA_16;
   output FMRDATA_17;
   output FMRDATA_18;
   output FMRDATA_19;
   output FMRDATA_20;
   output FMRDATA_21;
   output FMRDATA_22;
   output FMRDATA_23;
   output FMRDATA_24;
   output FMRDATA_25;
   output FMRDATA_26;
   output FMRDATA_27;
   output FMRDATA_28;
   output FMRDATA_29;
   output FMRDATA_30;
   output FMRDATA_31;
   output FMRDATA_32;
   output FMRDATA_33;
   output FMRDATA_34;
   output FMRDATA_35;
   output FMGRNTED;
   output FMACK;
   output FMRETRY;
   output FMERR;
   output FSWDATA_0;
   output FSWDATA_1;
   output FSWDATA_2;
   output FSWDATA_3;
   output FSWDATA_4;
   output FSWDATA_5;
   output FSWDATA_6;
   output FSWDATA_7;
   output FSWDATA_8;
   output FSWDATA_9;
   output FSWDATA_10;
   output FSWDATA_11;
   output FSWDATA_12;
   output FSWDATA_13;
   output FSWDATA_14;
   output FSWDATA_15;
   output FSWDATA_16;
   output FSWDATA_17;
   output FSWDATA_18;
   output FSWDATA_19;
   output FSWDATA_20;
   output FSWDATA_21;
   output FSWDATA_22;
   output FSWDATA_23;
   output FSWDATA_24;
   output FSWDATA_25;
   output FSWDATA_26;
   output FSWDATA_27;
   output FSWDATA_28;
   output FSWDATA_29;
   output FSWDATA_30;
   output FSWDATA_31;
   output FSWDATA_32;
   output FSWDATA_33;
   output FSWDATA_34;
   output FSWDATA_35;
   output FSADDR_0;
   output FSADDR_1;
   output FSADDR_2;
   output FSADDR_3;
   output FSADDR_4;
   output FSADDR_5;
   output FSADDR_6;
   output FSADDR_7;
   output FSADDR_8;
   output FSADDR_9;
   output FSADDR_10;
   output FSADDR_11;
   output FSADDR_12;
   output FSADDR_13;
   output FSADDR_14;
   output FSADDR_15;
   output FSADDR_16;
   output FSADDR_17;
   output FSBURST;
   output FSRDY;
   output FSWR;
   output FSSIZE_0;
   output FSSIZE_1;
   output A_Q0_0_TOP_0;
   output A_Q0_0_TOP_1;
   output A_Q0_0_TOP_2;
   output A_Q0_0_TOP_3;
   output A_Q0_0_TOP_4;
   output A_Q0_0_TOP_5;
   output A_Q0_0_TOP_6;
   output A_Q0_0_TOP_7;
   output A_Q0_0_TOP_8;
   output A_Q0_0_TOP_9;
   output A_Q0_0_TOP_10;
   output A_Q0_0_TOP_11;
   output A_Q0_0_TOP_12;
   output A_Q0_0_TOP_13;
   output A_Q0_0_TOP_14;
   output A_Q0_0_TOP_15;
   output A_Q0_0_TOP_16;
   output A_Q0_0_TOP_17;
   output B_Q0_0_TOP_0;
   output B_Q0_0_TOP_1;
   output B_Q0_0_TOP_2;
   output B_Q0_0_TOP_3;
   output B_Q0_0_TOP_4;
   output B_Q0_0_TOP_5;
   output B_Q0_0_TOP_6;
   output B_Q0_0_TOP_7;
   output B_Q0_0_TOP_8;
   output B_Q0_0_TOP_9;
   output B_Q0_0_TOP_10;
   output B_Q0_0_TOP_11;
   output B_Q0_0_TOP_12;
   output B_Q0_0_TOP_13;
   output B_Q0_0_TOP_14;
   output B_Q0_0_TOP_15;
   output B_Q0_0_TOP_16;
   output B_Q0_0_TOP_17;
   output A_BUSY0_0_TOP;
   output B_BUSY0_0_TOP;
   output A_Q0_1_TOP_0;
   output A_Q0_1_TOP_1;
   output A_Q0_1_TOP_2;
   output A_Q0_1_TOP_3;
   output A_Q0_1_TOP_4;
   output A_Q0_1_TOP_5;
   output A_Q0_1_TOP_6;
   output A_Q0_1_TOP_7;
   output A_Q0_1_TOP_8;
   output A_Q0_1_TOP_9;
   output A_Q0_1_TOP_10;
   output A_Q0_1_TOP_11;
   output A_Q0_1_TOP_12;
   output A_Q0_1_TOP_13;
   output A_Q0_1_TOP_14;
   output A_Q0_1_TOP_15;
   output A_Q0_1_TOP_16;
   output A_Q0_1_TOP_17;
   output B_Q0_1_TOP_0;
   output B_Q0_1_TOP_1;
   output B_Q0_1_TOP_2;
   output B_Q0_1_TOP_3;
   output B_Q0_1_TOP_4;
   output B_Q0_1_TOP_5;
   output B_Q0_1_TOP_6;
   output B_Q0_1_TOP_7;
   output B_Q0_1_TOP_8;
   output B_Q0_1_TOP_9;
   output B_Q0_1_TOP_10;
   output B_Q0_1_TOP_11;
   output B_Q0_1_TOP_12;
   output B_Q0_1_TOP_13;
   output B_Q0_1_TOP_14;
   output B_Q0_1_TOP_15;
   output B_Q0_1_TOP_16;
   output B_Q0_1_TOP_17;
   output A_BUSY0_1_TOP;
   output B_BUSY0_1_TOP;
   output A_Q0_2_TOP_0;
   output A_Q0_2_TOP_1;
   output A_Q0_2_TOP_2;
   output A_Q0_2_TOP_3;
   output A_Q0_2_TOP_4;
   output A_Q0_2_TOP_5;
   output A_Q0_2_TOP_6;
   output A_Q0_2_TOP_7;
   output A_Q0_2_TOP_8;
   output A_Q0_2_TOP_9;
   output A_Q0_2_TOP_10;
   output A_Q0_2_TOP_11;
   output A_Q0_2_TOP_12;
   output A_Q0_2_TOP_13;
   output A_Q0_2_TOP_14;
   output A_Q0_2_TOP_15;
   output A_Q0_2_TOP_16;
   output A_Q0_2_TOP_17;
   output B_Q0_2_TOP_0;
   output B_Q0_2_TOP_1;
   output B_Q0_2_TOP_2;
   output B_Q0_2_TOP_3;
   output B_Q0_2_TOP_4;
   output B_Q0_2_TOP_5;
   output B_Q0_2_TOP_6;
   output B_Q0_2_TOP_7;
   output B_Q0_2_TOP_8;
   output B_Q0_2_TOP_9;
   output B_Q0_2_TOP_10;
   output B_Q0_2_TOP_11;
   output B_Q0_2_TOP_12;
   output B_Q0_2_TOP_13;
   output B_Q0_2_TOP_14;
   output B_Q0_2_TOP_15;
   output B_Q0_2_TOP_16;
   output B_Q0_2_TOP_17;
   output A_BUSY0_2_TOP;
   output B_BUSY0_2_TOP;
   output A_Q0_3_TOP_0;
   output A_Q0_3_TOP_1;
   output A_Q0_3_TOP_2;
   output A_Q0_3_TOP_3;
   output A_Q0_3_TOP_4;
   output A_Q0_3_TOP_5;
   output A_Q0_3_TOP_6;
   output A_Q0_3_TOP_7;
   output A_Q0_3_TOP_8;
   output A_Q0_3_TOP_9;
   output A_Q0_3_TOP_10;
   output A_Q0_3_TOP_11;
   output A_Q0_3_TOP_12;
   output A_Q0_3_TOP_13;
   output A_Q0_3_TOP_14;
   output A_Q0_3_TOP_15;
   output A_Q0_3_TOP_16;
   output A_Q0_3_TOP_17;
   output B_Q0_3_TOP_0;
   output B_Q0_3_TOP_1;
   output B_Q0_3_TOP_2;
   output B_Q0_3_TOP_3;
   output B_Q0_3_TOP_4;
   output B_Q0_3_TOP_5;
   output B_Q0_3_TOP_6;
   output B_Q0_3_TOP_7;
   output B_Q0_3_TOP_8;
   output B_Q0_3_TOP_9;
   output B_Q0_3_TOP_10;
   output B_Q0_3_TOP_11;
   output B_Q0_3_TOP_12;
   output B_Q0_3_TOP_13;
   output B_Q0_3_TOP_14;
   output B_Q0_3_TOP_15;
   output B_Q0_3_TOP_16;
   output B_Q0_3_TOP_17;
   output A_BUSY0_3_TOP;
   output B_BUSY0_3_TOP;
   output A_Q0_0_BOT_0;
   output A_Q0_0_BOT_1;
   output A_Q0_0_BOT_2;
   output A_Q0_0_BOT_3;
   output A_Q0_0_BOT_4;
   output A_Q0_0_BOT_5;
   output A_Q0_0_BOT_6;
   output A_Q0_0_BOT_7;
   output A_Q0_0_BOT_8;
   output A_Q0_0_BOT_9;
   output A_Q0_0_BOT_10;
   output A_Q0_0_BOT_11;
   output A_Q0_0_BOT_12;
   output A_Q0_0_BOT_13;
   output A_Q0_0_BOT_14;
   output A_Q0_0_BOT_15;
   output A_Q0_0_BOT_16;
   output A_Q0_0_BOT_17;
   output B_Q0_0_BOT_0;
   output B_Q0_0_BOT_1;
   output B_Q0_0_BOT_2;
   output B_Q0_0_BOT_3;
   output B_Q0_0_BOT_4;
   output B_Q0_0_BOT_5;
   output B_Q0_0_BOT_6;
   output B_Q0_0_BOT_7;
   output B_Q0_0_BOT_8;
   output B_Q0_0_BOT_9;
   output B_Q0_0_BOT_10;
   output B_Q0_0_BOT_11;
   output B_Q0_0_BOT_12;
   output B_Q0_0_BOT_13;
   output B_Q0_0_BOT_14;
   output B_Q0_0_BOT_15;
   output B_Q0_0_BOT_16;
   output B_Q0_0_BOT_17;
   output A_BUSY0_0_BOT;
   output B_BUSY0_0_BOT;
   output A_Q0_1_BOT_0;
   output A_Q0_1_BOT_1;
   output A_Q0_1_BOT_2;
   output A_Q0_1_BOT_3;
   output A_Q0_1_BOT_4;
   output A_Q0_1_BOT_5;
   output A_Q0_1_BOT_6;
   output A_Q0_1_BOT_7;
   output A_Q0_1_BOT_8;
   output A_Q0_1_BOT_9;
   output A_Q0_1_BOT_10;
   output A_Q0_1_BOT_11;
   output A_Q0_1_BOT_12;
   output A_Q0_1_BOT_13;
   output A_Q0_1_BOT_14;
   output A_Q0_1_BOT_15;
   output A_Q0_1_BOT_16;
   output A_Q0_1_BOT_17;
   output B_Q0_1_BOT_0;
   output B_Q0_1_BOT_1;
   output B_Q0_1_BOT_2;
   output B_Q0_1_BOT_3;
   output B_Q0_1_BOT_4;
   output B_Q0_1_BOT_5;
   output B_Q0_1_BOT_6;
   output B_Q0_1_BOT_7;
   output B_Q0_1_BOT_8;
   output B_Q0_1_BOT_9;
   output B_Q0_1_BOT_10;
   output B_Q0_1_BOT_11;
   output B_Q0_1_BOT_12;
   output B_Q0_1_BOT_13;
   output B_Q0_1_BOT_14;
   output B_Q0_1_BOT_15;
   output B_Q0_1_BOT_16;
   output B_Q0_1_BOT_17;
   output A_BUSY0_1_BOT;
   output B_BUSY0_1_BOT;
   output A_Q0_2_BOT_0;
   output A_Q0_2_BOT_1;
   output A_Q0_2_BOT_2;
   output A_Q0_2_BOT_3;
   output A_Q0_2_BOT_4;
   output A_Q0_2_BOT_5;
   output A_Q0_2_BOT_6;
   output A_Q0_2_BOT_7;
   output A_Q0_2_BOT_8;
   output A_Q0_2_BOT_9;
   output A_Q0_2_BOT_10;
   output A_Q0_2_BOT_11;
   output A_Q0_2_BOT_12;
   output A_Q0_2_BOT_13;
   output A_Q0_2_BOT_14;
   output A_Q0_2_BOT_15;
   output A_Q0_2_BOT_16;
   output A_Q0_2_BOT_17;
   output B_Q0_2_BOT_0;
   output B_Q0_2_BOT_1;
   output B_Q0_2_BOT_2;
   output B_Q0_2_BOT_3;
   output B_Q0_2_BOT_4;
   output B_Q0_2_BOT_5;
   output B_Q0_2_BOT_6;
   output B_Q0_2_BOT_7;
   output B_Q0_2_BOT_8;
   output B_Q0_2_BOT_9;
   output B_Q0_2_BOT_10;
   output B_Q0_2_BOT_11;
   output B_Q0_2_BOT_12;
   output B_Q0_2_BOT_13;
   output B_Q0_2_BOT_14;
   output B_Q0_2_BOT_15;
   output B_Q0_2_BOT_16;
   output B_Q0_2_BOT_17;
   output A_BUSY0_2_BOT;
   output B_BUSY0_2_BOT;
   output A_Q0_3_BOT_0;
   output A_Q0_3_BOT_1;
   output A_Q0_3_BOT_2;
   output A_Q0_3_BOT_3;
   output A_Q0_3_BOT_4;
   output A_Q0_3_BOT_5;
   output A_Q0_3_BOT_6;
   output A_Q0_3_BOT_7;
   output A_Q0_3_BOT_8;
   output A_Q0_3_BOT_9;
   output A_Q0_3_BOT_10;
   output A_Q0_3_BOT_11;
   output A_Q0_3_BOT_12;
   output A_Q0_3_BOT_13;
   output A_Q0_3_BOT_14;
   output A_Q0_3_BOT_15;
   output A_Q0_3_BOT_16;
   output A_Q0_3_BOT_17;
   output B_Q0_3_BOT_0;
   output B_Q0_3_BOT_1;
   output B_Q0_3_BOT_2;
   output B_Q0_3_BOT_3;
   output B_Q0_3_BOT_4;
   output B_Q0_3_BOT_5;
   output B_Q0_3_BOT_6;
   output B_Q0_3_BOT_7;
   output B_Q0_3_BOT_8;
   output B_Q0_3_BOT_9;
   output B_Q0_3_BOT_10;
   output B_Q0_3_BOT_11;
   output B_Q0_3_BOT_12;
   output B_Q0_3_BOT_13;
   output B_Q0_3_BOT_14;
   output B_Q0_3_BOT_15;
   output B_Q0_3_BOT_16;
   output B_Q0_3_BOT_17;
   output A_BUSY0_3_BOT;
   output B_BUSY0_3_BOT;
   output HCLK_MR_ASBO;
   output HRESET_N_MR_ASBO;
   output HREADY_ASBO;
   output HRESP_ASBO_0;
   output HRESP_ASBO_1;
   output HGRANT_ASBO;
   output HRDATA_ASBO_0;
   output HRDATA_ASBO_1;
   output HRDATA_ASBO_2;
   output HRDATA_ASBO_3;
   output HRDATA_ASBO_4;
   output HRDATA_ASBO_5;
   output HRDATA_ASBO_6;
   output HRDATA_ASBO_7;
   output HRDATA_ASBO_8;
   output HRDATA_ASBO_9;
   output HRDATA_ASBO_10;
   output HRDATA_ASBO_11;
   output HRDATA_ASBO_12;
   output HRDATA_ASBO_13;
   output HRDATA_ASBO_14;
   output HRDATA_ASBO_15;
   output HRDATA_ASBO_16;
   output HRDATA_ASBO_17;
   output HRDATA_ASBO_18;
   output HRDATA_ASBO_19;
   output HRDATA_ASBO_20;
   output HRDATA_ASBO_21;
   output HRDATA_ASBO_22;
   output HRDATA_ASBO_23;
   output HRDATA_ASBO_24;
   output HRDATA_ASBO_25;
   output HRDATA_ASBO_26;
   output HRDATA_ASBO_27;
   output HRDATA_ASBO_28;
   output HRDATA_ASBO_29;
   output HRDATA_ASBO_30;
   output HRDATA_ASBO_31;
   output HRDATA_ASBO_32;
   output HRDATA_ASBO_33;
   output HRDATA_ASBO_34;
   output HRDATA_ASBO_35;
   output HCLK_SL_ASBO;
   output HRESET_N_SL_ASBO;
   output HADDR_ASBO_0;
   output HADDR_ASBO_1;
   output HADDR_ASBO_2;
   output HADDR_ASBO_3;
   output HADDR_ASBO_4;
   output HADDR_ASBO_5;
   output HADDR_ASBO_6;
   output HADDR_ASBO_7;
   output HADDR_ASBO_8;
   output HADDR_ASBO_9;
   output HADDR_ASBO_10;
   output HADDR_ASBO_11;
   output HADDR_ASBO_12;
   output HADDR_ASBO_13;
   output HADDR_ASBO_14;
   output HADDR_ASBO_15;
   output HADDR_ASBO_16;
   output HADDR_ASBO_17;
   output HTRANS_ASBO_0;
   output HTRANS_ASBO_1;
   output HWRITE_ASBO;
   output HSIZE_ASBO_0;
   output HSIZE_ASBO_1;
   output HWDATA_ASBO_0;
   output HWDATA_ASBO_1;
   output HWDATA_ASBO_2;
   output HWDATA_ASBO_3;
   output HWDATA_ASBO_4;
   output HWDATA_ASBO_5;
   output HWDATA_ASBO_6;
   output HWDATA_ASBO_7;
   output HWDATA_ASBO_8;
   output HWDATA_ASBO_9;
   output HWDATA_ASBO_10;
   output HWDATA_ASBO_11;
   output HWDATA_ASBO_12;
   output HWDATA_ASBO_13;
   output HWDATA_ASBO_14;
   output HWDATA_ASBO_15;
   output HWDATA_ASBO_16;
   output HWDATA_ASBO_17;
   output HWDATA_ASBO_18;
   output HWDATA_ASBO_19;
   output HWDATA_ASBO_20;
   output HWDATA_ASBO_21;
   output HWDATA_ASBO_22;
   output HWDATA_ASBO_23;
   output HWDATA_ASBO_24;
   output HWDATA_ASBO_25;
   output HWDATA_ASBO_26;
   output HWDATA_ASBO_27;
   output HWDATA_ASBO_28;
   output HWDATA_ASBO_29;
   output HWDATA_ASBO_30;
   output HWDATA_ASBO_31;
   output HWDATA_ASBO_32;
   output HWDATA_ASBO_33;
   output HWDATA_ASBO_34;
   output HWDATA_ASBO_35;
   output HSEL_ASBO;
   output HREADY_IN_ASBO;
   output ASB_IRQ_TOA;
   output PWRUPRES_TOA;
   output INITN_TOA;
   output TRIIO_TOA;
   output DONE_TOA;
   output GSRN_TOA;
endmodule


module ULIS (
              RDATA0,
              RDATA1,
              RDATA2,
              RDATA3,
              RDATA4,
              RDATA5,
              RDATA6,
              RDATA7,
              RDATA8,
              RDATA9,
              RDATA10,
              RDATA11,
              RDATA12,
              RDATA13,
              RDATA14,
              RDATA15,
              RDATA16,
              RDATA17,
              RDATA18,
              RDATA19,
              RDATA20,
              RDATA21,
              RDATA22,
              RDATA23,
              RDATA24,
              RDATA25,
              RDATA26,
              RDATA27,
              RDATA28,
              RDATA29,
              RDATA30,
              RDATA31,
              RDATA32,
              RDATA33,
              RDATA34,
              RDATA35,
              CLK,
              RESET,
              ACK,
              RETRY,
              ERR,
              IRQ,
              SWDATA0,
              SWDATA1,
              SWDATA2,
              SWDATA3,
              SWDATA4,
              SWDATA5,
              SWDATA6,
              SWDATA7,
              SWDATA8,
              SWDATA9,
              SWDATA10,
              SWDATA11,
              SWDATA12,
              SWDATA13,
              SWDATA14,
              SWDATA15,
              SWDATA16,
              SWDATA17,
              SWDATA18,
              SWDATA19,
              SWDATA20,
              SWDATA21,
              SWDATA22,
              SWDATA23,
              SWDATA24,
              SWDATA25,
              SWDATA26,
              SWDATA27,
              SWDATA28,
              SWDATA29,
              SWDATA30,
              SWDATA31,
              SWDATA32,
              SWDATA33,
              SWDATA34,
              SWDATA35,
              SADDR0,
              SADDR1,
              SADDR2,
              SADDR3,
              SADDR4,
              SADDR5,
              SADDR6,
              SADDR7,
              SADDR8,
              SADDR9,
              SADDR10,
              SADDR11,
              SADDR12,
              SADDR13,
              SADDR14,
              SADDR15,
              SADDR16,
              SADDR17,
              SBURST,
              SRDY,
              SWR,
              SSIZE0,
              SSIZE1,
              WDATA0,
              WDATA1,
              WDATA2,
              WDATA3,
              WDATA4,
              WDATA5,
              WDATA6,
              WDATA7,
              WDATA8,
              WDATA9,
              WDATA10,
              WDATA11,
              WDATA12,
              WDATA13,
              WDATA14,
              WDATA15,
              WDATA16,
              WDATA17,
              WDATA18,
              WDATA19,
              WDATA20,
              WDATA21,
              WDATA22,
              WDATA23,
              WDATA24,
              WDATA25,
              WDATA26,
              WDATA27,
              WDATA28,
              WDATA29,
              WDATA30,
              WDATA31,
              WDATA32,
              WDATA33,
              WDATA34,
              WDATA35,
              ADDR0,
              ADDR1,
              ADDR2,
              ADDR3,
              ADDR4,
              ADDR5,
              ADDR6,
              ADDR7,
              ADDR8,
              ADDR9,
              ADDR10,
              ADDR11,
              ADDR12,
              ADDR13,
              ADDR14,
              ADDR15,
              ADDR16,
              ADDR17,
              BURST,
              RDY,
              WR,
              SIZE0,
              SIZE1,
              SRDATA0,
              SRDATA1,
              SRDATA2,
              SRDATA3,
              SRDATA4,
              SRDATA5,
              SRDATA6,
              SRDATA7,
              SRDATA8,
              SRDATA9,
              SRDATA10,
              SRDATA11,
              SRDATA12,
              SRDATA13,
              SRDATA14,
              SRDATA15,
              SRDATA16,
              SRDATA17,
              SRDATA18,
              SRDATA19,
              SRDATA20,
              SRDATA21,
              SRDATA22,
              SRDATA23,
              SRDATA24,
              SRDATA25,
              SRDATA26,
              SRDATA27,
              SRDATA28,
              SRDATA29,
              SRDATA30,
              SRDATA31,
              SRDATA32,
              SRDATA33,
              SRDATA34,
              SRDATA35,
              SCLK,
              SRESET,
              SACK,
              SRETRY,
              SERR,
              SIRQ
              ) /* synthesis syn_black_box */;
   input  RDATA0;
   input  RDATA1;
   input  RDATA2;
   input  RDATA3;
   input  RDATA4;
   input  RDATA5;
   input  RDATA6;
   input  RDATA7;
   input  RDATA8;
   input  RDATA9;
   input  RDATA10;
   input  RDATA11;
   input  RDATA12;
   input  RDATA13;
   input  RDATA14;
   input  RDATA15;
   input  RDATA16;
   input  RDATA17;
   input  RDATA18;
   input  RDATA19;
   input  RDATA20;
   input  RDATA21;
   input  RDATA22;
   input  RDATA23;
   input  RDATA24;
   input  RDATA25;
   input  RDATA26;
   input  RDATA27;
   input  RDATA28;
   input  RDATA29;
   input  RDATA30;
   input  RDATA31;
   input  RDATA32;
   input  RDATA33;
   input  RDATA34;
   input  RDATA35;
   input  CLK;
   input  RESET;
   input  ACK;
   input  RETRY;
   input  ERR;
   input  IRQ;
   input  SWDATA0;
   input  SWDATA1;
   input  SWDATA2;
   input  SWDATA3;
   input  SWDATA4;
   input  SWDATA5;
   input  SWDATA6;
   input  SWDATA7;
   input  SWDATA8;
   input  SWDATA9;
   input  SWDATA10;
   input  SWDATA11;
   input  SWDATA12;
   input  SWDATA13;
   input  SWDATA14;
   input  SWDATA15;
   input  SWDATA16;
   input  SWDATA17;
   input  SWDATA18;
   input  SWDATA19;
   input  SWDATA20;
   input  SWDATA21;
   input  SWDATA22;
   input  SWDATA23;
   input  SWDATA24;
   input  SWDATA25;
   input  SWDATA26;
   input  SWDATA27;
   input  SWDATA28;
   input  SWDATA29;
   input  SWDATA30;
   input  SWDATA31;
   input  SWDATA32;
   input  SWDATA33;
   input  SWDATA34;
   input  SWDATA35;
   input  SADDR0;
   input  SADDR1;
   input  SADDR2;
   input  SADDR3;
   input  SADDR4;
   input  SADDR5;
   input  SADDR6;
   input  SADDR7;
   input  SADDR8;
   input  SADDR9;
   input  SADDR10;
   input  SADDR11;
   input  SADDR12;
   input  SADDR13;
   input  SADDR14;
   input  SADDR15;
   input  SADDR16;
   input  SADDR17;
   input  SBURST;
   input  SRDY;
   input  SWR;
   input  SSIZE0;
   input  SSIZE1;
   output WDATA0;
   output WDATA1;
   output WDATA2;
   output WDATA3;
   output WDATA4;
   output WDATA5;
   output WDATA6;
   output WDATA7;
   output WDATA8;
   output WDATA9;
   output WDATA10;
   output WDATA11;
   output WDATA12;
   output WDATA13;
   output WDATA14;
   output WDATA15;
   output WDATA16;
   output WDATA17;
   output WDATA18;
   output WDATA19;
   output WDATA20;
   output WDATA21;
   output WDATA22;
   output WDATA23;
   output WDATA24;
   output WDATA25;
   output WDATA26;
   output WDATA27;
   output WDATA28;
   output WDATA29;
   output WDATA30;
   output WDATA31;
   output WDATA32;
   output WDATA33;
   output WDATA34;
   output WDATA35;
   output ADDR0;
   output ADDR1;
   output ADDR2;
   output ADDR3;
   output ADDR4;
   output ADDR5;
   output ADDR6;
   output ADDR7;
   output ADDR8;
   output ADDR9;
   output ADDR10;
   output ADDR11;
   output ADDR12;
   output ADDR13;
   output ADDR14;
   output ADDR15;
   output ADDR16;
   output ADDR17;
   output BURST;
   output RDY;
   output WR;
   output SIZE0;
   output SIZE1;
   output SRDATA0;
   output SRDATA1;
   output SRDATA2;
   output SRDATA3;
   output SRDATA4;
   output SRDATA5;
   output SRDATA6;
   output SRDATA7;
   output SRDATA8;
   output SRDATA9;
   output SRDATA10;
   output SRDATA11;
   output SRDATA12;
   output SRDATA13;
   output SRDATA14;
   output SRDATA15;
   output SRDATA16;
   output SRDATA17;
   output SRDATA18;
   output SRDATA19;
   output SRDATA20;
   output SRDATA21;
   output SRDATA22;
   output SRDATA23;
   output SRDATA24;
   output SRDATA25;
   output SRDATA26;
   output SRDATA27;
   output SRDATA28;
   output SRDATA29;
   output SRDATA30;
   output SRDATA31;
   output SRDATA32;
   output SRDATA33;
   output SRDATA34;
   output SRDATA35;
   output SCLK;
   output SRESET;
   output SACK;
   output SRETRY;
   output SERR;
   output SIRQ;
endmodule

module ULIM (
              ADDR0,
              ADDR1,
              ADDR2,
              ADDR3,
              ADDR4,
              ADDR5,
              ADDR6,
              ADDR7,
              ADDR8,
              ADDR9,
              ADDR10,
              ADDR11,
              ADDR12,
              ADDR13,
              ADDR14,
              ADDR15,
              ADDR16,
              ADDR17,
              WDATA0,
              WDATA1,
              WDATA2,
              WDATA3,
              WDATA4,
              WDATA5,
              WDATA6,
              WDATA7,
              WDATA8,
              WDATA9,
              WDATA10,
              WDATA11,
              WDATA12,
              WDATA13,
              WDATA14,
              WDATA15,
              WDATA16,
              WDATA17,
              WDATA18,
              WDATA19,
              WDATA20,
              WDATA21,
              WDATA22,
              WDATA23,
              WDATA24,
              WDATA25,
              WDATA26,
              WDATA27,
              WDATA28,
              WDATA29,
              WDATA30,
              WDATA31,
              WDATA32,
              WDATA33,
              WDATA34,
              WDATA35,
              CLK,
              RESET,
              WRITE,
              READ,
              BURST,
              RDY,
              SIZE0,
              SIZE1,
              LOCK,
              IRQ,
              SRDATA0,
              SRDATA1,
              SRDATA2,
              SRDATA3,
              SRDATA4,
              SRDATA5,
              SRDATA6,
              SRDATA7,
              SRDATA8,
              SRDATA9,
              SRDATA10,
              SRDATA11,
              SRDATA12,
              SRDATA13,
              SRDATA14,
              SRDATA15,
              SRDATA16,
              SRDATA17,
              SRDATA18,
              SRDATA19,
              SRDATA20,
              SRDATA21,
              SRDATA22,
              SRDATA23,
              SRDATA24,
              SRDATA25,
              SRDATA26,
              SRDATA27,
              SRDATA28,
              SRDATA29,
              SRDATA30,
              SRDATA31,
              SRDATA32,
              SRDATA33,
              SRDATA34,
              SRDATA35,
              SGRANTED,
              SACK,
              SRETRY,
              SERR,
              RDATA0,
              RDATA1,
              RDATA2,
              RDATA3,
              RDATA4,
              RDATA5,
              RDATA6,
              RDATA7,
              RDATA8,
              RDATA9,
              RDATA10,
              RDATA11,
              RDATA12,
              RDATA13,
              RDATA14,
              RDATA15,
              RDATA16,
              RDATA17,
              RDATA18,
              RDATA19,
              RDATA20,
              RDATA21,
              RDATA22,
              RDATA23,
              RDATA24,
              RDATA25,
              RDATA26,
              RDATA27,
              RDATA28,
              RDATA29,
              RDATA30,
              RDATA31,
              RDATA32,
              RDATA33,
              RDATA34,
              RDATA35,
              GRANTED,
              ACK,
              RETRY,
              ERR,
              SADDR0,
              SADDR1,
              SADDR2,
              SADDR3,
              SADDR4,
              SADDR5,
              SADDR6,
              SADDR7,
              SADDR8,
              SADDR9,
              SADDR10,
              SADDR11,
              SADDR12,
              SADDR13,
              SADDR14,
              SADDR15,
              SADDR16,
              SADDR17,
              SWDATA0,
              SWDATA1,
              SWDATA2,
              SWDATA3,
              SWDATA4,
              SWDATA5,
              SWDATA6,
              SWDATA7,
              SWDATA8,
              SWDATA9,
              SWDATA10,
              SWDATA11,
              SWDATA12,
              SWDATA13,
              SWDATA14,
              SWDATA15,
              SWDATA16,
              SWDATA17,
              SWDATA18,
              SWDATA19,
              SWDATA20,
              SWDATA21,
              SWDATA22,
              SWDATA23,
              SWDATA24,
              SWDATA25,
              SWDATA26,
              SWDATA27,
              SWDATA28,
              SWDATA29,
              SWDATA30,
              SWDATA31,
              SWDATA32,
              SWDATA33,
              SWDATA34,
              SWDATA35,
              SCLK,
              SRESET,
              SWRITE,
              SREAD,
              SBURST,
              SRDY,
              SSIZE0,
              SSIZE1,
              SLOCK,
              SIRQ
              ) /* synthesis syn_black_box */;
   input  ADDR0;
   input  ADDR1;
   input  ADDR2;
   input  ADDR3;
   input  ADDR4;
   input  ADDR5;
   input  ADDR6;
   input  ADDR7;
   input  ADDR8;
   input  ADDR9;
   input  ADDR10;
   input  ADDR11;
   input  ADDR12;
   input  ADDR13;
   input  ADDR14;
   input  ADDR15;
   input  ADDR16;
   input  ADDR17;
   input  WDATA0;
   input  WDATA1;
   input  WDATA2;
   input  WDATA3;
   input  WDATA4;
   input  WDATA5;
   input  WDATA6;
   input  WDATA7;
   input  WDATA8;
   input  WDATA9;
   input  WDATA10;
   input  WDATA11;
   input  WDATA12;
   input  WDATA13;
   input  WDATA14;
   input  WDATA15;
   input  WDATA16;
   input  WDATA17;
   input  WDATA18;
   input  WDATA19;
   input  WDATA20;
   input  WDATA21;
   input  WDATA22;
   input  WDATA23;
   input  WDATA24;
   input  WDATA25;
   input  WDATA26;
   input  WDATA27;
   input  WDATA28;
   input  WDATA29;
   input  WDATA30;
   input  WDATA31;
   input  WDATA32;
   input  WDATA33;
   input  WDATA34;
   input  WDATA35;
   input  CLK;
   input  RESET;
   input  WRITE;
   input  READ;
   input  BURST;
   input  RDY;
   input  SIZE0;
   input  SIZE1;
   input  LOCK;
   input  IRQ;
   input  SRDATA0;
   input  SRDATA1;
   input  SRDATA2;
   input  SRDATA3;
   input  SRDATA4;
   input  SRDATA5;
   input  SRDATA6;
   input  SRDATA7;
   input  SRDATA8;
   input  SRDATA9;
   input  SRDATA10;
   input  SRDATA11;
   input  SRDATA12;
   input  SRDATA13;
   input  SRDATA14;
   input  SRDATA15;
   input  SRDATA16;
   input  SRDATA17;
   input  SRDATA18;
   input  SRDATA19;
   input  SRDATA20;
   input  SRDATA21;
   input  SRDATA22;
   input  SRDATA23;
   input  SRDATA24;
   input  SRDATA25;
   input  SRDATA26;
   input  SRDATA27;
   input  SRDATA28;
   input  SRDATA29;
   input  SRDATA30;
   input  SRDATA31;
   input  SRDATA32;
   input  SRDATA33;
   input  SRDATA34;
   input  SRDATA35;
   input  SGRANTED;
   input  SACK;
   input  SRETRY;
   input  SERR;
   output RDATA0;
   output RDATA1;
   output RDATA2;
   output RDATA3;
   output RDATA4;
   output RDATA5;
   output RDATA6;
   output RDATA7;
   output RDATA8;
   output RDATA9;
   output RDATA10;
   output RDATA11;
   output RDATA12;
   output RDATA13;
   output RDATA14;
   output RDATA15;
   output RDATA16;
   output RDATA17;
   output RDATA18;
   output RDATA19;
   output RDATA20;
   output RDATA21;
   output RDATA22;
   output RDATA23;
   output RDATA24;
   output RDATA25;
   output RDATA26;
   output RDATA27;
   output RDATA28;
   output RDATA29;
   output RDATA30;
   output RDATA31;
   output RDATA32;
   output RDATA33;
   output RDATA34;
   output RDATA35;
   output GRANTED;
   output ACK;
   output RETRY;
   output ERR;
   output SADDR0;
   output SADDR1;
   output SADDR2;
   output SADDR3;
   output SADDR4;
   output SADDR5;
   output SADDR6;
   output SADDR7;
   output SADDR8;
   output SADDR9;
   output SADDR10;
   output SADDR11;
   output SADDR12;
   output SADDR13;
   output SADDR14;
   output SADDR15;
   output SADDR16;
   output SADDR17;
   output SWDATA0;
   output SWDATA1;
   output SWDATA2;
   output SWDATA3;
   output SWDATA4;
   output SWDATA5;
   output SWDATA6;
   output SWDATA7;
   output SWDATA8;
   output SWDATA9;
   output SWDATA10;
   output SWDATA11;
   output SWDATA12;
   output SWDATA13;
   output SWDATA14;
   output SWDATA15;
   output SWDATA16;
   output SWDATA17;
   output SWDATA18;
   output SWDATA19;
   output SWDATA20;
   output SWDATA21;
   output SWDATA22;
   output SWDATA23;
   output SWDATA24;
   output SWDATA25;
   output SWDATA26;
   output SWDATA27;
   output SWDATA28;
   output SWDATA29;
   output SWDATA30;
   output SWDATA31;
   output SWDATA32;
   output SWDATA33;
   output SWDATA34;
   output SWDATA35;
   output SCLK;
   output SRESET;
   output SWRITE;
   output SREAD;
   output SBURST;
   output SRDY;
   output SSIZE0;
   output SSIZE1;
   output SLOCK;
   output SIRQ;
endmodule
module PLLDFB (CLKIN, ECLK, SCLK, LOCK);// synthesis syn_black_box  syn_noprune=1
input     CLKIN;
output    ECLK, SCLK, LOCK;
endmodule
module PLLDFT (CLKIN, ECLK, SCLK, LOCK);// synthesis syn_black_box  syn_noprune=1
input     CLKIN;
output    ECLK, SCLK, LOCK;
endmodule
module HIODDRN (IND0, IND1, IND2, IND3, OUT1D0, OUT1D1, OUT2D0, OUT2D1, 
              OUT3D0, OUT3D1, OUT4D0, OUT4D1, CK, IN1Q0, IN1Q1, IN2Q0, IN2Q1, 
              IN3Q0, IN3Q1, IN4Q0, IN4Q1, OUTQ0, OUTQ1, OUTQ2, OUTQ3)/* synthesis syn_black_box */;


input  IND0, IND1, IND2, IND3, OUT1D0, OUT1D1, OUT2D0, OUT2D1;
input  OUT3D0, OUT3D1, OUT4D0, OUT4D1, CK;
output IN1Q0, IN1Q1, IN2Q0, IN2Q1, IN3Q0, IN3Q1;
output IN4Q0, IN4Q1, OUTQ0, OUTQ1, OUTQ2, OUTQ3;
endmodule

