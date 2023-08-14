#$Header: L:/module/ddr_generic/machxo2/gui/core_template.tcl 1.31 mghuang Exp $
#xo2+pojo2+xo3l

#Rev 1.31: Diamond 3.4.1 IPExpress: XO3LF support
#Rev 1.30: Diamond 3.3 IPExpress: Fixed SOF-122024
#Rev 1.29: Diamond 3.3 IPExpress: XO3L SCR_1005,1008
#Rev 1.28: Diamond 3.2 IPExpress: XO3L SCR_1002
#Rev 1.26: Diamond 3.1 IPExpress: Fixed SOF-119587
#Rev 1.25: Diamond 3.1 IPExpress: Fixed SOF-118945
#Rev 1.24: Diamond 3.1 IPExpress: Fixed SOF-118791
#Rev 1.23: Diamond 3.1 IPExpress: XO3 support
#Rev 1.22: Diamond 3.0 IPExpress: Fixed SOF-117301, MachXO2_SysFunction_Usage_Model_v2.40_08_05_13
#Rev 1.21: Diamond 2.1 IPExpress: Fixed cr_57356, um v2.38
#Rev 1.20: Diamond 1.3 IPExpress: Fixed cr_53273
#Rev 1.17,1.19: Diamond 1.2 IPExpress: Fixed CR_52545
#Rev 1.16: Diamond 1.2 IPExpress: sysFunction UM v2.36
#Rev 1.15: UB1_2 IPExpress: Remove Rev 1.14 based on sysFunction UM v2.35.
#Rev 1.14: UB1_2 IPExpress: XO2 WLCSP support

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para pin_flag

	if {$Para(pre-configuration) == "ENABLED"} {
		set width width
		set freq_in freq_in
	} else {
		set width width2
		set freq_in freq_in2
	}
	
	if {[string length $Para($width)] == 0 || $Para($width) < 1} {return}
	if {[string length $Para($freq_in)] == 0 || [string length $Para($freq_in)] > 3} {return}
	
	if {$Para(GenPll) == "1"} {
		if {$Para($freq_in) < 10} {return}
	} else {
		if {$Para($freq_in) < 1} {return}
	}
	
	DrawPins
} 

proc GetDevType {} {
	global Para

	if {$Para(arch) == "xo2c00" || $Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
		regexp {(^[a-zA-Z0-9]+)-([0-9]+)?(.*)$} $Para(PartType) match x y z
		set Para(dev_size) $y
		set Para(dev_type) $z
		#The XO3L only has HP parts.
		if {$Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {set Para(dev_type) "HP"}
	}
	if {$Para(arch) == "xo2c00p"} {
		set a [string range $Para(PartType) 5 5]
		switch $a {
			"0" {set y 640}
			"1" {set y 1200}
			"4" {set y 4000}
			"7" {set y 7000}
		}
		set Para(dev_size) $y
		set Para(dev_type) "HC"
	}
	set msg "family=$Para(family)\ntype=$Para(dev_type)\nsize=$Para(dev_size)"
	#tk_messageBox -default ok -icon info -message $msg -title GetDevType -type ok
}

proc SetGear {} {
	global Para
	if {$Para(freq_in) == ""} {
		set Para(gear) ""
	} else {
		if {$Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
			if {$Para(freq_in) <= "166"} {
				set Para(gear) "1x"
			} 
			if {$Para(freq_in) > "166" && $Para(freq_in) <= "266"} {
				set Para(gear) "2x"
			}
			if {$Para(freq_in) > "266"} {
				set Para(gear) "4x"
			} 
		} else {
			if {$Para(dev_type) != "ZE"} {
				if {$Para(freq_in) <= "150"} {
					set Para(gear) "1x"
				} 
				if {$Para(freq_in) > "150" && $Para(freq_in) <= "266"} {
					set Para(gear) "2x"
				}
				if {$Para(freq_in) > "266"} {
					set Para(gear) "4x"
				} 
			} else {
				if {$Para(freq_in) <= "70"} {
					set Para(gear) "1x"
				} 
				if {$Para(freq_in) > "70" && $Para(freq_in) <= "133"} {
					set Para(gear) "2x"
				}
				if {$Para(freq_in) > "133"} {
					set Para(gear) "4x"
				} 
			}
		}
	}
	
	#regexp {(^[a-zA-Z]+)2-([0-9]+)?.*$} $Para(PartType) match x y
	set y $Para(dev_size)
	if {$y == 256 || $y == 640}  {
		.cbogear clear list
		.cbogear insert list end 1x
		set Para(gear) 1x
	}
	if {$Para(mode) == "Transmit_MIPI" || $Para(mode) == "Receive_MIPI"} {
		set Para(gear) 4x
	}
}

proc SetInterface {} {
	global Para
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
		
###GDDRX2_RX.ECLK.Centered
	if {$Para($mode) == "Receive" || $Para($mode) == "Receive_MIPI"} {
		set m RX 
	} else {
		set m TX
	}
	set g [string index $Para(gear) 0]
	if {$g == "1"} {
		set c SCLK
	} else {
		set c ECLK
	}
	if {$Para($aligned) == "Edge-to-Edge"} {
		set a Aligned
	} else {
		set a Centered
	}
	set Para(Interface) GDDRX${g}_${m}.${c}.$a

	if {$Para(pre-configuration) == "ENABLED"} {
		.lblInterface config -state disabled
		.cboInterface config -state disabled
	} else {
		#.lblInterface config -state $enable_flag
		.cboInterface config -state normal
	}
}

proc SetDataPathDelay {} {
	global Para
	
	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
	} else {
		set mode mode2
	}

	if {$Para($mode) == "Receive" || $Para($mode) == "Receive_MIPI"} {
		.cboDelay config -state normal
	} else {
		.cboDelay config -state disabled
		set Para(Delay) "Bypass"
	}		
}

