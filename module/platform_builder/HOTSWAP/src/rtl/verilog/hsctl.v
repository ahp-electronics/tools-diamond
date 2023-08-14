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
// File                  : hsctl.v                                              
// Title                 : How Swap Controller soft IP                                       
// Dependencies          :                                                       
//                       :                                                         
// Description           : Hot Swap Controller top level                          
// =============================================================================   
//                        REVISION HISTORY                                         
// Version               : 1.0                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Aug, 2013                
// =============================================================================   

`include "../../params/verilog/hsctl_params.v"

module hsctl
				( 
					// Signals for 1st HCM
					// LB interface signals
					input hs1_enable,									// enable the hs to start
					input oc1_clear,									// clear the over current status
					output hs1_done,									// hot swap is done
					output hs1_error,									// hot swap has error when exceed timer limit
					output oc1_error,									// over current is detected					
					// usp signals 
					input [8:1] hcm1_vphase,  				// voltage phase status signals, up to 8 phases
					input oc1_detect_3wi,							// over current is detected, status comes from 3wi
					input hcm1_iphase,								// detect whether the IMON2 threshld is reached. Only used for HVIMON 
					output [3:0] hvimon1_th, 					// 4-bit trip point value for hvimon (or imon2) in ASC
					output hcm1_enable,								// enable hysteretic control of HCM in ASC
					output cmp1_select,								// comparator select in the HCM 
					output direct1_control,						// set direct control value for HCM				
					// external pins
					input oc1_detect,									// over current detection, status comes from pin
					output shutdown1,									// shut down signal from hs controller					
					
					// Signals for 2nd HCM
					`ifdef HCM2					
					// LB interface signals
					input hs2_enable,					
					input oc2_clear,					
					output hs2_done,					
					output hs2_error,					
					output oc2_error,					         
					// usp signals            
					input [8:1] hcm2_vphase,  
					input oc2_detect_3wi,			
					input hcm2_iphase,				
					output [3:0] hvimon2_th, 	
					output hcm2_enable,				
					output cmp2_select,				
					output direct2_control,		           				
					// external pins                                                                              
					input oc2_detect,											// over current detection, status comes from pin        					
					output shutdown2,												// shut down signal from hs controller		
					`endif
								      					
					// Signals for 3rd HCM
					`ifdef HCM3
					// LB interface signals
					input hs3_enable,					
					input oc3_clear,					
					output hs3_done,					
					output hs3_error,					
					output oc3_error,										                          
					// usp signals            
					input [8:1] hcm3_vphase,  
					input oc3_detect_3wi,			
					input hcm3_iphase,									                          
					output [3:0] hvimon3_th, 	
					output hcm3_enable,				
					output cmp3_select,				
					output direct3_control,
					// external pins          
					input oc3_detect,					
					output shutdown3,					
					`endif    
					
					// Signals for 4th HCM
					`ifdef HCM4
					// LB interface signals
					input hs4_enable,					
					input oc4_clear,					
					output hs4_done,					
					output hs4_error,					
					output oc4_error,									                          
					// usp signals            
					input [8:1] hcm4_vphase,  
					input oc4_detect_3wi,			
					input hcm4_iphase,									                          
					output [3:0] hvimon4_th, 	
					output hcm4_enable,				
					output cmp4_select,				
					output direct4_control,							
					// external pins    
					input oc4_detect,		
					output shutdown4,		
					`endif			            
					
					// Signals for 5th HCM      
					`ifdef HCM5                 
					// LB interface signals     
					input hs5_enable,					  
					input oc5_clear,					  
					output hs5_done,					  
					output hs5_error,					  
					output oc5_error,						
					// usp signals              
					input [8:1] hcm5_vphase,    
					input oc5_detect_3wi,			  
					input hcm5_iphase,					
					output [3:0] hvimon5_th, 	  
					output hcm5_enable,				  
					output cmp5_select,				  
					output direct5_control,			
					// external pins            
					input oc5_detect,		        
					output shutdown5,		        
					`endif			             
					
					// Signals for 6th HCM      					
					`ifdef HCM6                 					
					// LB interface signals     					
					input hs6_enable,					  					
					input oc6_clear,					  					
					output hs6_done,					  					
					output hs6_error,					  					
					output oc6_error,											
					// usp signals              					
					input [8:1] hcm6_vphase,    					
					input oc6_detect_3wi,			  					
					input hcm6_iphase,										
					output [3:0] hvimon6_th, 	  					
					output hcm6_enable,				  					
					output cmp6_select,				  					
					output direct6_control,								
					// external pins            					
					input oc6_detect,		        					
					output shutdown6,		        					
					`endif			                					

					// Signals for 7th HCM      
					`ifdef HCM7                 
					// LB interface signals     
					input hs7_enable,					  
					input oc7_clear,					  
					output hs7_done,					  
					output hs7_error,					  
					output oc7_error,						
					// usp signals              
					input [8:1] hcm7_vphase,    
					input oc7_detect_3wi,			  
					input hcm7_iphase,					
					output [3:0] hvimon7_th, 	  
					output hcm7_enable,				  
					output cmp7_select,				  
					output direct7_control,								
					// external pins            					
					input oc7_detect,		        					
					output shutdown7,		        					
					`endif			  
					
					// Signals for 8th HCM    				
					`ifdef HCM8               				
					// LB interface signals   				
					input hs8_enable,									
					input oc8_clear,									
					output hs8_done,									
					output hs8_error,									
					output oc8_error,									
					// usp signals            				
					input [8:1] hcm8_vphase,  				
					input oc8_detect_3wi,							
					input hcm8_iphase,								
					output [3:0] hvimon8_th, 					
					output hcm8_enable,								
					output cmp8_select,								
					output direct8_control,						
					// external pins          				
					input oc8_detect,		      				
					output shutdown8,		      				
					`endif			              				
					
					// Signals for 9th HCM    		
					`ifdef HCM9               		
					// LB interface signals   		
					input hs9_enable,							
					input oc9_clear,							
					output hs9_done,							
					output hs9_error,							
					output oc9_error,							
					// usp signals            		
					input [8:1] hcm9_vphase,  		
					input oc9_detect_3wi,					
					input hcm9_iphase,						
					output [3:0] hvimon9_th, 			
					output hcm9_enable,						
					output cmp9_select,						
					output direct9_control,				
					// external pins          		
					input oc9_detect,		      		
					output shutdown9,		      		
					`endif			              		
					
					// Signals for 10th HCM    		
					`ifdef HCM10               		
					// LB interface signals   		
					input hs10_enable,							
					input oc10_clear,							
					output hs10_done,							
					output hs10_error,							
					output oc10_error,							
					// usp signals            		
					input [8:1] hcm10_vphase,  		
					input oc10_detect_3wi,					
					input hcm10_iphase,						
					output [3:0] hvimon10_th, 			
					output hcm10_enable,						
					output cmp10_select,						
					output direct10_control,				
					// external pins          			                          									
					input oc10_detect,		      		              					   
					output shutdown10,		      						           
					`endif			              		
					
					// Signals for 8th HCM    		
					`ifdef HCM11               		
					// LB interface signals   		
					input hs11_enable,							
					input oc11_clear,							
					output hs11_done,							
					output hs11_error,							
					output oc11_error,							
					// usp signals            		
					input [8:1] hcm11_vphase,  		
					input oc11_detect_3wi,					
					input hcm11_iphase,						
					output [3:0] hvimon11_th, 			
					output hcm11_enable,						
					output cmp11_select,						
					output direct11_control,				
					// external pins          		
					input oc11_detect,		      		
					output shutdown11,		      		
					`endif		
					
					// Signals for 12th HCM    		
					`ifdef HCM12               		
					// LB interface signals   		
					input hs12_enable,							
					input oc12_clear,							
					output hs12_done,							
					output hs12_error,							
					output oc12_error,							
					// usp signals            		
					input [8:1] hcm12_vphase,  		
					input oc12_detect_3wi,					
					input hcm12_iphase,						
					output [3:0] hvimon12_th, 			
					output hcm12_enable,							              		
					output cmp12_select,						
					output direct12_control,				
					// external pins          		
					input oc12_detect,		      		
					output shutdown12,		      		
					`endif			              		
					
					// Signals for 13th HCM    		
					`ifdef HCM13               		
					// LB interface signals   		
					input hs13_enable,							
					input oc13_clear,							
					output hs13_done,							
					output hs13_error,							
					output oc13_error,							
					// usp signals            		
					input [8:1] hcm13_vphase,  		
					input oc13_detect_3wi,					
					input hcm13_iphase,						
					output [3:0] hvimon13_th, 			
					output hcm13_enable,						
					output cmp13_select,						
					output direct13_control,				
					// external pins          		
					input oc13_detect,		      		
					output shutdown13,		      		
					`endif			              		
					
					// Signals for 14th HCM    		
					`ifdef HCM14               		
					// LB interface signals   		
					input hs14_enable,							
					input oc14_clear,							
					output hs14_done,							
					output hs14_error,							
					output oc14_error,							
					// usp signals            		
					input [8:1] hcm14_vphase,  		
					input oc14_detect_3wi,					
					input hcm14_iphase,						
					output [3:0] hvimon14_th, 			
					output hcm14_enable,						
					output cmp14_select,						
					output direct14_control,				
					// external pins          		
					input oc14_detect,		      		
					output shutdown14,		      		
					`endif			              		
					
					// Signals for 15th HCM    		
					`ifdef HCM15               		
					// LB interface signals   		
					input hs15_enable,							
					input oc15_clear,							
					output hs15_done,							
					output hs15_error,							
					output oc15_error,							
					// usp signals            		
					input [8:1] hcm15_vphase,  		
					input oc15_detect_3wi,					
					input hcm15_iphase,						
					output [3:0] hvimon15_th, 			
					output hcm15_enable,						
					output cmp15_select,						
					output direct15_control,				
					// external pins          		
					input oc15_detect,		      		
					output shutdown15,		      		
					`endif			    
					
					// Signals for 16th HCM    		
					`ifdef HCM16               		
					// LB interface signals   		
					input hs16_enable,							
					input oc16_clear,							
					output hs16_done,							
					output hs16_error,							
					output oc16_error,							
					// usp signals            		
					input [8:1] hcm16_vphase,  		
					input oc16_detect_3wi,					
					input hcm16_iphase,						
					output [3:0] hvimon16_th, 			
					output hcm16_enable,						
					output cmp16_select,						
					output direct16_control,				
					// external pins          		
					input oc16_detect,		      		
					output shutdown16,		      		          		
					`endif			
					
				  // Signals for 17th HCM    			
					`ifdef HCM17               		
					// LB interface signals   		
					input hs17_enable,							
					input oc17_clear,							
					output hs17_done,							
					output hs17_error,							
					output oc17_error,							
					// usp signals            		
					input [8:1] hcm17_vphase,  		
					input oc17_detect_3wi,					
					input hcm17_iphase,						
					output [3:0] hvimon17_th, 			
					output hcm17_enable,						
					output cmp17_select,						
					output direct17_control,				
					// external pins          		
					input oc17_detect,		      		
					output shutdown17,		      		
					`endif			  
					
					// Signals for 18th HCM    		
					`ifdef HCM18               		
					// LB interface signals   		
					input hs18_enable,							
					input oc18_clear,							
					output hs18_done,							
					output hs18_error,							
					output oc18_error,							
					// usp signals            		
					input [8:1] hcm18_vphase,  		
					input oc18_detect_3wi,					
					input hcm18_iphase,						
					output [3:0] hvimon18_th, 			
					output hcm18_enable,						
					output cmp18_select,						
					output direct18_control,				
					// external pins          		
					input oc18_detect,		      		
					output shutdown18,		      		
					`endif			              		
					
					// Signals for 19th HCM    		
					`ifdef HCM19              		
					// LB interface signals   		
					input hs19_enable,							
					input oc19_clear,							
					output hs19_done,							
					output hs19_error,							
					output oc19_error,							
					// usp signals            		
					input [8:1] hcm19_vphase,  		
					input oc19_detect_3wi,					
					input hcm19_iphase,						
					output [3:0] hvimon19_th, 			
					output hcm19_enable,						
					output cmp19_select,						
					output direct19_control,				
					// external pins          		
					input oc19_detect,		      		
					output shutdown19,		      		
					`endif			              		
					
					// Signals for 20th HCM    		
					`ifdef HCM20               		
					// LB interface signals   		
					input hs20_enable,							
					input oc20_clear,							
					output hs20_done,							
					output hs20_error,							
					output oc20_error,							
					// usp signals            		
					input [8:1] hcm20_vphase,  		
					input oc20_detect_3wi,					
					input hcm20_iphase,						
					output [3:0] hvimon20_th, 			
					output hcm20_enable,						
					output cmp20_select,						
					output direct20_control,				
					// external pins          		
					input oc20_detect,		      		            		
					output shutdown20,		      		
					`endif			  
					
					// Signals for 21st HCM    		
					`ifdef HCM21               		
					// LB interface signals   		
					input hs21_enable,							
					input oc21_clear,							
					output hs21_done,							
					output hs21_error,							
					output oc21_error,							
					// usp signals            		
					input [8:1] hcm21_vphase,  		
					input oc21_detect_3wi,					
					input hcm21_iphase,						
					output [3:0] hvimon21_th, 			
					output hcm21_enable,						
					output cmp21_select,						
					output direct21_control,				
					// external pins          		
					input oc21_detect,		      		
					output shutdown21,		      		            		
					`endif		
					
					// Signals for 22nd HCM    		
					`ifdef HCM22               		
					// LB interface signals   		
					input hs22_enable,							
					input oc22_clear,							
					output hs22_done,							
					output hs22_error,							
					output oc22_error,							
					// usp signals            		
					input [8:1] hcm22_vphase,  		
					input oc22_detect_3wi,					
					input hcm22_iphase,						
					output [3:0] hvimon22_th, 			
					output hcm22_enable,						
					output cmp22_select,						
					output direct22_control,				
					// external pins          		
					input oc22_detect,		      		
					output shutdown22,		      		
					`endif			              		
					
					// Signals for 23rd HCM    		
					`ifdef HCM23               		
					// LB interface signals   		
					input hs23_enable,							
					input oc23_clear,							
					output hs23_done,							
					output hs23_error,							
					output oc23_error,							
					// usp signals            		
					input [8:1] hcm23_vphase,  		
					input oc23_detect_3wi,					
					input hcm23_iphase,						
					output [3:0] hvimon23_th, 			
					output hcm23_enable,						
					output cmp23_select,						
					output direct23_control,				
					// external pins          		
					input oc23_detect,		      		
					output shutdown23,		      		
					`endif			              		
					
					// Signals for 24th HCM    		
					`ifdef HCM24               		
					// LB interface signals   		
					input hs24_enable,							
					input oc24_clear,							
					output hs24_done,							
					output hs24_error,							
					output oc24_error,							
					// usp signals            		
					input [8:1] hcm24_vphase,  		
					input oc24_detect_3wi,					
					input hcm24_iphase,						
					output [3:0] hvimon24_th, 			
					output hcm24_enable,						
					output cmp24_select,						
					output direct24_control,				
					// external pins          		
					input oc24_detect,		      		
					output shutdown24,		      			              		              		
					`endif			              		
					
					
					
					// global signals                                                                 
					input clk,														// using the same clock as LB               
					input rstn														// using the same reset as LB               
					                                                                                  
					);    				
					
//-----------------------------------------------------------------------------
// Convert `define macros to parameters for the entire IP.
//-----------------------------------------------------------------------------

// global
`ifdef HOTSWAP_NUMBER parameter int_HOTSWAP_NUMBER = `HOTSWAP_NUMBER; `endif

// HCM1 parameters
`ifdef HCM1_SOA_TYPE parameter int_HCM1_SOA_TYPE	= `HCM1_SOA_TYPE; `endif
`ifdef HCM1_HVIMON parameter int_HCM1_HVIMON = `HCM1_HVIMON; `endif
`ifdef HCM1_VMON_PHASE parameter [3:0] int_HCM1_VMON_PHASE = `HCM1_VMON_PHASE; `endif
`ifdef HCM1_FAST_SHUTDOWN parameter [1:0] int_HCM1_FAST_SHUTDOWN = `HCM1_FAST_SHUTDOWN; `endif

`ifdef HCM1_TRESHOLD1 parameter [3:0] int_HCM1_TRESHOLD1 = `HCM1_TRESHOLD1;	`endif
`ifdef HCM1_TRESHOLD2 parameter [3:0] int_HCM1_TRESHOLD2 = `HCM1_TRESHOLD2; `endif
`ifdef HCM1_TRESHOLD3 parameter [3:0] int_HCM1_TRESHOLD3 = `HCM1_TRESHOLD3; `endif
`ifdef HCM1_TRESHOLD4 parameter [3:0] int_HCM1_TRESHOLD4 = `HCM1_TRESHOLD4; `endif
`ifdef HCM1_TRESHOLD5 parameter [3:0] int_HCM1_TRESHOLD5 = `HCM1_TRESHOLD5; `endif
`ifdef HCM1_TRESHOLD6 parameter [3:0] int_HCM1_TRESHOLD6 = `HCM1_TRESHOLD6; `endif
`ifdef HCM1_TRESHOLD7 parameter [3:0] int_HCM1_TRESHOLD7 = `HCM1_TRESHOLD7; `endif
`ifdef HCM1_TRESHOLD8 parameter [3:0] int_HCM1_TRESHOLD8 = `HCM1_TRESHOLD8; `endif
                  
`ifdef HCM1_LOOP_MAX1 parameter [3:0] int_HCM1_LOOP_MAX1 = `HCM1_LOOP_MAX1;	`endif
`ifdef HCM1_LOOP_MAX2 parameter [3:0] int_HCM1_LOOP_MAX2 = `HCM1_LOOP_MAX2; `endif  
`ifdef HCM1_LOOP_MAX3 parameter [3:0] int_HCM1_LOOP_MAX3 = `HCM1_LOOP_MAX3; `endif  
`ifdef HCM1_LOOP_MAX4 parameter [3:0] int_HCM1_LOOP_MAX4 = `HCM1_LOOP_MAX4; `endif  
`ifdef HCM1_LOOP_MAX5 parameter [3:0] int_HCM1_LOOP_MAX5 = `HCM1_LOOP_MAX5; `endif  
`ifdef HCM1_LOOP_MAX6 parameter [3:0] int_HCM1_LOOP_MAX6 = `HCM1_LOOP_MAX6; `endif  
`ifdef HCM1_LOOP_MAX7 parameter [3:0] int_HCM1_LOOP_MAX7 = `HCM1_LOOP_MAX7; `endif  
`ifdef HCM1_LOOP_MAX8 parameter [3:0] int_HCM1_LOOP_MAX8 = `HCM1_LOOP_MAX8; `endif  
`ifdef HCM1_COOLDOWN  parameter [7:0] int_HCM1_COOLDOWN  = `HCM1_COOLDOWN ;	`endif	
                  
`ifdef HCM1_DC_TIMEOUT1 parameter [7:0] int_HCM1_DC_TIMEOUT1 = `HCM1_DC_TIMEOUT1;	`endif
`ifdef HCM1_DC_TIMEOUT2 parameter [7:0] int_HCM1_DC_TIMEOUT2 = `HCM1_DC_TIMEOUT2; `endif
`ifdef HCM1_DC_TIMEOUT3 parameter [7:0] int_HCM1_DC_TIMEOUT3 = `HCM1_DC_TIMEOUT3; `endif
`ifdef HCM1_DC_TIMEOUT4 parameter [7:0] int_HCM1_DC_TIMEOUT4 = `HCM1_DC_TIMEOUT4; `endif
`ifdef HCM1_DC_TIMEOUT5 parameter [7:0] int_HCM1_DC_TIMEOUT5 = `HCM1_DC_TIMEOUT5; `endif
`ifdef HCM1_DC_TIMEOUT6 parameter [7:0] int_HCM1_DC_TIMEOUT6 = `HCM1_DC_TIMEOUT6; `endif
`ifdef HCM1_DC_TIMEOUT7 parameter [7:0] int_HCM1_DC_TIMEOUT7 = `HCM1_DC_TIMEOUT7; `endif
`ifdef HCM1_DC_TIMEOUT8 parameter [7:0] int_HCM1_DC_TIMEOUT8 = `HCM1_DC_TIMEOUT8; `endif

// HCM2 parameters                                                                                      
`ifdef HCM2_SOA_TYPE 			parameter int_HCM2_SOA_TYPE	= `HCM2_SOA_TYPE; `endif                              
`ifdef HCM2_HVIMON 				parameter int_HCM2_HVIMON = 	`HCM2_HVIMON; `endif                                   
`ifdef HCM2_VMON_PHASE    parameter [3:0] int_HCM2_VMON_PHASE = `HCM2_VMON_PHASE;    `endif                            
`ifdef HCM2_FAST_SHUTDOWN parameter [1:0] int_HCM2_FAST_SHUTDOWN = `HCM2_FAST_SHUTDOWN; `endif                       
                                                                                                        
`ifdef HCM2_TRESHOLD1 parameter [3:0] int_HCM2_TRESHOLD1 = `HCM2_TRESHOLD1;	`endif                                  
`ifdef HCM2_TRESHOLD2 parameter [3:0] int_HCM2_TRESHOLD2 = `HCM2_TRESHOLD2; `endif                                  
`ifdef HCM2_TRESHOLD3 parameter [3:0] int_HCM2_TRESHOLD3 = `HCM2_TRESHOLD3; `endif                                  
`ifdef HCM2_TRESHOLD4 parameter [3:0] int_HCM2_TRESHOLD4 = `HCM2_TRESHOLD4; `endif                                  
`ifdef HCM2_TRESHOLD5 parameter [3:0] int_HCM2_TRESHOLD5 = `HCM2_TRESHOLD5; `endif                                  
`ifdef HCM2_TRESHOLD6 parameter [3:0] int_HCM2_TRESHOLD6 = `HCM2_TRESHOLD6; `endif                                  
`ifdef HCM2_TRESHOLD7 parameter [3:0] int_HCM2_TRESHOLD7 = `HCM2_TRESHOLD7; `endif                                  
`ifdef HCM2_TRESHOLD8 parameter [3:0] int_HCM2_TRESHOLD8 = `HCM2_TRESHOLD8; `endif                                  
                                                                                                    
