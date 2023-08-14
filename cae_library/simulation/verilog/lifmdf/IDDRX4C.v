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
// Simulation Library File for IDDRX4C in LIFMD
//
// $Header: 
//

`resetall
`timescale 1 ns / 1 ps

`celldefine

module IDDRX4C(D, ECLK, SCLK, RST, ALIGNWD, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7);

input  D, ECLK, SCLK, RST, ALIGNWD;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;

   parameter  GSR = "ENABLED";            // "DISABLED", "ENABLED"

wire Db, SCLKB, RSTB1, RSTB2, ALIGNWDB;
reg RSTB, QP, QN;
reg M0, M2, M1, M3, M4, M5, M6, M7,S0, S1, S2, S3,S4, S5, S6, S7;
reg last_SCLKB, last_ECLKB;
reg DATA7, DATA6, DATA5, DATA4,DATA0, DATA3, DATA2, DATA1;
reg R0, R2, R3, R1,R4, R5, R6, R7;
reg CNT0,CNT1, SEL, UPDATE, slip_reg0, slip_regn1, slip_state;
reg SRN, slip_async;
wire ECLKB, UPDATE_set;

//tri1 GSR_sig = GSR_INST.GSRNET;
//tri1 PUR_sig = PUR_INST.PURNET;

tri1 GSR_sig, PUR_sig;
`ifndef mixed_hdl
   assign GSR_sig = GSR_INST.GSRNET;
   assign PUR_sig = PUR_INST.PURNET;
`else
   gsr_pur_assign gsr_pur_assign_inst (GSR_sig, PUR_sig);
`endif
 
buf (Db, D);
buf (SCLKB, SCLK);
buf (ECLKB, ECLK);
buf (RSTB1, RST);
buf (ALIGNWDB, ALIGNWD);

buf (Q0, DATA0);
buf (Q1, DATA1);
buf (Q2, DATA2);
buf (Q3, DATA3);
buf (Q4, DATA4);
buf (Q5, DATA5);
buf (Q6, DATA6);
buf (Q7, DATA7);
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
QP = 0;
QN = 0;
M0 = 0;
M2 = 0;
M1 = 0;
M3 = 0;	
M4 = 0;
M5 = 0;
M6 = 0;
M7 = 0;
R0 = 0;
R2 = 0;
R3 = 0;
R1 = 0;	
R4 = 0;
R5 = 0;
R6 = 0;
R7 = 0;
S0 = 0;
S2 = 0;
S3 = 0;
S1 = 0;
S4 = 0;
S5 = 0;
S6 = 0;
S7 = 0;
DATA0 = 0;
DATA2 = 0;
DATA3 = 0;
DATA1 = 0;
DATA4 = 0;
DATA5 = 0;
DATA6 = 0;
DATA7 = 0;
UPDATE = 0;
SEL = 0;
CNT0 = 0;
CNT1 = 0;
slip_reg0 = 0;
slip_regn1 = 1'b1;
slip_state = 0;
slip_async = 0;
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
      slip_async <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         slip_async <= ALIGNWDB;
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
         slip_reg0 <= slip_async;
         slip_regn1 <= ~slip_reg0;
      end
   end
end

and INST2 (slip_rst, slip_reg0, slip_regn1);
assign slip_trig = slip_rst;
nand INST3 (cnt_en, slip_rst, slip_state);
//assign UPDATE_set = CNT0;  // latest fix in schematic (08/29)
assign UPDATE_set = (~CNT1 & CNT0) ;
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

