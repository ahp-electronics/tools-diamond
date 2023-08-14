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
// Project               : CLKRST Core                                                
// File                  : clkrst_core.v                                              
// Title                 : Clock/Reset IP design                                        
// Dependencies          :                                                       
//                       :                                                         
// Description           : The clock/reset distribution block                               
// =============================================================================   
//                        REVISION HISTORY                                         
// Version               : 0.1                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Jan, 2012    
// -----------------------------------------------------------------------------
// Version               : 0.2
// Changes Made          : change pmi_freq_clki to 8 to match the new XO2 PLL 
//                       : low-end input frequency    
// Mod. Date             : Oct., 2012                                    
// -----------------------------------------------------------------------------
// Version 	             : 0.3
// Changes Made          : add two 62.5kHz clocks for LogiBuilder
//                       : LogiBuilder reset is sync with the 62.5kHz clocks
// Mod. Date             : May, 2013
// -----------------------------------------------------------------------------
// Version 	             : 0.4
// Changes Made          : Add PLL support for ECP5 families
//                       : add pll_hsclk_o outputs for del_clk port of soft i2c
// Mod. Date             : Feb, 2015
// =============================================================================       

// Revision History:                                     
// $Log: ecp5PLUSasc#clkrst_ip#design#rtl#clkrst_core.v,v $
// Revision 1.3  2015-06-22 14:20:22-07  cmui
// Updated to improve timing:
// - simplify pld_clk and lb_clk generation
// - add lb_clk_enable as a clock enable for 62.5Khz clock
//
// Revision 1.2  2015-03-16 10:33:27-07  cmui
// Update the PLL setting per Apps hardware test result
//
// Revision 1.1  2015-02-23 15:43:22-08  cmui
// Initial version
//   

module clkrst_core
	(
		input clk_i,
		input asc0_rstn_i,         
		input asc1_rstn_i, 
		input asc2_rstn_i, 
		input asc3_rstn_i, 
		input asc4_rstn_i, 
		input asc5_rstn_i, 
		input asc6_rstn_i, 
		input asc7_rstn_i, 
		input vm0_crc_i,
		input vm1_crc_i,
		input vm2_crc_i,
		input vm3_crc_i,
		input vm4_crc_i,
		input vm5_crc_i,
		input vm6_crc_i,
		input vm7_crc_i,
		input ext_rstn_i,	          // this signal may not be in final release
		input db_busy_i,
		
		output wire sys_clk_o,
		output wire pll_clk_o,
		output wire pll_hsclk_o,
		output wire pld_clk_o,
		output wire lb_clk_o,
		output wire lb_clk_enable,   // removed lb_clk_dly_o, added lb_clk_enable, per version 1.3
		output reg  rstn_o,
		output wire vm0_crc_rstn_o,
		output wire vm1_crc_rstn_o,
		output wire vm2_crc_rstn_o,
		output wire vm3_crc_rstn_o,
		output wire vm4_crc_rstn_o,
		output wire vm5_crc_rstn_o,
		output wire vm6_crc_rstn_o,
		output wire vm7_crc_rstn_o,      
		output reg lb_rstn_o,
		output wire wb_comp_rstn_o
		
		);

parameter LATTICE_FAMILY = "LPTM2";
parameter CLKRST_ASC_MANDATORY = 7'b0000000; 
parameter CLKRST_PLL_INCLUDED  = 1'b0; 
parameter CLKRST_PLL_FREQ = 50; 
parameter CLKRST_HSPLL_FREQ = 200;
parameter CLKRST_FPGA = 1'b0;



//----------------------------------------------------
// internal signals
//----------------------------------------------------
reg[6:0] pld_clk_cnt;
reg  lb_clk_ena;
reg  lb_clk_edge_0, lb_clk_edge_1;
wire pll_clk_int, pll_hsclk_int;
wire lb_clk_itr;
wire pll_lockn;      
wire [7:1] crc_err;

		
//----------------------------------------------------
// clock generation
//----------------------------------------------------

// system clock generation
assign sys_clk_o = clk_i;
assign pll_hsclk_o = CLKRST_PLL_INCLUDED  ? ( CLKRST_FPGA ?  pll_hsclk_int : pll_clk_int) : clk_i;


// clock generation: pld clock (250kHz), lb clock (62.5kHz) from 8MHz clock
always @(posedge clk_i, negedge rstn_o)
	  if (~rstn_o) 
	   	pld_clk_cnt <= 7'd0;
	  else 
	   	pld_clk_cnt <= pld_clk_cnt + 1;

