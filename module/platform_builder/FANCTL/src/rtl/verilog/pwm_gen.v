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
// File                  : pwm_gen.v                                              
// Title                 : PWM generator in Fan controller core                                         
// Dependencies          :                                                       
//                       :                                                         
// Description           : Generate the PWM output signal 
//                       : PWM frequency is between 800Hz to 80KHz                               
// =============================================================================   
//                        REVISION HISTORY                                   
// -----------------------------------------------------------------------------      
// Version               : 1.0                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Apr, 2012       
// -----------------------------------------------------------------------------
// Version               : 1.1
// Changes Made          : a) Increase the size of clk_divider to support the PWM  
//                       : frequency down to 50Hz (currently is 800Hz);   
//                       : b) change fan_pwm_o's reset state to !PWM_POLARITY 
//                       : (currently is 1'b0)												
// Author(s)             : HCHEN     
// Mod. Date             : Oct, 2013                                        
// =============================================================================   

module pwm_gen
		(
			input clk_8mhz,
			input rstn,
			input usp_fan_full,
			input usp_fan_off,
			input [1:0]usp_spd_sel,
			
			input startup_done,		
			input check3wire_ena,
			
			output fan_off,
			output fan_full,
			output reg fan_pwm_o
		);
		
// PWM generator parameters
parameter PWM_PRESCALE = 50;
parameter PWM_POLARITY = 1;
parameter FAN_SPEED1 = 25;
parameter FAN_SPEED2 = 50;
parameter FAN_SPEED3 = 75;
// ALARM generator parameters
parameter FAN_3WIRE = 0;
// Startup parameter        
parameter STARTUP_ENABLE = 0;

//local parameter
localparam PWM_SCALE = PWM_PRESCALE * 100 -1;
localparam PWM_PULSE_CNT1 = FAN_SPEED1 * PWM_PRESCALE;
localparam PWM_PULSE_CNT2 = FAN_SPEED2 * PWM_PRESCALE;
localparam PWM_PULSE_CNT3 = FAN_SPEED3 * PWM_PRESCALE;

//internal signals 							
reg pwm_speed1, pwm_speed2, pwm_speed3;						

//-----------------------------------------------------------------------------
// counter to divide down the 8MHz clock to the desired PWM frequency
//-----------------------------------------------------------------------------
reg [17:0] clk_divider;

always @(posedge clk_8mhz or negedge rstn)
	if (~rstn) 
		clk_divider <= 18'd0;
	else 
		if (clk_divider == PWM_SCALE)
			clk_divider <= 18'd0;
		else
			clk_divider <= clk_divider + 1;	
			

//-----------------------------------------------------------------------------
// duty cycle of PWM signal
//-----------------------------------------------------------------------------
always @(posedge clk_8mhz or negedge rstn)
	if (~rstn)
		pwm_speed1 <= 0;		
	else
		if (clk_divider < PWM_PULSE_CNT1)
			pwm_speed1 <= 1'b1 && PWM_POLARITY;
		else 
		  pwm_speed1 <= 1'b0 || !PWM_POLARITY;

always @(posedge clk_8mhz or negedge rstn)                       		  
	if (~rstn)                                   		  
		pwm_speed2 <= 0;		                       
	else                                         	
		if (clk_divider < PWM_PULSE_CNT2)          				
			pwm_speed2 <= 1'b1 && PWM_POLARITY;      		 
		else                                       
		  pwm_speed2 <= 1'b0 || !PWM_POLARITY;     

always @(posedge clk_8mhz or negedge rstn)                       		  
	if (~rstn)                                   		
		pwm_speed3 <= 0;		                       
	else                                         
		if (clk_divider < PWM_PULSE_CNT3)          
			pwm_speed3 <= 1'b1 && PWM_POLARITY;      		
		else                                       
		  pwm_speed3 <= 1'b0 || !PWM_POLARITY;     

//-----------------------------------------------------------------------------
// Checking the input signals
//-----------------------------------------------------------------------------
reg [1:0] usp_fan_full_reg;
reg [1:0] usp_fan_off_reg;
reg [1:0] usp_spd_sel_reg1;
reg [1:0] usp_spd_sel_reg2;

always @(posedge clk_8mhz or negedge rstn)
	if (~rstn)
		usp_fan_full_reg <= 2'b0;
	else begin
		usp_fan_full_reg[0] <= usp_fan_full;
		usp_fan_full_reg[1] <= usp_fan_full_reg[0]; end

always @(posedge clk_8mhz or negedge rstn)
	if (~rstn)
		usp_fan_off_reg <= 2'b0;
	else begin
		usp_fan_off_reg[0] <= usp_fan_off;
		usp_fan_off_reg[1] <= usp_fan_off_reg[0]; end		

always @(posedge clk_8mhz or negedge rstn)
	if (~rstn) begin
		usp_spd_sel_reg1 <= 2'b0;
		usp_spd_sel_reg2 <= 2'b0; end
	else begin
		usp_spd_sel_reg1 <= usp_spd_sel;
		usp_spd_sel_reg2 <= usp_spd_sel_reg1; end		

wire [1:0] fan_sel;

assign fan_sel[0] = (usp_spd_sel_reg1[0] && usp_spd_sel_reg2[0]) ? 1'b1 : 1'b0;
assign fan_sel[1] = (usp_spd_sel_reg1[1] && usp_spd_sel_reg2[1]) ? 1'b1 : 1'b0;

assign fan_off =(usp_fan_off_reg[1] && usp_fan_off_reg[0]) ? 1'b1 : 1'b0;		 
assign fan_full = (usp_fan_full_reg[1] && usp_fan_full_reg[0]) ? 1'b1 : 1'b0;

//-----------------------------------------------------------------------------
// PWM output generation		  
//-----------------------------------------------------------------------------		  
always @(posedge clk_8mhz or negedge rstn)
	if (~rstn)
		fan_pwm_o <= !PWM_POLARITY;
	else
		if (STARTUP_ENABLE && !startup_done && !fan_off)							// when startup circuitry is enabled
			fan_pwm_o <= PWM_POLARITY;																	// always at full speed
		else																													// when startup circuitry is disabled
			if (fan_off)
				fan_pwm_o <= !PWM_POLARITY;
			else if (fan_full || check3wire_ena)
				fan_pwm_o <= PWM_POLARITY;
			else if (fan_sel == 2'b00)
				fan_pwm_o <= pwm_speed1;
			else if (fan_sel == 2'b01)
				fan_pwm_o <= pwm_speed2;
			else if (fan_sel[1] == 1'b1)
				fan_pwm_o <= pwm_speed3;		
	
				
endmodule		  