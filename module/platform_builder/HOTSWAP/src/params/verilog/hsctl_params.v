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
// File                  : hsctl_params.v                                                 
// Title                 : How Swap Controller parameter file                               
// Dependencies          :                                                              
//                       :                                                              
// Description           : Hot Swap Controller parameter file                                
// =============================================================================        
//                        REVISION HISTORY                                              
// Version               : 1.0                                                          
// Changes Made          : Initial Release                                              
// Author(s)             : CMUI                                                         
// Mod. Date             : Sep, 2013                                                   
// =============================================================================        


`define HOTSWAP_NUMBER 1						   // number of hot swap processes       
//`define HCM2          
//`define HCM3 
//`define HCM4   
//`define HCM5
//`define HCM6
//`define HCM7
//`define HCM8
//`define HCM9   
//`define HCM10  
//`define HCM11  
//`define HCM12  
//`define HCM13  
//`define HCM14  
//`define HCM15  
//`define HCM16  
//`define HCM17  
//`define HCM18  
//`define HCM19  
//`define HCM20  
//`define HCM21  
//`define HCM22  
//`define HCM23  
//`define HCM24  
                                                                                                          
`define HCM1_SOA_TYPE 1'b0			       // 0 = 10ms SOA curve, 1 = DC SOA curve                             
`define HCM1_HVIMON 1'b0			         // 1 = use 4-bit hvmon trip point values                            
`define HCM1_VMON_PHASE  1	        	 // vmon phases, range is 1 to 8                                                                                                            
`define HCM1_FAST_SHUTDOWN  0          // 0 = no oc detection, 1 = slow shutdown, 2 = fast shutdown                                                                                                     
`define HCM1_TRESHOLD1 4'h0	           // the 4-bit trip point value for each phase                           
`define HCM1_TRESHOLD2 4'h0                                                                                  
`define HCM1_TRESHOLD3 4'h0                                                                                  
`define HCM1_TRESHOLD4 4'h0                                                                                  
`define HCM1_TRESHOLD5 4'h0                                                                                  
`define HCM1_TRESHOLD6 4'h0                                                                                  
`define HCM1_TRESHOLD7 4'h0                                                                                  
`define HCM1_TRESHOLD8 4'h0                                                                                                                                                                                              
`define HCM1_LOOP_MAX1 1		           // number of loops to repeat the hysteretic control in a phase, values 1 to 8   
`define HCM1_LOOP_MAX2 1                                                                                     
`define HCM1_LOOP_MAX3 1                                                                                     
`define HCM1_LOOP_MAX4 1                                                                                     
`define HCM1_LOOP_MAX5 1                                                                                     
`define HCM1_LOOP_MAX6 1                                                                                     
`define HCM1_LOOP_MAX7 1                                                                                     
`define HCM1_LOOP_MAX8 1                                                                                     
`define HCM1_COOLDOWN  50		           // cool down period between repeats within a phase                                                                                                                                
`define HCM1_DC_TIMEOUT1 50	           // timer length for each phase for DC SOA curve                        
`define HCM1_DC_TIMEOUT2 50                                                                                  
`define HCM1_DC_TIMEOUT3 50  
`define HCM1_DC_TIMEOUT4 50  
`define HCM1_DC_TIMEOUT5 50  
`define HCM1_DC_TIMEOUT6 50  
`define HCM1_DC_TIMEOUT7 50  
`define HCM1_DC_TIMEOUT8 50              

`define HCM2_SOA_TYPE 1'b0			         
`define HCM2_HVIMON 1'b0				         
`define HCM2_VMON_PHASE  1		           
`define HCM2_FAST_SHUTDOWN  0                                                 
`define HCM2_TRESHOLD1 4'h0	         
`define HCM2_TRESHOLD2 4'h0           
`define HCM2_TRESHOLD3 4'h0           
`define HCM2_TRESHOLD4 4'h0           
`define HCM2_TRESHOLD5 4'h0           
`define HCM2_TRESHOLD6 4'h0           
`define HCM2_TRESHOLD7 4'h0           
`define HCM2_TRESHOLD8 4'h0                                                  
`define HCM2_LOOP_MAX1 1		           
`define HCM2_LOOP_MAX2 1              
`define HCM2_LOOP_MAX3 1              
`define HCM2_LOOP_MAX4 1              
`define HCM2_LOOP_MAX5 1              
`define HCM2_LOOP_MAX6 1              
`define HCM2_LOOP_MAX7 1              
`define HCM2_LOOP_MAX8 1              
`define HCM2_COOLDOWN  50	                                                
`define HCM2_DC_TIMEOUT1 50	         
`define HCM2_DC_TIMEOUT2 50                                                                                     
`define HCM2_DC_TIMEOUT3 50                                                                                         
`define HCM2_DC_TIMEOUT4 50                                                                                         
`define HCM2_DC_TIMEOUT5 50                                                                                         
`define HCM2_DC_TIMEOUT6 50                                                                                         
`define HCM2_DC_TIMEOUT7 50                                                                                         
`define HCM2_DC_TIMEOUT8 50                                                                                         

