#$Header: L:/module/bank_cntl/sa5p00/gui/core_template.tcl 1.0 mghuang Exp $

#Rev 1.0: initial ver.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	DrawPins
} 

proc ChangeValueCmd {} {
	global Para 

	regexp {(^[a-zA-Z]+)4-([0-9]+)?.*$} $Para(PartType) match x y
	#tk_messageBox -default ok -icon warning -message $y -title $Para(PartType) -type ok

#	if {$y == 50 || $y == 130 || $y == 30 || $y == 95}  {
		.cbBank0 config -state disabled
		.cbLvds0  config -state disabled
		.cbPusl0  config -state disabled
		.cbBank1 config -state disabled
		.cbLvds1  config -state disabled
		.cbPusl1  config -state disabled
		.cbBank4 config -state disabled
		.cbLvds4  config -state disabled
		.cbPusl4  config -state disabled
		.cbBank5 config -state disabled
		.cbLvds5  config -state disabled
		.cbPusl5  config -state disabled
		set Para(bank0) 0
		set Para(lvds0) 0
		set Para(pusl0) 0
		set Para(bank1) 0
		set Para(lvds1) 0
		set Para(pusl1) 0
		set Para(bank4) 0
		set Para(lvds4) 0
		set Para(pusl4) 0
		set Para(bank5) 0
		set Para(lvds5) 0
		set Para(pusl5) 0
#	}

	CallDrawPins

	#CR_50341
	if {$Para(bank0) == 1 || $Para(lvds0) == 1 || $Para(pusl0) == 1 ||
		$Para(bank1) == 1 || $Para(lvds1) == 1 || $Para(pusl1) == 1 ||
		$Para(bank2) == 1 || $Para(lvds2) == 1	|| $Para(pusl2) == 1 || 
		$Para(bank3) == 1 || $Para(lvds3) == 1	|| $Para(pusl3) == 1 ||
		$Para(bank4) == 1 || $Para(lvds4) == 1	|| $Para(pusl4) == 1 ||
		$Para(bank5) == 1 || $Para(lvds5) == 1 || $Para(pusl5) == 1 ||
		$Para(bank6) == 1 || $Para(lvds6) == 1 || $Para(pusl6) == 1 ||
		$Para(bank7) == 1 || $Para(lvds7) == 1 || $Para(pusl7) == 1} {
		$Para(generate_cfg) configure -state normal
	} else {
		$Para(generate_cfg) configure -state disabled
	}
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

	set str [list -arch $Para(arch) -type bank_cntl]
	if {$Para(bank0) == 1} {lappend str -bank0}
	if {$Para(bank1) == 1} {lappend str -bank1}
	if {$Para(bank2) == 1} {lappend str -bank2}
	if {$Para(bank3) == 1} {lappend str -bank3}
	if {$Para(bank4) == 1} {lappend str -bank4}
	if {$Para(bank5) == 1} {lappend str -bank5}
	if {$Para(bank6) == 1} {lappend str -bank6}
	if {$Para(bank7) == 1} {lappend str -bank7}
	
	if {$Para(lvds0) == 1} {lappend str -lvds0}
	if {$Para(lvds1) == 1} {lappend str -lvds1}
	if {$Para(lvds2) == 1} {lappend str -lvds2}
	if {$Para(lvds3) == 1} {lappend str -lvds3}
	if {$Para(lvds4) == 1} {lappend str -lvds4}
	if {$Para(lvds5) == 1} {lappend str -lvds5}
	if {$Para(lvds6) == 1} {lappend str -lvds6}
	if {$Para(lvds7) == 1} {lappend str -lvds7}

	if {$Para(pusl0) == 1} {lappend str -pusl0}
	if {$Para(pusl1) == 1} {lappend str -pusl1}
	if {$Para(pusl2) == 1} {lappend str -pusl2}
	if {$Para(pusl3) == 1} {lappend str -pusl3}
	if {$Para(pusl4) == 1} {lappend str -pusl4}
	if {$Para(pusl5) == 1} {lappend str -pusl5}
	if {$Para(pusl6) == 1} {lappend str -pusl6}
	if {$Para(pusl7) == 1} {lappend str -pusl7}

	return $str
}

