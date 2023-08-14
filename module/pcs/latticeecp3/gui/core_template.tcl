#$Header: L:/module/pcs/latticeecp3/gui/core_template.tcl 1.2 mghuang Exp $

#P4 Diamond 3.6 IPExpress: fixed SOF-125014
#P4 Rev 1.2: Diamond 3.5 IPExpress: fixed SOF-50597
#Rev 1.93: Diamond 3.1 IPExpress: fixed SOF-119101
#Rev 1.92: Diamond 2.0.1 IPExpress: fixed CR_55706
#Rev 1.91: Diamond 2.1 IPExpress: Fixed CR_58045
#Rev 1.90: Diamond 2.0 IPExpress: CR_57369
#Rev 1.89: Diamond 1.4 IPExpress: CR_51701
#Rev 1.88: Diamond 1.4 IPExpress: ECN_36, CR_51701,51690,48505
#Rev 1.86,87: Diamond 1.2 IPExpress: Fixed CR_51697,52438
#Rev 1.85: Diamond 1.2 IPExpress: ECN33, CR51682
#Rev 1.84: Diamond 1.1 IPExpress: Fixed CR_51644
#Rev 1.83: Diamond 1.1 IPExpress: Fixed CR_50907
#Rev 1.82: Diamond 1.1 IPExpress: ECN needed: ecp3 PCS reset sm
#Rev 1.81: 8.1sp1 IPExpress: Fixed CR_46676,48773
#Rev 1.78: 8.0sp1 IPExpress: Fixed cr_48529
#Rev 1.75: 8.0sp1 IPExpress: Fixed cr_46274,48494
#Rev 1.74: 8.0sp1 IPExpress: Fixed cr_48486,48488,48489,48491,48492 

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

#ISPL_CR_57369: 17EA 328 csBGA package provides only 2 channels
proc CSBGA328_Enhancement {} {
	global Para
	
	if {$Para(PartType) == "LFE3-17EA" && $Para(Package) == "CSBGA328"} {
	#tk_messageBox -default ok -message Para(PartType)=$Para(PartType)\nPara(Package)=$Para(Package) -title CSBGA328_Enhancement
		for {set i 1} {$i<3} {incr i} {
			.cbo_protocol$i config -state disabled
			.lbl_mode$i		config -state disabled
			.rdo1_mode$i    config -state disabled
			.rdo2_mode$i    config -state disabled
			.rdo3_mode$i    config -state disabled
			.rdo4_mode$i    config -state disabled
			.cbo_protocol$i config -state disabled
			.ck_ldr$i		config -state disabled
			
			set Para(_mode$i) "DISABLED"
			set Para(_protocol$i) "G8B10B"
			set Para(_ldr$i)  "DISABLED"
		}		
	}
}

proc Config150TW {} {
	global Para
	
	#8.0 SP1 ECN ¨C Support of ECP3-150EA/TW Device
#	set Para(tw_flag) "false"
	if {[string last "TW" $Para(PartName)] != -1} {
		if {$Para(new) == "1"} {
			set Para(tw_flag) "true"
		} else {
			if {$Para(tw_flag) == "false"} {
				if {$Para(_ctc0) == "ENABLED" || $Para(_ctc1) == "ENABLED" || 
				    $Para(_ctc2) == "ENABLED" || $Para(_ctc3) == "ENABLED"} {
					set msg "ECP3 EA TW devices do not support the CTC. The CTC will be disabled before generation. Continue and convert?"
					set answer [tk_messageBox -default ok -icon question -message $msg -title Warning -type okcancel]
					if {$answer == "cancel"} {
						exit
					}
					set Para(tw_flag) "true"
				}
			}
		}
		if {$Para(tw_flag) == "true"} {
			for {set i 0} {$i<4} {incr i} {
				set Para(_ctc$i) DISABLED
				.cbo_ctc$i config -state disabled
			}
		}
	}
}

proc GetDevType {} {
	global Para

	regexp {(^[a-zA-Z0-9]+)-([0-9]+)?(.*)$} $Para(PartType) match x y z
	set Para(dev_type) $z
	#tk_messageBox -default ok -icon info -message $Para(dev_type) -title GetDevType -type ok
}

proc SetGlobalConstant {} {
	global Para
	
	set Para(K28P5+) "1100000101"
	set Para(K28P5-) "0011111010"
	set Para(K28P5M) "1111111111"
	set Para(K28P157+) "1100000101"
	set Para(K28P157-) "0011111010"
	set Para(K28P157M) "1111111100"
	
	set Para(K28P0) "00011100"
	set Para(K28P5) "10111100"
	set Para(K29P7) "11111101"
	set Para(D16P2) "01010000"
	set Para(D21P4) "10010101"
	set Para(D21P5) "10110101"
}

proc G8B10B_default {j} {
	global Para
	set Para(_ldr$j) DISABLED
	set Para(_pll_rxsrc$j) EXTERNAL
	set Para(_rx_data_rate$j) FULL
	set Para(_tx_data_rate$j) FULL
	set Para(_rx_fifo$j) ENABLED
	set Para(_tx_fifo$j) ENABLED
	set Para(_rx_data_width$j) 8
	set Para(_tx_data_width$j) 8
	set Para(_tdrv_ch$j) 0
	set Para(_rx_eq$j) DISABLED
	set Para(_tx_pre$j) DISABLED
	set Para(_los_threshold_lo$j) 2
	set Para(_rterm_tx$j) 50
	set Para(_rterm_rx$j) 50
	set Para(_rx_dcc$j) AC
	set Para(_tx_sb$j) DISABLED
	set Para(_rx_sb$j) DISABLED
	set Para(_tx_8b10b$j) ENABLED
	set Para(_rx_8b10b$j) ENABLED
	set Para(_ilsm$j) ENABLED
	set Para(_rxwa$j) ENABLED
	set Para(_ctc$j) DISABLED
	set Para(_cc_match_mode$j) 1
	set Para(_cc_min_ipg$j) 3
}

proc PCIE_default {j} {
	global Para
	set Para(_ldr$j) DISABLED
	set Para(_pll_rxsrc$j) EXTERNAL
	set Para(_rx_data_rate$j) FULL
	set Para(_tx_data_rate$j) FULL
	set Para(_rx_fifo$j) ENABLED
	set Para(_tx_fifo$j) ENABLED
	set Para(_rx_data_width$j) 8
	set Para(_tx_data_width$j) 8
	set Para(_tdrv_ch$j) 1
	set Para(_rx_eq$j) MID_LOW
	set Para(_tx_pre$j) 3
	#set Para(_los_threshold_lo$j) 2
	set Para(_rterm_tx$j) 50
	set Para(_rterm_rx$j) 50
	set Para(_rx_dcc$j) AC
	set Para(_tx_sb$j) ENABLED
	set Para(_rx_sb$j) ENABLED
	set Para(_tx_8b10b$j) ENABLED
	set Para(_rx_8b10b$j) ENABLED
	set Para(_ilsm$j) ENABLED
	set Para(_ird$j) ENABLED
	set Para(_rxwa$j) ENABLED
	set Para(_ctc$j) DISABLED
	set Para(_cc_match_mode$j) 2
	set Para(_cc_min_ipg$j) 0
}

proc SGMII_default {j} {
	global Para
	set Para(_ldr$j) DISABLED
	set Para(_pll_rxsrc$j) EXTERNAL
	set Para(_rx_data_rate$j) FULL
	set Para(_tx_data_rate$j) FULL
	set Para(_rx_fifo$j) ENABLED
	set Para(_tx_fifo$j) ENABLED
	set Para(_rx_data_width$j) 8
	set Para(_tx_data_width$j) 8
	set Para(_tdrv_ch$j) 0
	set Para(_rx_eq$j) DISABLED
	set Para(_tx_pre$j) DISABLED
	set Para(_los_threshold_lo$j) 2
	set Para(_rterm_tx$j) 50
	set Para(_rterm_rx$j) 50
	set Para(_rx_dcc$j) AC
	set Para(_tx_sb$j) DISABLED
	set Para(_rx_sb$j) DISABLED
	set Para(_tx_8b10b$j) ENABLED
	set Para(_rx_8b10b$j) ENABLED
	set Para(_ilsm$j) ENABLED
	set Para(_rxwa$j) ENABLED
	set Para(_ctc$j) DISABLED
	set Para(_cc_match_mode$j) 2

	set Para(_k0$j) 00
	set Para(_byten0$j) 00000000
	set Para(_k1$j) 00
	set Para(_byten1$j) 00000000
	set Para(_k2$j) 01
	set Para(_byten2$j) 10111100
	set Para(_k3$j) 00
	set Para(_byten3$j) 01010000
	
	set Para(_cc_min_ipg$j) 3
}

proc GIGE_default {j} {
	global Para
	set Para(_ldr$j) DISABLED
	set Para(_pll_rxsrc$j) EXTERNAL
	set Para(_rx_data_rate$j) FULL
	set Para(_tx_data_rate$j) FULL
	set Para(_rx_fifo$j) ENABLED
	set Para(_tx_fifo$j) ENABLED
	set Para(_rx_data_width$j) 8
	set Para(_tx_data_width$j) 8
	set Para(_tdrv_ch$j) 0
	set Para(_rx_eq$j) DISABLED
	set Para(_tx_pre$j) DISABLED
	set Para(_los_threshold_lo$j) 2
	set Para(_rterm_tx$j) 50
	set Para(_rterm_rx$j) 50
	set Para(_rx_dcc$j) AC
	set Para(_tx_sb$j) DISABLED
	set Para(_rx_sb$j) DISABLED
	set Para(_tx_8b10b$j) ENABLED
	set Para(_rx_8b10b$j) ENABLED
	set Para(_ilsm$j) ENABLED
	set Para(_rxwa$j) ENABLED
	set Para(_ctc$j) DISABLED
	set Para(_cc_match_mode$j) 2

	set Para(_k0$j) 00
	set Para(_byten0$j) 00000000
	set Para(_k1$j) 00
	set Para(_byten1$j) 00000000
	set Para(_k2$j) 01
	set Para(_byten2$j) 10111100
	set Para(_k3$j) 00
	set Para(_byten3$j) 01010000
	
	set Para(_cc_min_ipg$j) 3
}

proc XAUI_default {j} {
	global Para
	set Para(_ldr$j) DISABLED
	set Para(_pll_rxsrc$j) EXTERNAL
	set Para(_rx_data_rate$j) FULL
	set Para(_tx_data_rate$j) FULL
	set Para(_rx_fifo$j) ENABLED
	set Para(_tx_fifo$j) ENABLED
	set Para(_rx_data_width$j) 16
	set Para(_tx_data_width$j) 16
	set Para(_tdrv_ch$j) 0
	set Para(_rx_eq$j) DISABLED
	set Para(_tx_pre$j) DISABLED
	set Para(_los_threshold_lo$j) 2
	set Para(_rterm_tx$j) 50
	set Para(_rterm_rx$j) 50
	set Para(_rx_dcc$j) AC
	set Para(_tx_sb$j) DISABLED
	set Para(_rx_sb$j) DISABLED
	set Para(_tx_8b10b$j) ENABLED
	set Para(_rx_8b10b$j) ENABLED
	set Para(_ilsm$j) ENABLED
	set Para(_rxwa$j) ENABLED
	set Para(_ctc$j) DISABLED
	set Para(_cc_match_mode$j) 1
	set Para(_cc_min_ipg$j) 0
}

proc SDI_default {j} {
	global Para
	set Para(_ldr$j) ENABLED
	set Para(_pll_rxsrc$j) EXTERNAL
	set Para(_rx_data_rate$j) FULL
	set Para(_tx_data_rate$j) FULL
	set Para(_rx_fifo$j) ENABLED
	set Para(_tx_fifo$j) ENABLED
	set Para(_rx_data_width$j) 20
	set Para(_tx_data_width$j) 20
	set Para(_tdrv_ch$j) 0
	set Para(_rx_eq$j) LONG_LOW
	set Para(_tx_pre$j) DISABLED
	set Para(_los_threshold_lo$j) 2
	set Para(_rterm_tx$j) 50
	set Para(_rterm_rx$j) HIGH
	set Para(_rx_dcc$j) DC
	set Para(_tx_sb$j) DISABLED
	set Para(_rx_sb$j) DISABLED
	set Para(_tx_8b10b$j) DISABLED
	set Para(_rx_8b10b$j) DISABLED
	set Para(_ilsm$j) DISABLED
	set Para(_rxwa$j) DISABLED
	set Para(_ctc$j) DISABLED
	set Para(_cc_match_mode$j) 1
	set Para(_cc_min_ipg$j) 3
}

proc CPRI_default {j} {
	global Para
	set Para(_ldr$j) DISABLED
	set Para(_pll_rxsrc$j) EXTERNAL
	set Para(_rx_data_rate$j) FULL
	set Para(_tx_data_rate$j) FULL
	set Para(_rx_fifo$j) DISABLED
	set Para(_tx_fifo$j) DISABLED
	set Para(_rx_data_width$j) 8
	set Para(_tx_data_width$j) 8
	set Para(_tdrv_ch$j) 0
	set Para(_rx_eq$j) DISABLED
	set Para(_tx_pre$j) DISABLED
	set Para(_los_threshold_lo$j) 2
	set Para(_rterm_tx$j) 50
	set Para(_rterm_rx$j) 50
	set Para(_rx_dcc$j) AC
	set Para(_tx_sb$j) DISABLED
	set Para(_rx_sb$j) DISABLED
	set Para(_tx_8b10b$j) ENABLED
	set Para(_rx_8b10b$j) ENABLED
	set Para(_ilsm$j) ENABLED
	set Para(_rxwa$j) ENABLED
	set Para(_ctc$j) DISABLED
	set Para(_cc_match_mode$j) 1
	set Para(_cc_min_ipg$j) 3
}

proc OBSAI_default {j} {
	global Para
	set Para(_ldr$j) DISABLED
	set Para(_pll_rxsrc$j) EXTERNAL
	set Para(_rx_data_rate$j) FULL
	set Para(_tx_data_rate$j) FULL
	set Para(_rx_fifo$j) DISABLED
	set Para(_tx_fifo$j) DISABLED
	set Para(_rx_data_width$j) 8
	set Para(_tx_data_width$j) 8
	set Para(_tdrv_ch$j) 0
	set Para(_rx_eq$j) DISABLED
	set Para(_tx_pre$j) DISABLED
	set Para(_los_threshold_lo$j) 2
	set Para(_rterm_tx$j) 50
	set Para(_rterm_rx$j) 50
	set Para(_rx_dcc$j) AC
	set Para(_tx_sb$j) DISABLED
	set Para(_rx_sb$j) DISABLED
	set Para(_tx_8b10b$j) ENABLED
	set Para(_rx_8b10b$j) ENABLED
	set Para(_ilsm$j) ENABLED
	set Para(_rxwa$j) ENABLED
	set Para(_ctc$j) DISABLED
	set Para(_cc_match_mode$j) 1
	set Para(_cc_min_ipg$j) 3
}

proc SRIO_default {j} {
	global Para
	set Para(_ldr$j) DISABLED
	set Para(_pll_rxsrc$j) EXTERNAL
	set Para(_rx_data_rate$j) FULL
	set Para(_tx_data_rate$j) FULL
	set Para(_rx_fifo$j) DISABLED
	set Para(_tx_fifo$j) DISABLED
	set Para(_rx_data_width$j) 8
	set Para(_tx_data_width$j) 8
	set Para(_tdrv_ch$j) 0
	set Para(_rx_eq$j) DISABLED
	set Para(_tx_pre$j) DISABLED
	set Para(_los_threshold_lo$j) 2
	set Para(_rterm_tx$j) 50
	set Para(_rterm_rx$j) 50
	set Para(_rx_dcc$j) AC
	set Para(_tx_sb$j) DISABLED
	set Para(_rx_sb$j) DISABLED
	set Para(_tx_8b10b$j) ENABLED
	set Para(_rx_8b10b$j) ENABLED
	set Para(_ilsm$j) DISABLED
	set Para(_rxwa$j) ENABLED
	#Diamond 1.2: ECN33, CR51682
	#set Para(_ctc$j) ENABLED
	set Para(_ctc$j) DISABLED
	set Para(_cc_match_mode$j) 1
	set Para(_cc_min_ipg$j) 0
}

proc BSER10_default {j} {
	global Para
	set Para(_ldr$j) DISABLED
	set Para(_pll_rxsrc$j) EXTERNAL
	set Para(_rx_data_rate$j) FULL
	set Para(_tx_data_rate$j) FULL
	set Para(_rx_fifo$j) ENABLED
	set Para(_tx_fifo$j) ENABLED
	set Para(_rx_data_width$j) 10
	set Para(_tx_data_width$j) 10
	set Para(_tdrv_ch$j) 0
	set Para(_rx_eq$j) DISABLED
	set Para(_tx_pre$j) DISABLED
	set Para(_los_threshold_lo$j) 2
	set Para(_rterm_tx$j) 50
	set Para(_rterm_rx$j) 50
	set Para(_rx_dcc$j) AC
	set Para(_tx_sb$j) DISABLED
	set Para(_rx_sb$j) DISABLED
	set Para(_tx_8b10b$j) DISABLED
	set Para(_rx_8b10b$j) DISABLED
	set Para(_ilsm$j) DISABLED
	set Para(_rxwa$j) DISABLED
	set Para(_ctc$j) DISABLED
	set Para(_cc_match_mode$j) 1
	set Para(_cc_min_ipg$j) 3
}

proc BSER8_default {j} {
	global Para
	set Para(_ldr$j) DISABLED
	set Para(_pll_rxsrc$j) EXTERNAL
	set Para(_rx_data_rate$j) FULL
	set Para(_tx_data_rate$j) FULL
	set Para(_rx_fifo$j) ENABLED
	set Para(_tx_fifo$j) ENABLED
	set Para(_rx_data_width$j) 8
	set Para(_tx_data_width$j) 8
	set Para(_tdrv_ch$j) 0
	set Para(_rx_eq$j) DISABLED
	set Para(_tx_pre$j) DISABLED
	set Para(_los_threshold_lo$j) 2
	set Para(_rterm_tx$j) 5K
	set Para(_rterm_rx$j) 50
	set Para(_rx_dcc$j) AC
	set Para(_tx_sb$j) DISABLED
	set Para(_rx_sb$j) DISABLED
	set Para(_tx_8b10b$j) DISABLED
	set Para(_rx_8b10b$j) DISABLED
	set Para(_ilsm$j) DISABLED
	set Para(_rxwa$j) DISABLED
	set Para(_ctc$j) DISABLED
	set Para(_cc_match_mode$j) 1
	set Para(_cc_min_ipg$j) 3
}

