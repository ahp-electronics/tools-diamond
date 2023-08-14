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
// Project: LIFMD
// Simulation Library File for MIPI in in LIFMD
// 01-APR-2015	 
// Revision History:
//	1. created the mipi for snow
// $Header:--
//
`resetall
`timescale 1 ns / 1 ps

`celldefine
module MIPI (AP,AN,TP,TN,HSSEL,BP,BN,OLSP,OLSN,OHS);
	input AP,AN,TP,TN,HSSEL;
	output OLSP,OLSN,OHS;
	inout BN,BP;	  
	wire BP,BN;			
	reg OHS;   
	reg  OLSP,OLSN;
	supply1 TSALL;
	
	buf INST1 (AP_buf,AP);
	buf INST2 (AN_buf,AN);
	buf INST3 (TP_buf,TP);
	buf INST4 (TN_buf,TN);
	buf INST5 (HSSEL_buf,HSSEL);  
	buf INST6 (BP_buf,BP);
	buf INST7 (BN_buf,BN);	

	not INSTP1 (TPN,TP_buf);
	not INSTN1 (TNN,TN_buf); 
	
	and INSTP2 (ENP,TPN,TSALL);
	and INSTN2 (ENN,TNN,TSALL);
	
	bufif1 INSTP4 (BP,AP_buf,ENP);
	bufif1 INSTN4 (BN,AN_buf,ENN);	

	always @(*)
		begin
			OLSP = (HSSEL && !(BP_buf && BN_buf))? 1'b0:BP_buf;
			OLSN = (HSSEL && !(BP_buf && BN_buf))? 1'b0:BN_buf;
		end	  
		
	always @(*)
		begin  
			if(HSSEL == 1'b1)
				begin
					if(BP_buf == 1'b1 && BN_buf == 1'b0) 
						begin
							OHS <= BP_buf;
						end
					else if(BP_buf == 1'b0 && BN_buf == 1'b1)
						begin
							OHS <= BP_buf;
					   	end
					else if(BP_buf == 1'bZ && BP_buf == 1'bX || BN_buf == 1'bZ && BN_buf == 1'bX) 
							OHS <= 1'bX;
			 	end
			else 
				  OHS <= 1'b0;	 
		end
			

endmodule
`endcelldefine

