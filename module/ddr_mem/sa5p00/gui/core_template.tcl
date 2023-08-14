#$Header: L:/module/ddr_mem/sa5p00/gui/core_template.tcl 1.6 mghuang Exp $

#Rev 1.6: Diamond 3.4 IPExpress: Fixed SOF-122950
#Rev 1.5: Diamond 3.4 IPExpress: Fixed SOF-122837
#Rev 1.4: Diamond 3.4 IPExpress: Fixed SOF-122654
#Rev 1.3: Diamond 3.3 IPExpress: Fixed SOF-121651
#Rev 1.2: Diamond 3.3 IPExpress: SCR_1087
#Rev 1.1: Diamond 3.3 IPExpress: SCR_1080, SOF-121167
#Rev 1.15: Diamond 3.2 IPExpress: regenerate support, no GUI
#Rev 1.14: Diamond 3.1 IPExpress: Fixed SOF-118653
#Rev 1.13: Diamond 3.1 IPExpress: Fixed SOF-119080
#Rev 1.12: Diamond 3.1 IPExpress: SCR_1065,SOF-118183
#Rev 1.11: Diamond 3.1 IPExpress: Fixed SOF-117820,117833,118193
#Rev 1.10: Diamond 3.0 IPExpress: SCR_1059
#Rev 1.9: Diamond 3.0 IPExpress: Fixed SOF-117248
#Rev 1.7/1.8: Diamond 3.0 IPExpress: SCR_1048
#Rev 1.6: Diamond 3.0 IPExpress: SCR1030 5/6/2013
#Rev 1.5: Diamond 2.2 IPExpress: SCR1030 4/25/2013
#Rev 1.4: Diamond 2.2 IPExpress: Fixed CR_59864
#Rev 1.3: Diamond 2.2 IPExpress: Fixed cr_59136
#Rev 1.2: Diamond 2.2 IPExpress: Fixed cr_59569
#Rev 1.1: Diamond 2.2 IPExpress: Fixed cr_59132, DQS Delay updated, UM rev 1.0
#Rev 1.0: initial version.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc GetDevType {} {
	global Para

	set dqs_lst [split $Para(SDQS) "_"]
	set L_SDQS [lindex [split [lindex $dqs_lst 0] "-"] 1]
	set R_SDQS [lindex [split [lindex $dqs_lst 1] "-"] 1]
	#set T_SDQS [lindex [split [lindex $dqs_lst 2] "-"] 1]
	set T_SDQS 0
	#tk_messageBox -default ok -icon info -message "$L_SDQS=$R_SDQS=$T_SDQS" -title GetDevType -type ok
	set l_t_sdqs [expr $L_SDQS+$T_SDQS]
	set r_t_sdqs [expr $R_SDQS+$T_SDQS]
	if {$l_t_sdqs >= $r_t_sdqs} {
		set Para(dqs_no) $l_t_sdqs
	} else {
		set Para(dqs_no) $r_t_sdqs
	}

	set Para(package285_flag) false
	if {[string first "285" $Para(Package)] != -1} {
		set Para(package285_flag) true
	}
}

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(Frequency)] > 0 &&
		[string length $Para(Width)] > 0  &&
		$Para(Number) <= [expr $Para(dqs_no)*2]}  {
		DrawPins
	}
}

proc ChangeFreqDefault {} {
	global Para
	switch $Para(Frequency) {
		125 -
		200 {set Para(Gear) 2:1}
		300 -
		400 {set Para(Gear) 4:1}
		533 {set Para(Gear) 8:1}
	}
}

proc ChangeModeDefault {} {
	global Para
	if {$Para(Mode) == "DDR2"} {
		set Para(IO_buffer) SSTL18_I
		set Para(Frequency) 267
		if {$Para(cac) == "ENABLED"} {
			set Para(num_clk) 1
			set Para(num_ce) 1
			set Para(addr_width) 13
			set Para(bank_width) 2
			set Para(num_odt) 1
			set Para(num_cs) 1
		}
	}
	if {$Para(Mode) == "DDR3"} {
		set Para(IO_buffer) SSTL15_I
		set Para(Frequency) 400
#		set Para(wlr) 1T
		if {$Para(cac) == "ENABLED"} {
			set Para(num_clk) 1
			set Para(num_ce) 1
			set Para(addr_width) 14
			set Para(bank_width) 3
			set Para(num_odt) 1
			set Para(num_cs) 1
		}
	}
	if {$Para(Mode) == "DDR3L"} {
		set Para(IO_buffer) SSTL135_I
		set Para(Frequency) 400
#		set Para(wlr) 1T
		if {$Para(cac) == "ENABLED"} {
			set Para(num_clk) 1
			set Para(num_ce) 1
			set Para(addr_width) 14
			set Para(bank_width) 3
			set Para(num_odt) 1
			set Para(num_cs) 1
		}
	}
	if {$Para(Mode) == "LPDDR"} {
		set Para(IO_buffer) LVCMOS18
		set Para(Frequency) 150
		if {$Para(cac) == "ENABLED"} {
			set Para(num_clk) 1
			set Para(num_ce) 1
			set Para(addr_width) 13
			set Para(bank_width) 2
			set Para(num_odt) ""
			set Para(num_cs) 1
		}
	}
	if {$Para(Mode) == "LPDDR2"} {
		set Para(IO_buffer) HSUL12
		set Para(Frequency) 150
		if {$Para(cac) == "ENABLED"} {
			set Para(num_clk) 1
			set Para(num_ce) 1
			set Para(addr_width) 13
			set Para(bank_width) 2
			set Para(num_odt) ""
			set Para(num_cs) 1
		}
	}
	if {$Para(Mode) == "LPDDR3"} {
		set Para(IO_buffer) HSUL12
		set Para(Frequency) 150
		if {$Para(cac) == "ENABLED"} {
			set Para(num_clk) 1
			set Para(num_ce) 1
			set Para(addr_width) 13
			set Para(bank_width) 2
			set Para(num_odt) ""
			set Para(num_cs) 1
		}
	}
}

