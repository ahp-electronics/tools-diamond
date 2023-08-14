#$Header: L:/module/pcs/latticeecp2m/gui/rcs/core_template.tcl 1.77 2009/10/21 06:04:19Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc InitDataSet {} {
	global Para

	set Para(Plus) "1100000101"
	set Para(Minus) "0011111010"
	set Para(Mask) "1111111111"
	
	set Para(CTCCh0) NORMAL
	set Para(CTCCh1) NORMAL
	set Para(CTCCh2) NORMAL
	set Para(CTCCh3) NORMAL
	
	switch $Para(mode) {
		"PCI-Express" {
			set Para(CC_MATCH1) 0000000000
			set Para(CC_MATCH2) 0000000000
			set Para(CC_MATCH3) 0000000000
			set Para(CC_MATCH4) 0100011100
		}
		"PCI-Express (PIPE)" {
			set Para(CC_MATCH1) 0000000000
			set Para(CC_MATCH2) 0000000000
			set Para(CC_MATCH3) 0000000000
			set Para(CC_MATCH4) 0100011100
		}
		"Gigabit Ethernet" {
			set Para(CC_MATCH1) 0000000000
			set Para(CC_MATCH2) 0000000000
			set Para(CC_MATCH3) "0110111100"
			set Para(CC_MATCH4) "0001010000"
		}
		"Generic 8B10B" {
			set Para(CTCCh0) BYPASS
			set Para(CTCCh1) BYPASS
			set Para(CTCCh2) BYPASS
			set Para(CTCCh3) BYPASS
		}
		"10-bit SERDES Only" {
			set Para(CTCCh0) BYPASS
			set Para(CTCCh1) BYPASS
			set Para(CTCCh2) BYPASS
			set Para(CTCCh3) BYPASS
			
			set Para(Align) BYPASS
		}
		"8-bit SERDES Only" {
			set Para(CTCCh0) BYPASS
			set Para(CTCCh1) BYPASS
			set Para(CTCCh2) BYPASS
			set Para(CTCCh3) BYPASS
		}
		"User Defined" {}
		"SD-SDI" {
			set Para(CTCCh0) BYPASS
			set Para(CTCCh1) BYPASS
			set Para(CTCCh2) BYPASS
			set Para(CTCCh3) BYPASS
		}
		"HD-SDI" {
			set Para(CTCCh0) BYPASS
			set Para(CTCCh1) BYPASS
			set Para(CTCCh2) BYPASS
			set Para(CTCCh3) BYPASS
		}
		"SATA I" {
			set Para(CC_MATCH1) "0110111100"
			set Para(CC_MATCH2) "0001001010"
			set Para(CC_MATCH3) "0001001010"
			set Para(CC_MATCH4) "0001111011"
		}
		"CPRI" {
			set Para(CTCCh0) BYPASS
			set Para(CTCCh1) BYPASS
			set Para(CTCCh2) BYPASS
			set Para(CTCCh3) BYPASS
		}
		default {}
	}
}

proc ChangeClkRateCmd {} {
	global Para pin_flag
	
	#test
	if {$Para(Protocol) == "Quad"} {
	} else {
	}

	switch $Para(ClkMult)  {
		8XH {set mult 4}
		10XH {set mult 5}
		8X {set mult 8}
		10X {set mult 10}
		16X {set mult 16}
		20X {set mult 20}
		25X {set mult 25}
	} 
	if {[string is double -strict $Para(ClkRate)] == 1} {
		set Para(CalClkRate) [expr $Para(ClkRate)*1000/$mult]
		set Para(ClkRateH) [expr $Para(ClkRate)*1.0/2]
		set Para(CalClkRateH) [expr $Para(ClkRateH)*1000/$mult*2]
	} else {
		set Para(CalClkRate) 0
		set Para(ClkRateH) 0
		set Para(CalClkRateH) 0
	}

	# Usage Model v1.6
	if {$Para(mode) == "8-bit SERDES Only" || $Para(mode) == "User Defined"} {
		set datawidth $Para(DataWidth)
	} else {
		if {$Para(DataWidth) <= 10} {
			set datawidth 10
		}  else {
			set datawidth 20
		}
	}
	
	if {[string is double -strict $Para(ClkRate)] == 1} {
		set Para(FPGAClkRate) [expr $Para(ClkRate)*1000/$datawidth]
	} else {
		set Para(FPGAClkRate) 0
	}

	#Half Rate Setting
	#Rev 4.3 - Tab2_1. Note 5.
	#set Para(ClkMultH) [expr $mult/2.0]X
	if {$mult == 4 || $mult == 5} {
		set Para(ClkMultH) "N/A"
		#set Para(DataWidthH) "N/A"
	} else {
		set Para(ClkMultH) [expr $mult]XH
		if {$Para(mode) == "8-bit SERDES Only" || $Para(mode) == "User Defined"} {
			set datawidth $Para(DataWidthH)
		} else {
			if {$Para(DataWidthH) <= 10} {
				set datawidth 10
			}  else {
				set datawidth 20
			}
		}
		if {[string is double -strict $Para(ClkRateH)] == 1} {
			set Para(FPGAClkRateH) [expr $Para(ClkRateH)*1000/$datawidth]
		} else {
			set Para(FPGAClkRateH) 0
		}
	}
}

proc ChangeProtocolCmd {} {
	global Para
	
	#set mode_lst {PCI-Express "PCI-Express (PIPE)" "Gigabit Ethernet" "Generic 8B10B" "10-bit SERDES Only" "8-bit SERDES Only" "User Defined"}
	
	set tnb $Para(tnb)
	if {$Para(Protocol) == "Quad"} {
		$tnb pageconfigure 1 -state normal
		$tnb pageconfigure 2 -state disabled
		
		.cboMode clear list
		.cboMode insert list end PCI-Express "Gigabit Ethernet" "Generic 8B10B" "10-bit SERDES Only" "8-bit SERDES Only" SD-SDI HD-SDI CPRI
		
		for {set i 0} {$i<=3} {incr i}  {
			.rdo2Channel$i config -state normal
			.rdo3Channel$i config -state normal
			.lblRate$i config -state disable
			set Para(Rate$i) None
			.cboRate$i config -state disabled -foreground gray50
		}
	} else {
		$tnb pageconfigure 1 -state disabled
		$tnb pageconfigure 2 -state normal		

		.cboMode clear list
		.cboMode insert list end PCI-Express "Generic 8B10B" "10-bit SERDES Only" "8-bit SERDES Only"
		set mode_lst {PCI-Express "Generic 8B10B" "10-bit SERDES Only" "8-bit SERDES Only"}
		if {[lsearch $mode_lst $Para(mode)] == -1} {set Para(mode) "Generic 8B10B"}
		
		for {set i 0} {$i<=3} {incr i}  {
			if {$Para(Channel$i) == "GROUP1" || $Para(Channel$i) == "GROUP2"} {
				set Para(Channel$i) SINGLE
			}
			.rdo2Channel$i config -state disabled
			.rdo3Channel$i config -state disabled
			.cboRate$i config -state normal
			.cboRate$i clear list
			.cboRate$i insert list end "Full Rate" "Half Rate"
			if {$Para(Rate$i) == "None"} {set Para(Rate$i) "Full Rate"}
		}
	}
}

proc PCIE_set {} {
	global Para
	for {set i 0} {$i<=3} {incr i}  {
		if {$Para(Channel$i) == "GROUP1" || $Para(Channel$i) == "GROUP2"}  {
			.cboCTCCh$i clear list
			.cboCTCCh$i insert list end BYPASS
			set Para(CTCCh$i) BYPASS
		} else {
			.cboCTCCh$i clear list
			.cboCTCCh$i insert list end NORMAL
			set Para(CTCCh$i) NORMAL
		}
	}
}

proc ChangeChannelS_GCmd {} {
	global Para

	for {set i 0} {$i<=3} {incr i}  {
		.cbo_rx_los_port$i config -state disabled
		if {$Para(Channel$i) == "DISABLE"}  {
			.cboVCh$i config -state disabled -foreground gray50
			.cboPreCh$i config -state disabled -foreground gray50
			.cboTxCh$i config -state disabled -foreground gray50
			.cboEqCh$i config -state disabled -foreground gray50
			.cboRxTermCh$i config -state disabled -foreground gray50
			.cboRxCoupCh$i config -state disabled -foreground gray50
			.cboTxInvCh$i config -state disabled -foreground gray50
			.cboRxInvCh$i config -state disabled -foreground gray50
			.cboRxModeCh$i config -state disabled -foreground gray50
			.cboCTCCh$i config -state disabled -foreground gray50
			.lblRate$i config -state disable
			set Para(Rate$i) None
			.cboRate$i config -state disabled -foreground gray50
			
			set Para(_rx_los_port$i) "Internal"
		} else  {
			.cboVCh$i config -state normal -foreground black
			.cboPreCh$i config -state normal -foreground black
			.cboTxCh$i config -state normal -foreground black
			.cboEqCh$i config -state normal -foreground black
			.cboRxTermCh$i config -state normal -foreground black
			.cboRxCoupCh$i config -state normal -foreground black
			.cboTxInvCh$i config -state normal -foreground black
			.cboRxInvCh$i config -state normal -foreground black
			.cboRxModeCh$i config -state normal -foreground black
			.cboCTCCh$i config -state normal -foreground black
			if {$Para(Protocol) == "Channel"} {
				.lblRate$i config -state normal
				.cboRate$i config -state normal -foreground black
				.cboRate$i clear list
				.cboRate$i insert list end "Full Rate" "Half Rate"
				if {$Para(Rate$i) == "None"} {set Para(Rate$i) "Full Rate"}
			} else {
				.lblRate$i config -state disable
				set Para(Rate$i) None
				.cboRate$i config -state disabled -foreground gray50
			}
			
			if {$Para(_rst_gen) == "ENABLED"} {
				.cbo_rx_los_port$i config -state normal
			} else {
				set Para(_rx_los_port$i) "Internal"
			}
		} 
	}
		
	#CR_36836
	switch $Para(mode) {
		"PCI-Express" {PCIE_set}
		"PCI-Express (PIPE)" {}
		"Gigabit Ethernet" {}
		"Generic 8B10B" {}
		"10-bit SERDES Only" {}
		"8-bit SERDES Only" {}
		"User Defined" {}
		"SD-SDI" {}
		"HD-SDI" {}
		default {}
	}
}

proc ChangeLoopCmd {} {
	global Para
	
	if {$Para(Ports0) == "FALSE"}  {
		.rdo1Ports0 config -state disabled
		.rdo2Ports0 config -state disabled
		.rdo3Ports0 config -state disabled
	} else {
		.rdo1Ports0 config -state normal
		.rdo2Ports0 config -state normal
		.rdo3Ports0 config -state normal
	}
}

proc ChangeSCICmd {} {
	global Para
	if {$Para(Ports3) == "FALSE"}  {
		 .ckPorts3_1 config -state disable
		 set Para(Ports3_1) FALSE   
	} else  {
		 .ckPorts3_1 config -state normal
		 set Para(Ports3_1) TRUE   
	}  
}

proc InitClkRate {} {
	global Para
	switch $Para(mode) {
		"Gigabit Ethernet" {
			set Para(ClkRate) 1.25
			set Para(ClkRateH) 0.625
			set Para(ClkMult) 10X
			}
		"SD-SDI" {
			set Para(ClkRate) 0.27
			set Para(ClkRateH) 0.135
			set Para(ClkMult) 10X
			}
		"HD-SDI" {
			set Para(ClkRate) 1.4835
			set Para(ClkRateH) 0.7417
			set Para(ClkMult) 20X
			}
		"PCI-Express" -
		"PCI-Express (PIPE)" {
			set Para(ClkRate) 2.5
			set Para(ClkRateH) 1.25
			set Para(ClkMult) 25X
		}
		"Generic 8B10B" {
			set Para(ClkRate) 2.5
			set Para(ClkRateH) 1.25
			set Para(ClkMult) 10X
		}
		"10-bit SERDES Only" {
			set Para(ClkRate) 2.5
			set Para(ClkRateH) 1.25
			set Para(ClkMult) 10X
		}
		"8-bit SERDES Only" {
			set Para(ClkRate) 2.5
			set Para(ClkRateH) 1.25
			set Para(ClkMult) 8X
		}
		"SATA I" {
			set Para(ClkRate) 1.5
			set Para(ClkRateH) 0.75
			set Para(ClkMult) 10X
		}
		"CPRI" {
			set Para(ClkRate) 1.288
			set Para(ClkRateH) 0.644
			set Para(ClkMult) 10X
		}
		default {
			set Para(ClkRate) 2.5
			set Para(ClkRateH) 1.25
		}
	}
}

proc BSER8Setting {} {
	global Para
	
	if {$Para(Protocol) == "Quad"} {
		if {[lsearch {8XH 8X 16X} $Para(ClkMult)] == -1}  {
			set Para(ClkMult) 8X
		}
		.cboClkMult clear list
		.cboClkMult insert list end 8XH 8X 16X
	} else {
		if {[lsearch {8X 16X} $Para(ClkMult)] == -1}  {
			set Para(ClkMult) 8X
		}
		.cboClkMult clear list
		.cboClkMult insert list end 8X 16X
	}
	if {[lsearch {8 16} $Para(DataWidth)] == -1}  {
		set Para(DataWidth) 8
		set Para(DataWidthH) 8
	}
	.cboDataWidth clear list
	.cboDataWidth insert list end 8 16
	
	set Para(RxModeCh0) BYPASS
	set Para(RxModeCh1) BYPASS
	set Para(RxModeCh2) BYPASS
	set Para(RxModeCh3) BYPASS
	.cboRxModeCh0 clear list
	.cboRxModeCh1 clear list
	.cboRxModeCh2 clear list
	.cboRxModeCh3 clear list
	.cboRxModeCh0 insert list end "BYPASS"
	.cboRxModeCh1 insert list end "BYPASS"
	.cboRxModeCh2 insert list end "BYPASS"
	.cboRxModeCh3 insert list end "BYPASS"
	
	set Para(Align) BYPASS
	.cboAlign clear list
	.cboAlign insert list end BYPASS
	
	.entryPlus config -state normal
	.entryMinus config -state normal
	.entryMask config -state normal
	.entryCC_MATCH1 config -state normal
	.entryCC_MATCH2 config -state normal
	.entryCC_MATCH3 config -state normal
	.entryCC_MATCH4 config -state normal
	
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end BYPASS
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end BYPASS
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end BYPASS
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end BYPASS
	set Para(CTCCh0) BYPASS
	set Para(CTCCh1) BYPASS
	set Para(CTCCh2) BYPASS
	set Para(CTCCh3) BYPASS
}

