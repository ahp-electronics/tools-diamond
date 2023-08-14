#$Header: L:/module/ddr/latticeecp2/gui/rcs/core_template.tcl 1.2 2006/02/08 03:11:59Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc ChangeValueCmd {} {
	global Para

	#ISPL_CR_30022
	if {$Para(mode) == "Input" || $Para(mode) == "Bidirectional"}  {
		.cboDelay config -state normal
	} else  {
		.cboDelay config -state disabled
		set Para(del) None
	} 

	if {$Para(del) == "Fixed"}  {
		.cboFixed config -state normal
		.lblFixed config -fg black
	} else  {
		.cboFixed config -state disabled
		.lblFixed config -fg gray50
		set Para(val) 0
	} 

	if {[string length $Para(width)] > 0} {DrawPins}
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

	set ret [IsInRange "Bus Width" 1 64 $Para(width)]
	if {$ret == "-1"} {return -1}

	return 0
}

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for Lattiec-ECP2 device
proc Or5a00Cmd {}  {
	global Para

	set str "-arch $Para(arch) -type iol"

	switch $Para(mode) {
	"Input"          { lappend str -mode in }
	"Output"         { lappend str -mode out }
	"Bidirectional"  { lappend str -mode io }
	"Tristate"       { lappend str -mode tri }
	}
	lappend str -width $Para(width)

	switch $Para(gear) {
	"1x" { lappend str -gear 1 }
	"2x" { lappend str -gear 2 }
	"4x" { lappend str -gear 4 }
	}

	if {$Para(gear) != "1x"}  {
		#if {$Para(cdiv) == "1"}  {lappend str -cdiv} 
	} 

	switch $Para(del) {
	"None"      { }
	"Fixed"		{ lappend str -del [expr $Para(val)/50]}
	"Dynamic"   { lappend str -del 16}
	}

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
	
	switch $Para(CmdLine)  {
		EC_CMD  {set str [Or5a00Cmd ]}
		default {set str [GeneralCmd]}
	} 

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {
	global Para pin_flag

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 380 370
	set pin_flag 1
	DrawImage 220 300 

	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]

	iwidgets::labeledframe .setframe
	set setframe [.setframe childsite]

	set mode_lst {Input Output Bidirectional Tristate}
	CreateLabelCombobox $setframe Mode Mode 16 12 Para(mode) $mode_lst {ChangeValueCmd}
	.lblMode config -width 16 -anchor w

	CreateLabelCombobox $setframe Width "DDR Data Width" 16 8 Para(width) {} {ChangeValueCmd}
	.lblWidth config -width 16 -anchor w
	for {set i 1} {$i < 65} {incr i}  {
		.cboWidth insert list end $i
	} 

	#ISPL_CR_29910
	set gear_lst {1x 2x}
	CreateLabelCombobox $setframe Gear "Gearing Ratio" 16 8 Para(gear) $gear_lst {ChangeValueCmd}
	.lblGear config -width 16 -anchor w

	set delay_lst {None Fixed Dynamic}
	CreateLabelCombobox $setframe Delay Delay 16 12 Para(del) $delay_lst {ChangeValueCmd}
	.lblDelay config -width 16 -anchor w

	set val_lst {0 50 100 150 200 250 300 350 400 450 500 550 600 650 700 750}
	CreateLabelCombobox $setframe Fixed "Fixed Delay" 16 8 Para(val) $val_lst {ChangeValueCmd}
	.lblFixed config -width 16 -anchor w

	pack .frmMode .frmWidth .frmGear .frmDelay .frmFixed -in $setframe -anchor w -padx 30 -pady 6
	pack .setframe -in $page -fill both -expand 1

	$tnb view 0

	ChangeValueCmd

	GeneralConfig
}
