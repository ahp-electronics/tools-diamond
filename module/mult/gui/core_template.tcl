#$Header: L:/module/mult/gui/rcs/core_template.tcl 1.22 2008/12/16 01:16:34Z mghuang Exp $

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
proc ECP2CmdLine {} {
	global Para

	set str "-arch $Para(arch) -type dspmult"

	lappend str -widtha $Para(widtha) -widthb $Para(widthb) -widthp $Para(widthp)

	lappend str -gsr $Para(gsr)
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

	#ISPL_CR_32885
	set cntl_lst {EnIRA EnIRB EnPR EnOR EnSRA EnSRB}
	set para_lst {a b p o sa sb}
#	set cntl_lst {EnIRA EnIRB EnPR EnOR EnSRA EnSRB EnSPRA EnSPRB}
#	set para_lst {a b p o sa0 sb0 sa1 sb1}

	foreach cntl $cntl_lst p $para_lst {
		if {$Para($cntl) == 1}  {
			lappend str -reg$p
			lappend str -reg${p}clk $Para(${cntl}Clk)
			if {$Para(${cntl}CE) != "NONE"}  {
				lappend str -reg${p}ce $Para(${cntl}CE)
			} 
			if {$Para(${cntl}RST) != "NONE"}  {
				lappend str -reg${p}rst $Para(${cntl}RST)
			}
		}
	}

	return $str
}

	# === ECP Cmd-Line ===
