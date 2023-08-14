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
// Simulation Library File for IDDR141A in LIFMD
//
// $Header: 
//

`resetall
`timescale 1 ns / 1 ps

`celldefine

module IDDR141A(D, ECLK, SCLK, RST, ALIGNWD, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13);

input  D, ECLK, SCLK, RST, ALIGNWD;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13;

   parameter  GSR = "ENABLED";            // "DISABLED", "ENABLED"

wire Db, SCLKB, RSTB1, RSTB2, ALIGNWDB;
reg RSTB, QP, QN;
reg M0, M2, M1, M3, M4, M5, M6, M7,M8, M9, M10, M11, M12, M13;
reg S0, S2, S1, S3, S4, S5, S6, S7,S8, S9, S10, S11, S12, S13;
reg last_SCLKB, last_ECLKB;
reg DATA0, DATA2, DATA1, DATA3, DATA4, DATA5, DATA6, DATA7,DATA8, DATA9, DATA10, DATA11, DATA12, DATA13;
reg R0, R2, R1, R3, R4, R5, R6, R7,R8, R9, R10, R11, R12, R13;
reg last_CNT1,SEL, UPDATE, slip_reg0, slip_regn1, slip_state;
reg CNT0,CNT1,CNT2,CNT3,CNT4,CNT5,CNT6;	   
wire CNT0_set;
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
buf (Q8, DATA8);
buf (Q9, DATA9);
buf (Q10, DATA10);
buf (Q11, DATA11);
buf (Q12, DATA12);
buf (Q13, DATA13);

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
M8 = 0;
M9 = 0;
M10 = 0;
M11 = 0;	
M12 = 0;
M13 = 0;
R0 = 0;
R2 = 0;
R3 = 0;
R1 = 0;	
R4 = 0;
R5 = 0;
R6 = 0;
R7 = 0;
R8 = 0;
R9 = 0;
R10 = 0;
R11 = 0;	
R12 = 0;
R13 = 0;
S0 = 0;
S2 = 0;
S3 = 0;
S1 = 0;
S4 = 0;
S5 = 0;
S6 = 0;
S7 = 0;	
S8 = 0;
S9 = 0;
S10 = 0;
S11 = 0;	
S12 = 0;
S13 = 0;
DATA0 = 0;
DATA2 = 0;
DATA3 = 0;
DATA1 = 0;
DATA4 = 0;
DATA5 = 0;
DATA6 = 0;
DATA7 = 0; 
DATA8 = 0;
DATA9 = 0;
DATA10 = 0;
DATA11 = 0;	
DATA12 = 0;
DATA13 = 0;
UPDATE = 0;
SEL = 0;
CNT0 = 0;
CNT1 = 0;	
CNT2 = 0;
CNT3 = 0;
CNT4 = 0;	
CNT5 = 0;
CNT6 = 0;
last_CNT1=0;
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

always @(CNT1) begin
	last_CNT1<=CNT1;
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
assign UPDATE_set = CNT5 ;
assign CNT0_set	  = (~CNT0&~CNT1& ~CNT2 &~CNT3&~CNT4 & ~CNT5) ;
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
            CNT1 <= CNT1; 
			CNT2 <= CNT2;
			CNT3 <= CNT3;
			CNT4 <= CNT4;
			CNT5 <= CNT5;
			
         end
         else if (cnt_en == 1'b1)
         begin		 
			CNT0 <= CNT0_set;
            CNT1 <= CNT0;  
			CNT2 <= CNT1;
			CNT3 <= CNT2;
			CNT4 <= CNT3;
			CNT5 <= CNT4;
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
	  R8 <= 1'b0;
      R9 <= 1'b0;
      R10 <= 1'b0;
      R11 <= 1'b0;	
	  R12 <= 1'b0;
      R13 <= 1'b0;
	  
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         R12 <= QP; 
		 R10 <= R12;	
		 R8 <= R10;	
		 R6 <= R8;
         R4 <= R6;	 
		 R2 <= R4;	
		 R0 <= R2;
         R13 <= QN;
		 R11 <= R13;
		 R9 <= R11;
		 R7 <= R9;
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

always @ (R8 or R7 or SEL)
begin
   case (SEL)
        1'b0 :  M7 = R7;
        1'b1 :  M7 = R8;
        default M7 = DataSame(R8, R7);
   endcase
end

always @ (R8 or R9 or SEL)
begin
   case (SEL)
        1'b0 :  M8 = R8;
        1'b1 :  M8 = R9;
        default M8 = DataSame(R8, R9);
   endcase
end


always @ (R9 or R10 or SEL)
begin
   case (SEL)
        1'b0 :  M9 = R9;
        1'b1 :  M9 = R10;
        default M9 = DataSame(R9, R10);
   endcase
end

always @ (R10 or R11 or SEL)
begin
   case (SEL)
        1'b0 :  M10 = R10;
        1'b1 :  M10 = R11;
        default M10 = DataSame(R10, R11);
   endcase
end


always @ (R11 or R12 or SEL)
begin
   case (SEL)
        1'b0 :  M11 = R11;
        1'b1 :  M11 = R12;
        default M11 = DataSame(R11, R12);
   endcase
end

always @ (R12 or R13 or SEL)
begin
   case (SEL)
        1'b0 :  M12 = R12;
        1'b1 :  M12 = R13;
        default M12 = DataSame(R12, R13);
   endcase
end

always @ (QP or R13 or SEL)
begin
   case (SEL)
        1'b0 :  M13 = R13;
        1'b1 :  M13 = QP;
        default M13 = DataSame(QP, R13);
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
 	  S8 <= 1'b0;
      S9 <= 1'b0;
      S10 <= 1'b0;
      S11 <= 1'b0;	
	  S12 <= 1'b0;
      S13 <= 1'b0;
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
		    S9 <= M9;
            S10 <= M10;
            S11 <= M11;
            S12 <= M12;  
			S13 <= M13;
            S8 <= M8;
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
 	  DATA8 <= 1'b0;
      DATA9 <= 1'b0;
      DATA10 <= 1'b0;
      DATA11 <= 1'b0;	
	  DATA12 <= 1'b0;
      DATA13 <= 1'b0;
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
		 DATA8 <= S8;
	     DATA9 <= S9;
	     DATA10 <= S10;
	     DATA11 <= S11;	
		 DATA12 <= S12;
	     DATA13 <= S13;
      end
   end
end

endmodule

`endcelldefine
