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
// Project               : Hot Swap Controller core                                               
// File                  : hsctl_core.v                                              
// Title                 : How Swap Controller soft IP                                       
// Dependencies          :                                                       
//                       :                                                         
// Description           : Hot Swap Controller Soft IP                            
// =============================================================================   
//                        REVISION HISTORY                                         
// Version               : 1.0                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Sep, 2013                
// =============================================================================   

module hsctl_core
				# 
				(	
					// global parameters
					parameter HCM_SOA_TYPE = 1'b0,				// 0 = 10ms SOA curve, 1 = DC SOA curve
					parameter HCM_HVIMON = 1'b0,					// 1 = use HVIMON, use 4-bit hvmon trip point values
					parameter HCM_VMON_PHASE = 1,					// vmon phases, range is 1 to 8
					parameter HCM_FAST_SHUTDOWN = 0, 			// 0 = no oc detection, 1 = slow shutdown, 2 = fast shutdown
					
					parameter [3:0] HCM_TRESHOLD1 = 4'h1,				// 4-bit trip point value for each phase
					parameter [3:0] HCM_TRESHOLD2 = 4'h2,    
					parameter [3:0] HCM_TRESHOLD3 = 4'h3,    
					parameter [3:0] HCM_TRESHOLD4 = 4'h4,    
					parameter [3:0] HCM_TRESHOLD5 = 4'h5,    
					parameter [3:0] HCM_TRESHOLD6 = 4'h6,    
					parameter [3:0] HCM_TRESHOLD7 = 4'h7,    
					parameter [3:0] HCM_TRESHOLD8 = 4'h8, 
					
					parameter HCM_LOOP_MAX1 = 1,					// number of loops to repeat the hysteretic control in a phase 
					parameter HCM_LOOP_MAX2 = 1,                                                                         
					parameter HCM_LOOP_MAX3 = 1,                                                                         
					parameter HCM_LOOP_MAX4 = 1,                                                                         
					parameter HCM_LOOP_MAX5 = 1,                                                                         
					parameter HCM_LOOP_MAX6 = 1,                                                                         
					parameter HCM_LOOP_MAX7 = 1,                                                                         
					parameter HCM_LOOP_MAX8 = 1,                                                                         
					parameter HCM_COOLDOWN = 50,					// cool down period between repeats within a phase             
					                                                                                                     
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
					input oc_clear,												// clear the over current status
					output hs_done,												// hot swap is done
					output hs_error,											// hot swap has error when exceed timer limit
					output oc_error,											// over current is detected
					
					// usp signals 
					input [8:1] hcm_vphase,  							// voltage phase status signals, up to 8 phases
					input oc_detect_3wi,									// over current is detected, status comes from 3wi
					input hcm_iphase,											// detect whether the IMON2 threshld is reached. Only used for HVIMON 
					
					
					output [3:0] hvimon_th, 							// 4-bit trip point value for hvimon (or imon2) in ASC
					output hcm_enable,										// enable hysteretic control of HCM in ASC
					output cmp_select,										// comparator select in the HCM 
					output direct_control,								// set direct control value for HCM
					
					// external pins
					input oc_detect,											// over current detection, status comes from pin
					output shutdown												// shut down signal from hs controller					
					);    				
																		
			