`define HCM3_SOA_TYPE 1'b0		    
`define HCM3_HVIMON 1'b0			  
`define HCM3_VMON_PHASE  1		 
`define HCM3_FAST_SHUTDOWN  0                               
`define HCM3_TRESHOLD1 4'h0	    
`define HCM3_TRESHOLD2 4'h0     
`define HCM3_TRESHOLD3 4'h0     
`define HCM3_TRESHOLD4 4'h0     
`define HCM3_TRESHOLD5 4'h0     
`define HCM3_TRESHOLD6 4'h0     
`define HCM3_TRESHOLD7 4'h0     
`define HCM3_TRESHOLD8 4'h0                                  
`define HCM3_LOOP_MAX1 1		    
`define HCM3_LOOP_MAX2 1        
`define HCM3_LOOP_MAX3 1        
`define HCM3_LOOP_MAX4 1        
`define HCM3_LOOP_MAX5 1        
`define HCM3_LOOP_MAX6 1        
`define HCM3_LOOP_MAX7 1        
`define HCM3_LOOP_MAX8 1        
`define HCM3_COOLDOWN  50		                                 
`define HCM3_DC_TIMEOUT1 50	    
`define HCM3_DC_TIMEOUT2 50     
`define HCM3_DC_TIMEOUT3 50     
`define HCM3_DC_TIMEOUT4 50     
`define HCM3_DC_TIMEOUT5 50     
`define HCM3_DC_TIMEOUT6 50     
`define HCM3_DC_TIMEOUT7 50     
`define HCM3_DC_TIMEOUT8 50    
                              
`define HCM4_SOA_TYPE 1'b0		  
`define HCM4_HVIMON 1'b0			  
`define HCM4_VMON_PHASE  1		 
`define HCM4_FAST_SHUTDOWN  2                        
`define HCM4_TRESHOLD1 4'h0	    
`define HCM4_TRESHOLD2 4'h0     
`define HCM4_TRESHOLD3 4'h0     
`define HCM4_TRESHOLD4 4'h0     
`define HCM4_TRESHOLD5 4'h0     
`define HCM4_TRESHOLD6 4'hf     
`define HCM4_TRESHOLD7 4'h0     
`define HCM4_TRESHOLD8 4'h0                                  
`define HCM4_LOOP_MAX1 1		    
`define HCM4_LOOP_MAX2 1        
`define HCM4_LOOP_MAX3 1        
`define HCM4_LOOP_MAX4 1        
`define HCM4_LOOP_MAX5 1        
`define HCM4_LOOP_MAX6 1        
`define HCM4_LOOP_MAX7 1        
`define HCM4_LOOP_MAX8 1        
`define HCM4_COOLDOWN  50		                             
`define HCM4_DC_TIMEOUT1 50	    
`define HCM4_DC_TIMEOUT2 50     
`define HCM4_DC_TIMEOUT3 50     
`define HCM4_DC_TIMEOUT4 50     
`define HCM4_DC_TIMEOUT5 50     
`define HCM4_DC_TIMEOUT6 12     
`define HCM4_DC_TIMEOUT7 50     
`define HCM4_DC_TIMEOUT8 50     
                              
`define HCM5_SOA_TYPE 1'b0		  
`define HCM5_HVIMON 1'b0			  
`define HCM5_VMON_PHASE  1		 
`define HCM5_FAST_SHUTDOWN  0   
`define HCM5_TRESHOLD1 4'h0	    
`define HCM5_TRESHOLD2 4'h0     
`define HCM5_TRESHOLD3 4'h0     
`define HCM5_TRESHOLD4 4'h0     
`define HCM5_TRESHOLD5 4'h0     
`define HCM5_TRESHOLD6 4'h0     
`define HCM5_TRESHOLD7 4'h0     
`define HCM5_TRESHOLD8 4'h0     
`define HCM5_LOOP_MAX1 1		    
`define HCM5_LOOP_MAX2 1        
`define HCM5_LOOP_MAX3 1        
`define HCM5_LOOP_MAX4 1        
`define HCM5_LOOP_MAX5 1        
`define HCM5_LOOP_MAX6 1        
`define HCM5_LOOP_MAX7 1        
`define HCM5_LOOP_MAX8 1        
`define HCM5_COOLDOWN  50		    
`define HCM5_DC_TIMEOUT1 50	    
`define HCM5_DC_TIMEOUT2 50     
`define HCM5_DC_TIMEOUT3 50     
`define HCM5_DC_TIMEOUT4 50     
`define HCM5_DC_TIMEOUT5 50     
`define HCM5_DC_TIMEOUT6 50     
`define HCM5_DC_TIMEOUT7 50     
`define HCM5_DC_TIMEOUT8 50     
                              
`define HCM6_SOA_TYPE 1'b0		  
`define HCM6_HVIMON 1'b0			  
`define HCM6_VMON_PHASE  1		 
`define HCM6_FAST_SHUTDOWN  0   
`define HCM6_TRESHOLD1 4'h0	    
`define HCM6_TRESHOLD2 4'h0     
`define HCM6_TRESHOLD3 4'h0     
`define HCM6_TRESHOLD4 4'h0     
`define HCM6_TRESHOLD5 4'h0     
`define HCM6_TRESHOLD6 4'h0     
`define HCM6_TRESHOLD7 4'h0     
`define HCM6_TRESHOLD8 4'h0     
`define HCM6_LOOP_MAX1 1		    
`define HCM6_LOOP_MAX2 1        
`define HCM6_LOOP_MAX3 1        
`define HCM6_LOOP_MAX4 1        
`define HCM6_LOOP_MAX5 1        
`define HCM6_LOOP_MAX6 1        
`define HCM6_LOOP_MAX7 1        
`define HCM6_LOOP_MAX8 1        
`define HCM6_COOLDOWN  50		    
`define HCM6_DC_TIMEOUT1 50	    
`define HCM6_DC_TIMEOUT2 50     
`define HCM6_DC_TIMEOUT3 50     
`define HCM6_DC_TIMEOUT4 50     
`define HCM6_DC_TIMEOUT5 50     
`define HCM6_DC_TIMEOUT6 50     
`define HCM6_DC_TIMEOUT7 50     
`define HCM6_DC_TIMEOUT8 50     
                              
