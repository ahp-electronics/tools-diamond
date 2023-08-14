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

module ODDRDQSX1A(D0, D1, SCLK, DQSW90, RST, Q);
   input D0, D1, SCLK, DQSW90, RST;
   output Q;

  parameter GSR = "ENABLED";

   reg QP0, QN0, QN1, Q_b;
   reg last_SCLKB;
   wire SCLKB, OP, ON, DQSW90B, RSTB, Q_sig;
   reg SRN;

  tri1 GSR_sig = GSR_INST.GSRNET;
  tri1 PUR_sig = PUR_INST.PURNET;

   assign Q_sig = Q_b; 

   buf (Q, Q_sig);
   buf (OP, D0);
   buf (ON, D1);
   buf (SCLKB, SCLK);
   buf (DQSW90B, DQSW90);
   buf (RSTB1, RST);

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
Q_b = 0;
last_SCLKB = 0;
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

always @ (QP0 or QN1 or DQSW90B)
begin
   case (DQSW90B)
        1'b0 :  Q_b = QN1;
        1'b1 :  Q_b = QP0;
        default Q_b = DataSame(QP0, QN1);
   endcase
end

endmodule

`endcelldefine
