#$Header: L:/module/counter/gui/core_template.tcl 1.12 mghuang Exp $

#Rev 1.12: 8.1s1 IPExpress: POJO support.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(InputWidth)] > 0}  {
		DrawPins
	} 
} 

proc ChangeValueCmd {} {
	global Para 

	set MaxWdth [GetMaxWdth]

	if {$Para(InputWidth)>$MaxWdth} {return}

	if {[string length $Para(InputWidth)]>0 && $Para(InputWidth)>32 \
		&& ($Para(CountDirection)=="Up" || $Para(CountDirection)== "Down") } {
		.cbOpmzSpd config -state normal 		
	} else {
		.cbOpmzSpd config -state disabled 
		set Para(OptimizeSpeed) "0"
	}
	
	if {$Para(InputWidth)>32 && $Para(InputWidth)<=64} {
		.lblLower config -state disabled
		.entryLower config -state disabled
		.lbl2Lower config -state disabled
		.lblUpper config -state disabled
		.entryUpper config -state disabled
		.lbl2Upper config -state disabled
#CR_49038 ,IPExpress_MM_GUI_Usage_Model v8.0
		if {$Para(arch) != "mj5g00" && $Para(arch) != "mj5g00p"} {
			.cbLoad config -state disabled
			set Para(Load) 0
		}
	} else {
		.lblLower config -state normal
		.entryLower config -state normal
		.lbl2Lower config -state normal
		.lblUpper config -state normal
		.entryUpper config -state normal
		.lbl2Upper config -state normal
		if {$Para(arch) != "mj5g00" && $Para(arch) != "mj5g00p"} {
			.cbLoad config -state normal
		}
	}
	
	.lbl2Lower config -text "(0 - 2^$Para(InputWidth)-1)"
	.lbl2Upper config -text "(0 - 2^$Para(InputWidth)-1)"
	
	CallDrawPins
}