proc SetWidth {} {
	global Para
	
	if {$Para(pre-configuration) == "ENABLED"} {
		set num_int num_int
		set width width
		set freq_in freq_in
		set io_type io_type
	} else {
		set num_int num_int2
		set width width2
		set freq_in freq_in2
		set io_type io_type2
	}

	#CR_49952 
	if {$Para(gear) == "1x"} {
		.lbl2$width config -text "(1 - 128)"
	}
	if {$Para(gear) == "2x"} {
		.lbl2$width config -text "(1 - 32)"
	}
	if {$Para(gear) == "4x"} {
		.lbl2$width config -text "(1 - 21)"
	}
	if {$Para($num_int) > 1} {
		#set io_type_lst {LVDS25 BLVDS25 MLVDS LVCMOS33D BLVDS25 HSTL18D_I HSTL18D_II HSTL15D_I SSTL33D_I SSTL33D_II SSTL25D_I \
		#		   SSTL25D_II SSTL18D_I SSTL18D_II SSTL15D RSDS MINILVDS PPLVDS LVDS25E}
		#if {[lsearch $io_type_lst $Para($io_type)] != -1} {
		#	set Para(max_width) 5
		#	.lbl2$width config -text "(1 - 5)"
		#} else {
		#	set Para(max_width) 10
		#	.lbl2$width config -text "(1 - 10)"
		#}
	}
	if {[string length $Para($freq_in)] == 0 || $Para($freq_in) == "-" || [string length $Para($width)] == 0} {
		set Para(bandwidth) ""
	} else {
		if {$Para($width) == 0 || $Para($freq_in) == 0} {
			set Para(bandwidth) 0
		} else {
			set Para(bandwidth) [expr [string trimleft $Para($freq_in) 0]*2*[string trimleft $Para($width) 0]]
		}
	}
}

proc SetNumber {} {
	global Para

	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
		set num_int num_int
		set aligned aligned
	} else {
		set mode mode2
		set num_int num_int2
		set aligned aligned2
	}
	
	if {$Para($mode) == "Receive"} {
		if {$Para(gear) == "1x"} {
			set Para($num_int) 8
		} else {
			set Para($num_int) 2
		}
	} else {
		if {$Para(gear) == "1x"} {
			if {$Para($aligned) == "Edge-to-Edge"} {
				set Para($num_int) 8
			} else {
				set Para($num_int) 4
			}
		} else {
			if {$Para($aligned) == "Edge-to-Edge"} {
				set Para($num_int) 2
			} else {
				set Para($num_int) 1
			}
		}
	}
}

proc SetFreqIn {} {
	global Para
	#1-378MHz (for HP),1-210MHz (for LP)
	set Para(min_feq) 1
	if {$Para(dev_type) == "ZE"} {
		set Para(max_feq) 210
	} else {
		set Para(max_feq) 378
		if {$Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"}  {
			set Para(max_feq) 450
		}
	}
}

