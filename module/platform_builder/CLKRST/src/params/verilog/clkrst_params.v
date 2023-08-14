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
// File                  : clkrst_params.v                                              
// Title                 : Clock/Resetcore parameter file                                        
// Dependencies          :                                                       
//                       :                                                         
// Description           : The clock/reset distribution block                               
// =============================================================================   
//                        REVISION HISTORY                                         
// Version               : 0.1                                                     
// Changes Made          : Initial Release                                         
// Author(s)             : CMUI                                                    
// Mod. Date             : Jan, 2012                                               
// =============================================================================   

// Revision History:                                     
// $Log: ecp5PLUSasc#clkrst_ip#design#params#clkrst_params.v,v $
// Revision 1.2  2015-03-16 10:36:42-07  cmui
// Update the PLL default setting
//
// Revision 1.1  2015-02-23 15:43:22-08  cmui
// Initial version
//   

parameter LATTICE_FAMILY = "ECP5UM";
parameter CLKRST_ASC_MANDATORY = 7'b0000000;
parameter CLKRST_PLL_INCLUDED = 1'b0;
parameter CLKRST_PLL_FREQ = 8;	
parameter CLKRST_HSPLL_FREQ = 24;
parameter CLKRST_FPGA = 1'b0;



