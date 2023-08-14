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
// File                  : alarm_gen.v                                              
// Title                 : Alarm generator in Fan controller core                                         
// Dependencies          :                                                       
//                       :                                                         
// Description           : Generate the Alarm when fan speed is below threshold      
//											                           
// =============================================================================   
//                        REVISION HISTORY                                         
// Version               : 1.0                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : May, 2012                       
// -----------------------------------------------------------------------------
// Version               : 1.1
// Changes Made          : a)Update fail_cnt and alarm_cnt to capture the correct  
//                       : counts of fan_sense under any conditions;   
//                       : b) fan_off does not change the status of ALARM, that 
//                       : means ALARM keeps its status when fan_off = 1												
// Mod. Date             : Oct, 2012
//-----------------------------------------------------------------------------
// Version               : 1.2
// Changes Made          : Do not use pulse-stretching for 3-wire LOCK mode 
//                       : Instead, sample the sense_in during PWM active period  
// Mod. Date						 : Dec, 2012
// =============================================================================   

module alarm_gen
	(
		input clk_250khz,
		input rstn,
		input fan_sense_i,
		input slow_clk_i,
		input startup_done,
		input fan_off,
		input fan_pwm,
		output reg usp_fan_alarm,
		output wire check3wire_ena
	);

parameter SIMULATE_IP = 0;
// Fan Polarity
parameter PWM_POLARITY = 1; 
//FAN ALARM generator parameters
parameter STARTUP_ENABLE = 1;
parameter FAN_SENSE_MODE = 0;			 // 0 = LOCKED mode, 1 = TACH mode
parameter FAN_SENSE_POLARITY = 1;  // 1 = active high, 0 = active low, this is applicabled to LOCKED mode only
parameter FAN_3WIRE = 1;
parameter ALARM_INTERVAL = 10;		 // range 1ms to 100ms 															 
parameter ALARM_FILTER = 5; 			 // range 1 to 10

// local parameters
localparam ALARM_ASSERT = (ALARM_INTERVAL *10 + ALARM_INTERVAL);
localparam ALARM_DEASSERT = (ALARM_INTERVAL *10 - ALARM_INTERVAL);

// pulse stretching frequency
localparam period_3wire_sim = (ALARM_INTERVAL > 70) ? 5000 : (ALARM_INTERVAL > 50) ?  4000 : (ALARM_INTERVAL > 30) ? 3000 : (ALARM_INTERVAL > 10) ? 2000 : 1000;
localparam period_3wire_real = (ALARM_INTERVAL > 70) ? 50000 : (ALARM_INTERVAL > 50) ?  40000 : (ALARM_INTERVAL > 30) ? 30000 : (ALARM_INTERVAL > 10) ? 20000 : 10000;
localparam period_3wire = SIMULATE_IP ? period_3wire_sim : period_3wire_real;
// pulse stretching length
localparam enable_3wire_sim = (ALARM_INTERVAL > 70) ? (5000 - (ALARM_ASSERT *2)) : (ALARM_INTERVAL > 50) ? (4000 - (ALARM_ASSERT *2)) : (ALARM_INTERVAL > 30) ? (3000 - (ALARM_ASSERT *2)) : (ALARM_INTERVAL > 10) ? (2000 - (ALARM_ASSERT *2)) : (1000 - (ALARM_ASSERT *2));
localparam enable_3wire_real = (ALARM_INTERVAL > 70) ? (50000 - (ALARM_ASSERT *2)) : (ALARM_INTERVAL > 50) ? (40000 - (ALARM_ASSERT *2)) : (ALARM_INTERVAL > 30) ? (30000 - (ALARM_ASSERT *2)) : (ALARM_INTERVAL > 10) ? (20000 - (ALARM_ASSERT *2)) : (10000 - (ALARM_ASSERT *2));
localparam enable_3wire = SIMULATE_IP ? enable_3wire_sim : enable_3wire_real;
// parameterize counters
localparam cnt_bits = (ALARM_INTERVAL > 50) ?  16 : (ALARM_INTERVAL > 10) ? 15 : 14;
// max count to be proportional to ALARM_INTERVAL
localparam max_cnt_sim = ALARM_ASSERT + 5; 
localparam max_cnt_real = ALARM_ASSERT + (ALARM_ASSERT / 2); 
localparam max_cnt = SIMULATE_IP ? max_cnt_sim : max_cnt_real;


//Internal signals
reg [4:0] clk_10khz_divider;
reg slow_clk_int;
wire slow_10khz;   
 	
