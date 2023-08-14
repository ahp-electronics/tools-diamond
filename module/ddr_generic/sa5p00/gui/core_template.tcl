#$Header: L:/module/ddr_generic/sa5p00/gui/core_template.tcl 1.5 mghuang Exp $

#Rev 1.7: Diamond 3.6 IPExpress: Sapphire SCR_1110 from 10Mhz-400Mhz to 8Mhz-400Mhz
#Rev 1.5: Diamond 3.4 IPExpress: Sapphire IO Logic Usage Model 10.0
#Rev 1.4: Diamond 3.3 IPExpress: SCR_1091
#Rev 1.3: Diamond 3.3 IPExpress: SCR_1087
#Rev 1.2: Diamond 3.3 IPExpress: SCR_1080, SOF-121168
#Rev 1.1: Diamond 3.2 IPExpress: SCR_1080
#Rev 1.0: Diamond 3.2 IPExpress: ECP4U to sa5p00
#Rev 1.16: Diamond 3.2 IPExpress: regenerate support, no GUI
#Rev 1.15: Diamond 3.1 IPExpress: Fixed SOF-119490
#Rev 1.13: Diamond 3.1 IPExpress: Fixed SOF-119206, turn on "Enable ECLK Bridge" - Dave's request.
#Rev 1.12: Diamond 3.1 IPExpress: Fixed SOF-119123
#Rev 1.11: Diamond 3.1 IPExpress: Fixed SOF-118917
#Rev 1.10: Diamond 3.1 IPExpress: SCR_1065,SOF-118142,SOF-118183
#Rev 1.9: Diamond 3.0 IPExpress: SCR_1059
#Rev 1.8: Diamond 3.0 IPExpress: Fixed SOF-117106
#Rev 1.6/1.7: Diamond 2.2 IPExpress: SCR_1030, 4/23/2013
#Rev 1.5: Diamond 2.2 IPExpress: Fixed CR_59628,59662
#Rev 1.4: Diamond 2.2 IPExpress: Fixed CR_59557
#Rev 1.3: Diamond 2.2 IPExpress: Fixed cr_59485, SAPPHIRE_legal_PIO_settings 3.0
#Rev 1.2: Diamond 2.2 IPExpress: Fixed cr_59475
#Rev 1.1: Diamond 2.2 IPExpress: Fixed cr_59440, UM rev 1.0
#Rev 1.0: initial ver.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para pin_flag

	if {$Para(pre-configuration) == "ENABLED"} {
		if {[string length $Para(freq_in)] > 0 && 
		    [string length $Para(width)] > 0 && 
			$Para(width) != 0} {
				DrawPins
			}
	} else {
		if {[string length $Para(freq_in2)] > 0 &&
		    [string length $Para(width2)] > 0 && 
			$Para(width2) != 0} {
				DrawPins
			}
	}
} 

proc SetDefaultBaseMode {} {
	global Para
	if {$Para(mode) == "Receive" || $Para(mode) == "Receive MIPI"} {
		set Para(Delay) "Static Default"
	} else {
		set Para(Delay) "Bypass"
	}
}

proc GetDevType {} {
	global Para

	regexp {(^[a-zA-Z0-9]+)-([0-9]+)?(.*)$} $Para(PartType) match x y z
	set Para(dev_type) $y
	#tk_messageBox -default ok -icon info -message "$x=$y=$z" -title GetDevType -type ok
	set pio_lst [split $Para(SPIO) "_"]
	set L_SPIO [lindex [split [lindex $pio_lst 0] "-"] 1]
	set R_SPIO [lindex [split [lindex $pio_lst 1] "-"] 1]
	set T_SPIO [lindex [split [lindex $pio_lst 2] "-"] 1]
	#tk_messageBox -default ok -icon info -message "$L_SPIO=$R_SPIO=$T_SPIO" -title GetDevType -type ok
	set l_t_spio [expr $L_SPIO+$T_SPIO]
	set r_t_spio [expr $R_SPIO+$T_SPIO]
	if {$l_t_spio >= $r_t_spio} {
		set Para(align_buswidth) $l_t_spio
	} else {
		set Para(align_buswidth) $r_t_spio
	}
	set Para(center_buswidth) [expr $L_SPIO+$R_SPIO+$T_SPIO]
	
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
}

proc ChangeGearCmd {} {
	global Para

	if {$Para(pre-configuration) == "ENABLED"} {
		set freq_in freq_in
	} else {
		set freq_in freq_in2
	}
	if {$Para($freq_in) == ""} {
		set Para(gear) ""
	} else {
		if {$Para($freq_in) >= "2" && $Para($freq_in) <= "200"} {
			set Para(gear) "2:1"
		} 
		if {$Para($freq_in) > "200" && $Para($freq_in) <= "400"} {
			set Para(gear) "4:1"
		}
	}
}

