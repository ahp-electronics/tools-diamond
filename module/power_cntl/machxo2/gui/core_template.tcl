#$Header: L:/module/power_cntl/machxo2/gui/core_template.tcl 1.11 mghuang Exp $

#Rev 1.11: Diamond 3.4.1 IPExpress: XO3LF support
#Rev 1.10: Diamond 3.1 IPExpress: XO3 support
#Rev 1.8/1.9: Diamond 2.0 IPExpress: POJO2 support.
#Rev 1.7: UM rev 3.38, Diamond 2.0 IPExpress: fixed cr_56492
#Rev 1.6: Diamond 1.2 IPExpress: XO2 UHC/UHE support.
#Rev 1.5: 8.1s1 IPExpress: Corresponding "-wake <x> " options should
	#change the "I2C" to "CFG" and "USER_I2C" to "USER_CFG"
#Rev 1.4: 8.1s1 IPExpress: SEDFC, SCR_1085
#Rev 1.3: 8.1s1 IPExpress: Fixed cr_49830 
#Rev 1.2: Fixed cr_49830,50066 
#Rev 1.1: If Bandgap is TRUE, POR is grayed out and set to TRUE.

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
		set Para(dev_type) [string range $z end-1 end]
	}
	if {$Para(arch) == "xo2c00p"} {
		set Para(dev_type) "HC"
	}
	#set Para(dev_type) $z
	#tk_messageBox -default ok -icon info -message $Para(dev_type) -title GetDevType -type ok
}

proc ChangeBandgapCmd {} {
	global Para 
	if {$Para(dev_type) != "HC"} {
		if {$Para(bandgap_off) == 1} {
			set Para(por_off) 1
			.cbPor_off config -state disabled
		} else {
			.cbPor_off config -state normal
			set Para(por_off) 0
		}
	}
}

proc ChangeValueCmd {} {
	global Para 

	GetDevType
	if {$Para(dev_type) != "HC"} {
		.cbBandgap config -state normal
	} else {
		.cbBandgap config -state disabled
		set Para(bandgap_off) 0
	}

	if {$Para(Dev_Voltage) != "2.5V/3.3V"} {
		.cbBandgap config -state normal
	} else {
		.cbBandgap config -state disabled
		set Para(bandgap_off) 0
	}
	
	if {$Para(bandgap_off) == 1} {
		.cbPor_off config -state disabled
	} else {
		.cbPor_off config -state normal
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

	set str [list -arch $Para(arch) -type power_cntl]

	switch $Para(entry) {
		"User" 					{lappend str -entry USER}
		"Configuration" 		{lappend str -entry CFG}
		"User & Configuration" 	{lappend str -entry USER_CFG}
	}
	switch $Para(s2s) {
		"User" 		{lappend str -s2s USER}
		"Counter" 	{lappend str -s2s COUNTER}
		"Bypass" 	{lappend str -s2s BYPASS}
	}
	switch $Para(wake) {
		"User" 		 		   {lappend str -wake USER}
		"Configuration" 	   {lappend str -wake CFG}
		"User & Configuration" {lappend str -wake USER_CFG}
	}
	if {$Para(standby) == 1} {lappend str -standby}
	if {$Para(bandgap_off) == 1} {lappend str -bandgap_off}
	if {$Para(por_off) == 1} {lappend str -por_off}

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
	AttributeSetting 380 260
	set pin_flag 1
	DrawImage 200 200
	set tnb $Para(tnb)

	wm title . "Lattice FPGA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]
	iwidgets::Labeledframe .frmConfig ;
	set frmConfig [.frmConfig childsite]
	
	#*** Entry Options ***
	iwidgets::Labeledframe .frmEntry -labeltext "Entry Options" -labelpos nw
	set frmEntry [.frmEntry childsite]
	iwidgets::combobox .cboEntry -labeltext "Entry Signals" -textvariable Para(entry) -labelpos w \
				-width 20 -editable false -selectioncommand {ChangeValueCmd}
	.cboEntry insert list end User Configuration "User & Configuration"
	iwidgets::combobox .cboS2S -labeltext "Stop to Standby Delay" -textvariable Para(s2s) -labelpos w \
				-width 20 -editable false -selectioncommand {ChangeValueCmd}
	.cboS2S insert list end User Counter Bypass
	.cboEntry.label config -width 20 -anchor w
	.cboS2S.label config -width 20 -anchor w
	pack .cboEntry .cboS2S -in $frmEntry -anchor w -pady 2

	#*** Wake Options ***
	iwidgets::Labeledframe .frmWake -labeltext "Wake Options" -labelpos nw
	set frmWake [.frmWake childsite]
	iwidgets::combobox .cboWake -labeltext "Wake Signals" -textvariable Para(wake) -labelpos w \
				-width 20 -editable false -selectioncommand {ChangeValueCmd}
	.cboWake insert list end User Configuration
	.cboWake.label config -width 20 -anchor w
	pack .cboWake -in $frmWake -anchor w -pady 2
	
	checkbutton .cbStandby -text "Enable Standby Flags" -variable Para(standby) -command {ChangeValueCmd}
	checkbutton .cbPor_off -text "Turn off POR when in Standby" -variable Para(por_off) -command {ChangeValueCmd}
	checkbutton .cbBandgap -text "Turn off Bandgap when in Standby" -variable Para(bandgap_off) -command {ChangeBandgapCmd;ChangeValueCmd}
	
	pack .frmEntry .frmWake -in $frmConfig -side top -fill x
	pack .cbStandby .cbPor_off .cbBandgap -in $frmConfig -side top -anchor w -padx 10 -pady 2
	
	pack .frmConfig -in $page -side top -fill both -expand 1

	$tnb view 0
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	if {$Para(wake) == "User & Configuration"} {set Para(wake) "User"}
	ChangeValueCmd
	GeneralConfig
}
