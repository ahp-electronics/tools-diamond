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
// File                  : startup_ctrl.v                                              
// Title                 : Startup circuitry - optional                                         
// Dependencies          :                                                       
//                       :                                                         
// Description           : Generate the startup_done signal                              
// =============================================================================   
//                        REVISION HISTORY                                         
// Version               : 1.0                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Mar, 2012                                               
// =============================================================================   

module startup_cntrl
		( 
			input clk_250khz,
			input rstn,
			input fan_off,
			output reg startup_done,
			output reg slow_clk_o		
			);

parameter SIMULATE_IP = 0;
parameter STARTUP_PERIOD = 4;			

localparam PERIOD = STARTUP_PERIOD - 1;
localparam QUARTER_CNT = SIMULATE_IP ? 49 : 2499;							// 49 for simulation, 2499 for actual design

reg[4:0] slow_10khz_cnt;
reg[11:0] qrt_sec_cnt;
reg[3:0]	period_cnt;
reg qrt_flag;

//-----------------------------------------------------------------------------
// Generate a 10khz slow clock
//-----------------------------------------------------------------------------
always @(posedge clk_250khz or negedge rstn)
	if (~rstn) begin
		slow_10khz_cnt <= 5'd0;
		slow_clk_o <= 1'b0; end
	else	
			if (slow_10khz_cnt == 5'd24) begin				
				slow_10khz_cnt <= 5'd0;
				slow_clk_o <= 1'b1; end
			else begin
				slow_10khz_cnt <= slow_10khz_cnt + 1;
				slow_clk_o <= 1'b0; end		


//-----------------------------------------------------------------------------
// Generate a 1/4 second period
//-----------------------------------------------------------------------------
always @(posedge clk_250khz or negedge rstn)
	if (~rstn) begin
		qrt_sec_cnt <= 12'd0;
		qrt_flag <= 1'b0; end
	else
		if (fan_off) begin
			qrt_sec_cnt <= 11'd0;
			qrt_flag <= 1'b0; end
		else 	
			if (startup_done) begin
				qrt_sec_cnt <= 12'd0;
				qrt_flag <= 1'b0; end  
			else if (slow_clk_o)
				if (qrt_sec_cnt == QUARTER_CNT) begin  
					qrt_sec_cnt <= 12'd0;
					qrt_flag <= 1'b1;		end
				else  begin
					qrt_sec_cnt <= qrt_sec_cnt + 1;		
					qrt_flag <= 1'b0; end

//-----------------------------------------------------------------------------			
// Generate the desired start up period
//-----------------------------------------------------------------------------
always @(posedge clk_250khz or negedge rstn)
	if (~rstn) begin
		period_cnt <= 3'd0;
		startup_done <= 1'b0; end
	else
		if (fan_off) begin   
		  period_cnt <= 3'd0;           
			startup_done <= 1'b0; end   
		else 
			if (qrt_flag && slow_clk_o)					// to ensure single clock period
				if (period_cnt == PERIOD) begin
					period_cnt <= 3'd0;
					startup_done <= 1'b1; end
				else begin
					period_cnt <= period_cnt + 1;
					startup_done <= startup_done; end

endmodule