always @ (ECLKB or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      CNT0 <= 1'b0;
      CNT1 <= 1'b0;
	  slip_state <= 1'b0;
      SEL <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         if (slip_trig == 1'b0)
         begin
            slip_state <= slip_state;
         end
         else if (slip_trig == 1'b1)
         begin
            slip_state <= ~slip_state;
         end

         if (cnt_en == 1'b0)
         begin
            CNT0 <= CNT0;
         end
         else if (cnt_en == 1'b1)
         begin
            CNT0 <= ~CNT0;
         end   
		 
		  if (cnt_en == 1'b0)
         begin
            CNT1 <= CNT1;
         end
         else if (cnt_en == 1'b1)
         begin
            CNT1 <= (CNT0 ^ CNT1);
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

always @ (ECLKB or RSTB2)     //  edge
begin
   if (RSTB2 == 1'b1)
   begin
      QP <= 1'b0;
      QN <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         QP <= Db;
      end
      if (ECLKB === 1'b0 && last_ECLKB === 1'b1)
      begin
         QN <= Db;
      end
   end
end

always @ (ECLKB or RSTB2)     // pos edge
begin
   if (RSTB2 == 1'b1)
   begin
      R0 <= 1'b0;
      R2 <= 1'b0;
      R3 <= 1'b0;
      R1 <= 1'b0;	
	  R4 <= 1'b0;
      R5 <= 1'b0;
      R6 <= 1'b0;
      R7 <= 1'b0;
	  
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         R6 <= QP;
         R4 <= R6;	 
		 R2 <= R4;	
		 R0 <= R2;
         R7 <= QN;
         R5 <= R7;
		 R3 <= R5;
		 R1 <= R3;
      end
   end
end

always @ (R0 or R1 or SEL)
begin
   case (SEL)
        1'b0 :  M0 = R0;
        1'b1 :  M0 = R1;
        default M0 = DataSame(R1, R0);
   endcase
end


always @ (R2 or R1 or SEL)
begin
   case (SEL)
        1'b0 :  M1 = R1;
        1'b1 :  M1 = R2;
        default M1 = DataSame(R2, R1);
   endcase
end

always @ (R2 or R3 or SEL)
begin
   case (SEL)
        1'b0 :  M2 = R2;
        1'b1 :  M2 = R3;
        default M2 = DataSame(R3, R2);
   endcase
end


always @ (R4 or R3 or SEL)
begin
   case (SEL)
        1'b0 :  M3 = R3;
        1'b1 :  M3 = R4;
        default M3 = DataSame(R4, R3);
   endcase
end

always @ (R5 or R4 or SEL)
begin
   case (SEL)
        1'b0 :  M4 = R4;
        1'b1 :  M4 = R5;
        default M4 = DataSame(R4, R5);
   endcase
end

always @ (R6 or R5 or SEL)
begin
   case (SEL)
        1'b0 :  M5 = R5;
        1'b1 :  M5 = R6;
        default M5 = DataSame(R5, R6);
   endcase
end

always @ (R7 or R6 or SEL)
begin
   case (SEL)
        1'b0 :  M6 = R6;
        1'b1 :  M6 = R7;
        default M6 = DataSame(R6, R7);
   endcase
end

always @ (QP or R7 or SEL)
begin
   case (SEL)
        1'b0 :  M7 = R7;
        1'b1 :  M7 = QP;
        default M7 = DataSame(QP, R7);
   endcase
end

always @ (ECLKB or RSTB2)     // pos edge
begin
   if (RSTB2 == 1'b1)
   begin
      S0 <= 1'b0;
      S2 <= 1'b0;
      S3 <= 1'b0;
      S1 <= 1'b0;	
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
            S0 <= M0;
            S2 <= M2;
            S3 <= M3;
            S1 <= M1;  
			S4 <= M4;
            S5 <= M5;
            S6 <= M6;
            S7 <= M7;
         end
      end
   end
end

always @ (SCLKB or RSTB2)     // pos edge
begin
   if (RSTB2 == 1'b1)
   begin
      DATA0 <= 1'b0;
      DATA2 <= 1'b0;
      DATA3 <= 1'b0;
      DATA1 <= 1'b0;  
      DATA4 <= 1'b0;
      DATA5 <= 1'b0;
      DATA6 <= 1'b0;
      DATA7 <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b1 && last_SCLKB === 1'b0)
      begin
         DATA0 <= S0;
         DATA2 <= S2;
         DATA3 <= S3;
         DATA1 <= S1;	
		 DATA4 <= S4;
         DATA5 <= S5;
         DATA6 <= S6;
         DATA7 <= S7;
      end
   end
end

endmodule

`endcelldefine
