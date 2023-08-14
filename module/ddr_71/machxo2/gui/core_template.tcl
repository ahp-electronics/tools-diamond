#$Header: L:/module/ddr_71/machxo2/gui/core_template.tcl 1.2 mghuang Exp $

#Rev 1.2: Diamond 3.2 IPExpress: Fixed SOF-118781.
#Rev 1.1: 8.1s1 IPExpress: Fixed cr_49608

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

	set ret [IsInRange "Data Width" 1 21 $Para(Width)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Clock Frequency" 10 108 $Para(freq_in)]
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

	lappend str -io_type LVDS25
	switch $Para(mode) {
	"Receive"          { lappend str -mode ddr71i}
	"Transmit"         { lappend str -mode ddr71o}
	}
	lappend str -freq_in $Para(freq_in)
	if {$Para(Width) > 0}  {lappend str -width $Para(Width)}

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
	AttributeSetting 400 320
	set pin_flag 1
	DrawImage 220 300 

	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]

	iwidgets::labeledframe .setframe
	set setframe [.setframe childsite]

	set w 26
	CreateLabelCombobox $setframe mode "Interface Type" $w 16 Para(mode) {Transmit Receive} {ChangeValueCmd}
	.lblmode config -anchor w
	
	CreateLabelEntryLabel $setframe Width "Data Width" 10 "(1 - 21)" "" Para(Width) {digit %c}
	#.entryWidth config -state disabled
	.lblWidth config -width $w -anchor w
	.entryWidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entryWidth config -fixed 2

	CreateLabelEntryLabel $setframe freq_in "High-Speed Clock Frequency\n(pixel clock)" 12 "(10 - 108MHz)" "" Para(freq_in) real
	.lblfreq_in config -width $w -anchor w

	pack .frmmode .frmWidth .frmfreq_in -in $setframe -side top -padx 12 -pady 4
	pack .setframe -in $page -fill both -expand 1

#		$tnb view 0

	GeneralConfig

	ChangeValueCmd

	pack forget .cboBusOrder 
	
	$tnb delete 0
	$tnb view 0
}