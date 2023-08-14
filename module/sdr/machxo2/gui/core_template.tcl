#$Header: L:/module/sdr/machxo2/gui/core_template.tcl 1.8 mghuang Exp $

#Rev 1.8: Diamond 3.4.1 IPExpress: XO3LF support
#Rev 1.7: Diamond 3.1 IPExpress: Fixed SOF-119587
#Rev 1.6: Diamond 3.1 IPExpress: Fixed SOF-118791
#Rev 1.5: Diamond 3.0 IPExpress: Fixed SOF-115805, MachXO2_SysFunction_Usage_Model_v2.40_08_05_13
#Rev 1.4: [XO2 R8.1SP1] SCR 1082 - Remove HSTL15
#Rev 1.3: fixed 48487
#Rev 1.2: Fixed #48616

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
	if {$Para(freq_in) == "-" || $Para(freq_in) == "."} {set Para(freq_in) ""}
	if {[string length $Para(freq_in)] == 0 || [string length $Para(width)] == 0} {
		set Para(bandwidth) 0
	} else {
		set Para(bandwidth) [expr $Para(freq_in) * $Para(width)]
	}
	
	if {$Para(mode) == "Receive"} {
	#[XO2 R8.1SP1] SCR 1082 - Remove HSTL15
		if {$Para(arch) == "xo2c00" || $Para(arch) == "xo2c00p"} {
			set io_type_lst {LVDS25 RSDS25 BLVDS25 MLVDS25 LVPECL33 SSTL25_I SSTL25_II SSTL25D_I SSTL25D_II \
			SSTL18_I SSTL18_II SSTL18D_I SSTL18D_II HSTL18_I HSTL18_II HSTL18D_I HSTL18D_II PCI33 \
			LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS25R33 LVCMOS18 LVCMOS18D LVCMOS18R33 LVCMOS18R25 \
			LVCMOS15 LVCMOS15D LVCMOS15R33 LVCMOS15R25 LVCMOS12 LVCMOS12D LVCMOS10R25 LVCMOS10R33 LVCMOS12R25 LVCMOS12R33 VREF1_DRIVER}
		}
		if {$Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
			set io_type_lst {LVDS25 BLVDS25 MLVDS25 LVPECL33 LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D \
			LVCMOS18 LVCMOS15 LVCMOS12 LVCMOS10R25 LVCMOS10R33 LVCMOS12R25 LVCMOS12R33}
		}
	} else {
	#[XO2 R8.1SP1] SCR 1082 - Remove HSTL15
		if {$Para(arch) == "xo2c00" || $Para(arch) == "xo2c00p"} {
			set io_type_lst {LVDS25 LVDS25E BLVDS25E MLVDS25E LVPECL33E RSDS25E HSTL18_I HSTL18D_I SSTL18_I \
			SSTL18D_I SSTL25_I PCI33 LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS18D LVCMOS15 \
			LVCMOS15D LVCMOS12 LVCMOS12D}
		}
		if {$Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
			set io_type_lst {LVDS25 LVDS25E BLVDS25E MLVDS25E LVPECL33E LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D \
			LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
		}
	}
	
	if {$Para(mode) == "Receive"} {
		.cboio_type clear list
		foreach x $io_type_lst {
			.cboio_type insert list end $x
		}		
		if {[lsearch $io_type_lst $Para(io_type)] ==-1} {set Para(io_type) LVCMOS25}
		set interface_lst {GIREG_RX.SCLK}
		set Para(interface) "GIREG_RX.SCLK"
		
		.lbldel config -state normal
		.cbodel config -state normal
		set del_lst {Bypass SCLK_ZEROHOLD "User Defined"}
		if {[lsearch $del_lst $Para(del)] == -1} {set Para(del) "Bypass"}
		.cbodel clear list
		foreach x $del_lst {
			.cbodel insert list end $x
		}
		
		#.cknegedge config -state normal
	} else {
		.cboio_type clear list
		foreach x $io_type_lst {
			.cboio_type insert list end $x
		}
		if {[lsearch $io_type_lst $Para(io_type)] ==-1} {set Para(io_type) LVCMOS25}

		set interface_lst {GOREG_TX.SCLK}
		if {[lsearch $interface_lst $Para(interface)] == -1} {set Para(interface) "GOREG_TX.SCLK"}

		.lbldel config -state disabled
		.cbodel config -state disabled
		set Para(del) ""

		#SOF-115805
		#.cknegedge config -state disabled
		#set Para(negedge) DISABLED
	}
	
	.cbointerface clear list
	foreach x $interface_lst {
		.cbointerface insert list end $x
	}

	if {$Para(del) == "User Defined"} {
		.lblfdel config -state normal
		.cbofdel config -state normal
		set fdel_lst {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31}
		if {[lsearch $fdel_lst $Para(fdel)] ==-1} {set Para(fdel) 0}
	} else {
		.lblfdel config -state disabled
		.cbofdel config -state disabled
		set Para(fdel) ""
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

	set ret [IsInRange "Bus Width" 1 128 $Para(width)]
	if {$ret == "-1"} {return -1}

	set ret [IsInRange "Clock Frequency" 1 166 $Para(freq_in)]
	if {$ret == "-1"} {return -1}

	return 0
}

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for xo2 device
proc XO2CmdLine {}  {
	global Para

	set str "-arch $Para(arch) -type iol"

	switch $Para(mode) {
	"Receive"          { lappend str -mode in }
	"Transmit"         { lappend str -mode out }
	}
	lappend str -io_type $Para(io_type) -width $Para(width) -freq_in $Para(freq_in)
	if {[string length $Para(interface)] > 0} {
		set i_lst [split $Para(interface) '.']
		lappend str -clk [string tolower [lindex $i_lst 1]]
	}

	if {$Para(negedge) == "DISABLED"} {lappend str -aligned}

	if {$Para(mode) == "Receive"}  {
		switch $Para(del) {
		"Bypass"        { lappend str -del -1 }
		"SCLK_ZEROHOLD" { lappend str -del 32 }
		"User Defined"  { lappend str -del $Para(fdel) }
		}
	}
	
	lappend str -gear 0

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
	
	set str [XO2CmdLine ]

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
		
	#[XO2 R8.1SP1] SCR 1082 - Remove HSTL15
#		set io_type_lst {LVDS25 RSDS25 BLVDS25 MLVDS25 LVPECL33 SSTL25_I SSTL25_II SSTL25D_I SSTL25D_II SSTL18_I SSTL18_II \
#			SSTL18D_I SSTL18D_II HSTL18_I HSTL18_II HSTL18D_I HSTL18D_II HSTL15_I HSTL15_II HSTL15D_I HSTL15D_II PCI33 \
#			LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS25R33 LVCMOS18 LVCMOS18D LVCMOS18R33 LVCMOS18R25 \
#			LVCMOS15 LVCMOS15D LVCMOS15R33 LVCMOS15R25 LVCMOS12 LVCMOS12D VREF1_DRIVER}
		set io_type_lst {LVDS25 RSDS25 BLVDS25 MLVDS25 LVPECL33 SSTL25_I SSTL25_II SSTL25D_I SSTL25D_II SSTL18_I SSTL18_II \
			SSTL18D_I SSTL18D_II HSTL18_I HSTL18_II HSTL18D_I HSTL18D_II PCI33 \
			LVTTL33 LVTTL33D LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS25R33 LVCMOS18 LVCMOS18D LVCMOS18R33 LVCMOS18R25 \
			LVCMOS15 LVCMOS15D LVCMOS15R33 LVCMOS15R25 LVCMOS12 LVCMOS12D LVCMOS10R25 LVCMOS10R33 LVCMOS12R25 LVCMOS12R33 VREF1_DRIVER}
		CreateLabelCombobox $setframe io_type "I/O Standard for this Interface" $w 22 Para(io_type) $io_type_lst {ChangeValueCmd}
		.lblio_type config -anchor w

		CreateLabelEntryLabel $setframe width "Bus Width for this Interface" 12 "(1 - 128)" "" Para(width) {digit %c}
		.lblwidth config -width $w -anchor w
		.entrywidth.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}
		
		CreateLabelEntryLabel $setframe freq_in "Clock Frequency for this Interface" 12 "(1 - 166MHz)" "" Para(freq_in) real
		.lblfreq_in config -width $w -anchor w
		.entryfreq_in.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}

		CreateLabelEntryLabel $setframe bandwidth "Bandwidth (Calculated)" 12 "Mbits/s" "" Para(bandwidth) real
		.lblbandwidth config -width $w -anchor w
		.entrybandwidth config -state disabled

		CreateLabelCombobox $setframe interface "Interface" $w 16 Para(interface) {GIREG_RX.SCLK} {ChangeValueCmd}
		.lblinterface config -anchor w
		checkbutton .cknegedge -text "Clock Inversion" -variable Para(negedge) -offvalue DISABLED -onvalue ENABLED -command ChangeValueCmd
		pack .lblinterface .cbointerface .cknegedge -in .frminterface -side left
		
		pack .frmmode .frmio_type .frmwidth .frmfreq_in .frmbandwidth .frminterface -in $setframe -side top -padx 12 -pady 4

		set w [expr $w-3]
		CreateLabelCombobox $setframe del "Data Path Delay" $w 16 Para(del) {Bypass SCLK_ZEROHOLD "User Defined"} {ChangeValueCmd}
		.lbldel config -anchor w
		
		set fdel_lst {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31}
		CreateLabelCombobox $setframe fdel "FDEL for User Defined" $w 12 Para(fdel) $fdel_lst {ChangeValueCmd}
		.lblfdel config -anchor w
		
		pack .frmdel .frmfdel -in $setframe -side top -padx 30 -pady 4
		
		pack .setframe -in $page -fill both -expand 1

		$tnb view 0

	GeneralConfig

		ChangeValueCmd

		pack forget .cboBusOrder 
}