`ifdef HCM2_LOOP_MAX1 parameter [3:0] int_HCM2_LOOP_MAX1 = `HCM2_LOOP_MAX1;	`endif                                  
`ifdef HCM2_LOOP_MAX2 parameter [3:0] int_HCM2_LOOP_MAX2 = `HCM2_LOOP_MAX2; `endif                                  
`ifdef HCM2_LOOP_MAX3 parameter [3:0] int_HCM2_LOOP_MAX3 = `HCM2_LOOP_MAX3; `endif                                  
`ifdef HCM2_LOOP_MAX4 parameter [3:0] int_HCM2_LOOP_MAX4 = `HCM2_LOOP_MAX4; `endif                                  
`ifdef HCM2_LOOP_MAX5 parameter [3:0] int_HCM2_LOOP_MAX5 = `HCM2_LOOP_MAX5; `endif                                  
`ifdef HCM2_LOOP_MAX6 parameter [3:0] int_HCM2_LOOP_MAX6 = `HCM2_LOOP_MAX6; `endif                                  
`ifdef HCM2_LOOP_MAX7 parameter [3:0] int_HCM2_LOOP_MAX7 = `HCM2_LOOP_MAX7; `endif                                  
`ifdef HCM2_LOOP_MAX8 parameter [3:0] int_HCM2_LOOP_MAX8 = `HCM2_LOOP_MAX8; `endif                                  
`ifdef HCM2_COOLDOWN  parameter [7:0] int_HCM2_COOLDOWN  = `HCM2_COOLDOWN ;	`endif	                                
                                                                                                        
`ifdef HCM2_DC_TIMEOUT1 parameter [7:0] int_HCM2_DC_TIMEOUT1 = `HCM2_DC_TIMEOUT1; `endif                           
`ifdef HCM2_DC_TIMEOUT2 parameter [7:0] int_HCM2_DC_TIMEOUT2 = `HCM2_DC_TIMEOUT2; `endif                           
`ifdef HCM2_DC_TIMEOUT3 parameter [7:0] int_HCM2_DC_TIMEOUT3 = `HCM2_DC_TIMEOUT3; `endif                           
`ifdef HCM2_DC_TIMEOUT4 parameter [7:0] int_HCM2_DC_TIMEOUT4 = `HCM2_DC_TIMEOUT4; `endif                           
`ifdef HCM2_DC_TIMEOUT5 parameter [7:0] int_HCM2_DC_TIMEOUT5 = `HCM2_DC_TIMEOUT5; `endif                           
`ifdef HCM2_DC_TIMEOUT6 parameter [7:0] int_HCM2_DC_TIMEOUT6 = `HCM2_DC_TIMEOUT6; `endif                           
`ifdef HCM2_DC_TIMEOUT7 parameter [7:0] int_HCM2_DC_TIMEOUT7 = `HCM2_DC_TIMEOUT7; `endif                           
`ifdef HCM2_DC_TIMEOUT8 parameter [7:0] int_HCM2_DC_TIMEOUT8 = `HCM2_DC_TIMEOUT8; `endif                           

// HCM3 parameters                                                                           
`ifdef HCM3_SOA_TYPE 			parameter int_HCM3_SOA_TYPE	= `HCM3_SOA_TYPE; `endif               
`ifdef HCM3_HVIMON 				parameter int_HCM3_HVIMON = 	`HCM3_HVIMON; `endif                 
`ifdef HCM3_VMON_PHASE 		parameter [3:0] int_HCM3_VMON_PHASE = `HCM3_VMON_PHASE;    `endif        
`ifdef HCM3_FAST_SHUTDOWN parameter [1:0] int_HCM3_FAST_SHUTDOWN = `HCM3_FAST_SHUTDOWN; `endif     
                                                                               
`ifdef HCM3_TRESHOLD1 parameter [3:0] int_HCM3_TRESHOLD1 = `HCM3_TRESHOLD1;	`endif                 
`ifdef HCM3_TRESHOLD2 parameter [3:0] int_HCM3_TRESHOLD2 = `HCM3_TRESHOLD2; `endif                 
`ifdef HCM3_TRESHOLD3 parameter [3:0] int_HCM3_TRESHOLD3 = `HCM3_TRESHOLD3; `endif                 
`ifdef HCM3_TRESHOLD4 parameter [3:0] int_HCM3_TRESHOLD4 = `HCM3_TRESHOLD4; `endif                 
`ifdef HCM3_TRESHOLD5 parameter [3:0] int_HCM3_TRESHOLD5 = `HCM3_TRESHOLD5; `endif                 
`ifdef HCM3_TRESHOLD6 parameter [3:0] int_HCM3_TRESHOLD6 = `HCM3_TRESHOLD6; `endif                 
`ifdef HCM3_TRESHOLD7 parameter [3:0] int_HCM3_TRESHOLD7 = `HCM3_TRESHOLD7; `endif                 
`ifdef HCM3_TRESHOLD8 parameter [3:0] int_HCM3_TRESHOLD8 = `HCM3_TRESHOLD8; `endif                 
                                                                                        
`ifdef HCM3_LOOP_MAX1 parameter [3:0] int_HCM3_LOOP_MAX1 = `HCM3_LOOP_MAX1;	`endif                 
`ifdef HCM3_LOOP_MAX2 parameter [3:0] int_HCM3_LOOP_MAX2 = `HCM3_LOOP_MAX2; `endif                 
`ifdef HCM3_LOOP_MAX3 parameter [3:0] int_HCM3_LOOP_MAX3 = `HCM3_LOOP_MAX3; `endif                 
`ifdef HCM3_LOOP_MAX4 parameter [3:0] int_HCM3_LOOP_MAX4 = `HCM3_LOOP_MAX4; `endif                 
`ifdef HCM3_LOOP_MAX5 parameter [3:0] int_HCM3_LOOP_MAX5 = `HCM3_LOOP_MAX5; `endif                 
`ifdef HCM3_LOOP_MAX6 parameter [3:0] int_HCM3_LOOP_MAX6 = `HCM3_LOOP_MAX6; `endif                 
`ifdef HCM3_LOOP_MAX7 parameter [3:0] int_HCM3_LOOP_MAX7 = `HCM3_LOOP_MAX7; `endif                 
`ifdef HCM3_LOOP_MAX8 parameter [3:0] int_HCM3_LOOP_MAX8 = `HCM3_LOOP_MAX8; `endif                 
`ifdef HCM3_COOLDOWN  parameter [7:0] int_HCM3_COOLDOWN  = `HCM3_COOLDOWN ;	`endif	               
                                                                                            
`ifdef HCM3_DC_TIMEOUT1 parameter [7:0] int_HCM3_DC_TIMEOUT1 = `HCM3_DC_TIMEOUT1; `endif           
`ifdef HCM3_DC_TIMEOUT2 parameter [7:0] int_HCM3_DC_TIMEOUT2 = `HCM3_DC_TIMEOUT2; `endif           
`ifdef HCM3_DC_TIMEOUT3 parameter [7:0] int_HCM3_DC_TIMEOUT3 = `HCM3_DC_TIMEOUT3; `endif           
`ifdef HCM3_DC_TIMEOUT4 parameter [7:0] int_HCM3_DC_TIMEOUT4 = `HCM3_DC_TIMEOUT4; `endif           
`ifdef HCM3_DC_TIMEOUT5 parameter [7:0] int_HCM3_DC_TIMEOUT5 = `HCM3_DC_TIMEOUT5; `endif           
`ifdef HCM3_DC_TIMEOUT6 parameter [7:0] int_HCM3_DC_TIMEOUT6 = `HCM3_DC_TIMEOUT6; `endif           
`ifdef HCM3_DC_TIMEOUT7 parameter [7:0] int_HCM3_DC_TIMEOUT7 = `HCM3_DC_TIMEOUT7; `endif           
`ifdef HCM3_DC_TIMEOUT8 parameter [7:0] int_HCM3_DC_TIMEOUT8 = `HCM3_DC_TIMEOUT8; `endif           

// HCM4 parameters                                                                                
`ifdef HCM4_SOA_TYPE 			parameter int_HCM4_SOA_TYPE	= `HCM4_SOA_TYPE; `endif                    
`ifdef HCM4_HVIMON 				parameter int_HCM4_HVIMON = 	`HCM4_HVIMON; `endif                      
`ifdef HCM4_VMON_PHASE 		parameter [3:0] int_HCM4_VMON_PHASE = `HCM4_VMON_PHASE;    `endif       
`ifdef HCM4_FAST_SHUTDOWN parameter [1:0] int_HCM4_FAST_SHUTDOWN = `HCM4_FAST_SHUTDOWN; `endif    
                                                                                                  
`ifdef HCM4_TRESHOLD1 parameter [3:0] int_HCM4_TRESHOLD1 = `HCM4_TRESHOLD1;	`endif                
`ifdef HCM4_TRESHOLD2 parameter [3:0] int_HCM4_TRESHOLD2 = `HCM4_TRESHOLD2; `endif                
`ifdef HCM4_TRESHOLD3 parameter [3:0] int_HCM4_TRESHOLD3 = `HCM4_TRESHOLD3; `endif                
`ifdef HCM4_TRESHOLD4 parameter [3:0] int_HCM4_TRESHOLD4 = `HCM4_TRESHOLD4; `endif                
`ifdef HCM4_TRESHOLD5 parameter [3:0] int_HCM4_TRESHOLD5 = `HCM4_TRESHOLD5; `endif                
`ifdef HCM4_TRESHOLD6 parameter [3:0] int_HCM4_TRESHOLD6 = `HCM4_TRESHOLD6; `endif                
`ifdef HCM4_TRESHOLD7 parameter [3:0] int_HCM4_TRESHOLD7 = `HCM4_TRESHOLD7; `endif                
`ifdef HCM4_TRESHOLD8 parameter [3:0] int_HCM4_TRESHOLD8 = `HCM4_TRESHOLD8; `endif                
                                                                                                  
`ifdef HCM4_LOOP_MAX1 parameter [3:0] int_HCM4_LOOP_MAX1 = `HCM4_LOOP_MAX1;	`endif                
`ifdef HCM4_LOOP_MAX2 parameter [3:0] int_HCM4_LOOP_MAX2 = `HCM4_LOOP_MAX2; `endif                
`ifdef HCM4_LOOP_MAX3 parameter [3:0] int_HCM4_LOOP_MAX3 = `HCM4_LOOP_MAX3; `endif                
`ifdef HCM4_LOOP_MAX4 parameter [3:0] int_HCM4_LOOP_MAX4 = `HCM4_LOOP_MAX4; `endif                
`ifdef HCM4_LOOP_MAX5 parameter [3:0] int_HCM4_LOOP_MAX5 = `HCM4_LOOP_MAX5; `endif                
`ifdef HCM4_LOOP_MAX6 parameter [3:0] int_HCM4_LOOP_MAX6 = `HCM4_LOOP_MAX6; `endif                
`ifdef HCM4_LOOP_MAX7 parameter [3:0] int_HCM4_LOOP_MAX7 = `HCM4_LOOP_MAX7; `endif                
`ifdef HCM4_LOOP_MAX8 parameter [3:0] int_HCM4_LOOP_MAX8 = `HCM4_LOOP_MAX8; `endif                
`ifdef HCM4_COOLDOWN  parameter [7:0] int_HCM4_COOLDOWN  = `HCM4_COOLDOWN ;	`endif	              
                                                                                                  
`ifdef HCM4_DC_TIMEOUT1 parameter [7:0] int_HCM4_DC_TIMEOUT1 = `HCM4_DC_TIMEOUT1; `endif          
`ifdef HCM4_DC_TIMEOUT2 parameter [7:0] int_HCM4_DC_TIMEOUT2 = `HCM4_DC_TIMEOUT2; `endif          
`ifdef HCM4_DC_TIMEOUT3 parameter [7:0] int_HCM4_DC_TIMEOUT3 = `HCM4_DC_TIMEOUT3; `endif          
`ifdef HCM4_DC_TIMEOUT4 parameter [7:0] int_HCM4_DC_TIMEOUT4 = `HCM4_DC_TIMEOUT4; `endif          
`ifdef HCM4_DC_TIMEOUT5 parameter [7:0] int_HCM4_DC_TIMEOUT5 = `HCM4_DC_TIMEOUT5; `endif          
`ifdef HCM4_DC_TIMEOUT6 parameter [7:0] int_HCM4_DC_TIMEOUT6 = `HCM4_DC_TIMEOUT6; `endif          
`ifdef HCM4_DC_TIMEOUT7 parameter [7:0] int_HCM4_DC_TIMEOUT7 = `HCM4_DC_TIMEOUT7; `endif          
`ifdef HCM4_DC_TIMEOUT8 parameter [7:0] int_HCM4_DC_TIMEOUT8 = `HCM4_DC_TIMEOUT8; `endif      

// HCM5 parameters                                                                                
`ifdef HCM5_SOA_TYPE 			parameter int_HCM5_SOA_TYPE	= `HCM5_SOA_TYPE; `endif                    
`ifdef HCM5_HVIMON 				parameter int_HCM5_HVIMON = 	`HCM5_HVIMON; `endif                      
`ifdef HCM5_VMON_PHASE 		parameter [3:0] int_HCM5_VMON_PHASE = `HCM5_VMON_PHASE;    `endif       
`ifdef HCM5_FAST_SHUTDOWN parameter [1:0] int_HCM5_FAST_SHUTDOWN = `HCM5_FAST_SHUTDOWN; `endif    
                                                                                                  
`ifdef HCM5_TRESHOLD1 parameter [3:0] int_HCM5_TRESHOLD1 = `HCM5_TRESHOLD1;	`endif                
`ifdef HCM5_TRESHOLD2 parameter [3:0] int_HCM5_TRESHOLD2 = `HCM5_TRESHOLD2; `endif                
`ifdef HCM5_TRESHOLD3 parameter [3:0] int_HCM5_TRESHOLD3 = `HCM5_TRESHOLD3; `endif                
`ifdef HCM5_TRESHOLD4 parameter [3:0] int_HCM5_TRESHOLD4 = `HCM5_TRESHOLD4; `endif                
`ifdef HCM5_TRESHOLD5 parameter [3:0] int_HCM5_TRESHOLD5 = `HCM5_TRESHOLD5; `endif                
`ifdef HCM5_TRESHOLD6 parameter [3:0] int_HCM5_TRESHOLD6 = `HCM5_TRESHOLD6; `endif                
`ifdef HCM5_TRESHOLD7 parameter [3:0] int_HCM5_TRESHOLD7 = `HCM5_TRESHOLD7; `endif                
`ifdef HCM5_TRESHOLD8 parameter [3:0] int_HCM5_TRESHOLD8 = `HCM5_TRESHOLD8; `endif                
                                                                                                  
`ifdef HCM5_LOOP_MAX1 parameter [3:0] int_HCM5_LOOP_MAX1 = `HCM5_LOOP_MAX1;	`endif                
`ifdef HCM5_LOOP_MAX2 parameter [3:0] int_HCM5_LOOP_MAX2 = `HCM5_LOOP_MAX2; `endif                
`ifdef HCM5_LOOP_MAX3 parameter [3:0] int_HCM5_LOOP_MAX3 = `HCM5_LOOP_MAX3; `endif                
`ifdef HCM5_LOOP_MAX4 parameter [3:0] int_HCM5_LOOP_MAX4 = `HCM5_LOOP_MAX4; `endif                
`ifdef HCM5_LOOP_MAX5 parameter [3:0] int_HCM5_LOOP_MAX5 = `HCM5_LOOP_MAX5; `endif                
`ifdef HCM5_LOOP_MAX6 parameter [3:0] int_HCM5_LOOP_MAX6 = `HCM5_LOOP_MAX6; `endif                
`ifdef HCM5_LOOP_MAX7 parameter [3:0] int_HCM5_LOOP_MAX7 = `HCM5_LOOP_MAX7; `endif                
`ifdef HCM5_LOOP_MAX8 parameter [3:0] int_HCM5_LOOP_MAX8 = `HCM5_LOOP_MAX8; `endif                
`ifdef HCM5_COOLDOWN  parameter [7:0] int_HCM5_COOLDOWN  = `HCM5_COOLDOWN ;	`endif	              
                                                                                                  
`ifdef HCM5_DC_TIMEOUT1 parameter [7:0] int_HCM5_DC_TIMEOUT1 = `HCM5_DC_TIMEOUT1; `endif          
`ifdef HCM5_DC_TIMEOUT2 parameter [7:0] int_HCM5_DC_TIMEOUT2 = `HCM5_DC_TIMEOUT2; `endif          
`ifdef HCM5_DC_TIMEOUT3 parameter [7:0] int_HCM5_DC_TIMEOUT3 = `HCM5_DC_TIMEOUT3; `endif          
`ifdef HCM5_DC_TIMEOUT4 parameter [7:0] int_HCM5_DC_TIMEOUT4 = `HCM5_DC_TIMEOUT4; `endif          
`ifdef HCM5_DC_TIMEOUT5 parameter [7:0] int_HCM5_DC_TIMEOUT5 = `HCM5_DC_TIMEOUT5; `endif          
`ifdef HCM5_DC_TIMEOUT6 parameter [7:0] int_HCM5_DC_TIMEOUT6 = `HCM5_DC_TIMEOUT6; `endif          
`ifdef HCM5_DC_TIMEOUT7 parameter [7:0] int_HCM5_DC_TIMEOUT7 = `HCM5_DC_TIMEOUT7; `endif          
`ifdef HCM5_DC_TIMEOUT8 parameter [7:0] int_HCM5_DC_TIMEOUT8 = `HCM5_DC_TIMEOUT8; `endif      

// HCM6 parameters                                                                                
`ifdef HCM6_SOA_TYPE 			parameter int_HCM6_SOA_TYPE	= `HCM6_SOA_TYPE; `endif                    
`ifdef HCM6_HVIMON 				parameter int_HCM6_HVIMON = 	`HCM6_HVIMON; `endif                      
`ifdef HCM6_VMON_PHASE 		parameter [3:0] int_HCM6_VMON_PHASE = `HCM6_VMON_PHASE;    `endif       
`ifdef HCM6_FAST_SHUTDOWN parameter [1:0] int_HCM6_FAST_SHUTDOWN = `HCM6_FAST_SHUTDOWN; `endif    
                                                                                                  
`ifdef HCM6_TRESHOLD1 parameter [3:0] int_HCM6_TRESHOLD1 = `HCM6_TRESHOLD1;	`endif                
`ifdef HCM6_TRESHOLD2 parameter [3:0] int_HCM6_TRESHOLD2 = `HCM6_TRESHOLD2; `endif                
`ifdef HCM6_TRESHOLD3 parameter [3:0] int_HCM6_TRESHOLD3 = `HCM6_TRESHOLD3; `endif                
`ifdef HCM6_TRESHOLD4 parameter [3:0] int_HCM6_TRESHOLD4 = `HCM6_TRESHOLD4; `endif                
`ifdef HCM6_TRESHOLD5 parameter [3:0] int_HCM6_TRESHOLD5 = `HCM6_TRESHOLD5; `endif                
`ifdef HCM6_TRESHOLD6 parameter [3:0] int_HCM6_TRESHOLD6 = `HCM6_TRESHOLD6; `endif                
`ifdef HCM6_TRESHOLD7 parameter [3:0] int_HCM6_TRESHOLD7 = `HCM6_TRESHOLD7; `endif                
`ifdef HCM6_TRESHOLD8 parameter [3:0] int_HCM6_TRESHOLD8 = `HCM6_TRESHOLD8; `endif                
                                                                                                  
`ifdef HCM6_LOOP_MAX1 parameter [3:0] int_HCM6_LOOP_MAX1 = `HCM6_LOOP_MAX1;	`endif                
`ifdef HCM6_LOOP_MAX2 parameter [3:0] int_HCM6_LOOP_MAX2 = `HCM6_LOOP_MAX2; `endif                
`ifdef HCM6_LOOP_MAX3 parameter [3:0] int_HCM6_LOOP_MAX3 = `HCM6_LOOP_MAX3; `endif                
`ifdef HCM6_LOOP_MAX4 parameter [3:0] int_HCM6_LOOP_MAX4 = `HCM6_LOOP_MAX4; `endif                
`ifdef HCM6_LOOP_MAX5 parameter [3:0] int_HCM6_LOOP_MAX5 = `HCM6_LOOP_MAX5; `endif                
`ifdef HCM6_LOOP_MAX6 parameter [3:0] int_HCM6_LOOP_MAX6 = `HCM6_LOOP_MAX6; `endif                
`ifdef HCM6_LOOP_MAX7 parameter [3:0] int_HCM6_LOOP_MAX7 = `HCM6_LOOP_MAX7; `endif                
`ifdef HCM6_LOOP_MAX8 parameter [3:0] int_HCM6_LOOP_MAX8 = `HCM6_LOOP_MAX8; `endif                
`ifdef HCM6_COOLDOWN  parameter [7:0] int_HCM6_COOLDOWN  = `HCM6_COOLDOWN ;	`endif	              
                                                                                                  
`ifdef HCM6_DC_TIMEOUT1 parameter [7:0] int_HCM6_DC_TIMEOUT1 = `HCM6_DC_TIMEOUT1; `endif          
`ifdef HCM6_DC_TIMEOUT2 parameter [7:0] int_HCM6_DC_TIMEOUT2 = `HCM6_DC_TIMEOUT2; `endif          
`ifdef HCM6_DC_TIMEOUT3 parameter [7:0] int_HCM6_DC_TIMEOUT3 = `HCM6_DC_TIMEOUT3; `endif          
`ifdef HCM6_DC_TIMEOUT4 parameter [7:0] int_HCM6_DC_TIMEOUT4 = `HCM6_DC_TIMEOUT4; `endif          
`ifdef HCM6_DC_TIMEOUT5 parameter [7:0] int_HCM6_DC_TIMEOUT5 = `HCM6_DC_TIMEOUT5; `endif          
`ifdef HCM6_DC_TIMEOUT6 parameter [7:0] int_HCM6_DC_TIMEOUT6 = `HCM6_DC_TIMEOUT6; `endif          
`ifdef HCM6_DC_TIMEOUT7 parameter [7:0] int_HCM6_DC_TIMEOUT7 = `HCM6_DC_TIMEOUT7; `endif          
`ifdef HCM6_DC_TIMEOUT8 parameter [7:0] int_HCM6_DC_TIMEOUT8 = `HCM6_DC_TIMEOUT8; `endif          

// HCM7 parameters                                                                                
`ifdef HCM7_SOA_TYPE 			parameter int_HCM7_SOA_TYPE	= `HCM7_SOA_TYPE; `endif                    
`ifdef HCM7_HVIMON 				parameter int_HCM7_HVIMON = 	`HCM7_HVIMON; `endif                      
`ifdef HCM7_VMON_PHASE 		parameter [3:0] int_HCM7_VMON_PHASE = `HCM7_VMON_PHASE;    `endif       
`ifdef HCM7_FAST_SHUTDOWN parameter [1:0] int_HCM7_FAST_SHUTDOWN = `HCM7_FAST_SHUTDOWN; `endif    
                                                                                                  
`ifdef HCM7_TRESHOLD1 parameter [3:0] int_HCM7_TRESHOLD1 = `HCM7_TRESHOLD1;	`endif                
`ifdef HCM7_TRESHOLD2 parameter [3:0] int_HCM7_TRESHOLD2 = `HCM7_TRESHOLD2; `endif                
`ifdef HCM7_TRESHOLD3 parameter [3:0] int_HCM7_TRESHOLD3 = `HCM7_TRESHOLD3; `endif                
`ifdef HCM7_TRESHOLD4 parameter [3:0] int_HCM7_TRESHOLD4 = `HCM7_TRESHOLD4; `endif                
`ifdef HCM7_TRESHOLD5 parameter [3:0] int_HCM7_TRESHOLD5 = `HCM7_TRESHOLD5; `endif                
`ifdef HCM7_TRESHOLD6 parameter [3:0] int_HCM7_TRESHOLD6 = `HCM7_TRESHOLD6; `endif                
`ifdef HCM7_TRESHOLD7 parameter [3:0] int_HCM7_TRESHOLD7 = `HCM7_TRESHOLD7; `endif                
`ifdef HCM7_TRESHOLD8 parameter [3:0] int_HCM7_TRESHOLD8 = `HCM7_TRESHOLD8; `endif                
                                                                                                  
`ifdef HCM7_LOOP_MAX1 parameter [3:0] int_HCM7_LOOP_MAX1 = `HCM7_LOOP_MAX1;	`endif                
`ifdef HCM7_LOOP_MAX2 parameter [3:0] int_HCM7_LOOP_MAX2 = `HCM7_LOOP_MAX2; `endif                
`ifdef HCM7_LOOP_MAX3 parameter [3:0] int_HCM7_LOOP_MAX3 = `HCM7_LOOP_MAX3; `endif                
`ifdef HCM7_LOOP_MAX4 parameter [3:0] int_HCM7_LOOP_MAX4 = `HCM7_LOOP_MAX4; `endif                
`ifdef HCM7_LOOP_MAX5 parameter [3:0] int_HCM7_LOOP_MAX5 = `HCM7_LOOP_MAX5; `endif                
`ifdef HCM7_LOOP_MAX6 parameter [3:0] int_HCM7_LOOP_MAX6 = `HCM7_LOOP_MAX6; `endif                
`ifdef HCM7_LOOP_MAX7 parameter [3:0] int_HCM7_LOOP_MAX7 = `HCM7_LOOP_MAX7; `endif                
`ifdef HCM7_LOOP_MAX8 parameter [3:0] int_HCM7_LOOP_MAX8 = `HCM7_LOOP_MAX8; `endif                
`ifdef HCM7_COOLDOWN  parameter [7:0] int_HCM7_COOLDOWN  = `HCM7_COOLDOWN ;	`endif	              
                                                                                                  
`ifdef HCM7_DC_TIMEOUT1 parameter [7:0] int_HCM7_DC_TIMEOUT1 = `HCM7_DC_TIMEOUT1; `endif          
`ifdef HCM7_DC_TIMEOUT2 parameter [7:0] int_HCM7_DC_TIMEOUT2 = `HCM7_DC_TIMEOUT2; `endif          
`ifdef HCM7_DC_TIMEOUT3 parameter [7:0] int_HCM7_DC_TIMEOUT3 = `HCM7_DC_TIMEOUT3; `endif          
`ifdef HCM7_DC_TIMEOUT4 parameter [7:0] int_HCM7_DC_TIMEOUT4 = `HCM7_DC_TIMEOUT4; `endif          
`ifdef HCM7_DC_TIMEOUT5 parameter [7:0] int_HCM7_DC_TIMEOUT5 = `HCM7_DC_TIMEOUT5; `endif          
`ifdef HCM7_DC_TIMEOUT6 parameter [7:0] int_HCM7_DC_TIMEOUT6 = `HCM7_DC_TIMEOUT6; `endif          
`ifdef HCM7_DC_TIMEOUT7 parameter [7:0] int_HCM7_DC_TIMEOUT7 = `HCM7_DC_TIMEOUT7; `endif          
`ifdef HCM7_DC_TIMEOUT8 parameter [7:0] int_HCM7_DC_TIMEOUT8 = `HCM7_DC_TIMEOUT8; `endif          
    
// HCM8 parameters                                                                                
`ifdef HCM8_SOA_TYPE 			parameter int_HCM8_SOA_TYPE	= `HCM8_SOA_TYPE; `endif                    
`ifdef HCM8_HVIMON 				parameter int_HCM8_HVIMON = 	`HCM8_HVIMON; `endif                      
`ifdef HCM8_VMON_PHASE 		parameter [3:0] int_HCM8_VMON_PHASE = `HCM8_VMON_PHASE;    `endif       
`ifdef HCM8_FAST_SHUTDOWN parameter [1:0] int_HCM8_FAST_SHUTDOWN = `HCM8_FAST_SHUTDOWN; `endif    
                                                                                                  
`ifdef HCM8_TRESHOLD1 parameter [3:0] int_HCM8_TRESHOLD1 = `HCM8_TRESHOLD1;	`endif                
`ifdef HCM8_TRESHOLD2 parameter [3:0] int_HCM8_TRESHOLD2 = `HCM8_TRESHOLD2; `endif                
`ifdef HCM8_TRESHOLD3 parameter [3:0] int_HCM8_TRESHOLD3 = `HCM8_TRESHOLD3; `endif                
`ifdef HCM8_TRESHOLD4 parameter [3:0] int_HCM8_TRESHOLD4 = `HCM8_TRESHOLD4; `endif                
`ifdef HCM8_TRESHOLD5 parameter [3:0] int_HCM8_TRESHOLD5 = `HCM8_TRESHOLD5; `endif                
`ifdef HCM8_TRESHOLD6 parameter [3:0] int_HCM8_TRESHOLD6 = `HCM8_TRESHOLD6; `endif                
`ifdef HCM8_TRESHOLD7 parameter [3:0] int_HCM8_TRESHOLD7 = `HCM8_TRESHOLD7; `endif                
`ifdef HCM8_TRESHOLD8 parameter [3:0] int_HCM8_TRESHOLD8 = `HCM8_TRESHOLD8; `endif                
                                                                                                  
