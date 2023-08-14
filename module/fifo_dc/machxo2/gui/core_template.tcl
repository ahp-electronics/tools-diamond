#$Header: L:/module/fifo_dc/machxo2/gui/core_template.tcl 1.5 mghuang Exp $

#Rev 1.5: Diamond 3.1 IPExpress: Fixed SOF-118861
#Rev 1.4: Diamond 3.0 IPExpress: Fixed SOF-115793
#Rev 1.3: 8.1p IPExpress: Fixed cr_49727
#Rev 1.2: UM 3.11, Fixed #47906
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para

	#set r_size [expr $Para(RDepth)*$Para(RWidth)]
	#set w_size [expr $Para(WDepth)*$Para(WWidth)]
	#if {$r_size != $w_size}  {return}
	if {[string length $Para(RDepth)] >0 &&
		[string length $Para(RWidth)] >0 &&
		[string length $Para(WDepth)] >0 &&
		[string length $Para(WWidth)] >0 &&
		[string length $Para(PeAssert)] >0 &&
		[string length $Para(PeDeassert)] >0 &&
		[string length $Para(PfAssert)] >0 &&
		[string length $Para(PfDeassert)] >0 }  {
#		set Para(RWidth) [expr $Para(WDepth)*$Para(WWidth)/$Para(RDepth)]
		DrawPins
	}
} 

proc GetTopicCB {} {
	global Para

	set Para(topic) ""
}

