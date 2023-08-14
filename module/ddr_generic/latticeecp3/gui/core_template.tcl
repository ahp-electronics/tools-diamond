#$Header: L:/module/ddr_generic/latticeecp3/gui/core_template.tcl 1.28 mghuang Exp $

#Rev 1.28: Diamond 3.0 IPExpress: SOF-104863
#Rev 1.27: Diamond 2.1 IPExpress: Fixed cr_57356, um v5.22
#Rev 1.26: Diamond 1.4.2 IPExpress: Fixed cr_56134
#Rev 1.25: Diamond 2.0 IPExpress: Fixed CR_54902, UM rev 5.20
#Rev 1.24: Diamond 1.4 IPExpress: Fixed cr_55383
#Rev 1.23: Diamond 1.4 IPExpress: Fixed cr_54207, TRLVDS not listed in IPExpress 

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para pin_flag

	if {$Para(pre-configuration) == "ENABLED"} {
		if {[string length $Para(width)] > 0 && $Para(width) != 0 && $Para(Multiplier) > 0} {DrawPins}
	} else {
		if {[string length $Para(width2)] > 0 && $Para(width2) != 0 && $Para(Multiplier) > 0} {DrawPins}
	}
} 

proc GetDevType {} {
	global Para

	regexp {(^[a-zA-Z0-9]+)-([0-9]+)?(.*)$} $Para(PartType) match x y z
	set Para(dev_type) $z
	#tk_messageBox -default ok -icon info -message $Para(dev_type) -title GetDevType -type ok
}

proc SetGear {} {
	global Para
	#Rev5.0.P116.note5
	if {$Para(freq_in) == ""} {
		set Para(gear) ""
	} else {
		if {$Para(freq_in) <= "200"} {
			set Para(gear) "1x"
		} else {
			set Para(gear) "2x"
		}
	}
}

proc ValidFreq3 {} {
	global Para
	set Para(min_feq) 133.0000
	set Para(max_feq) 500.0000
	if {$Para(pre-configuration) == "ENABLED"} {
		set freq_in freq_in
	} else {
		set freq_in freq_in2
	}
	set Para($freq_in) [string trimleft $Para($freq_in) 0]
	if {$Para($freq_in) < $Para(min_feq) || $Para($freq_in) > $Para(max_feq)} {
		#set msg "The selected frequency is $Para($freq_in)MHz and which is outside the valid range\n \
		#		(133 - 500 MHz) due to GDLL usage for this interface. Enter a valid frequency to\n \
		#		generate this interface configuration"
		set msg "The selected frequency is outside the valid range for the GDLL module (133MHz to 500MHz) which is used for this interface by default. Enter a frequency within the valid range to generate this interface configuration. Please consult application note TN1180 for more information."
		tk_messageBox -default ok -icon info -message $msg -title CheckParameter -type ok
		return -1
	}
	return 0
}

proc ValidFreq4 {} {
	global Para
	set Para(min_feq) 4.0000
	set Para(max_feq) 500.0000
	if {$Para(pre-configuration) == "ENABLED"} {
		set freq_in freq_in
	} else {
		set freq_in freq_in2
	}
	set Para($freq_in) [string trimleft $Para($freq_in) 0]
	if {$Para($freq_in) < $Para(min_feq) || $Para($freq_in) > $Para(max_feq)} {
		#set msg "The selected frequency is $Para($freq_in)MHz and which is outside the valid range\n \
		#		(4 - 500 MHz) due to GPLL usage for this interface. Enter a valid frequency to\n \
		#		generate this interface configuration"
		set msg "The selected frequency is outside the valid range for the GPLL module (4MHz to 500MHz) which is used for this interface by default. Enter a frequency within the valid range to generate this interface configuration. Please consult application note TN1180 for more information."
		tk_messageBox -default ok -icon info -message $msg -title CheckParameter -type ok
		return -1
	}
	return 0
}

proc ValidFreq8 {} {
	global Para
	set Para(min_feq) 100.0000
	set Para(max_feq) 400.0000
	if {$Para(pre-configuration) == "ENABLED"} {
		set freq_in freq_in
	} else {
		set freq_in freq_in2
	}
	set Para($freq_in) [string trimleft $Para($freq_in) 0]
	if {$Para($freq_in) < $Para(min_feq) || $Para($freq_in) > $Para(max_feq)} {
		#set msg "The selected frequency is $Para($freq_in)MHz which is outside the valid range\n \
		#		(100 - 400 Mhz) due to DQSDLL usage for this interface. Enter a valid frequency\n \
		#		to generate this interface configuration"
		set msg "The selected frequency is outside the valid range for the DQSDLL module (100MHz to 400MHz) which is used for this interface by default. Enter a frequency within the valid range to generate this interface configuration. Please consult application note TN1180 for more information."
		tk_messageBox -default ok -icon info -message $msg -title CheckParameter -type ok
		return -1
	}
	return 0
}

