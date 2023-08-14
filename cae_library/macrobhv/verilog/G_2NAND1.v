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
// G_2NAND1
module g_2nand1 (YN, AN, B);

   input AN, B;
   output YN;

   nand (YN, ~AN, B);

endmodule // g_2nand1