proc SetSingleValue {j} {
	global Para

	#set Para(_tdrv_ch$j) 0
	set Para(_tx_pre$j) DISABLED
	set Para(_pll_lol_set) 0
	
	switch $Para(_protocol$j) {
		"SGMII" {
			#CR_46676 
			set Para(_datarange) 2.5
			set Para(_rx_datarange$j) 2.5

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 10X
			set Para(_scomma$j) "K28P5"
			SGMII_default $j
		}
		"GIGE" {
			#CR_46676
			set Para(_datarange) 2.5
			set Para(_rx_datarange$j) 2.5

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 10X
			set Para(_scomma$j) "K28P5"
			GIGE_default $j
		}
		"SDI" {
			set Para(_datarange) 2.97
			set Para(_rx_datarange$j) 2.97

##44666
#	set Para(_rx_data_width$j) 20
#	set Para(_tx_data_width$j) 20
#	set Para(_pll_rxsrc$j) INTERNAL
#	set Para(_rx_eq$j) LONG_LOW	
#	set Para(_rx_dcc$j) DC
	set Para(_pll_lol_set) 3
#	set Para(_los_threshold$j) 0
#	set Para(_rxwa$j) DISABLED
	
			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 20X
			set Para(_scomma$j) "User Defined"
			SDI_default $j
		}
		"PCIE" -
		"PIPE" {
			set Para(_datarange) 2.5
			set Para(_rx_datarange$j) 2.5

	set Para(_tx_pre$j) 5
	
			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 25X
			set Para(_scomma$j) "K28P5"
			PCIE_default $j
		}
		"G8B10B" {
			set Para(_datarange) 2.5
			set Para(_rx_datarange$j) 2.5

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 10X
#			set Para(_scomma$j) "K28P157"	
			G8B10B_default $j
		}
		"10BSER" {
			set Para(_datarange) 2.5
			set Para(_rx_datarange$j) 2.5

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 10X
			set Para(_scomma$j) "User Defined"
			BSER10_default $j
		}
		"8BSER" {
			set Para(_datarange) 2.5
			set Para(_rx_datarange$j) 2.5

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 8X 16X
			set Para(_refclk_mult) 8X
			set Para(_scomma$j) "User Defined"
			BSER8_default $j
		}
		"SATA" {
			set Para(_datarange) 1.5
			set Para(_rx_datarange$j) 1.5

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 10X
			set Para(_scomma$j) "K28P5"
		}
		"CPRI" {
			set Para(_datarange) 1.2288
			set Para(_rx_datarange$j) 1.2288

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 10X
			set Para(_scomma$j) "K28P5"
			CPRI_default $j
		}
		"XAUI" {
			set Para(_datarange) 3.125
			set Para(_rx_datarange$j) 3.125

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 20X
			set Para(_scomma$j) "K28P5"
			XAUI_default $j
		}
		"FC" {
			set Para(_datarange) 1.0625
			set Para(_rx_datarange$j) 1.0625

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 20X
			set Para(_scomma$j) "K28P5"
		}
		"OBSAI" {
			set Para(_datarange) 1.536
			set Para(_rx_datarange$j) 1.536

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 20X
			set Para(_scomma$j) "K28P5"
			OBSAI_default $j
		}
		"SRIO"  {
			set Para(_datarange) 2.5
			set Para(_rx_datarange$j) 2.5

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 20X
			set Para(_scomma$j) "K28P5"
			SRIO_default $j
		}
		"DISP_PORT" {
			set Para(_datarange) 1.62
			set Para(_rx_datarange$j) 1.62

			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 10X 20X 25X
			set Para(_refclk_mult) 20X
			set Para(_scomma$j) "K28P5"
		}
		default {set Para(_datarange) 2.5}
	}
}

proc SetMultiValue {} {
	global Para
	
	set count 0
	set m_list {}
	for {set i 0} {$i<4} {incr i} {
		SetSingleValue $i
		if {$Para(_mode$i) != "DISABLED"} {
			incr count
			lappend m_list $Para(_protocol$i)
		}
	}
	
	if {[lsearch $m_list "PCIE"] != -1} {
		set Para(_datarange) 2.5
	} else {
		if {[lsearch $m_list "SRIO"] != -1} {
			set Para(_datarange) 1.25
		}
	}
}

proc InitDataRate {index} {
	global Para
	
	set count 0
	set m_list {}
	for {set i 0} {$i<4} {incr i} {
		if {$i == $index} {SetSingleValue $i}
		if {$Para(_mode$i) != "DISABLED"} {
			incr count
			lappend m_list $i
		}
	}
	
	#All Disabled, set default value
	if {$count == 0} {
		set Para(_datarange) 2.5
		.cbo_refclk_mult clear list
		.cbo_refclk_mult insert list end 10X 20X 25X
		set Para(_refclk_mult) 25X
	}
	
	#single protocol
	if {$count == 1} {
		set j [lindex $m_list 0]
		SetSingleValue $j
	} 

	#multi protocl
	if {$count > 1} {
		set Para(_datarange) 2.5
		.cbo_refclk_mult clear list
		.cbo_refclk_mult insert list end 10X 20X 25X
		set Para(_refclk_mult) 25X
		switch $count {
			"2" {
				set i [lindex $m_list 0]
				set j [lindex $m_list 1]
				if {$Para(_protocol$i) == $Para(_protocol$j)} {
					SetSingleValue $i
					SetSingleValue $j
				} else {
					SetMultiValue
				}
			}
			"3" {
				set i [lindex $m_list 0]
				set j [lindex $m_list 1]
				set k [lindex $m_list 2]
				if {$Para(_protocol$i) == $Para(_protocol$j) &&
					$Para(_protocol$i) == $Para(_protocol$k)} {
						SetSingleValue $i
						SetSingleValue $j
						SetSingleValue $k
				} else {
					SetMultiValue
				}
			}
			"4" {
				set i [lindex $m_list 0]
				set j [lindex $m_list 1]
				set k [lindex $m_list 2]
				set l [lindex $m_list 3]
				if {$Para(_protocol$i) == $Para(_protocol$j) &&
					$Para(_protocol$i) == $Para(_protocol$k) &&
					$Para(_protocol$i) == $Para(_protocol$l)} {
						SetSingleValue $i
						SetSingleValue $j
						SetSingleValue $k
						SetSingleValue $l
				} else {
					SetMultiValue
				}
			}
		}
	}
}

proc ProtocolCmd {} {
	global Para

	set msg "If a quad shares a PCI Express x1 channel with a non PCI Express channel, care must be taken to ensure the \n\
reference clock for the quad is compatible with all protocols within the quad. For example, a PCI Express spread \n\
spectrum reference clock is not compatible with most Gigabit Ethernet applications."
	set count 0
	set p 0
	for {set i 0} {$i<4} {incr i} {
		if {$Para(_mode$i) != "DISABLED"} {
			incr count
			if {$Para(_protocol$i) == "PCIE"} {
				incr p
			}
		}
	}
	if {$count > 1 && $p < $count && $p != 0} {
		tk_messageBox -default ok -icon warning -message $msg -title Warning -type ok
	}
	if {$p < 4} {
		#tk_messageBox -default ok -icon warning -message $msg -title Warning -type ok
	}
}

proc G8B10BSetting {i} {
	global Para
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state normal
	.rdo3_mode$i config -state normal
	.rdo4_mode$i config -state normal
	
	#set Para(_ldr$i) 0

	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL DIV2
	if {$Para(_rx_data_rate$i) == "DIV11"} {set Para(_rx_data_rate$i) DIV2}
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL DIV2
	if {$Para(_tx_data_rate$i) == "DIV11"} {set Para(_tx_data_rate$i) DIV2}
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end ENABLED DISABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end ENABLED DISABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_rx_data_width$i)] == -1} {set Para(_rx_data_width$i) 8}
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_tx_data_width$i)] == -1} {set Para(_tx_data_width$i) 8}
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 50 75 60
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 5K 50 75

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end ENABLED
	set Para(_tx_8b10b$i) ENABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end ENABLED
	set Para(_rx_8b10b$i) ENABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end ENABLED
	set Para(_rxwa$i) ENABLED
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end ENABLED DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end DISABLED ENABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 1 2 4
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 3 0 1 2
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end K28P157 "User Defined"
	if {[lsearch {K28P157 "User Defined"} $Para(_scomma$i)] == -1} {set Para(_scomma$i) "K28P157"}
	#set Para(_comma_m$i) "1111111100"
	
	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	}
}

proc PCIESetting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state disabled
	.rdo3_mode$i config -state disabled
	.rdo4_mode$i config -state normal
	if {[lsearch {RXTX DISABLED} $Para(_mode$i)] == -1} {set Para(_mode$i) DISABLED}

	if {$Para(_mode$i) == "RXTX"} {
		.cbo_los_threshold$i config -state normal
		.cbo_los_threshold$i clear list
		.cbo_los_threshold$i insert list end 2 3
		if {[lsearch {2 3} $Para(_los_threshold$i)] == -1} {set Para(_los_threshold$i) 2}
	}
	
	#set Para(_ldr$i) 0

	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL
	set Para(_rx_data_rate$i) FULL
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL
	set Para(_tx_data_rate$i) FULL
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end ENABLED
	set Para(_rx_fifo$i) ENABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end ENABLED
	set Para(_tx_fifo$i) ENABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_rx_data_width$i)] == -1} {set Para(_rx_data_width$i) 8}
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_tx_data_width$i)] == -1} {set Para(_tx_data_width$i) 8}
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 50
	if {[lsearch {HIGH 50} $Para(_rterm_rx$i)] == -1} {set Para(_rterm_rx$i) 50}
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 50 75 5K

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end ENABLED
	set Para(_tx_8b10b$i) ENABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end ENABLED
	set Para(_rx_8b10b$i) ENABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end ENABLED
	set Para(_rxwa$i) ENABLED
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end ENABLED DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end DISABLED ENABLED
	if {[lsearch {DISABLED ENABLED} $Para(_ctc$i)] == -1} {set Para(_ctc$i) DISABLED}
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 2
	set Para(_cc_match_mode$i) 2
	
	set Para(_k0$i) 00
	set Para(_byten0$i) 00000000
	set Para(_k1$i) 00
	set Para(_byten1$i) 00000000
	set Para(_k2$i) 00
	set Para(_byten2$i) 00000000
	set Para(_k3$i) 01
	set Para(_byten3$i) $Para(K28P0)
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 0
	set Para(_cc_min_ipg$i) 0
	
	.cbo_rx_eq$i clear list
	.cbo_rx_eq$i insert list end MID_LOW DISABLED MID_HIGH LONG_HIGH
	if {[lsearch {MID_LOW DISABLED MID_HIGH LONG_HIGH} $Para(_rx_eq$i)] == -1} {set Para(_rx_eq$i) MID_LOW}

	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 9
		set Para(_cchmark) 9
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 7
		set Para(_cclmark) 7
	}
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end K28P5 K28P157
	if {[lsearch {K28P5 K28P157} $Para(_scomma$i)] == -1} {set Para(_scomma$i) "K28P5"}

	set Para(_tdrv_ch$i) 1
	.cbo_tdrv_amp$i clear list
	.cbo_tdrv_amp$i insert list end 1
}

proc SGMIISetting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state disabled
	.rdo3_mode$i config -state disabled
	.rdo4_mode$i config -state normal
	if {[lsearch {RXTX DISABLED} $Para(_mode$i)] == -1} {set Para(_mode$i) DISABLED}
	
	#set Para(_ldr$i) 0

	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL DIV2
	if {$Para(_rx_data_rate$i) == "DIV11"} {set Para(_rx_data_rate$i) DIV2}
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL DIV2
	if {$Para(_tx_data_rate$i) == "DIV11"} {set Para(_tx_data_rate$i) DIV2}
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end ENABLED
	set Para(_rx_fifo$i) ENABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end ENABLED
	set Para(_tx_fifo$i) ENABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 8
	set Para(_rx_data_width$i) 8
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 8
	set Para(_tx_data_width$i) 8
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 50
	if {[lsearch {HIGH 50} $Para(_rterm_rx$i)] == -1} {set Para(_rterm_rx$i) HIGH}
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 5K 50
	if {$Para(_rterm_tx$i) == 75} {set Para(_rterm_tx$i) 50}

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end ENABLED
	set Para(_tx_8b10b$i) ENABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end ENABLED
	set Para(_rx_8b10b$i) ENABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end ENABLED
	set Para(_rxwa$i) ENABLED
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end ENABLED DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end DISABLED ENABLED
	#set Para(_ctc$i) DISABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 2
	set Para(_cc_match_mode$i) 2
	
	set Para(_k0$i) 00
	set Para(_byten0$i) 00000000
	set Para(_k1$i) 00
	set Para(_byten1$i) 00000000
	set Para(_k2$i) 01
	set Para(_byten2$i) $Para(K28P5)
	set Para(_k3$i) 00
	set Para(_byten3$i) $Para(D16P2)
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 3
	set Para(_cc_min_ipg$i) 3
	
	.cbo_rx_eq$i clear list
	.cbo_rx_eq$i insert list end DISABLED MID_MED LONG_MED
	if {[lsearch {DISABLED MID_MED LONG_MED} $Para(_rx_eq$i)] == -1} {set Para(_rx_eq$i) DISABLED}

	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 9
		set Para(_cchmark) 9
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 7
		set Para(_cclmark) 7
	}
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end K28P5
	set Para(_scomma$i) "K28P5"
	
	if {$Para(_mode$i) == "TXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_datarange) == "1.25" || $Para(_datarange) == "3.125"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL
			set Para(_tx_data_rate$i) FULL 
		}
		if {$Para(_datarange) == "2.5"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL DIV2
			#set Para(_tx_data_rate$i) DIV2
		}
	}
	
	if {$Para(_mode$i) == "RXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_rx_datarange$i) == "1.25" || $Para(_datarange) == "3.125"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL
			set Para(_rx_data_rate$i) FULL
		}
		if {$Para(_rx_datarange$i) == "2.5"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL DIV2
			#set Para(_rx_data_rate$i) DIV2
		}
	}
}

proc GIGESetting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state disabled
	.rdo3_mode$i config -state disabled
	.rdo4_mode$i config -state normal
	if {[lsearch {RXTX DISABLED} $Para(_mode$i)] == -1} {set Para(_mode$i) DISABLED}
	
	#set Para(_ldr$i) 0

	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL DIV2
	if {$Para(_rx_data_rate$i) == "DIV11"} {set Para(_rx_data_rate$i) DIV2}
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL DIV2
	if {$Para(_tx_data_rate$i) == "DIV11"} {set Para(_tx_data_rate$i) DIV2}
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end ENABLED
	set Para(_rx_fifo$i) ENABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end ENABLED
	set Para(_tx_fifo$i) ENABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_rx_data_width$i)] == -1} {set Para(_rx_data_width$i) 8}
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_tx_data_width$i)] == -1} {set Para(_tx_data_width$i) 8}
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 50
	if {[lsearch {HIGH 50} $Para(_rterm_rx$i)] == -1} {set Para(_rterm_rx$i) HIGH}
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 5K 50
	if {$Para(_rterm_tx$i) == 75} {set Para(_rterm_tx$i) 50}

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end ENABLED
	set Para(_tx_8b10b$i) ENABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end ENABLED
	set Para(_rx_8b10b$i) ENABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end ENABLED
	set Para(_rxwa$i) ENABLED
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end ENABLED DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end DISABLED ENABLED
#	set Para(_ctc$i) ENABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 2
	set Para(_cc_match_mode$i) 2
	
	set Para(_k0$i) 00
	set Para(_byten0$i) 00000000
	set Para(_k1$i) 00
	set Para(_byten1$i) 00000000
	set Para(_k2$i) 01
	set Para(_byten2$i) $Para(K28P5)
	set Para(_k3$i) 00
	set Para(_byten3$i) $Para(D16P2)
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 3
	set Para(_cc_min_ipg$i) 3
	
	.cbo_rx_eq$i clear list
	.cbo_rx_eq$i insert list end DISABLED MID_MED LONG_MED
	if {[lsearch {DISABLED MID_MED LONG_MED} $Para(_rx_eq$i)] == -1} {set Para(_rx_eq$i) DISABLED}

	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 9
		set Para(_cchmark) 9
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 7
		set Para(_cclmark) 7
	}
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end K28P5 K28P157
	if {[lsearch {K28P5 K28P157} $Para(_scomma$i)] == -1} {set Para(_scomma$i) "K28P5"}
	
	if {$Para(_mode$i) == "TXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_datarange) == "1.25" || $Para(_datarange) == "3.125"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL
			set Para(_tx_data_rate$i) FULL 
		}
		if {$Para(_datarange) == "2.5"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL DIV2
			#set Para(_tx_data_rate$i) DIV2
		}
	}
	
	if {$Para(_mode$i) == "RXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_rx_datarange$i) == "1.25" || $Para(_datarange) == "3.125"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL
			set Para(_rx_data_rate$i) FULL
		}
		if {$Para(_rx_datarange$i) == "2.5"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL DIV2
			#set Para(_rx_data_rate$i) DIV2
		}
	}
}

