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
// File                  : fanctl.v                                              
// Title                 : Fan Controller Top Wrapper                                       
// Dependencies          :                                                       
//                       :                                                         
// Description           : Wrapper for teh Fan Controller IP                           
// =============================================================================   
//                        REVISION HISTORY                                         
// Version               : 1.0                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Apr, 2012                                               
// =============================================================================   

module fanctl
		( 
		// global signals
		input clk_8mhz,
		input clk_250khz,
		input rstn,
		
		// first fan controller
		input fan_sense1_i,			
		input usp_fan1_full,
		input usp_fan1_off,
		input [1:0] usp_spd1_sel,		
		output usp_fan1_alarm,
		output fan_pwm1_o,

		// other fan controllers
		input fan_sense2_i,			
		input usp_fan2_full,
		input usp_fan2_off,
		input [1:0] usp_spd2_sel,		
		output usp_fan2_alarm,
		output fan_pwm2_o,
		
		input fan_sense3_i,			
		input usp_fan3_full,
		input usp_fan3_off,
		input [1:0] usp_spd3_sel,		
		output usp_fan3_alarm,
		output fan_pwm3_o,
		
		input fan_sense4_i,			
		input usp_fan4_full,
		input usp_fan4_off,
		input [1:0] usp_spd4_sel,		
		output usp_fan4_alarm,
		output fan_pwm4_o,
		
		input fan_sense5_i,			
		input usp_fan5_full,
		input usp_fan5_off,
		input [1:0] usp_spd5_sel,		
		output usp_fan5_alarm,
		output fan_pwm5_o,
		
		input fan_sense6_i,			
		input usp_fan6_full,
		input usp_fan6_off,
		input [1:0] usp_spd6_sel,		
		output usp_fan6_alarm,
		output fan_pwm6_o,
		
		input fan_sense7_i,			
		input usp_fan7_full,
		input usp_fan7_off,
		input [1:0] usp_spd7_sel,		
		output usp_fan7_alarm,
		output fan_pwm7_o,
		
		input fan_sense8_i,			
		input usp_fan8_full,
		input usp_fan8_off,
		input [1:0] usp_spd8_sel,		
		output usp_fan8_alarm,
		output fan_pwm8_o,
		
		input fan_sense9_i,			
		input usp_fan9_full,
		input usp_fan9_off,
		input [1:0] usp_spd9_sel,		
		output usp_fan9_alarm,
		output fan_pwm9_o,
		
		input fan_sense10_i,			
		input usp_fan10_full,
		input usp_fan10_off,
		input [1:0] usp_spd10_sel,		
		output usp_fan10_alarm,
		output fan_pwm10_o,
		
		input fan_sense11_i,			
		input usp_fan11_full,
		input usp_fan11_off,
		input [1:0] usp_spd11_sel,		
		output usp_fan11_alarm,
		output fan_pwm11_o,   
		
		input fan_sense12_i,			
		input usp_fan12_full,
		input usp_fan12_off,
		input [1:0] usp_spd12_sel,		
		output usp_fan12_alarm,
		output fan_pwm12_o,  
		
		input fan_sense13_i,			
		input usp_fan13_full,
		input usp_fan13_off,
		input [1:0] usp_spd13_sel,		
		output usp_fan13_alarm,
		output fan_pwm13_o, 
		
		input fan_sense14_i,			
		input usp_fan14_full,
		input usp_fan14_off,
		input [1:0] usp_spd14_sel,		
		output usp_fan14_alarm,
		output fan_pwm14_o,    
		
		input fan_sense15_i,			
		input usp_fan15_full,
		input usp_fan15_off,
		input [1:0] usp_spd15_sel,		
		output usp_fan15_alarm,
		output fan_pwm15_o,   
		
		input fan_sense16_i,			
		input usp_fan16_full,
		input usp_fan16_off,
		input [1:0] usp_spd16_sel,		
		output usp_fan16_alarm,
		output fan_pwm16_o,
		
		input fan_sense17_i,			
		input usp_fan17_full,
		input usp_fan17_off,
		input [1:0] usp_spd17_sel,		
		output usp_fan17_alarm,
		output fan_pwm17_o,
		
		input fan_sense18_i,			
		input usp_fan18_full,
		input usp_fan18_off,
		input [1:0] usp_spd18_sel,		
		output usp_fan18_alarm,
		output fan_pwm18_o    
				
		);
		
