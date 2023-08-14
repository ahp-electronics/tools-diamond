// =============================================================================   
//                           COPYRIGHT NOTICE                                      
// Copyright 2011 (c) Lattice Semiconductor Corporation                            
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
// Project               : FAN Controller Core                                                
// File                  : fanctl_params.v                                              
// Title                 : Fan controller core parameter file                                        
// Dependencies          :                                                       
//                       :                                                         
// Description           : Control the Fan Controller IP configuration                                
// =============================================================================   
//                        REVISION HISTORY                                         
// Version               : 1.0                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Apr, 2012 
// -----------------------------------------------------------------------------
// Version               : 1.1                                                     
// Changes Made          : Add support up to 18 fans                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Jun, 2012                                               
// =============================================================================   

// top-level paramters
parameter FAN_NUMBER = 1;
parameter SIMULATE_IP	= 0;

//-----------------------------------------------------------------------------
// Parameters for FAN #1
//-----------------------------------------------------------------------------
// PWM generator parameters
parameter PWM1_PRESCALE = 50;			// range 1 to 1600, PWM frequency = 8MHz /(100* pwm_prescale)
parameter PWM1_POLARITY = 1;				// 1=HIGH is the specified duty cycle, 0=LOW is the specified duty cycle
parameter FAN1_SPEED1 = 25;				// duty cycle % of PWM
parameter FAN1_SPEED2 = 50;        // duty cycle % of PWM 
parameter FAN1_SPEED3 = 75;				// duty cycle % of PWM 

//FAN ALARM generator parameters
parameter FAN1_SENSE_ENABLE = 0;
parameter FAN1_SENSE_MODE = 1;			// 0 = LOCKED mode, 1 = TACH mode
parameter FAN1_SENSE_POLARITY = 1; // 1 = active high, 0 = active low, this is applicabled to LOCKED mode only
parameter FAN1_3WIRE_LS = 0;				// 1 = 3-wire Low-Side switching is implemented on the board
parameter ALARM1_INTERVAL = 50;		// range 1ms to 100ms
parameter ALARM1_FILTER = 5;				// range 1 to 10

// FAN Start up parameters
parameter STARTUP1_ENABLE = 0;			
parameter STARTUP1_PERIOD = 4;			// range 1 to 8, translate into 0.25s to 2s

//-----------------------------------------------------------------------------                                      
// Parameters for FAN #2                                                                                            
//-----------------------------------------------------------------------------                                      
// PWM generator parameters                                                                                          
parameter PWM2_PRESCALE = 50;			    
parameter PWM2_POLARITY = 1;			    
parameter FAN2_SPEED1 = 25;				
parameter FAN2_SPEED2 = 50;       
parameter FAN2_SPEED3 = 75;				
                                      
//FAN ALARM generator parameters      
parameter FAN2_SENSE_ENABLE = 0;                                      				    
parameter FAN2_SENSE_MODE = 1;		
parameter FAN2_SENSE_POLARITY = 1;   
parameter FAN2_3WIRE_LS = 0;				                                   
parameter ALARM2_INTERVAL = 50;	  
parameter ALARM2_FILTER = 5;			    
                                                                                                                     
