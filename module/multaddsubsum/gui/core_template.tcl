#$Header: L:/module/multaddsubsum/gui/rcs/core_template.tcl 1.21 2008/12/16 01:16:35Z mghuang Exp $

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

	set str "-arch $Para(arch) -type dspmaddsum"

	lappend str -widtha $Para(widtha) -widthb $Para(widthb) -widthsum $Para(widthp)

	lappend str -gsr $Para(gsr)
	lappend str -[string tolower $Para(area_speed)]
	if {$Para(AccuImp) == "Logic"}  {
		lappend str -pfu_add
	} else {
		if {$Para(SumImp) == "Logic"} {lappend str -pfu_sum}
	} 
	switch $Para(addsub1) {
	    "Add" {lappend str -madd0}
	    "Sub" {lappend str -msub0}
	    "Dynamic" {lappend str -maddsub0}
	}
	switch $Para(addsub3) {
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
	
	if {$Para(SpecialSign) == 1} {lappend str -pfu_sum}

	set cntl_lst {EnIRA0 EnIRA1 EnIRA2 EnIRA3 EnIRB0 EnIRB1 EnIRB2 EnIRB3 EnSRA EnSRB EnSPRA EnSPRB \
		EnAIR1 EnAPR1 EnAIR3 EnAPR3 EnMPR0 EnMPR1 EnMPR2 EnMPR3 EnOR}
	set para_lst {a0 a1 a2 a3 b0 b1 b2 b3 sa0 sb0 sa1 sb1 as1_0 as1_1 as3_0 as3_1 p0 p1 p2 p3 o}

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
	#ISPL_CR_41682
	#lappend str -load

	return $str
}

	# === ECP Cmd-Line ===