`define HCM7_SOA_TYPE 1'b0		  
`define HCM7_HVIMON 1'b0			  
`define HCM7_VMON_PHASE  1		 
`define HCM7_FAST_SHUTDOWN  0   
`define HCM7_TRESHOLD1 4'h0	    
`define HCM7_TRESHOLD2 4'h0     
`define HCM7_TRESHOLD3 4'h0     
`define HCM7_TRESHOLD4 4'h0     
`define HCM7_TRESHOLD5 4'h0     
`define HCM7_TRESHOLD6 4'h0     
`define HCM7_TRESHOLD7 4'h0     
`define HCM7_TRESHOLD8 4'h0     
`define HCM7_LOOP_MAX1 1		    
`define HCM7_LOOP_MAX2 1        
`define HCM7_LOOP_MAX3 1        
`define HCM7_LOOP_MAX4 1        
`define HCM7_LOOP_MAX5 1        
`define HCM7_LOOP_MAX6 1        
`define HCM7_LOOP_MAX7 1        
`define HCM7_LOOP_MAX8 1        
`define HCM7_COOLDOWN  50		    
`define HCM7_DC_TIMEOUT1 50	    
`define HCM7_DC_TIMEOUT2 50     
`define HCM7_DC_TIMEOUT3 50     
`define HCM7_DC_TIMEOUT4 50     
`define HCM7_DC_TIMEOUT5 50     
`define HCM7_DC_TIMEOUT6 50     
`define HCM7_DC_TIMEOUT7 50     
`define HCM7_DC_TIMEOUT8 50     
                              
`define HCM8_SOA_TYPE 1'b0		  
`define HCM8_HVIMON 1'b0			  
`define HCM8_VMON_PHASE  1		 
`define HCM8_FAST_SHUTDOWN  0   
`define HCM8_TRESHOLD1 4'h0	    
`define HCM8_TRESHOLD2 4'h0     
`define HCM8_TRESHOLD3 4'h0     
`define HCM8_TRESHOLD4 4'h0     
`define HCM8_TRESHOLD5 4'h0     
`define HCM8_TRESHOLD6 4'h0     
`define HCM8_TRESHOLD7 4'h0     
`define HCM8_TRESHOLD8 4'h0     
`define HCM8_LOOP_MAX1 1		    
`define HCM8_LOOP_MAX2 1        
`define HCM8_LOOP_MAX3 1        
`define HCM8_LOOP_MAX4 1        
`define HCM8_LOOP_MAX5 1        
`define HCM8_LOOP_MAX6 1        
`define HCM8_LOOP_MAX7 1        
`define HCM8_LOOP_MAX8 1        
`define HCM8_COOLDOWN  50		    
`define HCM8_DC_TIMEOUT1 50	    
`define HCM8_DC_TIMEOUT2 50     
`define HCM8_DC_TIMEOUT3 50     
`define HCM8_DC_TIMEOUT4 50     
`define HCM8_DC_TIMEOUT5 50     
`define HCM8_DC_TIMEOUT6 50     
`define HCM8_DC_TIMEOUT7 50     
`define HCM8_DC_TIMEOUT8 50     
                              
