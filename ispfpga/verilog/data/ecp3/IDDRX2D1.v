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
// Simulation Library File for ECP3
//
// $Header: 
//

`resetall
`timescale 1 ns / 1 ps

`celldefine

module IDDRX2D1(D, ECLK, SCLK, QA0, QA1, QB0, QB1);

input  D, ECLK, SCLK;
output QA0, QA1, QB0, QB1;

parameter DR_CONFIG = "DISABLED";

wire Db, SCLKb1, ECLKb, CLKP;

reg QP0, QN0, QN1, IP0, IP1, IN0, IN1, IN2, IP2, IN4, IP4;
reg last_SCLKb, last_ECLKb, last_CLKP;
reg IPB, INB, POLB, INA, IPA;
wire IN3, IP3;
reg SCLKb2, SCLKb, DDRLATb;

buf (Db, D);
buf (SCLKb1, SCLK);
buf (ECLKb, ECLK);

buf (QA0, IPA);
buf (QB0, INA);
buf (QA1, IPB);
buf (QB1, INB);

initial
begin
QP0 = 0;
QN1 = 0;
QN0 = 0;
IP0 = 0;
IP1 = 0;
IN0 = 0;
IN1 = 0;
IN2 = 0;
IP2 = 0;
IN4 = 0;
IP4 = 0;
INA = 0;
IPA = 0;
IPB = 0;
INB = 0;
POLB = 0;
DDRLATb = 0;
end

assign CLKP = POLB ? ~ECLKb : ECLKb;

always @ (SCLKb1, SCLKb2)
begin
   SCLKb2 <= SCLKb1;
   SCLKb <= SCLKb2;
end

initial
begin
last_SCLKb = 1'b0;
last_ECLKb = 1'b0;
last_CLKP = 1'b0;
end

always @ (SCLKb or ECLKb or CLKP)
begin
   last_SCLKb <= SCLKb;
   last_ECLKb <= ECLKb;
   last_CLKP <= CLKP;
end

always @ (ECLKb)     // falling edge
begin
   if (ECLKb === 1'bX)
   begin
      if (QN0 !== Db)
         QN0 <= 1'bX;
   end
   else
   begin
      if (ECLKb === 1'b0 && last_ECLKb === 1'b1)
      begin
         QN0 <= Db;
      end
   end
end

always @ (ECLKb or Db)     // negative latch
begin
   if (ECLKb === 1'bX)
   begin
      if (QP0 !== Db)
         QP0 <= 1'bX;
   end
   else
   begin
      if (ECLKb == 1'b0)
      begin
         QP0 <= Db;
      end
   end
end

always @ (ECLKb)     // falling edge
begin
   if (ECLKb === 1'bX)
   begin
      if (QN1 !== QP0)
         QN1 <= 1'bX;
   end
   else
   begin
      if (ECLKb === 1'b0 && last_ECLKb === 1'b1)
      begin
         QN1 <= QP0;
      end
   end
end

always @ (CLKP)
begin
   if (CLKP === 1'bX)
   begin
      if (IN0 !== QN0)
         IN0 <= 1'bX;
   end
   else
   begin
      if (CLKP === 1'b1 && last_CLKP === 1'b0)
      begin
         IN0 <= QN0;
      end
   end
end

always @ (CLKP)
begin
   if (CLKP === 1'bX)
   begin
      if (IP0 !== QN1)
         IP0 <= 1'bX;
   end
   else
   begin
      if (CLKP === 1'b1 && last_CLKP === 1'b0)
      begin
         IP0 <= QN1;
      end
   end
end

always @ (ECLKb or IN0)     // positive latch
begin
   if (ECLKb === 1'bX)
   begin
      if (IN1 !== IN0)
         IN1 <= 1'bX;
   end
   else
   begin
      if (ECLKb == 1'b1)
      begin
         IN1 <= IN0;
      end
   end
end

always @ (ECLKb or IP0)     // positive latch
begin
   if (ECLKb === 1'bX)
   begin
      if (IP1 !== IP0)
         IP1 <= 1'bX;
   end
   else
   begin
      if (ECLKb == 1'b1)
      begin
         IP1 <= IP0;
      end
   end
end

always @ (ECLKb)
begin
   if (ECLKb === 1'bX)
   begin
      if (IN2 !== IN1)
         IN2 <= 1'bX;
      if (IP2 !== IP1)
         IP2 <= 1'bX;
   end
   else
   begin
      if (ECLKb === 1'b1 && last_ECLKb === 1'b0)
      begin
         IN2 <= IN1;
      end
      if (ECLKb === 1'b1 && last_ECLKb === 1'b0)
      begin
         IP2 <= IP1;
      end
   end
end

assign IN3 = (DDRLATb == 1'b1) ? IN2 : IN1;
assign IP3 = (DDRLATb == 1'b1) ? IP2 : IP1;

always @ (SCLKb)
begin
   if (SCLKb === 1'bX)
   begin
      if (INA !== IN4)
         INA <= 1'bX;
      if (INB !== IN3)
         INB <= 1'bX;
   end
   else
   begin
      if (SCLKb === 1'b1 && last_SCLKb === 1'b0)
      begin
         INA <= IN4;
         INB <= IN3;
      end
   end
end

always @ (SCLKb)
begin
   if (SCLKb === 1'bX)
   begin
      if (IPA !== IP4)
         IPA <= 1'bX;
      if (IPB !== IP3)
         IPB <= 1'bX;
   end
   else
   begin
      if (SCLKb === 1'b1 && last_SCLKb === 1'b0)
      begin
         IPA <= IP4;
         IPB <= IP3;
      end
   end
end

always @ (SCLKb or IN3)
begin
   if (SCLKb === 1'bX)
   begin
      if (IN4 !== IN3)
         IN4 <= 1'bX;
   end
   else
   begin
      if (SCLKb == 1'b1)
      begin
         IN4 <= IN3;
      end
   end
end

always @ (SCLKb or IP3)
begin
   if (SCLKb === 1'bX)
   begin
      if (IP4 !== IP3)
         IP4 <= 1'bX;
   end
   else
   begin
      if (SCLKb == 1'b1)
      begin
         IP4 <= IP3;
      end
   end
end

endmodule

`endcelldefine
