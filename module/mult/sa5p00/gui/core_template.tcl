#$Header: L:/module/mult/sa5p00/gui/core_template.tcl 1.0 mghuang Exp $

#Rev 1.0: Diamond 2.2, IPExpress: Sapphire support.

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

	set str "-arch $Para(arch) -type dspmult"

	lappend str -widtha $Para(widtha) -widthb $Para(widthb) -widthp $Para(widthp)

	#lappend str -gsr $Para(gsr)
	lappend str -[string tolower $Para(area_speed)]

	switch $Para(InputA) {
	    "Parallel" {}
	    "Shift"    {lappend str -shiftina}
	    "Dynamic"  {lappend str -dynamica}
	}
	switch $Para(InputB) {
	    "Parallel" {}
	    "Shift"    {lappend str -shiftinb}
	    "Dynamic"  {lappend str -dynamicb}
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
		lappend str -rega
		lappend str -regaclk $Para(EnIRAClk)
		lappend str -regace $Para(EnIRACE)
		lappend str -regarst $Para(EnIRARST)
	}
	if {$Para(EnIRBClk) != ""} {
		lappend str -regb
		lappend str -regbclk $Para(EnIRBClk)
		lappend str -regbce $Para(EnIRBCE)
		lappend str -regbrst $Para(EnIRBRST)
	}
	if {$Para(EnPM) == 1} {lappend str -pipe_full}
	if {$Para(EnPRClk) != ""} {
		lappend str -regp
		if {$Para(EnPRClk) == "InputA"} {
			lappend str -regpclk $Para(EnIRAClk)
			lappend str -regprst $Para(EnIRARST)
			lappend str -regpce $Para(EnPRCE)
		}
		if {$Para(EnPRClk) == "InputB"} {
			lappend str -regpclk $Para(EnIRBClk)
			lappend str -regprst $Para(EnIRBRST)
			lappend str -regpce $Para(EnPRCE)
		}
		if {$Para(EnPRClk) == "CLK0" || $Para(EnPRClk) == "CLK1"} {
			lappend str -regpclk $Para(EnPRClk)
			lappend str -regprst $Para(EnPRRST)
			lappend str -regpce $Para(EnPRCE)
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

	set Para(widthp) [expr $Para(widtha)+$Para(widthb)+0]
	if {$Para(widtha) <= 18 && $Para(widthb) <=18}  {
		.cboInputA config -state normal
		.cboInputB config -state normal
		.ckshiftouta config -state normal
		.ckshiftoutb config -state normal
	} else  {
		set Para(InputA) Parallel
		set Para(InputB) Parallel
		set Para(shiftouta) 0
		set Para(shiftoutb) 0
		.cboInputA config -state disabled
		.cboInputB config -state disabled
		.ckshiftouta config -state disabled
		.ckshiftoutb config -state disabled
	} 
	
	#Page 46 Rev 3.9
	#5,6
	if {$Para(InputA) == "Shift" || $Para(InputA) == "Dynamic" ||
		$Para(shiftouta) == "1"} {
		.ckEnIRA config -state disabled
		set Para(EnIRA) 1
	} else {
		.ckEnIRA config -state normal
	}
	if {$Para(InputB) == "Shift" || $Para(InputB) == "Dynamic" || 
		$Para(shiftoutb) == "1"} {
		.ckEnIRB config -state disabled
		set Para(EnIRB) 1
	} else {
		.ckEnIRB config -state normal
	}

	#Page 46 Rev 3.9
	#7
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
	
	#p46 note1,2,3.a,4.a
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

	#p46 3.b
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

	#p46 4.b
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
	switch $tcl_platform(platform) {
		windows {AttributeSetting 460 460}
		unix    {AttributeSetting 450 480}
	}
	set pin_flag 1
	DrawImage 260 450
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***

	set page1 [$tnb add -label "Configuration"]
	#Size of the DSPMAC block
	iwidgets::labeledframe .basicsize -labeltext "Size of the DSPMULT block" -labelpos nw
	set basicsize [.basicsize childsite]
	
	label .lblInputA -text "Input A"
	label .lblInputB -text "Input B"
	label .lblOutput -text "Output"
	
	label .lblWidth -text "Width"
	label .lblDataType -text "Data Type"
	label .lblSource -text "Source"

	#iwidgets::entryfield .entry$main -width $width -textvariable $para -fixed [expr $width-2] -validate $p
	iwidgets::entryfield .entrywidtha -width 4 -textvariable Para(widtha) -fixed 2 -labeltext "(2-72)" -labelpos e -validate integer
	iwidgets::entryfield .entrywidthb -width 4 -textvariable Para(widthb) -fixed 2 -labeltext "(2-72)" -labelpos e -validate integer
	iwidgets::entryfield .entrywidthp -width 6 -textvariable Para(widthp) -state disabled
	.entrywidtha.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entrywidthb.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

	#iwidgets::combobox .cbo$main -width $cbowidth -editable false -textvariable $para -selectioncommand $p
	iwidgets::combobox .cboSignedA -width 10 -editable false -textvariable Para(SignedA) -selectioncommand {ChangeValueCmd}
	.cboSignedA insert list end Signed Unsigned Dynamic
	iwidgets::combobox .cboSignedB -width 10 -editable false -textvariable Para(SignedB) -selectioncommand {ChangeValueCmd}
	.cboSignedB insert list end Signed Unsigned Dynamic
	
	iwidgets::combobox .cboInputA -width 10 -editable false -textvariable Para(InputA) -selectioncommand {ChangeValueCmd}
	.cboInputA insert list end Parallel Shift Dynamic
	iwidgets::combobox .cboInputB -width 10 -editable false -textvariable Para(InputB) -selectioncommand {ChangeValueCmd}
	.cboInputB insert list end Parallel Shift Dynamic
	
	checkbutton .ckshiftouta  -text "Select Shift Out A" -variable Para(shiftouta) -command ChangeValueCmd 
	checkbutton .ckshiftoutb  -text "Select Shift Out B" -variable Para(shiftoutb) -command ChangeValueCmd

	grid x .lblWidth .lblDataType .lblSource -in $basicsize -sticky w -padx 16 -pady 2
	grid .lblInputA .entrywidtha .cboSignedA .cboInputA -in $basicsize -padx 16 -pady 2
	grid .lblInputB .entrywidthb .cboSignedB .cboInputB -in $basicsize -padx 16 -pady 2
	grid .lblOutput .entrywidthp -in $basicsize -padx 16 -pady 2
	grid .ckshiftouta -row 4 -column 0 -columnspan 2 -in $basicsize -padx 16 -pady 2
	grid .ckshiftoutb -row 4 -column 2 -columnspan 2 -in $basicsize -padx 16 -pady 2
	pack .basicsize -in $page1 -fill x

	#
	iwidgets::labeledframe .register -labeltext "Register Options" -labelpos nw
	set register [.register childsite]
	
	label .lblGsr -text "GSR:"
	label .lblRst -text "Reset Mode:"
	checkbutton .ckEnIRA -text "Enable Input\nRegister A" -variable Para(EnIRA) -command ChangeValueCmd
	checkbutton .ckEnIRB -text "Enable Input\nRegister B" -variable Para(EnIRB) -command ChangeValueCmd
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
	label .lblLatency -text "Latency = 3"
	grid .ckEnPM -in $register -sticky w -padx 16 -columnspan 2
	grid .lblLatency -in $register -sticky w -padx 36
	
	grid .ckEnPR .cbEnPRClk .cbEnPRCE .cbEnPRRST -in $register -sticky w -padx 16
	grid .ckEnOR .cbEnORClk .cbEnORCE .cbEnORRST -in $register -sticky w -padx 16
	
	pack .register -in $page1 -fill x
	
	$tnb view 0

	.cboOrder clear
	.cboOrder insert list end "Big Endian \[MSB:LSB\]" "Little Endian \[LSB:MSB\]"

	ChangeValueCmd

	GeneralConfig
}