proc BSER10Setting {} {
	global Para
	
	if {$Para(Protocol) == "Quad"} {
		if {[lsearch {10XH 10X 20X} $Para(ClkMult)] == -1}  {
			set Para(ClkMult) 10X
		}
		.cboClkMult clear list
		.cboClkMult insert list end 10XH 10X 20X
	} else {
		if {[lsearch {10X 20X} $Para(ClkMult)] == -1}  {
			set Para(ClkMult) 10X
		}
		.cboClkMult clear list
		.cboClkMult insert list end 10X 20X
	}
	if {[lsearch {10 20} $Para(DataWidth)] == -1}  {
		set Para(DataWidth) 10
		set Para(DataWidthH) 10
	}
	.cboDataWidth clear list
	.cboDataWidth insert list end 10 20
	
	set Para(RxModeCh0) BYPASS
	set Para(RxModeCh1) BYPASS
	set Para(RxModeCh2) BYPASS
	set Para(RxModeCh3) BYPASS
	.cboRxModeCh0 clear list
	.cboRxModeCh1 clear list
	.cboRxModeCh2 clear list
	.cboRxModeCh3 clear list
	.cboRxModeCh0 insert list end "BYPASS"
	.cboRxModeCh1 insert list end "BYPASS"
	.cboRxModeCh2 insert list end "BYPASS"
	.cboRxModeCh3 insert list end "BYPASS"
	
	#CR_34143
	#42866 BYPASS
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end BYPASS
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end BYPASS
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end BYPASS
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end BYPASS
	set Para(CTCCh0) BYPASS
	set Para(CTCCh1) BYPASS
	set Para(CTCCh2) BYPASS
	set Para(CTCCh3) BYPASS
	
	#set Para(Align) BYPASS
	.cboAlign clear list
	.cboAlign insert list end BYPASS AUTO DYNAMIC

	.entryPlus config -state normal
	.entryMinus config -state normal
	.entryMask config -state normal
	.entryCC_MATCH1 config -state normal
	.entryCC_MATCH2 config -state normal
	.entryCC_MATCH3 config -state normal
	.entryCC_MATCH4 config -state normal
}

proc G8B10BSetting {} {
	global Para
	
	if {$Para(Protocol) == "Quad"} {
		if {[lsearch {10XH 10X 20X} $Para(ClkMult)] == -1}  {
			set Para(ClkMult) 10X
		}
		.cboClkMult clear list
		.cboClkMult insert list end 10XH 10X 20X
	} else {
		if {[lsearch {10X 20X} $Para(ClkMult)] == -1}  {
			set Para(ClkMult) 10X
		}
		.cboClkMult clear list
		.cboClkMult insert list end 10X 20X
	}
	if {[lsearch {8 16} $Para(DataWidth)] == -1}  {
		set Para(DataWidth) 8
		set Para(DataWidthH) 8
	}
	.cboDataWidth clear list
	.cboDataWidth insert list end 8 16
	
	set Para(RxModeCh0) NORMAL
	set Para(RxModeCh1) NORMAL
	set Para(RxModeCh2) NORMAL
	set Para(RxModeCh3) NORMAL
	.cboRxModeCh0 clear list
	.cboRxModeCh1 clear list
	.cboRxModeCh2 clear list
	.cboRxModeCh3 clear list
	.cboRxModeCh0 insert list end "NORMAL"
	.cboRxModeCh1 insert list end "NORMAL"
	.cboRxModeCh2 insert list end "NORMAL"
	.cboRxModeCh3 insert list end "NORMAL"
	
	#CR_34143
	#42866 BYPASS
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end BYPASS
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end BYPASS
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end BYPASS
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end BYPASS
	set Para(CTCCh0) BYPASS
	set Para(CTCCh1) BYPASS
	set Para(CTCCh2) BYPASS
	set Para(CTCCh3) BYPASS
	
	.cboAlign clear list
	.cboAlign insert list end AUTO DYNAMIC
	if {[lsearch {AUTO DYNAMIC} $Para(Align)] == -1}  {
		set Para(Align) AUTO
	}
	
	.entryPlus config -state normal
	.entryMinus config -state normal
	.entryMask config -state normal
	.entryCC_MATCH1 config -state normal
	.entryCC_MATCH2 config -state normal
	.entryCC_MATCH3 config -state normal
	.entryCC_MATCH4 config -state normal
}

proc GIGESetting {} {
	global Para
	
	for {set i 0} {$i<=3} {incr i}  {
		if {$Para(Channel$i) == "GROUP1" || $Para(Channel$i) == "GROUP2"}  {
			set Para(Channel$i) SINGLE
		}
		.rdo2Channel$i config -state disable
		.rdo3Channel$i config -state disable
	}
	#set Para(Channel0) SINGLE
	#set Para(Channel1) SINGLE
	#set Para(Channel2) SINGLE
	#set Para(Channel3) SINGLE
	#.rdo2Channel0 config -state disable
	#.rdo2Channel1 config -state disable
	#.rdo2Channel2 config -state disable
	#.rdo2Channel3 config -state disable
	#.rdo3Channel0 config -state disable
	#.rdo3Channel1 config -state disable
	#.rdo3Channel2 config -state disable
	#.rdo3Channel3 config -state disable
	
	if {$Para(Protocol) == "Quad"} {
		if {[lsearch {10XH 10X 20X} $Para(ClkMult)] == -1}  {
			set Para(ClkMult) 10X
		}
		.cboClkMult clear list
		.cboClkMult insert list end 10XH 10X 20X
	} else {
		if {[lsearch {10X 20X} $Para(ClkMult)] == -1}  {
			set Para(ClkMult) 10X
		}
		.cboClkMult clear list
		.cboClkMult insert list end 10X 20X
	}
	if {[lsearch {8 16} $Para(DataWidth)] == -1}  {
		set Para(DataWidth) 8
		set Para(DataWidthH) 8
	}
	.cboDataWidth clear list
	.cboDataWidth insert list end 8 16
	
	if {[lsearch {DISABLE MID_MED LONG_MED} $Para(EqCh0)] == -1}  {
		set Para(EqCh0) "DISABLE"
	}
	if {[lsearch {DISABLE MID_MED LONG_MED} $Para(EqCh1)] == -1}  {
		set Para(EqCh1) "DISABLE"
	}
	if {[lsearch {DISABLE MID_MED LONG_MED} $Para(EqCh2)] == -1}  {
		set Para(EqCh2) "DISABLE"
	}
	if {[lsearch {DISABLE MID_MED LONG_MED} $Para(EqCh3)] == -1}  {
		set Para(EqCh3) "DISABLE"
	}
	.cboEqCh0 clear list
	.cboEqCh1 clear list
	.cboEqCh2 clear list
	.cboEqCh3 clear list
	.cboEqCh0 insert list end MID_MED LONG_MED DISABLE
	.cboEqCh1 insert list end MID_MED LONG_MED DISABLE
	.cboEqCh2 insert list end MID_MED LONG_MED DISABLE
	.cboEqCh3 insert list end MID_MED LONG_MED DISABLE

	set Para(RxModeCh0) NORMAL
	set Para(RxModeCh1) NORMAL
	set Para(RxModeCh2) NORMAL
	set Para(RxModeCh3) NORMAL
	.cboRxModeCh0 clear list
	.cboRxModeCh1 clear list
	.cboRxModeCh2 clear list
	.cboRxModeCh3 clear list
	.cboRxModeCh0 insert list end "NORMAL"
	.cboRxModeCh1 insert list end "NORMAL"
	.cboRxModeCh2 insert list end "NORMAL"
	.cboRxModeCh3 insert list end "NORMAL"
	
	set Para(CTCCh0) NORMAL
	set Para(CTCCh1) NORMAL
	set Para(CTCCh2) NORMAL
	set Para(CTCCh3) NORMAL
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end NORMAL
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end NORMAL
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end NORMAL
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end NORMAL
	
	set Para(Align) AUTO
	.cboAlign clear list
	.cboAlign insert list end AUTO
	
	set Para(MinIPG) 3
	set Para(High) 9
	set Para(Low) 7
	.cboMinIPG clear list
	.cboHigh clear list
	.cboLow clear list
	.cboMinIPG insert list end 3
	.cboHigh insert list end 9
	.cboLow insert list end 7
	
	#set Para(Plus) "1100000101"
	#set Para(Minus) "0011111010"
	#set Para(Mask) "1111111111"
	
	#set Para(CC_MATCH3) "0110111100"
	#set Para(CC_MATCH4) "0001010000"

	set Para(CC_MATCH_MODE) "MATCH_3_4"
	.cboCC_MATCH_MODE clear list
	.cboCC_MATCH_MODE insert list end MATCH_3_4
	
	.entryPlus config -state normal
	.entryMinus config -state normal
	.entryMask config -state normal
	.entryCC_MATCH1 config -state normal
	.entryCC_MATCH2 config -state normal
	.entryCC_MATCH3 config -state normal
	.entryCC_MATCH4 config -state normal

	#ISPL_CR_35673 
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end NORMAL
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end NORMAL
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end NORMAL
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end NORMAL
	set Para(CTCCh0) NORMAL
	set Para(CTCCh1) NORMAL
	set Para(CTCCh2) NORMAL
	set Para(CTCCh3) NORMAL
}

proc PCISetting {} {
	global Para

	if {[lsearch {DISABLE MID_HIGH LONG_HIGH} $Para(EqCh0)] == -1}  {
		set Para(EqCh0) "DISABLE"
	}
	if {[lsearch {DISABLE MID_HIGH LONG_HIGH} $Para(EqCh1)] == -1}  {
		set Para(EqCh1) "DISABLE"
	}
	if {[lsearch {DISABLE MID_HIGH LONG_HIGH} $Para(EqCh2)] == -1}  {
		set Para(EqCh2) "DISABLE"
	}
	if {[lsearch {DISABLE MID_HIGH LONG_HIGH} $Para(EqCh3)] == -1}  {
		set Para(EqCh3) "DISABLE"
	}
	.cboEqCh0 clear list
	.cboEqCh1 clear list
	.cboEqCh2 clear list
	.cboEqCh3 clear list
	.cboEqCh0 insert list end MID_HIGH LONG_HIGH DISABLE
	.cboEqCh1 insert list end MID_HIGH LONG_HIGH DISABLE
	.cboEqCh2 insert list end MID_HIGH LONG_HIGH DISABLE
	.cboEqCh3 insert list end MID_HIGH LONG_HIGH DISABLE

	if {[lsearch {10X 20X 25X} $Para(ClkMult)] == -1}  {
		set Para(ClkMult) 25X
	}
	if {[lsearch {8 16} $Para(DataWidth)] == -1}  {
		set Para(DataWidth) 8
		set Para(DataWidthH) 8
	}
	.cboClkMult clear list
	.cboClkMult insert list end 10X 20X 25X
	.cboDataWidth clear list
	.cboDataWidth insert list end 8 16
	
	#ISPL_CR_32144
	set Para(MinIPG) 0
	set Para(High) 9
	set Para(Low) 7
	.cboMinIPG clear list
	.cboHigh clear list
	.cboLow clear list
	.cboMinIPG insert list end 0
	.cboHigh insert list end 9
	.cboLow insert list end 7
	
	#set Para(Plus) "1100000101"
	#set Para(Minus) "0011111010"
	#set Para(Mask) "1111111111"

	set Para(RxModeCh0) NORMAL
	set Para(RxModeCh1) NORMAL
	set Para(RxModeCh2) NORMAL
	set Para(RxModeCh3) NORMAL
	.cboRxModeCh0 clear list
	.cboRxModeCh1 clear list
	.cboRxModeCh2 clear list
	.cboRxModeCh3 clear list
	.cboRxModeCh0 insert list end "NORMAL"
	.cboRxModeCh1 insert list end "NORMAL"
	.cboRxModeCh2 insert list end "NORMAL"
	.cboRxModeCh3 insert list end "NORMAL"

	set Para(Align) AUTO
	.cboAlign clear list
	.cboAlign insert list end AUTO

	set Para(CC_MATCH_MODE) MATCH_4
	.cboCC_MATCH_MODE clear list
	.cboCC_MATCH_MODE insert list end MATCH_4

	#set Para(CC_MATCH3) "0000000000"
	#set Para(CC_MATCH4) "0100011100"
	.entryPlus config -state normal
	.entryMinus config -state normal
	.entryMask config -state normal
	.entryCC_MATCH1 config -state normal
	.entryCC_MATCH2 config -state normal
	.entryCC_MATCH3 config -state normal
	.entryCC_MATCH4 config -state normal
	
	#ISPL_CR_35673 
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end NORMAL
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end NORMAL
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end NORMAL
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end NORMAL
	set Para(CTCCh0) NORMAL
	set Para(CTCCh1) NORMAL
	set Para(CTCCh2) NORMAL
	set Para(CTCCh3) NORMAL
}