proc PopulatedFields {} {
	global Para
	
	#set cbo_lst {mode2 io_type2 gear aligned2 Interface Delay}
	set cbo_lst {mode2 io_type2 gear aligned2}
	set ent_lst {freq_in2 num_int2 width2}
	#Rev5.0 page118 note2.a
	#ii.1
	set p_lst {mode io_type freq_in num_int width aligned}
	foreach item $p_lst {
		set Para(${item}2) $Para($item)
	}
	set Para(trioddr2) $Para(trioddr)
	SetFreqIn
	.lbl2freq_in config -text "(1 - $Para(max_feq)MHz)"
	.lbl2freq_in2 config -text "(1 - $Para(max_feq)MHz)"
	#note 4
	SetGear
	#note 5
	SetWidth
	SetNumber
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

proc Config256_640Cmd {} {
	global Para
	
	#regexp {(^[a-zA-Z]+)2-([0-9]+)?.*$} $Para(PartType) match x y
	set y $Para(dev_size)
	if {$y == 256 || $y == 640}  {
		.cboaligned clear list
		.cboaligned2 clear list
		if {$Para(mode) == "Receive"} {
			.cboaligned insert list end "Centered"
			if {$Para(aligned) == "Edge-to-Edge"} {set Para(aligned) "Centered"}
		} else {
			.cboaligned insert list end "Edge-to-Edge"
			if {$Para(aligned) == "Centered"} {set Para(aligned) "Edge-to-Edge"}
		}
		if {$Para(mode2) == "Receive"} {
			.cboaligned2 insert list end "Centered"
			if {$Para(aligned2) == "Edge-to-Edge"} {set Para(aligned2) "Centered"}
		} else {
			.cboaligned2 insert list end "Edge-to-Edge"
			if {$Para(aligned2) == "Centered"} {set Para(aligned2) "Edge-to-Edge"}
		}
	} else {
		.cboaligned clear list
		.cboaligned2 clear list
		.cboaligned insert list end "Centered" "Edge-to-Edge"
		.cboaligned2 insert list end "Centered" "Edge-to-Edge"
	}
}

proc ChangeValueCmd {} {
	global Para

	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
	} else {
		set mode mode2
	}

		
	if {$Para($mode) == "Receive"} {
		if {$Para(arch) == "xo2c00" || $Para(arch) == "xo2c00p"} {
			set io_type_lst {LVDS25 RSDS25 BLVDS25 MLVDS25 LVPECL33 SSTL25_I SSTL25_II SSTL25D_I SSTL25D_II \
			SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II HSTL18_I HSTL18_II HSTL18D_I HSTL18D_II PCI33 \
			LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS25R33 LVCMOS18 LVCMOS18D LVCMOS18R33 LVCMOS18R25 \
			LVCMOS15 LVCMOS15D LVCMOS15R33 LVCMOS15R25 LVCMOS12 LVCMOS12D LVCMOS10R25 LVCMOS10R33 LVCMOS12R25 LVCMOS12R33 VREF1_DRIVER}
		}
		if {$Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
			set io_type_lst {LVDS25 BLVDS25 MLVDS25 LVPECL33 LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D \
			LVCMOS18 LVCMOS18D LVCMOS15 LVCMOS12 LVCMOS10R25 LVCMOS10R33 LVCMOS12R25 LVCMOS12R33}
		}
	} else {
		if {$Para(arch) == "xo2c00" || $Para(arch) == "xo2c00p"} {
			set io_type_lst {LVDS25 LVDS25E BLVDS25E MLVDS25E LVPECL33E RSDS25E HSTL18_I HSTL18D_I SSTL18_I \
			SSTL18D_I SSTL25_I PCI33 LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS18D LVCMOS15 \
			LVCMOS15D LVCMOS12 LVCMOS12D}
		}
		if {$Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
			set io_type_lst {LVDS25 LVDS25E BLVDS25E MLVDS25E LVPECL33E LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D \
			LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS18D LVCMOS15 LVCMOS12}
		}
	}
	
	#set cbo_lst {mode2 io_type2 gear aligned2 Interface Delay}
	set cbo_lst {mode2 io_type2 gear aligned2}
	set ent_lst {freq_in2 num_int2 width2}
	if {$Para(dev_type) == "ZE"} {
		set Para(max_feq) 210
	} else {
		set Para(max_feq) 378
		if {$Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"}  {
			set Para(max_feq) 450
		}
	}
	.lbl2freq_in config -text "(1 - $Para(max_feq)MHz)"
	.lbl2freq_in2 config -text "(1 - $Para(max_feq)MHz)"
	
	Config256_640Cmd

	if {$Para(pre-configuration) == "ENABLED"} {
		#pre-configuration == "ENABLED"
		.lblInterface config -state disabled
		.cboInterface config -state disabled
		.cboDelay config -state disabled
		.cboDelVal config -state disabled
		if {$Para(mode) == "Receive"} {
	#[XO2 R8.1SP1] SCR 1082 - Remove HSTL15
		} else {
	#[XO2 R8.1SP1] SCR 1082 - Remove HSTL15
		}
		
		if {$Para(mode) == "Transmit"} {
			.cbtrioddr config -state normal
		} else {
			set Para(trioddr) 0
			.cbtrioddr config -state disabled
		}
		if {$Para(mode) == "Transmit_MIPI" || $Para(mode) == "Receive_MIPI"} {
			.cbhighspeed config -state normal
			.cboio_type config -state disabled
			set Para(gear) "4x"
			.cboaligned clear list
			.cboaligned insert list end "Centered"
			set Para(aligned) "Centered"
		} else {
			set Para(highspeed) 0
			.cbhighspeed config -state disabled
			.cboio_type config -state normal
		}
		
		.cboio_type clear list
		foreach x $io_type_lst {
			.cboio_type insert list end $x
		}
		if {$Para(mode) == ""} {
			set Para(io_type) ""
		} else {		
			if {[lsearch $io_type_lst $Para(io_type)] ==-1} {set Para(io_type) LVCMOS25}
		}
		
		.cbtrioddr2 config -state disabled
		.cbhighspeed2 config -state disabled
		if {[string length $Para(mode)] == 0 || [string length $Para(io_type)] == 0 ||
			[string length $Para(width)] == 0 ||
			[string length $Para(freq_in)] == 0 || [string length $Para(aligned)] == 0} {
			set Para(trioddr2) 0
			set Para(highspeed2) 0
			foreach item $cbo_lst {
				.lbl$item config -state disabled
				.cbo$item config -state disabled
				set Para($item) ""
			}
			set Para(Interface) ""
			set Para(Delay) ""
			foreach item $ent_lst {
				.lbl$item   config -state disabled
				.entry$item config -state disabled
				.lbl2$item  config -state disabled
				set Para($item) ""
			}
			$Para(generate_cfg) configure -state disabled
		} else {
			PopulatedFields
			.lblInterface config -state normal
			.cboInterface config -state normal
			if {[string length $Para(Delay)] == 0} {set Para(Delay) "Predefined"}
			$Para(generate_cfg) configure -state normal
		}
	} else {
		#pre-configuration == "DISABLED"
		.lblInterface config -state normal
		.cboInterface config -state normal
		.cboDelay config -state normal
		if {$Para(mode2) == "Receive"} {
	#[XO2 R8.1SP1] SCR 1082 - Remove HSTL15
		} else {
	#[XO2 R8.1SP1] SCR 1082 - Remove HSTL15
		}
		
		if {$Para(mode2) == "Transmit"} {
			.cbtrioddr2 config -state normal
		} else {
			set Para(trioddr2) 0
			.cbtrioddr2 config -state disabled
		}
		
		.cboio_type2 clear list
		foreach x $io_type_lst {
			.cboio_type2 insert list end $x
		}
		if {[lsearch $io_type_lst $Para(io_type2)] ==-1} {set Para(io_type2) LVCMOS25}

		if {[$Para(generate_cfg) cget -state] == "disabled"} {
			if {[string length $Para(mode2)] == 0} {set Para(mode2) "Receive"}
			if {[string length $Para(io_type2)] == 0} {set Para(io_type2) "LVCMOS25"}
			if {[string length $Para(freq_in2)] == 0} {
				if {$Para(dev_type) != "ZE"} {
					set Para(freq_in2) "200"
				} else {
					set Para(freq_in2) "100"
				}
			}
			if {[string length $Para(gear)] == 0} {set Para(gear) "1x"}
			if {[string length $Para(aligned2)] == 0} {set Para(aligned2) "Edge-to-Edge"}
			if {[string length $Para(num_int2)] == 0} {set Para(num_int2) "1"}
			if {[string length $Para(width2)] == 0} {set Para(width2) "4"}
			if {[string length $Para(Interface)] == 0} {
				set Para(Interface) "GDDRX1_RX.SCLK.Aligned"
			}
			if {[string length $Para(Delay)] == 0} {set Para(Delay) "Predefined"}
			
			#***Config256_640
			#regexp {(^[a-zA-Z]+)2-([0-9]+)?.*$} $Para(PartType) match x y
			set y $Para(dev_size)
			if {$y == 256 || $y == 640}  {
				.cbogear clear list
				.cbogear insert list end 1x
				set Para(gear) 1x
			}
			
			$Para(generate_cfg) configure -state normal
		} else {
			#PopulatedFields
		}

		foreach item $cbo_lst {
			.lbl$item config -state normal
			.cbo$item config -state normal
		}
		foreach item $ent_lst {
			.lbl$item   config -state normal
			if {$item != "num_int2"} {.entry$item config -state normal}
			.lbl2$item  config -state normal
		}
		if {$Para(mode2) == "Transmit_MIPI" || $Para(mode2) == "Receive_MIPI"} {
			.cbhighspeed2 config -state normal
			.cboio_type2 config -state disabled
			.cboaligned2 clear list
			.cboaligned2 insert list end "Centered"
			set Para(aligned2) "Centered"
			.cbogear clear list
			.cbogear insert list end "4x"
			set Para(gear) "4x"
		} else {
			set Para(highspeed2) 0
			.cbhighspeed2 config -state disabled
			.cboio_type2 config -state normal
		}

		#CR_49952 
		if {$Para(gear) == "1x"} {
			.lbl2width2 config -text "(1 - 128)"
		}
		if {$Para(gear) == "2x"} {
			.lbl2width2 config -text "(1 - 32)"
		}
		if {$Para(gear) == "4x"} {
			.lbl2width2 config -text "(1 - 21)"
		}
		SetNumber
		SetInterface
		SetDataPathDelay
	}
#	if {$Para(Interface) == "GDDRX1_RX.SCLK.Aligned"} {
#		.cbUsePll config -state normal
#	} else {
#		.cbUsePll config -state disabled
#		set Para(UsePll) 0
#	}
#	if {$Para(Interface) == "GDDRX1_RX.SCLK.Aligned" ||}
	if {$Para(Interface) == "GDDRX1_TX.SCLK.Centered" ||
		$Para(Interface) == "GDDRX2_TX.ECLK.Centered" ||
		$Para(Interface) == "GDDRX4_TX.ECLK.Centered"} {
		.cbGenPll config -state normal
	} else {
		.cbGenPll config -state disabled
		set Para(GenPll) 0
	}
	
	if {[.cboDelay cget -state] == "normal" && $Para(Delay) == "User defined"} {
		.cboDelVal config -state normal
		if {$Para(DelVal) == ""} {set Para(DelVal) DELAY0}
	} else {
		.cboDelVal config -state disabled
		set Para(DelVal) ""
	}

	#v2.31_09-09-10
	#if {$Para(GenPll) == "1"} {
	#	if {[.cbUsePll cget -state] == "normal"} {
	#		set Para(UsePll) 1
	#	}
	#}
	
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
	
	set Para($width) [string trimleft $Para($width) 0]
	#CR_49952 
	if {$Para(gear) == "1x"} {
		set max_width 128
	}
	if {$Para(gear) == "2x"} {
		set max_width 32
	}
	if {$Para(gear) == "4x"} {
		set max_width 21
	}
	set ret [IsInRange "Bus Width" 1 $max_width $Para($width)]
	if {$ret == "-1"} {return -1}

	#1-378MHz (for HP),1-210MHz (for LP)
	set Para($freq_in) [string trimleft $Para($freq_in) 0]
	set min 1
	#cr_49464 
	if {$Para(GenPll) == "1"} {
		set min 10
	} 
#	if {$Para(dev_type) == "ZE"} {
		set ret [IsInRange "Clock Frequency" $min $Para(max_feq) $Para($freq_in)]
#	} else {
#		set ret [IsInRange "Clock Frequency" $min 378 $Para($freq_in)]
#	}
	if {$ret == "-1"} {return -1}
	
	#CR_51233
	if {$Para(gear) == "1x" && $Para($mode) == "Receive" && $Para(Delay) == "Dynamic"} {
		set msg "Dynamic Delay is not available for x1 receive interfaces. Use Bypass, Predefined, or User defined for x1 receive interfaces."
		tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		return -1
	}
	
	#XO2 WLCSP support
#	if {[string first "WLCSP" $Para(Package)] != -1} {
#		if {$Para(gear) == "4x"} {
#			set msg "GDDRX4 interfaces are not available on WLCSP package."
#			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
#			return -1
#		}
#	}
	
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
	
	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
		set trioddr trioddr
		set highspeed highspeed
		set io_type io_type
		set width width
		set freq_in freq_in
		set num_int num_int
		set aligned aligned
	} else {
		set mode mode2
		set trioddr trioddr2
		set highspeed highspeed2
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
	"Receive_MIPI"		-
	"Receive"          { lappend str -mode in }
	"Transmit_MIPI"		-
	"Transmit"         { lappend str -mode out }
	}
	
	if {$Para($mode) == "Transmit_MIPI" || $Para($mode) == "Receive_MIPI"} {
		if {$Para($highspeed) == "1"} {
			lappend str -io_type MIPI
		} else {
			lappend str -io_type MIPI_LP
		}
	} else {
		lappend str -io_type $Para($io_type)
	}
	lappend str -width $Para($width) -freq_in $Para($freq_in) 
	
	if {$Para($trioddr) == "1"} {lappend str -trioddr}
	switch $Para(gear) {
	""           { lappend str -gear 0 }
	"1x"         { lappend str -gear 1 }
	"2x"         { lappend str -gear 2 }
	"4x"         { lappend str -gear 4 }
	}
	
	#48453
	if {$Para(GenPll) == 1} {
		lappend str -clk pll
	} else {
#		if {$Para(gear) == "1x"} {
#			lappend str -clk sclk
#		} else {
#			lappend str -clk eclk
#		}
		if {[string length $Para(Interface)] > 0} {
			if {$Para(Interface) == "GDDRX1_RX.SCLK.Aligned"} {
				#CR_49822, -clk dqs
				#if {$Para(UsePll) == 0} {lappend str -clk dqs}
				#cr_53273
				lappend str -clk dqs
			} else {
				set i_lst [split $Para(Interface) '.']
				lappend str -clk [string tolower [lindex $i_lst 1]]
			}
		}
	}

	if {$Para($aligned) == "Edge-to-Edge"} {lappend str -aligned}

	switch $Para(Delay) {
	"Bypass"          { lappend str -del -1 }
	"Predefined"      { lappend str -del 32 }
	"User defined"    { lappend str -del [string range $Para(DelVal) 5 end] }
	"Dynamic"         { lappend str -del 64 }
	}

