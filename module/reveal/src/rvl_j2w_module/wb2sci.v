//   ==================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
//   ------------------------------------------------------------------
//   Copyright (c) 2006-2011 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED 
//   ------------------------------------------------------------------
//
//
//   Permission:
//
//      Lattice Semiconductor grants permission to use this code
//      pursuant to the terms of the Lattice Semiconductor Corporation
//      Open Source License Agreement.  
//
//   Disclaimer:
//
//      Lattice Semiconductor provides no warranty regarding the use or
//      functionality of this code. It is the user's responsibility to
//      verify the user’s design for consistency and functionality through
//      the use of formal verification methods.
//
//   --------------------------------------------------------------------
//
//                  Lattice Semiconductor Corporation
//                  5555 NE Moore Court
//                  Hillsboro, OR 97214
//                  U.S.A
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                         503-286-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
//   --------------------------------------------------------------------
//                         FILE DETAILS
// Project          : EFB for Saffire
// File             : wb2sci.v
// Title            : General Purpose IO Component 
// Description      : translate 8-bit WISHBONE trsaction
//                    into SerDes/PCS Control Interface (SCI) for Saffire
// =============================================================================
//                        REVISION HISTORY
// Version          : 1.0
// Mod. Date        : June 26, 2013
// Changes Made     : Initial Creation

// Mod. Date        : Aug 26, 2013
// Changes          : Changed the file name, module name and port names
// =============================================================================

