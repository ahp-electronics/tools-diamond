// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2007 by Lattice Semiconductor Corporation
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
// $Header:
//

`resetall
`timescale 1 ns / 1 ps

`celldefine

module IDDRXE(D, SCLK, RST, Q0, Q1);

input  D, SCLK, RST;
output Q0, Q1;

  parameter GSR = "ENABLED";

wire Db, SCLKB, RSTB;

reg QP0, QN0, QN1;
reg last_SCLK;
reg IP, IN;
reg SRN;

  tri1 GSR_sig = GSR_INST.GSRNET;
  tri1 PUR_sig = PUR_INST.PURNET;

buf (Db, D);
buf (SCLKB, SCLK);
buf (RSTB1, RST);

buf (Q0, IP);
buf (Q1, IN);

initial
begin
QP0 = 0;
QN0 = 0;
IP = 0;
IN = 0;
end

initial
begin
last_SCLK = 1'b0;
end

  always @ (GSR_sig or PUR_sig ) begin
    if (GSR == "ENABLED")
      SRN = GSR_sig & PUR_sig ;
    else if (GSR == "DISABLED")
      SRN = PUR_sig;
  end
                                                                                               
  not (SR, SRN);
  or INST1 (RSTB, RSTB1, SR);

always @ (SCLKB)
begin
   last_SCLK <= SCLKB;
end

always @ (SCLKB or RSTB)     //neg edge
begin
   if (RSTB == 1'b1)
   begin
      QN0 <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b0 && last_SCLK === 1'b1)
      begin
         QN0 <= Db;
      end
   end
end

always @ (SCLKB or RSTB)     // pos edge
begin
   if (RSTB == 1'b1)
   begin
      QP0 <= 1'b0;
      IP <= 1'b0;
      IN <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b1 && last_SCLK === 1'b0)
      begin
         QP0 <= Db;
         IP <= QP0;
         IN <= QN0;
      end
   end
end

endmodule

`endcelldefine