proc SetInterface {} {
	global Para
	#P119. Table DG3
	set enable_flag disabled
	set Para(GDLL_flag) 0
	set Para(GPLL_flag) 0
	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
		set io_type io_type
		set num_int num_int
		set aligned aligned
	} else {
		set mode mode2
		set io_type io_type2
		set num_int num_int2
		set aligned aligned2
	}

	.cboaligned2 clear list
		
	if {$Para($mode) == "Receive"} {
		set io_type_lst {LVCMOS25 LVCMOS18 LVCMOS15 LVCMOS12 LVCMOS33 LVCMOS33D LVDS25 BLVDS25 MLVDS LVPECL33 \
			HSTL18_I HSTL18_II HSTL18D_I HSTL18D_II HSTL15_I HSTL15D_I SSTL33_I SSTL33_II SSTL33D_I SSTL33D_II SSTL25_I SSTL25_II \
			SSTL25D_I SSTL25D_II SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II SSTL15 SSTL15D PCI33 LVTTL33 TRLVDS}
		if {[lsearch $io_type_lst $Para($io_type)] ==-1} {set Para($io_type) LVCMOS25}

		.cbogear clear list
		.cbogear insert list end 1x 2x
		
		if {$Para(dev_type) == "EA"} {
			if {$Para(gear) == "2x"} {
				if {$Para($num_int) == "1"} {
					.cboaligned2 insert list end Edge-to-Edge Centered "Dynamic Data Phase Alignment Required" "Dynamic Clock Phase Alignment Required"
				} else {
					.cboaligned2 insert list end Edge-to-Edge Centered "Dynamic Data Phase Alignment Required"
					if {[lsearch {Edge-to-Edge Centered "Dynamic Data Phase Alignment Required"} $Para(aligned2)] ==-1} {set Para(aligned2) Edge-to-Edge}
				}
			} else {
				.cboaligned2 insert list end Edge-to-Edge Centered
				if {[lsearch {Edge-to-Edge Centered} $Para(aligned2)] ==-1} {set Para(aligned2) Edge-to-Edge}
			}
		} else {
			.cboaligned2 insert list end Edge-to-Edge Centered
			if {[lsearch {Edge-to-Edge Centered} $Para(aligned2)] ==-1} {set Para(aligned2) Edge-to-Edge}
		}

		if {$Para(gear) == "1x"} {
			if {$Para($num_int) == "1"} {
				if {$Para($aligned) == "Edge-to-Edge"} {
					#Rev5.0 Page120 Note3
					set Para(GDLL_flag) 1
					if {$Para(dev_type) == "EA"} {
						if {$Para(Phase) != "PLL"} {
							set Para(Interface) "GDDRX1_RX.SCLK.Aligned"
						} else {
							set Para(Interface) "GDDRX1_RX.SCLK.PLL.Aligned"
						}
					} else {
						set Para(Interface) "GDDRX1_RX.ECLK.Aligned"
					}
				}
				if {$Para($aligned) == "Centered"} {
					if {$Para(dev_type) == "EA"} {
						set Para(Interface) "GDDRX1_RX.SCLK.Centered"
						#Rev5.0 Page120 Note3
#						set Para(GDLL_flag) 1
					} else {
						set Para(Interface) "GDDRX1_RX.ECLK.Centered"
					}
				}
				if {$Para($aligned) == "Dynamic Data Phase Alignment Required"} {
					set Para(Interface) "GDDRX2_RX.PLL.Dynamic"
				}
			}
			if {$Para($num_int) > 1} {
				if {$Para($aligned) == "Edge-to-Edge"} {
					set Para(Interface) "GDDRX1_RX.DQS.Aligned"
				}
				if {$Para($aligned) == "Centered"} {
					set Para(Interface) "GDDRX1_RX.DQS.Centered"
				}
				if {$Para($aligned) == "Dynamic Data Phase Alignment Required"} {
					set Para(Interface) ""
				}
			}
		}
		if {$Para(gear) == "2x"} {
			if {$Para($num_int) == "1"} {
				if {$Para($aligned) == "Edge-to-Edge"} {
					set Para(Interface) "GDDRX2_RX.ECLK.Aligned"
					#Rev5.0 Page120 Note3
					set Para(GDLL_flag) 1
				}
				if {$Para($aligned) == "Centered"} {
					set Para(Interface) "GDDRX2_RX.ECLK.Centered"
				}
				if {$Para($aligned) == "Dynamic Data Phase Alignment Required"} {
					set Para(Interface) "GDDRX2_RX.ECLK.Dynamic"
				}
				if {$Para($aligned) == "Dynamic Clock Phase Alignment Required"} {
					set Para(Interface) "GDDRX2_RX.PLL.Dynamic"
				}
			}
			if {$Para($num_int) > 1} {
				if {$Para($aligned) == "Edge-to-Edge"} {
					set Para(Interface) "GDDRX2_RX.DQS.Aligned"
					#Rev5.0 Page120 Note4
					set Para(GPLL_flag) 1
				}
				if {$Para($aligned) == "Centered"} {
					set Para(Interface) "GDDRX2_RX.DQS.Centered"
				}
				if {$Para($aligned) == "Dynamic Data Phase Alignment Required"} {
					set Para(Interface) "GDDRX2_RX.DQS.Dynamic"
				}
			}
		}
	}
	if {$Para($mode) == "Transmit"} {
		set io_type_lst {LVCMOS25 LVCMOS18 LVCMOS15 LVCMOS12 LVCMOS33 LVCMOS33D LVDS25 BLVDS25 MLVDS LVPECL33 \
			HSTL18_I HSTL18_II HSTL18D_I HSTL18D_II HSTL15_I HSTL15D_I SSTL33_I SSTL33_II SSTL33D_I SSTL33D_II SSTL25_I SSTL25_II \
			SSTL25D_I SSTL25D_II SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II SSTL15 SSTL15D PCI33 LVTTL33 RSDS MINILVDS PPLVDS LVDS25E RSDSE}
		if {[lsearch $io_type_lst $Para($io_type)] ==-1} {set Para($io_type) LVCMOS25}
		
		#rev 5.11
		.cbogear clear list
		if {$Para(dev_type) == "EA"} {
			.cbogear insert list end 1x 2x
		} else {
			.cbogear insert list end 1x
			set Para(gear) 1x
		}
		
		.cboaligned2 insert list end Edge-to-Edge Centered
		if {[lsearch {Edge-to-Edge Centered} $Para(aligned2)] ==-1} {set Para(aligned2) Edge-to-Edge}

		if {$Para(gear) == "1x"} {
			if {$Para($num_int) == "1"} {
				if {$Para($aligned) == "Centered"} {
					set Para(Interface) "GDDRX1_TX.SCLK.Centered"
					#Rev5.0 Page120 Note1&4
					set Para(GPLL_flag) 1
				}
				if {$Para($aligned) == "Edge-to-Edge"} {
					#Rev5.0 Page120 Note1
					set Para(Interface) "GDDRX1_TX.SCLK.Aligned"
				}
			}
			if {$Para($num_int) > 1} {
				.cboaligned2 clear list
				.cboaligned2 insert list end Centered
				set Para(aligned2) Centered
				if {$Para($aligned) == "Centered"} {
					set Para(Interface) "GDDRX1_TX.DQS.Centered"
				}
			}
		}
		if {$Para(gear) == "2x"} {
			#set Para($num_int) 1
			#.entrynum_int2 config -state disabled
			if {$Para($num_int) == "1"} {
				if {$Para($aligned) == "Edge-to-Edge"} {
			set Para($num_int) 1
			.entrynum_int2 config -state disabled
					set Para(Interface) "GDDRX2_TX.Aligned"
					#Rev5.0 Page120 Note2
				}
				if {$Para($aligned) == "Centered"} {
					.cboInterface clear list
					.cboInterface insert list end GDDRX2_TX.DQSDLL.Centered
					set Para(Interface) "GDDRX2_TX.PLL.Centered"
					#Rev5.0 Page120 Note2 & 4
				}
			}
			if {$Para($num_int) > 1} {
				.cboaligned2 clear list
				.cboaligned2 insert list end Centered
				set Para(aligned2) Centered

				.cboInterface clear list
				.cboInterface insert list end GDDRX2_TX.DQSDLL.Centered
				set Para(Interface) "GDDRX2_TX.DQSDLL.Centered"
			}
		}
	}
	
	if {$Para(dev_type) == "EA" && $Para(gear) == "2x" && $Para($num_int) == 1 && $Para($aligned) == "Dynamic Clock Phase Alignment Required"} {
		set Para(Interface) "GDDRX2_RX.PLL.Dynamic"
	}
	
	.cboio_type clear list
	foreach x $io_type_lst {
		.cboio_type insert list end $x
	}
	.cboio_type2 clear list
	foreach x $io_type_lst {
		.cboio_type2 insert list end $x
	}
	
	if {$Para(pre-configuration) == "ENABLED"} {
		.lblInterface config -state disabled
		.cboInterface config -state disabled
	} else {
		#.lblInterface config -state $enable_flag
		.cboInterface config -state $enable_flag
	}
}