`define HCM9_SOA_TYPE 1'b0		
`define HCM9_HVIMON 1'b0			
`define HCM9_VMON_PHASE  1		
`define HCM9_FAST_SHUTDOWN  0 
`define HCM9_TRESHOLD1 4'h0	  
`define HCM9_TRESHOLD2 4'h0   
`define HCM9_TRESHOLD3 4'h0   
`define HCM9_TRESHOLD4 4'h0   
`define HCM9_TRESHOLD5 4'h0   
`define HCM9_TRESHOLD6 4'h0   
`define HCM9_TRESHOLD7 4'h0   
`define HCM9_TRESHOLD8 4'h0   
`define HCM9_LOOP_MAX1 1		  
`define HCM9_LOOP_MAX2 1      
`define HCM9_LOOP_MAX3 1      
`define HCM9_LOOP_MAX4 1      
`define HCM9_LOOP_MAX5 1      
`define HCM9_LOOP_MAX6 1      
`define HCM9_LOOP_MAX7 1      
`define HCM9_LOOP_MAX8 1      
`define HCM9_COOLDOWN  50		  
`define HCM9_DC_TIMEOUT1 50	  
`define HCM9_DC_TIMEOUT2 50   
`define HCM9_DC_TIMEOUT3 50   
`define HCM9_DC_TIMEOUT4 50   
`define HCM9_DC_TIMEOUT5 50   
`define HCM9_DC_TIMEOUT6 50   
`define HCM9_DC_TIMEOUT7 50   
`define HCM9_DC_TIMEOUT8 50   
                              
`define HCM10_SOA_TYPE 1'b0		
`define HCM10_HVIMON 1'b0			
`define HCM10_VMON_PHASE  1		
`define HCM10_FAST_SHUTDOWN 0  
`define HCM10_TRESHOLD1 4'h0	
`define HCM10_TRESHOLD2 4'h0  
`define HCM10_TRESHOLD3 4'h0  
`define HCM10_TRESHOLD4 4'h0  
`define HCM10_TRESHOLD5 4'h0  
`define HCM10_TRESHOLD6 4'h0  
`define HCM10_TRESHOLD7 4'h0  
`define HCM10_TRESHOLD8 4'h0  
`define HCM10_LOOP_MAX1 1		  
`define HCM10_LOOP_MAX2 1     
`define HCM10_LOOP_MAX3 1     
`define HCM10_LOOP_MAX4 1     
`define HCM10_LOOP_MAX5 1     
`define HCM10_LOOP_MAX6 1     
`define HCM10_LOOP_MAX7 1     
`define HCM10_LOOP_MAX8 1     
`define HCM10_COOLDOWN  50		
`define HCM10_DC_TIMEOUT1 50	
`define HCM10_DC_TIMEOUT2 50  
`define HCM10_DC_TIMEOUT3 50  
`define HCM10_DC_TIMEOUT4 50  
`define HCM10_DC_TIMEOUT5 50  
`define HCM10_DC_TIMEOUT6 50  
`define HCM10_DC_TIMEOUT7 50  
`define HCM10_DC_TIMEOUT8 50  
                              
`define HCM11_SOA_TYPE 1'b0		
`define HCM11_HVIMON 1'b0			
`define HCM11_VMON_PHASE  1		
`define HCM11_FAST_SHUTDOWN 0  
`define HCM11_TRESHOLD1 4'h0	
`define HCM11_TRESHOLD2 4'h0  
`define HCM11_TRESHOLD3 4'h0  
`define HCM11_TRESHOLD4 4'h0  
`define HCM11_TRESHOLD5 4'h0  
`define HCM11_TRESHOLD6 4'h0  
`define HCM11_TRESHOLD7 4'h0  
`define HCM11_TRESHOLD8 4'h0  
`define HCM11_LOOP_MAX1 1		  
`define HCM11_LOOP_MAX2 1     
`define HCM11_LOOP_MAX3 1     
`define HCM11_LOOP_MAX4 1     
`define HCM11_LOOP_MAX5 1     
`define HCM11_LOOP_MAX6 1     
`define HCM11_LOOP_MAX7 1     
`define HCM11_LOOP_MAX8 1     
`define HCM11_COOLDOWN  50		
`define HCM11_DC_TIMEOUT1 50	
`define HCM11_DC_TIMEOUT2 50  
`define HCM11_DC_TIMEOUT3 50  
`define HCM11_DC_TIMEOUT4 50  
`define HCM11_DC_TIMEOUT5 50  
`define HCM11_DC_TIMEOUT6 50  
`define HCM11_DC_TIMEOUT7 50  
`define HCM11_DC_TIMEOUT8 50  
                              
`define HCM12_SOA_TYPE 1'b0		
`define HCM12_HVIMON 1'b0			
`define HCM12_VMON_PHASE  1		
`define HCM12_FAST_SHUTDOWN 0  
`define HCM12_TRESHOLD1 4'h0	
`define HCM12_TRESHOLD2 4'h0  
`define HCM12_TRESHOLD3 4'h0  
`define HCM12_TRESHOLD4 4'h0  
`define HCM12_TRESHOLD5 4'h0  
`define HCM12_TRESHOLD6 4'h0  
`define HCM12_TRESHOLD7 4'h0  
`define HCM12_TRESHOLD8 4'h0  
`define HCM12_LOOP_MAX1 1		  
`define HCM12_LOOP_MAX2 1     
`define HCM12_LOOP_MAX3 1     
`define HCM12_LOOP_MAX4 1     
`define HCM12_LOOP_MAX5 1     
`define HCM12_LOOP_MAX6 1     
`define HCM12_LOOP_MAX7 1     
`define HCM12_LOOP_MAX8 1     
`define HCM12_COOLDOWN  50		
`define HCM12_DC_TIMEOUT1 50	
`define HCM12_DC_TIMEOUT2 50  
`define HCM12_DC_TIMEOUT3 50  
`define HCM12_DC_TIMEOUT4 50  
`define HCM12_DC_TIMEOUT5 50  
`define HCM12_DC_TIMEOUT6 50  
`define HCM12_DC_TIMEOUT7 50  
`define HCM12_DC_TIMEOUT8 50  
                              