proc XAUISetting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state disabled
	.rdo3_mode$i config -state disabled
	.rdo4_mode$i config -state normal
	if {[lsearch {RXTX DISABLED} $Para(_mode$i)] == -1} {set Para(_mode$i) DISABLED}
	
	#set Para(_ldr$i) 0

	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL
	set Para(_rx_data_rate$i) FULL
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL
	set Para(_tx_data_rate$i) FULL
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end ENABLED
	set Para(_rx_fifo$i) ENABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end ENABLED
	set Para(_tx_fifo$i) ENABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 16
	set Para(_rx_data_width$i) 16
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 16
	set Para(_tx_data_width$i) 16
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 50
	if {[lsearch {HIGH 50} $Para(_rterm_rx$i)] == -1} {set Para(_rterm_rx$i) HIGH}
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 5K 50
	if {[lsearch {5K 50} $Para(_rterm_tx$i)] == -1} {set Para(_rterm_tx$i) 5K}

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end ENABLED
	set Para(_tx_8b10b$i) ENABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end ENABLED
	set Para(_rx_8b10b$i) ENABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end ENABLED
	set Para(_rxwa$i) ENABLED
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end ENABLED DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end DISABLED
	set Para(_ctc$i) DISABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 1
	set Para(_cc_match_mode$i) 1
		
	set Para(_k0$i) 00
	set Para(_byten0$i) 00000000
	set Para(_k1$i) 00
	set Para(_byten1$i) 00000000
	set Para(_k2$i) 00
	set Para(_byten2$i) 00000000
	set Para(_k3$i) 01
	set Para(_byten3$i) $Para(K28P0)
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 0
	set Para(_cc_min_ipg$i) 0

	.cbo_rx_eq$i clear list
	.cbo_rx_eq$i insert list end DISABLED MID_HIGH LONG_HIGH
	if {[lsearch {DISABLED MID_HIGH LONG_HIGH} $Para(_rx_eq$i)] == -1} {set Para(_rx_eq$i) DISABLED}

	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 9
		set Para(_cchmark) 9
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 7
		set Para(_cclmark) 7
	}
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end K28P5 K28P157
	if {[lsearch {K28P5 K28P157} $Para(_scomma$i)] == -1} {set Para(_scomma$i) "K28P5"}
}

proc SDISetting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state normal
	.rdo3_mode$i config -state normal
	.rdo4_mode$i config -state normal
	
	.ck_ldr$i config -state normal
	
	#set Para(_ldr$i) ENABLED
	
	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL DIV2 DIV11
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL DIV2 DIV11

	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end ENABLED DISABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end ENABLED DISABLED
	
	#ISPL_CR_44000
	#set Para(_tx_fifo$i) ENABLED
	#set Para(_rx_fifo$i) ENABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 10 20
	if {[lsearch {10 20} $Para(_rx_data_width$i)] == -1} {set Para(_rx_data_width$i) 20}
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 10 20
	if {[lsearch {10 20} $Para(_tx_data_width$i)] == -1} {set Para(_tx_data_width$i) 20}
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 75 50
	if {[lsearch {HIGH 75 50} $Para(_rterm_rx$i)] == -1} {set Para(_rterm_rx$i) HIGH}
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 5K 50 75

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end DISABLED
	set Para(_tx_8b10b$i) DISABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end DISABLED
	set Para(_rx_8b10b$i) DISABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end DISABLED ENABLED
	if {[lsearch {DISABLED ENABLED} $Para(_rxwa$i)] == -1} {set Para(_rxwa$i) DISABLED}
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end DISABLED
	set Para(_ilsm$i) DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end DISABLED
	set Para(_ctc$i) DISABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 1
	set Para(_cc_match_mode$i) 1

	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 3 0 1 2
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end "User Defined"
	set Para(_scomma$i) "User Defined"

	if {$Para(_mode$i) == "TXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_datarange) == "2.97" || $Para(_datarange) == "2.967"} {
			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 20X
			set Para(_refclk_mult) 20X
	
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL DIV2 DIV11
		}
		if {$Para(_datarange) == "1.485" || $Para(_datarange) == "1.4835"} {
			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 20X 10X
			#set Para(_refclk_mult) 20X
	
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL
			set Para(_tx_data_rate$i) FULL
		}
		if {$Para(_datarange) == "0.27"} {
			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 20X 10X
			#set Para(_refclk_mult) 20X
	
			if {$Para(_refclk_mult) == "20X"} {
				.cbo_tx_data_rate$i clear list
				.cbo_tx_data_rate$i insert list end DIV2
				set Para(_tx_data_rate$i) DIV2
			}
			if {$Para(_refclk_mult) == "10X"} {
				.cbo_tx_data_rate$i clear list
				.cbo_tx_data_rate$i insert list end FULL
				set Para(_tx_data_rate$i) FULL
			}
		}
	}
	if {$Para(_mode$i) == "RXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_rx_datarange$i) == "2.97" || $Para(_datarange) == "2.967"} {
			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 20X
			set Para(_refclk_mult) 20X
	
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL DIV2 DIV11
		}
		if {$Para(_rx_datarange$i) == "1.485" || $Para(_datarange) == "1.4835"} {
			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 20X 10X
			#set Para(_refclk_mult) 20X
	
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL
			set Para(_rx_data_rate$i) FULL
		}
		if {$Para(_rx_datarange$i) == "0.27"} {
			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 20X 10X
			#set Para(_refclk_mult) 20X
	
			if {$Para(_refclk_mult) == "20X"} {
				.cbo_rx_data_rate$i clear list
				.cbo_rx_data_rate$i insert list end DIV2
				set Para(_rx_data_rate$i) DIV2
			}
			if {$Para(_refclk_mult) == "10X"} {
				.cbo_rx_data_rate$i clear list
				.cbo_rx_data_rate$i insert list end FULL
				set Para(_rx_data_rate$i) FULL
			}
		}
	}
	if {$Para(_mode$i) == "RXorTX"} {
		if {$Para(_datarange) == "2.97"} {
			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 20X
	
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL DIV2 DIV11

			set Para(_refclk_mult) 20X
			if {$Para(_rx_datarange$i) == "2.97"} {
				.cbo_rx_data_rate$i clear list
				.cbo_rx_data_rate$i insert list end FULL DIV2 DIV11
			}
			if {$Para(_rx_datarange$i) == "1.485"} {
				.cbo_rx_data_rate$i clear list
				.cbo_rx_data_rate$i insert list end FULL
				set Para(_rx_data_rate$i) FULL
			}
			if {$Para(_rx_datarange$i) == "0.27"} {
				.cbo_rx_data_rate$i clear list
				.cbo_rx_data_rate$i insert list end DIV2
				set Para(_rx_data_rate$i) DIV2
			}
		}
		if {$Para(_datarange) == "1.485"} {
			.cbo_refclk_mult clear list
			.cbo_refclk_mult insert list end 20X 10X
	
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL
			if {$Para(_refclk_mult) == "20X"} {
				if {$Para(_rx_datarange$i) == "2.97"} {
					.cbo_rx_data_rate$i clear list
					.cbo_rx_data_rate$i insert list end FULL DIV2 DIV11
				}
				if {$Para(_rx_datarange$i) == "1.485"} {
					.cbo_rx_data_rate$i clear list
					.cbo_rx_data_rate$i insert list end FULL
					set Para(_rx_data_rate$i) FULL
				}
				if {$Para(_rx_datarange$i) == "0.27"} {
					.cbo_rx_data_rate$i clear list
					.cbo_rx_data_rate$i insert list end DIV2
					set Para(_rx_data_rate$i) DIV2
				}
			}
			if {$Para(_refclk_mult) == "10X"} {
				if {$Para(_rx_datarange$i) == "1.485"} {
					.cbo_rx_data_rate$i clear list
					.cbo_rx_data_rate$i insert list end FULL
					set Para(_rx_data_rate$i) FULL
				}
				if {$Para(_rx_datarange$i) == "0.27"} {
					.cbo_rx_data_rate$i clear list
					.cbo_rx_data_rate$i insert list end FULL DIV2
					if {[lsearch {FULL DIV2} $Para(_rx_data_rate$i)] == -1} {set Para(_rx_data_rate$i) FULL}
				}
			}
		}
	}
	
	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	}
}

proc CPRISetting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state disabled
	.rdo3_mode$i config -state disabled
	.rdo4_mode$i config -state normal
	if {[lsearch {RXTX DISABLED} $Para(_mode$i)] == -1} {set Para(_mode$i) DISABLED}
	
	#set Para(_ldr$i) 0

	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL DIV2
	if {$Para(_rx_data_rate$i) == "DIV11"} {set Para(_rx_data_rate$i) DIV2}
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL DIV2
	if {$Para(_tx_data_rate$i) == "DIV11"} {set Para(_tx_data_rate$i) DIV2}
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end DISABLED
	set Para(_rx_fifo$i) DISABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end DISABLED
	set Para(_tx_fifo$i) DISABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 8
	set Para(_rx_data_width$i) 8
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 8
	set Para(_tx_data_width$i) 8
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 50
	if {[lsearch {HIGH 50} $Para(_rterm_rx$i)] == -1} {set Para(_rterm_rx$i) HIGH}
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 5K 50
	if {$Para(_rterm_tx$i) == 75} {set Para(_rterm_tx$i) 50}

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end ENABLED
	set Para(_tx_8b10b$i) ENABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end ENABLED
	set Para(_rx_8b10b$i) ENABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end ENABLED
	set Para(_rxwa$i) ENABLED
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end ENABLED DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end DISABLED
	set Para(_ctc$i) DISABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 1
	set Para(_cc_match_mode$i) 1
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 3 0 1 2
	
	#set Para(_comma_m$i) "1111111111"
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end K28P5
	set Para(_scomma$i) "K28P5"

	if {$Para(_mode$i) == "TXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_datarange) == "0.6144" || $Para(_datarange) == "3.072"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL
			set Para(_tx_data_rate$i) FULL 
		}
		if {$Para(_datarange) == "1.2288" || $Para(_datarange) == "2.4576"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL DIV2
			if {[lsearch {FULL DIV2} $Para(_tx_data_rate$i)] == -1} {set Para(_tx_data_rate$i) FULL}
		}
	}
	
	if {$Para(_mode$i) == "RXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_rx_datarange$i) == "0.6144" || $Para(_rx_datarange$i) == "3.072"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL
			set Para(_rx_data_rate$i) FULL
		}
		if {$Para(_rx_datarange$i) == "1.2288" || $Para(_rx_datarange$i) == "2.4576"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL DIV2
			if {[lsearch {FULL DIV2} $Para(_rx_data_rate$i)] == -1} {set Para(_rx_data_rate$i) FULL}
		}
	}
	
	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	}
}

proc OBSAISetting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state disabled
	.rdo3_mode$i config -state disabled
	.rdo4_mode$i config -state normal
	if {[lsearch {RXTX DISABLED} $Para(_mode$i)] == -1} {set Para(_mode$i) DISABLED}
	
	#set Para(_ldr$i) 0

	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL DIV2
	if {$Para(_rx_data_rate$i) == "DIV11"} {set Para(_rx_data_rate$i) DIV2}
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL DIV2
	if {$Para(_tx_data_rate$i) == "DIV11"} {set Para(_tx_data_rate$i) DIV2}
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end DISABLED
	set Para(_rx_fifo$i) DISABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end DISABLED
	set Para(_tx_fifo$i) DISABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 8
	set Para(_rx_data_width$i) 8
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 8
	set Para(_tx_data_width$i) 8
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 50
	if {[lsearch {HIGH 50} $Para(_rterm_rx$i)] == -1} {set Para(_rterm_rx$i) HIGH}
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 5K 50
	if {$Para(_rterm_tx$i) == 75} {set Para(_rterm_tx$i) 50}

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end ENABLED
	set Para(_tx_8b10b$i) ENABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end ENABLED
	set Para(_rx_8b10b$i) ENABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end ENABLED
	set Para(_rxwa$i) ENABLED
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end ENABLED DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end DISABLED
	set Para(_ctc$i) DISABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 1
	set Para(_cc_match_mode$i) 1
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 3 0 1 2
	
	#set Para(_comma_m$i) "1111111111"
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end K28P5
	set Para(_scomma$i) "K28P5"

	if {$Para(_mode$i) == "TXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_datarange) == "0.768" || $Para(_datarange) == "2.304"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL
			set Para(_tx_data_rate$i) FULL 
		}
		if {$Para(_datarange) == "1.536" || $Para(_datarange) == "3.072"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL DIV2
			if {[lsearch {FULL DIV2} $Para(_tx_data_rate$i)] == -1} {set Para(_tx_data_rate$i) FULL}
		}
	}
	
	if {$Para(_mode$i) == "RXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_rx_datarange$i) == "0.768" || $Para(_rx_datarange$i) == "2.304"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL
			set Para(_rx_data_rate$i) FULL
		}
		if {$Para(_rx_datarange$i) == "1.536" || $Para(_rx_datarange$i) == "3.072"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL DIV2
			if {[lsearch {FULL DIV2} $Para(_rx_data_rate$i)] == -1} {set Para(_rx_data_rate$i) FULL}
		}
	}
	
	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	}
}

proc SRIOSetting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state disabled
	.rdo3_mode$i config -state disabled
	.rdo4_mode$i config -state normal
	if {[lsearch {RXTX DISABLED} $Para(_mode$i)] == -1} {set Para(_mode$i) DISABLED}
	
	#set Para(_ldr$i) 0

	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL DIV2
	if {$Para(_rx_data_rate$i) == "DIV11"} {set Para(_rx_data_rate$i) DIV2}
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL DIV2
	if {$Para(_tx_data_rate$i) == "DIV11"} {set Para(_tx_data_rate$i) DIV2}
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end ENABLED
	set Para(_rx_fifo$i) ENABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end ENABLED
	set Para(_tx_fifo$i) ENABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_rx_data_width$i)] == -1} {set Para(_rx_data_width$i) 8}
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_tx_data_width$i)] == -1} {set Para(_tx_data_width$i) 8}
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 50
	if {[lsearch {HIGH 50} $Para(_rterm_rx$i)] == -1} {set Para(_rterm_rx$i) HIGH}
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 50 5K
	if {$Para(_rterm_tx$i) == 75} {set Para(_rterm_tx$i) 50}

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end ENABLED
	set Para(_tx_8b10b$i) ENABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end ENABLED
	set Para(_rx_8b10b$i) ENABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end ENABLED
	set Para(_rxwa$i) ENABLED
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end DISABLED
	set Para(_ilsm$i) DISABLED
	
	.cbo_ctc$i clear list
	#Diamond 1.2: ECN33, CR51682
	#.cbo_ctc$i insert list end ENABLED
	#set Para(_ctc$i) ENABLED
	.cbo_ctc$i insert list end DISABLED
	set Para(_ctc$i) DISABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 1
	set Para(_cc_match_mode$i) 1
	
	set Para(_k0$i) 00
	set Para(_byten0$i) 00000000
	set Para(_k1$i) 00
	set Para(_byten1$i) 00000000
	set Para(_k2$i) 00
	set Para(_byten2$i) 00000000
	set Para(_k3$i) 01
	set Para(_byten3$i) $Para(K29P7)
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 0
	set Para(_cc_min_ipg$i) 0

	.cbo_rx_eq$i clear list
	.cbo_rx_eq$i insert list end DISABLED MID_MED MID_HIGH LONG_MED LONG_HIGH
	if {[lsearch {DISABLED MID_MED MID_HIGH LONG_MED LONG_HIGH} $Para(_rx_eq$i)] == -1} {set Para(_rx_eq$i) DISABLED}

	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 9
		set Para(_cchmark) 9
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 7
		set Para(_cclmark) 7
	}
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end K28P5
	set Para(_scomma$i) "K28P5"
	
	if {$Para(_mode$i) == "TXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_datarange) == "1.25" || $Para(_datarange) == "3.125"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL
			set Para(_tx_data_rate$i) FULL 
		}
		if {$Para(_datarange) == "2.5"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL DIV2
			if {[lsearch {FULL DIV2} $Para(_tx_data_rate$i)] == -1} {set Para(_tx_data_rate$i) FULL}
		}
	}
	
	if {$Para(_mode$i) == "RXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_rx_datarange$i) == "1.25" || $Para(_rx_datarange$i) == "3.125"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL
			set Para(_rx_data_rate$i) FULL
		}
		if {$Para(_rx_datarange$i) == "2.5"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL DIV2
			if {[lsearch {FULL DIV2} $Para(_rx_data_rate$i)] == -1} {set Para(_rx_data_rate$i) FULL}
		}
	}
}

proc DISP_PORTSetting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state normal
	.rdo3_mode$i config -state normal
	.rdo4_mode$i config -state normal
	
	#set Para(_ldr$i) 0

	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL
	set Para(_rx_data_rate$i) FULL
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL
	set Para(_tx_data_rate$i) FULL
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end ENABLED DISABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end ENABLED DISABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_rx_data_width$i)] == -1} {set Para(_rx_data_width$i) 8}
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_tx_data_width$i)] == -1} {set Para(_tx_data_width$i) 8}
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 50
	if {[lsearch {HIGH 50} $Para(_rterm_rx$i)] == -1} {set Para(_rterm_rx$i) HIGH}
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 5K 50
	if {$Para(_rterm_tx$i) == 75} {set Para(_rterm_tx$i) 50}

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end ENABLED
	set Para(_tx_8b10b$i) ENABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end ENABLED
	set Para(_rx_8b10b$i) ENABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end ENABLED
	set Para(_rxwa$i) ENABLED
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end ENABLED DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end ENABLED
	set Para(_ctc$i) ENABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 2
	set Para(_cc_match_mode$i) 2
	
	set Para(_k0$i) 01
	set Para(_byten0$i) 10111100
	set Para(_k1$i) 00
	set Para(_byten1$i) 01010000
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 0
	set Para(_cc_min_ipg$i) 0

	.cbo_rx_eq$i clear list
	.cbo_rx_eq$i insert list end DISABLED MID_MED MID_HIGH LONG_MED LONG_HIGH
	if {[lsearch {DISABLED MID_MED MID_HIGH LONG_MED LONG_HIGH} $Para(_rx_eq$i)] == -1} {set Para(_rx_eq$i) DISABLED}

	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 9
		set Para(_cchmark) 9
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 7
		set Para(_cclmark) 7
	}
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end K28P5
	set Para(_scomma$i) "K28P5"
}