#	if {$Para(Interface) == "GDDRX1_RX.SCLK.Aligned"} {
		#CR_49822, -clk dqs
#		if {$Para(UsePll) == 0} {lappend str -clk dqs}
#	}

#	GetDevType
#	if {$Para(dev_type) == "E"} {lappend str -dev_e}

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 460 490
	set pin_flag 1
	DrawImage 270 400 

	GetDevType
	
	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Pre-Configuration"]

	iwidgets::labeledframe .setframe
	set setframe [.setframe childsite]

	set w 32
	set mode_lst {Transmit Receive Transmit_MIPI Receive_MIPI}
	CreateLabelCombobox $setframe mode "Interface Type" $w 16 Para(mode) $mode_lst {ChangeValueCmd}
	.lblmode config -anchor w

	checkbutton .cbtrioddr -text "Enable Tri-state Control" -variable Para(trioddr) -command {ChangeValueCmd}
	pack .cbtrioddr -in $setframe -anchor w -padx 10	
	
	checkbutton .cbhighspeed -text "Enable MIPI High Speed Mode Only" -variable Para(highspeed) -command {ChangeValueCmd}
	pack .cbhighspeed -in $setframe -anchor w -padx 10
	
	#[XO2 R8.1SP1] SCR 1082 - Remove HSTL15
