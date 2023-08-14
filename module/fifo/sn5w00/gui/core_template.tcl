#$Header: L:/module/fifo/sn5w00/gui/core_template.tcl 1.1 mghuang Exp $

#Rev 1.1: Diamond 3.5: Init ver.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(Depth)] >0 &&
		[string length $Para(Width)] >0 &&
		[string length $Para(PeAssert)] >0 &&
		[string length $Para(PeDeassert)] >0 &&
		[string length $Para(PfAssert)] >0 &&
		[string length $Para(PfDeassert)] >0}  {DrawPins}
} 

proc GetTopicCB {} {
	global Para
}

proc ChangeValueCmd {} {
	global Para
	
	if {$Para(FIFOImp) == "LUT Based"} {
		.ckEnECC config -state disable
		set Para(EnECC) 0
	} else {
		if {$Para(Width)>64} {
			.ckEnECC config -state disable
			set Para(EnECC) 0
		} else {
			.ckEnECC config -state normal
		}
	}

	if {$Para(regout) == "0"} {
		.ckCtrlbyRdEn config -state disable 
		set Para(CtrlByRdEn) "0"
	} else {
		.ckCtrlbyRdEn config -state normal 
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

	if {$Para(Reset) == "Async"} {
		.rdo1Release config -state normal
		.rdo2Release config -state normal
	} else {
		.rdo1Release config -state disabled
		.rdo2Release config -state disabled
	}

	if {$Para(FIFOImp) == "LUT Based"} {
		set MaxAddDepth 4096
	} else {
		set MaxAddDepth 8192
	}
	.lblAddress config -text "(2-$MaxAddDepth)"
	.lblPeAssert config -text "(1-$Para(Depth))"
	.lblPeDeassert config -text "(1-$Para(Depth))"
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

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para

	if {$Para(FIFOImp) == "LUT Based"} {
		set MaxAddDepth 4096
	} else {
		set MaxAddDepth 8192
	}
	set tit "Check Parameter"
	if {[string length $Para(Depth)] == 0}  {
		set msg "Please input Depth"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 
	#new spec
	set ret [IsInRange "Address Depth" 2 $MaxAddDepth $Para(Depth)]
	if {$ret == -1} {return -1} 

	set temp [expr int(ceil(log($Para(Depth))/log(2)))]
	if {[expr pow(2,$temp) - $Para(Depth)] > 0}  {
		set msg "The Address Depth can only be power of 2."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 
	set ret [IsInRange "Data Width" 1 256 $Para(Width)]
	if {$ret == -1} {return -1} 
	
	set max $Para(Depth)
	if {$Para(EmpFlg) == "1"} {
		if {[.entPeAssert cget -state] == "normal"} {
			set ret [IsInRange "Almost Empty Flag Assert" 1 $max $Para(PeAssert)]
			if {$ret == -1} {return -1} 
		}
		if {[.entPeDeassert cget -state] == "normal"} {
			set ret [IsInRange "Almost Empty Flag Deassert" 1 $max $Para(PeDeassert)]
			if {$ret == -1} {return -1} 
		}
		
		if {$Para(PeMode) == "Static - Dual Threshold" ||
			$Para(PeMode) == "Dynamic - Dual Threshold"} {
			if {$Para(PeAssert) >= $Para(PeDeassert)} {
				set msg "For Almost Empty, assert value must be less than deassert value."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
	}
	if {$Para(FullFlg) == "1"} {
		if {[.entPfAssert cget -state] == "normal"} {
			set ret [IsInRange "Almost Full Flag Assert" 1 $max $Para(PfAssert)]
			if {$ret == -1} {return -1} 
		}
		if {[.entPfDeassert cget -state] == "normal"} {
			set ret [IsInRange "Almost Full Flag Deassert" 1 $max $Para(PfDeassert)]
			if {$ret == -1} {return -1} 
		}

		if {$Para(PfMode) == "Static - Dual Threshold" ||
			$Para(PfMode) == "Dynamic - Dual Threshold"} {
			if {$Para(PfAssert) <= $Para(PfDeassert)} {
				set msg "For Almost Full, assert value must be greater than deassert value."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
	}
	#27821
	if {$Para(Width) > 1024}  {
		#set Para(bCreateSymbol) 0
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

	set str "-arch $Para(arch) -type ebfifo -sync_mode"
	if {$Para(FIFOImp) == "LUT Based"} {lappend str -pfu_fifo}
	lappend str -depth $Para(Depth) -width $Para(Width)
	if {$Para(regout) == "1"} {lappend str -regout} 
	if {$Para(CtrlByRdEn) == "0"} {lappend str -no_enable}
	
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
	
	if {$Para(Reset) == "Sync"} {
		lappend str -sync_reset
	} else {
		lappend str -reset_rel [string toupper $Para(Reset1)]
	}

	if {$Para(RDataCount) == "1"} {lappend str -fill}
	if {$Para(EnECC) == "1"} {lappend str -eccmode 0}
	#if {$Para(EnFWFT) == "1"} {lappend str -fwft_enable}

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
	AttributeSetting 480 430
	set pin_flag 1
	DrawImage 220 380
	set tnb $Para(tnb)

	if {$Para(FIFOImp) == "LUT Based"} {
		set MaxAddDepth 4096
	} else {
		set MaxAddDepth 8192
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
	radiobutton .rdoEBR -text "EBR Only" -width 10 -value "EBR Based" -variable Para(FIFOImp) -anchor w -command ChangeValueCmd
	radiobutton .rdoLUT -text "LUT Only" -width 10 -value "LUT Based" -variable Para(FIFOImp) -anchor w -padx 100 -command ChangeValueCmd
	pack .rdoEBR .rdoLUT -in .frmType -side left -padx 10

	frame .frmAdd_Data
	frame .frmAddress
	iwidgets::entryfield .entAddress -labeltext "Address Depth" -labelpos w -textvariable Para(Depth) \
		-width 8 -validate numeric -fixed 6
	label .lblAddress -text "(2-$MaxAddDepth)" 
	pack .entAddress .lblAddress -in .frmAddress -side left
	
	frame .frmData
	iwidgets::entryfield .entData -labeltext "Data Width" -labelpos w -textvariable Para(Width) \
		-width 8 -validate numeric -fixed 4
	label .lblData -text "(1-256)"
	pack .entData .lblData -in .frmData -side left
	pack .frmAddress .frmData -in .frmAdd_Data -side left 
	.entAddress.label config -width 14 -anchor e
	.entData.label    config -width 12 -anchor e

	frame .frmOutReg
	checkbutton .ckEnable -text "Enable Output Register" -variable Para(regout) -command {ChangeValueCmd} -padx 10 
	checkbutton .ckCtrlbyRdEn -text "Controlled by RdEn" -variable Para(CtrlByRdEn) -command {ChangeValueCmd} -padx 30
	pack .ckEnable .ckCtrlbyRdEn -in .frmOutReg -side left -anchor w

	pack .frmType .frmAdd_Data .frmOutReg -in $frmFIFOImp -side top -fill x -pady 2
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
	checkbutton .ckWDataCount -text "Data Count (Synchronized with Write Clock)" -variable Para(RDataCount)\
	-command {ChangeValueCmd} -padx 10 
#	checkbutton .ckRDataCount -text "Data Count (Synchronized with Read Clock)" -variable Para(RDataCount)\
#	-command {ChangeValueCmd} -padx 10 
	pack .ckWDataCount -in $frmDataCount -side top -anchor w
	pack .frmDataCount -in $frmProperty -side top -fill x 

	.entAddress.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	.entData.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	
	checkbutton .ckEnECC -text "Enable ECC (not supported for Data Width > 64)" -variable Para(EnECC) -command {ChangeValueCmd}
	pack .ckEnECC -in $frmProperty -side top -anchor w -padx 10

	#checkbutton .ckEnFWFT -text "Enable First Word Fall Through (FWFT) on the Read Port" -variable Para(EnFWFT) -command {ChangeValueCmd}

	#pack .ckEnFWFT -in $frmProperty -side top -anchor w -padx 10

	$tnb view 0

	ChangeValueCmd
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}
 
