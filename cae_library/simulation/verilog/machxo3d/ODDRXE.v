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

module ODDRXE(D0, D1, RST, SCLK, Q);
   input D0, D1, RST, SCLK;
   output Q;

  parameter GSR = "ENABLED";

   reg Q_b;
   reg QP0, QN1, QN0;
   reg last_SCLKB;
   wire QN_sig;
   wire RSTB, SCLKB;
   reg SCLKB1, SCLKB2;
   reg SRN;

  tri1 GSR_sig = GSR_INST.GSRNET;
  tri1 PUR_sig = PUR_INST.PURNET;

   assign QN_sig = Q_b; 

   buf (Q, QN_sig);
   buf (OP, D0);
   buf (ON, D1);
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
QN0 = 0;
QN1 = 0;
end

initial
begin
last_SCLKB = 1'b0;
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
   last_SCLKB <= SCLKB;
end

always @ (SCLKB, SCLKB1)
begin
   SCLKB1 <= SCLKB;
   SCLKB2 <= SCLKB1;
end

always @ (SCLKB or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      QP0 <= 1'b0;
      QN0 <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b1 && last_SCLKB === 1'b0)
         begin
            QP0 <= OP;
            QN0 <= ON;
         end
   end
end

always @ (SCLKB or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      QN1 <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b0 && last_SCLKB === 1'b1)
         begin
            QN1 <= QN0;
         end
   end
end

always @ (QP0 or QN1 or SCLKB2)
begin
   case (SCLKB2)
        1'b0 :  Q_b = QN1;
        1'b1 :  Q_b = QP0;
        default Q_b = DataSame(QN1, QP0);
   endcase
end

endmodule

`endcelldefine