proc SDSDISetting {} {
	global Para
	
	for {set i 0} {$i<=3} {incr i}  {
		if {$Para(Channel$i) == "GROUP1" || $Para(Channel$i) == "GROUP2"}  {
			set Para(Channel$i) SINGLE
		}
		.rdo2Channel$i config -state disable
		.rdo3Channel$i config -state disable
	}
	
	if {[lsearch {10X 20X} $Para(ClkMult)] == -1}  {
		set Para(ClkMult) 10X
	}
	if {[lsearch {10 20} $Para(DataWidth)] == -1}  {
		set Para(DataWidth) 10
		set Para(DataWidthH) 10
	}
	.cboClkMult clear list
	.cboClkMult insert list end 10X 20X
	.cboDataWidth clear list
	.cboDataWidth insert list end 10 20
	
	if {[lsearch {DISABLE MID_LOW LONG_LOW} $Para(EqCh0)] == -1}  {
		set Para(EqCh0) "DISABLE"
	}
	if {[lsearch {DISABLE MID_LOW LONG_LOW} $Para(EqCh1)] == -1}  {
		set Para(EqCh1) "DISABLE"
	}
	if {[lsearch {DISABLE MID_LOW LONG_LOW} $Para(EqCh2)] == -1}  {
		set Para(EqCh2) "DISABLE"
	}
	if {[lsearch {DISABLE MID_LOW LONG_LOW} $Para(EqCh3)] == -1}  {
		set Para(EqCh3) "DISABLE"
	}
	.cboEqCh0 clear list
	.cboEqCh1 clear list
	.cboEqCh2 clear list
	.cboEqCh3 clear list
	.cboEqCh0 insert list end MID_LOW LONG_LOW DISABLE
	.cboEqCh1 insert list end MID_LOW LONG_LOW DISABLE
	.cboEqCh2 insert list end MID_LOW LONG_LOW DISABLE
	.cboEqCh3 insert list end MID_LOW LONG_LOW DISABLE

	set Para(RxModeCh0) BYPASS
	set Para(RxModeCh1) BYPASS
	set Para(RxModeCh2) BYPASS
	set Para(RxModeCh3) BYPASS
	.cboRxModeCh0 clear list
	.cboRxModeCh1 clear list
	.cboRxModeCh2 clear list
	.cboRxModeCh3 clear list
	.cboRxModeCh0 insert list end BYPASS
	.cboRxModeCh1 insert list end BYPASS
	.cboRxModeCh2 insert list end BYPASS
	.cboRxModeCh3 insert list end BYPASS
	
	set Para(Align) BYPASS
	.cboAlign clear list
	.cboAlign insert list end BYPASS
	
	#set Para(MinIPG) 3
	#set Para(High) 9
	#set Para(Low) 7
	.cboMinIPG clear list
	.cboHigh clear list
	.cboLow clear list
	.cboMinIPG insert list end 0 1 2 3
	.cboHigh insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	.cboLow insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	
	#set Para(Plus) "1100000101"
	#set Para(Minus) "0011111010"
	#set Para(Mask) "1111111111"
	
	#set Para(CC_MATCH3) "0110111100"
	#set Para(CC_MATCH4) "0001010000"

	if {[lsearch {MATCH_3_4 MATCH_4 MATCH_1_2_3_4} $Para(CC_MATCH_MODE)] == -1}  {
		set Para(CC_MATCH_MODE) "MATCH_4"
	}
	.cboCC_MATCH_MODE clear list
	.cboCC_MATCH_MODE insert list end MATCH_3_4 MATCH_4 MATCH_1_2_3_4
	
	.entryPlus config -state normal
	.entryMinus config -state normal
	.entryMask config -state normal
	.entryCC_MATCH1 config -state normal
	.entryCC_MATCH2 config -state normal
	.entryCC_MATCH3 config -state normal
	.entryCC_MATCH4 config -state normal

	#ISPL_CR_35673
	#42866 BYPASS
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end BYPASS
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end BYPASS
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end BYPASS
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end BYPASS
	set Para(CTCCh0) BYPASS
	set Para(CTCCh1) BYPASS
	set Para(CTCCh2) BYPASS
	set Para(CTCCh3) BYPASS
}

proc HDSDISetting {} {
	global Para
	
	for {set i 0} {$i<=3} {incr i}  {
		if {$Para(Channel$i) == "GROUP1" || $Para(Channel$i) == "GROUP2"}  {
			set Para(Channel$i) SINGLE
		}
		.rdo2Channel$i config -state disable
		.rdo3Channel$i config -state disable
	}
	
	if {[lsearch {10X 20X} $Para(ClkMult)] == -1}  {
		set Para(ClkMult) 10X
	}
	if {[lsearch {10 20} $Para(DataWidth)] == -1}  {
		set Para(DataWidth) 10
		set Para(DataWidthH) 10
	}
	.cboClkMult clear list
	.cboClkMult insert list end 10X 20X
	.cboDataWidth clear list
	.cboDataWidth insert list end 10 20
	
	if {[lsearch {DISABLE MID_HIGH LONG_HIGH} $Para(EqCh0)] == -1}  {
		set Para(EqCh0) "DISABLE"
	}
	if {[lsearch {DISABLE MID_HIGH LONG_HIGH} $Para(EqCh1)] == -1}  {
		set Para(EqCh1) "DISABLE"
	}
	if {[lsearch {DISABLE MID_HIGH LONG_HIGH} $Para(EqCh2)] == -1}  {
		set Para(EqCh2) "DISABLE"
	}
	if {[lsearch {DISABLE MID_HIGH LONG_HIGH} $Para(EqCh3)] == -1}  {
		set Para(EqCh3) "DISABLE"
	}
	.cboEqCh0 clear list
	.cboEqCh1 clear list
	.cboEqCh2 clear list
	.cboEqCh3 clear list
	.cboEqCh0 insert list end MID_HIGH LONG_HIGH DISABLE
	.cboEqCh1 insert list end MID_HIGH LONG_HIGH DISABLE
	.cboEqCh2 insert list end MID_HIGH LONG_HIGH DISABLE
	.cboEqCh3 insert list end MID_HIGH LONG_HIGH DISABLE

	set Para(RxModeCh0) BYPASS
	set Para(RxModeCh1) BYPASS
	set Para(RxModeCh2) BYPASS
	set Para(RxModeCh3) BYPASS
	.cboRxModeCh0 clear list
	.cboRxModeCh1 clear list
	.cboRxModeCh2 clear list
	.cboRxModeCh3 clear list
	.cboRxModeCh0 insert list end BYPASS
	.cboRxModeCh1 insert list end BYPASS
	.cboRxModeCh2 insert list end BYPASS
	.cboRxModeCh3 insert list end BYPASS
	
	set Para(Align) BYPASS
	.cboAlign clear list
	.cboAlign insert list end BYPASS
	
	#set Para(MinIPG) 3
	#set Para(High) 9
	#set Para(Low) 7
	.cboMinIPG clear list
	.cboHigh clear list
	.cboLow clear list
	.cboMinIPG insert list end 0 1 2 3
	.cboHigh insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	.cboLow insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	
	#set Para(Plus) "1100000101"
	#set Para(Minus) "0011111010"
	#set Para(Mask) "1111111111"
	
	#set Para(CC_MATCH3) "0110111100"
	#set Para(CC_MATCH4) "0001010000"

	if {[lsearch {MATCH_3_4 MATCH_4 MATCH_1_2_3_4} $Para(CC_MATCH_MODE)] == -1}  {
		set Para(CC_MATCH_MODE) "MATCH_4"
	}
	.cboCC_MATCH_MODE clear list
	.cboCC_MATCH_MODE insert list end MATCH_3_4 MATCH_4 MATCH_1_2_3_4
	
	.entryPlus config -state normal
	.entryMinus config -state normal
	.entryMask config -state normal
	.entryCC_MATCH1 config -state normal
	.entryCC_MATCH2 config -state normal
	.entryCC_MATCH3 config -state normal
	.entryCC_MATCH4 config -state normal

	#ISPL_CR_35673 
	#42866 BYPASS
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end BYPASS
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end BYPASS
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end BYPASS
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end BYPASS
	set Para(CTCCh0) BYPASS
	set Para(CTCCh1) BYPASS
	set Para(CTCCh2) BYPASS
	set Para(CTCCh3) BYPASS
}

proc UserDefSetting {} {
	global Para
	
	#CR_34143
	#set Para(CTCCh0) BYPASS
	#set Para(CTCCh1) BYPASS
	#set Para(CTCCh2) BYPASS
	#set Para(CTCCh3) BYPASS

	if {[lsearch {AUTO DYNAMIC BYPASS} $Para(Align)] == -1}  {
		set Para(Align) AUTO
	}

	.cboAlign clear list
	.cboAlign insert list end AUTO DYNAMIC BYPASS
	.entryPlus config -state normal
	.entryMinus config -state normal
	.entryMask config -state normal
	.entryCC_MATCH1 config -state normal
	.entryCC_MATCH2 config -state normal
	.entryCC_MATCH3 config -state normal
	.entryCC_MATCH4 config -state normal
}

proc GeneralSetting {} {
	global Para

	#.rdo2Channel0 config -state normal
	#.rdo2Channel1 config -state normal
	#.rdo2Channel2 config -state normal
	#.rdo2Channel3 config -state normal
	#.rdo3Channel0 config -state normal
	#.rdo3Channel1 config -state normal
	#.rdo3Channel2 config -state normal
	#.rdo3Channel3 config -state normal
	
	.cboEqCh0 config -state normal
	.cboEqCh1 config -state normal
	.cboEqCh2 config -state normal
	.cboEqCh3 config -state normal
	.cboEqCh0 clear list
	.cboEqCh1 clear list
	.cboEqCh2 clear list
	.cboEqCh3 clear list
	.cboEqCh0 insert list end MID_LOW MID_MED MID_HIGH LONG_LOW LONG_MED LONG_HIGH DISABLE 
	.cboEqCh1 insert list end MID_LOW MID_MED MID_HIGH LONG_LOW LONG_MED LONG_HIGH DISABLE
	.cboEqCh2 insert list end MID_LOW MID_MED MID_HIGH LONG_LOW LONG_MED LONG_HIGH DISABLE
	.cboEqCh3 insert list end MID_LOW MID_MED MID_HIGH LONG_LOW LONG_MED LONG_HIGH DISABLE

	.cboClkMult clear list
	.cboClkMult insert list end 8XH 10XH 8X 10X 16X 20X 25X
	.cboDataWidth clear list
	.cboDataWidth insert list end 8 10 16 20

	.cboRxModeCh0 config -state normal
	.cboRxModeCh1 config -state normal
	.cboRxModeCh2 config -state normal
	.cboRxModeCh3 config -state normal
	.cboRxModeCh0 clear list
	.cboRxModeCh1 clear list
	.cboRxModeCh2 clear list
	.cboRxModeCh3 clear list
	.cboRxModeCh0 insert list end BYPASS NORMAL
	.cboRxModeCh1 insert list end BYPASS NORMAL
	.cboRxModeCh2 insert list end BYPASS NORMAL
	.cboRxModeCh3 insert list end BYPASS NORMAL

	.cboAlign clear list
	.cboAlign insert list end AUTO DYNAMIC BYPASS CONTINUOUS
		
	.cboCTCCh0 config -state normal
	.cboCTCCh1 config -state normal
	.cboCTCCh2 config -state normal
	.cboCTCCh3 config -state normal
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end BYPASS NORMAL
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end BYPASS NORMAL
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end BYPASS NORMAL
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end BYPASS NORMAL
	#set Para(CTCCh0) NORMAL
	#set Para(CTCCh1) NORMAL
	#set Para(CTCCh2) NORMAL
	#set Para(CTCCh3) NORMAL

	.cboCC_MATCH_MODE clear list
	.cboCC_MATCH_MODE insert list end MATCH_3_4 MATCH_4 MATCH_1_2_3_4
	
	.cboMinIPG clear list
	.cboHigh clear list
	.cboLow clear list
	.cboMinIPG insert list end 0 1 2 3
	.cboHigh insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	.cboLow insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
}

proc SATAISetting {} {
	global Para
	
	set Para(Channel0) SINGLE
	set Para(Channel1) SINGLE
	set Para(Channel2) SINGLE
	set Para(Channel3) SINGLE
	.rdo2Channel0 config -state disable
	.rdo2Channel1 config -state disable
	.rdo2Channel2 config -state disable
	.rdo2Channel3 config -state disable
	.rdo3Channel0 config -state disable
	.rdo3Channel1 config -state disable
	.rdo3Channel2 config -state disable
	.rdo3Channel3 config -state disable
	
	if {[lsearch {10X 20X} $Para(ClkMult)] == -1}  {
		set Para(ClkMult) 10X
	}
	.cboClkMult clear list
	.cboClkMult insert list end 10X 20X
	if {[lsearch {8 16} $Para(DataWidth)] == -1}  {
		set Para(DataWidth) 8
		set Para(DataWidthH) 8
	}
	.cboDataWidth clear list
	.cboDataWidth insert list end 8 16
	
	if {[lsearch {DISABLE MID_MED LONG_MED} $Para(EqCh0)] == -1}  {
		set Para(EqCh0) "DISABLE"
	}
	if {[lsearch {DISABLE MID_MED LONG_MED} $Para(EqCh1)] == -1}  {
		set Para(EqCh1) "DISABLE"
	}
	if {[lsearch {DISABLE MID_MED LONG_MED} $Para(EqCh2)] == -1}  {
		set Para(EqCh2) "DISABLE"
	}
	if {[lsearch {DISABLE MID_MED LONG_MED} $Para(EqCh3)] == -1}  {
		set Para(EqCh3) "DISABLE"
	}
	.cboEqCh0 clear list
	.cboEqCh1 clear list
	.cboEqCh2 clear list
	.cboEqCh3 clear list
	.cboEqCh0 insert list end MID_MED LONG_MED DISABLE
	.cboEqCh1 insert list end MID_MED LONG_MED DISABLE
	.cboEqCh2 insert list end MID_MED LONG_MED DISABLE
	.cboEqCh3 insert list end MID_MED LONG_MED DISABLE

	set Para(RxModeCh0) NORMAL
	set Para(RxModeCh1) NORMAL
	set Para(RxModeCh2) NORMAL
	set Para(RxModeCh3) NORMAL
	.cboRxModeCh0 clear list
	.cboRxModeCh1 clear list
	.cboRxModeCh2 clear list
	.cboRxModeCh3 clear list
	.cboRxModeCh0 insert list end "NORMAL"
	.cboRxModeCh1 insert list end "NORMAL"
	.cboRxModeCh2 insert list end "NORMAL"
	.cboRxModeCh3 insert list end "NORMAL"
	
	#42866 BYPASS
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end BYPASS
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end BYPASS
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end BYPASS
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end BYPASS
	set Para(CTCCh0) BYPASS
	set Para(CTCCh1) BYPASS
	set Para(CTCCh2) BYPASS
	set Para(CTCCh3) BYPASS
	
	set Para(Align) AUTO
	.cboAlign clear list
	.cboAlign insert list end AUTO
	
	set Para(MinIPG) 0
	set Para(High) 9
	set Para(Low) 7
	.cboMinIPG clear list
	.cboHigh clear list
	.cboLow clear list
	.cboMinIPG insert list end 0
	.cboHigh insert list end 9
	.cboLow insert list end 7
	
	set Para(Plus) "1100000101"
	set Para(Minus) "0011111010"
	set Para(Mask) "1111111111"
	
	#set Para(CC_MATCH1) "0110111100"
	#set Para(CC_MATCH2) "0110111100"
	#set Para(CC_MATCH3) "0110111100"
	#set Para(CC_MATCH4) "0001010000"

	set Para(CC_MATCH_MODE) "MATCH_1_2_3_4"
	.cboCC_MATCH_MODE clear list
	.cboCC_MATCH_MODE insert list end MATCH_1_2_3_4
	
	.entryPlus config -state normal
	.entryMinus config -state normal
	.entryMask config -state normal
	.entryCC_MATCH1 config -state normal
	.entryCC_MATCH2 config -state normal
	.entryCC_MATCH3 config -state normal
	.entryCC_MATCH4 config -state normal

	#ISPL_CR_35673 
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end NORMAL
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end NORMAL
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end NORMAL
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end NORMAL
	set Para(CTCCh0) NORMAL
	set Para(CTCCh1) NORMAL
	set Para(CTCCh2) NORMAL
	set Para(CTCCh3) NORMAL
}

