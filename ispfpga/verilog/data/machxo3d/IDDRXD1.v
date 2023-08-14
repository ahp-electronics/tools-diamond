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

module IDDRXD1(D, SCLK, QA, QB);

input  D, SCLK;
output QA, QB;

wire Db, SCLKb, CLKP;

reg QP0, QN0, QN1, IP0, IP1, IN0, IN1, IN2, IP2;
reg last_SCLKb, last_CLKP;
reg IPB, INB, POLB;

buf (Db, D);
buf (SCLKb, SCLK);

buf (QA, IPB);
buf (QB, INB);

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
IPB = 0;
INB = 0;
POLB = 0;
end

assign CLKP = POLB ? ~SCLKb : SCLKb;

initial
begin
last_SCLKb = 1'b0;
last_CLKP = 1'b0;
end

always @ (SCLKb or CLKP)
begin
   last_SCLKb <= SCLKb;
   last_CLKP <= CLKP;
end

always @ (SCLKb)     // falling edge
begin
   if (SCLKb === 1'bX)
   begin
      if (QN0 !== Db)
         QN0 <= 1'bX;
   end
   else
   begin
      if (SCLKb === 1'b0 && last_SCLKb === 1'b1)
      begin
         QN0 <= Db;
      end
   end
end

always @ (SCLKb or Db)     // negative latch
begin
   if (SCLKb === 1'bX)
   begin
      if (QP0 !== Db)
         QP0 <= 1'bX;
   end
   else
   begin
      if (SCLKb == 1'b0)
      begin
         QP0 <= Db;
      end
   end
end

always @ (SCLKb)     // falling edge
begin
   if (SCLKb === 1'bX)
   begin
      if (QN1 !== QP0)
         QN1 <= 1'bX;
   end
   else
   begin
      if (SCLKb === 1'b0 && last_SCLKb === 1'b1)
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

always @ (SCLKb or IN0)
begin
   if (SCLKb === 1'bX)
   begin
      if (IN1 !== IN0)
         IN1 <= 1'bX;
   end
   else
   begin
      if (SCLKb == 1'b1)
      begin
         IN1 <= IN0;
      end
   end
end

always @ (SCLKb or IP0)
begin
   if (SCLKb === 1'bX)
   begin
      if (IP1 !== IP0)
         IP1 <= 1'bX;
   end
   else
   begin
      if (SCLKb == 1'b1)
      begin
         IP1 <= IP0;
      end
   end
end

always @ (SCLKb)
begin
   if (SCLKb === 1'bX)
   begin
      if (INB !== IN1)
         INB <= 1'bX;
   end
   else
   begin
      if (SCLKb === 1'b1 && last_SCLKb === 1'b0)
      begin
         INB <= IN1;
      end
   end
end

always @ (SCLKb)
begin
   if (SCLKb === 1'bX)
   begin
      if (IPB !== IP1)
         IPB <= 1'bX;
   end
   else
   begin
      if (SCLKb === 1'b1 && last_SCLKb === 1'b0)
      begin
         IPB <= IP1;
      end
   end
end

endmodule

`endcelldefine