proc SetGearGui {} {
	global Para
	
	if {$Para(pre-configuration) == "ENABLED"} {
		set freq_in freq_in
		.cbogear config -state disabled
		.lblgear config -state disabled
	} else {
		set freq_in freq_in2
		.cbogear config -state normal
		.lblgear config -state normal
	}
	if {$Para($freq_in) == ""} {
		.cbogear config -state disabled
		.lblgear config -state disabled
	} else {
		if {$Para($freq_in) >= "2" && $Para($freq_in) <= "200"} {
			.cbogear config -state normal
			.lblgear config -state normal
		} 
		if {$Para($freq_in) > "200" && $Para($freq_in) <= "400"} {
			.cbogear config -state normal
			.lblgear config -state normal
		}
	}
}

proc SetGear {} {
	global Para
	
	#CR_53057 
	#return
	
	#um rev 1.17 table 53.
	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
		set freq_in freq_in
#		set EnDQS EnDQS
	} else {
		set mode mode2
		set freq_in freq_in2
#		set EnDQS EnDQS2
	}
	if {$Para($freq_in) == ""} {
		set Para(gear) ""
	} else {
		if {$Para($freq_in) >= "2" && $Para($freq_in) <= "200"} {
			.cbogear clear list
			.cbogear insert list end 2:1 4:1
			#set Para(gear) "2:1"
		} 
		if {$Para($freq_in) > "200" && $Para($freq_in) <= "400"} {
			.cbogear clear list
			.cbogear insert list end 4:1
			if {[lsearch {4:1} $Para(gear)] == -1} {set Para(gear) "4:1"}
		}
		if {$Para($mode) == "Receive MIPI"} {
			.cbogear clear list
			.cbogear insert list end 4:1
			if {[lsearch {4:1} $Para(gear)] == -1} {set Para(gear) "4:1"}
		}
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
		set EnDQS EnDQS
	} else {
		set mode mode2
		set io_type io_type2
		set num_int num_int2
		set aligned aligned2
		set EnDQS EnDQS2
	}
		
###GDDRX2_RX.ECLK.Centered
	if {$Para($mode) == "Receive" || $Para($mode) == "Receive MIPI"} {
		set m RX 
	} else {
		set m TX
	}
	switch $Para(gear) {
		2:1 {set g 1}
		4:1 {set g 2}
		8:1 {set g 4}
		10:1 {set g 5}
		default {set g 1}
	}
	if {$g == "1"} {
		set c SCLK
	} else {
		set c ECLK
	}
	if {$Para($aligned) == "Edge-to-Edge"} {
		set a Aligned
	}
	if {$Para($aligned) == "Centered"} {
		set a Centered
		if {$Para($mode) == "Receive MIPI"} {
			set a MIPI
		}
	}
	set Para(Interface) GDDRX${g}_${m}.${c}.$a

	if {$Para(pre-configuration) == "ENABLED"} {
		.lblInterface config -state disabled
		.cboInterface config -state disabled
	} else {
		.cboInterface config -state normal
	}
}

proc SetWidth {} {
	global Para
	
	if {$Para(pre-configuration) == "ENABLED"} {
#		set num_int num_int
		set width width
		set freq_in freq_in
		set io_type io_type
	} else {
#		set num_int num_int2
		set width width2
		set freq_in freq_in2
		set io_type io_type2
	}

	if {[string length $Para($freq_in)] == 0 || $Para($freq_in) == "-" || [string length $Para($width)] == 0 || $Para($freq_in) == "."} {
		set Para(bandwidth) ""
	} else {
		if {$Para($width) == 0 || $Para($freq_in) == 0} {
			set Para(bandwidth) 0
		} else {
			set Para(bandwidth) [expr [string trimleft $Para($freq_in) 0]*2*[string trimleft $Para($width) 0]]
		}
	}
}

proc SetFreqIn {} {
	global Para
	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
		set aligned aligned
		set EnDQS EnDQS
	} else {
		set mode mode2
		set aligned aligned2
		set EnDQS EnDQS2
	}
	set Para(min_feq) 3.125
	set Para(max_feq) 400

	set aligned_lst {Edge-to-Edge Centered}
	if {$Para($mode) == "Receive"} {
		set Para(min_feq) 100
		set aligned_lst {Edge-to-Edge Centered}
	}
	if {$Para($mode) == "Receive MIPI"} {
		set Para(min_feq) 200
		set aligned_lst {Centered}
	}
	if {$Para($mode) == "Transmit"} {
		set aligned_lst {Edge-to-Edge Centered}
	}
	.cbo$aligned config -state normal
	.cbo$aligned clear list
	foreach x $aligned_lst {.cbo$aligned insert list end $x}
	if {[lsearch $aligned_lst $Para($aligned)] == -1} {set Para($aligned) [lindex $aligned_lst 0]}
	if {$Para($mode) == ""} {set Para($aligned) ""}
}

