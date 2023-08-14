// =============================================================================   
//                           COPYRIGHT NOTICE                                      
// Copyright 2013 (c) Lattice Semiconductor Corporation                            
// ALL RIGHTS RESERVED                                                             
// This confidential and proprietary software may be used only as authorised by    
// a licensing agreement from Lattice Semiconductor Corporation.                   
// The entire notice above must be reproduced on all authorized copies and         
// copies may only be made to the extent permitted by a licensing agreement from   
// Lattice Semiconductor Corporation.                                              
//                                                                                 
// Lattice Semiconductor Corporation       TEL  : 1-800-Lattice (USA and Canada)   
// 5555 NE Moore Court                            503-268-8001 (other locations)   
// Hillsboro, OR 97124                     web  : http://www.latticesemi.com/      
// U.S.A                                   email: techsupport@latticesemi.com      
// =============================================================================   
//                         FILE DETAILS                                            
// Project               : Hot Swap Controller                                                
// File                  : hsctl_10ms.v                                              
// Title                 : How Swap algorithm                                     
// Dependencies          :                                                       
//                       :                                                         
// Description           : Hot Swap algorithm for 10ms SOA curve                           
// =============================================================================   
//                        REVISION HISTORY                                         
// Version               : 1.0                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Sep, 2013                
// =============================================================================   

module hsctl_10ms
				# 
				(	
					// global parameters
					parameter HCM_SOA_TYPE = 1'b0,						// 0 = 10ms SOA curve, 1 = DC SOA curve
					parameter HCM_HVIMON = 1'b0,							// 1 = use HVIMON, use 4-bit hvmon trip point values
					parameter HCM_VMON_PHASE = 1,							// vmon phases, range is 1 to 8
					parameter HCM_FAST_SHUTDOWN = 0, 					// 0 = no fast shutdown, 1 = semi fast shutdown, 2 = fast shutdown
					
					parameter	[3:0] HCM_TRESHOLD1 = 4'h1,			// 4-bit trip point value for each phase
					parameter	[3:0] HCM_TRESHOLD2 = 4'h2,    
					parameter	[3:0] HCM_TRESHOLD3 = 4'h3,    
					parameter	[3:0] HCM_TRESHOLD4 = 4'h4,    
					parameter	[3:0] HCM_TRESHOLD5 = 4'h5,    
					parameter	[3:0] HCM_TRESHOLD6 = 4'h6,    
					parameter	[3:0] HCM_TRESHOLD7 = 4'h7,    
					parameter	[3:0] HCM_TRESHOLD8 = 4'h8, 
					
					parameter HCM_LOOP_MAX1 = 1,							// number of loops to repeat the hysteretic control in a phase 
					parameter HCM_LOOP_MAX2 = 1,                                                                         
					parameter HCM_LOOP_MAX3 = 1,                                                                         
					parameter HCM_LOOP_MAX4 = 1,                                                                         
					parameter HCM_LOOP_MAX5 = 1,                                                                         
					parameter HCM_LOOP_MAX6 = 1,                                                                         
					parameter HCM_LOOP_MAX7 = 1,                                                                         
					parameter HCM_LOOP_MAX8 = 1,                                                                         
					parameter HCM_COOLDOWN = 50								// cool down period between repeats within a phase             			
				)   
				( 
					// global signals
					input clk,														// using the same clock as LB 
					input rstn,														// using the same reset as LB
					
					// LB interface signals
					input hs_enable,											// enable the hs to start
					output reg hs_done,										// hot swap is done
					output reg hs_error,									// hot swap has error when exceed timer limit
					
					// usp signals 
					input [8:1] hcm_vphase,  							// voltage phase status signals, up to 8 phases
					input hcm_iphase,											// detect whether the IMON2 threshld is reached. Only used for HVIMON 
										
					output reg [3:0] hvimon_th, 					// 4-bit trip point value for hvimon (or imon2) in ASC
					output reg hcm_enable,								// enable hysteretic control of HCM in ASC
					output reg cmp_select,								// comparator select in the HCM 
					output reg direct_control							// set direct control value for HCM					
					);    				

// local parameters
localparam simul = 0; 
localparam timer1_limit = simul ? 4 : 624;			
localparam timer1_bits = (timer1_limit > 511) ? 10 : (timer1_limit > 255) ? 9 : (timer1_limit > 127) ? 8 : (timer1_limit > 63) ? 7 : (timer1_limit > 31) ? 6 : (timer1_limit > 15) ? 5 : (timer1_limit > 7) ? 4 : (timer1_limit > 3) ? 3: (timer1_limit > 1)? 2  : 1;
localparam timer2_limit = simul ? 5 : (HCM_COOLDOWN); 
localparam timer2_10ms_bits = (timer2_limit > 127) ? 8 : (timer2_limit> 63) ? 7 : (timer2_limit> 31) ? 6 : (timer2_limit > 15) ? 5 : (timer2_limit > 7) ? 4 : (timer2_limit > 3) ? 3: (timer2_limit > 1)? 2  : 1;

