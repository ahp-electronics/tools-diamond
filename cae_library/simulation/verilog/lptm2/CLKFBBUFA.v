// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2005 by Lattice Semiconductor Corporation
// --------------------------------------------------------------------
//
//
//                     Lattice Semiconductor Corporation
//                     5555 NE Moore Court
//                     Hillsboro, OR 97214
//                     U.S.A.
//
//                     TEL: 1-800-Lattice  (USA and Canada)
//                          1-408-826-6000 (other locations)
//
//                     web: http://www.latticesemi.com/
//                     email: techsupport@latticesemi.com
//
// --------------------------------------------------------------------
//
// Simulation Library File for XO2
//
// fpga\verilog\pkg\versclibs\data\machxo2\CLKFBBUFA.v 1.0 21-APR-2010 13:28:47 PLENKA 
//
`resetall
`timescale 1 ns / 1 ps
`celldefine
module CLKFBBUFA (A, Z);
  input A;
  output Z;
 
  buf (Z, A);

endmodule
`endcelldefine
