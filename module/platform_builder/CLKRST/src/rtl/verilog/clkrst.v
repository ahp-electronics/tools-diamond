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
// File                  : clkrst.v                                              
// Title                 : Top-level wrapper of Clock/Reset IP design                                        
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
// Changes Made          : Add two 62.5kHz outputs
// Mod. Date             : May, 2013        
// ============================================================================= 

// Revision History:                                    
// $Log: ecp5PLUSasc#clkrst_ip#design#rtl#clkrst.v,v $
// Revision 1.2  2015-06-22 14:20:58-07  cmui
// Updated the ports:
// - remove lb_clk_dly_o output
// - add lb_clk_enable output
//
// Revision 1.1  2015-02-23 15:43:18-08  cmui
// Initial version
//

module clkrst
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
		input ext_rstn_i,
		input db_busy_i,

		output sys_clk_o,
		output pll_clk_o,
		output pll_hsclk_o,
		output pld_clk_o,
		output lb_clk_o,
		output lb_clk_enable,
		output rstn_o,
		output vm0_crc_rstn_o,
		output vm1_crc_rstn_o,
		output vm2_crc_rstn_o,
		output vm3_crc_rstn_o,
		output vm4_crc_rstn_o,
		output vm5_crc_rstn_o,
		output vm6_crc_rstn_o,
		output vm7_crc_rstn_o,      
		output lb_rstn_o,
		output wb_comp_rstn_o
		
		);
		
`include "../../params/verilog/clkrst_params.v"

clkrst_core #
			(
			.LATTICE_FAMILY(LATTICE_FAMILY),
			.CLKRST_ASC_MANDATORY(CLKRST_ASC_MANDATORY), 	
      .CLKRST_PLL_INCLUDED(CLKRST_PLL_INCLUDED), 
      .CLKRST_PLL_FREQ(CLKRST_PLL_FREQ),
      .CLKRST_HSPLL_FREQ(CLKRST_HSPLL_FREQ),
			.CLKRST_FPGA(CLKRST_FPGA)
      )
      top_unit
      (
      .clk_i(clk_i),                           
      .asc0_rstn_i(asc0_rstn_i),                 
      .asc1_rstn_i(asc1_rstn_i),                 
      .asc2_rstn_i(asc2_rstn_i),                 
      .asc3_rstn_i(asc3_rstn_i),                 
      .asc4_rstn_i(asc4_rstn_i),                 
      .asc5_rstn_i(asc5_rstn_i),                 
      .asc6_rstn_i(asc6_rstn_i),                 
      .asc7_rstn_i(asc7_rstn_i),                 
      .vm0_crc_i(vm0_crc_i),                   
      .vm1_crc_i(vm1_crc_i),                   
      .vm2_crc_i(vm2_crc_i),                   
      .vm3_crc_i(vm3_crc_i),                   
      .vm4_crc_i(vm4_crc_i),                   
      .vm5_crc_i(vm5_crc_i),                   
      .vm6_crc_i(vm6_crc_i),                   
      .vm7_crc_i(vm7_crc_i),                   
      .ext_rstn_i(ext_rstn_i),                  
      .db_busy_i(db_busy_i),                   
                                         
      .sys_clk_o(sys_clk_o),             
      .pll_clk_o(pll_clk_o),   
      .pll_hsclk_o(pll_hsclk_o),          
      .pld_clk_o(pld_clk_o),          
      .lb_clk_o(lb_clk_o),
		  .lb_clk_enable(lb_clk_enable),    
      .rstn_o(rstn_o),                 
      .vm0_crc_rstn_o(vm0_crc_rstn_o),        
      .vm1_crc_rstn_o(vm1_crc_rstn_o),        
      .vm2_crc_rstn_o(vm2_crc_rstn_o),        
      .vm3_crc_rstn_o(vm3_crc_rstn_o),        
      .vm4_crc_rstn_o(vm4_crc_rstn_o),        
      .vm5_crc_rstn_o(vm5_crc_rstn_o),        
      .vm6_crc_rstn_o(vm6_crc_rstn_o),        
      .vm7_crc_rstn_o(vm7_crc_rstn_o),        
      .lb_rstn_o(lb_rstn_o),              
      .wb_comp_rstn_o(wb_comp_rstn_o)
      );

endmodule      
        