// internal signals       
reg timer1_enable, timer2_enable;
reg [timer1_bits-1:0]	timer1;							// this gives 10ms period in the 10ms SOA curve algorithm
reg [timer2_10ms_bits-1:0] timer2;				// timer2 is the cooldown period for 10ms SOA curve algorithm, based on 10ms clock
reg [4:0] state, next_state;     
reg [3:0] loop_cnt;												// max number is 8
																			
					
//-----------------------------------------------------------------------------
// Hotswap control for 10ms SOA curve
//-----------------------------------------------------------------------------		
localparam[4:0]		idle 	 				= 5'd0,  
									phase0				= 5'd1,		
									phase1 				= 5'd2,  
									phase1_cool 	= 5'd3,  
									phase2 				= 5'd4,  
									phase2_cool   = 5'd5,  
									phase3 				= 5'd6,  
									phase3_cool   = 5'd7,  
									phase4 				= 5'd8,  
									phase4_cool   = 5'd9,  
									phase5 				= 5'd10, 
									phase5_cool   = 5'd11, 
									phase6 				= 5'd12, 
									phase6_cool   = 5'd13, 
									phase7 				= 5'd14, 
									phase7_cool   = 5'd15, 
									phase8 				= 5'd16, 
									phase8_cool   = 5'd17, 
									hs_complete 	= 5'd18,	
									hs_disable 		= 5'd19; 			
																																										
	
always @(posedge clk or negedge rstn)          	
	if (~rstn)                               
		state <= idle;                	
	else                                     		
		state <= next_state;           										
									
