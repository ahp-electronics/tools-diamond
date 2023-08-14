#$Header: L:/module/fifo_dc/sa5p00/gui/core_template.tcl 1.4 mghuang Exp $

#Rev 1.3: Diamond 3.0 IPExpress: Fixed SOF-115774
#Rev 1.3: Diamond 2.2: Fixed SOF-114978,SOF-115182
#Rev 1.2: Diamond 2.2: Fixed cr_59698, SCR_1014.
#Rev 1.1: Diamond 2.2 IPExpress: Fixed cr_59463,59465, Memory UM rev 2.0

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para

	if {[string length $Para(Depth)] >0 &&
		[string length $Para(Width)] >0 &&
		[string length $Para(RDepth)] >0 &&
		[string length $Para(RWidth)] >0 &&
		[string length $Para(PeAssert)] >0 &&
		[string length $Para(PeDeassert)] >0 &&
		[string length $Para(PfAssert)] >0 &&
		[string length $Para(PfDeassert)] >0 }  {
		
		if {$Para(Width) >= 1 && $Para(Width) <= 256} {
			set Para(RWidth) [expr $Para(Depth)*$Para(Width)/$Para(RDepth)]
		} else {
			set Para(RWidth) 0
		}
	
		set r_size [expr $Para(RDepth)*$Para(RWidth)]
		set w_size [expr $Para(Depth)*$Para(Width)]
		
		if {$r_size != $w_size} {return}
	
		DrawPins
	}
} 

proc GetTopicCB {} {
	global Para
}