proc SetDataPathDelay {} {
	global Para
	
	if {$Para(Interface) == "GDDRX1_RX.SCLK.Aligned" || $Para(Interface) == "GDDRX1_RX.SCLK.Centered" ||
		$Para(Interface) == "GDDRX1_RX.SCLK.PLL.Aligned" ||
		$Para(Interface) == "GDDRX1_RX.ECLK.Aligned" || $Para(Interface) == "GDDRX1_RX.ECLK.Centered" ||
		$Para(Interface) == "GDDRX2_RX.ECLK.Aligned" || $Para(Interface) == "GDDRX2_RX.ECLK.Centered"} {
		set Para(Delay) "Fixed"
		.cboDelay config -state disabled
		set Para(Number) ""
		.cboNumber config -state disabled
		set Para(val) ""
		.cboval config -state disabled
	}
	if {$Para(Interface) == "GDDRX1_RX.DQS.Aligned" || $Para(Interface) == "GDDRX1_RX.DQS.Centered" ||
		$Para(Interface) == "GDDRX2_RX.DQS.Aligned" || $Para(Interface) == "GDDRX2_RX.DQS.Centered"} {
		set Para(Delay) "Bypass"
		.cboDelay config -state disabled
		#Rev5.0 Page121 note 3
		set Para(val) ""
		.cboval config -state disabled
	}
	if {$Para(Interface) == "GDDRX2_RX.ECLK.Dynamic"} {
		set Para(Delay) "Dynamic"
		.cboDelay config -state disabled
		set Para(Number) ""
		.cboNumber config -state disabled
		set Para(val) ""
		.cboval config -state disabled
	}
	if {$Para(Interface) == "GDDRX2_RX.DQS.Dynamic"} {
		set Para(Delay) "Dynamic"
		.cboDelay config -state disabled
		#Rev5.0 Page121 note 3
		set Para(val) ""
		.cboval config -state disabled
	}
	if {$Para(Interface) == "GDDRX2_RX.PLL.Dynamic"} {
		set Para(Delay) "Bypass"
		.cboDelay config -state disabled
		set Para(Number) ""
		.cboNumber config -state disabled
		set Para(val) ""
		.cboval config -state disabled
	}
	if {$Para(Interface) == "GDDRX1_TX.SCLK.Centered" || $Para(Interface) == "GDDRX1_TX.SCLK.Aligned"} {
		set Para(Delay) ""
		.cboDelay config -state disabled
		set Para(Number) ""
		.cboNumber config -state disabled
		set Para(val) ""
		.cboval config -state disabled
	}
	if {$Para(Interface) == "GDDRX1_TX.DQS.Centered"} {
		set Para(Delay) ""
		.cboDelay config -state disabled
		#Rev5.0 Page121 note 3
		set Para(val) ""
		.cboval config -state disabled
	}
	if {$Para(Interface) == "GDDRX2_TX.Aligned" || $Para(Interface) == "GDDRX2_TX.DQSDLL.Centered" ||
		$Para(Interface) == "GDDRX2_TX.PLL.Centered"} {
		set Para(Delay) ""
		.cboDelay config -state disabled
		#Rev5.0 Page121 note 2 & 4
		.cboval config -state normal
		if {$Para(val) == ""} {set Para(val) "Bypass"}
	}
}

proc PopulatedFields {} {
	global Para
	
	set cbo_lst {mode2 io_type2 gear aligned2 Interface Delay Number dqs1 dqs2 dqs3 dqs4 dqs5 dqs6 dqs7 dqs8 val}
	set ent_lst {freq_in2 num_int2 width2}
	#Rev5.0 page118 note2.a
	#ii.1
	set p_lst {mode io_type freq_in num_int width aligned}
	foreach item $p_lst {
		set Para(${item}2) $Para($item)
	}
	set Para(trioddr2) $Para(trioddr)
	SetGear
	foreach item $cbo_lst {
		.lbl$item config -state disabled
		.cbo$item config -state disabled
	}
	foreach item $ent_lst {
		.lbl$item   config -state disabled
		.lbl2$item  config -state disabled
		.entry$item config -state disabled
	}
	#ii.2
	SetInterface
	#ii.3
	SetDataPathDelay
}