`ifdef HCM8_LOOP_MAX1 parameter [3:0] int_HCM8_LOOP_MAX1 = `HCM8_LOOP_MAX1;	`endif                
`ifdef HCM8_LOOP_MAX2 parameter [3:0] int_HCM8_LOOP_MAX2 = `HCM8_LOOP_MAX2; `endif                
`ifdef HCM8_LOOP_MAX3 parameter [3:0] int_HCM8_LOOP_MAX3 = `HCM8_LOOP_MAX3; `endif                
`ifdef HCM8_LOOP_MAX4 parameter [3:0] int_HCM8_LOOP_MAX4 = `HCM8_LOOP_MAX4; `endif                
`ifdef HCM8_LOOP_MAX5 parameter [3:0] int_HCM8_LOOP_MAX5 = `HCM8_LOOP_MAX5; `endif                
`ifdef HCM8_LOOP_MAX6 parameter [3:0] int_HCM8_LOOP_MAX6 = `HCM8_LOOP_MAX6; `endif                
`ifdef HCM8_LOOP_MAX7 parameter [3:0] int_HCM8_LOOP_MAX7 = `HCM8_LOOP_MAX7; `endif                
`ifdef HCM8_LOOP_MAX8 parameter [3:0] int_HCM8_LOOP_MAX8 = `HCM8_LOOP_MAX8; `endif                
`ifdef HCM8_COOLDOWN  parameter [7:0] int_HCM8_COOLDOWN  = `HCM8_COOLDOWN ;	`endif	              
                                                                                                  
`ifdef HCM8_DC_TIMEOUT1 parameter [7:0] int_HCM8_DC_TIMEOUT1 = `HCM8_DC_TIMEOUT1; `endif          
`ifdef HCM8_DC_TIMEOUT2 parameter [7:0] int_HCM8_DC_TIMEOUT2 = `HCM8_DC_TIMEOUT2; `endif          
`ifdef HCM8_DC_TIMEOUT3 parameter [7:0] int_HCM8_DC_TIMEOUT3 = `HCM8_DC_TIMEOUT3; `endif          
`ifdef HCM8_DC_TIMEOUT4 parameter [7:0] int_HCM8_DC_TIMEOUT4 = `HCM8_DC_TIMEOUT4; `endif          
`ifdef HCM8_DC_TIMEOUT5 parameter [7:0] int_HCM8_DC_TIMEOUT5 = `HCM8_DC_TIMEOUT5; `endif          
`ifdef HCM8_DC_TIMEOUT6 parameter [7:0] int_HCM8_DC_TIMEOUT6 = `HCM8_DC_TIMEOUT6; `endif          
`ifdef HCM8_DC_TIMEOUT7 parameter [7:0] int_HCM8_DC_TIMEOUT7 = `HCM8_DC_TIMEOUT7; `endif          
`ifdef HCM8_DC_TIMEOUT8 parameter [7:0] int_HCM8_DC_TIMEOUT8 = `HCM8_DC_TIMEOUT8; `endif          
    
// HCM9 parameters                                                                                   
`ifdef HCM9_SOA_TYPE 			parameter int_HCM9_SOA_TYPE	= `HCM9_SOA_TYPE; `endif                       
`ifdef HCM9_HVIMON 				parameter int_HCM9_HVIMON = 	`HCM9_HVIMON; `endif                         
`ifdef HCM9_VMON_PHASE 		parameter [3:0] int_HCM9_VMON_PHASE = `HCM9_VMON_PHASE;    `endif          
`ifdef HCM9_FAST_SHUTDOWN parameter [1:0] int_HCM9_FAST_SHUTDOWN = `HCM9_FAST_SHUTDOWN; `endif       
                                                                                                     
`ifdef HCM9_TRESHOLD1 parameter [3:0] int_HCM9_TRESHOLD1 = `HCM9_TRESHOLD1;	`endif                   
`ifdef HCM9_TRESHOLD2 parameter [3:0] int_HCM9_TRESHOLD2 = `HCM9_TRESHOLD2; `endif                   
`ifdef HCM9_TRESHOLD3 parameter [3:0] int_HCM9_TRESHOLD3 = `HCM9_TRESHOLD3; `endif                   
`ifdef HCM9_TRESHOLD4 parameter [3:0] int_HCM9_TRESHOLD4 = `HCM9_TRESHOLD4; `endif                   
`ifdef HCM9_TRESHOLD5 parameter [3:0] int_HCM9_TRESHOLD5 = `HCM9_TRESHOLD5; `endif                   
`ifdef HCM9_TRESHOLD6 parameter [3:0] int_HCM9_TRESHOLD6 = `HCM9_TRESHOLD6; `endif                   
`ifdef HCM9_TRESHOLD7 parameter [3:0] int_HCM9_TRESHOLD7 = `HCM9_TRESHOLD7; `endif                   
`ifdef HCM9_TRESHOLD8 parameter [3:0] int_HCM9_TRESHOLD8 = `HCM9_TRESHOLD8; `endif                   
                                                                                                     
`ifdef HCM9_LOOP_MAX1 parameter [3:0] int_HCM9_LOOP_MAX1 = `HCM9_LOOP_MAX1;	`endif                   
`ifdef HCM9_LOOP_MAX2 parameter [3:0] int_HCM9_LOOP_MAX2 = `HCM9_LOOP_MAX2; `endif                   
`ifdef HCM9_LOOP_MAX3 parameter [3:0] int_HCM9_LOOP_MAX3 = `HCM9_LOOP_MAX3; `endif                   
`ifdef HCM9_LOOP_MAX4 parameter [3:0] int_HCM9_LOOP_MAX4 = `HCM9_LOOP_MAX4; `endif                   
`ifdef HCM9_LOOP_MAX5 parameter [3:0] int_HCM9_LOOP_MAX5 = `HCM9_LOOP_MAX5; `endif                   
`ifdef HCM9_LOOP_MAX6 parameter [3:0] int_HCM9_LOOP_MAX6 = `HCM9_LOOP_MAX6; `endif                   
`ifdef HCM9_LOOP_MAX7 parameter [3:0] int_HCM9_LOOP_MAX7 = `HCM9_LOOP_MAX7; `endif                   
`ifdef HCM9_LOOP_MAX8 parameter [3:0] int_HCM9_LOOP_MAX8 = `HCM9_LOOP_MAX8; `endif                   
`ifdef HCM9_COOLDOWN  parameter [7:0] int_HCM9_COOLDOWN  = `HCM9_COOLDOWN ;	`endif	                 
                                                                                                     
`ifdef HCM9_DC_TIMEOUT1 parameter [7:0] int_HCM9_DC_TIMEOUT1 = `HCM9_DC_TIMEOUT1; `endif             
`ifdef HCM9_DC_TIMEOUT2 parameter [7:0] int_HCM9_DC_TIMEOUT2 = `HCM9_DC_TIMEOUT2; `endif             
`ifdef HCM9_DC_TIMEOUT3 parameter [7:0] int_HCM9_DC_TIMEOUT3 = `HCM9_DC_TIMEOUT3; `endif             
`ifdef HCM9_DC_TIMEOUT4 parameter [7:0] int_HCM9_DC_TIMEOUT4 = `HCM9_DC_TIMEOUT4; `endif             
`ifdef HCM9_DC_TIMEOUT5 parameter [7:0] int_HCM9_DC_TIMEOUT5 = `HCM9_DC_TIMEOUT5; `endif             
`ifdef HCM9_DC_TIMEOUT6 parameter [7:0] int_HCM9_DC_TIMEOUT6 = `HCM9_DC_TIMEOUT6; `endif             
`ifdef HCM9_DC_TIMEOUT7 parameter [7:0] int_HCM9_DC_TIMEOUT7 = `HCM9_DC_TIMEOUT7; `endif             
`ifdef HCM9_DC_TIMEOUT8 parameter [7:0] int_HCM9_DC_TIMEOUT8 = `HCM9_DC_TIMEOUT8; `endif   
          
// HCM10 parameters                                                                                   
`ifdef HCM10_SOA_TYPE 			parameter int_HCM10_SOA_TYPE	= `HCM10_SOA_TYPE; `endif                       
`ifdef HCM10_HVIMON 				parameter int_HCM10_HVIMON    = `HCM10_HVIMON; `endif                         
`ifdef HCM10_VMON_PHASE 		parameter [3:0] int_HCM10_VMON_PHASE    = `HCM10_VMON_PHASE;    `endif          
`ifdef HCM10_FAST_SHUTDOWN  parameter [1:0] int_HCM10_FAST_SHUTDOWN = `HCM10_FAST_SHUTDOWN; `endif       
                                                                                                     
`ifdef HCM10_TRESHOLD1 parameter [3:0] int_HCM10_TRESHOLD1 = `HCM10_TRESHOLD1;	`endif                   
`ifdef HCM10_TRESHOLD2 parameter [3:0] int_HCM10_TRESHOLD2 = `HCM10_TRESHOLD2; `endif                   
`ifdef HCM10_TRESHOLD3 parameter [3:0] int_HCM10_TRESHOLD3 = `HCM10_TRESHOLD3; `endif                   
`ifdef HCM10_TRESHOLD4 parameter [3:0] int_HCM10_TRESHOLD4 = `HCM10_TRESHOLD4; `endif                   
`ifdef HCM10_TRESHOLD5 parameter [3:0] int_HCM10_TRESHOLD5 = `HCM10_TRESHOLD5; `endif                   
`ifdef HCM10_TRESHOLD6 parameter [3:0] int_HCM10_TRESHOLD6 = `HCM10_TRESHOLD6; `endif                   
`ifdef HCM10_TRESHOLD7 parameter [3:0] int_HCM10_TRESHOLD7 = `HCM10_TRESHOLD7; `endif                   
`ifdef HCM10_TRESHOLD8 parameter [3:0] int_HCM10_TRESHOLD8 = `HCM10_TRESHOLD8; `endif                   
                                                                                                     
`ifdef HCM10_LOOP_MAX1 parameter [3:0] int_HCM10_LOOP_MAX1 = `HCM10_LOOP_MAX1;	`endif                   
`ifdef HCM10_LOOP_MAX2 parameter [3:0] int_HCM10_LOOP_MAX2 = `HCM10_LOOP_MAX2; `endif                   
`ifdef HCM10_LOOP_MAX3 parameter [3:0] int_HCM10_LOOP_MAX3 = `HCM10_LOOP_MAX3; `endif                   
`ifdef HCM10_LOOP_MAX4 parameter [3:0] int_HCM10_LOOP_MAX4 = `HCM10_LOOP_MAX4; `endif                   
`ifdef HCM10_LOOP_MAX5 parameter [3:0] int_HCM10_LOOP_MAX5 = `HCM10_LOOP_MAX5; `endif                   
`ifdef HCM10_LOOP_MAX6 parameter [3:0] int_HCM10_LOOP_MAX6 = `HCM10_LOOP_MAX6; `endif                   
`ifdef HCM10_LOOP_MAX7 parameter [3:0] int_HCM10_LOOP_MAX7 = `HCM10_LOOP_MAX7; `endif                   
`ifdef HCM10_LOOP_MAX8 parameter [3:0] int_HCM10_LOOP_MAX8 = `HCM10_LOOP_MAX8; `endif                   
`ifdef HCM10_COOLDOWN  parameter [7:0] int_HCM10_COOLDOWN  = `HCM10_COOLDOWN ;	`endif	                 
                                                                                                     
`ifdef HCM10_DC_TIMEOUT1 parameter [7:0] int_HCM10_DC_TIMEOUT1 = `HCM10_DC_TIMEOUT1; `endif             
`ifdef HCM10_DC_TIMEOUT2 parameter [7:0] int_HCM10_DC_TIMEOUT2 = `HCM10_DC_TIMEOUT2; `endif             
`ifdef HCM10_DC_TIMEOUT3 parameter [7:0] int_HCM10_DC_TIMEOUT3 = `HCM10_DC_TIMEOUT3; `endif             
`ifdef HCM10_DC_TIMEOUT4 parameter [7:0] int_HCM10_DC_TIMEOUT4 = `HCM10_DC_TIMEOUT4; `endif             
`ifdef HCM10_DC_TIMEOUT5 parameter [7:0] int_HCM10_DC_TIMEOUT5 = `HCM10_DC_TIMEOUT5; `endif             
`ifdef HCM10_DC_TIMEOUT6 parameter [7:0] int_HCM10_DC_TIMEOUT6 = `HCM10_DC_TIMEOUT6; `endif             
`ifdef HCM10_DC_TIMEOUT7 parameter [7:0] int_HCM10_DC_TIMEOUT7 = `HCM10_DC_TIMEOUT7; `endif             
`ifdef HCM10_DC_TIMEOUT8 parameter [7:0] int_HCM10_DC_TIMEOUT8 = `HCM10_DC_TIMEOUT8; `endif      

// HCM11 parameters                                                                                          
`ifdef HCM11_SOA_TYPE 			parameter int_HCM11_SOA_TYPE	= `HCM11_SOA_TYPE; `endif                          
`ifdef HCM11_HVIMON 				parameter int_HCM11_HVIMON    = `HCM11_HVIMON; `endif                            
`ifdef HCM11_VMON_PHASE 		parameter [3:0] int_HCM11_VMON_PHASE    = `HCM11_VMON_PHASE;    `endif           
`ifdef HCM11_FAST_SHUTDOWN  parameter [1:0] int_HCM11_FAST_SHUTDOWN = `HCM11_FAST_SHUTDOWN; `endif           
                                                                                                             
`ifdef HCM11_TRESHOLD1 parameter [3:0] int_HCM11_TRESHOLD1 = `HCM11_TRESHOLD1;	`endif                       
`ifdef HCM11_TRESHOLD2 parameter [3:0] int_HCM11_TRESHOLD2 = `HCM11_TRESHOLD2; `endif                        
`ifdef HCM11_TRESHOLD3 parameter [3:0] int_HCM11_TRESHOLD3 = `HCM11_TRESHOLD3; `endif                        
`ifdef HCM11_TRESHOLD4 parameter [3:0] int_HCM11_TRESHOLD4 = `HCM11_TRESHOLD4; `endif                        
`ifdef HCM11_TRESHOLD5 parameter [3:0] int_HCM11_TRESHOLD5 = `HCM11_TRESHOLD5; `endif                        
`ifdef HCM11_TRESHOLD6 parameter [3:0] int_HCM11_TRESHOLD6 = `HCM11_TRESHOLD6; `endif                        
`ifdef HCM11_TRESHOLD7 parameter [3:0] int_HCM11_TRESHOLD7 = `HCM11_TRESHOLD7; `endif                        
`ifdef HCM11_TRESHOLD8 parameter [3:0] int_HCM11_TRESHOLD8 = `HCM11_TRESHOLD8; `endif                        
                                                                                                             
`ifdef HCM11_LOOP_MAX1 parameter [3:0] int_HCM11_LOOP_MAX1 = `HCM11_LOOP_MAX1;	`endif                       
`ifdef HCM11_LOOP_MAX2 parameter [3:0] int_HCM11_LOOP_MAX2 = `HCM11_LOOP_MAX2; `endif                        
`ifdef HCM11_LOOP_MAX3 parameter [3:0] int_HCM11_LOOP_MAX3 = `HCM11_LOOP_MAX3; `endif                        
`ifdef HCM11_LOOP_MAX4 parameter [3:0] int_HCM11_LOOP_MAX4 = `HCM11_LOOP_MAX4; `endif                        
`ifdef HCM11_LOOP_MAX5 parameter [3:0] int_HCM11_LOOP_MAX5 = `HCM11_LOOP_MAX5; `endif                        
`ifdef HCM11_LOOP_MAX6 parameter [3:0] int_HCM11_LOOP_MAX6 = `HCM11_LOOP_MAX6; `endif                        
`ifdef HCM11_LOOP_MAX7 parameter [3:0] int_HCM11_LOOP_MAX7 = `HCM11_LOOP_MAX7; `endif                        
`ifdef HCM11_LOOP_MAX8 parameter [3:0] int_HCM11_LOOP_MAX8 = `HCM11_LOOP_MAX8; `endif                        
`ifdef HCM11_COOLDOWN  parameter [7:0] int_HCM11_COOLDOWN  = `HCM11_COOLDOWN ;	`endif	                     
                                                                                                             
`ifdef HCM11_DC_TIMEOUT1 parameter [7:0] int_HCM11_DC_TIMEOUT1 = `HCM11_DC_TIMEOUT1; `endif                  
`ifdef HCM11_DC_TIMEOUT2 parameter [7:0] int_HCM11_DC_TIMEOUT2 = `HCM11_DC_TIMEOUT2; `endif                  
`ifdef HCM11_DC_TIMEOUT3 parameter [7:0] int_HCM11_DC_TIMEOUT3 = `HCM11_DC_TIMEOUT3; `endif                  
`ifdef HCM11_DC_TIMEOUT4 parameter [7:0] int_HCM11_DC_TIMEOUT4 = `HCM11_DC_TIMEOUT4; `endif                  
`ifdef HCM11_DC_TIMEOUT5 parameter [7:0] int_HCM11_DC_TIMEOUT5 = `HCM11_DC_TIMEOUT5; `endif                  
`ifdef HCM11_DC_TIMEOUT6 parameter [7:0] int_HCM11_DC_TIMEOUT6 = `HCM11_DC_TIMEOUT6; `endif                  
`ifdef HCM11_DC_TIMEOUT7 parameter [7:0] int_HCM11_DC_TIMEOUT7 = `HCM11_DC_TIMEOUT7; `endif                  
`ifdef HCM11_DC_TIMEOUT8 parameter [7:0] int_HCM11_DC_TIMEOUT8 = `HCM11_DC_TIMEOUT8; `endif       

// HCM12 parameters                                                                                          
`ifdef HCM12_SOA_TYPE 			parameter int_HCM12_SOA_TYPE	= `HCM12_SOA_TYPE; `endif                          
`ifdef HCM12_HVIMON 				parameter int_HCM12_HVIMON    = `HCM12_HVIMON; `endif                            
`ifdef HCM12_VMON_PHASE 		parameter [3:0] int_HCM12_VMON_PHASE    = `HCM12_VMON_PHASE;    `endif           
`ifdef HCM12_FAST_SHUTDOWN  parameter [1:0] int_HCM12_FAST_SHUTDOWN = `HCM12_FAST_SHUTDOWN; `endif           
                                                                                                             
`ifdef HCM12_TRESHOLD1 parameter [3:0] int_HCM12_TRESHOLD1 = `HCM12_TRESHOLD1;	`endif                       
`ifdef HCM12_TRESHOLD2 parameter [3:0] int_HCM12_TRESHOLD2 = `HCM12_TRESHOLD2; `endif                        
`ifdef HCM12_TRESHOLD3 parameter [3:0] int_HCM12_TRESHOLD3 = `HCM12_TRESHOLD3; `endif                        
`ifdef HCM12_TRESHOLD4 parameter [3:0] int_HCM12_TRESHOLD4 = `HCM12_TRESHOLD4; `endif                        
`ifdef HCM12_TRESHOLD5 parameter [3:0] int_HCM12_TRESHOLD5 = `HCM12_TRESHOLD5; `endif                        
`ifdef HCM12_TRESHOLD6 parameter [3:0] int_HCM12_TRESHOLD6 = `HCM12_TRESHOLD6; `endif                        
`ifdef HCM12_TRESHOLD7 parameter [3:0] int_HCM12_TRESHOLD7 = `HCM12_TRESHOLD7; `endif                        
`ifdef HCM12_TRESHOLD8 parameter [3:0] int_HCM12_TRESHOLD8 = `HCM12_TRESHOLD8; `endif                        
                                                                                                             
`ifdef HCM12_LOOP_MAX1 parameter [3:0] int_HCM12_LOOP_MAX1 = `HCM12_LOOP_MAX1;	`endif                       
`ifdef HCM12_LOOP_MAX2 parameter [3:0] int_HCM12_LOOP_MAX2 = `HCM12_LOOP_MAX2; `endif                        
`ifdef HCM12_LOOP_MAX3 parameter [3:0] int_HCM12_LOOP_MAX3 = `HCM12_LOOP_MAX3; `endif                        
`ifdef HCM12_LOOP_MAX4 parameter [3:0] int_HCM12_LOOP_MAX4 = `HCM12_LOOP_MAX4; `endif                        
`ifdef HCM12_LOOP_MAX5 parameter [3:0] int_HCM12_LOOP_MAX5 = `HCM12_LOOP_MAX5; `endif                        
`ifdef HCM12_LOOP_MAX6 parameter [3:0] int_HCM12_LOOP_MAX6 = `HCM12_LOOP_MAX6; `endif                        
`ifdef HCM12_LOOP_MAX7 parameter [3:0] int_HCM12_LOOP_MAX7 = `HCM12_LOOP_MAX7; `endif                        
`ifdef HCM12_LOOP_MAX8 parameter [3:0] int_HCM12_LOOP_MAX8 = `HCM12_LOOP_MAX8; `endif                        
`ifdef HCM12_COOLDOWN  parameter [7:0] int_HCM12_COOLDOWN  = `HCM12_COOLDOWN ;	`endif	                     
                                                                                                           
`ifdef HCM12_DC_TIMEOUT1 parameter [7:0] int_HCM12_DC_TIMEOUT1 = `HCM12_DC_TIMEOUT1; `endif                  
`ifdef HCM12_DC_TIMEOUT2 parameter [7:0] int_HCM12_DC_TIMEOUT2 = `HCM12_DC_TIMEOUT2; `endif                  
`ifdef HCM12_DC_TIMEOUT3 parameter [7:0] int_HCM12_DC_TIMEOUT3 = `HCM12_DC_TIMEOUT3; `endif                  
`ifdef HCM12_DC_TIMEOUT4 parameter [7:0] int_HCM12_DC_TIMEOUT4 = `HCM12_DC_TIMEOUT4; `endif                  
`ifdef HCM12_DC_TIMEOUT5 parameter [7:0] int_HCM12_DC_TIMEOUT5 = `HCM12_DC_TIMEOUT5; `endif                  
`ifdef HCM12_DC_TIMEOUT6 parameter [7:0] int_HCM12_DC_TIMEOUT6 = `HCM12_DC_TIMEOUT6; `endif                  
`ifdef HCM12_DC_TIMEOUT7 parameter [7:0] int_HCM12_DC_TIMEOUT7 = `HCM12_DC_TIMEOUT7; `endif                  
`ifdef HCM12_DC_TIMEOUT8 parameter [7:0] int_HCM12_DC_TIMEOUT8 = `HCM12_DC_TIMEOUT8; `endif                  
           
// HCM13 parameters                                                                                          
`ifdef HCM13_SOA_TYPE 			parameter int_HCM13_SOA_TYPE	= `HCM13_SOA_TYPE; `endif                          
`ifdef HCM13_HVIMON 				parameter int_HCM13_HVIMON    = `HCM13_HVIMON; `endif                            
`ifdef HCM13_VMON_PHASE 		parameter [3:0] int_HCM13_VMON_PHASE    = `HCM13_VMON_PHASE;    `endif           
`ifdef HCM13_FAST_SHUTDOWN  parameter [1:0] int_HCM13_FAST_SHUTDOWN = `HCM13_FAST_SHUTDOWN; `endif           
                                                                                                            
`ifdef HCM13_TRESHOLD1 parameter [3:0] int_HCM13_TRESHOLD1 = `HCM13_TRESHOLD1;	`endif                       
`ifdef HCM13_TRESHOLD2 parameter [3:0] int_HCM13_TRESHOLD2 = `HCM13_TRESHOLD2; `endif                        
`ifdef HCM13_TRESHOLD3 parameter [3:0] int_HCM13_TRESHOLD3 = `HCM13_TRESHOLD3; `endif                        
`ifdef HCM13_TRESHOLD4 parameter [3:0] int_HCM13_TRESHOLD4 = `HCM13_TRESHOLD4; `endif                        
`ifdef HCM13_TRESHOLD5 parameter [3:0] int_HCM13_TRESHOLD5 = `HCM13_TRESHOLD5; `endif                        
`ifdef HCM13_TRESHOLD6 parameter [3:0] int_HCM13_TRESHOLD6 = `HCM13_TRESHOLD6; `endif                        
`ifdef HCM13_TRESHOLD7 parameter [3:0] int_HCM13_TRESHOLD7 = `HCM13_TRESHOLD7; `endif                        
`ifdef HCM13_TRESHOLD8 parameter [3:0] int_HCM13_TRESHOLD8 = `HCM13_TRESHOLD8; `endif                        
                                                                                                          
`ifdef HCM13_LOOP_MAX1 parameter [3:0] int_HCM13_LOOP_MAX1 = `HCM13_LOOP_MAX1;	`endif                       
`ifdef HCM13_LOOP_MAX2 parameter [3:0] int_HCM13_LOOP_MAX2 = `HCM13_LOOP_MAX2; `endif                        
`ifdef HCM13_LOOP_MAX3 parameter [3:0] int_HCM13_LOOP_MAX3 = `HCM13_LOOP_MAX3; `endif                        
`ifdef HCM13_LOOP_MAX4 parameter [3:0] int_HCM13_LOOP_MAX4 = `HCM13_LOOP_MAX4; `endif                        
`ifdef HCM13_LOOP_MAX5 parameter [3:0] int_HCM13_LOOP_MAX5 = `HCM13_LOOP_MAX5; `endif                        
`ifdef HCM13_LOOP_MAX6 parameter [3:0] int_HCM13_LOOP_MAX6 = `HCM13_LOOP_MAX6; `endif                        
`ifdef HCM13_LOOP_MAX7 parameter [3:0] int_HCM13_LOOP_MAX7 = `HCM13_LOOP_MAX7; `endif                        
`ifdef HCM13_LOOP_MAX8 parameter [3:0] int_HCM13_LOOP_MAX8 = `HCM13_LOOP_MAX8; `endif                        
`ifdef HCM13_COOLDOWN  parameter [7:0] int_HCM13_COOLDOWN  = `HCM13_COOLDOWN ;	`endif	                     
                                                                                                            
