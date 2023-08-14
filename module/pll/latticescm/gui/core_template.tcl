#$Header: L:/module/pll/latticescm/gui/rcs/core_template.tcl 1.15 2009/07/27 09:05:20Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CheckTolerance {str req act tol}  {
	global Para
	set t1 [expr abs($req-$act)]
	set t2 [expr $req*$tol/100]
	if {$t1 > $t2}  {
		set msg "The Requested Frequency of $str cannot be generated. \nTry to change the Desired Frequency or Tolerance."
		tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		return -1
	} 
	return 0
} 

proc DRC {}  {
	global Para

	if {$Para(FeedbackClk)=="User Clock"} {
		if {$Para(ClkOP_Freq) == "0.000" || $Para(ClkOS_Freq) == "0.000"}  {
			set msg "User feedback clock frequency $Para(Frequency) does not match output frequency ($Para(U_OFrq) or $Para(U_SFrq))."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return -1
		} 
	} else  {
		set ret [CheckTolerance "ClkOP" $Para(U_OFrq) $Para(ClkOP_Freq) $Para(OP_Tol)]
		if {$ret == -1} {
			.clkOP.lwchildsite.entry config -fg red
			set Para(BoolFlag) 0
			return -1
		} else {
			.clkOP.lwchildsite.entry config -fg black
		} 

		set ret [CheckTolerance "ClkOS" $Para(U_SFrq) $Para(ClkOS_Freq) $Para(OS_Tol)]
		if {$ret == -1} {
			.clkOS.lwchildsite.entry config -fg red
			set Para(BoolFlag) 0
			return -1
		} else  {
			.clkOS.lwchildsite.entry config -fg black
		} 
	}

	return 0
} 

proc ChangeValueCmd {} {
	global Para

	if {$Para(BoolFlag) == "1"}  {
		$Para(generate_cfg) configure -state normal
		#$Para(generate) configure -state normal
	} else  {
		$Para(generate_cfg) configure -state disabled
		#$Para(generate) configure -state disabled
	} 

	if {$Para(FeedbackClk)=="User Clock"} {
        .frequency config -state normal
    } else {
        .frequency config -state disabled
    }

	switch $Para(FeedbackClk) {
	"Internal"   { set Para(Frequency) $Para(Clki_freq) }
	"CLKOP"      { set Para(Frequency) $Para(ClkOP_Freq) }
	"CLKOS"      { set Para(Frequency) $Para(ClkOS_Freq) }
	"User Clock" { }
	}

	set w [.spreadspectrum childsite]

	if {$Para(enSpread) == 0}  {
		$w.modulation configure -state disabled	-foreground gray50
		$w.lbspectrum configure -state disabled
		.lblDesired   config -state disabled -foreground gray50
		.entryDesired config -state disabled -foreground gray50
		.lblActual    config -state disabled -foreground gray50
		.entryActual  config -foreground gray50
	} else  {
		$w.modulation configure -state normal -foreground black
		$w.lbspectrum configure -state normal	
		.lblDesired   config -state normal -foreground black
		.entryDesired config -state normal -foreground black
		.lblActual    config -state normal -foreground black
		.entryActual  config -foreground black
	} 

	if {$Para(U_OFrq) != $Para(U_SFrq)}  {
		.phase config -state disabled
	} else  {
		.phase config -state normal
	} 

	#ISPL_CR_34411 
	if {$Para(Clki_freq) < 2.0000 || $Para(Clki_freq) > 1000.0000}  {
		.clkI.lwchildsite.entry config -fg red
	} else  {
		.clkI.lwchildsite.entry config -fg black
	} 

	if {$Para(U_OFrq) < 1.5625 || $Para(U_OFrq) > 1000.0000}  {
		.entU_OFrq.lwchildsite.entry config -fg red
	} else  {
		.entU_OFrq.lwchildsite.entry config -fg black
	} 

	if {$Para(U_SFrq) < 1.5625 || $Para(U_SFrq) > 1000.0000}  {
		.entU_SFrq.lwchildsite.entry config -fg red
	} else  {
		.entU_SFrq.lwchildsite.entry config -fg black
	} 

	if {$Para(FeedbackClk) == "User Clock"} {
		if {$Para(Frequency) < 2.0000 || $Para(Frequency) > 1000.0000}  {
			.frequency.lwchildsite.entry config -fg red
		} else  {
			.frequency.lwchildsite.entry config -fg black
		} 
	}

	if {$Para(enSpread) == 1}  {
		if {$Para(Desired) < 30.0000 || $Para(Desired) > 500.0000}  {
			.entryDesired.lwchildsite.entry config -fg red
		} else  {
			.entryDesired.lwchildsite.entry config -fg black
		} 
	}
	
	if {$Para(enBypassP) == 0} {
		.entU_OFrq config -state normal
		.cboOP_Tol config -state normal
	} else {
		.entU_OFrq config -state disabled
		.cboOP_Tol config -state disabled
	}

	if {$Para(enBypassS) == 0} {
		.entU_SFrq config -state normal
		.cboOS_Tol config -state normal
		.phase     config -state normal
	} else {
		.entU_SFrq config -state disabled
		.cboOS_Tol config -state disabled
		.phase     config -state disabled
	}
	
	if {$Para(enBypassP) == 1 && $Para(enBypassS) == 1 } {
		.feedbackClk config -state disabled
		.frequency	 config -state disabled
		.en_RSTN 	 config -state disabled
		.have_SMIPort config -state disabled
		.en_GSR 	 config -state disabled
		.cbHighBand	 config -state disabled

		set Para(enRSTN) 0
		set Para(smiport) 0
		set Para(enGSR) 0
		set Para(enHighBand) 0
	} else {
		.feedbackClk config -state normal
		#.frequency	 config -state normal
		if {$Para(FeedbackClk)=="User Clock"} {
	        .frequency config -state normal
	    } else {
	        .frequency config -state disabled
	    }
		.en_RSTN 	 config -state normal
		.have_SMIPort config -state normal
		.en_GSR 	 config -state normal
		.cbHighBand	 config -state normal
	}
	
	#cr_41018 for CFG7_1S1
	if {$Para(enBypassS) == 0} {
		if {$Para(U_OFrq) != $Para(U_SFrq)} {
			.phase config -state disabled
		} else {
			.phase config -state normal
		}
	}
}