proc SetWidth {} {
	global Para
	
	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
		set num_int num_int
		set width width
		set freq_in freq_in
		set io_type io_type
	} else {
		set mode mode2
		set num_int num_int2
		set width width2
		set freq_in freq_in2
		set io_type io_type2
	}

	set Para(max_width) 256
	#Rev5.0.P116.note4
	if {$Para($num_int) == 1} {
		set Para(max_width) 256
		.lbl2$width config -text "(1 - 256)"
	}
	if {$Para($num_int) > 1} {
		set io_type_lst {LVDS25 BLVDS25 MLVDS LVCMOS33D BLVDS25 HSTL18D_I HSTL18D_II HSTL15D_I SSTL33D_I SSTL33D_II SSTL25D_I \
				   SSTL25D_II SSTL18D_I SSTL18D_II SSTL15D RSDS MINILVDS PPLVDS LVDS25E}
		if {[lsearch $io_type_lst $Para($io_type)] != -1} {
			set Para(max_width) 5
			.lbl2$width config -text "(1 - 5)"
		} else {
			set Para(max_width) 10
			.lbl2$width config -text "(1 - 10)"
		}
		#CR_54902, LVDS, RSDS, MINILVDS or PPLVDS
		set io_type_lst_ii {LVDS RSDS MINILVDS PPLVDS}
		if {$Para($mode) == "Transmit" && [lsearch $io_type_lst_ii $Para($io_type)] != -1} {
			set Para(max_width) 3
			.lbl2$width config -text "(1 - 3)"
		}
	}
	#Rev5.0.P116.note6
#	if {[string length $Para($freq_in)] == 0 || $Para($freq_in) == "-" || [string length $Para($width)] == 0} 
	if {[string is double -strict $Para($freq_in)] == 0 || [string is integer -strict $Para($width)] == 0} {
		set Para(bandwidth) ""
		set Para(PllFreq) 0
	} else {
		if {$Para($width) == 0 || $Para($freq_in) == 0} {
			set Para(bandwidth) 0
		} else {
			set Para(bandwidth) [expr [string trimleft $Para($freq_in) 0]*2*[string trimleft $Para($width) 0]]
			if {$Para(Multiplier) > 0} {
				set Para(PllFreq) [expr round([string trimleft $Para($freq_in) 0]/[string trimleft $Para(Multiplier) 0])]
			} else {
				set Para(PllFreq) 0
			}
		}
	}
}

proc SetDQSGrouping {} {
	global Para
	if {$Para(pre-configuration) == "ENABLED"} {
		set num_int num_int
		set width width
	} else {
		set num_int num_int2
		set width width2
	}
	if {$Para($num_int) > 1} {
		set Para(Number) $Para($num_int)
	} else {
		set Para(Number) ""
		for {set i 1} {$i <= 8} {incr i} {
			set Para(dqs$i) ""
			.lbldqs$i config -state disabled
			.cbodqs$i config -state disabled
		}
	}
	if {$Para(Number) > 1} {
		for {set i 1} {$i <= 8} {incr i} {
			if {$i <= $Para(Number)} {
				.lbldqs$i config -state normal
				.cbodqs$i config -state normal
				.cbodqs$i clear list
				for {set j 1} {$j <= $Para($width)} {incr j} {
					.cbodqs$i insert list end $j
				}
				if {$Para(dqs$i) == ""} {set Para(dqs$i) $Para($width)}
				if {$Para(dqs$i) > $Para($width)} {set Para(dqs$i) $Para($width)}
				if {$Para(bus_width_changed_flag) == 1} {set Para(dqs$i) $Para($width)}
			} else {
				.lbldqs$i config -state disabled
				.cbodqs$i config -state disabled
				set Para(dqs$i) ""
			}
		}
	}
	set Para(bus_width_changed_flag) 0
}