`define HCM13_SOA_TYPE 1'b0		
`define HCM13_HVIMON 1'b0			
`define HCM13_VMON_PHASE  1		
`define HCM13_FAST_SHUTDOWN 0  
`define HCM13_TRESHOLD1 4'h0	
`define HCM13_TRESHOLD2 4'h0  
`define HCM13_TRESHOLD3 4'h0  
`define HCM13_TRESHOLD4 4'h0  
`define HCM13_TRESHOLD5 4'h0  
`define HCM13_TRESHOLD6 4'h0  
`define HCM13_TRESHOLD7 4'h0  
`define HCM13_TRESHOLD8 4'h0  
`define HCM13_LOOP_MAX1 1		  
`define HCM13_LOOP_MAX2 1     
`define HCM13_LOOP_MAX3 1     
`define HCM13_LOOP_MAX4 1     
`define HCM13_LOOP_MAX5 1     
`define HCM13_LOOP_MAX6 1     
`define HCM13_LOOP_MAX7 1     
`define HCM13_LOOP_MAX8 1     
`define HCM13_COOLDOWN  50		
`define HCM13_DC_TIMEOUT1 50	
`define HCM13_DC_TIMEOUT2 50  
`define HCM13_DC_TIMEOUT3 50  
`define HCM13_DC_TIMEOUT4 50  
`define HCM13_DC_TIMEOUT5 50  
`define HCM13_DC_TIMEOUT6 50  
`define HCM13_DC_TIMEOUT7 50  
`define HCM13_DC_TIMEOUT8 50  
                              
`define HCM14_SOA_TYPE 1'b0		
`define HCM14_HVIMON 1'b0			
`define HCM14_VMON_PHASE  1		
`define HCM14_FAST_SHUTDOWN 0  
`define HCM14_TRESHOLD1 4'h0	
`define HCM14_TRESHOLD2 4'h0  
`define HCM14_TRESHOLD3 4'h0  
`define HCM14_TRESHOLD4 4'h0  
`define HCM14_TRESHOLD5 4'h0  
`define HCM14_TRESHOLD6 4'h0  
`define HCM14_TRESHOLD7 4'h0  
`define HCM14_TRESHOLD8 4'h0  
`define HCM14_LOOP_MAX1 1		  
`define HCM14_LOOP_MAX2 1     
`define HCM14_LOOP_MAX3 1     
`define HCM14_LOOP_MAX4 1     
`define HCM14_LOOP_MAX5 1     
`define HCM14_LOOP_MAX6 1     
`define HCM14_LOOP_MAX7 1     
`define HCM14_LOOP_MAX8 1     
`define HCM14_COOLDOWN  50		
`define HCM14_DC_TIMEOUT1 50	
`define HCM14_DC_TIMEOUT2 50  
`define HCM14_DC_TIMEOUT3 50  
`define HCM14_DC_TIMEOUT4 50  
`define HCM14_DC_TIMEOUT5 50  
`define HCM14_DC_TIMEOUT6 50  
`define HCM14_DC_TIMEOUT7 50  
`define HCM14_DC_TIMEOUT8 50  
                              
