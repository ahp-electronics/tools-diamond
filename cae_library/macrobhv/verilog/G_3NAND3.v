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
//G_3NAND3
module g_3nand3 (YN, AN, BN, CN);

   input AN, BN, CN;
   output YN;

   nand (YN, ~AN, ~BN, ~CN);

endmodule // g_3nand3
