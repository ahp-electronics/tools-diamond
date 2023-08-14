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
// Project               : Platform Manager 2
// File                  : RDAT.v
//                       : 
// Description           : RDAT 3WI frames from ASC.
// =============================================================================
//                        REVISION HISTORY
// Version               : 1.0
// Mod. Date             : Jan 2013
// =============================================================================



`ifndef RDAT_V
`define RDAT_V


`include "RDAT_WDAT_DEFINE.v"


module RDAT( 

                output [69:0] asc0_RDAT,
                input [69:0] usp_asc0_o,               

                `ifdef ASCVM_ASC1				
                output [51:0] asc1_RDAT,
                input [51:0] usp_asc1_o,               
				`endif
            
			    `ifdef ASCVM_ASC2
                output [51:0] asc2_RDAT,
                input [51:0] usp_asc2_o,               
				`endif
            
			    `ifdef ASCVM_ASC3
                output [51:0] asc3_RDAT,
                input [51:0] usp_asc3_o,               
				`endif
            
			    `ifdef ASCVM_ASC4
                output [51:0] asc4_RDAT,
                input [51:0] usp_asc4_o,               
				`endif
            
			    `ifdef ASCVM_ASC5
                output [51:0] asc5_RDAT,
                input [51:0] usp_asc5_o,               
				`endif
                      
			    `ifdef ASCVM_ASC6
                output [51:0] asc6_RDAT,
                input [51:0] usp_asc6_o,               
				`endif
            
			    `ifdef ASCVM_ASC7
                output [51:0] asc7_RDAT,
                input [51:0] usp_asc7_o,               
				`endif
            
            input         clk_3wi
          );
          
          
          
wire [69:0] RDATx[0:7];//still from asc0 to asc7
wire [69:0] usp_ascx_o [0:7];//from asc0 to asc7          
          
assign asc0_RDAT = RDATx[0][51:0];
assign usp_ascx_o[0][51:0] = usp_asc0_o[51:0];

`ifdef ASCVM_ASC1				
assign asc1_RDAT = RDATx[1][51:0];
assign usp_ascx_o[1][51:0] = usp_asc1_o[51:0];
`endif	
	
`ifdef ASCVM_ASC2
assign asc2_RDAT = RDATx[2][51:0];
assign usp_ascx_o[2][51:0] = usp_asc2_o[51:0];
`endif

`ifdef ASCVM_ASC3
assign asc3_RDAT = RDATx[3][51:0];
assign usp_ascx_o[3][51:0] = usp_asc3_o[51:0];
`endif

`ifdef ASCVM_ASC4
assign asc4_RDAT = RDATx[4][51:0];
assign usp_ascx_o[4][51:0] = usp_asc4_o[51:0];
`endif

`ifdef ASCVM_ASC5
assign asc5_RDAT = RDATx[5][51:0];
assign usp_ascx_o[5][51:0] = usp_asc5_o[51:0];
`endif
	
`ifdef ASCVM_ASC6
assign asc6_RDAT = RDATx[6][51:0];
assign usp_ascx_o[6][51:0] = usp_asc6_o[51:0];
`endif

`ifdef ASCVM_ASC7
assign asc7_RDAT = RDATx[7][51:0];
assign usp_ascx_o[7][51:0] = usp_asc7_o[51:0];
`endif



generate
    genvar i;    
    
    for(i = 0; i < `ASCVM_ASC_COUNT; i = i +1)
    begin    
        RDAT_SUB RDAT_SUBx(
                                .RDATX(RDATx[i]), 
                                .clk_3wi(clk_3wi),
                                .usp_ascx_o(usp_ascx_o[i])
                          );
    end          
endgenerate 

  
  
  
endmodule



module RDAT_SUB(
                  output reg [69:0] RDATX,
                  input clk_3wi,
                  input [69:0] usp_ascx_o
                );
  
always @ (posedge clk_3wi)  
begin       
    RDATX <= usp_ascx_o;    
end             
                
endmodule

`endif