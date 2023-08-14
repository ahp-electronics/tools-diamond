//
// Copyright (c) 1994 - 2003 Synplicity Inc
// $Header: //synplicity/map202003lat/mappers/att/lib/orca2.v#1 $
//

//
// Include this file at the top of the source file
// list when you want to directly instantiate ORCA library
// primitives in your verilog source.
//
module ADD (A, B, CI, CO, S); // synthesis syn_black_box
input A, B, CI;
output CO, S;
endmodule
module ADSU (A, B, BCI, CON, BCO, S); // synthesis syn_black_box
input A, B, BCI, CON;
output BCO, S;
endmodule
module AND2 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module AND2B1 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module AND2B2 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module AND3 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module AND3B1 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module AND3B2 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module AND3B3 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module AND4 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module AND4B1 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module AND4B2 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module AND4B3 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module AND4B4 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module AND5 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module AND5B1 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module AND5B2 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module AND5B3 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module AND5B4 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module AND5B5 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module AND6 (A, B, C, D, E, F, Z); // synthesis syn_black_box
input A, B, C, D, E, F;
output Z;
endmodule
module AOI21 (A1, A2, B, Z); // synthesis syn_black_box
input A1, A2, B;
output Z;
endmodule
module AOI211 (A1, A2, B, C, Z); // synthesis syn_black_box
input A1, A2, B, C;
output Z;
endmodule
module AOI2111 (A1, A2, B, C, D, Z); // synthesis syn_black_box
input A1, A2, B, C, D;
output Z;
endmodule
module AOI22 (A1, A2, B1, B2, Z); // synthesis syn_black_box
input A1, A2, B1, B2;
output Z;
endmodule
module AOI221 (A1, A2, B1, B2, C, Z); // synthesis syn_black_box
input A1, A2, B1, B2, C;
output Z;
endmodule
module AOI2211 (A1, A2, B1, B2, C, D, Z); // synthesis syn_black_box
input A1, A2, B1, B2, C, D;
output Z;
endmodule
module AOI222 (A1, A2, B1, B2, C1, C2, Z); // synthesis syn_black_box
input A1, A2, B1, B2, C1, C2;
output Z;
endmodule
module AOI31 (A1, A2, A3, B, Z); // synthesis syn_black_box
input A1, A2, A3, B;
output Z;
endmodule
module AOI311 (A1, A2, A3, B, C, Z); // synthesis syn_black_box
input A1, A2, A3, B, C;
output Z;
endmodule
module AOI3111 (A1, A2, A3, B, C, D, Z); // synthesis syn_black_box
input A1, A2, A3, B, C, D;
output Z;
endmodule
module AOI32 (A1, A2, A3, B1, B2, Z); // synthesis syn_black_box
input A1, A2, A3, B1, B2;
output Z;
endmodule
module AOI321 (A1, A2, A3, B1, B2, C, Z); // synthesis syn_black_box
input A1, A2, A3, B1, B2, C;
output Z;
endmodule
module AOI33 (A1, A2, A3, B1, B2, B3, Z); // synthesis syn_black_box
input A1, A2, A3, B1, B2, B3;
output Z;
endmodule
module AOI41 (A1, A2, A3, A4, B, Z); // synthesis syn_black_box
input A1, A2, A3, A4, B;
output Z;
endmodule
module AOI411 (A1, A2, A3, A4, B, C, Z); // synthesis syn_black_box
input A1, A2, A3, A4, B, C;
output Z;
endmodule
module AOI42 (A1, A2, A3, A4, B1, B2, Z); // synthesis syn_black_box
input A1, A2, A3, A4, B1, B2;
output Z;
endmodule
module BNDSCAN (PTDI, PTMS, PTCK, BSO1, BSO2, TDI, TCK, BSEN1, BSEN2, TDO); // synthesis syn_black_box
input PTDI, PTMS, PTCK, BSO1, BSO2;
output TDI, TCK, BSEN1, BSEN2, TDO;
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
module BMZ12 (I, T, O, B); // synthesis syn_black_box xc_alias="IBUF"
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12F (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12FPD (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12FPU (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12PD (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ12PU (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ6 (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ6PD (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BMZ6PU (I, T, O, B); // synthesis syn_black_box
input I, T;
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
module BTZ12 (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12F (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12FPD (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12FPU (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12PD (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ12PU (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ6 (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ6PD (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module BTZ6PU (I, T, O, B); // synthesis syn_black_box
input I, T;
output O;
inout B /* synthesis .ispad=1 */;
endmodule
module CB4 (CI, PC0, PC1, PC2, PC3, CON, CO, NC0, NC1, NC2, NC3); // synthesis syn_black_box
input CI, PC0, PC1, PC2, PC3, CON;
output CO, NC0, NC1, NC2, NC3;
endmodule
module CB4P3BX (CI, SP, CK, PD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, PD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule
module CB4P3DX (CI, SP, CK, CD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, CD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule
module CB4P3IX (CI, SP, CK, CD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, CD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule
module CB4P3JX (CI, SP, CK, PD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, PD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule
module CD4 (CI, PC0, PC1, PC2, PC3, CO, NC0, NC1, NC2, NC3); // synthesis syn_black_box
input CI, PC0, PC1, PC2, PC3;
output CO, NC0, NC1, NC2, NC3;
endmodule
module CD4P3BX (CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, PD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module CD4P3DX (CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, CD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module CD4P3IX (CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, CD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module CD4P3JX (CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, PD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module COMP (A0, A1, B0, B1, EQ); // synthesis syn_black_box
input A0, A1, B0, B1;
output EQ;
endmodule
module COMP4 (A0, A1, A2, A3, B0, B1, B2, B3, EQ); // synthesis syn_black_box
input A0, A1, A2, A3, B0, B1, B2, B3;
output EQ;
endmodule
module CU4 (CI, PC0, PC1, PC2, PC3, CO, NC0, NC1, NC2, NC3); // synthesis syn_black_box
input CI, PC0, PC1, PC2, PC3;
output CO, NC0, NC1, NC2, NC3;
endmodule
module CU4P3BX (CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, PD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module CU4P3DX (CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, CD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module CU4P3IX (CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, CD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module CU4P3JX (CI, SP, CK, PD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input CI, SP, CK, PD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module DMUX24 (A0, A1, Z0, Z1, Z2, Z3); // synthesis syn_black_box
input A0, A1;
output Z0, Z1, Z2, Z3;
endmodule
module DMUX24E (A0, A1, E, Z0, Z1, Z2, Z3); // synthesis syn_black_box
input A0, A1, E;
output Z0, Z1, Z2, Z3;
endmodule
module DMUX38 (A0, A1, A2, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7); // synthesis syn_black_box
input A0, A1, A2;
output Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7;
endmodule
module DMUX38E (A0, A1, A2, E, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7); // synthesis syn_black_box
input A0, A1, A2, E;
output Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7;
endmodule
module FAC4P3D (A0, A1, A2, A3, CI, SP, CK, CD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input A0, A1, A2, A3, CI, SP, CK, CD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module FADD4 (A0, A1, A2, A3, B0, B1, B2, B3, CI, CO, S0, S1, S2, S3); // synthesis syn_black_box
input A0, A1, A2, A3, B0, B1, B2, B3, CI;
output CO, S0, S1, S2, S3;
endmodule
module FADD4O (A0, A1, A2, A3, B0, B1, B2, B3, CI, OFL, S0, S1, S2, S3); // synthesis syn_black_box
input A0, A1, A2, A3, B0, B1, B2, B3, CI;
output OFL, S0, S1, S2, S3;
endmodule
module FADSU4 (A0, A1, A2, A3, B0, B1, B2, B3, BCI, CON, BCO, S0, S1, S2, S3); // synthesis syn_black_box
input A0, A1, A2, A3, B0, B1, B2, B3, BCI, CON;
output BCO, S0, S1, S2, S3;
endmodule
module FADSU4O (A0, A1, A2, A3, B0, B1, B2, B3, BCI, CON, OFL, S0, S1, S2, S3); // synthesis syn_black_box
input A0, A1, A2, A3, B0, B1, B2, B3, BCI, CON;
output OFL, S0, S1, S2, S3;
endmodule
module FD1P3AX (D, SP, CK, Q, QN); // synthesis syn_black_box
input D, SP, CK;
output Q, QN;
endmodule
module FD1P3AY (D, SP, CK, Q, QN); // synthesis syn_black_box
input D, SP, CK;
output Q, QN;
endmodule
module FD1P3BX (D, SP, CK, PD, Q, QN); // synthesis syn_black_box
input D, SP, CK, PD;
output Q, QN;
endmodule
module FD1P3DX (D, SP, CK, CD, Q, QN); // synthesis syn_black_box
input D, SP, CK, CD;
output Q, QN;
endmodule
module FD1P3IZ (D, SP, CK, CD, Q, QN); // synthesis syn_black_box
input D, SP, CK, CD;
output Q, QN;
endmodule
module FD1P3JZ (D, SP, CK, PD, Q, QN); // synthesis syn_black_box
input D, SP, CK, PD;
output Q, QN;
endmodule
module FD1S1A (D, CK, Q, QN); // synthesis syn_black_box
input D, CK;
output Q, QN;
endmodule
module FD1S1AY (D, CK, Q, QN); // synthesis syn_black_box
input D, CK;
output Q, QN;
endmodule
module FD1S1B (D, CK, PD, Q, QN); // synthesis syn_black_box
input D, CK, PD;
output Q, QN;
endmodule
module FD1S1D (D, CK, CD, Q, QN); // synthesis syn_black_box
input D, CK, CD;
output Q, QN;
endmodule
module FD1S1I (D, CK, CD, Q, QN); // synthesis syn_black_box
input D, CK, CD;
output Q, QN;
endmodule
module FD1S1J (D, CK, PD, Q, QN); // synthesis syn_black_box
input D, CK, PD;
output Q, QN;
endmodule
module FD1S3AX (D, CK, Q, QN); // synthesis syn_black_box
input D, CK;
output Q, QN;
endmodule
module FD1S3AY (D, CK, Q, QN); // synthesis syn_black_box
input D, CK;
output Q, QN;
endmodule
module FD1S3BX (D, CK, PD, Q, QN); // synthesis syn_black_box
input D, CK, PD;
output Q, QN;
endmodule
module FD1S3DX (D, CK, CD, Q, QN); // synthesis syn_black_box
input D, CK, CD;
output Q, QN;
endmodule
module FD1S3IX (D, CK, CD, Q, QN); // synthesis syn_black_box
input D, CK, CD;
output Q, QN;
endmodule
module FD1S3JX (D, CK, PD, Q, QN); // synthesis syn_black_box
input D, CK, PD;
output Q, QN;
endmodule
module FJ1S3AX (J, K, CK, Q, QN); // synthesis syn_black_box
input J, K, CK;
output Q, QN;
endmodule
module FJ1S3BX (J, K, CK, PD, Q, QN); // synthesis syn_black_box
input J, K, CK, PD;
output Q, QN;
endmodule
module FJ1S3DX (J, K, CK, CD, Q, QN); // synthesis syn_black_box
input J, K, CK, CD;
output Q, QN;
endmodule
module FL1P3AY (D0, D1, SP, CK, SD, Q, QN); // synthesis syn_black_box
input D0, D1, SP, CK, SD;
output Q, QN;
endmodule
module FL1P3AZ (D0, D1, SP, CK, SD, Q, QN); // synthesis syn_black_box
input D0, D1, SP, CK, SD;
output Q, QN;
endmodule
module FL1S1A (D0, D1, CK, SD, Q, QN); // synthesis syn_black_box
input D0, D1, CK, SD;
output Q, QN;
endmodule
module FL1S1AY (D0, D1, CK, SD, Q, QN); // synthesis syn_black_box
input D0, D1, CK, SD;
output Q, QN;
endmodule
module FL1S3AX (D0, D1, CK, SD, Q, QN); // synthesis syn_black_box
input D0, D1, CK, SD;
output Q, QN;
endmodule
module FL1S3AY (D0, D1, CK, SD, Q, QN); // synthesis syn_black_box
input D0, D1, CK, SD;
output Q, QN;
endmodule
module FMULT4 (A0, A1, A2, A3, B0, B1, B2, B3, S0, S1, S2, S3, S4, S5, S6, S7); // synthesis syn_black_box
input A0, A1, A2, A3, B0, B1, B2, B3;
output S0, S1, S2, S3, S4, S5, S6, S7;
endmodule
module FS1S1A (S, R, CK, Q, QN); // synthesis syn_black_box
input S, R, CK;
output Q, QN;
endmodule
module FSUB4 (A0, A1, A2, A3, B0, B1, B2, B3, BI, BO, S0, S1, S2, S3); // synthesis syn_black_box
input A0, A1, A2, A3, B0, B1, B2, B3, BI;
output BO, S0, S1, S2, S3;
endmodule
module FSUB4O (A0, A1, A2, A3, B0, B1, B2, B3, BI, OFL, S0, S1, S2, S3); // synthesis syn_black_box
input A0, A1, A2, A3, B0, B1, B2, B3, BI;
output OFL, S0, S1, S2, S3;
endmodule
module FT1S3AX (T, CK, Q, QN); // synthesis syn_black_box
input T, CK;
output Q, QN;
endmodule
module FT1S3BX (T, CK, PD, Q, QN); // synthesis syn_black_box
input T, CK, PD;
output Q, QN;
endmodule
module FT1S3DX (T, CK, CD, Q, QN); // synthesis syn_black_box
input T, CK, CD;
output Q, QN;
endmodule
module GSR (GSR); // synthesis syn_black_box syn_noprune=1
input GSR;
endmodule
module IBM (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPD (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPDS (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPU (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMPUS (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBMS (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBT (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPD (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPDS (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPU (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTPUS (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module IBTS (I, O); // synthesis syn_black_box
input I /* synthesis .ispad=1 */;
output O;
endmodule
module INRB (A, Z); // synthesis syn_black_box
input A;
output Z;
endmodule
module INV (A, Z); // synthesis syn_black_box
input A;
output Z;
endmodule
module LB4P3AX (D0, D1, D2, D3, CI, SP, CK, SD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, CI, SP, CK, SD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule
module LB4P3AY (D0, D1, D2, D3, CI, SP, CK, SD, CON, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, CI, SP, CK, SD, CON;
output CO, Q0, Q1, Q2, Q3;
endmodule
module LD4P3AX (D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, CI, SP, CK, SD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module LD4P3AY (D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, CI, SP, CK, SD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module LTGT (A0, A1, B0, B1, GT, LT); // synthesis syn_black_box
input A0, A1, B0, B1;
output GT, LT;
endmodule
module LU4P3AX (D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box .noprune=1
input D0, D1, D2, D3, CI, SP, CK, SD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module LU4P3AY (D0, D1, D2, D3, CI, SP, CK, SD, CO, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, CI, SP, CK, SD;
output CO, Q0, Q1, Q2, Q3;
endmodule
module MUX21 (D0, D1, SD, Z); // synthesis syn_black_box
input D0, D1, SD;
output Z;
endmodule
module MUX21E (D0, D1, SD, E, Z); // synthesis syn_black_box
input D0, D1, SD, E;
output Z;
endmodule
module MUX41 (D0, D1, D2, D3, SD1, SD2, Z); // synthesis syn_black_box
input D0, D1, D2, D3, SD1, SD2;
output Z;
endmodule
module MUX41E (D0, D1, D2, D3, SD1, SD2, E, Z); // synthesis syn_black_box
input D0, D1, D2, D3, SD1, SD2, E;
output Z;
endmodule
module MUX81 (D0, D1, D2, D3, D4, D5, D6, D7, SD1, SD2, SD3, Z); // synthesis syn_black_box
input D0, D1, D2, D3, D4, D5, D6, D7, SD1, SD2, SD3;
output Z;
endmodule
module MUX81E (D0, D1, D2, D3, D4, D5, D6, D7, SD1, SD2, SD3, E, Z); // synthesis syn_black_box
input D0, D1, D2, D3, D4, D5, D6, D7, SD1, SD2, SD3, E;
output Z;
endmodule
module ND2 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module ND2B1 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module ND2B2 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module ND3 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module ND3B1 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module ND3B2 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module ND3B3 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module ND4 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module ND4B1 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module ND4B2 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module ND4B3 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module ND4B4 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module ND5 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module ND5B1 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module ND5B2 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module ND5B3 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module ND5B4 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module ND5B5 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module ND6 (A, B, C, D, E, F, Z); // synthesis syn_black_box
input A, B, C, D, E, F;
output Z;
endmodule
module NR2 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module NR2B1 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module NR2B2 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module NR3 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module NR3B1 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module NR3B2 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module NR3B3 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module NR4 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module NR4B1 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module NR4B2 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module NR4B3 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module NR4B4 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module NR5 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module NR5B1 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module NR5B2 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module NR5B3 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module NR5B4 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module NR5B5 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module NR6 (A, B, C, D, E, F, Z); // synthesis syn_black_box
input A, B, C, D, E, F;
output Z;
endmodule
module OAI21 (A1, A2, B, Z); // synthesis syn_black_box
input A1, A2, B;
output Z;
endmodule
module OAI211 (A1, A2, B, C, Z); // synthesis syn_black_box
input A1, A2, B, C;
output Z;
endmodule
module OAI2111 (A1, A2, B, C, D, Z); // synthesis syn_black_box
input A1, A2, B, C, D;
output Z;
endmodule
module OAI22 (A1, A2, B1, B2, Z); // synthesis syn_black_box
input A1, A2, B1, B2;
output Z;
endmodule
module OAI221 (A1, A2, B1, B2, C, Z); // synthesis syn_black_box
input A1, A2, B1, B2, C;
output Z;
endmodule
module OAI2211 (A1, A2, B1, B2, C, D, Z); // synthesis syn_black_box
input A1, A2, B1, B2, C, D;
output Z;
endmodule
module OAI222 (A1, A2, B1, B2, C1, C2, Z); // synthesis syn_black_box
input A1, A2, B1, B2, C1, C2;
output Z;
endmodule
module OAI31 (A1, A2, A3, B, Z); // synthesis syn_black_box
input A1, A2, A3, B;
output Z;
endmodule
module OAI311 (A1, A2, A3, B, C, Z); // synthesis syn_black_box
input A1, A2, A3, B, C;
output Z;
endmodule
module OAI3111 (A1, A2, A3, B, C, D, Z); // synthesis syn_black_box
input A1, A2, A3, B, C, D;
output Z;
endmodule
module OAI32 (A1, A2, A3, B1, B2, Z); // synthesis syn_black_box
input A1, A2, A3, B1, B2;
output Z;
endmodule
module OAI321 (A1, A2, A3, B1, B2, C, Z); // synthesis syn_black_box
input A1, A2, A3, B1, B2, C;
output Z;
endmodule
module OAI33 (A1, A2, A3, B1, B2, B3, Z); // synthesis syn_black_box
input A1, A2, A3, B1, B2, B3;
output Z;
endmodule
module OAI41 (A1, A2, A3, A4, B, Z); // synthesis syn_black_box
input A1, A2, A3, A4, B;
output Z;
endmodule
module OAI411 (A1, A2, A3, A4, B, C, Z); // synthesis syn_black_box
input A1, A2, A3, A4, B, C;
output Z;
endmodule
module OAI42 (A1, A2, A3, A4, B1, B2, Z); // synthesis syn_black_box
input A1, A2, A3, A4, B1, B2;
output Z;
endmodule
module OB12 (I, O); // synthesis syn_black_box
input I;
output O /* synthesis .ispad=1 */;
endmodule
module OB12F (I, O); // synthesis syn_black_box
input I;
output O /* synthesis .ispad=1 */;
endmodule
module OB6 (I, O); // synthesis syn_black_box
input I;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12 (I, T, O); // synthesis syn_black_box
input I, T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12F (I, T, O); // synthesis syn_black_box
input I, T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12FPD (I, T, O); // synthesis syn_black_box
input I, T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12FPU (I, T, O); // synthesis syn_black_box
input I, T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12PD (I, T, O); // synthesis syn_black_box
input I, T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ12PU (I, T, O); // synthesis syn_black_box
input I, T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ6 (I, T, O); // synthesis syn_black_box
input I, T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ6PD (I, T, O); // synthesis syn_black_box
input I, T;
output O /* synthesis .ispad=1 */;
endmodule
module OBZ6PU (I, T, O); // synthesis syn_black_box
input I, T;
output O /* synthesis .ispad=1 */;
endmodule
module OR2 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module OR2B1 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module OR2B2 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module OR3 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module OR3B1 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module OR3B2 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module OR3B3 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module OR4 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module OR4B1 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module OR4B2 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module OR4B3 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module OR4B4 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module OR5 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module OR5B1 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module OR5B2 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module OR5B3 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module OR5B4 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module OR5B5 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module OR6 (A, B, C, D, E, F, Z); // synthesis syn_black_box
input A, B, C, D, E, F;
output Z;
endmodule
module OSCIL (TEST, OSC); // synthesis syn_black_box 
input TEST;
output OSC;
endmodule
module PFUMX (ALUT, BLUT, C0, Z); // synthesis syn_black_box
input ALUT, BLUT, C0;
output Z;
endmodule
module PFUND (ALUT, BLUT, C0, Z); // synthesis syn_black_box
input ALUT, BLUT, C0;
output Z;
endmodule
module PFUND0 (ALUT, BLUT, Z); // synthesis syn_black_box
input ALUT, BLUT;
output Z;
endmodule
module PFUXR (ALUT, BLUT, C0, Z); // synthesis syn_black_box
input ALUT, BLUT, C0;
output Z;
endmodule
module PFUXR0 (ALUT, BLUT, Z); // synthesis syn_black_box
input ALUT, BLUT;
output Z;
endmodule
module RD4P3A (D0, D1, D2, D3, SP, CK, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, SP, CK;
output Q0, Q1, Q2, Q3;
endmodule
module RD4P3B (D0, D1, D2, D3, SP, CK, PD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, SP, CK, PD;
output Q0, Q1, Q2, Q3;
endmodule
module RD4P3D (D0, D1, D2, D3, SP, CK, CD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, SP, CK, CD;
output Q0, Q1, Q2, Q3;
endmodule
module RD4P3I (D0, D1, D2, D3, SP, CK, CD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, SP, CK, CD;
output Q0, Q1, Q2, Q3;
endmodule
module RD4P3J (D0, D1, D2, D3, SP, CK, PD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, SP, CK, PD;
output Q0, Q1, Q2, Q3;
endmodule
module RD4S3A (D0, D1, D2, D3, CK, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, CK;
output Q0, Q1, Q2, Q3;
endmodule
module RD4S3B (D0, D1, D2, D3, CK, PD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, CK, PD;
output Q0, Q1, Q2, Q3;
endmodule
module RD4S3D (D0, D1, D2, D3, CK, CD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, CK, CD;
output Q0, Q1, Q2, Q3;
endmodule
module RD4S3I (D0, D1, D2, D3, CK, CD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, CK, CD;
output Q0, Q1, Q2, Q3;
endmodule
module RD4S3J (D0, D1, D2, D3, CK, PD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D0, D1, D2, D3, CK, PD;
output Q0, Q1, Q2, Q3;
endmodule
module READBK (RDCFGN, CAPT, PRDDATA, RDBO); // synthesis syn_black_box
input RDCFGN, CAPT;
output PRDDATA, RDBO;
endmodule
module RLS4P3A (D, D0, D1, D2, D3, SP, CK, SD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D, D0, D1, D2, D3, SP, CK, SD;
output Q0, Q1, Q2, Q3;
endmodule
module RPP16X2 (AD0, AD1, AD2, AD3, DI0, DI1, WREN, DO0, DO1); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, WREN;
output DO0, DO1;
endmodule
module RPP16X2Z (AD0, AD1, AD2, AD3, DI0, DI1, WREN, TRI, DO0, DO1); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, WREN, TRI;
output DO0 /* synthesis syn_tristate=1 */, 
       DO1 /* synthesis syn_tristate=1 */;
endmodule
module RPP16X4 (AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, WREN, DO0, DO1, DO2, DO3); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, WREN;
output DO0, DO1, DO2, DO3;
endmodule
module RPP16X4Z (AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, WREN, TRI, DO0, DO1, DO2, DO3); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, WREN, TRI;
output DO0 /* synthesis syn_tristate=1 */, 
       DO1 /* synthesis syn_tristate=1 */, 
       DO2 /* synthesis syn_tristate=1 */, 
       DO3 /* synthesis syn_tristate=1 */;
endmodule
module RS4P3A (D, SP, CK, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D, SP, CK;
output Q0, Q1, Q2, Q3;
endmodule
module RS4P3B (D, SP, CK, PD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D, SP, CK, PD;
output Q0, Q1, Q2, Q3;
endmodule
module RS4P3D (D, SP, CK, CD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D, SP, CK, CD;
output Q0, Q1, Q2, Q3;
endmodule
module RS4P3I (D, SP, CK, CD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D, SP, CK, CD;
output Q0, Q1, Q2, Q3;
endmodule
module RS4P3J (D, SP, CK, PD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D, SP, CK, PD;
output Q0, Q1, Q2, Q3;
endmodule
module RS4S3A (D, CK, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D, CK;
output Q0, Q1, Q2, Q3;
endmodule
module RS4S3B (D, CK, PD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D, CK, PD;
output Q0, Q1, Q2, Q3;
endmodule
module RS4S3D (D, CK, CD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D, CK, CD;
output Q0, Q1, Q2, Q3;
endmodule
module RS4S3I (D, CK, CD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D, CK, CD;
output Q0, Q1, Q2, Q3;
endmodule
module RS4S3J (D, CK, PD, Q0, Q1, Q2, Q3); // synthesis syn_black_box
input D, CK, PD;
output Q0, Q1, Q2, Q3;
endmodule
module SUB (A, B, BI, BO, S); // synthesis syn_black_box
input A, B, BI;
output BO, S;
endmodule
module STRTUP (UCLK); // synthesis syn_black_box
input UCLK;
endmodule
module TBUF (I, T, O); // synthesis syn_black_box
input I, T;
output O /* synthesis syn_tristate=1 */;
endmodule
module TIBUF (I, T, O); // synthesis syn_black_box
input I, T;
output O /* synthesis syn_tristate=1 */;
endmodule
module TSALL (TSALL); // synthesis syn_black_box .noprune=1
input TSALL;
endmodule
module VHI (Z); // synthesis syn_black_box
output Z;
endmodule
module VLO (Z); // synthesis syn_black_box
output Z;
endmodule
module XNOR2 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module XNOR3 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module XNOR4 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module XNOR5 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module XNOR6 (A, B, C, D, E, F, Z); // synthesis syn_black_box
input A, B, C, D, E, F;
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
module XOR2 (A, B, Z); // synthesis syn_black_box
input A, B;
output Z;
endmodule
module XOR3 (A, B, C, Z); // synthesis syn_black_box
input A, B, C;
output Z;
endmodule
module XOR4 (A, B, C, D, Z); // synthesis syn_black_box
input A, B, C, D;
output Z;
endmodule
module XOR5 (A, B, C, D, E, Z); // synthesis syn_black_box
input A, B, C, D, E;
output Z;
endmodule
module XOR6 (A, B, C, D, E, F, Z); // synthesis syn_black_box
input A, B, C, D, E, F;
output Z;
endmodule

// 2A components

module AGEB4 (A0, A1, A2, A3, B0, B1, B2, B3, CI, GE); // synthesis syn_black_box
input A0, A1, A2, A3, B0, B1, B2, B3, CI;
output GE;
endmodule
module ANEB4 (A0, A1, A2, A3, B0, B1, B2, B3, CI, NE); // synthesis syn_black_box
input A0, A1, A2, A3, B0, B1, B2, B3, CI;
output NE;
endmodule
module DCE16X2 (AD0, AD1, AD2, AD3, DI0, DI1, CK, WREN, WPE, RAD0, RAD1, RAD2, RAD3, RDO0, RDO1, DO0, DO1); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, CK, WREN, WPE, RAD0, RAD1, RAD2, RAD3;
output RDO0, RDO1, DO0, DO1;
endmodule
module DCE16X2Z (AD0, AD1, AD2, AD3, DI0, DI1, CK, WREN, WPE, TRI, RAD0, RAD1, RAD2, RAD3, RDO0, RDO1, DO0, DO1); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, CK, WREN, WPE, TRI, RAD0, RAD1, RAD2, RAD3;
output RDO0 /* synthesis syn_tristate=1 */, 
       RDO1 /* synthesis syn_tristate=1 */;
output DO0, DO1;
endmodule
module DCF16X2 (AD0, AD1, AD2, AD3, DI0, DI1, CK, WREN, WPE, RAD0, RAD1, RAD2, RAD3, RDO0, RDO1, DO0, DO1); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, CK, WREN, WPE, RAD0, RAD1, RAD2, RAD3;
output RDO0, RDO1, DO0, DO1;
endmodule
module DCF16X2Z (AD0, AD1, AD2, AD3, DI0, DI1, CK, WREN, WPE, TRI, RAD0, RAD1, RAD2, RAD3, RDO0, RDO1, DO0, DO1); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, CK, WREN, WPE, TRI, RAD0, RAD1, RAD2, RAD3;
output RDO0 /* synthesis syn_tristate=1 */, 
       RDO1 /* synthesis syn_tristate=1 */;
output DO0, DO1;
endmodule
module FD1P3IX (D, SP, CK, CD, Q, QN); // synthesis syn_black_box
input D, SP, CK, CD;
output Q, QN;
endmodule
module FD1P3JX (D, SP, CK, PD, Q, QN); // synthesis syn_black_box
input D, SP, CK, PD;
output Q, QN;
endmodule
module FMULT41 (A0, A1, A2, A3, B0, B1, B2, B3, MULT, CI, CO, P0, P1, P2, P3); // synthesis syn_black_box
input A0, A1, A2, A3, B0, B1, B2, B3, MULT, CI;
output CO, P0, P1, P2, P3;
endmodule
module RCE16X4 (AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, CK, WREN, WPE, DO0, DO1, DO2, DO3); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, CK, WREN, WPE;
output DO0, DO1, DO2, DO3;
endmodule
module RCE16X4Z (AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, CK, WREN, WPE, TRI, DO0, DO1, DO2, DO3); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, CK, WREN, WPE, TRI;
output DO0 /* synthesis syn_tristate=1 */, 
       DO1 /* synthesis syn_tristate=1 */, 
       DO2 /* synthesis syn_tristate=1 */, 
       DO3 /* synthesis syn_tristate=1 */;
endmodule
module RCF16X4 (AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, CK, WREN, WPE, DO0, DO1, DO2, DO3); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, CK, WREN, WPE;
output DO0, DO1, DO2, DO3;
endmodule
module RCF16X4Z (AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, CK, WREN, WPE, TRI, DO0, DO1, DO2, DO3); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, CK, WREN, WPE, TRI;
output DO0 /* synthesis syn_tristate=1 */, 
       DO1 /* synthesis syn_tristate=1 */, 
       DO2 /* synthesis syn_tristate=1 */, 
       DO3 /* synthesis syn_tristate=1 */;
endmodule
module RPE16X2 (AD0, AD1, AD2, AD3, DI0, DI1, WREN, WPE, DO0, DO1); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, WREN, WPE;
output DO0, DO1;
endmodule
module RPE16X2Z (AD0, AD1, AD2, AD3, DI0, DI1, WREN, WPE, TRI, DO0, DO1); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, WREN, WPE, TRI;
output DO0 /* synthesis syn_tristate=1 */, 
       DO1 /* synthesis syn_tristate=1 */;
endmodule
module RPE16X4 (AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, WREN, WPE, DO0, DO1, DO2, DO3); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, WREN, WPE;
output DO0, DO1, DO2, DO3;
endmodule
module RPE16X4Z (AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, WREN, WPE, TRI, DO0, DO1, DO2, DO3); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, DI0, DI1, DI2, DI3, WREN, WPE, TRI;
output DO0 /* synthesis syn_tristate=1 */, 
       DO1 /* synthesis syn_tristate=1 */, 
       DO2 /* synthesis syn_tristate=1 */, 
       DO3 /* synthesis syn_tristate=1 */;
endmodule
module ROM16X1 ( AD0, AD1, AD2, AD3, DO0); // synthesis syn_black_box
input AD0, AD1, AD2, AD3;
output DO0;
endmodule
module ROM32X1 (AD0, AD1, AD2, AD3, AD4, DO0); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, AD4;
output DO0;
endmodule
module ROM32X4 (AD0, AD1, AD2, AD3, AD4, CK, DO0, DO1, DO2, DO3, QDO0, QDO1, QDO2, QDO3); // synthesis syn_black_box
input AD0, AD1, AD2, AD3, AD4, CK;
output DO0, DO1, DO2, DO3, QDO0, QDO1, QDO2, QDO3;
endmodule