`ifdef HCM13_DC_TIMEOUT1 parameter [7:0] int_HCM13_DC_TIMEOUT1 = `HCM13_DC_TIMEOUT1; `endif                  
`ifdef HCM13_DC_TIMEOUT2 parameter [7:0] int_HCM13_DC_TIMEOUT2 = `HCM13_DC_TIMEOUT2; `endif                  
`ifdef HCM13_DC_TIMEOUT3 parameter [7:0] int_HCM13_DC_TIMEOUT3 = `HCM13_DC_TIMEOUT3; `endif                  
`ifdef HCM13_DC_TIMEOUT4 parameter [7:0] int_HCM13_DC_TIMEOUT4 = `HCM13_DC_TIMEOUT4; `endif                  
`ifdef HCM13_DC_TIMEOUT5 parameter [7:0] int_HCM13_DC_TIMEOUT5 = `HCM13_DC_TIMEOUT5; `endif                  
`ifdef HCM13_DC_TIMEOUT6 parameter [7:0] int_HCM13_DC_TIMEOUT6 = `HCM13_DC_TIMEOUT6; `endif                  
`ifdef HCM13_DC_TIMEOUT7 parameter [7:0] int_HCM13_DC_TIMEOUT7 = `HCM13_DC_TIMEOUT7; `endif                  
`ifdef HCM13_DC_TIMEOUT8 parameter [7:0] int_HCM13_DC_TIMEOUT8 = `HCM13_DC_TIMEOUT8; `endif      

// HCM14 parameters                                                                                          
`ifdef HCM14_SOA_TYPE 			parameter int_HCM14_SOA_TYPE	= `HCM14_SOA_TYPE; `endif                          
`ifdef HCM14_HVIMON 				parameter int_HCM14_HVIMON    = `HCM14_HVIMON; `endif                            
`ifdef HCM14_VMON_PHASE 		parameter [3:0] int_HCM14_VMON_PHASE    = `HCM14_VMON_PHASE;    `endif           
`ifdef HCM14_FAST_SHUTDOWN  parameter [1:0] int_HCM14_FAST_SHUTDOWN = `HCM14_FAST_SHUTDOWN; `endif           
                                                                                                            
`ifdef HCM14_TRESHOLD1 parameter [3:0] int_HCM14_TRESHOLD1 = `HCM14_TRESHOLD1;	`endif                       
`ifdef HCM14_TRESHOLD2 parameter [3:0] int_HCM14_TRESHOLD2 = `HCM14_TRESHOLD2; `endif                        
`ifdef HCM14_TRESHOLD3 parameter [3:0] int_HCM14_TRESHOLD3 = `HCM14_TRESHOLD3; `endif                        
`ifdef HCM14_TRESHOLD4 parameter [3:0] int_HCM14_TRESHOLD4 = `HCM14_TRESHOLD4; `endif                        
`ifdef HCM14_TRESHOLD5 parameter [3:0] int_HCM14_TRESHOLD5 = `HCM14_TRESHOLD5; `endif                        
`ifdef HCM14_TRESHOLD6 parameter [3:0] int_HCM14_TRESHOLD6 = `HCM14_TRESHOLD6; `endif                        
`ifdef HCM14_TRESHOLD7 parameter [3:0] int_HCM14_TRESHOLD7 = `HCM14_TRESHOLD7; `endif                        
`ifdef HCM14_TRESHOLD8 parameter [3:0] int_HCM14_TRESHOLD8 = `HCM14_TRESHOLD8; `endif                        
                                                                                                          
`ifdef HCM14_LOOP_MAX1 parameter [3:0] int_HCM14_LOOP_MAX1 = `HCM14_LOOP_MAX1;	`endif                       
`ifdef HCM14_LOOP_MAX2 parameter [3:0] int_HCM14_LOOP_MAX2 = `HCM14_LOOP_MAX2; `endif                        
`ifdef HCM14_LOOP_MAX3 parameter [3:0] int_HCM14_LOOP_MAX3 = `HCM14_LOOP_MAX3; `endif                        
`ifdef HCM14_LOOP_MAX4 parameter [3:0] int_HCM14_LOOP_MAX4 = `HCM14_LOOP_MAX4; `endif                        
`ifdef HCM14_LOOP_MAX5 parameter [3:0] int_HCM14_LOOP_MAX5 = `HCM14_LOOP_MAX5; `endif                        
`ifdef HCM14_LOOP_MAX6 parameter [3:0] int_HCM14_LOOP_MAX6 = `HCM14_LOOP_MAX6; `endif                        
`ifdef HCM14_LOOP_MAX7 parameter [3:0] int_HCM14_LOOP_MAX7 = `HCM14_LOOP_MAX7; `endif                        
`ifdef HCM14_LOOP_MAX8 parameter [3:0] int_HCM14_LOOP_MAX8 = `HCM14_LOOP_MAX8; `endif                        
`ifdef HCM14_COOLDOWN  parameter [7:0] int_HCM14_COOLDOWN  = `HCM14_COOLDOWN ;	`endif	                     
                                                                                                            
`ifdef HCM14_DC_TIMEOUT1 parameter [7:0] int_HCM14_DC_TIMEOUT1 = `HCM14_DC_TIMEOUT1; `endif                  
`ifdef HCM14_DC_TIMEOUT2 parameter [7:0] int_HCM14_DC_TIMEOUT2 = `HCM14_DC_TIMEOUT2; `endif                  
`ifdef HCM14_DC_TIMEOUT3 parameter [7:0] int_HCM14_DC_TIMEOUT3 = `HCM14_DC_TIMEOUT3; `endif                  
`ifdef HCM14_DC_TIMEOUT4 parameter [7:0] int_HCM14_DC_TIMEOUT4 = `HCM14_DC_TIMEOUT4; `endif                  
`ifdef HCM14_DC_TIMEOUT5 parameter [7:0] int_HCM14_DC_TIMEOUT5 = `HCM14_DC_TIMEOUT5; `endif                  
`ifdef HCM14_DC_TIMEOUT6 parameter [7:0] int_HCM14_DC_TIMEOUT6 = `HCM14_DC_TIMEOUT6; `endif                  
`ifdef HCM14_DC_TIMEOUT7 parameter [7:0] int_HCM14_DC_TIMEOUT7 = `HCM14_DC_TIMEOUT7; `endif                  
`ifdef HCM14_DC_TIMEOUT8 parameter [7:0] int_HCM14_DC_TIMEOUT8 = `HCM14_DC_TIMEOUT8; `endif   

// HCM15 parameters                                                                                          
`ifdef HCM15_SOA_TYPE 			parameter int_HCM15_SOA_TYPE	= `HCM15_SOA_TYPE; `endif                          
`ifdef HCM15_HVIMON 				parameter int_HCM15_HVIMON    = `HCM15_HVIMON; `endif                            
`ifdef HCM15_VMON_PHASE 		parameter [3:0] int_HCM15_VMON_PHASE    = `HCM15_VMON_PHASE;    `endif           
`ifdef HCM15_FAST_SHUTDOWN  parameter [1:0] int_HCM15_FAST_SHUTDOWN = `HCM15_FAST_SHUTDOWN; `endif           
                                                                                                            
`ifdef HCM15_TRESHOLD1 parameter [3:0] int_HCM15_TRESHOLD1 = `HCM15_TRESHOLD1;	`endif                       
`ifdef HCM15_TRESHOLD2 parameter [3:0] int_HCM15_TRESHOLD2 = `HCM15_TRESHOLD2; `endif                        
`ifdef HCM15_TRESHOLD3 parameter [3:0] int_HCM15_TRESHOLD3 = `HCM15_TRESHOLD3; `endif                        
`ifdef HCM15_TRESHOLD4 parameter [3:0] int_HCM15_TRESHOLD4 = `HCM15_TRESHOLD4; `endif                        
`ifdef HCM15_TRESHOLD5 parameter [3:0] int_HCM15_TRESHOLD5 = `HCM15_TRESHOLD5; `endif                        
`ifdef HCM15_TRESHOLD6 parameter [3:0] int_HCM15_TRESHOLD6 = `HCM15_TRESHOLD6; `endif                        
`ifdef HCM15_TRESHOLD7 parameter [3:0] int_HCM15_TRESHOLD7 = `HCM15_TRESHOLD7; `endif                        
`ifdef HCM15_TRESHOLD8 parameter [3:0] int_HCM15_TRESHOLD8 = `HCM15_TRESHOLD8; `endif                        
                                                                                                         
`ifdef HCM15_LOOP_MAX1 parameter [3:0] int_HCM15_LOOP_MAX1 = `HCM15_LOOP_MAX1;	`endif                       
`ifdef HCM15_LOOP_MAX2 parameter [3:0] int_HCM15_LOOP_MAX2 = `HCM15_LOOP_MAX2; `endif                        
`ifdef HCM15_LOOP_MAX3 parameter [3:0] int_HCM15_LOOP_MAX3 = `HCM15_LOOP_MAX3; `endif                        
`ifdef HCM15_LOOP_MAX4 parameter [3:0] int_HCM15_LOOP_MAX4 = `HCM15_LOOP_MAX4; `endif                        
`ifdef HCM15_LOOP_MAX5 parameter [3:0] int_HCM15_LOOP_MAX5 = `HCM15_LOOP_MAX5; `endif                        
`ifdef HCM15_LOOP_MAX6 parameter [3:0] int_HCM15_LOOP_MAX6 = `HCM15_LOOP_MAX6; `endif                        
`ifdef HCM15_LOOP_MAX7 parameter [3:0] int_HCM15_LOOP_MAX7 = `HCM15_LOOP_MAX7; `endif                        
`ifdef HCM15_LOOP_MAX8 parameter [3:0] int_HCM15_LOOP_MAX8 = `HCM15_LOOP_MAX8; `endif                        
`ifdef HCM15_COOLDOWN  parameter [7:0] int_HCM15_COOLDOWN  = `HCM15_COOLDOWN ;	`endif	                     
                                                                                                            
`ifdef HCM15_DC_TIMEOUT1 parameter [7:0] int_HCM15_DC_TIMEOUT1 = `HCM15_DC_TIMEOUT1; `endif                  
`ifdef HCM15_DC_TIMEOUT2 parameter [7:0] int_HCM15_DC_TIMEOUT2 = `HCM15_DC_TIMEOUT2; `endif                  
`ifdef HCM15_DC_TIMEOUT3 parameter [7:0] int_HCM15_DC_TIMEOUT3 = `HCM15_DC_TIMEOUT3; `endif                  
`ifdef HCM15_DC_TIMEOUT4 parameter [7:0] int_HCM15_DC_TIMEOUT4 = `HCM15_DC_TIMEOUT4; `endif                  
`ifdef HCM15_DC_TIMEOUT5 parameter [7:0] int_HCM15_DC_TIMEOUT5 = `HCM15_DC_TIMEOUT5; `endif                  
`ifdef HCM15_DC_TIMEOUT6 parameter [7:0] int_HCM15_DC_TIMEOUT6 = `HCM15_DC_TIMEOUT6; `endif                  
`ifdef HCM15_DC_TIMEOUT7 parameter [7:0] int_HCM15_DC_TIMEOUT7 = `HCM15_DC_TIMEOUT7; `endif                  
`ifdef HCM15_DC_TIMEOUT8 parameter [7:0] int_HCM15_DC_TIMEOUT8 = `HCM15_DC_TIMEOUT8; `endif        

// HCM16 parameters                                                                                          
`ifdef HCM16_SOA_TYPE 			parameter int_HCM16_SOA_TYPE	= `HCM16_SOA_TYPE; `endif                          
`ifdef HCM16_HVIMON 				parameter int_HCM16_HVIMON    = `HCM16_HVIMON; `endif                            
`ifdef HCM16_VMON_PHASE 		parameter [3:0] int_HCM16_VMON_PHASE    = `HCM16_VMON_PHASE;    `endif           
`ifdef HCM16_FAST_SHUTDOWN  parameter [1:0] int_HCM16_FAST_SHUTDOWN = `HCM16_FAST_SHUTDOWN; `endif           
                                                                                                            
`ifdef HCM16_TRESHOLD1 parameter [3:0] int_HCM16_TRESHOLD1 = `HCM16_TRESHOLD1;	`endif                       
`ifdef HCM16_TRESHOLD2 parameter [3:0] int_HCM16_TRESHOLD2 = `HCM16_TRESHOLD2; `endif                        
`ifdef HCM16_TRESHOLD3 parameter [3:0] int_HCM16_TRESHOLD3 = `HCM16_TRESHOLD3; `endif                        
`ifdef HCM16_TRESHOLD4 parameter [3:0] int_HCM16_TRESHOLD4 = `HCM16_TRESHOLD4; `endif                        
`ifdef HCM16_TRESHOLD5 parameter [3:0] int_HCM16_TRESHOLD5 = `HCM16_TRESHOLD5; `endif                        
`ifdef HCM16_TRESHOLD6 parameter [3:0] int_HCM16_TRESHOLD6 = `HCM16_TRESHOLD6; `endif                        
`ifdef HCM16_TRESHOLD7 parameter [3:0] int_HCM16_TRESHOLD7 = `HCM16_TRESHOLD7; `endif                        
`ifdef HCM16_TRESHOLD8 parameter [3:0] int_HCM16_TRESHOLD8 = `HCM16_TRESHOLD8; `endif                        
                                                                                                          
`ifdef HCM16_LOOP_MAX1 parameter [3:0] int_HCM16_LOOP_MAX1 = `HCM16_LOOP_MAX1;	`endif                       
`ifdef HCM16_LOOP_MAX2 parameter [3:0] int_HCM16_LOOP_MAX2 = `HCM16_LOOP_MAX2; `endif                        
`ifdef HCM16_LOOP_MAX3 parameter [3:0] int_HCM16_LOOP_MAX3 = `HCM16_LOOP_MAX3; `endif                        
`ifdef HCM16_LOOP_MAX4 parameter [3:0] int_HCM16_LOOP_MAX4 = `HCM16_LOOP_MAX4; `endif                        
`ifdef HCM16_LOOP_MAX5 parameter [3:0] int_HCM16_LOOP_MAX5 = `HCM16_LOOP_MAX5; `endif                        
`ifdef HCM16_LOOP_MAX6 parameter [3:0] int_HCM16_LOOP_MAX6 = `HCM16_LOOP_MAX6; `endif                        
`ifdef HCM16_LOOP_MAX7 parameter [3:0] int_HCM16_LOOP_MAX7 = `HCM16_LOOP_MAX7; `endif                        
`ifdef HCM16_LOOP_MAX8 parameter [3:0] int_HCM16_LOOP_MAX8 = `HCM16_LOOP_MAX8; `endif                        
`ifdef HCM16_COOLDOWN  parameter [7:0] int_HCM16_COOLDOWN  = `HCM16_COOLDOWN ;	`endif	                     
                                                                                                           
`ifdef HCM16_DC_TIMEOUT1 parameter [7:0] int_HCM16_DC_TIMEOUT1 = `HCM16_DC_TIMEOUT1; `endif                  
`ifdef HCM16_DC_TIMEOUT2 parameter [7:0] int_HCM16_DC_TIMEOUT2 = `HCM16_DC_TIMEOUT2; `endif                  
`ifdef HCM16_DC_TIMEOUT3 parameter [7:0] int_HCM16_DC_TIMEOUT3 = `HCM16_DC_TIMEOUT3; `endif                  
`ifdef HCM16_DC_TIMEOUT4 parameter [7:0] int_HCM16_DC_TIMEOUT4 = `HCM16_DC_TIMEOUT4; `endif                  
`ifdef HCM16_DC_TIMEOUT5 parameter [7:0] int_HCM16_DC_TIMEOUT5 = `HCM16_DC_TIMEOUT5; `endif                  
`ifdef HCM16_DC_TIMEOUT6 parameter [7:0] int_HCM16_DC_TIMEOUT6 = `HCM16_DC_TIMEOUT6; `endif                  
`ifdef HCM16_DC_TIMEOUT7 parameter [7:0] int_HCM16_DC_TIMEOUT7 = `HCM16_DC_TIMEOUT7; `endif                  
`ifdef HCM16_DC_TIMEOUT8 parameter [7:0] int_HCM16_DC_TIMEOUT8 = `HCM16_DC_TIMEOUT8; `endif         

// HCM17 parameters                                                                                          
`ifdef HCM17_SOA_TYPE 			parameter int_HCM17_SOA_TYPE	= `HCM17_SOA_TYPE; `endif                          
`ifdef HCM17_HVIMON 				parameter int_HCM17_HVIMON    = `HCM17_HVIMON; `endif                            
`ifdef HCM17_VMON_PHASE 		parameter [3:0] int_HCM17_VMON_PHASE    = `HCM17_VMON_PHASE;    `endif           
`ifdef HCM17_FAST_SHUTDOWN  parameter [1:0] int_HCM17_FAST_SHUTDOWN = `HCM17_FAST_SHUTDOWN; `endif           
                                                                                                           
`ifdef HCM17_TRESHOLD1 parameter [3:0] int_HCM17_TRESHOLD1 = `HCM17_TRESHOLD1;	`endif                       
`ifdef HCM17_TRESHOLD2 parameter [3:0] int_HCM17_TRESHOLD2 = `HCM17_TRESHOLD2; `endif                        
`ifdef HCM17_TRESHOLD3 parameter [3:0] int_HCM17_TRESHOLD3 = `HCM17_TRESHOLD3; `endif                        
`ifdef HCM17_TRESHOLD4 parameter [3:0] int_HCM17_TRESHOLD4 = `HCM17_TRESHOLD4; `endif                        
`ifdef HCM17_TRESHOLD5 parameter [3:0] int_HCM17_TRESHOLD5 = `HCM17_TRESHOLD5; `endif                        
`ifdef HCM17_TRESHOLD6 parameter [3:0] int_HCM17_TRESHOLD6 = `HCM17_TRESHOLD6; `endif                        
`ifdef HCM17_TRESHOLD7 parameter [3:0] int_HCM17_TRESHOLD7 = `HCM17_TRESHOLD7; `endif                        
`ifdef HCM17_TRESHOLD8 parameter [3:0] int_HCM17_TRESHOLD8 = `HCM17_TRESHOLD8; `endif                        
                                                                                                          
`ifdef HCM17_LOOP_MAX1 parameter [3:0] int_HCM17_LOOP_MAX1 = `HCM17_LOOP_MAX1;	`endif                       
`ifdef HCM17_LOOP_MAX2 parameter [3:0] int_HCM17_LOOP_MAX2 = `HCM17_LOOP_MAX2; `endif                        
`ifdef HCM17_LOOP_MAX3 parameter [3:0] int_HCM17_LOOP_MAX3 = `HCM17_LOOP_MAX3; `endif                        
`ifdef HCM17_LOOP_MAX4 parameter [3:0] int_HCM17_LOOP_MAX4 = `HCM17_LOOP_MAX4; `endif                        
`ifdef HCM17_LOOP_MAX5 parameter [3:0] int_HCM17_LOOP_MAX5 = `HCM17_LOOP_MAX5; `endif                        
`ifdef HCM17_LOOP_MAX6 parameter [3:0] int_HCM17_LOOP_MAX6 = `HCM17_LOOP_MAX6; `endif                        
`ifdef HCM17_LOOP_MAX7 parameter [3:0] int_HCM17_LOOP_MAX7 = `HCM17_LOOP_MAX7; `endif                        
`ifdef HCM17_LOOP_MAX8 parameter [3:0] int_HCM17_LOOP_MAX8 = `HCM17_LOOP_MAX8; `endif                        
`ifdef HCM17_COOLDOWN  parameter [7:0] int_HCM17_COOLDOWN  = `HCM17_COOLDOWN ;	`endif	                     
                                                                                                            
`ifdef HCM17_DC_TIMEOUT1 parameter [7:0] int_HCM17_DC_TIMEOUT1 = `HCM17_DC_TIMEOUT1; `endif                  
`ifdef HCM17_DC_TIMEOUT2 parameter [7:0] int_HCM17_DC_TIMEOUT2 = `HCM17_DC_TIMEOUT2; `endif                  
`ifdef HCM17_DC_TIMEOUT3 parameter [7:0] int_HCM17_DC_TIMEOUT3 = `HCM17_DC_TIMEOUT3; `endif                  
`ifdef HCM17_DC_TIMEOUT4 parameter [7:0] int_HCM17_DC_TIMEOUT4 = `HCM17_DC_TIMEOUT4; `endif                  
`ifdef HCM17_DC_TIMEOUT5 parameter [7:0] int_HCM17_DC_TIMEOUT5 = `HCM17_DC_TIMEOUT5; `endif                  
`ifdef HCM17_DC_TIMEOUT6 parameter [7:0] int_HCM17_DC_TIMEOUT6 = `HCM17_DC_TIMEOUT6; `endif                  
`ifdef HCM17_DC_TIMEOUT7 parameter [7:0] int_HCM17_DC_TIMEOUT7 = `HCM17_DC_TIMEOUT7; `endif                  
`ifdef HCM17_DC_TIMEOUT8 parameter [7:0] int_HCM17_DC_TIMEOUT8 = `HCM17_DC_TIMEOUT8; `endif            

// HCM18 parameters                                                                                          
`ifdef HCM18_SOA_TYPE 			parameter int_HCM18_SOA_TYPE	= `HCM18_SOA_TYPE; `endif                          
`ifdef HCM18_HVIMON 				parameter int_HCM18_HVIMON    = `HCM18_HVIMON; `endif                            
`ifdef HCM18_VMON_PHASE 		parameter [3:0] int_HCM18_VMON_PHASE    = `HCM18_VMON_PHASE;    `endif           
`ifdef HCM18_FAST_SHUTDOWN  parameter [1:0] int_HCM18_FAST_SHUTDOWN = `HCM18_FAST_SHUTDOWN; `endif           
                                                                                                            
`ifdef HCM18_TRESHOLD1 parameter [3:0] int_HCM18_TRESHOLD1 = `HCM18_TRESHOLD1;	`endif                       
`ifdef HCM18_TRESHOLD2 parameter [3:0] int_HCM18_TRESHOLD2 = `HCM18_TRESHOLD2; `endif                        
`ifdef HCM18_TRESHOLD3 parameter [3:0] int_HCM18_TRESHOLD3 = `HCM18_TRESHOLD3; `endif                        
`ifdef HCM18_TRESHOLD4 parameter [3:0] int_HCM18_TRESHOLD4 = `HCM18_TRESHOLD4; `endif                        
`ifdef HCM18_TRESHOLD5 parameter [3:0] int_HCM18_TRESHOLD5 = `HCM18_TRESHOLD5; `endif                        
`ifdef HCM18_TRESHOLD6 parameter [3:0] int_HCM18_TRESHOLD6 = `HCM18_TRESHOLD6; `endif                        
`ifdef HCM18_TRESHOLD7 parameter [3:0] int_HCM18_TRESHOLD7 = `HCM18_TRESHOLD7; `endif                        
`ifdef HCM18_TRESHOLD8 parameter [3:0] int_HCM18_TRESHOLD8 = `HCM18_TRESHOLD8; `endif                        
                                                                                                          