proc FCSetting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state disabled
	.rdo3_mode$i config -state disabled
	.rdo4_mode$i config -state normal
	if {[lsearch {RXTX DISABLED} $Para(_mode$i)] == -1} {set Para(_mode$i) DISABLED}
	
	#set Para(_ldr$i) 0

	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL DIV2
	if {$Para(_rx_data_rate$i) == "DIV11"} {set Para(_rx_data_rate$i) DIV2}
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL DIV2
	if {$Para(_tx_data_rate$i) == "DIV11"} {set Para(_tx_data_rate$i) DIV2}
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end ENABLED
	set Para(_rx_fifo$i) ENABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end ENABLED
	set Para(_tx_fifo$i) ENABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_rx_data_width$i)] == -1} {set Para(_rx_data_width$i) 8}
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_tx_data_width$i)] == -1} {set Para(_tx_data_width$i) 8}
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 50 60
	if {[lsearch {HIGH 50 60} $Para(_rterm_rx$i)] == -1} {set Para(_rterm_rx$i) HIGH}
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 50 5K
	if {$Para(_rterm_tx$i) == 75} {set Para(_rterm_tx$i) 50}

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end ENABLED
	set Para(_tx_8b10b$i) ENABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end ENABLED
	set Para(_rx_8b10b$i) ENABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end ENABLED
	set Para(_rxwa$i) ENABLED
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end ENABLED DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end ENABLED
	set Para(_ctc$i) ENABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 4
	set Para(_cc_match_mode$i) 4
	
	set Para(_k0$i) 01
	set Para(_byten0$i) 10111100
	set Para(_k1$i) 00
	set Para(_byten1$i) 10010101
	set Para(_k2$i) 00
	set Para(_byten2$i) 10110101
	set Para(_k3$i) 00
	set Para(_byten3$i) 10110101
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 1
	set Para(_cc_min_ipg$i) 1

	.cbo_rx_eq$i clear list
	.cbo_rx_eq$i insert list end DISABLED MID_MED MID_HIGH LONG_MED LONG_HIGH
	if {[lsearch {DISABLED MID_MED MID_HIGH LONG_MED LONG_HIGH} $Para(_rx_eq$i)] == -1} {set Para(_rx_eq$i) DISABLED}

	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 9
		set Para(_cchmark) 9
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 7
		set Para(_cclmark) 7
	}
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end K28P5
	set Para(_scomma$i) "K28P5"
	
	if {$Para(_mode$i) == "TXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_datarange) == "1.0625"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL
			set Para(_tx_data_rate$i) FULL 
		}
		if {$Para(_datarange) == "2.125"} {
			.cbo_tx_data_rate$i clear list
			.cbo_tx_data_rate$i insert list end FULL DIV2
			if {[lsearch {FULL DIV2} $Para(_tx_data_rate$i)] == -1} {set Para(_tx_data_rate$i) FULL}
		}
	}
	
	if {$Para(_mode$i) == "RXONLY" || $Para(_mode$i) == "RXTX"} {
		if {$Para(_rx_datarange$i) == "1.0625"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL
			set Para(_rx_data_rate$i) FULL
		}
		if {$Para(_rx_datarange$i) == "2.125"} {
			.cbo_rx_data_rate$i clear list
			.cbo_rx_data_rate$i insert list end FULL DIV2
			if {[lsearch {FULL DIV2} $Para(_rx_data_rate$i)] == -1} {set Para(_rx_data_rate$i) FULL}
		}
	}
}

proc BSER10Setting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state normal
	.rdo3_mode$i config -state normal
	.rdo4_mode$i config -state normal
	
	.ck_ldr$i config -state normal

	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL DIV2
	if {$Para(_rx_data_rate$i) == "DIV11"} {set Para(_rx_data_rate$i) DIV2}
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL DIV2
	if {$Para(_tx_data_rate$i) == "DIV11"} {set Para(_tx_data_rate$i) DIV2}
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end ENABLED DISABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end ENABLED DISABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 10 20
	if {[lsearch {10 20} $Para(_rx_data_width$i)] == -1} {set Para(_rx_data_width$i) 10}
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 10 20
	if {[lsearch {10 20} $Para(_tx_data_width$i)] == -1} {set Para(_tx_data_width$i) 10}
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 75 50 60
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 5K 50 75

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end DISABLED
	set Para(_tx_8b10b$i) DISABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end DISABLED
	set Para(_rx_8b10b$i) DISABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end DISABLED ENABLED
	if {[lsearch {DISABLED ENABLED} $Para(_rxwa$i)] == -1} {set Para(_rxwa$i) DISABLED}
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end DISABLED
	set Para(_ilsm$i) DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end DISABLED
	set Para(_ctc$i) DISABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 1
	set Para(_cc_match_mode$i) 1
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 3 0 1 2
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end "User Defined"
	set Para(_scomma$i) "User Defined"
	
	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	}
}

proc BSER8Setting {i} {
	global Para
	
	#.cbo_refclk_mult clear list
	#.cbo_refclk_mult insert list end 10X 20X 25X
	
	.rdo1_mode$i config -state normal
	.rdo2_mode$i config -state normal
	.rdo3_mode$i config -state normal
	.rdo4_mode$i config -state normal
	
	.ck_ldr$i config -state normal

	.cbo_rx_data_rate$i clear list
	.cbo_rx_data_rate$i insert list end FULL DIV2
	if {$Para(_rx_data_rate$i) == "DIV11"} {set Para(_rx_data_rate$i) DIV2}
	
	.cbo_tx_data_rate$i clear list
	.cbo_tx_data_rate$i insert list end FULL DIV2
	if {$Para(_tx_data_rate$i) == "DIV11"} {set Para(_tx_data_rate$i) DIV2}
	
	.cbo_rx_fifo$i clear list
	.cbo_rx_fifo$i insert list end ENABLED DISABLED
	
	.cbo_tx_fifo$i clear list
	.cbo_tx_fifo$i insert list end ENABLED DISABLED
	
	.cbo_rx_data_width$i clear list
	.cbo_rx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_rx_data_width$i)] == -1} {set Para(_rx_data_width$i) 8}
	
	.cbo_tx_data_width$i clear list
	.cbo_tx_data_width$i insert list end 8 16
	if {[lsearch {8 16} $Para(_tx_data_width$i)] == -1} {set Para(_tx_data_width$i) 8}
	
	.cbo_rterm_rx$i clear list
	.cbo_rterm_rx$i insert list end HIGH 50 75 60
	
	.cbo_rterm_tx$i clear list
	.cbo_rterm_tx$i insert list end 5K 50 75

	.cbo_tx_8b10b$i clear list
	.cbo_tx_8b10b$i insert list end DISABLED
	set Para(_tx_8b10b$i) DISABLED
	
	.cbo_rx_8b10b$i clear list
	.cbo_rx_8b10b$i insert list end DISABLED
	set Para(_rx_8b10b$i) DISABLED
	
	.cbo_rxwa$i clear list
	.cbo_rxwa$i insert list end DISABLED
	set Para(_rxwa$i) DISABLED
	
	.cbo_ilsm$i clear list
	.cbo_ilsm$i insert list end DISABLED
	set Para(_ilsm$i) DISABLED
	
	.cbo_ctc$i clear list
	.cbo_ctc$i insert list end DISABLED
	
	.cbo_cc_match_mode$i clear list
	.cbo_cc_match_mode$i insert list end 1 2 4
	
	.cbo_cc_min_ipg$i clear list
	.cbo_cc_min_ipg$i insert list end 3 0 1 2
	
	.cbo_scomma$i clear list
	.cbo_scomma$i insert list end "User Defined"
	set Para(_scomma$i) "User Defined"
	
	if {$Para(_mode$i) != "DISABLED" } {
		.cbo_cchmark clear list
		.cbo_cchmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		.cbo_cclmark clear list
		.cbo_cclmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	}
}

proc ChangeMatchCmd {i} {
	global Para
	
	#for {set i 0} {$i<4} {incr i} {
		if {$Para(_cc_match_mode$i) == 1} {
			set Para(_k0$i) $Para(_k3$i)
			set Para(_byten0$i) $Para(_byten3$i)
		}
		if {$Para(_cc_match_mode$i) == 2} {
			set Para(_k0$i) $Para(_k2$i)
			set Para(_byten0$i) $Para(_byten2$i)
			set Para(_k1$i) $Para(_k3$i)
			set Para(_byten1$i) $Para(_byten3$i)
		}
	#}
}