// FAN Start up parameters                                                                                           
parameter STARTUP2_ENABLE = 0;			                                                                                   
parameter STARTUP2_PERIOD = 4;		                     		

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #3                                                                                                                                                                                                                    
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM3_PRESCALE = 50;			
parameter PWM3_POLARITY = 1;			
parameter FAN3_SPEED1 = 25;				
parameter FAN3_SPEED2 = 50;       
parameter FAN3_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN3_SENSE_ENABLE = 0;  				
parameter FAN3_SENSE_MODE = 1;		
parameter FAN3_SENSE_POLARITY = 1;    
parameter FAN3_3WIRE_LS = 0;				                            
parameter ALARM3_INTERVAL = 50;	
parameter ALARM3_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP3_ENABLE = 0;		
parameter STARTUP3_PERIOD = 4;		

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #4                                                                                                                                                                                                                  
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM4_PRESCALE = 50;			
parameter PWM4_POLARITY = 1;			
parameter FAN4_SPEED1 = 25;				
parameter FAN4_SPEED2 = 50;       
parameter FAN4_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN4_SENSE_ENABLE = 0;  				
parameter FAN4_SENSE_MODE = 1;		
parameter FAN4_SENSE_POLARITY = 1;    
parameter FAN4_3WIRE_LS = 0;				                            
parameter ALARM4_INTERVAL = 50;	
parameter ALARM4_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP4_ENABLE = 0;		
parameter STARTUP4_PERIOD = 4;		

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #5                                                                                                                                                                                                                  
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM5_PRESCALE = 50;			
parameter PWM5_POLARITY = 1;			
parameter FAN5_SPEED1 = 25;				
parameter FAN5_SPEED2 = 50;       
parameter FAN5_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN5_SENSE_ENABLE = 0;  				
parameter FAN5_SENSE_MODE = 1;		
parameter FAN5_SENSE_POLARITY = 1;    
parameter FAN5_3WIRE_LS = 0;				                            
parameter ALARM5_INTERVAL = 50;	
parameter ALARM5_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP5_ENABLE = 0;		
parameter STARTUP5_PERIOD = 4;		 

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #6                                                                                                                                                                                                                 
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM6_PRESCALE = 50;			
parameter PWM6_POLARITY = 1;			
parameter FAN6_SPEED1 = 25;				
parameter FAN6_SPEED2 = 50;       
parameter FAN6_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN6_SENSE_ENABLE = 0;  				
parameter FAN6_SENSE_MODE = 1;		
parameter FAN6_SENSE_POLARITY = 1;    
parameter FAN6_3WIRE_LS = 0;				                            
parameter ALARM6_INTERVAL = 50;	
parameter ALARM6_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP6_ENABLE = 0;		
parameter STARTUP6_PERIOD = 4;	

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #7                                                                                                                                                                                                                
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM7_PRESCALE = 50;			
parameter PWM7_POLARITY = 1;			
parameter FAN7_SPEED1 = 25;				
parameter FAN7_SPEED2 = 50;       
parameter FAN7_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN7_SENSE_ENABLE = 0;  				
parameter FAN7_SENSE_MODE = 1;		
parameter FAN7_SENSE_POLARITY = 1;    
parameter FAN7_3WIRE_LS = 0;				                            
parameter ALARM7_INTERVAL = 50;	
parameter ALARM7_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP7_ENABLE = 0;		
parameter STARTUP7_PERIOD = 4;		 

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #8                                                                                                                                                                                                                
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM8_PRESCALE = 50;			
parameter PWM8_POLARITY = 1;			
parameter FAN8_SPEED1 = 25;				
parameter FAN8_SPEED2 = 50;       
parameter FAN8_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN8_SENSE_ENABLE = 0;  				
parameter FAN8_SENSE_MODE = 1;		
parameter FAN8_SENSE_POLARITY = 1;    
parameter FAN8_3WIRE_LS = 0;				                            
parameter ALARM8_INTERVAL = 50;	
parameter ALARM8_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP8_ENABLE = 0;		
parameter STARTUP8_PERIOD = 4;		 

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #9                                                                                                                                                                                                                
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM9_PRESCALE = 50;			
parameter PWM9_POLARITY = 1;			
parameter FAN9_SPEED1 = 25;				
parameter FAN9_SPEED2 = 50;       
parameter FAN9_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN9_SENSE_ENABLE = 0;  				
parameter FAN9_SENSE_MODE = 1;		
parameter FAN9_SENSE_POLARITY = 1;    
parameter FAN9_3WIRE_LS = 0;				                            
parameter ALARM9_INTERVAL = 50;	
parameter ALARM9_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP9_ENABLE = 0;		
parameter STARTUP9_PERIOD = 4;

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #10                                                                                                                                                                                                                
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM10_PRESCALE = 50;			
parameter PWM10_POLARITY = 1;			
parameter FAN10_SPEED1 = 25;				
parameter FAN10_SPEED2 = 50;       
parameter FAN10_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN10_SENSE_ENABLE = 0;  				
parameter FAN10_SENSE_MODE = 1;		
parameter FAN10_SENSE_POLARITY = 1;    
parameter FAN10_3WIRE_LS = 0;				                            
parameter ALARM10_INTERVAL = 50;	
parameter ALARM10_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP10_ENABLE = 0;		
parameter STARTUP10_PERIOD = 4;

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #11                                                                                                                                                                                                                
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM11_PRESCALE = 50;			
parameter PWM11_POLARITY = 1;			
parameter FAN11_SPEED1 = 25;				
parameter FAN11_SPEED2 = 50;       
parameter FAN11_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN11_SENSE_ENABLE = 0;  				
parameter FAN11_SENSE_MODE = 1;		
parameter FAN11_SENSE_POLARITY = 1;    
parameter FAN11_3WIRE_LS = 0;				                            
parameter ALARM11_INTERVAL = 50;	
parameter ALARM11_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP11_ENABLE = 0;		
parameter STARTUP11_PERIOD = 4;       

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #12                                                                                                                                                                                                                
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM12_PRESCALE = 50;			
parameter PWM12_POLARITY = 1;			
parameter FAN12_SPEED1 = 25;				
parameter FAN12_SPEED2 = 50;       
parameter FAN12_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN12_SENSE_ENABLE = 0;  				
parameter FAN12_SENSE_MODE = 1;		
parameter FAN12_SENSE_POLARITY = 1;    
parameter FAN12_3WIRE_LS = 0;				                            
parameter ALARM12_INTERVAL = 50;	
parameter ALARM12_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP12_ENABLE = 0;		
parameter STARTUP12_PERIOD = 4;    

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #13                                                                                                                                                                                                                
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM13_PRESCALE = 50;			
parameter PWM13_POLARITY = 1;			
parameter FAN13_SPEED1 = 25;				
parameter FAN13_SPEED2 = 50;       
parameter FAN13_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN13_SENSE_ENABLE = 0;  				
parameter FAN13_SENSE_MODE = 1;		
parameter FAN13_SENSE_POLARITY = 1;    
parameter FAN13_3WIRE_LS = 0;				                            
parameter ALARM13_INTERVAL = 50;	
parameter ALARM13_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP13_ENABLE = 0;		
parameter STARTUP13_PERIOD = 4;

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #14                                                                                                                                                                                                                
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM14_PRESCALE = 50;			
parameter PWM14_POLARITY = 1;			
parameter FAN14_SPEED1 = 25;				
parameter FAN14_SPEED2 = 50;       
parameter FAN14_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN14_SENSE_ENABLE = 0;  				
parameter FAN14_SENSE_MODE = 1;		
parameter FAN14_SENSE_POLARITY = 1;    
parameter FAN14_3WIRE_LS = 0;				                            
parameter ALARM14_INTERVAL = 50;	
parameter ALARM14_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP14_ENABLE = 0;		
parameter STARTUP14_PERIOD = 4;       

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #15                                                                                                                                                                                                                
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM15_PRESCALE = 50;			
parameter PWM15_POLARITY = 1;			
parameter FAN15_SPEED1 = 25;				
parameter FAN15_SPEED2 = 50;       
parameter FAN15_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN15_SENSE_ENABLE = 0;  				
parameter FAN15_SENSE_MODE = 1;		
parameter FAN15_SENSE_POLARITY = 1;    
parameter FAN15_3WIRE_LS = 0;				                            
parameter ALARM15_INTERVAL = 50;	
parameter ALARM15_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP15_ENABLE = 0;		
parameter STARTUP15_PERIOD = 4;    

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #16                                                                                                                                                                                                                
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM16_PRESCALE = 50;			
parameter PWM16_POLARITY = 1;			
parameter FAN16_SPEED1 = 25;				
parameter FAN16_SPEED2 = 50;       
parameter FAN16_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN16_SENSE_ENABLE = 0;  				
parameter FAN16_SENSE_MODE = 1;		
parameter FAN16_SENSE_POLARITY = 1;    
parameter FAN16_3WIRE_LS = 0;				                            
parameter ALARM16_INTERVAL = 50;	
parameter ALARM16_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP16_ENABLE = 0;		
parameter STARTUP16_PERIOD = 4;     

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #17                                                                                                                                                                                                               
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM17_PRESCALE = 50;			
parameter PWM17_POLARITY = 1;			
parameter FAN17_SPEED1 = 25;				
parameter FAN17_SPEED2 = 50;       
parameter FAN17_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN17_SENSE_ENABLE = 0;  				
parameter FAN17_SENSE_MODE = 1;		
parameter FAN17_SENSE_POLARITY = 1;    
parameter FAN17_3WIRE_LS = 0;				                            
parameter ALARM17_INTERVAL = 50;	
parameter ALARM17_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP17_ENABLE = 0;		
parameter STARTUP17_PERIOD = 4;       

//-----------------------------------------------------------------------------                                                                
// Parameters for FAN #18                                                                                                                                                                                                               
//-----------------------------------------------------------------------------                                         
// PWM generator parameters                                                                                             
parameter PWM18_PRESCALE = 50;			
parameter PWM18_POLARITY = 1;			
parameter FAN18_SPEED1 = 25;				
parameter FAN18_SPEED2 = 50;       
parameter FAN18_SPEED3 = 75;				
                                  
//FAN ALARM generator parameters  
parameter FAN18_SENSE_ENABLE = 0;  				
parameter FAN18_SENSE_MODE = 1;		
parameter FAN18_SENSE_POLARITY = 1;    
parameter FAN18_3WIRE_LS = 0;				                            
parameter ALARM18_INTERVAL = 50;	
parameter ALARM18_FILTER = 5;			
                                  
// FAN Start up parameters        
parameter STARTUP18_ENABLE = 0;		
parameter STARTUP18_PERIOD = 4;