`ifdef HCM18_LOOP_MAX1 parameter [3:0] int_HCM18_LOOP_MAX1 = `HCM18_LOOP_MAX1;	`endif                       
`ifdef HCM18_LOOP_MAX2 parameter [3:0] int_HCM18_LOOP_MAX2 = `HCM18_LOOP_MAX2; `endif                        
`ifdef HCM18_LOOP_MAX3 parameter [3:0] int_HCM18_LOOP_MAX3 = `HCM18_LOOP_MAX3; `endif                        
`ifdef HCM18_LOOP_MAX4 parameter [3:0] int_HCM18_LOOP_MAX4 = `HCM18_LOOP_MAX4; `endif                        
`ifdef HCM18_LOOP_MAX5 parameter [3:0] int_HCM18_LOOP_MAX5 = `HCM18_LOOP_MAX5; `endif                        
`ifdef HCM18_LOOP_MAX6 parameter [3:0] int_HCM18_LOOP_MAX6 = `HCM18_LOOP_MAX6; `endif                        
`ifdef HCM18_LOOP_MAX7 parameter [3:0] int_HCM18_LOOP_MAX7 = `HCM18_LOOP_MAX7; `endif                        
`ifdef HCM18_LOOP_MAX8 parameter [3:0] int_HCM18_LOOP_MAX8 = `HCM18_LOOP_MAX8; `endif                        
`ifdef HCM18_COOLDOWN  parameter [7:0] int_HCM18_COOLDOWN  = `HCM18_COOLDOWN ;	`endif	                     
                                                                                                            
`ifdef HCM18_DC_TIMEOUT1 parameter [7:0] int_HCM18_DC_TIMEOUT1 = `HCM18_DC_TIMEOUT1; `endif                  
`ifdef HCM18_DC_TIMEOUT2 parameter [7:0] int_HCM18_DC_TIMEOUT2 = `HCM18_DC_TIMEOUT2; `endif                  
`ifdef HCM18_DC_TIMEOUT3 parameter [7:0] int_HCM18_DC_TIMEOUT3 = `HCM18_DC_TIMEOUT3; `endif                  
`ifdef HCM18_DC_TIMEOUT4 parameter [7:0] int_HCM18_DC_TIMEOUT4 = `HCM18_DC_TIMEOUT4; `endif                  
`ifdef HCM18_DC_TIMEOUT5 parameter [7:0] int_HCM18_DC_TIMEOUT5 = `HCM18_DC_TIMEOUT5; `endif                  
`ifdef HCM18_DC_TIMEOUT6 parameter [7:0] int_HCM18_DC_TIMEOUT6 = `HCM18_DC_TIMEOUT6; `endif                  
`ifdef HCM18_DC_TIMEOUT7 parameter [7:0] int_HCM18_DC_TIMEOUT7 = `HCM18_DC_TIMEOUT7; `endif                  
`ifdef HCM18_DC_TIMEOUT8 parameter [7:0] int_HCM18_DC_TIMEOUT8 = `HCM18_DC_TIMEOUT8; `endif        

// HCM19 parameters                                                                                          
`ifdef HCM19_SOA_TYPE 			parameter int_HCM19_SOA_TYPE	= `HCM19_SOA_TYPE; `endif                          
`ifdef HCM19_HVIMON 				parameter int_HCM19_HVIMON    = `HCM19_HVIMON; `endif                            
`ifdef HCM19_VMON_PHASE 		parameter [3:0] int_HCM19_VMON_PHASE    = `HCM19_VMON_PHASE;    `endif           
`ifdef HCM19_FAST_SHUTDOWN  parameter [1:0] int_HCM19_FAST_SHUTDOWN = `HCM19_FAST_SHUTDOWN; `endif           
                                                                                                            
`ifdef HCM19_TRESHOLD1 parameter [3:0] int_HCM19_TRESHOLD1 = `HCM19_TRESHOLD1;	`endif                       
`ifdef HCM19_TRESHOLD2 parameter [3:0] int_HCM19_TRESHOLD2 = `HCM19_TRESHOLD2; `endif                        
`ifdef HCM19_TRESHOLD3 parameter [3:0] int_HCM19_TRESHOLD3 = `HCM19_TRESHOLD3; `endif                        
`ifdef HCM19_TRESHOLD4 parameter [3:0] int_HCM19_TRESHOLD4 = `HCM19_TRESHOLD4; `endif                        
`ifdef HCM19_TRESHOLD5 parameter [3:0] int_HCM19_TRESHOLD5 = `HCM19_TRESHOLD5; `endif                        
`ifdef HCM19_TRESHOLD6 parameter [3:0] int_HCM19_TRESHOLD6 = `HCM19_TRESHOLD6; `endif                        
`ifdef HCM19_TRESHOLD7 parameter [3:0] int_HCM19_TRESHOLD7 = `HCM19_TRESHOLD7; `endif                        
`ifdef HCM19_TRESHOLD8 parameter [3:0] int_HCM19_TRESHOLD8 = `HCM19_TRESHOLD8; `endif                        
                                                                                                         
`ifdef HCM19_LOOP_MAX1 parameter [3:0] int_HCM19_LOOP_MAX1 = `HCM19_LOOP_MAX1;	`endif                       
`ifdef HCM19_LOOP_MAX2 parameter [3:0] int_HCM19_LOOP_MAX2 = `HCM19_LOOP_MAX2; `endif                        
`ifdef HCM19_LOOP_MAX3 parameter [3:0] int_HCM19_LOOP_MAX3 = `HCM19_LOOP_MAX3; `endif                        
`ifdef HCM19_LOOP_MAX4 parameter [3:0] int_HCM19_LOOP_MAX4 = `HCM19_LOOP_MAX4; `endif                        
`ifdef HCM19_LOOP_MAX5 parameter [3:0] int_HCM19_LOOP_MAX5 = `HCM19_LOOP_MAX5; `endif                        
`ifdef HCM19_LOOP_MAX6 parameter [3:0] int_HCM19_LOOP_MAX6 = `HCM19_LOOP_MAX6; `endif                        
`ifdef HCM19_LOOP_MAX7 parameter [3:0] int_HCM19_LOOP_MAX7 = `HCM19_LOOP_MAX7; `endif                        
`ifdef HCM19_LOOP_MAX8 parameter [3:0] int_HCM19_LOOP_MAX8 = `HCM19_LOOP_MAX8; `endif                        
`ifdef HCM19_COOLDOWN  parameter [7:0] int_HCM19_COOLDOWN  = `HCM19_COOLDOWN ;	`endif	                     
                                                                                                            
`ifdef HCM19_DC_TIMEOUT1 parameter [7:0] int_HCM19_DC_TIMEOUT1 = `HCM19_DC_TIMEOUT1; `endif                  
`ifdef HCM19_DC_TIMEOUT2 parameter [7:0] int_HCM19_DC_TIMEOUT2 = `HCM19_DC_TIMEOUT2; `endif                  
`ifdef HCM19_DC_TIMEOUT3 parameter [7:0] int_HCM19_DC_TIMEOUT3 = `HCM19_DC_TIMEOUT3; `endif                  
`ifdef HCM19_DC_TIMEOUT4 parameter [7:0] int_HCM19_DC_TIMEOUT4 = `HCM19_DC_TIMEOUT4; `endif                  
`ifdef HCM19_DC_TIMEOUT5 parameter [7:0] int_HCM19_DC_TIMEOUT5 = `HCM19_DC_TIMEOUT5; `endif                  
`ifdef HCM19_DC_TIMEOUT6 parameter [7:0] int_HCM19_DC_TIMEOUT6 = `HCM19_DC_TIMEOUT6; `endif                  
`ifdef HCM19_DC_TIMEOUT7 parameter [7:0] int_HCM19_DC_TIMEOUT7 = `HCM19_DC_TIMEOUT7; `endif                  
`ifdef HCM19_DC_TIMEOUT8 parameter [7:0] int_HCM19_DC_TIMEOUT8 = `HCM19_DC_TIMEOUT8; `endif   

// HCM20 parameters                                                                                          
`ifdef HCM20_SOA_TYPE 			parameter int_HCM20_SOA_TYPE	= `HCM20_SOA_TYPE; `endif                          
`ifdef HCM20_HVIMON 				parameter int_HCM20_HVIMON    = `HCM20_HVIMON; `endif                            
`ifdef HCM20_VMON_PHASE 		parameter [3:0] int_HCM20_VMON_PHASE    = `HCM20_VMON_PHASE;    `endif           
`ifdef HCM20_FAST_SHUTDOWN  parameter [1:0] int_HCM20_FAST_SHUTDOWN = `HCM20_FAST_SHUTDOWN; `endif           
                                                                                                            
`ifdef HCM20_TRESHOLD1 parameter [3:0] int_HCM20_TRESHOLD1 = `HCM20_TRESHOLD1;	`endif                       
`ifdef HCM20_TRESHOLD2 parameter [3:0] int_HCM20_TRESHOLD2 = `HCM20_TRESHOLD2; `endif                        
`ifdef HCM20_TRESHOLD3 parameter [3:0] int_HCM20_TRESHOLD3 = `HCM20_TRESHOLD3; `endif                        
`ifdef HCM20_TRESHOLD4 parameter [3:0] int_HCM20_TRESHOLD4 = `HCM20_TRESHOLD4; `endif                        
`ifdef HCM20_TRESHOLD5 parameter [3:0] int_HCM20_TRESHOLD5 = `HCM20_TRESHOLD5; `endif                        
`ifdef HCM20_TRESHOLD6 parameter [3:0] int_HCM20_TRESHOLD6 = `HCM20_TRESHOLD6; `endif                        
`ifdef HCM20_TRESHOLD7 parameter [3:0] int_HCM20_TRESHOLD7 = `HCM20_TRESHOLD7; `endif                        
`ifdef HCM20_TRESHOLD8 parameter [3:0] int_HCM20_TRESHOLD8 = `HCM20_TRESHOLD8; `endif                        
                                                                                                          
`ifdef HCM20_LOOP_MAX1 parameter [3:0] int_HCM20_LOOP_MAX1 = `HCM20_LOOP_MAX1;	`endif                       
`ifdef HCM20_LOOP_MAX2 parameter [3:0] int_HCM20_LOOP_MAX2 = `HCM20_LOOP_MAX2; `endif                        
`ifdef HCM20_LOOP_MAX3 parameter [3:0] int_HCM20_LOOP_MAX3 = `HCM20_LOOP_MAX3; `endif                        
`ifdef HCM20_LOOP_MAX4 parameter [3:0] int_HCM20_LOOP_MAX4 = `HCM20_LOOP_MAX4; `endif                        
`ifdef HCM20_LOOP_MAX5 parameter [3:0] int_HCM20_LOOP_MAX5 = `HCM20_LOOP_MAX5; `endif                        
`ifdef HCM20_LOOP_MAX6 parameter [3:0] int_HCM20_LOOP_MAX6 = `HCM20_LOOP_MAX6; `endif                        
`ifdef HCM20_LOOP_MAX7 parameter [3:0] int_HCM20_LOOP_MAX7 = `HCM20_LOOP_MAX7; `endif                        
`ifdef HCM20_LOOP_MAX8 parameter [3:0] int_HCM20_LOOP_MAX8 = `HCM20_LOOP_MAX8; `endif                        
`ifdef HCM20_COOLDOWN  parameter [7:0] int_HCM20_COOLDOWN  = `HCM20_COOLDOWN ;	`endif	                     
                                                                                                            
`ifdef HCM20_DC_TIMEOUT1 parameter [7:0] int_HCM20_DC_TIMEOUT1 = `HCM20_DC_TIMEOUT1; `endif                  
`ifdef HCM20_DC_TIMEOUT2 parameter [7:0] int_HCM20_DC_TIMEOUT2 = `HCM20_DC_TIMEOUT2; `endif                  
`ifdef HCM20_DC_TIMEOUT3 parameter [7:0] int_HCM20_DC_TIMEOUT3 = `HCM20_DC_TIMEOUT3; `endif                  
`ifdef HCM20_DC_TIMEOUT4 parameter [7:0] int_HCM20_DC_TIMEOUT4 = `HCM20_DC_TIMEOUT4; `endif                  
`ifdef HCM20_DC_TIMEOUT5 parameter [7:0] int_HCM20_DC_TIMEOUT5 = `HCM20_DC_TIMEOUT5; `endif                  
`ifdef HCM20_DC_TIMEOUT6 parameter [7:0] int_HCM20_DC_TIMEOUT6 = `HCM20_DC_TIMEOUT6; `endif                  
`ifdef HCM20_DC_TIMEOUT7 parameter [7:0] int_HCM20_DC_TIMEOUT7 = `HCM20_DC_TIMEOUT7; `endif                  
`ifdef HCM20_DC_TIMEOUT8 parameter [7:0] int_HCM20_DC_TIMEOUT8 = `HCM20_DC_TIMEOUT8; `endif        

// HCM21 parameters                                                                                          
`ifdef HCM21_SOA_TYPE 			parameter int_HCM21_SOA_TYPE	= `HCM21_SOA_TYPE; `endif                          
`ifdef HCM21_HVIMON 				parameter int_HCM21_HVIMON    = `HCM21_HVIMON; `endif                            
`ifdef HCM21_VMON_PHASE 		parameter [3:0] int_HCM21_VMON_PHASE    = `HCM21_VMON_PHASE;    `endif           
`ifdef HCM21_FAST_SHUTDOWN  parameter [1:0] int_HCM21_FAST_SHUTDOWN = `HCM21_FAST_SHUTDOWN; `endif           
                                                                                                           
`ifdef HCM21_TRESHOLD1 parameter [3:0] int_HCM21_TRESHOLD1 = `HCM21_TRESHOLD1;	`endif                       
`ifdef HCM21_TRESHOLD2 parameter [3:0] int_HCM21_TRESHOLD2 = `HCM21_TRESHOLD2; `endif                        
`ifdef HCM21_TRESHOLD3 parameter [3:0] int_HCM21_TRESHOLD3 = `HCM21_TRESHOLD3; `endif                        
`ifdef HCM21_TRESHOLD4 parameter [3:0] int_HCM21_TRESHOLD4 = `HCM21_TRESHOLD4; `endif                        
`ifdef HCM21_TRESHOLD5 parameter [3:0] int_HCM21_TRESHOLD5 = `HCM21_TRESHOLD5; `endif                        
`ifdef HCM21_TRESHOLD6 parameter [3:0] int_HCM21_TRESHOLD6 = `HCM21_TRESHOLD6; `endif                        
`ifdef HCM21_TRESHOLD7 parameter [3:0] int_HCM21_TRESHOLD7 = `HCM21_TRESHOLD7; `endif                        
`ifdef HCM21_TRESHOLD8 parameter [3:0] int_HCM21_TRESHOLD8 = `HCM21_TRESHOLD8; `endif                        
                                                                                                       
`ifdef HCM21_LOOP_MAX1 parameter [3:0] int_HCM21_LOOP_MAX1 = `HCM21_LOOP_MAX1;	`endif                       
`ifdef HCM21_LOOP_MAX2 parameter [3:0] int_HCM21_LOOP_MAX2 = `HCM21_LOOP_MAX2; `endif                        
`ifdef HCM21_LOOP_MAX3 parameter [3:0] int_HCM21_LOOP_MAX3 = `HCM21_LOOP_MAX3; `endif                        
`ifdef HCM21_LOOP_MAX4 parameter [3:0] int_HCM21_LOOP_MAX4 = `HCM21_LOOP_MAX4; `endif                        
`ifdef HCM21_LOOP_MAX5 parameter [3:0] int_HCM21_LOOP_MAX5 = `HCM21_LOOP_MAX5; `endif                        
`ifdef HCM21_LOOP_MAX6 parameter [3:0] int_HCM21_LOOP_MAX6 = `HCM21_LOOP_MAX6; `endif                        
`ifdef HCM21_LOOP_MAX7 parameter [3:0] int_HCM21_LOOP_MAX7 = `HCM21_LOOP_MAX7; `endif                        
`ifdef HCM21_LOOP_MAX8 parameter [3:0] int_HCM21_LOOP_MAX8 = `HCM21_LOOP_MAX8; `endif                        
`ifdef HCM21_COOLDOWN  parameter [7:0] int_HCM21_COOLDOWN  = `HCM21_COOLDOWN ;	`endif	                     
                                                                                                           
`ifdef HCM21_DC_TIMEOUT1 parameter [7:0] int_HCM21_DC_TIMEOUT1 = `HCM21_DC_TIMEOUT1; `endif                  
`ifdef HCM21_DC_TIMEOUT2 parameter [7:0] int_HCM21_DC_TIMEOUT2 = `HCM21_DC_TIMEOUT2; `endif                  
`ifdef HCM21_DC_TIMEOUT3 parameter [7:0] int_HCM21_DC_TIMEOUT3 = `HCM21_DC_TIMEOUT3; `endif                  
`ifdef HCM21_DC_TIMEOUT4 parameter [7:0] int_HCM21_DC_TIMEOUT4 = `HCM21_DC_TIMEOUT4; `endif                  
`ifdef HCM21_DC_TIMEOUT5 parameter [7:0] int_HCM21_DC_TIMEOUT5 = `HCM21_DC_TIMEOUT5; `endif                  
`ifdef HCM21_DC_TIMEOUT6 parameter [7:0] int_HCM21_DC_TIMEOUT6 = `HCM21_DC_TIMEOUT6; `endif                  
`ifdef HCM21_DC_TIMEOUT7 parameter [7:0] int_HCM21_DC_TIMEOUT7 = `HCM21_DC_TIMEOUT7; `endif                  
`ifdef HCM21_DC_TIMEOUT8 parameter [7:0] int_HCM21_DC_TIMEOUT8 = `HCM21_DC_TIMEOUT8; `endif      

// HCM22 parameters                                                                                          
`ifdef HCM22_SOA_TYPE 			parameter int_HCM22_SOA_TYPE	= `HCM22_SOA_TYPE; `endif                          
`ifdef HCM22_HVIMON 				parameter int_HCM22_HVIMON    = `HCM22_HVIMON; `endif                            
`ifdef HCM22_VMON_PHASE 		parameter [3:0] int_HCM22_VMON_PHASE    = `HCM22_VMON_PHASE;    `endif           
`ifdef HCM22_FAST_SHUTDOWN  parameter [1:0] int_HCM22_FAST_SHUTDOWN = `HCM22_FAST_SHUTDOWN; `endif           
                                                                                                          
`ifdef HCM22_TRESHOLD1 parameter [3:0] int_HCM22_TRESHOLD1 = `HCM22_TRESHOLD1;	`endif                       
`ifdef HCM22_TRESHOLD2 parameter [3:0] int_HCM22_TRESHOLD2 = `HCM22_TRESHOLD2; `endif                        
`ifdef HCM22_TRESHOLD3 parameter [3:0] int_HCM22_TRESHOLD3 = `HCM22_TRESHOLD3; `endif                        
`ifdef HCM22_TRESHOLD4 parameter [3:0] int_HCM22_TRESHOLD4 = `HCM22_TRESHOLD4; `endif                        
`ifdef HCM22_TRESHOLD5 parameter [3:0] int_HCM22_TRESHOLD5 = `HCM22_TRESHOLD5; `endif                        
`ifdef HCM22_TRESHOLD6 parameter [3:0] int_HCM22_TRESHOLD6 = `HCM22_TRESHOLD6; `endif                        
`ifdef HCM22_TRESHOLD7 parameter [3:0] int_HCM22_TRESHOLD7 = `HCM22_TRESHOLD7; `endif                        
`ifdef HCM22_TRESHOLD8 parameter [3:0] int_HCM22_TRESHOLD8 = `HCM22_TRESHOLD8; `endif                        
                                                                                                      
`ifdef HCM22_LOOP_MAX1 parameter [3:0] int_HCM22_LOOP_MAX1 = `HCM22_LOOP_MAX1;	`endif                       
`ifdef HCM22_LOOP_MAX2 parameter [3:0] int_HCM22_LOOP_MAX2 = `HCM22_LOOP_MAX2; `endif                        
`ifdef HCM22_LOOP_MAX3 parameter [3:0] int_HCM22_LOOP_MAX3 = `HCM22_LOOP_MAX3; `endif                        
`ifdef HCM22_LOOP_MAX4 parameter [3:0] int_HCM22_LOOP_MAX4 = `HCM22_LOOP_MAX4; `endif                        
`ifdef HCM22_LOOP_MAX5 parameter [3:0] int_HCM22_LOOP_MAX5 = `HCM22_LOOP_MAX5; `endif                        
`ifdef HCM22_LOOP_MAX6 parameter [3:0] int_HCM22_LOOP_MAX6 = `HCM22_LOOP_MAX6; `endif                        
`ifdef HCM22_LOOP_MAX7 parameter [3:0] int_HCM22_LOOP_MAX7 = `HCM22_LOOP_MAX7; `endif                        
`ifdef HCM22_LOOP_MAX8 parameter [3:0] int_HCM22_LOOP_MAX8 = `HCM22_LOOP_MAX8; `endif                        
`ifdef HCM22_COOLDOWN  parameter [7:0] int_HCM22_COOLDOWN  = `HCM22_COOLDOWN ;	`endif	                     
                                                                                                           
`ifdef HCM22_DC_TIMEOUT1 parameter [7:0] int_HCM22_DC_TIMEOUT1 = `HCM22_DC_TIMEOUT1; `endif                  
`ifdef HCM22_DC_TIMEOUT2 parameter [7:0] int_HCM22_DC_TIMEOUT2 = `HCM22_DC_TIMEOUT2; `endif                  
`ifdef HCM22_DC_TIMEOUT3 parameter [7:0] int_HCM22_DC_TIMEOUT3 = `HCM22_DC_TIMEOUT3; `endif                  
`ifdef HCM22_DC_TIMEOUT4 parameter [7:0] int_HCM22_DC_TIMEOUT4 = `HCM22_DC_TIMEOUT4; `endif                  
`ifdef HCM22_DC_TIMEOUT5 parameter [7:0] int_HCM22_DC_TIMEOUT5 = `HCM22_DC_TIMEOUT5; `endif                  
`ifdef HCM22_DC_TIMEOUT6 parameter [7:0] int_HCM22_DC_TIMEOUT6 = `HCM22_DC_TIMEOUT6; `endif                  
`ifdef HCM22_DC_TIMEOUT7 parameter [7:0] int_HCM22_DC_TIMEOUT7 = `HCM22_DC_TIMEOUT7; `endif                  
`ifdef HCM22_DC_TIMEOUT8 parameter [7:0] int_HCM22_DC_TIMEOUT8 = `HCM22_DC_TIMEOUT8; `endif   

// HCM23 parameters                                                                                          
`ifdef HCM23_SOA_TYPE 			parameter int_HCM23_SOA_TYPE	= `HCM23_SOA_TYPE; `endif                          
`ifdef HCM23_HVIMON 				parameter int_HCM23_HVIMON    = `HCM23_HVIMON; `endif                            
`ifdef HCM23_VMON_PHASE 		parameter [3:0] int_HCM23_VMON_PHASE    = `HCM23_VMON_PHASE;    `endif           
`ifdef HCM23_FAST_SHUTDOWN  parameter [1:0] int_HCM23_FAST_SHUTDOWN = `HCM23_FAST_SHUTDOWN; `endif           
                                                                                                           
`ifdef HCM23_TRESHOLD1 parameter [3:0] int_HCM23_TRESHOLD1 = `HCM23_TRESHOLD1;	`endif                       
`ifdef HCM23_TRESHOLD2 parameter [3:0] int_HCM23_TRESHOLD2 = `HCM23_TRESHOLD2; `endif                        
`ifdef HCM23_TRESHOLD3 parameter [3:0] int_HCM23_TRESHOLD3 = `HCM23_TRESHOLD3; `endif                        
`ifdef HCM23_TRESHOLD4 parameter [3:0] int_HCM23_TRESHOLD4 = `HCM23_TRESHOLD4; `endif                        
`ifdef HCM23_TRESHOLD5 parameter [3:0] int_HCM23_TRESHOLD5 = `HCM23_TRESHOLD5; `endif                        
`ifdef HCM23_TRESHOLD6 parameter [3:0] int_HCM23_TRESHOLD6 = `HCM23_TRESHOLD6; `endif                        
`ifdef HCM23_TRESHOLD7 parameter [3:0] int_HCM23_TRESHOLD7 = `HCM23_TRESHOLD7; `endif                        
`ifdef HCM23_TRESHOLD8 parameter [3:0] int_HCM23_TRESHOLD8 = `HCM23_TRESHOLD8; `endif                        
                                                                                                      
`ifdef HCM23_LOOP_MAX1 parameter [3:0] int_HCM23_LOOP_MAX1 = `HCM23_LOOP_MAX1;	`endif                       
`ifdef HCM23_LOOP_MAX2 parameter [3:0] int_HCM23_LOOP_MAX2 = `HCM23_LOOP_MAX2; `endif                        
`ifdef HCM23_LOOP_MAX3 parameter [3:0] int_HCM23_LOOP_MAX3 = `HCM23_LOOP_MAX3; `endif                        
`ifdef HCM23_LOOP_MAX4 parameter [3:0] int_HCM23_LOOP_MAX4 = `HCM23_LOOP_MAX4; `endif                        
`ifdef HCM23_LOOP_MAX5 parameter [3:0] int_HCM23_LOOP_MAX5 = `HCM23_LOOP_MAX5; `endif                        
`ifdef HCM23_LOOP_MAX6 parameter [3:0] int_HCM23_LOOP_MAX6 = `HCM23_LOOP_MAX6; `endif                        
`ifdef HCM23_LOOP_MAX7 parameter [3:0] int_HCM23_LOOP_MAX7 = `HCM23_LOOP_MAX7; `endif                        
`ifdef HCM23_LOOP_MAX8 parameter [3:0] int_HCM23_LOOP_MAX8 = `HCM23_LOOP_MAX8; `endif                        
`ifdef HCM23_COOLDOWN  parameter [7:0] int_HCM23_COOLDOWN  = `HCM23_COOLDOWN ;	`endif	                     
                                                                                                           