always @(*)           								
begin               
	case (state)
		idle: 			if (hs_enable)               																// start hotswap phase control only when hs_enable = 1     
									next_state = phase0;                                  		
								else                                                    		
									next_state = idle;                                    		
                                                                        		
		phase0:			if (hs_enable) begin         			                      		// phase0 is necessary for all hotswap process 														
									if (!hcm_iphase && timer1 == timer1_limit)								// current thrshold is monitored
										next_state = hs_disable;
									else if (hcm_iphase)
										next_state = phase1;	
									else
										next_state = phase0; end		
								else 				
									next_state = idle;								
									
		phase1:			if (hs_enable) begin
									if (hcm_vphase[1]) begin																	// 1st trip point is reached
										if (HCM_VMON_PHASE>1)																		// if this is 1-phase hotswap control, then hotswap is done. 
											next_state = phase2;
										else
											next_state = hs_complete; end
									else if ((timer1 == timer1_limit) &&  (!hcm_vphase[1])) 	// 1st trip point is not reached, go to coold down, then try again
										next_state = phase1_cool;    
									else 
										next_state = phase1; end    
								else
									next_state = idle;
							
		phase1_cool:  if (hs_enable) begin
										if (loop_cnt >= HCM_LOOP_MAX1)	  
											next_state = hs_disable;     
										else begin
											if (timer2 == timer2_limit)
												next_state = phase1;		
											else 
												next_state = phase1_cool; end	
										end
									else
										next_state = idle;			

		phase2:			if (hs_enable) begin
									if (hcm_vphase[2]) begin																	// 2nd trip point is reached
										if (HCM_VMON_PHASE>2)														    		// if this is 2-phase hotswap control, then hotswap is done. 
											next_state = phase3;
										else
											next_state = hs_complete; end
									else if ((timer1 == timer1_limit) &&  (!hcm_vphase[2])) 	// 2nd trip point is not reached, go to coold down, then try again
										next_state = phase2_cool;   
									else 
										next_state = phase2; end
								else
									next_state = idle;
							
		phase2_cool:  if (hs_enable) begin
										if (loop_cnt >= HCM_LOOP_MAX2)	  
											next_state = hs_disable;    
										else begin
											if (timer2 == timer2_limit)
												next_state = phase2;	
											else
												next_state = phase2_cool; end
										end
									else 
										next_state = idle;														
	 	
	 	phase3:			if (hs_enable) begin
	 								if (hcm_vphase[3]) begin																	// 3rd trip point is reached
										if (HCM_VMON_PHASE>3)																		// if this is 3-phase hotswap control, then hotswap is done. 
											next_state = phase4;
										else
											next_state = hs_complete; end
									else if ((timer1 == timer1_limit) &&  (!hcm_vphase[3])) 	// 3rd trip point is not reached, go to coold down, then try again
										next_state = phase3_cool;	
									else
										next_state = phase3; end
								else
									next_state = idle;
							
		phase3_cool:  if (hs_enable) begin
										if (loop_cnt >= HCM_LOOP_MAX3)	  
											next_state = hs_disable;     
										else begin
											if (timer2 == timer2_limit)
												next_state = phase3;	
											else
												next_state = phase3_cool; end	   
										end
									else
										next_state = idle;

	 	phase4:			if (hs_enable) begin
	 								if (hcm_vphase[4]) begin																	// 4th trip point is reached
										if (HCM_VMON_PHASE>4)																		// if this is 4-phase hotswap control, then hotswap is done. 
											next_state = phase5;
										else
											next_state = hs_complete; end
									else if ((timer1 == timer1_limit) &&  (!hcm_vphase[4])) 	// 4th trip point is not reached, go to coold down, then try again
										next_state = phase4_cool; 
									else
										next_state = phase4; end   
								else
									next_state = idle;
							
		phase4_cool:  if (hs_enable) begin
										if (loop_cnt >= HCM_LOOP_MAX4)	  
											next_state = hs_disable;     
										else begin
											if (timer2 == timer2_limit)
												next_state = phase4;	
											else
												next_state = phase4_cool; end			
										end	
									else
										next_state = idle;										
				
		phase5:			if (hs_enable) begin
									if (hcm_vphase[5]) begin																	// 5th trip point is reached
										if (HCM_VMON_PHASE>5)																		// if this is 5-phase hotswap control, then hotswap is done. 
											next_state = phase6;
										else
											next_state = hs_complete; end
									else if ((timer1 == timer1_limit) &&  (!hcm_vphase[5])) 	// 5th trip point is not reached, go to coold down, then try again
										next_state = phase5_cool; 
									else
										next_state = phase5; end     
								else
									next_state = idle;
							
		phase5_cool:  if (hs_enable) begin
										if (loop_cnt >= HCM_LOOP_MAX5)	  
											next_state = hs_disable;     
										else begin
											if (timer2 == timer2_limit)
												next_state = phase5;	
											else
												next_state = phase5_cool; end	
										end	     
									else
										next_state = idle;

		phase6:			if (hs_enable) begin
									if (hcm_vphase[6]) begin																	// 6th trip point is reached
										if (HCM_VMON_PHASE>6) 																	// if this is 6-phase hotswap control, then hotswap is done. 
											next_state = phase7;
										else
											next_state = hs_complete; end
									else if ((timer1 == timer1_limit) &&  (!hcm_vphase[6])) 	// 6th trip point is not reached, go to coold down, then try again
										next_state = phase6_cool;	
									else
										next_state = phase6; end   
								else
									next_state = idle;
							
		phase6_cool:  if (hs_enable) begin
										if (loop_cnt >= HCM_LOOP_MAX6)	  
											next_state = hs_disable;     
										else begin
											if (timer2 == timer2_limit)
												next_state = phase6; 
											else
												next_state = phase6_cool; end		
										end
									else
										next_state = idle;										

		phase7:			if (hs_enable) begin
									if (hcm_vphase[7]) begin																	// 7th trip point is reached
										if (HCM_VMON_PHASE>7)																		// if this is 7-phase hotswap control, then hotswap is done. 
											next_state = phase8;
										else
											next_state = hs_complete; end
									else if ((timer1 == timer1_limit) &&  (!hcm_vphase[7])) 	// 7th trip point is not reached, go to coold down, then try again
										next_state = phase7_cool; 
									else
										next_state = phase7; end
								else
									next_state = idle;
							
		phase7_cool:  if (hs_enable) begin
										if (loop_cnt >= HCM_LOOP_MAX7)	  
											next_state = hs_disable;     
										else begin
											if (timer2 == timer2_limit)
												next_state = phase7;	
											else
												next_state = phase7_cool; end	
										end
									else
										next_state = idle;			

		phase8:			if (hs_enable) begin
									if (hcm_vphase[8])																				// 8th trip point is reached
											next_state = hs_complete;
									else if ((timer1 == timer1_limit) &&  (!hcm_vphase[8])) 	// 8th trip point is not reached, go to coold down, then try again
										next_state = phase8_cool; 
									else
										next_state = phase8; end     
								else
									next_state = idle;
							
		phase8_cool:  if (hs_enable) begin
										if (loop_cnt >= HCM_LOOP_MAX8)	  
											next_state = hs_disable;     
										else begin
											if (timer2 == timer2_limit)
												next_state = phase8; 
											else
												next_state = phase8_cool;end	
										end
									else
										next_state = idle;																									
																											
	 	hs_complete: if (!hs_enable)
	 									next_state = idle; 
	 							 else 
	 							 		next_state = hs_complete;
	 	
	 	hs_disable:  if ((timer2 == timer2_limit) || !hs_enable)					
										next_state = idle;
								 else
								 		next_state = hs_disable;  										
								 		   
		default:		 next_state = idle;
	endcase