`define HCM15_SOA_TYPE 1'b0		
`define HCM15_HVIMON 1'b0			
`define HCM15_VMON_PHASE  1		
`define HCM15_FAST_SHUTDOWN 0  
`define HCM15_TRESHOLD1 4'h0	
`define HCM15_TRESHOLD2 4'h0  
`define HCM15_TRESHOLD3 4'h0  
`define HCM15_TRESHOLD4 4'h0  
`define HCM15_TRESHOLD5 4'h0  
`define HCM15_TRESHOLD6 4'h0  
`define HCM15_TRESHOLD7 4'h0  
`define HCM15_TRESHOLD8 4'h0  
`define HCM15_LOOP_MAX1 1		  
`define HCM15_LOOP_MAX2 1     
`define HCM15_LOOP_MAX3 1     
`define HCM15_LOOP_MAX4 1     
`define HCM15_LOOP_MAX5 1     
`define HCM15_LOOP_MAX6 1     
`define HCM15_LOOP_MAX7 1     
`define HCM15_LOOP_MAX8 1     
`define HCM15_COOLDOWN  50		
`define HCM15_DC_TIMEOUT1 50	
`define HCM15_DC_TIMEOUT2 50  
`define HCM15_DC_TIMEOUT3 50  
`define HCM15_DC_TIMEOUT4 50  
`define HCM15_DC_TIMEOUT5 50  
`define HCM15_DC_TIMEOUT6 50  
`define HCM15_DC_TIMEOUT7 50  
`define HCM15_DC_TIMEOUT8 50  
                              
`define HCM16_SOA_TYPE 1'b0		
`define HCM16_HVIMON 1'b0			
`define HCM16_VMON_PHASE  1		
`define HCM16_FAST_SHUTDOWN 0  
`define HCM16_TRESHOLD1 4'h0	
`define HCM16_TRESHOLD2 4'h0  
`define HCM16_TRESHOLD3 4'h0  
`define HCM16_TRESHOLD4 4'h0  
`define HCM16_TRESHOLD5 4'h0  
`define HCM16_TRESHOLD6 4'h0  
`define HCM16_TRESHOLD7 4'h0  
`define HCM16_TRESHOLD8 4'h0  
`define HCM16_LOOP_MAX1 1		  
`define HCM16_LOOP_MAX2 1     
`define HCM16_LOOP_MAX3 1     
`define HCM16_LOOP_MAX4 1     
`define HCM16_LOOP_MAX5 1     
`define HCM16_LOOP_MAX6 1     
`define HCM16_LOOP_MAX7 1     
`define HCM16_LOOP_MAX8 1     
`define HCM16_COOLDOWN  50		
`define HCM16_DC_TIMEOUT1 50	
`define HCM16_DC_TIMEOUT2 50  
`define HCM16_DC_TIMEOUT3 50  
`define HCM16_DC_TIMEOUT4 50  
`define HCM16_DC_TIMEOUT5 50  
`define HCM16_DC_TIMEOUT6 50  
`define HCM16_DC_TIMEOUT7 50  
`define HCM16_DC_TIMEOUT8 50  
                              
`define HCM17_SOA_TYPE 1'b0		
`define HCM17_HVIMON 1'b0			
`define HCM17_VMON_PHASE  1		
`define HCM17_FAST_SHUTDOWN 0  
`define HCM17_TRESHOLD1 4'h0	
`define HCM17_TRESHOLD2 4'h0  
`define HCM17_TRESHOLD3 4'h0  
`define HCM17_TRESHOLD4 4'h0  
`define HCM17_TRESHOLD5 4'h0  
`define HCM17_TRESHOLD6 4'h0  
`define HCM17_TRESHOLD7 4'h0  
`define HCM17_TRESHOLD8 4'h0  
`define HCM17_LOOP_MAX1 1		  
`define HCM17_LOOP_MAX2 1     
`define HCM17_LOOP_MAX3 1     
`define HCM17_LOOP_MAX4 1     
`define HCM17_LOOP_MAX5 1     
`define HCM17_LOOP_MAX6 1     
`define HCM17_LOOP_MAX7 1     
`define HCM17_LOOP_MAX8 1     
`define HCM17_COOLDOWN  50		
`define HCM17_DC_TIMEOUT1 50	
`define HCM17_DC_TIMEOUT2 50  
`define HCM17_DC_TIMEOUT3 50  
`define HCM17_DC_TIMEOUT4 50  
`define HCM17_DC_TIMEOUT5 50  
`define HCM17_DC_TIMEOUT6 50  
`define HCM17_DC_TIMEOUT7 50  
`define HCM17_DC_TIMEOUT8 50  
                              
`define HCM18_SOA_TYPE 1'b0		
`define HCM18_HVIMON 1'b0			
`define HCM18_VMON_PHASE  1		
`define HCM18_FAST_SHUTDOWN 0  
`define HCM18_TRESHOLD1 4'h0	
`define HCM18_TRESHOLD2 4'h0  
`define HCM18_TRESHOLD3 4'h0  
`define HCM18_TRESHOLD4 4'h0  
`define HCM18_TRESHOLD5 4'h0  
`define HCM18_TRESHOLD6 4'h0  
`define HCM18_TRESHOLD7 4'h0  
`define HCM18_TRESHOLD8 4'h0  
`define HCM18_LOOP_MAX1 1		  
`define HCM18_LOOP_MAX2 1     
`define HCM18_LOOP_MAX3 1     
`define HCM18_LOOP_MAX4 1     
`define HCM18_LOOP_MAX5 1     
`define HCM18_LOOP_MAX6 1     
`define HCM18_LOOP_MAX7 1     
`define HCM18_LOOP_MAX8 1     
`define HCM18_COOLDOWN  50		
`define HCM18_DC_TIMEOUT1 50	
`define HCM18_DC_TIMEOUT2 50  
`define HCM18_DC_TIMEOUT3 50  
`define HCM18_DC_TIMEOUT4 50  
`define HCM18_DC_TIMEOUT5 50  
`define HCM18_DC_TIMEOUT6 50  
`define HCM18_DC_TIMEOUT7 50  
`define HCM18_DC_TIMEOUT8 50  
                              