proc ChangeValueCmd {} {
	global Para

	SetWidth
	#Rev5.0.P118.note2
	set cbo_lst {mode2 io_type2 gear aligned2 Interface Delay Number dqs1 dqs2 dqs3 dqs4 dqs5 dqs6 dqs7 dqs8 val}
	set ent_lst {freq_in2 num_int2 width2}
	if {$Para(pre-configuration) == "ENABLED"} {
		#pre-configuration == "ENABLED"
		if {$Para(mode) == "Receive"} {
			set io_type_lst {LVCMOS25 LVCMOS18 LVCMOS15 LVCMOS12 LVCMOS33 LVCMOS33D LVDS25 BLVDS25 MLVDS LVPECL33 \
				HSTL18_I HSTL18_II HSTL18D_I HSTL18D_II HSTL15_I HSTL15D_I SSTL33_I SSTL33_II SSTL33D_I SSTL33D_II SSTL25_I SSTL25_II \
				SSTL25D_I SSTL25D_II SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II SSTL15 SSTL15D PCI33 LVTTL33 TRLVDS}
			if {$Para(io_type) != ""} {
				if {[lsearch $io_type_lst $Para(io_type)] ==-1} {set Para(io_type) LVCMOS25}
			}
		
			.cboaligned clear list
			if {$Para(dev_type) == "EA"} {
				if {$Para(gear) == "2x"} {
					if {$Para(num_int) == 1} {
						.cboaligned insert list end Edge-to-Edge Centered "Dynamic Data Phase Alignment Required" "Dynamic Clock Phase Alignment Required"
					} else {
					.cboaligned insert list end Edge-to-Edge Centered "Dynamic Data Phase Alignment Required"
					if {[lsearch {Edge-to-Edge Centered "Dynamic Data Phase Alignment Required"} $Para(aligned)] ==-1} {set Para(aligned) Edge-to-Edge}
					}
				} else {
					.cboaligned insert list end Edge-to-Edge Centered
					if {[lsearch {Edge-to-Edge Centered} $Para(aligned)] ==-1} {set Para(aligned) Edge-to-Edge}
				}
			} else {
				.cboaligned insert list end Edge-to-Edge Centered
				if {[lsearch {Edge-to-Edge Centered} $Para(aligned)] ==-1} {set Para(aligned) Edge-to-Edge}
			}
		} else {
			set io_type_lst {LVCMOS25 LVCMOS18 LVCMOS15 LVCMOS12 LVCMOS33 LVCMOS33D LVDS25 BLVDS25 MLVDS LVPECL33 \
			HSTL18_I HSTL18_II HSTL18D_I HSTL18D_II HSTL15_I HSTL15D_I SSTL33_I SSTL33_II SSTL33D_I SSTL33D_II SSTL25_I SSTL25_II \
			SSTL25D_I SSTL25D_II SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II SSTL15 SSTL15D PCI33 LVTTL33 RSDS MINILVDS PPLVDS LVDS25E RSDSE}
			if {$Para(io_type) != ""} {
				if {[lsearch $io_type_lst $Para(io_type)] ==-1} {set Para(io_type) LVCMOS25}
			}

			.cboaligned clear list
			if {$Para(num_int) > 1} {
				.cboaligned insert list end Centered
				set Para(aligned) Centered
			} else {
				.cboaligned insert list end Edge-to-Edge Centered
				if {[lsearch {Edge-to-Edge Centered} $Para(aligned)] ==-1} {set Para(aligned) Edge-to-Edge}
			}
		}

		if {$Para(mode) == "Transmit"} {
			.cbtrioddr config -state normal
		} else {
			set Para(trioddr) 0
			.cbtrioddr config -state disabled
		}
		
		.cboio_type clear list
		foreach x $io_type_lst {
			.cboio_type insert list end $x
		}
		
		.cbtrioddr2 config -state disabled
		if {[string length $Para(mode)] == 0 || [string length $Para(io_type)] == 0 ||
			[string length $Para(num_int)] == 0 || [string length $Para(width)] == 0 ||
			[string length $Para(freq_in)] == 0 || [string length $Para(aligned)] == 0} {
			set Para(trioddr2) 0
			#i.1
			foreach item $cbo_lst {
				.lbl$item config -state disabled
				.cbo$item config -state disabled
				set Para($item) ""
			}
			foreach item $ent_lst {
				.lbl$item   config -state disabled
				.entry$item config -state disabled
				.lbl2$item  config -state disabled
				set Para($item) ""
			}
			#i.2
			$Para(generate_cfg) configure -state disabled
		} else {
			PopulatedFields
			#ii.4
			$Para(generate_cfg) configure -state normal
		}
		if {$Para(mode) == ""} {
			set Para(aligned) ""
		}
	} else {
		#pre-configuration == "DISABLED"
		if {$Para(mode2) == "Transmit"} {
			.cbtrioddr2 config -state normal
		} else {
			set Para(trioddr2) 0
			.cbtrioddr2 config -state disabled
		}
		#note2.b.i.1
		if {[$Para(generate_cfg) cget -state] == "disabled"} {
			#note2.b.i.1.a
			if {[string length $Para(mode2)] == 0} {set Para(mode2) "Receive"}
			if {[string length $Para(io_type2)] == 0} {set Para(io_type2) "LVCMOS25"}
			if {[string length $Para(freq_in2)] == 0} {set Para(freq_in2) "200"}
			if {[string length $Para(gear)] == 0} {set Para(gear) "1x"}
			if {[string length $Para(aligned2)] == 0} {set Para(aligned2) "Edge-to-Edge"}
			if {[string length $Para(num_int2)] == 0} {set Para(num_int2) "1"}
			if {[string length $Para(width2)] == 0} {set Para(width2) "10"}
			#Rev5.0 page110 note 5
			if {[string length $Para(Interface)] == 0} {
				if {$Para(dev_type) == "EA"} {set Para(Interface) "GDDRX1_RX.SCLK.Aligned"}
				if {$Para(dev_type) == "E"} {set Para(Interface) "GDDRX1_RX.ECLK.Aligned"}
			}
			if {[string length $Para(Delay)] == 0} {set Para(Delay) "Fixed"}
			if {[string length $Para(Number)] == 0} {set Para(Number) ""}
			#set Para(val) ""
			$Para(generate_cfg) configure -state normal
		} else {
			#note2.b.i.2.a
			#PopulatedFields
		}

		#note2.b.ii
		set cbo_lst {mode2 io_type2 gear aligned2 Interface Delay val}
		set ent_lst {freq_in2 num_int2 width2}
		foreach item $cbo_lst {
			.lbl$item config -state normal
			.cbo$item config -state normal
		}
		foreach item $ent_lst {
			.lbl$item   config -state normal
			.entry$item config -state normal
			.lbl2$item  config -state normal
		}
		#note2.b.iii
		SetInterface
		#note2.b.iv
		SetDataPathDelay
	}
	#Rev5.0.P119.note3.a
	#???
	SetDQSGrouping
	
	if {$Para(Interface) == "GDDRX1_RX.SCLK.Aligned" || $Para(Interface) == "GDDRX1_RX.SCLK.PLL.Aligned"} {
		.cboPhase config -state normal
	} else {
		.cboPhase config -state disabled
	}
	
	if {$Para(Interface) == "GDDRX2_RX.ECLK.Aligned"} {
		.cboDivider config -state normal
	} else {
		.cboDivider config -state disabled
	}

	if {$Para(Interface) == "GDDRX2_TX.Aligned" || $Para(Interface) == "GDDRX2_TX.PLL.Centered"} {
		.entryMultiplier config -state normal
		.entryPllFreq config -state disabled -disabledforeground black
		.lblPllFreq config -state normal
	} else {
		.entryMultiplier config -state disabled
		.entryPllFreq config -state disabled -disabledforeground gray
		.lblPllFreq config -state disabled
	}
	
	.lblval config -state [.cboval cget -state]

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

	if {$Para(pre-configuration) == "ENABLED"} {
		set io_type io_type
		set mode mode
		set num_int num_int
		set width width
		set freq_in freq_in
		set aligned aligned
	} else {
		set io_type io_type2
		set mode mode2
		set num_int num_int2
		set width width2
		set freq_in freq_in2
		set aligned aligned2
	}
	set Para($num_int) [string trimleft $Para($num_int) 0]
	set ret [IsInRange "Number of Interfaces" 1 8 $Para($num_int)]
	if {$ret == "-1"} {return -1}
	
	set Para($width) [string trimleft $Para($width) 0]
	set ret [IsInRange "Bus Width" 1 $Para(max_width) $Para($width)]
	if {$ret == "-1"} {return -1}

	if {$Para($mode) == "Transmit" && $Para(dev_type) == "E" && $Para($freq_in) > 200} {
		set msg "LatticeECP3 E devices do not support any x2 gearing output interfaces!"
		tk_messageBox -default ok -icon info -message $msg -title CheckParameter -type ok
		return -1
	}
	
#	if {($Para($mode) == "Receive" && $Para(gear) == "1x" && $Para($aligned) == "Edge-to-Edge" && $Para($num_int) == 1) ||
#		($Para($mode) == "Receive" && $Para(gear) == "2x" && $Para($aligned) == "Edge-to-Edge" && $Para($num_int) == 1)} 
	if {($Para(Interface) == "GDDRX1_RX.SCLK.Aligned" && $Para(dev_type) == "EA") ||
		($Para(Interface) == "GDDRX1_RX.ECLK.Aligned" && $Para(dev_type) == "E") ||
		$Para(Interface) == "GDDRX2_RX.ECLK.Aligned"} {
		set ret [ValidFreq3]
		if {$ret == "-1"} {return -1}
	}
#	if {($Para($mode) == "Receive" && $Para(gear) == "2x" && $Para($aligned) == "Edge-to-Edge" && $Para($num_int) > 1) ||
#		($Para($mode) == "Receive" && $Para(gear) == "2x" && $Para($aligned) == "Dynamic Data Phase Alignment Required" && $Para($num_int) == 1 &&
#		 $Para(Interface) == "GDDRX2_RX.PLL.Dynamic" && $Para(dev_type) == "EA") ||
#		($Para($mode) == "Transmit" && $Para(gear) == "1x" && $Para($aligned) == "Centered" && $Para($num_int) == 1) ||
#		($Para($mode) == "Transmit" && $Para(gear) == "2x" && $Para($aligned) == "Centered" && $Para($num_int) > 1 && 
#		 $Para(Interface) == "GDDRX2_TX.PLL.Centered")}
	if {[string first "PLL" $Para(Interface)] != -1 ||
		$Para(Interface) == "GDDRX1_TX.SCLK.Centered" ||
		($Para(Interface) == "GDDRX2_TX.Aligned" && $Para(dev_type) == "EA") ||
		$Para(Interface) == "GDDRX2_RX.PLL.Dynamic"} {
		set ret [ValidFreq4]
		if {$ret == "-1"} {return -1}
	}
	set Para($freq_in) [string trimleft $Para($freq_in) 0]
	set ret [IsInRange "Clock Frequency" 2 500 $Para($freq_in)]
	if {$ret == "-1"} {return -1}
	
	if {[string length $Para(Multiplier)] == 0 || $Para(Multiplier) == "-"} {
		set msg "Please input Clock Multiplier!"
		tk_messageBox -default ok -icon info -message $msg -title CheckParameter -type ok
		return -1
	}
	if {$Para(Multiplier) < 0} {
		set msg "Clock Multiplier must be positive integer!"
		tk_messageBox -default ok -icon info -message $msg -title CheckParameter -type ok
		return -1
	}
	if {[.entryMultiplier cget -state] == "normal"} {
		set ret [IsInRange "PLL Input Clock Frequency" 2 500 $Para(PllFreq)]
		if {$ret == "-1"} {return -1}
	}
	
	if {$Para($aligned) == "Dynamic Data Phase Alignment Required" ||
		$Para($aligned) == "Dynamic Clock Phase Alignment Required"} {
		if {$Para(gear) != "2x"} {
			set msg "$Para($aligned) is only provided with interfaces with X2 gearing."
			tk_messageBox -default ok -icon info -message $msg -title CheckParameter -type ok
			return -1
		}
	}
	
	if {$Para(Interface) == "GDDRX1_TX.DQS.Centered" || $Para(Interface) == "GDDRX2_TX.DQSDLL.Centered"} {
		if {$Para($io_type) == "LVDS25"} {
			set msg "LVDS25 is not supported for GDDRX1_TX.DQS.Centered and GDDRX2_TX.DQSDLL.Centered."
			tk_messageBox -default ok -icon info -message $msg -title CheckParameter -type ok
			return -1
		}
	}

	if {$Para(Interface) == "GDDRX2_TX.Aligned" || $Para(Interface) == "GDDRX2_TX.PLL.Centered"} {
		set io_type_lst {LVDS25 BLVDS25 MLVDS MINILVDS PPLVDS LVDS25E}
		if {[lsearch $io_type_lst $Para($io_type)] != -1} {
			set msg "It will be required to determine the number of LVDS output pins available in a DQS group when using\n\
LVDS I/O Standard for the GDDRX2_TX.Aligned and GDDRX2_TX.PLL.Centered Transmit interfaces.\n\
Please refer to the Generic DDR Design Guidelines section of the High Speed I/O Interface User's Guide\n\
(TN1180) for more information."
			tk_messageBox -default ok -icon info -message $msg -title CheckParameter -type ok
			#return -1
		}
	}
	
	if {[string first "DQS" $Para(Interface)] != -1} {
		set ret [ValidFreq8]
		if {$ret == "-1"} {return -1}
	}
	
	return 0
}