proc Create_Image {} {
	global Para diagram tnb tcl_platform pin_flag ft 

	package require OrcaModule

	#*** set private value ***

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	global pin_flag

	ProjectSet
	MainInterface
#	AttributeSetting 640 480
	AttributeSetting 540 380
	set pin_flag 1
	DrawImage 200 300
	set tnb $Para(tnb)

	wm title . "Lattice FPGA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]
	iwidgets::Labeledframe .frmConfig ;
	set frmConfig [.frmConfig childsite]
	
	label .lblBank0 -text "Bank 0"
	label .lblBank1 -text "Bank 1"
	label .lblBank2 -text "Bank 2"
	label .lblBank3 -text "Bank 3"
	label .lblBank4 -text "Bank 4"
	label .lblBank5 -text "Bank 5"
	label .lblBank6 -text "Bank 6"
	label .lblBank7 -text "Bank 7"

	checkbutton .cbBank0 -text "Enable Dynamic InRD Control" -variable Para(bank0)  -command {ChangeValueCmd}
	checkbutton .cbBank1 -text "Enable Dynamic InRD Control" -variable Para(bank1)  -command {ChangeValueCmd}
	checkbutton .cbBank2 -text "Enable Dynamic InRD Control" -variable Para(bank2)  -command {ChangeValueCmd}
	checkbutton .cbBank3 -text "Enable Dynamic InRD Control" -variable Para(bank3)  -command {ChangeValueCmd}
	checkbutton .cbBank4 -text "Enable Dynamic InRD Control" -variable Para(bank4)  -command {ChangeValueCmd}
	checkbutton .cbBank5 -text "Enable Dynamic InRD Control" -variable Para(bank5)  -command {ChangeValueCmd}
	checkbutton .cbBank6 -text "Enable Dynamic InRD Control" -variable Para(bank6)  -command {ChangeValueCmd}
	checkbutton .cbBank7 -text "Enable Dynamic InRD Control" -variable Para(bank7)  -command {ChangeValueCmd}

	checkbutton .cbLvds0 -text "Enable Dynamic LVDS Control" -variable Para(lvds0)   -command {ChangeValueCmd}
	checkbutton .cbLvds1 -text "Enable Dynamic LVDS Control" -variable Para(lvds1)   -command {ChangeValueCmd}
	checkbutton .cbLvds2 -text "Enable Dynamic LVDS Control" -variable Para(lvds2)   -command {ChangeValueCmd}
	checkbutton .cbLvds3 -text "Enable Dynamic LVDS Control" -variable Para(lvds3)   -command {ChangeValueCmd}
	checkbutton .cbLvds4 -text "Enable Dynamic LVDS Control" -variable Para(lvds4)   -command {ChangeValueCmd}
	checkbutton .cbLvds5 -text "Enable Dynamic LVDS Control" -variable Para(lvds5)   -command {ChangeValueCmd}
	checkbutton .cbLvds6 -text "Enable Dynamic LVDS Control" -variable Para(lvds6)   -command {ChangeValueCmd}
	checkbutton .cbLvds7 -text "Enable Dynamic LVDS Control" -variable Para(lvds7)   -command {ChangeValueCmd}

	checkbutton .cbPusl0 -text "Enable Dynamic Pull-Up/Slew Control" -variable Para(pusl0)   -command {ChangeValueCmd}
	checkbutton .cbPusl1 -text "Enable Dynamic Pull-Up/Slew Control" -variable Para(pusl1)   -command {ChangeValueCmd}
	checkbutton .cbPusl2 -text "Enable Dynamic Pull-Up/Slew Control" -variable Para(pusl2)   -command {ChangeValueCmd}
	checkbutton .cbPusl3 -text "Enable Dynamic Pull-Up/Slew Control" -variable Para(pusl3)   -command {ChangeValueCmd}
	checkbutton .cbPusl4 -text "Enable Dynamic Pull-Up/Slew Control" -variable Para(pusl4)   -command {ChangeValueCmd}
	checkbutton .cbPusl5 -text "Enable Dynamic Pull-Up/Slew Control" -variable Para(pusl5)   -command {ChangeValueCmd}
	checkbutton .cbPusl6 -text "Enable Dynamic Pull-Up/Slew Control" -variable Para(pusl6)   -command {ChangeValueCmd}
	checkbutton .cbPusl7 -text "Enable Dynamic Pull-Up/Slew Control" -variable Para(pusl7)   -command {ChangeValueCmd}

#	grid .lblBank0 .cbBank0 .cbLvds0 .cbPusl0 -in $frmConfig
#	grid .lblBank1 .cbBank1 .cbLvds1 .cbPusl1 -in $frmConfig -pady 4
#	grid .lblBank2 .cbBank2 .cbLvds2 .cbPusl2 -in $frmConfig
#	grid .lblBank3 .cbBank3 .cbLvds3 .cbPusl3 -in $frmConfig -pady 4
#	grid .lblBank4 .cbBank4 .cbLvds4 .cbPusl4 -in $frmConfig
#	grid .lblBank5 .cbBank5 .cbLvds5 .cbPusl5 -in $frmConfig -pady 4
#	grid .lblBank6 .cbBank6 .cbLvds6 .cbPusl6 -in $frmConfig
#	grid .lblBank7 .cbBank7 .cbLvds7 .cbPusl7 -in $frmConfig -pady 4

	grid .lblBank0 .cbBank0 .cbLvds0 -in $frmConfig
	grid .lblBank1 .cbBank1 .cbLvds1 -in $frmConfig -pady 4
	grid .lblBank2 .cbBank2 .cbLvds2 -in $frmConfig
	grid .lblBank3 .cbBank3 .cbLvds3 -in $frmConfig -pady 4
	grid .lblBank4 .cbBank4 .cbLvds4 -in $frmConfig
	grid .lblBank5 .cbBank5 .cbLvds5 -in $frmConfig -pady 4
	grid .lblBank6 .cbBank6 .cbLvds6 -in $frmConfig
	grid .lblBank7 .cbBank7 .cbLvds7 -in $frmConfig -pady 4
	
	label .lblNote -text "Note: There is no RTL/Functional simulation support for the Dynamic Bank Controller.\n \
	There is only Post PAR simulation support for this silicon specific feature." -justify left
	#grid .lblNote -columnspan 4 -in $frmConfig -pady 6 -sticky w

	pack .frmConfig -in $page -side top -fill both -expand 1

	$tnb view 0
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
	ChangeValueCmd
}
