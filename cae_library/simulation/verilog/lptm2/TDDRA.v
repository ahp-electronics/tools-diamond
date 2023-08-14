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
// $Header:
//
`resetall
`timescale 1 ns / 1 ps

`celldefine

module TDDRA(TD, RST, DQSW90, SCLK, TQ);
   input TD, DQSW90, RST, SCLK;
   output TQ;

   parameter DQSW90_INVERT = "DISABLED";
   parameter GSR = "ENABLED";

   reg QP0, QP1;
   reg last_SCLK, last_DQSW90B, DQSW90B;
   wire RSTB, SCLKB, DQSW90B1, OT;
   reg SRN;

  tri1 GSR_sig = GSR_INST.GSRNET;
  tri1 PUR_sig = PUR_INST.PURNET;

   buf (TQ, QP1);
   buf (OT, TD);
   buf (DQSW90B1, DQSW90);
   buf (RSTB1, RST);
   buf (SCLKB, SCLK);

      function DataSame;
        input a, b;
        begin
          if (a === b)
            DataSame = a;
          else
            DataSame = 1'bx;
        end
      endfunction

initial
begin
QP0 = 0;
QP1 = 0;
end

initial
begin
last_SCLK = 1'b0;
last_DQSW90B = 1'b0;
end

  always @ (GSR_sig or PUR_sig ) begin
    if (GSR == "ENABLED")
      SRN = GSR_sig & PUR_sig ;
    else if (GSR == "DISABLED")
      SRN = PUR_sig;
  end
                                                                                               
  not (SR, SRN);
  or INST1 (RSTB, RSTB1, SR);

always @ (SCLKB or DQSW90B)
begin
   last_SCLK <= SCLKB;
   last_DQSW90B <= DQSW90B;
end

always @ (DQSW90B1)
begin
   if (DQSW90_INVERT == "ENABLED")
      DQSW90B <= ~DQSW90B1;
   else
      DQSW90B <= DQSW90B1;
end

always @ (SCLKB or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      QP0 <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b1 && last_SCLK === 1'b0)
         begin
            QP0 <= OT;
         end
   end
end

always @ (DQSW90B or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      QP1 <= 1'b0;
   end
   else
   begin
      if (DQSW90B === 1'b1 && last_DQSW90B === 1'b0)
         begin
            QP1 <= QP0;
         end
   end
end

endmodule

`endcelldefine
