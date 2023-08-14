#$Header: L:/module/ddr_71/sa5p00/gui/core_template.tcl 1.7 mghuang Exp $

#Rev 1.7: Diamond 3.6 IPExpress: Sapphire SCR_1110 from 10Mhz-108Mhz to 8Mhz-108Mhz
#Rev 1.7: Diamond 3.4 IPExpress: Sapphire IO Logic Usage Model 10.0
#Rev 1.6: Diamond 3.0 IPExpress: Fixed SOF-117782
#Rev 1.4/1.5: Diamond 3.0 IPExpress: Fixed SOF-117094, enable softIP.
#Rev 1.3: Diamond 2.2 IPExpress: SCR_1030
#Rev 1.2: Diamond 2.2 IPExpress: Fixed CR_59660
#Rev 1.1: Diamond 2.2 IPExpress: UM rev 1.3.
#Rev 1.0: Diamond 2.1 IPExpress: intial ver.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(freq_in)] > 0 &&
		[string length $Para(Width)] > 0}  {
		DrawPins
	} 
} 

proc ChangeValueCmd {} {
	global Para
	
	if {$Para(mode) == "Receive"} {
		.cbEnSofIP config -state normal
		.cbenClkIBuf config -state disabled
		set Para(enClkIBuf) 0
	} else {
		.cbEnSofIP config -state disabled
		set Para(EnSofIP) 0
		.cbenClkIBuf config -state normal
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

	set ret [IsInRange "Bus Width" 1 16 $Para(Width)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Clock Frequency" 8 108 $Para(freq_in)]
	if {$ret == "-1"} {return -1}

	return 0
}

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for ecp4 device
proc ECP4CmdLine {}  {
	global Para

	set str "-arch $Para(arch) -type iol"

	lappend str -io_type LVDS
	switch $Para(mode) {
	"Receive"          { lappend str -mode Receive}
	"Transmit"         { lappend str -mode Transmit}
	}
	if {[string length $Para(freq_in)] > 0} {lappend str -freq_in $Para(freq_in)}
	if {$Para(Width) > 0}  {lappend str -width $Para(Width)}
	lappend str -gear 7
	if {$Para(EnSofIP) == "1"} {lappend str -bw_align}
	if {$Para(enClkIBuf) == "1"} {lappend str -clkibuf $Para(ClkIBuf)}

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
	AttributeSetting 400 320
	set pin_flag 1
	DrawImage 220 300 

	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]

	iwidgets::labeledframe .setframe
	set setframe [.setframe childsite]

	set w 28
	CreateLabelCombobox $setframe mode "Interface Type" $w 16 Para(mode) {Transmit Receive} {ChangeValueCmd}
	.lblmode config -anchor w
	
	CreateLabelEntryLabel $setframe Width "Bus Width" 10 "(1 - 16)" "" Para(Width) integer
	#.entryWidth config -state disabled
	.lblWidth config -width $w -anchor w
	.entryWidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entryWidth config -fixed 2

	CreateLabelEntryLabel $setframe freq_in "Clock Frequency (Pixel Clock)" 12 "(8 - 108MHz)" "" Para(freq_in) real
	.lblfreq_in config -width $w -anchor w
	.entryfreq_in.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

	checkbutton .cbEnSofIP -text "Enable Bit Alignment & Word Alignment Soft IP" -variable Para(EnSofIP) -command {ChangeValueCmd}
	
	pack .frmmode .frmWidth .frmfreq_in -in $setframe -side top -padx 12 -pady 4
	pack .cbEnSofIP -in $setframe -side top -anchor w -padx 12 -pady 4

	checkbutton .cbenClkIBuf -text "Reference Clock from I/O Pin" -variable Para(enClkIBuf) -command {ChangeValueCmd}
	pack .cbenClkIBuf -in $setframe -side top -anchor w -padx 12 -pady 4

	set rx_type_lst {LVDS SUBLVDS BLVDS25 MLVDS25 SLVS LVPECL33 LVTTL33 LVTTL33D \
				LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
	CreateLabelCombobox $setframe ClkIBuf "Reference Clock Input Buffer Type" 30 16 Para(ClkIBuf) $rx_type_lst {ChangeValueCmd}
	.lblClkIBuf config -anchor w
	pack .frmClkIBuf -in $setframe -side top -anchor w -padx 25 -pady 4

	pack .setframe -in $page -fill both -expand 1

#		$tnb view 0

	GeneralConfig

	ChangeValueCmd

	pack forget .cboBusOrder 
	
	$tnb delete 0
	$tnb view 0
}