proc ECPCmdLine {} {
	global Para

	set str "-arch $Para(arch) -type dspmult"

	lappend str -widtha $Para(widtha) -widthb $Para(widthb) -widthp $Para(widthp)

	lappend str -gsr $Para(gsr)
	lappend str -[string tolower $Para(area_speed)]

	switch $Para(InputA) {
	    "Shift"    {lappend str -shiftina}
	}
	switch $Para(InputB) {
	    "Shift"    {lappend str -shiftinb}
	}
	switch $Para(Signed) {
	    "Signed"   {lappend str -signed}
	    "Unsigned" {lappend str -unsigned}
	    "Dynamic"  {lappend str -signedab}
	}

	if {$Para(shiftouta)==1} {lappend str -shiftouta}
	if {$Para(shiftoutb)==1} {lappend str -shiftoutb}

	set cntl_lst {EnIRA EnIRB EnPR EnOR}
	set para_lst {a b p o}

	foreach cntl $cntl_lst p $para_lst {
		if {$Para($cntl) == 1}  {
			lappend str -reg$p
			lappend str -reg${p}clk $Para(${cntl}Clk)
			if {$Para(${cntl}CE) != "NONE"}  {
				lappend str -reg${p}ce $Para(${cntl}CE)
			} 
			if {$Para(${cntl}RST) != "NONE"}  {
				lappend str -reg${p}rst $Para(${cntl}RST)
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

	set Para(ecp2_lst) {ep5a00 ep5m00 mg5a00 ep5a00s ep5m00s ep5c00 xo3c00h}	
	if {[lsearch $Para(ecp2_lst) $Para(arch)] != -1} {
		set str [ECP2CmdLine ]
	} else {
		set str [ECPCmdLine]
	} 

	set opt_lst {CLK0 CLK1 CLK2 CLK3 CE0 CE1 CE2 CE3 RST0 RST1 RST2 RST3}
	set tmp [split $str " "]
	foreach opt $opt_lst {
		if {[lsearch $tmp $opt] != -1}  {
			lappend str -[string tolower $opt]
		} 
	}

	return $str
}

proc ChangeCKCmd {}  {
	global Para

	if {$Para(arch) == "ep5g00p"}  {
		set cntl_lst {EnIRA EnIRB EnPR EnOR}
	}
	if {[lsearch $Para(ecp2_lst) $Para(arch)] != -1} {
		set cntl_lst {EnIRA EnIRB EnPR EnOR EnSRA EnSRB EnSPRA EnSPRB}
	}

	foreach p $cntl_lst {
		if {$Para($p) == 0}  {
			.cb${p}Clk config -state disabled
			.cb${p}CE  config -state disabled
			.cb${p}RST config -state disabled
			set Para(${p}Clk) CLK0
			set Para(${p}CE)  CE0
			set Para(${p}RST) RST0
		} else  {
			.cb${p}Clk config -state normal
			.cb${p}CE  config -state normal
			.cb${p}RST config -state normal
		} 
		if {$Para(EnCE) == 0}  {
			.cb${p}CE clear list
			.cb${p}CE insert list end NONE CE0 CE1 CE2 CE3
			set Para(${p}CE)  NONE
		} else  {
			.cb${p}CE clear list
			.cb${p}CE insert list end CE0 CE1 CE2 CE3
			if {$Para(${p}CE)=="NONE"} {set Para(${p}CE)  CE0}
		} 
		if {$Para(EnRST) == 0}  {
			.cb${p}RST clear list
			.cb${p}RST insert list end NONE RST0 RST1 RST2 RST3
			set Para(${p}RST) NONE
		} else  {
			.cb${p}RST clear list
			.cb${p}RST insert list end RST0 RST1 RST2 RST3
			if {$Para(${p}RST)=="NONE"} {set Para(${p}RST) RST0}
		} 
	} 
}

	# === For ECP2 ===
proc ChangeECP2Cmd {} {
	global Para
	#set Para(widthp) [expr $Para(widtha)+$Para(widthb)]

	#ISPL_CR_29712
	if {$Para(InputA) == "Parallel" && $Para(InputB) == "Parallel"}  {
		.ckEnInReg config -state normal
	} else  {
		set Para(EnInReg) 1
		.ckEnInReg config -state disabled
	} 

	if {$Para(EnInReg)==0} {
		set Para(EnIRA) 0
		set Para(EnIRB) 0
		set Para(EnSRA) 0
		set Para(EnSRB) 0

		.ckEnIRA config -state disabled
		.ckEnIRB config -state disabled
		.ckEnSRA config -state disabled
		.ckEnSRB config -state disabled
	} else  {
		set Para(EnIRA) 1
		set Para(EnIRB) 1

		.ckEnIRA config -state normal
		.ckEnIRB config -state normal

		#ISPL_CR_29271
		if {$Para(SignedA) == "Dynamic"}  {
			set Para(EnSRA) 1
			.ckEnSRA config -state normal
		} else  {
			set Para(EnSRA) 0
			.ckEnSRA config -state disabled
		}

		if {$Para(SignedB) == "Dynamic"}  {
			set Para(EnSRB) 1
			.ckEnSRB config -state normal
		} else  {
			set Para(EnSRB) 0
			.ckEnSRB config -state disabled
		} 
	} 
	if {$Para(EnPipeReg)==0} {
		set Para(EnPR) 0
		set Para(EnSPRA) 0
		set Para(EnSPRB) 0

		.ckEnPR config -state disabled
		.ckEnSPRA config -state disabled
		.ckEnSPRB config -state disabled
	} else  {
		set Para(EnPR) 1
		set Para(EnSPRA) 1
		set Para(EnSPRB) 1

		.ckEnPR config -state normal
		.ckEnSPRA config -state normal
		.ckEnSPRB config -state normal
	} 
	if {$Para(EnOutReg)==0} {
		set Para(EnOR) 0
		.ckEnOR config -state disabled
	} else  {
		set Para(EnOR) 1
		.ckEnOR config -state normal
	} 
	ChangeCKCmd
}

	# === For ECP ===
proc ChangeECPCmd {} {
	global Para
	#set Para(widthp) [expr $Para(widtha)+$Para(widthb)]

	if {$Para(InputA) == "Shift" || $Para(InputB) == "Shift"}  {
		set Para(EnInReg) 1
		.ckEnInReg config -state disabled
	} else  {
		.ckEnInReg config -state normal
	} 

	if {$Para(EnInReg)==0} {
		set Para(EnIRA) 0
		set Para(EnIRB) 0
		.ckEnIRA config -state disabled
		.ckEnIRB config -state disabled
	} else  {
		set Para(EnIRA) 1
		set Para(EnIRB) 1
		.ckEnIRA config -state normal
		.ckEnIRB config -state normal
		if {$Para(InputA) == "Shift"} {
			.ckEnIRA config -state disabled
		}
		if {$Para(InputB) == "Shift"} {
			.ckEnIRB config -state disabled
		}
	} 

	if {$Para(EnPipeReg)==0} {
		set Para(EnPR) 0
		.ckEnPR config -state disabled
	} else  {
		set Para(EnPR) 1
		.ckEnPR config -state normal
	} 

	if {$Para(EnOutReg)==0} {
		set Para(EnOR) 0
		.ckEnOR config -state disabled
	} else  {
		set Para(EnOR) 1
		.ckEnOR config -state normal
	} 
	ChangeCKCmd
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

	if {[lsearch $Para(ecp2_lst) $Para(arch)] != -1} {
		ChangeECP2Cmd
	} else {
		ChangeECPCmd
	} 

	CallDrawPins
}

proc LoadParaCBSetting {} {
	global Para
	set Para(ecp2_lst) {ep5a00 ep5m00 mg5a00 ep5a00s ep5m00s ep5c00 xo3c00h}	

	if {[lsearch $Para(ecp2_lst) $Para(arch)] != -1} {
		set para_lst {EnIRA EnIRB EnSRA EnSRB EnSPRA EnSPRB EnPR EnOR} 
	} else {
		set para_lst {EnIRA EnIRB EnPR EnOR}
	}
	foreach p $para_lst {
		if {$Para($p) == 1} {
			set st normal
		} else {
			set st disabled
		}
		.cb${p}Clk config -state $st
		.cb${p}CE  config -state $st
		.cb${p}RST config -state $st
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
	set Para(ecp2_lst) {ep5a00 ep5m00 mg5a00 ep5a00s ep5m00s ep5c00 xo3c00h}	
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
		windows {AttributeSetting 520 400}
		unix    {AttributeSetting 510 420}
	}
	set pin_flag 1
	DrawImage 260 450
	set tnb $Para(tnb)

	set Para(ecp2_lst) {ep5a00 ep5m00 mg5a00 ep5a00s ep5m00s ep5c00 xo3c00h}	
	#*** Here for user to add extra pages ***

	set page1 [$tnb add -label "Basic"]
	frame .basicframe

	#Size of the DSPMAC block
	iwidgets::labeledframe .basicsize -labeltext "Size of the DSPMULT block" -labelpos nw
	set basicsize [.basicsize childsite]
	CreateEntry $basicsize widtha "Multiplicand A bit size" 18 5 left Para(widtha) integer
	.entrywidtha config -fixed 2
	CreateEntry $basicsize widthb "Multiplier B bit size"   18 5 left Para(widthb) integer
	.entrywidthb config -fixed 2
	CreateEntry $basicsize widthp "Product bit size"   18 8 left Para(widthp) integer
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

	# Select Block Options
	iwidgets::labeledframe .basicblkoption -labeltext "Select Block Options" -labelpos nw
	set basicblkoption [.basicblkoption childsite]
	CreateRadioItem $basicblkoption cbgsr "GSR" 13 Enabled ENABLED Disabled DISABLED 10 left Para(gsr) {ChangeValueCmd}
	CreateRadioItem $basicblkoption cbareaspeed "Area/Speed" 13 \
		Area Area Speed Speed 10 left Para(area_speed) {ChangeValueCmd}
	.lblcbgsr       config -anchor w
	.lblcbareaspeed config -anchor w
	#ISPL_CR_34624 
	pack forget .frmcbgsr

	pack .basicsize .basicblkoption -in .basicframe -side left -padx 1 -fill y

	# Data Format
	iwidgets::labeledframe .basicoption -labeltext "Data Format" -labelpos nw -ipady 4
	set basicoption [.basicoption childsite]
	frame .frmLeft
	CreateLabelCombobox .frmLeft InputA "Input A" 12 10 Para(InputA) {Parallel Shift Dynamic} {ChangeValueCmd}
	CreateLabelCombobox .frmLeft InputB "Input B" 12 10 Para(InputB) {Parallel Shift Dynamic} {ChangeValueCmd}
	.lblInputA   config -anchor w
	.lblInputB   config -anchor w
	if {[lsearch $Para(ecp2_lst) $Para(arch)] != -1} {
		CreateLabelCombobox .frmLeft SignedA "Signed/Unsigned A" 18 10 Para(SignedA) {Signed Unsigned Dynamic} {ChangeValueCmd}
		CreateLabelCombobox .frmLeft SignedB "Signed/Unsigned B" 18 10 Para(SignedB) {Signed Unsigned Dynamic} {ChangeValueCmd}
		.lblSignedA  config -anchor w
		.lblSignedB  config -anchor w
	}
	if {$Para(arch) == "ep5g00p"}  {
#		CreateLabelCombobox .frmLeft Input "Input" 16 10 Para(Input) {Parallel Shift} {ChangeValueCmd}
#		.lblInput   config -anchor w
		.cboInputA clear list
		.cboInputA insert list end Parallel Shift
		.cboInputB clear list
		.cboInputB insert list end Parallel Shift
		CreateLabelCombobox .frmLeft Signed "Signed/Unsigned" 18 10 Para(Signed) {Signed Unsigned} {ChangeValueCmd}
		.lblSigned   config -anchor w
	}

	frame .frmRight
	checkbutton .ckshiftouta  -text "Select Shift Out A" -variable Para(shiftouta) -command ChangeValueCmd 
	checkbutton .ckshiftoutb  -text "Select Shift Out B" -variable Para(shiftoutb) -command ChangeValueCmd
	pack .ckshiftouta .ckshiftoutb -in .frmRight -side top -anchor w

	pack .frmLeft .frmRight -in $basicoption -side left -fill both -expand true 

	# Select Pipelining
	iwidgets::labeledframe .basicpipe -labeltext "Select Pipelining" -labelpos nw -ipady 3
	set basicpipe [.basicpipe childsite]
	frame .frmPipeLeft
	checkbutton .ckEnInReg   -text "Enable Input Registers"    -variable Para(EnInReg) -command {ChangeValueCmd}
	checkbutton .ckEnPipeReg -text "Enable Pipeline Registers" -variable Para(EnPipeReg)  -command {ChangeValueCmd}
	checkbutton .ckEnOutReg  -text "Enable Output Register"    -variable Para(EnOutReg)   -command {ChangeValueCmd}
	pack .ckEnInReg .ckEnPipeReg .ckEnOutReg -in .frmPipeLeft -side top -anchor w
	frame .frmPipeRight
	checkbutton .ckRST  -text "RST on all registers" -variable Para(EnRST) -command {ChangeValueCmd}
	checkbutton .ckCE   -text "CE on all registers"  -variable Para(EnCE)  -command {ChangeValueCmd}
	pack .ckRST .ckCE -in .frmPipeRight -side top -anchor w
	pack .frmPipeLeft .frmPipeRight -in $basicpipe -side left -fill both -expand true -padx 8

	pack .basicframe  -in $page1  -anchor w -fill x
	pack .basicoption -in $page1  -anchor w -fill x
	pack .basicpipe   -in $page1  -anchor w -fill x

	set page2 [$tnb add -label "Advanced"]

	iwidgets::labeledframe .advanceoption -labeltext "Select Pipelining" -labelpos nw 
	set advanceoption [.advanceoption childsite]

	label .lblClock   -text "Clock"
	label .lblClockEn -text "CE"
	label .lblReset   -text "Reset"

	# Enable Input Register A
	checkbutton .ckEnIRA -text "Enable Input Register A" -variable Para(EnIRA) -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnIRAClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRAClk) 
	.cbEnIRAClk insert list end "CLK0" "CLK1" "CLK2" "CLK3" 
	iwidgets::combobox .cbEnIRACE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRACE) 
	.cbEnIRACE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnIRARST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRARST) 
	.cbEnIRARST insert list end "RST0" "RST1" "RST2" "RST3"
	# Enable Input Register B
	checkbutton .ckEnIRB  -text "Enable Input Register B" -variable Para(EnIRB)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnIRBClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBClk) 
	.cbEnIRBClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnIRBCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBCE) 
	.cbEnIRBCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnIRBRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBRST) 
	.cbEnIRBRST insert list end "RST0" "RST1" "RST2" "RST3"
	# Enable Signed Register A
	checkbutton .ckEnSRA  -text "Enable Signed Register A" -variable Para(EnSRA)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnSRAClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRAClk) 
	.cbEnSRAClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnSRACE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRACE) 
	.cbEnSRACE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnSRARST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRARST) 
	.cbEnSRARST insert list end "RST0" "RST1" "RST2" "RST3"
	# Enable Signed Register B
	checkbutton .ckEnSRB  -text "Enable Signed Register B" -variable Para(EnSRB)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnSRBClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRBClk) 
	.cbEnSRBClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnSRBCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRBCE) 
	.cbEnSRBCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnSRBRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRBRST) 
	.cbEnSRBRST insert list end "RST0" "RST1" "RST2" "RST3"
	# Enable Signed Pipeline Register A
	checkbutton .ckEnSPRA  -text "Enable Signed Pipeline Register A" -variable Para(EnSPRA)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnSPRAClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRAClk) 
	.cbEnSPRAClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnSPRACE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRACE) 
	.cbEnSPRACE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnSPRARST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRARST) 
	.cbEnSPRARST insert list end "RST0" "RST1" "RST2" "RST3"
	# Enable Signed Pipeline Register B
	checkbutton .ckEnSPRB  -text "Enable Signed Pipeline Register B" -variable Para(EnSPRB)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnSPRBClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRBClk) 
	.cbEnSPRBClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnSPRBCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRBCE) 
	.cbEnSPRBCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnSPRBRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRBRST) 
	.cbEnSPRBRST insert list end "RST0" "RST1" "RST2" "RST3"
	# Enable Pipeline Register
	checkbutton .ckEnPR  -text "Enable Pipeline Register" -variable Para(EnPR)   -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnPRClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRClk) 
	.cbEnPRClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnPRCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRCE) 
	.cbEnPRCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnPRRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRRST) 
	.cbEnPRRST insert list end "RST0" "RST1" "RST2" "RST3"
	# Enable Output Register
	checkbutton .ckEnOR  -text "Enable Output Register" -variable Para(EnOR)  -command {ChangeCKCmd;CallDrawPins} 
	iwidgets::combobox .cbEnORClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORClk) 
	.cbEnORClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnORCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORCE) 
	.cbEnORCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnORRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORRST) 
	.cbEnORRST insert list end "RST0" "RST1" "RST2" "RST3"

	if {$Para(arch) == "ep5g00p"}  {
		grid  x .lblClock .lblClockEn .lblReset  -in $advanceoption -sticky w -padx 2
		grid .ckEnIRA .cbEnIRAClk .cbEnIRACE .cbEnIRARST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRB .cbEnIRBClk .cbEnIRBCE .cbEnIRBRST -in $advanceoption -sticky w -padx 2
		grid .ckEnPR .cbEnPRClk .cbEnPRCE .cbEnPRRST -in $advanceoption -sticky w -padx 2
		grid .ckEnOR .cbEnORClk .cbEnORCE .cbEnORRST -in $advanceoption -sticky w -padx 2
		pack .advanceoption -in $page2 -padx 1 -fill x
	}

	if {[lsearch $Para(ecp2_lst) $Para(arch)] != -1} {
		grid  x .lblClock .lblClockEn .lblReset  -in $advanceoption -sticky w -padx 2
		grid .ckEnIRA .cbEnIRAClk .cbEnIRACE .cbEnIRARST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRB .cbEnIRBClk .cbEnIRBCE .cbEnIRBRST -in $advanceoption -sticky w -padx 2
		grid .ckEnSRA .cbEnSRAClk .cbEnSRACE .cbEnSRARST -in $advanceoption -sticky w -padx 2
		grid .ckEnSRB .cbEnSRBClk .cbEnSRBCE .cbEnSRBRST -in $advanceoption -sticky w -padx 2
		grid .ckEnSPRA .cbEnSPRAClk .cbEnSPRACE .cbEnSPRARST -in $advanceoption -sticky w -padx 2
		grid .ckEnSPRB .cbEnSPRBClk .cbEnSPRBCE .cbEnSPRBRST -in $advanceoption -sticky w -padx 2
		grid .ckEnPR .cbEnPRClk .cbEnPRCE .cbEnPRRST -in $advanceoption -sticky w -padx 2
		grid .ckEnOR .cbEnORClk .cbEnORCE .cbEnORRST -in $advanceoption -sticky w -padx 2
		pack .advanceoption -in $page2 -padx 1 -fill x
	}

	$tnb view 0

	.cboOrder clear
	.cboOrder insert list end "Big Endian \[MSB:LSB\]" "Little Endian \[LSB:MSB\]"

	ChangeValueCmd

	GeneralConfig

	#ISPL_CR_43372 
	if {$Para(new) != 1}  {
		LoadParameter $Para(CoreName) $Para(ParaFile)
		LoadParaCBSetting
	}
}