proc CPRISetting {} {
	global Para
	
	set Para(Channel0) SINGLE
	set Para(Channel1) SINGLE
	set Para(Channel2) SINGLE
	set Para(Channel3) SINGLE
	.rdo2Channel0 config -state disable
	.rdo2Channel1 config -state disable
	.rdo2Channel2 config -state disable
	.rdo2Channel3 config -state disable
	.rdo3Channel0 config -state disable
	.rdo3Channel1 config -state disable
	.rdo3Channel2 config -state disable
	.rdo3Channel3 config -state disable
	
	if {[lsearch {10X 20X 10XH} $Para(ClkMult)] == -1}  {
		set Para(ClkMult) 10X
	}
	.cboClkMult clear list
	.cboClkMult insert list end 10X 20X 10XH
	set Para(DataWidth) 10
	set Para(DataWidthH) 10
	.cboDataWidth clear list
	.cboDataWidth insert list end 10
	
	#DISABLE MID_MED MID_HIGH LONG_MED LONG_HIGH
	if {[lsearch {DISABLE MID_MED MID_HIGH LONG_MED LONG_HIGH} $Para(EqCh0)] == -1}  {
		set Para(EqCh0) "DISABLE"
	}
	if {[lsearch {DISABLE MID_MED MID_HIGH LONG_MED LONG_HIGH} $Para(EqCh1)] == -1}  {
		set Para(EqCh1) "DISABLE"
	}
	if {[lsearch {DISABLE MID_MED MID_HIGH LONG_MED LONG_HIGH} $Para(EqCh2)] == -1}  {
		set Para(EqCh2) "DISABLE"
	}
	if {[lsearch {DISABLE MID_MED MID_HIGH LONG_MED LONG_HIGH} $Para(EqCh3)] == -1}  {
		set Para(EqCh3) "DISABLE"
	}
	.cboEqCh0 clear list
	.cboEqCh1 clear list
	.cboEqCh2 clear list
	.cboEqCh3 clear list
	.cboEqCh0 insert list end DISABLE MID_MED MID_HIGH LONG_MED LONG_HIGH
	.cboEqCh1 insert list end DISABLE MID_MED MID_HIGH LONG_MED LONG_HIGH
	.cboEqCh2 insert list end DISABLE MID_MED MID_HIGH LONG_MED LONG_HIGH
	.cboEqCh3 insert list end DISABLE MID_MED MID_HIGH LONG_MED LONG_HIGH

	set Para(RxModeCh0) BYPASS
	set Para(RxModeCh1) BYPASS
	set Para(RxModeCh2) BYPASS
	set Para(RxModeCh3) BYPASS
	.cboRxModeCh0 clear list
	.cboRxModeCh1 clear list
	.cboRxModeCh2 clear list
	.cboRxModeCh3 clear list
	.cboRxModeCh0 insert list end "BYPASS"
	.cboRxModeCh1 insert list end "BYPASS"
	.cboRxModeCh2 insert list end "BYPASS"
	.cboRxModeCh3 insert list end "BYPASS"
	
	set Para(Align) BYPASS
	.cboAlign clear list
	.cboAlign insert list end BYPASS
	
	#set Para(MinIPG) 0
	#set Para(High) 9
	#set Para(Low) 7
	.cboMinIPG clear list
	.cboHigh clear list
	.cboLow clear list
	.cboMinIPG insert list end 0 1 2 3
	.cboHigh insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	.cboLow insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	
	#set Para(Plus) "1100000101"
	#set Para(Minus) "0011111010"
	#set Para(Mask) "1111111111"
	
	#set Para(CC_MATCH1) "0110111100"
	#set Para(CC_MATCH2) "0110111100"
	#set Para(CC_MATCH3) "0110111100"
	#set Para(CC_MATCH4) "0001010000"

	if {[lsearch {MATCH_4 MATCH_3_4 MATCH_1_2_3_4} $Para(CC_MATCH_MODE)] == -1}  {
		set Para(CC_MATCH_MODE) "MATCH_4"
	}
	.cboCC_MATCH_MODE clear list
	.cboCC_MATCH_MODE insert list end MATCH_4 MATCH_3_4 MATCH_1_2_3_4
	
	.entryPlus config -state normal
	.entryMinus config -state normal
	.entryMask config -state normal
	.entryCC_MATCH1 config -state normal
	.entryCC_MATCH2 config -state normal
	.entryCC_MATCH3 config -state normal
	.entryCC_MATCH4 config -state normal

	#ISPL_CR_35673 
	.cboCTCCh0 clear list
	.cboCTCCh0 insert list end BYPASS
	.cboCTCCh1 clear list
	.cboCTCCh1 insert list end BYPASS
	.cboCTCCh2 clear list
	.cboCTCCh2 insert list end BYPASS
	.cboCTCCh3 clear list
	.cboCTCCh3 insert list end BYPASS
	set Para(CTCCh0) BYPASS
	set Para(CTCCh1) BYPASS
	set Para(CTCCh2) BYPASS
	set Para(CTCCh3) BYPASS
}

proc ChangeRegen1Cmd1 {} {
	global Para
	if {$Para(PAR1) == 1} {
		set Para(PARTrace1) 0
	}
}

proc ChangeRegen1Cmd2 {} {
	global Para
	if {$Para(PARTrace1) == 1} {
		set Para(PAR1) 0
	}
}

proc ChangeRegen3Cmd1 {} {
	global Para
	if {$Para(PAR3) == 1} {
		set Para(PARTrace3) 0
	}
}

proc ChangeRegen3Cmd2 {} {
	global Para
	if {$Para(PARTrace3) == 1} {
		set Para(PAR3) 0
	}
}

proc ChangeSettingsCmd {} {
	global Para
	if {$Para(Regen) == "auto"} {
		.ck1PAR config -state normal
		.ck1PARTrace config -state normal
		.ck3PAR config -state disabled
		.ck3PARTrace config -state disabled
		set Para(PAR3) 0
		set Para(PARTrace3) 0
	}
	if {$Para(Regen) == "module"} {
		.ck1PAR config -state disabled
		.ck1PARTrace config -state disabled
		.ck3PAR config -state disabled
		.ck3PARTrace config -state disabled
		set Para(PAR1) 0
		set Para(PARTrace1) 0
		set Para(PAR3) 0
		set Para(PARTrace3) 0
	}
	if {$Para(Regen) == "setting"} {
		.ck1PAR config -state disabled
		.ck1PARTrace config -state disabled
		.ck3PAR config -state normal
		.ck3PARTrace config -state normal
		set Para(PAR1) 0
		set Para(PARTrace1) 0
	}
}

proc ChangeModeCmd {} {
	global Para

	GeneralSetting
	
	switch $Para(mode) {
		"PCI-Express" -
		"PCI-Express (PIPE)" {PCISetting}
		"Gigabit Ethernet" {GIGESetting}
		"Generic 8B10B" {G8B10BSetting}
		"10-bit SERDES Only" {BSER10Setting}
		"8-bit SERDES Only" {BSER8Setting}
		"User Defined" {UserDefSetting}
		"SD-SDI" {SDSDISetting}
		"HD-SDI" {HDSDISetting}
		"SATA I" {SATAISetting}
		"CPRI" {CPRISetting}
		default {}
	}
	ChangeLoopCmd

	.cboClkMultF clear list
	set size [.cboClkMult size]
	for {set i 0} {$i<$size} {incr i} {
		.cboClkMultF insert list end [.cboClkMult get $i]
	}

	.cboDataWidthF clear list
	.cboDataWidthH clear list
	set size [.cboDataWidth size]
	for {set i 0} {$i<$size} {incr i} {
		.cboDataWidthF insert list end [.cboDataWidth get $i]
		.cboDataWidthH insert list end [.cboDataWidth get $i]
	}
	ChangeClkRateCmd
	
	#ISPL_CR_36466 
	if {[string first "35E" $Para(PartType)] != -1 } {
	#35K Device
		if {[string last "ES" $Para(PartName)] != -1} {
		#35K ES Device
			.cboLoss clear list
			.cboLoss insert list end 0 1 2 3 4 5 6 7
			.cboPreCh0 clear list
			.cboPreCh1 clear list
			.cboPreCh2 clear list
			.cboPreCh3 clear list
			.cboPreCh0 insert list end DISABLE 0 1 2 3 4 5
			.cboPreCh1 insert list end DISABLE 0 1 2 3 4 5
			.cboPreCh2 insert list end DISABLE 0 1 2 3 4 5
			.cboPreCh3 insert list end DISABLE 0 1 2 3 4 5
		} else {
		#35K Non-ES Device
		}
	} else {
	#Non-35K Device
		.cboLoss clear list
		#rev 6.0
		#.cboLoss insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		.cboLoss insert list end 0 1 2 3 4 5 6 7
		.cboPreCh0 clear list
		.cboPreCh1 clear list
		.cboPreCh2 clear list
		.cboPreCh3 clear list
		.cboPreCh0 insert list end DISABLE 0 1 2 3 4 5 6
		.cboPreCh1 insert list end DISABLE 0 1 2 3 4 5 6
		.cboPreCh2 insert list end DISABLE 0 1 2 3 4 5 6
		.cboPreCh3 insert list end DISABLE 0 1 2 3 4 5 6
	}
	
	#cr_43405 
	#12
	if {$Para(mode) == "Generic 8B10B" || $Para(mode) == "CPRI"} {
		.ck_teidleCh0 config -state normal
		.ck_teidleCh1 config -state normal
		.ck_teidleCh2 config -state normal
		.ck_teidleCh3 config -state normal
	} else {
		.ck_teidleCh0 config -state disabled
		.ck_teidleCh1 config -state disabled
		.ck_teidleCh2 config -state disabled
		.ck_teidleCh3 config -state disabled
		set Para(_teidleCh0) FALSE
		set Para(_teidleCh1) FALSE
		set Para(_teidleCh2) FALSE
		set Para(_teidleCh3) FALSE
	}
}

#******************************************************************************
# Public Template Function:
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para OldPara
	if {$Para(new) == 0} {LoadParameter $Para(CoreName) $Para(ParaFile)}
	
	ChangeModeCmd
	ChangeProtocolCmd
	ChangeChannelS_GCmd
	ChangeSCICmd
}

proc CheckRegenerate {} {
	global Para OldPara

	#new a module
	if {$Para(new) == 1} { 
		return 1
	} else {
		#tk_messageBox -default ok -icon info -message $Para(newpath) -title newpath -type ok
		#tk_messageBox -default ok -icon info -message $Para(newmodule) -title newmodule -type ok
		#!if newpath=NULL & newmodule=NULL, then this is double click LPC file in prjnav.
		#!if newpath!=NULL || newmodule!=NULL, then regenerate from IPExpress.
		if {[string length $Para(newpath)] > 0 || [string length $Para(newmodule)] > 0} {
			if {$Para(newpath) != $Para(path) || $Para(newmodule) != $Para(module)} {
				return 1
			}
		}
	}
	
	set para_lst {VendorName CoreType Date Time CoreStatus CoreName CoreRevision ParameterFileVersion \
		VCh0 VCh1 VCh2 VCh3 PreCh0 PreCh1 PreCh2 PreCh3 TxCh0 TxCh1 TxCh2 TxCh3 EqCh0 EqCh1 EqCh2 EqCh3 \
		RxTermCh0 RxTermCh1 RxTermCh2 RxTermCh3 RxCoupCh0 RxCoupCh1 RxCoupCh2 RxCoupCh3 Loss TxTerm TxCoup TxPllLoss \
		TxInvCh0 TxInvCh1 TxInvCh2 TxInvCh3 RxModeCh0 RxModeCh1 RxModeCh2 RxModeCh3 RxInvCh0 RxInvCh1 RxInvCh2 RxInvCh3 \
		Plus Minus Mask Align CC_MATCH_MODE CC_MATCH1 CC_MATCH2 CC_MATCH3 CC_MATCH4 MinIPG High Low
		Regen PAR1 PARTrace1 PAR3 PARTrace3} 
	
	foreach pn [array names OldPara] {
		if {[lsearch $para_lst $pn] == -1 &&
			$OldPara($pn) != $Para($pn)} {return 1}
	}
	return 0
}

