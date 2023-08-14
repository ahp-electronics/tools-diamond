#$Header: L:/module/multaddsubsum/latticeecp3/gui/rcs/core_template.tcl 1.14 2009/07/22 01:19:11Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(widtha)] > 0 && [string length $Para(widthb)] > 0}  {
		DrawPins
	} 
} 

	# === ECP2 Cmd-Line ===
proc ECP3CmdLine {} {
	global Para

	set str "-arch $Para(arch) -type dspmaddsum"

	lappend str -widtha $Para(widtha) -widthb $Para(widthb) -widthp $Para(widthp)

	#lappend str -gsr $Para(gsr)
	lappend str -[string tolower $Para(area_speed)]

	switch $Para(addsub0) {
	    "Add" {lappend str -madd0}
	    "Sub" {lappend str -msub0}
	    "Dynamic" {lappend str -maddsub0}
	}
	switch $Para(addsub1) {
	    "Add" {lappend str -madd1}
	    "Sub" {lappend str -msub1}
	    "Dynamic" {lappend str -maddsub1}
	}
	
	switch $Para(InputA0) {
	    "Parallel" {}
	    "Shift"    {lappend str -shiftina0}
	    "Dynamic"  {lappend str -dynamica0}
	}
	switch $Para(InputB0) {
	    "Parallel" {}
	    "Shift"    {lappend str -shiftinb0}
	    "Dynamic"  {lappend str -dynamicb0}
	}
	switch $Para(InputA1) {
	    "Parallel" {}
	    "Shift"    {lappend str -shiftina1}
	    "Dynamic"  {lappend str -dynamica1}
	}
	switch $Para(InputB1) {
	    "Parallel" {}
	    "Shift"    {lappend str -shiftinb1}
	    "Dynamic"  {lappend str -dynamicb1}
	}
	switch $Para(InputA2) {
	    "Parallel" {}
	    "Shift"    {lappend str -shiftina2}
	    "Dynamic"  {lappend str -dynamica2}
	}
	switch $Para(InputB2) {
	    "Parallel" {}
	    "Shift"    {lappend str -shiftinb2}
	    "Dynamic"  {lappend str -dynamicb2}
	}
	switch $Para(InputA3) {
	    "Parallel" {}
	    "Shift"    {lappend str -shiftina3}
	    "Dynamic"  {lappend str -dynamica3}
	}
	switch $Para(InputB3) {
	    "Parallel" {}
	    "Shift"    {lappend str -shiftinb3}
	    "Dynamic"  {lappend str -dynamicb3}
	}

	switch $Para(SignedA) {
	    "Unsigned" {
			switch $Para(SignedB)  {
				"Unsigned" {}
				"Signed"   {lappend str -signed -unsigneda}
				"Dynamic"  {lappend str -signedb}
			} 
		}
	    "Signed"   {
			switch $Para(SignedB)  {
				"Unsigned" {lappend str -signed -unsignedb}
				"Signed"   {lappend str -signed}
				"Dynamic"  {lappend str -signed -signedb}
			} 
		}
	    "Dynamic"  {
			switch $Para(SignedB)  {
				"Unsigned" {lappend str -signeda}
				"Signed"   {lappend str -signed -signeda}
				"Dynamic"  {lappend str -signeda -signedb}
			} 
		}
	}

	if {$Para(shiftouta)==1} {lappend str -shiftouta}
	if {$Para(shiftoutb)==1} {lappend str -shiftoutb}

	if {$Para(EnIRAClk) != ""} {
		lappend str -rega0 -rega1 -rega2 -rega3
		foreach opt {rega0 rega1 rega2 rega3} {
			lappend str -${opt}clk $Para(EnIRAClk)
			lappend str -${opt}ce $Para(EnIRACE)
			lappend str -${opt}rst $Para(EnIRARST)
		}
	}
	if {$Para(EnIRBClk) != ""} {
		lappend str -regb0 -regb1 -regb2 -regb3
		foreach opt {regb0 regb1 regb2 regb3} {
			lappend str -${opt}clk $Para(EnIRBClk)
			lappend str -${opt}ce $Para(EnIRBCE)
			lappend str -${opt}rst $Para(EnIRBRST)
		}
	}
	if {$Para(EnPM) == 1} {lappend str -pipe_full}
	if {$Para(EnPRClk) != ""} {
		lappend str -regp0 -regp1 -regp2 -regp3 -regas1_0 -regas1_1 -regas3_0 -regas3_1
		foreach opt {regp0 regp1 regp2 regp3 regas1_0 regas1_1 regas3_0 regas3_1} {
			if {$Para(EnPRClk) == "InputA"} {
				lappend str -${opt}clk $Para(EnIRAClk)
				lappend str -${opt}rst $Para(EnIRARST)
				lappend str -${opt}ce $Para(EnPRCE)
			}
			if {$Para(EnPRClk) == "InputB"} {
				lappend str -${opt}clk $Para(EnIRBClk)
				lappend str -${opt}rst $Para(EnIRBRST)
				lappend str -${opt}ce $Para(EnPRCE)
			}
			if {$Para(EnPRClk) == "CLK0" || $Para(EnPRClk) == "CLK1"} {
				lappend str -${opt}clk $Para(EnPRClk)
				lappend str -${opt}rst $Para(EnPRRST)
				lappend str -${opt}ce $Para(EnPRCE)
			}
		}
	}
	if {$Para(EnOR) == 1} {
		if {$Para(EnORClk) != ""} {
			lappend str -rego
			if {$Para(EnORClk) == "Pipeline"} {
				if {$Para(EnPRClk) == "InputA"} {
					lappend str -regoclk $Para(EnIRAClk)
					lappend str -regorst $Para(EnIRARST)
				}
				if {$Para(EnPRClk) == "InputB"} {
					lappend str -regoclk $Para(EnIRBClk)
					lappend str -regorst $Para(EnIRBRST)
				}
				if {$Para(EnPRClk) == "CLK0" || $Para(EnPRClk) == "CLK1"} {
					lappend str -regoclk $Para(EnPRClk)
					lappend str -regorst $Para(EnPRRST)
				}
				lappend str -regoce $Para(EnORCE)
			} else {
				if {$Para(EnORClk) == "InputA"} {
					lappend str -regoclk $Para(EnIRAClk)
					lappend str -regorst $Para(EnIRARST)
				}
				if {$Para(EnORClk) == "InputB"} {
					lappend str -regoclk $Para(EnIRBClk)
					lappend str -regorst $Para(EnIRBRST)
				}
				if {$Para(EnORClk) == "CLK0" || $Para(EnORClk) == "CLK1"} {
					lappend str -regoclk $Para(EnORClk)
					lappend str -regorst $Para(EnORRST)
				}
				lappend str -regoce $Para(EnORCE)
			}
		}
	}

	if {$Para(reset) == "SYNC"} {lappend str -enable_sync}

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

	set str [ECP3CmdLine ]

	set opt_lst {CLK0 CLK1 CLK2 CLK3 CE0 CE1 CE2 CE3 RST0 RST1 RST2 RST3}
	set tmp [split $str " "]
	foreach opt $opt_lst {
		if {[lsearch $tmp $opt] != -1}  {
			lappend str -[string tolower $opt]
		} 
	}

	return $str
}

