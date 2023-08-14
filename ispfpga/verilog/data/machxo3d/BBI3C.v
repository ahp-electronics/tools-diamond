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
// Simulation Library File for rilmd
//
// $Header: /disks/swrd3/msubrama/env/fpga/verilog/pkg/versclibs/data/rilmd/I3CBB.v,v 1.3 2016/07/18 17:13:00 msubram Exp $ 
//
`resetall
`timescale 1 ns / 1 ps

`celldefine

module BBI3C (I, T, O, B, RESEN, PULLUPEN);
  input  I, T, RESEN, PULLUPEN;
  output O;
  inout  B;

  supply1 TSALL;
  //tri1 TSALL = TSALL_INST.TSALLNET;

  not INST0 (TN, T);
  and INST1 (ENH, TN, TSALL);

  buf INST10 (O, B);
  bufif1 INST14 (B, I, ENH);


endmodule 

`endcelldefine
