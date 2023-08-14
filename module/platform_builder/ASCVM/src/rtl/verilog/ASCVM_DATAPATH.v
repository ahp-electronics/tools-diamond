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
// File                  : ASCVM_DATAPATH.v
// Title                 : Analog Sense and Control Virtual Machine-Datapath
// Dependencies          : Needs ASCVM_PARAMS.v and supports ASCVM_DATAPATH.v.
// Description           : This is the ASCVM datapath block that is to be      
//                       : instantiated in the ASCVM.               
//                       : For each ASC beyond ASC0, there will be one         
//                       : ASC datapath block instantiated.                    
// =============================================================================
//                        REVISION HISTORY
// Version               : 0.4
// Changes Made          : 0.2: Revised reset strategy, revised I/O, &
//                         simplified structure. 
//                       : 0.3: Fixed width of usp_ascx_o (x:1-7).
//                       : 0.4: Removed include file per ISPL_CR_57885.
// Author(s)             : Dan Sides
// Mod. Date             : Sept 2012
// =============================================================================
//Needed to get the values of usage defined macros `ASCVM_RDAT_DISTRAM/`ASCVM_WDAT_DISTRAM

// Revision History:
// $Log: ecp5PLUSasc#ascvm_ip#design#rtl#ASCVM_DATAPATH.v,v $
// Revision 1.1  2015-05-05 12:00:48-07  cmui
// Only change is to add the `include at the beginning of the code
//