proc CreatePpFile {} {
	global Para

	set outPpFile [file join $Para(ProjectPath) $Para(ModuleName).pp]
	if [catch {open $outPpFile w} outputfile] {
		puts stderr "Cannot open file: $outPpFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outPpFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}

	#set dsp_lst {"Gigabit Ethernet" "1G Fibre Channel" "2G Fibre Channel" XAUI "SRIO Type1" "SRIO Type2" "SRIO Type3" PCI-Express OBSAI CPRI "SATA Type1" "SATA Type2"	SMPTE259M SMPTE292M SMPTE344M "Generic 8B10B" "10-bit SERDES Only" "8-bit SERDES Only" "User Defined"}
	set dsp_lst {PCI-Express "Gigabit Ethernet" "Generic 8B10B" "10-bit SERDES Only" "8-bit SERDES Only" SD-SDI HD-SDI CPRI}
	set index [lsearch -exact $dsp_lst $Para(mode)]
	#set mode_lst {GIGE 1GFC 2GFC XAUI SRIOT1 SRIOT2 SRIOT3 PCIE OBSAI CPRI SATAT1 SATAT2 SMPTE259M SMPTE292M SMPTE344M G8B10B 10BSER 8BSER USERDEF}
	set mode_lst {PCIE GIGE G8B10B 10BSER 8BSER SDSDI HDSDI CPRI}
	set mode [lindex $mode_lst $index]

	# **************Rev2.6 ********** P14 Note 7 
	#LOW <= 540 Mbps
	#540Mbps < MEDLOW <= 1.0Gbps
	#1.0Gbps < MED < 2.0Gbps
	#2.0Gbps <= MEDHIGH < 2.5Gbps
	#2.5Gbps <= HIGH <= 3.2Gbps
	#ISPL_CR_36869 
	#a. 35K ES Devices:
	#	i. LOW <= 540 Mbps
	#	ii. 540 Mbps < MEDLOW <= 1.0 Gbps
	#	iii. 1.0 Gbps < MED < 2.0 Gbps
	#	iv. 2.0 Gbps <= MEDHIGH < 2.5 Gbps
	#	v. 2.5 Gbps <= HIGH <= 3.2 Gbps
	#b. 35K Non-ES Devices, 20K (All Devices), 50K (All Devices), 70K (All Devices), 100K (All Devices):
	#	i. LOW <= 500 Mbps
	#	ii. 500 Mbps < MEDLOW <= 1.0 Gbps
	#	iii. 1.0 Gbps < MED < 2.0 Gbps
	#	iv. 2.0 Gbps <= MEDHIGH < 2.5 Gbps
	#	v. 2.5 Gbps <= HIGH <= 3.2 Gbps	
	set clkrate HIGH
	set minClkRate "0.5"
	if {[string first "35E" $Para(PartType)] != -1 } {
	#35K Device
		if {[string last "ES" $Para(PartName)] != -1} {
		#35K ES Device
			set minClkRate "0.54"
		}
	}
	#47678
	set bak $Para(ClkRate)
	if {$Para(Protocol) == "Quad"} {
		if {[string index $Para(ClkMult) end] == "H"} {
			set Para(ClkRate) [expr $Para(ClkRate)*2]
		}
	}
	if {$Para(ClkRate) <=$minClkRate && $Para(ClkRate) >= "0.25"} {
		set clkrate LOW
	}
	if {$Para(ClkRate) <="1.0" && $Para(ClkRate) > $minClkRate} {
		set clkrate MEDLOW
	}
	if {$Para(ClkRate) < "2.0" && $Para(ClkRate) > "1.0"} {
		set clkrate MED
	}
	if {$Para(ClkRate) < "2.5" && $Para(ClkRate) >= "2.0"} {
		set clkrate MEDHIGH
	}
	if {$Para(ClkRate) <= "3.2" && $Para(ClkRate) >= "2.5"} {
		set clkrate HIGH
	}
	set Para(ClkRate) $bak
	
	set Para(FPGAClkRateQ) [expr $Para(FPGAClkRate)/4]

	puts $outputfile "#define _device_name \"$Para(PartType)\""
	puts $outputfile "#define _protocol_mode \"$Para(Protocol) Based Protocol Mode\"
#define _protocol \"$mode\" 
#define _ch0_mode \"$Para(Channel0)\" 
#define _ch1_mode \"$Para(Channel1)\" 
#define _ch2_mode \"$Para(Channel2)\" 
#define _ch3_mode \"$Para(Channel3)\" 
#define _pll_txsrc \"$Para(TxRefClk)\" 
#define _pll_rxsrc \"$Para(RxRefClk)\" 
#define _datarange \"$clkrate\" 
#define _refclk_mult \"$Para(ClkMult)\" 
#define _refclk_rate $Para(CalClkRate)
#define _data_width \"$Para(DataWidth)\" 
#define _fpgaintclk_rate $Para(FPGAClkRate)
#define _ch0_tdrv_amp \"$Para(VCh0)\" 
#define _ch1_tdrv_amp \"$Para(VCh1)\" 
#define _ch2_tdrv_amp \"$Para(VCh2)\" 
#define _ch3_tdrv_amp \"$Para(VCh3)\" 
#define _ch0_tx_pre \"$Para(PreCh0)\" 
#define _ch1_tx_pre \"$Para(PreCh1)\" 
#define _ch2_tx_pre \"$Para(PreCh2)\" 
#define _ch3_tx_pre \"$Para(PreCh3)\" 
#define _ch0_rterm_tx \"$Para(TxCh0)\" 
#define _ch1_rterm_tx \"$Para(TxCh1)\" 
#define _ch2_rterm_tx \"$Para(TxCh2)\" 
#define _ch3_rterm_tx \"$Para(TxCh3)\" 
#define _ch0_rx_eq \"$Para(EqCh0)\" 
#define _ch1_rx_eq \"$Para(EqCh1)\" 
#define _ch2_rx_eq \"$Para(EqCh2)\" 
#define _ch3_rx_eq \"$Para(EqCh3)\" 
#define _ch0_rterm_rx \"$Para(RxTermCh0)\" 
#define _ch1_rterm_rx \"$Para(RxTermCh1)\" 
#define _ch2_rterm_rx \"$Para(RxTermCh2)\" 
#define _ch3_rterm_rx \"$Para(RxTermCh3)\" 
#define _ch0_rx_dcc \"$Para(RxCoupCh0)\" 
#define _ch1_rx_dcc \"$Para(RxCoupCh1)\" 
#define _ch2_rx_dcc \"$Para(RxCoupCh2)\" 
#define _ch3_rx_dcc \"$Para(RxCoupCh3)\" 
#define _los_threshold \"$Para(Loss)\" 
#define _pll_term \"$Para(TxTerm)\" 
#define _pll_dcc \"$Para(TxCoup)\" 
#define _pll_lol_set \"$Para(TxPllLoss)\" 
#define _ch0_tx_sb \"$Para(TxInvCh0)\" 
#define _ch1_tx_sb \"$Para(TxInvCh1)\" 
#define _ch2_tx_sb \"$Para(TxInvCh2)\" 
#define _ch3_tx_sb \"$Para(TxInvCh3)\" 
#define _ch0_rx_sb \"$Para(RxInvCh0)\" 
#define _ch1_rx_sb \"$Para(RxInvCh1)\" 
#define _ch2_rx_sb \"$Para(RxInvCh2)\" 
#define _ch3_rx_sb \"$Para(RxInvCh3)\" 
#define _ch0_8b10b \"$Para(RxModeCh0)\" 
#define _ch1_8b10b \"$Para(RxModeCh1)\" 
#define _ch2_8b10b \"$Para(RxModeCh2)\" 
#define _ch3_8b10b \"$Para(RxModeCh3)\" 
#define _comma_a \"$Para(Plus)\" 
#define _comma_b \"$Para(Minus)\" 
#define _comma_m \"$Para(Mask)\" 
#define _comma_align \"$Para(Align)\" 
#define _ch0_ctc_byp \"$Para(CTCCh0)\" 
#define _ch1_ctc_byp \"$Para(CTCCh1)\" 
#define _ch2_ctc_byp \"$Para(CTCCh2)\" 
#define _ch3_ctc_byp \"$Para(CTCCh3)\" 
#define _cc_match1 \"$Para(CC_MATCH1)\" 
#define _cc_match2 \"$Para(CC_MATCH2)\" 
#define _cc_match3 \"$Para(CC_MATCH3)\" 
#define _cc_match4 \"$Para(CC_MATCH4)\" 
#define _cc_match_mode \"$Para(CC_MATCH_MODE)\" 
#define _cc_min_ipg \"$Para(MinIPG)\" 
#define _cchmark \"$Para(High)\" 
#define _cclmark \"$Para(Low)\" 
#define _ch0_ird \"$Para(RxDataCh0)\" 
#define _ch1_ird \"$Para(RxDataCh1)\" 
#define _ch2_ird \"$Para(RxDataCh2)\" 
#define _ch3_ird \"$Para(RxDataCh3)\" 
#define _ch0_elsm \"$Para(ELSMCh0)\" 
#define _ch1_elsm \"$Para(ELSMCh1)\" 
#define _ch2_elsm \"$Para(ELSMCh2)\" 
#define _ch3_elsm \"$Para(ELSMCh3)\" 
#define _ch0_teidle \"$Para(_teidleCh0)\"
#define _ch1_teidle \"$Para(_teidleCh1)\"
#define _ch2_teidle \"$Para(_teidleCh2)\"
#define _ch3_teidle \"$Para(_teidleCh3)\"
#define _loopback \"$Para(Ports0)\" 
#define _lbtype \"$Para(rdoPorts0)\"
#define _refck2core \"$Para(Ports2)\" 
#define _pllqclkports \"$Para(Ports4)\"
#define _sci_ports \"$Para(Ports3)\" 
#define _sci_int_port \"$Para(Ports3_1)\" 
#define _errsports \"$Para(Ports1)\" 
#define _rst_gen \"$Para(_rst_gen)\"
#define _rx_los_port0 \"$Para(_rx_los_port0)\"
#define _rx_los_port1 \"$Para(_rx_los_port1)\"
#define _rx_los_port2 \"$Para(_rx_los_port2)\"
#define _rx_los_port3 \"$Para(_rx_los_port3)\"

#define _ch0_rx_ficlk_rate $Para(FPGAClkRate)
#define _ch1_rx_ficlk_rate $Para(FPGAClkRate)
#define _ch2_rx_ficlk_rate $Para(FPGAClkRate)
#define _ch3_rx_ficlk_rate $Para(FPGAClkRate)

#define _ch0_rx_hiclk_rate $Para(FPGAClkRateH)
#define _ch1_rx_hiclk_rate $Para(FPGAClkRateH)
#define _ch2_rx_hiclk_rate $Para(FPGAClkRateH)
#define _ch3_rx_hiclk_rate $Para(FPGAClkRateH)

#define _ch0_rx_qiclk_rate $Para(FPGAClkRateQ)
#define _ch1_rx_qiclk_rate $Para(FPGAClkRateQ)
#define _ch2_rx_qiclk_rate $Para(FPGAClkRateQ)
#define _ch3_rx_qiclk_rate $Para(FPGAClkRateQ)

#define _tx_ficlk_rate $Para(FPGAClkRate)
#define _tx_hiclk_rate $Para(FPGAClkRateH)
#define _tx_qiclk_rate $Para(FPGAClkRateQ)
"

	if {$Para(Protocol) == "Channel"} {
		set clkrate HIGH
		set minClkRateH "0.5"
		if {[string first "35E" $Para(PartType)] != -1 } {
		#35K Device
			if {[string last "ES" $Para(PartName)] != -1} {
			#35K ES Device
				set minClkRateH "0.54"
			}
		}
		if {$Para(ClkRateH) <=$minClkRateH && $Para(ClkRateH) >= "0.25"} {
			set clkrate LOW
		}
		if {$Para(ClkRateH) <="1.0" && $Para(ClkRateH) > $minClkRateH} {
			set clkrate MEDLOW
		}
		if {$Para(ClkRateH) < "2.0" && $Para(ClkRateH) > "1.0"} {
			set clkrate MED
		}
		if {$Para(ClkRateH) < "2.5" && $Para(ClkRateH) >= "2.0"} {
			set clkrate MEDHIGH
		}
		if {$Para(ClkRateH) <= "3.2" && $Para(ClkRateH) >= "2.5"} {
			set clkrate HIGH
		}
		puts $outputfile "#define _ch0_rate \"$Para(Rate0)\"
#define _ch1_rate \"$Para(Rate1)\"
#define _ch2_rate \"$Para(Rate2)\"
#define _ch3_rate \"$Para(Rate3)\"		
#define _ch0_pll_rxsrc \"$Para(RxRefClk0CM)\"
#define _ch1_pll_rxsrc \"$Para(RxRefClk1CM)\"
#define _ch2_pll_rxsrc \"$Para(RxRefClk2CM)\"
#define _ch3_pll_rxsrc \"$Para(RxRefClk3CM)\"
#define _datarange_half \"$clkrate\"
#define _refclk_mult_half \"$Para(ClkMultH)\"
#define _refclk_rate_half $Para(CalClkRateH)
#define _data_width_half \"$Para(DataWidthH)\"
#define _fpgaintclk_rate_half $Para(FPGAClkRateH)
"
	}

	puts $outputfile "#define _circuit_name $Para(ModuleName)"

	set ret [CheckRegenerate]
	if {$ret == "0" && $Para(Regen) == "module"} {
		set ret 1
	}
	if {$ret == 0} {
		set msg "Only the configuration settings have been updated, please ensure that bitstream is re-generated - it will not happen automatically."
		if {$Para(bali) == "false"} {
			tk_messageBox -default ok -icon info -message $msg -title "Regenerate" -type ok
		}

		puts $outputfile "#include <pcs/pcsc_cfg.txt>"
	} else {
		if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
			[string equal -nocase $Para(SourceFormat) "VHDL"]} {
			puts $outputfile "#define _lang vhdl\n"
			puts $outputfile "#include <pcs/PCSC.vhd>"
			puts $outputfile "#include <pcs/pcsc_cfg.txt>"
		}
		if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
			[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {
			puts $outputfile "#define _lang verilog\n"
			puts $outputfile "#include <pcs/PCSC.v>"
			puts $outputfile "#include <pcs/pcsc_cfg.txt>"
		}
	}

	close $outputfile
	return 0
}

#******************************************************************************
# Public Template Function:
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para

	set tit "Check Parameter"

	if {$Para(Protocol) == "Channel"} {
		set single_count 0
		set full_count 0
		set half_count 0
		for {set i 0} {$i<=3} {incr i}  {
			if {$Para(Channel$i) == "SINGLE" } {incr single_count}
			if {$Para(Rate$i) == "Full Rate"} {incr full_count}
			if {$Para(Rate$i) == "Half Rate"} {incr half_count}
		}
		if {$single_count < 2} {
			set msg "The user should enable at least 2 channels."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$full_count == $single_count || $half_count == $single_count} {
			set msg "All selected channels cannot be in Full Rate mode \nor all selected channels cannot be in Half Rate mode."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
	} 
	
	set ret [IsInRange "Serial Bit Clock Rate" 0.25 3.2 $Para(ClkRate)]
	if {$ret == "-1"} {return -1}

	set ret [CheckRegenerate]
	if {$Para(ModuleName) != "dummy_sym" && $ret == "1" && $Para(Regen) == "setting"} {
		set msg "Error: Module HDL generation is necessary due to selected configuration. Please use Automatic or Force Module options."
		tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
		return -1
	}

	return 0
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

	set ret [CreatePpFile]
	if {$ret == -1} {return -1}

	set out_msg "\tModule Name: $Para(ModuleName)\n\tCore Name: $Para(CoreName)\n\tLPC file : $Para(ModuleName).lpc"
	append out_msg "\n\tParameter File : $Para(ModuleName).pp"
#	append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"

	#set pin_flag orcapp

	set oldPath [pwd]
	cd $Para(ProjectPath)
	set ppFile  "$Para(ModuleName).pp"
	set orcappFile  [GetFpscEngine]
	catch {exec $orcappFile -Fmaco $ppFile} ret
	cd $oldPath
	# send message to IP Manager
	regsub -all "\n\n\n+" $ret "\n\n" ret
	append out_msg "\n\tCommand line: $orcappFile -Fmaco $ppFile"
	append out_msg "\n\tReturn Value:"
	foreach item [split $ret "\n"] {append out_msg "\n\t$item"}

	set tmp_str [string tolower $out_msg]
	if {[string first "error" $tmp_str] == -1}  {
		append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"
	} 

	set out_msg [ReadmeOut $out_msg]

	return $out_msg
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet

	#*** Here for user to add extra pages ***
	MainInterface
	AttributeSetting 630 560
	set pin_flag orcapp
	set Para(Fdir) "Fmaco"
	DrawImage 300 480 1.3
	set tnb $Para(tnb)

	#*** Quad Setup ***
	set page [$tnb add -label "Quad"]
	iwidgets::labeledframe .frmP1 -labeltext "" -labelpos nw
	set frmP1 [.frmP1 childsite]

	iwidgets::labeledframe .frmProtocol -labeltext "Protocol Setup" -labelpos nw
	set frmProtocol [.frmProtocol childsite]
	CreateRadioItem $frmProtocol ProMode "" 1 "Quad Based Protocol Mode" Quad "Channel Based Protocol Mode" Channel 28 left Para(Protocol) {ChangeProtocolCmd;ChangeModeCmd;ChangeChannelS_GCmd;DrawPins}
#	set mode_lst {"Gigabit Ethernet" "1G Fibre Channel" "2G Fibre Channel" XAUI "SRIO Type1" "SRIO Type2" "SRIO Type3" PCI-Express OBSAI CPRI "SATA Type1" "SATA Type2"	SMPTE259M SMPTE292M SMPTE344M "Generic 8B10B" "10-bit SERDES Only" "8-bit SERDES Only" "User Defined"}
	#ISPL_CR_32029 - only support pcie & pipe for 6.0s1
	#ISPL_CR_33080 
	#GIGE G8B10B 10BSER 8BSER USERDEF
	#ISPL_CR_35402
	set mode_lst {PCI-Express "Gigabit Ethernet" "Generic 8B10B" "10-bit SERDES Only" "8-bit SERDES Only" SD-SDI HD-SDI CPRI}
	CreateLabelCombobox $frmProtocol Mode "Quad Protocol Mode" 20 20 Para(mode) $mode_lst {InitDataSet;ChangeProtocolCmd;ChangeModeCmd;ChangeChannelS_GCmd;InitClkRate;DrawPins}
	.lblMode config -width 20 -anchor w
	pack .frmMode -in $frmProtocol -anchor w -padx 30 -pady 8
	pack .frmProtocol -in $frmP1 -fill x

	iwidgets::labeledframe .frmP11 -labeltext "Channel Selection and Grouping" -labelpos nw
	set frmP11 [.frmP11 childsite]
	set frmP11Left [frame .frmP11Left]
	Create4RadioItem $frmP11Left Channel0 Channel0 10 Single SINGLE "MCA\nGroup1" GROUP1 "MCA\nGroup2" GROUP2 Disable DISABLE 7 left Para(Channel0) {ChangeChannelS_GCmd;DrawPins}
	Create4RadioItem $frmP11Left Channel1 Channel1 10 Single SINGLE "MCA\nGroup1" GROUP1 "MCA\nGroup2" GROUP2 Disable DISABLE 7 left Para(Channel1) {ChangeChannelS_GCmd;DrawPins}
	Create4RadioItem $frmP11Left Channel2 Channel2 10 Single SINGLE "MCA\nGroup1" GROUP1 "MCA\nGroup2" GROUP2 Disable DISABLE 7 left Para(Channel2) {ChangeChannelS_GCmd;DrawPins}
	Create4RadioItem $frmP11Left Channel3 Channel3 10 Single SINGLE "MCA\nGroup1" GROUP1 "MCA\nGroup2" GROUP2 Disable DISABLE 7 left Para(Channel3) {ChangeChannelS_GCmd;DrawPins}
	.lblChannel0 config -anchor w
	.lblChannel1 config -anchor w
	.lblChannel2 config -anchor w
	.lblChannel3 config -anchor w

	set rate_lst {None "Full Rate" "Half Rate"}
	set frmP11Rigth [frame .frmP11Right]
	CreateLabelCombobox $frmP11Rigth Rate0 "Channel\nRate" 6 8 Para(Rate0) $rate_lst {DrawPins}
	CreateLabelCombobox $frmP11Rigth Rate1 "Channel\nRate" 6 8 Para(Rate1) $rate_lst {DrawPins}
	CreateLabelCombobox $frmP11Rigth Rate2 "Channel\nRate" 6 8 Para(Rate2) $rate_lst {DrawPins}
	CreateLabelCombobox $frmP11Rigth Rate3 "Channel\nRate" 6 8 Para(Rate3) $rate_lst {DrawPins}
	pack .frmP11Left .frmP11Right -in $frmP11 -side left
	pack .frmP11 -in $frmP1 -fill both

	label .lblComment0 -text "MCA: Multi-Channel Alignment (Implemented in soft logic by user)" -state disable
	pack .lblComment0 -in $frmP1 -anchor w -padx 20

	pack .frmP1 -in $page -fill both -expand 1

	#*** Reference Clocks Setup ***
	set page [$tnb add -label "Reference Clocks"]
	iwidgets::labeledframe .frmP2 -labeltext "Quad Clocking Setup" -labelpos nw
	set frmP2 [.frmP2 childsite]

	iwidgets::labeledframe .frmP21 -labeltext "Tx Reference Clock Source Selection" -labelpos nw
	set frmP21 [.frmP21 childsite]
	CreateRadioItem $frmP21 TxRefClk "" 1 "Use REFCLK" REFCLK "Use CORE_TXREFCLK" CORE_TXREFCLK 18 left Para(TxRefClk) {DrawPins}
	pack .frmP21 -in $frmP2 -fill both

	iwidgets::labeledframe .frmP22 -labeltext "Rx Reference Clock Source Selection" -labelpos nw
	set frmP22 [.frmP22 childsite]
	CreateRadioItem $frmP22 RxRefClk "" 1 "Use REFCLK" REFCLK "Use CORE_RXREFCLK" CORE_RXREFCLK 18 left Para(RxRefClk) {DrawPins}
	pack .frmP22 -in $frmP2 -fill both

	iwidgets::labeledframe .frmP23 -labeltext "Reference Clock Rate Multiplier" -labelpos nw
	set frmP23 [.frmP23 childsite]
	CreateLabelEntryLabel $frmP23 ClkRate "Serial Bit Clock Rate" 10 "GHz" "" Para(ClkRate) real
	CreateLabelCombobox $frmP23 ClkMult "Reference Clock Multiplier" 25 10 Para(ClkMult) {8XH 10XH 8X 10X 16X 20X 25X} {ChangeClkRateCmd}
	CreateLabelEntryLabel $frmP23 CalClkRate "Calculated Reference Clock Rate" 10 "MHz" "" Para(CalClkRate) real
	CreateLabelCombobox $frmP23 DataWidth "FPGA Interface Data Bus Width" 25 10 Para(DataWidth) {8 10 16 20} {ChangeClkRateCmd;DrawPins}
	CreateLabelEntryLabel $frmP23 FPGAClkRate "Calculated FPGA Interface Clock Rate" 10 "MHz" "" Para(FPGAClkRate) real
	.lblClkRate config -width 36 -anchor w
	.lblClkMult config -width 36 -anchor w
	.lblCalClkRate config -width 36 -anchor w
	.entryCalClkRate config -state disable
	.lblDataWidth config -width 36 -anchor w
	.lblFPGAClkRate config -width 36 -anchor w
	.entryFPGAClkRate config -state disable
	pack .frmP23 -in $frmP2 -fill both

	.entryClkRate.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeClkRateCmd}
			return 1
		}

	pack .frmP2 -in $page -fill both -expand 1

	#*** Reference Clocks Setup ***
	set page [$tnb add -label "Reference Clocks (CM)"]
	iwidgets::labeledframe .frmP6 -labeltext "Channel Mode Clocking Setup" -labelpos nw
	set frmP6 [.frmP6 childsite]
	
	iwidgets::labeledframe .frmP6TX -labeltext "Tx Reference Clock Source Selection" -labelpos nw
	set frmP6TX [.frmP6TX childsite]
	CreateRadioItem $frmP6TX TxRefClkCM "" 1 "Use REFCLK" REFCLK "Use CORE_TXREFCLK" CORE_TXREFCLK 18 left Para(TxRefClk) {DrawPins}
	
	iwidgets::labeledframe .frmP6RX -labeltext "Rx Reference Clock Source Selection" -labelpos nw
	set frmP6RX [.frmP6RX childsite]
	CreateRadioItem $frmP6RX RxRefClk0CM "Channel0" 18 "Use REFCLK" REFCLK "Use CORE_RXREFCLK" CORE_RXREFCLK 18 left Para(RxRefClk0CM) {DrawPins}
	CreateRadioItem $frmP6RX RxRefClk1CM "Channel1" 18 "Use REFCLK" REFCLK "Use CORE_RXREFCLK" CORE_RXREFCLK 18 left Para(RxRefClk1CM) {DrawPins}
	CreateRadioItem $frmP6RX RxRefClk2CM "Channel2" 18 "Use REFCLK" REFCLK "Use CORE_RXREFCLK" CORE_RXREFCLK 18 left Para(RxRefClk2CM) {DrawPins}
	CreateRadioItem $frmP6RX RxRefClk3CM "Channel3" 18 "Use REFCLK" REFCLK "Use CORE_RXREFCLK" CORE_RXREFCLK 18 left Para(RxRefClk3CM) {DrawPins}
	.lblRxRefClk0CM config -anchor w
	.lblRxRefClk1CM config -anchor w
	.lblRxRefClk2CM config -anchor w
	.lblRxRefClk3CM config -anchor w

	iwidgets::labeledframe .frmP63 -labeltext "Reference Clock Rate Multiplier" -labelpos nw
	set frmP63 [.frmP63 childsite]
	set frmP63L [frame .frmP63Left]
	label .lblTit0 -text "Full Rate Channel"
	pack .lblTit0 -in $frmP63L -anchor e -padx 25
	CreateLabelEntryLabel $frmP63L ClkRateF "Serial Bit Clock Rate" 10 "GHz" "" Para(ClkRate) real
	CreateLabelCombobox $frmP63L ClkMultF "Reference Clock Multiplier" 25 10 Para(ClkMult) {8XH 10XH 8X 10X 16X 20X 25X} {ChangeClkRateCmd}
	CreateLabelEntryLabel $frmP63L CalClkRateF "Calculated Reference Clock Rate" 10 "MHz" "" Para(CalClkRate) real
	CreateLabelCombobox $frmP63L DataWidthF "FPGA Interface Data Bus Width" 25 10 Para(DataWidth) {8 10 16 20} {ChangeClkRateCmd;DrawPins}
	CreateLabelEntryLabel $frmP63L FPGAClkRateF "Calculated FPGA Interface Clock Rate" 10 "MHz" "" Para(FPGAClkRate) real
	.lblClkRateF config -width 36 -anchor w
	.lblClkMultF config -width 36 -anchor w
	.lblCalClkRateF config -width 36 -anchor w
	.entryCalClkRateF config -state disable
	.lblDataWidthF config -width 36 -anchor w
	.lblFPGAClkRateF config -width 36 -anchor w
	.entryFPGAClkRateF config -state disable

	set frmP63R [frame .frmP63Right]
	label .lblTit1 -text "Half Rate Channel"
	pack .lblTit1 -in $frmP63R
	CreateLabelEntryLabel $frmP63R ClkRateH "" 10 "GHz" "" Para(ClkRateH) real
	.lblClkRateH config -width 1
	CreateLabelCombobox $frmP63R ClkMultH "" 1 10 Para(ClkMultH) {8XH 10XH 8X 10X 16X 20X 25X} {ChangeClkRateCmd}
	CreateLabelEntryLabel $frmP63R CalClkRateH "" 10 "MHz" "" Para(CalClkRateH) real
	.lblCalClkRateH config -width 1
	CreateLabelCombobox $frmP63R DataWidthH "" 1 10 Para(DataWidthH) {8 10 16 20} {ChangeClkRateCmd;DrawPins}
	CreateLabelEntryLabel $frmP63R FPGAClkRateH "" 10 "MHz" "" Para(FPGAClkRateH) real
	.lblFPGAClkRateH config -width 1
	.entryClkRateH config -state disable
	.cboClkMultH config -state disabled
	.entryCalClkRateH config -state disable
	.entryFPGAClkRateH config -state disable
	
	pack .frmP63Left .frmP63Right -in $frmP63 -side left
	
	pack .frmP6TX .frmP6RX .frmP63 -in $frmP6 -fill both
	pack .frmP6 -in $page -fill both -expand 1
	
	#*** SerDes Advanced Setup ***
	set page [$tnb add -label "SerDes Advanced"]
		#*** Transmit Settings ***#
	iwidgets::labeledframe .frmP31 -labeltext "Transmit Settings" -labelpos nw
	set frmP31 [.frmP31 childsite]
	label .lblTxCh0 -text Ch0
	label .lblTxCh1 -text Ch1
	label .lblTxCh2 -text Ch2
	label .lblTxCh3 -text Ch3
	grid x .lblTxCh0 .lblTxCh1 .lblTxCh2 .lblTxCh3 -in $frmP31 -sticky w

	label .lblOutV -text "Differential Output Voltage"
	iwidgets::combobox .cboVCh0 -width 8 -editable false -textvariable Para(VCh0) -selectioncommand {}
	iwidgets::combobox .cboVCh1 -width 8 -editable false -textvariable Para(VCh1) -selectioncommand {}
	iwidgets::combobox .cboVCh2 -width 8 -editable false -textvariable Para(VCh2) -selectioncommand {}
	iwidgets::combobox .cboVCh3 -width 8 -editable false -textvariable Para(VCh3) -selectioncommand {}
	.cboVCh0 insert list end 0 1 2 3 4 5 6 7
	.cboVCh1 insert list end 0 1 2 3 4 5 6 7
	.cboVCh2 insert list end 0 1 2 3 4 5 6 7
	.cboVCh3 insert list end 0 1 2 3 4 5 6 7
	grid .lblOutV .cboVCh0 .cboVCh1 .cboVCh2 .cboVCh3 -in $frmP31 -padx 2 -sticky w

	label .lblPre -text "PreEmphasis"
	iwidgets::combobox .cboPreCh0 -width 8 -editable false -textvariable Para(PreCh0) -selectioncommand {}
	iwidgets::combobox .cboPreCh1 -width 8 -editable false -textvariable Para(PreCh1) -selectioncommand {}
	iwidgets::combobox .cboPreCh2 -width 8 -editable false -textvariable Para(PreCh2) -selectioncommand {}
	iwidgets::combobox .cboPreCh3 -width 8 -editable false -textvariable Para(PreCh3) -selectioncommand {}
