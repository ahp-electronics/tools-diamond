#$Header: L:/module/slice_1d/gui/core_template.tcl 1.11 mghuang Exp $

#Rev 1.11: Diamond 2.2, IPExpress: Fixed SOF-115308
#Rev 1.10: Diamond 2.2, IPExpress: SCR_1021
#Rev 1.9: Diamond 2.2 IPExpress: Fixed CR_59547
#Rev 1.8: Diamond 2.2 IPExpress: Sapphire support.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(Taps)] > 0}  {
		DrawPins
	} 
} 

proc ChangeValueCmd {} {
	global Para

	#When Highspeed operation is selected, all the registers will have to be enabled automatically and need to be grayed out.
	#When Highspeed operation is selected, Input A & B Muxes can not be selected by the user ¨C they need to be grayed out.
	#When Asymmetry operation is selected, Symmetry selection will have to be grayed out.
	.cboSignAA config -state normal
	.cboSignAB config -state normal
	if {$Para(Mode) == "1D Symmetry"} {
		.rdo0Symmetry config -state normal
		.rdo1Symmetry config -state normal
		if {$Para(Symmetry) == "NEGATIVE"} {
			set Para(SignAA) "Signed"
			set Para(SignAB) "Signed"
			.cboSignAA config -state disabled
			.cboSignAB config -state disabled
		}
	} else {
		.rdo0Symmetry config -state disabled
		.rdo1Symmetry config -state disabled
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

	set Para(Taps) [string trimleft $Para(Taps) 0]
	set ret [IsInRange "Number of Taps" 2 144 $Para(Taps)]
	if {$ret == "-1"} {return -1}

	return 0
}

	# === ECP4 Cmd-Line ===
proc ECP4CmdLine {} {
	global Para
   
	set str "-arch $Para(arch) -type filter"	
    # -symmetric  : When Mode = 1D Symmetric. No option for Asymmetric
    # -parallel_a : When mode = 1D Asymmetric Paralle, use this option. 
	#	   No option for Serial.
	if {$Para(Mode) == "1D Symmetry"} {lappend str -symmetric}
	if {$Para(Mode) == "1D Asymmetry Parallel"} {lappend str -parallel_a}
	lappend str -num_tap $Para(Taps)
	if {$Para(Mode) == "1D Symmetry" && $Para(Symmetry) == "NEGATIVE"} {lappend str -neg_sym}
	lappend str -resetmode $Para(Rstmode)
	if {$Para(HighSpeed) == "1"} {lappend str -high_speed}
	lappend str -widtha $Para(WidthAA) -widthb $Para(WidthAB)
	#if {$Para(EnInReg) == "1"} {lappend str -input_reg}
	#if {$Para(EnPipeReg) == "1"} {lappend str -pipeline}
	#if {$Para(EnOutReg) == "1"} {lappend str -output_reg}
	switch $Para(SignAA) {
		"Unsigned" {
			switch $Para(SignAB)  {
				"Unsigned" {lappend str -unsigned}
				"Signed"   {lappend str -signed -unsigneda}
			} 
		}
		"Signed"   {
			switch $Para(SignAB)  {
				"Unsigned" {lappend str -signed -unsignedb}
				"Signed"   {lappend str -signed}
			} 
		}
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

	set str [ECP4CmdLine ]

	set opt_lst {CLK0 CLK1 CLK2 CLK3 CE0 CE1 CE2 CE3 RST0 RST1 RST2 RST3}
	set tmp [split $str " "]
	foreach opt $opt_lst {
		if {[lsearch $tmp $opt] != -1}  {
			lappend str -[string tolower $opt]
		} 
	}
#	tk_messageBox -default ok -icon warning -message $str -title "Command-Line" -type ok
#	exit

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
	AttributeSetting 400 400
	set pin_flag 1
	DrawImage 260 350
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***

	#Configuration tab
	set page1 [$tnb add -label "Configuration"]
	set w 16
	CreateLabelCombobox $page1 Mode "Mode" $w 22 Para(Mode) {"1D Asymmetry Serial" "1D Asymmetry Parallel" "1D Symmetry"} {ChangeValueCmd}
	.lblMode config -width $w -anchor w
	CreateLabelEntryLabel $page1 Taps "Number of Taps" 5 "(2 - 144)" "" Para(Taps) integer
	.lblTaps config -width $w -anchor w
	.entryTaps.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	
	#Config
	iwidgets::labeledframe .frmConfig -labeltext "" -labelpos nw
	set frmConfig [.frmConfig childsite]
	
	iwidgets::labeledframe .frmSymmetry -labeltext "" -labelpos nw
	set frmSymmetry [.frmSymmetry childsite]
	label .lblSymmetry -text "Symmetry" -width 11 -justify left
	radiobutton .rdo0Symmetry -text "POSITIVE" -variable Para(Symmetry) -value POSITIVE -width 10 -command {ChangeValueCmd} -justify left
	radiobutton .rdo1Symmetry -text "NEGATIVE" -variable Para(Symmetry) -value NEGATIVE -width 10 -command {ChangeValueCmd} -justify left
	pack .lblSymmetry .rdo0Symmetry .rdo1Symmetry -in $frmSymmetry -side left
	
	iwidgets::labeledframe .frmRstmode -labeltext "" -labelpos nw
	set frmRstmode [.frmRstmode childsite]
	label .lblRstmode -text "Reset Mode" -width 10 -justify left
	radiobutton .rdo0Rstmode -text "SYNC"  -variable Para(Rstmode) -value SYNC -width 10 -command {ChangeValueCmd} -justify left
	radiobutton .rdo1Rstmode -text "ASYNC" -variable Para(Rstmode) -value ASYNC -width 10 -command {ChangeValueCmd} -justify left
	pack .lblRstmode .rdo0Rstmode .rdo1Rstmode -in $frmRstmode -side left
	
	checkbutton .cbHighSpeed -text "Dual Channel Mode" -variable Para(HighSpeed) -command {ChangeValueCmd}
	
	pack .frmSymmetry .frmRstmode -in $frmConfig -side top -fill x -anchor w
	pack .cbHighSpeed -in $frmConfig -side top -anchor w -padx 10 -pady 4
	
	#Input Selection
	iwidgets::labeledframe .frmInput -labeltext "Input Selection" -labelpos nw
	set frmInput [.frmInput childsite]
	frame .frmDataAA
	frame .frmDataAB
	iwidgets::combobox .cboWidthAA -labeltext "DATAA Width" -labelpos w -width 6 -textvariable Para(WidthAA) -selectioncommand ChangeValueCmd -editable false
	iwidgets::combobox .cboWidthAB -labeltext "DATAB Width" -labelpos w -width 6 -textvariable Para(WidthAB) -selectioncommand ChangeValueCmd -editable false
	iwidgets::combobox .cboSignAA -labeltext "DATAA Sign" -labelpos w -width 10 -textvariable Para(SignAA) -selectioncommand ChangeValueCmd -editable false
	iwidgets::combobox .cboSignAB -labeltext "DATAB Sign" -labelpos w -width 10 -textvariable Para(SignAB) -selectioncommand ChangeValueCmd -editable false
	.cboWidthAA insert list end 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
	.cboWidthAB insert list end 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
	.cboSignAA insert list end Signed Unsigned
	.cboSignAB insert list end Signed Unsigned
	pack .cboWidthAA .cboSignAA -in .frmDataAA -side left -padx 10
	pack .cboWidthAB .cboSignAB -in .frmDataAB -side left -padx 10 -pady 4

	iwidgets::labeledframe .frmReg
	set frmReg [.frmReg childsite]
	checkbutton .ckEnInReg -text "Enable\nInput\nRegisters" -justify left -variable Para(EnInReg) -command ChangeValueCmd 
	checkbutton .ckEnPipeReg -text "Enable\nPipeline\nRegisters" -justify left -variable Para(EnPipeReg) -command ChangeValueCmd 
	checkbutton .ckEnOutReg -text "Enable\nOutput\nRegisters" -justify left -variable Para(EnOutReg) -command ChangeValueCmd 
	pack .ckEnInReg .ckEnPipeReg .ckEnOutReg -in $frmReg -side left -padx 4

	pack .frmDataAA .frmDataAB -in $frmInput -side top -anchor w
	#pack .frmReg -in $frmInput -side top

	pack .frmConfig .frmInput -in $page1 -side top -anchor w -fill x
	
	$tnb delete 0
	iwidgets::combobox .cboBusOrder -labeltext "Bus Ordering Style:" -labelpos nw \
			-width 25 -textvariable Para(Order) -editable false -selectioncommand {SelectOrderCmd}
	.cboBusOrder insert list end "Big Endian \[MSB:LSB\]" "Little Endian \[LSB:MSB\]" "None"
	pack .cboBusOrder -in $Para(f1) -side bottom -pady 8
	
	$tnb view 0

	.cboOrder clear
	.cboOrder insert list end "Big Endian \[MSB:LSB\]" "Little Endian \[LSB:MSB\]"

	ChangeValueCmd

	GeneralConfig
}
