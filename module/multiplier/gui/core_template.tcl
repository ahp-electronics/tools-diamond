#$Header: L:/module/multiplier/gui/rcs/core_template.tcl 1.4 2005/12/21 01:35:36Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para pin_flag
	if {[lsearch $Para(fpga_lst) $Para(arch)] != -1}  {
		if {[string length $Para(InputWidth1)] > 0 &&
			[string length $Para(CoValue)] > 0 &&
			[string length $Para(StageNum)] > 0 &&
			[string length $Para(InputWidth2)] > 0 } {DrawPins}
	} else  {
		if {[string length $Para(InputWidth1)] > 0 &&
			[string length $Para(InputWidth2)] > 0 } {DrawPins}
	} 
} 

proc CallUpdateNumRange {} {
	global Para

	set MaxWdth [GetMaxWdth]
	set MaxNum $Para(InputWidth1)
	if { [string length $Para(InputWidth1)]!=0 && $MaxNum<=$MaxWdth && $MaxNum!=0} {
		.lblNumRange config -text "(0-$MaxNum)"
	}
}

proc GetTopicCB {} {
	global Para

	set Para(topic) ""
}

proc Mg5g00Config {} {
	global Para 

	.lblReset config -state normal -foreground black
	.cboReset config -state normal -foreground black

	#24876, #25062
#	set Para(StageNum) 0
	if {$Para(UseCoeff) == "1"}  {
		.entCoValue   config -state normal   -foreground black
		.entMul2      config -state disabled -foreground grey50
		.lblMulRange2      config -state disabled -foreground grey50
		.lblMtplicand config -state disabled -foreground grey50
	} else  {
		.entCoValue   config -state disabled -foreground grey50
		.entMul2      config -state normal   -foreground black
		.lblMulRange2      config -state normal   -foreground black
		.lblMtplicand config -state normal   -foreground black
	} 

	set MinWdth [GetMinWdth]
	set MaxWdth [GetMaxWdth]

	.lblMulRange1 config -text "($MinWdth-$MaxWdth)"
	.lblMulRange2 config -text "($MinWdth-$MaxWdth)"
} 

# GUI config for or2ca device
proc Orca2aConfig {} {
	global Para

	if {$Para(UseCoeff)=="0"} {
		.lblMtplicand config -text "Multiplicand bit width"
	} else {
		.lblMtplicand config -text "Multiplicand constant value"
	}
	if {$Para(AddPReg)=="1"}  {
		.lblNum config -foreground black
		.entNum config -foreground black -state normal
		set Para(StageNum) 1
		.lblClock config -foreground black
		.cboClock config -state normal
	} else  {
		.lblNum config -foreground grey50
		.entNum config -foreground grey50 -state disabled
		set Para(StageNum) 0
		.lblClock config -foreground gray50
		.cboClock config -state disabled
		set Para(ClockPolarity) Normal
	}
} 

proc GeneralConfig {} {
	global Para

	if {$Para(UseCoeff)=="0"} {
		.lblMtplicand config -text "Multiplicand bit width"
	} else {
		.lblMtplicand config -text "Multiplicand constant value"
	}
	if {$Para(AddPReg)=="1"}  {
		.entNum config -foreground grey50 -state disabled
		.lblNum config -foreground black
		.lblClock config -foreground black
		.cboClock config -state normal
	} else  {
		.lblNum config -foreground grey50
		.entNum config -foreground grey50 -state disabled
		set Para(StageNum) 0
		.lblClock config -foreground gray50
		.cboClock config -state disabled
		set Para(ClockPolarity) Normal
	}
} 