# Get max width according to different device 
proc GetMaxWdth {} {
	global Para 

	switch $Para(CmdLine) {
		SC_CMD  {set MaxWdth 64}
		default {set MaxWdth 64 }
	} 
	
	return $MaxWdth
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para
#	ChangeValueCmd
	if {$Para(InputWidth) <= 32} {
		set max [expr pow(2,$Para(InputWidth))-1]
		if {$Para(Lower)>$max} {set Para(Lower) 0}
		if {$Para(Upper)>$max} {set Para(Upper) [expr int($max)]}
	}
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
	set MaxWdth [GetMaxWdth]

	# 28768
	set Para(InputWidth) [string trimleft $Para(InputWidth) 0]

	set ret [IsInRange "Input Width" 1 $MaxWdth $Para(InputWidth)]
	if {$ret == "-1"} {return -1}
	
	if {$Para(InputWidth) <= 32} {
		#ISPL_CR_35106
		set max [expr pow(2,$Para(InputWidth))-1]
		set ret [IsInRange "Lower count value" 0 $max $Para(Lower)]
		if {$ret == "-1"} {return -1}
		set ret [IsInRange "Upper count value" 0 $max $Para(Upper)]
		if {$ret == "-1"} {return -1}
		
		if {$Para(Lower) >= $Para(Upper)} {
			set msg "Lower count value should be less than Upper count value."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
	}
	
	return 0
}

proc GeneralCmdLine {} {
	global Para
		
	if {$Para(CountType) =="Asynchronous"}     {set type "-async"}
	if {$Para(CountType) =="Synchronous"}      {set type "-sync"}
	if {$Para(CountType) =="Load-Synchronous"} {set type "-loadsync"}

	if {$Para(CountDirection) =="Up"}      {set direction "-up"}
	if {$Para(CountDirection) =="Down"}    {set direction "-down"}
	if {$Para(CountDirection) =="Up-Down"} {set direction "-updown"}

	set str [list -arch $Para(arch) -type counter -width $Para(InputWidth) $direction $type]

	return $str
}

proc Or5s00CmdLine {}  {
	global Para
		
	if {$Para(CountDirection) =="Up"}      {set direction "-up"}
	if {$Para(CountDirection) =="Down"}    {set direction "-down"}
	if {$Para(CountDirection) =="Up-Down"} {set direction "-updown"	}

	set str [list -arch $Para(arch) -type counter -width $Para(InputWidth) $direction]
	if {$Para(InputWidth) <= 32} {
		lappend str -cnt_low $Para(Lower) -cnt_up $Para(Upper)
	}
	if {$Para(Load) == "1"} {lappend str -load}

	return $str
} 

# *** Command Line for MAGMA & EC device. *****
proc Mg5g00CmdLine {} {
	global Para
		
#	if {$Para(CountType) =="Asynchronous"}     {set mode "-aclear"}
#	if {$Para(CountType) =="Synchronous"}      {set mode "-sync"}
#	if {$Para(CountType) =="Load-Synchronous"} {set mode "-loadsync"}

	if {$Para(CountDirection) =="Up"}      {set direction "up"}
	if {$Para(CountDirection) =="Down"}    {set direction "down"}
	if {$Para(CountDirection) =="Up-Down"} {set direction "updown"}

	if {$Para(CountDirection) =="Up-Down"} {
	   set direction "-updown"
	   set str [list -arch $Para(arch) -type mgcounter -width $Para(InputWidth) $direction -aclear]
	} else {
  	   set str [list -arch $Para(arch) -type mgcounter -width $Para(InputWidth) -cnt_direction $direction -aclear]
	}

	lappend str -clken

	if {$Para(InputWidth) <= 32} {
		lappend str -cnt_low $Para(Lower) -cnt_up $Para(Upper)
	}
	if {$Para(Load) == "1"} {lappend str -load}

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
		EC_CMD  {set str [Mg5g00CmdLine ]}
		SC_CMD  {set str [Or5s00CmdLine ]}
		default {set str [GeneralCmdLine]}
	} 

	#add "-group 16" option
	if {[info exists Para(OptimizeSpeed)] && $Para(OptimizeSpeed) == "1"} {
		lappend str -group 16
	}

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
	AttributeSetting 380 360
	set pin_flag 1
#	DrawImage 190 260 
	DrawImage 200 300
	set tnb $Para(tnb)

	set MaxWdth [GetMaxWdth]

	wm title . "ORCA Module -- Counter"
	#*** Here for user to add extra pages ***

		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties ;
		set frmProperty [.frmProperties childsite]

		label .lblInputClk -text "Specify the width of the counter: "
		pack .lblInputClk -in $frmProperty -side top -anchor w -padx 20 -pady 8

		frame .frmInputClk
		iwidgets::entryfield .entInputClk -labeltext "" -labelpos e -width 8 -textvariable Para(InputWidth)\
				-validate {double %c} -fixed 4
		.entInputClk.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}

		label .lblInputClkRange -text "(1 - $MaxWdth)"
		pack .entInputClk .lblInputClkRange -in .frmInputClk -side left 
		pack .frmInputClk -in $frmProperty -side top -anchor w -padx 130 -pady 4

		label .lblRepresentation -text "Specify the type of counter:"
		pack .lblRepresentation -in $frmProperty -side top -anchor w -padx 20 -pady 4
		iwidgets::combobox .cboType -width 18 -editable false -textvariable Para(CountType) -selectioncommand {CallDrawPins}
		.cboType insert list end "Asynchronous" "Load-Synchronous" "Synchronous"
		pack .cboType -in $frmProperty -side top -anchor w -padx 120 -pady 4

		label .lblCarryPort -text "Specify the direction of the counter: "
		pack .lblCarryPort -in $frmProperty -side top -anchor w -padx 20 -pady 4
		iwidgets::combobox .cboDirection -width 10 -editable false -textvariable Para(CountDirection) -selectioncommand {ChangeValueCmd}
		.cboDirection insert list end "Down" "Up" "Up-Down" 
		pack .cboDirection -in $frmProperty -side top -anchor w -padx 128 -pady 4

		#new spec
		checkbutton .cbOpmzSpd -text "Optimized for speed" -variable Para(OptimizeSpeed) -command {CallDrawPins}
		pack .cbOpmzSpd -in $frmProperty -side top -anchor w -padx 20 -pady 4
		
	CreateLabelEntryLabel $frmProperty Lower "Lower count value" 16 "(0-2^$Para(InputWidth)-1)" "" Para(Lower) integer
	pack .frmLower -in $frmProperty -side top -anchor w -padx 20 -pady 4
	.lblLower config -anchor w -padx 5
	CreateLabelEntryLabel $frmProperty Upper "Upper count value" 16 "(0-2^$Para(InputWidth)-1)" "" Para(Upper) integer
	pack .frmUpper -in $frmProperty -side top -anchor w -padx 20 -pady 4
	.lblUpper config -anchor w -padx 5

		checkbutton .cbLoad -text "Enable load input" -variable Para(Load) -command {CallDrawPins}
		pack .cbLoad -in $frmProperty -side top -anchor w -padx 20 -pady 4

		#set cbOpmzSpd status
		ChangeValueCmd

		pack .frmProperties -in $page -side top -fill both -expand 1

	#**********************************
	# GUI config for or5s00 device
	#**********************************
	if {$Para(CmdLine) == "SC_CMD"} {
		.cboDirection clear list
		.cboDirection insert list end "Down" "Up" 
	}

	#**********************************
	# GUI config for MAGMA, ECP, MOJO device
	#**********************************
		wm title . "Lattice Module -- Counter"
		pack forget .lblRepresentation .cboType
		#22791
		.lblInputClk config -text "Specify the data width of the counter: "

		$tnb view 0
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}