`ifdef HCM23_DC_TIMEOUT1 parameter [7:0] int_HCM23_DC_TIMEOUT1 = `HCM23_DC_TIMEOUT1; `endif                  
`ifdef HCM23_DC_TIMEOUT2 parameter [7:0] int_HCM23_DC_TIMEOUT2 = `HCM23_DC_TIMEOUT2; `endif                  
`ifdef HCM23_DC_TIMEOUT3 parameter [7:0] int_HCM23_DC_TIMEOUT3 = `HCM23_DC_TIMEOUT3; `endif                  
`ifdef HCM23_DC_TIMEOUT4 parameter [7:0] int_HCM23_DC_TIMEOUT4 = `HCM23_DC_TIMEOUT4; `endif                  
`ifdef HCM23_DC_TIMEOUT5 parameter [7:0] int_HCM23_DC_TIMEOUT5 = `HCM23_DC_TIMEOUT5; `endif                  
`ifdef HCM23_DC_TIMEOUT6 parameter [7:0] int_HCM23_DC_TIMEOUT6 = `HCM23_DC_TIMEOUT6; `endif                  
`ifdef HCM23_DC_TIMEOUT7 parameter [7:0] int_HCM23_DC_TIMEOUT7 = `HCM23_DC_TIMEOUT7; `endif                  
`ifdef HCM23_DC_TIMEOUT8 parameter [7:0] int_HCM23_DC_TIMEOUT8 = `HCM23_DC_TIMEOUT8; `endif    
               
// HCM24 parameters                                                                                          
`ifdef HCM24_SOA_TYPE 			parameter int_HCM24_SOA_TYPE	= `HCM24_SOA_TYPE; `endif                          
`ifdef HCM24_HVIMON 				parameter int_HCM24_HVIMON    = `HCM24_HVIMON; `endif                            
`ifdef HCM24_VMON_PHASE 		parameter [3:0] int_HCM24_VMON_PHASE    = `HCM24_VMON_PHASE;    `endif           
`ifdef HCM24_FAST_SHUTDOWN  parameter [1:0] int_HCM24_FAST_SHUTDOWN = `HCM24_FAST_SHUTDOWN; `endif           
                                                                                                           
`ifdef HCM24_TRESHOLD1 parameter [3:0] int_HCM24_TRESHOLD1 = `HCM24_TRESHOLD1;	`endif                       
`ifdef HCM24_TRESHOLD2 parameter [3:0] int_HCM24_TRESHOLD2 = `HCM24_TRESHOLD2; `endif                        
`ifdef HCM24_TRESHOLD3 parameter [3:0] int_HCM24_TRESHOLD3 = `HCM24_TRESHOLD3; `endif                        
`ifdef HCM24_TRESHOLD4 parameter [3:0] int_HCM24_TRESHOLD4 = `HCM24_TRESHOLD4; `endif                        
`ifdef HCM24_TRESHOLD5 parameter [3:0] int_HCM24_TRESHOLD5 = `HCM24_TRESHOLD5; `endif                        
`ifdef HCM24_TRESHOLD6 parameter [3:0] int_HCM24_TRESHOLD6 = `HCM24_TRESHOLD6; `endif                        
`ifdef HCM24_TRESHOLD7 parameter [3:0] int_HCM24_TRESHOLD7 = `HCM24_TRESHOLD7; `endif                        
`ifdef HCM24_TRESHOLD8 parameter [3:0] int_HCM24_TRESHOLD8 = `HCM24_TRESHOLD8; `endif                        
                                                                                                      
`ifdef HCM24_LOOP_MAX1 parameter [3:0] int_HCM24_LOOP_MAX1 = `HCM24_LOOP_MAX1;	`endif                       
`ifdef HCM24_LOOP_MAX2 parameter [3:0] int_HCM24_LOOP_MAX2 = `HCM24_LOOP_MAX2; `endif                        
`ifdef HCM24_LOOP_MAX3 parameter [3:0] int_HCM24_LOOP_MAX3 = `HCM24_LOOP_MAX3; `endif                        
`ifdef HCM24_LOOP_MAX4 parameter [3:0] int_HCM24_LOOP_MAX4 = `HCM24_LOOP_MAX4; `endif                        
`ifdef HCM24_LOOP_MAX5 parameter [3:0] int_HCM24_LOOP_MAX5 = `HCM24_LOOP_MAX5; `endif                        
`ifdef HCM24_LOOP_MAX6 parameter [3:0] int_HCM24_LOOP_MAX6 = `HCM24_LOOP_MAX6; `endif                        
`ifdef HCM24_LOOP_MAX7 parameter [3:0] int_HCM24_LOOP_MAX7 = `HCM24_LOOP_MAX7; `endif                        
`ifdef HCM24_LOOP_MAX8 parameter [3:0] int_HCM24_LOOP_MAX8 = `HCM24_LOOP_MAX8; `endif                        
`ifdef HCM24_COOLDOWN  parameter [7:0] int_HCM24_COOLDOWN  = `HCM24_COOLDOWN ;	`endif	                     
                                                                                                           
`ifdef HCM24_DC_TIMEOUT1 parameter [7:0] int_HCM24_DC_TIMEOUT1 = `HCM24_DC_TIMEOUT1; `endif                  
`ifdef HCM24_DC_TIMEOUT2 parameter [7:0] int_HCM24_DC_TIMEOUT2 = `HCM24_DC_TIMEOUT2; `endif                  
`ifdef HCM24_DC_TIMEOUT3 parameter [7:0] int_HCM24_DC_TIMEOUT3 = `HCM24_DC_TIMEOUT3; `endif                  
`ifdef HCM24_DC_TIMEOUT4 parameter [7:0] int_HCM24_DC_TIMEOUT4 = `HCM24_DC_TIMEOUT4; `endif                  
`ifdef HCM24_DC_TIMEOUT5 parameter [7:0] int_HCM24_DC_TIMEOUT5 = `HCM24_DC_TIMEOUT5; `endif                  
`ifdef HCM24_DC_TIMEOUT6 parameter [7:0] int_HCM24_DC_TIMEOUT6 = `HCM24_DC_TIMEOUT6; `endif                  
`ifdef HCM24_DC_TIMEOUT7 parameter [7:0] int_HCM24_DC_TIMEOUT7 = `HCM24_DC_TIMEOUT7; `endif                  
`ifdef HCM24_DC_TIMEOUT8 parameter [7:0] int_HCM24_DC_TIMEOUT8 = `HCM24_DC_TIMEOUT8; `endif          
      
         
          
               
            
       


//-----------------------------------------------------------------------------
// Combine parameter into arrays or buses                 
//-----------------------------------------------------------------------------
parameter [23:0]  bus_HCM_SOA_TYPE 			= {int_HCM24_SOA_TYPE,     int_HCM23_SOA_TYPE,     int_HCM22_SOA_TYPE,     int_HCM21_SOA_TYPE,     int_HCM20_SOA_TYPE,     int_HCM19_SOA_TYPE,     int_HCM18_SOA_TYPE,     int_HCM17_SOA_TYPE,     int_HCM16_SOA_TYPE,     int_HCM15_SOA_TYPE,     int_HCM14_SOA_TYPE,     int_HCM13_SOA_TYPE,     int_HCM12_SOA_TYPE,     int_HCM11_SOA_TYPE,     int_HCM10_SOA_TYPE,     int_HCM9_SOA_TYPE,     int_HCM8_SOA_TYPE,     int_HCM7_SOA_TYPE,     int_HCM6_SOA_TYPE,     int_HCM5_SOA_TYPE,     int_HCM4_SOA_TYPE,     int_HCM3_SOA_TYPE,      int_HCM2_SOA_TYPE,      int_HCM1_SOA_TYPE};
parameter [23:0]  bus_HCM_HVIMON				= {int_HCM24_HVIMON,       int_HCM23_HVIMON,       int_HCM22_HVIMON,       int_HCM21_HVIMON,       int_HCM20_HVIMON,       int_HCM19_HVIMON,       int_HCM18_HVIMON,       int_HCM17_HVIMON,       int_HCM16_HVIMON,       int_HCM15_HVIMON,       int_HCM14_HVIMON,       int_HCM13_HVIMON,       int_HCM12_HVIMON,       int_HCM11_HVIMON,       int_HCM10_HVIMON,       int_HCM9_HVIMON,       int_HCM8_HVIMON,       int_HCM7_HVIMON,       int_HCM6_HVIMON,       int_HCM5_HVIMON,       int_HCM4_HVIMON,       int_HCM3_HVIMON,        int_HCM2_HVIMON,        int_HCM1_HVIMON};
parameter [95:0]  bus_HCM_VMON_PHASE  	= {int_HCM24_VMON_PHASE,   int_HCM23_VMON_PHASE,   int_HCM22_VMON_PHASE,   int_HCM21_VMON_PHASE,   int_HCM20_VMON_PHASE,   int_HCM19_VMON_PHASE,   int_HCM18_VMON_PHASE,   int_HCM17_VMON_PHASE,   int_HCM16_VMON_PHASE,   int_HCM15_VMON_PHASE,   int_HCM14_VMON_PHASE,   int_HCM13_VMON_PHASE,   int_HCM12_VMON_PHASE,   int_HCM11_VMON_PHASE,   int_HCM10_VMON_PHASE,   int_HCM9_VMON_PHASE,   int_HCM8_VMON_PHASE,   int_HCM7_VMON_PHASE,   int_HCM6_VMON_PHASE,   int_HCM5_VMON_PHASE,   int_HCM4_VMON_PHASE,   int_HCM3_VMON_PHASE,    int_HCM2_VMON_PHASE,    int_HCM1_VMON_PHASE};
parameter [47:0]  bus_HCM_FAST_SHUTDOWN	= {int_HCM24_FAST_SHUTDOWN,int_HCM23_FAST_SHUTDOWN,int_HCM22_FAST_SHUTDOWN,int_HCM21_FAST_SHUTDOWN,int_HCM20_FAST_SHUTDOWN,int_HCM19_FAST_SHUTDOWN,int_HCM18_FAST_SHUTDOWN,int_HCM17_FAST_SHUTDOWN,int_HCM16_FAST_SHUTDOWN,int_HCM15_FAST_SHUTDOWN,int_HCM14_FAST_SHUTDOWN,int_HCM13_FAST_SHUTDOWN,int_HCM12_FAST_SHUTDOWN,int_HCM11_FAST_SHUTDOWN,int_HCM10_FAST_SHUTDOWN,int_HCM9_FAST_SHUTDOWN,int_HCM8_FAST_SHUTDOWN,int_HCM7_FAST_SHUTDOWN,int_HCM6_FAST_SHUTDOWN,int_HCM5_FAST_SHUTDOWN,int_HCM4_FAST_SHUTDOWN,int_HCM3_FAST_SHUTDOWN, int_HCM2_FAST_SHUTDOWN, int_HCM1_FAST_SHUTDOWN};

// 4 bits per parameter, 24*4 = 96 bits
parameter [95:0] bus_HCM_TRESHOLD1			= {int_HCM24_TRESHOLD1, int_HCM23_TRESHOLD1, int_HCM22_TRESHOLD1, int_HCM21_TRESHOLD1, int_HCM20_TRESHOLD1, int_HCM19_TRESHOLD1, int_HCM18_TRESHOLD1, int_HCM17_TRESHOLD1, int_HCM16_TRESHOLD1, int_HCM15_TRESHOLD1, int_HCM14_TRESHOLD1, int_HCM13_TRESHOLD1, int_HCM12_TRESHOLD1, int_HCM11_TRESHOLD1, int_HCM10_TRESHOLD1, int_HCM9_TRESHOLD1, int_HCM8_TRESHOLD1, int_HCM7_TRESHOLD1, int_HCM6_TRESHOLD1, int_HCM5_TRESHOLD1, int_HCM4_TRESHOLD1, int_HCM3_TRESHOLD1, int_HCM2_TRESHOLD1, int_HCM1_TRESHOLD1};   
parameter [95:0] bus_HCM_TRESHOLD2			= {int_HCM24_TRESHOLD2, int_HCM23_TRESHOLD2, int_HCM22_TRESHOLD2, int_HCM21_TRESHOLD2, int_HCM20_TRESHOLD2, int_HCM19_TRESHOLD2, int_HCM18_TRESHOLD2, int_HCM17_TRESHOLD2, int_HCM16_TRESHOLD2, int_HCM15_TRESHOLD2, int_HCM14_TRESHOLD2, int_HCM13_TRESHOLD2, int_HCM12_TRESHOLD2, int_HCM11_TRESHOLD2, int_HCM10_TRESHOLD2, int_HCM9_TRESHOLD2, int_HCM8_TRESHOLD2, int_HCM7_TRESHOLD2, int_HCM6_TRESHOLD2, int_HCM5_TRESHOLD2, int_HCM4_TRESHOLD2, int_HCM3_TRESHOLD2, int_HCM2_TRESHOLD2, int_HCM1_TRESHOLD2};
parameter [95:0] bus_HCM_TRESHOLD3			= {int_HCM24_TRESHOLD3, int_HCM23_TRESHOLD3, int_HCM22_TRESHOLD3, int_HCM21_TRESHOLD3, int_HCM20_TRESHOLD3, int_HCM19_TRESHOLD3, int_HCM18_TRESHOLD3, int_HCM17_TRESHOLD3, int_HCM16_TRESHOLD3, int_HCM15_TRESHOLD3, int_HCM14_TRESHOLD3, int_HCM13_TRESHOLD3, int_HCM12_TRESHOLD3, int_HCM11_TRESHOLD3, int_HCM10_TRESHOLD3, int_HCM9_TRESHOLD3, int_HCM8_TRESHOLD3, int_HCM7_TRESHOLD3, int_HCM6_TRESHOLD3, int_HCM5_TRESHOLD3, int_HCM4_TRESHOLD3, int_HCM3_TRESHOLD3, int_HCM2_TRESHOLD3, int_HCM1_TRESHOLD3};
parameter [95:0] bus_HCM_TRESHOLD4			= {int_HCM24_TRESHOLD4, int_HCM23_TRESHOLD4, int_HCM22_TRESHOLD4, int_HCM21_TRESHOLD4, int_HCM20_TRESHOLD4, int_HCM19_TRESHOLD4, int_HCM18_TRESHOLD4, int_HCM17_TRESHOLD4, int_HCM16_TRESHOLD4, int_HCM15_TRESHOLD4, int_HCM14_TRESHOLD4, int_HCM13_TRESHOLD4, int_HCM12_TRESHOLD4, int_HCM11_TRESHOLD4, int_HCM10_TRESHOLD4, int_HCM9_TRESHOLD4, int_HCM8_TRESHOLD4, int_HCM7_TRESHOLD4, int_HCM6_TRESHOLD4, int_HCM5_TRESHOLD4, int_HCM4_TRESHOLD4, int_HCM3_TRESHOLD4, int_HCM2_TRESHOLD4, int_HCM1_TRESHOLD4};
parameter [95:0] bus_HCM_TRESHOLD5			= {int_HCM24_TRESHOLD5, int_HCM23_TRESHOLD5, int_HCM22_TRESHOLD5, int_HCM21_TRESHOLD5, int_HCM20_TRESHOLD5, int_HCM19_TRESHOLD5, int_HCM18_TRESHOLD5, int_HCM17_TRESHOLD5, int_HCM16_TRESHOLD5, int_HCM15_TRESHOLD5, int_HCM14_TRESHOLD5, int_HCM13_TRESHOLD5, int_HCM12_TRESHOLD5, int_HCM11_TRESHOLD5, int_HCM10_TRESHOLD5, int_HCM9_TRESHOLD5, int_HCM8_TRESHOLD5, int_HCM7_TRESHOLD5, int_HCM6_TRESHOLD5, int_HCM5_TRESHOLD5, int_HCM4_TRESHOLD5, int_HCM3_TRESHOLD5, int_HCM2_TRESHOLD5, int_HCM1_TRESHOLD5};
parameter [95:0] bus_HCM_TRESHOLD6			= {int_HCM24_TRESHOLD6, int_HCM23_TRESHOLD6, int_HCM22_TRESHOLD6, int_HCM21_TRESHOLD6, int_HCM20_TRESHOLD6, int_HCM19_TRESHOLD6, int_HCM18_TRESHOLD6, int_HCM17_TRESHOLD6, int_HCM16_TRESHOLD6, int_HCM15_TRESHOLD6, int_HCM14_TRESHOLD6, int_HCM13_TRESHOLD6, int_HCM12_TRESHOLD6, int_HCM11_TRESHOLD6, int_HCM10_TRESHOLD6, int_HCM9_TRESHOLD6, int_HCM8_TRESHOLD6, int_HCM7_TRESHOLD6, int_HCM6_TRESHOLD6, int_HCM5_TRESHOLD6, int_HCM4_TRESHOLD6, int_HCM3_TRESHOLD6, int_HCM2_TRESHOLD6, int_HCM1_TRESHOLD6};
parameter [95:0] bus_HCM_TRESHOLD7			= {int_HCM24_TRESHOLD7, int_HCM23_TRESHOLD7, int_HCM22_TRESHOLD7, int_HCM21_TRESHOLD7, int_HCM20_TRESHOLD7, int_HCM19_TRESHOLD7, int_HCM18_TRESHOLD7, int_HCM17_TRESHOLD7, int_HCM16_TRESHOLD7, int_HCM15_TRESHOLD7, int_HCM14_TRESHOLD7, int_HCM13_TRESHOLD7, int_HCM12_TRESHOLD7, int_HCM11_TRESHOLD7, int_HCM10_TRESHOLD7, int_HCM9_TRESHOLD7, int_HCM8_TRESHOLD7, int_HCM7_TRESHOLD7, int_HCM6_TRESHOLD7, int_HCM5_TRESHOLD7, int_HCM4_TRESHOLD7, int_HCM3_TRESHOLD7, int_HCM2_TRESHOLD7, int_HCM1_TRESHOLD7};
parameter [95:0] bus_HCM_TRESHOLD8			= {int_HCM24_TRESHOLD8, int_HCM23_TRESHOLD8, int_HCM22_TRESHOLD8, int_HCM21_TRESHOLD8, int_HCM20_TRESHOLD8, int_HCM19_TRESHOLD8, int_HCM18_TRESHOLD8, int_HCM17_TRESHOLD8, int_HCM16_TRESHOLD8, int_HCM15_TRESHOLD8, int_HCM14_TRESHOLD8, int_HCM13_TRESHOLD8, int_HCM12_TRESHOLD8, int_HCM11_TRESHOLD8, int_HCM10_TRESHOLD8, int_HCM9_TRESHOLD8, int_HCM8_TRESHOLD8, int_HCM7_TRESHOLD8, int_HCM6_TRESHOLD8, int_HCM5_TRESHOLD8, int_HCM4_TRESHOLD8, int_HCM3_TRESHOLD8, int_HCM2_TRESHOLD8, int_HCM1_TRESHOLD8};

parameter [95:0] bus_HCM_LOOP_MAX1			= {int_HCM24_LOOP_MAX1, int_HCM23_LOOP_MAX1, int_HCM22_LOOP_MAX1, int_HCM21_LOOP_MAX1, int_HCM20_LOOP_MAX1, int_HCM19_LOOP_MAX1, int_HCM18_LOOP_MAX1, int_HCM17_LOOP_MAX1, int_HCM16_LOOP_MAX1, int_HCM15_LOOP_MAX1, int_HCM14_LOOP_MAX1, int_HCM13_LOOP_MAX1, int_HCM12_LOOP_MAX1, int_HCM11_LOOP_MAX1, int_HCM10_LOOP_MAX1, int_HCM9_LOOP_MAX1, int_HCM8_LOOP_MAX1, int_HCM7_LOOP_MAX1, int_HCM6_LOOP_MAX1, int_HCM5_LOOP_MAX1, int_HCM4_LOOP_MAX1, int_HCM3_LOOP_MAX1, int_HCM2_LOOP_MAX1, int_HCM1_LOOP_MAX1};
parameter [95:0] bus_HCM_LOOP_MAX2			= {int_HCM24_LOOP_MAX2, int_HCM23_LOOP_MAX2, int_HCM22_LOOP_MAX2, int_HCM21_LOOP_MAX2, int_HCM20_LOOP_MAX2, int_HCM19_LOOP_MAX2, int_HCM18_LOOP_MAX2, int_HCM17_LOOP_MAX2, int_HCM16_LOOP_MAX2, int_HCM15_LOOP_MAX2, int_HCM14_LOOP_MAX2, int_HCM13_LOOP_MAX2, int_HCM12_LOOP_MAX2, int_HCM11_LOOP_MAX2, int_HCM10_LOOP_MAX2, int_HCM9_LOOP_MAX2, int_HCM8_LOOP_MAX2, int_HCM7_LOOP_MAX2, int_HCM6_LOOP_MAX2, int_HCM5_LOOP_MAX2, int_HCM4_LOOP_MAX2, int_HCM3_LOOP_MAX2, int_HCM2_LOOP_MAX2, int_HCM1_LOOP_MAX2}; 
parameter [95:0] bus_HCM_LOOP_MAX3			= {int_HCM24_LOOP_MAX3, int_HCM23_LOOP_MAX3, int_HCM22_LOOP_MAX3, int_HCM21_LOOP_MAX3, int_HCM20_LOOP_MAX3, int_HCM19_LOOP_MAX3, int_HCM18_LOOP_MAX3, int_HCM17_LOOP_MAX3, int_HCM16_LOOP_MAX3, int_HCM15_LOOP_MAX3, int_HCM14_LOOP_MAX3, int_HCM13_LOOP_MAX3, int_HCM12_LOOP_MAX3, int_HCM11_LOOP_MAX3, int_HCM10_LOOP_MAX3, int_HCM9_LOOP_MAX3, int_HCM8_LOOP_MAX3, int_HCM7_LOOP_MAX3, int_HCM6_LOOP_MAX3, int_HCM5_LOOP_MAX3, int_HCM4_LOOP_MAX3, int_HCM3_LOOP_MAX3, int_HCM2_LOOP_MAX3, int_HCM1_LOOP_MAX3}; 
parameter [95:0] bus_HCM_LOOP_MAX4			= {int_HCM24_LOOP_MAX4, int_HCM23_LOOP_MAX4, int_HCM22_LOOP_MAX4, int_HCM21_LOOP_MAX4, int_HCM20_LOOP_MAX4, int_HCM19_LOOP_MAX4, int_HCM18_LOOP_MAX4, int_HCM17_LOOP_MAX4, int_HCM16_LOOP_MAX4, int_HCM15_LOOP_MAX4, int_HCM14_LOOP_MAX4, int_HCM13_LOOP_MAX4, int_HCM12_LOOP_MAX4, int_HCM11_LOOP_MAX4, int_HCM10_LOOP_MAX4, int_HCM9_LOOP_MAX4, int_HCM8_LOOP_MAX4, int_HCM7_LOOP_MAX4, int_HCM6_LOOP_MAX4, int_HCM5_LOOP_MAX4, int_HCM4_LOOP_MAX4, int_HCM3_LOOP_MAX4, int_HCM2_LOOP_MAX4, int_HCM1_LOOP_MAX4}; 
parameter [95:0] bus_HCM_LOOP_MAX5			= {int_HCM24_LOOP_MAX5, int_HCM23_LOOP_MAX5, int_HCM22_LOOP_MAX5, int_HCM21_LOOP_MAX5, int_HCM20_LOOP_MAX5, int_HCM19_LOOP_MAX5, int_HCM18_LOOP_MAX5, int_HCM17_LOOP_MAX5, int_HCM16_LOOP_MAX5, int_HCM15_LOOP_MAX5, int_HCM14_LOOP_MAX5, int_HCM13_LOOP_MAX5, int_HCM12_LOOP_MAX5, int_HCM11_LOOP_MAX5, int_HCM10_LOOP_MAX5, int_HCM9_LOOP_MAX5, int_HCM8_LOOP_MAX5, int_HCM7_LOOP_MAX5, int_HCM6_LOOP_MAX5, int_HCM5_LOOP_MAX5, int_HCM4_LOOP_MAX5, int_HCM3_LOOP_MAX5, int_HCM2_LOOP_MAX5, int_HCM1_LOOP_MAX5}; 
parameter [95:0] bus_HCM_LOOP_MAX6			= {int_HCM24_LOOP_MAX6, int_HCM23_LOOP_MAX6, int_HCM22_LOOP_MAX6, int_HCM21_LOOP_MAX6, int_HCM20_LOOP_MAX6, int_HCM19_LOOP_MAX6, int_HCM18_LOOP_MAX6, int_HCM17_LOOP_MAX6, int_HCM16_LOOP_MAX6, int_HCM15_LOOP_MAX6, int_HCM14_LOOP_MAX6, int_HCM13_LOOP_MAX6, int_HCM12_LOOP_MAX6, int_HCM11_LOOP_MAX6, int_HCM10_LOOP_MAX6, int_HCM9_LOOP_MAX6, int_HCM8_LOOP_MAX6, int_HCM7_LOOP_MAX6, int_HCM6_LOOP_MAX6, int_HCM5_LOOP_MAX6, int_HCM4_LOOP_MAX6, int_HCM3_LOOP_MAX6, int_HCM2_LOOP_MAX6, int_HCM1_LOOP_MAX6}; 
parameter [95:0] bus_HCM_LOOP_MAX7			= {int_HCM24_LOOP_MAX7, int_HCM23_LOOP_MAX7, int_HCM22_LOOP_MAX7, int_HCM21_LOOP_MAX7, int_HCM20_LOOP_MAX7, int_HCM19_LOOP_MAX7, int_HCM18_LOOP_MAX7, int_HCM17_LOOP_MAX7, int_HCM16_LOOP_MAX7, int_HCM15_LOOP_MAX7, int_HCM14_LOOP_MAX7, int_HCM13_LOOP_MAX7, int_HCM12_LOOP_MAX7, int_HCM11_LOOP_MAX7, int_HCM10_LOOP_MAX7, int_HCM9_LOOP_MAX7, int_HCM8_LOOP_MAX7, int_HCM7_LOOP_MAX7, int_HCM6_LOOP_MAX7, int_HCM5_LOOP_MAX7, int_HCM4_LOOP_MAX7, int_HCM3_LOOP_MAX7, int_HCM2_LOOP_MAX7, int_HCM1_LOOP_MAX7}; 
parameter [95:0] bus_HCM_LOOP_MAX8			= {int_HCM24_LOOP_MAX8, int_HCM23_LOOP_MAX8, int_HCM22_LOOP_MAX8, int_HCM21_LOOP_MAX8, int_HCM20_LOOP_MAX8, int_HCM19_LOOP_MAX8, int_HCM18_LOOP_MAX8, int_HCM17_LOOP_MAX8, int_HCM16_LOOP_MAX8, int_HCM15_LOOP_MAX8, int_HCM14_LOOP_MAX8, int_HCM13_LOOP_MAX8, int_HCM12_LOOP_MAX8, int_HCM11_LOOP_MAX8, int_HCM10_LOOP_MAX8, int_HCM9_LOOP_MAX8, int_HCM8_LOOP_MAX8, int_HCM7_LOOP_MAX8, int_HCM6_LOOP_MAX8, int_HCM5_LOOP_MAX8, int_HCM4_LOOP_MAX8, int_HCM3_LOOP_MAX8, int_HCM2_LOOP_MAX8, int_HCM1_LOOP_MAX8}; 

// 8 bits per parameter, 24 * 8 = 192
parameter [191:0] bus_HCM_COOLDOWN			= {int_HCM24_COOLDOWN, int_HCM23_COOLDOWN, int_HCM22_COOLDOWN, int_HCM21_COOLDOWN, int_HCM20_COOLDOWN, int_HCM19_COOLDOWN, int_HCM18_COOLDOWN, int_HCM17_COOLDOWN, int_HCM16_COOLDOWN, int_HCM15_COOLDOWN, int_HCM14_COOLDOWN, int_HCM13_COOLDOWN, int_HCM12_COOLDOWN, int_HCM11_COOLDOWN, int_HCM10_COOLDOWN, int_HCM9_COOLDOWN, int_HCM8_COOLDOWN, int_HCM7_COOLDOWN, int_HCM6_COOLDOWN, int_HCM5_COOLDOWN, int_HCM4_COOLDOWN, int_HCM3_COOLDOWN, int_HCM2_COOLDOWN, int_HCM1_COOLDOWN};

// 8 bits per parameter, 24 * 8 = 192  
parameter [191:0] bus_HCM_DC_TIMEOUT1		= {int_HCM24_DC_TIMEOUT1, int_HCM23_DC_TIMEOUT1, int_HCM22_DC_TIMEOUT1, int_HCM21_DC_TIMEOUT1, int_HCM20_DC_TIMEOUT1, int_HCM19_DC_TIMEOUT1, int_HCM18_DC_TIMEOUT1, int_HCM17_DC_TIMEOUT1, int_HCM16_DC_TIMEOUT1, int_HCM15_DC_TIMEOUT1, int_HCM14_DC_TIMEOUT1, int_HCM13_DC_TIMEOUT1, int_HCM12_DC_TIMEOUT1, int_HCM11_DC_TIMEOUT1, int_HCM10_DC_TIMEOUT1, int_HCM9_DC_TIMEOUT1, int_HCM8_DC_TIMEOUT1, int_HCM7_DC_TIMEOUT1, int_HCM6_DC_TIMEOUT1, int_HCM5_DC_TIMEOUT1, int_HCM4_DC_TIMEOUT1, int_HCM3_DC_TIMEOUT1, int_HCM2_DC_TIMEOUT1, int_HCM1_DC_TIMEOUT1};
parameter [191:0] bus_HCM_DC_TIMEOUT2		= {int_HCM24_DC_TIMEOUT2, int_HCM23_DC_TIMEOUT2, int_HCM22_DC_TIMEOUT2, int_HCM21_DC_TIMEOUT2, int_HCM20_DC_TIMEOUT2, int_HCM19_DC_TIMEOUT2, int_HCM18_DC_TIMEOUT2, int_HCM17_DC_TIMEOUT2, int_HCM16_DC_TIMEOUT2, int_HCM15_DC_TIMEOUT2, int_HCM14_DC_TIMEOUT2, int_HCM13_DC_TIMEOUT2, int_HCM12_DC_TIMEOUT2, int_HCM11_DC_TIMEOUT2, int_HCM10_DC_TIMEOUT2, int_HCM9_DC_TIMEOUT2, int_HCM8_DC_TIMEOUT2, int_HCM7_DC_TIMEOUT2, int_HCM6_DC_TIMEOUT2, int_HCM5_DC_TIMEOUT2, int_HCM4_DC_TIMEOUT2, int_HCM3_DC_TIMEOUT2, int_HCM2_DC_TIMEOUT2, int_HCM1_DC_TIMEOUT2};
parameter [191:0] bus_HCM_DC_TIMEOUT3		= {int_HCM24_DC_TIMEOUT3, int_HCM23_DC_TIMEOUT3, int_HCM22_DC_TIMEOUT3, int_HCM21_DC_TIMEOUT3, int_HCM20_DC_TIMEOUT3, int_HCM19_DC_TIMEOUT3, int_HCM18_DC_TIMEOUT3, int_HCM17_DC_TIMEOUT3, int_HCM16_DC_TIMEOUT3, int_HCM15_DC_TIMEOUT3, int_HCM14_DC_TIMEOUT3, int_HCM13_DC_TIMEOUT3, int_HCM12_DC_TIMEOUT3, int_HCM11_DC_TIMEOUT3, int_HCM10_DC_TIMEOUT3, int_HCM9_DC_TIMEOUT3, int_HCM8_DC_TIMEOUT3, int_HCM7_DC_TIMEOUT3, int_HCM6_DC_TIMEOUT3, int_HCM5_DC_TIMEOUT3, int_HCM4_DC_TIMEOUT3, int_HCM3_DC_TIMEOUT3, int_HCM2_DC_TIMEOUT3, int_HCM1_DC_TIMEOUT3};
parameter [191:0] bus_HCM_DC_TIMEOUT4		= {int_HCM24_DC_TIMEOUT4, int_HCM23_DC_TIMEOUT4, int_HCM22_DC_TIMEOUT4, int_HCM21_DC_TIMEOUT4, int_HCM20_DC_TIMEOUT4, int_HCM19_DC_TIMEOUT4, int_HCM18_DC_TIMEOUT4, int_HCM17_DC_TIMEOUT4, int_HCM16_DC_TIMEOUT4, int_HCM15_DC_TIMEOUT4, int_HCM14_DC_TIMEOUT4, int_HCM13_DC_TIMEOUT4, int_HCM12_DC_TIMEOUT4, int_HCM11_DC_TIMEOUT4, int_HCM10_DC_TIMEOUT4, int_HCM9_DC_TIMEOUT4, int_HCM8_DC_TIMEOUT4, int_HCM7_DC_TIMEOUT4, int_HCM6_DC_TIMEOUT4, int_HCM5_DC_TIMEOUT4, int_HCM4_DC_TIMEOUT4, int_HCM3_DC_TIMEOUT4, int_HCM2_DC_TIMEOUT4, int_HCM1_DC_TIMEOUT4};
parameter [191:0] bus_HCM_DC_TIMEOUT5		= {int_HCM24_DC_TIMEOUT5, int_HCM23_DC_TIMEOUT5, int_HCM22_DC_TIMEOUT5, int_HCM21_DC_TIMEOUT5, int_HCM20_DC_TIMEOUT5, int_HCM19_DC_TIMEOUT5, int_HCM18_DC_TIMEOUT5, int_HCM17_DC_TIMEOUT5, int_HCM16_DC_TIMEOUT5, int_HCM15_DC_TIMEOUT5, int_HCM14_DC_TIMEOUT5, int_HCM13_DC_TIMEOUT5, int_HCM12_DC_TIMEOUT5, int_HCM11_DC_TIMEOUT5, int_HCM10_DC_TIMEOUT5, int_HCM9_DC_TIMEOUT5, int_HCM8_DC_TIMEOUT5, int_HCM7_DC_TIMEOUT5, int_HCM6_DC_TIMEOUT5, int_HCM5_DC_TIMEOUT5, int_HCM4_DC_TIMEOUT5, int_HCM3_DC_TIMEOUT5, int_HCM2_DC_TIMEOUT5, int_HCM1_DC_TIMEOUT5};
parameter [191:0] bus_HCM_DC_TIMEOUT6		= {int_HCM24_DC_TIMEOUT6, int_HCM23_DC_TIMEOUT6, int_HCM22_DC_TIMEOUT6, int_HCM21_DC_TIMEOUT6, int_HCM20_DC_TIMEOUT6, int_HCM19_DC_TIMEOUT6, int_HCM18_DC_TIMEOUT6, int_HCM17_DC_TIMEOUT6, int_HCM16_DC_TIMEOUT6, int_HCM15_DC_TIMEOUT6, int_HCM14_DC_TIMEOUT6, int_HCM13_DC_TIMEOUT6, int_HCM12_DC_TIMEOUT6, int_HCM11_DC_TIMEOUT6, int_HCM10_DC_TIMEOUT6, int_HCM9_DC_TIMEOUT6, int_HCM8_DC_TIMEOUT6, int_HCM7_DC_TIMEOUT6, int_HCM6_DC_TIMEOUT6, int_HCM5_DC_TIMEOUT6, int_HCM4_DC_TIMEOUT6, int_HCM3_DC_TIMEOUT6, int_HCM2_DC_TIMEOUT6, int_HCM1_DC_TIMEOUT6};
parameter [191:0] bus_HCM_DC_TIMEOUT7		= {int_HCM24_DC_TIMEOUT7, int_HCM23_DC_TIMEOUT7, int_HCM22_DC_TIMEOUT7, int_HCM21_DC_TIMEOUT7, int_HCM20_DC_TIMEOUT7, int_HCM19_DC_TIMEOUT7, int_HCM18_DC_TIMEOUT7, int_HCM17_DC_TIMEOUT7, int_HCM16_DC_TIMEOUT7, int_HCM15_DC_TIMEOUT7, int_HCM14_DC_TIMEOUT7, int_HCM13_DC_TIMEOUT7, int_HCM12_DC_TIMEOUT7, int_HCM11_DC_TIMEOUT7, int_HCM10_DC_TIMEOUT7, int_HCM9_DC_TIMEOUT7, int_HCM8_DC_TIMEOUT7, int_HCM7_DC_TIMEOUT7, int_HCM6_DC_TIMEOUT7, int_HCM5_DC_TIMEOUT7, int_HCM4_DC_TIMEOUT7, int_HCM3_DC_TIMEOUT7, int_HCM2_DC_TIMEOUT7, int_HCM1_DC_TIMEOUT7};
parameter [191:0] bus_HCM_DC_TIMEOUT8		= {int_HCM24_DC_TIMEOUT8, int_HCM23_DC_TIMEOUT8, int_HCM22_DC_TIMEOUT8, int_HCM21_DC_TIMEOUT8, int_HCM20_DC_TIMEOUT8, int_HCM19_DC_TIMEOUT8, int_HCM18_DC_TIMEOUT8, int_HCM17_DC_TIMEOUT8, int_HCM16_DC_TIMEOUT8, int_HCM15_DC_TIMEOUT8, int_HCM14_DC_TIMEOUT8, int_HCM13_DC_TIMEOUT8, int_HCM12_DC_TIMEOUT8, int_HCM11_DC_TIMEOUT8, int_HCM10_DC_TIMEOUT8, int_HCM9_DC_TIMEOUT8, int_HCM8_DC_TIMEOUT8, int_HCM7_DC_TIMEOUT8, int_HCM6_DC_TIMEOUT8, int_HCM5_DC_TIMEOUT8, int_HCM4_DC_TIMEOUT8, int_HCM3_DC_TIMEOUT8, int_HCM2_DC_TIMEOUT8, int_HCM1_DC_TIMEOUT8};

//-----------------------------------------------------------------------------
// Combine signals into buses                  
//-----------------------------------------------------------------------------
// LB interface signals   
wire int_hs2_enable, int_hs3_enable, int_hs4_enable, int_hs5_enable, int_hs6_enable, int_hs7_enable, int_hs8_enable, int_hs9_enable, int_hs10_enable, int_hs11_enable, int_hs12_enable, int_hs13_enable, int_hs14_enable, int_hs15_enable, int_hs16_enable, int_hs17_enable, int_hs18_enable, int_hs19_enable, int_hs20_enable, int_hs21_enable, int_hs22_enable, int_hs23_enable, int_hs24_enable;
`ifdef HCM2  assign int_hs2_enable = hs2_enable; `else assign int_hs2_enable = 1'b0; `endif 
`ifdef HCM3  assign int_hs3_enable = hs3_enable; `else assign int_hs3_enable = 1'b0; `endif 
`ifdef HCM4  assign int_hs4_enable = hs4_enable; `else assign int_hs4_enable = 1'b0; `endif 
`ifdef HCM5  assign int_hs5_enable = hs5_enable; `else assign int_hs5_enable = 1'b0; `endif 
`ifdef HCM6  assign int_hs6_enable = hs6_enable; `else assign int_hs6_enable = 1'b0; `endif 
`ifdef HCM7  assign int_hs7_enable = hs7_enable; `else assign int_hs7_enable = 1'b0; `endif 
`ifdef HCM8  assign int_hs8_enable = hs8_enable; `else assign int_hs8_enable = 1'b0; `endif  
`ifdef HCM9   assign int_hs9_enable = hs9_enable; `else assign int_hs9_enable = 1'b0; `endif
`ifdef HCM10  assign int_hs10_enable = hs10_enable; `else assign int_hs10_enable = 1'b0; `endif
`ifdef HCM11  assign int_hs11_enable = hs11_enable; `else assign int_hs11_enable = 1'b0; `endif
`ifdef HCM12  assign int_hs12_enable = hs12_enable; `else assign int_hs12_enable = 1'b0; `endif
`ifdef HCM13  assign int_hs13_enable = hs13_enable; `else assign int_hs13_enable = 1'b0; `endif
`ifdef HCM14  assign int_hs14_enable = hs14_enable; `else assign int_hs14_enable = 1'b0; `endif
`ifdef HCM15  assign int_hs15_enable = hs15_enable; `else assign int_hs15_enable = 1'b0; `endif
`ifdef HCM16  assign int_hs16_enable = hs16_enable; `else assign int_hs16_enable = 1'b0; `endif
`ifdef HCM17  assign int_hs17_enable = hs17_enable; `else assign int_hs17_enable = 1'b0; `endif
`ifdef HCM18  assign int_hs18_enable = hs18_enable; `else assign int_hs18_enable = 1'b0; `endif
`ifdef HCM19  assign int_hs19_enable = hs19_enable; `else assign int_hs19_enable = 1'b0; `endif
`ifdef HCM20  assign int_hs20_enable = hs20_enable; `else assign int_hs20_enable = 1'b0; `endif
`ifdef HCM21  assign int_hs21_enable = hs21_enable; `else assign int_hs21_enable = 1'b0; `endif
`ifdef HCM22  assign int_hs22_enable = hs22_enable; `else assign int_hs22_enable = 1'b0; `endif
`ifdef HCM23  assign int_hs23_enable = hs23_enable; `else assign int_hs23_enable = 1'b0; `endif
`ifdef HCM24  assign int_hs24_enable = hs24_enable; `else assign int_hs24_enable = 1'b0; `endif

