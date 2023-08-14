#$Header: L:/module/bank_cntl/machxo2/gui/core_template.tcl 1.8 mghuang Exp $

#Rev 1.8: Diamond 3.4.1 IPExpress: XO3LF support
#Rev 1.7: Diamond 3.4 IPExpress: Fixed sof-122495
#Rev 1.6: Diamond 3.1 IPExpress: XO3 support
#Rev 1.5: UB1_2 IPExpress: Fixed cr_52130
#Rev 1.4: UB1_2 IPExpress: XO2 WLCSP support
#Rev 1.3: 8.1s1 IPExpress: Fixed cr_500341
#Rev 1.2: 8.1s1 IPExpress: Fixed cr_50084
#Rev 1.1: 8.1p IPExpress: Fixed cr_49935

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	DrawPins
} 

proc GetDevType {} {
	global Para

	if {$Para(arch) == "xo2c00" || $Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
		regexp {(^[a-zA-Z0-9]+)-([0-9]+)?(.*)$} $Para(PartType) match x y z
		set Para(dev_size) $y
		set Para(dev_type) $z
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

proc ChangeValueCmd {} {
	global Para 

	#regexp {(^[a-zA-Z]+)2-([0-9]+)?.*$} $Para(PartType) match x y
	set y $Para(dev_size)

	if {$y == 256 || $y == 640}  {
		.cbLvds  config -state disabled
		.cbBank4 config -state disabled
		.cbBank5 config -state disabled
		set Para(lvds)  0
		set Para(bank4) 0
		set Para(bank5) 0
	}

	if {$y == 1200}  {
		.cbBank4 config -state disabled
		.cbBank5 config -state disabled
		set Para(bank4) 0
		set Para(bank5) 0
	}
	
	#XO2 WLCSP support
	#sof-122495 
	#XO2-1200 bank 0/2
	#XO2-2000 bank 0/2/5
	#xo3-1300 bank 0/2/3
	#xo3-2100 bank 0/2/5
	#xo3-4300 bank 0/2/3/5
	if {[string first "WLCSP" $Para(Package)] != -1} {
		.cbBank1 config -state disabled
		.cbBank4 config -state disabled
		.cbLvds  config -state disabled
		set Para(bank1) 0
		set Para(bank4) 0
		set Para(lvds)  0
		if {$y == 1200} {
			.cbBank3 config -state disabled
			set Para(bank3) 0
			.cbBank5 config -state disabled
			set Para(bank5) 0
		}
		if {$y == 2000 || $y == 2100} {
			.cbBank3 config -state disabled
			set Para(bank3) 0
			.cbBank5 config -state normal
		}
		if {$y == 1300} {
			.cbBank3 config -state normal
			.cbBank5 config -state disabled
			set Para(bank5) 0
		}
		if {$y == 4300} {
			.cbBank3 config -state normal
			.cbBank5 config -state normal
		}
	}
	
	CallDrawPins

if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	#CR_50341
	if {$Para(bank0) == 1 || $Para(lvds) == 1 || $Para(bank1) == 1
		|| $Para(bank2) == 1 || $Para(bank3) == 1 || $Para(bank4) == 1 
		|| $Para(bank5) == 1 || $Para(slewrate0) == 1 || $Para(slewrate1) == 1 || $Para(slewrate2) == 1 || $Para(slewrate3) == 1 || $Para(slewrate4) == 1 || $Para(slewrate5) == 1} {
		$Para(generate_cfg) configure -state normal
	} else {
		$Para(generate_cfg) configure -state disabled
	}
} else {
	#CR_50341
	if {$Para(bank0) == 1 || $Para(lvds) == 1 || $Para(bank1) == 1
		|| $Para(bank2) == 1 || $Para(bank3) == 1 || $Para(bank4) == 1 
		|| $Para(bank5) == 1} {
		$Para(generate_cfg) configure -state normal
	} else {
		$Para(generate_cfg) configure -state disabled
	}
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
	if {$Para(lvds) == 1} {lappend str -lvds}
	if {$Para(bank1) == 1} {lappend str -bank1}
	if {$Para(bank2) == 1} {lappend str -bank2}
	if {$Para(bank3) == 1} {lappend str -bank3}
	if {$Para(bank4) == 1} {lappend str -bank4}
	if {$Para(bank5) == 1} {lappend str -bank5}
	if {$Para(slewrate0) == 1} {lappend str -slewrate0}
	if {$Para(slewrate1) == 1} {lappend str -slewrate1}
	if {$Para(slewrate2) == 1} {lappend str -slewrate2}
	if {$Para(slewrate3) == 1} {lappend str -slewrate3}
	if {$Para(slewrate4) == 1} {lappend str -slewrate4}
	if {$Para(slewrate5) == 1} {lappend str -slewrate5}

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
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {	
	AttributeSetting 630 260
} else {	
	AttributeSetting 480 260
}
	set pin_flag 1
	DrawImage 200 200
	set tnb $Para(tnb)

	GetDevType

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
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {	
	checkbutton .cbBank0 -text "Enable Dynamic InRD Control" -variable Para(bank0)  -command {ChangeValueCmd}
	checkbutton .cbSlewrate0  -text "Enable Dynamic Slewrate Controller" -variable Para(slewrate0)   -command {ChangeValueCmd}
	checkbutton .cbLvds  -text "Enable Dynamic LVDS Control" -variable Para(lvds)   -command {ChangeValueCmd}
	checkbutton .cbBank1 -text "Enable Dynamic InRD Control" -variable Para(bank1)  -command {ChangeValueCmd}
	checkbutton .cbSlewrate1  -text "Enable Dynamic Slewrate Controller" -variable Para(slewrate1)   -command {ChangeValueCmd}
	checkbutton .cbBank2 -text "Enable Dynamic InRD Control" -variable Para(bank2)  -command {ChangeValueCmd}
	checkbutton .cbSlewrate2  -text "Enable Dynamic Slewrate Controller" -variable Para(slewrate2)   -command {ChangeValueCmd}
	checkbutton .cbBank3 -text "Enable Dynamic InRD Control" -variable Para(bank3)  -command {ChangeValueCmd}
	checkbutton .cbSlewrate3  -text "Enable Dynamic Slewrate Controller" -variable Para(slewrate3)   -command {ChangeValueCmd}
	checkbutton .cbBank4 -text "Enable Dynamic InRD Control" -variable Para(bank4)  -command {ChangeValueCmd}
	checkbutton .cbSlewrate4  -text "Enable Dynamic Slewrate Controller" -variable Para(slewrate4)   -command {ChangeValueCmd}
	checkbutton .cbBank5 -text "Enable Dynamic InRD Control" -variable Para(bank5)  -command {ChangeValueCmd}
	checkbutton .cbSlewrate5  -text "Enable Dynamic Slewrate Controller" -variable Para(slewrate5)   -command {ChangeValueCmd}
	grid .lblBank0 .cbBank0 .cbSlewrate0 .cbLvds -in $frmConfig
	grid .lblBank1 .cbBank1 .cbSlewrate1 -in $frmConfig -pady 2
	grid .lblBank2 .cbBank2 .cbSlewrate2 -in $frmConfig
	grid .lblBank3 .cbBank3 .cbSlewrate3 -in $frmConfig -pady 2
	grid .lblBank4 .cbBank4 .cbSlewrate4 -in $frmConfig
	grid .lblBank5 .cbBank5 .cbSlewrate5 -in $frmConfig -pady 2
} else {	
	checkbutton .cbBank0 -text "Enable Dynamic InRD Control" -variable Para(bank0)  -command {ChangeValueCmd}
	checkbutton .cbLvds  -text "Enable Dynamic LVDS Control" -variable Para(lvds)   -command {ChangeValueCmd}
	checkbutton .cbBank1 -text "Enable Dynamic InRD Control" -variable Para(bank1)  -command {ChangeValueCmd}
	checkbutton .cbBank2 -text "Enable Dynamic InRD Control" -variable Para(bank2)  -command {ChangeValueCmd}
	checkbutton .cbBank3 -text "Enable Dynamic InRD Control" -variable Para(bank3)  -command {ChangeValueCmd}
	checkbutton .cbBank4 -text "Enable Dynamic InRD Control" -variable Para(bank4)  -command {ChangeValueCmd}
	checkbutton .cbBank5 -text "Enable Dynamic InRD Control" -variable Para(bank5)  -command {ChangeValueCmd}
	grid .lblBank0 .cbBank0 .cbLvds -in $frmConfig
	grid .lblBank1 .cbBank1 -in $frmConfig -pady 2
	grid .lblBank2 .cbBank2 -in $frmConfig
	grid .lblBank3 .cbBank3 -in $frmConfig -pady 2
	grid .lblBank4 .cbBank4 -in $frmConfig
	grid .lblBank5 .cbBank5 -in $frmConfig -pady 2
}
	
	
	label .lblNote -text "Note: There is no RTL/Functional simulation support for the Dynamic Bank Controller.\n \
	There is only Post PAR simulation support for this silicon specific feature." -justify left
	grid .lblNote -columnspan 3 -in $frmConfig -pady 6

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