assign pld_clk_o = pld_clk_cnt[4];				// 259kHz clock
assign lb_clk_itr = pld_clk_cnt[6];       // 62.5kHz clock

//detect rising edge of lb_clk_itr to generate 125 ns enable pulse (1 / 8 MHz)
//every 16 us (1/62.5 kHz)
always @(posedge clk_i,  negedge rstn_o)   
begin
    if (~rstn_o)  
    begin
		  lb_clk_edge_0 <= 1'b0;
		  lb_clk_edge_1 <= 1'b0;
		  lb_clk_ena    <= 1'b0;
    	end
		else
    begin
    	lb_clk_edge_0 <= lb_clk_itr;
			lb_clk_edge_1 <= lb_clk_edge_0;
			lb_clk_ena    <= !lb_clk_edge_1 && lb_clk_edge_0;
  	end
end 	  

// assign 62.5kHz clock to lb_clk_o; lb_clk_ena to port
assign lb_clk_o = lb_clk_itr;
assign lb_clk_enable = lb_clk_ena;

	
	
// PLL clock generation	   	 
generate                           	   	
	if(CLKRST_PLL_INCLUDED == 1) begin
			pmi_pll
 				#(.pmi_freq_clki(8),
 				  .pmi_freq_clkfb(CLKRST_PLL_FREQ),
 				  .pmi_freq_clkop(CLKRST_PLL_FREQ),
 				  .pmi_freq_clkos(CLKRST_HSPLL_FREQ),
 				  .pmi_freq_clkok(),
 				  .pmi_family(LATTICE_FAMILY),
 				  .pmi_phase_adj(0),
 				  .pmi_duty_cycle(50),
 				  .pmi_clkfb_source("INTERNAL"),
 				  .pmi_fdel("off"),     // ECP2 Only
 				  .pmi_fdel_val(0),
 				  .module_type("pmi_pll")
 				  ) 
 				pll_inst
 				 (.CLKI(clk_i),
 				  .CLKFB(),
 				  .RESET(1'b0),					// PLL will not be reset
 				  .CLKOP(pll_clk_int),
 				  .CLKOS(pll_hsclk_int),
 				  .CLKOK(),
 				  .CLKOK2(),
 				  .LOCK(pll_lockn) 
 				  );
 		end
endgenerate

assign pll_clk_o = CLKRST_PLL_INCLUDED ? pll_clk_int : clk_i;



//----------------------------------------------------
// reset generation
//----------------------------------------------------

// global reset generation (for ASCVM0, ASCVMx, and Fan Controller)
// all mandatory asc reset signals are externally tied to ASC0 reset
reg rstn_ff1;
wire rstn_int;
assign rstn_int = asc0_rstn_i & ext_rstn_i;
always @(posedge clk_i, negedge rstn_int)
	if (~rstn_int) begin
		rstn_ff1 <= 1'b0;
		rstn_o <= 1'b0; end
	else begin
		rstn_ff1 <= 1'b1;
		rstn_o <= rstn_ff1; end

// vm0_crc_rstn_o and vmx_crc_rstn_o generation
//
// these signals are used to reset the RDAT output registers to LogiBuilder and 3WI error counters in ASCVM0 and ASCVMx
// If ASCx is Mandatory 
//            => !(crc_mandatory OR vm0_crc_i) will reset the RDAT output registers to LogiBuilder and 3WI error counters
// If ASCx is Optional 
//            => ascx_rstn_i AND !(vmx_crc_i OR vm0_crc_i) will reset the RDAT output registers to LogiBuilder and 3WI error counters

assign crc_err = {vm7_crc_i, vm6_crc_i, vm5_crc_i, vm4_crc_i, vm3_crc_i, vm2_crc_i, vm1_crc_i};
wire[7:0] vm_crc_rstn; 	
reg [7:0] vm_crc_rstn_ff1;
reg [7:0] vm_crc_rstn_ff2;

wire crc_mandatory;
assign crc_mandatory = (crc_err[1] & CLKRST_ASC_MANDATORY[0]) 
											|(crc_err[2] & CLKRST_ASC_MANDATORY[1])
											|(crc_err[3] & CLKRST_ASC_MANDATORY[2])
											|(crc_err[4] & CLKRST_ASC_MANDATORY[3])
											|(crc_err[5] & CLKRST_ASC_MANDATORY[4])
											|(crc_err[6] & CLKRST_ASC_MANDATORY[5])
											|(crc_err[7] & CLKRST_ASC_MANDATORY[6]);
											
assign vm_crc_rstn[0] = !(crc_mandatory | vm0_crc_i);
assign vm_crc_rstn[1] = CLKRST_ASC_MANDATORY[0] ? !(crc_mandatory | vm0_crc_i) : (!(crc_mandatory | vm0_crc_i | vm1_crc_i) & asc1_rstn_i);
assign vm_crc_rstn[2] = CLKRST_ASC_MANDATORY[1] ? !(crc_mandatory | vm0_crc_i) : (!(crc_mandatory | vm0_crc_i | vm2_crc_i) & asc2_rstn_i);  
assign vm_crc_rstn[3] = CLKRST_ASC_MANDATORY[2] ? !(crc_mandatory | vm0_crc_i) : (!(crc_mandatory | vm0_crc_i | vm3_crc_i) & asc3_rstn_i);  
assign vm_crc_rstn[4] = CLKRST_ASC_MANDATORY[3] ? !(crc_mandatory | vm0_crc_i) : (!(crc_mandatory | vm0_crc_i | vm4_crc_i) & asc4_rstn_i);  
assign vm_crc_rstn[5] = CLKRST_ASC_MANDATORY[4] ? !(crc_mandatory | vm0_crc_i) : (!(crc_mandatory | vm0_crc_i | vm5_crc_i) & asc5_rstn_i);     
assign vm_crc_rstn[6] = CLKRST_ASC_MANDATORY[5] ? !(crc_mandatory | vm0_crc_i) : (!(crc_mandatory | vm0_crc_i | vm6_crc_i) & asc6_rstn_i);  
assign vm_crc_rstn[7] = CLKRST_ASC_MANDATORY[6] ? !(crc_mandatory | vm0_crc_i) : (!(crc_mandatory | vm0_crc_i | vm7_crc_i) & asc7_rstn_i);  

genvar i;
generate for (i = 0; i < 8; i = i + 1)
begin: vm_rst_gen                           
		always @ (posedge clk_i, negedge vm_crc_rstn[i])             
			if (~vm_crc_rstn[i]) begin
				vm_crc_rstn_ff1[i] <= 1'b0;
				vm_crc_rstn_ff2[i] <= 1'b0; end
			else begin
				vm_crc_rstn_ff1[i] <= 1'b1;
				vm_crc_rstn_ff2[i] <= vm_crc_rstn_ff1[i]; end
end				
endgenerate

assign vm0_crc_rstn_o = vm_crc_rstn_ff2[0];
assign vm1_crc_rstn_o = vm_crc_rstn_ff2[1];
assign vm2_crc_rstn_o = vm_crc_rstn_ff2[2];
assign vm3_crc_rstn_o = vm_crc_rstn_ff2[3];
assign vm4_crc_rstn_o = vm_crc_rstn_ff2[4];
assign vm5_crc_rstn_o = vm_crc_rstn_ff2[5];				
assign vm6_crc_rstn_o = vm_crc_rstn_ff2[6];				
assign vm7_crc_rstn_o = vm_crc_rstn_ff2[7];		

// lb_rstn_o generation
reg lb_rstn_ff1;
wire lb_rstn_int;
assign lb_rstn_int = asc0_rstn_i & !db_busy_i & !crc_mandatory & !vm0_crc_i  & ext_rstn_i;
always @(posedge clk_i, negedge lb_rstn_int)
	if (~lb_rstn_int) begin
		lb_rstn_ff1 <= 1'b0;
		lb_rstn_o <= 1'b0; end
	else begin
		if (lb_clk_ena)
		lb_rstn_ff1 <= 1'b1;
		lb_rstn_o <= lb_rstn_ff1; end

// wb_comp_rstn_o generation   
reg wb_comp_rstn_ff1;
reg wb_comp_rstn_ff2;
wire wb_comp_rstn_int;
assign wb_comp_rstn_int = asc0_rstn_i & ext_rstn_i & pll_lockn;

always @(posedge pll_clk_int, negedge wb_comp_rstn_int)
	if (~wb_comp_rstn_int) begin
		wb_comp_rstn_ff1 <= 1'b0;
		wb_comp_rstn_ff2 <= 1'b0; end
	else begin
		wb_comp_rstn_ff1 <= 1'b1;
		wb_comp_rstn_ff2 <= wb_comp_rstn_ff1; end
		
assign wb_comp_rstn_o = CLKRST_PLL_INCLUDED ? wb_comp_rstn_ff2 : rstn_o; 
 		

endmodule 
                  