`include "../../params/verilog/fanctl_params.v"

fanctl_core 
		#
		(
		.SIMULATE_IP(SIMULATE_IP),
		.PWM_PRESCALE(PWM1_PRESCALE),    
		.PWM_POLARITY(PWM1_POLARITY),    
		.FAN_SPEED1(FAN1_SPEED1),          
		.FAN_SPEED2(FAN1_SPEED2),          
		.FAN_SPEED3(FAN1_SPEED3),          		                    
		.FAN_SENSE_ENABLE(FAN1_SENSE_ENABLE),
		.FAN_SENSE_MODE(FAN1_SENSE_MODE),
		.FAN_SENSE_POLARITY(FAN1_SENSE_POLARITY),
		.FAN_3WIRE(FAN1_3WIRE_LS),
		.ALARM_INTERVAL(ALARM1_INTERVAL),
		.ALARM_FILTER(ALARM1_FILTER),			    
    .STARTUP_ENABLE(STARTUP1_ENABLE),		
    .STARTUP_PERIOD(STARTUP1_PERIOD)
    )	
    fan1
    (
    .clk_8mhz(clk_8mhz),        
    .clk_250khz(clk_250khz),      
    .rstn(rstn),            
    .fan_sense_i(fan_sense1_i),		
    .usp_fan_full(usp_fan1_full),     
    .usp_fan_off(usp_fan1_off),     
    .usp_spd_sel(usp_spd1_sel),                  
    .usp_fan_alarm(usp_fan1_alarm),   
    .fan_pwm_o(fan_pwm1_o)
    );   

generate
	if (FAN_NUMBER >= 2)
		fanctl_core 
		#
		(
		.SIMULATE_IP(SIMULATE_IP),
		.PWM_PRESCALE(PWM2_PRESCALE),    
		.PWM_POLARITY(PWM2_POLARITY),    
		.FAN_SPEED1(FAN2_SPEED1),          
		.FAN_SPEED2(FAN2_SPEED2),          
		.FAN_SPEED3(FAN2_SPEED3),          		                    
		.FAN_SENSE_ENABLE(FAN2_SENSE_ENABLE),
		.FAN_SENSE_MODE(FAN2_SENSE_MODE),  
		.FAN_SENSE_POLARITY(FAN2_SENSE_POLARITY),
		.FAN_3WIRE(FAN2_3WIRE_LS),
		.ALARM_INTERVAL(ALARM2_INTERVAL),
		.ALARM_FILTER(ALARM2_FILTER),			    
    .STARTUP_ENABLE(STARTUP2_ENABLE),		
    .STARTUP_PERIOD(STARTUP2_PERIOD)
    )	
    fan2
    (
    .clk_8mhz(clk_8mhz),        
    .clk_250khz(clk_250khz),      
    .rstn(rstn),            
    .fan_sense_i(fan_sense2_i),		
    .usp_fan_full(usp_fan2_full),     
    .usp_fan_off(usp_fan2_off),     
    .usp_spd_sel(usp_spd2_sel),                  
    .usp_fan_alarm(usp_fan2_alarm),   
    .fan_pwm_o(fan_pwm2_o)
    );   
	else begin                            
		assign fan_pwm2_o = !PWM2_POLARITY;
		assign usp_fan2_alarm = 1'b0;   end	    
endgenerate        

generate                                  
	if (FAN_NUMBER >= 3 )                    
		fanctl_core                           
		#                                     
		(  
		.SIMULATE_IP(SIMULATE_IP),                                   
		.PWM_PRESCALE(PWM3_PRESCALE),        
		.PWM_POLARITY(PWM3_POLARITY),        
		.FAN_SPEED1(FAN3_SPEED1),             
		.FAN_SPEED2(FAN3_SPEED2),             
		.FAN_SPEED3(FAN3_SPEED3),          		
		.FAN_SENSE_ENABLE(FAN3_SENSE_ENABLE),               
		.FAN_SENSE_MODE(FAN3_SENSE_MODE), 
		.FAN_SENSE_POLARITY(FAN3_SENSE_POLARITY),
		.FAN_3WIRE(FAN3_3WIRE_LS),    
		.ALARM_INTERVAL(ALARM3_INTERVAL),     
		.ALARM_FILTER(ALARM3_FILTER),			    
    .STARTUP_ENABLE(STARTUP3_ENABLE),		  
    .STARTUP_PERIOD(STARTUP3_PERIOD)      
    )	                                    
    fan3                                  
    (                                     
    .clk_8mhz(clk_8mhz),                  
    .clk_250khz(clk_250khz),              
    .rstn(rstn),                          
    .fan_sense_i(fan_sense3_i),		        
    .usp_fan_full(usp_fan3_full),         
    .usp_fan_off(usp_fan3_off),           
    .usp_spd_sel(usp_spd3_sel),           
    .usp_fan_alarm(usp_fan3_alarm),       
    .fan_pwm_o(fan_pwm3_o)                
    );               
	else begin
		assign fan_pwm3_o = !PWM3_POLARITY;
		assign usp_fan3_alarm = 1'b0;   end                      
endgenerate                               
	
generate                                            
	if (FAN_NUMBER >= 4 )                             
		fanctl_core                                     
		#                                               
		(                                               
		.SIMULATE_IP(SIMULATE_IP),                      
		.PWM_PRESCALE(PWM4_PRESCALE),                   
		.PWM_POLARITY(PWM4_POLARITY),                   
		.FAN_SPEED1(FAN4_SPEED1),                       
		.FAN_SPEED2(FAN4_SPEED2),                       
		.FAN_SPEED3(FAN4_SPEED3),          		          
		.FAN_SENSE_ENABLE(FAN4_SENSE_ENABLE),           
		.FAN_SENSE_MODE(FAN4_SENSE_MODE),               
		.FAN_SENSE_POLARITY(FAN4_SENSE_POLARITY),       
		.FAN_3WIRE(FAN4_3WIRE_LS),                      
		.ALARM_INTERVAL(ALARM4_INTERVAL),               
		.ALARM_FILTER(ALARM4_FILTER),			              
    .STARTUP_ENABLE(STARTUP4_ENABLE),		            
    .STARTUP_PERIOD(STARTUP4_PERIOD)                
    )	                                              
    fan4                                            
    (                                               
    .clk_8mhz(clk_8mhz),                            
    .clk_250khz(clk_250khz),                        
    .rstn(rstn),                                    
    .fan_sense_i(fan_sense4_i),		                  
    .usp_fan_full(usp_fan4_full),                   
    .usp_fan_off(usp_fan4_off),                     
    .usp_spd_sel(usp_spd4_sel),                     
    .usp_fan_alarm(usp_fan4_alarm),                 
    .fan_pwm_o(fan_pwm4_o)                          
    );                                              
	else begin                                        
		assign fan_pwm4_o = !PWM4_POLARITY;             
		assign usp_fan4_alarm = 1'b0;   end             
endgenerate   

generate                                            
	if (FAN_NUMBER >= 5 )                             
		fanctl_core                                     
		#                                               
		(                                               
		.SIMULATE_IP(SIMULATE_IP),                      
		.PWM_PRESCALE(PWM5_PRESCALE),                   
		.PWM_POLARITY(PWM5_POLARITY),                   
		.FAN_SPEED1(FAN5_SPEED1),                       
		.FAN_SPEED2(FAN5_SPEED2),                       
		.FAN_SPEED3(FAN5_SPEED3),          		          
		.FAN_SENSE_ENABLE(FAN5_SENSE_ENABLE),           
		.FAN_SENSE_MODE(FAN5_SENSE_MODE),               
		.FAN_SENSE_POLARITY(FAN5_SENSE_POLARITY),       
		.FAN_3WIRE(FAN5_3WIRE_LS),                      
		.ALARM_INTERVAL(ALARM5_INTERVAL),               
		.ALARM_FILTER(ALARM5_FILTER),			              
    .STARTUP_ENABLE(STARTUP5_ENABLE),		            
    .STARTUP_PERIOD(STARTUP5_PERIOD)                
    )	                                              
    fan5                                            
    (                                               
    .clk_8mhz(clk_8mhz),                            
    .clk_250khz(clk_250khz),                        
    .rstn(rstn),                                    
    .fan_sense_i(fan_sense5_i),		                  
    .usp_fan_full(usp_fan5_full),                   
    .usp_fan_off(usp_fan5_off),                     
    .usp_spd_sel(usp_spd5_sel),                     
    .usp_fan_alarm(usp_fan5_alarm),                 
    .fan_pwm_o(fan_pwm5_o)                          
    );                                              
	else begin                                        
		assign fan_pwm5_o = !PWM5_POLARITY;             
		assign usp_fan5_alarm = 1'b0;   end             
endgenerate     

generate                                               
	if (FAN_NUMBER >= 6 )                                
		fanctl_core                                        
		#                                                  
		(                                                  
		.SIMULATE_IP(SIMULATE_IP),                         
		.PWM_PRESCALE(PWM6_PRESCALE),                      
		.PWM_POLARITY(PWM6_POLARITY),                      
		.FAN_SPEED1(FAN6_SPEED1),                          
		.FAN_SPEED2(FAN6_SPEED2),                          
		.FAN_SPEED3(FAN6_SPEED3),          		             
		.FAN_SENSE_ENABLE(FAN6_SENSE_ENABLE),              
		.FAN_SENSE_MODE(FAN6_SENSE_MODE),                  
		.FAN_SENSE_POLARITY(FAN6_SENSE_POLARITY),          
		.FAN_3WIRE(FAN6_3WIRE_LS),                         
		.ALARM_INTERVAL(ALARM6_INTERVAL),                  
		.ALARM_FILTER(ALARM6_FILTER),			                 
    .STARTUP_ENABLE(STARTUP6_ENABLE),		               
    .STARTUP_PERIOD(STARTUP6_PERIOD)                   
    )	                                                 
    fan6                                               
    (                                                  
    .clk_8mhz(clk_8mhz),                               
    .clk_250khz(clk_250khz),                           
    .rstn(rstn),                                       
    .fan_sense_i(fan_sense6_i),		                     
    .usp_fan_full(usp_fan6_full),                      
    .usp_fan_off(usp_fan6_off),                        
    .usp_spd_sel(usp_spd6_sel),                        
    .usp_fan_alarm(usp_fan6_alarm),                    
    .fan_pwm_o(fan_pwm6_o)                             
    );                                                 
	else begin                                           
		assign fan_pwm6_o = !PWM6_POLARITY;                
		assign usp_fan6_alarm = 1'b0;   end                
endgenerate                                            

generate                                        
	if (FAN_NUMBER >= 7 )                         
		fanctl_core                                 
		#                                           
		(                                           
		.SIMULATE_IP(SIMULATE_IP),                  
		.PWM_PRESCALE(PWM7_PRESCALE),               
		.PWM_POLARITY(PWM7_POLARITY),               
		.FAN_SPEED1(FAN7_SPEED1),                   
		.FAN_SPEED2(FAN7_SPEED2),                   
		.FAN_SPEED3(FAN7_SPEED3),          		      
		.FAN_SENSE_ENABLE(FAN7_SENSE_ENABLE),       
		.FAN_SENSE_MODE(FAN7_SENSE_MODE),           
		.FAN_SENSE_POLARITY(FAN7_SENSE_POLARITY),   
		.FAN_3WIRE(FAN7_3WIRE_LS),                  
		.ALARM_INTERVAL(ALARM7_INTERVAL),           
		.ALARM_FILTER(ALARM7_FILTER),			          
    .STARTUP_ENABLE(STARTUP7_ENABLE),		        
    .STARTUP_PERIOD(STARTUP7_PERIOD)            
    )	                                          
    fan7                                        
    (                                           
    .clk_8mhz(clk_8mhz),                        
    .clk_250khz(clk_250khz),                    
    .rstn(rstn),                                
    .fan_sense_i(fan_sense7_i),		              
    .usp_fan_full(usp_fan7_full),               
    .usp_fan_off(usp_fan7_off),                 
    .usp_spd_sel(usp_spd7_sel),                 
    .usp_fan_alarm(usp_fan7_alarm),             
    .fan_pwm_o(fan_pwm7_o)                      
    );                                          
	else begin                                    
		assign fan_pwm7_o = !PWM7_POLARITY;         
		assign usp_fan7_alarm = 1'b0;   end         
endgenerate  

generate                                                       
	if (FAN_NUMBER >= 8 )                                        
		fanctl_core                                                
		#                                                          
		(                                                          
		.SIMULATE_IP(SIMULATE_IP),                                 
		.PWM_PRESCALE(PWM8_PRESCALE),                              
		.PWM_POLARITY(PWM8_POLARITY),                              
		.FAN_SPEED1(FAN8_SPEED1),                                  
		.FAN_SPEED2(FAN8_SPEED2),                                  
		.FAN_SPEED3(FAN8_SPEED3),          		                     
		.FAN_SENSE_ENABLE(FAN8_SENSE_ENABLE),                      
		.FAN_SENSE_MODE(FAN8_SENSE_MODE),                          
		.FAN_SENSE_POLARITY(FAN8_SENSE_POLARITY),                  
		.FAN_3WIRE(FAN8_3WIRE_LS),                                 
		.ALARM_INTERVAL(ALARM8_INTERVAL),                          
		.ALARM_FILTER(ALARM8_FILTER),			                         
    .STARTUP_ENABLE(STARTUP8_ENABLE),		                       
    .STARTUP_PERIOD(STARTUP8_PERIOD)                           
    )	                                                         
    fan8                                                       
    (                                                          
    .clk_8mhz(clk_8mhz),                                       
    .clk_250khz(clk_250khz),                                   
    .rstn(rstn),                                               
    .fan_sense_i(fan_sense8_i),		                             
    .usp_fan_full(usp_fan8_full),                              
    .usp_fan_off(usp_fan8_off),                                
    .usp_spd_sel(usp_spd8_sel),                                
    .usp_fan_alarm(usp_fan8_alarm),                            
    .fan_pwm_o(fan_pwm8_o)                                     
    );                                                         
	else begin                                                   
		assign fan_pwm8_o = !PWM8_POLARITY;                        
		assign usp_fan8_alarm = 1'b0;   end                        
endgenerate                                                    
                                   
generate                                         
	if (FAN_NUMBER >= 9 )                          
		fanctl_core                                  
		#                                            
		(                                            
		.SIMULATE_IP(SIMULATE_IP),                   
		.PWM_PRESCALE(PWM9_PRESCALE),                
		.PWM_POLARITY(PWM9_POLARITY),                
		.FAN_SPEED1(FAN9_SPEED1),                    
		.FAN_SPEED2(FAN9_SPEED2),                    
		.FAN_SPEED3(FAN9_SPEED3),          		       
		.FAN_SENSE_ENABLE(FAN9_SENSE_ENABLE),        
		.FAN_SENSE_MODE(FAN9_SENSE_MODE),            
		.FAN_SENSE_POLARITY(FAN9_SENSE_POLARITY),    
		.FAN_3WIRE(FAN9_3WIRE_LS),                   
		.ALARM_INTERVAL(ALARM9_INTERVAL),            
		.ALARM_FILTER(ALARM9_FILTER),			           
    .STARTUP_ENABLE(STARTUP9_ENABLE),		         
    .STARTUP_PERIOD(STARTUP9_PERIOD)             
    )	                                           
    fan9                                         
    (                                            
    .clk_8mhz(clk_8mhz),                         
    .clk_250khz(clk_250khz),                     
    .rstn(rstn),                                 
    .fan_sense_i(fan_sense9_i),		               
    .usp_fan_full(usp_fan9_full),                
    .usp_fan_off(usp_fan9_off),                  
    .usp_spd_sel(usp_spd9_sel),                  
    .usp_fan_alarm(usp_fan9_alarm),              
    .fan_pwm_o(fan_pwm9_o)                       
    );                                           
	else begin                                     
		assign fan_pwm9_o = !PWM9_POLARITY;          
		assign usp_fan9_alarm = 1'b0;   end          
endgenerate                                      
                                   
generate                                         
	if (FAN_NUMBER >= 10 )                          
		fanctl_core                                  
		#                                            
		(                                            
		.SIMULATE_IP(SIMULATE_IP),                   
		.PWM_PRESCALE(PWM10_PRESCALE),                
		.PWM_POLARITY(PWM10_POLARITY),                
		.FAN_SPEED1(FAN10_SPEED1),                    
		.FAN_SPEED2(FAN10_SPEED2),                    
		.FAN_SPEED3(FAN10_SPEED3),          		       
		.FAN_SENSE_ENABLE(FAN10_SENSE_ENABLE),        
		.FAN_SENSE_MODE(FAN10_SENSE_MODE),            
		.FAN_SENSE_POLARITY(FAN10_SENSE_POLARITY),    
		.FAN_3WIRE(FAN10_3WIRE_LS),                   
		.ALARM_INTERVAL(ALARM10_INTERVAL),            
		.ALARM_FILTER(ALARM10_FILTER),			           
    .STARTUP_ENABLE(STARTUP10_ENABLE),		         
    .STARTUP_PERIOD(STARTUP10_PERIOD)             
    )	                                           
    fan10                                         
    (                                            
    .clk_8mhz(clk_8mhz),                         
    .clk_250khz(clk_250khz),                     
    .rstn(rstn),                                 
    .fan_sense_i(fan_sense10_i),		               
    .usp_fan_full(usp_fan10_full),                
    .usp_fan_off(usp_fan10_off),                  
    .usp_spd_sel(usp_spd10_sel),                  
    .usp_fan_alarm(usp_fan10_alarm),              
    .fan_pwm_o(fan_pwm10_o)                       
    );                                           
	else begin                                     
		assign fan_pwm10_o = !PWM10_POLARITY;          
		assign usp_fan10_alarm = 1'b0;   end          
endgenerate                                      

generate                                           
	if (FAN_NUMBER >= 11 )                           
		fanctl_core                                    
		#                                              
		(                                              
		.SIMULATE_IP(SIMULATE_IP),                     
		.PWM_PRESCALE(PWM11_PRESCALE),                 
		.PWM_POLARITY(PWM11_POLARITY),                 
		.FAN_SPEED1(FAN11_SPEED1),                     
		.FAN_SPEED2(FAN11_SPEED2),                     
		.FAN_SPEED3(FAN11_SPEED3),          		       
		.FAN_SENSE_ENABLE(FAN11_SENSE_ENABLE),         
		.FAN_SENSE_MODE(FAN11_SENSE_MODE),             
		.FAN_SENSE_POLARITY(FAN11_SENSE_POLARITY),     
		.FAN_3WIRE(FAN11_3WIRE_LS),                    
		.ALARM_INTERVAL(ALARM11_INTERVAL),             
		.ALARM_FILTER(ALARM11_FILTER),			           
    .STARTUP_ENABLE(STARTUP11_ENABLE),		         
    .STARTUP_PERIOD(STARTUP11_PERIOD)              
    )	                                             
    fan11                                          
    (                                              
    .clk_8mhz(clk_8mhz),                           
    .clk_250khz(clk_250khz),                       
    .rstn(rstn),                                   
    .fan_sense_i(fan_sense11_i),		               
    .usp_fan_full(usp_fan11_full),                 
    .usp_fan_off(usp_fan11_off),                   
    .usp_spd_sel(usp_spd11_sel),                   
    .usp_fan_alarm(usp_fan11_alarm),               
    .fan_pwm_o(fan_pwm11_o)                        
    );                                             
	else begin                                       
		assign fan_pwm11_o = !PWM11_POLARITY;          
		assign usp_fan11_alarm = 1'b0;   end           
endgenerate                                        

generate                                             
	if (FAN_NUMBER >= 12 )                             
		fanctl_core                                      
		#                                                
		(                                                
		.SIMULATE_IP(SIMULATE_IP),                       
		.PWM_PRESCALE(PWM12_PRESCALE),                   
		.PWM_POLARITY(PWM12_POLARITY),                   
		.FAN_SPEED1(FAN12_SPEED1),                       
		.FAN_SPEED2(FAN12_SPEED2),                       
		.FAN_SPEED3(FAN12_SPEED3),          		         
		.FAN_SENSE_ENABLE(FAN12_SENSE_ENABLE),           
		.FAN_SENSE_MODE(FAN12_SENSE_MODE),               
		.FAN_SENSE_POLARITY(FAN12_SENSE_POLARITY),       
		.FAN_3WIRE(FAN12_3WIRE_LS),                      
		.ALARM_INTERVAL(ALARM12_INTERVAL),               
		.ALARM_FILTER(ALARM12_FILTER),			             
    .STARTUP_ENABLE(STARTUP12_ENABLE),		           
    .STARTUP_PERIOD(STARTUP12_PERIOD)                
    )	                                               
    fan12                                            
    (                                                
    .clk_8mhz(clk_8mhz),                             
    .clk_250khz(clk_250khz),                         
    .rstn(rstn),                                     
    .fan_sense_i(fan_sense12_i),		                 
    .usp_fan_full(usp_fan12_full),                   
    .usp_fan_off(usp_fan12_off),                     
    .usp_spd_sel(usp_spd12_sel),                     
    .usp_fan_alarm(usp_fan12_alarm),                 
    .fan_pwm_o(fan_pwm12_o)                          
    );                                               
	else begin                                         
		assign fan_pwm12_o = !PWM12_POLARITY;            
		assign usp_fan12_alarm = 1'b0;   end             
endgenerate     

generate                                             
	if (FAN_NUMBER >= 13 )                             
		fanctl_core                                      
		#                                                
		(                                                
		.SIMULATE_IP(SIMULATE_IP),                       
		.PWM_PRESCALE(PWM13_PRESCALE),                   
		.PWM_POLARITY(PWM13_POLARITY),                   
		.FAN_SPEED1(FAN13_SPEED1),                       
		.FAN_SPEED2(FAN13_SPEED2),                       
		.FAN_SPEED3(FAN13_SPEED3),          		         
		.FAN_SENSE_ENABLE(FAN13_SENSE_ENABLE),           
		.FAN_SENSE_MODE(FAN13_SENSE_MODE),               
		.FAN_SENSE_POLARITY(FAN13_SENSE_POLARITY),       
		.FAN_3WIRE(FAN13_3WIRE_LS),                      
		.ALARM_INTERVAL(ALARM13_INTERVAL),               
		.ALARM_FILTER(ALARM13_FILTER),			             
    .STARTUP_ENABLE(STARTUP13_ENABLE),		           
    .STARTUP_PERIOD(STARTUP13_PERIOD)                
    )	                                               
    fan13                                            
    (                                                
    .clk_8mhz(clk_8mhz),                             
    .clk_250khz(clk_250khz),                         
    .rstn(rstn),                                     
    .fan_sense_i(fan_sense13_i),		                 
    .usp_fan_full(usp_fan13_full),                   
    .usp_fan_off(usp_fan13_off),                     
    .usp_spd_sel(usp_spd13_sel),                     
    .usp_fan_alarm(usp_fan13_alarm),                 
    .fan_pwm_o(fan_pwm13_o)                          
    );                                               
	else begin                                         
		assign fan_pwm13_o = !PWM13_POLARITY;            
		assign usp_fan13_alarm = 1'b0;   end             
endgenerate     
                                     
generate                                             
	if (FAN_NUMBER >= 14 )                             
		fanctl_core                                      
		#                                                
		(                                                
		.SIMULATE_IP(SIMULATE_IP),                       
		.PWM_PRESCALE(PWM14_PRESCALE),                   
		.PWM_POLARITY(PWM14_POLARITY),                   
		.FAN_SPEED1(FAN14_SPEED1),                       
		.FAN_SPEED2(FAN14_SPEED2),                       
		.FAN_SPEED3(FAN14_SPEED3),          		         
		.FAN_SENSE_ENABLE(FAN14_SENSE_ENABLE),           
		.FAN_SENSE_MODE(FAN14_SENSE_MODE),               
		.FAN_SENSE_POLARITY(FAN14_SENSE_POLARITY),       
		.FAN_3WIRE(FAN14_3WIRE_LS),                      
		.ALARM_INTERVAL(ALARM14_INTERVAL),               
		.ALARM_FILTER(ALARM14_FILTER),			             
    .STARTUP_ENABLE(STARTUP14_ENABLE),		           
    .STARTUP_PERIOD(STARTUP14_PERIOD)                
    )	                                               
    fan14                                            
    (                                                
    .clk_8mhz(clk_8mhz),                             
    .clk_250khz(clk_250khz),                         
    .rstn(rstn),                                     
    .fan_sense_i(fan_sense14_i),		                 
    .usp_fan_full(usp_fan14_full),                   
    .usp_fan_off(usp_fan14_off),                     
    .usp_spd_sel(usp_spd14_sel),                     
    .usp_fan_alarm(usp_fan14_alarm),                 
    .fan_pwm_o(fan_pwm14_o)                          
    );                                               
	else begin                                         
		assign fan_pwm14_o = !PWM14_POLARITY;            
		assign usp_fan14_alarm = 1'b0;   end             
endgenerate                                          
                                                     
generate                                          
	if (FAN_NUMBER >= 15 )                          
		fanctl_core                                   
		#                                             
		(                                             
		.SIMULATE_IP(SIMULATE_IP),                    
		.PWM_PRESCALE(PWM15_PRESCALE),                
		.PWM_POLARITY(PWM15_POLARITY),                
		.FAN_SPEED1(FAN15_SPEED1),                    
		.FAN_SPEED2(FAN15_SPEED2),                    
		.FAN_SPEED3(FAN15_SPEED3),          		      
		.FAN_SENSE_ENABLE(FAN15_SENSE_ENABLE),        
		.FAN_SENSE_MODE(FAN15_SENSE_MODE),            
		.FAN_SENSE_POLARITY(FAN15_SENSE_POLARITY),    
		.FAN_3WIRE(FAN15_3WIRE_LS),                   
		.ALARM_INTERVAL(ALARM15_INTERVAL),            
		.ALARM_FILTER(ALARM15_FILTER),			          
    .STARTUP_ENABLE(STARTUP15_ENABLE),		        
    .STARTUP_PERIOD(STARTUP15_PERIOD)             
    )	                                            
    fan15                                         
    (                                             
    .clk_8mhz(clk_8mhz),                          
    .clk_250khz(clk_250khz),                      
    .rstn(rstn),                                  
    .fan_sense_i(fan_sense15_i),		              
    .usp_fan_full(usp_fan15_full),                
    .usp_fan_off(usp_fan15_off),                  
    .usp_spd_sel(usp_spd15_sel),                  
    .usp_fan_alarm(usp_fan15_alarm),              
    .fan_pwm_o(fan_pwm15_o)                       
    );                                            
	else begin                                      
		assign fan_pwm15_o = !PWM15_POLARITY;         
		assign usp_fan15_alarm = 1'b0;   end          
endgenerate                                       

generate                                                   
	if (FAN_NUMBER >= 16 )                                   
		fanctl_core                                            
		#                                                      
		(                                                      
		.SIMULATE_IP(SIMULATE_IP),                             
		.PWM_PRESCALE(PWM16_PRESCALE),                         
		.PWM_POLARITY(PWM16_POLARITY),                         
		.FAN_SPEED1(FAN16_SPEED1),                             
		.FAN_SPEED2(FAN16_SPEED2),                             
		.FAN_SPEED3(FAN16_SPEED3),          		               
		.FAN_SENSE_ENABLE(FAN16_SENSE_ENABLE),                 
		.FAN_SENSE_MODE(FAN16_SENSE_MODE),                     
		.FAN_SENSE_POLARITY(FAN16_SENSE_POLARITY),             
		.FAN_3WIRE(FAN16_3WIRE_LS),                            
		.ALARM_INTERVAL(ALARM16_INTERVAL),                     
		.ALARM_FILTER(ALARM16_FILTER),			                   
    .STARTUP_ENABLE(STARTUP16_ENABLE),		                 
    .STARTUP_PERIOD(STARTUP16_PERIOD)                      
    )	                                                     
    fan16                                                  
    (                                                      
    .clk_8mhz(clk_8mhz),                                   
    .clk_250khz(clk_250khz),                               
    .rstn(rstn),                                           
    .fan_sense_i(fan_sense16_i),		                       
    .usp_fan_full(usp_fan16_full),                         
    .usp_fan_off(usp_fan16_off),                           
    .usp_spd_sel(usp_spd16_sel),                           
    .usp_fan_alarm(usp_fan16_alarm),                       
    .fan_pwm_o(fan_pwm16_o)                                
    );                                                     
	else begin                                               
		assign fan_pwm16_o = !PWM16_POLARITY;                  
		assign usp_fan16_alarm = 1'b0;   end                   
endgenerate  

generate                                             
	if (FAN_NUMBER >= 17 )                             
		fanctl_core                                      
		#                                                
		(                                                
		.SIMULATE_IP(SIMULATE_IP),                       
		.PWM_PRESCALE(PWM17_PRESCALE),                   
		.PWM_POLARITY(PWM17_POLARITY),                   
		.FAN_SPEED1(FAN17_SPEED1),                       
		.FAN_SPEED2(FAN17_SPEED2),                       
		.FAN_SPEED3(FAN17_SPEED3),          		         
		.FAN_SENSE_ENABLE(FAN17_SENSE_ENABLE),           
		.FAN_SENSE_MODE(FAN17_SENSE_MODE),               
		.FAN_SENSE_POLARITY(FAN17_SENSE_POLARITY),       
		.FAN_3WIRE(FAN17_3WIRE_LS),                      
		.ALARM_INTERVAL(ALARM17_INTERVAL),               
		.ALARM_FILTER(ALARM17_FILTER),			             
    .STARTUP_ENABLE(STARTUP17_ENABLE),		           
    .STARTUP_PERIOD(STARTUP17_PERIOD)                
    )	                                               
    fan17                                            
    (                                                
    .clk_8mhz(clk_8mhz),                             
    .clk_250khz(clk_250khz),                         
    .rstn(rstn),                                     
    .fan_sense_i(fan_sense17_i),		                 
    .usp_fan_full(usp_fan17_full),                   
    .usp_fan_off(usp_fan17_off),                     
    .usp_spd_sel(usp_spd17_sel),                     
    .usp_fan_alarm(usp_fan17_alarm),                 
    .fan_pwm_o(fan_pwm17_o)                          
    );                                               
	else begin                                         
		assign fan_pwm17_o = !PWM17_POLARITY;            
		assign usp_fan17_alarm = 1'b0;   end             
endgenerate    

generate                                            
	if (FAN_NUMBER == 18 )                            
		fanctl_core                                     
		#                                               
		(                                               
		.SIMULATE_IP(SIMULATE_IP),                      
		.PWM_PRESCALE(PWM18_PRESCALE),                  
		.PWM_POLARITY(PWM18_POLARITY),                  
		.FAN_SPEED1(FAN18_SPEED1),                      
		.FAN_SPEED2(FAN18_SPEED2),                      
		.FAN_SPEED3(FAN18_SPEED3),          		        
		.FAN_SENSE_ENABLE(FAN18_SENSE_ENABLE),          
		.FAN_SENSE_MODE(FAN18_SENSE_MODE),              
		.FAN_SENSE_POLARITY(FAN18_SENSE_POLARITY),      
		.FAN_3WIRE(FAN18_3WIRE_LS),                     
		.ALARM_INTERVAL(ALARM18_INTERVAL),              
		.ALARM_FILTER(ALARM18_FILTER),			            
    .STARTUP_ENABLE(STARTUP18_ENABLE),		          
    .STARTUP_PERIOD(STARTUP18_PERIOD)               
    )	                                              
    fan18                                           
    (                                               
    .clk_8mhz(clk_8mhz),                            
    .clk_250khz(clk_250khz),                        
    .rstn(rstn),                                    
    .fan_sense_i(fan_sense18_i),		                
    .usp_fan_full(usp_fan18_full),                  
    .usp_fan_off(usp_fan18_off),                    
    .usp_spd_sel(usp_spd18_sel),                    
    .usp_fan_alarm(usp_fan18_alarm),                
    .fan_pwm_o(fan_pwm18_o)                         
    );                                              
	else begin                                        
		assign fan_pwm18_o = !PWM18_POLARITY;           
		assign usp_fan18_alarm = 1'b0;   end            
endgenerate                                                                               
                                              

endmodule		