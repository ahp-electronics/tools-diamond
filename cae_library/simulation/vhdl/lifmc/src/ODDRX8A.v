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
// Simulation Library File for ODDRX8A in LIFMD
//
// $Header:
//
`resetall
`timescale 1 ns / 1 ps

`celldefine

module ODDRX8A(D0, D1, D2, D3, D4, D5, D6, D7,D8, D9, D10, D11, D12, D13, D14, D15, RST, ECLK, SCLK, Q);
   input D0, D1, D2, D3, D4, D5, D6, D7,D8, D9, D10, D11, D12, D13, D14, D15, RST, ECLK, SCLK;
   output Q;

  parameter GSR = "ENABLED";

   reg Q_b;
   reg R0_reg, F0_reg;
   reg last_SCLKB, last_ECLKB;
   wire QN_sig, DATA0, DATA1, DATA2, DATA3;
   wire RSTB1, RSTB2, SCLKB, ECLKB;
   reg UPDATE0, ECLKB1, ECLKB2, ECLKB3;
   reg SRN, RSTB;
   wire UPDATE1,UPDATE0_set;
   reg T0, T1, T2, T3, T4, T5, T6, T7,T8, T9, T10, T11, T12, T13, T14, T15;
   reg S0, S1, S2, S3, S4, S5, S6, S7,S8, S9, S10, S11, S12, S13, S14, S15;
   reg R0, R1, R2, R3,R4, R5, R6, R7, F0, F1, F2, F3, F4, F5, F6, F7;
   reg CNT0, CNT1,CNT2,last_CNT1;
   
tri1 GSR_sig, PUR_sig;
`ifndef mixed_hdl
   assign GSR_sig = GSR_INST.GSRNET;
   assign PUR_sig = PUR_INST.PURNET;
`else
   gsr_pur_assign gsr_pur_assign_inst (GSR_sig, PUR_sig);
`endif

   assign QN_sig = Q_b; 

   buf (Q, QN_sig);
   buf (RSTB1, RST);
   buf (SCLKB, SCLK);
   buf (ECLKB, ECLK);
   buf (DATA0, D0);
   buf (DATA1, D1);
   buf (DATA2, D2);
   buf (DATA3, D3);
   buf (DATA4, D4);
   buf (DATA5, D5);
   buf (DATA6, D6);
   buf (DATA7, D7);	
   buf (DATA8, D8);
   buf (DATA9, D9);
   buf (DATA10, D10);
   buf (DATA11, D11);
   buf (DATA12, D12);
   buf (DATA13, D13);
   buf (DATA14, D14);
   buf (DATA15, D15);

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
T8 = 0;
T9 = 0;
T10 = 0;
T11 = 0;
T12 = 0;
T13 = 0;
T14 = 0;
T15 = 0;
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
S14 = 0;
S15 = 0;
R0 = 0;
R2 = 0;
R3 = 0;
R1 = 0;	
R4 = 0;
R5 = 0;
R6 = 0;
R7 = 0;
F0 = 0;
F1 = 0;
F2 = 0;
F3 = 0;	
F4 = 0;
F5 = 0;
F6 = 0;
F7 = 0;
CNT0 = 0;
CNT1 = 0; 
CNT2 = 0;
R0_reg = 0;
F0_reg = 0;
UPDATE0 = 0;
ECLKB1 = 0;
ECLKB2 = 0;
ECLKB3 = 0;
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

always @ (SCLKB, ECLKB)
begin
   last_SCLKB <= SCLKB;
   last_ECLKB <= ECLKB;	
end
always @(CNT1) begin
	last_CNT1<=CNT1;
