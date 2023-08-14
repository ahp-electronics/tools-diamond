// -------------------------------------------------------------------- 
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<< 
// -------------------------------------------------------------------- 
// Copyright (c) 2006 by Lattice Semiconductor Corporation 
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
// Verilog behavior model for macros used by schematic capture
// Build by XiaoQiu ZHOU according to Verilog RTL model
// -------------------------------------------------------------------- 
//INV8
module inv8( A0, A1, A2, A3, A4, A5, A6, A7, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7 );
 input A0, A1, A2, A3, A4, A5, A6, A7;
output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

not INST1 ( Y7, A7 );
not INST2 ( Y6, A6 );
not INST3 ( Y5, A5 );
not INST4 ( Y4, A4 );
not INST5 ( Y3, A3 );
not INST6 ( Y2, A2 );
not INST7 ( Y1, A1 );
not INST8 ( Y0, A0 );

endmodule // inv8