end
	 	
	 			
always @(posedge clk or negedge rstn)          	
	if (~rstn)  
		begin     
			hcm_enable <= 1'b0;
			timer1_enable <= 1'b0;
			timer2_enable <= 1'b0;
			cmp_select <= 1'b0;
			hvimon_th <= 4'd0;
		 	direct_control <= 1'b0;
		 	hs_done <= 1'b0;
		 	hs_error <= 1'b0;
		end
	else 				
		case (next_state)   		
			idle: 			begin
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;
										cmp_select <= 1'b0;
										hvimon_th <= 4'd0;
		 								timer1_enable <= 1'b0;
										timer2_enable <= 1'b0;
										hs_done <= 1'b0;
										hs_error <= 1'b0; 
		 							end				 
		 							
			phase0:			begin
										timer1_enable  <= 1'b1;					 
										if (HCM_HVIMON) begin							// if use HVIMON, then use direct control mode
											hcm_enable <= 1'b0;
											direct_control <= 1'b1; end
										else begin												// otherwise use close loop hysteretic control 
											hcm_enable <= 1'b1; 
											cmp_select <= 1'b1; end					// select vmon_B or imon_B (as in phase1)
									end							
					 									 							
			phase1: 		begin		
										hcm_enable <= 1'b1;								// enable hcm control module, start hysteretic control
										direct_control <= 1'b0;
			        		  timer1_enable <= 1'b1;						// start timer1  
			        		  timer2_enable <= 1'b0;					      
			        		                 
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b1;							// select vmon_B or imon_B
										else
											hvimon_th <= HCM_TRESHOLD1;			   
									end
			
			phase1_cool: begin															// turn off hysteretic ontrol during cool down
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;
										timer2_enable <= 1'b1;
										timer1_enable <= 1'b1;		
										end
			
			phase2: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										timer2_enable <= 1'b0;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b0;							// select vmon_A or imon_A
										else
											hvimon_th <= HCM_TRESHOLD2;		
											
									end	
									
			phase2_cool: begin
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;
										timer2_enable <= 1'b1;
										timer1_enable <= 1'b1;
										end

			phase3: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										timer2_enable <= 1'b0;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b1;							// select vmon_B or imon_B
										else
											hvimon_th <= HCM_TRESHOLD3;		
									end	
									
			phase3_cool: begin
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;
										timer2_enable <= 1'b1;
										timer1_enable <= 1'b1;
										end		

			phase4: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										timer2_enable <= 1'b0;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b0;							// select vmon_A or imon_A
										else
											hvimon_th <= HCM_TRESHOLD4;		
									end	
									
			phase4_cool: begin
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;
										timer2_enable <= 1'b1;
										timer1_enable <= 1'b1;
										end						

			phase5: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										timer2_enable <= 1'b0;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b1;							// select vmon_B or imon_B
										else
											hvimon_th <= HCM_TRESHOLD5;		
									end	
									
			phase5_cool: begin
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;
										timer2_enable <= 1'b1;
										timer1_enable <= 1'b1;
										end																						

			phase6: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										timer2_enable <= 1'b0;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b0;							// select vmon_A or imon_A
										else
											hvimon_th <= HCM_TRESHOLD6;		
									end	
									
			phase6_cool: begin
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;
										timer2_enable <= 1'b1;
										timer1_enable <= 1'b1;
										end

			phase7: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										timer2_enable <= 1'b0;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b1;							// select vmon_B or imon_B
										else
											hvimon_th <= HCM_TRESHOLD7;		
									end	
									
			phase7_cool: begin
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;
										timer2_enable <= 1'b1;
										timer1_enable <= 1'b1;
										end										

			phase8: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										timer2_enable <= 1'b0;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b0;							// select vmon_A or imon_A
										else
											hvimon_th <= HCM_TRESHOLD8;		
									end	
									
			phase8_cool: begin
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;
										timer2_enable <= 1'b1;
										timer1_enable <= 1'b1;
										end										
			
			hs_complete: begin
										direct_control <= 1'b1; 					// use direct mode to turn MOSFET full on
										hcm_enable <= 1'b0;								
										hs_done <= 1'b1;    							// tell LogiBuilder hotswap is done
										timer1_enable <= 1'b0;
										timer2_enable <= 1'b0;
									 end
			
			hs_disable: begin
										hs_error <= 1'b1;									// inform logibuilder there is an error
										direct_control <= 1'b0;						// turn HVOUT pin off
									 	hcm_enable <= 1'b0;								// turn off hysterestic control 
									 	timer1_enable <= 1'b1;
									 	timer2_enable <= 1'b1;							 	
									end

			default: 		begin
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;								
										cmp_select <= 1'b0;	
										hvimon_th <= 4'd0;
										timer1_enable <= 1'b0;
										timer2_enable <= 1'b0;	 						
							 		end
		endcase