# Rev 3.8	
#	.cboPreCh0 insert list end DISABLE X0 X16 X32 X48 X64 X80
	.cboPreCh0 insert list end DISABLE 0 1 2 3 4 5 6
	.cboPreCh1 insert list end DISABLE 0 1 2 3 4 5 6
	.cboPreCh2 insert list end DISABLE 0 1 2 3 4 5 6
	.cboPreCh3 insert list end DISABLE 0 1 2 3 4 5 6
	grid .lblPre .cboPreCh0 .cboPreCh1 .cboPreCh2 .cboPreCh3 -in $frmP31 -padx 2 -sticky w -pady 4

	label .lblTx -text "TX I/O Termination(Ohms)"
	iwidgets::combobox .cboTxCh0 -width 8 -editable false -textvariable Para(TxCh0) -selectioncommand {}
	iwidgets::combobox .cboTxCh1 -width 8 -editable false -textvariable Para(TxCh1) -selectioncommand {}
	iwidgets::combobox .cboTxCh2 -width 8 -editable false -textvariable Para(TxCh2) -selectioncommand {}
	iwidgets::combobox .cboTxCh3 -width 8 -editable false -textvariable Para(TxCh3) -selectioncommand {}
	.cboTxCh0 insert list end 50 75 5K
	.cboTxCh1 insert list end 50 75 5K
	.cboTxCh2 insert list end 50 75 5K
	.cboTxCh3 insert list end 50 75 5K
	grid .lblTx .cboTxCh0 .cboTxCh1 .cboTxCh2 .cboTxCh3 -in $frmP31 -padx 2 -sticky w

	pack .frmP31 -in $page -fill both

		#*** Receive Settings ***#
	iwidgets::labeledframe .frmP32 -labeltext "Receive Settings" -labelpos nw
	set frmP32 [.frmP32 childsite]
	label .lblRxCh0 -text Ch0
	label .lblRxCh1 -text Ch1
	label .lblRxCh2 -text Ch2
	label .lblRxCh3 -text Ch3
	grid x .lblRxCh0 .lblRxCh1 .lblRxCh2 .lblRxCh3 -in $frmP32 -sticky w

	label .lblEq -text "Equalization"
	iwidgets::combobox .cboEqCh0 -width 12 -editable false -textvariable Para(EqCh0) -selectioncommand {DrawPins}
	iwidgets::combobox .cboEqCh1 -width 12 -editable false -textvariable Para(EqCh1) -selectioncommand {DrawPins}
	iwidgets::combobox .cboEqCh2 -width 12 -editable false -textvariable Para(EqCh2) -selectioncommand {DrawPins}
	iwidgets::combobox .cboEqCh3 -width 12 -editable false -textvariable Para(EqCh3) -selectioncommand {DrawPins}
	.cboEqCh0 insert list end DISABLE MID_LOW MID_MED MID_HIGH LONG_LOW LONG_MED LONG_HIGH
	.cboEqCh1 insert list end DISABLE MID_LOW MID_MED MID_HIGH LONG_LOW LONG_MED LONG_HIGH
	.cboEqCh2 insert list end DISABLE MID_LOW MID_MED MID_HIGH LONG_LOW LONG_MED LONG_HIGH
	.cboEqCh3 insert list end DISABLE MID_LOW MID_MED MID_HIGH LONG_LOW LONG_MED LONG_HIGH
	grid .lblEq .cboEqCh0 .cboEqCh1 .cboEqCh2 .cboEqCh3 -in $frmP32 -padx 1 -sticky w

	label .lblRxTerm -text "RX I/O Termination(Ohms)"
	iwidgets::combobox .cboRxTermCh0 -width 8 -editable false -textvariable Para(RxTermCh0) -selectioncommand {}
	iwidgets::combobox .cboRxTermCh1 -width 8 -editable false -textvariable Para(RxTermCh1) -selectioncommand {}
	iwidgets::combobox .cboRxTermCh2 -width 8 -editable false -textvariable Para(RxTermCh2) -selectioncommand {}
	iwidgets::combobox .cboRxTermCh3 -width 8 -editable false -textvariable Para(RxTermCh3) -selectioncommand {}