proc ChangeValueCmd {} {
	global Para

	.cboMode clear list
	.cboMode insert list end DDR2 DDR3 DDR3L LPDDR2 LPDDR3

	.cboFrequency clear list
	.cboIO_buffer clear list
	.cboGear config -state disabled
	.cboGear      clear list
	.lblDQSBuffer config -state disabled
	.cboDQSBuffer config -state disabled
#	.lblRDLY_Adj   config -state disabled
#	.cboRDLY_Adj   config -state disabled
#	.lblRDLY_Val   config -state disabled
#	.cboRDLY_Val   config -state disabled
#	.lblWDLY_Adj   config -state disabled
#	.cboWDLY_Adj   config -state disabled
#	.lblWDLY_Val   config -state disabled
#	.cboWDLY_Val   config -state disabled
#	.lblwlr config -state disabled
#	.cbowlr config -state disabled

	.cboWidth clear list
	.cboWidth insert list end 8 16 24 32 40 48 56 64 72
	.cboDQS clear list
	.cboDQS insert list end 4 8

	set Data_Width_lst {8 16 24 32 40 48 56 64 72}
	if {$Para(Mode) == "DDR2"} {
		.cboFrequency insert list end 125 200 267 333 400
		if {[lsearch {125 200 267 333 400} $Para(Frequency)] == -1} {set Para(Frequency) 267}

		.cboIO_buffer insert list end SSTL18_I SSTL18_II
		if {[lsearch {SSTL18_I SSTL18_II} $Para(IO_buffer)] == -1} {set Para(IO_buffer) SSTL18_I}

		.lblDQSBuffer config -state normal
		.cboDQSBuffer config -state normal

		.cboGear config -state normal
		if {[lsearch {125 200} $Para(Frequency)] != -1} {
			.cboGear insert list end 2:1 4:1
			if {[lsearch {2:1 4:1} $Para(Gear)] == -1} {set Para(Gear) 2:1}
		} else {
			.cboGear insert list end 4:1
			set Para(Gear) 4:1
		}

		if {$Para(package285_flag) == "true"} {
			.cboWidth clear list
			if {$Para(DQS) == "8"} {
				.cboWidth insert list end 8 16 24 32 40 48
				if {$Para(Width) > 48} {set Para(Width) 48}
			} else {
				if {$Para(DQSBuffer) != "Differential"} {
					.cboWidth insert list end 8 16 24 32
					if {$Para(Width) > 32} {set Para(Width) 32}
				} else {
					.cboWidth insert list end 8 16 24
					if {$Para(Width) > 24} {set Para(Width) 24}
				}
			}
		} else {
			.cboWidth clear list
			set max [expr $Para(dqs_no) * 2 * $Para(DQS)]
			foreach i $Data_Width_lst {
				if {$i <= $max} {.cboWidth insert list end $i}
			}
			if {$Para(Width) > $max} {set Para(Width) $max}
		}

#		set Para(wlr) "OFF"
	}
	if {$Para(Mode) == "DDR3"} {
		.cboIO_buffer insert list end SSTL15_I SSTL15_II
		if {[lsearch {SSTL15_I SSTL15_II} $Para(IO_buffer)] == -1} {set Para(IO_buffer) SSTL15_I}

		.cboFrequency insert list end 300 400
		if {[lsearch {300 400} $Para(Frequency)] == -1} {set Para(Frequency) 400}

		.cboGear config -state normal
		.cboGear insert list end 4:1 8:1
		if {[lsearch {4:1 8:1} $Para(Gear)] == -1} {set Para(Gear) 4:1}

		set Para(DQSBuffer) "Differential"

#		.lblwlr config -state normal
#		.cbowlr config -state normal
		if {$Para(package285_flag) == "true"} {
			.cboWidth clear list
			if {$Para(DQS) == "8"} {
				.cboWidth insert list end 8 16 24 32 40 48
				if {$Para(Width) > 48} {set Para(Width) 48}
			} else {
				.cboWidth insert list end 8 16 24
				if {$Para(Width) > 24} {set Para(Width) 24}
			}
		} else {
			.cboWidth clear list
			set max [expr $Para(dqs_no) * 2 * $Para(DQS)]
			foreach i $Data_Width_lst {
				if {$i <= $max} {.cboWidth insert list end $i}
			}
			if {$Para(Width) > $max} {set Para(Width) $max}
		}
	}
	if {$Para(Mode) == "DDR3L"} {
		.cboIO_buffer insert list end SSTL135_I SSTL135_II
		if {[lsearch {SSTL135_I SSTL135_II} $Para(IO_buffer)] == -1} {set Para(IO_buffer) SSTL135_I}

		.cboFrequency insert list end 300 400
		if {[lsearch {300 400} $Para(Frequency)] == -1} {set Para(Frequency) 400}

		.cboGear config -state normal
		.cboGear insert list end 4:1 8:1
		if {[lsearch {4:1 8:1} $Para(Gear)] == -1} {set Para(Gear) 4:1}

		set Para(DQSBuffer) "Differential"

#		.lblwlr config -state normal
#		.cbowlr config -state normal
		if {$Para(package285_flag) == "true"} {
			.cboWidth clear list
			if {$Para(DQS) == "8"} {
				.cboWidth insert list end 8 16 24 32 40 48
				if {$Para(Width) > 48} {set Para(Width) 48}
			} else {
				.cboWidth insert list end 8 16 24
				if {$Para(Width) > 24} {set Para(Width) 24}
			}
		} else {
			.cboWidth clear list
			set max [expr $Para(dqs_no) * 2 * $Para(DQS)]
			foreach i $Data_Width_lst {
				if {$i <= $max} {.cboWidth insert list end $i}
			}
			if {$Para(Width) > $max} {set Para(Width) $max}
		}
	}

	if {$Para(Mode) == "LPDDR"} {
		.cboIO_buffer insert list end LVCMOS18
		set Para(IO_buffer) LVCMOS18
		.cboFrequency insert list end 83.3 150 200
		if {[lsearch {83.3 150 200} $Para(Frequency)] == -1} {set Para(Frequency) 150}

#		.cboGear insert list end 2:1
#		set Para(Gear) 2:1
#		.cboDQSBuffer config -state normal
		set Para(DQSBuffer) "Differential"
#		set Para(wlr) "OFF"
	}
	if {$Para(Mode) == "LPDDR2"} {
		.cboIO_buffer insert list end HSUL12
		set Para(IO_buffer) HSUL12
		.cboFrequency insert list end 125 200 267 333 400
		if {[lsearch {125 200 267 333 400} $Para(Frequency)] == -1} {set Para(Frequency) 400}
#		.cboGear insert list end 2:1
#		set Para(Gear) 2:1
#		.cboDQSBuffer config -state normal
		set Para(DQSBuffer) "Differential"
#		set Para(wlr) "OFF"
		.cboWidth clear list
		.cboWidth insert list end 16 32
		if {[lsearch {16 32 } $Para(Width)] == -1} {set Para(Width) 16}
		.cboDQS clear list
		.cboDQS insert list end 8
		set Para(DQS) 8
	}
	if {$Para(Mode) == "LPDDR3"} {
		.cboIO_buffer insert list end HSUL12
		set Para(IO_buffer) HSUL12
		.cboFrequency insert list end 125 200 267 333 400
		if {[lsearch {125 200 267 333 400} $Para(Frequency)] == -1} {set Para(Frequency) 400}
#		.cboGear insert list end 2:1
#		set Para(Gear) 2:1
#		.cboDQSBuffer config -state normal
		set Para(DQSBuffer) "Differential"

#		.lblwlr config -state normal
#		.cbowlr config -state normal
		.cboWidth clear list
		.cboWidth insert list end 16 32
		if {[lsearch {16 32 } $Para(Width)] == -1} {set Para(Width) 16}
		.cboDQS clear list
		.cboDQS insert list end 8
		set Para(DQS) 8
	}

	if {$Para(Mode) == "DDR2" ||
		$Para(Mode) == "DDR3" ||
		$Para(Mode) == "DDR3L" ||
		$Para(Mode) == "LPDDR" ||
		$Para(Mode) == "LPDDR2" ||
		$Para(Mode) == "LPDDR3"} {
		.cboWidth config -state normal
		.lblWidth   config -state normal
		#.lbl2Width  config -state normal

#		.lblNumber config -state normal
#		.cboNumber config -state normal
		#Display Box	= Data width/number of DQ per DQS group
		if {$Para(Width) >= "1" && $Para(Width) <= "72"} {
			#CR_52998
			if {[expr $Para(Width)%$Para(DQS)] == 0} {
				set Para(Number) [expr $Para(Width)/$Para(DQS)]
			} else {
				set Para(Number) [expr $Para(Width)/$Para(DQS)+1]
			}

		} else {
			set Para(Width) [string trimleft $Para(Width) 0]
			#set Para(Number) 0
		}
		.ckcac      config -state normal
		.ckdata_mask config -state normal
#		.ckenDqDqs  config -state normal

#		.lblSensitivity config -state normal
#		.cboSensitivity config -state normal
#		.rdo2Sensitivity config -state normal
	} else {
		.cboWidth config -state disabled
		.lblWidth   config -state disabled
		#.lbl2Width  config -state disabled
#		.lblNumber config -state disabled
#		.cboNumber config -state disabled
		.ckcac      config -state disabled
		.ckdata_mask config -state disabled
#		.ckenDqDqs  config -state disabled
		set Para(cac) DISABLED
		set Para(data_mask) DISABLED
		set Para(enDqDqs) DISABLED
#		.lblSensitivity config -state disabled
#		.cboSensitivity config -state disabled
#		.rdo2Sensitivity config -state disabled
	}

	if {$Para(Mode) == "LPDDR2" || $Para(Mode) == "LPDDR3"} {
		if {$Para(cac) == "ENABLED"} {
			set Para(Number) [expr $Para(Number) + 2]
		}
	}

	set Para(Gear) "4:1"
	if {$Para(Gear) == "2:1"} {
		set Para(Clock) [expr $Para(Frequency)]
	}
	if {$Para(Gear) == "4:1"} {
		set Para(Clock) [expr $Para(Frequency)/2.00]
	}
	if {$Para(Gear) == "8:1"} {
		set Para(Clock) [expr $Para(Frequency)/4.00]
	}

	if {$Para(GenPll) == "ENABLED"} {
		.entryFreq config -state normal
		.lblFreq config -state normal
		.lbl2Freq config -state normal
		#if {[string length $Para(Freq)] == 0} {set Para(Freq) $Para(Frequency)}
		.lblAFreq config -state normal
		.entryAFreq config -state disabled
		.lbl2AFreq config -state normal
		.btnACalculate config -state normal
		.cbReference config -state normal
		if {$Para(Reference) == "1"} {
			.lblIOBUF config -state normal
			.cboIOBUF config -state normal
		} else {
			.lblIOBUF config -state disabled
			.cboIOBUF config -state disabled
		}
	} else {
		.entryFreq config -state disabled
		.lblFreq config -state disabled
		.lbl2Freq config -state disabled
		.lblAFreq config -state disabled
		.entryAFreq config -state disabled
		.lbl2AFreq config -state disabled
		.btnACalculate config -state disabled
		.cbReference config -state disabled
		set Para(Reference) "0"
		.lblIOBUF config -state disabled
		.cboIOBUF config -state disabled
	}

	if {$Para(cac) == "DISABLED"} {
		.lblnum_clk config -state disabled
		.lblnum_ce config -state disabled
		.lbladdr_width config -state disabled
		.lblbank_width config -state disabled
		.lblnum_odt config -state disabled
		.lblnum_cs config -state disabled

		.cbonum_clk config -state disabled
		.cbonum_ce config -state disabled
		.cboaddr_width config -state disabled
		.cbobank_width config -state disabled
		.cbonum_odt config -state disabled
		.cbonum_cs config -state disabled

		set Para(num_clk) ""
		set Para(num_ce) ""
		set Para(addr_width) ""
		set Para(bank_width) ""
		set Para(num_odt) ""
		set Para(num_cs) ""
	} else {
		.lblnum_clk config -state normal
		.lblnum_ce config -state normal
		.lbladdr_width config -state normal
		.lblbank_width config -state normal
		.lblnum_odt config -state normal
		.lblnum_cs config -state normal

		.cbonum_clk config -state normal
		#.cbonum_ce config -state normal
		.cboaddr_width config -state normal
		.cbobank_width config -state normal
		#.cbonum_odt config -state normal
		.cbonum_cs config -state normal

		if {$Para(num_clk) == ""} {set Para(num_clk) 1}
		if {$Para(num_ce) == ""} {set Para(num_ce) 1}
		if {$Para(Mode) == "DDR2"} {
			.cboaddr_width clear list
			.cboaddr_width insert list end 13 14 15 16
			if {[lsearch {13 14 15 16} $Para(addr_width)] == -1} {set Para(addr_width) 13}
			.cbobank_width clear list
			.cbobank_width insert list end 2 3
			if {[lsearch {2 3} $Para(bank_width)] == -1} {set Para(bank_width) 2}
			.cbonum_odt clear list
			.cbonum_odt insert list end 1 2 4
			if {[lsearch {1 2 4} $Para(num_odt)] == -1} {set Para(num_odt) 1}
			.cbonum_cs clear list
			.cbonum_cs insert list end 1 2 4
			if {[lsearch {1 2 4} $Para(num_cs)] == -1} {set Para(num_cs) 1}
			set Para(num_odt) $Para(num_cs)
		}
		if {$Para(Mode) == "DDR3"} {
			.cboaddr_width clear list
			.cboaddr_width insert list end 13 14 15 16
			if {[lsearch {13 14 15 16} $Para(addr_width)] == -1} {set Para(addr_width) 14}
			.cbobank_width clear list
			.cbobank_width insert list end 3
			set Para(bank_width) 3
			.cbobank_width config -state disabled
			.cbonum_odt clear list
			.cbonum_odt insert list end 1 2 4
			if {[lsearch {1 2 4} $Para(num_odt)] == -1} {set Para(num_odt) 1}
			.cbonum_cs clear list
			.cbonum_cs insert list end 1 2 4
			if {[lsearch {1 2 4} $Para(num_cs)] == -1} {set Para(num_cs) 1}
			set Para(num_odt) $Para(num_cs)
		}
		if {$Para(Mode) == "DDR3L"} {
			.cboaddr_width clear list
			.cboaddr_width insert list end 13 14 15 16
			if {[lsearch {13 14 15 16} $Para(addr_width)] == -1} {set Para(addr_width) 14}
			.cbobank_width clear list
			.cbobank_width insert list end 3
			set Para(bank_width) 3
			.cbobank_width config -state disabled
			.cbonum_odt clear list
			.cbonum_odt insert list end 1 2 4
			if {[lsearch {1 2 4} $Para(num_odt)] == -1} {set Para(num_odt) 1}
			.cbonum_cs clear list
			.cbonum_cs insert list end 1 2 4
			if {[lsearch {1 2 4} $Para(num_cs)] == -1} {set Para(num_cs) 1}
			set Para(num_odt) $Para(num_cs)
		}
		if {$Para(Mode) == "LPDDR"} {
			.cbonum_clk config -state disabled
			.cbonum_ce config -state disabled
			.cboaddr_width clear list
			.cboaddr_width insert list end 12 13 14
			if {[lsearch {12 13 14} $Para(addr_width)] == -1} {set Para(addr_width) 13}
			set Para(bank_width) 2
			.cbobank_width config -state disabled
			set Para(num_odt) ""
			.cbonum_odt config -state disabled
			set Para(num_cs) 1
			.cbonum_cs config -state disabled
		}
		if {$Para(Mode) == "LPDDR2"} {
			.cbonum_clk config -state disabled
			.cbonum_ce config -state disabled
			set Para(addr_width) ""
			.cboaddr_width config -state disabled
			set Para(bank_width) ""
			.cbobank_width config -state disabled
			set Para(num_odt) ""
			.cbonum_odt config -state disabled
			#.cbonum_cs clear list
			#.cbonum_cs insert list end 1 2
			#if {[lsearch {1 2} $Para(num_cs)] == -1} {set Para(num_cs) 1}
			set Para(num_cs) 1
			.cbonum_cs config -state disabled
			#set Para(num_odt) $Para(num_cs)
		}
		if {$Para(Mode) == "LPDDR3"} {
			.cbonum_clk config -state disabled
			.cbonum_ce config -state disabled
			set Para(addr_width) ""
			.cboaddr_width config -state disabled
			set Para(bank_width) ""
			.cbobank_width config -state disabled
			set Para(num_odt) ""
			.cbonum_odt config -state disabled
#			.cbonum_cs clear list
#			.cbonum_cs insert list end 1 2
#			if {[lsearch {1 2} $Para(num_cs)] == -1} {set Para(num_cs) 1}
			set Para(num_cs) 1
			.cbonum_cs config -state disabled
			set Para(num_odt) $Para(num_cs)
		}
		set Para(num_ce) $Para(num_cs)
	}

	if {$Para(Gear) == "4:1" || $Para(Gear) == "8:1"} {
		.ckEnECLK config -state normal
	} else {
		.ckEnECLK config -state disabled
		set Para(EnECLK) DISABLED
	}

	if {[.cboIOBUF cget -state] == "normal"} {
		set rx_type_lst {LVDS SUBLVDS BLVDS25 MLVDS25 SLVS LVPECL33 LVTTL33 LVTTL33D \
				LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
		.cboIOBUF clear list
		foreach x $rx_type_lst {
			.cboIOBUF insert list end $x
		}
		if {$Para(IOBUF) == ""} {set Para(IOBUF) "LVDS"}
	}

	#.lblDQSBuffer config -state normal
	#.cboDQSBuffer config -state normal
	.lblRDLY_Adj config -state normal
	.cboRDLY_Adj config -state normal
	.lblRDLY_Val config -state normal
	.cboRDLY_Val config -state normal
	if {$Para(RDLY_Adj) == "FACTORYONLY"} {
		.cboRDLY_Val config -state disabled
		#set Para(RDLY_Val) ""
	} else {
		.cboRDLY_Val config -state normal
		.cboRDLY_Val clear list
		if {$Para(RDLY_Adj) == "MINUS"} {
			for {set i 1} {$i < 257} {incr i} {
				.cboRDLY_Val insert list end $i
			}
		}
		if {$Para(RDLY_Adj) == "PLUS"} {
			for {set i 0} {$i < 256} {incr i} {
				.cboRDLY_Val insert list end $i
			}
		}
		if {$Para(RDLY_Val) == ""} {
			set Para(RDLY_Val) 1
		}
	}
	.lblWDLY_Adj config -state normal
	.cboWDLY_Adj config -state normal
	.lblWDLY_Val config -state normal
	.cboWDLY_Val config -state normal
	if {$Para(WDLY_Adj) == "FACTORYONLY"} {
		.cboWDLY_Val config -state disabled
		#set Para(WDLY_Val) ""
	} else {
		.cboWDLY_Val config -state normal
		.cboWDLY_Val clear list
		if {$Para(WDLY_Adj) == "MINUS"} {
			for {set i 1} {$i < 257} {incr i} {
				.cboWDLY_Val insert list end $i
			}
		}
		if {$Para(WDLY_Adj) == "PLUS"} {
			for {set i 0} {$i < 256} {incr i} {
				.cboWDLY_Val insert list end $i
			}
		}
		if {$Para(WDLY_Val) == ""} {
			set Para(WDLY_Val) 1
		}
	}

	CallDrawPins
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

	set tit "Check Parameter"
	if {[lsearch {DDR2 DDR3 DDR3L LPDDR2 LPDDR3} $Para(Mode)] == -1} {
		set msg "Invalid Interface."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}

	set ret [IsInRange "Data Width" 1 72 $Para(Width)]
	if {$ret == "-1"} {return -1}

	if {$Para(Number) > [expr $Para(dqs_no)*2]} {
		set msg "Total number of DQS groups exceed [expr $Para(dqs_no)*2]."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}

#	if {$Para(Mode) == "DDR2"} {
		if {$Para(RDLY_Adj) == "MINUS"} {
			set ret [IsInRange "DQS Read Delay Value" 1 256 $Para(RDLY_Val)]
			if {$ret == "-1"} {return -1}
		}
		if {$Para(RDLY_Adj) == "PLUS"} {
			set ret [IsInRange "DQS Read Delay Value" 0 255 $Para(RDLY_Val)]
			if {$ret == "-1"} {return -1}
		}
		if {$Para(WDLY_Adj) == "MINUS"} {
			set ret [IsInRange "DQS Write Delay Value" 1 256 $Para(WDLY_Val)]
			if {$ret == "-1"} {return -1}
		}
		if {$Para(WDLY_Adj) == "PLUS"} {
			set ret [IsInRange "DQS Write Delay Value" 0 255 $Para(WDLY_Val)]
			if {$ret == "-1"} {return -1}
		}
#	}

	if {[.entryFreq cget -state] == "normal"} {
		set ret [IsInRange "PLL Input Clock Frequency" 10 450 $Para(Freq)]
		if {$ret == "-1"} {return -1}
		if {[string length $Para(Freq)] == "0"} {
			set tit "Check Parameter"
			set msg "Please input PLL Input Clock Frequency."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
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
	global Para

	GetDevType

	set str "-arch $Para(arch) -type iol -mode $Para(Mode)"

	lappend str -io_type $Para(IO_buffer) -freq_in $Para(Frequency)
	#53522: For DDRMEM, "-gear" is only required if the gear setting GUI entry is active.
	#you just double the GUI value and put it into the command line.
	switch $Para(Gear) {
	"2:1"         { lappend str -gear 2 }
	"4:1"         { lappend str -gear 4 }
	"8:1"         { lappend str -gear 8 }
	}
	set Number $Para(Number)
	if {$Para(Mode) == "LPDDR2" || $Para(Mode) == "LPDDR3"} {
		if {$Para(cac) == "ENABLED"} {
			set Number [expr $Para(Number) - 2]
		}
	}
	for {set i 1} {$i <= $Number} {incr i} {
		lappend str -dqs $i $Para(DQS)
	}
	if {$Para(DQSBuffer)=="Differential"} {lappend str -dqs_diff}

	#lappend str -width $Para(Width) -sensitivity [string tolower $Para(Sensitivity)]
	#lappend str -sensitivity [string tolower $Para(Sensitivity)]

#	if {$Para(Mode) == "DDR2"} {
		#Please use ¡°-dqs_del #¡± for DQS Delay, # is from -256 to 256:
		#		-257: FACTORYONLY
		#		255 ~ 0: PLUS
		#		-1~-256 : MINUS
		switch $Para(RDLY_Adj) {
			"FACTORYONLY" {lappend str -dqs_deli -257}
			"MINUS"       {lappend str -dqs_deli -$Para(RDLY_Val)}
			"PLUS"        {lappend str -dqs_deli $Para(RDLY_Val)}
		}
		switch $Para(WDLY_Adj) {
			"FACTORYONLY" {lappend str -dqs_delo -257}
			"MINUS"       {lappend str -dqs_delo -$Para(WDLY_Val)}
			"PLUS"        {lappend str -dqs_delo $Para(WDLY_Val)}
		}
#	}
	#And use ¡°-del 0/1¡± for Write Leveling Range: 1 is on, 0 is off.
#	switch $Para(wlr) {
#		"OFF"    { lappend str -del 0 }
#		"ON"    { lappend str -del 1 }
#	}
	if {$Para(Mode) == "DDR3" && $Para(Gear) == "8:1"} {
#		lappend str -del 2
	}

	if {$Para(cdel) == "ENABLED"} {lappend str -cdel}
	if {$Para(data_mask) == "ENABLED"} {lappend str -data_mask}
	if {$Para(cac) == "ENABLED"} {
		lappend str -num_clk $Para(num_clk) -num_ce $Para(num_ce)
		if {$Para(addr_width) != ""} {lappend str -addr_width $Para(addr_width)}
		if {$Para(bank_width) != ""} {lappend str -bank_width $Para(bank_width)}
		if {$Para(num_odt) != ""} {lappend str -num_odt $Para(num_odt)}
		lappend str -num_cs $Para(num_cs)
	}
#	if {$Para(dev_type) == "E"} {
#		lappend str -dev_e
#	}
	if {$Para(EnECLK) == "ENABLED" } {lappend str -eclk_bridge}

	if {$Para(GenPll) == "ENABLED" } {
		if {[string length $Para(Freq)] > 0} {
			lappend str -pll $Para(Freq)
		} else {
			lappend str -pll $Para(Frequency)
		}
		if {$Para(Reference) == 1} {
			lappend str -clkibuf $Para(IOBUF)
		}
	}

	#!SOF-122654,
	#!Due to the device limitation of 285 package, we can only support:
	#!	If groupsize <= 6, dqs_perside = 4;
	#!	If groupsize > 6, dqs_perside = 3;
	#!SOF-122837,
	#!For the differential dqs, 285 package can only support 3 groups on the left side,
	#!	so the dqs_perside whould be 3
	if {$Para(package285_flag) == "false"} {
		lappend str -dqs_perside $Para(dqs_no)
	} else {
		if {$Para(DQSBuffer)=="Differential"} {
			lappend str -dqs_perside 3
		} else {
		if {$Para(DQS) <= 6} {
			lappend str -dqs_perside 4
		} else {
			lappend str -dqs_perside 3
			}
		}
	}

	return $str
}

proc GetStdoutStr {}  {
	global Para

	set str [GenerateCB]

	set scuba [GetScubaEngine]

#*** General Options Command arguments ***
	set cmd [GetGeneralArgs]

	append command_line [list $scuba] " -w -n" " " $Para(ModuleName) $cmd " " $str

	lappend command_line -cal
#	tk_messageBox -default ok -icon warning -message $command_line -title "GetStdoutStr" -type ok
	set ret [catch {eval exec $command_line} msg]
#	tk_messageBox -default ok -icon warning -message $ret -title "GetStdoutStr" -type ok
#	tk_messageBox -default ok -icon warning -message $msg -title "GetStdoutStr" -type ok
	if {$ret != 0} {return -1}

	return $msg
}

#Calculate button
proc CalculateCmd {}  {
	global Para

	set ret [CheckParameterCB]
	if {$ret == -1}  {return -1}

	#Call scuba engine to get output string
	set ret [GetStdoutStr]
	if {$ret == -1}  {
		set tit "Frequency Calculate"
		set msg "The Actual Clock Frequency achieved does not match the specified Clock Frequency, check the value of Actual Clock Frequency in Configuration tab. Push OK to Continue."
		set ret [tk_messageBox -default ok -icon warning -message $msg -title $tit -type okcancel]
		if {$ret == "ok"} {
			set Para(AFreq) "0.0000"
		} else {
			set Para(AFreq) ""
		}
		return -1
	}

	foreach str [split $ret '\n'] {
		set str [string trim $str]
		if {[string first "Div:" $str] != -1} {
			set div_str [lindex [split $str ':'] 1]
		}
		if {[string first "Freq:" $str] != -1} {
			set freq_str [lindex [split $str ':'] 1]
		}
		if {[string first "Phase:" $str] != -1} {
			set phase_str [lindex [split $str ':'] 1]
		}
	}
	if {[info exists div_str] == 0} {
		set tit "Frequency Calculate"
		set msg "The Actual Clock Frequency achieved does not match the specified Clock Frequency, check the value of Actual Clock Frequency in Configuration tab. Push OK to Continue."
		set ret [tk_messageBox -default ok -icon warning -message $msg -title $tit -type okcancel]
		if {$ret == "ok"} {
			set Para(AFreq) "0.0000"
		} else {
			set Para(AFreq) ""
		}
		return -1
	}
	set div [split $div_str ,]
	set freq [split [string trim $freq_str] " "]
	set phase [split $phase_str ,]

	if {[string trim [lindex $freq 0] ','] == "0"} {
		set tit "Frequency Calculate"
		set msg "The Actual Clock Frequency achieved does not match the specified Clock Frequency, check the value of Actual Clock Frequency in Configuration tab. Push OK to Continue."
		set ret [tk_messageBox -default ok -icon warning -message $msg -title $tit -type okcancel]
		if {$ret == "ok"} {
			set Para(AFreq) "0.0000"
		} else {
			set Para(AFreq) ""
		}
		return -1
	}

	#Process Freq
	set Para(AFreq)  [string trim [lindex $freq 0] ',']
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
	AttributeSetting 480 590
	set pin_flag 1
	DrawImage 250 480
	set tnb $Para(tnb)

	wm title . "Lattice FPGA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	GetDevType

	set page [$tnb add -label "Configuration"]

	iwidgets::labeledframe .frmConfig -labeltext "" -labelpos nw
	set frmConfig [.frmConfig childsite]

	set w 31
	set cboW 12
	set mode_lst {DDR2 DDR3 DDR3L LPDDR2 LPDDR3}
	CreateLabelCombobox $frmConfig Mode "Interface" $w $cboW Para(Mode) $mode_lst {ChangeModeDefault;ChangeValueCmd}
	.lblMode config -anchor w

	set io_type_lst {SSTL18_I STL18_II SSTL15_I SSTL15_II SSTL135_I SSTL135_II LVCMOS18 HSUL12 HSUL12}
	CreateLabelCombobox $frmConfig IO_buffer "I/O Buffer Configuration" $w $cboW Para(IO_buffer) $io_type_lst {ChangeValueCmd}
	.lblIO_buffer config -anchor w

	set freq_list {83.3 125 150 200 267 300 333 400}
	CreateLabelCombobox $frmConfig Frequency "DDR Memory Frequency" $w $cboW Para(Frequency) $freq_list {ChangeValueCmd}
	.lblFrequency config -anchor w
	.cboFrequency config -labeltext "MHz" -labelpos e

	CreateLabelEntryLabel $frmConfig Clock "System Clock Frequency" 10 "MHz" "" Para(Clock) integer
	.lblClock config -width $w -anchor w
	.entryClock config -state disabled -disabledforeground black

	set gear_lst {2:1 4:1 8:1}
	CreateLabelCombobox $frmConfig Gear "Gearing Ratio" $w $cboW Para(Gear) $gear_lst {ChangeValueCmd}
	.lblGear config -anchor w
	pack forget .frmGear

#	CreateLabelEntryLabel $frmConfig Width "Data Width" 10 "(1 - 72)" "" Para(Width) integer
#	.lblWidth config -width $w -anchor w
#	.entryWidth.lwchildsite.entry config -validate key -vcmd {
#			after idle {ChangeValueCmd}
#			return 1
#		}

	CreateLabelCombobox $frmConfig DQSBuffer "DQS Buffer Configuration for DDR2" $w $cboW Para(DQSBuffer) {Single-ended Differential} {ChangeValueCmd}
	.lblDQSBuffer config -width $w -anchor w

	CreateLabelCombobox $frmConfig DQS "Number of DQ per DQS" $w $cboW Para(DQS) {4 8} {ChangeValueCmd}
	.lblDQS config -anchor w

	set width_lst {8 16 24 32 40 48 56 64 72}
	CreateLabelCombobox $frmConfig Width "Data Width" $w $cboW Para(Width) $width_lst {ChangeValueCmd}
	.lblWidth config -anchor w

	CreateLabelEntryLabel $frmConfig Number "Total number of DQS Groups" 10 "" "" Para(Number) integer
	.lblNumber config -width $w -anchor w
	.entryNumber config -state disabled -disabledforeground black

#	set wlr_lst {OFF ON}
#	CreateLabelCombobox $frmConfig wlr "DDR3 Write Leveling Range" $w $cboW Para(wlr) $wlr_lst {ChangeValueCmd}
#	.lblwlr config -anchor w

	checkbutton .ckcac -text "Clock / Address / Command" -variable Para(cac) -offvalue DISABLED -onvalue ENABLED -command ChangeValueCmd
	checkbutton .ckdata_mask -text "Data Mask" -variable Para(data_mask) -offvalue DISABLED -onvalue ENABLED -command ChangeValueCmd
	checkbutton .ckcdel -text "Enable Dynamic Margin Control on Clock Delay" -variable Para(cdel) -offvalue DISABLED -onvalue ENABLED -command ChangeValueCmd
	pack .ckdata_mask .ckcac .ckcdel -in $frmConfig -anchor w -padx 8

#	CreateRadioItem $frmConfig Sensitivity "Lock/Jitter Sensitivity" $w "HIGH" HIGH "LOW" LOW 8 left Para(Sensitivity) {ChangeValueCmd}
#	.lblSensitivity config -anchor w
#	CreateLabelCombobox $frmConfig Sensitivity "Lock/Jitter Sensitivity" $w $cboW Para(Sensitivity) {HIGH LOW} {ChangeValueCmd}
#	.lblSensitivity config -anchor w
#
# SOF-123730 - Display "Enable ECLK Bridge" button
# 02/20/2014 - Remove the "Enable ECLK Bridge" option.  Scuba does not know how to split DQS between sides.
#
	checkbutton .ckEnECLK -text "Enable ECLK Bridge (required if bus is crossing sides)" -variable Para(EnECLK) -offvalue DISABLED -onvalue ENABLED -command {ChangeValueCmd}
#	pack .ckEnECLK -in $frmConfig -anchor w -padx 8
	checkbutton .ckGenPll -text "Generate PLL with this module" -variable Para(GenPll) -offvalue DISABLED -onvalue ENABLED -command ChangeValueCmd
	pack .ckGenPll -in $frmConfig -anchor w -padx 8
	CreateLabelEntryLabel $frmConfig Freq "PLL Input Clock Frequency" 12 "MHz" "" Para(Freq) {real}
	pack .frmFreq -in $frmConfig -anchor w -padx 40
	.lblFreq config -width 24 -anchor w
	CreateLabelEntryLabel $frmConfig AFreq "Actual Clock Frequency" 12 "MHz" "" Para(AFreq) {real}
	pack .frmAFreq -in $frmConfig -anchor w -padx 40
	.lblAFreq config -width 24 -anchor w

	button .btnACalculate -text "Calculate" -width 10 -command {CalculateCmd}
	pack .btnACalculate -in .frmAFreq -side left -padx 10

#	set del_lst {BYPASS DEL1 DEL2 DEL3 DEL4 DEL5 DEL6 DEL7}
#	CreateLabelCombobox $frmConfig val "ISI Calibration" $w 12 Para(val) $del_lst {ChangeValueCmd}
#	.lblval config -anchor w
	checkbutton .cbReference -text "PLL Reference Clock From I/O Pin" -variable Para(Reference) -command {ChangeValueCmd}
	pack .cbReference -in $frmConfig -anchor w -padx 40

	CreateLabelCombobox $frmConfig IOBUF "CLKI Input Buffer Type" $w 20 Para(IOBUF) $io_type_lst {ChangeValueCmd}
	pack .frmIOBUF -in $frmConfig -anchor w -padx 40
	.lblIOBUF config -width 24 -anchor w

	pack .frmConfig -in $page -fill both -expand 1

	set w 24
	set page2 [$tnb add -label "Clock/Address/Command"]
	iwidgets::labeledframe .frmpage2 -labeltext "" -labelpos nw
	set frmpage2 [.frmpage2 childsite]
	CreateLabelCombobox $frmpage2 num_clk "Number of Clocks" $w 8 Para(num_clk) {1 2 4} {ChangeValueCmd}
	.lblnum_clk config -anchor w

	CreateLabelCombobox $frmpage2 addr_width "Address Width" $w 8 Para(addr_width) {12 13 14 15 16} {ChangeValueCmd}
	.lbladdr_width config -anchor w

	CreateLabelCombobox $frmpage2 bank_width "Bank Address Width" $w 8 Para(bank_width) {2 3} {ChangeValueCmd}
	.lblbank_width config -anchor w

	CreateLabelCombobox $frmpage2 num_cs "Number of Chip Selects" $w 8 Para(num_cs) {1 2 4  8} {ChangeValueCmd}
	.lblnum_cs config -anchor w

	CreateLabelCombobox $frmpage2 num_odt "Number of ODT" $w 8 Para(num_odt) {1 2 4} {ChangeValueCmd}
	.lblnum_odt config -anchor w
	.cbonum_odt config -state disabled

	CreateLabelCombobox $frmpage2 num_ce "Number of Clock Enables" $w 8 Para(num_ce) {1 2 4} {ChangeValueCmd}
	.lblnum_ce config -anchor w
	.cbonum_ce config -state disabled

	pack .frmpage2 -in $page2 -fill both -expand 1

	set w 28
	set page3 [$tnb add -label "Advanced Settings"]
	iwidgets::labeledframe .frmpage3 -labeltext "" -labelpos nw
	set frmpage3 [.frmpage3 childsite]

	CreateLabelCombobox $frmpage3 RDLY_Adj "DQS Read Delay Adjustment" $w $cboW Para(RDLY_Adj) {FACTORYONLY PLUS MINUS} {ChangeValueCmd}
	.lblRDLY_Adj config -width 25 -anchor w
	.cboRDLY_Adj config -width 16
	CreateLabelCombobox $frmpage3 RDLY_Val "DQS Read Delay Value" $w $cboW Para(RDLY_Val) {} {ChangeValueCmd}
	.lblRDLY_Val config -width 25 -anchor w
	pack .frmRDLY_Adj .frmRDLY_Val -in $frmpage3 -anchor w -padx 25

	CreateLabelCombobox $frmpage3 WDLY_Adj "DQS Write Delay Adjustment" $w $cboW Para(WDLY_Adj) {FACTORYONLY PLUS MINUS} {ChangeValueCmd}
	.lblWDLY_Adj config -width 25 -anchor w
	.cboWDLY_Adj config -width 16
	CreateLabelCombobox $frmpage3 WDLY_Val "DQS Write Delay Value" $w $cboW Para(WDLY_Val) {} {ChangeValueCmd}
	.lblWDLY_Val config -width 25 -anchor w
	pack .frmWDLY_Adj .frmWDLY_Val -in $frmpage3 -anchor w -padx 25

	pack .frmpage3 -in $page3 -fill both -expand 1

	.cbEdif config -state disabled

	$tnb delete 0

	$tnb view 0

	pack forget .lblOrder .cboOrder .cbIO

	ChangeValueCmd

	#FunctionButton
	#CenterPosition
	GeneralConfig
}
