#$Header: L:/module/adder/gui/rcs/core_template.tcl 1.8 2008/02/04 06:13:55Z mghuang Exp $

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

proc ChangeValueCmd {}  {
	global Para 

	set MinWdth [GetMinWdth]
	set MaxWdth [GetMaxWdth]

	if {$Para(Representation) == "Signed"}  {
		.cboCarryPort clear	list
		.cboCarryPort insert list end "Overflow" "None"
		.lblInputClkRange config -text "($MinWdth - $MaxWdth)"
		if {$Para(COport) == "Carry-Out"}  {set Para(COport) None}
	} else  {
		.cboCarryPort clear	list
		.cboCarryPort insert list end "Carry-Out" "None"
		.lblInputClkRange config -text "($MinWdth - $MaxWdth)"
		if {$Para(COport) == "Overflow"}  {set Para(COport) None}
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

proc GetTopicCB {} {
	global Para

	set Para(topic) ""
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

	if {$Para(Representation) == "Signed"}  {
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

	if {$Para(Representation) == "Signed"}  {
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

# Command Line for MAGMA/EC device
proc Mg5g00Cmd {}  {
	global Para init_flag

	set str [list -arch $Para(arch) ]

	#19603
	switch $Para(CoreName) {
		"Adder"			   { lappend str -type mgaddsub}
		"Adder_Subtractor" { lappend str -type mgaddsub -add_sub }
		"Subtractor"	   { lappend str -type mgaddsub -direction sub}
	}

	lappend str -width $Para(InputWidth) -[string tolower $Para(Representation)]

	#DTS - 20268
	if {$Para(UseCIport) =="1"}      {lappend str -cin}
	if {$Para(COport) =="Carry-Out"} {lappend str -cout}
	if {$Para(COport) =="Overflow"}  {lappend str -overflow}
	if {$Para(OutReg) =="1"}      {lappend str -output_reg -enable}
	if {$Para(Complex) =="1"}      {lappend str -complex}
	if {$Para(InputWidth) > "8"} {lappend str -pipeline $Para(Stage)}
	
	return $str
} 

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	if {$Para(Representation) =="Signed"}   {set represent "-signed"}
	if {$Para(Representation) =="Unsigned"} {set represent "-unsigned"}

	set str [list -arch $Para(arch) ]

	switch $Para(CoreName) {
		"Adder"			   { lappend str -type add }
		"Adder_Subtractor" { lappend str -type addsub }
		"Subtractor"	   { lappend str -type sub }
	}

	lappend str -width $Para(InputWidth) $represent

	if {$Para(UseCIport) =="1"}      {lappend str -port ci}
	if {$Para(COport) =="Carry-Out"} {lappend str -port co}
	if {$Para(COport) =="Overflow"}  {lappend str -port overflow}

	return $str
} 

# Command Line for or5s00 device
proc Or5s00Cmd {}  {
	global Para

	switch $Para(CoreName) {
		"Adder"		 { set str "-arch $Para(arch) -type add" }
		"Subtractor" { set str "-arch $Para(arch) -type sub" }
	}

	lappend str -width $Para(InputWidth) -[string tolower $Para(Representation)]
	if {$Para(UseCIport) =="1"}      {lappend str -port ci}
	if {$Para(COport) =="Carry-Out"} {lappend str -port co}
	if {$Para(COport) =="Overflow"}  {lappend str -port overflow}
	if {$Para(OutReg) =="1"}      {lappend str -output_reg -enable}
	if {$Para(Complex) =="1"}      {lappend str -complex}
	if {$Para(InputWidth) > "8"} {lappend str -pipeline $Para(Stage)}

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
		EC_CMD  {set str [Mg5g00Cmd ]}
		SC_CMD  {set str [Or5s00Cmd ]}
		default {set str [GeneralCmd]}
	} 
#	tk_messageBox -default ok -icon warning -message $str -title "Command-Line" -type ok
	return $str
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
	AttributeSetting 380 360
	set pin_flag 1
	DrawImage 220 300 
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***

		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties ;
		set frmProperty [.frmProperties childsite]

		frame .frmInputClk
		label .lblInputClk -text "Specify the Data Width of the $Para(CoreName):" 

		iwidgets::entryfield .entInputClk -labeltext "" -labelpos e -width 4 -textvariable Para(InputWidth) \
				-validate {double %c} -fixed 3
		.entInputClk.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}
		label .lblInputClkRange -text "(1 - 64)"
		pack .lblInputClk .entInputClk .lblInputClkRange -in .frmInputClk -side left 
		pack .frmInputClk -in $frmProperty -side top -anchor w -padx 20 -pady 4

		label .lblRepresentation -text "Specify the Representation of the $Para(CoreName):" 
		pack .lblRepresentation -in $frmProperty -side top -anchor w -padx 20 -pady 4

		frame .frmRep
		radiobutton .rdo1Rep -text Signed   -width 10 -value Signed   -variable Para(Representation) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Rep -text Unsigned -width 10 -value Unsigned -variable Para(Representation) -anchor w -command {ChangeValueCmd}
		pack .rdo1Rep .rdo2Rep -in .frmRep -side left
		pack .frmRep -in $frmProperty -side top -anchor w -padx 60

		checkbutton .ckReadOnly -text "Use Carry-in port" -variable Para(UseCIport) -command {ChangeValueCmd}
		pack .ckReadOnly -in $frmProperty -side top -anchor w -padx 20 -pady 4
		
		#*** carryport ***
		iwidgets::combobox .cboCarryPort -labeltext "Specify the Carry-out Port: " -width 12 -editable false -textvariable Para(COport) -selectioncommand {ChangeValueCmd}
		.cboCarryPort insert list end "Carry-Out" "None"
		pack .cboCarryPort -in $frmProperty -side top -anchor w -padx 20 

		checkbutton .ckOutReg -text "Enable Output Register" -variable Para(OutReg) -command {ChangeValueCmd}
		pack .ckOutReg -in $frmProperty -side top -anchor w -padx 20 -pady 4

		checkbutton .ckComplex -text "Complex Inputs" -variable Para(Complex) -command {ChangeValueCmd}
		pack .ckComplex -in $frmProperty -before .ckReadOnly -side top -anchor w -padx 20 -pady 4
		
		frame .frmStage
		iwidgets::entryfield .entStage -labeltext "Specify number of pipeline stages:" -width 4 -textvariable Para(Stage) \
				-validate {double %c} -fixed 2
		label .lblStage -text "(0 - 1)"
		.entStage.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}
		
		pack .entStage .lblStage -in .frmStage -side left
		pack .frmStage -in $frmProperty -side top -anchor w -padx 20 -pady 4
		
		pack .frmProperties -in $page -side top -fill both -expand 1

		$tnb view 0

	LoadParaCB
#initpara	
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}