proc SetOtherItems {} {
	global Para
	
	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
		set aligned aligned
		set width width
		set freq_in freq_in
		set io_type io_type
	} else {
		set mode mode2
		set aligned aligned2
		set width width2
		set freq_in freq_in2
		set io_type io_type2
	}
	
	#ISPL_CR_57190
	if {$Para(mode) == "Receive"} {
		.cboio_type config -state normal
	}
	if {$Para(mode) == "Receive MIPI"} {
		.cboio_type config -state disabled
	}
	if {$Para(mode) == "Transmit"} {
		.cboio_type config -state normal
	}

	if {$Para($mode) == "Receive"} {
		.cbo$io_type config -state normal
	}
	if {$Para($mode) == "Receive MIPI"} {
		.cbo$io_type config -state disabled
	}
	if {$Para($mode) == "Transmit"} {
		.cbo$io_type config -state normal
	}

	#! Data Path Delay config
	set delay_lst {"Static Default" "Dynamic Default" "Static User Defined" "Dynamic User Defined"}
	.cboDelay config -state disabled
	if {$Para($mode) == "Receive"} {
		set delay_lst {"Static Default" "Dynamic Default" "Static User Defined" "Dynamic User Defined"}
		.cboDelay config -state normal
		.lblDelay config -state normal
	}
	if {$Para($mode) == "Receive MIPI"} {
		set delay_lst {"Static Default" "Static User Defined"}
		.cboDelay config -state normal
		.lblDelay config -state normal
	}
	if {$Para($mode) == "Transmit"} {
		set delay_lst {Bypass "Static User Defined" "Dynamic User Defined"}
		.cboDelay config -state normal
		.lblDelay config -state normal
	}
	if {[.cboDelay cget -state] == "normal"} {
		.cboDelay clear list
		foreach item $delay_lst {
			.cboDelay insert list end $item
		}
		if {[lsearch $delay_lst $Para(Delay)] == -1} {
			set Para(Delay) [lindex $delay_lst 0]
		}
	} else {
		set Para(Delay) "Static Default"
	}
	
	if {$Para($mode) == "Receive" && $Para($aligned) == "Edge-to-Edge"} {
		.cbEnDynamic config -state normal
	} else {
		.cbEnDynamic config -state disabled
		set Para(EnDynamic) 0
	}
	
	if {$Para($mode) == "Transmit" && $Para($aligned) == "Centered"} {
		.cbGenPll config -state normal
	} else {
		.cbGenPll config -state disabled
		set Para(GenPll) 0
	}
	
	#! bus width config
	set Para(max_Bus_Width) 256
	if {$Para($mode) == "Receive" || $Para($mode) == "Receive MIPI"} {
		if {$Para($aligned) == "Edge-to-Edge"} {
			set Para(max_Bus_Width) $Para(align_buswidth)
		}
		if {$Para($aligned) == "Centered"} {
			set Para(max_Bus_Width) $Para(align_buswidth)
		}
	}
	if {$Para($mode) == "Transmit"} {
		set Para(max_Bus_Width) $Para(align_buswidth)
	}
	.lbl2$width config -text "(1 - $Para(max_Bus_Width))"
}

proc PopulatedFields {} {
	global Para
	
	set cbo_lst {mode2 io_type2 gear aligned2 Interface}
	set ent_lst {freq_in2 width2 Freq}
	set p_lst {mode io_type freq_in width aligned}
	foreach item $p_lst {
		set Para(${item}2) $Para($item)
	}
	set Para(trioddr2) $Para(trioddr)
	SetFreqIn
	.lbl2freq_in config -text "($Para(min_feq) - $Para(max_feq)MHz)"
	.lbl2freq_in2 config -text "($Para(min_feq) - $Para(max_feq)MHz)"
	SetGear
	SetWidth
	foreach item $cbo_lst {
		.lbl$item config -state disabled
		.cbo$item config -state disabled
	}
	foreach item $ent_lst {
		.lbl$item   config -state disabled
		.lbl2$item  config -state disabled
		.entry$item config -state disabled
	}
	SetInterface
	
	if {[string length $Para(Delay)] == 0} {set Para(Delay) "Static Default"}
	if {[string length $Para(NumEdge)] == 0} {set Para(NumEdge) "BOTH"}
}

