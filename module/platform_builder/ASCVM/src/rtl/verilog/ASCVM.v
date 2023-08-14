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
// File                  : ASCVM.v
// Title                 : Analog Sense and Control Virtual Machine
// Dependencies          : Needs ASCVM_PARAMS.v and ASCVM_DATAPATH.v.
//                       : 
// Description           : Interface between the ASC and Logibuilder.
//                       : RDAT 3WI frames from ASC are buffered, CRC checked and 
//                       : pad bit checked. Good packets (no CRC or pad bit errors)
//                       : are forwarded to Logibuilder. Data from Logibuilder
//                       : interface becomes payload in WDAT frame and is forwarded
//                       : to ASC.  Other functions: CRC error counting,
//                       : 3WI error counting, WDAT NACK generation, RDAT NACK check,
//                       : and Logibuilder clock (250 KHz) generation.
//                       : Interfaces with between 1 and 8 ASC's.
// =============================================================================
//                        REVISION HISTORY
// Version               : 0.4
// Changes Made          : 0.2: Revised I/O, simplified structure, revised reset.
//                       : 0.3: Fixed width of usp_ascx_o (x:1-7).  
//                       : 0.4: Converted RAM address/WE selections from case
//                       :      statements to simpler if/then/else .
// Author(s)             : Dan Sides
// Mod. Date             : Sept 2012
// =============================================================================


`include "../../params/verilog/ASCVM_PARAMS.v"

module ASCVM (
input       clk_3wi, resetn,
//rst_usp_ascx_o will reset the logibuilder outputs 
//and 3WI error counters.
input       rst_usp_asc0_o,rst_usp_asc1_o,
input       rst_usp_asc2_o,rst_usp_asc3_o,
input       rst_usp_asc4_o,rst_usp_asc5_o,
input       rst_usp_asc6_o,rst_usp_asc7_o,
input       clk_lgbldr,
input       rdat_0, 
output      wdat_0,
output      wrclk_0,
input       [76:0] usp_asc0_i,
output      [69:0] usp_asc0_o,
output      usp_asc0_3wierr,
output wire crb_asc0_crcerr,
input       usp_asc0_3wierrrst, //asserted low.
//Optional I/O
//Everything below this line will be synthesized away
//if the corresponding ASC is not included.
//-------------------------------------------
input       rdat_1, 
output      wdat_1,
output      wrclk_1,
input       [50:0] usp_asc1_i,
output      [51:0] usp_asc1_o,
output      usp_asc1_3wierr,
output      crb_asc1_crcerr,
input       usp_asc1_3wierrrst, //asserted low.
input       rdat_2, 
output      wdat_2,
output      wrclk_2,
input       [50:0] usp_asc2_i,
output      [51:0] usp_asc2_o,
output      usp_asc2_3wierr,
output      crb_asc2_crcerr,
input       usp_asc2_3wierrrst, //asserted low.
input       rdat_3, 
output      wdat_3,
output      wrclk_3,
input       [50:0] usp_asc3_i,
output      [51:0] usp_asc3_o,
output      usp_asc3_3wierr,
output      crb_asc3_crcerr,
input       usp_asc3_3wierrrst, //asserted low.
input       rdat_4, 
output      wdat_4,
output      wrclk_4,
input       [50:0] usp_asc4_i,
output      [51:0] usp_asc4_o,
output      usp_asc4_3wierr,
output wire crb_asc4_crcerr,
input       usp_asc4_3wierrrst, //asserted low.
input       rdat_5, 
output      wdat_5,
output      wrclk_5,
input       [50:0] usp_asc5_i,
output      [51:0] usp_asc5_o,
output      usp_asc5_3wierr,
output wire crb_asc5_crcerr,
input       usp_asc5_3wierrrst, //asserted low.
input       rdat_6, 
output      wdat_6,
output      wrclk_6,
input       [50:0] usp_asc6_i,
output      [51:0] usp_asc6_o,
output      usp_asc6_3wierr,
output wire crb_asc6_crcerr,
input       usp_asc6_3wierrrst, //asserted low.
input       rdat_7, 
output      wdat_7,
output      wrclk_7,
input       [50:0] usp_asc7_i,
output      [51:0] usp_asc7_o,
output      usp_asc7_3wierr,
output wire crb_asc7_crcerr,
input       usp_asc7_3wierrrst, //asserted low.
//Fault Logger interface(s)
//These signals and their associated logic will be synthesized away
//if the Fault Logger or the ASC is not present.
output      [15:0] fl_asc0_data,
output             fl_asc0_valid,
output      [15:0] fl_asc1_data,
output             fl_asc1_valid,
output      [15:0] fl_asc2_data,
output             fl_asc2_valid,
output      [15:0] fl_asc3_data,
output             fl_asc3_valid,
output      [15:0] fl_asc4_data,
output             fl_asc4_valid,
output      [15:0] fl_asc5_data,
output             fl_asc5_valid,
output      [15:0] fl_asc6_data,
output             fl_asc6_valid,
output      [15:0] fl_asc7_data,
output             fl_asc7_valid
);

`ifdef ASCVM_CRC_ERR_CNT_LMT 
  parameter [5:0] ASCVM_CRC_ERR_CNT_LMT_PARAM = `ASCVM_CRC_ERR_CNT_LMT; 
`else 
  parameter [5:0] ASCVM_CRC_ERR_CNT_LMT_PARAM = 6'h4; 
