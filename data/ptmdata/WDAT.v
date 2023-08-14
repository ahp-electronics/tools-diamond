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
// File                  : WDAT.v
//                       : 
// Description           : WDAT 3WI frames to ASC.
// =============================================================================
//                        REVISION HISTORY
// Version               : 1.0
// Mod. Date             : Jan 2013
// =============================================================================


`include "RDAT_WDAT_DEFINE.v"



module WDAT( 

                output wire [76:0] usp_asc0_i,
                input [76:0] asc0_WDAT,                 
            
			    `ifdef ASCVM_ASC1
                output wire [50:0] usp_asc1_i,
                input [50:0] asc1_WDAT,
				`endif
            
			    `ifdef ASCVM_ASC2
                output wire [50:0] usp_asc2_i,
                input [50:0] asc2_WDAT,
				`endif
            
			    `ifdef ASCVM_ASC3
                output wire [50:0] usp_asc3_i,
                input [50:0] asc3_WDAT,
				`endif
            
			    `ifdef ASCVM_ASC4
                output wire [50:0] usp_asc4_i,
                input [50:0] asc4_WDAT,
				`endif
            
			    `ifdef ASCVM_ASC5
                output wire [50:0] usp_asc5_i,
                input [50:0] asc5_WDAT,
				`endif
            
			    `ifdef ASCVM_ASC6
                output wire [50:0] usp_asc6_i,
                input [50:0] asc6_WDAT,
				`endif
            
			    `ifdef ASCVM_ASC7
                output wire [50:0] usp_asc7_i, 
                input [50:0] asc7_WDAT,
				`endif
            
            input         clk_3wi
          );


wire [76:0] WDATx[0:7];//still from asc0 to asc7
wire [76:0] usp_ascx_i [0:7];//from asc0 to asc7



assign WDATx[0][50:0] = asc0_WDAT;
assign usp_asc0_i[50:0] = usp_ascx_i[0][50:0];
	
`ifdef ASCVM_ASC1
assign WDATx[1][50:0] = asc1_WDAT;
assign usp_asc1_i[50:0] = usp_ascx_i[1][50:0];
`endif

`ifdef ASCVM_ASC2
assign WDATx[2][50:0] = asc2_WDAT;
assign usp_asc2_i[50:0] = usp_ascx_i[2][50:0];
`endif
	
`ifdef ASCVM_ASC3
assign WDATx[3][50:0] = asc3_WDAT;
assign usp_asc3_i[50:0] = usp_ascx_i[3][50:0];
`endif
	
`ifdef ASCVM_ASC4
assign WDATx[4][50:0] = asc4_WDAT;
assign usp_asc4_i[50:0] = usp_ascx_i[4][50:0];
`endif
	
`ifdef ASCVM_ASC5
assign WDATx[5][50:0] = asc5_WDAT;
assign usp_asc5_i[50:0] = usp_ascx_i[5][50:0]; 
`endif
	
`ifdef ASCVM_ASC6
assign WDATx[6][50:0] = asc6_WDAT;
assign usp_asc6_i[50:0] = usp_ascx_i[6][50:0];
`endif
	
`ifdef ASCVM_ASC7
assign WDATx[7][50:0] = asc7_WDAT;
assign usp_asc7_i[50:0] = usp_ascx_i[7][50:0];
`endif


                    
generate
    genvar i;    
    
    for(i = 0; i < `ASCVM_ASC_COUNT; i = i +1)
    begin    
        WDAT_SUB WDAT_SUBx(
                            .usp_ascx_i(usp_ascx_i[i]),
                            .clk_3wi(clk_3wi), 
                            .WDATx(WDATx[i])  
                          );
    end          
endgenerate 

endmodule

module WDAT_SUB(
                  output reg [76:0] usp_ascx_i,
                  input         clk_3wi, 
                  input [76:0]  WDATx  
                );

  
always @ (posedge clk_3wi)  
begin       
    usp_ascx_i <= WDATx;    
end             
                
endmodule