# Rev 3.8
#	.cboRxTermCh0 insert list end 50 60 75 2K
	.cboRxTermCh0 insert list end 50 60 75 HIGH
	.cboRxTermCh1 insert list end 50 60 75 HIGH
	.cboRxTermCh2 insert list end 50 60 75 HIGH
	.cboRxTermCh3 insert list end 50 60 75 HIGH
	grid .lblRxTerm .cboRxTermCh0 .cboRxTermCh1 .cboRxTermCh2 .cboRxTermCh3 -in $frmP32 -padx 2 -sticky w -pady 4

	label .lblRxCoup -text "RX I/O Coupling"
	iwidgets::combobox .cboRxCoupCh0 -width 8 -editable false -textvariable Para(RxCoupCh0) -selectioncommand {DrawPins}
	iwidgets::combobox .cboRxCoupCh1 -width 8 -editable false -textvariable Para(RxCoupCh1) -selectioncommand {DrawPins}
	iwidgets::combobox .cboRxCoupCh2 -width 8 -editable false -textvariable Para(RxCoupCh2) -selectioncommand {DrawPins}
	iwidgets::combobox .cboRxCoupCh3 -width 8 -editable false -textvariable Para(RxCoupCh3) -selectioncommand {DrawPins}
	.cboRxCoupCh0 insert list end AC DC
	.cboRxCoupCh1 insert list end AC DC
	.cboRxCoupCh2 insert list end AC DC
	.cboRxCoupCh3 insert list end AC DC
	grid .lblRxCoup .cboRxCoupCh0 .cboRxCoupCh1 .cboRxCoupCh2 .cboRxCoupCh3 -in $frmP32 -padx 2 -sticky w

	label .lblLoss -text "Loss of Signal Threshold"
	iwidgets::combobox .cboLoss -width 8 -editable false -textvariable Para(Loss) -selectioncommand {}
	# rev 6.0
	#.cboLoss insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	.cboLoss insert list end 0 1 2 3 4 5 6 7
	grid .lblLoss .cboLoss -in $frmP32 -padx 2 -sticky w -pady 4

	label .lblCDRLoss -text "CDR Loss of Lock"
	iwidgets::combobox .cboCDRLoss -width 8 -editable false -textvariable Para(CDRLoss) -selectioncommand {}
	.cboCDRLoss insert list end 0
