#$Header: L:/module/dll/gui/core_template.tcl 1.18 mghuang Exp $

#Rev 1.18 Diamond 1.4.2 IPExpress: Fixed cr_55948, ECP3 UM rev 4.0
#Rev 1.17 Fixed cr_47890

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para

	DrawBusPins
} 

proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for or5s00 device
proc Or5s00Cmd {}  {
	global Para

	set str "-arch $Para(arch) -type dll"

	switch $Para(dlltype) {
	    "Time Reference Delay"          { lappend str -dll_type trd }
	    "Clock Injection Delay Removal" { 
			if {$Para(DCNTL) == "1"}  {
				lappend str -dll_type sdc 
			} else  {
				lappend str -dll_type cid
			} 
		}
	    "Clock Delay Match"			    { lappend str -dll_type cim }
	}
    lappend str -fin $Para(fin)

	if {$Para(dlltype)=="Time Reference Delay"} {
		lappend str -clkos_ph $Para(clkos_ph)
	}

	lappend str -clkos_div $Para(clkos_div)

	if {$Para(dlltype) == "Clock Injection Delay Removal" || $Para(dlltype) == "Clock Delay Match"}  {
		switch $Para(Mode) {
			CLKOP {lappend str -fb_mode 0}
			CLKOS {lappend str -fb_mode 1}
			"User Clock" {lappend str -fb_mode 2}
		} 
		if {$Para(Mode) == "User Clock"}  {
			switch $Para(Freq)  {
				CLKI   {lappend str -fb_freq 0}
				CLKI/2 {lappend str -fb_freq 1}
				CLKI/4 {lappend str -fb_freq 2}
			} 
		} 
	} 

	if {$Para(Smiports)}  {lappend str -smi}
	if {$Para(RSTNport)}  {lappend str -use_rstn} 
	#if {$Para(reset_en)}  {lappend str -reset_en} 

	if {$Para(arch) == "ep5c00"} {
		if {$Para(enDiff)} {lappend str -use_diff}
		if {$Para(enGrayo)} {lappend str -use_gray -use_inc}
		#if {$Para(enInco)} {lappend str -use_inc}
		#ISPL_CR_40002 
		if {$Para(DCNTL)} {lappend str -use_dcntl}
	} else {
		if {$Para(DCNTL)}	  {lappend str -dcntl_en} 
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
		EC_CMD  -
		SC_CMD  {set str [Or5s00Cmd ]}
		default {set str [GeneralCmd]}
	} 

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc ChangeValueCmd {} {
	global Para

	set dllconfig [.dllconfig childsite]

	pack .smiPorts    -in $dllconfig  -anchor w -padx 15 -pady 2
	pack .smiRSTN     -in $dllconfig  -anchor w -padx 15
	#pack .enreset_GSR -in $dllconfig  -anchor w -padx 15 -pady 2
	pack .enDCNTL     -in $dllconfig  -anchor w -padx 15
	
	set bak $Para(CoreName)
	switch $Para(dlltype) {
	    "Time Reference Delay"  {
			set Para(CoreName) TRDLLA
			pack forget .frmCLKFB .enDCNTL
			pack .cbosPhase  -in $dllconfig -before .smiPorts -anchor w -padx 47
			#set Para(DCNTL) 0
		}
	    "Clock Injection Delay Removal" {
			set Para(CoreName) CIDDLLA
			pack forget .cbosPhase
			pack .frmCLKFB   -in $dllconfig -before .smiPorts -anchor w -padx 25
			pack .enDCNTL    -in $dllconfig  -anchor w -padx 15
			if {$Para(Mode) == "User Clock"}  {
				.cboFreq config -state normal -foreground black
			} else  {
				.cboFreq config -state disabled -foreground gray50
				set Para(Freq) CLKI
			} 
		}
	    "Clock Delay Match" { 
			set Para(CoreName) CIMDLLA
			pack forget .cbosPhase .enDCNTL
			pack .frmCLKFB   -in $dllconfig -before .smiPorts -anchor w -padx 25
			set Para(DCNTL) 0
			.cboFreq config -state disabled -foreground gray50
		}
	}

	if {$Para(arch) == "ep5c00"} {
		#ISPL_CR_40002 
		if {$Para(dlltype) == "Time Reference Delay"} {
			pack .enDiff     -in $dllconfig  -anchor w -padx 15
			pack .enGrayo    -in $dllconfig  -anchor w -padx 15
			#pack .enInco     -in $dllconfig  -anchor w -padx 15
			pack .enDCNTL    -in $dllconfig  -anchor w -padx 15

			.enGrayo config -text "Provide GRAYO and INCO ports"
			.enInco  config -text "Provide INCO port"
			.enDCNTL config -text "Provide DCNTL Ports"
			
# For 150~700MHz we support all the values:

#(0, 90,101,112,135,180,191,202,225,270,281,292,315, 360, 371, 382, 405)

#Below 150 MHZ  (133~700MHz)

#(0, 90,112,135,180,202,225,270,292,315, 360, 382, 405)

			#cr_47890
			.cbosPhase clear list
			if {$Para(fin) < "133" || $Para(fin) > "700"} {
				.cbosPhase insert list end 0
				set Para(clkos_ph) 0
			} else {
				if {$Para(fin) < "150"} {
					.cbosPhase insert list end 0 90 112 135 180 202 225 270 292 315 360 382 405
					set phase_lst {0 90 112 135 180 202 225 270 292 315 360 382 405}
				} else {
					.cbosPhase insert list end 0 90 101 112 135 180 191 202 225 270 281 292 315 360 371 382 405
					set phase_lst {0 90 101 112 135 180 191 202 225 270 281 292 315 360 371 382 405}
				}
				if {[lsearch $phase_lst $Para(clkos_ph)] == -1}  {
					set Para(clkos_ph) 0
				}				
			}
		}
		if {$Para(dlltype) == "Clock Injection Delay Removal"} {
			set Para(enDiff) 0
			pack .enGrayo    -in $dllconfig  -anchor w -padx 15
			#pack .enInco     -in $dllconfig  -anchor w -padx 15
			pack forget .enDiff .enDCNTL
			set Para(DCNTL) 0

			.enGrayo config -text "Provide GRAYI and INCI ports"
			.enInco  config -text "Provide INCI port"
		}
	}

	#In Clock Delay Match mode, if feedback is CLKOS, then CLKOS divider should be 1
	if {$Para(dlltype) == "Clock Delay Match" && $Para(Mode) == "CLKOS"}  {
		.cbosDiv clear list
		.cbosDiv insert list end 1
		set Para(clkos_div) 1
	} else  {
		.cbosDiv clear list
		.cbosDiv insert list end 1 2 4
	} 

	#ISPL_CR_33461 
	set dev_lst {ep5a00 ep5a00s ep5m00 ep5m00s ep5c00}
	if {[lsearch $dev_lst $Para(arch)] != -1}  {
		pack forget .smiPorts
		set Para(Smiports) 0
		#ISPL_CR_29213
		#ISPL_CR_40002 
		if {$Para(arch) != "ep5c00"} {
			pack forget .enDCNTL
			set Para(DCNTL) 0
		}
	}
	
	set Para(CoreName) $bak
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

	set fin_min 100
	switch $Para(CmdLine)  {
		EC_CMD  {set fin_max 500}
		SC_CMD  {set fin_max 700}
		default {set fin_max 700}
	} 

	if {$Para(arch) == "ep5c00"} {
		set ret [IsInRange "Input clock frequency (MHz)" 133 500 $Para(fin)]
		if {$ret == -1} {return -1}
		
		return 0
	}
	if {$Para(DCNTL) == "1"}  {
		set ret [IsInRange "Input clock frequency (MHz)" 300 $fin_max $Para(fin)]
	} else  {
	    set ret [IsInRange "Input clock frequency (MHz)" $fin_min $fin_max $Para(fin)]
	}  
	
	if {$ret == -1} {return -1}

	return 0
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	#*** set private value ***

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface
	switch $tcl_platform(platform) {
		windows {AttributeSetting 430 380}
		unix    {AttributeSetting 450 380}
	}
	set pin_flag 1
	DrawImage 220 350
	set tnb $Para(tnb)

	wm title . "ORCA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]

		iwidgets::labeledframe .dllconfig -labeltext "" -labelpos nw
		set dllconfig [.dllconfig childsite]

		iwidgets::combobox .cboMode -labeltext "Specify the DLL usage mode:" -textvariable Para(dlltype) -width 27 -editable 0 \
			-selectioncommand {ChangeValueCmd;CallDrawPins}
		#CR_38343
		set dev_lst {ep5a00 ep5a00s ep5m00 ep5m00s ep5c00}
		if {[lsearch $dev_lst $Para(arch)] != -1}  {
			.cboMode insert list end "Time Reference Delay" \
									 "Clock Injection Delay Removal"
		} else {
			.cboMode insert list end "Time Reference Delay" \
									 "Clock Injection Delay Removal" \
									 "Clock Delay Match"
		}
		iwidgets::entryfield .inFreq -labeltext "CLKI Frequency(MHz)" -textvariable Para(fin) -validate real -width 10 -fixed 8
		.inFreq.label config -width 25 -anchor w

		.inFreq.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}
			
		#******** CLKOS Setting **********
		label .lblClkos -text "CLKOS"
	# 23883
		iwidgets::combobox .cbosDiv -labeltext "Divider" -width 8 -editable false -textvariable Para(clkos_div)
		.cbosDiv.label config -width 30 -anchor w
		.cbosDiv insert list end 1 2 4

		iwidgets::combobox .cbosPhase -labeltext "Phase Shift (degree)" -width 8 -editable false -textvariable Para(clkos_ph)
		.cbosPhase.label config -width 30 -anchor w
		.cbosPhase insert list end 0 11 22 45 90 101 112 135 180 191 202 225 270 281 292 315 360

		iwidgets::labeledframe .frmCLKFB -labeltext "CLKFB" -labelpos nw
		set frmCLKFB [.frmCLKFB childsite]
		iwidgets::combobox .cboFbMode -labeltext "Feedback Mode" -labelpos n -width 8 -editable false -textvariable Para(Mode) -selectioncommand {ChangeValueCmd;CallDrawPins}
		iwidgets::combobox .cboFreq   -labeltext "Frequency"     -labelpos n -width 8 -editable false -textvariable Para(Freq) -selectioncommand {ChangeValueCmd;CallDrawPins}
		pack .cboFbMode .cboFreq -in $frmCLKFB -side left -padx 10
		.cboFbMode insert list end CLKOP CLKOS "User Clock"
		.cboFreq   insert list end CLKI CLKI/2 CLKI/4
		
		checkbutton .smiPorts     -text "Provide SMI ports on DLL module" -variable Para(Smiports) -command {CallDrawPins}
		checkbutton .smiRSTN      -text "Provide RSTN port" -variable Para(RSTNport) -command {CallDrawPins}
		#checkbutton .enreset_GSR  -text "Enable GSR to reset DLL" -variable Para(reset_en) -command {CallDrawPins}
		checkbutton .enDCNTL      -text "Provide DCNTL Ports" -variable Para(DCNTL) -command {CallDrawPins}

		pack .cboMode    -in $dllconfig  -anchor w -padx 10 -pady 4
		pack .inFreq     -in $dllconfig  -anchor w -padx 30 -pady 4

		#24063
		pack .lblClkos   -in $dllconfig -anchor w -padx 30
		pack .cbosDiv    -in $dllconfig -anchor w -padx 47 -pady 4
		pack .cbosPhase  -in $dllconfig -anchor w -padx 47
		pack .frmCLKFB   -in $dllconfig -anchor w -padx 25

		#pack .smiPorts    -in $dllconfig  -anchor w -padx 15 -pady 2
		#pack .smiRSTN     -in $dllconfig  -anchor w -padx 15
		#pack .enreset_GSR -in $dllconfig  -anchor w -padx 15 -pady 2
		#pack .enDCNTL     -in $dllconfig  -anchor w -padx 15
		
		checkbutton .enDiff  -text "Provide DIFF port" -variable Para(enDiff) -command {CallDrawPins}
		checkbutton .enGrayo -text "Provide GRAYO and INCO ports" -variable Para(enGrayo) -command {CallDrawPins}
		checkbutton .enInco  -text "Provide INCO port" -variable Para(enInco) -command {CallDrawPins}
		
		pack .dllconfig -in $page -fill both -expand 1

		$tnb view 0

		ChangeValueCmd

	#FunctionButton
	#CenterPosition
	GeneralConfig
}