proc ChangeValueCmd {}  {
	global Para

	set Para(EBR_Dev_Flag) [GetEBRDeviceFlag]
	if {$Para(EBR_Dev_Flag) == "0"} {
		.rdoEBROnly  config -state disabled
		.rdoEBRBased config -state disabled
		set Para(FIFOImp) "LUT Based"
	} else {
		.rdoEBROnly config -state normal
	}

	set Para(WWidth) [string trimleft $Para(WWidth) 0]
	if {[catch {set Para(RWidth) [expr $Para(WDepth)*$Para(WWidth)/$Para(RDepth)]}]} {
		set Para(RWidth) 0
	}
	
	if {$Para(FIFOImp) == "EBR Only"} {
		set Para(RDataCount) 0
		set Para(WDataCount) 0
		set Para(EmpFlg) 1
		set Para(FullFlg) 1
		.ckRDataCount config -state disable
		.ckWDataCount config -state disable
		.ckEmpFlg config -state disable
		.ckFullFlg config -state disable
		#ISPL_CR_33648 
		.cboPe config -state normal
		.cboPf config -state normal
#		if {$Para(RDepth) != $Para(WDepth)} {
#			.cboPe clear list
#			.cboPe insert list end "Static - Single Threshold"
#			set Para(PeMode) "Static - Single Threshold"
#			.cboPf clear list
#			.cboPf insert list end "Static - Single Threshold"
#			set Para(PfMode) "Static - Single Threshold"
#		} else {
#			.cboPe clear list
#			.cboPe insert list end "Static - Single Threshold" "Static - Dual Threshold" \
#								   "Dynamic - Single Threshold" "Dynamic - Dual Threshold"
#			.cboPf clear list
#			.cboPf insert list end "Static - Single Threshold" "Static - Dual Threshold" \
#								   "Dynamic - Single Threshold" "Dynamic - Dual Threshold"
#		}
	} else {
		.ckRDataCount config -state normal
		.ckWDataCount config -state normal
		.ckEmpFlg config -state normal
		.ckFullFlg config -state normal
		.cboPe config -state normal
		.cboPf config -state normal
#		.cboPe clear list
#		.cboPe insert list end "Static - Single Threshold" "Static - Dual Threshold" \
#							   "Dynamic - Single Threshold" "Dynamic - Dual Threshold"
#		.cboPf clear list
#		.cboPf insert list end "Static - Single Threshold" "Static - Dual Threshold" \
#								   "Dynamic - Single Threshold" "Dynamic - Dual Threshold"
	}

	if {$Para(FIFOImp) == "LUT Based"} {
		set Para(RDepth) $Para(WDepth)
		set Para(RWidth) $Para(WWidth)
		.cboReadAdd config -state disabled -foreground grey50
	} else {
		.cboReadAdd config -state normal -foreground black
	}

	if {$Para(regout) == "0"} {
		.ckCtrlbyRdEn config -state disabled 
		set Para(CtrlByRdEn) "0"
		.ckClockEn config -state disabled
		set Para(ClockEn) 0
		.rdo1Assert config -state disabled
		.rdo2Assert config -state disabled
		.rdo1Release config -state disabled
		.rdo2Release config -state disabled
	} else {
		.ckCtrlbyRdEn config -state normal 
		.ckClockEn config -state normal
		.rdo1Assert config -state normal
		.rdo2Assert config -state normal
		if {$Para(Reset) == "Async"} {
			.rdo1Release config -state normal
			.rdo2Release config -state normal
		} else {
			.rdo1Release config -state disabled
			.rdo2Release config -state disabled
		}
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
	
	if {$Para(FIFOImp) == "LUT Based"} {
		.cboWriteAdd clear list
		.cboReadAdd clear list
		.cboWriteAdd insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192
		.cboReadAdd insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192
		if {$Para(WDepth)>8192} {set Para(WDepth) 8192}
		if {$Para(RDepth)>8192} {set Para(RDepth) 8192}
		.ckEnECC config -state disable
		set Para(EnECC) 0
	} else {
		.cboWriteAdd clear list
		.cboReadAdd clear list
		.cboWriteAdd insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384
		.cboReadAdd insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384
		if {$Para(RDepth) != $Para(WDepth) } {
			.ckEnECC config -state disable
			set Para(EnECC) 0
		} else {
			if {$Para(RWidth)>64} {
				if {$Para(EnECC) == "1"} {
					set tit "Warning"
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
	.lblPeAssert config -text "(1-$Para(RDepth))"
	.lblPeDeassert config -text "(1-$Para(RDepth))"
	.lblPfAssert config -text "(1-$Para(WDepth))"
	.lblPfDeassert config -text "(1-$Para(WDepth))"

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
	CallDrawPins
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para
	set tit "Check Parameter"
	set ret [IsInRange "Data Width of Write Port" 1 256 $Para(WWidth)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width of Read Port" 1 256 $Para(RWidth)]
	if {$ret == -1} {return -1}
	
	set ratio [expr $Para(RDepth)>$Para(WDepth)?$Para(RDepth)/$Para(WDepth):$Para(WDepth)/$Para(RDepth)]
	set msg "The ratio of the two ports cannot exceed 32."
	if {$ratio > "32"} {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}
	#27821
	if {$Para(RWidth) > 1024}  {
		set Para(bCreateSymbol) 0
	} 
	#26635
	set Para(RWidth) [string trimleft $Para(RWidth) 0]
	set Para(WWidth) [string trimleft $Para(WWidth) 0]
	set r_size [expr $Para(RDepth)*$Para(RWidth)]
	set w_size [expr $Para(WDepth)*$Para(WWidth)]
	set msg "Total value of (Depth * Width) must be the same for read set and write set ports."
	if {$r_size != $w_size}  {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 
	if {$Para(EmpFlg) == "1"} {
		if {[.entPeAssert cget -state] == "normal"} {
			set ret [IsInRange "Almost Empty Flag Assert" 1 $Para(RDepth) $Para(PeAssert)]
			if {$ret == -1} {return -1} 
		}
		if {[.entPeDeassert cget -state] == "normal"} {
			set ret [IsInRange "Almost Empty Flag Deassert" 1 $Para(RDepth) $Para(PeDeassert)]
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
	if {$Para(FullFlg) == "1"} {
		if {[.entPfAssert cget -state] == "normal"} {
			set ret [IsInRange "Almost Full Flag Assert" 1 $Para(WDepth) $Para(PfAssert)]
			if {$ret == -1} {return -1} 
		}
		if {[.entPfDeassert cget -state] == "normal"} {
			set ret [IsInRange "Almost Full Flag Deassert" 1 $Para(WDepth) $Para(PfDeassert)]
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
	set str "-arch $Para(arch) -type ebfifo -depth $Para(WDepth) -width $Para(WWidth) -rwidth $Para(RWidth)"
	if {$Para(FIFOImp) == "LUT Based"} {lappend str -pfu_fifo}

	if {$Para(regout) == "1"} {
		lappend str -regout
		lappend str -resetmode [string toupper $Para(Reset)]
		if {$Para(Reset) == "Async"} {
			lappend str -reset_rel [string toupper $Para(Reset1)]
		}
	} 
	if {$Para(CtrlByRdEn) == "0"} {lappend str -no_enable}
	if {$Para(ClockEn) == "1"} {lappend str -out_enable_0}
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
	if {$Para(Reset) == "Sync"}  {lappend str -sync_reset} 
	if {$Para(RDataCount) == "1"} {lappend str -rfill}
	if {$Para(WDataCount) == "1"} {lappend str -fill}
	if {$Para(EnECC) == "1"} {lappend str -eccmode 0}
#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
} 

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule
	
	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface
	AttributeSetting 440 300
	set pin_flag 1
	DrawImage 240 360
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***
	#--- Page #1 ---
	set page [$tnb add -label "Configuration"]

	#*** FIFO Implementation ***
	iwidgets::Labeledframe .frmFIFOImp -labeltext "FIFO Implementation" -labelpos nw
	set frmFIFOImp [.frmFIFOImp childsite]
	
	frame .frmType
	radiobutton .rdoEBROnly -text "EBR Only" -width 10 -value "EBR Only" -variable Para(FIFOImp) -anchor w -command {ChangeValueCmd}
	radiobutton .rdoEBRBased -text "EBR Based" -width 10 -value "EBR Based" -variable Para(FIFOImp) -anchor w -command {ChangeValueCmd}
	radiobutton .rdoLUT -text "LUT Based" -width 10 -value "LUT Based" -variable Para(FIFOImp) -anchor w -command {ChangeValueCmd}
	#pack .rdoEBROnly .rdoEBRBased .rdoLUT -in .frmType -side left -padx 10
	pack .rdoEBROnly .rdoLUT -in .frmType -side left -padx 10
	pack .frmType -in $frmFIFOImp -side top -fill x -anchor w
	
	frame .frmWriteData
	iwidgets::combobox .cboWriteAdd -labeltext "Write Address Depth" -labelpos w -textvariable Para(WDepth) \
		-width 10 -editable 0 -selectioncommand {ChangeValueCmd}
	iwidgets::entryfield .entData -labeltext "Data Width" -labelpos w -textvariable Para(WWidth) \
		-width 8 -validate {digit %c} -fixed 3
	.entData.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	label .lblData -text "(1-256)"
	pack .cboWriteAdd .entData .lblData -in .frmWriteData -side left -padx 6
	pack .frmWriteData -in $frmFIFOImp -side top -fill x

	frame .frmReadData
	iwidgets::combobox .cboReadAdd -labeltext "Read Address Depth" -labelpos w -textvariable Para(RDepth) \
		-width 10 -editable 0 -selectioncommand {ChangeValueCmd}
	iwidgets::entryfield .entReadData -labeltext "Data Width" -labelpos w -textvariable Para(RWidth) \
		-width 8 -validate {digit %c} -state disable
#	.entReadData.lwchildsite.entry config -validate key -vcmd {
#			after idle {ChangeValueCmd}
#			return 1
#		}
	label .lblReadDataRange -text "(1-256)"
	pack .cboReadAdd .entReadData .lblReadDataRange -in .frmReadData -side left -padx 6
	pack .frmReadData -in $frmFIFOImp -side top -fill x -pady 2

	#*** Output Register ***
	frame .frmOutReg
	checkbutton .ckEnable -text "Enable Output Register" -variable Para(regout) -command {ChangeValueCmd} -padx 10 
	checkbutton .ckCtrlbyRdEn -text "Controlled by RdEn" -variable Para(CtrlByRdEn) -command {ChangeValueCmd} -padx 30
	.ckCtrlbyRdEn config -state disabled
	checkbutton .ckClockEn -text "Enable Output ClockEn" -variable Para(ClockEn) -command {ChangeValueCmd} -padx 30
	pack .ckCtrlbyRdEn .ckClockEn -in .frmOutReg -side left -padx 10
	pack .ckEnable -in $frmFIFOImp -side top -anchor w
	pack .frmOutReg -in $frmFIFOImp -side top -fill x -padx 10
	pack .frmFIFOImp -in $page -side top -fill x

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
	label .lblPeAssert -text "(1-256)"  -anchor w 
	iwidgets::entryfield .entPeDeassert -labeltext "Deassert" -labelpos w -width 8 \
		-textvariable Para(PeDeassert) -validate {digit %c} -fixed 6 
	.entPeDeassert.label config -width 10 -anchor e -foreground black
	label .lblPeDeassert -text "(1-256)"  -anchor w 
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
	label .lblPfAssert -text "(1-256)"  -anchor w 
	iwidgets::entryfield .entPfDeassert -labeltext "Deassert" -labelpos w -width 8 \
		-textvariable Para(PfDeassert) -validate {digit %c} -fixed 6 
	.entPfDeassert.label config -width 10 -anchor e -foreground black
	label .lblPfDeassert -text "(1-256)"  -anchor w 
	pack .entPfAssert .lblPfAssert .entPfDeassert .lblPfDeassert -in .frmPf1 -side left
	
	pack .frmPe .frmPe1 .frmPf .frmPf1 -in $frmFlgCtrl -side top -anchor w -pady 2
	pack .frmFlgCtrl -in $page -side top -fill x

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
	pack .frmReset -in $page -side top -fill x -anchor center 

	#*** Data Count Options ***
	iwidgets::Labeledframe .frmDataCount -labeltext "Data Count Options" -labelpos nw
	set frmDataCount [.frmDataCount childsite]
	checkbutton .ckWDataCount -text "Data Count (Synchronized with Write Clock)" -variable Para(WDataCount)\
	-command {ChangeValueCmd} -padx 10 
	checkbutton .ckRDataCount -text "Data Count (Synchronized with Read Clock)" -variable Para(RDataCount)\
	-command {ChangeValueCmd} -padx 10 
	pack .ckWDataCount .ckRDataCount -in $frmDataCount -side top -anchor w
	pack .frmDataCount -in $page -side top -fill x 

	#26585,26586
	.cboWriteAdd insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192
	.cboReadAdd insert list end 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192
	
	checkbutton .ckEnECC -text "Enable ECC (not supported for Data Width > 64)" -variable Para(EnECC) -command {ChangeValueCmd}
	pack .ckEnECC -in $page -side top -anchor w -padx 10

	$tnb view 0

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	ChangeValueCmd

	GeneralConfig
}
