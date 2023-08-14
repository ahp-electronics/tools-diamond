#$Header: L:/module/pci_asi/gui/rcs/core_template.tcl 1.5 2005/12/27 01:52:25Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
} 

proc ChangeValueCmd {}  {
	global Para
	if {$Para(MODE) == "PCIE"}  {
		.cboNoofBVC configure -state disabled
		.cboNoofOVC configure -state disabled
		.cboNoofMVC configure -state disabled
		.lblNoofBVC config -state disabled
		.lblNoofOVC config -state disabled
		.lblNoofMVC config -state disabled
	} else  {
		.cboNoofBVC configure -state normal
		.cboNoofOVC configure -state normal
		.cboNoofMVC configure -state normal
		.lblNoofBVC config -state normal
		.lblNoofOVC config -state normal
		.lblNoofMVC config -state normal
	} 
} 

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para
	ChangeValueCmd
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para

	return 0
}

proc PCIEParaFile {} {
	global Para
	set outFile [file join $Para(ProjectPath) "flxmc_PCIE_param.v"]
	if [catch {open $outFile w} fileId] {
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}

	#ISPL_CR_29510
	puts $fileId "//Parameter file for PCIE mode\n"
	puts $fileId "parameter SMI_OFFSET=11'h440;//This value can be changed per user\n"
	puts $fileId "`define	PCIE\n"
	puts $fileId "`define	SDK\n"
	puts $fileId "`define	LANE_WIDTH $Para(LANE_WIDTH)\n"
	puts $fileId "`define	LW$Para(LANE_WIDTH)\n"
	if {$Para(DWN_STRM_LANE) == 1}  {puts $fileId "`define	DWN_STRM_LANE\n"} 
	if {$Para(DWN_STRM_PORT) == 1}  {puts $fileId "`define	DWN_STRM_PORT\n"} 
	puts $fileId "`define	$Para(COM_TYPE)_COMP\n"
	puts $fileId "`define	MAX_TLP_$Para(BUF_SIZE)\n"

	puts $fileId "parameter cfg_sysclk_sel=1'b0; //select FPGA clock
parameter protocol_mode=3'b000; // PCIE protocol
parameter thrshld=16'd64;
parameter framer_k_3_5=9'h1bc;
parameter framer_k_3_4=9'h11c;
parameter framer_k_3_3=9'h000;
parameter framer_k_3_2_8_5=4'b1_111;
parameter framer_k_3_2_4_0=5'b1_1110;
parameter cfg_lane_0_match_1_reg_0 = 9'h1fb;
parameter cfg_lane_0_match_1_reg_1 = 9'h000;
parameter cfg_lane_0_match_2_reg_0 = 9'h15c;
parameter cfg_lane_0_match_2_reg_1 = 9'h000;
parameter cfg_lane_1_match_1_reg_0 = 9'h040;
parameter cfg_lane_1_match_1_reg_1 = 9'h050;
parameter cfg_lane_1_match_2_reg_0 = 9'h060;
parameter cfg_lane_1_match_2_reg_1 = 9'h000;
parameter cfg_lane_2_match_1_reg_0 = 9'h000;
parameter cfg_lane_2_match_1_reg_1 = 9'h000;
parameter cfg_lane_2_match_2_reg_0 = 9'h000;
parameter cfg_lane_2_match_2_reg_1 = 9'h000;
parameter cfg_lane_3_match_1_reg_0 = 9'h1fd;
parameter cfg_lane_3_match_1_reg_1 = 9'h000;
parameter cfg_lane_3_match_2_reg_0 = 9'h1fe;
parameter cfg_lane_3_match_2_reg_1 = 9'h000;
parameter cfg_pad = 32'd0;
parameter framer_k_0_0 = 9'h1fb;
parameter framer_k_0_1 = 9'h15c;
parameter framer_k_0_2 = 9'h1fe;
parameter framer_k_0_3 = 9'h000;
parameter framer_k_0_4 = 9'h11c;
parameter framer_k_0_5 = 9'h1bc;
parameter framer_k_1_0 = 9'h000;
parameter framer_k_1_1 = 9'h000;
parameter framer_k_1_2 = 9'h1fe;
parameter framer_k_1_3 = 9'h000;
parameter framer_k_1_4 = 9'h11c;
parameter framer_k_1_5 = 9'h1bc;
parameter framer_k_2_0 = 9'h000;
parameter framer_k_2_1 = 9'h000;
parameter framer_k_2_2 = 9'h1fe;
parameter framer_k_2_3 = 9'h000;
parameter framer_k_2_4 = 9'h11c;
parameter framer_k_2_5 = 9'h1bc;
parameter framer_k_3_0 = 9'h000;
parameter framer_k_3_1 = 9'h1fd;

//INITVAL FOR TX MICROCODE MACO RAM A
parameter A_INITVAL_00 = 40'h8D98B6D800;
parameter A_INITVAL_01 = 40'h8968B6D800;
parameter A_INITVAL_02 = 40'h0007B6D840;
parameter A_INITVAL_03 = 40'h0007FFCA50;
parameter A_INITVAL_04 = 40'h00079DB840;
parameter A_INITVAL_05 = 40'h0007FFCB50;
parameter A_INITVAL_06 = 40'h00079DB840;
parameter A_INITVAL_07 = 40'h0007FFCC50;
parameter A_INITVAL_08 = 40'h00079DB840;
parameter A_INITVAL_09 = 40'h561FB6D840;
parameter A_INITVAL_0A = 40'h0007FFCD50;
parameter A_INITVAL_0B = 40'h00079DB840;
parameter A_INITVAL_0C = 40'h0007FFCE50;
parameter A_INITVAL_0D = 40'h00079DB840;
parameter A_INITVAL_0E = 40'h0007FFCF50;
parameter A_INITVAL_0F = 40'h00079DB840;
parameter A_INITVAL_10 = 40'h5A57B6D840;
parameter A_INITVAL_11 = 40'h6288B6D842;
parameter A_INITVAL_12 = 40'h0000FFFFFF;
parameter A_INITVAL_13 = 40'hC0B7B6D844;
parameter A_INITVAL_14 = 40'hC12FB6D844;
parameter A_INITVAL_15 = 40'h0000FFFFFF;
parameter A_INITVAL_16 = 40'hC0BFFFC04C;
parameter A_INITVAL_17 = 40'h52BF7FF84C;
parameter A_INITVAL_18 = 40'hC0FFEFF848;
parameter A_INITVAL_19 = 40'h4927EFF848;
parameter A_INITVAL_1A = 40'h628F9DB044;
parameter A_INITVAL_1B = 40'h0000FFFFFF;
parameter A_INITVAL_1C = 40'hC0BFFFC04C;
parameter A_INITVAL_1D = 40'h4137FFC850;
parameter A_INITVAL_1E = 40'hC08F9DB840;
parameter A_INITVAL_1F = 40'h688FADB040;
parameter A_INITVAL_20 = 40'h0000FFFFFF;
parameter A_INITVAL_21 = 40'hC0B7B6D844;
parameter A_INITVAL_22 = 40'hC12FFFC854;
parameter A_INITVAL_23 = 40'h0000FFFFFF;
parameter A_INITVAL_24 = 40'hC08F9DB040;
parameter A_INITVAL_25 = 40'h48F7FFC850;
parameter A_INITVAL_26 = 40'h628F9DB844;
parameter A_INITVAL_27 = 40'h0000FFFFFF;
parameter A_INITVAL_28 = 40'hC0BFFFC04C;
parameter A_INITVAL_29 = 40'hC0F7FFC850;
parameter A_INITVAL_2A = 40'h0000FFFFFF;
parameter A_INITVAL_2B = 40'hC08F9DB840;
parameter A_INITVAL_2C = 40'h0000800000;
parameter A_INITVAL_2D = 40'h0007FFC970;
parameter A_INITVAL_2E = 40'h688F9DB840;
parameter A_INITVAL_2F = 40'h0000FFFFFF;
parameter A_INITVAL_30 = 40'hC0B7B6D844;
parameter A_INITVAL_31 = 40'hC0F7FFC854;
parameter A_INITVAL_32 = 40'h0000FFFFFF;
parameter A_INITVAL_33 = 40'h448FC92801;
parameter A_INITVAL_34 = 40'h4C8FC92000;
parameter A_INITVAL_35 = 40'h0007C92000;
parameter A_INITVAL_36 = 40'hC08FC92000;
parameter A_INITVAL_37 = 40'h0000800000;
parameter A_INITVAL_38 = 40'h0000800000;
parameter A_INITVAL_39 = 40'h0000800000;
parameter A_INITVAL_3A = 40'h0000800000;
parameter A_INITVAL_3B = 40'h0000800000;
parameter A_INITVAL_3C = 40'h0000800000;
parameter A_INITVAL_3D = 40'h0000800000;
parameter A_INITVAL_3E = 40'h0000800000;
parameter A_INITVAL_3F = 40'hC000B6D800;

//INITVAL FOR RX MICROCODE MACO RAM B
parameter B_INITVAL_00 = 40'h8893800000;
parameter B_INITVAL_01 = 40'h8C8B800000;
parameter B_INITVAL_02 = 40'h4617800602;
parameter B_INITVAL_03 = 40'h0007952000;
parameter B_INITVAL_04 = 40'h4627800606;
parameter B_INITVAL_05 = 40'h0007952000;
parameter B_INITVAL_06 = 40'h463780060A;
parameter B_INITVAL_07 = 40'h0007952000;
parameter B_INITVAL_08 = 40'h7647A00000;
parameter B_INITVAL_09 = 40'h0000FFFFFF;
parameter B_INITVAL_0A = 40'hC06FF88000;
parameter B_INITVAL_0B = 40'hC087F52000;
parameter B_INITVAL_0C = 40'h0000FFFFFF;
parameter B_INITVAL_0D = 40'h526F708000;
parameter B_INITVAL_0E = 40'hC084F02000;
parameter B_INITVAL_0F = 40'hC084F20000;
parameter B_INITVAL_10 = 40'h4E80E00000;
parameter B_INITVAL_11 = 40'hC084F52000;
parameter B_INITVAL_12 = 40'hC09CF88000;
parameter B_INITVAL_13 = 40'h529C708000;
parameter B_INITVAL_14 = 40'hC084F02000;
parameter B_INITVAL_15 = 40'hC084F20000;
parameter B_INITVAL_16 = 40'h0000800000;
parameter B_INITVAL_17 = 40'h0000800000;
parameter B_INITVAL_18 = 40'h0000800000;
parameter B_INITVAL_19 = 40'h0000800000;
parameter B_INITVAL_1A = 40'h0000800000;
parameter B_INITVAL_1B = 40'h0000800000;
parameter B_INITVAL_1C = 40'h0000800000;
parameter B_INITVAL_1D = 40'h0000800000;
parameter B_INITVAL_1E = 40'h0000800000;
parameter B_INITVAL_1F = 40'h0000800000;
parameter B_INITVAL_20 = 40'h0000800000;
parameter B_INITVAL_21 = 40'h0000800000;
parameter B_INITVAL_22 = 40'h0000800000;
parameter B_INITVAL_23 = 40'h0000800000;
parameter B_INITVAL_24 = 40'h0000800000;
parameter B_INITVAL_25 = 40'h0000800000;
parameter B_INITVAL_26 = 40'h0000800000;
parameter B_INITVAL_27 = 40'h0000800000;
parameter B_INITVAL_28 = 40'h0000800000;
parameter B_INITVAL_29 = 40'h0000800000;
parameter B_INITVAL_2A = 40'h0000800000;
parameter B_INITVAL_2B = 40'h0000800000;
parameter B_INITVAL_2C = 40'h0000800000;
parameter B_INITVAL_2D = 40'h0000800000;
parameter B_INITVAL_2E = 40'h0000800000;
parameter B_INITVAL_2F = 40'h0000800000;
parameter B_INITVAL_30 = 40'h0000800000;
parameter B_INITVAL_31 = 40'h0000800000;
parameter B_INITVAL_32 = 40'h0000800000;
parameter B_INITVAL_33 = 40'h0000800000;
parameter B_INITVAL_34 = 40'h0000800000;
parameter B_INITVAL_35 = 40'h0000800000;
parameter B_INITVAL_36 = 40'h0000800000;
parameter B_INITVAL_37 = 40'h0000800000;
parameter B_INITVAL_38 = 40'h0000800000;
parameter B_INITVAL_39 = 40'h0000800000;
parameter B_INITVAL_3A = 40'h0000800000;
parameter B_INITVAL_3B = 40'h0000800000;
parameter B_INITVAL_3C = 40'h0000800000;
parameter B_INITVAL_3D = 40'h0000800000;
parameter B_INITVAL_3E = 40'h0000800000;
parameter B_INITVAL_3F = 40'hC003800000;"

	close $fileId
	return 0
}

