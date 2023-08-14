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
//OR10
module OR10 (Z0, A0, A1, A2, A3, A4, A5, A6, A7, A8, A9);

    input  A0;
    input  A1;
    input  A2;
    input  A3;
    input  A4;
    input  A5;
    input  A6;    
    input  A7;
    input  A8;
    input  A9;    

    output  Z0;

    or INST1 (Z0, A0, A1, A2, A3, A4, A5, A6, A7, A8, A9);
endmodule