//-----------------------------------------------------------------------------
// Choose one of the hotswap algorithms, they are mutually exclusive
// 1. With 10ms SOA curve => HCM_SOA_TYPE = 0
// 2. With DC SOA curve => HCM_SOA_TYPE = 1
//-----------------------------------------------------------------------------
generate 
begin: hs_algorithm
	if (HCM_SOA_TYPE  == 0)
		begin: hotswap_10ms
			hsctl_10ms # 
			(	
				// global parameters
				.HCM_SOA_TYPE			(HCM_SOA_TYPE			),		
				.HCM_HVIMON 			(HCM_HVIMON 			),	
				.HCM_VMON_PHASE 	(HCM_VMON_PHASE 	),		
				.HCM_FAST_SHUTDOWN(HCM_FAST_SHUTDOWN),		
				.HCM_TRESHOLD1(HCM_TRESHOLD1),				
				.HCM_TRESHOLD2(HCM_TRESHOLD2),    
				.HCM_TRESHOLD3(HCM_TRESHOLD3),    
				.HCM_TRESHOLD4(HCM_TRESHOLD4),    
				.HCM_TRESHOLD5(HCM_TRESHOLD5),    
				.HCM_TRESHOLD6(HCM_TRESHOLD6),    
				.HCM_TRESHOLD7(HCM_TRESHOLD7),    
				.HCM_TRESHOLD8(HCM_TRESHOLD8), 
				.HCM_LOOP_MAX1(HCM_LOOP_MAX1),					
				.HCM_LOOP_MAX2(HCM_LOOP_MAX2),                                                                         
				.HCM_LOOP_MAX3(HCM_LOOP_MAX3),                                                                         
				.HCM_LOOP_MAX4(HCM_LOOP_MAX4),                                                                         
				.HCM_LOOP_MAX5(HCM_LOOP_MAX5),                                                                         
				.HCM_LOOP_MAX6(HCM_LOOP_MAX6),                                                                         
				.HCM_LOOP_MAX7(HCM_LOOP_MAX7),                                                                         
				.HCM_LOOP_MAX8(HCM_LOOP_MAX8),                                                                         
				.HCM_COOLDOWN (HCM_COOLDOWN)		   					                                                                                                    		
			)   
			uut_10ms
			( 
				.clk (clk 	),												
				.rstn(rstn	),																		
				.hs_enable(hs_enable),																						
				.hs_done	(hs_done	),									
				.hs_error	(hs_error ),																						
				.hcm_vphase   (hcm_vphase   ),							
				.hcm_iphase		(hcm_iphase		),													
				.hvimon_th 		 (hvimon_th 		),				
				.hcm_enable		 (hcm_enable		),						
				.cmp_select		 (cmp_select		),							
				.direct_control(direct_control) 													
			);    				 		
		end     
	else
		begin: hotswap_dc
			hsctl_dc #
			(
			 	.HCM_SOA_TYPE			(HCM_SOA_TYPE			),		
				.HCM_HVIMON 			(HCM_HVIMON 			),	
				.HCM_VMON_PHASE 	(HCM_VMON_PHASE 	),		
				.HCM_FAST_SHUTDOWN(HCM_FAST_SHUTDOWN),		
				.HCM_TRESHOLD1(HCM_TRESHOLD1),				
				.HCM_TRESHOLD2(HCM_TRESHOLD2),    
				.HCM_TRESHOLD3(HCM_TRESHOLD3),    
				.HCM_TRESHOLD4(HCM_TRESHOLD4),    
				.HCM_TRESHOLD5(HCM_TRESHOLD5),    
				.HCM_TRESHOLD6(HCM_TRESHOLD6),    
				.HCM_TRESHOLD7(HCM_TRESHOLD7),    
				.HCM_TRESHOLD8(HCM_TRESHOLD8), 
			  .HCM_COOLDOWN (HCM_COOLDOWN),	
				.HCM_DC_TIMEOUT1(HCM_DC_TIMEOUT1),
			  .HCM_DC_TIMEOUT2(HCM_DC_TIMEOUT2),
			  .HCM_DC_TIMEOUT3(HCM_DC_TIMEOUT3),
			  .HCM_DC_TIMEOUT4(HCM_DC_TIMEOUT4),
			  .HCM_DC_TIMEOUT5(HCM_DC_TIMEOUT5),
			  .HCM_DC_TIMEOUT6(HCM_DC_TIMEOUT6),
			  .HCM_DC_TIMEOUT7(HCM_DC_TIMEOUT7),
			  .HCM_DC_TIMEOUT8(HCM_DC_TIMEOUT8)
			 )
			 uut_dc
			 (
			 	.clk (clk 	),									
			 	.rstn(rstn	),												 					                                
			 	.hs_enable(hs_enable),							
			 	.hs_done	(hs_done	),					
			 	.hs_error	(hs_error ),							 					                                
			 	.hcm_vphase   (hcm_vphase   ),  
			 	.hcm_iphase		(hcm_iphase		),				 					                                
			 	.hvimon_th 		 (hvimon_th 		),
			 	.hcm_enable		 (hcm_enable		),
			 	.cmp_select		 (cmp_select		),
			 	.direct_control(direct_control) 
			 	);    				 		              
		end    
end		
endgenerate
												

//-----------------------------------------------------------------------------
// Over current detection (optional logic)
//-----------------------------------------------------------------------------
generate 
begin: oc_mon
	if (HCM_FAST_SHUTDOWN == 0)
		begin: no_oc_mon 
			assign oc_alert = 1'b0;       
			assign shutdown = oc_alert;		// send to pin to shutdown the diode      
			assign oc_error = oc_alert;   // sent to LB to inform             
		end      

	else if (HCM_FAST_SHUTDOWN == 1)    // semi fast shutdown
		begin: semi_oc_mon		                                                          
			wire clear_reg;	                                                              
			assign clear_reg = (!rstn || oc_clear);                                       
			reg oc_alert;                                                                 
			always @(posedge oc_detect_3wi or posedge clear_reg)                          
				if (clear_reg)									// asynchronously clear the ff              
					oc_alert <= 1'b0;                                                         
				else												                                                
					oc_alert <= 1'b1;                                                         
					                                                                          				                                              
			assign shutdown = oc_alert;				// send to pin to shutdown the diode        
			assign oc_error = oc_alert;   		// sent to LB to inform                     
		end                                                                             

	else if (HCM_FAST_SHUTDOWN == 2)  		// fast shutdown
		begin: fast_oc_mon
			wire clear_reg;							                                          
			assign clear_reg = (!rstn || oc_clear);                                     	
		  reg oc_alert;                                                         
		  always @(posedge oc_detect or posedge clear_reg)                                 
				if (clear_reg)        					// asynchronously clear the ff      
					oc_alert <= 1'b0;                                                            		    
				else											                                                              
					oc_alert <= 1'b1;    		                                                              
					                                                                                      			
			assign shutdown = oc_alert;		// send to pin to shutdown the diode      
			assign oc_error = oc_alert;   // sent to LB to inform                                                                    	
		end
end
endgenerate		
             		
endmodule
					
					
					
					
					
					