proc ASIParaFile {} {
	global Para
	set outFile [file join $Para(ProjectPath) "flxmc_ASI_param.v"]
	if [catch {open $outFile w} fileId] {
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}

	puts $fileId "//Parameter file for ASI mode\n
parameter SMI_OFFSET = 11'h440 ; //This value can be changed per user\n"
	puts $fileId "`define	ASI\n"
	puts $fileId "`define	SDK\n"
	puts $fileId "`define	LANE_WIDTH $Para(LANE_WIDTH)\n"
	puts $fileId "`define	LW$Para(LANE_WIDTH)\n"
	if {$Para(DWN_STRM_LANE) == 1}  {puts $fileId "`define	DWN_STRM_LANE\n"} 
	if {$Para(DWN_STRM_PORT) == 1}  {puts $fileId "`define	DWN_STRM_PORT\n"} 
	puts $fileId "`define	$Para(COM_TYPE)_COMP\n"
	puts $fileId "`define	MAX_TLP_$Para(BUF_SIZE)\n"
	puts $fileId "`define	NUM_BVC $Para(NoofBVC)\n"
	if {$Para(NoofOVC) == 0}  {
		puts $fileId "`define	OVC0"
		puts $fileId "`define	NUM_OVC $Para(NoofOVC)\n"
	} else  {
		puts $fileId "`define	NUM_OVC $Para(NoofOVC)\n"
	} 
	if {$Para(NoofMVC) == 0}  {
		puts $fileId "`define	MVC0"
		puts $fileId "`define	NUM_MVC $Para(NoofMVC)\n"
	} else  {
		puts $fileId "`define	NUM_MVC $Para(NoofMVC)\n"
	} 

	puts $fileId "parameter cfg_sysclk_sel=1'b0; //select FPGA clock
parameter protocol_mode=3'b001; // ASI protocol
parameter thrshld=16'd64;
parameter framer_k_3_5=9'h1bc;
parameter framer_k_3_4=9'h11c;
parameter framer_k_3_3=9'h000;
parameter framer_k_3_2_8_5=4'b1111;
parameter framer_k_3_2_4_0=5'b10111;
parameter cfg_lane_0_match_1_reg_0 = 9'h1fb;
parameter cfg_lane_0_match_1_reg_1 = 9'h000;
parameter cfg_lane_0_match_2_reg_0 = 9'h15c;
parameter cfg_lane_0_match_2_reg_1 = 9'h000;
parameter cfg_lane_1_match_1_reg_0 = 9'h040;
parameter cfg_lane_1_match_1_reg_1 = 9'h050;
parameter cfg_lane_1_match_2_reg_0 = 9'h060;
parameter cfg_lane_1_match_2_reg_1 = 9'h000;
parameter cfg_lane_2_match_1_reg_0 = 9'h000;
parameter cfg_lane_2_match_1_reg_1 = 9'h000;
parameter cfg_lane_2_match_2_reg_0 = 9'h000;
parameter cfg_lane_2_match_2_reg_1 = 9'h000;
parameter cfg_lane_3_match_1_reg_0 = 9'h1fd;
parameter cfg_lane_3_match_1_reg_1 = 9'h000;
parameter cfg_lane_3_match_2_reg_0 = 9'h1fe;
parameter cfg_lane_3_match_2_reg_1 = 9'h000;
parameter cfg_pad = 32'd0;
parameter framer_k_0_0 = 9'h1fb;
parameter framer_k_0_1 = 9'h15c;
parameter framer_k_0_2 = 9'h1fe;
parameter framer_k_0_3 = 9'h000;
parameter framer_k_0_4 = 9'h11c;
parameter framer_k_0_5 = 9'h1bc;
parameter framer_k_1_0 = 9'h000;
parameter framer_k_1_1 = 9'h000;
parameter framer_k_1_2 = 9'h1fe;
parameter framer_k_1_3 = 9'h000;
parameter framer_k_1_4 = 9'h11c;
parameter framer_k_1_5 = 9'h1bc;
parameter framer_k_2_0 = 9'h000;
parameter framer_k_2_1 = 9'h000;
parameter framer_k_2_2 = 9'h1fe;
parameter framer_k_2_3 = 9'h000;
parameter framer_k_2_4 = 9'h11c;
parameter framer_k_2_5 = 9'h1bc;
parameter framer_k_3_0 = 9'h000;
parameter framer_k_3_1 = 9'h1fd;

//INITVAL FOR TX MICROCODE MACO RAM A
parameter A_INITVAL_00 = 40'h8D98B6D800 ;
parameter A_INITVAL_01 = 40'h8968B6D800 ;
parameter A_INITVAL_02 = 40'h6210B6D840 ;
parameter A_INITVAL_03 = 40'h0000F7FFFF ;
parameter A_INITVAL_04 = 40'hC03FB6D844 ;
parameter A_INITVAL_05 = 40'hC0B7B6D844 ;
parameter A_INITVAL_06 = 40'h0000F7FFFF ;
parameter A_INITVAL_07 = 40'hC047F7C04C ;
parameter A_INITVAL_08 = 40'h524777F84C ;
parameter A_INITVAL_09 = 40'hC087E7F848 ;
parameter A_INITVAL_0A = 40'h48AFE7F848 ;
parameter A_INITVAL_0B = 40'h621795B044 ;
parameter A_INITVAL_0C = 40'h0000F7FFFF ;
parameter A_INITVAL_0D = 40'hC047F7C04C ;
parameter A_INITVAL_0E = 40'h40BFF7C850 ;
parameter A_INITVAL_0F = 40'hC01795B840 ;
parameter A_INITVAL_10 = 40'h6817A5B040 ;
parameter A_INITVAL_11 = 40'h0000F7FFFF ;
parameter A_INITVAL_12 = 40'hC03FB6D844 ;
parameter A_INITVAL_13 = 40'hC0B7F7C854 ;
parameter A_INITVAL_14 = 40'h0000F7FFFF ;
parameter A_INITVAL_15 = 40'hC01795B040 ;
parameter A_INITVAL_16 = 40'h487FF7C850 ;
parameter A_INITVAL_17 = 40'h621795B844 ;
parameter A_INITVAL_18 = 40'h0000F7FFFF ;
parameter A_INITVAL_19 = 40'hC047F7C04C ;
parameter A_INITVAL_1A = 40'hC07FF7C850 ;
parameter A_INITVAL_1B = 40'h0000F7FFFF ;
parameter A_INITVAL_1C = 40'hC01795B840 ;
parameter A_INITVAL_1D = 40'h0000800000 ;
parameter A_INITVAL_1E = 40'h0000800000 ;
parameter A_INITVAL_1F = 40'h0000800000 ;
parameter A_INITVAL_20 = 40'h0000800000 ;
parameter A_INITVAL_21 = 40'h0000800000 ;
parameter A_INITVAL_22 = 40'h0000800000 ;
parameter A_INITVAL_23 = 40'h0000800000 ;
parameter A_INITVAL_24 = 40'h0000800000 ;
parameter A_INITVAL_25 = 40'h0000800000 ;
parameter A_INITVAL_26 = 40'h0000800000 ;
parameter A_INITVAL_27 = 40'h0000800000 ;
parameter A_INITVAL_28 = 40'h0000800000 ;
parameter A_INITVAL_29 = 40'h0000800000 ;
parameter A_INITVAL_2A = 40'h0000800000 ;
parameter A_INITVAL_2B = 40'h0000800000 ;
parameter A_INITVAL_2C = 40'h0000800000 ;
parameter A_INITVAL_2D = 40'h0007F7C970 ;
parameter A_INITVAL_2E = 40'h681795B840 ;
parameter A_INITVAL_2F = 40'h0000F7FFFF ;
parameter A_INITVAL_30 = 40'hC03FB6D844 ;
parameter A_INITVAL_31 = 40'hC07FF7C854 ;
parameter A_INITVAL_32 = 40'h0000F7FFFF ;
parameter A_INITVAL_33 = 40'h4417C12801 ;
parameter A_INITVAL_34 = 40'h4C17C12000 ;
parameter A_INITVAL_35 = 40'h0007C12000 ;
parameter A_INITVAL_36 = 40'hC017C12000 ;
parameter A_INITVAL_37 = 40'h0000800000 ;
parameter A_INITVAL_38 = 40'h0000800000 ;
parameter A_INITVAL_39 = 40'h0000800000 ;
parameter A_INITVAL_3A = 40'h0000800000 ;
parameter A_INITVAL_3B = 40'h0000800000 ;
parameter A_INITVAL_3C = 40'h0000800000 ;
parameter A_INITVAL_3D = 40'h0000800000 ;
parameter A_INITVAL_3E = 40'h0000800000 ;
parameter A_INITVAL_3F = 40'hC000B6D800 ;

//INITVAL FOR RX MICROCODE MACO RAM B
parameter B_INITVAL_00 = 40'h8863800000 ;
parameter B_INITVAL_01 = 40'h8C5B800000 ;
parameter B_INITVAL_02 = 40'h7617800000 ;
parameter B_INITVAL_03 = 40'h0000F7FFFF ;
parameter B_INITVAL_04 = 40'hC03F908000 ;
parameter B_INITVAL_05 = 40'hC057952000 ;
parameter B_INITVAL_06 = 40'h0000F7FFFF ;
parameter B_INITVAL_07 = 40'h523F108000 ;
parameter B_INITVAL_08 = 40'hC054902000 ;
parameter B_INITVAL_09 = 40'hC054920000 ;
parameter B_INITVAL_0A = 40'h4E54800000 ;
parameter B_INITVAL_0B = 40'hC054952000 ;
parameter B_INITVAL_0C = 40'hC06C908000 ;
parameter B_INITVAL_0D = 40'h526C108000 ;
parameter B_INITVAL_0E = 40'hC054902000 ;
parameter B_INITVAL_0F = 40'hC054920000 ;
parameter B_INITVAL_10 = 40'h0000800000 ;
parameter B_INITVAL_11 = 40'h0000800000 ;
parameter B_INITVAL_12 = 40'h0000800000 ;
parameter B_INITVAL_13 = 40'h0000800000 ;
parameter B_INITVAL_14 = 40'h0000800000 ;
parameter B_INITVAL_15 = 40'h0000800000 ;
parameter B_INITVAL_16 = 40'h0000800000 ;
parameter B_INITVAL_17 = 40'h0000800000 ;
parameter B_INITVAL_18 = 40'h0000800000 ;
parameter B_INITVAL_19 = 40'h0000800000 ;
parameter B_INITVAL_1A = 40'h0000800000 ;
parameter B_INITVAL_1B = 40'h0000800000 ;
parameter B_INITVAL_1C = 40'h0000800000 ;
parameter B_INITVAL_1D = 40'h0000800000 ;
parameter B_INITVAL_1E = 40'h0000800000 ;
parameter B_INITVAL_1F = 40'h0000800000 ;
parameter B_INITVAL_20 = 40'h0000800000 ;
parameter B_INITVAL_21 = 40'h0000800000 ;
parameter B_INITVAL_22 = 40'h0000800000 ;
parameter B_INITVAL_23 = 40'h0000800000 ;
parameter B_INITVAL_24 = 40'h0000800000 ;
parameter B_INITVAL_25 = 40'h0000800000 ;
parameter B_INITVAL_26 = 40'h0000800000 ;
parameter B_INITVAL_27 = 40'h0000800000 ;
parameter B_INITVAL_28 = 40'h0000800000 ;
parameter B_INITVAL_29 = 40'h0000800000 ;
parameter B_INITVAL_2A = 40'h0000800000 ;
parameter B_INITVAL_2B = 40'h0000800000 ;
parameter B_INITVAL_2C = 40'h0000800000 ;
parameter B_INITVAL_2D = 40'h0000800000 ;
parameter B_INITVAL_2E = 40'h0000800000 ;
parameter B_INITVAL_2F = 40'h0000800000 ;
parameter B_INITVAL_30 = 40'h0000800000 ;
parameter B_INITVAL_31 = 40'h0000800000 ;
parameter B_INITVAL_32 = 40'h0000800000 ;
parameter B_INITVAL_33 = 40'h0000800000 ;
parameter B_INITVAL_34 = 40'h0000800000 ;
parameter B_INITVAL_35 = 40'h0000800000 ;
parameter B_INITVAL_36 = 40'h0000800000 ;
parameter B_INITVAL_37 = 40'h0000800000 ;
parameter B_INITVAL_38 = 40'h0000800000 ;
parameter B_INITVAL_39 = 40'h0000800000 ;
parameter B_INITVAL_3A = 40'h0000800000 ;
parameter B_INITVAL_3B = 40'h0000800000 ;
parameter B_INITVAL_3C = 40'h0000800000 ;
parameter B_INITVAL_3D = 40'h0000800000 ;
parameter B_INITVAL_3E = 40'h0000800000 ;
parameter B_INITVAL_3F = 40'hC003800000 ;"

	close $fileId
	return 0
}