//-----------------------------------------------------------------------------
// Timers
// basic timer (timer1) = 10ms
// variable timer (timer2) = anywhere from 10ms to 2s
//-----------------------------------------------------------------------------
always @(posedge clk or negedge rstn)						// timer1 counter
	if (~rstn)
		timer1 <= 0;
	else begin
		if (~timer1_enable)													// timer1 only runs when timer1_enable is asserted
			timer1 <= 0; 
		else if (state != next_state)		  					// restart the timer1 when statemachine goes into a new state
			timer1 <= 0; 
		else	begin	
			if (timer1 == timer1_limit)								// reset timer1 when it reaches the timer1 limit, which is 625 counts (0 to 624) to give 10ms 
				timer1 <= 0;
			else 
				timer1 <= timer1 + 1; end 
	end

reg t2_clk;
always @(posedge clk or negedge rstn)						
	if (~rstn)
		t2_clk <= 1'b0;
	else begin
		if (timer1 == (timer1_limit-1))
			t2_clk <= 1'b1;
		else 
			t2_clk <= 1'b0; end
				
always @(posedge t2_clk or negedge rstn)				// timer2 counter
	if (~rstn)
		timer2 <= 0;
	else
		if (!timer2_enable)													// timer2 only runs when timer2_enable is asserted
			timer2 <= 0;
		else begin
			if (timer2 == timer2_limit) 							// timer2 limit is the cool down time, in 10ms resolution  
				timer2 <= 0;
			else
				timer2 <= timer2 + 1;	 end	

//-----------------------------------------------------------------------------
// counters to control the repeat of the phase
//-----------------------------------------------------------------------------
always @(posedge clk or negedge rstn)
	if (~rstn)
		loop_cnt <= 4'd0;
	else
			case (next_state)
				idle: 				loop_cnt <= 4'd0; 
				phase0: 			loop_cnt <= 4'd0;
				phase1:				if (state == phase0 || state == idle)
											loop_cnt <= 4'd0;
				phase1_cool: if (state != next_state)    
											loop_cnt <= loop_cnt + 1;	
				phase2: 			if 	(state == phase1)
											loop_cnt <= 4'd0;
				phase2_cool: if (state != next_state)    
											loop_cnt <= loop_cnt + 1;		
				phase3: 			if 	(state == phase2)
											loop_cnt <= 4'd0;
				phase3_cool: if (state != next_state)    
											loop_cnt <= loop_cnt + 1;		
				phase4: 			if 	(state == phase3)
											loop_cnt <= 4'd0;
				phase4_cool: if (state != next_state)    
											loop_cnt <= loop_cnt + 1;
				phase5: 			if 	(state == phase4)
											loop_cnt <= 4'd0;
				phase5_cool: if (state != next_state)    
											loop_cnt <= loop_cnt + 1;
				phase6: 			if 	(state == phase5)
											loop_cnt <= 4'd0;
				phase6_cool: if (state != next_state)    
											loop_cnt <= loop_cnt + 1;
				phase7: 			if 	(state == phase6)
											loop_cnt <= 4'd0;
				phase7_cool: if (state != next_state)    
											loop_cnt <= loop_cnt + 1;
				phase8: 			if 	(state == phase7)
											loop_cnt <= 4'd0;
				phase8_cool: if (state != next_state)    
											loop_cnt <= loop_cnt + 1;
				hs_disable: if (state != next_state)
											loop_cnt <= 4'd0;
										else
												if (timer2 == timer2_limit)
													loop_cnt <= loop_cnt + 1;
				default:		loop_cnt <= 4'd0;
			endcase
												
endmodule