end
always @ (ECLKB, ECLKB1, ECLKB2)
begin
   ECLKB1 <= ECLKB;
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
always @ (CNT1 or RSTB)
begin
	if (RSTB == 1'b1)
   	 begin
      CNT2 <= 1'b0;
   end	 
   else
	begin
		if (CNT1===1'b1 && last_CNT1===1'b0)
			begin
	            CNT2 <= ~CNT2;
	        end
	end
end

assign UPDATE0_set = (~CNT2 & CNT0 &~CNT1) ;

always @ (ECLKB or RSTB)
begin
   if (RSTB == 1'b1)
   begin
      UPDATE0 <= 1'b0;
   end
   else if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
   begin
      UPDATE0 <= UPDATE0_set;
   end
end

assign UPDATE1 = UPDATE0;

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
	  T8 <= 1'b0;
      T9 <= 1'b0;
      T10 <= 1'b0;
      T11 <= 1'b0;
      T12 <= 1'b0;
      T13 <= 1'b0;
      T14 <= 1'b0;
      T15 <= 1'b0;
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
		 T8 <= DATA8;
         T9 <= DATA9;
         T10 <= DATA10;
         T11 <= DATA11;
         T12 <= DATA12;
         T13 <= DATA13;
         T14 <= DATA14;
         T15 <= DATA15;
      end
   end
end

always @ (ECLKB or RSTB2)
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
      S14 <= 1'b0;
      S15 <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         if (UPDATE0 == 1'b1)
         begin
            S0 <= T0;
            S2 <= T2;
            S3 <= T3;
            S1 <= T1;  
			S4 <= T4;
            S5 <= T5;
            S6 <= T6;
            S7 <= T7; 
		    S9 <= T9;
            S10 <= T10;
            S11 <= T11;
            S12 <= T12;  
			S13 <= T13;
            S14 <= T14;
            S15 <= T15;
            S8 <= T8;
         end
         else if (UPDATE0 == 1'b0)
         begin
            S0 <= S0;
            S2 <= S2;
            S3 <= S3;
            S1 <= S1;  
			S4 <= S4;
            S5 <= S5;
            S6 <= S6;
            S7 <= S7; 
		    S9 <= S9;
            S10 <= S10;
            S11 <= S11;
            S12 <= S12;  
			S13 <= S13;
            S14 <= S14;
            S15 <= S15;
            S8 <= S8;
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
	  R4 <= 1'b0;
      R5 <= 1'b0;
      R6 <= 1'b0;
      R7 <= 1'b0;
      F4 <= 1'b0;
      F5 <= 1'b0;
      F6 <= 1'b0;
      F7 <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         if (UPDATE1 == 1'b1)
         begin
            R0 <= S0;
            R1 <= S2;
            R2 <= S4;
            R3 <= S6; 
			R4 <= S8;
            R5 <= S10;
            R6 <= S12;
            R7 <= S14;
            F0 <= S1;
            F1 <= S3;
            F2 <= S5;
            F3 <= S7;
			F4 <= S9;
            F5 <= S11;
            F6 <= S13;
            F7 <= S15;
         end
         else if (UPDATE1 == 1'b0)
         begin
            R0 <= R1;
            R1 <= R2;
            R2 <= R3;  
			R3 <= R4;
            R4 <= R5;
            R5 <= R6;
            R6 <= R7;
			R7 <= R7;
            F0 <= F1;
            F1 <= F2;
            F2 <= F3;
            F3 <= F4;
			F4 <= F5;
            F5 <= F6;
            F6 <= F7;
            F7 <= F7;
         end
      end
   end
end

always @ (ECLKB or RSTB2)
begin
   if (RSTB2 == 1'b1)
   begin
      R0_reg <= 1'b0;
      F0_reg <= 1'b0;
   end
   else
   begin
      if (ECLKB === 1'b1 && last_ECLKB === 1'b0)
      begin
         F0_reg <= F0;
      end

      if (ECLKB === 1'b0 && last_ECLKB === 1'b1)    // neg
      begin
         R0_reg <= R0;
      end
   end
end


always @ (R0_reg or F0_reg or ECLKB1)
begin
   case (ECLKB1)
        1'b0 :  Q_b = F0_reg;
        1'b1 :  Q_b = R0_reg;
        default Q_b = DataSame(R0_reg, F0_reg);
   endcase
end

endmodule

`endcelldefine