`endif 

`ifdef ASCVM_TWI_ERR_CNT_LMT
   parameter [5:0] ASCVM_TWI_ERR_CNT_LMT_PARAM = `ASCVM_TWI_ERR_CNT_LMT;
`else 
  parameter [5:0] ASCVM_TWI_ERR_CNT_LMT_PARAM = 6'd63; 
`endif   

//These parameters represent the Frame Position Count value
//when certain actions take place.

parameter [6:0] ASCVM_STARTNEXT = 7'd2;
parameter [6:0] ASCVM_RDAT_RAM_WRITE0 = 7'd24;
parameter [6:0] ASCVM_RDAT_RAM_WRITE1 = ASCVM_RDAT_RAM_WRITE0+16;
parameter [6:0] ASCVM_RDAT_RAM_WRITE2 = ASCVM_RDAT_RAM_WRITE1+16;
parameter [6:0] ASCVM_RDAT_RAM_WRITE3 = ASCVM_RDAT_RAM_WRITE2+16;//Not needed for Reno.
parameter [6:0] ASCVM_RDAT_RAM_WRITE4 = ASCVM_RDAT_RAM_WRITE3+16;//Not needed for Reno
parameter [6:0] ASCVM_RDAT_RAM_READ0  = 7'd122;
parameter [6:0] ASCVM_RDAT_RAM_READ1  = ASCVM_RDAT_RAM_READ0+1;
parameter [6:0] ASCVM_RDAT_RAM_READ2  = ASCVM_RDAT_RAM_READ1+1;
parameter [6:0] ASCVM_RDAT_RAM_READ3  = ASCVM_RDAT_RAM_READ2+1;//Not needed for Reno.
parameter [6:0] ASCVM_RDAT_RAM_READ4  = ASCVM_RDAT_RAM_READ3+1;//Not needed for Reno.
//parameter [6:0] ASCVM_LOAD_USP_ASC_OUT0      = ASCVM_RDAT_RAM_WRITE4+1;
parameter [6:0] ASCVM_CRC_CHECK_START        = 7'd7;
parameter [6:0] ASCVM_CRC_CHECK_END          = 7'd79;
parameter [6:0] ASCVM_CRC_CHECK_CLEAR        = ASCVM_CRC_CHECK_START-1;
parameter [6:0] ASCVM_CRC_CHECK_COMPARE      = 7'd120;
parameter [6:0] ASCVM_CRC_COUNTER_INCREMENT  = ASCVM_CRC_CHECK_COMPARE+1;
parameter [6:0] ASCVM_TWI_COUNTER_INCREMENT  = 7'd0;
parameter [6:0] ASCVM_PAD_BIT_CHECK_END      = 7'd111;
parameter [6:0] ASCVM_WDAT_RAM_WRITE0        = 7'd2;        
parameter [6:0] ASCVM_WDAT_RAM_WRITE1        = ASCVM_WDAT_RAM_WRITE0+1;
parameter [6:0] ASCVM_WDAT_RAM_WRITE2        = ASCVM_WDAT_RAM_WRITE1+1;
parameter [6:0] ASCVM_WDAT_RAM_WRITE3        = ASCVM_WDAT_RAM_WRITE2+1;
parameter [6:0] ASCVM_WDAT_RAM_WRITE4        = ASCVM_WDAT_RAM_WRITE3+1;
parameter [6:0] ASCVM_WDAT_RAM_READ0         = 7'd28;
parameter [6:0] ASCVM_WDAT_RAM_READ1         = ASCVM_WDAT_RAM_READ0+16;
parameter [6:0] ASCVM_WDAT_RAM_READ2         = ASCVM_WDAT_RAM_READ1+16;
parameter [6:0] ASCVM_WDAT_RAM_READ3         = ASCVM_WDAT_RAM_READ2+16;
parameter [6:0] ASCVM_WDAT_RAM_READ4         = ASCVM_WDAT_RAM_READ3+16;
//States to determine what each WDAT line should be sending.
parameter [6:0] ASCVM_WDAT_XMIT_PDBT0        = 7'd5;  //start TX of first pad bits
parameter [6:0] ASCVM_WDAT_START_CRC_CALC    = 7'd23;  //Start calculating WDAT CRC.
parameter [6:0] ASCVM_WDAT_XMIT_DATA         = 7'd29;  //start TX of real data
parameter [6:0] ASCVM_WDAT_XMIT_PDBT1_RENO   = 7'd80;  //start TX of second pad bits (reno)
parameter [6:0] ASCVM_WDAT_XMIT_PDBT1_VEGAS  = 7'd106;  //start TX of second pad bits (vegas)
parameter [6:0] ASCVM_WDAT_XMIT_CRC          = 7'd111;
parameter [6:0] ASCVM_WDAT_XMIT_PDBT2        = 7'd119; //start TX of last pad bits
parameter [6:0] ASCVM_WDAT_XMIT_NACK         = 7'd123; //Send the ack/nack.    

// CRC function
// The polynomial is
// x^8         +x^5    +x^3 +x^2 +x^1 +1
// (1)  0   0   1   0   1    1    1    1       = 2F  // Various representations for this as a Hex value
//  1   0   0   1   0   1    1    1   (1)      = 97
parameter [7:0] ASCVM_TWI_CRC_POLY = 8'h2f ;

//Control Signals. 
//Common to all ASC datapaths (both ASC0 and instantiated blocks).
reg        RdatRamWE;
reg [6:0]  FrmPosCnt;     //Frame Position Counter
reg        startBit;
reg        WdatDataShiftRegLoad;
reg [2:0]  RdatRamAddr;
reg [2:0]  WdatRamAddr;
reg        RdatCrcSet, crcChkEn, padBitChkEn;
reg        WdatRamWE;
//These two flops might look like metastability flops,
//but they are actually to detect the first edge of clk_lgblder.
reg        clk_lgbldr_first_edge1,clk_lgbldr_first_edge2;

//Signals for the ASC0 RDAT Data path
reg [15:0]  RdatShftReg0;  //RDAT Shift Register
reg [ 7:0]  RdatCrc0;      //RDAT CRC
reg         RdatBad0;      //RDAT Bad Flag. Set by either
                           //RDAT CRC miscompare or pad bit miscompare.
reg [5:0]   RdatCrcErrCnt0;//Count for contiguous, errored RDAT Packets
                           //Increments for either RDAT CRC8 or pad bit errors.
reg [5:0]   Rdat3WIErrCnt0;//Count for cumulative 3WI errors.                           
reg         firstGoodRDATFrameRcvd0;//Indicates first good frame was rcvd.
reg         firstRdatACKRcvd0; //Indicates that first frame with no nack 
                               //or crc error was rcvd 
wire [15:0] RdatRam0Q;     //Output from rdat data ram.  
reg         crb_asc0_crcerr_clked;                            
                               
//Signals for the ASC0 WDAT Data path
reg  [15:0]  WdatDataMuxOut0;
reg  [15:0]  WdatDataShiftReg0;
reg          WdatBitStreamMux0; //Muxes the wdat serial stream (3/out START bit)
reg          WdatDataOut_0; //neg edge wdat serial stream (w/out START bit)
reg  [ 7:0]  WdatCrc0;      //WDAT CRC
reg  [3:0]   WdatNack0;     //Holds 4 bit Nack response.
wire [15:0]  WdatRam0Q;     //Output from wdat data ram.    

//Input wires for ASC Datapaths.                           
wire [7:0] rdat_tmp              ={rdat_7, rdat_6, rdat_5, rdat_4,                            
                                   rdat_3, rdat_2, rdat_1, rdat_0};
wire [7:0] usp_asc_3wierrrst_tmp ={usp_asc7_3wierrrst,usp_asc6_3wierrrst,
                                   usp_asc5_3wierrrst,usp_asc4_3wierrrst,
                                   usp_asc3_3wierrrst,usp_asc2_3wierrrst,                                   
                                   usp_asc1_3wierrrst,usp_asc0_3wierrrst};  
wire [7:0] rst_usp_ascx_o_tmp    ={rst_usp_asc7_o,rst_usp_asc6_o,rst_usp_asc5_o,
                                   rst_usp_asc4_o,rst_usp_asc3_o,rst_usp_asc2_o,
                                   rst_usp_asc1_o,rst_usp_asc0_o}; 
                                                                                                    
wire [76:0] usp_asc_i_tmp [7:0] ;
assign usp_asc_i_tmp[7]=usp_asc7_i[50:0];
assign usp_asc_i_tmp[6]=usp_asc6_i[50:0];
assign usp_asc_i_tmp[5]=usp_asc5_i[50:0];
assign usp_asc_i_tmp[4]=usp_asc4_i[50:0];
assign usp_asc_i_tmp[3]=usp_asc3_i[50:0];
assign usp_asc_i_tmp[2]=usp_asc2_i[50:0];
assign usp_asc_i_tmp[1]=usp_asc1_i[50:0];
assign usp_asc_i_tmp[0]=usp_asc0_i[76:0]; 

//Temporary wires from ASC datpaths.
wire [7:0]  wdat_tmp;
wire [7:0]  wrclk_tmp;
wire [7:0]  usp_asc_3wierr_tmp;
wire [7:0]  usp_asc_crcerr_tmp;
wire [69:0] usp_asc_o_tmp [7:0];
wire [15:0] fl_asc_data_tmp  [7:0];
wire [7:0]  fl_asc_valid_tmp;

//Reno pad bit checking starts earlier than vegas.
//3WI protocol requires pad bit oscillation checking
//on 3wi frames starting at bit 80, but when asc0 is a 
//reno (asc1012), we can start checking earlier
//(bit 62) for enhanced PBO checking.
//For simplicity, we use the same pbo checking signal
//(padbitChkEn) for both ASC0 and ASC1-7.  So that means
//that asc0 is vegas, we meet the 3WI requirement for 
//PBO checking (starting at bit 80), but if asc0 is reno,
//then we can (and do) start checking earlier (bit 62)for enhanced
//PBO coverage.  Note that the bits between 62-80 are always covered
//by CRC8 for both reno and vegas.
`ifndef ASCVM_ASC0_ASC1012
    parameter [6:0] ASCVM_PAD_BIT_CHECK_START    = 7'd79;