proc ECPCmdLine {} {
	global Para

	set str "-arch $Para(arch) -type dspmaddsum"

	lappend str -widtha $Para(widtha) -widthb $Para(widthb) -widthsum $Para(widthp)

	lappend str -gsr $Para(gsr)
	lappend str -[string tolower $Para(area_speed)]
	switch $Para(addsub1) {
	    "Add" {lappend str -madd0}
	    "Sub" {lappend str -msub0}
	    "Dynamic" {lappend str -maddsub0}
	}
	switch $Para(addsub3) {
	    "Add" {lappend str -madd1}
	    "Sub" {lappend str -msub1}
	    "Dynamic" {lappend str -maddsub1}
	}

	switch $Para(InputA0) {
	    "Shift"    {lappend str -shiftina0}
	}
	switch $Para(InputA1) {
	    "Shift"    {lappend str -shiftina1}
	}
	switch $Para(InputA2) {
	    "Shift"    {lappend str -shiftina2}
	}
	switch $Para(InputA3) {
	    "Shift"    {lappend str -shiftina3}
	}
	switch $Para(InputB0) {
	    "Shift"    {lappend str -shiftinb0}
	}
	switch $Para(InputB1) {
	    "Shift"    {lappend str -shiftinb1}
	}
	switch $Para(InputB2) {
	    "Shift"    {lappend str -shiftinb2}
	}
	switch $Para(InputB3) {
	    "Shift"    {lappend str -shiftinb3}
	}
	switch $Para(Signed) {
	    "Signed"   {lappend str -signed}
	    "Unsigned" {lappend str -unsigned}
	    "Dynamic"  {lappend str -signedab}
	}

	if {$Para(shiftouta)==1} {lappend str -shiftouta}
	if {$Para(shiftoutb)==1} {lappend str -shiftoutb}

	set cntl_lst {EnIRA0 EnIRA1 EnIRA2 EnIRA3 EnIRB0 EnIRB1 EnIRB2 EnIRB3 \
		EnAIR1 EnAPR1 EnAIR3 EnAPR3 EnPR0 EnPR1 EnPR2 EnPR3 EnOR}
	set para_lst {a0 a1 a2 a3 b0 b1 b2 b3 as1_0 as1_1 as3_0 as3_1 p0 p1 p2 p3 o}

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
	#ISPL_CR_41682
	#lappend str -load

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
		set cntl_lst {EnIRA0 EnIRA1 EnIRA2 EnIRA3 EnIRB0 EnIRB1 EnIRB2 EnIRB3 \
			EnAIR1 EnAPR1 EnAIR3 EnAPR3 EnPR0 EnPR1 EnPR2 EnPR3 EnOR}
	}
	if {[lsearch $Para(ecp2_lst) $Para(arch)] != -1} {
		set cntl_lst {EnIRA0 EnIRA1 EnIRA2 EnIRA3 EnIRB0 EnIRB1 EnIRB2 EnIRB3 EnSRA EnSRB EnSPRA EnSPRB \
			EnAIR1 EnAPR1 EnAIR3 EnAPR3 EnMPR0 EnMPR1 EnMPR2 EnMPR3 EnOR}
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

	if {$Para(AccuImp) == "Logic"} {
		.lblSumImp config -state disable
		.rdo1SumImp config -state disabled
		.rdo2SumImp config -state disabled
	} else {
		.lblSumImp config -state normal
		.rdo1SumImp config -state normal
		.rdo2SumImp config -state normal
	}

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

	if {$Para(EnInReg)==0} {
		set Para(EnIRA0) 0
		set Para(EnIRA1) 0
		set Para(EnIRA2) 0
		set Para(EnIRA3) 0
		set Para(EnIRB0) 0
		set Para(EnIRB1) 0
		set Para(EnIRB2) 0
		set Para(EnIRB3) 0
		set Para(EnAIR1) 0
		set Para(EnAIR3) 0

		.ckEnIRA0 config -state disabled
		.ckEnIRB0 config -state disabled
		.ckEnIRA1 config -state disabled
		.ckEnIRB1 config -state disabled
		.ckEnIRA2 config -state disabled
		.ckEnIRB2 config -state disabled
		.ckEnIRA3 config -state disabled
		.ckEnIRB3 config -state disabled
		.ckEnAIR1 config -state disabled
		.ckEnAIR3 config -state disabled
	} else  {
		set Para(EnIRA0) 1
		set Para(EnIRA1) 1
		set Para(EnIRA2) 1
		set Para(EnIRA3) 1
		set Para(EnIRB0) 1
		set Para(EnIRB1) 1
		set Para(EnIRB2) 1
		set Para(EnIRB3) 1
		set Para(EnAIR1) 1
		set Para(EnAIR3) 1

		.ckEnIRA0 config -state normal
		.ckEnIRB0 config -state normal
		.ckEnIRA1 config -state normal
		.ckEnIRB1 config -state normal
		.ckEnIRA2 config -state normal
		.ckEnIRB2 config -state normal
		.ckEnIRA3 config -state normal
		.ckEnIRB3 config -state normal
		.ckEnAIR1 config -state normal
		.ckEnAIR3 config -state normal

		if {$Para(addsub1) == "Dynamic"}  {
			set Para(EnAIR1) 1
			.ckEnAIR1 config -state normal
		} else  {
			set Para(EnAIR1) 0
			.ckEnAIR1 config -state disabled
		} 
		if {$Para(addsub3) == "Dynamic"}  {
			set Para(EnAIR3) 1
			.ckEnAIR3 config -state normal
		} else  {
			set Para(EnAIR3) 0
			.ckEnAIR3 config -state disabled
		} 
	} 
	if {$Para(EnPipeReg)==0} {
		set Para(EnMPR0) 0
		set Para(EnMPR1) 0
		set Para(EnMPR2) 0
		set Para(EnMPR3) 0
		set Para(EnAPR1) 0
		set Para(EnAPR3) 0
		set Para(EnSPRA) 0
		set Para(EnSPRB) 0

		.ckEnMPR0 config -state disabled
		.ckEnMPR1 config -state disabled
		.ckEnMPR2 config -state disabled
		.ckEnMPR3 config -state disabled
		.ckEnAPR1 config -state disabled
		.ckEnAPR3 config -state disabled
		.ckEnSPRA config -state disabled
		.ckEnSPRB config -state disabled
	} else  {
		set Para(EnMPR0) 1
		set Para(EnMPR1) 1
		set Para(EnMPR2) 1
		set Para(EnMPR3) 1
		set Para(EnAPR1) 1
		set Para(EnAPR3) 1
		set Para(EnSPRA) 1
		set Para(EnSPRB) 1

		.ckEnMPR0 config -state normal
		.ckEnMPR1 config -state normal
		.ckEnMPR2 config -state normal
		.ckEnMPR3 config -state normal
		.ckEnAPR1 config -state normal
		.ckEnAPR3 config -state normal
		.ckEnSPRA config -state normal
		.ckEnSPRB config -state normal

		if {$Para(addsub1)=="Dynamic"} {
			set Para(EnAPR1) 1
			.ckEnAPR1 config -state normal
		} else  {
			set Para(EnAPR1) 0
			.ckEnAPR1 config -state disabled
		} 
		if {$Para(addsub3)=="Dynamic"} {
			set Para(EnAPR3) 1
			.ckEnAPR3 config -state normal
		} else  {
			set Para(EnAPR3) 0
			.ckEnAPR3 config -state disabled
		} 
	} 

	if {$Para(EnOutReg)==0} {
		set Para(EnOR) 0
		.ckEnOR config -state disabled
	} else  {
		set Para(EnOR) 1
		.ckEnOR config -state normal
	} 
	
	if {$Para(SignedA) == "Unsigned" && $Para(SignedB) =="Unsigned" && \
		($Para(addsub1) == "Sub" || $Para(addsub1) == "Dynamic" || \
		$Para(addsub3) == "Sub" || $Para(addsub3) == "Dynamic")} {
		.ckSpecialSign config -state normal
	} else {
		.ckSpecialSign config -state disabled
		set Para(SpecialSign) 0
	}

	ChangeCKCmd
}

	# === For ECP ===
