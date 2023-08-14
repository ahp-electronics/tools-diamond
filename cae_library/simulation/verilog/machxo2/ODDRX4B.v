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

module ODDRX4B(D0, D1, D2, D3, D4, D5, D6, D7, RST, ECLK, SCLK, Q);
   input D0, D1, D2, D3, D4, D5, D6, D7, RST, ECLK, SCLK;
   output Q;

  parameter GSR = "ENABLED";
   reg Q_b;
   reg T0, T1, T2, T3, T4, T5, T6, T7;
   reg S0, S1, S2, S3, S4, S5, S6, S7;
   reg R0, R1, R2, R3, F0, F1, F2, F3, F4;
   reg last_SCLKB, last_ECLKB;
   wire QN_sig, DATA0, DATA1, DATA2, DATA3;
   wire RSTB1, RSTB2, SCLKB, ECLKB;
   reg UPDATE;
   wire UPDATE_set;
   reg CNT0, CNT1, ECLKB1, ECLKB2;
   reg SRN, RSTB;

  tri1 GSR_sig = GSR_INST.GSRNET;
  tri1 PUR_sig = PUR_INST.PURNET;

   assign QN_sig = Q_b; 

   buf (Q, QN_sig);
   buf (DATA0, D0);
   buf (DATA1, D1);
   buf (DATA2, D2);
   buf (DATA3, D3);
   buf (DATA4, D4);
   buf (DATA5, D5);
   buf (DATA6, D6);
   buf (DATA7, D7);
   buf (RSTB1, RST);
   buf (SCLKB, SCLK);
   buf (ECLKB, ECLK);

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
T0 = 0;
T1 = 0;
T2 = 0;
T3 = 0;
T4 = 0;
T5 = 0;
T6 = 0;
T7 = 0;
S0 = 0;
S1 = 0;
S2 = 0;
S3 = 0;
S4 = 0;
S5 = 0;
S6 = 0;
S7 = 0;
R0 = 0;
R1 = 0;
R2 = 0;
R3 = 0;
F0 = 0;
F1 = 0;
F2 = 0;
F3 = 0;
F4 = 0;
CNT0 = 0;
CNT1 = 0;
ECLKB1 = 0;
ECLKB2 = 0;
//UPDATE1 = 0;
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

always @ (SCLKB, ECLKB)
begin
   last_SCLKB <= SCLKB;
   last_ECLKB <= ECLKB;
end

always @ (ECLKB, ECLKB1)
begin
   ECLKB1 <= ECLKB;
   ECLKB2 <= ECLKB1;
end

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

always @ (ECLKB or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      CNT0 <= 1'b0;
      CNT1 <= 1'b0;
   end
   else if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
   begin
      CNT0 <= ~CNT0;
      CNT1 <= (CNT0 ^ CNT1);
   end
end

assign UPDATE_set = (~CNT1 & CNT0);

always @ (ECLKB or RSTB)     // pos edge
begin
   if (RSTB == 1'b1)
   begin
      UPDATE <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         if (UPDATE_set == 1'b1)
         begin
            UPDATE <= 1'b1;
         end
         else if (UPDATE_set == 1'b0)
         begin
            UPDATE <= 1'b0;
         end
      end
   end
end

always @ (SCLKB or RSTB2)
begin
   if (RSTB2 == 1'b1)
   begin
      T0 <= 1'b0;
      T1 <= 1'b0;
      T2 <= 1'b0;
      T3 <= 1'b0;
      T4 <= 1'b0;
      T5 <= 1'b0;
      T6 <= 1'b0;
      T7 <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b1 && last_SCLKB === 1'b0)
      begin
         T0 <= DATA0;
         T1 <= DATA1;
         T2 <= DATA2;
         T3 <= DATA3;
         T4 <= DATA4;
         T5 <= DATA5;
         T6 <= DATA6;
         T7 <= DATA7;
      end
   end
end

always @ (ECLKB or RSTB2)
begin
   if (RSTB2 == 1'b1)
   begin
      S0 <= 1'b0;
      S1 <= 1'b0;
      S2 <= 1'b0;
      S3 <= 1'b0;
      S4 <= 1'b0;
      S5 <= 1'b0;
      S6 <= 1'b0;
      S7 <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         if (UPDATE == 1'b1)
         begin
            S0 <= T0;
            S1 <= T1;
            S2 <= T2;
            S3 <= T3;
            S4 <= T4;
            S5 <= T5;
            S6 <= T6;
            S7 <= T7;
         end
         else if (UPDATE == 1'b0)
         begin
            S0 <= S0;
            S1 <= S1;
            S2 <= S2;
            S3 <= S3;
            S4 <= S4;
            S5 <= S5;
            S6 <= S6;
            S7 <= S7;
         end
      end
   end
end

always @ (ECLKB or RSTB2)
begin
   if (RSTB2 == 1'b1)
   begin
      R0 <= 1'b0;
      R1 <= 1'b0;
      R2 <= 1'b0;
      R3 <= 1'b0;
      F0 <= 1'b0;
      F1 <= 1'b0;
      F2 <= 1'b0;
      F3 <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         if (UPDATE == 1'b1)
         begin
            R0 <= S0;
            R1 <= S2;
            R2 <= S4;
            R3 <= S6;
            F0 <= S1;
            F1 <= S3;
            F2 <= S5;
            F3 <= S7;
         end
         else if (UPDATE == 1'b0)
         begin
            R0 <= R1;
            R1 <= R2;
            R2 <= R3;
//            R3 <= R3;
            R3 <= 1'b0;
            F0 <= F1;
            F1 <= F2;
            F2 <= F3;
//            F3 <= F3;
            F3 <= 1'b0;
         end
      end
   end
end

always @ (ECLKB or RSTB2)
begin
   if (RSTB2 == 1'b1)
   begin
      F4 <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b0 && last_ECLKB === 1'b1)
      begin
         F4 <= F0;
      end
   end
end

always @ (R0 or F4 or ECLKB2)
begin
   case (ECLKB2)
        1'b0 :  Q_b = F4;
        1'b1 :  Q_b = R0;
        default Q_b = DataSame(R0, F4);
   endcase
end

endmodule

`endcelldefine