proc ChangeValueCmd {} {
	global Para

	switch $Para(CmdLine) {
		EC_CMD  {Mg5g00Config }
		orca2a  {Orca2aConfig }
		default {GeneralConfig}
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

# *** Check mg5g00, ep5g00 parameters. ***
proc CheckMg5g00Para {}  {
	global Para

	set tit "Check Parameters"

	if {$Para(Signed) == "1" } {
		set ret [IsInRange "Input Width1" 2 32 $Para(InputWidth1)]
		if {$ret == "-1"} {return -1}
		set ret [IsInRange "Input Width2" 2 32 $Para(InputWidth2)]
		if {$ret == "-1"} {return -1}
	} else  {
		set ret [IsInRange "Input Width1" 1 32 $Para(InputWidth1)]
		if {$ret == "-1"} {return -1}
		set ret [IsInRange "Input Width2" 1 32 $Para(InputWidth2)]
		if {$ret == "-1"} {return -1}
	} 
	if {$Para(UseCoeff) == "1"}  {
		#28600 - a constant coefficient range of (-((2**31)-1) to ((2**31)- 1)) 
		set ret [IsInRange "Constant coefficient value" -2147483647 2147483647 $Para(CoValue)]
		if {$ret == "-1"} {return -1}
		#if {[string length $Para(CoValue)] == 0}  {
		#	set msg "Please input Constant coefficient value!"
		#	tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		#	return -1
		#} 
	}
	if {[string length $Para(StageNum)] == 0}  {
		set msg "Please input the number of pipeline stages!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	if {$Para(StageNum)>$Para(InputWidth1)} {
		set msg "Pipeline stages is larger than the multiplier width!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}

	return 0
} 

# *** Check orca2a, orca3, orca4 and or5g00 parameters. ***
proc CheckGeneralPara {}  {
	global Para

	set tit "Check Parameters"
	set ret [IsInRange "Input Width1" 1 64 $Para(InputWidth1)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Input Width2" 1 64 $Para(InputWidth2)]
	if {$ret == "-1"} {return -1}
	if {$Para(AddPReg) == "1"}  {
		if {[string length $Para(StageNum)] == 0}  {
			set msg "Please input the number of pipeline stages!"
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		} 
	}

	if {$Para(StageNum)!="0"&&$Para(AddPReg)=="0"&&$Para(arch)=="orca2a"} {
		set msg	"Either number of pipeline states should be 0,or select to add pipeline!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}
	if {$Para(StageNum)=="0"&&$Para(AddPReg)=="1"&&$Para(arch)=="orca2a"} {
		set msg "Please specify number of pipeline stages!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}

	if {$Para(StageNum)>$Para(InputWidth1)} {
		set msg "Pipeline stages is larger than the multiplier width!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}

	return 0
} 

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para
	
	# 28768
	set Para(CoValue) [string trimleft $Para(CoValue) 0]
	set Para(InputWidth1) [string trimleft $Para(InputWidth1) 0]
	set Para(InputWidth2) [string trimleft $Para(InputWidth2) 0]
	#set Para(StageNum) [string trimleft $Para(StageNum) 0]

	switch $Para(CmdLine) {
		EC_CMD  {set ret [CheckMg5g00Para ]}
		default {set ret [CheckGeneralPara]}
	} 

	return $ret
}

# *** command-line for mg5g00 & ep5g00 device. ***
proc Mg5g00CmdLine {}  {
	global Para

	set str "-arch $Para(arch) -device $Para(PartType) -type multblk -widtha $Para(InputWidth1)"

	if {$Para(UseCoeff) == "0"} {lappend str -widthb $Para(InputWidth2)}
	if {$Para(UseCoeff) == "1"} {lappend str -value $Para(CoValue)}

	if {$Para(Signed) == "1" } {
		lappend str -signed
	} else {
		lappend str -unsigned
	}
	lappend str -pipeline $Para(StageNum)

#	if {$Para(StageNum) != "0"}  {
#		if {$Para(EnablePolarity) == "Active-High"} {lappend str -clken -clk}
#		if {$Para(ResetPolarity)  == "Active-High"} {lappend str -aclear}
#	} 

	return $str
} 

# *** command-line for orca2a, orca3, orca4 and or5g00 device ***
proc GeneralCmdLine {}  {
	global Para

	set str "-arch $Para(arch) -type mult -widtha $Para(InputWidth1)"

	if {$Para(UseCoeff) == "0"} {lappend str -widthb $Para(InputWidth2)}
	if {$Para(UseCoeff) == "1"} {lappend str -value $Para(InputWidth2)}

	if {$Para(AddPReg) == "1"} {
		if {$Para(arch) != "orca2a"} {
			set Para(StageNum) 1
		}
		if {[string length $Para(StageNum)] == 0}  {
			lappend str -pipeline 1
		} else  {
			lappend str -pipeline $Para(StageNum)
		} 
	}
	if {$Para(ClockPolarity) == "Inverted"}   {lappend str -ne}
	if {$Para(ResetPolarity) == "Active-Low"} {lappend str -inv_reset}

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
		default {set str [GeneralCmdLine]}
	} 

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit
	return $str

}

# Get input max width 
proc GetMaxWdth {} {
	global Para 

	switch $Para(CmdLine) {
		EC_CMD  {set MaxWdth 32}
		default {set MaxWdth 64}
	}
	
	return $MaxWdth
}

# Get input min width 
proc GetMinWdth {} {
	global Para 

	if {$Para(CmdLine) == "EC_CMD"} {
		if {$Para(Signed) == "1"}  {
			set MinWdth 2
		} else {
			set MinWdth 1
		}
	} else {
		set MinWdth 1
	}

	return $MinWdth
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

	AttributeSetting 400 420
	set pin_flag 1
	#DrawImage 190 250 
	DrawImage 220 300 
	set tnb $Para(tnb)

	set MinWdth [GetMinWdth]
	set MaxWdth [GetMaxWdth]

		wm title . "ORCA Module -- Multiplier"

	#*** Here for user to add extra pages ***
		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties ;
		set frmProperty [.frmProperties childsite]

		checkbutton .ckUseCoef -text "Use a constant coefficient" -variable Para(UseCoeff) -command {ChangeValueCmd; CallDrawPins}
		pack .ckUseCoef -in $frmProperty -side top -anchor w -padx 10 -pady 3

		label .lblSize -text "Specify the size of the multiplier" 
		pack .lblSize -in $frmProperty -side top -anchor w -padx 12 

		frame .temp1

		frame .temp2
		label .lblMtplier -text "Multiplier bit width" 
		pack .lblMtplier -in .temp2 -side top -anchor w -padx 4 

		frame .frmMul1
		iwidgets::entryfield .entMul1 -labeltext "" \
				-width 6 -textvariable Para(InputWidth1) -validate integer -fixed 4 
		label .lblMulRange1 -text "($MinWdth-$MaxWdth)"
		pack .entMul1 .lblMulRange1 -in .frmMul1 -side left 
		pack .frmMul1 -in .temp2 -side top 
		pack .temp2 -in .temp1 -side left -anchor s 

		label .lblby -text "by" 
		pack .lblby -in .temp1 -side left -anchor s -padx 4 

		frame .temp3 
		label .lblMtplicand -text "Multiplicand bit width" 
		pack .lblMtplicand -in .temp3 -side top 

		frame .frmMul2
		iwidgets::entryfield .entMul2 -labeltext "" \
				 -width 6 -textvariable Para(InputWidth2) -validate integer -fixed 4
		label .lblMulRange2 -text "($MinWdth-$MaxWdth)"
		pack .entMul2 .lblMulRange2 -in .frmMul2 -side left
		pack .frmMul2 -in .temp3 -side top -padx 20 -anchor w
		pack .temp3 -in .temp1 -side left  -padx 4
		
		pack .temp1 -in $frmProperty -side top -anchor w -pady 0 -padx 30

		checkbutton .ckSigned -text "Signed Multiplier" -variable Para(Signed)
		pack .ckSigned -in $frmProperty -side top -anchor w -padx 10
		checkbutton .ckaddpreg -variable Para(AddPReg)
		pack .ckaddpreg -in $frmProperty -side top -anchor w -padx 10 -pady 6

		#************ Added for #17094
		checkbutton .ckUseReset -text "Use Reset" -variable Para(UseReset) -command ChangeValueCmd
		pack .ckUseReset -in $frmProperty -side top -anchor w -padx 10

		label .lblNum -text "Specify the number of pipeline stages: " 
		pack .lblNum -in $frmProperty -side top -anchor w -padx 10 -pady 2

		frame .frmNum
		iwidgets::entryfield .entNum -width 8 -textvariable Para(StageNum) -validate integer -fixed 4
		#pack .entNum -in $frmProperty -side top -anchor w -padx 140 -pady 6
		label .lblNumRange -text "(0-$Para(InputWidth1))"
		pack .entNum .lblNumRange -in .frmNum -side left 
		pack .frmNum -in $frmProperty -side top -anchor w -padx 140 -pady 6

		set clock_lst {Normal Inverted}
		CreateLabelCombobox $frmProperty Clock "Specify the clock polarity:" 27 12 Para(ClockPolarity) $clock_lst
		.lblClock config -anchor w
		pack .frmClock -in $frmProperty -pady 5

		set enable_lst {Active-High}
		CreateLabelCombobox $frmProperty Enable "Specify the clock enable polarity:" 27 12 Para(EnablePolarity) $enable_lst
		.lblEnable config -anchor w

		set reset_lst {Active-High Active-Low}
		CreateLabelCombobox $frmProperty Reset "Specify the reset polarity:" 27 12 Para(ResetPolarity) $reset_lst
		.lblReset config -anchor w
		pack .frmReset -in $frmProperty -pady 5

		pack .frmProperties -in $page -side top -fill both -expand 1

		.entMul1.lwchildsite.entry config -validate key -vcmd {
				after idle {CallDrawPins;CallUpdateNumRange}
				return 1
			}
		.entMul2.lwchildsite.entry config -validate key -vcmd {
				after idle {CallDrawPins}
				return 1
			}
		.entNum.lwchildsite.entry config -validate key -vcmd {
				after idle {CallDrawPins}
				return 1
			}
	#	if {$Para(arch)=="orca3"} {
	#		.ckUse config -state disabled		
	#	}

	#**********************************
	# GUI config for orca2,3,4,FPSC and or5g00 device
	#**********************************
	if {[lsearch $Para(orca_lst) $Para(arch)] != -1}  {
		pack forget .ckSigned
		.ckaddpreg configure -text "Add pipeline Registers" -command {ChangeValueCmd; CallDrawPins}
		pack forget .ckUseReset

		pack forget .frmEnable

		AddPlacementTab 
		.cboData config -labeltext "Select multiplier A flow"
		.cboData config -labelmargin 40
		.cboAddress config -labeltext "Select multiplier B flow"
		set placement [.frmPlacement childsite]
		pack .cboData -in $placement -side top  -anchor w -padx 10 -pady 10
		pack .cboAddress -in $placement -side top -anchor w -padx 10

		if {$Para(arch) == "orca3" || $Para(arch) == "orca4"}  {
			pack forget .frmReset
		}
		CallDrawPins
	} 

	#**********************************
	# GUI config for MAGMA, ECP, MOJO device
	#**********************************
	if {[lsearch $Para(fpga_lst) $Para(arch)] != -1}  {
		wm title . "Lattice Module -- Multiplier"
	#	.ckUseCoef config -command ChangeValueCmd
		pack forget .ckaddpreg .ckUseReset .ckSigned

		iwidgets::entryfield .entCoValue -labeltext "Constant coefficient value" -width 13 -textvariable Para(CoValue) -validate integer -fixed 11
		pack .entCoValue -in $frmProperty -before .lblSize -anchor w -padx 50 -pady 4
		.entCoValue.lwchildsite.entry config -validate key -vcmd {
				after idle {CallDrawPins}
				return 1
		}

		.cboClock clear list
		.cboClock insert list end Active-High
		.cboReset clear list
		.cboReset insert list end Active-High
		set Para(ResetPolarity) Active-High
		set Para(ClockPolarity) Active-High

		label .lblSigned -text "Specify the representation of the multiplier:"
		frame .frmRep
		radiobutton .rdo1Rep -text Signed   -width 10 -value 1 -variable Para(Signed) -anchor w -command {ChangeValueCmd;CallDrawPins}
		radiobutton .rdo2Rep -text Unsigned -width 10 -value 0 -variable Para(Signed) -anchor w -command {ChangeValueCmd;CallDrawPins}
		pack .rdo1Rep .rdo2Rep -in .frmRep -side left
		pack .frmRep -in $frmProperty -before .lblNum
		pack .lblSigned -in $frmProperty -before .frmRep -anchor w -padx 10 -pady 2

		pack forget .frmClock .frmEnable .frmReset

		#22791
		.lblSize config -text "Specify the data width of the multiplier" 

		.entMul1 config -fixed 3
		.entMul2 config -fixed 3
	} 

		ChangeValueCmd
		$tnb view 0

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}

