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

module IDDRDQSX1A(D, DQSR90, SCLK, RST, DDRCLKPOL, Q0, Q1);

input  D, DQSR90, SCLK, DDRCLKPOL, RST;
output Q0, Q1;

   parameter  GSR = "ENABLED";            // "DISABLED", "ENABLED"

wire Db, DQSR90B, SCLKB, DDRCLKPOLB, RSTB;

reg QP0, QP1, QP2, QN0, QN1, QN2, QP3;
reg last_DQSR90, last_sclk_pol, last_SCLKB;
reg IN, IP, SRN;
wire sclk_pol;
wire sclk_pol_p;
wire sclk_pol_n;

tri1 GSR_sig = GSR_INST.GSRNET;
tri1 PUR_sig = PUR_INST.PURNET;

buf (Db, D);
buf (DQSR90B, DQSR90);
buf (SCLKB, SCLK);
buf (DDRCLKPOLB, DDRCLKPOL);
buf (RSTB1, RST);

buf (Q0, IP);
buf (Q1, IN);

initial
begin
QP0 = 0;
QP1 = 0;
QP2 = 0;
QN1 = 0;
QP3 = 0;
QN2 = 0;
QN0 = 0;
IP = 0;
IN = 0;
end

  always @ (GSR_sig or PUR_sig ) begin
    if (GSR == "ENABLED")
      SRN = GSR_sig & PUR_sig ;
    else if (GSR == "DISABLED")
      SRN = PUR_sig;
  end

  not (SR, SRN);
  or INST1 (RSTB, RSTB1, SR);

assign sclk_pol_p = SCLKB;
assign sclk_pol_n = ~SCLKB;
assign sclk_pol = DDRCLKPOLB ? sclk_pol_n : sclk_pol_p;

initial
begin
last_DQSR90 = 1'b0;
last_sclk_pol = 1'b0;
last_SCLKB = 1'b0;
end

always @ (DQSR90B, sclk_pol, SCLKB)
begin
   last_DQSR90 <= DQSR90B;
   last_sclk_pol <= sclk_pol;
   last_SCLKB <= SCLKB;
end

always @ (DQSR90B or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      QP0 <= 1'b0;
   end
   else
   begin
      if (DQSR90B === 1'b1 && last_DQSR90 === 1'b0)
      begin
         QP0 <= Db;
      end
   end
end

always @ (DQSR90B or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      QN0 <= 1'b0;
      QP1 <= 1'b0;
   end
   else
   begin
      if (DQSR90B === 1'b0 && last_DQSR90 === 1'b1)
      begin
         QN0 <= Db;
         QP1 <= QP0;
      end
   end
end

always @ (sclk_pol or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      QN1 <= 1'b0;
      QP2 <= 1'b0;
   end
   else
   begin
      if (sclk_pol === 1'b1 && last_sclk_pol === 1'b0)
      begin
         QN1 <= QN0;
         QP2 <= QP1;
      end
   end
end

always @ (SCLKB or RSTB or QN1 or QP2)
begin
   if (RSTB == 1'b1)
   begin
      QN2 <= 1'b0;
      QP3 <= 1'b0;
   end
   else
   begin
      if (SCLKB == 1'b1)
      begin
         QN2 <= QN1;
         QP3 <= QP2;
      end
   end
end

always @ (SCLKB or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      IN <= 1'b0;
      IP <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b1 && last_SCLKB === 1'b0)
      begin
         IN <= QN2;
         IP <= QP3;
      end
   end
end

endmodule

`endcelldefine