`else
    parameter [6:0] ASCVM_PAD_BIT_CHECK_START    = 7'd61;
`endif

//Reno starts pad bit fill sooner than Vegas.
`ifdef ASCVM_ASC0_ASC1012 
    parameter [6:0] ASCVM_WDAT_XMIT_PDBT1_ASC0        = 7'd80;  //start TX of second pad bits (reno)
`else
    parameter [6:0] ASCVM_WDAT_XMIT_PDBT1_ASC0        = 7'd106; //start TX of second pad bits (vegas)
`endif 

`ifdef ASCVM_ASC0_ASC1012
  parameter  ASCVM_ASC0_ASC1012_PARAM =1'b1;  
`else
  parameter  ASCVM_ASC0_ASC1012_PARAM =1'b0;
`endif
                
//These are the ASCVM datapath blocks..
//For each ASC beyond ASC0, there will be one
//ASC datapath block instantiated.
//e.g. If there are 5 ASC's connected to an XO2,
//this will be instantiated 4 times.
//(ASC0 is different enough, and it is always present,
//so it is included as part of the ASCVM mothership.)
//Note that this ASCVM module only accomodates Reno
//for the time being since ASC1-7 will only be Renos)

`ifdef ASCVM_ASC_COUNT
  parameter ASCVM_ASC_CNT_PARAM = `ASCVM_ASC_COUNT;
  parameter ASCVM_ASC_LOOP_CNT=`ASCVM_ASC_COUNT-1;
`endif

