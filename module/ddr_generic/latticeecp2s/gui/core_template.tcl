#$Header: L:/module/ddr_generic/latticeecp2s/gui/rcs/core_template.tcl 1.2 2007/07/23 06:14:13Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc ChangeValueCmd {} {
	global Para

	#ISPL_CR_30022 && ISPL_CR_35491
	if {$Para(mode) == "Input" || $Para(mode) == "Bidirectional"}  {
		.cboDelay config -state normal
		.lblDelay config -fg black
	} else  {
		.cboDelay config -state disabled
		.lblDelay config -fg gray50
		set Para(del) Dynamic
	} 

	# Notes 1.
	if {$Para(gear) == "1x"}  {
		.cboDelay clear list
		.cboDelay insert list end "User Defined" "Fixed XGMII" Dynamic
		.ckClk1x config -state normal

		#.cboMode clear list
		#.cboMode insert list end Input Output Bidirectional Tristate
	} else {
		if {$Para(del) == "Fixed XGMII"}  {
			set Para(del) Dynamic
		} 
		.cboDelay clear list
		.cboDelay insert list end "User Defined" Dynamic

		#set Para(clk1x) 0
		#.ckClk1x config -state disabled
	}

	# Notes 4.
	if {$Para(del) == "Fixed XGMII" || $Para(del) == "Dynamic"}  {
		.cboFixed config -state disabled
		.lblFixed config -fg gray50
		set Para(val) 0
	} else  {
		.cboFixed config -state normal
		.lblFixed config -fg black
	} 

	# Notes 5.
	if {$Para(gear) == "1x" && ($Para(mode) == "Input" || $Para(mode) == "Bidirectional")}  {
		.ckClk1x config -state normal
	} else {
		set Para(clk1x) 0
		.ckClk1x config -state disabled
	}
	
	# Notes 6.
	#ISPL_CR_32465 + ISPL_CR_32550 
	if {$Para(mode) == "Input" || $Para(mode) == "Output"}  {
		.cboGear clear list
		.cboGear insert list end 1x 2x
	} else {
		.cboGear clear list
		.cboGear insert list end 1x
		set Para(gear) 1x
	}
	
	# Notes 7.
	if {$Para(gear) == "2x" && ($Para(mode) == "Input" || $Para(mode) == "Bidirectional")}  {
		.ckClk2x config -state normal
	} else {
		set Para(clk2x) 0
		.ckClk2x config -state disabled
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
	}

	#ISPL_CR_31350 && ISPL_CR_35491 
	if {$Para(mode) == "Input" || $Para(mode) == "Bidirectional"}  {
		switch $Para(del) {
			"Fixed XGMII"      { }
			"User Defined"	{ lappend str -del $Para(val)}
			"Dynamic"   { lappend str -del 16}
		}
	}

	if {$Para(gear) == "1x" && ($Para(mode) == "Input" || $Para(mode) == "Bidirectional")}  {
		if {$Para(clk1x) == "1"}  {lappend str -1clk} 
	} 

	if {$Para(gear) == "2x" && ($Para(mode) == "Input" || $Para(mode) == "Bidirectional")}  {
		if {$Para(clk2x) == "1"}  {lappend str -cdiv} 
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
	.lblMode config -width 22 -anchor w

	CreateLabelCombobox $setframe Width "DDR Data Width" 16 8 Para(width) {} {ChangeValueCmd}
	.lblWidth config -width 22 -anchor w
	for {set i 1} {$i < 65} {incr i}  {
		.cboWidth insert list end $i
	} 

	#ISPL_CR_29910
	set gear_lst {1x 2x}
	CreateLabelCombobox $setframe Gear "Gearing Ratio" 16 8 Para(gear) $gear_lst {ChangeValueCmd}
	.lblGear config -width 22 -anchor w

	set delay_lst {Fixed "Fixed XGMII" Dynamic}
	CreateLabelCombobox $setframe Delay Delay 16 12 Para(del) $delay_lst {ChangeValueCmd}
	.lblDelay config -width 22 -anchor w

	set val_lst {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15}
	CreateLabelCombobox $setframe Fixed "Multiplier for Fixed Delay" 16 8 Para(val) $val_lst {ChangeValueCmd}
	.lblFixed config -width 22 -anchor w

	checkbutton .ckClk1x -text "Use Single Clock for 1x" -variable Para(clk1x) -command {ChangeValueCmd}
	checkbutton .ckClk2x -text "Use CLKDIV for 2x" -variable Para(clk2x) -command {ChangeValueCmd}
	
	pack .frmMode .frmWidth .frmGear .frmDelay .frmFixed .ckClk1x .ckClk2x -in $setframe -anchor w -padx 30 -pady 6
	pack .setframe -in $page -fill both -expand 1

	$tnb delete 0
	$tnb view 0

	ChangeValueCmd

	GeneralConfig
}