#	set io_type_lst {LVDS25 RSDS25 BLVDS25 MLVDS25 LVPECL33 SSTL25_I SSTL25_II SSTL25D_I SSTL25D_II SSTL18_I SSTL18_II \
#		SSTL18D_I SSTL18D_II HSTL18_I HSTL18_II HSTL18D_I HSTL18D_II HSTL15_I HSTL15_II HSTL15D_I HSTL15D_II PCI33 \
#		LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS25R33 LVCMOS18 LVCMOS18D LVCMOS18R33 LVCMOS18R25 \
#		LVCMOS15 LVCMOS15D LVCMOS15R33 LVCMOS15R25 LVCMOS12 LVCMOS12D VREF1_DRIVER}
#	set output_list {LVDS25 LVDS25E BLVDS25E MLVDS25E LVPECL33E RSDS25E HSTL15_I HSTL15D_I HSTL18_I HSTL18D_I SSTL18_I \
#		SSTL18D_I SSTL25_I PCI33 LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS18D LVCMOS15 \
#		LVCMOS15D LVCMOS12 LVCMOS12D}
	set io_type_lst {LVDS25 RSDS25 BLVDS25 MLVDS25 LVPECL33 SSTL25_I SSTL25_II SSTL25D_I SSTL25D_II SSTL18_I SSTL18_II \
		SSTL18D_I SSTL18D_II HSTL18_I HSTL18_II HSTL18D_I HSTL18D_II PCI33 \
		LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS25R33 LVCMOS18 LVCMOS18D LVCMOS18R33 LVCMOS18R25 \
		LVCMOS15 LVCMOS15D LVCMOS15R33 LVCMOS15R25 LVCMOS12 LVCMOS12D LVCMOS10R25 LVCMOS10R33 LVCMOS12R25 LVCMOS12R33 VREF1_DRIVER}
	set output_list {LVDS25 LVDS25E BLVDS25E MLVDS25E LVPECL33E RSDS25E HSTL18_I HSTL18D_I SSTL18_I \
		SSTL18D_I SSTL25_I PCI33 LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS18D LVCMOS15 \
		LVCMOS15D LVCMOS12 LVCMOS12D}
	CreateLabelCombobox $setframe io_type "I/O Standard for this Interface" $w 20 Para(io_type) $io_type_lst {ChangeValueCmd}
	.lblio_type config -anchor w

	CreateLabelEntryLabel $setframe freq_in "Clock Frequency for this Interface" 12 "(1 - 210MHz)" "" Para(freq_in) real
	.lblfreq_in config -width $w -anchor w
	.entryfreq_in.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

	CreateLabelEntryLabel $setframe width "Bus Width for this Interface" 12 "" "" Para(width) {digit %c}
	.lblwidth config -width $w -anchor w
	.entrywidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entrywidth config -fixed 3
	
	CreateLabelEntryLabel $setframe num_int "Number of this interface" 8 "(1 - 8)" "" Para(num_int) integer
	.lblnum_int config -width $w -anchor w
	.entrynum_int config -state disabled

	CreateLabelEntryLabel $setframe bandwidth "Interface Bandwidth (Calculated)" 12 "Mbits/s" "" Para(bandwidth) real
	.lblbandwidth config -width $w -anchor w
	.entrybandwidth config -state disabled

	set aligned_lst {Edge-to-Edge Centered}
	CreateLabelCombobox $setframe aligned "Clock to Data Relationship at the Pins" $w 30 Para(aligned) $aligned_lst {ChangeValueCmd}
	.lblaligned config -anchor w
	
	pack .setframe -in $page -fill both -expand 1

	#"Configuration"
	set page2 [$tnb add -label "Configuration"]

	iwidgets::labeledframe .frmConfig -labeltext "" -labelpos nw
	set frmConfig [.frmConfig childsite]
	
	checkbutton .ckpre-configuration -text "Interface selection based on pre-configuration" -variable Para(pre-configuration) -offvalue DISABLED -onvalue ENABLED -command ChangeValueCmd
	pack .ckpre-configuration -in $frmConfig -side top -anchor w -padx 10 -pady 4

	set w 20
	CreateLabelCombobox $frmConfig mode2 "Interface Type" $w 22 Para(mode2) $mode_lst {ChangeValueCmd}
	.lblmode2 config -anchor w

	checkbutton .cbtrioddr2 -text "Enable Tri-state Control" -variable Para(trioddr2) -command {ChangeValueCmd}
	pack .cbtrioddr2 -in $frmConfig -anchor w -padx 10
	
	checkbutton .cbhighspeed2 -text "Enable MIPI High Speed Mode Only" -variable Para(highspeed2) -command {ChangeValueCmd}
	pack .cbhighspeed2 -in $frmConfig -anchor w -padx 10
	
	CreateLabelCombobox $frmConfig io_type2 "I/O Standard" $w 22 Para(io_type2) $io_type_lst {ChangeValueCmd}
	.lblio_type2 config -anchor w

	CreateLabelEntryLabel $frmConfig freq_in2 "Clock Frequency" 12 "(1 - 210MHz)" "" Para(freq_in2) real
	.lblfreq_in2 config -width $w -anchor w
	.entryfreq_in2.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

	CreateLabelCombobox $frmConfig gear "Gearing Ratio" $w 16 Para(gear) {1x 2x 4x} {ChangeValueCmd}
	.lblgear config -anchor w
	
	CreateLabelCombobox $frmConfig aligned2 "Alignment" $w 30 Para(aligned2) $aligned_lst {ChangeValueCmd}
	.lblaligned2 config -anchor w

	CreateLabelEntryLabel $frmConfig width2 "Bus Width" 12 "" "" Para(width2) {digit %c}
	.lblwidth2 config -width $w -anchor w
	.entrywidth2.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entrywidth2 config -fixed 3

	CreateLabelEntryLabel $frmConfig num_int2 "Number of interfaces" 8 "(1 - 8)" "" Para(num_int2) integer
	.lblnum_int2 config -width $w -anchor w
	.entrynum_int2 config -state disabled

	iwidgets::labeledframe .frmGroup -labelpos nw
	set frmGroup [.frmGroup childsite]
	CreateLabelCombobox $frmGroup Interface "Interface" $w 30 Para(Interface) {} {ChangeValueCmd}
	.lblInterface config -width 18 -anchor w

	frame .frmDelay
	set io_type_lst {Bypass Predefined "User defined" Dynamic}
