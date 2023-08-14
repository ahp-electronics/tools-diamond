#$Header: L:/module/barrel_shifter/gui/rcs/core_template.tcl 1.3 2009/01/15 06:15:56Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para pin_flag

	if {[string length $Para(width)] > 0 &&
		[string length $Para(num_input)] > 0} {DrawPins}
} 

proc GetTopicCB {} {
	global Para

	set Para(topic) "barrel_shifter.htm"
}

proc ChangeValueCmd {} {
	global Para
	

	#1. The ¡°Sign Extension¡± option is applicable only when ¡°Shift Direction = Right¡±.
	if {$Para(Direction) == 0} {
		.cboType clear list
		.cboType insert list end "Zero Insert" "Sign Extension" Rotate
	} else {
		.cboType clear list
		.cboType insert list end "Zero Insert" Rotate
		if {$Para(Type) == "Sign Extension"} {set Para(Type) "Zero Insert"}
	}
	
	#2. If ¡°Type = Rotate¡± the ¡°Data Width¡± range should be 2 ¨C 32.
	#3. If ¡°Type = Rotate¡± the ¡°Maximum Number of Shifts¡± range should be 1 ¨C 31.
	if {$Para(Type) == "Rotate"} {
		set a 2
		set b 32
		set x 1
		#set y 31
	} else {
		set a 2
		set b 40
		set x 1
	}
	set y [expr $Para(width)-1]
	.lbl2width config -text "($a - $b)"
	.lbl2num_input config -text "($x - $y)"
	
	#4. The same clock (CLK), clock enable (CE) and reset (RST) are applicable for all the enabled registers.
	#If (¡°Enable Input Register = DISABLED¡± and ¡°Enable Pipeline Register = DISABLED¡± and ¡°Enable
	#Output Register = DISABLED¡±): Do not provide CLK, CE and RST ports in the top-level port list; The
	#¡°Reset Mode¡± option is not applicable and should be grayed out.
	if {$Para(input_reg) == 0 && $Para(output_reg) == 0 && $Para(pipeline) == 0} {
		.rdo1resetmode config -state disabled
		.rdo2resetmode config -state disabled
		.lblresetmode config -state disabled
	} else {
		.rdo1resetmode config -state normal
		.rdo2resetmode config -state normal
		.lblresetmode config -state normal
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
	
	set tit "Check Parameter"

	if {$Para(Type) == "Rotate"} {
		set a 2
		set b 32
		set x 1
		#set y 31
	} else {
		set a 2
		set b 40
		set x 1
	}
	set y [expr $Para(width)-1]

	set ret [IsInRange "Data Width" $a $b $Para(width)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Maximum Number of Shifts" $x $y $Para(num_input)]
	if {$ret == "-1"} {return -1}

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

	#scuba -w [scuba_options] -arch ep5c00 -type barrel_shifter -width <w> -max_shift <n> -mode <m> -dir <d>
	set str "-arch $Para(arch) -type barrel_shifter "
	lappend str -width $Para(width) -max_shift $Para(num_input) -dir $Para(Direction)
	if {$Para(Type) == "Zero Insert"} {
		set mode 0
	}
	if {$Para(Type) == "Sign Extension"} {
		set mode 1
	}
	if {$Para(Type) == "Rotate"} {
		set mode 2
	}
	lappend str -mode $mode

	if {$Para(input_reg) == "1"} {lappend str -input_reg}
	if {$Para(output_reg) == "1"} {lappend str -output_reg}
	lappend str -resetmode $Para(resetmode) -pipeline $Para(pipeline)

#	lappend str -mode $Para(pmi_optimize_mem)$block$Para(pmi_output_reg)$mode
	#tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
	#exit
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
	ProjectSet
	MainInterface

	AttributeSetting 400 340
	set pin_flag 1
	DrawImage 220 280 
	set tnb $Para(tnb)
	
	set page [$tnb add -label "Configuration"]
	iwidgets::labeledframe .frmP1 -labeltext "" -labelpos nw
	set frmP1 [.frmP1 childsite]

	CreateRadioItem $frmP1 Direction "Shift Direction" 24 Left 1 Right 0 8 left Para(Direction) {ChangeValueCmd}
	.lblDirection config -anchor w

	CreateLabelCombobox $frmP1 Type "Type" 26 16 Para(Type) {"Zero Insert" "Sign Extension" Rotate} {ChangeValueCmd}
	.lblType config -anchor w

	CreateLabelEntryLabel $frmP1 width "Data Width" 4 "(2 - 40)" "" Para(width) integer
	
	set x [expr $Para(width)-1]
	CreateLabelEntryLabel $frmP1 num_input "Maximum Number of Shifts" 4 "(1 - $x)" "" Para(num_input) integer
	
	.lblwidth config -width 26 -anchor w
	.lblnum_input config -width 26 -anchor w

	.entrywidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	.entrynum_input.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}

	CreateRadioItem $frmP1 resetmode "Reset Mode" 24 Sync SYNC Async ASYNC 8 left Para(resetmode) {ChangeValueCmd}
	.lblresetmode config -anchor w

	checkbutton .ckinput_reg  -text "Enable Input Register" -variable Para(input_reg) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	checkbutton .ckpipeline  -text "Enable Pipeline Register" -variable Para(pipeline) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	checkbutton .ckoutput_reg  -text "Enable Output Register" -variable Para(output_reg) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	pack .frmDirection .frmType .frmwidth .frmnum_input .frmresetmode .ckinput_reg .ckpipeline .ckoutput_reg -in $frmP1 -side top -anchor w -padx 10 -pady 4

	pack .frmP1 -in $page -fill both -expand 1

	ChangeValueCmd

	$tnb view 0

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}
