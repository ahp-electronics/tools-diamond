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

module IDDRX2E(D, ECLK, SCLK, RST, ALIGNWD, Q0, Q1, Q2, Q3);

input  D, ECLK, SCLK, RST, ALIGNWD;
output Q0, Q1, Q2, Q3;

   parameter  GSR = "ENABLED";            // "DISABLED", "ENABLED"

wire Db, SCLKB, RSTB1, RSTB2, ALIGNWDB;
reg RSTB;
reg QP0, QP1, QP2, QP3, S4, S5, S6, S7;
reg last_SCLKB, last_ECLKB;
reg DATA4, DATA5, DATA6, DATA7;
reg Q43, Q65, Q_6, Q54;
reg SEL, UPDATE, slip_reg0, slip_regn1, slip_state;
reg SRN;
wire ECLKB;

tri1 GSR_sig = GSR_INST.GSRNET;
tri1 PUR_sig = PUR_INST.PURNET;
 
buf (Db, D);
buf (SCLKB, SCLK);
buf (ECLKB, ECLK);
buf (RSTB1, RST);
buf (ALIGNWDB, ALIGNWD);

buf (Q0, DATA4);
buf (Q1, DATA5);
buf (Q2, DATA6);
buf (Q3, DATA7);

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
QP2 = 0;
QP3 = 0;
Q43 = 0;
Q65 = 0;
Q_6 = 0;
Q54 = 0;
S4 = 0;
S5 = 0;
S6 = 0;
S7 = 0;
DATA4 = 0;
DATA5 = 0;
DATA6 = 0;
DATA7 = 0;
UPDATE = 0;
SEL = 0;
slip_reg0 = 0;
slip_regn1 = 1'b1;
slip_state = 0;
end

initial
begin
last_SCLKB = 1'b0;
last_ECLKB = 1'b0;
end

  always @ (GSR_sig or PUR_sig ) begin
    if (GSR == "ENABLED")
      SRN = GSR_sig & PUR_sig ;
    else if (GSR == "DISABLED")
      SRN = PUR_sig;
  end
                                                                                               
  not (SR, SRN);
  or INST1 (RSTB2, RSTB1, SR);


always @ (SCLKB or ECLKB)
begin
   last_SCLKB <= SCLKB;
   last_ECLKB <= ECLKB;
end

// UPDATE and SEL signal generation
always @ (ECLKB or RSTB2)     // pos edge
begin
   if (RSTB2 == 1'b1)
   begin
      RSTB <= 1'b1;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         RSTB <= 1'b0;
      end
   end
end

always @ (ECLKB or RSTB)     // pos edge
begin
   if (RSTB == 1'b1)
   begin
      slip_reg0 <= 1'b0;
      slip_regn1 <= 1'b1;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         slip_reg0 <= ALIGNWDB;
         slip_regn1 <= ~slip_reg0;
      end
   end
end

and INST2 (slip_rst, slip_reg0, slip_regn1);
assign slip_trig = slip_rst;
nand INST3 (cnt_en, slip_rst, slip_state);

always @ (ECLKB or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      UPDATE <= 1'b0;
      slip_state <= 1'b0;
      SEL <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         if (slip_rst == 1'b0)
         begin
            slip_state <= slip_state;
         end
         else if (slip_rst == 1'b1)
         begin
            slip_state <= ~slip_state;
         end

         if (cnt_en == 1'b0)
         begin
            UPDATE <= UPDATE;
         end
         else if (cnt_en == 1'b1)
         begin
            UPDATE <= ~UPDATE;
         end

         if (slip_trig == 1'b0)
         begin
            SEL <= SEL;
         end
         else if (slip_trig == 1'b1)
         begin
            SEL <= ~SEL;
         end
      end
   end
end

always @ (ECLKB or RSTB2)     // pos edge
begin
   if (RSTB2 == 1'b1)
   begin
      Q43 <= 1'b0;
      Q65 <= 1'b0;
      Q_6 <= 1'b0;
      Q54 <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         Q65 <= Db;
         Q43 <= Q65;
      end
      if (ECLKB === 1'b0 && last_ECLKB === 1'b1)
      begin
         Q_6 <= Db;
         Q54 <= Q_6;
      end
   end
end

always @ (Q43 or Q54 or SEL)
begin
   case (SEL)
        1'b0 :  QP0 = Q43;
        1'b1 :  QP0 = Q54;
        default QP0 = DataSame(Q54, Q43);
   endcase
end

always @ (Q65 or Q_6 or SEL)
begin
   case (SEL)
        1'b0 :  QP1 = Q65;
        1'b1 :  QP1 = Q_6;
        default QP1 = DataSame(Q_6, Q65);
   endcase
end

always @ (Q65 or Q54 or SEL)
begin
   case (SEL)
        1'b0 :  QP2 = Q54;
        1'b1 :  QP2 = Q65;
        default QP2 = DataSame(Q65, Q54);
   endcase
end

always @ (Q43 or Q_6 or SEL)
begin
   case (SEL)
        1'b0 :  QP3 = Q_6;
        1'b1 :  QP3 = Q43;
        default QP3 = DataSame(Q43, Q_6);
   endcase
end

always @ (ECLKB or RSTB2)     // pos edge
begin
   if (RSTB2 == 1'b1)
   begin
      S4 <= 1'b0;
      S6 <= 1'b0;
      S5 <= 1'b0;
      S7 <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         if (UPDATE == 1'b1)
         begin
            S4 <= QP0;
            S6 <= QP1;
            S7 <= QP3;
            S5 <= QP2;
         end
      end
   end
end

always @ (SCLKB or RSTB2)     // pos edge
begin
   if (RSTB2 == 1'b1)
   begin
      DATA4 <= 1'b0;
      DATA6 <= 1'b0;
      DATA7 <= 1'b0;
      DATA5 <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b1 && last_SCLKB === 1'b0)
      begin
         DATA4 <= S4;
         DATA6 <= S6;
         DATA7 <= S7;
         DATA5 <= S5;
      end
   end
end

endmodule

`endcelldefine