`define HCM19_SOA_TYPE 1'b0		
`define HCM19_HVIMON 1'b0			
`define HCM19_VMON_PHASE  1		
`define HCM19_FAST_SHUTDOWN 0  
`define HCM19_TRESHOLD1 4'h0	
`define HCM19_TRESHOLD2 4'h0  
`define HCM19_TRESHOLD3 4'h0  
`define HCM19_TRESHOLD4 4'h0  
`define HCM19_TRESHOLD5 4'h0  
`define HCM19_TRESHOLD6 4'h0  
`define HCM19_TRESHOLD7 4'h0  
`define HCM19_TRESHOLD8 4'h0  
`define HCM19_LOOP_MAX1 1		  
`define HCM19_LOOP_MAX2 1     
`define HCM19_LOOP_MAX3 1     
`define HCM19_LOOP_MAX4 1     
`define HCM19_LOOP_MAX5 1     
`define HCM19_LOOP_MAX6 1     
`define HCM19_LOOP_MAX7 1     
`define HCM19_LOOP_MAX8 1     
`define HCM19_COOLDOWN  50		
`define HCM19_DC_TIMEOUT1 50	
`define HCM19_DC_TIMEOUT2 50  
`define HCM19_DC_TIMEOUT3 50  
`define HCM19_DC_TIMEOUT4 50  
`define HCM19_DC_TIMEOUT5 50  
`define HCM19_DC_TIMEOUT6 50  
`define HCM19_DC_TIMEOUT7 50  
`define HCM19_DC_TIMEOUT8 50  
                              
`define HCM20_SOA_TYPE 1'b0		
`define HCM20_HVIMON 1'b0			
`define HCM20_VMON_PHASE  1		
`define HCM20_FAST_SHUTDOWN 0  
`define HCM20_TRESHOLD1 4'h0	
`define HCM20_TRESHOLD2 4'h0  
`define HCM20_TRESHOLD3 4'h0  
`define HCM20_TRESHOLD4 4'h0  
`define HCM20_TRESHOLD5 4'h0  
`define HCM20_TRESHOLD6 4'h0  
`define HCM20_TRESHOLD7 4'h0  
`define HCM20_TRESHOLD8 4'h0  
`define HCM20_LOOP_MAX1 1		  
`define HCM20_LOOP_MAX2 1     
`define HCM20_LOOP_MAX3 1     
`define HCM20_LOOP_MAX4 1     
`define HCM20_LOOP_MAX5 1     
`define HCM20_LOOP_MAX6 1     
`define HCM20_LOOP_MAX7 1     
`define HCM20_LOOP_MAX8 1     
`define HCM20_COOLDOWN  50		
`define HCM20_DC_TIMEOUT1 50	
`define HCM20_DC_TIMEOUT2 50  
`define HCM20_DC_TIMEOUT3 50  
`define HCM20_DC_TIMEOUT4 50  
`define HCM20_DC_TIMEOUT5 50  
`define HCM20_DC_TIMEOUT6 50  
`define HCM20_DC_TIMEOUT7 50  
`define HCM20_DC_TIMEOUT8 50  
                              