generate
  genvar I;
  for (I=0;I<=ASCVM_ASC_LOOP_CNT;I=I+1)
    begin: ASC_DP
        ASCVM_DATAPATH 
          #(.ASCVM_WHOAMI(I), //Identifies which ASC a datapath is for(0-7).
            .ASCVM_ASC0_ASC1012_PARAM(ASCVM_ASC0_ASC1012_PARAM),
            .ASCVM_CRC_ERR_CNT_LMT_PARAM(ASCVM_CRC_ERR_CNT_LMT_PARAM),
            .ASCVM_TWI_ERR_CNT_LMT_PARAM(ASCVM_TWI_ERR_CNT_LMT_PARAM),
            .ASCVM_RDAT_RAM_WRITE1    (ASCVM_RDAT_RAM_WRITE1  ),
            .ASCVM_RDAT_RAM_WRITE2    (ASCVM_RDAT_RAM_WRITE2  ),
            .ASCVM_RDAT_RAM_WRITE3    (ASCVM_RDAT_RAM_WRITE3  ),
            .ASCVM_RDAT_RAM_WRITE4    (ASCVM_RDAT_RAM_WRITE4  ),
            .ASCVM_RDAT_RAM_READ0     (ASCVM_RDAT_RAM_READ0   ),   
            .ASCVM_RDAT_RAM_READ1     (ASCVM_RDAT_RAM_READ1   ), 
            .ASCVM_RDAT_RAM_READ2     (ASCVM_RDAT_RAM_READ2   ), 
            .ASCVM_RDAT_RAM_READ3     (ASCVM_RDAT_RAM_READ3   ), 
            .ASCVM_RDAT_RAM_READ4     (ASCVM_RDAT_RAM_READ4   ),
            .ASCVM_CRC_CHECK_START    (ASCVM_CRC_CHECK_START  ),
            .ASCVM_CRC_CHECK_CLEAR    (ASCVM_CRC_CHECK_CLEAR  ),
            .ASCVM_CRC_CHECK_COMPARE  (ASCVM_CRC_CHECK_COMPARE),
            .ASCVM_CRC_COUNTER_INCREMENT(ASCVM_CRC_COUNTER_INCREMENT),
            .ASCVM_TWI_COUNTER_INCREMENT(ASCVM_TWI_COUNTER_INCREMENT),
            .ASCVM_WDAT_RAM_WRITE0            (ASCVM_WDAT_RAM_WRITE0            ),
            .ASCVM_WDAT_RAM_WRITE1            (ASCVM_WDAT_RAM_WRITE1            ),
            .ASCVM_WDAT_RAM_WRITE2            (ASCVM_WDAT_RAM_WRITE2            ),
            .ASCVM_WDAT_RAM_WRITE3            (ASCVM_WDAT_RAM_WRITE3            ),
            .ASCVM_WDAT_RAM_WRITE4            (ASCVM_WDAT_RAM_WRITE4            ),         
            .ASCVM_WDAT_RAM_READ0             (ASCVM_WDAT_RAM_READ0             ),
            .ASCVM_WDAT_RAM_READ1             (ASCVM_WDAT_RAM_READ1             ),
            .ASCVM_WDAT_RAM_READ2             (ASCVM_WDAT_RAM_READ2             ),
            .ASCVM_WDAT_RAM_READ3             (ASCVM_WDAT_RAM_READ3             ),
            .ASCVM_WDAT_RAM_READ4             (ASCVM_WDAT_RAM_READ4             ),             
            .ASCVM_WDAT_XMIT_PDBT0            (ASCVM_WDAT_XMIT_PDBT0            ),
            .ASCVM_WDAT_START_CRC_CALC        (ASCVM_WDAT_START_CRC_CALC        ),
            .ASCVM_WDAT_XMIT_DATA             (ASCVM_WDAT_XMIT_DATA             ),
            .ASCVM_WDAT_XMIT_PDBT1_RENO       (ASCVM_WDAT_XMIT_PDBT1_RENO       ),
            .ASCVM_WDAT_XMIT_PDBT1_VEGAS      (ASCVM_WDAT_XMIT_PDBT1_VEGAS      ),            
            .ASCVM_WDAT_XMIT_CRC              (ASCVM_WDAT_XMIT_CRC              ),
            .ASCVM_WDAT_XMIT_PDBT2            (ASCVM_WDAT_XMIT_PDBT2            ),
            .ASCVM_WDAT_XMIT_NACK             (ASCVM_WDAT_XMIT_NACK             ),
            .ASCVM_TWI_CRC_POLY               (ASCVM_TWI_CRC_POLY               )
            )
            
        DATAPATH1
         (.clk_3wi(clk_3wi),.reset(resetn),
          //Top level inputs.
          .rst_usp_asc_o(rst_usp_ascx_o_tmp[I]),
          .rdat(rdat_tmp[I]), .usp_asc_i(usp_asc_i_tmp[I]), .usp_asc_3wierrrst(usp_asc_3wierrrst_tmp[I]),
           //Control signals from the ASCVM mothership.
          .FrmPosCnt(FrmPosCnt), .RdatRamWE(RdatRamWE),.RdatRamAddr(RdatRamAddr),
          .crcChkEn(crcChkEn),.RdatCrcSet(RdatCrcSet), .padBitChkEn(padBitChkEn),
          .WdatDataShiftRegLoad(WdatDataShiftRegLoad),
          .startBit(startBit),.WdatRamAddr(WdatRamAddr),.WdatRamWE(WdatRamWE),
          //Outputs
          .usp_asc_o(usp_asc_o_tmp[I]),.wrclk(wrclk_tmp[I]), .wdat(wdat_tmp[I]),
          .usp_asc_3wierr(usp_asc_3wierr_tmp[I]),
          .usp_asc_crcerr(usp_asc_crcerr_tmp[I]),
          .fl_asc_data(fl_asc_data_tmp[I]),
          .fl_asc_valid(fl_asc_valid_tmp[I])
          );
          
        if (I==0)
    	    begin
    	      assign      usp_asc0_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      wrclk_0            =wrclk_tmp[I];
    	      assign      wdat_0             =wdat_tmp[I];
    	      assign      usp_asc0_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      crb_asc0_crcerr    =usp_asc_crcerr_tmp[I];
    	      assign      usp_asc0_o         =usp_asc_o_tmp[I];
    	      assign      fl_asc0_data       =fl_asc_data_tmp[I];
    	      assign      fl_asc0_valid      =fl_asc_valid_tmp[I];
    	    end   	           
        if (I==1)
    	    begin
    	      assign      usp_asc1_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      wrclk_1            =wrclk_tmp[I];
    	      assign      wdat_1             =wdat_tmp[I];
    	      assign      usp_asc1_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      crb_asc1_crcerr    =usp_asc_crcerr_tmp[I];
    	      assign      usp_asc1_o         =usp_asc_o_tmp[I];
    	      assign      fl_asc1_data       =fl_asc_data_tmp[I];
    	      assign      fl_asc1_valid      =fl_asc_valid_tmp[I];
    	    end   	
    	  else if (I==2)
    	    begin
    	      assign      usp_asc2_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      wrclk_2            =wrclk_tmp[I];
    	      assign      wdat_2             =wdat_tmp[I];
    	      assign      usp_asc2_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      crb_asc2_crcerr    =usp_asc_crcerr_tmp[I];
    	      assign      usp_asc2_o         =usp_asc_o_tmp[I]; 
    	      assign      fl_asc2_data       =fl_asc_data_tmp[I];
    	      assign      fl_asc2_valid      =fl_asc_valid_tmp[I];   	    	
    	    end  
     	  else if (I==3)
    	    begin
    	      assign      usp_asc3_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      wrclk_3            =wrclk_tmp[I];
    	      assign      wdat_3             =wdat_tmp[I];
    	      assign      usp_asc3_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      crb_asc3_crcerr    =usp_asc_crcerr_tmp[I];
    	      assign      usp_asc3_o         =usp_asc_o_tmp[I];   
    	      assign      fl_asc3_data       =fl_asc_data_tmp[I];
    	      assign      fl_asc3_valid      =fl_asc_valid_tmp[I]; 	    	
    	    end    	  
    	  else if (I==4)
    	    begin
    	      assign      usp_asc4_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      wrclk_4            =wrclk_tmp[I];
    	      assign      wdat_4             =wdat_tmp[I];
    	      assign      usp_asc4_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      crb_asc4_crcerr    =usp_asc_crcerr_tmp[I];
    	      assign      usp_asc4_o         =usp_asc_o_tmp[I];
    	      assign      fl_asc4_data       =fl_asc_data_tmp[I];
    	      assign      fl_asc4_valid      =fl_asc_valid_tmp[I];    	    	
    	    end      	    
    	  else if (I==5)
    	    begin
    	      assign      usp_asc5_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      wrclk_5            =wrclk_tmp[I];
    	      assign      wdat_5             =wdat_tmp[I];
    	      assign      usp_asc5_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      crb_asc5_crcerr    =usp_asc_crcerr_tmp[I];
    	      assign      usp_asc5_o         =usp_asc_o_tmp[I];
    	      assign      fl_asc5_data       =fl_asc_data_tmp[I];
    	      assign      fl_asc5_valid      =fl_asc_valid_tmp[I];    	          	    	
    	    end      	    
     	  else if (I==6)
    	    begin
    	      assign      usp_asc6_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      wrclk_6            =wrclk_tmp[I];
    	      assign      wdat_6             =wdat_tmp[I];
    	      assign      usp_asc6_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      crb_asc6_crcerr    =usp_asc_crcerr_tmp[I];
    	      assign      usp_asc6_o         =usp_asc_o_tmp[I];  
    	      assign      fl_asc6_data       =fl_asc_data_tmp[I];
    	      assign      fl_asc6_valid      =fl_asc_valid_tmp[I];    	        	    	
    	    end     	    
    	  else if (I==7)
    	    begin
    	      assign      usp_asc7_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      wrclk_7            =wrclk_tmp[I];
    	      assign      wdat_7             =wdat_tmp[I];
    	      assign      usp_asc7_3wierr    =usp_asc_3wierr_tmp[I];
    	      assign      crb_asc7_crcerr    =usp_asc_crcerr_tmp[I];
    	      assign      usp_asc7_o         =usp_asc_o_tmp[I]; 
    	      assign      fl_asc7_data       =fl_asc_data_tmp[I];
    	      assign      fl_asc7_valid      =fl_asc_valid_tmp[I];    	         	    	
    	    end  
    	      
    end //ASC_DP	
