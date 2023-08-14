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
// File                  : fanctl_core.v                                              
// Title                 : Fan Controller IP core                                        
// Dependencies          :                                                       
//                       :                                                         
// Description           : Fan Controller IP core                             
// =============================================================================   
//                        REVISION HISTORY                                         
// Version               : 1.0                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Apr, 2012                 
// -----------------------------------------------------------------------------
// Version               : 1.1                                                     
// Changes Made          : add PWM_POLARITY (parameter) and fan_pwm(output from
//                       : pwm_gen) as input to alarm_gen module                                        
// Author(s)             : CMUI                                                    
// Mod. Date             : Dec, 2012                                     
// =============================================================================   
module fanctl_core
			( 
			input clk_8mhz,
			input clk_250khz,
			input rstn,
			input fan_sense_i,			
			input usp_fan_full,
			input usp_fan_off,
			input [1:0] usp_spd_sel,
			
			output usp_fan_alarm,
			output fan_pwm_o
			);

// PWM generator parameters
parameter SIMULATE_IP = 0;
parameter PWM_PRESCALE = 50;
parameter PWM_POLARITY = 1;
parameter FAN_SPEED1 = 25;
parameter FAN_SPEED2 = 50;
parameter FAN_SPEED3 = 75;

//FAN ALARM generator parameters
parameter FAN_SENSE_ENABLE = 1;
parameter FAN_SENSE_MODE = 0;			// 0 = LOCKED mode, 1 = TACH mode
parameter FAN_SENSE_POLARITY = 1; // 1 = active high, 0 = active low, this is applicabled to LOCKED mode only 
parameter FAN_3WIRE = 0;					// 1 indicates a 3-wire fan
parameter ALARM_INTERVAL = 50;		// range 1ms to 100ms
parameter ALARM_FILTER = 5;				// range 1 to 10

// FAN Start up parameters
parameter STARTUP_ENABLE = 1;			
parameter STARTUP_PERIOD = 4;			// range 1 to 8, translate into 0.25s to 2s

// internal signals
wire startup_done;
wire check3wire_ena;
wire slow_clk;      
wire fan_off;   
wire fan_full;
wire fan_pwm;
reg rstn_250khz_int;       
reg rstn_250khz;     
assign fan_pwm_o = fan_pwm;   

// instantiate PWM Generator
pwm_gen 
		#
		(	
			.PWM_PRESCALE(PWM_PRESCALE),
			.PWM_POLARITY(PWM_POLARITY),
			.FAN_SPEED1(FAN_SPEED1),   
			.FAN_SPEED2(FAN_SPEED2),  
			.FAN_SPEED3(FAN_SPEED3),
			.FAN_3WIRE(FAN_3WIRE),
			.STARTUP_ENABLE(STARTUP_ENABLE)
		) 
		inst1_pwm_gen
		(
			.clk_8mhz(clk_8mhz),
			.rstn(rstn),
			.usp_fan_full(usp_fan_full),
			.usp_fan_off(usp_fan_off),
			.usp_spd_sel(usp_spd_sel),
			.startup_done(startup_done),	
			.check3wire_ena(check3wire_ena),	
			.fan_off(fan_off),
			.fan_full(fan_full),
			.fan_pwm_o(fan_pwm)
			);

// Instantiate STARTUP circuitry
generate 
	if (STARTUP_ENABLE) 
		startup_cntrl
		#
		(	
			.SIMULATE_IP(SIMULATE_IP),		
			.STARTUP_PERIOD(STARTUP_PERIOD) 
		)
		inst2_startup_cntrl
		( 
			.clk_250khz(clk_250khz),
			.rstn(rstn_250khz),
			.fan_off(fan_off),
			.startup_done(startup_done),
			.slow_clk_o(slow_clk)	
			);
	else begin
		assign startup_done = 1'b1;
		assign slow_clk = 1'b0; end		
endgenerate

// Instantiate ALARM Generator
generate
	if (FAN_SENSE_ENABLE)
		alarm_gen
		#
		(	
			.SIMULATE_IP(SIMULATE_IP),
			.PWM_POLARITY(PWM_POLARITY),
		  .STARTUP_ENABLE(STARTUP_ENABLE),     				 
		  .FAN_SENSE_MODE(FAN_SENSE_MODE),			 
		  .FAN_SENSE_POLARITY(FAN_SENSE_POLARITY),
		  .FAN_3WIRE(FAN_3WIRE),  
		  .ALARM_INTERVAL(ALARM_INTERVAL),							
		  .ALARM_FILTER(ALARM_FILTER)
		 )
		 inst3_alarm_gen
		(
			.clk_250khz(clk_250khz),         
			.rstn(rstn_250khz),               
			.fan_sense_i(fan_sense_i),        
			.slow_clk_i(slow_clk),   
			.startup_done(startup_done),  
			.fan_off(fan_off),
			.fan_pwm(fan_pwm),
		  .usp_fan_alarm(usp_fan_alarm),
		  .check3wire_ena(check3wire_ena)
		 ); 
	else begin
		assign usp_fan_alarm = 1'b0; 
		assign check3wire_ena = 1'b0; end
endgenerate		 

// Sync the reset signal to the 250khz clock
generate
	if (STARTUP_ENABLE || FAN_SENSE_ENABLE)
		always @(posedge clk_250khz, negedge rstn)
			if (~rstn) begin
				rstn_250khz_int <= 1'b0;
				rstn_250khz <= 1'b0; end
			else begin
				rstn_250khz_int <= 1'b1;
				rstn_250khz <= rstn_250khz_int; end   
endgenerate
		
endmodule		
			