# Command Line for ecp3 device
proc ECP3CmdLine {}  {
	global Para
	
	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
		set trioddr trioddr
		set io_type io_type
		set width width
		set freq_in freq_in
		set num_int num_int
		set aligned aligned
	} else {
		set mode mode2
		set trioddr trioddr2
		set io_type io_type2
		set width width2
		set freq_in freq_in2
		set num_int num_int2
		set aligned aligned2
	}
	if {[string length $Para($mode)] == 0 || [string length $Para($io_type)] == 0 ||
		[string length $Para($num_int)] == 0 || [string length $Para($width)] == 0 ||
		[string length $Para($freq_in)] == 0 || [string length $Para($aligned)] == 0} {
		set str "-arch $Para(arch) -type iol -mode in -io_type LVCMOS25 -width 10 -freq_in 200 -gear 1 -aligned"
		return $str
	}
	
	set str "-arch $Para(arch) -type iol"
	switch $Para($mode) {
	"Receive"          { lappend str -mode in }
	"Transmit"         { lappend str -mode out }
	}
	if {$Para($trioddr) == "1"} {lappend str -trioddr}
	
	lappend str -io_type $Para($io_type) -width $Para($width) -freq_in $Para($freq_in) 
	
	switch $Para(gear) {
	""           { lappend str -gear 0 }
	"1x"         { lappend str -gear 1 }
	"2x"         { lappend str -gear 2 }
	}
	
	if {$Para(Interface) == "GDDRX1_RX.SCLK.PLL.Aligned"} {
		lappend str -clk pll
	} else {
		if {$Para(Interface) == "GDDRX2_TX.Aligned"} {
			lappend str -clk eclk
		} else {
			if {$Para(Interface) == "GDDRX2_TX.DQSDLL.Centered"} {
				lappend str -clk dqs
			} else {
				if {[string length $Para(Interface)] > 0} {
					set i_lst [split $Para(Interface) '.']
					lappend str -clk [string tolower [lindex $i_lst 1]]
				}
			}
		}
	}

	if {$Para($aligned) == "Edge-to-Edge"} {lappend str -aligned}
	if {$Para($aligned) == "Dynamic Data Phase Alignment Required" ||
		$Para($aligned) == "Dynamic Clock Phase Alignment Required"} {lappend str -del 16}

	if {$Para(Number) > 1 && $Para(Number) < 9} {
		for {set i 1} {$i <= $Para(Number)} {incr i} {
			lappend str -dqs $i $Para(dqs$i)
		}
	}
	switch $Para(val) {
	"BYPASS"    { lappend str -del -1 }
	"DEL1"	    { lappend str -del 1 }
	"DEL2"	    { lappend str -del 2 }
	"DEL3"	    { lappend str -del 3 }
	"DEL4"	    { lappend str -del 4 }
	"DEL5"	    { lappend str -del 5 }
	"DEL6"	    { lappend str -del 6 }
	"DEL7"	    { lappend str -del 7 }
	}
	
	if {$Para(Interface) == "GDDRX2_RX.ECLK.Aligned" && $Para(Divider) == "CLKDIVB"} {
		lappend str -cdiv
	}

	if {$Para(Interface) == "GDDRX2_TX.Aligned" || $Para(Interface) == "GDDRX2_TX.PLL.Centered"} {
		lappend str -num_clk $Para(Multiplier)
	}
	
	GetDevType
	if {$Para(dev_type) == "E"} {lappend str -dev_e}

	return $str
} 

