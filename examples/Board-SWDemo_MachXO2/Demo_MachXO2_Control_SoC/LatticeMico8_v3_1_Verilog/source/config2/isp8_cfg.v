//=============================================================================
//                          COPYRIGHT NOTICE
//Copyright 2000-2006 (c) Lattice Semiconductor Corporation
//ALL RIGHTS RESERVED
//This confidential and proprietary software may be used only as authorised
//by a licensing agreement from Lattice Semiconductor Corporation.
//The entire notice above must be reproduced on all authorized copies and
//copies may only be made to the extent permitted by a licensing agreement
//from Lattice Semiconductor Corporation.
//
//Lattice Semiconductor Corporation    TEL : 1-800-Lattice (USA and Canada)
//5555 NE Moore Court                        408-826-6000 (other locations)
//Hillsboro, OR 97124                  web  : http:--www.latticesemi.com/
//U.S.A                                email: techsupport@latticesemi.com
//=============================================================================
//                        FILE DETAILS
//Project          : isp8
//File             : config2/isp8_cfg.v
//Title            :
//Dependencies     : 
//Description      : This module contains synthesis configuration information
//                 : for the Verilog version of the Mico8.    
//=============================================================================
//                       REVISION HISTORY
// $Revision: 1.1 $
//
//=============================================================================


module isp8 
           ( //clock and reset
            clk           ,
            rst_n         ,
          // User Inputs   ,
            ext_mem_ready ,
            ext_io_din    ,
            intr          ,
          // User Outputs   ,
            ext_addr      ,
            ext_io_dout   ,
            ext_io_wr     ,
            ext_io_rd     ,
            intr_ack      
            );
 input              clk   ;
 input              rst_n ;
 input              ext_mem_ready ;
 input [7:0]        ext_io_din ;  
 input              intr ;  
 
 output [7:0]       ext_addr     ;
 output [7:0]       ext_io_dout  ;
 output             ext_io_wr    ;
 output             ext_io_rd    ;
 output             intr_ack     ;
 
wire [7:0]          ext_addr_int ;
wire [7:0]          ext_dout     ;
wire [7:0]          ext_mem_dout ;
wire [7:0]          ext_mem_din  ;
wire                ext_mem_wr   ;
wire                ext_mem_rd   ;
 
assign   ext_addr     = ext_addr_int;
assign   ext_io_dout  = ext_dout;
assign   ext_mem_dout = ext_dout;

  isp8_core # (
               "XO",           
               "prom_init.hex",
               8,              
               8,              
               9,              
               512,
               0,
               4,
               16            
               ) u1_isp8
              ( 
                 .clk           ( clk           ),       
                 .rst_n         ( rst_n         ),
                 .ext_mem_din   ( ext_mem_din   ),
                 .ext_io_din    ( ext_io_din    ),
                 .ext_mem_ready ( ext_mem_ready ),
                 .intr          ( intr          ),
                 .ext_addr      ( ext_addr_int  ),
                 .ext_addr_cyc  (               ),
                 .ext_dout      ( ext_dout      ),
                 .ext_mem_wr    ( ext_mem_wr    ),
                 .ext_mem_rd    ( ext_mem_rd    ),
                 .ext_io_wr     ( ext_io_wr     ),
                 .ext_io_rd     ( ext_io_rd     ),
                 .intr_ack      ( intr_ack      )
                 );
                  
 pmi_distributed_spram # (
                   32,                     
                   5,                      
                   8,                      
                   "noreg",                
                   "none",                 
                   "binary",
                   "XO",                
                   "pmi_distributed_spram"
                   ) U2_scratchpad
                  (
                  .Address( ext_addr_int[4:0]),
                  .Data   ( ext_mem_dout),
                  .Clock  ( clk         ),
                  .ClockEn( 1'b1        ),
                  .WE     ( ext_mem_wr  ),
                  .Reset  ( 1'b0        ),
                  .Q      ( ext_mem_din )
                  ) ;
endmodule
 