proc ChangeValueCmd {} {
	global Para
	
	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
		set io_type io_type
	} else {
		set mode mode2
		set io_type io_type2
	}

	set cbo_lst {mode2 io_type2 gear aligned2 Interface Delay}
	set ent_lst {freq_in2 width2}
	SetFreqIn
	.lbl2freq_in config -text "($Para(min_feq) - $Para(max_feq)MHz)"
	.lbl2freq_in2 config -text "($Para(min_feq) - $Para(max_feq)MHz)"
	
	set io_type_lst {}
	if {$Para(pre-configuration) == "ENABLED"} {
		#pre-configuration == "ENABLED"
#		.cbReceiverSync config -state disabled
		.lblDataLane config -state disabled
		.rdo1DataLane config -state disabled
		.rdo2DataLane config -state disabled
		if {$Para(mode) == "Receive"} {
			set io_type_lst {LVDS SUBLVDS BLVDS25 MLVDS25 SLVS LVPECL33 SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II SSTL15_I SSTL15_II \
				SSTL15D_I SSTL15D_II SSTL135_I SSTL135_II SSTL135D_I SSTL135D_II HSUL12 HSUL12D LVTTL33 LVTTL33D \
				LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
		}
		if {$Para(mode) == "Transmit"} {
			set io_type_lst {LVDS LVDS25E MLVDS25E BLVDS25E LVPECL33E HSUL12 HSUL12D SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II \
				SSTL15_I SSTL15_II SSTL15D_I SSTL15D_II SSTL135_I SSTL135_II SSTL135D_I SSTL135D_II \
				LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
		}
		if {$Para(mode) != "Receive MIPI"} {.cboio_type config -state normal}
		.cboio_type clear list
		foreach x $io_type_lst {
			.cboio_type insert list end $x
		}
		if {$Para(mode) == ""} {
			set Para(io_type) ""
		} else {		
			if {[lsearch $io_type_lst $Para(io_type)] ==-1} {set Para(io_type) LVCMOS25}
		}
		if {$Para(mode) == "Receive MIPI"} {
			#set io_type_lst {MIPI}
			set Para(io_type) MIPI
		}
		
		if {$Para(mode) == "Transmit"} {
			.cbtrioddr config -state normal
		} else {
			.cbtrioddr config -state disabled
			set Para(trioddr) 0
		}
		
		.cbtrioddr2 config -state disabled
		
		if {[string length $Para(mode)] == 0 || [string length $Para(io_type)] == 0 ||
			[string length $Para(width)] == 0 ||
			[string length $Para(freq_in)] == 0 || [string length $Para(aligned)] == 0} {
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
			
			set Para(trioddr2) $Para(trioddr)
			$Para(generate_cfg) configure -state disabled
		} else {
			PopulatedFields
			.lblInterface config -state normal
			.cboInterface config -state normal
			if {[string length $Para(gear)] == 0} {set Para(gear) "2:1"}
#			if {[string length $Para(Delay)] == 0} {set Para(Delay) "Static Default"}
			$Para(generate_cfg) configure -state normal
		}
	} else {
		#pre-configuration == "DISABLED"
		.lblDataLane config -state normal
		.rdo1DataLane config -state normal
		.rdo2DataLane config -state normal
		if {$Para(mode2) == "Receive"} {
			set io_type_lst {LVDS SUBLVDS BLVDS25 MLVDS25 SLVS LVPECL33 SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II SSTL15_I SSTL15_II \
				SSTL15D_I SSTL15D_II SSTL135_I SSTL135_II SSTL135D_I SSTL135D_II HSUL12 HSUL12D LVTTL33 LVTTL33D \
				LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
		}
		if {$Para(mode2) == "Transmit"} {
			set io_type_lst {LVDS LVDS25E MLVDS25E BLVDS25E LVPECL33E HSUL12 HSUL12D SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II \
				SSTL15_I SSTL15_II SSTL15D_I SSTL15D_II SSTL135_I SSTL135_II SSTL135D_I SSTL135D_II \
				LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
		}
		if {$Para(mode2) != "Receive MIPI"} {.cboio_type2 config -state normal}
		.cboio_type2 clear list
		foreach x $io_type_lst {
			.cboio_type2 insert list end $x
		}
		if {[lsearch $io_type_lst $Para(io_type2)] ==-1} {set Para(io_type2) LVCMOS25}
		if {$Para(mode2) == "Receive MIPI"} {
			#set io_type_lst {MIPI}
			set Para(io_type2) MIPI
		}
		
		if {$Para(mode2) == "Transmit"} {
			.cbtrioddr2 config -state normal
		} else {
			.cbtrioddr2 config -state disabled
			set Para(trioddr2) 0
		}

		if {[$Para(generate_cfg) cget -state] == "disabled"} {
			if {[string length $Para(mode2)] == 0} {set Para(mode2) "Receive"}
#			set Para(trioddr2) 0
			if {[string length $Para(io_type2)] == 0} {set Para(io_type2) "LVCMOS25"}
			if {[string length $Para(freq_in2)] == 0} {set Para(freq_in2) "200"}
			if {[string length $Para(gear)] == 0} {set Para(gear) "2:1"}
			if {[string length $Para(aligned2)] == 0} {set Para(aligned2) "Centered"}
			if {[string length $Para(width2)] == 0} {set Para(width2) ""}
			if {[string length $Para(Interface)] == 0} {set Para(Interface) "GDDRX1_RX.SCLK.Aligned"}
			if {[string length $Para(Delay)] == 0} {set Para(Delay) "Static Default"}
			if {[string length $Para(NumEdge)] == 0} {set Para(NumEdge) "BOTH"}
			if {[string length $Para(Freq)] == 0} {set Para(Freq) $Para(freq_in2)}
			
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
			.lbl2$item  config -state normal
			.entry$item config -state normal
		}
#		.cbReceiverSync config -state normal
		SetGear
		SetInterface
	}
	
	SetOtherItems
	#CR_53341
	SetGearGui
	if {$Para(gear) == "4:1"} {
		.cbEnECLK config -state normal
	} else {
		.cbEnECLK config -state disabled
		set Para(EnECLK) 0
	}
	
	if {[.cboDelay cget -state] == "normal" && ($Para(Delay) == "Static User Defined" || $Para(Delay) == "Dynamic User Defined")} {
		.lblDelVal config -state normal
		.cboDelVal config -state normal
		if {$Para(DelVal) == ""} {set Para(DelVal) 1}
	} else {
		.lblDelVal config -state disabled
		.cboDelVal config -state disabled
		set Para(DelVal) ""
	}
	if {[.cbGenPll cget -state] == "normal" && $Para(GenPll) == "1"} {
		.entryFreq config -state normal
		.lblFreq config -state normal
		.lbl2Freq config -state normal
		if {[string length $Para(Freq)] == 0} {set Para(Freq) $Para(freq_in2)}
		.lblAFreq config -state normal
		.entryAFreq config -state disabled
		.lbl2AFreq config -state normal
		.btnACalculate config -state normal
		.cbReference config -state normal
		.lblIOBUF config -state normal
		.cboIOBUF config -state normal
	} else {
		.lblFreq config -state disabled
		.entryFreq config -state disabled
		.lbl2Freq config -state disabled
		.lblAFreq config -state disabled
		.entryAFreq config -state disabled
		.lbl2AFreq config -state disabled
		.btnACalculate config -state disabled
		.cbReference config -state disabled
		set Para(Reference) 0
		.lblIOBUF config -state disabled
		.cboIOBUF config -state disabled
	}
	
	if {$Para(Reference) == 1} {
		.lblIOBUF config -state normal
		.cboIOBUF config -state normal
	} else {
		.lblIOBUF config -state disabled
		.cboIOBUF config -state disabled
	}
	
	#**************************************************
	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
		set aligned aligned
	} else {
		set mode mode2
		set aligned aligned2
	}
	
	if {$Para($mode) == "Receive" && $Para($aligned) == "Edge-to-Edge"} {
		.cbReceiverSync config -state normal
	} else {
		.cbReceiverSync config -state disabled
		set Para(ReceiverSync) 0
	}
	
	if {$Para($mode) == "Receive MIPI"} {
		.cbMIPIFilter config -state normal
	} else {
		.cbMIPIFilter config -state disabled
		set Para(MIPIFilter) 0
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
	
	if {$Para($mode) == "Transmit" && $Para($aligned) == "Edge-to-Edge"} {
		.cbenClkIBuf config -state normal
	} else {
		.cbenClkIBuf config -state disabled
		set Para(enClkIBuf) 0
	}
	if {$Para(enClkIBuf) == "0"} {
		.cboClkIBuf config -state disabled
		.lblClkIBuf config -state disabled
	} else {
		.cboClkIBuf config -state normal
		.lblClkIBuf config -state normal
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

	if {$Para(pre-configuration) == "ENABLED"} {
		set io_type io_type
		set mode mode
		set num_int num_int
		set width width
		set freq_in freq_in
		set aligned aligned
		set EnDQS EnDQS
	} else {
		set io_type io_type2
		set mode mode2
		set num_int num_int2
		set width width2
		set freq_in freq_in2
		set aligned aligned2
		set EnDQS EnDQS2
	}
	set Para($width) [string trimleft $Para($width) 0]
	set Para($freq_in) [string trimleft $Para($freq_in) 0]
	
	set ret [IsInRange "Bus Width" 1 $Para(max_Bus_Width) $Para($width)]
	if {$ret == "-1"} {return -1}

	set ret [IsInRange "Clock Frequency" $Para(min_feq) 400 $Para($freq_in)]
	if {$ret == "-1"} {return -1}

	if {$Para($freq_in) > "200" && $Para($freq_in) <= "400"} {
		if {[lsearch {4:1} $Para(gear)] == -1} {
			set msg "Gearing Ratio Selected is not correct for the given Clock Frequency."
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameter" -type ok
			return -1
		}
	}

	if {$ret == "-1"} {return -1}
	if {[.entryFreq cget -state] == "normal"} {
		#PLL Input Clock Frequency should be between 3.125 and 400 - TSpec
		set ret [IsInRange "PLL Input Clock Frequency" 8 400 $Para(Freq)]
		if {$ret == "-1"} {return -1}
		
		set Para(calculate_flag) true
		
		CalculateCmd
		
		#also check if Actual_Clock_Frequency is within +-10% range of Clock_Frequency
		set delta [expr abs($Para(AFreq)/$Para($freq_in) - 1.0)]
		if {$delta > 0.1} {
			set msg "The Actual Clock Frequency achieved does not match the specified Clock Frequency, check the value of Actual Clock Frequency in Configuration tab. Push OK to Continue."
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameter" -type ok
			set Para(calculate_flag) false
			return -1
		}
	}
	
	if {$Para(GenPll) == "1" } {
		if {$Para(Reference) == "0"} {
			set msg "PLL Reference Clock input to comes from internal clock net, no DRC are run for these input pin."
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameter" -type ok
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
	
	if {$Para(pre-configuration) == "ENABLED"} {
		set mode mode
		set trioddr trioddr
		set io_type io_type
		set width width
		set freq_in freq_in
		set num_int num_int
		set aligned aligned
		set EnDQS EnDQS
		if {[string length $Para($mode)] == 0 || [string length $Para($io_type)] == 0 ||
			[string length $Para($width)] == 0 ||
			[string length $Para($freq_in)] == 0 || [string length $Para($aligned)] == 0} {
			set str "-arch $Para(arch) -type iol -mode Receive -io_type LVCMOS25 -width 10 -freq_in 200 -gear 2 -aligned"
			return $str
		}
	} else {
		set mode mode2
		set trioddr trioddr2
		set io_type io_type2
		set width width2
		set freq_in freq_in2
		set num_int num_int2
		set aligned aligned2
		set EnDQS EnDQS2
	}
	
	set str "-arch $Para(arch) -type iol"
	switch $Para($mode) {
	"Receive MIPI"     { lappend str -mode MIPI}
	"Receive"          { lappend str -mode Receive -io_type $Para($io_type)}
	"Transmit"         { lappend str -mode Transmit -io_type $Para($io_type)}
	}
	
	if {$Para($trioddr) == 1} {lappend str -trioddr}
	
	lappend str -width $Para($width) -freq_in $Para($freq_in) 
	
	switch $Para(gear) {
	""           { lappend str -gear 0 }
	"2:1"         { lappend str -gear 2 }
	"4:1"         { lappend str -gear 4 }
	"8:1"         { lappend str -gear 8 }
	"10:1"         { lappend str -gear 10 }
	}
	
	if {$Para(EnECLK) == "1"} {lappend str -eclk_bridge}
	if {$Para(EnDynamic) == "1"} {lappend str -cdel}
	
	if {$Para($aligned) == "Edge-to-Edge"} {lappend str -aligned}

	switch $Para(Delay) {
		"Bypass"               { lappend str -del -1 }
		"Static Default"       { lappend str -del 128 }
		"Dynamic Default"	   { lappend str -del 128 -dynamic_delay}
		"Static User Defined"  { lappend str -del $Para(DelVal) }
		"Dynamic User Defined" { lappend str -del $Para(DelVal) -dynamic_delay}
	}

	if {$Para(GenPll) == "1" } {
		if {[string length $Para(Freq)] > 0} {
			lappend str -pll $Para(Freq)
		} else {
			lappend str -pll $Para($freq_in)
		}
		#SOF-118917: remove $Para(IOBUF)
		if {$Para(Reference) == 1} {
			lappend str -clkibuf $Para(IOBUF)
		}
	}

	if {$Para(pre-configuration) != "ENABLED"} {
		if {$Para(DataLane) == "By Lane"} {lappend str -data_lane}
	}
	#if {[.cbReceiverSync cget -state] == "normal" && $Para(ReceiverSync) == "1"} {
	#	lappend str -receiver_sync
	#}
	if {$Para(MIPIFilter) == "1"} {
		#lappend str -mipi_filter
	}

	if {$Para(enClkIBuf) == "1"} {lappend str -clkibuf $Para(ClkIBuf)}
	
#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

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
	
	if {$Para(calculate_flag) == "false"} {
		set ret [CheckParameterCB]
		if {$ret == -1}  {return -1}
	}
	
	#Call scuba engine to get output string
	set ret [GetStdoutStr]
	if {$ret == -1}  {
		set tit "Frequency Calculate"
		set msg "The Actual Clock Frequency achieved does not match the specified Clock Frequency, check the value of Actual Clock Frequency in Configuration tab. Push OK to Continue."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
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
	set div [split $div_str ,]
	set freq [split [string trim $freq_str] " "]
	set phase [split $phase_str ,]

	#Process Freq
	set Para(AFreq)  [string trim [lindex $freq 0] ',']
	
	set Para(calculate_flag) true
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 500 600
	set pin_flag 1
#	DrawImage 220 500 

	GetDevType
	
	#
	set Para(calculate_flag) false
	set Para(align_buswidth) 256
	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Pre-Configuration"]

	iwidgets::labeledframe .setframe
	set setframe [.setframe childsite]

	set w 32
	CreateLabelCombobox $setframe mode "Interface Type" $w 16 Para(mode) {Transmit Receive "Receive MIPI"} {SetDefaultBaseMode;ChangeValueCmd}
	.lblmode config -anchor w
	
	checkbutton .cbtrioddr -text "Enable Tri-state Control" -variable Para(trioddr) -command {ChangeValueCmd}
	pack .cbtrioddr -in $setframe -anchor w -padx 10
	
	set io_type_lst {LVDS SUBLVDS BLVDS25 MLVDS25 SLVS LVPECL33 SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II SSTL15_I SSTL15_II \
		SSTL15D_I SSTL15D_II SSTL135_I SSTL135_II SSTL135D_I SSTL135D_II HSUL12 HSUL12D LVTTL33 LVTTL33D \
		LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
	set output_list {LVDS LVDS25E MLVDS25E BLVDS25E LVPECL33E HSUL12 HSUL12D SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II \
		SSTL15_I SSTL15_II SSTL15D_I SSTL15D_II SSTL135_I SSTL135_II SSTL135D_I SSTL135D_II \
		LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
	CreateLabelCombobox $setframe io_type "I/O Standard for this Interface" $w 20 Para(io_type) $io_type_lst {ChangeValueCmd}
	.lblio_type config -anchor w

	CreateLabelEntryLabel $setframe width "Bus Width for this Interface" 12 "(1 - 256)" "" Para(width) {integer}
	.lblwidth config -width $w -anchor w
	.entrywidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entrywidth config -fixed 3
	
	CreateLabelEntryLabel $setframe freq_in "Clock Frequency for this Interface" 12 "(2 - 400MHz)" "" Para(freq_in) real
	.lblfreq_in config -width $w -anchor w
	.entryfreq_in.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeGearCmd;ChangeValueCmd}
			return 1
		}
		
	CreateLabelEntryLabel $setframe bandwidth "Interface Bandwidth (Calculated)" 12 "Mbits/s" "" Para(bandwidth) real
	.lblbandwidth config -width $w -anchor w
	.entrybandwidth config -state disabled

	set aligned_lst {Edge-to-Edge Centered}
	CreateLabelCombobox $setframe aligned "Clock to Data Relationship at the Pins" $w 22 Para(aligned) $aligned_lst {ChangeValueCmd}
	.lblaligned config -anchor w
	
	button .btnNext -text "Next >" -width 12 -command {$Para(tnb) view 1}
	pack .btnNext -in $setframe -side top -anchor e -padx 20 -pady 30
	
	pack .setframe -in $page -fill both -expand 1

	#******************************
	#"Configuration"
	#******************************
	set page2 [$tnb add -label "Configuration"]

	iwidgets::labeledframe .frmConfig -labeltext "" -labelpos nw
	set frmConfig [.frmConfig childsite]
	
	checkbutton .ckpre-configuration -text "Interface selection based on pre-configuration" -variable Para(pre-configuration) -offvalue DISABLED -onvalue ENABLED -command ChangeValueCmd
	pack .ckpre-configuration -in $frmConfig -side top -anchor w -padx 10 -pady 4

	set w 20
	CreateLabelCombobox $frmConfig mode2 "Interface Type" $w 22 Para(mode2) {Transmit Receive "Receive MIPI"} {SetDefaultBaseMode;ChangeValueCmd}
	.lblmode2 config -anchor w

	checkbutton .cbtrioddr2 -text "Enable Tri-state Control" -variable Para(trioddr2) -command {ChangeValueCmd}
	pack .cbtrioddr2 -in $frmConfig -anchor w -padx 10

	CreateLabelCombobox $frmConfig io_type2 "I/O Standard" $w 22 Para(io_type2) $io_type_lst {ChangeValueCmd}
	.lblio_type2 config -anchor w

	CreateLabelEntryLabel $frmConfig freq_in2 "Clock Frequency" 12 "(3.125 - 400MHz)" "" Para(freq_in2) real
	.lblfreq_in2 config -width $w -anchor w
	.entryfreq_in2.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeGearCmd;ChangeValueCmd}
			return 1
		}

	CreateLabelCombobox $frmConfig gear "Gearing Ratio" $w 12 Para(gear) {2:1 4:1} {ChangeValueCmd}
	.lblgear config -anchor w
	
	CreateLabelCombobox $frmConfig aligned2 "Alignment" $w 22 Para(aligned2) $aligned_lst {ChangeValueCmd}
	.lblaligned2 config -anchor w

	CreateLabelEntryLabel $frmConfig width2 "Bus Width" 12 "(1 - 256)" "" Para(width2) {integer}
	.lblwidth2 config -width $w -anchor w
	.entrywidth2.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entrywidth2 config -fixed 3
	
	CreateRadioItem $frmConfig DataLane "Organize Parallel Data" $w "By Lane" "By Lane" "By Time" "By Time" 12 left Para(DataLane)
	.lblDataLane config -anchor w
	
	checkbutton .cbEnECLK -text "Enable ECLK Bridge (required if bus is crossing sides)" -variable Para(EnECLK) -command {ChangeValueCmd}
	pack .cbEnECLK -in $frmConfig -side top -anchor w -padx 10
	
	
	CreateLabelCombobox $frmConfig Interface "Interface" $w 30 Para(Interface) {} {ChangeValueCmd}
	.lblInterface config -anchor w
	
	set delay_lst {"Static Default" "Dynamic Default" "Static User Defined" "Dynamic User Defined"}
	CreateLabelCombobox $frmConfig Delay "Data Path Delay" $w 20 Para(Delay) $delay_lst {ChangeValueCmd}
	.lblDelay config -anchor w
	CreateLabelCombobox $frmConfig DelVal "Delay Value for User Defined" $w 8 Para(DelVal) {} {ChangeValueCmd}
	pack .frmDelVal -in $frmConfig -anchor w -padx 40
	.lblDelVal config -width 24 -anchor w
	for {set i 1} {$i<128} {incr i} {
		.cboDelVal insert list end $i
	} 
	
	checkbutton .cbEnDynamic -text "Enable Dynamic Margin Control on Clock Delay" -variable Para(EnDynamic) -command {ChangeValueCmd}
	checkbutton .cbGenPll -text "Generate PLL with this Module" -variable Para(GenPll) -command {ChangeValueCmd}
	pack .cbEnDynamic .cbGenPll -in $frmConfig -anchor w -padx 10 -pady 2
	CreateLabelEntryLabel $frmConfig Freq "PLL Input Clock Frequency" 12 "MHz" "" Para(Freq) {real}
	pack .frmFreq -in $frmConfig -anchor w -padx 40
	.lblFreq config -width 24 -anchor w
	.entryFreq.lwchildsite.entry config -validate key -vcmd {
			after idle {set Para(calculate_flag) false}
			return 1
		}
	CreateLabelEntryLabel $frmConfig AFreq "Actual Clock Frequency" 12 "MHz" "" Para(AFreq) {real}
	pack .frmAFreq -in $frmConfig -anchor w -padx 40
	.lblAFreq config -width 24 -anchor w

	checkbutton .cbReference -text "PLL Reference Clock From I/O Pin" -variable Para(Reference) -command {ChangeValueCmd}
	pack .cbReference -in $frmConfig -anchor w -padx 40

	set rx_type_lst {LVDS SUBLVDS BLVDS25 MLVDS25 SLVS LVPECL33 LVTTL33 LVTTL33D \
				LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
	CreateLabelCombobox $frmConfig IOBUF "CLKI Input Buffer Type" $w 20 Para(IOBUF) $rx_type_lst {ChangeValueCmd}
	pack .frmIOBUF -in $frmConfig -anchor w -padx 40
	.lblIOBUF config -width 24 -anchor w
	
	button .btnACalculate -text "Calculate" -width 10 -command {CalculateCmd}
	pack .btnACalculate -in .frmAFreq -side left -padx 10

	checkbutton .cbenClkIBuf -text "Reference Clock from I/O Pin" -variable Para(enClkIBuf) -command {ChangeValueCmd}
	pack .cbenClkIBuf -in $frmConfig -anchor w -padx 10
	
	CreateLabelCombobox $setframe ClkIBuf "Reference Clock Input Buffer Type" 30 20 Para(ClkIBuf) $rx_type_lst {ChangeValueCmd}
	pack .frmClkIBuf -in $frmConfig -anchor w -padx 40
	.lblClkIBuf config -anchor w

	checkbutton .cbReceiverSync -text "Enable Receiver Sync Soft IP" -variable Para(ReceiverSync) -command {ChangeValueCmd}
	#pack .cbReceiverSync -in $frmConfig -anchor w -padx 10

	checkbutton .cbMIPIFilter -text "Enable MIPI Filter Soft IP for Low Speed Data" -variable Para(MIPIFilter) -command {ChangeValueCmd}
	#pack .cbMIPIFilter -in $frmConfig -anchor w -padx 10

	pack .frmConfig -in $page2 -fill both -expand 1

	$tnb delete 0

	$tnb view 0

	GeneralConfig
	#CR_54513
	DrawImage 220 400 

	ChangeValueCmd

	pack forget .cboBusOrder 

	$Para(generate_cfg) configure -state disabled
	#46359-regenerate LPC file to enable generate button.
	if {$Para(new) == 0} {
		$Para(generate_cfg) configure -state normal
	}
}