//-----------------------------------------------------------------------------
// Generate a clock (10kHz) for counting ALARM_INTERVAL
//-----------------------------------------------------------------------------
generate
if (FAN_SENSE_MODE) begin
	always @(posedge clk_250khz or negedge rstn)
		if (~rstn) begin
			clk_10khz_divider <= 5'd0;
			slow_clk_int <= 1'b0; end
		else
			if (clk_10khz_divider == 5'd24) begin						
				clk_10khz_divider <= 5'd0;
				slow_clk_int <= 1'b1; end
			else begin
				clk_10khz_divider <= clk_10khz_divider + 1;
				slow_clk_int <= 1'b0; end		

	assign slow_10khz = STARTUP_ENABLE ? slow_clk_i : slow_clk_int;						
end
endgenerate


//-----------------------------------------------------------------------------
// Detecting Fan Sense Input 
//-----------------------------------------------------------------------------
reg[1:0] fan_sense_i_reg;
reg fan_sense_det;
always @(posedge clk_250khz or negedge rstn)
	if (~rstn)
		if (FAN_SENSE_POLARITY)
			fan_sense_i_reg <= 2'b00;
		else 
			fan_sense_i_reg <= 2'b11;
	else begin
		fan_sense_i_reg[0] <= fan_sense_i;
		fan_sense_i_reg[1] <= fan_sense_i_reg[0]; end

always @(posedge clk_250khz or negedge rstn)
		if (~rstn) begin
			if (FAN_SENSE_POLARITY)
				fan_sense_det<= 1'b0;
			else 
				fan_sense_det <= 1'b1;end
		else begin
				fan_sense_det <= (fan_sense_i_reg[0]  && fan_sense_i_reg[1]); end

			
//-----------------------------------------------------------------------------
// Generate periodic check enable signal for 3 wire TACH mode fan
//-----------------------------------------------------------------------------
generate
	if (FAN_SENSE_MODE )
		begin
			reg [cnt_bits-1:0] cnt_10s;
			always @(posedge clk_250khz or negedge rstn)
				if (~rstn)
					cnt_10s <= 0;
				else
				 if (slow_10khz && FAN_3WIRE)
					if (cnt_10s == period_3wire)
							cnt_10s <= 0;
					else
							cnt_10s <= cnt_10s + 1;
							
			assign check3wire_ena = (cnt_10s > enable_3wire) ? 1'b1 : 1'b0;
		end
endgenerate		  
								

generate  
	if (FAN_SENSE_MODE) 
	begin
		//-----------------------------------------------------------------------------
		// Fan failure detection (for TACH mode) 
		// (updated, Sep ,2012)
		//-----------------------------------------------------------------------------		
		reg [10:0] fan_fail_cnt;
		always @(posedge clk_250khz or negedge rstn)
			if (~rstn) 
				fan_fail_cnt <= 11'd0; 
			else 
				 if (FAN_3WIRE)	
						if (startup_done && !fan_off && check3wire_ena) 
							begin
								if (fan_sense_i_reg[0] != fan_sense_i_reg[1]) 
									fan_fail_cnt <= 11'd0; 
								else if (slow_10khz) 			
									fan_fail_cnt <= fan_fail_cnt + 1; 
							end
						else 
							fan_fail_cnt <= 11'd0; 
					
				else
				 		if (startup_done && !fan_off) 
							begin
								if (fan_sense_i_reg[0] != fan_sense_i_reg[1]) 
									fan_fail_cnt <= 11'd0;
								else if (slow_10khz) 						
									fan_fail_cnt <= fan_fail_cnt + 1;
							end
						else 
							fan_fail_cnt <= 11'd0;	
				
					
		reg [3:0] alarm_cnt;
		reg first_edge;
		always @(posedge clk_250khz or negedge rstn)
			if (~rstn) 
					first_edge <= 1'b0; 
			else
					if (usp_fan_alarm) begin
				  		if ((fan_sense_i_reg[0] != fan_sense_i_reg[1]) && startup_done)  begin
				  			if (FAN_3WIRE)
				  				first_edge <= check3wire_ena;
				  			else 
				  				first_edge <= 1'b1; end 
				  		end
				  else 	
				  		first_edge <= 1'b0; 
		
		always @(posedge clk_250khz or negedge rstn)
			if (~rstn) 
					alarm_cnt <= 4'd0;
			else
					if (usp_fan_alarm) begin
				  		if (fan_fail_cnt == max_cnt) 
								alarm_cnt <= ALARM_FILTER;
							else if (fan_fail_cnt == 11'd0) 
								alarm_cnt <= alarm_cnt;			  				
				  		else if ((fan_fail_cnt <= ALARM_DEASSERT) && (fan_sense_i_reg[0] != fan_sense_i_reg[1]) && first_edge)
				  				alarm_cnt <= alarm_cnt - 1; 
				  		end
				  else 	
				  	if ((fan_fail_cnt == ALARM_ASSERT) && slow_10khz)  
				  		alarm_cnt <= alarm_cnt + 1;

				  	
		
		//-----------------------------------------------------------------------------
		// Alarm Generation (for TACH mode)
		//-----------------------------------------------------------------------------
		always @(posedge clk_250khz or negedge rstn)
		 if (~rstn)
		 	 usp_fan_alarm <= 1'b0;
		 else
		 	 	if ((alarm_cnt == ALARM_FILTER) | (fan_fail_cnt == max_cnt))   
		 	 		usp_fan_alarm <= 1'b1;
				else if (usp_fan_alarm && (alarm_cnt == 0))
					usp_fan_alarm <= 1'b0;
	
	end
	
	else
	begin
		//-----------------------------------------------------------------------------
		// ALARM Generation (for LOCKED mode)
		//-----------------------------------------------------------------------------		
		always @(posedge clk_250khz or negedge rstn)
     if (~rstn)                 
     	 usp_fan_alarm <= 1'b0;   
     else 
      if (startup_done && !fan_off)
			begin
			  if (!FAN_3WIRE)
			  	if (FAN_SENSE_POLARITY)
			  		usp_fan_alarm <= fan_sense_det;
			  	else 
			  		usp_fan_alarm <= !fan_sense_det;
			  else
			  	if (FAN_SENSE_POLARITY)    
			  		begin
			  		if (PWM_POLARITY && fan_pwm)												// sample sense in when fan_pwm = 1
			  			usp_fan_alarm <= fan_sense_det;
			  		else if (!PWM_POLARITY && !fan_pwm)									// sample sense in when fan_pwm = 0
			  			usp_fan_alarm <= fan_sense_det; 
			  		end
			  	else
			  		begin 
			  		if (PWM_POLARITY && fan_pwm)												// sample sense in when fan_pwm = 1      
			  			usp_fan_alarm <= !fan_sense_det;                                            
			  		else if (!PWM_POLARITY && !fan_pwm)									// sample sense in when fan_pwm = 0      
			  			usp_fan_alarm <= !fan_sense_det;                                           
						end			  		
			end				  	
	end
endgenerate	                


endmodule					

			