wire [23:0] hs_enable;
assign hs_enable = {int_hs24_enable, int_hs23_enable, int_hs22_enable, int_hs21_enable, int_hs20_enable, int_hs19_enable, int_hs18_enable, int_hs17_enable, int_hs16_enable, int_hs15_enable, int_hs14_enable, int_hs13_enable, int_hs12_enable, int_hs11_enable, int_hs10_enable, int_hs9_enable, int_hs8_enable, int_hs7_enable, int_hs6_enable, int_hs5_enable,int_hs4_enable, int_hs3_enable, int_hs2_enable, hs1_enable};		       

wire int_oc24_clear, int_oc23_clear, int_oc22_clear, int_oc21_clear, int_oc20_clear, int_oc19_clear, int_oc18_clear, int_oc17_clear, int_oc16_clear, int_oc15_clear, int_oc14_clear, int_oc13_clear, int_oc12_clear, int_oc11_clear, int_oc10_clear, int_oc9_clear, int_oc8_clear, int_oc7_clear, int_oc6_clear, int_oc5_clear, int_oc4_clear, int_oc3_clear, int_oc2_clear;		
`ifdef HCM2  assign int_oc2_clear = oc2_clear; `else assign int_oc2_clear = 1'b0; `endif  
`ifdef HCM3  assign int_oc3_clear = oc3_clear; `else assign int_oc3_clear = 1'b0; `endif  
`ifdef HCM4  assign int_oc4_clear = oc4_clear; `else assign int_oc4_clear = 1'b0; `endif  
`ifdef HCM5  assign int_oc5_clear = oc5_clear; `else assign int_oc5_clear = 1'b0; `endif  
`ifdef HCM6  assign int_oc6_clear = oc6_clear; `else assign int_oc6_clear = 1'b0; `endif  
`ifdef HCM7  assign int_oc7_clear = oc7_clear; `else assign int_oc7_clear = 1'b0; `endif  
`ifdef HCM8  assign int_oc8_clear = oc8_clear; `else assign int_oc8_clear = 1'b0; `endif 
`ifdef HCM9  assign int_oc9_clear = oc9_clear; `else assign int_oc9_clear = 1'b0; `endif 
`ifdef HCM10  assign int_oc10_clear = oc10_clear; `else assign int_oc10_clear = 1'b0; `endif 
`ifdef HCM11  assign int_oc11_clear = oc11_clear; `else assign int_oc11_clear = 1'b0; `endif 
`ifdef HCM12  assign int_oc12_clear = oc12_clear; `else assign int_oc12_clear = 1'b0; `endif 
`ifdef HCM13  assign int_oc13_clear = oc13_clear; `else assign int_oc13_clear = 1'b0; `endif 
`ifdef HCM14  assign int_oc14_clear = oc14_clear; `else assign int_oc14_clear = 1'b0; `endif 
`ifdef HCM15  assign int_oc15_clear = oc15_clear; `else assign int_oc15_clear = 1'b0; `endif 
`ifdef HCM16  assign int_oc16_clear = oc16_clear; `else assign int_oc16_clear = 1'b0; `endif 
`ifdef HCM17  assign int_oc17_clear = oc17_clear; `else assign int_oc17_clear = 1'b0; `endif 
`ifdef HCM18  assign int_oc18_clear = oc18_clear; `else assign int_oc18_clear = 1'b0; `endif 
`ifdef HCM19  assign int_oc19_clear = oc19_clear; `else assign int_oc19_clear = 1'b0; `endif 
`ifdef HCM20  assign int_oc20_clear = oc20_clear; `else assign int_oc20_clear = 1'b0; `endif 
`ifdef HCM21  assign int_oc21_clear = oc21_clear; `else assign int_oc21_clear = 1'b0; `endif 
`ifdef HCM22  assign int_oc22_clear = oc22_clear; `else assign int_oc22_clear = 1'b0; `endif 
`ifdef HCM23  assign int_oc23_clear = oc23_clear; `else assign int_oc23_clear = 1'b0; `endif 
`ifdef HCM24  assign int_oc24_clear = oc24_clear; `else assign int_oc24_clear = 1'b0; `endif 

wire [23:0] oc_clear;
assign oc_clear  = {int_oc24_clear,  int_oc23_clear,  int_oc22_clear,  int_oc21_clear,  int_oc20_clear,  int_oc19_clear,  int_oc18_clear,  int_oc17_clear,  int_oc16_clear,  int_oc15_clear,  int_oc14_clear,  int_oc13_clear,  int_oc12_clear,  int_oc11_clear,  int_oc10_clear,  int_oc9_clear,  int_oc8_clear,  int_oc7_clear,  int_oc6_clear,  int_oc5_clear,  int_oc4_clear,  int_oc3_clear,  int_oc2_clear, oc1_clear};							

wire [23:0] hs_done; 
assign {hs24_done,	hs23_done,	hs22_done,	hs21_done,	hs20_done,	hs19_done,	hs18_done,	hs17_done,	hs16_done,	hs15_done,	hs14_done,	hs13_done,	hs12_done,	hs11_done,	hs10_done,	hs9_done,	hs8_done,	hs7_done,	hs6_done,	hs5_done,	hs4_done,	hs3_done,	hs2_done, hs1_done} = hs_done;

wire [23:0] hs_error; 
assign {hs24_error, hs23_error, hs22_error, hs21_error, hs20_error, hs19_error, hs18_error, hs17_error, hs16_error, hs15_error, hs14_error, hs13_error, hs12_error, hs11_error, hs10_error, hs9_error, hs8_error, hs7_error,	hs6_error,	hs5_error,	hs4_error,	hs3_error,	hs2_error, hs1_error} = hs_error;

wire [23:0] oc_error;
assign {oc24_error, oc23_error, oc22_error, oc21_error, oc20_error, oc19_error, oc18_error, oc17_error, oc16_error, oc15_error, oc14_error, oc13_error, oc12_error, oc11_error, oc10_error, oc9_error, oc8_error, oc7_error, oc6_error, oc5_error, oc4_error, oc3_error, oc2_error, oc1_error} = oc_error;			

// usp signals    
wire [8:1] int_hcm2_vphase, int_hcm3_vphase, int_hcm4_vphase, int_hcm5_vphase, int_hcm6_vphase, int_hcm7_vphase, int_hcm8_vphase, int_hcm9_vphase, int_hcm10_vphase, int_hcm11_vphase, int_hcm12_vphase, int_hcm13_vphase, int_hcm14_vphase, int_hcm15_vphase, int_hcm16_vphase, int_hcm17_vphase, int_hcm18_vphase, int_hcm19_vphase, int_hcm20_vphase, int_hcm21_vphase, int_hcm22_vphase, int_hcm23_vphase, int_hcm24_vphase;     
`ifdef HCM2  assign int_hcm2_vphase = hcm2_vphase; `else assign int_hcm2_vphase = 1'b0; `endif   
`ifdef HCM3  assign int_hcm3_vphase = hcm3_vphase; `else assign int_hcm3_vphase = 1'b0; `endif   
`ifdef HCM4  assign int_hcm4_vphase = hcm4_vphase; `else assign int_hcm4_vphase = 1'b0; `endif   
`ifdef HCM5  assign int_hcm5_vphase = hcm5_vphase; `else assign int_hcm5_vphase = 1'b0; `endif   
`ifdef HCM6  assign int_hcm6_vphase = hcm6_vphase; `else assign int_hcm6_vphase = 1'b0; `endif   
`ifdef HCM7  assign int_hcm7_vphase = hcm7_vphase; `else assign int_hcm7_vphase = 1'b0; `endif   
`ifdef HCM8  assign int_hcm8_vphase = hcm8_vphase; `else assign int_hcm8_vphase = 1'b0; `endif   
`ifdef HCM9  assign int_hcm9_vphase = hcm9_vphase; `else assign int_hcm9_vphase = 1'b0; `endif    
`ifdef HCM10  assign int_hcm10_vphase = hcm10_vphase; `else assign int_hcm10_vphase = 1'b0; `endif    
`ifdef HCM11  assign int_hcm11_vphase = hcm11_vphase; `else assign int_hcm11_vphase = 1'b0; `endif    
`ifdef HCM12  assign int_hcm12_vphase = hcm12_vphase; `else assign int_hcm12_vphase = 1'b0; `endif    
`ifdef HCM13  assign int_hcm13_vphase = hcm13_vphase; `else assign int_hcm13_vphase = 1'b0; `endif    
`ifdef HCM14  assign int_hcm14_vphase = hcm14_vphase; `else assign int_hcm14_vphase = 1'b0; `endif    
`ifdef HCM15  assign int_hcm15_vphase = hcm15_vphase; `else assign int_hcm15_vphase = 1'b0; `endif    
`ifdef HCM16  assign int_hcm16_vphase = hcm16_vphase; `else assign int_hcm16_vphase = 1'b0; `endif    
`ifdef HCM17  assign int_hcm17_vphase = hcm17_vphase; `else assign int_hcm17_vphase = 1'b0; `endif    
`ifdef HCM18  assign int_hcm18_vphase = hcm18_vphase; `else assign int_hcm18_vphase = 1'b0; `endif    
`ifdef HCM19  assign int_hcm19_vphase = hcm19_vphase; `else assign int_hcm19_vphase = 1'b0; `endif    
`ifdef HCM20  assign int_hcm20_vphase = hcm20_vphase; `else assign int_hcm20_vphase = 1'b0; `endif    
`ifdef HCM21  assign int_hcm21_vphase = hcm21_vphase; `else assign int_hcm21_vphase = 1'b0; `endif    
`ifdef HCM22  assign int_hcm22_vphase = hcm22_vphase; `else assign int_hcm22_vphase = 1'b0; `endif    
`ifdef HCM23  assign int_hcm23_vphase = hcm23_vphase; `else assign int_hcm23_vphase = 1'b0; `endif    
`ifdef HCM24  assign int_hcm24_vphase = hcm24_vphase; `else assign int_hcm24_vphase = 1'b0; `endif    

