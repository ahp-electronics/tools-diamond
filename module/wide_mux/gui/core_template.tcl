#$Header: L:/module/wide_mux/gui/rcs/core_template.tcl 1.2 2008/10/20 02:48:35Z mghuang Exp $
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

	set Para(topic) "wide_mux.htm"
}

proc ChangeValueCmd {} {
	global Para
	
	#1
	if {$Para(pipeline) == 1} {
		.ckoutput_reg config -state disabled
		set Para(output_reg) 1
	} else {
		.ckoutput_reg config -state normal
	}
	
	#4
	if {$Para(input_reg) == 0 && $Para(output_reg) == 0} {
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
	set ret [IsInRange "Width" 2 36 $Para(width)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Number of Inputs" 2 18 $Para(num_input)]
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

	#wide_mux -width <w> -num_input <n> -input_reg -output_reg -pipeline 1 <other scuba options>
	set str "-arch $Para(arch) -type wide_mux "
	lappend str -width $Para(width) -num_input $Para(num_input)

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

	AttributeSetting 400 320
	set pin_flag 1
	DrawImage 220 280 
	set tnb $Para(tnb)
	
	set page [$tnb add -label "Configuration"]
	iwidgets::labeledframe .frmP1 -labeltext "" -labelpos nw
	set frmP1 [.frmP1 childsite]

	CreateLabelEntryLabel $frmP1 width "Width" 4 "(2 - 36)" "" Para(width) integer
	
	CreateLabelEntryLabel $frmP1 num_input "Number of Inputs" 4 "(2 - 18)" "" Para(num_input) integer
	
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

#	frame .frmReset
#	label .lblReset -text "Reset Mode" -width 14 -anchor w
#	radiobutton .rdo1Reset -text Sync -width 8 -value SYNC -variable Para(resetmode) -anchor w -command {ChangeValueCmd}
#	radiobutton .rdo2Reset -text Async  -width 8 -value ASYNC  -variable Para(resetmode) -anchor w -command {ChangeValueCmd}
#	pack .lblReset .rdo1Reset .rdo2Reset -in .frmReset -side left
#	pack .frmReset -in $frmP1 -side top -anchor w -padx 20 -pady 4

	checkbutton .ckpipeline  -text "Enable Fully Pipelined Mode" -variable Para(pipeline) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	checkbutton .ckinput_reg  -text "Enable Input Register" -variable Para(input_reg) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	checkbutton .ckoutput_reg  -text "Enable Output Register" -variable Para(output_reg) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	pack .frmwidth .frmnum_input .frmresetmode .ckpipeline .ckinput_reg .ckoutput_reg -in $frmP1 -side top -anchor w -padx 10 -pady 4

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