proc WriteParamFile {} {
	global Para
	switch $Para(MODE)  {
		PCIE {set ret [PCIEParaFile]}
		ASI  {set ret [ASIParaFile ]}
	} 
	return $ret
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para pin_flag

	set ret [CheckParameterCB]
	if {$ret == -1} {return -1}

	set ret [WriteParamFile]
	if {$ret == -1} {return -1}

	if {$Para(MODE) == "PCIE"}  {
		set para_file "flxmc_PCIE_param.v"
	} else  {
		set para_file "flxmc_ASI_param.v"
	} 
	set out_msg "\tModule Name: $Para(ModuleName)\n\tCore Name: $Para(CoreName)\n\tLPC file : $Para(ModuleName).lpc"
	append out_msg "\n\tParameter File : $para_file"
	append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"

	set pin_flag orcapp

	return $out_msg
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	#*** set private value ***


	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface
	AttributeSetting 480 300
	set pin_flag 2
	DrawImage 190 250 
	set tnb $Para(tnb)

	$tnb delete 0

	#*** Here for user to add extra pages ***
	set page [$tnb add -label "Configuration"]
	iwidgets::Labeledframe .frmProperties ;
	set frmProperty [.frmProperties childsite]

	CreateRadioItem $frmProperty Mode "" 20 "PCI-Express" PCIE "ASI" ASI 16 left Para(MODE) {ChangeValueCmd}
	#ISPL_CR_29317
	.rdo2Mode config -state disabled
	
	set frmSetting [frame .frmSetting]
	#PCI Setting
	iwidgets::Labeledframe .frmPCI -labeltext "LTSSM + TXTP Options" -labelpos nw
	set frmPCI [.frmPCI childsite]
	CreateLabelCombobox $frmPCI LANE_WIDTH "Lane Width" 20 4 Para(LANE_WIDTH) {1 2 4}
	.lblLANE_WIDTH config -anchor w
	checkbutton .cbDWN_STRM_LANE  -text "Downstream Lane" -variable Para(DWN_STRM_LANE) -command {}
	checkbutton .cbDWN_STRM_PORT  -text "Downstream Port" -variable Para(DWN_STRM_PORT) -command {}
	pack .cbDWN_STRM_LANE .cbDWN_STRM_PORT -in $frmPCI -side top -anchor w -padx 6 -pady 2
	CreateLabelCombobox $frmPCI COM_TYPE "Component Type" 20 10 Para(COM_TYPE) {ENDPOINT SWITCH ROOT}
	.lblCOM_TYPE config -anchor w
	CreateLabelCombobox $frmPCI BUF_SIZE "Retry+TLP Buffer Size" 20 4 Para(BUF_SIZE) {1K 2K 4K}
	.lblBUF_SIZE config -anchor w

	#ASI Setting
	iwidgets::Labeledframe .frmASI -labeltext "ASI Options" -labelpos nw
	set frmASI [.frmASI childsite]
	#ISPL_CR_29506
	CreateLabelCombobox $frmASI NoofBVC "No. of BVC" 12 4 Para(NoofBVC) {1 2 3 4 5 6 7 8}
	CreateLabelCombobox $frmASI NoofOVC "No. of OVC" 12 4 Para(NoofOVC) {0 1 2 3 4 5 6 7 8}
	CreateLabelCombobox $frmASI NoofMVC "No. of MVC" 12 4 Para(NoofMVC) {0 1 2 3 4}
	.lblNoofBVC config -anchor w
	.lblNoofOVC config -anchor w
	.lblNoofMVC config -anchor w

	pack .frmPCI .frmASI -in $frmSetting -side left -fill both
	pack .frmSetting -in $frmProperty -side top -fill x
	pack .frmProperties -in $page  -fill both -expand true 

	$tnb view 0
	ChangeValueCmd

	#*** Public Template Functions ***
	GeneralConfig
}
