// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2001 by Lattice Semiconductor Corporation
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
// -- Synthesis Header Library File for Lattice device
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date   :| Changes Made:
//   V1.0 :|                   :|             :| Pre-Release
// --------------------------------------------------------------------
module ADDF1(Z0,CO,A0,B0,CI); // synthesis syn_black_box
input A0,B0,CI;
output Z0,CO;
endmodule
module ADDF16A(CO,Z0,Z1,Z10,Z11,Z12,Z13,Z14,Z15,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,A0,A1,A10,A11,A12,A13,A14,A15,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B10,B11,B12,B13,B14,B15,B2,B3,B4,B5,B6,B7,B8,B9,CI); // synthesis syn_black_box
input A0,A1,A10,A11,A12,A13,A14,A15,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B10,B11,B12,B13,B14,B15,B2,B3,B4,B5,B6,B7,B8,B9,CI;
output CO,Z0,Z1,Z10,Z11,Z12,Z13,Z14,Z15,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9;
endmodule
module ADDF2(Z0,Z1,CO,A0,A1,B0,B1,CI); // synthesis syn_black_box
input A0,A1,B0,B1,CI;
output Z0,Z1,CO;
endmodule
module ADDF4(Z0,Z1,Z2,Z3,CO,A0,A1,A2,A3,B0,B1,B2,B3,CI); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3,CI;
output Z0,Z1,Z2,Z3,CO;
endmodule
module ADDF8(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,CO,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,CI); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,CI;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,CO;
endmodule
module ADDF8A(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,CO,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,CI); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,CI;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,CO;
endmodule
module ADDH1(Z0,CO,A0,B0); // synthesis syn_black_box
input A0,B0;
output Z0,CO;
endmodule
module ADDH16A(CO,Z0,Z1,Z10,Z11,Z12,Z13,Z14,Z15,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,A0,A1,A10,A11,A12,A13,A14,A15,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B10,B11,B12,B13,B14,B15,B2,B3,B4,B5,B6,B7,B8,B9); // synthesis syn_black_box
input A0,A1,A10,A11,A12,A13,A14,A15,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B10,B11,B12,B13,B14,B15,B2,B3,B4,B5,B6,B7,B8,B9;
output CO,Z0,Z1,Z10,Z11,Z12,Z13,Z14,Z15,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9;
endmodule
module ADDH2(Z0,Z1,CO,A0,A1,B0,B1); // synthesis syn_black_box
input A0,A1,B0,B1;
output Z0,Z1,CO;
endmodule
module ADDH3(Z0,Z1,Z2,CO,A0,A1,A2,B0,B1,B2); // synthesis syn_black_box
input A0,A1,A2,B0,B1,B2;
output Z0,Z1,Z2,CO;
endmodule
module ADDH4(Z0,Z1,Z2,Z3,CO,A0,A1,A2,A3,B0,B1,B2,B3); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3;
output Z0,Z1,Z2,Z3,CO;
endmodule
module ADDH8(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,CO,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,CO;
endmodule
module ADDH8A(CO,Z7,Z6,Z5,Z4,Z3,Z2,Z1,Z0,B7,B6,B5,B4,B3,B2,B1,B0,A7,A6,A5,A4,A3,A2,A1,A0); // synthesis syn_black_box
input B7,B6,B5,B4,B3,B2,B1,B0,A7,A6,A5,A4,A3,A2,A1,A0;
output CO,Z7,Z6,Z5,Z4,Z3,Z2,Z1,Z0;
endmodule
module AND10(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9;
output Z0;
endmodule
module AND11(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10;
output Z0;
endmodule
module AND12(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11;
output Z0;
endmodule
module AND13(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12;
output Z0;
endmodule
module AND14(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13;
output Z0;
endmodule
module AND15(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14;
output Z0;
endmodule
module AND16(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15;
output Z0;
endmodule
module AND17(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16;
output Z0;
endmodule
module AND18(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17;
output Z0;
endmodule
module AND9(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8;
output Z0;
endmodule
module BI11(Z0,XB0,A0,OE); // synthesis syn_black_box
input A0,OE;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BI14(Z0,Z1,Z2,Z3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,OE); // synthesis syn_black_box
input A0,A1,A2,A3,OE;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BI18(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,OE;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BI21(Z0,XB0,A0,OE); // synthesis syn_black_box
input A0,OE;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BI24(Z0,Z1,Z2,Z3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,OE); // synthesis syn_black_box
input A0,A1,A2,A3,OE;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BI28(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,OE;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BI31(Z0,XB0,A0,OE); // synthesis syn_black_box
input A0,OE;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BI34(Z0,Z1,Z2,Z3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,OE); // synthesis syn_black_box
input A0,A1,A2,A3,OE;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BI38(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,OE;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BI41(Z0,XB0,A0,OE); // synthesis syn_black_box
input A0,OE;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BI44(Z0,Z1,Z2,Z3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,OE); // synthesis syn_black_box
input A0,A1,A2,A3,OE;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BI48(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,OE;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIID11(Q0,XB0,A0,CLK,OE); // synthesis syn_black_box
input A0,CLK,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIID11E(A0,CLK,EN,OE,Q0,XB0); // synthesis syn_black_box
input A0,CLK,EN,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIID14(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,CLK,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIID14E(A0,A1,A2,A3,CLK,EN,OE,Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3); // synthesis syn_black_box
input A0,A1,A2,A3,CLK,EN,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIID18(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIID21(Q0,XB0,A0,CLK,OE); // synthesis syn_black_box
input A0,CLK,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIID24(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,CLK,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIID28(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIID31(Q0,XB0,A0,CLK,OE); // synthesis syn_black_box
input A0,CLK,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIID34(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,CLK,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIID38(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIID41(Q0,XB0,A0,CLK,OE); // synthesis syn_black_box
input A0,CLK,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIID44(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,CLK,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIID48(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIID51(Q0,XB0,A0,CLK,OE); // synthesis syn_black_box
input A0,CLK,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIID54(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,CLK,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIID58(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIID61(Q0,XB0,A0,CLK,OE); // synthesis syn_black_box
input A0,CLK,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIID64(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,CLK,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIID68(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIID71(Q0,XB0,A0,CLK,OE); // synthesis syn_black_box
input A0,CLK,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIID74(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,CLK,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIID78(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIID81(Q0,XB0,A0,CLK,OE); // synthesis syn_black_box
input A0,CLK,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIID84(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,CLK,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIID88(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,CLK,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIID91(A0,CD,CLK,OE,Q0,XB0); // synthesis syn_black_box
input A0,CD,CLK,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIID91E(A0,CD,CLK,EN,OE,Q0,XB0); // synthesis syn_black_box
input A0,CD,CLK,EN,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIID94(A0,A1,A2,A3,CD,CLK,OE,Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3); // synthesis syn_black_box
input A0,A1,A2,A3,CD,CLK,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIID94E(A0,A1,A2,A3,CD,CLK,EN,OE,Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3); // synthesis syn_black_box
input A0,A1,A2,A3,CD,CLK,EN,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIDA1(A0,CLK,OE,SD,Q0,XB0); // synthesis syn_black_box
input A0,CLK,OE,SD;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIDA1E(A0,CLK,EN,OE,SD,Q0,XB0); // synthesis syn_black_box
input A0,CLK,EN,OE,SD;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIDA4(A0,A1,A2,A3,CLK,OE,SD,Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3); // synthesis syn_black_box
input A0,A1,A2,A3,CLK,OE,SD;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIDA4E(A0,A1,A2,A3,CLK,EN,OE,SD,Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3); // synthesis syn_black_box
input A0,A1,A2,A3,CLK,EN,OE,SD;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIDB1(A0,CD,CLK,OE,SD,Q0,XB0); // synthesis syn_black_box
input A0,CD,CLK,OE,SD;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIDB1E(A0,CD,CLK,EN,OE,SD,Q0,XB0); // synthesis syn_black_box
input A0,CD,CLK,EN,OE,SD;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIDB4(A0,A1,A2,A3,CD,CLK,OE,SD,Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3); // synthesis syn_black_box
input A0,A1,A2,A3,CD,CLK,OE,SD;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIDB4E(A0,A1,A2,A3,CD,CLK,EN,OE,SD,Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3); // synthesis syn_black_box
input A0,A1,A2,A3,CD,CLK,EN,OE,SD;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIL11(Q0,XB0,A0,G,OE); // synthesis syn_black_box
input A0,G,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIL14(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,G,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIL18(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,G,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIIL21(Q0,XB0,A0,G,OE); // synthesis syn_black_box
input A0,G,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIL24(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,G,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIL28(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,G,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIIL31(Q0,XB0,A0,G,OE); // synthesis syn_black_box
input A0,G,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIL34(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,G,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIL38(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,G,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIIL41(Q0,XB0,A0,G,OE); // synthesis syn_black_box
input A0,G,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIL44(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,G,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIL48(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,G,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIIL51(Q0,XB0,A0,G,OE); // synthesis syn_black_box
input A0,G,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIL54(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,G,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIL58(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,G,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIIL61(Q0,XB0,A0,G,OE); // synthesis syn_black_box
input A0,G,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIL64(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,G,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIL68(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,G,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIIL71(Q0,XB0,A0,G,OE); // synthesis syn_black_box
input A0,G,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIL74(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,G,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIL78(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,G,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIIL81(Q0,XB0,A0,G,OE); // synthesis syn_black_box
input A0,G,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIL84(Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3,A0,A1,A2,A3,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,G,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIIL88(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XB0,XB1,XB2,XB3,XB4,XB5,XB6,XB7,A0,A1,A2,A3,A4,A5,A6,A7,G,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,G,OE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */,
      XB4 /* synthesis .ispad=1 */,
      XB5 /* synthesis .ispad=1 */,
      XB6 /* synthesis .ispad=1 */,
      XB7 /* synthesis .ispad=1 */;
endmodule
module BIIL91(A0,CD,G,OE,Q0,XB0); // synthesis syn_black_box
input A0,CD,G,OE;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIIL94(A0,A1,A2,A3,CD,G,OE,Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3); // synthesis syn_black_box
input A0,A1,A2,A3,CD,G,OE;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIILA1(A0,G,OE,SD,Q0,XB0); // synthesis syn_black_box
input A0,G,OE,SD;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIILA4(A0,A1,A2,A3,G,OE,SD,Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3); // synthesis syn_black_box
input A0,A1,A2,A3,G,OE,SD;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIILB1(A0,CD,G,OE,SD,Q0,XB0); // synthesis syn_black_box
input A0,CD,G,OE,SD;
output Q0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIILB4(A0,A1,A2,A3,CD,G,OE,SD,Q0,Q1,Q2,Q3,XB0,XB1,XB2,XB3); // synthesis syn_black_box
input A0,A1,A2,A3,CD,G,OE,SD;
output Q0,Q1,Q2,Q3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIN27(Z0,Z1,Z2,Z3,Z4,Z5,Z6,A0,A1,A2,A3,EN); // synthesis syn_black_box
input A0,A1,A2,A3,EN;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6;
endmodule
module BIOD11(CLK,D0,OE,XB0,Z0); // synthesis syn_black_box
input CLK,D0,OE;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOD11E(CLK,D0,EN,OE,XB0,Z0); // synthesis syn_black_box
input CLK,D0,EN,OE;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOD14(CLK,D0,D1,D2,D3,OE,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,OE;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIOD14E(CLK,D0,D1,D2,D3,EN,OE,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,EN,OE;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIOD21(CD,CLK,D0,OE,XB0,Z0); // synthesis syn_black_box
input CD,CLK,D0,OE;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOD21E(CD,CLK,D0,EN,OE,XB0,Z0); // synthesis syn_black_box
input CD,CLK,D0,EN,OE;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOD24(CD,CLK,D0,D1,D2,D3,OE,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,OE;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIOD24E(CD,CLK,D0,D1,D2,D3,EN,OE,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,EN,OE;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIOD31(CLK,D0,OE,SD,XB0,Z0); // synthesis syn_black_box
input CLK,D0,OE,SD;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOD31E(CLK,D0,EN,OE,SD,XB0,Z0); // synthesis syn_black_box
input CLK,D0,EN,OE,SD;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOD34(CLK,D0,D1,D2,D3,OE,SD,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,OE,SD;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIOD34E(CLK,D0,D1,D2,D3,EN,OE,SD,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,EN,OE,SD;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIOD41(CD,CLK,D0,OE,SD,XB0,Z0); // synthesis syn_black_box
input CD,CLK,D0,OE,SD;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOD41E(CD,CLK,D0,EN,OE,SD,XB0,Z0); // synthesis syn_black_box
input CD,CLK,D0,EN,OE,SD;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOD44(CD,CLK,D0,D1,D2,D3,OE,SD,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,OE,SD;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIOD44E(CD,CLK,D0,D1,D2,D3,EN,OE,SD,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,EN,OE,SD;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIOL11(D0,G,OE,XB0,Z0); // synthesis syn_black_box
input D0,G,OE;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOL14(D0,D1,D2,D3,G,OE,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input D0,D1,D2,D3,G,OE;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIOL21(CD,D0,G,OE,XB0,Z0); // synthesis syn_black_box
input CD,D0,G,OE;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOL24(CD,D0,D1,D2,D3,G,OE,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input CD,D0,D1,D2,D3,G,OE;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIOL31(D0,G,OE,SD,XB0,Z0); // synthesis syn_black_box
input D0,G,OE,SD;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOL34(D0,D1,D2,D3,G,OE,SD,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input D0,D1,D2,D3,G,OE,SD;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BIOL41(CD,D0,G,OE,SD,XB0,Z0); // synthesis syn_black_box
input CD,D0,G,OE,SD;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module BIOL44(CD,D0,D1,D2,D3,G,OE,SD,XB0,XB1,XB2,XB3,Z0,Z1,Z2,Z3); // synthesis syn_black_box
input CD,D0,D1,D2,D3,G,OE,SD;
output Z0,Z1,Z2,Z3;
inout XB0 /* synthesis .ispad=1 */,
      XB1 /* synthesis .ispad=1 */,
      XB2 /* synthesis .ispad=1 */,
      XB3 /* synthesis .ispad=1 */;
endmodule
module BUF(Z0,A0); // synthesis syn_black_box
input A0;
output Z0;
endmodule
module CBD11(Q0,CAO,CAI,CLK,CD); // synthesis syn_black_box
input CAI,CLK,CD;
output Q0,CAO;
endmodule
module CBD12(Q0,Q1,CAO,CAI,CLK,CD); // synthesis syn_black_box
input CAI,CLK,CD;
output Q0,Q1,CAO;
endmodule
module CBD14(Q0,Q1,Q2,Q3,CAO,CAI,CLK,CD); // synthesis syn_black_box
input CAI,CLK,CD;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CBD18(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,CAI,CLK,CD); // synthesis syn_black_box
input CAI,CLK,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CBD21(Q0,CAO,CAI,CLK,EN,CD); // synthesis syn_black_box
input CAI,CLK,EN,CD;
output Q0,CAO;
endmodule
module CBD22(Q0,Q1,CAO,CAI,CLK,EN,CD); // synthesis syn_black_box
input CAI,CLK,EN,CD;
output Q0,Q1,CAO;
endmodule
module CBD24(Q0,Q1,Q2,Q3,CAO,CAI,CLK,EN,CD); // synthesis syn_black_box
input CAI,CLK,EN,CD;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CBD28(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,CAI,CLK,EN,CD); // synthesis syn_black_box
input CAI,CLK,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CBD31(Q0,CAO,D0,CAI,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,CAI,CLK,PS,LD,EN,CD;
output Q0,CAO;
endmodule
module CBD32(Q0,Q1,CAO,D0,D1,CAI,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,D1,CAI,CLK,PS,LD,EN,CD;
output Q0,Q1,CAO;
endmodule
module CBD34(Q0,Q1,Q2,Q3,CAO,D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CD;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CBD38(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CBD41(Q0,CAO,D0,CAI,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,CAI,CLK,PS,LD,EN,CS;
output Q0,CAO;
endmodule
module CBD42(Q0,Q1,CAO,D0,D1,CAI,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,D1,CAI,CLK,PS,LD,EN,CS;
output Q0,Q1,CAO;
endmodule
module CBD44(Q0,Q1,Q2,Q3,CAO,D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CS;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CBD48(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CBD516(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,CLK,EN,CD); // synthesis syn_black_box
input CLK,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15;
endmodule
module CBD616(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,CAO,CLK,EN,CD); // synthesis syn_black_box
input CLK,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,CAO;
endmodule
module CBD84(CAI,CAO,CLK,EN,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CAI,CLK,EN,SD;
output CAO,Q0,Q1,Q2,Q3;
endmodule
module CBD88(CAI,CAO,CLK,EN,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CAI,CLK,EN,SD;
output CAO,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CBD94(CAI,CAO,CD,CLK,EN,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CAI,CD,CLK,EN,SD;
output CAO,Q0,Q1,Q2,Q3;
endmodule
module CBD98(CAI,CAO,CD,CLK,EN,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CAI,CD,CLK,EN,SD;
output CAO,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CBDA16(CAI,CAO,CD,CLK,D0,D1,D10,D11,D12,D13,D14,D15,D2,D3,D4,D5,D6,D7,D8,D9,EN,LD,SD,Q0,Q1,Q10,Q11,Q12,Q13,Q14,Q15,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9); // synthesis syn_black_box
input CAI,CD,CLK,D0,D1,D10,D11,D12,D13,D14,D15,D2,D3,D4,D5,D6,D7,D8,D9,EN,LD,SD;
output CAO,Q0,Q1,Q10,Q11,Q12,Q13,Q14,Q15,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9;
endmodule
module CBDA4(CAI,CAO,CD,CLK,D0,D1,D2,D3,EN,LD,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CAI,CD,CLK,D0,D1,D2,D3,EN,LD,SD;
output CAO,Q0,Q1,Q2,Q3;
endmodule
module CBDA8(CAI,CAO,CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CAI,CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,SD;
output CAO,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CBDB4(CAI,CAO,CLK,CS,D0,D1,D2,D3,EN,LD,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CAI,CLK,CS,D0,D1,D2,D3,EN,LD,SD;
output CAO,Q0,Q1,Q2,Q3;
endmodule
module CBDB8(CAI,CAO,CLK,CS,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CAI,CLK,CS,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,SD;
output CAO,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CBU11(Q0,CAO,CAI,CLK,CD); // synthesis syn_black_box
input CAI,CLK,CD;
output Q0,CAO;
endmodule
module CBU12(Q0,Q1,CAO,CAI,CLK,CD); // synthesis syn_black_box
input CAI,CLK,CD;
output Q0,Q1,CAO;
endmodule
module CBU14(Q0,Q1,Q2,Q3,CAO,CAI,CLK,CD); // synthesis syn_black_box
input CAI,CLK,CD;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CBU18(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,CAI,CLK,CD); // synthesis syn_black_box
input CAI,CLK,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CBU21(Q0,CAO,CAI,CLK,EN,CD); // synthesis syn_black_box
input CAI,CLK,EN,CD;
output Q0,CAO;
endmodule
module CBU22(Q0,Q1,CAO,CAI,CLK,EN,CD); // synthesis syn_black_box
input CAI,CLK,EN,CD;
output Q0,Q1,CAO;
endmodule
module CBU24(Q0,Q1,Q2,Q3,CAO,CAI,CLK,EN,CD); // synthesis syn_black_box
input CAI,CLK,EN,CD;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CBU28(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,CAI,CLK,EN,CD); // synthesis syn_black_box
input CAI,CLK,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CBU31(Q0,CAO,D0,CAI,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,CAI,CLK,PS,LD,EN,CD;
output Q0,CAO;
endmodule
module CBU32(Q0,Q1,CAO,D0,D1,CAI,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,D1,CAI,CLK,PS,LD,EN,CD;
output Q0,Q1,CAO;
endmodule
module CBU34(Q0,Q1,Q2,Q3,CAO,D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CD;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CBU38(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CBU41(Q0,CAO,D0,CAI,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,CAI,CLK,PS,LD,EN,CS;
output Q0,CAO;
endmodule
module CBU42(Q0,Q1,CAO,D0,D1,CAI,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,D1,CAI,CLK,PS,LD,EN,CS;
output Q0,Q1,CAO;
endmodule
module CBU44(Q0,Q1,Q2,Q3,CAO,D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CS;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CBU48(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CBU516(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,CLK,EN,CD); // synthesis syn_black_box
input CLK,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15;
endmodule
module CBU616(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,CAO,CLK,EN,CD); // synthesis syn_black_box
input CLK,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,CAO;
endmodule
module CBU716(CAO,Q0,Q1,Q10,Q11,Q12,Q13,Q14,Q15,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,CAI,CD,CLK,D0,D1,D10,D11,D12,D13,D14,D15,D2,D3,D4,D5,D6,D7,D8,D9,EN,LD); // synthesis syn_black_box
input CAI,CD,CLK,D0,D1,D10,D11,D12,D13,D14,D15,D2,D3,D4,D5,D6,D7,D8,D9,EN,LD;
output CAO,Q0,Q1,Q10,Q11,Q12,Q13,Q14,Q15,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9;
endmodule
module CBU84(CAI,CAO,CLK,EN,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CAI,CLK,EN,SD;
output CAO,Q0,Q1,Q2,Q3;
endmodule
module CBU88(CAI,CAO,CLK,EN,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CAI,CLK,EN,SD;
output CAO,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CBU94(CAI,CAO,CD,CLK,EN,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CAI,CD,CLK,EN,SD;
output CAO,Q0,Q1,Q2,Q3;
endmodule
module CBU98(CAI,CAO,CD,CLK,EN,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CAI,CD,CLK,EN,SD;
output CAO,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CBUA16(CAI,CAO,CD,CLK,D0,D1,D10,D11,D12,D13,D14,D15,D2,D3,D4,D5,D6,D7,D8,D9,EN,LD,Q0,Q1,Q10,Q11,Q12,Q13,Q14,Q15,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,SD); // synthesis syn_black_box
input CAI,CD,CLK,D0,D1,D10,D11,D12,D13,D14,D15,D2,D3,D4,D5,D6,D7,D8,D9,EN,LD,SD;
output CAO,Q0,Q1,Q10,Q11,Q12,Q13,Q14,Q15,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9;
endmodule
module CBUA4(CAI,CAO,CD,CLK,D0,D1,D2,D3,EN,LD,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CAI,CD,CLK,D0,D1,D2,D3,EN,LD,SD;
output CAO,Q0,Q1,Q2,Q3;
endmodule
module CBUA8(CAI,CAO,CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CAI,CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,SD;
output CAO,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CBUB4(CAI,CAO,CLK,CS,D0,D1,D2,D3,EN,LD,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CAI,CLK,CS,D0,D1,D2,D3,EN,LD,SD;
output CAO,Q0,Q1,Q2,Q3;
endmodule
module CBUB8(CAI,CAO,CLK,CS,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CAI,CLK,CS,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,SD;
output CAO,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CBUD1(Q0,CAO,D0,CAI,CLK,PS,LD,EN,DNUP,CD,CS); // synthesis syn_black_box
input D0,CAI,CLK,PS,LD,EN,DNUP,CD,CS;
output Q0,CAO;
endmodule
module CBUD2(Q0,Q1,CAO,D0,D1,CAI,CLK,PS,LD,EN,DNUP,CD,CS); // synthesis syn_black_box
input D0,D1,CAI,CLK,PS,LD,EN,DNUP,CD,CS;
output Q0,Q1,CAO;
endmodule
module CBUD4(Q0,Q1,Q2,Q3,CAO,D0,D1,D2,D3,CAI,CLK,PS,LD,EN,DNUP,CD,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,PS,LD,EN,DNUP,CD,CS;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CBUD4S(CAI,CAO,CD,CLK,CS,D0,D1,D2,D3,DNUP,EN,LD,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CAI,CD,CLK,CS,D0,D1,D2,D3,DNUP,EN,LD,SD;
output CAO,Q0,Q1,Q2,Q3;
endmodule
module CBUD8(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,DNUP,CD,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,DNUP,CD,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CBUD8S(CAI,CAO,CD,CLK,CS,D0,D1,D2,D3,D4,D5,D6,D7,DNUP,EN,LD,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CAI,CD,CLK,CS,D0,D1,D2,D3,D4,D5,D6,D7,DNUP,EN,LD,SD;
output CAO,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CDD14(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,LD,EN,CD;
output Q0,Q1,Q2,Q3;
endmodule
module CDD18(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CLK,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CLK,LD,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CDD24(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,LD,EN,CS;
output Q0,Q1,Q2,Q3;
endmodule
module CDD28(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CLK,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CLK,LD,EN,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CDD34(Q0,Q1,Q2,Q3,CAO,D0,D1,D2,D3,CAI,CLK,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,LD,EN,CD;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CDD38(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,LD,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CDD44(Q0,Q1,Q2,Q3,CAO,D0,D1,D2,D3,CAI,CLK,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,LD,EN,CS;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CDD48(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,LD,EN,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CDU14(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,LD,EN,CD;
output Q0,Q1,Q2,Q3;
endmodule
module CDU18(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CLK,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CLK,LD,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CDU24(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,LD,EN,CS;
output Q0,Q1,Q2,Q3;
endmodule
module CDU28(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CLK,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CLK,LD,EN,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CDU34(Q0,Q1,Q2,Q3,CAO,D0,D1,D2,D3,CAI,CLK,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,LD,EN,CD;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CDU38(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,LD,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CDU44(Q0,Q1,Q2,Q3,CAO,D0,D1,D2,D3,CAI,CLK,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,LD,EN,CS;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CDU48(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,LD,EN,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CDUD4(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,LD,EN,DNUP,CD,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,LD,EN,DNUP,CD,CS;
output Q0,Q1,Q2,Q3;
endmodule
module CDUD4C(Q0,Q1,Q2,Q3,CAO,D0,D1,D2,D3,CAI,CLK,LD,EN,DNUP,CD,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,LD,EN,DNUP,CD,CS;
output Q0,Q1,Q2,Q3,CAO;
endmodule
module CDUD8(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CLK,LD,EN,DNUP,CD,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CLK,LD,EN,DNUP,CD,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module CDUD8C(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,LD,EN,DNUP,CD,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,LD,EN,DNUP,CD,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAO;
endmodule
module CGD14(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,PS,LD,EN,CD;
output Q0,Q1,Q2,Q3;
endmodule
module CGD24(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,PS,LD,EN,CS;
output Q0,Q1,Q2,Q3;
endmodule
module CGD34(CD,CLK,D0,D1,D2,D3,EN,LD,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,EN,LD,SD;
output Q0,Q1,Q2,Q3;
endmodule
module CGU14(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,PS,LD,EN,CD;
output Q0,Q1,Q2,Q3;
endmodule
module CGU24(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,PS,LD,EN,CS;
output Q0,Q1,Q2,Q3;
endmodule
module CGU34(CD,CLK,D0,D1,D2,D3,EN,LD,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,EN,LD,SD;
output Q0,Q1,Q2,Q3;
endmodule
module CGUD4(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,PS,LD,EN,DNUP,CD,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,PS,LD,EN,DNUP,CD,CS;
output Q0,Q1,Q2,Q3;
endmodule
module CGUD4S(CD,CLK,CS,D0,D1,D2,D3,DNUP,EN,LD,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CD,CLK,CS,D0,D1,D2,D3,DNUP,EN,LD,SD;
output Q0,Q1,Q2,Q3;
endmodule
module CMP2(EQ,A0,A1,B0,B1); // synthesis syn_black_box
input A0,A1,B0,B1;
output EQ;
endmodule
module CMP4(EQ,A0,A1,A2,A3,B0,B1,B2,B3); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3;
output EQ;
endmodule
module CMP8(EQ,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7;
output EQ;
endmodule
module DEC2(Z0,Z1,S0); // synthesis syn_black_box
input S0;
output Z0,Z1;
endmodule
module DEC2E(Z0,Z1,EN,S0); // synthesis syn_black_box
input EN,S0;
output Z0,Z1;
endmodule
module DEC3(Z0,Z1,Z2,S0,S1); // synthesis syn_black_box
input S0,S1;
output Z0,Z1,Z2;
endmodule
module DEC3E(Z0,Z1,Z2,EN,S0,S1); // synthesis syn_black_box
input EN,S0,S1;
output Z0,Z1,Z2;
endmodule
module DEC4(Z0,Z1,Z2,Z3,S0,S1); // synthesis syn_black_box
input S0,S1;
output Z0,Z1,Z2,Z3;
endmodule
module DEC4E(Z0,Z1,Z2,Z3,EN,S0,S1); // synthesis syn_black_box
input EN,S0,S1;
output Z0,Z1,Z2,Z3;
endmodule
module DMUX2(Z0,Z1,A0,S0); // synthesis syn_black_box
input A0,S0;
output Z0,Z1;
endmodule
module DMUX22(Y0,Y1,Z0,Z1,A0,A1,S0); // synthesis syn_black_box
input A0,A1,S0;
output Y0,Y1,Z0,Z1;
endmodule
module DMUX22E(Y0,Y1,Z0,Z1,A0,A1,EN,S0); // synthesis syn_black_box
input A0,A1,EN,S0;
output Y0,Y1,Z0,Z1;
endmodule
module DMUX24(W0,W1,X0,X1,Y0,Y1,Z0,Z1,A0,A1,S0,S1); // synthesis syn_black_box
input A0,A1,S0,S1;
output W0,W1,Y0,Y1,Z0,Z1;
output X0 /* synthesis .ispad=1 */,
      X1 /* synthesis .ispad=1 */;
endmodule
module DMUX24E(W0,W1,X0,X1,Y0,Y1,Z0,Z1,A0,A1,EN,S0,S1); // synthesis syn_black_box
input A0,A1,EN,S0,S1;
output W0,W1,Y0,Y1,Z0,Z1;
output X0 /* synthesis .ispad=1 */,
      X1 /* synthesis .ispad=1 */;
endmodule
module DMUX2E(Z0,Z1,A0,EN,S0); // synthesis syn_black_box
input A0,EN,S0;
output Z0,Z1;
endmodule
module DMUX4(Z0,Z1,Z2,Z3,A0,S0,S1); // synthesis syn_black_box
input A0,S0,S1;
output Z0,Z1,Z2,Z3;
endmodule
module DMUX42(Y0,Y1,Y2,Y3,Z0,Z1,Z2,Z3,A0,A1,A2,A3,S0); // synthesis syn_black_box
input A0,A1,A2,A3,S0;
output Y0,Y1,Y2,Y3,Z0,Z1,Z2,Z3;
endmodule
module DMUX42E(Y0,Y1,Y2,Y3,Z0,Z1,Z2,Z3,A0,A1,A2,A3,EN,S0); // synthesis syn_black_box
input A0,A1,A2,A3,EN,S0;
output Y0,Y1,Y2,Y3,Z0,Z1,Z2,Z3;
endmodule
module DMUX44(W0,W1,W2,W3,X0,X1,X2,X3,Y0,Y1,Y2,Y3,Z0,Z1,Z2,Z3,A0,A1,A2,A3,S0,S1); // synthesis syn_black_box
input A0,A1,A2,A3,S0,S1;
output W0,W1,W2,W3,Y0,Y1,Y2,Y3,Z0,Z1,Z2,Z3;
output X0 /* synthesis .ispad=1 */,
      X1 /* synthesis .ispad=1 */,
      X2 /* synthesis .ispad=1 */,
      X3 /* synthesis .ispad=1 */;
endmodule
module DMUX44E(W0,W1,W2,W3,X0,X1,X2,X3,Y0,Y1,Y2,Y3,Z0,Z1,Z2,Z3,A0,A1,A2,A3,EN,S0,S1); // synthesis syn_black_box
input A0,A1,A2,A3,EN,S0,S1;
output W0,W1,W2,W3,Y0,Y1,Y2,Y3,Z0,Z1,Z2,Z3;
output X0 /* synthesis .ispad=1 */,
      X1 /* synthesis .ispad=1 */,
      X2 /* synthesis .ispad=1 */,
      X3 /* synthesis .ispad=1 */;
endmodule
module DMUX4E(Z0,Z1,Z2,Z3,A0,EN,S0,S1); // synthesis syn_black_box
input A0,EN,S0,S1;
output Z0,Z1,Z2,Z3;
endmodule
module DMUX82(Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,A0,A1,A2,A3,A4,A5,A6,A7,S0); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,S0;
output Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7;
endmodule
module DMUX82E(Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,A0,A1,A2,A3,A4,A5,A6,A7,EN,S0); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,EN,S0;
output Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7;
endmodule
module F3ADD(Z0,Z1,Z2,G012,P012,A0,A1,A2,B0,B1,B2,CI); // synthesis syn_black_box
input A0,A1,A2,B0,B1,B2,CI;
output Z0,Z1,Z2,G012,P012;
endmodule
module F3SUB(Z0,Z1,Z2,G012,P012,A0,A1,A2,B0,B1,B2,BI); // synthesis syn_black_box
input A0,A1,A2,B0,B1,B2,BI;
output Z0,Z1,Z2,G012,P012;
endmodule
module FD11(Q0,D0,CLK); // synthesis syn_black_box
input D0,CLK;
output Q0;
endmodule
module FD11E(Q0,D0,CLK,EN); // synthesis syn_black_box
input D0,CLK,EN;
output Q0;
endmodule
module FD14(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK); // synthesis syn_black_box
input D0,D1,D2,D3,CLK;
output Q0,Q1,Q2,Q3;
endmodule
module FD14E(CLK,D0,D1,D2,D3,EN,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,EN;
output Q0,Q1,Q2,Q3;
endmodule
module FD18(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CLK); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CLK;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FD18E(CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FD21(Q0,D0,CLK,CD); // synthesis syn_black_box
input CLK,D0,CD;
output Q0;
endmodule
module FD21E(Q0,D0,CLK,EN,CD); // synthesis syn_black_box
input CLK,D0,EN,CD;
output Q0;
endmodule
module FD24(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,CD); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,CD;
output Q0,Q1,Q2,Q3;
endmodule
module FD24E(CD,CLK,D0,D1,D2,D3,EN,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,EN;
output Q0,Q1,Q2,Q3;
endmodule
module FD28(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CLK,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CLK,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FD28E(CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FD31(Q0,D0,CLK,PS); // synthesis syn_black_box
input D0,CLK,PS;
output Q0;
endmodule
module FD34(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,PS); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,PS;
output Q0,Q1,Q2,Q3;
endmodule
module FD38(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CLK,PS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CLK,PS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FD41(Q0,D0,CLK,PS,CD); // synthesis syn_black_box
input D0,CLK,PS,CD;
output Q0;
endmodule
module FD44(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,PS,CD); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,PS,CD;
output Q0,Q1,Q2,Q3;
endmodule
module FD48(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CLK,PS,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CLK,PS,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FD51(Q0,D0,CLK,PS,CS); // synthesis syn_black_box
input D0,CLK,PS,CS;
output Q0;
endmodule
module FD54(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,PS,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,PS,CS;
output Q0,Q1,Q2,Q3;
endmodule
module FD58(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CLK,PS,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CLK,PS,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FD61(Q0,D0,TI0,CLK,TE); // synthesis syn_black_box
input D0,TI0,CLK,TE;
output Q0;
endmodule
module FD64(Q0,Q1,Q2,Q3,D0,D1,D2,D3,TI0,TI1,TI2,TI3,CLK,TE); // synthesis syn_black_box
input D0,D1,D2,D3,TI0,TI1,TI2,TI3,CLK,TE;
output Q0,Q1,Q2,Q3;
endmodule
module FD68(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,CLK,TE); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,CLK,TE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FD71(Q0,D0,TI0,CLK,CD,TE); // synthesis syn_black_box
input D0,TI0,CLK,CD,TE;
output Q0;
endmodule
module FD74(Q0,Q1,Q2,Q3,D0,D1,D2,D3,TI0,TI1,TI2,TI3,CLK,CD,TE); // synthesis syn_black_box
input D0,D1,D2,D3,TI0,TI1,TI2,TI3,CLK,CD,TE;
output Q0,Q1,Q2,Q3;
endmodule
module FD78(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,CLK,CD,TE); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,CLK,CD,TE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FD81(Q0,D0,TI0,CLK,PS,TE); // synthesis syn_black_box
input D0,TI0,CLK,PS,TE;
output Q0;
endmodule
module FD84(Q0,Q1,Q2,Q3,D0,D1,D2,D3,TI0,TI1,TI2,TI3,CLK,PS,TE); // synthesis syn_black_box
input D0,D1,D2,D3,TI0,TI1,TI2,TI3,CLK,PS,TE;
output Q0,Q1,Q2,Q3;
endmodule
module FD88(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,CLK,PS,TE); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,CLK,PS,TE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FD91(Q0,D0,TI0,CLK,PS,CD,TE); // synthesis syn_black_box
input D0,TI0,CLK,PS,CD,TE;
output Q0;
endmodule
module FD94(Q0,Q1,Q2,Q3,D0,D1,D2,D3,TI0,TI1,TI2,TI3,CLK,PS,CD,TE); // synthesis syn_black_box
input D0,D1,D2,D3,TI0,TI1,TI2,TI3,CLK,PS,CD,TE;
output Q0,Q1,Q2,Q3;
endmodule
module FD98(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,CLK,PS,CD,TE); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,CLK,PS,CD,TE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FDA1(Q0,D0,TI0,CLK,PS,CS,TE); // synthesis syn_black_box
input D0,TI0,CLK,PS,CS,TE;
output Q0;
endmodule
module FDA4(Q0,Q1,Q2,Q3,D0,D1,D2,D3,TI0,TI1,TI2,TI3,CLK,PS,CS,TE); // synthesis syn_black_box
input D0,D1,D2,D3,TI0,TI1,TI2,TI3,CLK,PS,CS,TE;
output Q0,Q1,Q2,Q3;
endmodule
module FDA8(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,CLK,PS,CS,TE); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,CLK,PS,CS,TE;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FDB1(Q0,D0,CLK,SD); // synthesis syn_black_box
input D0,CLK,SD;
output Q0;
endmodule
module FDB4(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CLK,SD); // synthesis syn_black_box
input D0,D1,D2,D3,CLK,SD;
output Q0,Q1,Q2,Q3;
endmodule
module FDB8(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CLK,SD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CLK,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FDC1(Q0,D0,CLK,SD); // synthesis syn_black_box
input CLK,D0,SD;
output Q0;
endmodule
module FDC1E(Q0,D0,CLK,EN,SD); // synthesis syn_black_box
input CLK,D0,EN,SD;
output Q0;
endmodule
module FDC4(CLK,D0,D1,D2,D3,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,SD;
output Q0,Q1,Q2,Q3;
endmodule
module FDC4E(CLK,D0,D1,D2,D3,EN,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,EN,SD;
output Q0,Q1,Q2,Q3;
endmodule
module FDC8(CLK,D0,D1,D2,D3,D4,D5,D6,D7,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,D4,D5,D6,D7,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FDC8E(CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FDE1(Q0,D0,CLK,CD,SD); // synthesis syn_black_box
input CLK,D0,CD,SD;
output Q0;
endmodule
module FDE1E(Q0,D0,CLK,EN,CD,SD); // synthesis syn_black_box
input CLK,D0,EN,CD,SD;
output Q0;
endmodule
module FDE4(CD,CLK,D0,D1,D2,D3,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,SD;
output Q0,Q1,Q2,Q3;
endmodule
module FDE4E(CD,CLK,D0,D1,D2,D3,EN,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,EN,SD;
output Q0,Q1,Q2,Q3;
endmodule
module FDE8(CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FDE8E(CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FJK11(Q0,J0,K0,CLK); // synthesis syn_black_box
input J0,K0,CLK;
output Q0;
endmodule
module FJK21(Q0,J0,K0,CLK,CD); // synthesis syn_black_box
input J0,K0,CLK,CD;
output Q0;
endmodule
module FJK31(Q0,J0,K0,TI0,CLK,TE); // synthesis syn_black_box
input J0,K0,TI0,CLK,TE;
output Q0;
endmodule
module FJK41(Q0,J0,K0,TI0,CLK,CD,TE); // synthesis syn_black_box
input J0,K0,TI0,CLK,CD,TE;
output Q0;
endmodule
module FJK51(Q0,J0,K0,CLK,PS,CD); // synthesis syn_black_box
input J0,K0,CLK,PS,CD;
output Q0;
endmodule
module FJK61(CLK,J0,K0,SD,Q0); // synthesis syn_black_box
input CLK,J0,K0,SD;
output Q0;
endmodule
module FJK64(CLK,J0,J1,J2,J3,K0,K1,K2,K3,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CLK,J0,J1,J2,J3,K0,K1,K2,K3,SD;
output Q0,Q1,Q2,Q3;
endmodule
module FJK68(CLK,J0,J1,J2,J3,J4,J5,J6,J7,K0,K1,K2,K3,K4,K5,K6,K7,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CLK,J0,J1,J2,J3,J4,J5,J6,J7,K0,K1,K2,K3,K4,K5,K6,K7,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FJK71(CD,CLK,J0,K0,SD,Q0); // synthesis syn_black_box
input CD,CLK,J0,K0,SD;
output Q0;
endmodule
module FJK71E(CD,CLK,EN,J0,K0,SD,Q0); // synthesis syn_black_box
input CD,CLK,EN,J0,K0,SD;
output Q0;
endmodule
module FJK74(CD,CLK,J0,J1,J2,J3,K0,K1,K2,K3,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CD,CLK,J0,J1,J2,J3,K0,K1,K2,K3,SD;
output Q0,Q1,Q2,Q3;
endmodule
module FJK74E(CD,CLK,EN,J0,J1,J2,J3,K0,K1,K2,K3,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CD,CLK,EN,J0,J1,J2,J3,K0,K1,K2,K3,SD;
output Q0,Q1,Q2,Q3;
endmodule
module FJK78(CD,CLK,J0,J1,J2,J3,J4,J5,J6,J7,K0,K1,K2,K3,K4,K5,K6,K7,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CD,CLK,J0,J1,J2,J3,J4,J5,J6,J7,K0,K1,K2,K3,K4,K5,K6,K7,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FJK78E(CD,CLK,EN,J0,J1,J2,J3,J4,J5,J6,J7,K0,K1,K2,K3,K4,K5,K6,K7,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CD,CLK,EN,J0,J1,J2,J3,J4,J5,J6,J7,K0,K1,K2,K3,K4,K5,K6,K7,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module FT11(Q0,D0,CLK,CD); // synthesis syn_black_box
input D0,CLK,CD;
output Q0;
endmodule
module FT21(Q0,D0,CLK,PS,CS); // synthesis syn_black_box
input D0,CLK,PS,CS;
output Q0;
endmodule
module FTI21(Q0,T0,CLK,CD); // synthesis syn_black_box
input CLK,T0,CD;
output Q0;
endmodule
module FTI31(Q0,T0,CLK,SD); // synthesis syn_black_box
input CLK,T0,SD;
output Q0;
endmodule
module FTI41(Q0,T0,CLK,CD,SD); // synthesis syn_black_box
input CLK,T0,CD,SD;
output Q0;
endmodule
module IB11(Z0,XI0); // synthesis syn_black_box
input XI0 /* synthesis .ispad=1 */;
output Z0;
endmodule
module ID11(Q0,XI0,CLK); // synthesis syn_black_box
input CLK;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module ID11E(CLK,EN,Q0,XI0); // synthesis syn_black_box
input CLK,EN;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module ID14(Q0,Q1,Q2,Q3,XI0,XI1,XI2,XI3,CLK); // synthesis syn_black_box
input CLK;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module ID14E(CLK,EN,Q0,Q1,Q2,Q3,XI0,XI1,XI2,XI3); // synthesis syn_black_box
input CLK,EN;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module ID18(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XI0,XI1,XI2,XI3,XI4,XI5,XI6,XI7,CLK); // synthesis syn_black_box
input CLK;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */,
      XI4 /* synthesis .ispad=1 */,
      XI5 /* synthesis .ispad=1 */,
      XI6 /* synthesis .ispad=1 */,
      XI7 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module ID21(Q0,XI0,CLK); // synthesis syn_black_box
input CLK;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module ID24(Q0,Q1,Q2,Q3,XI0,XI1,XI2,XI3,CLK); // synthesis syn_black_box
input CLK;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module ID28(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XI0,XI1,XI2,XI3,XI4,XI5,XI6,XI7,CLK); // synthesis syn_black_box
input CLK;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */,
      XI4 /* synthesis .ispad=1 */,
      XI5 /* synthesis .ispad=1 */,
      XI6 /* synthesis .ispad=1 */,
      XI7 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module ID31(CD,CLK,Q0,XI0); // synthesis syn_black_box
input CD,CLK;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module ID31E(CD,CLK,EN,Q0,XI0); // synthesis syn_black_box
input CD,CLK,EN;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module ID34(CD,CLK,Q0,Q1,Q2,Q3,XI0,XI1,XI2,XI3); // synthesis syn_black_box
input CD,CLK;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module ID34E(CD,CLK,EN,Q0,Q1,Q2,Q3,XI0,XI1,XI2,XI3); // synthesis syn_black_box
input CD,CLK,EN;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module ID41(CLK,Q0,SD,XI0); // synthesis syn_black_box
input CLK,SD;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module ID41E(CLK,EN,Q0,SD,XI0); // synthesis syn_black_box
input CLK,EN,SD;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module ID44(CLK,Q0,Q1,Q2,Q3,SD,XI0,XI1,XI2,XI3); // synthesis syn_black_box
input CLK,SD;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module ID44E(CLK,EN,Q0,Q1,Q2,Q3,SD,XI0,XI1,XI2,XI3); // synthesis syn_black_box
input CLK,EN,SD;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module ID51(CD,CLK,Q0,SD,XI0); // synthesis syn_black_box
input CD,CLK,SD;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module ID51E(CD,CLK,EN,Q0,SD,XI0); // synthesis syn_black_box
input CD,CLK,EN,SD;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module ID54(CD,CLK,Q0,Q1,Q2,Q3,SD,XI0,XI1,XI2,XI3); // synthesis syn_black_box
input CD,CLK,SD;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module ID54E(CD,CLK,EN,Q0,Q1,Q2,Q3,SD,XI0,XI1,XI2,XI3); // synthesis syn_black_box
input CD,CLK,EN,SD;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module IL11(Q0,XI0,G); // synthesis syn_black_box
input G;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module IL14(Q0,Q1,Q2,Q3,XI0,XI1,XI2,XI3,G); // synthesis syn_black_box
input G;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module IL18(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XI0,XI1,XI2,XI3,XI4,XI5,XI6,XI7,G); // synthesis syn_black_box
input G;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */,
      XI4 /* synthesis .ispad=1 */,
      XI5 /* synthesis .ispad=1 */,
      XI6 /* synthesis .ispad=1 */,
      XI7 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module IL21(Q0,XI0,G); // synthesis syn_black_box
input G;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module IL24(Q0,Q1,Q2,Q3,XI0,XI1,XI2,XI3,G); // synthesis syn_black_box
input G;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module IL28(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,XI0,XI1,XI2,XI3,XI4,XI5,XI6,XI7,G); // synthesis syn_black_box
input G;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */,
      XI4 /* synthesis .ispad=1 */,
      XI5 /* synthesis .ispad=1 */,
      XI6 /* synthesis .ispad=1 */,
      XI7 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module IL31(CD,G,Q0,XI0); // synthesis syn_black_box
input CD,G;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module IL34(CD,G,Q0,Q1,Q2,Q3,XI0,XI1,XI2,XI3); // synthesis syn_black_box
input CD,G;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module IL41(G,Q0,SD,XI0); // synthesis syn_black_box
input G,SD;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module IL44(G,Q0,Q1,Q2,Q3,SD,XI0,XI1,XI2,XI3); // synthesis syn_black_box
input G,SD;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module IL51(CD,G,Q0,SD,XI0); // synthesis syn_black_box
input CD,G,SD;
input XI0 /* synthesis .ispad=1 */;
output Q0;
endmodule
module IL54(CD,G,Q0,Q1,Q2,Q3,SD,XI0,XI1,XI2,XI3); // synthesis syn_black_box
input CD,G,SD;
input XI0 /* synthesis .ispad=1 */,
      XI1 /* synthesis .ispad=1 */,
      XI2 /* synthesis .ispad=1 */,
      XI3 /* synthesis .ispad=1 */;
output Q0,Q1,Q2,Q3;
endmodule
module IT11(O0,A0,OE); // synthesis syn_black_box
input A0,OE;
output O0 /* synthesis syn_tristate=1 */;
endmodule
module IT14(A0,A1,A2,A3,O0,O1,O2,O3,OE); // synthesis syn_black_box
input A0,A1,A2,A3,OE;
output O0 /* synthesis syn_tristate=1 */;
output O1 /* synthesis syn_tristate=1 */;
output O2 /* synthesis syn_tristate=1 */;
output O3 /* synthesis syn_tristate=1 */;

endmodule
module IT18(A0,A1,A2,A3,A4,A5,A6,A7,O0,O1,O2,O3,O4,O5,O6,O7,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,OE;
output O0 /* synthesis syn_tristate=1 */;
output O1 /* synthesis syn_tristate=1 */;
output O2 /* synthesis syn_tristate=1 */;
output O3 /* synthesis syn_tristate=1 */;
output O4 /* synthesis syn_tristate=1 */;
output O5 /* synthesis syn_tristate=1 */;
output O6 /* synthesis syn_tristate=1 */;
output O7 /* synthesis syn_tristate=1 */;
endmodule
module IT21(A0,O0,OE); // synthesis syn_black_box
input A0,OE;
output O0 /* synthesis syn_tristate=1 */;
endmodule
module IT24(A0,A1,A2,A3,O0,O1,O2,O3,OE); // synthesis syn_black_box
input A0,A1,A2,A3,OE;
output O0 /* synthesis syn_tristate=1 */;
output O1 /* synthesis syn_tristate=1 */;
output O2 /* synthesis syn_tristate=1 */;
output O3 /* synthesis syn_tristate=1 */;
endmodule
module IT28(A0,A1,A2,A3,A4,A5,A6,A7,O0,O1,O2,O3,O4,O5,O6,O7,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,OE;
output O0 /* synthesis syn_tristate=1 */;
output O1 /* synthesis syn_tristate=1 */;
output O2 /* synthesis syn_tristate=1 */;
output O3 /* synthesis syn_tristate=1 */;
output O4 /* synthesis syn_tristate=1 */;
output O5 /* synthesis syn_tristate=1 */;
output O6 /* synthesis syn_tristate=1 */;
output O7 /* synthesis syn_tristate=1 */;
endmodule
module LD11(Q0,D0,G); // synthesis syn_black_box
input D0,G;
output Q0;
endmodule
module LD14(Q0,Q1,Q2,Q3,D0,D1,D2,D3,G); // synthesis syn_black_box
input D0,D1,D2,D3,G;
output Q0,Q1,Q2,Q3;
endmodule
module LD18(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,G); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,G;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LD21(Q0,D0,G,CD); // synthesis syn_black_box
input D0,G,CD;
output Q0;
endmodule
module LD24(Q0,Q1,Q2,Q3,D0,D1,D2,D3,G,CD); // synthesis syn_black_box
input D0,D1,D2,D3,G,CD;
output Q0,Q1,Q2,Q3;
endmodule
module LD28(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,G,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,G,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LD31(Q0,D0,G,PD); // synthesis syn_black_box
input D0,G,PD;
output Q0;
endmodule
module LD34(Q0,Q1,Q2,Q3,D0,D1,D2,D3,G,PD); // synthesis syn_black_box
input D0,D1,D2,D3,G,PD;
output Q0,Q1,Q2,Q3;
endmodule
module LD38(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,G,PD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,G,PD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LD41(Q0,D0,G,PD,CD); // synthesis syn_black_box
input D0,G,PD,CD;
output Q0;
endmodule
module LD44(Q0,Q1,Q2,Q3,D0,D1,D2,D3,G,PD,CD); // synthesis syn_black_box
input D0,D1,D2,D3,G,PD,CD;
output Q0,Q1,Q2,Q3;
endmodule
module LD48(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,G,PD,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,G,PD,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LD51(Q0,D0,G,PD,CD); // synthesis syn_black_box
input D0,G,PD,CD;
output Q0;
endmodule
module LD54(Q0,Q1,Q2,Q3,D0,D1,D2,D3,G,PD,CD); // synthesis syn_black_box
input D0,D1,D2,D3,G,PD,CD;
output Q0,Q1,Q2,Q3;
endmodule
module LD58(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,G,PD,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,G,PD,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LD61(Q0,D0,TI0,G,TG); // synthesis syn_black_box
input D0,TI0,G,TG;
output Q0;
endmodule
module LD64(Q0,Q1,Q2,Q3,D0,D1,D2,D3,TI0,TI1,TI2,TI3,G,TG); // synthesis syn_black_box
input D0,D1,D2,D3,TI0,TI1,TI2,TI3,G,TG;
output Q0,Q1,Q2,Q3;
endmodule
module LD68(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,G,TG); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,G,TG;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LD71(Q0,D0,TI0,G,CD,TG); // synthesis syn_black_box
input D0,TI0,G,CD,TG;
output Q0;
endmodule
module LD74(Q0,Q1,Q2,Q3,D0,D1,D2,D3,TI0,TI1,TI2,TI3,G,CD,TG); // synthesis syn_black_box
input D0,D1,D2,D3,TI0,TI1,TI2,TI3,G,CD,TG;
output Q0,Q1,Q2,Q3;
endmodule
module LD78(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,G,CD,TG); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,G,CD,TG;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LD81(Q0,D0,TI0,G,PD,TG); // synthesis syn_black_box
input D0,TI0,G,PD,TG;
output Q0;
endmodule
module LD84(Q0,Q1,Q2,Q3,D0,D1,D2,D3,TI0,TI1,TI2,TI3,G,PD,TG); // synthesis syn_black_box
input D0,D1,D2,D3,TI0,TI1,TI2,TI3,G,PD,TG;
output Q0,Q1,Q2,Q3;
endmodule
module LD88(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,G,PD,TG); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,G,PD,TG;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LD91(Q0,D0,TI0,G,PD,CD,TG); // synthesis syn_black_box
input D0,TI0,G,PD,CD,TG;
output Q0;
endmodule
module LD94(Q0,Q1,Q2,Q3,D0,D1,D2,D3,TI0,TI1,TI2,TI3,G,PD,CD,TG); // synthesis syn_black_box
input D0,D1,D2,D3,TI0,TI1,TI2,TI3,G,PD,CD,TG;
output Q0,Q1,Q2,Q3;
endmodule
module LD98(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,G,PD,CD,TG); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,G,PD,CD,TG;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LDA1(Q0,D0,TI0,G,PD,CD,TG); // synthesis syn_black_box
input D0,TI0,G,PD,CD,TG;
output Q0;
endmodule
module LDA4(Q0,Q1,Q2,Q3,D0,D1,D2,D3,TI0,TI1,TI2,TI3,G,PD,CD,TG); // synthesis syn_black_box
input D0,D1,D2,D3,TI0,TI1,TI2,TI3,G,PD,CD,TG;
output Q0,Q1,Q2,Q3;
endmodule
module LDA8(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,G,PD,CD,TG); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,TI0,TI1,TI2,TI3,TI4,TI5,TI6,TI7,G,PD,CD,TG;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LDI11(Q0,D0,G); // synthesis syn_black_box
input D0,G;
output Q0;
endmodule
module LDI14(D0,D1,D2,D3,G,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input D0,D1,D2,D3,G;
output Q0,Q1,Q2,Q3;
endmodule
module LDI18(D0,D1,D2,D3,D4,D5,D6,D7,G,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,G;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LDI21(Q0,D0,G,CD); // synthesis syn_black_box
input D0,G,CD;
output Q0;
endmodule
module LDI24(CD,D0,D1,D2,D3,G,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CD,D0,D1,D2,D3,G;
output Q0,Q1,Q2,Q3;
endmodule
module LDI28(CD,D0,D1,D2,D3,D4,D5,D6,D7,G,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CD,D0,D1,D2,D3,D4,D5,D6,D7,G;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LDI31(Q0,D0,G,SD); // synthesis syn_black_box
input D0,G,SD;
output Q0;
endmodule
module LDI34(D0,D1,D2,D3,G,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input D0,D1,D2,D3,G,SD;
output Q0,Q1,Q2,Q3;
endmodule
module LDI38(D0,D1,D2,D3,D4,D5,D6,D7,G,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,G,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LDI41(Q0,D0,G,CD,SD); // synthesis syn_black_box
input D0,G,CD,SD;
output Q0;
endmodule
module LDI44(CD,D0,D1,D2,D3,G,SD,Q0,Q1,Q2,Q3); // synthesis syn_black_box
input CD,D0,D1,D2,D3,G,SD;
output Q0,Q1,Q2,Q3;
endmodule
module LDI48(CD,D0,D1,D2,D3,D4,D5,D6,D7,G,SD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7); // synthesis syn_black_box
input CD,D0,D1,D2,D3,D4,D5,D6,D7,G,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module LSR1(Q0,S0,R0); // synthesis syn_black_box
input S0,R0;
output Q0;
endmodule
module LSR2(Q0,S0,S1,R0,R1); // synthesis syn_black_box
input S0,S1,R0,R1;
output Q0;
endmodule
module LXOR2(Z0,A0,A1); // synthesis syn_black_box
input A0,A1;
output Z0;
endmodule
module MAG2(GT,EQ,LT,A0,A1,B0,B1,GTI,EQI,LTI); // synthesis syn_black_box
input A0,A1,B0,B1,GTI,EQI,LTI;
output GT,EQ,LT;
endmodule
module MAG4(GT,EQ,LT,A0,A1,A2,A3,B0,B1,B2,B3,GTI,EQI,LTI); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3,GTI,EQI,LTI;
output GT,EQ,LT;
endmodule
module MAG8(GT,EQ,LT,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,GTI,EQI,LTI); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,GTI,EQI,LTI;
output GT,EQ,LT;
endmodule
module MULT24(Z0,Z1,Z2,Z3,Z4,Z5,A0,A1,B0,B1,B2,B3); // synthesis syn_black_box
input A0,A1,B0,B1,B2,B3;
output Z0,Z1,Z2,Z3,Z4,Z5;
endmodule
module MULT44(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,A0,A1,A2,A3,B0,B1,B2,B3); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7;
endmodule
module MUX16(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,S0,S1,S2,S3); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,S0,S1,S2,S3;
output Z0;
endmodule
module MUX16E(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,EN,S0,S1,S2,S3); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,EN,S0,S1,S2,S3;
output Z0;
endmodule
module MUX2(Z0,A0,A1,S0); // synthesis syn_black_box
input A0,A1,S0;
output Z0;
endmodule
module MUX22(Z0,Z1,A0,A1,B0,B1,S0); // synthesis syn_black_box
input A0,A1,B0,B1,S0;
output Z0,Z1;
endmodule
module MUX22E(Z0,Z1,A0,A1,B0,B1,EN,S0); // synthesis syn_black_box
input A0,A1,B0,B1,EN,S0;
output Z0,Z1;
endmodule
module MUX24(Z0,Z1,A0,A1,B0,B1,C0,C1,D0,D1,S0,S1); // synthesis syn_black_box
input A0,A1,B0,B1,C0,C1,D0,D1,S0,S1;
output Z0,Z1;
endmodule
module MUX24E(Z0,Z1,A0,A1,B0,B1,C0,C1,D0,D1,EN,S0,S1); // synthesis syn_black_box
input A0,A1,B0,B1,C0,C1,D0,D1,EN,S0,S1;
output Z0,Z1;
endmodule
module MUX2E(Z0,A0,A1,EN,S0); // synthesis syn_black_box
input A0,A1,EN,S0;
output Z0;
endmodule
module MUX4(Z0,A0,A1,A2,A3,S0,S1); // synthesis syn_black_box
input A0,A1,A2,A3,S0,S1;
output Z0;
endmodule
module MUX42(Z0,Z1,Z2,Z3,A0,A1,A2,A3,B0,B1,B2,B3,S0); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3,S0;
output Z0,Z1,Z2,Z3;
endmodule
module MUX42E(Z0,Z1,Z2,Z3,A0,A1,A2,A3,B0,B1,B2,B3,EN,S0); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3,EN,S0;
output Z0,Z1,Z2,Z3;
endmodule
module MUX44(Z0,Z1,Z2,Z3,A0,A1,A2,A3,B0,B1,B2,B3,C0,C1,C2,C3,D0,D1,D2,D3,S0,S1); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3,C0,C1,C2,C3,D0,D1,D2,D3,S0,S1;
output Z0,Z1,Z2,Z3;
endmodule
module MUX44A(Z0,Z1,Z2,Z3,A0,A1,A2,A3,B0,B1,B2,B3,C0,C1,C2,C3,D0,D1,D2,D3,S0,S1); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3,C0,C1,C2,C3,D0,D1,D2,D3,S0,S1;
output Z0,Z1,Z2,Z3;
endmodule
module MUX44AE(Z0,Z1,Z2,Z3,A0,A1,A2,A3,B0,B1,B2,B3,C0,C1,C2,C3,D0,D1,D2,D3,EN,S0,S1); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3,C0,C1,C2,C3,D0,D1,D2,D3,EN,S0,S1;
output Z0,Z1,Z2,Z3;
endmodule
module MUX44E(Z0,Z1,Z2,Z3,A0,A1,A2,A3,B0,B1,B2,B3,C0,C1,C2,C3,D0,D1,D2,D3,EN,S0,S1); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3,C0,C1,C2,C3,D0,D1,D2,D3,EN,S0,S1;
output Z0,Z1,Z2,Z3;
endmodule
module MUX4E(Z0,A0,A1,A2,A3,EN,S0,S1); // synthesis syn_black_box
input A0,A1,A2,A3,EN,S0,S1;
output Z0;
endmodule
module MUX8(Z0,A0,A1,A2,A3,A4,A5,A6,A7,S0,S1,S2); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,S0,S1,S2;
output Z0;
endmodule
module MUX82(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,S0); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,S0;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7;
endmodule
module MUX82E(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,EN,S0); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,EN,S0;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7;
endmodule
module MUX8E(Z0,A0,A1,A2,A3,A4,A5,A6,A7,EN,S0,S1,S2); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,EN,S0,S1,S2;
output Z0;
endmodule
module NAND10(ZN0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9;
output ZN0;
endmodule
module NAND11(ZN0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10;
output ZN0;
endmodule
module NAND12(ZN0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11;
output ZN0;
endmodule
module NAND16(ZN0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15;
output ZN0;
endmodule
module NAND2(ZN0,A0,A1); // synthesis syn_black_box
input A0,A1;
output ZN0;
endmodule
module NAND3(ZN0,A0,A1,A2); // synthesis syn_black_box
input A0,A1,A2;
output ZN0;
endmodule
module NAND4(ZN0,A0,A1,A2,A3); // synthesis syn_black_box
input A0,A1,A2,A3;
output ZN0;
endmodule
module NAND5(ZN0,A0,A1,A2,A3,A4); // synthesis syn_black_box
input A0,A1,A2,A3,A4;
output ZN0;
endmodule
module NAND6(ZN0,A0,A1,A2,A3,A4,A5); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5;
output ZN0;
endmodule
module NAND7(ZN0,A0,A1,A2,A3,A4,A5,A6); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6;
output ZN0;
endmodule
module NAND8(ZN0,A0,A1,A2,A3,A4,A5,A6,A7); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7;
output ZN0;
endmodule
module NAND9(ZN0,A0,A1,A2,A3,A4,A5,A6,A7,A8); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8;
output ZN0;
endmodule
module NOR10(ZN0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9;
output ZN0;
endmodule
module NOR11(ZN0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10;
output ZN0;
endmodule
module NOR12(ZN0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11;
output ZN0;
endmodule
module NOR16(ZN0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15;
output ZN0;
endmodule
module NOR9(ZN0,A0,A1,A2,A3,A4,A5,A6,A7,A8); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8;
output ZN0;
endmodule
module OB11(XO0,A0); // synthesis syn_black_box
input A0;
output XO0 /* synthesis .ispad=1 */;
endmodule
module OB21(XO0,A0); // synthesis syn_black_box
input A0;
output XO0 /* synthesis .ispad=1 */;
endmodule
module OB24(XO0,XO1,XO2,XO3,A0,A1,A2,A3); // synthesis syn_black_box
input A0,A1,A2,A3;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module OB28(XO0,XO1,XO2,XO3,XO4,XO5,XO6,XO7,A0,A1,A2,A3,A4,A5,A6,A7); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */,
      XO4 /* synthesis .ispad=1 */,
      XO5 /* synthesis .ispad=1 */,
      XO6 /* synthesis .ispad=1 */,
      XO7 /* synthesis .ispad=1 */;
endmodule
module OD11(CLK,D0,XQ0); // synthesis syn_black_box
input CLK,D0;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OD11E(CLK,D0,EN,XQ0); // synthesis syn_black_box
input CLK,D0,EN;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OD14(CLK,D0,D1,D2,D3,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OD14E(CLK,D0,D1,D2,D3,EN,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,EN;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OD21(CLK,D0,XQ0); // synthesis syn_black_box
input CLK,D0;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OD24(CLK,D0,D1,D2,D3,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OD31(CD,CLK,D0,XQ0); // synthesis syn_black_box
input CD,CLK,D0;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OD31E(CD,CLK,D0,EN,XQ0); // synthesis syn_black_box
input CD,CLK,D0,EN;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OD34(CD,CLK,D0,D1,D2,D3,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OD34E(CD,CLK,D0,D1,D2,D3,EN,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,EN;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OD41(CLK,D0,SD,XQ0); // synthesis syn_black_box
input CLK,D0,SD;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OD41E(CLK,D0,EN,SD,XQ0); // synthesis syn_black_box
input CLK,D0,EN,SD;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OD44(CLK,D0,D1,D2,D3,SD,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,SD;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OD44E(CLK,D0,D1,D2,D3,EN,SD,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,EN,SD;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OD51(CD,CLK,D0,SD,XQ0); // synthesis syn_black_box
input CD,CLK,D0,SD;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OD51E(CD,CLK,D0,EN,SD,XQ0); // synthesis syn_black_box
input CD,CLK,D0,EN,SD;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OD54(CD,CLK,D0,D1,D2,D3,SD,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,SD;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OD54E(CD,CLK,D0,D1,D2,D3,EN,SD,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,EN,SD;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module ODT11(CLK,D0,OE,XO0); // synthesis syn_black_box
input CLK,D0,OE;
output XO0 /* synthesis .ispad=1 */;
endmodule
module ODT11E(CLK,D0,EN,OE,XO0); // synthesis syn_black_box
input CLK,D0,EN,OE;
output XO0 /* synthesis .ispad=1 */;
endmodule
module ODT14(CLK,D0,D1,D2,D3,OE,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module ODT14E(CLK,D0,D1,D2,D3,EN,OE,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,EN,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module ODT21(CD,CLK,D0,OE,XO0); // synthesis syn_black_box
input CD,CLK,D0,OE;
output XO0 /* synthesis .ispad=1 */;
endmodule
module ODT21E(CD,CLK,D0,EN,OE,XO0); // synthesis syn_black_box
input CD,CLK,D0,EN,OE;
output XO0 /* synthesis .ispad=1 */;
endmodule
module ODT24(CD,CLK,D0,D1,D2,D3,OE,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module ODT24E(CD,CLK,D0,D1,D2,D3,EN,OE,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,EN,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module ODT31(CLK,D0,OE,SD,XO0); // synthesis syn_black_box
input CLK,D0,OE,SD;
output XO0 /* synthesis .ispad=1 */;
endmodule
module ODT31E(CLK,D0,EN,OE,SD,XO0); // synthesis syn_black_box
input CLK,D0,EN,OE,SD;
output XO0 /* synthesis .ispad=1 */;
endmodule
module ODT34(CLK,D0,D1,D2,D3,OE,SD,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,OE,SD;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module ODT34E(CLK,D0,D1,D2,D3,EN,OE,SD,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input CLK,D0,D1,D2,D3,EN,OE,SD;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module ODT41(CD,CLK,D0,OE,SD,XO0); // synthesis syn_black_box
input CD,CLK,D0,OE,SD;
output XO0 /* synthesis .ispad=1 */;
endmodule
module ODT41E(CD,CLK,D0,EN,OE,SD,XO0); // synthesis syn_black_box
input CD,CLK,D0,EN,OE,SD;
output XO0 /* synthesis .ispad=1 */;
endmodule
module ODT44(CD,CLK,D0,D1,D2,D3,OE,SD,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,OE,SD;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module ODT44E(CD,CLK,D0,D1,D2,D3,EN,OE,SD,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input CD,CLK,D0,D1,D2,D3,EN,OE,SD;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module OL11(D0,G,XQ0); // synthesis syn_black_box
input D0,G;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OL14(D0,D1,D2,D3,G,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input D0,D1,D2,D3,G;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OL21(D0,G,XQ0); // synthesis syn_black_box
input D0,G;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OL24(D0,D1,D2,D3,G,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input D0,D1,D2,D3,G;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OL31(CD,D0,G,XQ0); // synthesis syn_black_box
input CD,D0,G;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OL34(CD,D0,D1,D2,D3,G,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input CD,D0,D1,D2,D3,G;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OL41(D0,G,SD,XQ0); // synthesis syn_black_box
input D0,G,SD;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OL44(D0,D1,D2,D3,G,SD,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input D0,D1,D2,D3,G,SD;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OL51(CD,D0,G,SD,XQ0); // synthesis syn_black_box
input CD,D0,G,SD;
output XQ0 /* synthesis .ispad=1 */;
endmodule
module OL54(CD,D0,D1,D2,D3,G,SD,XQ0,XQ1,XQ2,XQ3); // synthesis syn_black_box
input CD,D0,D1,D2,D3,G,SD;
output XQ0 /* synthesis .ispad=1 */,
      XQ1 /* synthesis .ispad=1 */,
      XQ2 /* synthesis .ispad=1 */,
      XQ3 /* synthesis .ispad=1 */;
endmodule
module OLT11(D0,G,OE,XO0); // synthesis syn_black_box
input D0,G,OE;
output XO0 /* synthesis .ispad=1 */;
endmodule
module OLT14(D0,D1,D2,D3,G,OE,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input D0,D1,D2,D3,G,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module OLT21(CD,D0,G,OE,XO0); // synthesis syn_black_box
input CD,D0,G,OE;
output XO0 /* synthesis .ispad=1 */;
endmodule
module OLT24(CD,D0,D1,D2,D3,G,OE,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input CD,D0,D1,D2,D3,G,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module OLT31(D0,G,OE,SD,XO0); // synthesis syn_black_box
input D0,G,OE,SD;
output XO0 /* synthesis .ispad=1 */;
endmodule
module OLT34(D0,D1,D2,D3,G,OE,SD,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input D0,D1,D2,D3,G,OE,SD;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module OLT41(CD,D0,G,OE,SD,XO0); // synthesis syn_black_box
input CD,D0,G,OE,SD;
output XO0 /* synthesis .ispad=1 */;
endmodule
module OLT44(CD,D0,D1,D2,D3,G,OE,SD,XO0,XO1,XO2,XO3); // synthesis syn_black_box
input CD,D0,D1,D2,D3,G,OE,SD;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module OR10(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9;
output Z0;
endmodule
module OR11(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10;
output Z0;
endmodule
module OR12(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11;
output Z0;
endmodule
module OR16(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15;
output Z0;
endmodule
module OR9(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8;
output Z0;
endmodule
module OT11(XO0,A0,OE); // synthesis syn_black_box
input A0,OE;
output XO0 /* synthesis .ispad=1 */;
endmodule
module OT14(XO0,XO1,XO2,XO3,A0,A1,A2,A3,OE); // synthesis syn_black_box
input A0,A1,A2,A3,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module OT18(XO0,XO1,XO2,XO3,XO4,XO5,XO6,XO7,A0,A1,A2,A3,A4,A5,A6,A7,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */,
      XO4 /* synthesis .ispad=1 */,
      XO5 /* synthesis .ispad=1 */,
      XO6 /* synthesis .ispad=1 */,
      XO7 /* synthesis .ispad=1 */;
endmodule
module OT21(XO0,A0,OE); // synthesis syn_black_box
input A0,OE;
output XO0 /* synthesis .ispad=1 */;
endmodule
module OT24(XO0,XO1,XO2,XO3,A0,A1,A2,A3,OE); // synthesis syn_black_box
input A0,A1,A2,A3,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module OT28(XO0,XO1,XO2,XO3,XO4,XO5,XO6,XO7,A0,A1,A2,A3,A4,A5,A6,A7,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */,
      XO4 /* synthesis .ispad=1 */,
      XO5 /* synthesis .ispad=1 */,
      XO6 /* synthesis .ispad=1 */,
      XO7 /* synthesis .ispad=1 */;
endmodule
module OT31(XO0,A0,OE); // synthesis syn_black_box
input A0,OE;
output XO0 /* synthesis .ispad=1 */;
endmodule
module OT34(XO0,XO1,XO2,XO3,A0,A1,A2,A3,OE); // synthesis syn_black_box
input A0,A1,A2,A3,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module OT38(XO0,XO1,XO2,XO3,XO4,XO5,XO6,XO7,A0,A1,A2,A3,A4,A5,A6,A7,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */,
      XO4 /* synthesis .ispad=1 */,
      XO5 /* synthesis .ispad=1 */,
      XO6 /* synthesis .ispad=1 */,
      XO7 /* synthesis .ispad=1 */;
endmodule
module OT41(XO0,A0,OE); // synthesis syn_black_box
input A0,OE;
output XO0 /* synthesis .ispad=1 */;
endmodule
module OT44(XO0,XO1,XO2,XO3,A0,A1,A2,A3,OE); // synthesis syn_black_box
input A0,A1,A2,A3,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */;
endmodule
module OT48(XO0,XO1,XO2,XO3,XO4,XO5,XO6,XO7,A0,A1,A2,A3,A4,A5,A6,A7,OE); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,OE;
output XO0 /* synthesis .ispad=1 */,
      XO1 /* synthesis .ispad=1 */,
      XO2 /* synthesis .ispad=1 */,
      XO3 /* synthesis .ispad=1 */,
      XO4 /* synthesis .ispad=1 */,
      XO5 /* synthesis .ispad=1 */,
      XO6 /* synthesis .ispad=1 */,
      XO7 /* synthesis .ispad=1 */;
endmodule
module PG1(PGO1,GI1,PI1,PGI1); // synthesis syn_black_box
input GI1,PI1,PGI1;
output PGO1;
endmodule
module PG2(PGO2,GI2,PI2,GI1,PI1,PGI1); // synthesis syn_black_box
input GI2,PI2,GI1,PI1,PGI1;
output PGO2;
endmodule
module PG3(PGO3,GI3,PI3,GI2,PI2,GI1,PI1,PGI1); // synthesis syn_black_box
input GI3,PI3,GI2,PI2,GI1,PI1,PGI1;
output PGO3;
endmodule
module PG4(PGO4,GI4,PI4,GI3,PI3,GI2,PI2,GI1,PI1,PGI1); // synthesis syn_black_box
input GI4,PI4,GI3,PI3,GI2,PI2,GI1,PI1,PGI1;
output PGO4;
endmodule
module PREN10(Z0,Z1,Z2,Z3,S0,S1,S2,S3,S4,S5,S6,S7,S8); // synthesis syn_black_box
input S0,S1,S2,S3,S4,S5,S6,S7,S8;
output Z0,Z1,Z2,Z3;
endmodule
module PREN10E(Z0,Z1,Z2,Z3,S0,S1,S2,S3,S4,S5,S6,S7,S8,EN); // synthesis syn_black_box
input S0,S1,S2,S3,S4,S5,S6,S7,S8,EN;
output Z0,Z1,Z2,Z3;
endmodule
module PREN16(Z0,Z1,Z2,Z3,S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14); // synthesis syn_black_box
input S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14;
output Z0,Z1,Z2,Z3;
endmodule
module PREN16E(Z0,Z1,Z2,Z3,S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,EN); // synthesis syn_black_box
input S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,EN;
output Z0,Z1,Z2,Z3;
endmodule
module PREN8(Z0,Z1,Z2,S0,S1,S2,S3,S4,S5,S6); // synthesis syn_black_box
input S0,S1,S2,S3,S4,S5,S6;
output Z0,Z1,Z2;
endmodule
module PREN8E(Z0,Z1,Z2,S0,S1,S2,S3,S4,S5,S6,EN); // synthesis syn_black_box
input S0,S1,S2,S3,S4,S5,S6,EN;
output Z0,Z1,Z2;
endmodule
module SRR11(Q0,CAI,CLK,CD); // synthesis syn_black_box
input CAI,CLK,CD;
output Q0;
endmodule
module SRR14(Q0,Q1,Q2,Q3,CAI,CLK,CD); // synthesis syn_black_box
input CAI,CLK,CD;
output Q0,Q1,Q2,Q3;
endmodule
module SRR18(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAI,CLK,CD); // synthesis syn_black_box
input CAI,CLK,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module SRR21(Q0,CAI,CLK,EN,CD); // synthesis syn_black_box
input CAI,CLK,EN,CD;
output Q0;
endmodule
module SRR24(Q0,Q1,Q2,Q3,CAI,CLK,EN,CD); // synthesis syn_black_box
input CAI,CLK,EN,CD;
output Q0,Q1,Q2,Q3;
endmodule
module SRR28(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,CAI,CLK,EN,CD); // synthesis syn_black_box
input CAI,CLK,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module SRR31(Q0,D0,CAI,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,CAI,CLK,PS,LD,EN,CD;
output Q0;
endmodule
module SRR34(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CD;
output Q0,Q1,Q2,Q3;
endmodule
module SRR38(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CD); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module SRR41(Q0,D0,CAI,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,CAI,CLK,PS,LD,EN,CS;
output Q0;
endmodule
module SRR44(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CAI,CLK,PS,LD,EN,CS;
output Q0,Q1,Q2,Q3;
endmodule
module SRR48(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAI,CLK,PS,LD,EN,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module SRR51(CAI,CD,CLK,D0,EN,LD,Q0,SD); // synthesis syn_black_box
input CAI,CD,CLK,D0,EN,LD,SD;
output Q0;
endmodule
module SRR54(CAI,CD,CLK,D0,D1,D2,D3,EN,LD,Q0,Q1,Q2,Q3,SD); // synthesis syn_black_box
input CAI,CD,CLK,D0,D1,D2,D3,EN,LD,SD;
output Q0,Q1,Q2,Q3;
endmodule
module SRR58(CAI,CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,SD); // synthesis syn_black_box
input CAI,CD,CLK,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module SRRL1(Q0,D0,CAIR,CAIL,CLK,PS,LD,EN,RL,CD,CS); // synthesis syn_black_box
input D0,CAIR,CAIL,CLK,PS,LD,EN,RL,CD,CS;
output Q0;
endmodule
module SRRL1S(CAIL,CAIR,CD,CLK,CS,D0,EN,LD,PS,Q0,RL,SD); // synthesis syn_black_box
input CAIL,CAIR,CD,CLK,CS,D0,EN,LD,PS,RL,SD;
output Q0;
endmodule
module SRRL4(Q0,Q1,Q2,Q3,D0,D1,D2,D3,CAIR,CAIL,CLK,PS,LD,EN,RL,CD,CS); // synthesis syn_black_box
input D0,D1,D2,D3,CAIR,CAIL,CLK,PS,LD,EN,RL,CD,CS;
output Q0,Q1,Q2,Q3;
endmodule
module SRRL4S(CAIL,CAIR,CD,CLK,CS,D0,D1,D2,D3,EN,LD,PS,Q0,Q1,Q2,Q3,RL,SD); // synthesis syn_black_box
input CAIL,CAIR,CD,CLK,CS,D0,D1,D2,D3,EN,LD,PS,RL,SD;
output Q0,Q1,Q2,Q3;
endmodule
module SRRL8(Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,D0,D1,D2,D3,D4,D5,D6,D7,CAIR,CAIL,CLK,PS,LD,EN,RL,CD,CS); // synthesis syn_black_box
input D0,D1,D2,D3,D4,D5,D6,D7,CAIR,CAIL,CLK,PS,LD,EN,RL,CD,CS;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module SRRL8S(CAIL,CAIR,CD,CLK,CS,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,PS,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,RL,SD); // synthesis syn_black_box
input CAIL,CAIR,CD,CLK,CS,D0,D1,D2,D3,D4,D5,D6,D7,EN,LD,PS,RL,SD;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
endmodule
module SUBF1(Z0,BO,A0,B0,BI); // synthesis syn_black_box
input A0,B0,BI;
output Z0,BO;
endmodule
module SUBF16A(BO,Z0,Z1,Z10,Z11,Z12,Z13,Z14,Z15,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,A0,A1,A10,A11,A12,A13,A14,A15,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B10,B11,B12,B13,B14,B15,B2,B3,B4,B5,B6,B7,B8,B9,BI); // synthesis syn_black_box
input A0,A1,A10,A11,A12,A13,A14,A15,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B10,B11,B12,B13,B14,B15,B2,B3,B4,B5,B6,B7,B8,B9,BI;
output BO,Z0,Z1,Z10,Z11,Z12,Z13,Z14,Z15,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9;
endmodule
module SUBF2(Z0,Z1,BO,A0,A1,B0,B1,BI); // synthesis syn_black_box
input A0,A1,B0,B1,BI;
output Z0,Z1,BO;
endmodule
module SUBF4(Z0,Z1,Z2,Z3,BO,A0,A1,A2,A3,B0,B1,B2,B3,BI); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3,BI;
output Z0,Z1,Z2,Z3,BO;
endmodule
module SUBF8(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,BO,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,BI); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,BI;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,BO;
endmodule
module SUBF8A(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,BO,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,BI); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,BI;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,BO;
endmodule
module SUBH1(Z0,BO,A0,B0); // synthesis syn_black_box
input A0,B0;
output Z0,BO;
endmodule
module SUBH16A(BO,Z0,Z1,Z10,Z11,Z12,Z13,Z14,Z15,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,A0,A1,A10,A11,A12,A13,A14,A15,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B10,B11,B12,B13,B14,B15,B2,B3,B4,B5,B6,B7,B8,B9); // synthesis syn_black_box
input A0,A1,A10,A11,A12,A13,A14,A15,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B10,B11,B12,B13,B14,B15,B2,B3,B4,B5,B6,B7,B8,B9;
output BO,Z0,Z1,Z10,Z11,Z12,Z13,Z14,Z15,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9;
endmodule
module SUBH2(Z0,Z1,BO,A0,A1,B0,B1); // synthesis syn_black_box
input A0,A1,B0,B1;
output Z0,Z1,BO;
endmodule
module SUBH3(Z0,Z1,Z2,BO,A0,A1,A2,B0,B1,B2); // synthesis syn_black_box
input A0,A1,A2,B0,B1,B2;
output Z0,Z1,Z2,BO;
endmodule
module SUBH4(Z0,Z1,Z2,Z3,BO,A0,A1,A2,A3,B0,B1,B2,B3); // synthesis syn_black_box
input A0,A1,A2,A3,B0,B1,B2,B3;
output Z0,Z1,Z2,Z3,BO;
endmodule
module SUBH8(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,BO,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,BO;
endmodule
module SUBH8A(Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,BO,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7;
output Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,BO;
endmodule
module TCVRDC(A,B,ENA,ENB); // synthesis syn_black_box
input ENA,ENB;
inout A,B;
endmodule
module TCVRSC(A,B,EN); // synthesis syn_black_box
input EN;
inout A,B;
endmodule
module XBIDI1(Z0,XB0,A0,OE); // synthesis syn_black_box
input A0,OE;
output Z0;
inout XB0 /* synthesis .ispad=1 */;
endmodule
module XDFF1(Q0,D0,CLK); // synthesis syn_black_box
input D0,CLK;
output Q0;
endmodule
module XDFF1E(Q0,D0,CLK,EN); // synthesis syn_black_box
input D0,CLK,EN;
output Q0;
endmodule
module XDFF2(Q0,D0,CLK,CD); // synthesis syn_black_box
input D0,CLK,CD;
output Q0;
endmodule
module XDFF2E(Q0,D0,CLK,EN,CD); // synthesis syn_black_box
input D0,CLK,EN,CD;
output Q0;
endmodule
module XDFF3(Q0,D0,CLK,SD); // synthesis syn_black_box
input D0,CLK,SD;
output Q0;
endmodule
module XDFF3E(Q0,D0,CLK,EN,SD); // synthesis syn_black_box
input D0,CLK,EN,SD;
output Q0;
endmodule
module XDFF4(Q0,D0,CLK,CD,SD); // synthesis syn_black_box
input D0,CLK,CD,SD;
output Q0;
endmodule
module XDFF4E(Q0,D0,CLK,EN,CD,SD); // synthesis syn_black_box
input D0,CLK,EN,CD,SD;
output Q0;
endmodule
module XDL1(Q0,D0,G); // synthesis syn_black_box
input D0,G;
output Q0;
endmodule
module XDL2(Q0,D0,G,CD); // synthesis syn_black_box
input D0,G,CD;
output Q0;
endmodule
module XDL3(Q0,D0,G,SD); // synthesis syn_black_box
input D0,G,SD;
output Q0;
endmodule
module XDL4(Q0,D0,G,CD,SD); // synthesis syn_black_box
input D0,G,CD,SD;
output Q0;
endmodule
module XINPUT(Z0,XI0); // synthesis syn_black_box
input XI0 /* synthesis .ispad=1 */;
output Z0;
endmodule
module XINV(ZN0,A0); // synthesis syn_black_box
input A0;
output ZN0;
endmodule
module XNOR2(ZN0,A0,A1); // synthesis syn_black_box
input A0,A1;
output ZN0;
endmodule
module XNOR3(ZN0,A0,A1,A2); // synthesis syn_black_box
input A0,A1,A2;
output ZN0;
endmodule
module XNOR4(ZN0,A0,A1,A2,A3); // synthesis syn_black_box
input A0,A1,A2,A3;
output ZN0;
endmodule
module XNOR7(ZN0,A0,A1,A2,A3,A4,A5,A6); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6;
output ZN0;
endmodule
module XNOR8(ZN0,A0,A1,A2,A3,A4,A5,A6,A7); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7;
output ZN0;
endmodule
module XNOR9(ZN0,A0,A1,A2,A3,A4,A5,A6,A7,A8); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8;
output ZN0;
endmodule
module XOR3(Z0,A0,A1,A2); // synthesis syn_black_box
input A0,A1,A2;
output Z0;
endmodule
module XOR4(Z0,A0,A1,A2,A3); // synthesis syn_black_box
input A0,A1,A2,A3;
output Z0;
endmodule
module XOR8(Z0,A0,A1,A2,A3,A4,A5,A6,A7); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7;
output Z0;
endmodule
module XOR9(Z0,A0,A1,A2,A3,A4,A5,A6,A7,A8); // synthesis syn_black_box
input A0,A1,A2,A3,A4,A5,A6,A7,A8;
output Z0;
endmodule
module XOUTPUT(XO0,A0); // synthesis syn_black_box
input A0;
output XO0 /* synthesis .ispad=1 */;
endmodule
module XTRI1(XO0,A0,OE); // synthesis syn_black_box
input A0,OE;
output XO0 /* synthesis .ispad=1 */;
endmodule
module CR4AL (B0CLK, B1CH, B1CLK, B1PLEN, B1SZ, B1UD, B2CLK, B3CH, 
  B3CLK, B3PLEN, B3SZ, B3UD, B4CLK, B5CH, B5CLK, B5PLEN, 
  B5SZ, B5UD, B6CLK, B7CH, B7CLK, B7PLEN, B7SZ, B7UD, 
  BS0, BS1, BS2, DI0, DI1, DI10, DI11, DI12, 
  DI13, DI14, DI15, DI2, DI3, DI4, DI5, DI6, 
  DI7, DI8, DI9, EN, MRST, POLEN, RP1, RP3, 
  RP5, RP7, B1CO, B3CO, B5CO, B7CO, DO0, DO1, 
  DO10, DO11, DO12, DO13, DO14, DO15, DO2, DO3, 
  DO4, DO5, DO6, DO7, DO8, DO9); // synthesis syn_black_box
input B0CLK;
input B1CH;
input B1CLK;
input B1PLEN;
input B1SZ;
input B1UD;
input B2CLK;
input B3CH;
input B3CLK;
input B3PLEN;
input B3SZ;
input B3UD;
input B4CLK;
input B5CH;
input B5CLK;
input B5PLEN;
input B5SZ;
input B5UD;
input B6CLK;
input B7CH;
input B7CLK;
input B7PLEN;
input B7SZ;
input B7UD;
input BS0;
input BS1;
input BS2;
input DI0;
input DI1;
input DI10;
input DI11;
input DI12;
input DI13;
input DI14;
input DI15;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
input EN;
input MRST;
input POLEN;
input RP1;
input RP3;
input RP5;
input RP7;
output B1CO;
output B3CO;
output B5CO;
output B7CO;
output DO0;
output DO1;
output DO10;
output DO11;
output DO12;
output DO13;
output DO14;
output DO15;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
endmodule
module CAOCTRL (BK_IN, BK_CAOCTRL); // synthesis syn_black_box
input BK_IN;
output BK_CAOCTRL;
endmodule
module POLCTRL1 (POLIN0, POL0); // synthesis syn_black_box
input POLIN0;
output POL0;
endmodule
module CR4PL (B0CLK, B1CH, B1CLK, B1SZ, B1UD, B2CLK, B3CH, B3CLK, 
  B3SZ, B3UD, B4CLK, B5CH, B5CLK, B5SZ, B5UD, B6CLK, 
  B7CH, B7CLK, B7SZ, B7UD, BS0, BS1, BS2, DI0, 
  DI1, DI10, DI11, DI12, DI13, DI14, DI15, DI2, 
  DI3, DI4, DI5, DI6, DI7, DI8, DI9, EN, 
  MRST, POLEN, RP1, RP3, RP5, RP7, B1CO, B3CO, 
  B5CO, B7CO, DO0, DO1, DO10, DO11, DO12, DO13, 
  DO14, DO15, DO2, DO3, DO4, DO5, DO6, DO7, 
  DO8, DO9); // synthesis syn_black_box
input B0CLK;
input B1CH;
input B1CLK;
input B1SZ;
input B1UD;
input B2CLK;
input B3CH;
input B3CLK;
input B3SZ;
input B3UD;
input B4CLK;
input B5CH;
input B5CLK;
input B5SZ;
input B5UD;
input B6CLK;
input B7CH;
input B7CLK;
input B7SZ;
input B7UD;
input BS0;
input BS1;
input BS2;
input DI0;
input DI1;
input DI10;
input DI11;
input DI12;
input DI13;
input DI14;
input DI15;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
input EN;
input MRST;
input POLEN;
input RP1;
input RP3;
input RP5;
input RP7;
output B1CO;
output B3CO;
output B5CO;
output B7CO;
output DO0;
output DO1;
output DO10;
output DO11;
output DO12;
output DO13;
output DO14;
output DO15;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
endmodule
module SUBFIFO1 (ADI0, ADI1, ADI10, ADI11, ADI12, ADI13, ADI14, ADI15, 
  ADI16, ADI17, ADI2, ADI3, ADI4, ADI5, ADI6, ADI7, 
  ADI8, ADI9, ALEOPT0, ALEOPT1, ALEOPT2, ALEOPT3, ALEOPT4, ALEOPT5, 
  ALEOPT6, ALEOPT7, ALFOPT0, ALFOPT1, ALFOPT2, ALFOPT3, ALFOPT4, ALFOPT5, 
  ALFOPT6, ALFOPT7, AWRL, BRDL, MRST, POL_RST, POL_WRL, ALE, 
  ALF, BDO0, BDO1, BDO10, BDO11, BDO12, BDO13, BDO14, 
  BDO15, BDO16, BDO17, BDO2, BDO3, BDO4, BDO5, BDO6, 
  BDO7, BDO8, BDO9, E, F); // synthesis syn_black_box
input ADI0;
input ADI1;
input ADI10;
input ADI11;
input ADI12;
input ADI13;
input ADI14;
input ADI15;
input ADI16;
input ADI17;
input ADI2;
input ADI3;
input ADI4;
input ADI5;
input ADI6;
input ADI7;
input ADI8;
input ADI9;
input ALEOPT0;
input ALEOPT1;
input ALEOPT2;
input ALEOPT3;
input ALEOPT4;
input ALEOPT5;
input ALEOPT6;
input ALEOPT7;
input ALFOPT0;
input ALFOPT1;
input ALFOPT2;
input ALFOPT3;
input ALFOPT4;
input ALFOPT5;
input ALFOPT6;
input ALFOPT7;
input AWRL;
input BRDL;
input MRST;
input POL_RST;
input POL_WRL;
output ALE;
output ALF;
output BDO0;
output BDO1;
output BDO10;
output BDO11;
output BDO12;
output BDO13;
output BDO14;
output BDO15;
output BDO16;
output BDO17;
output BDO2;
output BDO3;
output BDO4;
output BDO5;
output BDO6;
output BDO7;
output BDO8;
output BDO9;
output E;
output F;
endmodule
module ALFCTRL8 (ALFIN0, ALFIN1, ALFIN2, ALFIN3, ALFIN4, ALFIN5, ALFIN6, ALFIN7, 
  ALFVAL0, ALFVAL1, ALFVAL2, ALFVAL3, ALFVAL4, ALFVAL5, ALFVAL6, ALFVAL7); // synthesis syn_black_box
input ALFIN0;
input ALFIN1;
input ALFIN2;
input ALFIN3;
input ALFIN4;
input ALFIN5;
input ALFIN6;
input ALFIN7;
output ALFVAL0;
output ALFVAL1;
output ALFVAL2;
output ALFVAL3;
output ALFVAL4;
output ALFVAL5;
output ALFVAL6;
output ALFVAL7;
endmodule
module POLCTRL2 (POLIN0, POLIN1, POL0, POL1); // synthesis syn_black_box
input POLIN0;
input POLIN1;
output POL0;
output POL1;
endmodule
module ALECTRL8 (ALEIN0, ALEIN1, ALEIN2, ALEIN3, ALEIN4, ALEIN5, ALEIN6, ALEIN7, 
  ALEVAL0, ALEVAL1, ALEVAL2, ALEVAL3, ALEVAL4, ALEVAL5, ALEVAL6, ALEVAL7); // synthesis syn_black_box
input ALEIN0;
input ALEIN1;
input ALEIN2;
input ALEIN3;
input ALEIN4;
input ALEIN5;
input ALEIN6;
input ALEIN7;
output ALEVAL0;
output ALEVAL1;
output ALEVAL2;
output ALEVAL3;
output ALEVAL4;
output ALEVAL5;
output ALEVAL6;
output ALEVAL7;
endmodule
module SUBFIFO2 (ALEOPT0, ALEOPT1, ALEOPT2, ALEOPT3, ALEOPT4, ALEOPT5, ALEOPT6, ALEOPT7, 
  ALFOPT0, ALFOPT1, ALFOPT2, ALFOPT3, ALFOPT4, ALFOPT5, ALFOPT6, ALFOPT7, 
  ARDL, BDI0, BDI1, BDI10, BDI11, BDI12, BDI13, BDI14, 
  BDI15, BDI16, BDI17, BDI2, BDI3, BDI4, BDI5, BDI6, 
  BDI7, BDI8, BDI9, BWRL, MRST, POL_RST, POL_WRL, ADO0, 
  ADO1, ADO10, ADO11, ADO12, ADO13, ADO14, ADO15, ADO16, 
  ADO17, ADO2, ADO3, ADO4, ADO5, ADO6, ADO7, ADO8, 
  ADO9, ALE, ALF, E, F); // synthesis syn_black_box
input ALEOPT0;
input ALEOPT1;
input ALEOPT2;
input ALEOPT3;
input ALEOPT4;
input ALEOPT5;
input ALEOPT6;
input ALEOPT7;
input ALFOPT0;
input ALFOPT1;
input ALFOPT2;
input ALFOPT3;
input ALFOPT4;
input ALFOPT5;
input ALFOPT6;
input ALFOPT7;
input ARDL;
input BDI0;
input BDI1;
input BDI10;
input BDI11;
input BDI12;
input BDI13;
input BDI14;
input BDI15;
input BDI16;
input BDI17;
input BDI2;
input BDI3;
input BDI4;
input BDI5;
input BDI6;
input BDI7;
input BDI8;
input BDI9;
input BWRL;
input MRST;
input POL_RST;
input POL_WRL;
output ADO0;
output ADO1;
output ADO10;
output ADO11;
output ADO12;
output ADO13;
output ADO14;
output ADO15;
output ADO16;
output ADO17;
output ADO2;
output ADO3;
output ADO4;
output ADO5;
output ADO6;
output ADO7;
output ADO8;
output ADO9;
output ALE;
output ALF;
output E;
output F;
endmodule
module SUBFIFO3 (ADI0, ADI1, ADI2, ADI3, ADI4, ADI5, ADI6, ADI7, 
  ADI8, ALEOPT0, ALEOPT1, ALEOPT2, ALEOPT3, ALEOPT4, ALEOPT5, ALEOPT6, 
  ALEOPT7, ALEOPT8, ALFOPT0, ALFOPT1, ALFOPT2, ALFOPT3, ALFOPT4, ALFOPT5, 
  ALFOPT6, ALFOPT7, ALFOPT8, AWRL, BRDL, MRST, POL_RST, POL_WRL, 
  ALE, ALF, BDO0, BDO1, BDO2, BDO3, BDO4, BDO5, 
  BDO6, BDO7, BDO8, E, F); // synthesis syn_black_box
input ADI0;
input ADI1;
input ADI2;
input ADI3;
input ADI4;
input ADI5;
input ADI6;
input ADI7;
input ADI8;
input ALEOPT0;
input ALEOPT1;
input ALEOPT2;
input ALEOPT3;
input ALEOPT4;
input ALEOPT5;
input ALEOPT6;
input ALEOPT7;
input ALEOPT8;
input ALFOPT0;
input ALFOPT1;
input ALFOPT2;
input ALFOPT3;
input ALFOPT4;
input ALFOPT5;
input ALFOPT6;
input ALFOPT7;
input ALFOPT8;
input AWRL;
input BRDL;
input MRST;
input POL_RST;
input POL_WRL;
output ALE;
output ALF;
output BDO0;
output BDO1;
output BDO2;
output BDO3;
output BDO4;
output BDO5;
output BDO6;
output BDO7;
output BDO8;
output E;
output F;
endmodule
module ALECTRL9 (ALEIN0, ALEIN1, ALEIN2, ALEIN3, ALEIN4, ALEIN5, ALEIN6, ALEIN7, 
  ALEIN8, ALEVAL0, ALEVAL1, ALEVAL2, ALEVAL3, ALEVAL4, ALEVAL5, ALEVAL6, 
  ALEVAL7, ALEVAL8); // synthesis syn_black_box
input ALEIN0;
input ALEIN1;
input ALEIN2;
input ALEIN3;
input ALEIN4;
input ALEIN5;
input ALEIN6;
input ALEIN7;
input ALEIN8;
output ALEVAL0;
output ALEVAL1;
output ALEVAL2;
output ALEVAL3;
output ALEVAL4;
output ALEVAL5;
output ALEVAL6;
output ALEVAL7;
output ALEVAL8;
endmodule
module ALFCTRL9 (ALFIN0, ALFIN1, ALFIN2, ALFIN3, ALFIN4, ALFIN5, ALFIN6, ALFIN7, 
  ALFIN8, ALFVAL0, ALFVAL1, ALFVAL2, ALFVAL3, ALFVAL4, ALFVAL5, ALFVAL6, 
  ALFVAL7, ALFVAL8); // synthesis syn_black_box
input ALFIN0;
input ALFIN1;
input ALFIN2;
input ALFIN3;
input ALFIN4;
input ALFIN5;
input ALFIN6;
input ALFIN7;
input ALFIN8;
output ALFVAL0;
output ALFVAL1;
output ALFVAL2;
output ALFVAL3;
output ALFVAL4;
output ALFVAL5;
output ALFVAL6;
output ALFVAL7;
output ALFVAL8;
endmodule
module SUBFIFO4 (ALEOPT0, ALEOPT1, ALEOPT2, ALEOPT3, ALEOPT4, ALEOPT5, ALEOPT6, ALEOPT7, 
  ALEOPT8, ALFOPT0, ALFOPT1, ALFOPT2, ALFOPT3, ALFOPT4, ALFOPT5, ALFOPT6, 
  ALFOPT7, ALFOPT8, ARDL, BDI0, BDI1, BDI2, BDI3, BDI4, 
  BDI5, BDI6, BDI7, BDI8, BWRL, MRST, POL_RST, POL_WRL, 
  ADO0, ADO1, ADO2, ADO3, ADO4, ADO5, ADO6, ADO7, 
  ADO8, ALE, ALF, E, F); // synthesis syn_black_box
input ALEOPT0;
input ALEOPT1;
input ALEOPT2;
input ALEOPT3;
input ALEOPT4;
input ALEOPT5;
input ALEOPT6;
input ALEOPT7;
input ALEOPT8;
input ALFOPT0;
input ALFOPT1;
input ALFOPT2;
input ALFOPT3;
input ALFOPT4;
input ALFOPT5;
input ALFOPT6;
input ALFOPT7;
input ALFOPT8;
input ARDL;
input BDI0;
input BDI1;
input BDI2;
input BDI3;
input BDI4;
input BDI5;
input BDI6;
input BDI7;
input BDI8;
input BWRL;
input MRST;
input POL_RST;
input POL_WRL;
output ADO0;
output ADO1;
output ADO2;
output ADO3;
output ADO4;
output ADO5;
output ADO6;
output ADO7;
output ADO8;
output ALE;
output ALF;
output E;
output F;
endmodule
module SUBPSSR (BS0, BS1, BS2, CLK, DI0, DI1, DI10, DI11, 
  DI12, DI13, DI14, DI15, DI2, DI3, DI4, DI5, 
  DI6, DI7, DI8, DI9, EN, MRST, POLEN, SEN, 
  SDO); // synthesis syn_black_box
input BS0;
input BS1;
input BS2;
input CLK;
input DI0;
input DI1;
input DI10;
input DI11;
input DI12;
input DI13;
input DI14;
input DI15;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
input EN;
input MRST;
input POLEN;
input SEN;
output SDO;
endmodule
module SUBRAM1 (AA0, AA1, AA2, AA3, AA4, AA5, AA6, AA7, 
  ACS, ADI0, ADI1, ADI10, ADI11, ADI12, ADI13, ADI14, 
  ADI15, ADI16, ADI17, ADI2, ADI3, ADI4, ADI5, ADI6, 
  ADI7, ADI8, ADI9, ARWL, POL_CHS, POL_WRL, ADO0, ADO1, 
  ADO10, ADO11, ADO12, ADO13, ADO14, ADO15, ADO16, ADO17, 
  ADO2, ADO3, ADO4, ADO5, ADO6, ADO7, ADO8, ADO9); // synthesis syn_black_box
input AA0;
input AA1;
input AA2;
input AA3;
input AA4;
input AA5;
input AA6;
input AA7;
input ACS;
input ADI0;
input ADI1;
input ADI10;
input ADI11;
input ADI12;
input ADI13;
input ADI14;
input ADI15;
input ADI16;
input ADI17;
input ADI2;
input ADI3;
input ADI4;
input ADI5;
input ADI6;
input ADI7;
input ADI8;
input ADI9;
input ARWL;
input POL_CHS;
input POL_WRL;
output ADO0;
output ADO1;
output ADO10;
output ADO11;
output ADO12;
output ADO13;
output ADO14;
output ADO15;
output ADO16;
output ADO17;
output ADO2;
output ADO3;
output ADO4;
output ADO5;
output ADO6;
output ADO7;
output ADO8;
output ADO9;
endmodule
module SUBRAM10 (AA0, AA1, AA2, AA3, AA4, AA5, AA6, AA7, 
  ACS, ADI0, ADI1, ADI10, ADI11, ADI12, ADI13, ADI14, 
  ADI15, ADI16, ADI17, ADI2, ADI3, ADI4, ADI5, ADI6, 
  ADI7, ADI8, ADI9, ARWL, BA0, BA1, BA2, BA3, 
  BA4, BA5, BA6, BA7, BCS, BDI0, BDI1, BDI10, 
  BDI11, BDI12, BDI13, BDI14, BDI15, BDI16, BDI17, BDI2, 
  BDI3, BDI4, BDI5, BDI6, BDI7, BDI8, BDI9, BRWL, 
  POL_CHS, POL_WRL, ABUSY, ADO0, ADO1, ADO10, ADO11, ADO12, 
  ADO13, ADO14, ADO15, ADO16, ADO17, ADO2, ADO3, ADO4, 
  ADO5, ADO6, ADO7, ADO8, ADO9, BBUSY, BDO0, BDO1, 
  BDO10, BDO11, BDO12, BDO13, BDO14, BDO15, BDO16, BDO17, 
  BDO2, BDO3, BDO4, BDO5, BDO6, BDO7, BDO8, BDO9); // synthesis syn_black_box
input AA0;
input AA1;
input AA2;
input AA3;
input AA4;
input AA5;
input AA6;
input AA7;
input ACS;
input ADI0;
input ADI1;
input ADI10;
input ADI11;
input ADI12;
input ADI13;
input ADI14;
input ADI15;
input ADI16;
input ADI17;
input ADI2;
input ADI3;
input ADI4;
input ADI5;
input ADI6;
input ADI7;
input ADI8;
input ADI9;
input ARWL;
input BA0;
input BA1;
input BA2;
input BA3;
input BA4;
input BA5;
input BA6;
input BA7;
input BCS;
input BDI0;
input BDI1;
input BDI10;
input BDI11;
input BDI12;
input BDI13;
input BDI14;
input BDI15;
input BDI16;
input BDI17;
input BDI2;
input BDI3;
input BDI4;
input BDI5;
input BDI6;
input BDI7;
input BDI8;
input BDI9;
input BRWL;
input POL_CHS;
input POL_WRL;
output ABUSY;
output ADO0;
output ADO1;
output ADO10;
output ADO11;
output ADO12;
output ADO13;
output ADO14;
output ADO15;
output ADO16;
output ADO17;
output ADO2;
output ADO3;
output ADO4;
output ADO5;
output ADO6;
output ADO7;
output ADO8;
output ADO9;
output BBUSY;
output BDO0;
output BDO1;
output BDO10;
output BDO11;
output BDO12;
output BDO13;
output BDO14;
output BDO15;
output BDO16;
output BDO17;
output BDO2;
output BDO3;
output BDO4;
output BDO5;
output BDO6;
output BDO7;
output BDO8;
output BDO9;
endmodule
module SUBRAM11 (AA0, AA1, AA2, AA3, AA4, AA5, AA6, AA7, 
  ACS, ADI0, ADI1, ADI10, ADI11, ADI12, ADI13, ADI14, 
  ADI15, ADI16, ADI17, ADI2, ADI3, ADI4, ADI5, ADI6, 
  ADI7, ADI8, ADI9, ARWH, ARWL, BA0, BA1, BA2, 
  BA3, BA4, BA5, BA6, BA7, BCS, BDI0, BDI1, 
  BDI10, BDI11, BDI12, BDI13, BDI14, BDI15, BDI16, BDI17, 
  BDI2, BDI3, BDI4, BDI5, BDI6, BDI7, BDI8, BDI9, 
  BRWH, BRWL, POL_CHS, POL_WRH, POL_WRL, ABUSY, ADO0, ADO1, 
  ADO10, ADO11, ADO12, ADO13, ADO14, ADO15, ADO16, ADO17, 
  ADO2, ADO3, ADO4, ADO5, ADO6, ADO7, ADO8, ADO9, 
  BBUSY, BDO0, BDO1, BDO10, BDO11, BDO12, BDO13, BDO14, 
  BDO15, BDO16, BDO17, BDO2, BDO3, BDO4, BDO5, BDO6, 
  BDO7, BDO8, BDO9); // synthesis syn_black_box
input AA0;
input AA1;
input AA2;
input AA3;
input AA4;
input AA5;
input AA6;
input AA7;
input ACS;
input ADI0;
input ADI1;
input ADI10;
input ADI11;
input ADI12;
input ADI13;
input ADI14;
input ADI15;
input ADI16;
input ADI17;
input ADI2;
input ADI3;
input ADI4;
input ADI5;
input ADI6;
input ADI7;
input ADI8;
input ADI9;
input ARWH;
input ARWL;
input BA0;
input BA1;
input BA2;
input BA3;
input BA4;
input BA5;
input BA6;
input BA7;
input BCS;
input BDI0;
input BDI1;
input BDI10;
input BDI11;
input BDI12;
input BDI13;
input BDI14;
input BDI15;
input BDI16;
input BDI17;
input BDI2;
input BDI3;
input BDI4;
input BDI5;
input BDI6;
input BDI7;
input BDI8;
input BDI9;
input BRWH;
input BRWL;
input POL_CHS;
input POL_WRH;
input POL_WRL;
output ABUSY;
output ADO0;
output ADO1;
output ADO10;
output ADO11;
output ADO12;
output ADO13;
output ADO14;
output ADO15;
output ADO16;
output ADO17;
output ADO2;
output ADO3;
output ADO4;
output ADO5;
output ADO6;
output ADO7;
output ADO8;
output ADO9;
output BBUSY;
output BDO0;
output BDO1;
output BDO10;
output BDO11;
output BDO12;
output BDO13;
output BDO14;
output BDO15;
output BDO16;
output BDO17;
output BDO2;
output BDO3;
output BDO4;
output BDO5;
output BDO6;
output BDO7;
output BDO8;
output BDO9;
endmodule
module SUBRAM12 (AA0, AA1, AA2, AA3, AA4, AA5, AA6, AA7, 
  AA8RWH, ACS, ADI0, ADI1, ADI2, ADI3, ADI4, ADI5, 
  ADI6, ADI7, ADI8, ARWL, BA0, BA1, BA2, BA3, 
  BA4, BA5, BA6, BA7, BA8RWH, BCS, BDI0, BDI1, 
  BDI2, BDI3, BDI4, BDI5, BDI6, BDI7, BDI8, BRWL, 
  POL_CHS, POL_WRL, ABUSY, ADO0, ADO1, ADO2, ADO3, ADO4, 
  ADO5, ADO6, ADO7, ADO8, BBUSY, BDO0, BDO1, BDO2, 
  BDO3, BDO4, BDO5, BDO6, BDO7, BDO8); // synthesis syn_black_box
input AA0;
input AA1;
input AA2;
input AA3;
input AA4;
input AA5;
input AA6;
input AA7;
input AA8RWH;
input ACS;
input ADI0;
input ADI1;
input ADI2;
input ADI3;
input ADI4;
input ADI5;
input ADI6;
input ADI7;
input ADI8;
input ARWL;
input BA0;
input BA1;
input BA2;
input BA3;
input BA4;
input BA5;
input BA6;
input BA7;
input BA8RWH;
input BCS;
input BDI0;
input BDI1;
input BDI2;
input BDI3;
input BDI4;
input BDI5;
input BDI6;
input BDI7;
input BDI8;
input BRWL;
input POL_CHS;
input POL_WRL;
output ABUSY;
output ADO0;
output ADO1;
output ADO2;
output ADO3;
output ADO4;
output ADO5;
output ADO6;
output ADO7;
output ADO8;
output BBUSY;
output BDO0;
output BDO1;
output BDO2;
output BDO3;
output BDO4;
output BDO5;
output BDO6;
output BDO7;
output BDO8;
endmodule
module SUBRAM2 (BA0, BA1, BA2, BA3, BA4, BA5, BA6, BA7, 
  BCS, BDI0, BDI1, BDI10, BDI11, BDI12, BDI13, BDI14, 
  BDI15, BDI16, BDI17, BDI2, BDI3, BDI4, BDI5, BDI6, 
  BDI7, BDI8, BDI9, BRWL, BDO0, BDO1, BDO10, BDO11, 
  BDO12, BDO13, BDO14, BDO15, BDO16, BDO17, BDO2, BDO3, 
  BDO4, BDO5, BDO6, BDO7, BDO8, BDO9); // synthesis syn_black_box
input BA0;
input BA1;
input BA2;
input BA3;
input BA4;
input BA5;
input BA6;
input BA7;
input BCS;
input BDI0;
input BDI1;
input BDI10;
input BDI11;
input BDI12;
input BDI13;
input BDI14;
input BDI15;
input BDI16;
input BDI17;
input BDI2;
input BDI3;
input BDI4;
input BDI5;
input BDI6;
input BDI7;
input BDI8;
input BDI9;
input BRWL;
output BDO0;
output BDO1;
output BDO10;
output BDO11;
output BDO12;
output BDO13;
output BDO14;
output BDO15;
output BDO16;
output BDO17;
output BDO2;
output BDO3;
output BDO4;
output BDO5;
output BDO6;
output BDO7;
output BDO8;
output BDO9;
endmodule
module SUBRAM3 (AA0, AA1, AA2, AA3, AA4, AA5, AA6, AA7, 
  ACS, ADI0, ADI1, ADI10, ADI11, ADI12, ADI13, ADI14, 
  ADI15, ADI16, ADI17, ADI2, ADI3, ADI4, ADI5, ADI6, 
  ADI7, ADI8, ADI9, ARWH, ARWL, POL_CHS, POL_WRH, POL_WRL, 
  ADO0, ADO1, ADO10, ADO11, ADO12, ADO13, ADO14, ADO15, 
  ADO16, ADO17, ADO2, ADO3, ADO4, ADO5, ADO6, ADO7, 
  ADO8, ADO9); // synthesis syn_black_box
input AA0;
input AA1;
input AA2;
input AA3;
input AA4;
input AA5;
input AA6;
input AA7;
input ACS;
input ADI0;
input ADI1;
input ADI10;
input ADI11;
input ADI12;
input ADI13;
input ADI14;
input ADI15;
input ADI16;
input ADI17;
input ADI2;
input ADI3;
input ADI4;
input ADI5;
input ADI6;
input ADI7;
input ADI8;
input ADI9;
input ARWH;
input ARWL;
input POL_CHS;
input POL_WRH;
input POL_WRL;
output ADO0;
output ADO1;
output ADO10;
output ADO11;
output ADO12;
output ADO13;
output ADO14;
output ADO15;
output ADO16;
output ADO17;
output ADO2;
output ADO3;
output ADO4;
output ADO5;
output ADO6;
output ADO7;
output ADO8;
output ADO9;
endmodule
module SUBRAM4 (BA0, BA1, BA2, BA3, BA4, BA5, BA6, BA7, 
  BCS, BDI0, BDI1, BDI10, BDI11, BDI12, BDI13, BDI14, 
  BDI15, BDI16, BDI17, BDI2, BDI3, BDI4, BDI5, BDI6, 
  BDI7, BDI8, BDI9, BRWH, BRWL, BDO0, BDO1, BDO10, 
  BDO11, BDO12, BDO13, BDO14, BDO15, BDO16, BDO17, BDO2, 
  BDO3, BDO4, BDO5, BDO6, BDO7, BDO8, BDO9); // synthesis syn_black_box
input BA0;
input BA1;
input BA2;
input BA3;
input BA4;
input BA5;
input BA6;
input BA7;
input BCS;
input BDI0;
input BDI1;
input BDI10;
input BDI11;
input BDI12;
input BDI13;
input BDI14;
input BDI15;
input BDI16;
input BDI17;
input BDI2;
input BDI3;
input BDI4;
input BDI5;
input BDI6;
input BDI7;
input BDI8;
input BDI9;
input BRWH;
input BRWL;
output BDO0;
output BDO1;
output BDO10;
output BDO11;
output BDO12;
output BDO13;
output BDO14;
output BDO15;
output BDO16;
output BDO17;
output BDO2;
output BDO3;
output BDO4;
output BDO5;
output BDO6;
output BDO7;
output BDO8;
output BDO9;
endmodule
module SUBRAM5 (AA0, AA1, AA2, AA3, AA4, AA5, AA6, AA7, 
  AA8RWH, ACS, ADI0, ADI1, ADI2, ADI3, ADI4, ADI5, 
  ADI6, ADI7, ADI8, ARWL, POL_CHS, POL_WRL, ADO0, ADO1, 
  ADO2, ADO3, ADO4, ADO5, ADO6, ADO7, ADO8); // synthesis syn_black_box
input AA0;
input AA1;
input AA2;
input AA3;
input AA4;
input AA5;
input AA6;
input AA7;
input AA8RWH;
input ACS;
input ADI0;
input ADI1;
input ADI2;
input ADI3;
input ADI4;
input ADI5;
input ADI6;
input ADI7;
input ADI8;
input ARWL;
input POL_CHS;
input POL_WRL;
output ADO0;
output ADO1;
output ADO2;
output ADO3;
output ADO4;
output ADO5;
output ADO6;
output ADO7;
output ADO8;
endmodule
module SUBRAM6 (BA0, BA1, BA2, BA3, BA4, BA5, BA6, BA7, 
  BA8RWH, BCS, BDI0, BDI1, BDI2, BDI3, BDI4, BDI5, 
  BDI6, BDI7, BDI8, BRWL, BDO0, BDO1, BDO2, BDO3, 
  BDO4, BDO5, BDO6, BDO7, BDO8); // synthesis syn_black_box
input BA0;
input BA1;
input BA2;
input BA3;
input BA4;
input BA5;
input BA6;
input BA7;
input BA8RWH;
input BCS;
input BDI0;
input BDI1;
input BDI2;
input BDI3;
input BDI4;
input BDI5;
input BDI6;
input BDI7;
input BDI8;
input BRWL;
output BDO0;
output BDO1;
output BDO2;
output BDO3;
output BDO4;
output BDO5;
output BDO6;
output BDO7;
output BDO8;
endmodule
module SUBRAM7 (AA0, AA1, AA2, AA3, AA4, AA5, AA6, ACS, 
  ADI0, ADI1, ADI10, ADI11, ADI12, ADI13, ADI14, ADI15, 
  ADI16, ADI17, ADI2, ADI3, ADI4, ADI5, ADI6, ADI7, 
  ADI8, ADI9, ARWL, BA0, BA1, BA2, BA3, BA4, 
  BA5, BA6, BCS, BDI0, BDI1, BDI10, BDI11, BDI12, 
  BDI13, BDI14, BDI15, BDI16, BDI17, BDI2, BDI3, BDI4, 
  BDI5, BDI6, BDI7, BDI8, BDI9, BRWL, POL_CHS, POL_WRL, 
  ADO0, ADO1, ADO10, ADO11, ADO12, ADO13, ADO14, ADO15, 
  ADO16, ADO17, ADO2, ADO3, ADO4, ADO5, ADO6, ADO7, 
  ADO8, ADO9, BDO0, BDO1, BDO10, BDO11, BDO12, BDO13, 
  BDO14, BDO15, BDO16, BDO17, BDO2, BDO3, BDO4, BDO5, 
  BDO6, BDO7, BDO8, BDO9); // synthesis syn_black_box
input AA0;
input AA1;
input AA2;
input AA3;
input AA4;
input AA5;
input AA6;
input ACS;
input ADI0;
input ADI1;
input ADI10;
input ADI11;
input ADI12;
input ADI13;
input ADI14;
input ADI15;
input ADI16;
input ADI17;
input ADI2;
input ADI3;
input ADI4;
input ADI5;
input ADI6;
input ADI7;
input ADI8;
input ADI9;
input ARWL;
input BA0;
input BA1;
input BA2;
input BA3;
input BA4;
input BA5;
input BA6;
input BCS;
input BDI0;
input BDI1;
input BDI10;
input BDI11;
input BDI12;
input BDI13;
input BDI14;
input BDI15;
input BDI16;
input BDI17;
input BDI2;
input BDI3;
input BDI4;
input BDI5;
input BDI6;
input BDI7;
input BDI8;
input BDI9;
input BRWL;
input POL_CHS;
input POL_WRL;
output ADO0;
output ADO1;
output ADO10;
output ADO11;
output ADO12;
output ADO13;
output ADO14;
output ADO15;
output ADO16;
output ADO17;
output ADO2;
output ADO3;
output ADO4;
output ADO5;
output ADO6;
output ADO7;
output ADO8;
output ADO9;
output BDO0;
output BDO1;
output BDO10;
output BDO11;
output BDO12;
output BDO13;
output BDO14;
output BDO15;
output BDO16;
output BDO17;
output BDO2;
output BDO3;
output BDO4;
output BDO5;
output BDO6;
output BDO7;
output BDO8;
output BDO9;
endmodule
module SUBRAM8 (AA0, AA1, AA2, AA3, AA4, AA5, AA6, ACS, 
  ADI0, ADI1, ADI10, ADI11, ADI12, ADI13, ADI14, ADI15, 
  ADI16, ADI17, ADI2, ADI3, ADI4, ADI5, ADI6, ADI7, 
  ADI8, ADI9, ARWH, ARWL, BA0, BA1, BA2, BA3, 
  BA4, BA5, BA6, BCS, BDI0, BDI1, BDI10, BDI11, 
  BDI12, BDI13, BDI14, BDI15, BDI16, BDI17, BDI2, BDI3, 
  BDI4, BDI5, BDI6, BDI7, BDI8, BDI9, BRWH, BRWL, 
  POL_CHS, POL_WRH, POL_WRL, ADO0, ADO1, ADO10, ADO11, ADO12, 
  ADO13, ADO14, ADO15, ADO16, ADO17, ADO2, ADO3, ADO4, 
  ADO5, ADO6, ADO7, ADO8, ADO9, BDO0, BDO1, BDO10, 
  BDO11, BDO12, BDO13, BDO14, BDO15, BDO16, BDO17, BDO2, 
  BDO3, BDO4, BDO5, BDO6, BDO7, BDO8, BDO9); // synthesis syn_black_box
input AA0;
input AA1;
input AA2;
input AA3;
input AA4;
input AA5;
input AA6;
input ACS;
input ADI0;
input ADI1;
input ADI10;
input ADI11;
input ADI12;
input ADI13;
input ADI14;
input ADI15;
input ADI16;
input ADI17;
input ADI2;
input ADI3;
input ADI4;
input ADI5;
input ADI6;
input ADI7;
input ADI8;
input ADI9;
input ARWH;
input ARWL;
input BA0;
input BA1;
input BA2;
input BA3;
input BA4;
input BA5;
input BA6;
input BCS;
input BDI0;
input BDI1;
input BDI10;
input BDI11;
input BDI12;
input BDI13;
input BDI14;
input BDI15;
input BDI16;
input BDI17;
input BDI2;
input BDI3;
input BDI4;
input BDI5;
input BDI6;
input BDI7;
input BDI8;
input BDI9;
input BRWH;
input BRWL;
input POL_CHS;
input POL_WRH;
input POL_WRL;
output ADO0;
output ADO1;
output ADO10;
output ADO11;
output ADO12;
output ADO13;
output ADO14;
output ADO15;
output ADO16;
output ADO17;
output ADO2;
output ADO3;
output ADO4;
output ADO5;
output ADO6;
output ADO7;
output ADO8;
output ADO9;
output BDO0;
output BDO1;
output BDO10;
output BDO11;
output BDO12;
output BDO13;
output BDO14;
output BDO15;
output BDO16;
output BDO17;
output BDO2;
output BDO3;
output BDO4;
output BDO5;
output BDO6;
output BDO7;
output BDO8;
output BDO9;
endmodule
module SUBRAM9 (AA0, AA1, AA2, AA3, AA4, AA5, AA6, AA7, 
  ACS, ADI0, ADI1, ADI2, ADI3, ADI4, ADI5, ADI6, 
  ADI7, ADI8, ARWL, BA0, BA1, BA2, BA3, BA4, 
  BA5, BA6, BA7, BCS, BDI0, BDI1, BDI2, BDI3, 
  BDI4, BDI5, BDI6, BDI7, BDI8, BRWL, POL_CHS, POL_WRL, 
  ADO0, ADO1, ADO2, ADO3, ADO4, ADO5, ADO6, ADO7, 
  ADO8, BDO0, BDO1, BDO2, BDO3, BDO4, BDO5, BDO6, 
  BDO7, BDO8); // synthesis syn_black_box
input AA0;
input AA1;
input AA2;
input AA3;
input AA4;
input AA5;
input AA6;
input AA7;
input ACS;
input ADI0;
input ADI1;
input ADI2;
input ADI3;
input ADI4;
input ADI5;
input ADI6;
input ADI7;
input ADI8;
input ARWL;
input BA0;
input BA1;
input BA2;
input BA3;
input BA4;
input BA5;
input BA6;
input BA7;
input BCS;
input BDI0;
input BDI1;
input BDI2;
input BDI3;
input BDI4;
input BDI5;
input BDI6;
input BDI7;
input BDI8;
input BRWL;
input POL_CHS;
input POL_WRL;
output ADO0;
output ADO1;
output ADO2;
output ADO3;
output ADO4;
output ADO5;
output ADO6;
output ADO7;
output ADO8;
output BDO0;
output BDO1;
output BDO2;
output BDO3;
output BDO4;
output BDO5;
output BDO6;
output BDO7;
output BDO8;
endmodule
module SUBRF (B0CLK, B1CLK, B2CLK, B3CLK, B4CLK, B5CLK, B6CLK, B7CLK, 
  BS0, BS1, BS2, DI0, DI1, DI10, DI11, DI12, 
  DI13, DI14, DI15, DI2, DI3, DI4, DI5, DI6, 
  DI7, DI8, DI9, EN, MRST, POLEN, DO0, DO1, 
  DO10, DO11, DO12, DO13, DO14, DO15, DO2, DO3, 
  DO4, DO5, DO6, DO7, DO8, DO9); // synthesis syn_black_box
input B0CLK;
input B1CLK;
input B2CLK;
input B3CLK;
input B4CLK;
input B5CLK;
input B6CLK;
input B7CLK;
input BS0;
input BS1;
input BS2;
input DI0;
input DI1;
input DI10;
input DI11;
input DI12;
input DI13;
input DI14;
input DI15;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
input EN;
input MRST;
input POLEN;
output DO0;
output DO1;
output DO10;
output DO11;
output DO12;
output DO13;
output DO14;
output DO15;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
endmodule
module SUBSPSR (BS0, BS1, BS2, CLK, MRST, SDI, SEN, DO0, 
  DO1, DO10, DO11, DO12, DO13, DO14, DO15, DO2, 
  DO3, DO4, DO5, DO6, DO7, DO8, DO9); // synthesis syn_black_box
input BS0;
input BS1;
input BS2;
input CLK;
input MRST;
input SDI;
input SEN;
output DO0;
output DO1;
output DO10;
output DO11;
output DO12;
output DO13;
output DO14;
output DO15;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
endmodule
module SUBSSSR (CLK, MRST, SDI, SEN, SDO); // synthesis syn_black_box
input CLK;
input MRST;
input SDI;
input SEN;
output SDO;
endmodule
module TR4AL (B0CLK, B1CH, B1CLK, B1PLEN, B1SZ, B1UD, B2CLK, B3CH, 
  B3CLK, B3PLEN, B3SZ, B3UD, B4CLK, B5CH, B5CLK, B5PLEN, 
  B5SZ, B5UD, B6CLK, B7CH, B7CLK, B7PLEN, B7SZ, B7UD, 
  BS0, BS1, BS2, DI0, DI1, DI10, DI11, DI12, 
  DI13, DI14, DI15, DI2, DI3, DI4, DI5, DI6, 
  DI7, DI8, DI9, EN, MRST, POLEN, RP1, RP3, 
  RP5, RP7, B1TC, B3TC, B5TC, B7TC, DO0, DO1, 
  DO10, DO11, DO12, DO13, DO14, DO15, DO2, DO3, 
  DO4, DO5, DO6, DO7, DO8, DO9); // synthesis syn_black_box
input B0CLK;
input B1CH;
input B1CLK;
input B1PLEN;
input B1SZ;
input B1UD;
input B2CLK;
input B3CH;
input B3CLK;
input B3PLEN;
input B3SZ;
input B3UD;
input B4CLK;
input B5CH;
input B5CLK;
input B5PLEN;
input B5SZ;
input B5UD;
input B6CLK;
input B7CH;
input B7CLK;
input B7PLEN;
input B7SZ;
input B7UD;
input BS0;
input BS1;
input BS2;
input DI0;
input DI1;
input DI10;
input DI11;
input DI12;
input DI13;
input DI14;
input DI15;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
input EN;
input MRST;
input POLEN;
input RP1;
input RP3;
input RP5;
input RP7;
output B1TC;
output B3TC;
output B5TC;
output B7TC;
output DO0;
output DO1;
output DO10;
output DO11;
output DO12;
output DO13;
output DO14;
output DO15;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
endmodule
module PSCTRL (PSI0, PSI1, PSI10, PSI11, PSI12, PSI13, PSI14, PSI15, 
  PSI2, PSI3, PSI4, PSI5, PSI6, PSI7, PSI8, PSI9, 
  PSO0, PSO1, PSO10, PSO11, PSO12, PSO13, PSO14, PSO15, 
  PSO2, PSO3, PSO4, PSO5, PSO6, PSO7, PSO8, PSO9); // synthesis syn_black_box
input PSI0;
input PSI1;
input PSI10;
input PSI11;
input PSI12;
input PSI13;
input PSI14;
input PSI15;
input PSI2;
input PSI3;
input PSI4;
input PSI5;
input PSI6;
input PSI7;
input PSI8;
input PSI9;
output PSO0;
output PSO1;
output PSO10;
output PSO11;
output PSO12;
output PSO13;
output PSO14;
output PSO15;
output PSO2;
output PSO3;
output PSO4;
output PSO5;
output PSO6;
output PSO7;
output PSO8;
output PSO9;
endmodule
module TR4CPV (B0CLK, B1CH, B1CLK, B1PLEN, B1SZ, B1UD, B2CLK, B3CH, 
  B3CLK, B3PLEN, B3SZ, B3UD, B4CLK, B5CH, B5CLK, B5PLEN, 
  B5SZ, B5UD, B6CLK, B7CH, B7CLK, B7PLEN, B7SZ, B7UD, 
  BS0, BS1, BS2, CPV1_0, CPV1_1, CPV1_10, CPV1_11, CPV1_12, 
  CPV1_13, CPV1_14, CPV1_15, CPV1_2, CPV1_3, CPV1_4, CPV1_5, CPV1_6, 
  CPV1_7, CPV1_8, CPV1_9, CPV3_0, CPV3_1, CPV3_10, CPV3_11, CPV3_12, 
  CPV3_13, CPV3_14, CPV3_15, CPV3_2, CPV3_3, CPV3_4, CPV3_5, CPV3_6, 
  CPV3_7, CPV3_8, CPV3_9, CPV5_0, CPV5_1, CPV5_10, CPV5_11, CPV5_12, 
  CPV5_13, CPV5_14, CPV5_15, CPV5_2, CPV5_3, CPV5_4, CPV5_5, CPV5_6, 
  CPV5_7, CPV5_8, CPV5_9, CPV7_0, CPV7_1, CPV7_10, CPV7_11, CPV7_12, 
  CPV7_13, CPV7_14, CPV7_15, CPV7_2, CPV7_3, CPV7_4, CPV7_5, CPV7_6, 
  CPV7_7, CPV7_8, CPV7_9, DI0, DI1, DI10, DI11, DI12, 
  DI13, DI14, DI15, DI2, DI3, DI4, DI5, DI6, 
  DI7, DI8, DI9, EN, MRST, POLEN, RP1, RP3, 
  RP5, RP7, B1TC, B3TC, B5TC, B7TC, DO0, DO1, 
  DO10, DO11, DO12, DO13, DO14, DO15, DO2, DO3, 
  DO4, DO5, DO6, DO7, DO8, DO9); // synthesis syn_black_box
input B0CLK;
input B1CH;
input B1CLK;
input B1PLEN;
input B1SZ;
input B1UD;
input B2CLK;
input B3CH;
input B3CLK;
input B3PLEN;
input B3SZ;
input B3UD;
input B4CLK;
input B5CH;
input B5CLK;
input B5PLEN;
input B5SZ;
input B5UD;
input B6CLK;
input B7CH;
input B7CLK;
input B7PLEN;
input B7SZ;
input B7UD;
input BS0;
input BS1;
input BS2;
input CPV1_0;
input CPV1_1;
input CPV1_10;
input CPV1_11;
input CPV1_12;
input CPV1_13;
input CPV1_14;
input CPV1_15;
input CPV1_2;
input CPV1_3;
input CPV1_4;
input CPV1_5;
input CPV1_6;
input CPV1_7;
input CPV1_8;
input CPV1_9;
input CPV3_0;
input CPV3_1;
input CPV3_10;
input CPV3_11;
input CPV3_12;
input CPV3_13;
input CPV3_14;
input CPV3_15;
input CPV3_2;
input CPV3_3;
input CPV3_4;
input CPV3_5;
input CPV3_6;
input CPV3_7;
input CPV3_8;
input CPV3_9;
input CPV5_0;
input CPV5_1;
input CPV5_10;
input CPV5_11;
input CPV5_12;
input CPV5_13;
input CPV5_14;
input CPV5_15;
input CPV5_2;
input CPV5_3;
input CPV5_4;
input CPV5_5;
input CPV5_6;
input CPV5_7;
input CPV5_8;
input CPV5_9;
input CPV7_0;
input CPV7_1;
input CPV7_10;
input CPV7_11;
input CPV7_12;
input CPV7_13;
input CPV7_14;
input CPV7_15;
input CPV7_2;
input CPV7_3;
input CPV7_4;
input CPV7_5;
input CPV7_6;
input CPV7_7;
input CPV7_8;
input CPV7_9;
input DI0;
input DI1;
input DI10;
input DI11;
input DI12;
input DI13;
input DI14;
input DI15;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
input EN;
input MRST;
input POLEN;
input RP1;
input RP3;
input RP5;
input RP7;
output B1TC;
output B3TC;
output B5TC;
output B7TC;
output DO0;
output DO1;
output DO10;
output DO11;
output DO12;
output DO13;
output DO14;
output DO15;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
endmodule
module TR4PL (B0CLK, B1CH, B1CLK, B1SZ, B1UD, B2CLK, B3CH, B3CLK, 
  B3SZ, B3UD, B4CLK, B5CH, B5CLK, B5SZ, B5UD, B6CLK, 
  B7CH, B7CLK, B7SZ, B7UD, BS0, BS1, BS2, DI0, 
  DI1, DI10, DI11, DI12, DI13, DI14, DI15, DI2, 
  DI3, DI4, DI5, DI6, DI7, DI8, DI9, EN, 
  MRST, POLEN, RP1, RP3, RP5, RP7, B1TC, B3TC, 
  B5TC, B7TC, DO0, DO1, DO10, DO11, DO12, DO13, 
  DO14, DO15, DO2, DO3, DO4, DO5, DO6, DO7, 
  DO8, DO9); // synthesis syn_black_box
input B0CLK;
input B1CH;
input B1CLK;
input B1SZ;
input B1UD;
input B2CLK;
input B3CH;
input B3CLK;
input B3SZ;
input B3UD;
input B4CLK;
input B5CH;
input B5CLK;
input B5SZ;
input B5UD;
input B6CLK;
input B7CH;
input B7CLK;
input B7SZ;
input B7UD;
input BS0;
input BS1;
input BS2;
input DI0;
input DI1;
input DI10;
input DI11;
input DI12;
input DI13;
input DI14;
input DI15;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
input EN;
input MRST;
input POLEN;
input RP1;
input RP3;
input RP5;
input RP7;
output B1TC;
output B3TC;
output B5TC;
output B7TC;
output DO0;
output DO1;
output DO10;
output DO11;
output DO12;
output DO13;
output DO14;
output DO15;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
endmodule
module AND2 (O,I0,I1); // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module AND3 (O,I0,I1,I2);// synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule 
module AND4 (O,I0,I1,I2,I3); // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule 
module AND5 (O,I0,I1,I2,I3,I4); // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule 
module AND6 (O,I0,I1,I2,I3,I4,I5); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule 
module AND7 (O,I0,I1,I2,I3,I4,I5,I6); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule 
module AND8 (O,I0,I1,I2,I3,I4,I5,I6,I7); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O;  
endmodule 
module BI_DIR (O,I0,IO,OE); // synthesis syn_black_box
input I0,OE; 
inout IO; 
output O; 
endmodule 
module BUFF (O,I0); // synthesis syn_black_box
input I0; 
output O; 
endmodule 
module BUFTH (O,I0,OE); // synthesis syn_black_box
input I0,OE; 
output O; 
endmodule 
module BUFTI (O,I0,OE); // synthesis syn_black_box
input I0,OE; 
output O; 
endmodule 
module BUFTL (O,I0,OE); // synthesis syn_black_box
input I0,OE; 
output O; 
endmodule 
module CLKI(O,PAD); // synthesis syn_black_box
input PAD; 
output O; 
endmodule 
module DFF (Q,D,CLK); // synthesis syn_black_box
input D,CLK; 
output Q; 
endmodule 
module DFFC (Q,D,CLK,CE); // synthesis syn_black_box
input D,CLK,CE; 
output Q; 
endmodule 
module DFFCR (Q,D,CLK,CE,R); // synthesis syn_black_box
input D,CLK,CE,R; 
output Q; 
endmodule 
module DFFCRH (Q,D,CLK,CE,R); // synthesis syn_black_box
input D,CLK,CE,R; 
output Q; 
endmodule 
module DFFCRS (Q,D,CLK,CE,R,S); // synthesis syn_black_box
input D,CLK,CE,R,S; 
output Q; 
endmodule 
module DFFCRSH (Q,D,CLK,CE,R,S); // synthesis syn_black_box
input D,CLK,CE,R,S; 
output Q; 
endmodule 
module DFFCS (Q,D,CLK,CE,S); // synthesis syn_black_box
input D,CLK,CE,S; 
output Q; 
endmodule 
module DFFCSH (Q,D,CLK,CE,S); // synthesis syn_black_box
input D,CLK,CE,S; 
output Q; 
endmodule 
module DFFR (Q,D,CLK,R); // synthesis syn_black_box
input D,CLK,R; 
output Q; 
endmodule 
module DFFRH (Q,D,CLK,R); // synthesis syn_black_box
input D,CLK,R; 
output Q; 
endmodule 
module DFFRS (Q,D,CLK,R,S); // synthesis syn_black_box
input D,CLK,R,S; 
output Q; 
endmodule 
module DFFRSH (Q,D,CLK,R,S); // synthesis syn_black_box
input D,CLK,R,S; 
output Q; 
endmodule 
module DFFS (Q,D,CLK,S); // synthesis syn_black_box
input D,CLK,S; 
output Q;
endmodule 
module DFFSH (Q,D,CLK,S); // synthesis syn_black_box
input D,CLK,S; 
output Q; 
endmodule 
module DLAT (Q,D,LAT); // synthesis syn_black_box
input D,LAT; 
output Q; 
endmodule 
module DLATR (Q,D,LAT,R); // synthesis syn_black_box
input D,LAT,R; 
output Q; 
endmodule 
module DLATRH (Q,D,LAT,R); // synthesis syn_black_box
input D,LAT,R; 
output Q; 
endmodule 
module DLATRS (Q,D,LAT,R,S); // synthesis syn_black_box
input D,LAT,R,S; 
output Q; 
endmodule 
module DLATRSH (Q,D,LAT,R,S); // synthesis syn_black_box
input D,LAT,R,S; 
output Q; 
endmodule 
module DLATS (Q,D,LAT,S); // synthesis syn_black_box
input D,LAT,S; 
output Q; 
endmodule 
module DLATSH (Q,D,LAT,S); // synthesis syn_black_box
input D,LAT,S; 
output Q; 
endmodule 
module VCC (X); // synthesis syn_black_box
output X; 
endmodule 
module GND (X); // synthesis syn_black_box
output X; 
endmodule 
module IBUF (O,I0); // synthesis syn_black_box
input I0; 
output O; 
endmodule 
module INV (O,I0); // synthesis syn_black_box
input I0; 
output O; 
endmodule 
module INVTH (O,I0,OE); // synthesis syn_black_box
input I0,OE; 
output O; 
endmodule 
module INVTL (O,I0,OE); // synthesis syn_black_box
input I0,OE; 
output O; 
endmodule 
module NAN2 (O,I0,I1); // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module NAN3 (O,I0,I1,I2); // synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule 
module NAN4 (O,I0,I1,I2,I3); // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule 
module NAN5 (O,I0,I1,I2,I3,I4); // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule 
module NAN6 (O,I0,I1,I2,I3,I4,I5); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule 
module NAN7 (O,I0,I1,I2,I3,I4,I5,I6); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule 
module NAN8 (O,I0,I1,I2,I3,I4,I5,I6,I7); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
endmodule 
module NOR2 (O,I0,I1); // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module NOR3 (O,I0,I1,I2); // synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule 
module NOR4 (O,I0,I1,I2,I3); // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule 
module NOR5 (O,I0,I1,I2,I3,I4); // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule 
module NOR6 (O,I0,I1,I2,I3,I4,I5); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule 
module NOR7 (O,I0,I1,I2,I3,I4,I5,I6); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule 
module NOR8 (O,I0,I1,I2,I3,I4,I5,I6,I7); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
endmodule 
module OBUF (O,I0); // synthesis syn_black_box
input I0; 
output O; 
endmodule 
module OR2 (O,I0,I1); // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module OR3 (O,I0,I1,I2); // synthesis syn_black_box
input I0,I1,I2; 
output O; 
endmodule 
module OR4 (O,I0,I1,I2,I3); // synthesis syn_black_box
input I0,I1,I2,I3; 
output O; 
endmodule 
module OR5 (O,I0,I1,I2,I3,I4); // synthesis syn_black_box
input I0,I1,I2,I3,I4; 
output O; 
endmodule 
module OR6 (O,I0,I1,I2,I3,I4,I5); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5; 
output O; 
endmodule 
module OR7 (O,I0,I1,I2,I3,I4,I5,I6); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
endmodule 
module OR8 (O,I0,I1,I2,I3,I4,I5,I6,I7); // synthesis syn_black_box
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
endmodule 
module TFF (Q,T,CLK); // synthesis syn_black_box
input T,CLK; 
output Q; 
endmodule 
module TFFR (Q,T,CLK,R); // synthesis syn_black_box
input T,CLK,R; 
output Q; 
endmodule 
module TFFRH (Q,T,CLK,R); // synthesis syn_black_box
input T,CLK,R; 
output Q; 
endmodule 
module TFFRS (Q,T,CLK,R,S); // synthesis syn_black_box
input T,CLK,R,S; 
output Q; 
endmodule 
module TFFRSH (Q,T,CLK,R,S); // synthesis syn_black_box
input T,CLK,R,S; 
output Q; 
endmodule 
module TFFS (Q,T,CLK,S); // synthesis syn_black_box
input T,CLK,S; 
output Q; 
endmodule 
module TFFSH (Q,T,CLK,S); // synthesis syn_black_box
input T,CLK,S; 
output Q; 
endmodule
module XOR2 (O,I0,I1); // synthesis syn_black_box
input I0,I1; 
output O; 
endmodule 
module IBUF_PU(I0,O);// synthesis syn_black_box
input I0;
output O;
endmodule 
module IBUF_PD(I0,O);// synthesis syn_black_box
input I0;
output O;
endmodule 
module OBUF_OD(I0,O);// synthesis syn_black_box
input I0;
output O;
endmodule 
module OBUF_OC(I0,O);// synthesis syn_black_box
input I0;
output O;
endmodule 
module BUFTH_OD(I0,OE,O);// synthesis syn_black_box
input I0;
input OE;
output O;
endmodule 
module BUFTH_OC(I0,OE,O);// synthesis syn_black_box
input I0;
input OE;
output O;
endmodule 
module BI_DIR_PU(I0,OE,IO,O);// synthesis syn_black_box
input I0;
input OE;
inout IO;
output O;
endmodule 
module BI_DIR_PD(I0,OE,IO,O);// synthesis syn_black_box
input I0;
input OE;
inout IO;
output O;
endmodule 
module BI_DIR_OD(I0,OE,IO,O);// synthesis syn_black_box
input I0;
input OE;
inout IO;
output O;
endmodule 
module BI_DIR_OC(I0,OE,IO,O);// synthesis syn_black_box
input I0;
input OE;
inout IO;
output O;
endmodule 
module BI_DIR_OD_PU(I0,OE,IO,O);// synthesis syn_black_box
input I0;
input OE;
inout IO;
output O;
endmodule 
module BI_DIR_OD_PD(I0,OE,IO,O);// synthesis syn_black_box
input I0;
input OE;
inout IO;
output O;
endmodule 
module BI_DIR_OC_PU(I0,OE,IO,O);// synthesis syn_black_box
input I0;
input OE;
inout IO;
output O;
endmodule 
module BI_DIR_OC_PD(I0,OE,IO,O);// synthesis syn_black_box
input I0;
input OE;
inout IO;
output O;
endmodule 
//module SPLL(CLK_IN,CLK_OUT);// synthesis syn_black_box
//input CLK_IN;
//output CLK_OUT;
//endmodule 
//module STDPLL(CLK_IN,PLL_LOCK,CLK_OUT);// synthesis syn_black_box
//input CLK_IN;
//output PLL_LOCK;
//output CLK_OUT;
//endmodule 
//module STDPLLX(CLK_IN,PLL_FBK,PLL_RST,PLL_LOCK,CLK_OUT,SEC_OUT);// synthesis syn_black_box
//input CLK_IN;
//input PLL_FBK;
//input PLL_RST;
//output PLL_LOCK;
//output CLK_OUT;
//output SEC_OUT;
//endmodule 
//FIFO  for GDX2
module FIFO15X10A(WE, WCLK, RE, RST, RCLK, DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8, DI9, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, FULL, EMPTY, START_RD);// synthesis syn_black_box
input WE;
input WCLK;
input RE;
input RST;
input RCLK;
input DI0;
input DI1;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
output DO0;
output DO1;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
output FULL;
output EMPTY;
output START_RD;
endmodule 
//HSI BLOCK cells  for GDX2
module RX_SS_4(SIN, SS_CLKIN, RXD, RECCLK, CSLOCK);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
output [0:3] RXD;
output RECCLK;
output CSLOCK;
endmodule 
module RX_SS_6(SIN, SS_CLKIN, RXD, RECCLK, CSLOCK);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
output [0:5] RXD;
output RECCLK;
output CSLOCK;
endmodule 
module RX_SS_8(SIN, SS_CLKIN, RXD, RECCLK, CSLOCK);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
output [0:7] RXD;
output RECCLK;
output CSLOCK;
endmodule 
module CDRX_SS_4(SIN, SS_CLKIN, CAL, RXD, RECCLK, CSLOCK, CDRLOCK, SYDT);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
input CAL;
output [0:3] RXD;
output RECCLK;
output CSLOCK;
output CDRLOCK;
output SYDT;
endmodule 
module CDRX_SS_6(SIN, SS_CLKIN, CAL, RXD, RECCLK, CSLOCK, CDRLOCK, SYDT);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
input CAL;
output [0:5] RXD;
output RECCLK;
output CSLOCK;
output CDRLOCK;
output SYDT;
endmodule 
module CDRX_SS_8(SIN, SS_CLKIN, CAL, RXD, RECCLK, CSLOCK, CDRLOCK, SYDT);// synthesis syn_black_box
input SIN;
input SS_CLKIN;
input CAL;
output [0:7] RXD;
output RECCLK;
output CSLOCK;
output CDRLOCK;
output SYDT;
endmodule 
module TX_SS_4(TXD, REFCLK, SOUT, SS_CLKOUT, CSLOCK);// synthesis syn_black_box
input [0:3] TXD;
input REFCLK;
output SOUT;
output SS_CLKOUT;
output CSLOCK;
endmodule 
module TX_SS_6(TXD, REFCLK, SOUT, SS_CLKOUT, CSLOCK);// synthesis syn_black_box
input [0:5] TXD;
input REFCLK;
output SOUT;
output SS_CLKOUT;
output CSLOCK;
endmodule 
module TX_SS_8(TXD, REFCLK, SOUT, SS_CLKOUT, CSLOCK);// synthesis syn_black_box
input [0:7] TXD;
input REFCLK;
output SOUT;
output SS_CLKOUT;
output CSLOCK;
endmodule 
module CDRX_8B10B(SIN, REFCLK, CDRRST, EXLOSS, RXD, RECCLK, CSLOCK, CDRLOCK, LOSS, SYDT);// synthesis syn_black_box
input SIN;
input REFCLK;
input CDRRST;
input EXLOSS;
output [0:9] RXD;
output RECCLK;
output CSLOCK;
output CDRLOCK;
output LOSS;
output SYDT;
endmodule 
module CDRX_10B12B(SIN, REFCLK, CDRRST, SYDTRST, RXD, RECCLK, CSLOCK, CDRLOCK, LOSS, SYDT);// synthesis syn_black_box
input SIN;
input REFCLK;
input CDRRST;
input SYDTRST;
output [0:9] RXD;
output RECCLK;
output CSLOCK;
output CDRLOCK;
output LOSS;
output SYDT;
endmodule 
module TX_8B10B(TXD, REFCLK, SOUT, CSLOCK);// synthesis syn_black_box
input [0:9] TXD;
input REFCLK;
output SOUT;
output CSLOCK;
endmodule 
module TX_10B12B(TXD, REFCLK, SOUT, CSLOCK);// synthesis syn_black_box
input [0:9] TXD;
input REFCLK;
output SOUT;
output CSLOCK;
endmodule 
//Memory Cells for ispMACH5000MX -- SuperCool
module RAMB16K_X1(CEN, CLK, WR, CS0, CS1, RST, DI0, AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8, AD9, AD10, AD11, AD12, AD13, DO0);// synthesis syn_black_box
input CEN;
input CLK;
input WR;
input CS0;
input CS1;
input RST;
input DI0;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input AD5;
input AD6;
input AD7;
input AD8;
input AD9;
input AD10;
input AD11;
input AD12;
input AD13;
output DO0;
endmodule 
module RAMB16K_X2(CEN, CLK, WR, CS0, CS1, RST, DI0, DI1, AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8, AD9, AD10, AD11, AD12, DO0, DO1);// synthesis syn_black_box
input CEN;
input CLK;
input WR;
input CS0;
input CS1;
input RST;
input DI0;
input DI1;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input AD5;
input AD6;
input AD7;
input AD8;
input AD9;
input AD10;
input AD11;
input AD12;
output DO0;
output DO1;
endmodule 
module RAMB16K_X4(CEN, CLK, WR, CS0, CS1, RST, DI0, DI1, DI2, DI3, AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8, AD9, AD10, AD11, DO0, DO1, DO2, DO3);// synthesis syn_black_box
input CEN;
input CLK;
input WR;
input CS0;
input CS1;
input RST;
input DI0;
input DI1;
input DI2;
input DI3;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input AD5;
input AD6;
input AD7;
input AD8;
input AD9;
input AD10;
input AD11;
output DO0;
output DO1;
output DO2;
output DO3;
endmodule 
module RAMB16K_X8(CEN, CLK, WR, CS0, CS1, RST, DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8, AD9, AD10, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7);// synthesis syn_black_box
input CEN;
input CLK;
input WR;
input CS0;
input CS1;
input RST;
input DI0;
input DI1;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input AD5;
input AD6;
input AD7;
input AD8;
input AD9;
input AD10;
output DO0;
output DO1;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
endmodule 
module RAMB16K_X16(CEN, CLK, WR, CS0, CS1, RST, DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8, AD9, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15);// synthesis syn_black_box
input CEN;
input CLK;
input WR;
input CS0;
input CS1;
input RST;
input DI0;
input DI1;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
input DI10;
input DI11;
input DI12;
input DI13;
input DI14;
input DI15;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input AD5;
input AD6;
input AD7;
input AD8;
input AD9;
output DO0;
output DO1;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
output DO10;
output DO11;
output DO12;
output DO13;
output DO14;
output DO15;
endmodule 
module RAMB16K_X32(CEN, CLK, WR, CS0, CS1, RST, DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17, DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26, DI27, DI28, DI29, DI30, DI31, AD0, AD1, AD2, AD3, AD4, AD5, AD6, AD7, AD8, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17, DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26, DO27, DO28, DO29, DO30, DO31);// synthesis syn_black_box
input CEN;
input CLK;
input WR;
input CS0;
input CS1;
input RST;
input DI0;
input DI1;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
input DI10;
input DI11;
input DI12;
input DI13;
input DI14;
input DI15;
input DI16;
input DI17;
input DI18;
input DI19;
input DI20;
input DI21;
input DI22;
input DI23;
input DI24;
input DI25;
input DI26;
input DI27;
input DI28;
input DI29;
input DI30;
input DI31;
input AD0;
input AD1;
input AD2;
input AD3;
input AD4;
input AD5;
input AD6;
input AD7;
input AD8;
output DO0;
output DO1;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
output DO10;
output DO11;
output DO12;
output DO13;
output DO14;
output DO15;
output DO16;
output DO17;
output DO18;
output DO19;
output DO20;
output DO21;
output DO22;
output DO23;
output DO24;
output DO25;
output DO26;
output DO27;
output DO28;
output DO29;
output DO30;
output DO31;
endmodule 
module RAMB16K_RX1_WX1(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, WAD12, WAD13, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RAD10, RAD11, RAD12, RAD13, RD0);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input WAD12;
input WAD13;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
input RAD10;
input RAD11;
input RAD12;
input RAD13;
output RD0;
endmodule 
module RAMB16K_RX1_WX2(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, WAD12, WAD13, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RAD10, RAD11, RAD12, RD0, RD1);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input WAD12;
input WAD13;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
input RAD10;
input RAD11;
input RAD12;
output RD0;
output RD1;
endmodule 
module RAMB16K_RX1_WX4(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, WAD12, WAD13, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RAD10, RAD11, RD0, RD1, RD2, RD3);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input WAD12;
input WAD13;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
input RAD10;
input RAD11;
output RD0;
output RD1;
output RD2;
output RD3;
endmodule 
module RAMB16K_RX1_WX8(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, WAD12, WAD13, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RAD10, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input WAD12;
input WAD13;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
input RAD10;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
endmodule 
module RAMB16K_RX1_WX16(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, WAD12, WAD13, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13, RD14, RD15);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input WAD12;
input WAD13;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
output RD8;
output RD9;
output RD10;
output RD11;
output RD12;
output RD13;
output RD14;
output RD15;
endmodule 
module RAMB16K_RX1_WX32(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, WAD12, WAD13, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13, RD14, RD15, RD16, RD17, RD18, RD19, RD20, RD21, RD22, RD23, RD24, RD25, RD26, RD27, RD28, RD29, RD30, RD31);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input WAD12;
input WAD13;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
output RD8;
output RD9;
output RD10;
output RD11;
output RD12;
output RD13;
output RD14;
output RD15;
output RD16;
output RD17;
output RD18;
output RD19;
output RD20;
output RD21;
output RD22;
output RD23;
output RD24;
output RD25;
output RD26;
output RD27;
output RD28;
output RD29;
output RD30;
output RD31;
endmodule 
module RAMB16K_RX2_WX2(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, WAD12, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RAD10, RAD11, RAD12, RD0, RD1);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input WAD12;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
input RAD10;
input RAD11;
input RAD12;
output RD0;
output RD1;
endmodule 
module RAMB16K_RX2_WX4(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, WAD12, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RAD10, RAD11, RD0, RD1, RD2, RD3);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input WAD12;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
input RAD10;
input RAD11;
output RD0;
output RD1;
output RD2;
output RD3;
endmodule 
module RAMB16K_RX2_WX8(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, WAD12, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RAD10, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input WAD12;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
input RAD10;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
endmodule 
module RAMB16K_RX2_WX16(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, WAD12, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13, RD14, RD15);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input WAD12;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
output RD8;
output RD9;
output RD10;
output RD11;
output RD12;
output RD13;
output RD14;
output RD15;
endmodule 
module RAMB16K_RX2_WX32(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, WAD12, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13, RD14, RD15, RD16, RD17, RD18, RD19, RD20, RD21, RD22, RD23, RD24, RD25, RD26, RD27, RD28, RD29, RD30, RD31);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input WAD12;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
output RD8;
output RD9;
output RD10;
output RD11;
output RD12;
output RD13;
output RD14;
output RD15;
output RD16;
output RD17;
output RD18;
output RD19;
output RD20;
output RD21;
output RD22;
output RD23;
output RD24;
output RD25;
output RD26;
output RD27;
output RD28;
output RD29;
output RD30;
output RD31;
endmodule 
module RAMB16K_RX4_WX4(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WD2, WD3, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RAD10, RAD11, RD0, RD1, RD2, RD3);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WD2;
input WD3;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
input RAD10;
input RAD11;
output RD0;
output RD1;
output RD2;
output RD3;
endmodule 
module RAMB16K_RX4_WX8(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WD2, WD3, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RAD10, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WD2;
input WD3;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
input RAD10;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
endmodule 
//////////////////////////
module RAMB16K_RX4_WX16(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WD2, WD3, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13, RD14, RD15);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WD2;
input WD3;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
output RD8;
output RD9;
output RD10;
output RD11;
output RD12;
output RD13;
output RD14;
output RD15;
endmodule
module RAMB16K_RX4_WX32(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WD2, WD3, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, WAD11, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13, RD14, RD15, RD16, RD17, RD18, RD19, RD20, RD21, RD22, RD23, RD24, RD25, RD26, RD27, RD28, RD29, RD30, RD31);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WD2;
input WD3;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input WAD11;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
output RD8;
output RD9;
output RD10;
output RD11;
output RD12;
output RD13;
output RD14;
output RD15;
output RD16;
output RD17;
output RD18;
output RD19;
output RD20;
output RD21;
output RD22;
output RD23;
output RD24;
output RD25;
output RD26;
output RD27;
output RD28;
output RD29;
output RD30;
output RD31;
endmodule  
module RAMB16K_RX8_WX8(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WD2, WD3, WD4, WD5, WD6, WD7, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RAD10, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WD2;
input WD3;
input WD4;
input WD5;
input WD6;
input WD7;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
input RAD10;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
endmodule 
module RAMB16K_RX8_WX16(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WD2, WD3, WD4, WD5, WD6, WD7, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13, RD14, RD15);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WD2;
input WD3;
input WD4;
input WD5;
input WD6;
input WD7;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
output RD8;
output RD9;
output RD10;
output RD11;
output RD12;
output RD13;
output RD14;
output RD15;
endmodule
module RAMB16K_RX8_WX32(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WD2, WD3, WD4, WD5, WD6, WD7, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, WAD10, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13, RD14, RD15, RD16, RD17, RD18, RD19, RD20, RD21, RD22, RD23, RD24, RD25, RD26, RD27, RD28, RD29, RD30, RD31);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WD2;
input WD3;
input WD4;
input WD5;
input WD6;
input WD7;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input WAD10;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
output RD8;
output RD9;
output RD10;
output RD11;
output RD12;
output RD13;
output RD14;
output RD15;
output RD16;
output RD17;
output RD18;
output RD19;
output RD20;
output RD21;
output RD22;
output RD23;
output RD24;
output RD25;
output RD26;
output RD27;
output RD28;
output RD29;
output RD30;
output RD31;
endmodule  
module RAMB16K_RX16_WX16(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RAD9, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13, RD14, RD15);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WD2;
input WD3;
input WD4;
input WD5;
input WD6;
input WD7;
input WD8;
input WD9;
input WD10;
input WD11;
input WD12;
input WD13;
input WD14;
input WD15;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
input RAD9;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
output RD8;
output RD9;
output RD10;
output RD11;
output RD12;
output RD13;
output RD14;
output RD15;
endmodule
module RAMB16K_RX16_WX32(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, WAD9, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13, RD14, RD15, RD16, RD17, RD18, RD19, RD20, RD21, RD22, RD23, RD24, RD25, RD26, RD27, RD28, RD29, RD30, RD31);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WD2;
input WD3;
input WD4;
input WD5;
input WD6;
input WD7;
input WD8;
input WD9;
input WD10;
input WD11;
input WD12;
input WD13;
input WD14;
input WD15;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input WAD9;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
output RD8;
output RD9;
output RD10;
output RD11;
output RD12;
output RD13;
output RD14;
output RD15;
output RD16;
output RD17;
output RD18;
output RD19;
output RD20;
output RD21;
output RD22;
output RD23;
output RD24;
output RD25;
output RD26;
output RD27;
output RD28;
output RD29;
output RD30;
output RD31;
endmodule  
module RAMB16K_RX32_WX32(WCEN, WCLK, WCS0, WCS1, WE, RCEN, RCLK, RST, WD0, WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WD16, WD17, WD18, WD19, WD20, WD21, WD22, WD23, WD24, WD25, WD26, WD27, WD28, WD29, WD30, WD31, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WAD7, WAD8, RAD0, RAD1, RAD2, RAD3, RAD4, RAD5, RAD6, RAD7, RAD8, RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13, RD14, RD15, RD16, RD17, RD18, RD19, RD20, RD21, RD22, RD23, RD24, RD25, RD26, RD27, RD28, RD29, RD30, RD31);// synthesis syn_black_box
input WCEN;
input WCLK;
input WCS0;
input WCS1;
input WE;
input RCEN;
input RCLK;
input RST;
input WD0;
input WD1;
input WD2;
input WD3;
input WD4;
input WD5;
input WD6;
input WD7;
input WD8;
input WD9;
input WD10;
input WD11;
input WD12;
input WD13;
input WD14;
input WD15;
input WD16;
input WD17;
input WD18;
input WD19;
input WD20;
input WD21;
input WD22;
input WD23;
input WD24;
input WD25;
input WD26;
input WD27;
input WD28;
input WD29;
input WD30;
input WD31;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WAD7;
input WAD8;
input RAD0;
input RAD1;
input RAD2;
input RAD3;
input RAD4;
input RAD5;
input RAD6;
input RAD7;
input RAD8;
output RD0;
output RD1;
output RD2;
output RD3;
output RD4;
output RD5;
output RD6;
output RD7;
output RD8;
output RD9;
output RD10;
output RD11;
output RD12;
output RD13;
output RD14;
output RD15;
output RD16;
output RD17;
output RD18;
output RD19;
output RD20;
output RD21;
output RD22;
output RD23;
output RD24;
output RD25;
output RD26;
output RD27;
output RD28;
output RD29;
output RD30;
output RD31;
endmodule  
module RAMB8K_X1_X1(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, ADA11, ADA12, DIB0, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, ADB9, ADB10, ADB11, ADB12, DOA0, DOB0);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input ADA11;
input ADA12;
input DIB0;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
input ADB9;
input ADB10;
input ADB11;
input ADB12;
output DOA0;
output DOB0;
endmodule 
module RAMB8K_X1_X2(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, ADA11, ADA12, DIB0, DIB1, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, ADB9, ADB10, ADB11, DOA0, DOB0, DOB1);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input ADA11;
input ADA12;
input DIB0;
input DIB1;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
input ADB9;
input ADB10;
input ADB11;
output DOA0;
output DOB0;
output DOB1;
endmodule 
module RAMB8K_X1_X4(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, ADA11, ADA12, DIB0, DIB1, DIB2, DIB3, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, ADB9, ADB10, DOA0, DOB0, DOB1, DOB2, DOB3);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input ADA11;
input ADA12;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
input ADB9;
input ADB10;
output DOA0;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
endmodule 
module RAMB8K_X1_X8(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, ADA11, ADA12, DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, ADB9, DOA0, DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input ADA11;
input ADA12;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input DIB4;
input DIB5;
input DIB6;
input DIB7;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
input ADB9;
output DOA0;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
output DOB4;
output DOB5;
output DOB6;
output DOB7;
endmodule 
module RAMB8K_X1_X16(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, ADA11, ADA12, DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, DIB8, DIB9, DIB10, DIB11, DIB12, DIB13, DIB14, DIB15, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, DOA0, DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7, DOB8, DOB9, DOB10, DOB11, DOB12, DOB13, DOB14, DOB15);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input ADA11;
input ADA12;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input DIB4;
input DIB5;
input DIB6;
input DIB7;
input DIB8;
input DIB9;
input DIB10;
input DIB11;
input DIB12;
input DIB13;
input DIB14;
input DIB15;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
output DOA0;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
output DOB4;
output DOB5;
output DOB6;
output DOB7;
output DOB8;
output DOB9;
output DOB10;
output DOB11;
output DOB12;
output DOB13;
output DOB14;
output DOB15;
endmodule 
module RAMB8K_X2_X2(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, DIA1, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, ADA11, DIB0, DIB1, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, ADB9, ADB10, ADB11, DOA0, DOA1, DOB0, DOB1);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input DIA1;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input ADA11;
input DIB0;
input DIB1;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
input ADB9;
input ADB10;
input ADB11;
output DOA0;
output DOA1;
output DOB0;
output DOB1;
endmodule 
module RAMB8K_X2_X4(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, DIA1, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, ADA11, DIB0, DIB1, DIB2, DIB3, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, ADB9, ADB10, DOA0, DOA1, DOB0, DOB1, DOB2, DOB3);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input DIA1;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input ADA11;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
input ADB9;
input ADB10;
output DOA0;
output DOA1;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
endmodule 
module RAMB8K_X2_X8(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, DIA1, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, ADA11, DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, ADB9, DOA0, DOA1, DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input DIA1;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input ADA11;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input DIB4;
input DIB5;
input DIB6;
input DIB7;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
input ADB9;
output DOA0;
output DOA1;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
output DOB4;
output DOB5;
output DOB6;
output DOB7;
endmodule 
module RAMB8K_X2_X16(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, DIA1, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, ADA11, DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, DIB8, DIB9, DIB10, DIB11, DIB12, DIB13, DIB14, DIB15, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, DOA0, DOA1, DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7, DOB8, DOB9, DOB10, DOB11, DOB12, DOB13, DOB14, DOB15);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input DIA1;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input ADA11;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input DIB4;
input DIB5;
input DIB6;
input DIB7;
input DIB8;
input DIB9;
input DIB10;
input DIB11;
input DIB12;
input DIB13;
input DIB14;
input DIB15;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
output DOA0;
output DOA1;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
output DOB4;
output DOB5;
output DOB6;
output DOB7;
output DOB8;
output DOB9;
output DOB10;
output DOB11;
output DOB12;
output DOB13;
output DOB14;
output DOB15;
endmodule 
module RAMB8K_X4_X4(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, DIA1, DIA2, DIA3, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, DIB0, DIB1, DIB2, DIB3, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, ADB9, ADB10, DOA0, DOA1, DOA2, DOA3, DOB0, DOB1, DOB2, DOB3);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input DIA1;
input DIA2;
input DIA3;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
input ADB9;
input ADB10;
output DOA0;
output DOA1;
output DOA2;
output DOA3;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
endmodule 
module RAMB8K_X4_X8(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, DIA1, DIA2, DIA3, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, ADB9, DOA0, DOA1, DOA2, DOA3, DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input DIA1;
input DIA2;
input DIA3;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input DIB4;
input DIB5;
input DIB6;
input DIB7;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
input ADB9;
output DOA0;
output DOA1;
output DOA2;
output DOA3;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
output DOB4;
output DOB5;
output DOB6;
output DOB7;
endmodule 
module RAMB8K_X4_X16(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, DIA1, DIA2, DIA3, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, ADA10, DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, DIB8, DIB9, DIB10, DIB11, DIB12, DIB13, DIB14, DIB15, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, DOA0, DOA1, DOA2, DOA3, DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7, DOB8, DOB9, DOB10, DOB11, DOB12, DOB13, DOB14, DOB15);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input DIA1;
input DIA2;
input DIA3;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input ADA10;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input DIB4;
input DIB5;
input DIB6;
input DIB7;
input DIB8;
input DIB9;
input DIB10;
input DIB11;
input DIB12;
input DIB13;
input DIB14;
input DIB15;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
output DOA0;
output DOA1;
output DOA2;
output DOA3;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
output DOB4;
output DOB5;
output DOB6;
output DOB7;
output DOB8;
output DOB9;
output DOB10;
output DOB11;
output DOB12;
output DOB13;
output DOB14;
output DOB15;
endmodule 
module RAMB8K_X8_X8(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, DIA1, DIA2, DIA3, DIA4, DIA5, DIA6, DIA7, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, ADB9, DOA0, DOA1, DOA2, DOA3, DOA4, DOA5, DOA6, DOA7, DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input DIA1;
input DIA2;
input DIA3;
input DIA4;
input DIA5;
input DIA6;
input DIA7;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input DIB4;
input DIB5;
input DIB6;
input DIB7;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
input ADB9;
output DOA0;
output DOA1;
output DOA2;
output DOA3;
output DOA4;
output DOA5;
output DOA6;
output DOA7;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
output DOB4;
output DOB5;
output DOB6;
output DOB7;
endmodule 
module RAMB8K_X8_X16(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, DIA1, DIA2, DIA3, DIA4, DIA5, DIA6, DIA7, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, ADA9, DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, DIB8, DIB9, DIB10, DIB11, DIB12, DIB13, DIB14, DIB15, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, DOA0, DOA1, DOA2, DOA3, DOA4, DOA5, DOA6, DOA7, DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7, DOB8, DOB9, DOB10, DOB11, DOB12, DOB13, DOB14, DOB15);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input DIA1;
input DIA2;
input DIA3;
input DIA4;
input DIA5;
input DIA6;
input DIA7;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input ADA9;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input DIB4;
input DIB5;
input DIB6;
input DIB7;
input DIB8;
input DIB9;
input DIB10;
input DIB11;
input DIB12;
input DIB13;
input DIB14;
input DIB15;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
output DOA0;
output DOA1;
output DOA2;
output DOA3;
output DOA4;
output DOA5;
output DOA6;
output DOA7;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
output DOB4;
output DOB5;
output DOB6;
output DOB7;
output DOB8;
output DOB9;
output DOB10;
output DOB11;
output DOB12;
output DOB13;
output DOB14;
output DOB15;
endmodule 
module RAMB8K_X16_X16(CENA, CLKA, WRA, CSA0, CSA1, RSTA, CENB, CLKB, WRB, CSB0, CSB1, RSTB, DIA0, DIA1, DIA2, DIA3, DIA4, DIA5, DIA6, DIA7, DIA8, DIA9, DIA10, DIA11, DIA12, DIA13, DIA14, DIA15, ADA0, ADA1, ADA2, ADA3, ADA4, ADA5, ADA6, ADA7, ADA8, DIB0, DIB1, DIB2, DIB3, DIB4, DIB5, DIB6, DIB7, DIB8, DIB9, DIB10, DIB11, DIB12, DIB13, DIB14, DIB15, ADB0, ADB1, ADB2, ADB3, ADB4, ADB5, ADB6, ADB7, ADB8, DOA0, DOA1, DOA2, DOA3, DOA4, DOA5, DOA6, DOA7, DOA8, DOA9, DOA10, DOA11, DOA12, DOA13, DOA14, DOA15, DOB0, DOB1, DOB2, DOB3, DOB4, DOB5, DOB6, DOB7, DOB8, DOB9, DOB10, DOB11, DOB12, DOB13, DOB14, DOB15);// synthesis syn_black_box
input CENA;
input CLKA;
input WRA;
input CSA0;
input CSA1;
input RSTA;
input CENB;
input CLKB;
input WRB;
input CSB0;
input CSB1;
input RSTB;
input DIA0;
input DIA1;
input DIA2;
input DIA3;
input DIA4;
input DIA5;
input DIA6;
input DIA7;
input DIA8;
input DIA9;
input DIA10;
input DIA11;
input DIA12;
input DIA13;
input DIA14;
input DIA15;
input ADA0;
input ADA1;
input ADA2;
input ADA3;
input ADA4;
input ADA5;
input ADA6;
input ADA7;
input ADA8;
input DIB0;
input DIB1;
input DIB2;
input DIB3;
input DIB4;
input DIB5;
input DIB6;
input DIB7;
input DIB8;
input DIB9;
input DIB10;
input DIB11;
input DIB12;
input DIB13;
input DIB14;
input DIB15;
input ADB0;
input ADB1;
input ADB2;
input ADB3;
input ADB4;
input ADB5;
input ADB6;
input ADB7;
input ADB8;
output DOA0;
output DOA1;
output DOA2;
output DOA3;
output DOA4;
output DOA5;
output DOA6;
output DOA7;
output DOA8;
output DOA9;
output DOA10;
output DOA11;
output DOA12;
output DOA13;
output DOA14;
output DOA15;
output DOB0;
output DOB1;
output DOB2;
output DOB3;
output DOB4;
output DOB5;
output DOB6;
output DOB7;
output DOB8;
output DOB9;
output DOB10;
output DOB11;
output DOB12;
output DOB13;
output DOB14;
output DOB15;
endmodule 
module RAMBFIFO512X32A(WE, WCLK, RST, FULLIN, RE, RCLK, EMPTYIN, RPRST, DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DI16, DI17, DI18, DI19, DI20, DI21, DI22, DI23, DI24, DI25, DI26, DI27, DI28, DI29, DI30, DI31, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, DO16, DO17, DO18, DO19, DO20, DO21, DO22, DO23, DO24, DO25, DO26, DO27, DO28, DO29, DO30, DO31, FULL, AMFULL, EMPTY, AMEMPTY);// synthesis syn_black_box
input WE;
input WCLK;
input RST;
input FULLIN;
input RE;
input RCLK;
input EMPTYIN;
input RPRST;
input DI0;
input DI1;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
input DI10;
input DI11;
input DI12;
input DI13;
input DI14;
input DI15;
input DI16;
input DI17;
input DI18;
input DI19;
input DI20;
input DI21;
input DI22;
input DI23;
input DI24;
input DI25;
input DI26;
input DI27;
input DI28;
input DI29;
input DI30;
input DI31;
output DO0;
output DO1;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
output DO10;
output DO11;
output DO12;
output DO13;
output DO14;
output DO15;
output DO16;
output DO17;
output DO18;
output DO19;
output DO20;
output DO21;
output DO22;
output DO23;
output DO24;
output DO25;
output DO26;
output DO27;
output DO28;
output DO29;
output DO30;
output DO31;
output FULL;
output AMFULL;
output EMPTY;
output AMEMPTY;
endmodule 
module RAMBFIFO1KX16A(WE, WCLK, RST, FULLIN, RE, RCLK, EMPTYIN, RPRST, DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DI8, DI9, DI10, DI11, DI12, DI13, DI14, DI15, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, DO8, DO9, DO10, DO11, DO12, DO13, DO14, DO15, FULL, AMFULL, EMPTY, AMEMPTY);// synthesis syn_black_box
input WE;
input WCLK;
input RST;
input FULLIN;
input RE;
input RCLK;
input EMPTYIN;
input RPRST;
input DI0;
input DI1;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
input DI8;
input DI9;
input DI10;
input DI11;
input DI12;
input DI13;
input DI14;
input DI15;
output DO0;
output DO1;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output DO8;
output DO9;
output DO10;
output DO11;
output DO12;
output DO13;
output DO14;
output DO15;
output FULL;
output AMFULL;
output EMPTY;
output AMEMPTY;
endmodule 
module RAMBFIFO2KX8A(WE, WCLK, RST, FULLIN, RE, RCLK, EMPTYIN, RPRST, DI0, DI1, DI2, DI3, DI4, DI5, DI6, DI7, DO0, DO1, DO2, DO3, DO4, DO5, DO6, DO7, FULL, AMFULL, EMPTY, AMEMPTY);// synthesis syn_black_box
input WE;
input WCLK;
input RST;
input FULLIN;
input RE;
input RCLK;
input EMPTYIN;
input RPRST;
input DI0;
input DI1;
input DI2;
input DI3;
input DI4;
input DI5;
input DI6;
input DI7;
output DO0;
output DO1;
output DO2;
output DO3;
output DO4;
output DO5;
output DO6;
output DO7;
output FULL;
output AMFULL;
output EMPTY;
output AMEMPTY;
endmodule 
module RAMBFIFO4KX4A(WE, WCLK, RST, FULLIN, RE, RCLK, EMPTYIN, RPRST, DI0, DI1, DI2, DI3, DO0, DO1, DO2, DO3, FULL, AMFULL, EMPTY, AMEMPTY);// synthesis syn_black_box
input WE;
input WCLK;
input RST;
input FULLIN;
input RE;
input RCLK;
input EMPTYIN;
input RPRST;
input DI0;
input DI1;
input DI2;
input DI3;
output DO0;
output DO1;
output DO2;
output DO3;
output FULL;
output AMFULL;
output EMPTY;
output AMEMPTY;
endmodule 
module RAMBFIFO8KX2A(WE, WCLK, RST, FULLIN, RE, RCLK, EMPTYIN, RPRST, DI0, DI1, DO0, DO1, FULL, AMFULL, EMPTY, AMEMPTY);// synthesis syn_black_box
input WE;
input WCLK;
input RST;
input FULLIN;
input RE;
input RCLK;
input EMPTYIN;
input RPRST;
input DI0;
input DI1;
output DO0;
output DO1;
output FULL;
output AMFULL;
output EMPTY;
output AMEMPTY;
endmodule 
module RAMBFIFO16KX1A(WE, WCLK, RST, FULLIN, RE, RCLK, EMPTYIN, RPRST, DI0, DO0, FULL, AMFULL, EMPTY, AMEMPTY);// synthesis syn_black_box
input WE;
input WCLK;
input RST;
input FULLIN;
input RE;
input RCLK;
input EMPTYIN;
input RPRST;
input DI0;
output DO0;
output FULL;
output AMFULL;
output EMPTY;
output AMEMPTY;
endmodule 
module CAM128X48(CE, WE, CLK, EN_MASK, WR_MASK, WR_DC, RST, CS0, CS1, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WD0, WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WD16, WD17, WD18, WD19, WD20, WD21, WD22, WD23, WD24, WD25, WD26, WD27, WD28, WD29, WD30, WD31, WD32, WD33, WD34, WD35, WD36, WD37, WD38, WD39, WD40, WD41, WD42, WD43, WD44, WD45, WD46, WD47, CO0, CO1, CO2, CO3, CO4, CO5, CO6, MATCH, MUL_MATCH);// synthesis syn_black_box
input CE;
input WE;
input CLK;
input EN_MASK;
input WR_MASK;
input WR_DC;
input RST;
input CS0;
input CS1;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WD0;
input WD1;
input WD2;
input WD3;
input WD4;
input WD5;
input WD6;
input WD7;
input WD8;
input WD9;
input WD10;
input WD11;
input WD12;
input WD13;
input WD14;
input WD15;
input WD16;
input WD17;
input WD18;
input WD19;
input WD20;
input WD21;
input WD22;
input WD23;
input WD24;
input WD25;
input WD26;
input WD27;
input WD28;
input WD29;
input WD30;
input WD31;
input WD32;
input WD33;
input WD34;
input WD35;
input WD36;
input WD37;
input WD38;
input WD39;
input WD40;
input WD41;
input WD42;
input WD43;
input WD44;
input WD45;
input WD46;
input WD47;
output CO0;
output CO1;
output CO2;
output CO3;
output CO4;
output CO5;
output CO6;
output MATCH;
output MUL_MATCH;
endmodule 
module CAM128X48CL(CE, WE, CLK, EN_MASK, WR_MASK, WR_DC, RST, CS0, CS1, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WD0, WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WD16, WD17, WD18, WD19, WD20, WD21, WD22, WD23, WD24, WD25, WD26, WD27, WD28, WD29, WD30, WD31, WD32, WD33, WD34, WD35, WD36, WD37, WD38, WD39, WD40, WD41, WD42, WD43, WD44, WD45, WD46, WD47, CMO);// synthesis syn_black_box
input CE;
input WE;
input CLK;
input EN_MASK;
input WR_MASK;
input WR_DC;
input RST;
input CS0;
input CS1;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WD0;
input WD1;
input WD2;
input WD3;
input WD4;
input WD5;
input WD6;
input WD7;
input WD8;
input WD9;
input WD10;
input WD11;
input WD12;
input WD13;
input WD14;
input WD15;
input WD16;
input WD17;
input WD18;
input WD19;
input WD20;
input WD21;
input WD22;
input WD23;
input WD24;
input WD25;
input WD26;
input WD27;
input WD28;
input WD29;
input WD30;
input WD31;
input WD32;
input WD33;
input WD34;
input WD35;
input WD36;
input WD37;
input WD38;
input WD39;
input WD40;
input WD41;
input WD42;
input WD43;
input WD44;
input WD45;
input WD46;
input WD47;
output [127:0] CMO;
endmodule 
module CAM128X48CM(CE, WE, CLK, EN_MASK, WR_MASK, WR_DC, RST, CS0, CS1, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WD0, WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WD16, WD17, WD18, WD19, WD20, WD21, WD22, WD23, WD24, WD25, WD26, WD27, WD28, WD29, WD30, WD31, WD32, WD33, WD34, WD35, WD36, WD37, WD38, WD39, WD40, WD41, WD42, WD43, WD44, WD45, WD46, WD47, CMI, CMO);// synthesis syn_black_box
input CE;
input WE;
input CLK;
input EN_MASK;
input WR_MASK;
input WR_DC;
input RST;
input CS0;
input CS1;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WD0;
input WD1;
input WD2;
input WD3;
input WD4;
input WD5;
input WD6;
input WD7;
input WD8;
input WD9;
input WD10;
input WD11;
input WD12;
input WD13;
input WD14;
input WD15;
input WD16;
input WD17;
input WD18;
input WD19;
input WD20;
input WD21;
input WD22;
input WD23;
input WD24;
input WD25;
input WD26;
input WD27;
input WD28;
input WD29;
input WD30;
input WD31;
input WD32;
input WD33;
input WD34;
input WD35;
input WD36;
input WD37;
input WD38;
input WD39;
input WD40;
input WD41;
input WD42;
input WD43;
input WD44;
input WD45;
input WD46;
input WD47;
input [127:0] CMI;
output [127:0] CMO;
endmodule 
module CAM128X48CR(CE, WE, CLK, EN_MASK, WR_MASK, WR_DC, RST, CS0, CS1, WAD0, WAD1, WAD2, WAD3, WAD4, WAD5, WAD6, WD0, WD1, WD2, WD3, WD4, WD5, WD6, WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WD16, WD17, WD18, WD19, WD20, WD21, WD22, WD23, WD24, WD25, WD26, WD27, WD28, WD29, WD30, WD31, WD32, WD33, WD34, WD35, WD36, WD37, WD38, WD39, WD40, WD41, WD42, WD43, WD44, WD45, WD46, WD47, CMI, CO0, CO1, CO2, CO3, CO4, CO5, CO6, MATCH, MUL_MATCH);// synthesis syn_black_box
input CE;
input WE;
input CLK;
input EN_MASK;
input WR_MASK;
input WR_DC;
input RST;
input CS0;
input CS1;
input WAD0;
input WAD1;
input WAD2;
input WAD3;
input WAD4;
input WAD5;
input WAD6;
input WD0;
input WD1;
input WD2;
input WD3;
input WD4;
input WD5;
input WD6;
input WD7;
input WD8;
input WD9;
input WD10;
input WD11;
input WD12;
input WD13;
input WD14;
input WD15;
input WD16;
input WD17;
input WD18;
input WD19;
input WD20;
input WD21;
input WD22;
input WD23;
input WD24;
input WD25;
input WD26;
input WD27;
input WD28;
input WD29;
input WD30;
input WD31;
input WD32;
input WD33;
input WD34;
input WD35;
input WD36;
input WD37;
input WD38;
input WD39;
input WD40;
input WD41;
input WD42;
input WD43;
input WD44;
input WD45;
input WD46;
input WD47;
input [127:0] CMI;
output CO0;
output CO1;
output CO2;
output CO3;
output CO4;
output CO5;
output CO6;
output MATCH;
output MUL_MATCH;
endmodule 