`timescale 1 ns / 1 ps

module wb2sci
  #(
    parameter DCU0_CH0_ENABLE = 1,	// Set 1 to enable DCU 0 Channel 0
    parameter DCU0_CH1_ENABLE = 1,	// Set 1 to enable DCU 0 Channel 1
    parameter DCU1_CH0_ENABLE = 1,	// Set 1 to enable DCU 1 Channel 0
    parameter DCU1_CH1_ENABLE = 1,	// Set 1 to enable DCU 1 Channel 1
    parameter SCI_STROBE_DELAY = 0	// SCI Strobe Delay Default Value (MAX is 7)
    )
  (
	// Clock and Reset
	input wire CLK_I,				// Clock
	input wire RST_I,				// Synchronous reset (Active High)

	// Wishbone Interface (All Active High)
	input wire WB_CYC_I,			// WISHBONE cycle active
	input wire WB_STB_I,			// WISHBONE strobe
	input wire WB_WE_I,				// WISHBONE write/read not
	input wire [31:0] WB_ADR_I,		// WISHBONE 32-bit address
	input wire [7:0] WB_DAT_I,		// WISHBONE 8-bit write data
	input wire WB_CTI_I,			// Not used, always tied to 0
	input wire WB_BTE_I,			// Not used, always tied to 0
	input wire WB_LOCK_I,			// Not used, always tied to 0
	input wire [3:0] WB_SEL_I,		// Not used, always tied to 0
	output wire [7:0] WB_DAT_O,		// WISHBONE 8-bit read data
	output wire WB_ACK_O,			// WISHBONE acknowledge 
	output wire WB_ERR_O,			// Not used, always tied to 0
	output wire WB_RTY_O,			// Not used, always tied to 0

	// SerDes/PCS Control Interface Signal (Share Bus Signal - Broadcast)
	output wire [5:0] sci_addr,		// 6-bit SCI Address
	output wire [7:0] sci_wrdata,		// 8-bit SCI Write data
	output wire sci_en_ch0,			// Select sci_wrdata to write for Channel 0, otherwise use internal memory cell (Active High)
	output wire sci_en_ch1,			// Select sci_wrdata to write for Channel 1, otherwise use internal memory cell (Active High)
	output wire sci_en_dual,			// Select  to write for Channel AUX, otherwise use internal memory cell (Active High)
	output wire sci_sel_ch0,			// Select Channel 0 (Active High)
	output wire sci_sel_ch1,			// Select Channel 1 (Active High)
	output wire sci_sel_dual,		// Select Channel AUX (Active High)

	// SerDes/PCS Control Interface Signal (Unique Bus Signal)
	input wire [7:0] sci_rddata0_ch0,	// 8-bit SCI Read Data from SerDes / PCS registers DCU0 Channel 0
	input wire [7:0] sci_rddata0_ch1,	// 8-bit SCI Read Data from SerDes / PCS registers DCU0 Channel 1
	input wire [7:0] sci_rddata1_ch0, // 8-bit SCI Read Data from SerDes / PCS registers DCU1 Channel 0
	input wire [7:0] sci_rddata1_ch1, // 8-bit SCI Read Data from SerDes / PCS registers DCU1 Channel 1
	input wire sci_int0_ch0,		 	// Interrupt Signal for DCU0 Channel 0
	input wire sci_int0_ch1,			// Interrupt Signal for DCU0 Channel 1
	input wire sci_int1_ch0,			// Interrupt Signal for DCU1 Channel 0
	input wire sci_int1_ch1,		 	// Interrupt Signal for DCU1 Channel 1
	output reg sci_rd0,				// Read Signal for DCU0
	output reg sci_rd1,		 		// Read Signal for DCU1
	output reg sci_wrn0,			// Write Signal for DCU0
	output reg sci_wrn1,			// Write Signal for DCU1
	output wire cyawstn0,	 		// Reset Signal for DCU0 active high (reset to mem-cell value of dcu0)
	output wire cyawstn1		 	// Reset Signal for DCU1 active high (reset to mem-cell value of dcu1)
	);
	
	wire [7:0] SCIRDATA0_AUX;		 		// RDATA data for DCU0 Channel AUX
	wire [7:0] SCIRDATA1_AUX;		 		// RDATA data for DCU1 Channel AUX
	wire SCIINT0_AUX;				// INT data for DCU0 Channel AUX
	wire SCIINT1_AUX;				// INT data for DCU0 Channel AUX

	wire dcu_sel;					// DCU Select
	wire [7:0] read_data;			// Read Data from SCI Bus
	
	reg  [2:0] sci_stb_delay; 		// Internal SCI Strobe Delay
	reg  [1:0] state;	 			// Finite State Machine for WB2SCI
	reg  [7:0] sci_rdata;			// Internal Read Data from SCI
	reg  wb_ack;		 			// Internal WISHBONE ACK
	
	///////////////////////////////////////////////////////////////
	// GENERATE RDATA and INT signal for Channel AUX			 //
	///////////////////////////////////////////////////////////////
	generate
	if (DCU0_CH0_ENABLE == 1) begin
		assign SCIRDATA0_AUX = sci_rddata0_ch0[7:0];
		assign SCIINT0_AUX = sci_int0_ch0;
	end
	else if (DCU0_CH1_ENABLE == 1) begin
		assign SCIRDATA0_AUX = sci_rddata0_ch1[7:0];
		assign SCIINT0_AUX = sci_int0_ch1;
	end
	else begin
		assign SCIRDATA0_AUX = 8'b0;
		assign SCIINT0_AUX = 1'b0;
	end
	endgenerate	

	generate
	if (DCU1_CH0_ENABLE == 1) begin
		assign SCIRDATA1_AUX = sci_rddata1_ch0[7:0];
		assign SCIINT1_AUX = sci_int1_ch0;
	end
	else if (DCU1_CH1_ENABLE == 1) begin
		assign SCIRDATA1_AUX = sci_rddata1_ch1[7:0];
		assign SCIINT1_AUX = sci_int1_ch1;
	end
	else begin
		assign SCIRDATA1_AUX = 8'b0;
		assign SCIINT1_AUX = 1'b0;
	end
	endgenerate	

	///////////////////////////////////////////////////////////////
	// DECODE LOGIC  (WISHBONE ADDRESS TO SCI) 					 //
	///////////////////////////////////////////////////////////////
	// Bit 0 - 6 : SCI Address
	// Bit 7 - 8 : SCI Channel Select
	// Bit 9 : SCI DCU Select
	// Bit 10 : SCI Enable (Same for all Channel)
	// Bit 11 : DCU Reset

	assign sci_wrdata = WB_DAT_I[7:0];
	assign sci_addr = WB_ADR_I[5:0];
	assign sci_sel_ch0 = (WB_ADR_I[7:6] == 2'b00) ? 1 : 0;
	assign sci_sel_ch1 = (WB_ADR_I[7:6] == 2'b01) ? 1 : 0;
	assign sci_sel_dual = (WB_ADR_I[7:6] == 2'b11) ? 1 : 0;
	assign dcu_sel = WB_ADR_I[8];
	assign sci_en_ch0 = (WB_ADR_I[9]) ? 1 : 0;  // '1' => sci_wrdata, '0' => mem_cell
	assign sci_en_ch1 = (WB_ADR_I[9]) ? 1 : 0;  // '1' => sci_wrdata, '0' => mem_cell
	assign sci_en_dual = (WB_ADR_I[9]) ? 1 : 0;  // '1' => sci_wrdata, '0' => mem_cell
	assign cyawstn0 = WB_ADR_I[10];
//	assign cyawstn0 = (~dcu_sel) ? WB_ADR_I[10] : 0;
	assign cyawstn1 = WB_ADR_I[10];
//	assign cyawstn1 = (dcu_sel) ? WB_ADR_I[10] : 0;
	assign read_data = (WB_ADR_I[8]) ? ((WB_ADR_I[7:6] == 2'b00) ? sci_rddata1_ch0[7:0] :
								  (WB_ADR_I[7:6] == 2'b01) ? sci_rddata1_ch1[7:0]  :
								  (WB_ADR_I[7:6] == 2'b11) ? SCIRDATA1_AUX : 8'b0)
								: ((WB_ADR_I[7:6] == 2'b00) ? sci_rddata0_ch0[7:0] :
								  (WB_ADR_I[7:6] == 2'b01) ? sci_rddata0_ch1[7:0]  :
								  (WB_ADR_I[7:6] == 2'b11) ? SCIRDATA0_AUX : 8'b0);

	///////////////////////////////////////////////////////////////
	// CONTROL LOGIC FOR SAFFIRE EFB (STATE MACHINE)			 //
	///////////////////////////////////////////////////////////////
	localparam IDLE = 2'b00;
	localparam WDATA = 2'b01;
	localparam RDATA = 2'b10;
	localparam DONE = 2'b11;

	always @ (posedge CLK_I or posedge RST_I) begin
		if (RST_I) begin
			state <= IDLE;
			sci_stb_delay <= SCI_STROBE_DELAY;
			wb_ack <= 0;
			sci_rdata <= 0;
			sci_rd0 <= 0;		// Read Signal for DCU0
			sci_rd1 <= 0;		// Read Signal for DCU1
			sci_wrn0 <= 0;		// Write Signal for DCU0
			sci_wrn1 <= 0;		// Write Signal for DCU1
		end
		else begin
			case (state)
			
			IDLE: begin
				if (WB_CYC_I & WB_STB_I) begin
					begin
						if (WB_WE_I) begin
							sci_wrn0 <= ~dcu_sel; 	//Setup the Write Strobe
							sci_wrn1 <= dcu_sel;
							state <= WDATA;
						end
						else begin
							sci_rd0 <= ~dcu_sel;		//Setup the Read Strobe
							sci_rd1 <= dcu_sel;
							state <= RDATA;
						end
					end
				end
				else begin
					state <= IDLE;
				end
			end
			
			WDATA: begin
				if (sci_stb_delay == 2'b00) begin		// End of Strobe Delay
					sci_stb_delay <= SCI_STROBE_DELAY;	// Restore the Strobe Delay Vaule
					sci_wrn0 <= 1'b0;					// Set the Write Strobe back to logic 0
					sci_wrn1 <= 1'b0;
					wb_ack <= 1'b1;
					state <= DONE;
				end
				else begin
					sci_stb_delay <= sci_stb_delay - 1;	// Strobe delay counter
					state <= WDATA;
				end
			end
			
			RDATA: begin
				if (sci_stb_delay == 2'b00) begin		// End of Strobe Delay
					sci_stb_delay <= SCI_STROBE_DELAY;	// Restore the Strobe Delay Vaule
					sci_rdata <= read_data;				// Move the data to the WISHBONE
					sci_rd0 <= 1'b0;						// Set the Read Strobe back to logic 0
					sci_rd1 <= 1'b0;
					wb_ack <= 1'b1;
					state <= DONE;
				end
				else begin
					sci_stb_delay <= sci_stb_delay - 1;
					state <= RDATA;
				end 
			end
			
			DONE: begin
				wb_ack <= 1'b0;							// Set the WB Strobe back to 0
				state <= IDLE;							// Release the WB bus and goes IDLE
			end
			
			default : state <= IDLE;
			endcase
		end
	end
	
	assign WB_ACK_O = wb_ack & ~RST_I;
	assign WB_DAT_O = sci_rdata & {8{~RST_I}};
	
endmodule