proc ChangeECPCmd {} {
	global Para

	set in_lst {EnIRA0 EnIRA1 EnIRA2 EnIRA3 EnIRB0 EnIRB1 EnIRB2 EnIRB3 EnAIR1 EnAIR3}
	set shift_lst {A0 A1 A2 A3 B0 B1 B2 B3}
	if {$Para(EnInReg)==0} {
		foreach in $in_lst  {
			set Para($in) 0
			.ck$in config -state disabled
		} 
	} else  {
		foreach in $in_lst  {
			set Para($in) 1
			.ck$in config -state normal
		} 
		foreach s $shift_lst  {
			if {$Para(Input$s) == "Shift"}  {
				set Para(EnIR$s) 1
				.ckEnIR$s config -state disabled
			} 
		} 

		if {$Para(addsub1) == "Dynamic"}  {
			set Para(EnAIR1) 1
			.ckEnAIR1 config -state normal
		} else  {
			set Para(EnAIR1) 0
			.ckEnAIR1 config -state disabled
		} 
		if {$Para(addsub3) == "Dynamic"}  {
			set Para(EnAIR3) 1
			.ckEnAIR3 config -state normal
		} else  {
			set Para(EnAIR3) 0
			.ckEnAIR3 config -state disabled
		} 
	} 

	set pipe_lst {EnPR0 EnPR1 EnPR2 EnPR3 EnAPR1 EnAPR3}
	if {$Para(EnPipeReg)==0} {
		foreach pipe $pipe_lst  {
			set Para($pipe) 0
			.ck$pipe config -state disabled
		} 
	} else  {
		foreach pipe $pipe_lst  {
			set Para($pipe) 1
			.ck$pipe config -state normal
		} 

		if {$Para(addsub1)=="Dynamic"} {
			set Para(EnAPR1) 1
			.ckEnAPR1 config -state normal
		} else  {
			set Para(EnAPR1) 0
			.ckEnAPR1 config -state disabled
		} 
		if {$Para(addsub3)=="Dynamic"} {
			set Para(EnAPR3) 1
			.ckEnAPR3 config -state normal
		} else  {
			set Para(EnAPR3) 0
			.ckEnAPR3 config -state disabled
		} 
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

	#ISPL_CR_29712
	if {$Para(InputA0) == "Parallel" && $Para(InputB0) == "Parallel" &&
		$Para(InputA1) == "Parallel" && $Para(InputB1) == "Parallel" &&
		$Para(InputA2) == "Parallel" && $Para(InputB2) == "Parallel" &&
		$Para(InputA3) == "Parallel" && $Para(InputB3) == "Parallel"}  {
		.ckEnInReg config -state normal
	} else  {
		set Para(EnInReg) 1
		.ckEnInReg config -state disabled
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
		set para_lst {EnIRA0 EnIRA1 EnIRA2 EnIRA3 EnIRB0 EnIRB1 EnIRB2 EnIRB3 EnSRA EnSRB \
			EnAIR1 EnAPR1 EnAIR3 EnAPR3 EnMPR0 EnMPR1 EnMPR2 EnMPR3 EnOR}
	} else {
		set para_lst {EnIRA0 EnIRA1 EnIRA2 EnIRA3 EnIRB0 EnIRB1 EnIRB2 EnIRB3 \
			EnPR0 EnPR1 EnPR2 EnPR3 EnAPR1 EnAPR3 EnOR}
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
	set Para(ecp2_lst) {ep5a00 ep5m00 mg5a00 ep5a00s ep5m00s ep5c00 xo3c00h}	

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface
	if {[lsearch $Para(ecp2_lst) $Para(arch)] != -1} {
		AttributeSetting 540 520
	} else  {
		AttributeSetting 540 560
	} 
	set pin_flag 1
	DrawImage 260 450
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***

	set page1 [$tnb add -label "Basic"]
	frame .basicframe

	#Size of the DSPMAC block
	iwidgets::labeledframe .basicsize -labeltext "Size of the DSPMADDSUM block" -labelpos nw
	set basicsize [.basicsize childsite]
	CreateEntry $basicsize widtha "Multiplicand \nA0/A1/A2/A3 bit size" 20 5 left Para(widtha) integer
	.entrywidtha config -fixed 2
	CreateEntry $basicsize widthb "Multiplier \nB0/B1/B2/B3 bit size"   20 5 left Para(widthb) integer
	.entrywidthb config -fixed 2
	CreateEntry $basicsize widthp "Sum output bit size"   20 8 left Para(widthp) integer
	.entrywidthp config -state disabled -foreground gray50
	pack .frmwidtha .frmwidthb .frmwidthp -in $basicsize -side top
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
	CreateRadioItem $basicblkoption AccuImp "Add/Sub\nImplementation" 13 \
		"DSP Block" "DSP Block" Logic Logic 10 left Para(AccuImp) {ChangeValueCmd}
	
	CreateRadioItem $basicblkoption SumImp "Sum \nImplementation" 13 \
		"DSP Block" "DSP Block" Logic Lobic 10 left Para(SumImp) {ChangeValueCmd}
	.lblSumImp config -anchor w
		
	CreateLabelCombobox $basicblkoption cbaddsub0 "Add/Sub 1 Operation" 20 8 Para(addsub1) \
		{Add Sub Dynamic} {ChangeValueCmd}
	CreateLabelCombobox $basicblkoption cbaddsub1 "Add/Sub 3 Operation" 20 8 Para(addsub3) \
		{Add Sub Dynamic} {ChangeValueCmd}
	.lblcbgsr       config -anchor w
	.lblcbareaspeed config -anchor w
	.lblAccuImp     config -anchor w
	.lblcbaddsub0    config -anchor w
	.lblcbaddsub1    config -anchor w
	#ISPL_CR_34624 
	pack forget .frmcbgsr

	pack .basicsize .basicblkoption -in .basicframe -side left -padx 1 -fill y

	# Data Format
	iwidgets::labeledframe .basicoption -labeltext "Data Format" -labelpos nw -ipady 4
	set basicoption [.basicoption childsite]
	frame .frmLeft
	frame .frmRight
	CreateLabelCombobox .frmLeft InputA0 "Input A0" 16 10 Para(InputA0) {} {ChangeValueCmd}
	CreateLabelCombobox .frmLeft InputA1 "Input A1" 16 10 Para(InputA1) {} {ChangeValueCmd}
	CreateLabelCombobox .frmLeft InputA2 "Input A2" 16 10 Para(InputA2) {} {ChangeValueCmd}
	CreateLabelCombobox .frmLeft InputA3 "Input A3" 16 10 Para(InputA3) {} {ChangeValueCmd}
	.lblInputA0   config -anchor w
	.lblInputA1   config -anchor w
	.lblInputA2   config -anchor w
	.lblInputA3   config -anchor w

	CreateLabelCombobox .frmRight InputB0 "Input B0" 16 10 Para(InputB0) {} {ChangeValueCmd}
	CreateLabelCombobox .frmRight InputB1 "Input B1" 16 10 Para(InputB1) {} {ChangeValueCmd}
	CreateLabelCombobox .frmRight InputB2 "Input B2" 16 10 Para(InputB2) {} {ChangeValueCmd}
	CreateLabelCombobox .frmRight InputB3 "Input B3" 16 10 Para(InputB3) {} {ChangeValueCmd}
	.lblInputB0   config -anchor w
	.lblInputB1   config -anchor w
	.lblInputB2   config -anchor w
	.lblInputB3   config -anchor w

	checkbutton .ckshiftouta  -text "Select Shift Out A" -variable Para(shiftouta) -command ChangeValueCmd 
	checkbutton .ckshiftoutb  -text "Select Shift Out B" -variable Para(shiftoutb) -command ChangeValueCmd
	pack .ckshiftouta -in .frmLeft -side top -anchor w -padx 5
	pack .ckshiftoutb -in .frmRight -side top -anchor w -padx 5

	if {[lsearch $Para(ecp2_lst) $Para(arch)] != -1} {
		.cboInputA0 insert list end Parallel Shift Dynamic
		.cboInputB0 insert list end Parallel Shift Dynamic
		.cboInputA1 insert list end Parallel Shift Dynamic
		.cboInputB1 insert list end Parallel Shift Dynamic
		.cboInputA2 insert list end Parallel Shift Dynamic
		.cboInputB2 insert list end Parallel Shift Dynamic
		.cboInputA3 insert list end Parallel Shift Dynamic
		.cboInputB3 insert list end Parallel Shift Dynamic
		CreateLabelCombobox .frmLeft SignedA "Signed/Unsigned A" 18 10 Para(SignedA) {Signed Unsigned Dynamic} {ChangeValueCmd}
		CreateLabelCombobox .frmRight SignedB "Signed/Unsigned B" 18 10 Para(SignedB) {Signed Unsigned Dynamic} {ChangeValueCmd}
		.lblSignedA  config -anchor w
		.lblSignedB  config -anchor w
		
		checkbutton .ckSpecialSign -text "Special sign extension for unsigned subtract" -variable Para(SpecialSign) -command ChangeValueCmd
		pack .ckSpecialSign -in .frmLeft -side top -anchor w -padx 5
	}
	if {$Para(arch) == "ep5g00p"}  {
		pack forget .frmAccuImp .frmSumImp
		.cboInputA0 insert list end Parallel Shift
		.cboInputB0 insert list end Parallel Shift
		.cboInputA1 insert list end Parallel Shift
		.cboInputB1 insert list end Parallel Shift
		.cboInputA2 insert list end Parallel Shift
		.cboInputB2 insert list end Parallel Shift
		.cboInputA3 insert list end Parallel Shift
		.cboInputB3 insert list end Parallel Shift

		CreateLabelCombobox .frmLeft Signed "Signed/Unsigned" 16 10 Para(Signed) {Signed Unsigned} {ChangeValueCmd}
		.lblSigned   config -anchor w
	}

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

	if {[lsearch $Para(ecp2_lst) $Para(arch)] != -1} {
		set page3 [$tnb add -label "Advanced Cont."]

		iwidgets::labeledframe .advanceoption1 -labeltext "Select Pipelining" -labelpos nw
		set advanceoption1 [.advanceoption1 childsite]

		label .lblClock1   -text "Clock"
		label .lblClockEn1 -text "CE"
		label .lblReset1   -text "Reset"
	}

	# Enable Input Register A0
	checkbutton .ckEnIRA0 -text "Enable Input Register A0" -variable Para(EnIRA0) -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnIRA0Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA0Clk) 
	.cbEnIRA0Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3" 
	iwidgets::combobox .cbEnIRA0CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA0CE) 
	.cbEnIRA0CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnIRA0RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA0RST) 
	.cbEnIRA0RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Input Register A1
	checkbutton .ckEnIRA1 -text "Enable Input Register A1" -variable Para(EnIRA1) -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnIRA1Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA1Clk) 
	.cbEnIRA1Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3" 
	iwidgets::combobox .cbEnIRA1CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA1CE) 
	.cbEnIRA1CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnIRA1RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA1RST) 
	.cbEnIRA1RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Input Register A2
	checkbutton .ckEnIRA2 -text "Enable Input Register A2" -variable Para(EnIRA2) -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnIRA2Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA2Clk) 
	.cbEnIRA2Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3" 
	iwidgets::combobox .cbEnIRA2CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA2CE) 
	.cbEnIRA2CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnIRA2RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA2RST) 
	.cbEnIRA2RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Input Register A3
	checkbutton .ckEnIRA3 -text "Enable Input Register A3" -variable Para(EnIRA3) -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnIRA3Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA3Clk) 
	.cbEnIRA3Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3" 
	iwidgets::combobox .cbEnIRA3CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA3CE) 
	.cbEnIRA3CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnIRA3RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRA3RST) 
	.cbEnIRA3RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Input Register B0
	checkbutton .ckEnIRB0  -text "Enable Input Register B0" -variable Para(EnIRB0)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnIRB0Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB0Clk) 
	.cbEnIRB0Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnIRB0CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB0CE) 
	.cbEnIRB0CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnIRB0RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB0RST) 
	.cbEnIRB0RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Input Register B1
	checkbutton .ckEnIRB1  -text "Enable Input Register B1" -variable Para(EnIRB1)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnIRB1Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB1Clk) 
	.cbEnIRB1Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnIRB1CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB1CE) 
	.cbEnIRB1CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnIRB1RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB1RST) 
	.cbEnIRB1RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Input Register B2
	checkbutton .ckEnIRB2  -text "Enable Input Register B2" -variable Para(EnIRB2)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnIRB2Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB2Clk) 
	.cbEnIRB2Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnIRB2CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB2CE) 
	.cbEnIRB2CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnIRB2RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB2RST) 
	.cbEnIRB2RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Input Register B3
	checkbutton .ckEnIRB3  -text "Enable Input Register B3" -variable Para(EnIRB3)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnIRB3Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB3Clk) 
	.cbEnIRB3Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnIRB3CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB3CE) 
	.cbEnIRB3CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnIRB3RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRB3RST) 
	.cbEnIRB3RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Signed Register A
	checkbutton .ckEnSRA  -text "Enable Signed Register A" -variable Para(EnSRA)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnSRAClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRAClk) 
	.cbEnSRAClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnSRACE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRACE) 
	.cbEnSRACE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnSRARST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRARST) 
	.cbEnSRARST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Signed Register B
	checkbutton .ckEnSRB  -text "Enable Signed Register B" -variable Para(EnSRB)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnSRBClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRBClk) 
	.cbEnSRBClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnSRBCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRBCE) 
	.cbEnSRBCE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnSRBRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSRBRST) 
	.cbEnSRBRST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Signed Pipeline Register A
	checkbutton .ckEnSPRA  -text "Enable Signed Pipeline Register A" -variable Para(EnSPRA)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnSPRAClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRAClk) 
	.cbEnSPRAClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnSPRACE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRACE) 
	.cbEnSPRACE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnSPRARST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRARST) 
	.cbEnSPRARST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Signed Pipeline Register B
	checkbutton .ckEnSPRB  -text "Enable Signed Pipeline Register B" -variable Para(EnSPRB)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnSPRBClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRBClk) 
	.cbEnSPRBClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnSPRBCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRBCE) 
	.cbEnSPRBCE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnSPRBRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnSPRBRST) 
	.cbEnSPRBRST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	#Enable Addsub1 Input Register
	checkbutton .ckEnAIR1  -text "Enable Addsub1 Input Register" -variable Para(EnAIR1)  -command {ChangeCKCmd;CallDrawPins} 
	iwidgets::combobox .cbEnAIR1Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAIR1Clk) 
	.cbEnAIR1Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnAIR1CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAIR1CE) 
	.cbEnAIR1CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnAIR1RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAIR1RST) 
	.cbEnAIR1RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Addsub1 Pipeline Register
	checkbutton .ckEnAPR1  -text "Enable Addsub1 Pipeline Register" -variable Para(EnAPR1)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnAPR1Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAPR1Clk) 
	.cbEnAPR1Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnAPR1CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAPR1CE) 
	.cbEnAPR1CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnAPR1RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAPR1RST) 
	.cbEnAPR1RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	#Enable Addsub3 Input Register
	checkbutton .ckEnAIR3  -text "Enable Addsub3 Input Register" -variable Para(EnAIR3)  -command {ChangeCKCmd;CallDrawPins} 
	iwidgets::combobox .cbEnAIR3Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAIR3Clk) 
	.cbEnAIR3Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnAIR3CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAIR3CE) 
	.cbEnAIR3CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnAIR3RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAIR3RST) 
	.cbEnAIR3RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Addsub3 Pipeline Register
	checkbutton .ckEnAPR3  -text "Enable Addsub3 Pipeline Register" -variable Para(EnAPR3)  -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnAPR3Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAPR3Clk) 
	.cbEnAPR3Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnAPR3CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAPR3CE) 
	.cbEnAPR3CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnAPR3RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAPR3RST) 
	.cbEnAPR3RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Multiplier Pipeline Register 0
	checkbutton .ckEnMPR0  -text "Enable Multiplier Pipeline Register 0" -variable Para(EnMPR0)   -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnMPR0Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR0Clk) 
	.cbEnMPR0Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnMPR0CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR0CE) 
	.cbEnMPR0CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnMPR0RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR0RST) 
	.cbEnMPR0RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Multiplier Pipeline Register 1
	checkbutton .ckEnMPR1  -text "Enable Multiplier Pipeline Register 1" -variable Para(EnMPR1)   -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnMPR1Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR1Clk) 
	.cbEnMPR1Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnMPR1CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR1CE) 
	.cbEnMPR1CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnMPR1RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR1RST) 
	.cbEnMPR1RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Multiplier Pipeline Register 2
	checkbutton .ckEnMPR2  -text "Enable Multiplier Pipeline Register 2" -variable Para(EnMPR2)   -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnMPR2Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR2Clk) 
	.cbEnMPR2Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnMPR2CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR2CE) 
	.cbEnMPR2CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnMPR2RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR2RST) 
	.cbEnMPR2RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Multiplier Pipeline Register 3
	checkbutton .ckEnMPR3  -text "Enable Multiplier Pipeline Register 3" -variable Para(EnMPR3)   -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnMPR3Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR3Clk) 
	.cbEnMPR3Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnMPR3CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR3CE) 
	.cbEnMPR3CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnMPR3RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnMPR3RST) 
	.cbEnMPR3RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"

	# Enable Pipeline Register 0 (for ECP)
	checkbutton .ckEnPR0  -text "Enable Pipeline Register 0" -variable Para(EnPR0)   -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnPR0Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR0Clk) 
	.cbEnPR0Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnPR0CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR0CE) 
	.cbEnPR0CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnPR0RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR0RST) 
	.cbEnPR0RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Pipeline Register 1 (for ECP)
	checkbutton .ckEnPR1  -text "Enable Pipeline Register 1" -variable Para(EnPR1)   -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnPR1Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR1Clk) 
	.cbEnPR1Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnPR1CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR1CE) 
	.cbEnPR1CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnPR1RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR1RST) 
	.cbEnPR1RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Pipeline Register 2 (for ECP)
	checkbutton .ckEnPR2  -text "Enable Pipeline Register 2" -variable Para(EnPR2)   -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnPR2Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR2Clk) 
	.cbEnPR2Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnPR2CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR2CE) 
	.cbEnPR2CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnPR2RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR2RST) 
	.cbEnPR2RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"
	# Enable Pipeline Register 3 (for ECP)
	checkbutton .ckEnPR3  -text "Enable Pipeline Register 3" -variable Para(EnPR3)   -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnPR3Clk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR3Clk) 
	.cbEnPR3Clk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnPR3CE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR3CE) 
	.cbEnPR3CE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnPR3RST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPR3RST) 
	.cbEnPR3RST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"

	# Enable Output Register
	checkbutton .ckEnOR  -text "Enable Output Register" -variable Para(EnOR)  -command {ChangeCKCmd;CallDrawPins} 
	#.ckEnOR config -state disabled
	iwidgets::combobox .cbEnORClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORClk) 
	.cbEnORClk insert list end "CLK0" "CLK1" "CLK2" "CLK3"
	iwidgets::combobox .cbEnORCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORCE) 
	.cbEnORCE insert list end "CE0" "CE1" "CE2" "CE3" "NONE"
	iwidgets::combobox .cbEnORRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORRST) 
	.cbEnORRST insert list end "RST0" "RST1" "RST2" "RST3" "NONE"

	if {$Para(arch) == "ep5g00p"}  {
		grid  x .lblClock .lblClockEn .lblReset  -in $advanceoption -sticky w -padx 2
		grid .ckEnIRA0 .cbEnIRA0Clk .cbEnIRA0CE .cbEnIRA0RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRA1 .cbEnIRA1Clk .cbEnIRA1CE .cbEnIRA1RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRA2 .cbEnIRA2Clk .cbEnIRA2CE .cbEnIRA2RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRA3 .cbEnIRA3Clk .cbEnIRA3CE .cbEnIRA3RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRB0 .cbEnIRB0Clk .cbEnIRB0CE .cbEnIRB0RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRB1 .cbEnIRB1Clk .cbEnIRB1CE .cbEnIRB1RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRB2 .cbEnIRB2Clk .cbEnIRB2CE .cbEnIRB2RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRB3 .cbEnIRB3Clk .cbEnIRB3CE .cbEnIRB3RST -in $advanceoption -sticky w -padx 2
		grid .ckEnAIR1 .cbEnAIR1Clk .cbEnAIR1CE .cbEnAIR1RST -in $advanceoption -sticky w -padx 2
		grid .ckEnAPR1 .cbEnAPR1Clk .cbEnAPR1CE .cbEnAPR1RST -in $advanceoption -sticky w -padx 2
		grid .ckEnAIR3 .cbEnAIR3Clk .cbEnAIR3CE .cbEnAIR3RST -in $advanceoption -sticky w -padx 2
		grid .ckEnAPR3 .cbEnAPR3Clk .cbEnAPR3CE .cbEnAPR3RST -in $advanceoption -sticky w -padx 2
		grid .ckEnPR0 .cbEnPR0Clk .cbEnPR0CE .cbEnPR0RST -in $advanceoption -sticky w -padx 2
		grid .ckEnPR1 .cbEnPR1Clk .cbEnPR1CE .cbEnPR1RST -in $advanceoption -sticky w -padx 2
		grid .ckEnPR2 .cbEnPR2Clk .cbEnPR2CE .cbEnPR2RST -in $advanceoption -sticky w -padx 2
		grid .ckEnPR3 .cbEnPR3Clk .cbEnPR3CE .cbEnPR3RST -in $advanceoption -sticky w -padx 2
		grid .ckEnOR .cbEnORClk .cbEnORCE .cbEnORRST -in $advanceoption -sticky w -padx 2
		pack .advanceoption -in $page2 -padx 1 -fill x
	}
	if {[lsearch $Para(ecp2_lst) $Para(arch)] != -1} {
		grid  x .lblClock .lblClockEn .lblReset  -in $advanceoption -sticky w -padx 2
		grid .ckEnIRA0 .cbEnIRA0Clk .cbEnIRA0CE .cbEnIRA0RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRA1 .cbEnIRA1Clk .cbEnIRA1CE .cbEnIRA1RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRA2 .cbEnIRA2Clk .cbEnIRA2CE .cbEnIRA2RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRA3 .cbEnIRA3Clk .cbEnIRA3CE .cbEnIRA3RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRB0 .cbEnIRB0Clk .cbEnIRB0CE .cbEnIRB0RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRB1 .cbEnIRB1Clk .cbEnIRB1CE .cbEnIRB1RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRB2 .cbEnIRB2Clk .cbEnIRB2CE .cbEnIRB2RST -in $advanceoption -sticky w -padx 2
		grid .ckEnIRB3 .cbEnIRB3Clk .cbEnIRB3CE .cbEnIRB3RST -in $advanceoption -sticky w -padx 2
		grid .ckEnSRA .cbEnSRAClk .cbEnSRACE .cbEnSRARST -in $advanceoption -sticky w -padx 2
		grid .ckEnSRB .cbEnSRBClk .cbEnSRBCE .cbEnSRBRST -in $advanceoption -sticky w -padx 2
		grid .ckEnSPRA .cbEnSPRAClk .cbEnSPRACE .cbEnSPRARST -in $advanceoption -sticky w -padx 2
		grid .ckEnSPRB .cbEnSPRBClk .cbEnSPRBCE .cbEnSPRBRST -in $advanceoption -sticky w -padx 2

		grid  x .lblClock1 .lblClockEn1 .lblReset1  -in $advanceoption1 -sticky w -padx 2
		grid .ckEnAIR1 .cbEnAIR1Clk .cbEnAIR1CE .cbEnAIR1RST -in $advanceoption1 -sticky w -padx 2
		grid .ckEnAPR1 .cbEnAPR1Clk .cbEnAPR1CE .cbEnAPR1RST -in $advanceoption1 -sticky w -padx 2
		grid .ckEnAIR3 .cbEnAIR3Clk .cbEnAIR3CE .cbEnAIR3RST -in $advanceoption1 -sticky w -padx 2
		grid .ckEnAPR3 .cbEnAPR3Clk .cbEnAPR3CE .cbEnAPR3RST -in $advanceoption1 -sticky w -padx 2
		grid .ckEnMPR0 .cbEnMPR0Clk .cbEnMPR0CE .cbEnMPR0RST -in $advanceoption1 -sticky w -padx 2
		grid .ckEnMPR1 .cbEnMPR1Clk .cbEnMPR1CE .cbEnMPR1RST -in $advanceoption1 -sticky w -padx 2
		grid .ckEnMPR2 .cbEnMPR2Clk .cbEnMPR2CE .cbEnMPR2RST -in $advanceoption1 -sticky w -padx 2
		grid .ckEnMPR3 .cbEnMPR3Clk .cbEnMPR3CE .cbEnMPR3RST -in $advanceoption1 -sticky w -padx 2
		grid .ckEnOR .cbEnORClk .cbEnORCE .cbEnORRST -in $advanceoption1 -sticky w -padx 2
		pack .advanceoption -in $page2 -padx 1 -fill both
		pack .advanceoption1 -in $page3 -padx 1 -fill both
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