`define HCM21_SOA_TYPE 1'b0		
`define HCM21_HVIMON 1'b0			
`define HCM21_VMON_PHASE  1		
`define HCM21_FAST_SHUTDOWN 0  
`define HCM21_TRESHOLD1 4'h0	
`define HCM21_TRESHOLD2 4'h0  
`define HCM21_TRESHOLD3 4'h0  
`define HCM21_TRESHOLD4 4'h0  
`define HCM21_TRESHOLD5 4'h0  
`define HCM21_TRESHOLD6 4'h0  
`define HCM21_TRESHOLD7 4'h0  
`define HCM21_TRESHOLD8 4'h0  
`define HCM21_LOOP_MAX1 1		  
`define HCM21_LOOP_MAX2 1     
`define HCM21_LOOP_MAX3 1     
`define HCM21_LOOP_MAX4 1     
`define HCM21_LOOP_MAX5 1     
`define HCM21_LOOP_MAX6 1     
`define HCM21_LOOP_MAX7 1     
`define HCM21_LOOP_MAX8 1     
`define HCM21_COOLDOWN  50		
`define HCM21_DC_TIMEOUT1 50	
`define HCM21_DC_TIMEOUT2 50  
`define HCM21_DC_TIMEOUT3 50  
`define HCM21_DC_TIMEOUT4 50  
`define HCM21_DC_TIMEOUT5 50  
`define HCM21_DC_TIMEOUT6 50  
`define HCM21_DC_TIMEOUT7 50  
`define HCM21_DC_TIMEOUT8 50  
                              
`define HCM22_SOA_TYPE 1'b0		
`define HCM22_HVIMON 1'b0			
`define HCM22_VMON_PHASE  1		
`define HCM22_FAST_SHUTDOWN 0  
`define HCM22_TRESHOLD1 4'h0	
`define HCM22_TRESHOLD2 4'h0  
`define HCM22_TRESHOLD3 4'h0  
`define HCM22_TRESHOLD4 4'h0  
`define HCM22_TRESHOLD5 4'h0  
`define HCM22_TRESHOLD6 4'h0  
`define HCM22_TRESHOLD7 4'h0  
`define HCM22_TRESHOLD8 4'h0  
`define HCM22_LOOP_MAX1 1		  
`define HCM22_LOOP_MAX2 1     
`define HCM22_LOOP_MAX3 1     
`define HCM22_LOOP_MAX4 1     
`define HCM22_LOOP_MAX5 1     
`define HCM22_LOOP_MAX6 1     
`define HCM22_LOOP_MAX7 1     
`define HCM22_LOOP_MAX8 1     
`define HCM22_COOLDOWN  50		
`define HCM22_DC_TIMEOUT1 50	
`define HCM22_DC_TIMEOUT2 50  
`define HCM22_DC_TIMEOUT3 50  
`define HCM22_DC_TIMEOUT4 50  
`define HCM22_DC_TIMEOUT5 50  
`define HCM22_DC_TIMEOUT6 50  
`define HCM22_DC_TIMEOUT7 50  
`define HCM22_DC_TIMEOUT8 50  
                              
`define HCM23_SOA_TYPE 1'b0		
`define HCM23_HVIMON 1'b0			
`define HCM23_VMON_PHASE  1		
`define HCM23_FAST_SHUTDOWN 0  
`define HCM23_TRESHOLD1 4'h0	
`define HCM23_TRESHOLD2 4'h0  
`define HCM23_TRESHOLD3 4'h0  
`define HCM23_TRESHOLD4 4'h0  
`define HCM23_TRESHOLD5 4'h0  
`define HCM23_TRESHOLD6 4'h0  
`define HCM23_TRESHOLD7 4'h0  
`define HCM23_TRESHOLD8 4'h0  
`define HCM23_LOOP_MAX1 1		  
`define HCM23_LOOP_MAX2 1     
`define HCM23_LOOP_MAX3 1     
`define HCM23_LOOP_MAX4 1     
`define HCM23_LOOP_MAX5 1     
`define HCM23_LOOP_MAX6 1     
`define HCM23_LOOP_MAX7 1     
`define HCM23_LOOP_MAX8 1     
`define HCM23_COOLDOWN  50		
`define HCM23_DC_TIMEOUT1 50	
`define HCM23_DC_TIMEOUT2 50  
`define HCM23_DC_TIMEOUT3 50  
`define HCM23_DC_TIMEOUT4 50  
`define HCM23_DC_TIMEOUT5 50  
`define HCM23_DC_TIMEOUT6 50  
`define HCM23_DC_TIMEOUT7 50  
`define HCM23_DC_TIMEOUT8 50  
                              
`define HCM24_SOA_TYPE 1'b1		
`define HCM24_HVIMON 1'b0			
`define HCM24_VMON_PHASE  1		
`define HCM24_FAST_SHUTDOWN 0  
`define HCM24_TRESHOLD1 4'h0	
`define HCM24_TRESHOLD2 4'h0  
`define HCM24_TRESHOLD3 4'h0  
`define HCM24_TRESHOLD4 4'h0  
`define HCM24_TRESHOLD5 4'h0  
`define HCM24_TRESHOLD6 4'h0  
`define HCM24_TRESHOLD7 4'h0  
`define HCM24_TRESHOLD8 4'h0  
`define HCM24_LOOP_MAX1 1		  
`define HCM24_LOOP_MAX2 1     
`define HCM24_LOOP_MAX3 1     
`define HCM24_LOOP_MAX4 1     
`define HCM24_LOOP_MAX5 1     
`define HCM24_LOOP_MAX6 1     
`define HCM24_LOOP_MAX7 1     
`define HCM24_LOOP_MAX8 1     
`define HCM24_COOLDOWN  50		
`define HCM24_DC_TIMEOUT1 50	
`define HCM24_DC_TIMEOUT2 50  
`define HCM24_DC_TIMEOUT3 50  
`define HCM24_DC_TIMEOUT4 50  
`define HCM24_DC_TIMEOUT5 50  
`define HCM24_DC_TIMEOUT6 50  
`define HCM24_DC_TIMEOUT7 50  
`define HCM24_DC_TIMEOUT8 50  