proc ChangeModeCmd {} {
	global Para
	
	switch $Para(_refclk_mult)  {
		8XH {set mult 4}
		10XH {set mult 5}
		8X {set mult 8}
		10X {set mult 10}
		16X {set mult 16}
		20X {set mult 20}
		25X {set mult 25}
	} 
	if {[string length $Para(_datarange)] > 0} {
		if {$Para(_datarange) == "."} {
			set Para(_datarange) "0."
			.entry_datarange.lwchildsite.entry icursor end
			set Para(_refclk_rate) 0
		} else {
			set Para(_refclk_rate) [expr $Para(_datarange)*1000/$mult]
			for {set i 0} {$i<4} {incr i} {
				if {$Para(_protocol$i) == "SDI" && $Para(_refclk_mult) == "20X" && $Para(_datarange) == "0.27"} {
					set Para(_refclk_rate) [expr 0.54*1000/$mult]
				}
			}
		}
	} else {
		set Para(_refclk_rate) 0
	}

	#43639
	.cbo_cchmark config -state disabled
	.cbo_cclmark config -state disabled
	
	set tx_lst_cbo {_tx_data_rate _tx_data_width _tx_fifo _tdrv_amp _tx_pre _rterm_tx \
		_tx_sb _tx_8b10b} 
#	set tx_lst_entry {_tx_ficlk_rate}
	set tx_lst_entry {}
	set tx_lst_only {_pll_term _pll_dcc _pll_lol_set}
	set rx_lst_cbo {_pll_rxsrc Multiplier _rx_data_rate _rx_data_width _rx_fifo \
		_rx_eq _rterm_rx _rx_dcc _los_threshold _rx_sb _ird _rx_8b10b _rxwa _ilsm _scomma \
		_ctc _cc_match_mode _cc_min_ipg}
#	set rx_lst_entry {_rxrefclk_rate _rx_ficlk_rate _comma_a _comma_b _comma_m _byten0 _byten1 _byten2 _byten3}
	set rx_lst_entry {_rx_datarange _comma_a _comma_b _comma_m _byten0 _byten1 _byten2 _byten3}
	set rx_lst_ck {k0 k1 k2 k3}
	set rx_lst_only {_cchmark _cclmark}
	for {set i 0} {$i<4} {incr i} {
		.rdo1_mode$i config -state disabled
		.rdo2_mode$i config -state disabled
		.rdo3_mode$i config -state disabled
		.rdo4_mode$i config -state disabled
		if {$Para(_mode$i) == "RXTX" } {
			foreach item $tx_lst_cbo {
				.cbo${item}$i config -state normal
			}
			foreach item $rx_lst_cbo {
				.cbo${item}$i config -state normal
			}
			foreach item $rx_lst_entry {
				.entry${item}$i config -state normal
			}
			foreach item $rx_lst_ck {
				.ck${item}$i config -state normal
			}
			.cbo_cchmark config -state normal
			.cbo_cclmark config -state normal
		}
		if {$Para(_mode$i) == "TXONLY" } {
			foreach item $tx_lst_cbo {
				.cbo${item}$i config -state normal
			}
			foreach item $rx_lst_cbo {
				.cbo${item}$i config -state disabled
			}
			foreach item $rx_lst_entry {
				.entry${item}$i config -state disabled
			}
			foreach item $rx_lst_ck {
				.ck${item}$i config -state disabled
			}
		}
		if {$Para(_mode$i) == "RXONLY" } {
			foreach item $tx_lst_cbo {
				.cbo${item}$i config -state disabled
			}
			foreach item $rx_lst_cbo {
				.cbo${item}$i config -state normal
			}
			foreach item $rx_lst_entry {
				.entry${item}$i config -state normal
			}
			foreach item $rx_lst_ck {
				.ck${item}$i config -state normal
			}
			.cbo_cchmark config -state normal
			.cbo_cclmark config -state normal
		}
		if {$Para(_mode$i) == "DISABLED" } {
			foreach item $tx_lst_cbo {
				.cbo${item}$i config -state disabled
			}
			foreach item $rx_lst_cbo {
				.cbo${item}$i config -state disabled
			}
			foreach item $rx_lst_entry {
				.entry${item}$i config -state disabled
			}
			foreach item $rx_lst_ck {
				.ck${item}$i config -state disabled
			}
			
			#cr_39770,40222
			#.cbo_protocol$i config -state normal
			#.ck_ldr$i config -state disabled
			#set Para(_ldr$i) DISABLED
			
			.cbo_lbtype$i config -state disabled
			set Para(_lbtype$i) DISABLED
		} else {
			#.cbo_protocol$i config -state normal
			#.ck_ldr$i config -state normal

			.cbo_lbtype$i config -state normal
		}
		.cbo_los_threshold$i clear list
		.cbo_los_threshold$i insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		.cbo_los_threshold$i config -state disabled
		
 		#7,9
		if {$Para(_tx_data_rate$i) == "FULL"} {set tdiv 1}
		if {$Para(_tx_data_rate$i) == "DIV2"} {set tdiv 2}
		if {$Para(_tx_data_rate$i) == "DIV11"} {set tdiv 11}
		if {$Para(_protocol$i) != "8BSER"} {
			if {$Para(_tx_data_width$i) == "8" || $Para(_tx_data_width$i) == "10" } {
				set datawidth 10
			} else {
				set datawidth 20
			}
		} else {
			set datawidth $Para(_tx_data_width$i)
		}
		if {[string length $Para(_datarange)] > 0} {
			#set Para(_tx_ficlk_rate$i) [expr $Para(_datarange)*1000/($datawidth*$tdiv)]
			if {$Para(_datarange) == "."} {
				set Para(_datarange) "0."
				.entry_datarange.lwchildsite.entry icursor end
				set Para(_tx_ficlk_rate$i) 0
			} else {
				if {$Para(_protocol$i) == "SDI" && $Para(_refclk_mult) == "20X" && $Para(_datarange) == "0.27"} {
					set Para(_tx_ficlk_rate$i) [expr 0.54*1000/($datawidth*$tdiv)]
				} else {
					set Para(_tx_ficlk_rate$i) [expr $Para(_datarange)*1000/($datawidth*$tdiv)]
				}
			}
		} else {
			set Para(_tx_ficlk_rate$i) 0
		}
		
		#8
		if {$Para(_scomma$i) =="K28P5" || $Para(_scomma$i) =="K28P157"} {
			.entry_comma_a$i config -state disabled
			.entry_comma_b$i config -state disabled
			.entry_comma_m$i config -state disabled
		
			if {$Para(_scomma$i) =="K28P5"}   {
				set Para(_comma_a$i) $Para(K28P5+)
				set Para(_comma_b$i) $Para(K28P5-)
				set Para(_comma_m$i) $Para(K28P5M)
			}
			if {$Para(_scomma$i) =="K28P157"} {
				set Para(_comma_a$i) $Para(K28P157+)
				set Para(_comma_b$i) $Para(K28P157-)
				set Para(_comma_m$i) $Para(K28P157M)
			}
		} else {
			if {[.cbo_scomma$i cget -state] != "disabled"} {
				.entry_comma_a$i config -state normal
				.entry_comma_b$i config -state normal
				.entry_comma_m$i config -state normal
			}
			#48773
			#set Para(_comma_m$i) "1111111100"
		}

		switch $Para(_refclk_mult)  {
			8XH {set mult 4}
			10XH {set mult 5}
			8X {set mult 8}
			10X {set mult 10}
			16X {set mult 16}
			20X {set mult 20}
			25X {set mult 25}
		} 

		#12,14
		if {$Para(_rx_data_rate$i) == "FULL"} {set rdiv 1}
		if {$Para(_rx_data_rate$i) == "DIV2"} {set rdiv 2}
		if {$Para(_rx_data_rate$i) == "DIV11"} {set rdiv 11}
		if {$Para(_protocol$i) != "8BSER"} {
			if {$Para(_rx_data_width$i) <= "10" } {
				set datawidth 10
			} else {
				set datawidth 20
			}
		} else {
			set datawidth $Para(_rx_data_width$i)
		}
		if {[string length $Para(_rx_datarange$i)] > 0} {
			if {$Para(_rx_datarange$i) == "."} {
				set Para(_rx_datarange$i) "0."
				.entry_rx_datarange${i}.lwchildsite.entry icursor end
				set Para(_rxrefclk_rate$i) 0
				set Para(_rx_ficlk_rate$i) 0
			} else {
				if {$Para(_protocol$i) == "SDI" && $Para(_refclk_mult) == "20X" && $Para(_rx_datarange$i) == "0.27"} {
					set Para(_rxrefclk_rate$i) [expr 0.54*1000/$mult]
					set Para(_rx_ficlk_rate$i) [expr 0.54*1000/($datawidth*$rdiv)]
				} else {
					set Para(_rxrefclk_rate$i) [expr $Para(_rx_datarange$i)*1000/$mult]
					set Para(_rx_ficlk_rate$i) [expr $Para(_rx_datarange$i)*1000/($datawidth*$rdiv)]
				}
			}
		} else {
			set Para(_rxrefclk_rate$i) 0
			set Para(_rx_ficlk_rate$i) 0
		}
		
		.cbo_rx_eq$i clear list
		.cbo_rx_eq$i insert list end DISABLED MID_LOW MID_MED MID_HIGH LONG_LOW LONG_MED LONG_HIGH
		.cbo_tdrv_amp$i clear list
		.cbo_tdrv_amp$i insert list end -4 -3 -2 -1 0 1 2 3 4
		
		if {$Para(_mode$i) != "DISABLED" } {
#			.cbo_cchmark clear list
#			.cbo_cchmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
#			.cbo_cclmark clear list
#			.cbo_cclmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		}

		#set Para(_tdrv_ch$i) 0
		#ISPL_CR_43767 
		.ck_ldr$i config -state normal
#		if {$Para(dev_type) == "E"} { 
			#set Para(_los_threshold_mode$i) "LOS_E"
			#ISPL_CR_45180 
#			if {$Para(_protocol$i) != "PCIE"} {
#				set Para(_los_threshold_lo$i) 2
#			}
#		} else {
			#set Para(_los_threshold_mode$i) "LOS_EA"
#			set Para(_los_threshold_lo$i) 7
#			set Para(_los_threshold_hi$i) 7
			#.cbo_los_threshold$i clear list
			#.cbo_los_threshold$i insert list end 0 1 2 3 4 5 6 7
#		}
		.cbo_rx_los_port$i config -state disabled
		if {$Para(_mode$i) != "DISABLED" && $Para(_rst_gen) == "ENABLED"} {
			.cbo_rx_los_port$i config -state normal
		} else {
			set Para(_rx_los_port$i) "Internal"
		}
		switch $Para(_protocol$i) {
			"G8B10B" {G8B10BSetting $i}
			"PCIE" {PCIESetting $i}
			"PIPE" {PCIESetting $i}
			"SGMII" {SGMIISetting $i}
			"GIGE" {GIGESetting $i}
			"XAUI" {XAUISetting $i}
			"SDI" {SDISetting $i}
			"CPRI" {CPRISetting $i}
			"OBSAI" {OBSAISetting $i}
			"SRIO" {SRIOSetting $i}
			"SATA" {SRIOSetting $i}
			"DISP_PORT" {DISP_PORTSetting $i}
			"FC" {FCSetting $i}
			"10BSER" {BSER10Setting $i}
			"8BSER" {BSER8Setting $i}
			default {}
		}
	}
	
	#P22.6+10 #15+#18, Rev 3.9 no these 2 notes.
	for {set i 0} {$i<4} {incr i} {
		if {$Para(_mode$i) == "RXTX" || $Para(_mode$i) == "TXONLY"} {
			if {$Para(_tx_data_width$i) == "8" || $Para(_tx_data_width$i) == "10"} {
				.cbo_tx_fifo$i config -state normal
			} else {
				.cbo_tx_fifo$i config -state disabled
				set Para(_tx_fifo$i) ENABLED
			}
			set Para(_tx_protocol$i) $Para(_protocol$i)
		} else {
			set Para(_tx_protocol$i) DISABLED
		}

		if {$Para(_mode$i) == "RXTX" || $Para(_mode$i) == "RXONLY"} {
			if {$Para(_rx_data_width$i) == "8" || $Para(_rx_data_width$i) == "10"} {
				.cbo_rx_fifo$i config -state normal
			} else {
				.cbo_rx_fifo$i config -state disabled
				set Para(_rx_fifo$i) ENABLED
			}
			set Para(_rx_protocol$i) $Para(_protocol$i)
		} else {
			set Para(_rx_protocol$i) DISABLED
		}
	}

	#Table Tab6. Note 7
	for {set i 0} {$i<4} {incr i} {
		if {($Para(_protocol$i) == "G8B10B" || $Para(_protocol$i) == "CPRI" || $Para(_protocol$i) == "OBSAI" || $Para(_protocol$i) == "SRIO") && 
			($Para(_mode$i) == "RXTX" || $Para(_mode$i) == "TXONLY")} {
			.ckP62Ch$i config -state normal
		} else {
			.ckP62Ch$i config -state disabled
			set Para(_teidle_ch$i) DISABLED
		}
		
		for {set j 0} {$j < 4} {incr j} {
			.ckk${j}${i} config -state disabled
			.entry_byten${j}${i} config -state disabled
		}
		if {$Para(_mode$i) == "RXTX" || $Para(_mode$i) == "RXONLY"} {
			for {set j 0} {$j < $Para(_cc_match_mode$i)} {incr j} {
				#cr_43620 pg36 note4
				#if {$Para(_protocol$i) == "SDI" || $Para(_protocol$i) == "G8B10B" || $Para(_protocol$i) == "CPRI" ||
				#	$Para(_protocol$i) == "OBSAI" || $Para(_protocol$i) == "10BSER" || $Para(_protocol$i) == "8BSER"} {
					#set x [expr 3 - $j]
					.entry_byten${j}${i} config -state normal
					.ckk${j}${i} config -state normal
				#}
			}
			#if {$Para(_cc_match_mode$i) == 1} {
			#	set Para(_k0$i) $Para(_k3$i)
			#	set Para(_byten0$i) $Para(_byten3$i)
			#}
			#if {$Para(_cc_match_mode$i) == 2} {
			#	set Para(_k0$i) $Para(_k2$i)
			#	set Para(_byten0$i) $Para(_byten2$i)
			#	set Para(_k1$i) $Para(_k3$i)
			#	set Para(_byten1$i) $Para(_byten3$i)
			#}
		}
		if {$Para(_mode$i) == "TXONLY"} {
			set Para(_rx_fifo$i) DISABLED
		}
	}
	
	if {$Para(_sci_ports) == "DISABLED"} { 
		.ck_sci_int_port config -state disabled
		set Para(_sci_int_port) DISABLED
	} else {
		.ck_sci_int_port config -state normal
#		set Para(_sci_int_port) ENABLED
	}
	
	#47036
	if {$Para(_pll_txsrc) == "EXTERNAL"} {
		.cbo_pll_term config -state normal
		.lbl_pll_term config -state normal
		.cbo_pll_dcc  config -state normal
		.lbl_pll_dcc  config -state normal
	} else {
		.cbo_pll_term config -state disabled
		.lbl_pll_term config -state disabled
		.cbo_pll_dcc  config -state disabled
		.lbl_pll_dcc  config -state disabled
	}
	if {($Para(_mode0) == "DISABLED" || $Para(_mode0) == "RXONLY") &&
		($Para(_mode1) == "DISABLED" || $Para(_mode1) == "RXONLY") &&
		($Para(_mode2) == "DISABLED" || $Para(_mode2) == "RXONLY") &&
		($Para(_mode3) == "DISABLED" || $Para(_mode3) == "RXONLY")} {
		.cbo_pll_lol_set config -state disabled
		.lbl_pll_lol_set config -state disabled
	} else {
		.cbo_pll_lol_set config -state normal
		.lbl_pll_lol_set config -state normal
	}
	
	Config150TW
}

proc ChangeSciPortsCmd {} {
	global Para

	set Para(_sci_int_port) $Para(_sci_ports)
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

proc ChangeValueCmd {} {
	global Para
	
	ChangeModeCmd
	CSBGA328_Enhancement
	
	#! D2.0.1 CR_55706
	if {$Para(_rst_gen) == "ENABLED"} {
		set Para(_refck2core) "ENABLED"
		.ck_refck2core config -state disabled		
	} else {
		.ck_refck2core config -state normal		
	}
	DrawPins
}

#******************************************************************************
# Public Template Function:
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para

	#Diamond 1.2 IPExpress: Fixed CR_51697,52438
	if {$Para(new) == 0} {LoadDefaultParameter $Para(CoreName) $Para(ParaFile) 1}
	for {set i 0} {$i<4} {incr i} {
		if {[info exists Para(_rx_datarange$i)]} {
			set Para(_rx_datarange$i) $Para(_datarange)
		}
		if {[info exists Para(_tdrv_amp$i)]} {
			#tk_messageBox -default ok -icon info -message $Para(_tdrv_amp$i) -title _tdrv_amp$i -type ok
			set Para(_tdrv_amp_flag) 1
			switch $Para(_tdrv_amp$i) {
				4 {set Para(_tdrv_ch$i) -4}
				5 {set Para(_tdrv_ch$i) -3}
				6 {set Para(_tdrv_ch$i) -2}
				7 {set Para(_tdrv_ch$i) -1}
				0 {set Para(_tdrv_ch$i) 0}
				1 {set Para(_tdrv_ch$i) 2}
				2 -
				3 {set Para(_tdrv_ch$i) 3}
			}
		}
	}
	if {$Para(_tdrv_amp_flag) == 1} {
		set Para(_tdrv_amp_msg) "The attribute _tdrv_amp* (CHn_TDRV_AMP) is no longer supported and converted to the new attribute _tdrv* (CHn_TDRV). For additional details, please refer to the technote TN1176."
		tk_messageBox -default ok -icon info -message $Para(_tdrv_amp_msg) -title "Load Parameter" -type ok
	}
}

proc CheckRegenerate {} {
	global Para OldPara

	#tk_messageBox -default ok -icon info -message $Para(new) -title new -type ok

	#new a module
	if {$Para(new) == 1} { 
		return 1
	} else {
		#tk_messageBox -default ok -icon info -message $Para(newpath) -title newpath -type ok
		#tk_messageBox -default ok -icon info -message $Para(newmodule) -title newmodule -type ok
		#!if newpath=NULL & newmodule=NULL, then this is double click LPC file in prjnav.
		#!if newpath!=NULL || newmodule!=NULL, then regenerate from IPExpress.
		if {[string length $Para(newpath)] > 0 || [string length $Para(newmodule)] > 0} {
#48494		
#			return 1
			if {$Para(newpath) != $Para(path) || $Para(newmodule) != $Para(module)} {
				return 1
			}
		}
	}
	
	if {[info exists Para(_tdrv_amp_msg)]} {
		if {[string length $Para(_tdrv_amp_msg)] > 0} {
			return 1
		}
	}
	
	set para_lst {VendorName CoreType Date Time CoreStatus CoreRevision ParameterFileVersion \
		_tdrv_ch0 _tdrv_ch1 _tdrv_ch2 _tdrv_ch3 _tx_pre0 _tx_pre1 _tx_pre2 _tx_pre3 _rterm_tx0 _rterm_tx1 _rterm_tx2 _rterm_tx3 \
		_rx_eq0 _rx_eq1 _rx_eq2 _rx_eq3 _rterm_rx0 _rterm_rx1 _rterm_rx2 _rterm_rx3 _rx_dcc0 _rx_dcc1 _rx_dcc2 _rx_dcc3 \
		_los_threshold0 _los_threshold1 _los_threshold2 _los_threshold3 _pll_term _pll_dcc _pll_lol_set \
		_tx_sb0 _tx_sb1 _tx_sb2 _tx_sb3 _tx_8b10b0 _tx_8b10b1 _tx_8b10b2 _tx_8b10b3 _rx_sb0 _rx_sb1 _rx_sb2 _rx_sb3 \
		_rx_8b10b0 _rx_8b10b1 _rx_8b10b2 _rx_8b10b3 _rxwa0 _rxwa1 _rxwa2 _rxwa3 _scomma0 _scomma1 _scomma2 _scomma3 \
		_comma_a0 _comma_a1 _comma_a2 _comma_a3 _comma_b0 _comma_b1 _comma_b2 _comma_b3 _comma_m0 _comma_m1 _comma_m2 _comma_m3 \
		_cc_match_mode0 _cc_match_mode1 _cc_match_mode2 _cc_match_mode3 \
		_byten00 _byten01 _byten02 _byten03 _byten10 _byten11 _byten12 _byten13 \
		_byten20 _byten21 _byten22 _byten23 _byten30 _byten31 _byten32 _byten33 \
		_cc_min_ipg0 _cc_min_ipg1 _cc_min_ipg2 _cc_min_ipg3 _cchmark _cclmark \
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

	set clkrate LOW
	#ISPL_CR_41922 CR_42392
	#LOW ¡Ý 0.15 <= 0.23
	if {$Para(_datarange) >= "0.15" && $Para(_datarange) <= "0.23"} {
		set clkrate LOWLOW
	}
	#LOW > 0.23 <= 0.45
	if {$Para(_datarange) > "0.23" && $Para(_datarange) <= "0.45"} {
		set clkrate LOW
	}
	#MEDLOW > 0.45 <= 0.9
	if {$Para(_datarange) > "0.45" && $Para(_datarange) <= "0.9"} {
		set clkrate MEDLOW
	}
	#MED > 0.9 <= 1.8
	if {$Para(_datarange) > "0.9" && $Para(_datarange) <= "1.8"} {
		set clkrate MED
	}
	#MEDHIGH >1.8 <= 2.55
	if {$Para(_datarange) > "1.8" && $Para(_datarange) <= "2.55"} {
		set clkrate MEDHIGH
	}
	#HIGH > 2.55 <= 3.2
	if {$Para(_datarange) > "2.55" && $Para(_datarange) <= "3.2"} {
		set clkrate HIGH
	}

	puts $outputfile "#define _device_name \"$Para(PartType)\""

	for {set i 0} {$i<4} {incr i} {
		if {$Para(_rx_datarange$i) >= "0.15" && $Para(_rx_datarange$i) <= "0.23"} {
			set Para(rx_datarange$i) LOWLOW
		}
		if {$Para(_rx_datarange$i) > "0.23" && $Para(_rx_datarange$i) <= "0.45"} {
			set Para(rx_datarange$i) LOW
		}
		if {$Para(_rx_datarange$i) > "0.45" && $Para(_rx_datarange$i) <= "0.9"} {
			set Para(rx_datarange$i) MEDLOW
		}
		if {$Para(_rx_datarange$i) > "0.9" && $Para(_rx_datarange$i) <= "1.8"} {
			set Para(rx_datarange$i) MED
		}
		if {$Para(_rx_datarange$i) > "1.8" && $Para(_rx_datarange$i) <= "2.55"} {
			set Para(rx_datarange$i) MEDHIGH
		}
		if {$Para(_rx_datarange$i) > "2.55" && $Para(_rx_datarange$i) <= "3.2"} {
			set Para(rx_datarange$i) HIGH
		}

		if {$Para(_protocol$i) == "SDI" && $Para(_refclk_mult) == "20X" && $Para(_datarange) == "0.27"} {
			set clkrate MEDLOW
		}
		if {$Para(_protocol$i) == "SDI" && $Para(_refclk_mult) == "20X" && $Para(_rx_datarange$i) == "0.27"} {
			set Para(rx_datarange$i) MEDLOW
		}

		if {$Para(_pll_rxsrc$i)=="EXTERNAL"} {
			set rxsrc REFCLK_EXT
		}
		if {$Para(_pll_rxsrc$i)=="INTERNAL"} {
			set rxsrc REFCLK_CORE
		}
		if {$Para(_pll_rxsrc$i)=="TRAINDIV4"} {
			set rxsrc TRAIN_DIV4
		}
		if {$Para(_pll_rxsrc$i)=="TRAINDIV8"} {
			set rxsrc TRAIN_DIV8
		}
		puts $outputfile "#define _ch${i}_pll_rxsrc \"$rxsrc\""
		puts $outputfile "#define _ch${i}_mode \"$Para(_mode$i)\"
#define _ch${i}_protocol \"$Para(_protocol$i)\"
#define _ch${i}_ldr \"$Para(_ldr$i)\"
#define _ch${i}_tx_data_rate \"$Para(_tx_data_rate$i)\"
#define _ch${i}_tx_data_width \"$Para(_tx_data_width$i)\"
#define _ch${i}_tx_fifo \"$Para(_tx_fifo$i)\"
#define _ch${i}_tx_ficlk_rate $Para(_tx_ficlk_rate$i)
#define _ch${i}_rx_datarange \"$Para(rx_datarange$i)\"
#define _ch${i}_rx_data_rate \"$Para(_rx_data_rate$i)\"
#define _ch${i}_rxrefclk_rate \"$Para(_rxrefclk_rate$i)\"
#define _ch${i}_rx_data_width \"$Para(_rx_data_width$i)\"
#define _ch${i}_rx_fifo \"$Para(_rx_fifo$i)\"
#define _ch${i}_rx_ficlk_rate $Para(_rx_ficlk_rate$i)
#define _ch${i}_tdrv \"$Para(_tdrv_ch$i)\"
#define _ch${i}_tx_pre \"$Para(_tx_pre$i)\"
#define _ch${i}_rterm_tx \"$Para(_rterm_tx$i)\"
#define _ch${i}_rx_eq \"$Para(_rx_eq$i)\"
#define _ch${i}_rterm_rx \"$Para(_rterm_rx$i)\"
#define _ch${i}_rx_dcc \"$Para(_rx_dcc$i)\""
#define _los_threshold_mode$i \"$Para(_los_threshold_mode$i)\""

#		if {$Para(_los_threshold_mode$i) == "LOS_E"} {
			puts $outputfile "#define _los_threshold_lo$i \"$Para(_los_threshold_lo$i)\""
#		} else {
#			puts $outputfile "#define _los_threshold_hi$i \"$Para(_los_threshold_hi$i)\""
#		}
	
		puts $outputfile "#define _ch${i}_tx_sb \"$Para(_tx_sb$i)\"
#define _ch${i}_tx_8b10b \"$Para(_tx_8b10b$i)\"
#define _ch${i}_rx_sb \"$Para(_rx_sb$i)\"
#define _ch${i}_ird \"$Para(_ird$i)\"
#define _ch${i}_rx_8b10b \"$Para(_rx_8b10b$i)\"
#define _ch${i}_rxwa \"$Para(_rxwa$i)\"
#define _ch${i}_ilsm \"$Para(_ilsm$i)\"
#define _ch${i}_scomma \"$Para(_scomma$i)\"
#define _ch${i}_comma_a \"$Para(_comma_a$i)\"
#define _ch${i}_comma_b \"$Para(_comma_b$i)\"
#define _ch${i}_comma_m \"$Para(_comma_m$i)\"
#define _ch${i}_ctc \"$Para(_ctc$i)\"
#define _ch${i}_cc_match_mode \"$Para(_cc_match_mode$i)\"
#define _ch${i}_byten \"$Para(_k0$i)$Para(_byten0$i)\"
#define _ch${i}_byten1 \"$Para(_k1$i)$Para(_byten1$i)\"
#define _ch${i}_byten2 \"$Para(_k2$i)$Para(_byten2$i)\"
#define _ch${i}_byten3 \"$Para(_k3$i)$Para(_byten3$i)\"
#define _ch${i}_cc_min_ipg \"$Para(_cc_min_ipg$i)\"
#define _ch${i}_lbtype \"$Para(_lbtype$i)\"
#define _ch${i}_teidle \"$Para(_teidle_ch$i)\"
#define _ch${i}_rx_lol_port \"[string toupper $Para(_rx_los_port$i)]\"\n"
	}

	if {$Para(_pll_txsrc)=="EXTERNAL"} {
		set txsrc REFCLK_EXT
	} else {
		set txsrc REFCLK_CORE
	}
	puts $outputfile "#define _datarange \"$clkrate\"
#define _pll_txsrc \"$txsrc\"
#define _refclk_mult \"$Para(_refclk_mult)\"
#define _refclk_rate $Para(_refclk_rate)
#define _pll_term \"$Para(_pll_term)\"
#define _pll_dcc \"$Para(_pll_dcc)\"
#define _pll_lol_set \"$Para(_pll_lol_set)\"
#define _cchmark \"$Para(_cchmark)\"
#define _cclmark \"$Para(_cclmark)\"
#define _rst_gen \"$Para(_rst_gen)\"
#define _sci_ports \"$Para(_sci_ports)\"
#define _sci_int_port \"$Para(_sci_int_port)\"
#define _refck2core \"$Para(_refck2core)\""

	puts $outputfile "#define _circuit_name $Para(ModuleName)"

	set ret [CheckRegenerate]
#	if {$Para(ModuleName) != "dummy_sym" && $ret == "1" && $Para(Regen) == "setting"} {
#		set ret 0
#	}
	if {$ret == "0" && $Para(Regen) == "module"} {
		set ret 1
	}
	if {$ret == 0} {
		set msg "Only the configuration settings have been updated, please ensure that bitstream is re-generated - it will not happen automatically."
		if {$Para(bali) == "false"} {
			tk_messageBox -default ok -icon info -message $msg -title "Regenerate" -type ok
		}
		puts $outputfile "#include <pcs/pcsd_cfg.txt>"
	} else {
		if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
			[string equal -nocase $Para(SourceFormat) "VHDL"]} {
			puts $outputfile "#define _lang vhdl\n"
			puts $outputfile "#include <pcs/PCSD.vhd>"
			puts $outputfile "#include <pcs/pcsd_cfg.txt>"
		}
		if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
			[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {
			puts $outputfile "#define _lang verilog\n"
			puts $outputfile "#include <pcs/PCSD.v>"
			puts $outputfile "#include <pcs/pcsd_cfg.txt>"
		}
	}

	close $outputfile
	return 0
}

proc checkSingleValue {i datarange} {
	global Para
	
	set tit "Check Parameter"
	if {$Para(_datarange) != $datarange || $Para(_rx_datarange$i) != $datarange} {
		set msg "The data rate of protocol - $Para(_protocol$i) only supports $datarange Gbps!"
		tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
		return -1
	}
	
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
	set count 0
	set m_list {}
	for {set i 0} {$i<4} {incr i} {
		if {$Para(_mode$i) != "DISABLED"} {
			incr count
			lappend m_list $i
		}
	}

	set min_data_rate 0.25
	foreach idx $m_list {
		if {$Para(_protocol$idx) == "G8B10B" || $Para(_protocol$idx) == "10BSER" || $Para(_protocol$idx) == "8BSER"} {
			set min_data_rate 0.15
		}
	}
	set ret [IsInRange "Transmit Data Rate" $min_data_rate 3.2 $Para(_datarange)]
	if {$ret == "-1"} {return -1}

	for {set i 0} {$i<4} {incr i} {
		set ret [IsInRange "Receive Data Rate" $min_data_rate 3.2 $Para(_rx_datarange$i)]
		if {$ret == "-1"} {return -1}
	}
	
	if {$Para(_pll_txsrc) == "EXTERNAL"} {
		set external_flag 0
		if {$count == 1} {
			set j [lindex $m_list 0]
			if {$Para(_pll_rxsrc$j) == "EXTERNAL"} {
				if {$Para(_refclk_rate) != $Para(_rxrefclk_rate$j)} {
					set external_flag 1
				}
			}
		}
		if {$count == 2} {
			set j [lindex $m_list 0]
			set k [lindex $m_list 1]
			if {$Para(_pll_rxsrc$j) == "EXTERNAL" && 
				$Para(_pll_rxsrc$k) == "EXTERNAL"} {
				if {$Para(_refclk_rate) != $Para(_rxrefclk_rate$j) ||
					$Para(_refclk_rate) != $Para(_rxrefclk_rate$k)} {
					set external_flag 1
				}
			}
		}
		if {$count == 3} {
			set j [lindex $m_list 0]
			set k [lindex $m_list 1]
			set l [lindex $m_list 2]
			if {$Para(_pll_rxsrc$j) == "EXTERNAL" && 
				$Para(_pll_rxsrc$k) == "EXTERNAL" &&
				$Para(_pll_rxsrc$l) == "EXTERNAL"} {
				if {$Para(_refclk_rate) != $Para(_rxrefclk_rate$j) ||
					$Para(_refclk_rate) != $Para(_rxrefclk_rate$k) ||
					$Para(_refclk_rate) != $Para(_rxrefclk_rate$l)} {
					set external_flag 1
				}
			}
		}
		if {$count == 4} {
			if {$Para(_pll_rxsrc0) == "EXTERNAL" && 
				$Para(_pll_rxsrc1) == "EXTERNAL" &&
				$Para(_pll_rxsrc2) == "EXTERNAL" &&
				$Para(_pll_rxsrc3) == "EXTERNAL"} {
				if {$Para(_refclk_rate) != $Para(_rxrefclk_rate0) ||
					$Para(_refclk_rate) != $Para(_rxrefclk_rate1) ||
					$Para(_refclk_rate) != $Para(_rxrefclk_rate2) ||
					$Para(_refclk_rate) != $Para(_rxrefclk_rate3)} {
					set external_flag 1
				}
			}
		}
		set msg "If both Tx Refclk Source and Rx Reference Clock Source are EXTERNAL then the Rx Reference Clock Rate must be same as Tx Reference Clock Rate."
		if {$external_flag == "1"} {
			tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
			return -1
		}
	}
	
	set ret [CheckRegenerate]
	if {$Para(ModuleName) != "dummy_sym" && $ret == "1" && $Para(Regen) == "setting"} {
		set msg "Error: Module HDL generation is necessary due to selected configuration. Please use Automatic or Force Module options."
		tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
		return -1
	}

	if {$count > 1} {

	#Rev3.3
	#GR1 PCIE, GIGE
	#GR2 PCIE, SRIO
	#GR3 SRIO, GIGE
	#GR4 PCIE, SRIO, GIGE
		#set group_lst {{PIPE GIGE} {PIPE SRIO} {SRIO GIGE} {PIPE SRIO GIGE}}
		set group_lst {{PCIE GIGE SGMII} {PCIE SRIO} {SRIO GIGE SGMII} {PCIE SRIO GIGE SGMII}}
		switch $count {
			"2" {
				foreach lst $group_lst {
					set i [lindex $m_list 0]
					set j [lindex $m_list 1]
					if {$Para(_protocol$i) == $Para(_protocol$j)} {return 0}
					if {[lsearch $lst $Para(_protocol$i)] != -1 &&
						[lsearch $lst $Para(_protocol$j)] != -1} {
						return 0
					}
				}
				set msg "Only the protocol - \"PCIE SRIO GIGE SGMII\" are legal for protocol grouping!"
				tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
				return -1
			}
			"3" {
				foreach lst $group_lst {
					set i [lindex $m_list 0]
					set j [lindex $m_list 1]
					set k [lindex $m_list 2]
					if {$Para(_protocol$i) == $Para(_protocol$j) &&
						$Para(_protocol$i) == $Para(_protocol$k)} {return 0}
					if {[lsearch $lst $Para(_protocol$i)] != -1 &&
						[lsearch $lst $Para(_protocol$j)] != -1 &&
						[lsearch $lst $Para(_protocol$k)] != -1} {
						return 0
					}
				}
				set msg "Only the protocol - \"PCIE SRIO GIGE SGMII\" are legal for protocol grouping!"
				tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
				return -1
			}
			"4" {
				foreach lst $group_lst {
					set i [lindex $m_list 0]
					set j [lindex $m_list 1]
					set k [lindex $m_list 2]
					set l [lindex $m_list 3]
					if {$Para(_protocol$i) == $Para(_protocol$j) &&
						$Para(_protocol$i) == $Para(_protocol$k) &&
						$Para(_protocol$i) == $Para(_protocol$l)} {return 0}
					if {[lsearch $lst $Para(_protocol$i)] != -1 &&
						[lsearch $lst $Para(_protocol$j)] != -1 &&
						[lsearch $lst $Para(_protocol$k)] != -1 &&
						[lsearch $lst $Para(_protocol$l)] != -1} {
						return 0
					}
				}
				set msg "Only the protocol - \"PCIE SRIO GIGE SGMII\" are legal for protocol grouping!"
				tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
				return -1
			}
		}
	}
	
	if {$count == 1} {
		set i [lindex $m_list 0]
		switch $Para(_protocol$i) {
			"G8B10B" {
				set ret [IsInRange "Transmit Data Rate of $Para(_protocol$i)" 0.15 3.2 $Para(_datarange)]
				if {$ret == "-1"} {return -1}

				for {set i 0} {$i<4} {incr i} {
					set ret [IsInRange "Receive Data Rate of $Para(_protocol$i)" 0.15 3.2 $Para(_rx_datarange$i)]
					if {$ret == "-1"} {return -1}
				}
			}
			"10BSER" -
			"8BSER" {
				set ret [IsInRange "Transmit Data Rate of $Para(_protocol$i)" 0.15 3.2 $Para(_datarange)]
				if {$ret == "-1"} {return -1}

				for {set i 0} {$i<4} {incr i} {
					set ret [IsInRange "Receive Data Rate of $Para(_protocol$i)" 0.15 3.2 $Para(_rx_datarange$i)]
					if {$ret == "-1"} {return -1}
				}
			}
			"PCIE" { 
				set datarange 2.5
				set ret [checkSingleValue $i $datarange]
				if {$ret == "-1"} {return -1}
			}
			"SGMII" -
			"GIGE" { 
				#CR_51701
#				set datarange 1.25
#				set ret [checkSingleValue $i $datarange]
#				if {$ret == "-1"} {return -1}
				set lst {1.25 2.5 3.125}
				if {[lsearch $lst $Para(_datarange)] == -1} {
					set msg "The transmit data rate of protocol - $Para(_protocol$i) only supports 1.25 2.5 3.125 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
				if {[lsearch $lst $Para(_rx_datarange$i)] == -1} {
					set msg "The receive data rate of protocol - $Para(_protocol$i) only supports 1.25 2.5 3.125 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
			}
			"XAUI" { 
				set datarange 3.125
				set ret [checkSingleValue $i $datarange]
				if {$ret == "-1"} {return -1}
			}
			"CPRI" {
				set lst {0.6144 1.2288 2.4576 3.072}
				if {[lsearch $lst $Para(_datarange)] == -1} {
					set msg "The transmit data rate of protocol - $Para(_protocol$i) only supports 0.6144 1.2288 2.4576 3.072 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
				if {[lsearch $lst $Para(_rx_datarange$i)] == -1} {
					set msg "The receive data rate of protocol - $Para(_protocol$i) only supports 0.6144 1.2288 2.4576 3.072 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
			}
			"OBSAI" { 
				set lst {0.768 1.536 2.304 3.072}
				if {[lsearch $lst $Para(_datarange)] == -1} {
					set msg "The transmit data rate of protocol - $Para(_protocol$i) only supports 0.768 1.536 2.304 3.072 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
				if {[lsearch $lst $Para(_rx_datarange$i)] == -1} {
					set msg "The receive data rate of protocol - $Para(_protocol$i) only supports 0.768 1.536 2.304 3.072 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
			}
			"SRIO" {
				set lst {1.25 2.5 3.125}
				if {[lsearch $lst $Para(_datarange)] == -1} {
					set msg "The transmit data rate of protocol - $Para(_protocol$i) only supports 1.25 2.5 3.125 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
				if {[lsearch $lst $Para(_rx_datarange$i)] == -1} {
					set msg "The receive data rate of protocol - $Para(_protocol$i) only supports 1.25 2.5 3.125 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
			}
			"SATA" {
				set lst {1.5 3.0 3}
				if {[lsearch $lst $Para(_datarange)] == -1} {
					set msg "The transmit data rate of protocol - $Para(_protocol$i) only supports 1.5 3.0 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
				if {[lsearch $lst $Para(_rx_datarange$i)] == -1} {
					set msg "The receive data rate of protocol - $Para(_protocol$i) only supports 1.5 3.0 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
			}
			"DISP_PORT" {
				set lst {1.62 2.7}
				if {[lsearch $lst $Para(_datarange)] == -1} {
					set msg "The transmit data rate of protocol - $Para(_protocol$i) only supports 1.62 2.7 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
				if {[lsearch $lst $Para(_rx_datarange$i)] == -1} {
					set msg "The receive data rate of protocol - $Para(_protocol$i) only supports 1.62 2.7 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
			}
			"FC" {
				set lst {1.0625 2.125}
				if {[lsearch $lst $Para(_datarange)] == -1} {
					set msg "The transmit data rate of protocol - $Para(_protocol$i) only supports 1.0625 2.125 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
				if {[lsearch $lst $Para(_rx_datarange$i)] == -1} {
					set msg "The receive data rate of protocol - $Para(_protocol$i) only supports 1.0625 2.125 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
			}
			"SDI" {
				set lst {0.27 0.54 1.4835 1.485 2.967 2.97}
				if {[lsearch $lst $Para(_datarange)] == -1} {
					set msg "The transmit data rate of protocol - $Para(_protocol$i) only supports 0.27 0.54 1.4835 1.485 2.967 2.97 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
				if {[lsearch $lst $Para(_rx_datarange$i)] == -1} {
					set msg "The receive data rate of protocol - $Para(_protocol$i) only supports 0.27 0.54 1.4835 1.485 2.967 2.97 Gbps!"
					tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
					return -1
				}
			}
		}
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

	#51644 - to avoid outputting External when regenerate LPC file, which has External.
	set Para(_rx_los_port0) "Internal"
	set Para(_rx_los_port1) "Internal"
	set Para(_rx_los_port2) "Internal"
	set Para(_rx_los_port3) "Internal"
	
	set ret [CreatePpFile]
	if {$ret == -1} {return -1}

	set out_msg "\tModule Name: $Para(ModuleName)\n\tCore Name: $Para(CoreName)\n\tLPC file : $Para(ModuleName).lpc"
	if {[info exists Para(_tdrv_amp_msg)]} {
		if {[string length $Para(_tdrv_amp_msg)] > 0} {
			append out_msg "\nWarning: $Para(_tdrv_amp_msg)"
		}
	}
	append out_msg "\n\tParameter File : $Para(ModuleName).pp"
#	append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"

	set pin_flag orcapp

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
	AttributeSetting 640 560
	set pin_flag orcapp
	set Para(Fdir) "Fmaco"
	DrawImage 300 480 1.3
	set tnb $Para(tnb)

	SetGlobalConstant
	GetDevType
	
	#*** Quad Setup ***
	set page [$tnb add -label "Quad"]
	iwidgets::labeledframe .frmProtocol -labeltext "Channel Protocol" -labelpos nw
	set frmProtocol [.frmProtocol childsite]
	label .lblRxTx -text "RX and TX"
	label .lblRXonly -text "RX Only"
	label .lblTXonly -text "TX Only"
	label .lblDisable -text "Disable\nChannel"
	label .lblProtocol -text "Protocol"
	label .lblLowPorts -text "Low Speed\nData Ports"
	grid x .lblRxTx .lblRXonly .lblTXonly .lblDisable .lblProtocol .lblLowPorts -in $frmProtocol
	#set mode_lst {"PCI-Express" "Gigabit Ethernet" "Fibre Channel" XAUI "SRIO" SDI "Generic 8B10B" "10-bit SERDES Only" "8-bit SERDES Only" \
	#	OBSAI CPRI SATA "Display Port"}
	#Rev 3.3
	#1. FC, SATA and DISP_PORT are supported for internal use only and hence no GUI support for customer use.
	#set mode_lst {GIGE XAUI SRIO PCIE SDI G8B10B 10BSER 8BSER CPRI OBSAI FC SATA DISP_PORT}
	set mode_lst {GIGE XAUI SRIO PCIE SDI G8B10B 10BSER 8BSER CPRI OBSAI SGMII}
	iwidgets::combobox .cbo_protocol0 -width 12 -editable false -textvariable Para(_protocol0) -selectioncommand {InitDataRate 0;ProtocolCmd;ChangeValueCmd}
	iwidgets::combobox .cbo_protocol1 -width 12 -editable false -textvariable Para(_protocol1) -selectioncommand {InitDataRate 1;ProtocolCmd;ChangeValueCmd}
	iwidgets::combobox .cbo_protocol2 -width 12 -editable false -textvariable Para(_protocol2) -selectioncommand {InitDataRate 2;ProtocolCmd;ChangeValueCmd}
	iwidgets::combobox .cbo_protocol3 -width 12 -editable false -textvariable Para(_protocol3) -selectioncommand {InitDataRate 3;ProtocolCmd;ChangeValueCmd}
	for {set i 0} {$i<4} {incr i} {
		label .lbl_mode$i -text Channel$i
		radiobutton .rdo1_mode$i -value RXTX -variable Para(_mode$i) -command {ProtocolCmd;ChangeValueCmd}
		radiobutton .rdo2_mode$i -value RXONLY -variable Para(_mode$i) -command {ProtocolCmd;ChangeValueCmd}
		radiobutton .rdo3_mode$i -value TXONLY -variable Para(_mode$i) -command {ProtocolCmd;ChangeValueCmd}
		radiobutton .rdo4_mode$i -value DISABLED -variable Para(_mode$i) -command {ChangeValueCmd}
#		iwidgets::combobox .cbo_protocol$i -width 12 -editable false -textvariable Para(_protocol$i) -selectioncommand {[list InitDataRate $i];ChangeValueCmd}
		.cbo_protocol$i insert list end GIGE XAUI SRIO PCIE SDI G8B10B 10BSER 8BSER CPRI OBSAI SGMII
		checkbutton .ck_ldr$i -onvalue ENABLED -offvalue DISABLED -variable Para(_ldr$i) -command {ChangeValueCmd}
		grid .lbl_mode$i .rdo1_mode$i .rdo2_mode$i .rdo3_mode$i .rdo4_mode$i .cbo_protocol$i .ck_ldr$i -in $frmProtocol -pady 4
	}
	pack .frmProtocol -in $page -fill both -fill x

	
	#*** Reference Clocks Setup ***
	set page [$tnb add -label "Reference Clocks"]
	iwidgets::labeledframe .frmP2 -labeltext "Clocking Setup" -labelpos nw
	set frmP2 [.frmP2 childsite]

	iwidgets::labeledframe .frmP21 -labeltext "Transmit" -labelpos nw
	set frmP21 [.frmP21 childsite]

	#frame .frmData
	label .lbl_datarange -text "Max Data Rate"
	iwidgets::entryfield .entry_datarange -labeltext "Gbps" -labelpos e -width 8 -textvariable Para(_datarange) -validate real
	#pack .lbl_datarange .entry_datarange -in .frmData -side left
	.entry_datarange.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	#pack .frmData -in $frmP2 -fill x -padx 20 -pady 2

	label .lbl_pll_txsrc -text "Tx Refclk Source "
	iwidgets::combobox .cbo_pll_txsrc -width 12 -editable false -textvariable Para(_pll_txsrc) -selectioncommand {ChangeValueCmd}
	.cbo_pll_txsrc insert list end EXTERNAL INTERNAL
	label .lbl_refclk_mult -text "Tx/Rx Multiplier"
	iwidgets::combobox .cbo_refclk_mult -width 6 -editable false -textvariable Para(_refclk_mult) -selectioncommand {ChangeValueCmd}
	.cbo_refclk_mult insert list end 8X 10X 16X 20X 25X
	label .lbl_refclk_rate -text "Tx Reference Clock Rate"
	iwidgets::entryfield .entry_refclk_rate -labeltext "MHz" -labelpos e -width 8 -textvariable Para(_refclk_rate) -validate real
	grid .lbl_datarange .entry_datarange -in $frmP21 -sticky w 
	grid .lbl_pll_txsrc .cbo_pll_txsrc .lbl_refclk_mult .cbo_refclk_mult -in $frmP21 -sticky w -pady 4
	grid .lbl_refclk_rate .entry_refclk_rate -in $frmP21 -sticky w
	
	for {set i 0} {$i<4} {incr i} {
		label .lblP21Channel$i -text Ch$i
	}
	set lbl_lst {Protocol "Tx Rate" "FPGA Bus Width" "FPGA Interface Clock"}
	set lbl_name {P21Protocol _tx_data_rate _tx_data_width _tx_ficlk_rate}
	foreach x $lbl_lst n $lbl_name {
		label .lbl$n -text $x
	}
	for {set i 0} {$i<4} {incr i} {
		iwidgets::entryfield .entryP21Protocol$i -width 12 -textvariable Para(_tx_protocol$i) -state disabled
		iwidgets::combobox .cbo_tx_data_rate$i -width 8 -editable false -textvariable Para(_tx_data_rate$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_tx_data_width$i -width 8 -editable false -textvariable Para(_tx_data_width$i) -selectioncommand {ChangeValueCmd}
		iwidgets::entryfield .entry_tx_ficlk_rate$i -labeltext "MHz" -labelpos e -width 8 -textvariable Para(_tx_ficlk_rate$i) -state disabled -disabledforeground black

		.cbo_tx_data_rate$i insert list end FULL DIV2 DIV11
		.cbo_tx_data_width$i insert list end 8 10 16 20
	}
	grid x .lblP21Channel0 .lblP21Channel1 .lblP21Channel2 .lblP21Channel3 -in $frmP21 -sticky w
	grid .lblP21Protocol .entryP21Protocol0 .entryP21Protocol1 .entryP21Protocol2 .entryP21Protocol3 -in $frmP21 -sticky w
	grid .lbl_tx_data_rate .cbo_tx_data_rate0 .cbo_tx_data_rate1 .cbo_tx_data_rate2 .cbo_tx_data_rate3 -in $frmP21 -sticky w -pady 4
	grid .lbl_tx_data_width .cbo_tx_data_width0 .cbo_tx_data_width1 .cbo_tx_data_width2 .cbo_tx_data_width3 -in $frmP21 -sticky w
	grid .lbl_tx_ficlk_rate .entry_tx_ficlk_rate0 .entry_tx_ficlk_rate1 .entry_tx_ficlk_rate2 .entry_tx_ficlk_rate3 -in $frmP21 -sticky w
	
	pack .frmP21 -in $frmP2 -fill x

	iwidgets::labeledframe .frmP22 -labeltext "Receive" -labelpos nw
	set frmP22 [.frmP22 childsite]
	for {set i 0} {$i<4} {incr i} {
		label .lblP22Channel$i -text Ch$i
	}
	set lbl_lst {"Max Data Rate" Protocol "Reference Clock Source" "Multiplier" "Rx Rate" "Rx Reference Clock Rate" "FPGA Bus Width" "FPGA Interface Clock"}
	set lbl_name {_rx_datarange P22Protocol _pll_rxsrc Multiplier _rx_data_rate _rxrefclk_rate _rx_data_width _rx_ficlk_rate}
	foreach x $lbl_lst n $lbl_name {
		label .lbl$n -text $x
	}
	for {set i 0} {$i<4} {incr i} {
		iwidgets::entryfield .entry_rx_datarange$i -labeltext "Gbps" -labelpos e -width 8 -textvariable Para(_rx_datarange$i) -state disabled -disabledforeground black -validate real
		iwidgets::entryfield .entryP22Protocol$i -width 12 -textvariable Para(_rx_protocol$i) -state disabled
		iwidgets::combobox .cbo_pll_rxsrc$i -width 10 -editable false -textvariable Para(_pll_rxsrc$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cboMultiplier$i -width 8 -editable false -textvariable Para(_refclk_mult) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_rx_data_rate$i -width 8 -editable false -textvariable Para(_rx_data_rate$i) -selectioncommand {ChangeValueCmd}
#		iwidgets::combobox .cbo_rxrefclk_rate$i -width 8 -editable false -textvariable Para(_refclk_rate) -selectioncommand {}
		iwidgets::entryfield .entry_rxrefclk_rate$i -labeltext "MHz" -labelpos e -width 8 -textvariable Para(_rxrefclk_rate$i) -state disabled -disabledforeground black
		iwidgets::combobox .cbo_rx_data_width$i -width 8 -editable false -textvariable Para(_rx_data_width$i) -selectioncommand {ChangeValueCmd}
		iwidgets::entryfield .entry_rx_ficlk_rate$i -labeltext "MHz" -labelpos e -width 8 -textvariable Para(_rx_ficlk_rate$i) -state disabled -disabledforeground black

		.entry_rx_datarange${i}.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}

		.cbo_pll_rxsrc$i insert list end EXTERNAL INTERNAL
		.cbo_rx_data_rate$i insert list end FULL DIV2 DIV11
		.cbo_rx_data_width$i insert list end 8 10 16 20
	}
	grid x .lblP22Channel0 .lblP22Channel1 .lblP22Channel2 .lblP22Channel3 -in $frmP22 -sticky w
	grid .lbl_rx_datarange .entry_rx_datarange0 .entry_rx_datarange1 .entry_rx_datarange2 .entry_rx_datarange3 -in $frmP22 -sticky w -pady 4
	grid .lblP22Protocol .entryP22Protocol0 .entryP22Protocol1 .entryP22Protocol2 .entryP22Protocol3 -in $frmP22 -sticky w
	grid .lbl_pll_rxsrc .cbo_pll_rxsrc0 .cbo_pll_rxsrc1 .cbo_pll_rxsrc2 .cbo_pll_rxsrc3 -in $frmP22 -sticky w -pady 4
	grid .lblMultiplier .cboMultiplier0 .cboMultiplier1 .cboMultiplier2 .cboMultiplier3 -in $frmP22 -sticky w
	grid .lbl_rx_data_rate .cbo_rx_data_rate0 .cbo_rx_data_rate1 .cbo_rx_data_rate2 .cbo_rx_data_rate3 -in $frmP22 -sticky w -pady 4
	grid .lbl_rxrefclk_rate .entry_rxrefclk_rate0 .entry_rxrefclk_rate1 .entry_rxrefclk_rate2 .entry_rxrefclk_rate3 -in $frmP22 -sticky w
	grid .lbl_rx_data_width .cbo_rx_data_width0 .cbo_rx_data_width1 .cbo_rx_data_width2 .cbo_rx_data_width3 -in $frmP22 -sticky w -pady 4
	#grid .lbl_rx_fifo .cbo_rx_fifo0 .cbo_rx_fifo1 .cbo_rx_fifo2 .cbo_rx_fifo3 -in $frmP22 -sticky w
	grid .lbl_rx_ficlk_rate .entry_rx_ficlk_rate0 .entry_rx_ficlk_rate1 .entry_rx_ficlk_rate2 .entry_rx_ficlk_rate3 -in $frmP22 -sticky w -pady 4
	
	pack .frmP22 -in $frmP2 -fill x

	pack .frmP2 -in $page -fill both -expand 1

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

	set lbl_lst {"Differential Output Voltage" "PreEmphasis" "TX I/O Termination (Ohms)"}
	set lbl_name {_tdrv_amp _tx_pre _rterm_tx}
	foreach x $lbl_lst n $lbl_name {
		label .lbl$n -text $x
	}
	for {set i 0} {$i<4} {incr i} {
		iwidgets::combobox .cbo_tdrv_amp$i -width 8 -editable false -textvariable Para(_tdrv_ch$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_tx_pre$i -width 10 -editable false -textvariable Para(_tx_pre$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_rterm_tx$i -width 8 -editable false -textvariable Para(_rterm_tx$i) -selectioncommand {ChangeValueCmd}

		.cbo_tdrv_amp$i insert list end -4 -3 -2 -1 0 1 2 3 4
		.cbo_tx_pre$i insert list end DISABLED 0 1 2 3 4 5 6 7
		.cbo_rterm_tx$i insert list end 5K 50 75
	}
	grid .lbl_tdrv_amp .cbo_tdrv_amp0 .cbo_tdrv_amp1 .cbo_tdrv_amp2 .cbo_tdrv_amp3 -in $frmP31 -padx 2 -sticky w -pady 4
	grid .lbl_tx_pre .cbo_tx_pre0 .cbo_tx_pre1 .cbo_tx_pre2 .cbo_tx_pre3 -in $frmP31 -padx 2 -sticky w -pady 4
	grid .lbl_rterm_tx .cbo_rterm_tx0 .cbo_rterm_tx1 .cbo_rterm_tx2 .cbo_rterm_tx3 -in $frmP31 -padx 2 -sticky w -pady 4

	pack .frmP31 -in $page -fill x
	
		#*** Receive Settings ***#
	iwidgets::labeledframe .frmP32 -labeltext "Receive Settings" -labelpos nw
	set frmP32 [.frmP32 childsite]
	label .lblRxCh0 -text Ch0
	label .lblRxCh1 -text Ch1
	label .lblRxCh2 -text Ch2
	label .lblRxCh3 -text Ch3
	grid x .lblRxCh0 .lblRxCh1 .lblRxCh2 .lblRxCh3 -in $frmP32 -sticky w

	set lbl_lst {"Equalization Setting" "RX I/O Termination (Ohms)" "RX I/O Coupling" "Loss of Signal Threshold Mode" "Loss of Signal Threshold Setting"}
	set lbl_name {_rx_eq _rterm_rx _rx_dcc _los_threshold_mode _los_threshold}
	foreach x $lbl_lst n $lbl_name {
		label .lbl$n -text $x
	}
	for {set i 0} {$i<4} {incr i} {
#		if {$Para(_los_threshold_mode$i) == "LOS_E"} {
			set Para(_los_threshold$i) $Para(_los_threshold_lo$i)
#		} else {
#			set Para(_los_threshold$i) $Para(_los_threshold_hi$i)
#		}
		iwidgets::combobox .cbo_rx_eq$i -width 10 -editable false -textvariable Para(_rx_eq$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_rterm_rx$i -width 8 -editable false -textvariable Para(_rterm_rx$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_rx_dcc$i -width 8 -editable false -textvariable Para(_rx_dcc$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_los_threshold_mode$i -width 8 -editable false -textvariable Para(_los_threshold_mode$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_los_threshold$i -width 8 -editable false -textvariable Para(_los_threshold_lo$i) -selectioncommand {ChangeValueCmd}

		.cbo_rx_eq$i insert list end DISABLED MID_LOW MID_MED MID_HIGH LONG_LOW LONG_MED LONG_HIGH
		.cbo_rterm_rx$i insert list end HIGH 50 75 60
		.cbo_rx_dcc$i insert list end AC DC
		.cbo_los_threshold$i insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		.cbo_los_threshold_mode$i config -state disabled
	}
	grid .lbl_rx_eq .cbo_rx_eq0 .cbo_rx_eq1 .cbo_rx_eq2 .cbo_rx_eq3 -in $frmP32 -padx 2 -sticky w -pady 4
	grid .lbl_rterm_rx .cbo_rterm_rx0 .cbo_rterm_rx1 .cbo_rterm_rx2 .cbo_rterm_rx3 -in $frmP32 -padx 2 -sticky w -pady 4
	grid .lbl_rx_dcc .cbo_rx_dcc0 .cbo_rx_dcc1 .cbo_rx_dcc2 .cbo_rx_dcc3 -in $frmP32 -padx 2 -sticky w -pady 4
	#CR_48505
	#grid .lbl_los_threshold_mode .cbo_los_threshold_mode0 .cbo_los_threshold_mode1 .cbo_los_threshold_mode2 .cbo_los_threshold_mode3 -in $frmP32 -padx 2 -sticky w -pady 4
	grid .lbl_los_threshold .cbo_los_threshold0 .cbo_los_threshold1 .cbo_los_threshold2 .cbo_los_threshold3 -in $frmP32 -padx 2 -sticky w -pady 4
	
	pack .frmP32 -in $page -fill x
	
		#*** Clock and PLL Settings ***#
	iwidgets::labeledframe .frmP33 -labeltext "Clock and PLL Settings" -labelpos nw
	set frmP33 [.frmP33 childsite]
	CreateLabelCombobox $frmP33 _pll_term "Reference Clock IO Termination(Ohms)" 20 8 Para(_pll_term) {2K 50} {ChangeValueCmd}
	.lbl_pll_term config -width 40 -anchor w
	CreateLabelCombobox $frmP33 _pll_dcc "Reference Clock IO Coupling" 20 8 Para(_pll_dcc) {AC DC} {DrawPins}
	.lbl_pll_dcc config -width 40 -anchor w
	CreateLabelCombobox $frmP33 _pll_lol_set "TX PLL Loss of Lock" 20 8 Para(_pll_lol_set) {0 1 2 3} {ChangeValueCmd}
	.lbl_pll_lol_set config -width 40 -anchor w

	#.cbo_pll_term insert list end 2K 50
	#.cbo_pll_dcc insert list end AC DC
	#.cbo_pll_lol_set insert list end 0 1 2 3
	
	pack .frmP33 -in $page -fill x
	
		#*** PCS Advanced Setup1 ***
	set page [$tnb add -label "PCS Advanced1"]
		#*** Transmit Settings ***#
	iwidgets::labeledframe .frmP41 -labeltext "Transmit Settings" -labelpos nw
	set frmP41 [.frmP41 childsite]
	label .lblP41TxCh0 -text Ch0
	label .lblP41TxCh1 -text Ch1
	label .lblP41TxCh2 -text Ch2
	label .lblP41TxCh3 -text Ch3
	grid x .lblP41TxCh0 .lblP41TxCh1 .lblP41TxCh2 .lblP41TxCh3 -in $frmP41 -sticky w

	set lbl_lst {"Invert the Transmit Signal" "Enable 8B10B Encoder" "FPGA FIFO Bridge"}
	set lbl_name {_tx_sb _tx_8b10b _tx_fifo}
	foreach x $lbl_lst n $lbl_name {
		label .lbl$n -text $x
	}
	for {set i 0} {$i<4} {incr i} {
		iwidgets::combobox .cbo_tx_sb$i -width 10 -editable false -textvariable Para(_tx_sb$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_tx_8b10b$i -width 10 -editable false -textvariable Para(_tx_8b10b$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_tx_fifo$i -width 10 -editable false -textvariable Para(_tx_fifo$i) -selectioncommand {ChangeValueCmd}

		.cbo_tx_sb$i insert list end ENABLED DISABLED
		.cbo_tx_8b10b$i insert list end ENABLED DISABLED
		.cbo_tx_fifo$i insert list end ENABLED DISABLED
	}
	grid .lbl_tx_sb .cbo_tx_sb0 .cbo_tx_sb1 .cbo_tx_sb2 .cbo_tx_sb3 -in $frmP41 -padx 2 -sticky w -pady 4
	grid .lbl_tx_8b10b .cbo_tx_8b10b0 .cbo_tx_8b10b1 .cbo_tx_8b10b2 .cbo_tx_8b10b3 -in $frmP41 -padx 2 -sticky w -pady 4
	grid .lbl_tx_fifo .cbo_tx_fifo0 .cbo_tx_fifo1 .cbo_tx_fifo2 .cbo_tx_fifo3 -in $frmP41 -padx 2 -sticky w -pady 4

	pack .frmP41 -in $page -fill x

		#*** Receive Settings ***#
	iwidgets::labeledframe .frmP42 -labeltext "Receive Settings" -labelpos nw
	set frmP42 [.frmP42 childsite]
	label .lblP42RxCh0 -text Ch0
	label .lblP42RxCh1 -text Ch1
	label .lblP42RxCh2 -text Ch2
	label .lblP42RxCh3 -text Ch3
	grid x .lblP42RxCh0 .lblP42RxCh1 .lblP42RxCh2 .lblP42RxCh3 -in $frmP42 -sticky w

	set lbl_lst {"Invert the Receive Signal" "Dynamically Invert Port" "Enable 8B10B Decoder" "FPGA FIFO Bridge"}
	set lbl_name {_rx_sb _ird _rx_8b10b _rx_fifo}
	foreach x $lbl_lst n $lbl_name {
		label .lbl$n -text $x
	}
	for {set i 0} {$i<4} {incr i} {
		iwidgets::combobox .cbo_rx_sb$i -width 10 -editable false -textvariable Para(_rx_sb$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_ird$i -width 10 -editable false -textvariable Para(_ird$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_rx_8b10b$i -width 10 -editable false -textvariable Para(_rx_8b10b$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_rx_fifo$i -width 10 -editable false -textvariable Para(_rx_fifo$i) -selectioncommand {ChangeValueCmd}

		.cbo_rx_sb$i insert list end ENABLED DISABLED
		.cbo_ird$i insert list end ENABLED DISABLED
		.cbo_rx_8b10b$i insert list end ENABLED DISABLED
		.cbo_rx_fifo$i insert list end ENABLED DISABLED
	}
	grid .lbl_rx_sb .cbo_rx_sb0 .cbo_rx_sb1 .cbo_rx_sb2 .cbo_rx_sb3 -in $frmP42 -padx 2 -sticky w -pady 4
	grid .lbl_ird .cbo_ird0 .cbo_ird1 .cbo_ird2 .cbo_ird3 -in $frmP42 -padx 2 -sticky w -pady 4
	grid .lbl_rx_8b10b .cbo_rx_8b10b0 .cbo_rx_8b10b1 .cbo_rx_8b10b2 .cbo_rx_8b10b3 -in $frmP42 -padx 2 -sticky w -pady 4
	grid .lbl_rx_fifo .cbo_rx_fifo0 .cbo_rx_fifo1 .cbo_rx_fifo2 .cbo_rx_fifo3 -in $frmP42 -padx 2 -sticky w -pady 4
	
		#*** Word Alignment ***#
	iwidgets::labeledframe .frmP43 -labeltext "Word Alignment" -labelpos nw
	set frmP43 [.frmP43 childsite]
	label .lblWaCh0 -text Ch0
	label .lblWaCh1 -text Ch1
	label .lblWaCh2 -text Ch2
	label .lblWaCh3 -text Ch3
	grid x .lblWaCh0 .lblWaCh1 .lblWaCh2 .lblWaCh3 -in $frmP43 -sticky w

	set lbl_lst {"Word Alignment Block" "Internal Link State Machine" "Specific Comma" "Plus Comma Value" "Minus Comma Value" "Comma Mask"}
	set lbl_name {_rxwa _ilsm _scomma _comma_a _comma_b _comma_m}
	foreach x $lbl_lst n $lbl_name {
		label .lbl$n -text $x
	}
	for {set i 0} {$i<4} {incr i} {
		iwidgets::combobox .cbo_rxwa$i -width 10 -editable false -textvariable Para(_rxwa$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_ilsm$i -width 10 -editable false -textvariable Para(_ilsm$i) -selectioncommand {ChangeValueCmd}
		iwidgets::combobox .cbo_scomma$i -width 10 -editable false -textvariable Para(_scomma$i) -selectioncommand {ChangeValueCmd}

		iwidgets::entryfield .entry_comma_a$i -width 12 -textvariable Para(_comma_a$i) -state disabled -fixed 10 -validate {bin %c}
		iwidgets::entryfield .entry_comma_b$i -width 12 -textvariable Para(_comma_b$i) -state disabled -fixed 10 -validate {bin %c}
		iwidgets::entryfield .entry_comma_m$i -width 12 -textvariable Para(_comma_m$i) -state disabled -fixed 10 -validate {bin %c}

		.cbo_rxwa$i insert list end ENABLED DISABLED
		.cbo_ilsm$i insert list end ENABLED DISABLED
		.cbo_scomma$i insert list end K28P5 K28P157 "User Defined"
		set Para(_scomma$i) K28P157
	}
	
	grid .lbl_rxwa .cbo_rxwa0 .cbo_rxwa1 .cbo_rxwa2 .cbo_rxwa3 -in $frmP43 -padx 2 -sticky w -pady 4
	grid .lbl_ilsm .cbo_ilsm0 .cbo_ilsm1 .cbo_ilsm2 .cbo_ilsm3 -in $frmP43 -padx 2 -sticky w -pady 4
	grid .lbl_scomma .cbo_scomma0 .cbo_scomma1 .cbo_scomma2 .cbo_scomma3 -in $frmP43 -padx 2 -sticky w -pady 4
	grid .lbl_comma_a .entry_comma_a0 .entry_comma_a1 .entry_comma_a2 .entry_comma_a3 -in $frmP43 -padx 2 -sticky w -pady 4
	grid .lbl_comma_b .entry_comma_b0 .entry_comma_b1 .entry_comma_b2 .entry_comma_b3 -in $frmP43 -padx 2 -sticky w -pady 4
	grid .lbl_comma_m .entry_comma_m0 .entry_comma_m1 .entry_comma_m2 .entry_comma_m3 -in $frmP43 -padx 2 -sticky w -pady 4

	grid .frmP43 -in $frmP42 -columnspan 5 -pady 4
	pack .frmP42 -in $page -fill x

	#*** PCS Advanced Setup2 ***
	set page [$tnb add -label "PCS Advanced2"]
		#*** Receive Settings ***#
	iwidgets::labeledframe .frmP5 -labeltext "Receive Settings" -labelpos nw
	set frmP5 [.frmP5 childsite]

	iwidgets::labeledframe .frmP51 -labeltext "CTC" -labelpos nw
	set frmP51 [.frmP51 childsite]
	label .lblP51Ch0 -text Ch0
	label .lblP51Ch1 -text Ch1
	label .lblP51Ch2 -text Ch2
	label .lblP51Ch3 -text Ch3
	grid .lblP51Ch0 -row 0 -column 1 -columnspan 2 -in $frmP51
	grid .lblP51Ch1 -row 0 -column 3 -columnspan 2 -in $frmP51
	grid .lblP51Ch2 -row 0 -column 5 -columnspan 2 -in $frmP51
	grid .lblP51Ch3 -row 0 -column 7 -columnspan 2 -in $frmP51
	
	set lbl_lst {"CTC block" "Size of the ordered set to\nmatch (Bytes)" "ByteN(Hex)" "ByteN+1(Hex)" "ByteN+2(Hex)" "ByteN+3(Hex)" \
		"Inter packet gap to enforce"}
	set lbl_name {_ctc _cc_match_mode _byten0 _byten1 _byten2 _byten3 _cc_min_ipg}
	foreach x $lbl_lst n $lbl_name {
		label .lbl$n -text $x
	}
	iwidgets::combobox .cbo_cc_match_mode0 -width 8 -editable false -textvariable Para(_cc_match_mode0) -selectioncommand {ChangeMatchCmd 0;ChangeValueCmd}
	iwidgets::combobox .cbo_cc_match_mode1 -width 8 -editable false -textvariable Para(_cc_match_mode1) -selectioncommand {ChangeMatchCmd 1;ChangeValueCmd}
	iwidgets::combobox .cbo_cc_match_mode2 -width 8 -editable false -textvariable Para(_cc_match_mode2) -selectioncommand {ChangeMatchCmd 2;ChangeValueCmd}
	iwidgets::combobox .cbo_cc_match_mode3 -width 8 -editable false -textvariable Para(_cc_match_mode3) -selectioncommand {ChangeMatchCmd 3;ChangeValueCmd}
	for {set i 0} {$i<4} {incr i} {
		iwidgets::combobox .cbo_ctc$i -width 10 -editable false -textvariable Para(_ctc$i) -selectioncommand {ChangeValueCmd}
		#iwidgets::combobox .cbo_cc_match_mode$i -width 8 -editable false -textvariable Para(_cc_match_mode$i) -selectioncommand {ChangeMatchCmd;ChangeValueCmd}
		checkbutton .ckk0$i -text K -variable Para(_k0$i) -onvalue 01 -offvalue 00
		iwidgets::entryfield .entry_byten0$i -labeltext 0x -width 8 -textvariable Para(_byten0$i) -state disabled -fixed 8 -validate {bin %c}
		checkbutton .ckk1$i -text K -variable Para(_k1$i) -onvalue 01 -offvalue 00
		iwidgets::entryfield .entry_byten1$i -labeltext 0x -width 8 -textvariable Para(_byten1$i) -state disabled -fixed 8 -validate {bin %c}
		checkbutton .ckk2$i -text K -variable Para(_k2$i) -onvalue 01 -offvalue 00
		iwidgets::entryfield .entry_byten2$i -labeltext 0x -width 8 -textvariable Para(_byten2$i) -state disabled -fixed 8 -validate {bin %c}
		checkbutton .ckk3$i -text K -variable Para(_k3$i) -onvalue 01 -offvalue 00
		iwidgets::entryfield .entry_byten3$i -labeltext 0x -width 8 -textvariable Para(_byten3$i) -state disabled -fixed 8 -validate {bin %c}
		iwidgets::combobox .cbo_cc_min_ipg$i -width 8 -editable false -textvariable Para(_cc_min_ipg$i) -selectioncommand {ChangeValueCmd}

		.cbo_ctc$i insert list end ENABLED DISABLED
		.cbo_cc_match_mode$i insert list end 1 2 4
		.cbo_cc_min_ipg$i insert list end 0 1 2 3
	}
	grid .lbl_ctc -row 1 -column 0 -in $frmP51 -sticky w
	grid .cbo_ctc0 -row 1 -column 1 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_ctc1 -row 1 -column 3 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_ctc2 -row 1 -column 5 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_ctc3 -row 1 -column 7 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4
	
	grid .lbl_cc_match_mode -row 2 -column 0 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_cc_match_mode0 -row 2 -column 1 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_cc_match_mode1 -row 2 -column 3 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_cc_match_mode2 -row 2 -column 5 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_cc_match_mode3 -row 2 -column 7 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4

	grid .lbl_byten0 .ckk00 .entry_byten00 .ckk01 .entry_byten01 .ckk02 .entry_byten02 .ckk03 .entry_byten03 -in $frmP51 -sticky w
	grid .lbl_byten1 .ckk10 .entry_byten10 .ckk11 .entry_byten11 .ckk12 .entry_byten12 .ckk13 .entry_byten13 -in $frmP51 -sticky w
	grid .lbl_byten2 .ckk20 .entry_byten20 .ckk21 .entry_byten21 .ckk22 .entry_byten22 .ckk23 .entry_byten23 -in $frmP51 -sticky w
	grid .lbl_byten3 .ckk30 .entry_byten30 .ckk31 .entry_byten31 .ckk32 .entry_byten32 .ckk33 .entry_byten33 -in $frmP51 -sticky w
	
	grid .lbl_cc_min_ipg -row 7 -column 0 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_cc_min_ipg0 -row 7 -column 1 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_cc_min_ipg1 -row 7 -column 3 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_cc_min_ipg2 -row 7 -column 5 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_cc_min_ipg3 -row 7 -column 7 -columnspan 2 -in $frmP51 -padx 2 -sticky w -pady 4

	label .lblAmout -text "Amount of Offset Before Insertion or Deletion"
	iwidgets::combobox .cbo_cchmark -labeltext "Deletion Threshold" -width 8 -editable false -textvariable Para(_cchmark) -selectioncommand {ChangeValueCmd}
	iwidgets::combobox .cbo_cclmark -labeltext "Insertion Threshold" -width 8 -editable false -textvariable Para(_cclmark) -selectioncommand {ChangeValueCmd}

	.cbo_cchmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	.cbo_cclmark insert list end 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	
	grid .lblAmout -row 8 -column 0 -columnspan 9 -in $frmP51 -padx 2 -sticky w -pady 4
	grid .cbo_cchmark -row 9 -column 0 -columnspan 9 -in $frmP51 -padx 20 -sticky w -pady 4
	grid .cbo_cclmark -row 10 -column 0 -columnspan 9 -in $frmP51 -padx 20 -sticky w -pady 4

	label .lblDsp -text "Deletion/Insertion Thresholds: The point at which clock tolerance compensation block inserts or deletes\nan ordered set is controllable." -justify	left
	grid .lblDsp -row 11 -column 0 -columnspan 9 -in $frmP51 -padx 2 -sticky w -pady 8

	pack .frmP51 -in $frmP5 -fill x
	pack .frmP5 -in $page -fill both -expand 1
	
	#*** Optional Port Setup ***
	set page [$tnb add -label "Control Setup"]
	iwidgets::labeledframe .frmP6 -labeltext "" -labelpos nw
	set frmP6 [.frmP6 childsite]

	iwidgets::labeledframe .frmP61 -labeltext "Loopback Selection" -labelpos nw
	set frmP61 [.frmP61 childsite]
	#label .lblP61TxCh0 -text Ch0
	#label .lblP61TxCh1 -text Ch1
	#label .lblP61TxCh2 -text Ch2
	#label .lblP61TxCh3 -text Ch3
	#grid x .lblP61TxCh0 .lblP61TxCh1 .lblP61TxCh2 .lblP61TxCh3 -in $frmP61 -sticky w
	#label .lblP61Mode -text "Loopback Mode"
	for {set i 0} {$i<4} {incr i} {
		label .lblP61TxCh$i -text "Loopback Mode Ch$i"
		iwidgets::combobox .cbo_lbtype$i -width 35 -editable false -textvariable Para(_lbtype$i) -selectioncommand {ChangeValueCmd}
#		.cbo_lbtype$i insert list end DISABLED "Loopback serial data after equalizer" "Loopback serial data after transmit driver" \
#					"Loopback parallel data after de-serializer" "Loopback parallel data after PCS block"
		.cbo_lbtype$i insert list end DISABLED "Loopback serial data after equalizer" "Loopback serial data after transmit driver" \
					"Loopback parallel data after de-serializer"
		grid .lblP61TxCh$i .cbo_lbtype$i -in $frmP61 -sticky w -padx 8 -pady 2
	}
	#grid .lblP61Mode .cbo_lbtype0 .cbo_lbtype1 .cbo_lbtype2 .cbo_lbtype3 -in $frmP61 -sticky w
	
	iwidgets::labeledframe .frmP62 -labeltext "Control Ports" -labelpos nw
	set frmP62 [.frmP62 childsite]
	label .lbl_teidle -text "Transmitter Electrical Idle"
	for {set i 0} {$i<4} {incr i} {
		#label .lblP62Ch$i -text Ch$i
		checkbutton .ckP62Ch$i -text Ch$i -variable Para(_teidle_ch$i) -onvalue ENABLED -offvalue DISABLED -command {ChangeValueCmd}
	}
	#grid x .lblP62Ch0 .lblP62Ch1 .lblP62Ch2 .lblP62Ch3 -in $frmP62 -sticky w -padx 20
	grid .lbl_teidle .ckP62Ch0 .ckP62Ch1 .ckP62Ch2 .ckP62Ch3 -in $frmP62 -sticky w -ipadx 10

	iwidgets::labeledframe .frmP63 -labeltext "Reset Sequence Generation" -labelpos nw
	set frmP63 [.frmP63 childsite]
	checkbutton .ck_rst_gen -text "Include Reset Sequence Generation" -onvalue ENABLED -offvalue DISABLED -variable Para(_rst_gen) -command {ChangeValueCmd}
	label .lbl_rx_los_port -text "Receive LOL Port"
	for {set i 0} {$i<4} {incr i} {
		label .lblP63Ch$i -text Ch$i
		iwidgets::combobox .cbo_rx_los_port$i -width 9 -editable false -textvariable Para(_rx_los_port$i) -selectioncommand {ChangeValueCmd}
		
		.cbo_rx_los_port$i insert list end Internal External
	}
	pack .ck_rst_gen -in $frmP63 -anchor w -padx 12
#51644 - to avoid outputting External when regenerate LPC file, which has External.
#	grid .ck_rst_gen -in $frmP63 -columnspan 2 -sticky w -padx 8
#	grid x .lblP63Ch0 .lblP63Ch1 .lblP63Ch2 .lblP63Ch3 -in $frmP63 -sticky w -padx 8 -pady 2
#	grid .lbl_rx_los_port .cbo_rx_los_port0 .cbo_rx_los_port1 .cbo_rx_los_port2 .cbo_rx_los_port3 -in $frmP63 -sticky w -padx 8
	
	#set Para(_rst_gen) DISABLED
	#.ck_rst_gen config -state disabled
	
	checkbutton .ck_sci_ports -text "Provide SerDes Client Interface (SCI) to dynamically control PCS/SerDes options at runtime" \
		-onvalue ENABLED -offvalue DISABLED -variable Para(_sci_ports) -command {ChangeSciPortsCmd;ChangeValueCmd}
	checkbutton .ck_sci_int_port -text "Provide the SerDes Client Interface (SCI) Interrupt Port" \
		-onvalue ENABLED -offvalue DISABLED -variable Para(_sci_int_port) -command {ChangeValueCmd}
	checkbutton .ck_refck2core -text "Reference Clock to FPGA Core" -onvalue ENABLED -offvalue DISABLED -variable Para(_refck2core) -command {ChangeValueCmd}
	#set Para(_lbtype) $ENABLED_EQ2T

	pack .frmP61 .frmP62 .frmP63 -in $frmP6 -anchor w -padx 10 -pady 4 -fill x
	#pack .ck_loopback -in $frmP6 -anchor w -padx 10 -pady 4
	#pack .rdo0_lbtype .rdo1_lbtype .rdo2_lbtype .rdo3_lbtype -in $frmP6 -anchor w -padx 30 -pady 4
	pack .ck_sci_ports -in $frmP6 -anchor w -padx 10 -pady 4
	pack .ck_sci_int_port -in $frmP6 -anchor w -padx 30 -pady 4
	pack .ck_refck2core -in $frmP6 -anchor w -padx 10 -pady 4
	
	pack .frmP6 -in $page -fill both -expand 1

	#*** Generation Options ***
	set page [$tnb add -label "Generation Options"]
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

	set Para(tw_flag) "false"
	InitDataRate 0
	InitDataRate 1
	InitDataRate 2
	InitDataRate 3
	ChangeValueCmd
	catch LoadParaCB
	Config150TW
	#FunctionButton
	#CenterPosition
	ChangeSettingsCmd
	#Diamond 1.2: ECN33, CR51682
	if {$Para(new) == 0} {
		#CR_58045 - restore LPC info.
		LoadParameter $Para(CoreName) $Para(ParaFile)
		
		for {set i 0} {$i<4} {incr i} {
			if {$Para(_protocol$i) == "SRIO"} {
				set Para(_ctc$i) DISABLED
			}
		}
		ChangeValueCmd
	}
}