proc EditFreq {}  {
	global Para
	set Para(BoolFlag) 0
	ChangeValueCmd
} 

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para

#	set Para(FeedbackClk) CLKOP
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

	set ret [IsInRange "CLKI Frequency" 2 1000 $Para(Clki_freq)]
	if {$ret == "-1"} {return -1}

	set ret [IsInRange "CLKOP Frequency" 1.5625 1000 $Para(ClkOP_Freq)]
	if {$ret == "-1"} {return -1}

	set ret [IsInRange "CLKOS Frequency" 1.5625 1000 $Para(ClkOS_Freq)]
	if {$ret == "-1"} {return -1}

	set tit "Check Parameter"
	if {$Para(FeedbackClk) == "User Clock"} {
		set ret [IsInRange "Frequency" 2 1000 $Para(Frequency)]
		if {$ret == "-1"} {return -1}

		if {$Para(Frequency) != $Para(ClkOP_Freq) && $Para(Frequency) != $Para(ClkOS_Freq)}  {
			set msg "The user specified frequency should be either equal to CLKOP frequency or CLKOS frequency."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		} 
	}

	if {$Para(enSpread) == 1}  {
		set ret [IsInRange "Desired Modulation Rate" 30 500 $Para(Desired)]
		if {$ret == "-1"} {return -1}
	}

	return 0
}

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for or5s00 device
proc Or5s00Cmd {}  {
	global Para

	set str "-arch $Para(arch) -type pll"
	lappend str -fin $Para(Clki_freq)
	lappend str -mfreq $Para(U_OFrq)
	lappend str -nfreq $Para(U_SFrq)
	
	if {$Para(enBypassP) == 1} {lappend str -bypassp}
	if {$Para(enBypassS) == 1} {lappend str -bypasss}
	
	if {$Para(U_OFrq) == $Para(U_SFrq)}  {
		switch $Para(Phase) {
		"0"   { lappend str -tap 0 }
		"45"  { lappend str -tap 1 }
		"90"  { lappend str -tap 2 }
		"135" { lappend str -tap 3 }
		"180" { lappend str -tap 4 }
		"225" { lappend str -tap 5 }
		"270" { lappend str -tap 6 }
		"315" { lappend str -tap 7 }
		}
	}

	switch $Para(FineDelay) {
	"0"   { lappend str -clkos_fdel 0 }
	"100" { lappend str -clkos_fdel 1 }
	"200" { lappend str -clkos_fdel 2 }
	"300" { lappend str -clkos_fdel 3 }
	"400" { lappend str -clkos_fdel 4 }
	"500" { lappend str -clkos_fdel 5 }
	"600" { lappend str -clkos_fdel 6 }
	"700" { lappend str -clkos_fdel 7 }
	}

	switch $Para(FeedbackClk) {
	"Internal"   { lappend str -fb 0 }
	"CLKOP"      { lappend str -fb 1 }
	"CLKOS"      { lappend str -fb 2 }
	"User Clock" { lappend str -fb 3 }
	}

	if { $Para(enSpectrum)} {
	    lappend str -ss
	}
	if {$Para(smiport)} {
	    lappend str -smi
	}
	if {$Para(enRSTN)}  {lappend str -use_rstn} 
	if {$Para(FeedbackClk)=="User Clock" && [string length $Para(Frequency)] > 0} {
	    lappend str -fusr $Para(Frequency)
	}

	switch $Para(Clki_boosting) {
	"DEL0" { lappend str -clki_del 0 }
	"DEL1" { lappend str -clki_del 1 }
	"DEL2" { lappend str -clki_del 2 }
	"DEL3" { lappend str -clki_del 3 }
	}
    
	switch $Para(Clki_fine) {
	"0"   { lappend str -clki_fdel 0 }
	"100" { lappend str -clki_fdel 1 }
	"200" { lappend str -clki_fdel 2 }
	"300" { lappend str -clki_fdel 3 }
	"400" { lappend str -clki_fdel 4 }
	"500" { lappend str -clki_fdel 5 }
	"600" { lappend str -clki_fdel 6 }
	"700" { lappend str -clki_fdel 7 }
	}

	switch $Para(Clkfb_boosting) {
	"DEL0" { lappend str -clkfb_del 0 }
	"DEL1" { lappend str -clkfb_del 1 }
	"DEL2" { lappend str -clkfb_del 2 }
	"DEL3" { lappend str -clkfb_del 3 }
	}
    
	switch $Para(Clkfb_fine) {
	"0"   { lappend str -clkfb_fdel 0 }
	"100" { lappend str -clkfb_fdel 1 }
	"200" { lappend str -clkfb_fdel 2 }
	"300" { lappend str -clkfb_fdel 3 }
	"400" { lappend str -clkfb_fdel 4 }
	"500" { lappend str -clkfb_fdel 5 }
	"600" { lappend str -clkfb_fdel 6 }
	"700" { lappend str -clkfb_fdel 7 }
	}

	if {$Para(enSpread) == 1}  {
		lappend str -ss_dm $Para(modulation)
		lappend str -ss $Para(Desired)
	}

	if {$Para(enGSR)} {lappend str -reset_en}
	
	#ISPL_CR_30349
	lappend str -mtol $Para(OP_Tol) -ntol $Para(OS_Tol)
	
	if {$Para(enHighBand) == 1} {
		lappend str -bw HIGH
	} else {
		lappend str -bw LOW
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
		SC_CMD  {set str [Or5s00Cmd ]}
		default {set str [GeneralCmd]}
	} 

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc GetStdoutStr {}  {
	global Para

	set str [GenerateCB]

	set scuba [GetScubaEngine]

#*** General Options Command arguments ***
	set cmd [GetGeneralArgs]

	append command_line [list $scuba] " -w -n" " " $Para(ModuleName) $cmd " " $str

	lappend command_line -cal
#	tk_messageBox -default ok -icon warning -message $command_line -title "GetStdoutStr" -type ok
	set ret [catch {eval exec $command_line} msg]
	if {$ret != 0} {return -1}

#	tk_messageBox -default ok -icon warning -message $ret -title "GetStdoutStr" -type ok

#	tk_messageBox -default ok -icon warning -message $msg -title "GetStdoutStr" -type ok
	
	return $msg
} 

proc CalculateCmd {}  {
	global Para

#	You could call scuba with a specific option (such as "-cal "), and the 
#	DIV values and the Freq values can be written to the stdout.
#		Div: 1,2,3,4
#		Freq: 100.000, 100.000, 100.000

	set ret [IsInRange "CLKI Frequency" 2 1000 $Para(Clki_freq)]
	if {$ret == "-1"} {
		.clkI.lwchildsite.entry config -fg red
		return -1
	}

	set ret [IsInRange "CLKOP Frequency" 1.5625 1000 $Para(U_OFrq)]
	if {$ret == "-1"} {
		.entU_OFrq.lwchildsite.entry config -fg red
		return -1
	}

	set ret [IsInRange "CLKOS Frequency" 1.5625 1000 $Para(U_SFrq)]
	if {$ret == "-1"} {
		.entU_SFrq.lwchildsite.entry config -fg red
		return -1
	}

	if {$Para(FeedbackClk) == "User Clock"} {
		set ret [IsInRange "Frequency" 2 1000 $Para(Frequency)]
		if {$ret == "-1"} {
			.frequency.lwchildsite.entry config -fg red
			return -1
		}
	}

	#ISPL_CR_31103
	if {$Para(enSpread) == "1"}  {
		if {[string length $Para(Desired)] == 0 || [string length $Para(Actual)] == 0}  {
			set msg "Please specify a Modulation Rate!"
			set tit "Check Parameters"
			tk_messageBox -default ok -icon warning	-message $msg -title $tit -type ok
			set tnb $Para(tnb)
			$tnb view 1
			return -1
		} 
	} 

	set ret [GetStdoutStr]
	if {$ret == -1}  {return -1}

	set stdout_str [split $ret '\n']
#	tk_messageBox -default ok -icon warning -message $stdout_str -title "GetStdoutStr" -type ok
	set div_str [lindex $stdout_str end-1]
	set div [split [string range $div_str [expr [string first : $div_str]+1] end] ,]
	set freq_str [lindex $stdout_str end]
	set freq [split [string range $freq_str [expr [string first : $freq_str]+1] end] ,]

	set Para(M) [lindex $div 0]
	set Para(N) [lindex $div 1]
	set Para(V) [lindex $div 2]
	set Para(K) [lindex $div 3]
	set Para(ClkOP_Freq) [lindex $freq 0]
	set Para(ClkOS_Freq) [lindex $freq 1]
	if {$Para(enSpread) == 1}  {
		set Para(Actual) [lindex $freq 2]
	}
	set Para(VcoRate) [lindex $freq 3]
	set Para(Bandwidth) [lindex $freq 4]

	set ret [DRC]
	if {$ret == -1}  {return -1}

	set Para(BoolFlag) 1
} 

set in_pins  {RSTN CLKI CLKFB SMI}
set out_pins {CLKOP CLKOS LOCK CLKINTFB}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet
	MainInterface
	switch $tcl_platform(platform) {
		windows {AttributeSetting 500 480}
		unix    {AttributeSetting 540 480}
	}
	set pin_flag 1
	DrawImage 220 300
	set tnb $Para(tnb)

		set Para(BoolFlag) 0

	wm title . "ORCA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

		set page [$tnb add -label "Configuration"]

	#	frame .setframe
		iwidgets::labeledframe .setframe
		set setframe [.setframe childsite]

		#*** CLKI Frequency ***
		iwidgets::Labeledframe .frmClkI -labeltext "CLKI" -labelpos nw
		set frmClkI [.frmClkI childsite]
		iwidgets::entryfield .clkI -labeltext "\nFrequency" -labelpos n -width 13 -textvariable Para(Clki_freq) -validate real
		pack .clkI -in $frmClkI -side top
		.clkI.lwchildsite.entry config -validate key -vcmd {
				after idle {EditFreq}
				return 1
		}

		#*** CLKOP Frequency ***
		iwidgets::Labeledframe .frmClkOP -labeltext "CLKOP" -labelpos nw
		set frmClkOP [.frmClkOP childsite]
		checkbutton .cbBypassP -text "Bypass (CLKOP=CLKI)" -variable Para(enBypassP) -command { EditFreq;DrawPins}
		frame .subframe0
		iwidgets::entryfield .entU_OFrq -labeltext "Desired\nFrequency" -labelpos n -width 12 -textvariable Para(U_OFrq) -validate real
		iwidgets::combobox   .cboOP_Tol -labeltext "\nTolerance"          -labelpos n -width 8  -textvariable Para(OP_Tol) -editable false -selectioncommand EditFreq
		iwidgets::entryfield .clkOP     -labeltext "Actual\nFrequency"    -labelpos n -width 12 -textvariable Para(ClkOP_Freq) -fixed 10 -state disabled -disabledforeground black
		#24674
		.cboOP_Tol insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
		pack .cbBypassP .entU_OFrq .cboOP_Tol .clkOP -in .subframe0 -side left -padx 2 -fill x
		.entU_OFrq.lwchildsite.entry config -validate key -vcmd {
				after idle {EditFreq}
				return 1
		}
		pack .cbBypassP -in $frmClkOP -side top
		pack .subframe0 -in $frmClkOP -side top -anchor w

		#*** CLKFB ***
		iwidgets::Labeledframe .frmCLKFB -labeltext "CLKFB" -labelpos nw
		set frmCLKFB [.frmCLKFB childsite]
		iwidgets::combobox .feedbackClk -labeltext "\nFeedback Mode" -width 10 -editable false -labelpos n \
			-listheight 90  -textvariable Para(FeedbackClk) -selectioncommand { EditFreq;DrawPins}
		.feedbackClk insert list end "Internal" "CLKOP" "CLKOS" "User Clock"
		iwidgets::entryfield .frequency -labeltext "\nFrequency" -labelpos n -width 12  -fixed 10 \
			-textvariable Para(Frequency) -validate real
		pack .feedbackClk .frequency -in $frmCLKFB -side top
		.frequency.lwchildsite.entry config -validate key -vcmd {
				after idle {EditFreq}
				return 1
		}
		
		#*** CLKOS Frequency ***
		iwidgets::Labeledframe .frmCLKOS -labeltext "CLKOS" -labelpos nw
		set frmCLKOS [.frmCLKOS childsite]
		checkbutton .cbBypassS -text "Bypass (CLKOS=CLKI)" -variable Para(enBypassS) -command { EditFreq;DrawPins}
#		pack .cbBypassP -in $frmClkOP -side top -anchor w -padx 10
		frame .subframe1
		iwidgets::entryfield .entU_SFrq -labeltext "Desired\nFrequency" -labelpos n -width 12 -textvariable Para(U_SFrq) -validate real
		iwidgets::combobox   .cboOS_Tol -labeltext "\nTolerance"          -labelpos n -width 8  -textvariable Para(OS_Tol) -editable false -selectioncommand EditFreq
		iwidgets::entryfield .clkOS     -labeltext "Actual\nFrequency"    -labelpos n -width 12 -textvariable Para(ClkOS_Freq) -fixed 10 -state disabled -disabledforeground black
		#24674
		.cboOS_Tol insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
		pack .entU_SFrq .cboOS_Tol .clkOS -in .subframe1 -side left -padx 2 -fill x
		.entU_SFrq.lwchildsite.entry config -validate key -vcmd {
				after idle {EditFreq}
				return 1
		}

		frame .subframe2
		iwidgets::combobox .phase -labeltext "\nPhase Shift (degree)" -width 8 -editable false -labelpos n \
			-listheight 130  -textvariable Para(Phase) 
		.phase insert list end "0" "45" "90" "135" "180" "225" "270" "315"
		pack .phase -in .subframe2 -side left -padx 2 -fill x -anchor w
		pack .cbBypassS .subframe1 .subframe2 -in $frmCLKOS -side top
		
		#*** Info ***
		iwidgets::Labeledframe .frmInfo -labeltext "Info" -labelpos nw
		set frmInfo [.frmInfo childsite]
		iwidgets::entryfield .entVcoRate   -labeltext "VCO Rate(MHz)\n" -labelpos n -width 12 -textvariable Para(VcoRate) -validate real -state disabled -disabledforeground black
		iwidgets::entryfield .entBandwidth -labeltext "Approximate PLL\nBandwidth(MHz)" -labelpos n -width 12 -textvariable Para(Bandwidth) -fixed 10 -state disabled -disabledforeground black
		pack .entVcoRate .entBandwidth -in $frmInfo -side left -padx 19 -fill x

		frame .frmEnable
		checkbutton .en_RSTN -text "Provide RSTN Port" -variable Para(enRSTN) -command {EditFreq;DrawPins}
		checkbutton .have_SMIPort  -text  "Provide SMI ports on PLL module" -variable Para(smiport) -command {EditFreq;DrawPins}
		checkbutton .en_GSR  -text  "Enable GSR to reset PLL" -variable Para(enGSR) -command {EditFreq;DrawPins}
		checkbutton .cbHighBand  -text  "Enable High Bandwidth" -variable Para(enHighBand) -command {EditFreq;DrawPins}
		pack .en_RSTN .have_SMIPort .en_GSR .cbHighBand -in .frmEnable -side top -anchor w 
		pack forget .en_GSR
		
		button .btnCal -text "Calculate" -command {CalculateCmd;ChangeValueCmd}    

		grid .frmClkI  .frmClkOP -in $setframe -sticky w 
		grid .frmCLKFB .frmCLKOS -in $setframe -sticky w
		grid .frmEnable .frmInfo  -in $setframe -sticky w
		grid x         .btnCal   -in $setframe -sticky e
		pack .setframe -in $page -fill both -expand 1


	set page2 [$tnb add -label "Advanced"]

		iwidgets::labeledframe .advanced
		set advanced [.advanced childsite]

		iwidgets::labeledframe .spreadspectrum -labeltext "Spread Spectrum" -labelpos nw -ipady 5 -ipadx 2
		set spreadspectrum [.spreadspectrum childsite]
		checkbutton $spreadspectrum.ckEnable -text "Enable" -variable Para(enSpread) -command {EditFreq}
		iwidgets::combobox $spreadspectrum.modulation -labeltext "Down-spread modulation(%)" -width 8 -editable false \
			-textvariable Para(modulation) -selectioncommand EditFreq
		#$spreadspectrum.modulation insert list end 1 2 3
		$spreadspectrum.modulation insert list end 0.5 1 1.5
		label $spreadspectrum.lbspectrum -text "Modulation Rate ( 30KHz - 500KHz )" ;#-width 60
		frame $spreadspectrum.subframe
		CreateLabelEntry $spreadspectrum.subframe Desired Desired KHz 10 e left Para(Desired) real
		CreateLabelEntry $spreadspectrum.subframe Actual  Actual  KHz 10 e left Para(Actual)  real
		.lblDesired config -width 10 -anchor w
		.lblActual  config -width 10 -anchor w
		.entryActual config -state disabled
		.entryDesired.lwchildsite.entry config -validate key -vcmd {
				after idle {EditFreq}
				return 1
		}

		pack .frmDesired .frmActual -in $spreadspectrum.subframe -side top -anchor w -padx 30 -pady 2
		pack $spreadspectrum.ckEnable   -anchor w -padx 5
		pack $spreadspectrum.modulation -anchor w -pady 2 -padx 15
		pack $spreadspectrum.lbspectrum -anchor w -pady 2 -padx 15
		pack $spreadspectrum.subframe   -anchor w -pady 2 -padx 12

		iwidgets::combobox .lock -labeltext "Lock Output Indicator" -width 10 -editable false \
			-listheight 90  -textvariable Para(lock) 
		.lock insert list end "Frequency" "Phase" "Both"
		checkbutton .en_Spectrum  -text  "Enable Spread Spectrum" -variable Para(enSpectrum) -command {ChangeValueCmd}

		pack .spreadspectrum -in $advanced -fill x -padx 10 -pady 1
		#pack .have_SMIPort -in $advanced -padx 16 -anchor w  -pady 4
		#pack .en_GSR -in $advanced -padx 16 -anchor w  -pady 4
		#pack .cbHighBand -in $advanced -padx 16 -anchor w  -pady 4
		#pack .advanced -in $page2 -fill both -expand 1

		$tnb view 0

#	FunctionButton
#	CenterPosition
	GeneralConfig

		ChangeValueCmd
		
		$tnb delete 1
}