wire [8:1] hcm_vphase [23:0];
assign hcm_vphase[0] = hcm1_vphase;
assign hcm_vphase[1] = int_hcm2_vphase;
assign hcm_vphase[2] = int_hcm3_vphase; 
assign hcm_vphase[3] = int_hcm4_vphase; 
assign hcm_vphase[4] = int_hcm5_vphase; 
assign hcm_vphase[5] = int_hcm6_vphase; 
assign hcm_vphase[6] = int_hcm7_vphase; 
assign hcm_vphase[7] = int_hcm8_vphase; 
assign hcm_vphase[8] = int_hcm9_vphase;
assign hcm_vphase[9] = int_hcm10_vphase;
assign hcm_vphase[10] = int_hcm11_vphase;
assign hcm_vphase[11] = int_hcm12_vphase;
assign hcm_vphase[12] = int_hcm13_vphase;
assign hcm_vphase[13] = int_hcm14_vphase;
assign hcm_vphase[14] = int_hcm15_vphase;
assign hcm_vphase[15] = int_hcm16_vphase;
assign hcm_vphase[16] = int_hcm17_vphase;
assign hcm_vphase[17] = int_hcm18_vphase;
assign hcm_vphase[18] = int_hcm19_vphase;
assign hcm_vphase[19] = int_hcm20_vphase;
assign hcm_vphase[20] = int_hcm21_vphase;
assign hcm_vphase[21] = int_hcm22_vphase;
assign hcm_vphase[22] = int_hcm23_vphase;
assign hcm_vphase[23] = int_hcm24_vphase;

wire int_oc2_detect_3wi, int_oc3_detect_3wi,int_oc4_detect_3wi, int_oc5_detect_3wi, int_oc6_detect_3wi, int_oc7_detect_3wi, int_oc8_detect_3wi, int_oc9_detect_3wi, int_oc10_detect_3wi, int_oc11_detect_3wi, int_oc12_detect_3wi, int_oc13_detect_3wi, int_oc14_detect_3wi, int_oc15_detect_3wi, int_oc16_detect_3wi, int_oc17_detect_3wi, int_oc18_detect_3wi, int_oc19_detect_3wi, int_oc20_detect_3wi, int_oc21_detect_3wi, int_oc22_detect_3wi, int_oc23_detect_3wi, int_oc24_detect_3wi;  
`ifdef HCM2  assign int_oc2_detect_3wi = oc2_detect_3wi; `else assign int_oc2_detect_3wi = 1'b0; `endif    
`ifdef HCM3  assign int_oc3_detect_3wi = oc3_detect_3wi; `else assign int_oc3_detect_3wi = 1'b0; `endif    
`ifdef HCM4  assign int_oc4_detect_3wi = oc4_detect_3wi; `else assign int_oc4_detect_3wi = 1'b0; `endif    
`ifdef HCM5  assign int_oc5_detect_3wi = oc5_detect_3wi; `else assign int_oc5_detect_3wi = 1'b0; `endif    
`ifdef HCM6  assign int_oc6_detect_3wi = oc6_detect_3wi; `else assign int_oc6_detect_3wi = 1'b0; `endif    
`ifdef HCM7  assign int_oc7_detect_3wi = oc7_detect_3wi; `else assign int_oc7_detect_3wi = 1'b0; `endif    
`ifdef HCM8  assign int_oc8_detect_3wi = oc8_detect_3wi; `else assign int_oc8_detect_3wi = 1'b0; `endif  
`ifdef HCM9  assign int_oc9_detect_3wi = oc9_detect_3wi; `else assign int_oc9_detect_3wi = 1'b0; `endif 
`ifdef HCM10  assign int_oc10_detect_3wi = oc10_detect_3wi; `else assign int_oc10_detect_3wi = 1'b0; `endif 
`ifdef HCM11  assign int_oc11_detect_3wi = oc11_detect_3wi; `else assign int_oc11_detect_3wi = 1'b0; `endif 
`ifdef HCM12  assign int_oc12_detect_3wi = oc12_detect_3wi; `else assign int_oc12_detect_3wi = 1'b0; `endif 
`ifdef HCM13  assign int_oc13_detect_3wi = oc13_detect_3wi; `else assign int_oc13_detect_3wi = 1'b0; `endif 
`ifdef HCM14  assign int_oc14_detect_3wi = oc14_detect_3wi; `else assign int_oc14_detect_3wi = 1'b0; `endif 
`ifdef HCM15  assign int_oc15_detect_3wi = oc15_detect_3wi; `else assign int_oc15_detect_3wi = 1'b0; `endif 
`ifdef HCM16  assign int_oc16_detect_3wi = oc16_detect_3wi; `else assign int_oc16_detect_3wi = 1'b0; `endif 
`ifdef HCM17  assign int_oc17_detect_3wi = oc17_detect_3wi; `else assign int_oc17_detect_3wi = 1'b0; `endif 
`ifdef HCM18  assign int_oc18_detect_3wi = oc18_detect_3wi; `else assign int_oc18_detect_3wi = 1'b0; `endif 
`ifdef HCM19  assign int_oc19_detect_3wi = oc19_detect_3wi; `else assign int_oc19_detect_3wi = 1'b0; `endif 
`ifdef HCM20  assign int_oc20_detect_3wi = oc20_detect_3wi; `else assign int_oc20_detect_3wi = 1'b0; `endif 
`ifdef HCM21  assign int_oc21_detect_3wi = oc21_detect_3wi; `else assign int_oc21_detect_3wi = 1'b0; `endif 
`ifdef HCM22  assign int_oc22_detect_3wi = oc22_detect_3wi; `else assign int_oc22_detect_3wi = 1'b0; `endif 
`ifdef HCM23  assign int_oc23_detect_3wi = oc23_detect_3wi; `else assign int_oc23_detect_3wi = 1'b0; `endif 
`ifdef HCM24  assign int_oc24_detect_3wi = oc24_detect_3wi; `else assign int_oc24_detect_3wi = 1'b0; `endif 
  
wire [23:0] oc_detect_3wi;
assign oc_detect_3wi = {int_oc24_detect_3wi, int_oc23_detect_3wi, int_oc22_detect_3wi, int_oc21_detect_3wi, int_oc20_detect_3wi, int_oc19_detect_3wi, int_oc18_detect_3wi, int_oc17_detect_3wi, int_oc16_detect_3wi, int_oc15_detect_3wi, int_oc14_detect_3wi, int_oc13_detect_3wi, int_oc12_detect_3wi, int_oc11_detect_3wi, int_oc10_detect_3wi, int_oc9_detect_3wi, int_oc8_detect_3wi, int_oc7_detect_3wi, int_oc6_detect_3wi, int_oc5_detect_3wi, int_oc4_detect_3wi, int_oc3_detect_3wi, int_oc2_detect_3wi, oc1_detect_3wi};

wire int_hcm2_iphase, int_hcm3_iphase, int_hcm4_iphase, int_hcm5_iphase, int_hcm6_iphase, int_hcm7_iphase, int_hcm8_iphase, int_hcm9_iphase, int_hcm10_iphase, int_hcm11_iphase, int_hcm12_iphase, int_hcm13_iphase, int_hcm14_iphase, int_hcm15_iphase, int_hcm16_iphase, int_hcm17_iphase, int_hcm18_iphase, int_hcm19_iphase, int_hcm20_iphase, int_hcm21_iphase, int_hcm22_iphase, int_hcm23_iphase, int_hcm24_iphase;     
`ifdef HCM2  assign int_hcm2_iphase = hcm2_iphase; `else assign int_hcm2_iphase = 1'b0; `endif       
`ifdef HCM3  assign int_hcm3_iphase = hcm3_iphase; `else assign int_hcm3_iphase = 1'b0; `endif       
`ifdef HCM4  assign int_hcm4_iphase = hcm4_iphase; `else assign int_hcm4_iphase = 1'b0; `endif       
`ifdef HCM5  assign int_hcm5_iphase = hcm5_iphase; `else assign int_hcm5_iphase = 1'b0; `endif       
`ifdef HCM6  assign int_hcm6_iphase = hcm6_iphase; `else assign int_hcm6_iphase = 1'b0; `endif       
`ifdef HCM7  assign int_hcm7_iphase = hcm7_iphase; `else assign int_hcm7_iphase = 1'b0; `endif       
`ifdef HCM8  assign int_hcm8_iphase = hcm8_iphase; `else assign int_hcm8_iphase = 1'b0; `endif       
`ifdef HCM9  assign int_hcm9_iphase = hcm9_iphase; `else assign int_hcm9_iphase = 1'b0; `endif   
`ifdef HCM10  assign int_hcm10_iphase = hcm10_iphase; `else assign int_hcm10_iphase = 1'b0; `endif   
`ifdef HCM11  assign int_hcm11_iphase = hcm11_iphase; `else assign int_hcm11_iphase = 1'b0; `endif   
`ifdef HCM12  assign int_hcm12_iphase = hcm12_iphase; `else assign int_hcm12_iphase = 1'b0; `endif   
`ifdef HCM13  assign int_hcm13_iphase = hcm13_iphase; `else assign int_hcm13_iphase = 1'b0; `endif   
`ifdef HCM14  assign int_hcm14_iphase = hcm14_iphase; `else assign int_hcm14_iphase = 1'b0; `endif   
`ifdef HCM15  assign int_hcm15_iphase = hcm15_iphase; `else assign int_hcm15_iphase = 1'b0; `endif   
`ifdef HCM16  assign int_hcm16_iphase = hcm16_iphase; `else assign int_hcm16_iphase = 1'b0; `endif   
`ifdef HCM17  assign int_hcm17_iphase = hcm17_iphase; `else assign int_hcm17_iphase = 1'b0; `endif   
`ifdef HCM18  assign int_hcm18_iphase = hcm18_iphase; `else assign int_hcm18_iphase = 1'b0; `endif   
`ifdef HCM19  assign int_hcm19_iphase = hcm19_iphase; `else assign int_hcm19_iphase = 1'b0; `endif   
`ifdef HCM20  assign int_hcm20_iphase = hcm20_iphase; `else assign int_hcm20_iphase = 1'b0; `endif   
`ifdef HCM21  assign int_hcm21_iphase = hcm21_iphase; `else assign int_hcm21_iphase = 1'b0; `endif   
`ifdef HCM22  assign int_hcm22_iphase = hcm22_iphase; `else assign int_hcm22_iphase = 1'b0; `endif   
`ifdef HCM23  assign int_hcm23_iphase = hcm23_iphase; `else assign int_hcm23_iphase = 1'b0; `endif   
`ifdef HCM24  assign int_hcm24_iphase = hcm24_iphase; `else assign int_hcm24_iphase = 1'b0; `endif   
   
wire [23:0] hcm_iphase;
assign hcm_iphase = {int_hcm24_iphase, int_hcm23_iphase, int_hcm22_iphase, int_hcm21_iphase, int_hcm20_iphase, int_hcm19_iphase, int_hcm18_iphase, int_hcm17_iphase, int_hcm16_iphase, int_hcm15_iphase, int_hcm14_iphase, int_hcm13_iphase, int_hcm12_iphase, int_hcm11_iphase, int_hcm10_iphase, int_hcm9_iphase, int_hcm8_iphase, int_hcm7_iphase, int_hcm6_iphase, int_hcm5_iphase, int_hcm4_iphase, int_hcm3_iphase, int_hcm2_iphase, hcm1_iphase};

wire [3:0] hvimon_th [23:0];
assign hvimon1_th = hvimon_th[0];
assign hvimon2_th = hvimon_th[1];
assign hvimon3_th = hvimon_th[2];
assign hvimon4_th = hvimon_th[3];
assign hvimon5_th = hvimon_th[4];
assign hvimon6_th = hvimon_th[5];
assign hvimon7_th = hvimon_th[6];
assign hvimon8_th = hvimon_th[7];
assign hvimon9_th = hvimon_th[8];
assign hvimon10_th = hvimon_th[9];
assign hvimon11_th = hvimon_th[10];
assign hvimon12_th = hvimon_th[11];
assign hvimon13_th = hvimon_th[12];
assign hvimon14_th = hvimon_th[13];
assign hvimon15_th = hvimon_th[14];
assign hvimon16_th = hvimon_th[15];
assign hvimon17_th = hvimon_th[16];
assign hvimon18_th = hvimon_th[17];
assign hvimon19_th = hvimon_th[18];
assign hvimon20_th = hvimon_th[19];
assign hvimon21_th = hvimon_th[20];
assign hvimon22_th = hvimon_th[21];
assign hvimon23_th = hvimon_th[22];
assign hvimon24_th = hvimon_th[23];

wire [23:0] hcm_enable;				
assign hcm1_enable =  hcm_enable[0];	
assign hcm2_enable =  hcm_enable[1];	
assign hcm3_enable =  hcm_enable[2];	
assign hcm4_enable =  hcm_enable[3];
assign hcm5_enable =  hcm_enable[4];
assign hcm6_enable =  hcm_enable[5];
assign hcm7_enable =  hcm_enable[6];
assign hcm8_enable =  hcm_enable[7];
assign hcm9_enable =  hcm_enable[8];
assign hcm10_enable =  hcm_enable[9];
assign hcm11_enable =  hcm_enable[10];
assign hcm12_enable =  hcm_enable[11];
assign hcm13_enable =  hcm_enable[12];
assign hcm14_enable =  hcm_enable[13];
assign hcm15_enable =  hcm_enable[14];
assign hcm16_enable =  hcm_enable[15];
assign hcm17_enable =  hcm_enable[16];
assign hcm18_enable =  hcm_enable[17];
assign hcm19_enable =  hcm_enable[18];
assign hcm20_enable =  hcm_enable[19];
assign hcm21_enable =  hcm_enable[20];
assign hcm22_enable =  hcm_enable[21];
assign hcm23_enable =  hcm_enable[22];
assign hcm24_enable =  hcm_enable[23];

wire [23:0] cmp_select;		
assign cmp1_select = cmp_select[0];
assign cmp2_select = cmp_select[1];
assign cmp3_select = cmp_select[2];      
assign cmp4_select = cmp_select[3];
assign cmp5_select = cmp_select[4];
assign cmp6_select = cmp_select[5];
assign cmp7_select = cmp_select[6];
assign cmp8_select = cmp_select[7];
assign cmp9_select = cmp_select[8];
assign cmp10_select = cmp_select[9];
assign cmp11_select = cmp_select[10];
assign cmp12_select = cmp_select[11];
assign cmp13_select = cmp_select[12];
assign cmp14_select = cmp_select[13];
assign cmp15_select = cmp_select[14];
assign cmp16_select = cmp_select[15];
assign cmp17_select = cmp_select[16];
assign cmp18_select = cmp_select[17];
assign cmp19_select = cmp_select[18];
assign cmp20_select = cmp_select[19];
assign cmp21_select = cmp_select[20];
assign cmp22_select = cmp_select[21];
assign cmp23_select = cmp_select[22];
assign cmp24_select = cmp_select[23];

wire [23:0] direct_control;
assign direct1_control = direct_control[0];
assign direct2_control = direct_control[1];
assign direct3_control = direct_control[2];
assign direct4_control = direct_control[3];   
assign direct5_control = direct_control[4];   
assign direct6_control = direct_control[5];   
assign direct7_control = direct_control[6];   
assign direct8_control = direct_control[7];  
assign direct9_control = direct_control[8]; 
assign direct10_control = direct_control[9]; 
assign direct11_control = direct_control[10]; 
assign direct12_control = direct_control[11]; 
assign direct13_control = direct_control[12]; 
assign direct14_control = direct_control[13]; 
assign direct15_control = direct_control[14]; 
assign direct16_control = direct_control[15]; 
assign direct17_control = direct_control[16]; 
assign direct18_control = direct_control[17]; 
assign direct19_control = direct_control[18]; 
assign direct20_control = direct_control[19]; 
assign direct21_control = direct_control[20]; 
assign direct22_control = direct_control[21]; 
assign direct23_control = direct_control[22]; 
assign direct24_control = direct_control[23]; 

// external pins  
wire int_oc2_detect, int_oc3_detect, int_oc4_detect, int_oc5_detect, int_oc6_detect, int_oc7_detect, int_oc8_detect, int_oc9_detect, int_oc10_detect, int_oc11_detect, int_oc12_detect, int_oc13_detect, int_oc14_detect, int_oc15_detect, int_oc16_detect, int_oc17_detect, int_oc18_detect, int_oc19_detect, int_oc20_detect, int_oc21_detect, int_oc22_detect, int_oc23_detect, int_oc24_detect;      
`ifdef HCM2  assign int_oc2_detect = oc2_detect; `else assign int_oc2_detect = 1'b0; `endif       
`ifdef HCM3  assign int_oc3_detect = oc3_detect; `else assign int_oc3_detect = 1'b0; `endif       
`ifdef HCM4  assign int_oc4_detect = oc4_detect; `else assign int_oc4_detect = 1'b0; `endif       
`ifdef HCM5  assign int_oc5_detect = oc5_detect; `else assign int_oc5_detect = 1'b0; `endif       
`ifdef HCM6  assign int_oc6_detect = oc6_detect; `else assign int_oc6_detect = 1'b0; `endif       
`ifdef HCM7  assign int_oc7_detect = oc7_detect; `else assign int_oc7_detect = 1'b0; `endif       
`ifdef HCM8  assign int_oc8_detect = oc8_detect; `else assign int_oc8_detect = 1'b0; `endif  
`ifdef HCM9   assign int_oc9_detect = oc9_detect; `else assign int_oc9_detect = 1'b0; `endif
`ifdef HCM10  assign int_oc10_detect = oc10_detect; `else assign int_oc10_detect = 1'b0; `endif
`ifdef HCM11  assign int_oc11_detect = oc11_detect; `else assign int_oc11_detect = 1'b0; `endif
`ifdef HCM12  assign int_oc12_detect = oc12_detect; `else assign int_oc12_detect = 1'b0; `endif
`ifdef HCM13  assign int_oc13_detect = oc13_detect; `else assign int_oc13_detect = 1'b0; `endif
`ifdef HCM14  assign int_oc14_detect = oc14_detect; `else assign int_oc14_detect = 1'b0; `endif
`ifdef HCM15  assign int_oc15_detect = oc15_detect; `else assign int_oc15_detect = 1'b0; `endif
`ifdef HCM16  assign int_oc16_detect = oc16_detect; `else assign int_oc16_detect = 1'b0; `endif
`ifdef HCM17  assign int_oc17_detect = oc17_detect; `else assign int_oc17_detect = 1'b0; `endif
`ifdef HCM18  assign int_oc18_detect = oc18_detect; `else assign int_oc18_detect = 1'b0; `endif
`ifdef HCM19  assign int_oc19_detect = oc19_detect; `else assign int_oc19_detect = 1'b0; `endif
`ifdef HCM20  assign int_oc20_detect = oc20_detect; `else assign int_oc20_detect = 1'b0; `endif
`ifdef HCM21  assign int_oc21_detect = oc21_detect; `else assign int_oc21_detect = 1'b0; `endif
`ifdef HCM22  assign int_oc22_detect = oc22_detect; `else assign int_oc22_detect = 1'b0; `endif
`ifdef HCM23  assign int_oc23_detect = oc23_detect; `else assign int_oc23_detect = 1'b0; `endif
`ifdef HCM24  assign int_oc24_detect = oc24_detect; `else assign int_oc24_detect = 1'b0; `endif

wire [23:0] oc_detect;
assign oc_detect =  {int_oc24_detect, int_oc23_detect, int_oc22_detect, int_oc21_detect, int_oc20_detect, int_oc19_detect, int_oc18_detect, int_oc17_detect, int_oc16_detect, int_oc15_detect, int_oc14_detect, int_oc13_detect, int_oc12_detect, int_oc11_detect, int_oc10_detect, int_oc9_detect, int_oc8_detect, int_oc7_detect, int_oc6_detect, int_oc5_detect, int_oc4_detect, int_oc3_detect, int_oc2_detect, oc1_detect};

wire [23:0] shutdown;
assign {shutdown24,	shutdown23,	shutdown22,	shutdown21,	shutdown20,	shutdown19,	shutdown18,	shutdown17,	shutdown16,	shutdown15,	shutdown14,	shutdown13,	shutdown12,	shutdown11,	shutdown10,	shutdown9,	shutdown8,	shutdown7,	shutdown6,	shutdown5,	shutdown4,	shutdown3,	shutdown2, shutdown1} = shutdown;

//-----------------------------------------------------------------------------  
// Generate individual HCM intances

//-----------------------------------------------------------------------------  
generate                                    
  genvar i;                                 
  for (i=0; i<=int_HOTSWAP_NUMBER-1; i = i + 1)     
    begin: hs                        
		hsctl_core
				# 
				(	
					.HCM_SOA_TYPE			 (bus_HCM_SOA_TYPE[i]),				
					.HCM_HVIMON 			 (bus_HCM_HVIMON[i]			  ),						
					.HCM_VMON_PHASE 	 (bus_HCM_VMON_PHASE[i*4+3:i*4]	  ),				
					.HCM_FAST_SHUTDOWN (bus_HCM_FAST_SHUTDOWN[i*2+1:i*2] ), 		
						
					.HCM_TRESHOLD1(bus_HCM_TRESHOLD1[i*4+3:i*4]),				
					.HCM_TRESHOLD2(bus_HCM_TRESHOLD2[i*4+3:i*4]),    
					.HCM_TRESHOLD3(bus_HCM_TRESHOLD3[i*4+3:i*4]),    
					.HCM_TRESHOLD4(bus_HCM_TRESHOLD4[i*4+3:i*4]),    
					.HCM_TRESHOLD5(bus_HCM_TRESHOLD5[i*4+3:i*4]),    
					.HCM_TRESHOLD6(bus_HCM_TRESHOLD6[i*4+3:i*4]),    
					.HCM_TRESHOLD7(bus_HCM_TRESHOLD7[i*4+3:i*4]),    
					.HCM_TRESHOLD8(bus_HCM_TRESHOLD8[i*4+3:i*4]), 
				
					.HCM_LOOP_MAX1(bus_HCM_LOOP_MAX1[i*4+3:i*4]),					
					.HCM_LOOP_MAX2(bus_HCM_LOOP_MAX2[i*4+3:i*4]),          
					.HCM_LOOP_MAX3(bus_HCM_LOOP_MAX3[i*4+3:i*4]),          
					.HCM_LOOP_MAX4(bus_HCM_LOOP_MAX4[i*4+3:i*4]),          
					.HCM_LOOP_MAX5(bus_HCM_LOOP_MAX5[i*4+3:i*4]),          
					.HCM_LOOP_MAX6(bus_HCM_LOOP_MAX6[i*4+3:i*4]),          
					.HCM_LOOP_MAX7(bus_HCM_LOOP_MAX7[i*4+3:i*4]),          
					.HCM_LOOP_MAX8(bus_HCM_LOOP_MAX8[i*4+3:i*4]),          
					.HCM_COOLDOWN (bus_HCM_COOLDOWN [i*8+7:i*8]),					
					                      
					.HCM_DC_TIMEOUT1(bus_HCM_DC_TIMEOUT1[i*8+7:i*8]),				
					.HCM_DC_TIMEOUT2(bus_HCM_DC_TIMEOUT2[i*8+7:i*8]),       
					.HCM_DC_TIMEOUT3(bus_HCM_DC_TIMEOUT3[i*8+7:i*8]),        
					.HCM_DC_TIMEOUT4(bus_HCM_DC_TIMEOUT4[i*8+7:i*8]),        
					.HCM_DC_TIMEOUT5(bus_HCM_DC_TIMEOUT5[i*8+7:i*8]),                                                                      
					.HCM_DC_TIMEOUT6(bus_HCM_DC_TIMEOUT6[i*8+7:i*8]),                                                                      
					.HCM_DC_TIMEOUT7(bus_HCM_DC_TIMEOUT7[i*8+7:i*8]),                                                                      
					.HCM_DC_TIMEOUT8(bus_HCM_DC_TIMEOUT8[i*8+7:i*8])  				
				)  
				hs_inst
				( 
					// global signals
					.clk(clk),														// using the same clock as LB 
					.rstn(rstn),														// using the same reset as LB
					
					// LB interface signals
					.hs_enable(hs_enable[i]),											// enable the hs to start
					.oc_clear(oc_clear[i]),												// clear the over current status
					.hs_done (hs_done[i] ),										// hot swap is done
					.hs_error(hs_error[i]),									// hot swap has error when exceed timer limit
					.oc_error(oc_error[i]),											// over current is detected
					
					// usp signals 
					.hcm_vphase   (hcm_vphase[i]),  			// voltage phase status signals, up to 8 phases
					.oc_detect_3wi(oc_detect_3wi[i]),									// over current is detected, status comes from 3wi
					.hcm_iphase   (hcm_iphase[i]),											// detect whether the IMON2 threshld is reached. Only used for HVIMON 
					
					
					.hvimon_th (hvimon_th [i] ), 					// 4-bit trip point value for hvimon (or imon2) in ASC
					.hcm_enable(hcm_enable[i]),								// enable hysteretic control of HCM in ASC
					.cmp_select(cmp_select[i]),								// comparator select in the HCM 
					.direct_control(direct_control[i]),						// set direct control value for HCM
					
					// external pins
					.oc_detect(oc_detect[i]),											// over current detection, status comes from pin
					.shutdown	(shutdown[i])											// shut down signal from hs controller					
					);    
		end
endgenerate					
			
           		
endmodule
					
					
					
					
					
					
