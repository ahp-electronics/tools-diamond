//
// Copyright (c) 1994 - 2003 Synplicity Inc
// $Header: //synplicity/map202003lat/mappers/att/lib/orca3.v#1 $
//


module SWLBUF(I, O); // synthesis syn_black_box
input I;
output O;
endmodule

module SWLMX(D0, D1, SD, Z); // synthesis syn_black_box
input D0;
input D1;
input SD;
output Z;
endmodule

module SWL4(A, B, C, D, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
output Z;
endmodule

module SWL5(A, B, C, D, E, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule

module XOR5(A, B, C, D, E, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module XOR4(A, B, C, D, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
output Z;
endmodule
module XOR21(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, Z); // synthesis syn_black_box
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
module XOR2(A, B, Z); // synthesis syn_black_box
input A;
input B;
output Z;
endmodule
module XOR11(A, B, C, D, E, F, G, H, I, J, K, Z); // synthesis syn_black_box
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
module XNOR5(A, B, C, D, E, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module XNOR4(A, B, C, D, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
output Z;
endmodule
module XNOR3(A, B, C, Z); // synthesis syn_black_box
input A;
input B;
input C;
output Z;
endmodule
module XNOR2(A, B, Z); // synthesis syn_black_box
input A;
input B;
output Z;
endmodule
module VLO(Z); // synthesis syn_black_box
output Z;
endmodule
module VHI(Z); // synthesis syn_black_box
output Z;
endmodule
module TSALL(TSALL); // synthesis syn_black_box .noprune=1
input TSALL;
endmodule
module TIBUF(I, T, O); // synthesis syn_black_box
input I;
input T;
output O /* synthesis syn_tristate=1 */;
endmodule
module TBUF(I, T, O); // synthesis syn_black_box
input I;
input T;
output O /* synthesis syn_tristate=1 */;
endmodule
module STRTUP(UCLK); // synthesis syn_black_box
input UCLK;
endmodule
module SOR8(A, B, C, D, E, F, G, H, Z); // synthesis syn_black_box
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
module SOR6(A, B, C, D, E, F, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
input E;
input F;
output Z;
endmodule
module SOR4(A, B, C, D, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
output Z;
endmodule
module SOR2(A, B, Z); // synthesis syn_black_box
input A;
input B;
output Z;
endmodule
module SOR10(A, B, C, D, E, F, G, H, I, J, Z); // synthesis syn_black_box
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
module SAOI442(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, Z); // synthesis syn_black_box
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
module SAOI44(A1, A2, A3, A4, B1, B2, B3, B4, Z); // synthesis syn_black_box
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
module SAOI42(A1, A2, A3, A4, B1, B2, Z); // synthesis syn_black_box
input A1;
input A2;
input A3;
input A4;
input B1;
input B2;
output Z;
endmodule
module SAND8(A, B, C, D, E, F, G, H, Z); // synthesis syn_black_box
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
module SAND6(A, B, C, D, E, F, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
input E;
input F;
output Z;
endmodule
module SAND4(A, B, C, D, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
output Z;
endmodule
module SAND2(A, B, Z); // synthesis syn_black_box
input A;
input B;
output Z;
endmodule
module SAND10(A, B, C, D, E, F, G, H, I, J, Z); // synthesis syn_black_box
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
module ROM32X4(AD0, AD1, AD2, AD3, AD4, CK, DO0, DO1, DO2, DO3, QDO0, QDO1, QDO2, QDO3); // synthesis syn_black_box
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
module ROM32X1(AD0, AD1, AD2, AD3, AD4, DO0); // synthesis syn_black_box
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
output DO0;
endmodule
module ROM16X1(AD0, AD1, AD2, AD3, DO0); // synthesis syn_black_box
input AD0;
input AD1;
input AD2;
input AD3;
output DO0;
endmodule
module READBK(RDCFGN, CAPT, PRDDATA, RDBO); // synthesis syn_black_box .noprune=1
input RDCFGN;
input CAPT;
output PRDDATA;
output RDBO;
endmodule
module RCE32X4(AD0, AD1, AD2, AD3, AD4, DI0, DI1, DI2, DI3, CK, WREN, WPE0, WPE1, DO0, DO1, DO2, DO3, QDO0, QDO1, QDO2, QDO3); // synthesis syn_black_box
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
module PLLT(CLKIN, FB, ECLK, SCLK, LOCK); // synthesis syn_black_box  syn_noprune=1
input CLKIN;
input FB;
output ECLK;
output SCLK;
output LOCK;
endmodule
module PLLB(CLKIN, FB, ECLK, SCLK, LOCK); // synthesis syn_black_box  syn_noprune=1
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
             ); // synthesis syn_black_box

input     CLKIN, FB, WE, RE, A2, A1, A0;
input     DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0;
output    DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0;
output    ECLK, SCLK, LOCK;
endmodule
module PCMT (CLKIN, FB, WE, RE, A2, A1, A0,
             DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0,
             DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0,
             ECLK, SCLK, LOCK
             ); //synthesis syn_black_box
input     CLKIN, FB, WE, RE, A2, A1, A0;
input     DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0;
output    DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0;
output    ECLK, SCLK, LOCK;
endmodule
module PFUMX(ALUT, BLUT, C0, Z); // synthesis syn_black_box
input ALUT;
input BLUT;
input C0;
output Z;
endmodule
module PCMBUFT(CLKIN, ECLK, SCLK); // synthesis syn_black_box
input CLKIN;
output ECLK;
output SCLK;
endmodule
module PCMBUFB(CLKIN, ECLK, SCLK); // synthesis syn_black_box
input CLKIN;
output ECLK;
output SCLK;
endmodule
module OSXOR2(A, SCLK, Z); // synthesis syn_black_box
input A;
input SCLK;
output Z;
endmodule
module OSXNOR2(A, SCLK, Z); // synthesis syn_black_box
input A;
input SCLK;
output Z;
endmodule
module OSOR2(A, SCLK, Z); // synthesis syn_black_box
input A;
input SCLK;
output Z;
endmodule
module OSNR2(A, SCLK, Z); // synthesis syn_black_box
input A;
input SCLK;
output Z;
endmodule
module OSND2(A, SCLK, Z); // synthesis syn_black_box
input A;
input SCLK;
output Z;
endmodule
module OSMUX21(D0, D1, SCLK, Z); // synthesis syn_black_box
input D0;
input D1;
input SCLK;
output Z;
endmodule
module OSCIL(TEST, OSC); // synthesis syn_black_box
input TEST;
output OSC;
endmodule
module OSAND2(A, SCLK, Z); // synthesis syn_black_box
input A;
input SCLK;
output Z;
endmodule
module OR5(A, B, C, D, E, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module OR4(A, B, C, D, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
output Z;
endmodule
module OR2(A, B, Z); // synthesis syn_black_box
input A;
input B;
output Z;
endmodule
module OFS1P3JZ(D, SP, SCLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module OFS1P3JX(D, SP, SCLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module OFS1P3IZ(D, SP, SCLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module OFS1P3IX(D, SP, SCLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module OFS1P3DX(D, SP, SCLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module OFS1P3BX(D, SP, SCLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module OFE1P3JZ(D, SP, ECLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input PD;
output Q; 
endmodule
module OFE1P3JX(D, SP, ECLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input PD;
output Q;
endmodule
module OFE1P3IZ(D, SP, ECLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input CD;
output Q;
endmodule
module OFE1P3IX(D, SP, ECLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input CD;
output Q;
endmodule
module OFE1P3DX(D, SP, ECLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input CD;
output Q;
endmodule
module OFE1P3BX(D, SP, ECLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input PD;
output Q;
endmodule
module OEXOR2(A, ECLK, Z); // synthesis syn_black_box
input A;
input ECLK;
output Z;
endmodule
module OEXNOR2(A, ECLK, Z); // synthesis syn_black_box
input A;
input ECLK;
output Z;
endmodule
module OEOR2(A, ECLK, Z); // synthesis syn_black_box
input A;
input ECLK;
output Z;
endmodule
module OENR2(A, ECLK, Z); // synthesis syn_black_box
input A;
input ECLK;
output Z;
endmodule
module OEND2(A, ECLK, Z); // synthesis syn_black_box
input A;
input ECLK;
output Z;
endmodule
module OEMUX21(D0, D1, ECLK, Z); // synthesis syn_black_box
input D0;
input D1;
input ECLK;
output Z;
endmodule
module OEAND2(A, ECLK, Z); // synthesis syn_black_box
input A;
input ECLK;
output Z;
endmodule
module OBZ6PU(I, T, O); // synthesis syn_black_box
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ6PD(I, T, O); // synthesis syn_black_box
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ6(I, T, O); // synthesis syn_black_box
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12PU(I, T, O); // synthesis syn_black_box
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12PD(I, T, O); // synthesis syn_black_box
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12FPU(I, T, O); // synthesis syn_black_box
input I;
input T;
output O;
endmodule
module OBZ12FPD(I, T, O); // synthesis syn_black_box
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12F(I, T, O); // synthesis syn_black_box
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12(I, T, O); // synthesis syn_black_box
input I;
input T;
output O /* synthesis .ispad=1 */;
endmodule
module OB6(I, O); // synthesis syn_black_box
input I;
output O /* synthesis .ispad=1 */;
endmodule
module OB12F(I, O); // synthesis syn_black_box
input I;
output O /* synthesis .ispad=1 */;
endmodule
module OB12(I, O); // synthesis syn_black_box
input I;
output O /* synthesis .ispad=1 */;
endmodule
module NR5(A, B, C, D, E, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module NR4(A, B, C, D, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
output Z;
endmodule
module NR3(A, B, C, Z); // synthesis syn_black_box
input A;
input B;
input C;
output Z;
endmodule
module NR2(A, B, Z); // synthesis syn_black_box
input A;
input B;
output Z;
endmodule
module ND5(A, B, C, D, E, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module ND4(A, B, C, D, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
output Z;
endmodule
module ND3(A, B, C, Z); // synthesis syn_black_box
input A;
input B;
input C;
output Z;
endmodule
module ND2(A, B, Z); // synthesis syn_black_box
input A;
input B;
output Z;
endmodule
module MUX41E(D0, D1, D2, D3, SD1, SD2, E, Z); // synthesis syn_black_box
input D0;
input D1;
input D2;
input D3;
input SD1;
input SD2;
input E;
output Z;
endmodule
module MUX41(D0, D1, D2, D3, SD1, SD2, Z); // synthesis syn_black_box
input D0;
input D1;
input D2;
input D3;
input SD1;
input SD2;
output Z;
endmodule
module MUX21E(D0, D1, SD, E, Z); // synthesis syn_black_box
input D0;
input D1;
input SD;
input E;
output Z;
endmodule
module MUX21(D0, D1, SD, Z); // synthesis syn_black_box
input D0;
input D1;
input SD;
output Z;
endmodule
module MPIPPC(CLK, CS0N, CS1, RDWRN, TSN, A27, A28, A29, A30, A31, DIN7, DIN6, DIN5, DIN4, DIN3, DIN2, DIN1, DIN0, UEND, UIRQN, UDOUT7, UDOUT6, UDOUT5, UDOUT4, UDOUT3, UDOUT2, UDOUT1, UDOUT0, IRQN, BIN, DDRVCTL, TAN, TANTS, DOUT7, DOUT6, DOUT5, DOUT4, DOUT3, DOUT2, DOUT1, DOUT0, MPGSR, URDWRN, USTART, UA3, UA2, UA1, UA0, UDIN7, UDIN6, UDIN5, UDIN4, UDIN3, UDIN2, UDIN1, UDIN0); // synthesis syn_black_box
input CLK;
input CS0N;
input CS1;
input RDWRN;
input TSN;
input A27;
input A28;
input A29;
input A30;
input A31;
input DIN7;
input DIN6;
input DIN5;
input DIN4;
input DIN3;
input DIN2;
input DIN1;
input DIN0;
input UEND;
input UIRQN;
input UDOUT7;
input UDOUT6;
input UDOUT5;
input UDOUT4;
input UDOUT3;
input UDOUT2;
input UDOUT1;
input UDOUT0;
output IRQN;
output BIN;
output DDRVCTL;
output TAN;
output TANTS;
output DOUT7;
output DOUT6;
output DOUT5;
output DOUT4;
output DOUT3;
output DOUT2;
output DOUT1;
output DOUT0;
output MPGSR;
output URDWRN;
output USTART;
output UA3;
output UA2;
output UA1;
output UA0;
output UDIN7;
output UDIN6;
output UDIN5;
output UDIN4;
output UDIN3;
output UDIN2;
output UDIN1;
output UDIN0;
endmodule
module MPI960(CLK, CS0N, CS1, WRRDN, ADSN, ALE, ADIN7, ADIN6, ADIN5, ADIN4, ADIN3, ADIN2, ADIN1, ADIN0, BE1N, BE0N, RRCVNIN, UEND, UIRQN, UDOUT7, UDOUT6, UDOUT5, UDOUT4, UDOUT3, UDOUT2, UDOUT1, UDOUT0, IRQN, DDRVCTL, RDYRCVN, RDRCVTS, DOUT7, DOUT6, DOUT5, DOUT4, DOUT3, DOUT2, DOUT1, DOUT0, MPGSR, URDWRN, USTART, UA3, UA2, UA1, UA0, UDIN7, UDIN6, UDIN5, UDIN4, UDIN3, UDIN2, UDIN1, UDIN0); // synthesis syn_black_box
input CLK;
input CS0N;
input CS1;
input WRRDN;
input ADSN;
input ALE;
input ADIN7;
input ADIN6;
input ADIN5;
input ADIN4;
input ADIN3;
input ADIN2;
input ADIN1;
input ADIN0;
input BE1N;
input BE0N;
input RRCVNIN;
input UEND;
input UIRQN;
input UDOUT7;
input UDOUT6;
input UDOUT5;
input UDOUT4;
input UDOUT3;
input UDOUT2;
input UDOUT1;
input UDOUT0;
output IRQN;
output DDRVCTL;
output RDYRCVN;
output RDRCVTS;
output DOUT7;
output DOUT6;
output DOUT5;
output DOUT4;
output DOUT3;
output DOUT2;
output DOUT1;
output DOUT0;
output MPGSR;
output URDWRN;
output USTART;
output UA3;
output UA2;
output UA1;
output UA0;
output UDIN7;
output UDIN6;
output UDIN5;
output UDIN4;
output UDIN3;
output UDIN2;
output UDIN1;
output UDIN0;
endmodule
module LU8P3JX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LU8P3IX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LU8P3DX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LU8P3BX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LU4P3JX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LU4P3IX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LU4P3DX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LU4P3BX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LU4P3AY(D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LU4P3AX(D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LD8P3JX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LD8P3IX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LD8P3DX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LD8P3BX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LD4P3JX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LD4P3IX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LD4P3DX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LD4P3BX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LD4P3AY(D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LD4P3AX(D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LB8P3JX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LB8P3IX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LB8P3DX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, CD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LB8P3BX(D0, D1, D2, D3, D4, D5, D6, D7, CI, SP, CK, SD, PD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module LB4P3JX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LB4P3IX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LB4P3DX(D0, D1, D2, D3, CI, SP, CK, SD, CD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LB4P3BX(D0, D1, D2, D3, CI, SP, CK, SD, PD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LB4P3AY(D0, D1, D2, D3, CI, SP, CK, SD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module LB4P3AX(D0, D1, D2, D3, CI, SP, CK, SD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module INV(A, Z); // synthesis syn_black_box
input A;
output Z;
endmodule
module INCDEC8(CI, PC0, PC1, PC2, PC3, PC4, PC5, PC6, PC7, CON, CO, NC0, NC1, NC2, NC3, NC4, NC5, NC6, NC7); // synthesis syn_black_box
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
module INCDEC4(CI, PC0, PC1, PC2, PC3, CON, CO, NC0, NC1, NC2, NC3); // synthesis syn_black_box
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
module INC8(CI, PC0, PC1, PC2, PC3, PC4, PC5, PC6, PC7, CO, NC0, NC1, NC2, NC3, NC4, NC5, NC6, NC7); // synthesis syn_black_box
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
module INC4(CI, PC0, PC1, PC2, PC3, CO, NC0, NC1, NC2, NC3); // synthesis syn_black_box
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
module ILF2P3JZ(D, SP, ECLK, SCLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input SCLK;
input PD;
output Q;
endmodule
module ILF2P3JX(D, SP, ECLK, SCLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input SCLK;
input PD;
output Q;
endmodule
module ILF2P3IZ(D, SP, ECLK, SCLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input SCLK;
input CD;
output Q;
endmodule
module ILF2P3IX(D, SP, ECLK, SCLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input SCLK;
input CD;
output Q;
endmodule
module ILF2P3DX(D, SP, ECLK, SCLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input SCLK;
input CD;
output Q;
endmodule
module ILF2P3BX(D, SP, ECLK, SCLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input ECLK;
input SCLK;
input PD;
output Q;
endmodule
module IFS1S1J(D, SCLK, PD, Q); // synthesis syn_black_box
input D;
input SCLK;
input PD;
output Q;
endmodule
module IFS1S1I(D, SCLK, CD, Q); // synthesis syn_black_box
input D;
input SCLK;
input CD;
output Q;
endmodule
module IFS1S1D(D, SCLK, CD, Q); // synthesis syn_black_box
input D;
input SCLK;
input CD;
output Q;
endmodule
module IFS1S1B(D, SCLK, PD, Q); // synthesis syn_black_box
input D;
input SCLK;
input PD;
output Q;
endmodule
module IFS1P3JZ(D, SP, SCLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module IFS1P3JX(D, SP, SCLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module IFS1P3IZ(D, SP, SCLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module IFS1P3IX(D, SP, SCLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module IFS1P3DX(D, SP, SCLK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input CD;
output Q;
endmodule
module IFS1P3BX(D, SP, SCLK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input SCLK;
input PD;
output Q;
endmodule
module IBTS(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPUS(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPU(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPDS(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPD(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBT(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMS(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPUS(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPU(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPDS(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPD(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBM(I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module FSUB8O(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, BI, OFL, S0, S1, S2, S3, S4, S5, S6, S7); // synthesis syn_black_box
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
module FSUB8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, BI, BO, S0, S1, S2, S3, S4, S5, S6, S7); // synthesis syn_black_box
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
module FSUB4O(A0, A1, A2, A3, B0, B1, B2, B3, BI, OFL, S0, S1, S2, S3); // synthesis syn_black_box
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
module FSUB4(A0, A1, A2, A3, B0, B1, B2, B3, BI, BO, S0, S1, S2, S3); // synthesis syn_black_box
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
module FMULT81(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, MULT, CI, CO, P0, P1, P2, P3, P4, P5, P6, P7); // synthesis syn_black_box
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
module FMULT41(A0, A1, A2, A3, B0, B1, B2, B3, MULT, CI, CO, P0, P1, P2, P3); // synthesis syn_black_box
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
module XOR3(A, B, C, Z); // synthesis syn_black_box
input A;
input B;
input C;
output Z;
endmodule
module OR3(A, B, C, Z); // synthesis syn_black_box
input A;
input B;
input C;
output Z;
endmodule
module FL1S3AY(D0, D1, CK, SD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input CK;
input SD;
output Q;
output QN;
endmodule
module FL1S3AX(D0, D1, CK, SD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input CK;
input SD;
output Q;
output QN;
endmodule
module FL1S1J(D0, D1, CK, SD, PD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input CK;
input SD;
input PD;
output Q;
output QN;
endmodule
module FL1S1I(D0, D1, CK, SD, CD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input CK;
input SD;
input CD;
output Q;
output QN;
endmodule
module FL1S1D(D0, D1, CK, SD, CD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input CK;
input SD;
input CD;
output Q;
output QN;
endmodule
module FL1S1B(D0, D1, CK, SD, PD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input CK;
input SD;
input PD;
output Q;
output QN;
endmodule
module FL1S1AY(D0, D1, CK, SD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input CK;
input SD;
output Q;
output QN;
endmodule
module FL1S1A(D0, D1, CK, SD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input CK;
input SD;
output Q;
output QN;
endmodule
module FL1P3JZ(D0, D1, SP, CK, SD, PD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input SP;
input CK;
input SD;
input PD;
output Q;
output QN;
endmodule
module FL1P3JY(D0, D1, SP, CK, SD, PD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input SP;
input CK;
input SD;
input PD;
output Q;
output QN;
endmodule
module FL1P3IZ(D0, D1, SP, CK, SD, CD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input SP;
input CK;
input SD;
input CD;
output Q;
output QN;
endmodule
module FL1P3IY(D0, D1, SP, CK, SD, CD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input SP;
input CK;
input SD;
input CD;
output Q;
output QN;
endmodule
module FL1P3DX(D0, D1, SP, CK, SD, CD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input SP;
input CK;
input SD;
input CD;
output Q;
output QN;
endmodule
module FL1P3BX(D0, D1, SP, CK, SD, PD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input SP;
input CK;
input SD;
input PD;
output Q;
output QN;
endmodule
module FL1P3AZ(D0, D1, SP, CK, SD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input SP;
input CK;
input SD;
output Q;
output QN;
endmodule
module FL1P3AY(D0, D1, SP, CK, SD, Q, QN); // synthesis syn_black_box
input D0;
input D1;
input SP;
input CK;
input SD;
output Q;
output QN;
endmodule
module FD1S3JX(D, CK, PD, Q, QN); // synthesis syn_black_box
input D;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1S3IX(D, CK, CD, Q, QN); // synthesis syn_black_box
input D;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1S3DX(D, CK, CD, Q, QN); // synthesis syn_black_box
input D;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1S3BX(D, CK, PD, Q, QN); // synthesis syn_black_box
input D;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1S3AY(D, CK, Q, QN); // synthesis syn_black_box
input D;
input CK;
output Q;
output QN;
endmodule
module FD1S3AX(D, CK, Q, QN); // synthesis syn_black_box
input D;
input CK;
output Q;
output QN;
endmodule
module FD1S1J(D, CK, PD, Q, QN); // synthesis syn_black_box
input D;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1S1I(D, CK, CD, Q, QN); // synthesis syn_black_box
input D;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1S1D(D, CK, CD, Q, QN); // synthesis syn_black_box
input D;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1S1B(D, CK, PD, Q, QN); // synthesis syn_black_box
input D;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1S1AY(D, CK, Q, QN); // synthesis syn_black_box
input D;
input CK;
output Q;
output QN;
endmodule
module FD1S1A(D, CK, Q, QN); // synthesis syn_black_box
input D;
input CK;
output Q;
output QN;
endmodule
module FD1P3JZ(D, SP, CK, PD, Q, QN); // synthesis syn_black_box
input D;
input SP;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1P3JX(D, SP, CK, PD, Q, QN); // synthesis syn_black_box
input D;
input SP;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1P3IZ(D, SP, CK, CD, Q, QN); // synthesis syn_black_box
input D;
input SP;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1P3IX(D, SP, CK, CD, Q, QN); // synthesis syn_black_box
input D;
input SP;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1P3DX(D, SP, CK, CD, Q, QN); // synthesis syn_black_box
input D;
input SP;
input CK;
input CD;
output Q;
output QN;
endmodule
module FD1P3BX(D, SP, CK, PD, Q, QN); // synthesis syn_black_box
input D;
input SP;
input CK;
input PD;
output Q;
output QN;
endmodule
module FD1P3AY(D, SP, CK, Q, QN); // synthesis syn_black_box
input D;
input SP;
input CK;
output Q;
output QN;
endmodule
module FADSU8O(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, BCI, CON, OFL, S0, S1, S2, S3, S4, S5, S6, S7); // synthesis syn_black_box
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
module FADSU8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, BCI, CON, BCO, S0, S1, S2, S3, S4, S5, S6, S7); // synthesis syn_black_box
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
module FADSU4O(A0, A1, A2, A3, B0, B1, B2, B3, BCI, CON, OFL, S0, S1, S2, S3); // synthesis syn_black_box
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
module FADSU4(A0, A1, A2, A3, B0, B1, B2, B3, BCI, CON, BCO, S0, S1, S2, S3); // synthesis syn_black_box
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
module FADD8O(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, CI, OFL, S0, S1, S2, S3, S4, S5, S6, S7); // synthesis syn_black_box
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
module FADD8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, CI, CO, S0, S1, S2, S3, S4, S5, S6, S7); // synthesis syn_black_box
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
module FADD4O(A0, A1, A2, A3, B0, B1, B2, B3, CI, OFL, S0, S1, S2, S3); // synthesis syn_black_box
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
module FADD4(A0, A1, A2, A3, B0, B1, B2, B3, CI, CO, S0, S1, S2, S3); // synthesis syn_black_box
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
module DLLPDT(CLKIN, ECLK, SCLK, LOCK); // synthesis syn_black_box
input CLKIN;
output ECLK;
output SCLK;
output LOCK;
endmodule
module DLLPDB(CLKIN, ECLK, SCLK, LOCK); // synthesis syn_black_box
input CLKIN;
output ECLK;
output SCLK;
output LOCK;
endmodule
module DLL2XT(CLKIN, ECLK, SCLK, LOCK); // synthesis syn_black_box
input CLKIN;
output ECLK;
output SCLK;
output LOCK;
endmodule
module DLL2XB(CLKIN, ECLK, SCLK, LOCK); // synthesis syn_black_box
input CLKIN;
output ECLK;
output SCLK;
output LOCK;
endmodule
module DLL1XT(CLKIN, ECLK, SCLK, LOCK); // synthesis syn_black_box
input CLKIN;
output ECLK;
output SCLK;
output LOCK;
endmodule
module DLL1XB(CLKIN, ECLK, SCLK, LOCK); // synthesis syn_black_box
input CLKIN;
output ECLK;
output SCLK;
output LOCK;
endmodule
module DEC8(CI, PC0, PC1, PC2, PC3, PC4, PC5, PC6, PC7, CO, NC0, NC1, NC2, NC3, NC4, NC5, NC6, NC7); // synthesis syn_black_box
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
module DEC4(CI, PC0, PC1, PC2, PC3, CO, NC0, NC1, NC2, NC3); // synthesis syn_black_box
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
module DCE32X4(WAD0, WAD1, WAD2, WAD3, WAD4, DI0, DI1, DI2, DI3, CK, WREN, WPE0, WPE1, RAD0, RAD1, RAD2, RAD3, RAD4, DO0, DO1, DO2, DO3, QDO0, QDO1, QDO2, QDO3); // synthesis syn_black_box
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
module CU8P3JX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CU8P3IX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CU8P3DX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CU8P3BX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CU4P3JX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CU4P3IX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CU4P3DX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CU4P3BX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CU4(CI, PC0, PC1, PC2, PC3, CO, NC0, NC1, NC2, NC3); // synthesis syn_black_box
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
module CLKCNTLT(CLKIN, SHUTOFF, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
output CLKOUT;
endmodule
module CLKCNTLT_PUR(CLKIN, SHUTOFF, PUR, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
input PUR;
output CLKOUT;
endmodule
module CLKCNTLR(CLKIN, SHUTOFF, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
output CLKOUT;
endmodule
module CLKCNTLR_PUR(CLKIN, SHUTOFF, PUR, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
input PUR;
output CLKOUT;
endmodule
module CLKCNTLL(CLKIN, SHUTOFF, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
output CLKOUT;
endmodule
module CLKCNTLL_PUR(CLKIN, SHUTOFF, PUR, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
input PUR;
output CLKOUT;
endmodule
module CLKCNTLB(CLKIN, SHUTOFF, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
output CLKOUT;
endmodule
module CLKCNTLB_PUR(CLKIN, SHUTOFF, PUR, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
input PUR;
output CLKOUT;
endmodule
module CLKCNTHT(CLKIN, SHUTOFF, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
output CLKOUT;
endmodule
module CLKCNTHT_PUR(CLKIN, SHUTOFF, PUR, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
input PUR;
output CLKOUT;
endmodule
module CLKCNTHR(CLKIN, SHUTOFF, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
output CLKOUT;
endmodule
module CLKCNTHR_PUR(CLKIN, SHUTOFF, PUR, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
input PUR;
output CLKOUT;
endmodule
module CLKCNTHL(CLKIN, SHUTOFF, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
output CLKOUT;
endmodule
module CLKCNTHL_PUR(CLKIN, SHUTOFF, PUR, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
input PUR;
output CLKOUT;
endmodule
module CLKCNTHB(CLKIN, SHUTOFF, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
output CLKOUT;
endmodule
module CLKCNTHB_PUR(CLKIN, SHUTOFF, PUR, CLKOUT); // synthesis syn_black_box
input CLKIN;
input SHUTOFF;
input PUR;
output CLKOUT;
endmodule
module CFD1P3JZ(D, SP, CK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input CK;
input PD;
output Q;
endmodule
module CFD1P3JX(D, SP, CK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input CK;
input PD;
output Q;
endmodule
module CFD1P3IZ(D, SP, CK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input CK;
input CD;
output Q;
endmodule
module CFD1P3IX(D, SP, CK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input CK;
input CD;
output Q;
endmodule
module CFD1P3DX(D, SP, CK, CD, Q); // synthesis syn_black_box
input D;
input SP;
input CK;
input CD;
output Q;
endmodule
module CFD1P3BX(D, SP, CK, PD, Q); // synthesis syn_black_box
input D;
input SP;
input CK;
input PD;
output Q;
endmodule
module CD8P3JX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CD8P3IX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CD8P3DX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CD8P3BX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CD4P3JX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CD4P3IX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CD4P3DX(CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CD4P3BX(CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CD4(CI, PC0, PC1, PC2, PC3, CO, NC0, NC1, NC2, NC3); // synthesis syn_black_box
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
module CB8P3JX(CI, SP, CK, PD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CB8P3IX(CI, SP, CK, CD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CB8P3DX(CI, SP, CK, CD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CB8P3BX(CI, SP, CK, PD, CON, CO, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7); // synthesis syn_black_box
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
module CB4P3JX(CI, SP, CK, PD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CB4P3IX(CI, SP, CK, CD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CB4P3DX(CI, SP, CK, CD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CB4P3BX(CI, SP, CK, PD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
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
module CB4(CI, PC0, PC1, PC2, PC3, CON, CO, NC0, NC1, NC2, NC3); // synthesis syn_black_box
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
module BTZ6PU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ6PD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ6(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12PU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12PD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12FPU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12FPD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12F(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS6PU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS6PD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS6(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12PU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12PD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12FPU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12FPD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12F(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTS12(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ6PU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ6PD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ6(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12PU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12PD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12FPU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12FPD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12F(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS6PU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS6PD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS6(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12PU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12PD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12FPU(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12FPD(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12F(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMS12(I, T, O, B); // synthesis syn_black_box
input I;
input T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module ANEB8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, CI, NE); // synthesis syn_black_box
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
module ANEB4(A0, A1, A2, A3, B0, B1, B2, B3, CI, NE); // synthesis syn_black_box
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
module AND5(A, B, C, D, E, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
input E;
output Z;
endmodule
module AND4(A, B, C, D, Z); // synthesis syn_black_box
input A;
input B;
input C;
input D;
output Z;
endmodule
module AND3(A, B, C, Z); // synthesis syn_black_box
input A;
input B;
input C;
output Z;
endmodule
module AND2(A, B, Z); // synthesis syn_black_box
input A;
input B;
output Z;
endmodule
module ALEB8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, CI, LE); // synthesis syn_black_box
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
module ALEB4(A0, A1, A2, A3, B0, B1, B2, B3, CI, LE); // synthesis syn_black_box
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
module AGEB8(A0, A1, A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, CI, GE); // synthesis syn_black_box
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
module AGEB4(A0, A1, A2, A3, B0, B1, B2, B3, CI, GE); // synthesis syn_black_box
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
module PUR(PUR); // synthesis syn_black_box
input PUR;
endmodule
module FD1P3AX(D, SP, CK, Q, QN); // synthesis syn_black_box
input D;
input SP;
input CK;
output Q;
output QN;
endmodule
module GSR(GSR); // synthesis syn_black_box syn_noprune=1
input GSR;
endmodule
module BNDSCAN (PTDI, PTMS, PTCK, BSO1, BSO2, TDI, TCK, BSEN1, BSEN2, TDO); // synthesis syn_black_box syn_noprune=1
input PTDI, PTMS, PTCK, BSO1, BSO2;
output TDI, TCK, BSEN1, BSEN2, TDO;
endmodule
module BUFBA (A, Z); // synthesis syn_black_box
input A;
output Z;
endmodule
module INTRBUF (ASBI, TOASB, TOASBM1, TOASBM2, TOASBM3, FRASB, ASBO, ASBM1O, ASBM2O, ASBM3O); // synthesis syn_black_box
input ASBI;
input TOASB;
input TOASBM1;
input TOASBM2;
input TOASBM3;
output FRASB;
output ASBO;
output ASBM1O;
output ASBM2O;
output ASBM3O;
endmodule
module INTRBUFS (ASBI, TOASB, TOASBM1, TOASBM2, TOASBM3, FRASB, ASBO, ASBM1O, ASBM2O, ASBM3O); // synthesis syn_black_box
input ASBI;
input TOASB;
input TOASBM1;
input TOASBM2;
input TOASBM3;
output FRASB;
output ASBO;
output ASBM1O;
output ASBM2O;
output ASBM3O;
endmodule
module TOASBCK (CKTOASB, ASBCKO); // synthesis syn_black_box
input CKTOASB;
output ASBCKO;
endmodule
module FRASBCK (ASBCKI, CKFRASB); // synthesis syn_black_box
input ASBCKI;
output CKFRASB;
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

