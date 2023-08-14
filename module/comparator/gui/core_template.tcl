#$Header: L:/module/comparator/gui/core_template.tcl 1.7 mghuang Exp $

#Rev 1.7: Diamond 2.2 IPExpress: Fixed SOF-104864
#Rev 1.6: Diamond 2.0 IPExpress: Fixed CR_55812

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(InputWidth)] > 0 &&
		[string length $Para(Stage)] > 0}  {
		DrawPins
	} 
} 

proc GetTopicCB {} {
	global Para

	set Para(topic) ""
}

proc ChangeValueCmd {} {
	global Para 

	set MinWdth [GetMinWdth]
	set MaxWdth [GetMaxWdth]

	if {$Para(ReprComparator) == "Signed"}  {
		.lblInputClkRange config -text "($MinWdth-$MaxWdth)"
	} else  {
		.lblInputClkRange config -text "($MinWdth-$MaxWdth)"
	} 
	
	if {$Para(FuncComparator) == " A != B" || $Para(FuncComparator) == " A = B" } {
		.ckLut config -state normal
	} else {
		.ckLut config -state disable
		set Para(Lut) 0
	}
	
	if {$Para(InputWidth) <= "8"} {
		.entStage config -state disabled
		.lblStage config -state disable
	} else {
		.entStage config -state normal
		.lblStage config -state normal

		set n [expr int(ceil($Para(InputWidth)/8.0)-1)]
		.lblStage config -text "(0 - $n)"
		
		if {$Para(Stage) > $n} {
			set Para(Stage) $n
		}
	}

	CallDrawPins
}

# Get input max width 
proc GetMaxWdth {} {
	global Para 

	switch $Para(CmdLine) {
		SC_CMD  {set MaxWdth 256}
		default {set MaxWdth 64 }
	} 

	return $MaxWdth
}

# Get input min width 
proc GetMinWdth {} {
	global Para 

	if {$Para(ReprComparator) == "Signed"}  {
		set MinWdth 2
	} else {
		set MinWdth 1
	}

	return $MinWdth
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

	set MaxWdth [GetMaxWdth]
	
	# 28768
	set Para(InputWidth) [string trimleft $Para(InputWidth) 0]

	if {$Para(ReprComparator) == "Signed"}  {
		set ret [IsInRange "Input Width" 2 $MaxWdth $Para(InputWidth)]
		if {$ret == "-1"} {return -1}
	} else  {
		set ret [IsInRange "Input Width" 1 $MaxWdth $Para(InputWidth)]
		if {$ret == "-1"} {return -1}
	} 

	if {$Para(InputWidth) > "8"} {
		set n [expr int(ceil($Para(InputWidth)/8.0)-1)]
		set ret [IsInRange "Number of pipeline stages" 0 $n $Para(Stage)]
		if {$ret == "-1"} {return -1}
	}
	
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
	
	set represent ""
	set function ""

	if {$Para(ReprComparator) =="Signed"}   {set represent "-signed"}
	if {$Para(ReprComparator) =="Unsigned"} {set represent "-unsigned"}
	if {$represent == ""} {
		set represent "-unsigned" 
		set Para(ReprComparator) "Unsigned"
	}
    
	if {$Para(FuncComparator) ==" A = B"}  {set function "aeqb"}
	if {$Para(FuncComparator) ==" A != B"} {set function "aneb"}
	if {$Para(FuncComparator) ==" A <= B"} {set function "aleb"}
	if {$Para(FuncComparator) ==" A < B"}  {set function "altb"}
	if {$Para(FuncComparator) ==" A > B"}  {set function "agtb"}
	if {$Para(FuncComparator) ==" A >= B"} {set function "ageb"}
	if {$function == ""} {
		set function "aneb"
		set Para(FuncComparator) " A != B"
	}

	set str [list -arch $Para(arch) -type comp -width $Para(InputWidth) $represent -port $function ]
	if {$Para(OutReg) =="1"}      {lappend str -output_reg -enable}
	if {$Para(Lut) == "1"} {lappend str -pfu}
	if {$Para(InputWidth) > "8"} {
		lappend str -pipeline $Para(Stage)
		#ISPL_CR_55812, Diamond 2.0
		if {$Para(Stage) > "0" && $Para(OutReg) == "0"} {lappend str -enable}
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
	ProjectSet
	MainInterface
	AttributeSetting 380 360
	set pin_flag 1
#	DrawImage 190 250 
	DrawImage 200 300
	set tnb $Para(tnb)
	
	#*** Here for user to add extra pages ***

		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties ;
		set frmProperty [.frmProperties childsite]

		frame .frmInputClk
		label .lblInputClk -text "Specify the data width of the comparator: " 

		iwidgets::entryfield .entInputClk -labeltext "" -labelpos e -labelfont $ft -width 6 -textvariable Para(InputWidth)\
				-validate {double %c} -fixed 4
		.entInputClk.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}
		label .lblInputClkRange -text "(1-64)"
		pack .lblInputClk .entInputClk .lblInputClkRange -in .frmInputClk -side left 
		pack .frmInputClk -in $frmProperty -side top -anchor w -padx 20 -pady 8

		label .lblRepresentation -text "Specify the representation of comparator:" 
		pack .lblRepresentation -in $frmProperty -side top -anchor w -padx 20 -pady 8
		frame .frmRep
		radiobutton .rdo1Rep -text Signed   -width 10 -value Signed   -variable Para(ReprComparator) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Rep -text Unsigned -width 10 -value Unsigned -variable Para(ReprComparator) -anchor w -command {ChangeValueCmd}
		pack .rdo1Rep .rdo2Rep -in .frmRep -side left
		pack .frmRep -in $frmProperty

		iwidgets::combobox .cboFunc -labeltext "Specify the output port compare function:" -width 10 -editable false -textvariable Para(FuncComparator) \
			-selectioncommand {ChangeValueCmd}
		.cboFunc insert list end " A != B" " A < B" " A <= B" " A = B" " A > B" " A >= B"
		pack .cboFunc -in $frmProperty -side top -anchor w -padx 20 -pady 8

		checkbutton .ckLut -text "Use LUT based implementation\n(to use lesser resources)" -variable Para(Lut) -command {ChangeValueCmd}
		pack .ckLut -in $frmProperty -side top -anchor w -padx 20 -pady 8

		checkbutton .ckOutReg -text "Enable Output Register" -variable Para(OutReg) -command {ChangeValueCmd}
		pack .ckOutReg -in $frmProperty -side top -anchor w -padx 20 -pady 8

		frame .frmStage
		iwidgets::entryfield .entStage -labeltext "Specify number of pipeline stages:" -width 4 -textvariable Para(Stage) \
				-validate {double %c} -fixed 2
		label .lblStage -text "(0 - 1)"
		.entStage.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}
		
		pack .entStage .lblStage -in .frmStage -side left
		pack .frmStage -in $frmProperty -side top -anchor w -padx 20 -pady 8

		pack .frmProperties -in $page -side top -fill both -expand 1

	# *********************************
	# or5s00 device config.
	# *********************************
	if {$Para(CmdLine) == "SC_CMD"} {
		.cboFunc clear list 
		.cboFunc insert list end " A != B" " A <= B" " A >= B"
	} 

	$tnb view 0

	ChangeValueCmd

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}

