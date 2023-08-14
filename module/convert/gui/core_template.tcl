#$Header: L:/module/convert/gui/rcs/core_template.tcl 1.4 2006/08/17 06:09:22Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(InputWidth)] > 0 &&
		[string length $Para(InputBinary)] > 0 &&
		[string length $Para(OutWidth)] > 0 &&
		[string length $Para(OutBinary)] > 0 }  {
		DrawPins
	} 
} 

proc ChangeValueCmd {} {
	global Para
	
	#ISPL_CR_32619
	set in_width $Para(InputWidth)
	set out_width $Para(OutWidth)
	if {$Para(InputSign) == "Signed"} {
		set in_width [expr $Para(InputWidth)-1]
	}
	.lbl2InputBinary config -text "(0-$in_width)"
	if {$Para(OutSign) == "Signed"} {
		set out_width [expr $Para(OutWidth)-1]
	}
	.lbl2OutBinary config -text "(0-$out_width)"
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

	set in_width $Para(InputWidth)
	set out_width $Para(OutWidth)
	if {$Para(InputSign) == "Signed"} {
		set in_width [expr $Para(InputWidth)-1]
	}
	.lbl2InputBinary config -text "(0-$in_width)"
	if {$Para(OutSign) == "Signed"} {
		set out_width [expr $Para(OutWidth)-1]
	}
	set ret [IsInRange "Input Width" 1 256 $Para(InputWidth)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Input Binary" 0 $in_width $Para(InputBinary)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Output Width" 1 256 $Para(OutWidth)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Output Binary" 0 $out_width $Para(OutBinary)]
	if {$ret == "-1"} {return -1}

	return 0
}

proc GeneralCmdLine {} {
	global Para
		
	if {$Para(OutRounding) =="Truncate"}     {set rval 0}
	if {$Para(OutRounding) =="Nearest"}     {set rval 1}
	if {$Para(OutRounding) =="Convergent"}     {set rval 2}

	if {$Para(OutSaturate) =="Min_Max"}     {set tval 0}
	if {$Para(OutSaturate) =="Wrap"}     {set tval 1}
	
	set str [list -arch $Para(arch) -type convert -width $Para(InputWidth) -bp_i $Para(InputBinary)]
	if {$Para(InputSign) =="Signed"}     {lappend str -signed}

	lappend str -widtho $Para(OutWidth) -bp_o $Para(OutBinary) -round $rval -sat $tval
	if {$Para(OutSign) =="Signed"}     {lappend str -signed_o}

	#if {$Para(Register) =="TRUE"}     {lappend str -output_reg}
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
		EC_CMD  -
		SC_CMD  -
		default {set str [GeneralCmdLine]}
	} 

	return $str
}

proc Create_Image {} {
	global Para diagram tnb tcl_platform pin_flag ft 

	package require OrcaModule

	#*** set private value ***

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	global pin_flag

	ProjectSet
	MainInterface
	AttributeSetting 330 360
	set pin_flag 1
	DrawImage 200 300
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***
	set page [$tnb add -label "Configuration"]
	iwidgets::Labeledframe .frmProperties ;
	set frmProperty [.frmProperties childsite]
	
	#**** Input ****
	iwidgets::Labeledframe .frmInput -labeltext "Input" -labelpos nw
	set frmInput [.frmInput childsite]
	CreateLabelEntryLabel $frmInput InputWidth "Width" 8 "(1 - 256)" "" Para(InputWidth) integer
	CreateLabelEntryLabel $frmInput InputBinary "Binary Point" 8 "(0 - 8)" "" Para(InputBinary) integer
	CreateLabelCombobox $frmInput InputSign "Sign" 16 10 Para(InputSign) {Signed Unsigned} {ChangeValueCmd}
	pack .frmInput -in $frmProperty -side top -fill x
	
	.lblInputWidth config -width 16 -anchor w
	.lblInputBinary config -width 16 -anchor w
	.lblInputSign config -width 16 -anchor w

	.entryInputWidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	.entryInputBinary.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	
	#**** Output ****
	iwidgets::Labeledframe .frmOutput -labeltext "Output" -labelpos nw
	set frmOutput [.frmOutput childsite]
	CreateLabelEntryLabel $frmOutput OutWidth "Width" 8 "(1 - 256)" "" Para(OutWidth) integer
	CreateLabelEntryLabel $frmOutput OutBinary "Binary Point" 8 "(0 - 8)" "" Para(OutBinary) integer
	CreateLabelCombobox $frmOutput OutSign "Sign" 16 10 Para(OutSign) {Signed Unsigned} {ChangeValueCmd}
	CreateLabelCombobox $frmOutput OutRounding "Rounding" 16 10 Para(OutRounding) {Truncate Nearest Convergent} {ChangeValueCmd}
	CreateLabelCombobox $frmOutput OutSaturate "Saturate" 16 10 Para(OutSaturate) {Wrap Min_Max} {ChangeValueCmd}
	pack .frmOutput -in $frmProperty -side top -fill x

	.lblOutWidth config -width 16 -anchor w
	.lblOutBinary config -width 16 -anchor w
	.lblOutSign config -width 16 -anchor w
	.lblOutRounding config -width 16 -anchor w
	.lblOutSaturate config -width 16 -anchor w
	
	.entryOutWidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	.entryOutBinary.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}

	#ISPL_CR_32502 
#	checkbutton .ckRegister -text "Enable Output Register" -variable Para(Register) -command {ChangeValueCmd} \
#		-onvalue TRUE -offvalue FALSE
#	pack .ckRegister -in $frmProperty -side top -anchor w -padx 15

	pack .frmProperties -in $page -side top -fill both -expand 1

	$tnb view 0
	ChangeValueCmd
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
	#ISPL_CR_33520 
	pack forget .cboBusOrder
}
