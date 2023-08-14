#$Header: L:/module/fft_butterfly/gui/core_template.tcl 1.14 mghuang Exp $

#Rev 1.14: Diamond 3.0 IPExpress: Fixed SOF-117008
#Rev 1.13: Diamond 2.2 IPExpress: Fixed SOF-115181
#Rev 1.12: Diamond 2.1 IPExpress: Fixed cr_58507.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para pin_flag

	if {[string length $Para(pmi_dataa_width)] > 0 &&
		[string length $Para(pmi_datab_width)] > 0 &&
		[string length $Para(pmi_additional_pipeline)] > 0} {DrawPins}
} 

proc GetTopicCB {} {
	global Para

	set Para(topic) ""
}

proc ChangeValueCmd {} {
	global Para
	
	set width ""
	#if {$Para(pmi_dataa_width) == "-"} {set $Para(pmi_dataa_width) 0}
	#if {$Para(pmi_datab_width) == "-"} {set $Para(pmi_datab_width) 0}
	
	if {[string length $Para(pmi_dataa_width)] > 0 &&
		[string length $Para(pmi_datab_width)] > 0 } {
		set width [expr $Para(pmi_dataa_width)<$Para(pmi_datab_width)?$Para(pmi_dataa_width):$Para(pmi_datab_width)]
		set width [expr $width + 1]
		#.lbl2Stage config -text "(0 - $width)"
		set Para(stages_width) $width
		
		if {$Para(pmi_output_mode) == "Radix-2 DIT" ||
			$Para(pmi_output_mode) == "Radix-2 DIF"} {
			set Para(pmi_output_width) [expr $Para(pmi_dataa_width)+$Para(pmi_datab_width)]
		} 
		if {$Para(pmi_output_mode) == "Radix-4 DIT" ||
			$Para(pmi_output_mode) == "Radix-4 DIF"} {
			set Para(pmi_output_width) [expr $Para(pmi_dataa_width)+$Para(pmi_datab_width)+1]
		} 
	}
	
	#tk_messageBox -default ok -icon warning -message $Para(arch) -title "Para(arch)" -type ok
	if {[lsearch $Para(dsp_lst) $Para(arch)] != -1}  {
		.ckUseDsp config -state normal
		if {$Para(pmi_use_dsp) == "0"}  {
			.lbl2Stage config -text "(0 - $width)"
		} else {
			.lbl2Stage config -text "(0 - 4)"
		}
	} else {
		.ckUseDsp config -state disabled
		set Para(pmi_use_dsp) 0
		.lbl2Stage config -text "(0 - $width)"
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
	set ret [IsInRange "Input Data Bit Width" 2 32 $Para(pmi_dataa_width)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Twiddle Factor Bit Width" 2 32 $Para(pmi_datab_width)]
	if {$ret == "-1"} {return -1}
	#set ret [IsInRange "the Number of Pipeline Stages" 0 $Para(stages_width) $Para(pmi_additional_pipeline)]
	#if {$ret == "-1"} {return -1}

	if {[lsearch $Para(dsp_lst) $Para(arch)] != -1}  {
		if {$Para(pmi_use_dsp) == "0"}  {
			set ret [IsInRange "the Number of Pipeline Stages" 0 $Para(stages_width) $Para(pmi_additional_pipeline)]
			if {$ret == "-1"} {return -1}
		} else {
			set ret [IsInRange "the Number of Pipeline Stages" 0 4 $Para(pmi_additional_pipeline)]
			if {$ret == "-1"} {return -1}
		}
	} else {
		set ret [IsInRange "the Number of Pipeline Stages" 0 $Para(stages_width) $Para(pmi_additional_pipeline)]
		if {$ret == "-1"} {return -1}
	}

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

	set str "-arch $Para(arch) -type butterfly "
	lappend str -addr_width $Para(pmi_datab_width) -width $Para(pmi_dataa_width) -rdata_width $Para(pmi_output_width)

	#if {$Para(pmi_implemenntation) == "LUT"}  {lappend str -pfu}
	switch $Para(pmi_output_mode) {
		"Radix-2 DIT" {set mode 0}
		"Radix-2 DIF" {set mode 1}
		"Radix-4 DIT" {set mode 2}
		"Radix-4 DIF" {set mode 3}
	}
	if {$Para(pmi_complex_no) == "0"}  {
		#if {$Para(CmdLine) != "SC_CMD"} {lappend str -real}
		set mode [expr $mode+32]
	}
	lappend str -mode $mode
	
	if {$Para(pmi_input_reg) == "1"} {lappend str -input_reg}
	if {$Para(pmi_output_reg) == "1"} {lappend str -output_reg}
	
	if {[lsearch $Para(dsp_lst) $Para(arch)] == -1} {
		lappend str -pfu
	} else {
		if {$Para(pmi_use_dsp) == "0"}  {lappend str -pfu}
	}
	lappend str -pipeline $Para(pmi_additional_pipeline)

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

	AttributeSetting 400 420
	set pin_flag 1
	DrawImage 250 300 
	set tnb $Para(tnb)
	
	set page [$tnb add -label "Configuration"]
	iwidgets::labeledframe .frmP1 -labeltext "" -labelpos nw
	set frmP1 [.frmP1 childsite]

	CreateLabelCombobox $frmP1 Mode "FFT Butterfly Mode" 20 14 Para(pmi_output_mode) {"Radix-2 DIT" "Radix-2 DIF" "Radix-4 DIT" "Radix-4 DIF"} {ChangeValueCmd}
	.lblMode config -width 26 -anchor w
	pack .frmMode -in $frmP1 -side top -anchor w -padx 8 -pady 8

	#checkbutton .ckInMult -text "Include Multiplier" -variable Para(pmi_include_mult) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	#pack .ckInMult -in $frmP1 -side top -anchor w -padx 8 -pady 2

	checkbutton .ckUseDsp -text "Use DSP Block" -variable Para(pmi_use_dsp) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	pack .ckUseDsp -in $frmP1 -side top -anchor w -padx 8 -pady 2
	
	checkbutton .ckComplexNo -text "Treat Inputs as Complex Numbers" -variable Para(pmi_complex_no) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	pack .ckComplexNo -in $frmP1 -side top -anchor w -padx 8 -pady 2

	CreateLabelEntryLabel $frmP1 WidthA "Input Data Bit Width" 4 "(2 - 32)" "" Para(pmi_dataa_width) {digit %c}
	
	CreateLabelEntryLabel $frmP1 WidthB "Twiddle Factor Bit Width" 4 "(2 - 32)" "" Para(pmi_datab_width) {digit %c}
	
	CreateLabelEntryLabel $frmP1 Output "Output Bit Width" 4 "" "" Para(pmi_output_width) integer
	
	.lblWidthA config -width 32 -anchor w
	.lblWidthB config -width 32 -anchor w
	.lblOutput config -width 32 -anchor w
	.entryOutput config -state disabled

	.entryWidthA.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	.entryWidthB.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}

	CreateLabelEntryLabel $frmP1 Stage "Specify the Number of Pipeline Stages" 4 "(0 - 8)" "" Para(pmi_additional_pipeline) integer
	.lblStage config -width 32 -anchor w
	pack .frmStage -in $frmP1 -side top -anchor w -padx 8 -pady 8

	.entryStage.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	
	checkbutton .ckInReg  -text "Enable Input Registers" -variable Para(pmi_input_reg) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	checkbutton .ckOutReg -text "Enable Output Registers" -variable Para(pmi_output_reg) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	pack .ckInReg .ckOutReg -in $frmP1 -side top -anchor w -padx 8 -pady 2

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