proc ChangeValueCmd {} {
	global Para

	if {$Para(FIFOImp) == "LUT Based"} {
		.cboAddress clear list
		.cboRAddress clear list
		#set MaxAddDepth 8192
		.cboAddress insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192
		.cboRAddress insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192
		if {$Para(Depth) > 8192} {set Para(Depth) 8192}
		if {$Para(RDepth) > 8192} {set Para(RDepth) 8192}
		.ckEnECC config -state disable
		set Para(EnECC) 0
		.cboRAddress config -state disabled
		.lblRData    config -state disabled
		set Para(RDepth) $Para(Depth)
		set Para(RWidth) $Para(Width)
	} else {
		.cboRAddress config -state normal
		.lblRData    config -state normal
		.cboAddress clear list
		.cboRAddress clear list
		#.cboAddress insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384
		#.cboRAddress insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384
		.cboAddress insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536
		.cboRAddress insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536
		#if {$Para(Depth) > 16384} {set Para(Depth) 16384}
		#if {$Para(RDepth) > 16384} {set Para(RDepth) 16384}
		if {$Para(Depth) > 65536} {set Para(Depth) 65536}
		if {$Para(RDepth) > 65536} {set Para(RDepth) 65536}
		if {$Para(Depth) != $Para(RDepth)} {
			.ckEnECC config -state disable
			set Para(EnECC) 0
		} else {
			if {$Para(Width)>64} {
				if {$Para(EnECC) == "1"} {
					set tit "Check Parameter"
					set msg "Enable ECC option is not supported for Data Width > 64."
					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				}
				.ckEnECC config -state disable
				set Para(EnECC) 0
			} else {
				.ckEnECC config -state normal
			}
		}
	}

	if {$Para(regout) == "0"} {
		set Para(CtrlByRdEn) "0"
		.ckCtrlbyRdEn config -state disable
	} else {
		.ckCtrlbyRdEn config -state normal
	}

	if {$Para(Reset) == "Async"} {
		.rdo1Release config -state normal
		.rdo2Release config -state normal
	} else {
		.rdo1Release config -state disabled
		.rdo2Release config -state disabled
	}

	if {$Para(EmpFlg) == "1"} {
		.cboPe config -state normal -foreground black
		.entPeAssert config -state normal -foreground black
		.lblPeAssert config -state normal -foreground black
		.entPeDeassert config -state normal -foreground black
		if {$Para(PeMode) == "Static - Single Threshold" ||
			$Para(PeMode) == "Static - Dual Threshold"} {
			.entPeAssert config -state normal -foreground black
			.lblPeAssert config -state normal -foreground black
		} else {
			.entPeAssert config -state disabled -foreground grey50
			.lblPeAssert config -state disabled -foreground grey50
		}
		if {$Para(PeMode) == "Static - Dual Threshold"} {
			.entPeDeassert config -state normal -foreground black
			.lblPeDeassert config -state normal -foreground black
		} else {
			.entPeDeassert config -state disabled -foreground grey50
			.lblPeDeassert config -state disabled -foreground grey50
		}
	} else {
		.cboPe config -state disabled -foreground grey50
		.entPeAssert config -state disabled -foreground grey50
		.lblPeAssert config -state normal -foreground grey50
		.entPeDeassert config -state disabled -foreground grey50
		.lblPeDeassert config -state disabled -foreground grey50
	}

	if {$Para(FullFlg) == "1"} {
		.cboPf config -state normal -foreground black
		.entPfAssert config -state normal -foreground black
		.lblPfAssert config -state normal -foreground black
		.entPfDeassert config -state normal -foreground black
		if {$Para(PfMode) == "Static - Single Threshold" ||
			$Para(PfMode) == "Static - Dual Threshold"} {
			.entPfAssert config -state normal -foreground black
			.lblPfAssert config -state normal -foreground black
		} else {
			.entPfAssert config -state disabled -foreground grey50
			.lblPfAssert config -state disabled -foreground grey50
		}
		if {$Para(PfMode) == "Static - Dual Threshold"} {
			.entPfDeassert config -state normal -foreground black
			.lblPfDeassert config -state normal -foreground black
		} else {
			.entPfDeassert config -state disabled -foreground grey50
			.lblPfDeassert config -state disabled -foreground grey50
		}
	} else {
		.cboPf config -state disabled -foreground grey50
		.entPfAssert config -state disabled -foreground grey50
		.lblPfAssert config -state normal -foreground grey50
		.entPfDeassert config -state disabled -foreground grey50
		.lblPfDeassert config -state disabled -foreground grey50
	}

	.lblPeAssert config -text "(1-$Para(RDepth))"
	.lblPeDeassert config -text "(1-$Para(RDepth))"
	.lblPfAssert config -text "(1-$Para(Depth))"
	.lblPfDeassert config -text "(1-$Para(Depth))"

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

proc CheckPara {}  {
	global Para

	if {$Para(FIFOImp) == "LUT Based"} {
		set MaxAddDepth 8192
	} else {
		#set MaxAddDepth 16384
		set MaxAddDepth 65536
		
	}
	set tit "Check Parameter"
	if {[string length $Para(Depth)] == 0}  {
		set msg "Please input Depth"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 
	#new spec
	set ret [IsInRange "Write Address Depth" 2 $MaxAddDepth $Para(Depth)]
	if {$ret == -1} {return -1} 

	set ret [IsInRange "Write Data Width" 1 256 $Para(Width)]
	if {$ret == -1} {return -1} 
	
	set ret [IsInRange "Read Address Depth" 2 $MaxAddDepth $Para(RDepth)]
	if {$ret == -1} {return -1} 

	set ret [IsInRange "Read Data Width" 1 256 $Para(RWidth)]
	if {$ret == -1} {return -1} 

	set r_size [expr $Para(RDepth)*$Para(RWidth)]
	set w_size [expr $Para(Depth)*$Para(Width)]
	set msg "Total value of (Depth * Width) must be the same for read set and write set ports."
	if {$r_size != $w_size}  {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	set max $Para(RDepth)
	if {$Para(EmpFlg) == "1"} {
		if {[.entPeAssert cget -state] == "normal"} {
			set ret [IsInRange "Almost Empty Flag Assert" 1 $max $Para(PeAssert)]
			if {$ret == -1} {return -1} 
		}
		if {[.entPeDeassert cget -state] == "normal"} {
			set ret [IsInRange "Almost Empty Flag Deassert" 1 $max $Para(PeDeassert)]
			if {$ret == -1} {return -1} 
		}
		
		if {$Para(PeMode) == "Static - Dual Threshold"} {
			if {$Para(PeAssert) >= $Para(PeDeassert)} {
				set msg "For Almost Empty, assert value must be less than deassert value."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
	}
	set max $Para(Depth)
	if {$Para(FullFlg) == "1"} {
		if {[.entPfAssert cget -state] == "normal"} {
			set ret [IsInRange "Almost Full Flag Assert" 1 $max $Para(PfAssert)]
			if {$ret == -1} {return -1} 
		}
		if {[.entPfDeassert cget -state] == "normal"} {
			set ret [IsInRange "Almost Full Flag Deassert" 1 $max $Para(PfDeassert)]
			if {$ret == -1} {return -1} 
		}

		if {$Para(PfMode) == "Static - Dual Threshold"} {
			if {$Para(PfAssert) <= $Para(PfDeassert)} {
				set msg "For Almost Full, assert value must be greater than deassert value."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
	}
	#27821
	if {$Para(Width) > 1024}  {
		set Para(bCreateSymbol) 0
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

	set ret [CheckPara ]
	#switch $Para(CmdLine)  {
	#	EC_CMD  {set ret [CheckPara ]}
	#} 
	return $ret
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para

    set str "-arch $Para(arch) -type ebfifo"

	lappend str -depth $Para(Depth) -width $Para(Width)
	if {$Para(FIFOImp) == "LUT Based"} {
		lappend str -pfu_fifo
	} else {
		lappend str -rwidth $Para(RWidth)
	}
	
	#22518
	if {$Para(regout) == "1"} {
		lappend str -regout 
		if {$Para(CtrlByRdEn) == "0"} {lappend str -no_enable}
#		if {$Para(ClockEn) == "1"} {lappend str -out_enable_0}
	}
	
	if {$Para(Reset) == "Sync"} {
		lappend str -sync_reset
	} else {
		lappend str -reset_rel [string toupper $Para(Reset1)]
	}

	if {$Para(EmpFlg) == "0"} {
		lappend str -pe -1
	} else {
		if {$Para(PeMode) == "Static - Single Threshold"} {
			lappend str -pe $Para(PeAssert)
		}
		if {$Para(PeMode) == "Static - Dual Threshold"} {
			lappend str -pe $Para(PeAssert) -pe2 $Para(PeDeassert)
		}
		if {$Para(PeMode) == "Dynamic - Single Threshold"} {
			lappend str -pe 0
		}
		if {$Para(PeMode) == "Dynamic - Dual Threshold"} {
			lappend str -pe 0 -pe2 0
		}
	}
	if {$Para(FullFlg) == "0"} {
		lappend str -pf -1
	} else {
		if {$Para(PfMode) == "Static - Single Threshold"} {
			lappend str -pf $Para(PfAssert)
		}
		if {$Para(PfMode) == "Static - Dual Threshold"} {
			lappend str -pf $Para(PfAssert) -pf2 $Para(PfDeassert)
		}
		if {$Para(PfMode) == "Dynamic - Single Threshold"} {
			lappend str -pf 0
		}
		if {$Para(PfMode) == "Dynamic - Dual Threshold"} {
			lappend str -pf 0 -pf2 0
		}
	}

	if {$Para(RDataCount) == "1"} {lappend str -rfill}
	if {$Para(WDataCount) == "1"} {lappend str -fill}
	
	if {$Para(EnECC) == "1"} {lappend str -eccmode 0}
	
#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit
	return $str
}

proc Create_Image {} {
	global Para diagram tnb tcl_platform pin_flag mem_types

	package require OrcaModule

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface
	AttributeSetting 450 560
	set pin_flag 1
	DrawImage 220 380
	set tnb $Para(tnb)

	if {$Para(FIFOImp) == "LUT Based"} {
		set MaxAddDepth 8192
	} else {
		#set MaxAddDepth 16384
		set MaxAddDepth 65536
	}

	#*** Here for user to add extra pages ***
	#--- Page #1 ---
	set page [$tnb add -label "Configuration"]
	iwidgets::Labeledframe .frmProperties
	set frmProperty [.frmProperties childsite]

	pack .frmProperties -in $page -side top -fill both -expand 1

	#**********************************
	#GUI for mg5g00, ep5g00 device
	#**********************************
	wm title . "Lattice Module -- $Para(CoreName)"

	#*** FIFO Implementation ***
	iwidgets::Labeledframe .frmFIFOImp -labeltext "FIFO Implementation" -labelpos nw
	set frmFIFOImp [.frmFIFOImp childsite]
	frame .frmType
	radiobutton .rdoEBR -text "EBR Only" -width 12 -value "EBR Based" -variable Para(FIFOImp) -anchor w -command ChangeValueCmd
	radiobutton .rdoLUT -text "LUT Only" -width 12 -value "LUT Based" -variable Para(FIFOImp) -anchor w -padx 100 -command ChangeValueCmd
	pack .rdoEBR .rdoLUT -in .frmType -side left -padx 10

	frame .frmAdd_Data
	frame .frmAddress
	iwidgets::combobox .cboAddress -labeltext "Write Address Depth" -labelpos w -textvariable Para(Depth) \
		-width 12 -editable 0 -selectioncommand {ChangeValueCmd}
	#label .lblAddress -text "(2-$MaxAddDepth)" 
	pack .cboAddress -in .frmAddress -side left
	
	frame .frmData
	iwidgets::entryfield .entData -labeltext "Data Width" -labelpos w -textvariable Para(Width) \
		-width 5 -validate numeric -fixed 4
	label .lblData -text "(1-256)"
	pack .entData .lblData -in .frmData -side left
	pack .frmAddress .frmData -in .frmAdd_Data -side left 
	.cboAddress.label config -width 16 -anchor e
	.entData.label    config -width 12 -anchor e

	#**********7.2 MRD 3.4.7.3.4 **********
	frame .frmRAdd_Data
	frame .frmRAddress
	iwidgets::combobox .cboRAddress -labeltext "Read Address Depth" -labelpos w -textvariable Para(RDepth) \
		-width 12 -editable 0 -selectioncommand {ChangeValueCmd}
	#label .lblRAddress -text "(2-$MaxAddDepth)" 
	pack .cboRAddress -in .frmRAddress -side left

	.cboAddress insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384
	.cboRAddress insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384
	
	frame .frmRData
	iwidgets::entryfield .entRData -labeltext "Data Width" -labelpos w -textvariable Para(RWidth) \
		-width 5 -validate numeric -fixed 4 -state disable
	label .lblRData -text "(1-256)"
	pack .entRData .lblRData -in .frmRData -side left
	pack .frmRAddress .frmRData -in .frmRAdd_Data -side left 
	.cboRAddress.label config -width 16 -anchor e
	.entRData.label    config -width 12 -anchor e
	#**********7.2 MRD 3.4.7.3.4 **********
	
	frame .frmOutReg
	checkbutton .ckEnable -text "Enable Output Register" -variable Para(regout) -command {ChangeValueCmd} -padx 10 
	checkbutton .ckCtrlbyRdEn -text "Controlled by RdEn" -variable Para(CtrlByRdEn) -command {ChangeValueCmd} -padx 30
	.ckCtrlbyRdEn config -state disabled
	checkbutton .ckClockEn -text "Enable Output ClockEn" -variable Para(ClockEn) -command {ChangeValueCmd} -padx 30
	pack .ckEnable .ckCtrlbyRdEn -in .frmOutReg -side left -anchor w

	pack .frmType .frmAdd_Data .frmRAdd_Data -in $frmFIFOImp -side top -fill x -anchor w -padx 5 -pady 2
#	pack .ckEnable -in $frmFIFOImp -side top -anchor w
	pack .frmOutReg -in $frmFIFOImp -side top -fill x
	pack .frmFIFOImp -in $frmProperty -side top -fill x -anchor w

	#*** Flag Control ***
	iwidgets::Labeledframe .frmFlgCtrl -labeltext "Flag Control" -labelpos nw
	set frmFlgCtrl [.frmFlgCtrl childsite]
	frame .frmPe
	checkbutton .ckEmpFlg -text "Almost Empty Flag" -variable Para(EmpFlg) -width 20 -anchor w -padx 10 -command {ChangeValueCmd}
	iwidgets::combobox .cboPe -width 25 -editable false -textvariable Para(PeMode) -selectioncommand {ChangeValueCmd}
	.cboPe insert list end "Static - Single Threshold" "Static - Dual Threshold" \
						   "Dynamic - Single Threshold" "Dynamic - Dual Threshold"
	pack .ckEmpFlg .cboPe -in .frmPe -side left
	
	frame .frmPe1
	iwidgets::entryfield .entPeAssert -labeltext "Assert" -labelpos w -width 8 \
		-textvariable Para(PeAssert) -validate {digit %c} -fixed 6 
	.entPeAssert.label config -width 10 -anchor e -foreground black
	label .lblPeAssert -text "(1-512)"  -anchor w 
	iwidgets::entryfield .entPeDeassert -labeltext "Deassert" -labelpos w -width 8 \
		-textvariable Para(PeDeassert) -validate {digit %c} -fixed 6 
	.entPeDeassert.label config -width 10 -anchor e -foreground black
	label .lblPeDeassert -text "(1-512)"  -anchor w 
	pack .entPeAssert .lblPeAssert .entPeDeassert .lblPeDeassert -in .frmPe1 -side left

	frame .frmPf
	checkbutton .ckFullFlg -text "Almost Full Flag" -variable Para(FullFlg) -width 20 -anchor w -padx 10 -command {ChangeValueCmd}
	iwidgets::combobox .cboPf -width 25 -editable false -textvariable Para(PfMode) -selectioncommand {ChangeValueCmd}
	.cboPf insert list end "Static - Single Threshold" "Static - Dual Threshold" \
						   "Dynamic - Single Threshold" "Dynamic - Dual Threshold"
	pack .ckFullFlg .cboPf -in .frmPf -side left						
						   
    frame .frmPf1							
	iwidgets::entryfield .entPfAssert -labeltext "Assert" -labelpos w -width 8 \
		-textvariable Para(PfAssert) -validate {digit %c} -fixed 6 
	.entPfAssert.label config -width 10 -anchor e -foreground black
	label .lblPfAssert -text "(1-512)"  -anchor w 
	iwidgets::entryfield .entPfDeassert -labeltext "Deassert" -labelpos w -width 8 \
		-textvariable Para(PfDeassert) -validate {digit %c} -fixed 6 
	.entPfDeassert.label config -width 10 -anchor e -foreground black
	label .lblPfDeassert -text "(1-512)"  -anchor w 
	pack .entPfAssert .lblPfAssert .entPfDeassert .lblPfDeassert -in .frmPf1 -side left
	
	pack .frmPe .frmPe1 .frmPf .frmPf1 -in $frmFlgCtrl -side top -anchor w -pady 2

	pack .frmFlgCtrl -in $frmProperty -side top -anchor w  -fill x

	#*** Reset Mode ***
	iwidgets::Labeledframe .frmReset -labeltext "Reset Mode" -labelpos nw
	set frmReset [.frmReset childsite]
	iwidgets::Labeledframe .frmAssert -labeltext "Assertion" -labelpos nw
	set frmAssert [.frmAssert childsite]
	radiobutton .rdo1Assert -text Async -width 8 -value Async -variable Para(Reset) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2Assert -text Sync  -width 8 -value Sync  -variable Para(Reset) -anchor w -command {ChangeValueCmd}
	pack .rdo1Assert .rdo2Assert -in $frmAssert -side left -padx 10
	iwidgets::Labeledframe .frmRelease -labeltext "Release" -labelpos nw
	set frmRelease [.frmRelease childsite]
	radiobutton .rdo1Release -text Async -width 8 -value Async -variable Para(Reset1) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2Release -text Sync  -width 8 -value Sync  -variable Para(Reset1) -anchor w -command {ChangeValueCmd}
	pack .rdo1Release .rdo2Release -in $frmRelease -side left -padx 10
	pack .frmAssert .frmRelease -in $frmReset -side left
	pack .frmReset -in $frmProperty -side top -fill x -anchor w 

	#*** Data Count Options ***
	iwidgets::Labeledframe .frmDataCount -labeltext "Data Count Options" -labelpos nw
	set frmDataCount [.frmDataCount childsite]
	checkbutton .ckWDataCount -text "Data Count (Synchronized with Write Clock)" -variable Para(WDataCount)\
	-command {ChangeValueCmd} -padx 10 
	checkbutton .ckRDataCount -text "Data Count (Synchronized with Read Clock)" -variable Para(RDataCount)\
	-command {ChangeValueCmd} -padx 10 
	pack .ckWDataCount .ckRDataCount -in $frmDataCount -side top -anchor w
	pack .frmDataCount -in $frmProperty -side top -fill x 

	.entData.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
#	.entRData.lwchildsite.entry config -validate key -vcmd {
#			after idle {ChangeValueCmd}
#			return 1
#	}
	
	checkbutton .ckEnECC -text "Enable ECC (not supported for Data Width > 64)" -variable Para(EnECC) -command {ChangeValueCmd}
	pack .ckEnECC -in $frmProperty -side top -anchor w -padx 10

	$tnb view 0

#	set Para(PeMode) "Static - Single Threshold"
#	set Para(PfMode) "Static - Single Threshold"
	ChangeValueCmd
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}
