#$Header: L:/module/pmu/sn5w00/gui/core_template.tcl 1.1  Exp $

#Rev 1.1: Diamond 3.6: intial ver.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	DrawBusPins
}

proc ChangeValueCmd {} {
	global Para	
	
	if {$Para(enable_wdt_normal) == 0} {
		.lblwdtmodeselection config -state disabled
		.lblwdtmodeselection_space config -state disabled
		.cbouser_mode_selection config -state disabled
		.lblwdtusermode config -state disabled
		.lblwdtusermode_space config -state disabled
		.cbowdt_user_mode config -state disabled
		.lblwdtinterrupts config -state disabled
		.lblwdtinterrupts_space config -state disabled
		.ck1wdt_interrupts config -state disabled
	} else {
		.lblwdtmodeselection config -state normal
		.lblwdtmodeselection_space config -state normal
		.cbouser_mode_selection config -state normal
		.lblwdtusermode config -state normal
		.lblwdtusermode_space config -state normal
		.cbowdt_user_mode config -state normal
		.lblwdtinterrupts config -state normal
		.lblwdtinterrupts_space config -state normal
		.ck1wdt_interrupts config -state normal
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
	
	set maxHH 8	
	set maxMMSS 59
	set ret [IsInRange "WDT Counter 1 (HH)" 0 $maxHH [scan $Para(InputHH1) {%11d}]]
	if {$ret == -1} {return -1} 	
	set ret [IsInRange "WDT Counter 1 (MM)" 0 $maxMMSS [scan $Para(InputMM1) {%11d}]]
	if {$ret == -1} {return -1} 
	set ret [IsInRange "WDT Counter 1 (SS)" 0 $maxMMSS [scan $Para(InputSS1) {%11d}]]
	if {$ret == -1} {return -1} 
	
	set ret [IsInRange "WDT Counter 2 (HH)" 0 $maxHH [scan $Para(InputHH2) {%11d}]]
	if {$ret == -1} {return -1} 	
	set ret [IsInRange "WDT Counter 2 (MM)" 0 $maxMMSS [scan $Para(InputMM2) {%11d}]]
	if {$ret == -1} {return -1} 
	set ret [IsInRange "WDT Counter 2 (SS)" 0 $maxMMSS [scan $Para(InputSS2) {%11d}]]
	if {$ret == -1} {return -1} 
	
	set ret [IsInRange "WDT Counter 3 (HH)" 0 $maxHH [scan $Para(InputHH3) {%11d}]]
	if {$ret == -1} {return -1} 
	set ret [IsInRange "WDT Counter 3 (MM)" 0 $maxMMSS [scan $Para(InputMM3) {%11d}]]
	if {$ret == -1} {return -1} 
	set ret [IsInRange "WDT Counter 3 (SS)" 0 $maxMMSS [scan $Para(InputSS3) {%11d}]]
	if {$ret == -1} {return -1} 
	
	
	set tit "Check Parameter"
	set max 28800
	set value_msg "between 00:00:00 and 08:00:00"
	set pmu_wdt_count1_time [expr int([scan $Para(InputHH1) {%11d}]*3600+[scan $Para(InputMM1) {%11d}]*60+[scan $Para(InputSS1) {%11d}])]		
	if {$pmu_wdt_count1_time > $max}  {
		set msg "WDT Counter 1 should be $value_msg!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 
	
	set pmu_wdt_count2_time [expr int([scan $Para(InputHH2) {%11d}]*3600+[scan $Para(InputMM2) {%11d}]*60+[scan $Para(InputSS2) {%11d}])]	
	if {$pmu_wdt_count2_time > $max}  {
		set msg "WDT Counter 2 should be $value_msg!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 
	
	set pmu_wdt_count3_time [expr int([scan $Para(InputHH3) {%11d}]*3600+[scan $Para(InputMM3) {%11d}]*60+[scan $Para(InputSS3) {%11d}])]	
	if {$pmu_wdt_count3_time > $max}  {
		set msg "WDT Counter 3 should be $value_msg!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}	

	if {$Para(wdt_mode) == "WDT COUNTER_1" && $pmu_wdt_count1_time == 0}	{
		set msg "Watch Dog Timer Counter values(WDT COUNTER_1) are not updated from default in Wake Up option."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return 0
	}
	if {$Para(wdt_mode) == "WDT COUNTER_2" && $pmu_wdt_count2_time == 0} {
		set msg "Watch Dog Timer Counter values(WDT COUNTER_2) are not updated from default in Wake Up option."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return 0
	}
	if {$Para(wdt_mode) == "WDT COUNTER_3" && $pmu_wdt_count3_time == 0} {
		set msg "Watch Dog Timer Counter values(WDT COUNTER_3) are not updated from default in Wake Up option."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return 0
	}

	if {$Para(enable_wdt_normal) == 1 && $Para(wdt_user_mode) == "WDT COUNTER_1" && $pmu_wdt_count1_time == 0}	{
		set msg "Watch Dog Timer Counter values(WDT COUNTER_1) are not updated from default in WDT User Mode option."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return 0
	}
	if {$Para(enable_wdt_normal) == 1 && $Para(wdt_user_mode) == "WDT COUNTER_2" && $pmu_wdt_count2_time == 0} {
		set msg "Watch Dog Timer Counter values(WDT COUNTER_2) are not updated from default in WDT User Mode option."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return 0
	}
	if {$Para(enable_wdt_normal) == 1 && $Para(wdt_user_mode) == "WDT COUNTER_3" && $pmu_wdt_count3_time == 0} {	
		set msg "Watch Dog Timer Counter values(WDT COUNTER_3) are not updated from default in WDT User Mode option."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return 0
	}
	
	return 0
}

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for snow device
proc SnowCmdLine {}  {
	global Para

	set str [list -type efb -arch $Para(arch)]
	if {$Para(external_user_wake_up) == 1} {lappend str -pmu_external_user}
	if {$Para(user_i2c_wake_up) == 1} {lappend str -pmu_user_i2c}
	if {$Para(user_wdt_expiry) == 1} {lappend str -pmu_wdt_expiry}
	
	set pmu_wdt_no 1
	if {$Para(wdt_mode) == "WDT COUNTER_1"} { set pmu_wdt_no 1 }
	if {$Para(wdt_mode) == "WDT COUNTER_2"} { set pmu_wdt_no 2 }
	if {$Para(wdt_mode) == "WDT COUNTER_3"} { set pmu_wdt_no 3 }
	lappend str -pmu_wdt $pmu_wdt_no

	if {!([string trim $Para(InputHH1)] == "" || [string trim $Para(InputMM1)] == "" || [string trim $Para(InputSS1)] == "")} {
		set pmu_wdt_count1_time [expr int([scan $Para(InputHH1) {%11d}]*3600+[scan $Para(InputMM1) {%11d}]*60+[scan $Para(InputSS1) {%11d}])]
		lappend str -pmu_counter1 $pmu_wdt_count1_time
	}
	
	if {!([string trim $Para(InputHH2)] == "" || [string trim $Para(InputMM2)] == "" || [string trim $Para(InputSS2)] == "")} {
		set pmu_wdt_count2_time [expr int([scan $Para(InputHH2) {%11d}]*3600+[scan $Para(InputMM2) {%11d}]*60+[scan $Para(InputSS2) {%11d}])]
		lappend str -pmu_counter2 $pmu_wdt_count2_time
	}
	
	if {!([string trim $Para(InputHH3)] == "" || [string trim $Para(InputMM3)] == "" || [string trim $Para(InputSS3)] == "")} {
		set pmu_wdt_count3_time [expr int([scan $Para(InputHH3) {%11d}]*3600+[scan $Para(InputMM3) {%11d}]*60+[scan $Para(InputSS3) {%11d}])]
		lappend str -pmu_counter3 $pmu_wdt_count3_time
	}
	
	if {$Para(enable_wdt_normal) == 0} {
		lappend str -pmu_wdt_user_mode 0
	} else {	
		if {$Para(user_mode_selection) == "Count Repetitively"} { lappend str -pmu_count_repeat }
		set pmu_wdt_user_no 1
		if {$Para(wdt_user_mode) == "WDT COUNTER_1"} { set pmu_wdt_user_no 1 }
		if {$Para(wdt_user_mode) == "WDT COUNTER_2"} { set pmu_wdt_user_no 2 }
		if {$Para(wdt_user_mode) == "WDT COUNTER_3"} { set pmu_wdt_user_no 3 }
		lappend str -pmu_wdt_user_mode $pmu_wdt_user_no
		if {$Para(wdt_interrupts) == 1} { lappend str -pmu_interrupt_enable }
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
	
	set str [SnowCmdLine ]

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 550 600
	set pin_flag 1
	DrawImage 220 300 

	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]

	iwidgets::labeledframe .setframe
	set setframe [.setframe childsite]
	
	set width 45
	#Device Wake Up(Sleep Mode to Normal Mode) Options
 	iwidgets::labeledframe .devwakeup -labeltext "Device Wake Up(Sleep Mode to Normal Mode) Options" -labelpos nw
	set devwakeup [.devwakeup childsite]
	checkbutton .ck1external_user_wake_up -width $width -text "External User Wake Up" -variable Para(external_user_wake_up) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1user_i2c_wake_up -width $width -text "User I2C Wake Up" -variable Para(user_i2c_wake_up) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1user_wdt_expiry -width $width -text "Watch Dog Timer (WDT) Expiry Wake Up" -variable Para(user_wdt_expiry) -anchor w -command {ChangeValueCmd}
	pack .ck1external_user_wake_up .ck1user_i2c_wake_up .ck1user_wdt_expiry -in $devwakeup -side top -anchor w -padx 10
	#Device Wake Up(Sleep Mode to Normal Mode) Options
	iwidgets::labeledframe .wdtexpiry -labeltext "Watch Dog Timer Expiry Wake Up Options" -labelpos nw
	set wdtexpiry [.wdtexpiry childsite]	
	set w 35
	CreateLabelCombobox $wdtexpiry wdt_mode "Select the Watch Dog Timer (WDT) \nCounter that wakes up the device" $w 20 Para(wdt_mode) {"WDT COUNTER_1" "WDT COUNTER_2" "WDT COUNTER_3"} {ChangeValueCmd}
	.lblwdt_mode config -anchor w -justify left
	
	#Watch Dog Timer Initialization Options
	iwidgets::labeledframe .wdtinitoption -labeltext "Watch Dog Timer Initialization Options" -labelpos nw
	set wdtinitoption [.wdtinitoption childsite]
	
	label .lbltime -text "Specify the initialization values for the Watch Dog Timer Counters(in Hours: Minutes: Seconds)"
	pack .lbltime -in $wdtinitoption -side top -anchor w -padx 10
	
	set timeWidth 4
	frame .frmHHMMSS
	label .lblHH -text "HH" -width $timeWidth
	label .lblMM -text "MM" -width $timeWidth
	label .lblSS -text "SS" -width $timeWidth
	
	pack .lblHH .lblMM .lblSS -in .frmHHMMSS -side left 
	pack .frmHHMMSS -in $wdtinitoption -side top -anchor w -padx 135 -pady 4
	
	frame .frmInputCounter1
	label .lblwdtcount1 -text "WDT Counter 1" -width 20
	iwidgets::entryfield .entInputHH1 -labeltext "" -labelpos e -width 4 -textvariable Para(InputHH1)\
			-validate {digit %c} -fixed 2
	.entInputHH1.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	iwidgets::entryfield .entInputMM1 -labeltext "" -labelpos e -width 4 -textvariable Para(InputMM1)\
			-validate {digit %c} -fixed 2
	.entInputMM1.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	iwidgets::entryfield .entInputSS1 -labeltext "" -labelpos e -width 4 -textvariable Para(InputSS1)\
			-validate {digit %c} -fixed 2
	.entInputSS1.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}	
	
    pack .lblwdtcount1 .entInputHH1 .entInputMM1 .entInputSS1 -in .frmInputCounter1 -side left
	
	frame .frmInputCounter2
	label .lblwdtcount2 -text "WDT Counter 2" -width 20
	iwidgets::entryfield .entInputHH2 -labeltext "" -labelpos e -width 4 -textvariable Para(InputHH2)\
			-validate {digit %c} -fixed 2
	.entInputHH2.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}	
	iwidgets::entryfield .entInputMM2 -labeltext "" -labelpos e -width 4 -textvariable Para(InputMM2)\
			-validate {digit %c} -fixed 2
	.entInputMM2.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	iwidgets::entryfield .entInputSS2 -labeltext "" -labelpos e -width 4 -textvariable Para(InputSS2)\
			-validate {digit %c} -fixed 2
	.entInputSS2.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	pack .lblwdtcount2 .entInputHH2 .entInputMM2 .entInputSS2 -in .frmInputCounter2 -side left 
		
	frame .frmInputCounter3
	label .lblwdtcount3 -text "WDT Counter 3" -width 20
	iwidgets::entryfield .entInputHH3 -labeltext "" -labelpos e -width 4 -textvariable Para(InputHH3)\
			-validate {digit %c} -fixed 2
	.entInputHH3.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}	
	iwidgets::entryfield .entInputMM3 -labeltext "" -labelpos e -width 4 -textvariable Para(InputMM3)\
			-validate {digit %c} -fixed 2
	.entInputMM3.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	iwidgets::entryfield .entInputSS3 -labeltext "" -labelpos e -width 4 -textvariable Para(InputSS3)\
			-validate {digit %c} -fixed 2
	.entInputSS3.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	
    pack .lblwdtcount3 .entInputHH3 .entInputMM3 .entInputSS3 -in .frmInputCounter3 -side left 
	pack .frmInputCounter1 .frmInputCounter2 .frmInputCounter3 -in $wdtinitoption -side top -anchor w -padx 10 -pady 4
	
	
	#Watch Dog Timer(WDT) User Mode Options
	iwidgets::labeledframe .wdtusermode -labeltext "Watch Dog Timer(WDT) User Mode Options" -labelpos nw
	set wdtusermode [.wdtusermode childsite]
	
	frame .frmwdtoptions
	label .lblwdtoptions -text "Watch Dog Timer Options" -width 20 
	label .lblwdtoptions_space -text "" -width 10 
	checkbutton .ck1enable_wdt_normal -width $width -text "Enable User Mode for Watch Dog Timer in Normal State" -variable Para(enable_wdt_normal) -anchor w -command {ChangeValueCmd}
	pack .lblwdtoptions .lblwdtoptions_space .ck1enable_wdt_normal -in .frmwdtoptions -side left 	
	
	frame .frmwdtmodeselection
	label .lblwdtmodeselection -text "Mode Selection" -width 13 
	label .lblwdtmodeselection_space -text "" -width 18 
	iwidgets::combobox .cbouser_mode_selection -textvariable Para(user_mode_selection) -selectioncommand {ChangeValueCmd} -editable false -width 20
	.cbouser_mode_selection insert list end "Count Once" "Count Repetitively"
	pack .lblwdtmodeselection .lblwdtmodeselection_space .cbouser_mode_selection -in .frmwdtmodeselection -side left 

	frame .frmwdtusermode
	label .lblwdtusermode -text "Select the Watch Dog Timer (WDT) \nCounter that will be used in User Mode" -width 30 -justify left
	label .lblwdtusermode_space -text "" -width 1
	iwidgets::combobox .cbowdt_user_mode -textvariable Para(wdt_user_mode) -selectioncommand {ChangeValueCmd} -editable false -width 20
	.cbowdt_user_mode insert list end "WDT COUNTER_1" "WDT COUNTER_2" "WDT COUNTER_3"
	pack .lblwdtusermode .lblwdtusermode_space .cbowdt_user_mode -in .frmwdtusermode -side left 

	frame .frmwdtinterrupt
	label .lblwdtinterrupts -text "Interrupt Enable" -width 13 
	label .lblwdtinterrupts_space -text "" -width 17 
	checkbutton .ck1wdt_interrupts -width $width -text "" -variable Para(wdt_interrupts) -anchor w -command {ChangeValueCmd}
	pack .lblwdtinterrupts .lblwdtinterrupts_space .ck1wdt_interrupts -in .frmwdtinterrupt -side left 	
	
	pack .frmwdtoptions .frmwdtmodeselection .frmwdtusermode .frmwdtinterrupt -in $wdtusermode -side top -anchor w -padx 10 -pady 4
	
	
	pack .devwakeup .wdtexpiry .wdtinitoption .wdtusermode -in $setframe -side top -anchor w -fill both -expand 1
#		$tnb view 0
	pack .setframe -in $page -fill both -expand 1
	GeneralConfig

	ChangeValueCmd

	pack forget .cboBusOrder 
	
	$tnb delete 0
	$tnb view 0
}