#$Header: L:/module/sdr/sa5p00/gui/core_template.tcl 1.1 mghuang Exp $

#Rev 1.1: Diamond 3.2 IPExpress: SCR_1080
#Rev 1.0: Diamond 3.2 IPExpress: ECP4U to sa5p00
#Rev 1.5: Diamond 3.1 IPExpress: Fixed SOF-119490
#Rev 1.4: Diamond 3.0 IPExpress: SCR_1059
#Rev 1.3: Diamond 3.0 IPExpress: Fixed SOF-117049
#Rev 1.2: Diamond 2.2 IPExpress: Fixed cr_59863
#Rev 1.1: Diamond 2.2 IPExpress: Fixed cr_49462, SAPPHIRE_legal_PIO_settings 3.0
#Rev 1.0: initial rev. UM rev 1.0

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(width)] > 0 && 
		[string length $Para(freq_in)] > 0}  {
		DrawPins
	} 
} 

proc ChangeValueCmd {} {
	global Para

	set Para(freq_in) [string trimleft $Para(freq_in) 0]
	set Para(width) [string trimleft $Para(width) 0]
	if {[string is digit -strict $Para(width)] == 0 || 
		[string is double -strict $Para(freq_in)] == 0} {
		set Para(bandwidth) 0
	} else {
		set Para(bandwidth) [expr $Para(freq_in) * $Para(width)]
	}

	if {$Para(mode) == "Receive"} {
		set io_type_lst {LVDS SUBLVDS BLVDS25 MLVDS25 SLVS LVPECL33 SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II SSTL15_I SSTL15_II \
			SSTL15D_I SSTL15D_II SSTL135_I SSTL135_II SSTL135D_I SSTL135D_II HSUL12 HSUL12D LVTTL33 LVTTL33D \
			LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
		if {[lsearch $io_type_lst $Para(io_type)] ==-1} {set Para(io_type) LVCMOS25}
		
		set interface_lst {GIREG_RX.SCLK}
		set Para(interface) "GIREG_RX.SCLK"
		
#		.lbldel config -state normal
#		.cbodel config -state normal
		set del_lst {"Bypass" "Static Default" "Dynamic Default" "Static User Defined" "Dynamic User Defined"}
		if {[lsearch $del_lst $Para(del)] == -1} {set Para(del) "Bypass"}
		.cbodel clear list
		foreach x $del_lst {
			.cbodel insert list end $x
		}
		
		.cknegedge config -state normal
	} else {
		set io_type_lst {LVDS LVDS25E MLVDS25E BLVDS25E LVPECL33E HSUL12 HSUL12D SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II \
			SSTL15_I SSTL15_II SSTL15D_I SSTL15D_II SSTL135_I SSTL135_II SSTL135D_I SSTL135D_II \
			LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
		if {[lsearch $io_type_lst $Para(io_type)] ==-1} {set Para(io_type) LVCMOS25}
		
		set interface_lst {GOREG_TX.SCLK}
		if {[lsearch $interface_lst $Para(interface)] == -1} {set Para(interface) "GOREG_TX.SCLK"}

#		.lbldel config -state disabled
#		.cbodel config -state disabled
#		set Para(del) ""
#		.lbldel config -state normal
#		.cbodel config -state normal
		set del_lst {"Bypass" "Static User Defined" "Dynamic User Defined"}
		if {[lsearch $del_lst $Para(del)] == -1} {set Para(del) "Bypass"}
		.cbodel clear list
		foreach x $del_lst {
			.cbodel insert list end $x
		}

		.cknegedge config -state disabled
		set Para(negedge) DISABLED
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
	
	.cbointerface clear list
	foreach x $interface_lst {
		.cbointerface insert list end $x
	}

	if {$Para(del) == "Static User Defined" || $Para(del) == "Dynamic User Defined"} {
		.lblfdel config -state normal
		.cbofdel config -state normal
		.cbofdel clear list
		for {set i 1} {$i < 128} {incr i} {
			.cbofdel insert list end $i
		}
#		set fdel_lst {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15}
		if {$Para(fdel) == ""} {set Para(fdel) 1}
	} else {
		.lblfdel config -state disabled
		.cbofdel config -state disabled
		set Para(fdel) ""
	}
	
	.cbointerface config -state disabled
	
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

	set ret [IsInRange "Bus Width" 1 256 $Para(width)]
	if {$ret == "-1"} {return -1}

	set ret [IsInRange "Clock Frequency" 1 200 $Para(freq_in)]
	if {$ret == "-1"} {return -1}

	return 0
}

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for ECP4 device
proc ECP4CmdLine {}  {
	global Para

	set str "-arch $Para(arch) -type iol"

	switch $Para(mode) {
	"Receive"          { lappend str -mode Receive }
	"Transmit"         { lappend str -mode Transmit }
	}
	if {$Para(trioddr) == "1"} {lappend str -trioddr}
	lappend str -io_type $Para(io_type) -width $Para(width) -freq_in $Para(freq_in)
	if {[string length $Para(interface)] > 0} {
		set i_lst [split $Para(interface) '.']
#		lappend str -clk [string tolower [lindex $i_lst 1]]
	}

#	if {$Para(mode) == "Receive"} {
		if {$Para(negedge) == "DISABLED"} {lappend str -aligned}
#	}

	switch $Para(del) {
	"Bypass"               { lappend str -del -1 }
	"Static Default"       { lappend str -del 128 }
	"Dynamic Default"	   { lappend str -del 128 -dynamic_delay}
	"Static User Defined"  { lappend str -del $Para(fdel) }
	"Dynamic User Defined" { lappend str -del $Para(fdel) -dynamic_delay}
	}
	
	lappend str -gear 1

	#lappend str -dev_e

	return $str
} 

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para
	
	set str [ECP4CmdLine ]

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 460 380
	set pin_flag 1
	DrawImage 220 300 

	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

		set page [$tnb add -label "Configuration"]

		iwidgets::labeledframe .setframe
		set setframe [.setframe childsite]

		set w 28
		CreateLabelCombobox $setframe mode "Interface Type" $w 22 Para(mode) {Transmit Receive} {ChangeValueCmd}
		.lblmode config -anchor w

		checkbutton .cbtrioddr -text "Enable Tri-state Control" -variable Para(trioddr) -command {ChangeValueCmd}
		
		set io_type_lst {LVDS SUBLVDS BLVDS25 MLVDS25 SLVS LVPECL33 SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II SSTL15_I SSTL15_II \
			SSTL15D_I SSTL15D_II SSTL135_I SSTL135_II SSTL135D_I SSTL135D_II HSUL12 HSUL12D LVTTL33 LVTTL33D \
			LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
		CreateLabelCombobox $setframe io_type "I/O Standard for this Interface" $w 22 Para(io_type) $io_type_lst {ChangeValueCmd}
		.lblio_type config -anchor w

		CreateLabelEntryLabel $setframe width "Bus Width for this Interface" 12 "(1 - 256)" "" Para(width) {digit %c}
		.entrywidth config -fixed 5
		.lblwidth config -width $w -anchor w
		.entrywidth.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}
		
		CreateLabelEntryLabel $setframe freq_in "Clock Frequency for this Interface" 12 "(1 - 200MHz)" "" Para(freq_in) real
		.lblfreq_in config -width $w -anchor w
		.entryfreq_in.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}

		CreateLabelEntryLabel $setframe bandwidth "Interface Bandwidth (Calculated)" 12 "Mbits/s" "" Para(bandwidth) real
		.lblbandwidth config -width $w -anchor w
		.entrybandwidth config -state disabled

		CreateLabelCombobox $setframe interface "Interface" $w 16 Para(interface) {GIREG_RX.SCLK} {ChangeValueCmd}
		.lblinterface config -anchor w
		checkbutton .cknegedge -text "Clock Inversion" -variable Para(negedge) -offvalue DISABLED -onvalue ENABLED -command ChangeValueCmd
		pack .lblinterface .cbointerface .cknegedge -in .frminterface -side left
		
		pack .frmmode .frmio_type .frmwidth .frmfreq_in .frmbandwidth .frminterface -in $setframe -side top -padx 12 -pady 4
		pack .cbtrioddr -in $setframe -before .frmio_type -anchor w -padx 30

		set w [expr $w-3]
		set del_lst {"Bypass" "Static Default" "Dynamic Default" "Static User Defined" "Dynamic User Defined"}
		CreateLabelCombobox $setframe del "Data Path Delay" $w 20 Para(del) $del_lst {ChangeValueCmd}
		.lbldel config -anchor w
		
		CreateLabelCombobox $setframe fdel "Delay Value for User Defined" $w 12 Para(fdel) {} {ChangeValueCmd}
		.lblfdel config -anchor w
		for {set i 1} {$i < 128} {incr i} {
			.cbofdel insert list end $i
		}
		
		pack .frmdel .frmfdel -in $setframe -side top -padx 30 -pady 4
		
		pack .setframe -in $page -fill both -expand 1

		$tnb view 0

	GeneralConfig

		ChangeValueCmd

		pack forget .cboBusOrder 
}