`include "../../params/verilog/ASCVM_PARAMS.v"

module ASCVM_DATAPATH (
input       clk_3wi,
input       reset,     //complete reset.
input       rst_usp_asc_o,  //only resets logibuilder output reg.
//These will be top level inputs.
input        rdat,
input [76:0] usp_asc_i,
input       usp_asc_3wierrrst,

//Control signals from the ASCVM mothership.
input [6:0] FrmPosCnt,
input       RdatRamWE,
input [2:0] RdatRamAddr,
input       crcChkEn,
input       RdatCrcSet,
input       padBitChkEn,
input       WdatDataShiftRegLoad,
input       startBit,
input [2:0] WdatRamAddr,
input       WdatRamWE,

//Outputs
output reg [69:0] usp_asc_o,
output            wrclk,
output            wdat,
output            usp_asc_3wierr,
output            usp_asc_crcerr,
output     [15:0] fl_asc_data,
output            fl_asc_valid
);



//All of these parameters should be passed down from the mothership (ASCVM.v).
//Their values can be (should be) overwritten at the instantiation level.
parameter       ASCVM_WHOAMI                = 3'd0; //Identifies which ASC a datapath is for(0-7).
parameter       ASCVM_ASC0_ASC1012_PARAM    = 1'b1; //Set to 1 if asc0 is vegas.
parameter [5:0] ASCVM_CRC_ERR_CNT_LMT_PARAM = 6'h4;
parameter [5:0] ASCVM_TWI_ERR_CNT_LMT_PARAM = 6'd63; 
parameter [6:0] ASCVM_RDAT_RAM_WRITE0 = 7'd24;
parameter [6:0] ASCVM_RDAT_RAM_WRITE1 = ASCVM_RDAT_RAM_WRITE0+16;
parameter [6:0] ASCVM_RDAT_RAM_WRITE2 = ASCVM_RDAT_RAM_WRITE1+16;
parameter [6:0] ASCVM_RDAT_RAM_WRITE3 = ASCVM_RDAT_RAM_WRITE2+16;//Not needed for Reno.
parameter [6:0] ASCVM_RDAT_RAM_WRITE4 = ASCVM_RDAT_RAM_WRITE3+16;//Not needed for Reno
parameter [6:0] ASCVM_RDAT_RAM_READ0  = 7'd0;//7'd122;
parameter [6:0] ASCVM_RDAT_RAM_READ1  = ASCVM_RDAT_RAM_READ0+1;
parameter [6:0] ASCVM_RDAT_RAM_READ2  = ASCVM_RDAT_RAM_READ1+1;
parameter [6:0] ASCVM_RDAT_RAM_READ3  = ASCVM_RDAT_RAM_READ2+1;//Not needed for Reno.
parameter [6:0] ASCVM_RDAT_RAM_READ4  = ASCVM_RDAT_RAM_READ3+1;//Not needed for Reno.
parameter [6:0] ASCVM_CRC_CHECK_START        = 7'd7;
parameter [6:0] ASCVM_CRC_CHECK_CLEAR        = ASCVM_CRC_CHECK_START-1;
parameter [6:0] ASCVM_CRC_CHECK_COMPARE      = 7'd120;
parameter [6:0] ASCVM_CRC_COUNTER_INCREMENT  = ASCVM_CRC_CHECK_COMPARE+1;
parameter [6:0] ASCVM_TWI_COUNTER_INCREMENT  = 7'd0;
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
parameter [7:0] ASCVM_TWI_CRC_POLY           = 8'h2f ;


reg [15:0]  RdatShftReg;
reg         RdatBad;
reg [7:0]   RdatCrc;
wire[15:0]  RdatRamQ;
reg [5:0]   RdatCrcErrCnt;//Count for contiguous, errored RDAT Packets
                           //Increments for either RDAT CRC8 or pad bit errors.
reg [5:0]   Rdat3WIErrCnt;//Count for cumulative 3WI errors.                           
reg         firstGoodRDATFrameRcvd;//Indicates first good frame was rcvd.
reg         firstRdatACKRcvd; //Indicates that first frame with no nack 
                               //or crc error was rcvd    
                                                          
reg [15:0]   WdatDataMuxOut;
reg  [15:0]  WdatDataShiftReg;
reg          WdatBitStreamMux; //Muxes the wdat serial stream (3/out START bit)
reg          WdatDataOut;   //neg edge wdat serial stream (w/out START bit)
reg  [ 7:0]  WdatCrc;      //WDAT CRC
reg  [3:0]   WdatNack;     //Holds 4 bit Nack response.
wire [15:0]  WdatRamQ;     //Output from wdat data ram.

//ASC Interface RDAT Data Flow

assign wrclk = clk_3wi;
  
//RDAT Shift Register			 

  always @(posedge clk_3wi or negedge reset)
    begin
    if (reset == 1'b0)
      RdatShftReg <= 16'd0;      
    else
      //Data is shifted into the top of the reg
      //so that bit position 0 will have the first
      //data bit that arrived.
      RdatShftReg <= {rdat,RdatShftReg[15:1]};
    end 
//Note that we can use the same DIST RAM dimension for both
//Reno and Vegas since they both synthesize to 25 LUT's.    

`ifndef ASCVM_RDAT_DISTRAM
        ASCVM_RAM_EBR RDAT_RAM  (.Clock(clk_3wi), .ClockEn(1'b1), .Reset(~reset), .WE(RdatRamWE), .Address(RdatRamAddr), 
          .Data(RdatShftReg), .Q(RdatRamQ)); 
`else
        ASCVM_RAM_DIST RDAT_RAM (.Clock(clk_3wi), .ClockEn(1'b1), .WE(RdatRamWE),.Address(RdatRamAddr),
          .Data(RdatShftReg),.Q(RdatRamQ), .Reset(~reset));
`endif  
  
  //The logibuilder output register is reset whenever
  //reset is asserted or if rst_usp_asc_o is asserted.
  //SynplifyPro will not attach to the GSR input of a register,
  //and will standardly attach asynchronous reset to LSR...
  //and if rst_usp_asc_o is a sync reset, then it will be
  //routed thru LUTs.  Since the Logibuilder output reg is very wide
  //then this costs us many LUTs since the sync reset will have to be
  //in the datapath for every register.  To circumvent this problem,
  //we OR rst_usp_asc_o with reset and the resulting signal will be
  //routed to LSR (thus removing rst_usp_asc_o from the LUT/datapath.
  wire reset_or_crcerr; 
  assign reset_or_crcerr = ~(~reset ||~rst_usp_asc_o);

  always @(posedge clk_3wi or negedge reset_or_crcerr)  
    begin
      if ((reset_or_crcerr==1'b0))
        begin
          usp_asc_o <= 70'd0;      
        end 
      else  
        begin
          //If the crc error count limit has not been exceeded
          //then check to make sure that it's a good frame before 
          //updating usp_asc0_o.
        	 if (RdatBad==1'b0)
        	 begin
        	   case (FrmPosCnt)//synthesis parallel_case
               ASCVM_RDAT_RAM_READ0+1:
                 begin
                  usp_asc_o[15:0]  <= RdatRamQ;
                 end  
               ASCVM_RDAT_RAM_READ1+1:
                 begin
                  usp_asc_o[31:16]  <= RdatRamQ;          
                 end  
               ASCVM_RDAT_RAM_READ2+1:
                 begin
                  usp_asc_o[47:32]  <= RdatRamQ;          
                 end
               ASCVM_RDAT_RAM_READ3+1:
                 begin
                 	//If I am datatpath for asc0 and if user specified vegas for asc0...
                   if ((ASCVM_WHOAMI==3'd0) && (ASCVM_ASC0_ASC1012_PARAM==1'b0))
                     usp_asc_o[63:48]  <= RdatRamQ;
                   //I am datpath for asc1-7, or if user specifies reno for asc0...  
                   else
                 	   usp_asc_o[51:48]  <= RdatRamQ;
                 end	  
               ASCVM_RDAT_RAM_READ4+1://Do the following for asc0/vegas only.
                 begin
                 	 if ((ASCVM_WHOAMI==3'd0) && (ASCVM_ASC0_ASC1012_PARAM==1'b0))
                     usp_asc_o[69:64]  <= RdatRamQ[5:0];          
                 end
             endcase             		  	
          end
        end      
    end

assign fl_asc_data = RdatRamQ;

assign fl_asc_valid = ((ASCVM_RDAT_RAM_READ0==FrmPosCnt) && !RdatBad) ? 1:0;


////RDAT CRC Checker!
always @(posedge clk_3wi or negedge reset)
  begin
  	if (reset == 0)
  	  RdatCrc <= 8'hFF;
  	else 
  	  begin 
  	    if (RdatCrcSet)
  	      RdatCrc<= 8'hFF;  
  	    else if (crcChkEn)
  	      if (RdatCrc[7] ^ rdat )
            RdatCrc <= ( RdatCrc <<1 ) ^ ASCVM_TWI_CRC_POLY ;
          else
            RdatCrc <= ( RdatCrc <<1 ) ;
  	  end    
  end
      
wire [7:0] RdatShftRegInverseReverse = {!RdatShftReg[8],!RdatShftReg[9],!RdatShftReg[10],!RdatShftReg[11],
  	    	  	     !RdatShftReg[12],!RdatShftReg[13],!RdatShftReg[14],!RdatShftReg[15]};
always @(posedge clk_3wi or negedge reset)
  begin
  	if (reset == 0)
  	  RdatBad<= 1'b0;
  	else 
  	  begin 
  	  	//Synchronously set the "bad" flag
  	  	//for each frame, before CRC fields or Pad bit fields.
  	  	if (FrmPosCnt==ASCVM_CRC_CHECK_CLEAR)
  	  	  RdatBad<= 1'b0;  
  	  	//Compare the internally calculated CRC
  	  	//to the received CRC (inverted and bit wise reversed).  
  	  	//Do this comparison once per frame.
  	  	else if (FrmPosCnt==ASCVM_CRC_CHECK_COMPARE)
  	  	  begin
  	  	  	if (RdatCrc!=RdatShftRegInverseReverse)
  	    	  	  RdatBad<= 1'b1;
  	  	  end
  	  	//padBitChkEn is a flop that is set indicate
  	  	//when it is time to compare for pad bit checking.
  	  	//The pad bits should oscillate every clock cycle
  	  	//and should be out of phase with bit 0 of the
  	  	//frame bit counter.  
  	  	else if (padBitChkEn)
  	  	  begin
  	  	  	//If the rdat bit is not equal to the
  	  	  	//invert of the lowest bit of the FrmPosCnt,
  	  	  	//then there is a problem.
  	  	  	if (rdat != !FrmPosCnt[0])
  	  	  	   RdatBad<= 1'b1;
  	  	  end
  	  	  
  	  end    
  end
//end of RDAT CRC Checker

always @(posedge clk_3wi or negedge reset)   
  begin
  	  if (reset == 1'b0)
  	    RdatCrcErrCnt <= 7'd0;
  	  else
  	    begin
  	    	if ((FrmPosCnt==ASCVM_CRC_COUNTER_INCREMENT)&&(firstGoodRDATFrameRcvd))
  	    	  begin
  	    	    if (RdatBad == 1'b0)
  	    	      RdatCrcErrCnt <= 6'd0;
  	    	    else if (RdatCrcErrCnt == ASCVM_CRC_ERR_CNT_LMT_PARAM)  
  	    	      RdatCrcErrCnt <= RdatCrcErrCnt;
  	    	    else
  	    	      RdatCrcErrCnt <= RdatCrcErrCnt + 1;  
  	    	  end  
  	    end
  end
  
assign usp_asc_crcerr = (RdatCrcErrCnt == ASCVM_CRC_ERR_CNT_LMT_PARAM);

always @(posedge clk_3wi or negedge reset)   
  begin
  	  if (reset == 1'b0)
  	    Rdat3WIErrCnt <= 6'd0;
  	  else
  	    begin
  	    	//CRC error limit is hit, reset the 3WI error count. 
  	    	//Or if the 3wi err reset is asserted, then also reset the
  	    	//3wi error count. (duh)
  	    	//Also reset on the asc0 crcerr signal input.
  	    	if (~rst_usp_asc_o)
 	    	  Rdat3WIErrCnt <= 6'd0;
  	    	else if (~usp_asc_3wierrrst)
   	    	  Rdat3WIErrCnt <= 6'd0; 	    	  
  	    	else
  	    	  //Update the count once per frame, and only
  	    	  //update after the first frame with no crc/pad bit errors
  	    	  //and no nack.
  	    	    if((FrmPosCnt==ASCVM_TWI_COUNTER_INCREMENT)&&(firstRdatACKRcvd))
  	    	      begin
  	    	    	  //Increment if there was a bad rdat frame (indicating
  	    	     	  //either a pad bit error or a crc error) or if there
  	    	    	  //was a NACK rcvd (indicated by a non 0110 pattern).
  	    	      	if ((RdatBad == 1'b1) || (RdatShftReg[15:12]!=4'b0110))
  	      	  	    begin
  	      	  	      //if (Rdat3WIErrCnt ==6'd63)
  	      	  	      if (Rdat3WIErrCnt ==ASCVM_TWI_ERR_CNT_LMT_PARAM)
  	      	  	        Rdat3WIErrCnt <= Rdat3WIErrCnt;
  	      	  	      else 
  	    	    	         Rdat3WIErrCnt <= Rdat3WIErrCnt+1;
  	    	    	    end    
  	    	      end 	
  	    end
  end
assign usp_asc_3wierr = (Rdat3WIErrCnt == ASCVM_TWI_ERR_CNT_LMT_PARAM);
//Indicates that first good frame was rcvd.
//Enables CRC error counting.
always@(posedge clk_3wi or negedge reset)   
  begin
  	  if (reset == 1'b0)
  	    firstGoodRDATFrameRcvd <= 1'b0;
  	  else
  	    begin
  	    	if (FrmPosCnt==ASCVM_CRC_COUNTER_INCREMENT && (RdatBad == 1'b0))
            firstGoodRDATFrameRcvd <= 1'b1;
  	    end
  end	    
//firstRdatACKRcvd0 indicates that first good frame with both
//ACK and no crc or pad bit errors was received.
//firstRdatACKRcvd0 is set once and is not reset until reset.
//Enables 3WI Error counter.
 always@(posedge clk_3wi or negedge reset)   
  begin
  	  if (reset == 1'b0)
  	    firstRdatACKRcvd <= 1'b0;
  	  else
  	    begin
  	    	if (FrmPosCnt==ASCVM_TWI_COUNTER_INCREMENT && (RdatBad == 1'b0)
  	    	           && (RdatShftReg[15:12]==4'b0110)) 
            firstRdatACKRcvd <= 1'b1;
  	    end
  end	 
      
//End of RDAT flow    

////Start of WDAT Flow
always@(FrmPosCnt or usp_asc_i)
  begin 
  	//The wdat mux has 4 inputs if reno, 5 inputs if vegas.
  	case (FrmPosCnt)//synthesis parallel_case
  		ASCVM_WDAT_RAM_WRITE0: WdatDataMuxOut <= usp_asc_i[15:0]; 
  		ASCVM_WDAT_RAM_WRITE1: WdatDataMuxOut <= usp_asc_i[31:16];
  		ASCVM_WDAT_RAM_WRITE2: WdatDataMuxOut <= usp_asc_i[47:32];
  		ASCVM_WDAT_RAM_WRITE3: 
  		  begin 
          if ((ASCVM_WHOAMI==3'd0) && (ASCVM_ASC0_ASC1012_PARAM==1'b0))
  		  	    WdatDataMuxOut <= usp_asc_i[63:48]; 	
          else      	 
           //I am datpath for asc1-7, or if user specifies reno for asc0...    
           //Note that this is the same output as for default.          
         	    WdatDataMuxOut <= {13'd0,usp_asc_i[50:48]};
  		    end	 
      default: 
         begin 
           //If I am datatpath for asc0 and if user specified vegas for asc0...
           //then this is the fifth and final input of the wdat mux.
           if ((ASCVM_WHOAMI==3'd0) && (ASCVM_ASC0_ASC1012_PARAM==1'b0))  
             WdatDataMuxOut <= {3'b000,usp_asc_i[76:64]};
           //I am datpath for asc1-7, or if user specifies reno for asc0...    
           //Note that this is the same output as for ASCVM_WDAT_RAM_WRITE3
           else      	 
         	   WdatDataMuxOut <= {13'd0,usp_asc_i[50:48]};
         end	   
    endcase	
  end  
  
`ifndef ASCVM_WDAT_DISTRAM 
  ASCVM_RAM_EBR WDAT_RAM (.Clock(clk_3wi), .ClockEn(1'b1), .Reset(~reset), .WE(WdatRamWE), .Address(WdatRamAddr), 
    .Data(WdatDataMuxOut), .Q(WdatRamQ));
`else
  ASCVM_RAM_DIST WDAT_RAM (.Clock(clk_3wi), .ClockEn(1'b1), .WE(WdatRamWE),.Address(WdatRamAddr),
    .Data(WdatDataMuxOut),.Q(WdatRamQ), .Reset(~reset));
`endif
    
//The Wdat Data Shift Reg holds the Logibuilder data
//that gets serialized out to the 3WI WDAT output.
//It gets sent out lowest bits to highest bits
//(i.e. Bit 0 is the first to be sent out.)
//so it shifts left to right.
//Note that there is no shift enable. Rather,
//it is always either loading or shifting.
//This is because if we are not shifting out the contents
//of this reg, we dont care what the contents are,
//so we save a few luts by not building logic enable
//signalling.
//
always @(posedge clk_3wi or negedge reset)
  begin
  	if (reset == 1'b0)
  	  WdatDataShiftReg <= 16'h00;
  	else
  	  begin
  	  	if (WdatDataShiftRegLoad==1'b1)
  	  	  WdatDataShiftReg <= WdatRamQ;
  	  	else
  	  	  WdatDataShiftReg <= {1'b0,WdatDataShiftReg[15:1]};
  	  end  
  end

always @(negedge clk_3wi or negedge reset)
  begin
    if (reset == 1'b0)
      WdatDataOut <= 1'b0;
    else 
      WdatDataOut <= WdatBitStreamMux;
  end

always @(*)
      begin
        if (FrmPosCnt > ASCVM_WDAT_XMIT_NACK)
          WdatBitStreamMux <= WdatNack[0];
        //Use lowest bit of FPC as pad bit.        	
      	else if (FrmPosCnt > ASCVM_WDAT_XMIT_PDBT2)
      	    WdatBitStreamMux <= ~FrmPosCnt[0];
        else if (FrmPosCnt > ASCVM_WDAT_XMIT_CRC)
            WdatBitStreamMux <= ~WdatCrc[7];
        //We start the second group of pad bits at different places,
        //depending on whether the instance is a vegas/asc0 or if it
        //is a reno.    
        else if ((FrmPosCnt > ASCVM_WDAT_XMIT_PDBT1_VEGAS) &&
            ((ASCVM_WHOAMI==3'd0) && (ASCVM_ASC0_ASC1012_PARAM==1'b0)))
            begin
            	  WdatBitStreamMux <= ~FrmPosCnt[0];          
            end
         else if ((FrmPosCnt > ASCVM_WDAT_XMIT_PDBT1_RENO) &&
            (~(ASCVM_WHOAMI==3'd0) || ~(ASCVM_ASC0_ASC1012_PARAM==1'b0)))
            begin
            	  WdatBitStreamMux <= ~FrmPosCnt[0];          
            end           
        else if (FrmPosCnt > ASCVM_WDAT_XMIT_DATA)
          WdatBitStreamMux <= WdatDataShiftReg[0];
        else if (FrmPosCnt > ASCVM_WDAT_XMIT_PDBT0)
          WdatBitStreamMux <= ~FrmPosCnt[0];
        else   
          WdatBitStreamMux <= 1'b0;
      end	    
  always @(posedge clk_3wi or negedge reset)
    begin
    	if (reset == 0)
    	  WdatCrc <= 8'hFF;
    	else 
    	  begin 
    	    if (FrmPosCnt > ASCVM_WDAT_XMIT_CRC)
             //Shift out to the WdatBitStreamMux.    	    
    	       WdatCrc <= WdatCrc << 1;
  	      else if (FrmPosCnt > ASCVM_WDAT_START_CRC_CALC)
  	        if (WdatCrc[7] ^ WdatBitStreamMux )
              WdatCrc <= ( WdatCrc <<1 ) ^ ASCVM_TWI_CRC_POLY ;
            else
              WdatCrc <= ( WdatCrc <<1 ) ;
    	    else if (FrmPosCnt == ASCVM_WDAT_START_CRC_CALC)
    	      WdatCrc<= 8'hFF;              
  	    end    
    end
//NACK Logic
//If the last RDAT had either pad bit error or CRC error,
//then assert NACK.  Else, assert ACK.

always @(posedge clk_3wi or negedge reset)
  begin
    if (reset == 0)
      //default to NACK. (Guilty until proven innocent.)
      WdatNack <= 4'b1001;
    else
      if(FrmPosCnt==ASCVM_CRC_CHECK_CLEAR)
        begin
        	//Send nack if either a bad rdat is found.
        	//Also, since rdatBad is disabled (to 0) until
        	//the first good frame is rcv'd, we send
        	//NACK's until the first good frame is received.
        	//RdatBad includes both crc and pad bit errors.
        	if (RdatBad || ~firstGoodRDATFrameRcvd)
        	  WdatNack <= 4'b1001; //NACK	
		else
        	  WdatNack <= 4'b0110; //ACK
        end  
      else if(FrmPosCnt > ASCVM_WDAT_XMIT_NACK)
        WdatNack <= WdatNack >> 1;
  end 	

//We can logical OR the START bit with the WdatDataOut since
//WdatDataOut will be held at zero for 2.5 WRCLK cycles before
//and 2.5 WRCLK cycles after the Startbit.
assign wdat = startBit || WdatDataOut;

//End of WDAT Flow
endmodule