proc ChangeValueCmd {} {
	global Para

	set Para(widthp) [expr $Para(widtha)+$Para(widthb)+2]
	#ISPL_CR_29788 
	if {$Para(widtha) <= 18 && $Para(widthb) <=18}  {
		.cboInputA0 config -state normal
		.cboInputB0 config -state normal
		.cboInputA1 config -state normal
		.cboInputB1 config -state normal
		.cboInputA2 config -state normal
		.cboInputB2 config -state normal
		.cboInputA3 config -state normal
		.cboInputB3 config -state normal
		.ckshiftouta config -state normal
		.ckshiftoutb config -state normal
	} else  {
		set Para(InputA0) Parallel
		set Para(InputB0) Parallel
		set Para(InputA1) Parallel
		set Para(InputB1) Parallel
		set Para(InputA2) Parallel
		set Para(InputB2) Parallel
		set Para(InputA3) Parallel
		set Para(InputB3) Parallel
		set Para(shiftouta) 0
		set Para(shiftoutb) 0
		.cboInputA0 config -state disabled
		.cboInputB0 config -state disabled
		.cboInputA1 config -state disabled
		.cboInputB1 config -state disabled
		.cboInputA2 config -state disabled
		.cboInputB2 config -state disabled
		.cboInputA3 config -state disabled
		.cboInputB3 config -state disabled
		.ckshiftouta config -state disabled
		.ckshiftoutb config -state disabled
	} 

	#Page 59 Rev 3.9
	#5,6
	if {$Para(InputA0) == "Shift" || $Para(InputA0) == "Dynamic" || 
		$Para(InputA1) == "Shift" || $Para(InputA1) == "Dynamic" ||
		$Para(InputA2) == "Shift" || $Para(InputA2) == "Dynamic" ||
		$Para(InputA3) == "Shift" || $Para(InputA3) == "Dynamic" ||
		$Para(shiftouta) == "1"} {
		.ckEnIRA config -state disabled
		set Para(EnIRA) 1
	} else {
		.ckEnIRA config -state normal
	}
	if {$Para(InputB0) == "Shift" || $Para(InputB0) == "Dynamic" || 
		$Para(InputB1) == "Shift" || $Para(InputB1) == "Dynamic" ||
		$Para(InputB2) == "Shift" || $Para(InputB2) == "Dynamic" ||
		$Para(InputB3) == "Shift" || $Para(InputB3) == "Dynamic" ||
		$Para(shiftoutb) == "1"} {
		.ckEnIRB config -state disabled
		set Para(EnIRB) 1
	} else {
		.ckEnIRB config -state normal
	}

	#Page 55 Rev 3.9
	#7.a
	if {$Para(InputB2) == "Shift" || $Para(InputB2) == "Dynamic"} {
		.ckEnPM config -state disabled
		set Para(EnPM) 0
	} else {
		.ckEnPM config -state normal
	}
	#7.b&c
	if {$Para(EnPM) == "1"} {
		.ckEnPR config -state disabled
		set Para(EnPR) 1
		.cbEnPRClk config -state normal
		.cbEnPRCE config -state normal
		if {$Para(EnIRA) == 0 || $Para(EnIRB) == 0} {.cbEnPRRST config -state normal}

		.ckEnOR config -state disabled
		set Para(EnOR) 1
		if {$Para(EnORClk) != "Pipeline"} {.cbEnORClk config -state normal}
		.cbEnORCE config -state normal
		if {$Para(EnORRST) != "Pipeline"} {.cbEnORRST config -state normal}
	} else {
		.ckEnPR config -state normal
		.ckEnOR config -state normal
	}

	#p55 note1,2,3.a,4.a
	foreach i {EnIRA EnIRB EnPR EnOR} {
		if {$Para($i) == "0"} {
			.cb${i}Clk config -state disabled
			set Para(${i}Clk)  ""
			.cb${i}CE  config -state disabled
			set Para(${i}CE) ""
			.cb${i}RST config -state disabled
			set Para(${i}RST) ""
		} else {
			.cb${i}Clk config -state normal
			if {$Para(${i}Clk)== ""} {set Para(${i}Clk) "CLK0"}
			.cb${i}CE  config -state normal
			if {$Para(${i}CE)== ""} {set Para(${i}CE) "CE0"}
			.cb${i}RST config -state normal
			if {$Para(${i}RST)== ""} {set Para(${i}RST) "RST0"}
		}
	}

	#p56 3.b
	if {$Para(EnPR) == 1} {
		#p49 3.c
		if {$Para(EnIRA) == 1 && $Para(EnIRB) == 1} {
			.cbEnPRClk config -state normal
			.cbEnPRClk clear list
			.cbEnPRClk insert list end InputA InputB
			if {[lsearch {InputA InputB} $Para(EnPRClk)] == -1} {
				set Para(EnPRClk) InputA
			}
			.cbEnPRRST config -state disabled
			set Para(EnPRRST) $Para(EnPRClk)
		} else {
		#3.d
			.cbEnPRClk config -state normal
			.cbEnPRClk clear list
			.cbEnPRClk insert list end CLK0 CLK1
			if {[lsearch {CLK0 CLK1} $Para(EnPRClk)] == -1} {
				set Para(EnPRClk) CLK0
			}
			.cbEnPRRST config -state normal
			.cbEnPRRST clear list
			.cbEnPRRST insert list end "RST0" "RST1"
			if {[lsearch {"RST0" "RST1"} $Para(EnPRRST)] == -1} {
				set Para(EnPRRST) RST0
			}
		}
	}

	#p56 4.b
	if {$Para(EnOR) == 1} {
		#4.c
		if {$Para(EnPR) == 1} {
			set Para(EnORClk) Pipeline
			.cbEnORClk config -state disabled
			set Para(EnORRST) Pipeline
			.cbEnORRST config -state disabled
		} else {
		#4.d
			if {$Para(EnIRA) == 1 && $Para(EnIRB) == 1} {
				.cbEnORClk config -state normal
				.cbEnORClk clear list
				.cbEnORClk insert list end InputA InputB
				if {[lsearch {InputA InputB} $Para(EnORClk)] == -1} {
					set Para(EnORClk) InputA
				}
				.cbEnORRST config -state disabled
				set Para(EnORRST) $Para(EnORClk)
			} else {
			#4.e
				.cbEnORClk config -state normal
				.cbEnORClk clear list
				.cbEnORClk insert list end CLK0 CLK1
				if {[lsearch {CLK0 CLK1} $Para(EnORClk)] == -1} {
					set Para(EnORClk) CLK0
				}
				.cbEnORRST config -state normal
				.cbEnORRST clear list
				.cbEnORRST insert list end "RST0" "RST1"
				if {[lsearch {"RST0" "RST1"} $Para(EnORRST)] == -1} {
					set Para(EnORRST) RST0
				}
			}
		}
	}
	
	#ChangeCKCmd

	CallDrawPins
	
	if {$Para(EnPM) == "1"} {
		.lblLatency config -text "Latency = $Para(Latency)"
	} else {
		.lblLatency config -text ""
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

	set ret [IsInRange "widtha " 2 72 $Para(widtha)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "widthb " 2 72 $Para(widthb)]
	if {$ret == "-1"} {return -1}
#	set ret [IsInRange "widthp " 1 160 $Para(widthp)]
#	if {$ret == "-1"} {return -1}

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
	AttributeSetting 500 590
	set pin_flag 1
	DrawImage 260 450
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***

	set page1 [$tnb add -label "Configuration"]
	frame .basicframe

	#Size of the DSPMAC block
	iwidgets::labeledframe .basicsize -labeltext "Size of DSPMULTADDSUBSUM block" -labelpos nw
	set basicsize [.basicsize childsite]
	CreateEntry $basicsize widtha "Input A0/A1/A2/A3 width" 22 5 left Para(widtha) integer
	.entrywidtha config -fixed 2
	CreateEntry $basicsize widthb "Input B0/B1/B2/B3 width"   22 5 left Para(widthb) integer
	.entrywidthb config -fixed 2
	CreateEntry $basicsize widthp "Sum output width"   22 8 left Para(widthp) integer
	.entrywidthp config -state disabled ;#-foreground gray50
	pack .frmwidtha .frmwidthb .frmwidthp -in $basicsize -side top -pady 2
	.lblwidtha config -anchor w
	.lblwidthb config -anchor w
	.lblwidthp config -anchor w

	.entrywidtha config -labeltext "(2-72)" -labelpos e
	.entrywidthb config -labeltext "(2-72)" -labelpos e

	.entrywidtha.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entrywidthb.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

	#42755
	label .lblEquation -text "SUM = ((A0*B0 + A1*B1) + (A2*B2 + A3*B3))"
	pack .lblEquation -in $basicsize -side top -pady 2;# -anchor w
		
	# Select Block Options
	iwidgets::labeledframe .basicblkoption -labeltext "Select Options" -labelpos nw
	set basicblkoption [.basicblkoption childsite]
	checkbutton .ckshiftouta  -text "Select Shift Out A" -variable Para(shiftouta) -command ChangeValueCmd 
	checkbutton .ckshiftoutb  -text "Select Shift Out B" -variable Para(shiftoutb) -command ChangeValueCmd
	pack .ckshiftouta .ckshiftoutb -in $basicblkoption -side top -anchor w
	CreateLabelCombobox $basicblkoption cbaddsub0 "Add/Sub 0 Operation" 18 8 Para(addsub0) \
		{Add Sub Dynamic} {ChangeValueCmd}
	.lblcbaddsub0    config -anchor w
	CreateLabelCombobox $basicblkoption cbaddsub1 "Add/Sub 1 Operation" 18 8 Para(addsub1) \
		{Add Sub Dynamic} {ChangeValueCmd}
	.lblcbaddsub1    config -anchor w

	pack .basicsize .basicblkoption -in .basicframe -side left -padx 1 -fill y
	pack .basicframe -in $page1  -anchor w -fill x

	# Data Format
	iwidgets::labeledframe .basicoption -labeltext "Data Options" -labelpos nw -ipady 4
	set basicoption [.basicoption childsite]
	frame .frmLeft
	CreateLabelCombobox .frmLeft InputA0 "Input A0 Source" 14 10 Para(InputA0) {} {ChangeValueCmd}
	CreateLabelCombobox .frmLeft InputA1 "Input A1 Source" 14 10 Para(InputA1) {} {ChangeValueCmd}
	.cboInputA0 insert list end Parallel Shift Dynamic
	.cboInputA1 insert list end Parallel Shift Dynamic
	CreateLabelCombobox .frmLeft InputA2 "Input A2 Source" 14 10 Para(InputA2) {} {ChangeValueCmd}
	CreateLabelCombobox .frmLeft InputA3 "Input A3 Source" 14 10 Para(InputA3) {} {ChangeValueCmd}
	.cboInputA2 insert list end Parallel Shift Dynamic
	.cboInputA3 insert list end Parallel Shift Dynamic
	CreateLabelCombobox .frmLeft SignedA "Data Type A" 14 10 Para(SignedA) {Signed Unsigned Dynamic} {ChangeValueCmd}
	.lblInputA0   config -anchor w
	.lblInputA1   config -anchor w
	.lblInputA2   config -anchor w
	.lblInputA3   config -anchor w
	.lblSignedA  config -anchor w

	frame .frmRight
	CreateLabelCombobox .frmRight InputB0 "Input B0 Source" 14 10 Para(InputB0) {} {ChangeValueCmd}
	CreateLabelCombobox .frmRight InputB1 "Input B1 Source" 14 10 Para(InputB1) {} {ChangeValueCmd}
	.cboInputB0 insert list end Parallel Shift Dynamic
	.cboInputB1 insert list end Parallel Shift Dynamic
	CreateLabelCombobox .frmRight InputB2 "Input B2 Source" 14 10 Para(InputB2) {} {ChangeValueCmd}
	CreateLabelCombobox .frmRight InputB3 "Input B3 Source" 14 10 Para(InputB3) {} {ChangeValueCmd}
	.cboInputB2 insert list end Parallel Shift Dynamic
	.cboInputB3 insert list end Parallel Shift Dynamic
	CreateLabelCombobox .frmRight SignedB "Data Type B" 14 10 Para(SignedB) {Signed Unsigned Dynamic} {ChangeValueCmd}
	.lblInputB0   config -anchor w
	.lblInputB1   config -anchor w
	.lblInputB2   config -anchor w
	.lblInputB3   config -anchor w
	.lblSignedB  config -anchor w
	
	pack .frmLeft .frmRight -in $basicoption -side left -fill both -expand true 
	pack .basicoption  -in $page1  -anchor w -fill x

	#
	iwidgets::labeledframe .register -labeltext "Register Options" -labelpos nw
	set register [.register childsite]
	
	label .lblGsr -text "GSR:"
	label .lblRst -text "Reset Mode:"
	checkbutton .ckEnIRA -text "Enable Input\nRegister A0/A1/A2/A3" -variable Para(EnIRA) -command ChangeValueCmd
	checkbutton .ckEnIRB -text "Enable Input\nRegister B0/B1/B2/B3" -variable Para(EnIRB) -command ChangeValueCmd
	checkbutton .ckEnPR -text "Enable Pipeline\nRegister" -variable Para(EnPR) -command ChangeValueCmd
	checkbutton .ckEnOR -text "Enable Output\nRegister" -variable Para(EnOR) -command ChangeValueCmd
	
	label .lblClk -text "Clock"
	label .lblCE -text "CE"
	label .lblR -text "RST"
	#radiobutton .rdo1$main -text $text1 -width $rdowidth -value $val1 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo1gsr -text "Enabled" -value ENABLED -variable Para(gsr) -command ChangeValueCmd 
	radiobutton .rdo2gsr -text "Disabled" -value DISABLED -variable Para(gsr) -command ChangeValueCmd

	radiobutton .rdo1Reset -text "SYNC" -value SYNC -variable Para(reset) -command ChangeValueCmd 
	radiobutton .rdo2Reset -text "ASYNC" -value ASYNC -variable Para(reset) -command ChangeValueCmd

	iwidgets::combobox .cbEnIRAClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRAClk) -selectioncommand {ChangeValueCmd}
	.cbEnIRAClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnIRACE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRACE) -selectioncommand {ChangeValueCmd} 
	.cbEnIRACE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnIRARST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRARST) -selectioncommand {ChangeValueCmd} 
	.cbEnIRARST insert list end "RST0" "RST1"

	iwidgets::combobox .cbEnIRBClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBClk) -selectioncommand {ChangeValueCmd} 
	.cbEnIRBClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnIRBCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBCE) -selectioncommand {ChangeValueCmd} 
	.cbEnIRBCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnIRBRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBRST) -selectioncommand {ChangeValueCmd} 
	.cbEnIRBRST insert list end "RST0" "RST1"

	iwidgets::combobox .cbEnPRClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRClk) -selectioncommand {ChangeValueCmd} 
	.cbEnPRClk insert list end InputA InputB "CLK0" "CLK1"
	iwidgets::combobox .cbEnPRCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRCE) -selectioncommand {ChangeValueCmd} 
	.cbEnPRCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnPRRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRRST) -selectioncommand {ChangeValueCmd} 
	.cbEnPRRST insert list end InputA InputB "RST0" "RST1"

	# Enable Output Register
	iwidgets::combobox .cbEnORClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORClk) -selectioncommand {ChangeValueCmd} 
	.cbEnORClk insert list end Pipeline InputA InputB "CLK0" "CLK1"
	iwidgets::combobox .cbEnORCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORCE) -selectioncommand {ChangeValueCmd} 
	.cbEnORCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnORRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORRST) -selectioncommand {ChangeValueCmd} 
	.cbEnORRST insert list end Pipeline InputA InputB "RST0" "RST1"
	
	#grid .lblGsr .rdo1gsr .rdo2gsr -in $register -sticky w -padx 16 -pady 2
	grid .lblRst .rdo1Reset .rdo2Reset -in $register -sticky w -padx 16 -pady 2
	grid x .lblClk .lblCE .lblR -in $register -sticky w -padx 16 -pady 2
	grid .ckEnIRA .cbEnIRAClk .cbEnIRACE .cbEnIRARST -in $register -sticky w -padx 16
	grid .ckEnIRB .cbEnIRBClk .cbEnIRBCE .cbEnIRBRST -in $register -sticky w -padx 16

	checkbutton .ckEnPM -text "Enable Pipelined Mode" -variable Para(EnPM) -command ChangeValueCmd
	label .lblLatency -text "Latency = 4"
	grid .ckEnPM -in $register -sticky w -padx 16 -columnspan 2
	grid .lblLatency -in $register -sticky w -padx 36
	
	grid .ckEnPR .cbEnPRClk .cbEnPRCE .cbEnPRRST -in $register -sticky w -padx 16
	grid .ckEnOR .cbEnORClk .cbEnORCE .cbEnORRST -in $register -sticky w -padx 16
	
	pack .register -in $page1 -anchor w -fill x
	
	$tnb view 0

	.cboOrder clear
	.cboOrder insert list end "Big Endian \[MSB:LSB\]" "Little Endian \[LSB:MSB\]"

	ChangeValueCmd

	GeneralConfig
}