proc ExtraMsgCB {} {
	global Para
	set msg "Note: DDR intefaces require specific clock and data placement to achieve optimal performance. Please consult\n \
the LatticeECP3 High-Speed I/O Interface User's Guide for information on clock and data pin placement as well as\n \
timing constraints."
	append Para(msg) "\n$msg\n"
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para
	
	set str [ECP3CmdLine ]

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 480 570
	set pin_flag 1
	DrawImage 220 450 

	GetDevType
	
	set tnb $Para(tnb)
	set Para(bus_width_changed_flag) 0

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Pre-Configuration"]

	iwidgets::labeledframe .setframe
	set setframe [.setframe childsite]

	set w 32
	CreateLabelCombobox $setframe mode "Interface Type" $w 16 Para(mode) {Transmit Receive} {ChangeValueCmd}
	.lblmode config -anchor w

	checkbutton .cbtrioddr -text "Enable Tri-state Control" -variable Para(trioddr) -command {ChangeValueCmd}
	pack .cbtrioddr -in $setframe -anchor w -padx 10
	
	set io_type_lst {LVCMOS25 LVCMOS18 LVCMOS15 LVCMOS12 LVCMOS33 LVCMOS33D LVDS25 BLVDS25 MLVDS LVPECL33 \
		HSTL18_I HSTL18_II HSTL18D_I HSTL18D_II HSTL15_I HSTL15D_I SSTL33_I SSTL33_II SSTL33D_I SSTL33D_II SSTL25_I SSTL25_II \
		SSTL25D_I SSTL25D_II SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II SSTL15 SSTL15D PCI33 LVTTL33}
	CreateLabelCombobox $setframe io_type "I/O Standard for this Interface" $w 16 Para(io_type) $io_type_lst {ChangeValueCmd}
	.lblio_type config -anchor w

	CreateLabelEntryLabel $setframe num_int "Number of these interfaces \non a side of a device" 8 "(1 - 8)" "" Para(num_int) {digit %c}
	.entrynum_int config -fixed 2
	.lblnum_int config -width $w -anchor w
	.entrynum_int.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

	CreateLabelEntryLabel $setframe width "Bus Width for this Interface" 12 "(1 - 256)" "" Para(width) {digit %c}
	.entrywidth config -fixed 4
	.lblwidth config -width $w -anchor w
	.entrywidth.lwchildsite.entry config -validate key -vcmd {
			after idle {
				set Para(bus_width_changed_flag) 1
				ChangeValueCmd
			}
			return 1
		}
	
	CreateLabelEntryLabel $setframe freq_in "Clock Frequency for this Interface" 12 "(2 - 500MHz)" "" Para(freq_in) real
	.lblfreq_in config -width $w -anchor w
	.entryfreq_in.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

	CreateLabelEntryLabel $setframe bandwidth "Interface Bandwidth (Calculated)" 12 "Mbits/s" "" Para(bandwidth) real
	.lblbandwidth config -width $w -anchor w
	.entrybandwidth config -state disabled

#	set aligned_lst {Edge-to-Edge Centered "Dynamic Data Phase Alignment Required" "Dynamic Clock Phase Alignment Required"}
	set aligned_lst {Edge-to-Edge Centered}
	CreateLabelCombobox $setframe aligned "Clock to Data Relationship at the Pins" $w 34 Para(aligned) $aligned_lst {ChangeValueCmd}
	.lblaligned config -anchor w
	
	pack .setframe -in $page -fill both -expand 1

	#"Configuration"
	set page2 [$tnb add -label "Configuration"]

	iwidgets::labeledframe .frmConfig -labeltext "" -labelpos nw
	set frmConfig [.frmConfig childsite]
	
	checkbutton .ckpre-configuration -text "Interface selection based on pre-configuration" -variable Para(pre-configuration) -offvalue DISABLED -onvalue ENABLED -command ChangeValueCmd
	pack .ckpre-configuration -in $frmConfig -side top -anchor w -padx 10 -pady 4

	set w 20
	CreateLabelCombobox $frmConfig mode2 "Interface Type" $w 22 Para(mode2) {Transmit Receive} {ChangeValueCmd}
	.lblmode2 config -anchor w

	checkbutton .cbtrioddr2 -text "Enable Tri-state Control" -variable Para(trioddr2) -command {ChangeValueCmd}
	pack .cbtrioddr2 -in $frmConfig -anchor w -padx 10

	CreateLabelCombobox $frmConfig io_type2 "I/O Standard" $w 22 Para(io_type2) $io_type_lst {ChangeValueCmd}
	.lblio_type2 config -anchor w

	CreateLabelEntryLabel $frmConfig freq_in2 "Clock Frequency" 12 "(2 - 500MHz)" "" Para(freq_in2) real
	.lblfreq_in2 config -width $w -anchor w
	.entryfreq_in2.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

	CreateLabelCombobox $frmConfig gear "Gearing Ratio" $w 16 Para(gear) {1x 2x} {ChangeValueCmd}
	.lblgear config -anchor w
	
	CreateLabelCombobox $frmConfig aligned2 "Alignment" $w 34 Para(aligned2) $aligned_lst {ChangeValueCmd}
	.lblaligned2 config -anchor w

	CreateLabelEntryLabel $frmConfig num_int2 "Number of interfaces" 8 "(1 - 8)" "" Para(num_int2) {digit %c}
	.entrynum_int2 config -fixed 2
	.lblnum_int2 config -width $w -anchor w
	.entrynum_int2.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

	CreateLabelEntryLabel $frmConfig width2 "Bus Width" 12 "(1 - 256)" "" Para(width2) {digit %c}
	.entrywidth2 config -fixed 4
	.lblwidth2 config -width $w -anchor w
	.entrywidth2.lwchildsite.entry config -validate key -vcmd {
			after idle {
				set Para(bus_width_changed_flag) 1
				ChangeValueCmd
			}
			return 1
		}
		
	frame .frmAdditional
	iwidgets::combobox .cboPhase -labeltext "Phase Adjust" -textvariable Para(Phase) -width 16 -editable false -selectioncommand {ChangeValueCmd}
	.cboPhase.label config -width 20 -anchor w
	.cboPhase insert list end TRDLLB/DLLDELB PLL
	iwidgets::combobox .cboDivider -labeltext "Clock Divider" -textvariable Para(Divider) -width 12 -editable false -selectioncommand {ChangeValueCmd}
	.cboDivider insert list end CLKDIVB TRDLLB
	iwidgets::entryfield .entryMultiplier -labeltext "Input Clock Multiplier" -textvariable Para(Multiplier) -labelpos w -width 12 -fixed 4 -validate integer
	.entryMultiplier.label config -width 20 -anchor w
	iwidgets::entryfield .entryPllFreq -labeltext "PLL Input Clock Frequency" -textvariable Para(PllFreq) -labelpos w -width 12 -state disabled -disabledforeground black -validate integer
	label .lblPllFreq -text "(2 - 500MHz)"
	.entryMultiplier.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	
	grid .cboPhase .cboDivider -in .frmAdditional -sticky w -pady 2
	grid .entryMultiplier -in .frmAdditional -sticky w
	grid .entryPllFreq .lblPllFreq -in .frmAdditional -sticky w -padx 10 -pady 2
	pack .frmAdditional -in $frmConfig -anchor w -padx 7

	CreateLabelCombobox $frmConfig Interface "Interface" $w 30 Para(Interface) {Transmit Receive} {ChangeValueCmd}
	.lblInterface config -anchor w

	set io_type_lst {Bypass Fixed Dynamic}
	CreateLabelCombobox $frmConfig Delay "Data Path Delay" $w 16 Para(Delay) $io_type_lst {ChangeValueCmd}
	pack .frmDelay -in $frmConfig -anchor w -padx 30
	.lblDelay config -anchor w

	#DQS Grouping
	iwidgets::labeledframe .frmDQSGrouping -labeltext "DQS Grouping" -labelpos nw
	set frmDQSGrouping [.frmDQSGrouping childsite]
	CreateLabelCombobox $frmDQSGrouping Number "Number of DQS" 16 8 Para(Number) {1 2 3 4 5 6 7 8} {ChangeValueCmd}
	.lblNumber config -anchor w
	pack .frmNumber -in $frmDQSGrouping -side top -anchor center
	
	frame .frame0
	frame .frmLeft
	CreateLabelCombobox .frmLeft dqs1 "DQS Group1" 16 5 Para(dqs1) {1 2 3 4 5 6 7 8} {ChangeValueCmd}
	CreateLabelCombobox .frmLeft dqs2 "DQS Group2" 16 5 Para(dqs2) {1 2 3 4 5 6 7 8} {ChangeValueCmd}
	CreateLabelCombobox .frmLeft dqs3 "DQS Group3" 16 5 Para(dqs3) {1 2 3 4 5 6 7 8} {ChangeValueCmd}
	CreateLabelCombobox .frmLeft dqs4 "DQS Group4" 16 5 Para(dqs4) {1 2 3 4 5 6 7 8} {ChangeValueCmd}
	.lbldqs1 config -anchor w
	.lbldqs2 config -anchor w
	.lbldqs3 config -anchor w
	.lbldqs4 config -anchor w
	frame .frmRight
	CreateLabelCombobox .frmRight dqs5 "DQS Group5" 16 5 Para(dqs5) {1 2 3 4 5 6 7 8} {ChangeValueCmd}
	CreateLabelCombobox .frmRight dqs6 "DQS Group6" 16 5 Para(dqs6) {1 2 3 4 5 6 7 8} {ChangeValueCmd}
	CreateLabelCombobox .frmRight dqs7 "DQS Group7" 16 5 Para(dqs7) {1 2 3 4 5 6 7 8} {ChangeValueCmd}
	CreateLabelCombobox .frmRight dqs8 "DQS Group8" 16 5 Para(dqs8) {1 2 3 4 5 6 7 8} {ChangeValueCmd}
	.lbldqs5 config -anchor w
	.lbldqs6 config -anchor w
	.lbldqs7 config -anchor w
	.lbldqs8 config -anchor w
	pack .frmLeft .frmRight -in .frame0 -side left -padx 8
	pack .frame0 -in $frmDQSGrouping -side top -fill x
	
	pack .frmDQSGrouping -in $frmConfig -fill x
	
	set del_lst {BYPASS DEL1 DEL2 DEL3 DEL4 DEL5 DEL6 DEL7}
	CreateLabelCombobox $frmConfig val "ISI Calibration" $w 12 Para(val) $del_lst {ChangeValueCmd}
	.lblval config -anchor w

	pack .frmConfig -in $page2 -fill both -expand 1

	$tnb delete 0

	$tnb view 0

	GeneralConfig

	ChangeValueCmd

	pack forget .cboBusOrder 

	$Para(generate_cfg) configure -state disabled
	#46359-regenerate LPC file to enable generate button.
	if {$Para(new) == 0} {
		$Para(generate_cfg) configure -state normal
	}
}