endgenerate
                          
////////////// CONTROL LOGIC ////////////////
//////  COMMON TO DATAPATHS FOR ALL ASC'S.

//clk_lgbldr_first_edge is a flop to detect the first edge
//of logibuilder clk (which comes from the clk/reset block.
//These signals (clk_lgbldr_first_edge1&2) will be used to preset
//the FrmPosCnt counter the first time.
always @(posedge clk_3wi or negedge resetn)
  begin
  	if (resetn ==1'b0)
  	  clk_lgbldr_first_edge1 <= 1'b0;
  	else 
  	  if (clk_lgbldr == 1'b1)
  	    clk_lgbldr_first_edge1 <= 1'b1;
  end
  
always @(posedge clk_3wi or negedge resetn)
  begin
  	if (resetn ==1'b0)
  	  clk_lgbldr_first_edge2 <= 1'b0;
  	else 
  	  clk_lgbldr_first_edge2 <= clk_lgbldr_first_edge1;
  end 
  
//Frame Position Counter
always @(posedge clk_3wi or negedge resetn)
  begin
    if (resetn == 1'b0)
      FrmPosCnt <= 7'd0;
    //If clk_lgbldr_first_edge1=1, but  clk_lgbldr_first_edge2=0
    //then we have detected the very first edge of the logibuilder clk.
    else if ((clk_lgbldr_first_edge1==1) && (clk_lgbldr_first_edge2==0)) 
      FrmPosCnt <= 7'd3;
    //Terminal count.  
    else if (FrmPosCnt == 7'd127)
      FrmPosCnt <= 7'd0;
    else 
      FrmPosCnt <= FrmPosCnt+1;  
  end

//Generation of start bit.
//Start bit is asserted the cycle before it is needed so that it can
//be run through a rising edge flop.  Using the flop will put less delay
//on WDAT outputs.
assign startBitPreReg = (FrmPosCnt==ASCVM_STARTNEXT) ? 1'b1 : 1'b0;

always@(posedge clk_3wi or negedge resetn)   
  begin
  	  if (resetn == 1'b0)
  	    startBit <= 1'b0;
  	  else
  	    begin
  	     startBit <= startBitPreReg;
  	    end
  end	
  
  always @(FrmPosCnt)
  begin
    if ((FrmPosCnt==ASCVM_RDAT_RAM_WRITE1) || (FrmPosCnt==ASCVM_RDAT_RAM_READ1)
     || (FrmPosCnt==ASCVM_RDAT_RAM_WRITE3) || (FrmPosCnt==ASCVM_RDAT_RAM_READ3))
            RdatRamAddr[0] <=  1'b1;
    else  
        RdatRamAddr[0] <=  1'b0;
  end     
  
 always @(FrmPosCnt)
  begin
    if ((FrmPosCnt==ASCVM_RDAT_RAM_WRITE2) || (FrmPosCnt==ASCVM_RDAT_RAM_READ2)
     || (FrmPosCnt==ASCVM_RDAT_RAM_WRITE3) || (FrmPosCnt==ASCVM_RDAT_RAM_READ3))
            RdatRamAddr[1] <=  1'b1;
    else  
        RdatRamAddr[1] <=  1'b0;
  end    
  
//RdatRAMAddr[2] is only used for Vegas parts
//since addressing ends at 011 for Reno.  
always @(FrmPosCnt)
  begin
     `ifndef ASCVM_ASC0_ASC1012
     if ((FrmPosCnt==ASCVM_RDAT_RAM_WRITE4) || (FrmPosCnt==ASCVM_RDAT_RAM_READ4))
       RdatRamAddr[2] <=  1'b1;
     else  
     `endif
       RdatRamAddr[2] <=  1'b0;
  end   
  
//Assert the rdat ram write enable whenever the frame position count
//equals a ram write count.  
 always @(FrmPosCnt)
  begin
    if ((FrmPosCnt==ASCVM_RDAT_RAM_WRITE0) || (FrmPosCnt==ASCVM_RDAT_RAM_WRITE1)
     || (FrmPosCnt==ASCVM_RDAT_RAM_WRITE2) || (FrmPosCnt==ASCVM_RDAT_RAM_WRITE3)
     `ifndef ASCVM_ASC0_ASC1012 //Writes at WRITE4 only occur for vegas.
       || (FrmPosCnt==ASCVM_RDAT_RAM_WRITE4)
     `endif
     )
            RdatRamWE<=  1'b1;
    else  
        RdatRamWE <=  1'b0;
  end        
 
  always @(FrmPosCnt)
  begin
    if (FrmPosCnt==ASCVM_CRC_CHECK_CLEAR)
       RdatCrcSet <=  1'b1;
    else  
       RdatCrcSet <=  1'b0;
  end        
 
 
 
 
//CRC Checker control:
//Enable CRC Checker (turn on/off) via crcChkEn.
always @(posedge clk_3wi or negedge resetn)
  begin
    if (resetn == 1'b0)
      crcChkEn  <= 1'b0;
    else 
      begin
      	case (FrmPosCnt)
      		ASCVM_CRC_CHECK_START : crcChkEn <= 1'b1;
      		ASCVM_CRC_CHECK_END   : crcChkEn <= 1'b0;
        endcase
      end 
  end
  
//Pad Bit Checker control:
//Enable Pad Bit Checker (turn on/off) via crcChkEn.
always @(posedge clk_3wi or negedge resetn)
  begin
    if (resetn == 1'b0)
      padBitChkEn  <= 1'b0;
    else 
      begin
      	case (FrmPosCnt)
      		ASCVM_PAD_BIT_CHECK_START : padBitChkEn <= 1'b1;
      		ASCVM_PAD_BIT_CHECK_END   : padBitChkEn <= 1'b0;
        endcase
      end 
  end  
       
  //The same WdatRamWE is used for all ASC's, so it's
  //not part of the ASCx WDAT sections. 
  //We'll assert WdatRamWE starting with the first
  //WDAT ram write, and deassert it after the last write.
  //The writes are burst into the ram, once per 16us.
  always @(posedge clk_3wi or negedge resetn)
    begin
    	if (resetn == 1'b0)
    	  WdatRamWE <= 1'b0;
    	else
    	  if (FrmPosCnt==ASCVM_WDAT_RAM_WRITE0-1)
    	    WdatRamWE <= 1'b1;
//For reno, deassert WE after 4th write.    	    
    `ifdef 	ASCVM_ASC0_ASC1012 
        else if(FrmPosCnt==ASCVM_WDAT_RAM_WRITE3)
    	    WdatRamWE <= 1'b0;    
//For vegas, deassert WE after 5th write   
    `else   
        else if(FrmPosCnt==ASCVM_WDAT_RAM_WRITE4)
    	    WdatRamWE <= 1'b0;
    `endif	    
    end

always @(FrmPosCnt)
  begin
    if ((FrmPosCnt==ASCVM_WDAT_RAM_WRITE1) || (FrmPosCnt==ASCVM_WDAT_RAM_READ1)
     || (FrmPosCnt==ASCVM_WDAT_RAM_WRITE3) || (FrmPosCnt==ASCVM_WDAT_RAM_READ3))
            WdatRamAddr[0] <=  1'b1;
    else  
        WdatRamAddr[0] <=  1'b0;
  end     

always @(FrmPosCnt)
  begin
    if ((FrmPosCnt==ASCVM_WDAT_RAM_WRITE2) || (FrmPosCnt==ASCVM_WDAT_RAM_READ2)
     || (FrmPosCnt==ASCVM_WDAT_RAM_WRITE3) || (FrmPosCnt==ASCVM_WDAT_RAM_READ3))
       WdatRamAddr[1] <=  1'b1;
    else  
        WdatRamAddr[1] <=  1'b0;
  end 
  
always @(FrmPosCnt)
  begin
    `ifndef   ASCVM_ASC0_ASC1012
    if ((FrmPosCnt==ASCVM_WDAT_RAM_WRITE4) || (FrmPosCnt==ASCVM_WDAT_RAM_READ4))
      WdatRamAddr[2] <=  1'b1;
    else
   `endif
      WdatRamAddr[2] <=  1'b0;
  end 
      
  
//Assert the wdat shift register load enable
//immediately after the wdat ram is addressed.
always @(posedge clk_3wi or negedge resetn)
  begin
    if (resetn==1'b0)
      WdatDataShiftRegLoad <= 1'b0;
    else
      if ((FrmPosCnt == ASCVM_WDAT_RAM_READ0)
         || (FrmPosCnt == ASCVM_WDAT_RAM_READ1)
         || (FrmPosCnt == ASCVM_WDAT_RAM_READ2)
         || (FrmPosCnt == ASCVM_WDAT_RAM_READ3)         
       `ifndef ASCVM_ASC0_ASC1012
         || (FrmPosCnt == ASCVM_WDAT_RAM_READ4)  
       `endif
         )
            WdatDataShiftRegLoad <= 1'b1;    
       else
            WdatDataShiftRegLoad <= 1'b0;
  end

////////////CONTROL LOGIC ENDS HERE////////////////

       
endmodule
