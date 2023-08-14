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
// File                  : hsctl_dc.v                                              
// Title                 : How Swap algorithm                                     
// Dependencies          :                                                       
//                       :                                                         
// Description           : Hot Swap algorithm for DC SOA curve                           
// =============================================================================   
//                        REVISION HISTORY                                         
// Version               : 1.0                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Sep, 2013                
// =============================================================================   

module hsctl_dc
				# 
				(	
					// global parameters
					parameter HCM_SOA_TYPE = 0,						// 0 = 10ms SOA curve, 1 = DC SOA curve
					parameter HCM_HVIMON = 1,							// 1 = use HVIMON, use 4-bit hvmon trip point values
					parameter HCM_VMON_PHASE = 1,					// vmon phases, range is 1 to 8
					parameter HCM_FAST_SHUTDOWN = 0, 			// 0 = no fast shutdown, 1 = semi fast shutdown, 2 = fast shutdown
					
					parameter HCM_TRESHOLD1 = 4'h1,				// 4-bit trip point value for each phase
					parameter HCM_TRESHOLD2 = 4'h2,    
					parameter HCM_TRESHOLD3 = 4'h3,    
					parameter HCM_TRESHOLD4 = 4'h4,    
					parameter HCM_TRESHOLD5 = 4'h5,    
					parameter HCM_TRESHOLD6 = 4'h6,    
					parameter HCM_TRESHOLD7 = 4'h7,    
					parameter HCM_TRESHOLD8 = 4'h8,       
					
					parameter HCM_COOLDOWN = 50,					// cool down period 
					
					parameter HCM_DC_TIMEOUT1 = 50,				// timer length for each phase for DC SOA curve 
					parameter HCM_DC_TIMEOUT2 = 50,
					parameter HCM_DC_TIMEOUT3 = 50,
					parameter HCM_DC_TIMEOUT4 = 50,
					parameter HCM_DC_TIMEOUT5 = 50,
					parameter HCM_DC_TIMEOUT6 = 50,
					parameter HCM_DC_TIMEOUT7 = 50,
					parameter HCM_DC_TIMEOUT8 = 50     			
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
localparam slowclk_limit = simul ? 4: 624;		
// local parameters for simulation purpose    
localparam timeout0 = 1; 
localparam timeout1 = simul ? 1 : HCM_DC_TIMEOUT1;     
localparam timeout2 = simul ? 2 : HCM_DC_TIMEOUT2;
localparam timeout3 = simul ? 10 : HCM_DC_TIMEOUT3;
localparam timeout4 = simul ? 7 : HCM_DC_TIMEOUT4;
localparam timeout5 = simul ? 2 : HCM_DC_TIMEOUT5;
localparam timeout6 = simul ? 8 : HCM_DC_TIMEOUT6;
localparam timeout7 = simul ? 5 : HCM_DC_TIMEOUT7;
localparam timeout8 = simul ? 9 : HCM_DC_TIMEOUT8;  
localparam cooldown = simul ? 8 : (HCM_COOLDOWN);        

// to save lut resources
localparam statebits = ( HCM_VMON_PHASE == 8) ? 10 : ( HCM_VMON_PHASE == 7) ? 9 : ( HCM_VMON_PHASE == 6) ? 8 : ( HCM_VMON_PHASE == 5) ? 7 : ( HCM_VMON_PHASE == 4) ? 6 : ( HCM_VMON_PHASE == 3) ? 5 : ( HCM_VMON_PHASE == 2) ? 4 : ( HCM_VMON_PHASE == 1) ? 3 : 3;       
					
// internal signals   
reg [9:0] slowclk;    													// 10ms clock
reg timer1_enable;
reg [7:0]	timer1;																// using the 10ms clock, resolution in nx10ms range, n = 1 to 200
reg [7:0] timer1_limit;		                      // this is to hold the DC time out limit for each phase
reg [statebits:0] state, next_state;
																			

//-----------------------------------------------------------------------------
// Hotswap control for DC SOA curve
//-----------------------------------------------------------------------------
localparam[statebits:0]	idle 	 				= 0, 
												hs_complete 	= 1,					 
												hs_disable 		= 2,
												phase0				= 4, 
												phase1 				= 8, 
												phase2 				= 16, 
												phase3 				= 32, 
												phase4 				= 64, 
												phase5 				= 128,  
												phase6 				= 256, 
												phase7 				= 512, 
												phase8 				= 1024;				
												
							
always @(posedge clk or negedge rstn)          	
	if (~rstn)                               
		state <= idle;                	
	else                                     		
		state <= next_state;           										
									
always @(*)           								
begin        
	case (state)
		idle: 			if (hs_enable)           								  								// start hotswap phase control only when hs_enable = 1
									next_state = phase0;
								else
									next_state = idle;

		phase0:			if (hs_enable) begin 																			// phase0 is necessary for all hotswap processes  																
									if (!hcm_iphase && (timer1 == timeout0))								// current threshold is monitored   					
										next_state = hs_disable;
									else if (hcm_iphase)
										next_state = phase1;				
									else 
										next_state = phase0; end
								else 				
									next_state = idle;								
									
		phase1:			if (hs_enable) begin
									if (hcm_vphase[1]) begin																// 1st trip point is reached
										if (HCM_VMON_PHASE>1)																	// if this is 1-phase hotswap control, then hotswap is done. 
											next_state = phase2;             
										else
											next_state = hs_complete; end
									else if ((timer1 == timeout1) &&  (!hcm_vphase[1])) 		// 1st trip point is not reached, disable the hotswap process
										next_state = hs_disable;    
									else 
										next_state = phase1; end 
								else 
									next_state = idle; 

		phase2:			if (hs_enable) begin
									if (hcm_vphase[2]) begin																// 2nd trip point is reached
										if (HCM_VMON_PHASE>2)																	// if this is 2-phase hotswap control, then hotswap is done. 
											next_state = phase3;
										else
											next_state = hs_complete; end
									else if ((timer1 == timeout2) &&  (!hcm_vphase[2])) 		// 2nd trip point is not reached, disable the hotswap process
										next_state = hs_disable;   
									else 
										next_state = phase2; end
								else
									next_state = idle;								
	 	
	 	phase3:			if (hs_enable) begin
	 								if (hcm_vphase[3])																			// 3rd trip point is reached
										if (HCM_VMON_PHASE>3)																	// if this is 3-phase hotswap control, then hotswap is done. 
											next_state = phase4;
										else
											next_state = hs_complete;
									else if ((timer1 == timeout3) &&  (!hcm_vphase[3])) 		// 3rd trip point is not reached, disable the hotswap process
										next_state = hs_disable;	
									else                   
										next_state = phase3;  end
								else
									next_state = idle;

	 	phase4:			if (hs_enable) begin
	 								if (hcm_vphase[4]) begin																// 4th trip point is reached
										if (HCM_VMON_PHASE>4)																	// if this is 4-phase hotswap control, then hotswap is done. 
											next_state = phase5;
										else
											next_state = hs_complete; end
									else if ((timer1 == timeout4) &&  (!hcm_vphase[4])) 		// 4th trip point is not reached, disable the hotswap process
										next_state = hs_disable; 
									else                   
										next_state = phase4;     end   
								else
									next_state = idle;
							
		phase5:			if (hs_enable) begin
									if (hcm_vphase[5]) begin																// 5th trip point is reached
										if (HCM_VMON_PHASE>5)																	// if this is 5-phase hotswap control, then hotswap is done. 
											next_state = phase6;
										else
											next_state = hs_complete; end
									else if ((timer1 == timeout5) &&  (!hcm_vphase[5])) 		// 5th trip point is not reached, disable the hotswap process
										next_state = hs_disable; 
									else                   
										next_state = phase5; end     
								else
									next_state = idle;

		phase6:			if (hs_enable) begin
									if (hcm_vphase[6]) begin																// 6th trip point is reached
										if (HCM_VMON_PHASE>6)																	// if this is 6-phase hotswap control, then hotswap is done. 
											next_state = phase7;
										else
											next_state = hs_complete; end
									else if ((timer1 == timeout6) &&  (!hcm_vphase[6])) 		// 6th trip point is not reached, disable the hotswap process
										next_state = hs_disable;	
									else                   
										next_state = phase6; end   
								else
									next_state = idle;
							
		phase7:			if (hs_enable) begin
									if (hcm_vphase[7]) begin																// 7th trip point is reached
										if (HCM_VMON_PHASE>7)																	// if this is 7-phase hotswap control, then hotswap is done. 
											next_state = phase8;
										else
											next_state = hs_complete; end
									else if ((timer1 == timeout7) &&  (!hcm_vphase[7])) 		// 7th trip point is not reached, disable the hotswap process
										next_state = hs_disable; 
									else
										next_state = phase7;   end
								else
									next_state = idle;

		phase8:			if (hs_enable) begin
									if (hcm_vphase[8])																		// 8th trip point is reached, hotswap is done
											next_state = hs_complete;
									else if ((timer1 == timeout8) &&  (!hcm_vphase[8])) 	// 8th trip point is not reached, disable the hotswap process
										next_state = hs_disable; 
									else                   
										next_state = phase8; end     
								else
									next_state = idle;																			
																																				
	 	hs_complete: if (!hs_enable)
	 									next_state = idle; 
	 							 else 
	 							 		next_state = hs_complete;
	 	
	 	hs_disable:  if ((timer1 == cooldown) || !hs_enable)								
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
			cmp_select <= 1'b0;
			hvimon_th <= 4'd0;
		 	direct_control <= 1'b0;
		 	hs_done <= 1'b0;
		 	hs_error <= 1'b0;
		end
	else 			
	 begin		
		case (next_state)   		
			idle: 			begin
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;
										cmp_select <= 1'b0;
										hvimon_th <= 4'd0;
		 								timer1_enable <= 1'b0;
										hs_done <= 1'b0;
										hs_error <= 1'b0; 
		 							end				 
		 							
			phase0:			begin
										timer1_enable <= 1'b1; 
										if (HCM_HVIMON)	begin             // if use HVIMON, use direct control mode
											hcm_enable <= 1'b0;
											direct_control <= 1'b1; end
										else begin												// otherwise use close loop hysteretic control
											hcm_enable <= 1'b1;
											cmp_select <= 1'b1; 		end			// select vmon_B or imon_B (as in phase1)     						
									end							
					 									 							
			phase1: 		begin		
										hcm_enable <= 1'b1;								// enable hcm control module, start hysteretic control  
										direct_control <= 1'b0;
			        		  timer1_enable <= 1'b1;						// start timer1  				       			        		                 
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b1;							// select vmon_B or imon_B
										else
											hvimon_th <= HCM_TRESHOLD1;			   
									end
			
			phase2: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b0;							// select vmon_A or imon_A
										else
											hvimon_th <= HCM_TRESHOLD2;		
									end	

			phase3: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b1;							// select vmon_B or imon_B
										else
											hvimon_th <= HCM_TRESHOLD3;		
									end	

			phase4: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b0;							// select vmon_A or imon_A
										else
											hvimon_th <= HCM_TRESHOLD4;		
									end	

			phase5: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b1;							// select vmon_B or imon_B
										else
											hvimon_th <= HCM_TRESHOLD5;		
									end	

			phase6: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b0;							// select vmon_A or imon_A
										else
											hvimon_th <= HCM_TRESHOLD6;		
									end	
									
			phase7: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b1;							// select vmon_B or imon_B
										else
											hvimon_th <= HCM_TRESHOLD7;		
									end	
									
			phase8: 		begin
										hcm_enable <= 1'b1;
										timer1_enable <= 1'b1;
										if (!HCM_HVIMON)									// Whether to use 4-bit trip point for IMON2 or compare select for VMON/IMON1
											cmp_select <= 1'b0;							// select vmon_A or imon_A
										else
											hvimon_th <= HCM_TRESHOLD8;		
									end	
			
			hs_complete: begin
										direct_control <= 1'b1; 
										hcm_enable <= 1'b0;
										hs_done <= 1'b1;    
										timer1_enable <= 1'b0;
									 end
			
			hs_disable: begin
										hs_error <= 1'b1;
										direct_control <= 1'b0;
									 	hcm_enable <= 1'b0;
									 	timer1_enable <= 1'b1;								 	
									end

			default: 		begin
										hcm_enable <= 1'b0;
										direct_control <= 1'b0;								
										cmp_select <= 1'b0;	
										hvimon_th <= 4'd0;
										timer1_enable <= 1'b0; 								
							 		end
		endcase
	end

//-----------------------------------------------------------------------------
// Timers
// basic timer (slowclk) = 10ms clock
// variable timer (timer1) = anywhere from 10ms to 2s
//-----------------------------------------------------------------------------

always @(posedge clk or negedge rstn)							// 10ms clock, restart in each state to guarantee nx10ms for timer1
	if (~rstn)
		slowclk <= 10'd0;
	else begin   
		if (~timer1_enable)	
			slowclk <= 10'd0;      	
		else if (slowclk == slowclk_limit)
			slowclk <= 10'd0;
		else if (state != next_state)
			slowclk <= 10'd0;
		else
			slowclk <= slowclk + 1; end

always @(negedge clk or negedge rstn)
	if (~rstn)
		timer1_limit <= 8'd255;
	else begin
		case (state)			
			phase0: 			timer1_limit <= timeout0;
			phase1: 			timer1_limit <= timeout1;
			phase2: 			timer1_limit <= timeout2;
			phase3: 			timer1_limit <= timeout3;
			phase4: 			timer1_limit <= timeout4;
			phase5: 			timer1_limit <= timeout5;
			phase6: 			timer1_limit <= timeout6;
			phase7: 			timer1_limit <= timeout7;
			phase8: 			timer1_limit <= timeout8;
			hs_disable: 	timer1_limit <= cooldown;
			default: 			timer1_limit <= 8'd255;
		endcase
	end

reg cnt_enable;
always @(negedge clk or negedge rstn)						
	if (~rstn)
		cnt_enable <= 1'b0;
	else begin
		if (slowclk == (slowclk_limit-1))
			cnt_enable <= 1'b1;
		else 
			cnt_enable <= 1'b0; end
	
always @(posedge clk or negedge rstn)					// timer1 counter, in n x 10 ms range, n = 1 to 200 
	if (~rstn)
		timer1 <= 8'd0;
	else 
		begin   
		 if (cnt_enable)
		 	timer1 <= timer1 + 1;
		 else if (state != next_state)
		 	timer1 <= 8'd0;
		 else if (timer1 == timer1_limit)
		 	timer1 <= 8'd0;	 
		end 
												
endmodule