#	grid .lblCDRLoss .cboCDRLoss -in $frmP32 -padx 2 -sticky w
  #ISPL_CR_31199

	pack .frmP32 -in $page -fill both

		#*** Clock and PLL Settings ***#
	iwidgets::labeledframe .frmP33 -labeltext "Clock and PLL Settings" -labelpos nw
	set frmP33 [.frmP33 childsite]
	CreateLabelCombobox $frmP33 TxTerm "TX PLL Reference Clock IO Termination(Ohms)" 20 8 Para(TxTerm) {50 2K} {}
	.lblTxTerm config -width 40 -anchor w
	CreateLabelCombobox $frmP33 TxCoup "TX PLL Reference Clock IO Coupling" 20 8 Para(TxCoup) {AC DC} {DrawPins}
	.lblTxCoup config -width 40 -anchor w
	CreateLabelCombobox $frmP33 TxPllLoss "PLL Loss of Lock" 20 8 Para(TxPllLoss) {0 1 2 3} {}
	.lblTxPllLoss config -width 40 -anchor w

	pack .frmP33 -in $page -fill both

	#*** PCS Advanced Setup ***
	set page [$tnb add -label "PCS Advanced"]
		#*** Transmit & Receive Settings ***#
	iwidgets::labeledframe .frmP40 -labeltext "Transmit & Receive Settings" -labelpos nw
	set frmP40 [.frmP40 childsite]
	label .lblTxRxCh40 -text Ch0
	label .lblTxRxCh41 -text Ch1
	label .lblTxRxCh42 -text Ch2
	label .lblTxRxCh43 -text Ch3
	grid x .lblTxRxCh40 .lblTxRxCh41 .lblTxRxCh42 .lblTxRxCh43 -in $frmP40 -sticky w

	label .lblRxMode -text "Rx_Tx 8B10B Mode" -width 16 -anchor w
	iwidgets::combobox .cboRxModeCh0 -width 8 -editable false -textvariable Para(RxModeCh0) -selectioncommand {DrawPins}
	iwidgets::combobox .cboRxModeCh1 -width 8 -editable false -textvariable Para(RxModeCh1) -selectioncommand {DrawPins}
	iwidgets::combobox .cboRxModeCh2 -width 8 -editable false -textvariable Para(RxModeCh2) -selectioncommand {DrawPins}
	iwidgets::combobox .cboRxModeCh3 -width 8 -editable false -textvariable Para(RxModeCh3) -selectioncommand {DrawPins}
	.cboRxModeCh0 insert list end NORMAL BYPASS
	.cboRxModeCh1 insert list end NORMAL BYPASS
	.cboRxModeCh2 insert list end NORMAL BYPASS
	.cboRxModeCh3 insert list end NORMAL BYPASS
	grid .lblRxMode .cboRxModeCh0 .cboRxModeCh1 .cboRxModeCh2 .cboRxModeCh3 -in $frmP40 -padx 2 -sticky w

	pack .frmP40 -in $page -fill both

		#*** Transmit Settings ***#
	iwidgets::labeledframe .frmP41 -labeltext "Transmit Settings" -labelpos nw
	set frmP41 [.frmP41 childsite]
	label .lblTxCh40 -text Ch0
	label .lblTxCh41 -text Ch1
	label .lblTxCh42 -text Ch2
	label .lblTxCh43 -text Ch3
	grid x .lblTxCh40 .lblTxCh41 .lblTxCh42 .lblTxCh43 -in $frmP41 -sticky w

	label .lblTxInv -text "TxInvert" -width 16 -anchor w
	iwidgets::combobox .cboTxInvCh0 -width 8 -editable false -textvariable Para(TxInvCh0) -selectioncommand {DrawPins}
	iwidgets::combobox .cboTxInvCh1 -width 8 -editable false -textvariable Para(TxInvCh1) -selectioncommand {DrawPins}
	iwidgets::combobox .cboTxInvCh2 -width 8 -editable false -textvariable Para(TxInvCh2) -selectioncommand {DrawPins}
	iwidgets::combobox .cboTxInvCh3 -width 8 -editable false -textvariable Para(TxInvCh3) -selectioncommand {DrawPins}
	.cboTxInvCh0 insert list end NORMAL INV
	.cboTxInvCh1 insert list end NORMAL INV
	.cboTxInvCh2 insert list end NORMAL INV
	.cboTxInvCh3 insert list end NORMAL INV
	grid .lblTxInv .cboTxInvCh0 .cboTxInvCh1 .cboTxInvCh2 .cboTxInvCh3 -in $frmP41 -padx 2 -sticky w

	pack .frmP41 -in $page -fill both

		#*** Receive Settings ***#
	iwidgets::labeledframe .frmP42 -labeltext "Receive Settings" -labelpos nw
	set frmP42 [.frmP42 childsite]
	frame .frmP421
	label .lblRxCh420 -text Ch0
	label .lblRxCh421 -text Ch1
	label .lblRxCh422 -text Ch2
	label .lblRxCh423 -text Ch3
	grid x .lblRxCh420 .lblRxCh421 .lblRxCh422 .lblRxCh423 -in .frmP421 -sticky w

	label .lblRxInv -text "RxInvert" -width 16 -anchor w
	iwidgets::combobox .cboRxInvCh0 -width 8 -editable false -textvariable Para(RxInvCh0) -selectioncommand {DrawPins}
	iwidgets::combobox .cboRxInvCh1 -width 8 -editable false -textvariable Para(RxInvCh1) -selectioncommand {DrawPins}
	iwidgets::combobox .cboRxInvCh2 -width 8 -editable false -textvariable Para(RxInvCh2) -selectioncommand {DrawPins}
	iwidgets::combobox .cboRxInvCh3 -width 8 -editable false -textvariable Para(RxInvCh3) -selectioncommand {DrawPins}
	.cboRxInvCh0 insert list end NORMAL INV
	.cboRxInvCh1 insert list end NORMAL INV
	.cboRxInvCh2 insert list end NORMAL INV
	.cboRxInvCh3 insert list end NORMAL INV
	grid .lblRxInv .cboRxInvCh0 .cboRxInvCh1 .cboRxInvCh2 .cboRxInvCh3 -in .frmP421 -padx 2 -sticky w


	pack .frmP421 -in $frmP42 -side top
	
			#*** Word Algnment ***#
	iwidgets::labeledframe .frmP422 -labeltext "Word Alignment" -labelpos nw
	set frmP422 [.frmP422 childsite]
	CreateLabelEntryLabel $frmP422 Plus "Plus Comma Value" 12 "" "" Para(Plus) {bin %c}
	CreateLabelEntryLabel $frmP422 Minus "Minus Comma Value" 12 "" "" Para(Minus) {bin %c}
	CreateLabelEntryLabel $frmP422 Mask "Comma Mask" 12 "" "" Para(Mask) {bin %c}
	CreateLabelCombobox $frmP422 Align "Comma Align" 20 12 Para(Align) {AUTO DYNAMIC BYPASS CONTINUOUS} {DrawPins}
	.lblTxCoup config -width 40 -anchor w
	.lblPlus config -width 20 -anchor w
	.lblMinus config -width 20 -anchor w
	.lblMask config -width 20 -anchor w
	.lblAlign config -width 20 -anchor w
	#ISPL_CR_34285
	.entryPlus config -state disabled
	.entryMinus config -state disabled
	.entryMask config -state disabled

	pack .frmP422 -in $frmP42 -side top -fill x

			#*** Word Algnment ***#
	iwidgets::labeledframe .frmP423 -labeltext "Clock Tolerance Compensation" -labelpos nw
	set frmP423 [.frmP423 childsite]
	label .lblRxCh4230 -text Ch0
	label .lblRxCh4231 -text Ch1
	label .lblRxCh4232 -text Ch2
	label .lblRxCh4233 -text Ch3
	grid x .lblRxCh4230 .lblRxCh4231 .lblRxCh4232 .lblRxCh4233 -in $frmP423 -sticky w

	label .lblCTC -text "CTC" -width 16 -anchor w
	iwidgets::combobox .cboCTCCh0 -width 8 -editable false -textvariable Para(CTCCh0) -selectioncommand {DrawPins}
	iwidgets::combobox .cboCTCCh1 -width 8 -editable false -textvariable Para(CTCCh1) -selectioncommand {DrawPins}
	iwidgets::combobox .cboCTCCh2 -width 8 -editable false -textvariable Para(CTCCh2) -selectioncommand {DrawPins}
	iwidgets::combobox .cboCTCCh3 -width 8 -editable false -textvariable Para(CTCCh3) -selectioncommand {DrawPins}
	.cboCTCCh0 insert list end NORMAL BYPASS
	.cboCTCCh1 insert list end NORMAL BYPASS
	.cboCTCCh2 insert list end NORMAL BYPASS
	.cboCTCCh3 insert list end NORMAL BYPASS
	grid .lblCTC .cboCTCCh0 .cboCTCCh1 .cboCTCCh2 .cboCTCCh3 -in $frmP423 -padx 2 -sticky w

	label .lblCC_MATCH1 -text "CC_MATCH1"
	iwidgets::entryfield .entryCC_MATCH1 -width 12 -textvariable Para(CC_MATCH1) -fixed 10 -validate {bin %c}
	grid .lblCC_MATCH1 .entryCC_MATCH1 -in $frmP423 -padx 2 -sticky w -pady 4

	label .lblCC_MATCH2 -text "CC_MATCH2"
	iwidgets::entryfield .entryCC_MATCH2 -width 12 -textvariable Para(CC_MATCH2) -fixed 10 -validate {bin %c}
	label .lblMinIPG -text "RX CTC Min IPG"
	iwidgets::combobox .cboMinIPG -width 8 -editable false -textvariable Para(MinIPG) -selectioncommand {}
	.cboMinIPG insert list end 0 1 2 3
	grid .lblCC_MATCH2 .entryCC_MATCH2 -in $frmP423 -padx 2 -sticky w
	grid .lblMinIPG -in $frmP423 -row 3 -column 2 -columnspan 2 -sticky w
	grid .cboMinIPG -in $frmP423 -row 3 -column 4 -sticky w

	label .lblCC_MATCH3 -text "CC_MATCH3"
	iwidgets::entryfield .entryCC_MATCH3 -width 12 -textvariable Para(CC_MATCH3) -fixed 10 -validate {bin %c}
	label .lblHigh -text "High Watermark"
	iwidgets::combobox .cboHigh -width 8 -editable false -textvariable Para(High) -selectioncommand {}
	.cboHigh insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	grid .lblCC_MATCH3 .entryCC_MATCH3 -in $frmP423 -padx 2 -sticky w -pady 4
	grid .lblHigh -in $frmP423 -row 4 -column 2 -columnspan 2 -sticky w
	grid .cboHigh -in $frmP423 -row 4 -column 4 -sticky w

	label .lblCC_MATCH4 -text "CC_MATCH4"
	iwidgets::entryfield .entryCC_MATCH4 -width 12 -textvariable Para(CC_MATCH4) -fixed 10 -validate {bin %c}
	label .lblLow -text "Low Watermark"
	iwidgets::combobox .cboLow -width 8 -editable false -textvariable Para(Low) -selectioncommand {}
	.cboLow insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	grid .lblCC_MATCH4 .entryCC_MATCH4 -in $frmP423 -padx 2 -sticky w
	grid .lblLow -in $frmP423 -row 5 -column 2 -columnspan 2 -sticky w
	grid .cboLow -in $frmP423 -row 5 -column 4 -sticky w

	label .lblCC_MATCH_MODE -text "CC_MATCH_MODE"
	iwidgets::combobox .cboCC_MATCH_MODE -width 16 -editable false -textvariable Para(CC_MATCH_MODE) -selectioncommand {DrawPins}
	.cboCC_MATCH_MODE insert list end MATCH_3_4 MATCH_4 MATCH_1_2_3_4
	grid .lblCC_MATCH_MODE .cboCC_MATCH_MODE -in $frmP423 -padx 2 -sticky w -pady 4

	pack .frmP423 -in $frmP42 -side top -fill both

	#ISPL_CR_34285
	.entryCC_MATCH1 config -state disabled
	.entryCC_MATCH2 config -state disabled
	.entryCC_MATCH3 config -state disabled
	.entryCC_MATCH4 config -state disabled
	
	pack .frmP42 -in $page -fill both

	#*** Optional Port Setup ***
	set page [$tnb add -label "Optional Port"]
	iwidgets::labeledframe .frmP5 -labeltext "" -labelpos nw
	set frmP5 [.frmP5 childsite]

	iwidgets::labeledframe .frmP51 -labeltext "Control Ports" -labelpos nw
	set frmP51 [.frmP51 childsite]
	label .lblRxData -text "Dynamic Inversion of Received Data"
	checkbutton .ckRxDataCh0 -text Ch0 -variable Para(RxDataCh0) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckRxDataCh1 -text Ch1 -variable Para(RxDataCh1) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckRxDataCh2 -text Ch2 -variable Para(RxDataCh2) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckRxDataCh3 -text Ch3 -variable Para(RxDataCh3) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	grid .lblRxData .ckRxDataCh0 .ckRxDataCh1 .ckRxDataCh2 .ckRxDataCh3 -in $frmP51 -padx 2 -sticky w

  #ISPL_CR_31197
	label .lblAligner -text "Enable Comma Aligner"
	checkbutton .ckAlignerCh0 -text Ch0 -variable Para(AlignerCh0) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckAlignerCh1 -text Ch1 -variable Para(AlignerCh1) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckAlignerCh2 -text Ch2 -variable Para(AlignerCh2) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckAlignerCh3 -text Ch3 -variable Para(AlignerCh3) -onvalue TRUE -offvalue FALSE -command {DrawPins}
#	grid .lblAligner .ckAlignerCh0 .ckAlignerCh1 .ckAlignerCh2 .ckAlignerCh3 -in $frmP51 -padx 2 -sticky w

	label .lblDetect -text "Signal Detect"
	checkbutton .ckDetectCh0 -text Ch0 -variable Para(DetectCh0) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckDetectCh1 -text Ch1 -variable Para(DetectCh1) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckDetectCh2 -text Ch2 -variable Para(DetectCh2) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckDetectCh3 -text Ch3 -variable Para(DetectCh3) -onvalue TRUE -offvalue FALSE -command {DrawPins}
#	grid .lblDetect .ckDetectCh0 .ckDetectCh1 .ckDetectCh2 .ckDetectCh3 -in $frmP51 -padx 2 -sticky w

	label .lblELSM -text "External Link State Machine"
	checkbutton .ckELSMCh0 -text Ch0 -variable Para(ELSMCh0) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckELSMCh1 -text Ch1 -variable Para(ELSMCh1) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckELSMCh2 -text Ch2 -variable Para(ELSMCh2) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckELSMCh3 -text Ch3 -variable Para(ELSMCh3) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	grid .lblELSM .ckELSMCh0 .ckELSMCh1 .ckELSMCh2 .ckELSMCh3 -in $frmP51 -padx 2 -sticky w

	label .lblTeidle -text "Transmitter Electrical Idle"
	checkbutton .ck_teidleCh0 -text Ch0 -variable Para(_teidleCh0) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ck_teidleCh1 -text Ch1 -variable Para(_teidleCh1) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ck_teidleCh2 -text Ch2 -variable Para(_teidleCh2) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ck_teidleCh3 -text Ch3 -variable Para(_teidleCh3) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	grid .lblTeidle .ck_teidleCh0 .ck_teidleCh1 .ck_teidleCh2 .ck_teidleCh3 -in $frmP51 -padx 2 -sticky w

	pack .frmP51 -in $frmP5 -fill both

	checkbutton .ckPorts0 -text "Loopback Mode (Rx to Tx)" -variable Para(Ports0) -onvalue TRUE -offvalue FALSE -command {ChangeLoopCmd;DrawPins}
	pack .ckPorts0 -in $frmP5 -anchor w -padx 20
	Create3RadioItem $frmP5 Ports0 "" 2 \
		"Serial Loopback (Rx Equalization to Tx, No Clock)" "Serial Loopback" \
		"SerDes Parallel Loopback" "SerDes Parallel Loopback" \
		"PCS Parallel Loopback" "PCS Parallel Loopback" 40 top Para(rdoPorts0) {DrawPins}
	pack .frmPorts0 -in $frmP5 -side top -anchor w -padx 40
	
	checkbutton .ckPorts2 -text "Reference Clock to FPGA Core" -variable Para(Ports2) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	checkbutton .ckPorts3 -text "SCI (SerDes Client Interface)" -variable Para(Ports3) -onvalue TRUE -offvalue FALSE -command {ChangeSCICmd;DrawPins}
	checkbutton .ckPorts4 -text "PLL Quarter Clock" -variable Para(Ports4) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	pack .ckPorts2 .ckPorts4 .ckPorts3 -in $frmP5 -anchor w -padx 20

	checkbutton .ckPorts3_1 -text "SCI Interrupt" -variable Para(Ports3_1) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	pack .ckPorts3_1 -in $frmP5 -anchor w -padx 40

	checkbutton .ckPorts1 -text "Error Status" -variable Para(Ports1) -onvalue TRUE -offvalue FALSE -command {DrawPins}
	pack .ckPorts1 -in $frmP5 -anchor w -padx 20

	iwidgets::labeledframe .frmP53 -labeltext "Reset Sequence Generation" -labelpos nw
	set frmP53 [.frmP53 childsite]
	checkbutton .ck_rst_gen -text "Include Reset Sequence Generation" -onvalue ENABLED -offvalue DISABLED -variable Para(_rst_gen) -command {ChangeChannelS_GCmd;DrawPins}
	label .lbl_rx_los_port -text "Receive LOS Port"
	for {set i 0} {$i<4} {incr i} {
		label .lblP53Ch$i -text Ch$i
		iwidgets::combobox .cbo_rx_los_port$i -width 9 -editable false -textvariable Para(_rx_los_port$i) -selectioncommand {ChangeChannelS_GCmd;DrawPins}
		
		.cbo_rx_los_port$i insert list end Internal External
	}
	grid .ck_rst_gen -in $frmP53 -columnspan 5 -sticky w -padx 8
	grid x .lblP53Ch0 .lblP53Ch1 .lblP53Ch2 .lblP53Ch3 -in $frmP53 -sticky w -padx 8 -pady 2
	grid .lbl_rx_los_port .cbo_rx_los_port0 .cbo_rx_los_port1 .cbo_rx_los_port2 .cbo_rx_los_port3 -in $frmP53 -sticky w -padx 4
	pack .frmP53 -in $frmP5 -fill x -anchor w ;#-padx 20
	
	#R8.0p
	set Para(_rst_gen) DISABLED
	.ck_rst_gen config -state disabled

	pack .frmP5 -in $page -fill both -expand 1

	#*** Generation Options ***
	set page [$tnb add -label "Generation"]
	iwidgets::labeledframe .frmGeneral -labelpos nw
	set frmGeneral [.frmGeneral childsite]
	radiobutton .rdo1Regen -value auto    -variable Para(Regen) -text "Automatic (Generate Module and Settings as needed)" -command {ChangeSettingsCmd}
	checkbutton .ck1PAR -variable Para(PAR1) -text "Force Place & Route Process Reset" -command {ChangeRegen1Cmd1}
	checkbutton .ck1PARTrace -variable Para(PARTrace1) -text "Force Place & Route Trace Process Reset" -command {ChangeRegen1Cmd2}
	radiobutton .rdo2Regen -value module  -variable Para(Regen) -text "Force Module and Settings Generation" -command {ChangeSettingsCmd}
	radiobutton .rdo3Regen -value setting -variable Para(Regen) -text "Force Settings Generation Only (error if module generation required)" -command {ChangeSettingsCmd}
	checkbutton .ck3PAR -variable Para(PAR3) -text "Force Place & Route Process Reset"  -state disabled -command {ChangeRegen3Cmd1}
	checkbutton .ck3PARTrace -variable Para(PARTrace3) -text "Force Place & Route Trace Process Reset" -state disabled -command {ChangeRegen3Cmd2}

	pack .rdo1Regen -in $frmGeneral -anchor w -padx 10
	if {$Para(bali) == "true"} {
		pack .ck1PAR -in $frmGeneral -anchor w -padx 30
		pack .ck1PARTrace -in $frmGeneral -anchor w -padx 30
	}
	pack .rdo2Regen -in $frmGeneral -anchor w -padx 10 -pady 8
	pack .rdo3Regen -in $frmGeneral -anchor w -padx 10
	if {$Para(bali) == "true"} {
		pack .ck3PAR -in $frmGeneral -anchor w -padx 30
		pack .ck3PARTrace -in $frmGeneral -anchor w -padx 30 
	}
	pack .frmGeneral -in $page -fill x

	GeneralConfig
	$tnb view 0

	ChangeModeCmd
	ChangeProtocolCmd
	ChangeChannelS_GCmd
	ChangeSCICmd
	ChangeSettingsCmd
	
	#FunctionButton
	#CenterPosition
}