#	CreateLabelCombobox $frmGroup Delay "Data Path Delay" $w 16 Para(Delay) $io_type_lst {ChangeValueCmd}
#	pack .frmDelay -in $frmGroup -anchor w -padx 30
#	.lblDelay config -anchor w
	#label .lblDelay -text "Data Path Delay" -anchor w
	iwidgets::combobox .cboDelay -labeltext "Data Path Delay" -labelpos w -width 16 -textvariable Para(Delay) -editable false -selectioncommand ChangeValueCmd
	.cboDelay insert list end Bypass Predefined "User defined" Dynamic
	iwidgets::combobox .cboDelVal -labeltext "" -labelpos w -width 12 -textvariable Para(DelVal) -editable false -selectioncommand ChangeValueCmd
	for {set i 0} {$i<32} {incr i} {
		.cboDelVal insert list end DELAY$i
	} 
	pack .cboDelay .cboDelVal -in .frmDelay -side left
	pack .frmDelay -in $frmGroup -anchor w -padx 40 -pady 2
	
	checkbutton .cbUsePll -text "Use PLL Instead of DLL" -variable Para(UsePll) -command {ChangeValueCmd}
	checkbutton .cbGenPll -text "Generate PLL with this Module" -variable Para(GenPll) -command {ChangeValueCmd}
	pack .cbGenPll -in $frmGroup -anchor w -padx 10

	pack .frmGroup -in $frmConfig -fill x
	
	pack .frmConfig -in $page2 -fill both -expand 1

	$tnb delete 0

	$tnb view 0

	GeneralConfig

	pack forget .cboBusOrder 

	$Para(generate_cfg) configure -state disabled
	#46359-regenerate LPC file to enable generate button.
	if {$Para(new) == 0} {
		$Para(generate_cfg) configure -state normal

		#sysFunction UM v2.36, 2/10/2011
		if {$Para(UsePll) == 1 && $Para(Interface) == "GDDRX1_RX.SCLK.Aligned"} {
			set msg "GDDRX1_RX.Aligned with PLL interface is not supported. GDDRX1_RX.Aligned with DLL interface will be used in this module."
			tk_messageBox -default ok -icon warning -message $msg -title "LoadParaCB" -type ok
			set Para(UsePll) 0
		}
	}

	ChangeValueCmd
}