#$Header: L:/module/sin_cos_table/gui/core_template.tcl 1.7 mghuang $

#Rev 1.7: Diamond 1.3 IPExpress: Fixed cr_52960

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para pin_flag

	if {[string length $Para(pmi_dataa_width)] > 0 &&
		[string length $Para(pmi_datab_width)] > 0 &&
		[string length $Para(pmi_pipeline)] > 0} {DrawPins}
} 

proc GetTopicCB {} {
	global Para

	set Para(topic) ""
}

proc ChangeValueCmd {} {
	global Para
	
	set Para(EBR_Dev_Flag) [GetEBRDeviceFlag]
	if {$Para(EBR_Dev_Flag) == "0"} {
		.cboBlock clear list
		.cboBlock insert list end LUT
		set Para(pmi_implemenntation) LUT
	} else {
		.cboBlock clear list
		.cboBlock insert list end LUT EBR
	}
	
	if {$Para(pmi_implemenntation) == "LUT"} {
		.ckOutReg config -state disabled
		set Para(pmi_output_reg) 1
	} else {
		.ckOutReg config -state normal
	}
	
	#ISPL_CR_36599
	if {$Para(pmi_optimize_mem) == "1"} {
		.lblStage config -state normal
		.entryStage config -state normal -foreground black
		.lbl2Stage config -state normal
	} else {
		.lblStage config -state disable
		.entryStage config -state disabled -foreground gray50
		.lbl2Stage config -state disable
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
	set ret [IsInRange "Input Theta Bit Width" 3 10 $Para(pmi_dataa_width)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Output Result Bit Width" 4 32 $Para(pmi_datab_width)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "the number of pipeline stages" 1 3 $Para(pmi_pipeline)]
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

	#-type cosine -addr_width <input_width> -width <output_width> -mode DCBA

	set str "-arch $Para(arch) -type cosine "
	lappend str -addr_width $Para(pmi_dataa_width) -width $Para(pmi_datab_width)

	if {$Para(pmi_implemenntation) == "LUT"}  {lappend str -pfu}
	
	switch $Para(pmi_output_mode) {
		"Sin" {set mode 0}
		"Cos" {set mode 1}
		"Sin-Cos" {set mode 2}
		"Dynamic" {set mode 3}
	}
	if {$Para(pmi_input_reg) == "1"} {lappend str -input_reg}
	if {$Para(pmi_use_1bit) == "1"} {lappend str -input_reg;set mode [expr $mode+4]}
	lappend str -mode $mode
	if {$Para(pmi_output_reg) == "1"} {lappend str -output_reg}
	#ISPL_CR_35263 #ISPL_CR_35518 ?? #ISPL_CR_36599
	if {$Para(pmi_optimize_mem) == "1"} {
		lappend str -area
		lappend str -pipeline $Para(pmi_pipeline)
	}

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

	AttributeSetting 400 420
	set pin_flag 1
	DrawImage 220 300 
	set tnb $Para(tnb)
	
	set page [$tnb add -label "Configuration"]
	iwidgets::labeledframe .frmP1 -labeltext "" -labelpos nw
	set frmP1 [.frmP1 childsite]

	CreateLabelCombobox $frmP1 Block "Block Implementation" 20 8 Para(pmi_implemenntation) {LUT EBR} {ChangeValueCmd}
	.lblBlock config -width 26 -anchor w
	pack .frmBlock -in $frmP1 -side top -anchor w -padx 9 -pady 8

	CreateLabelEntryLabel $frmP1 WidthA "Input Theta Bit Width" 4 "(3 - 10)" "" Para(pmi_dataa_width) integer
	
	CreateLabelEntryLabel $frmP1 WidthB "Output Result Bit Width" 4 "(4 - 32)" "" Para(pmi_datab_width) integer
	
	.lblWidthA config -width 26 -anchor w
	.lblWidthB config -width 26 -anchor w

	.entryWidthA.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	.entryWidthB.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}

	CreateLabelCombobox $frmP1 Mode "Output Mode" 20 8 Para(pmi_output_mode) {Sin Cos Sin-Cos} {ChangeValueCmd}
	.lblMode config -width 26 -anchor w
	pack .frmMode -in $frmP1 -side top -anchor w -padx 9 -pady 8

	#ISPL_CR_35263
	checkbutton .ckOptMem  -text "Use Tables for Quarter-wave Only" -variable Para(pmi_optimize_mem) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	checkbutton .ck1Bit  -text "Use 1-bit for Signed Integer" -variable Para(pmi_use_1bit) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	checkbutton .ckInReg  -text "Enable Input Registers" -variable Para(pmi_input_reg) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	checkbutton .ckOutReg -text "Enable Output Registers" -variable Para(pmi_output_reg) -onvalue 1 -offvalue 0 -command {ChangeValueCmd}
	pack .ckOptMem .ck1Bit .ckInReg .ckOutReg -in $frmP1 -side top -anchor w -padx 10 -pady 2

	CreateLabelEntryLabel $frmP1 Stage "Specify the number of pipeline stages" 4 "(1 - 3)" "" Para(pmi_pipeline) integer
	.lblStage config -width 35 -anchor w
	.entryStage.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}

	#ISPL_CR_35263
	.lblStage config -state disable
	.entryStage config -state disabled -foreground gray50
	.lbl2Stage config -state disable
	
	pack .frmP1 -in $page -fill both -expand 1

	ChangeValueCmd

	$tnb view 0

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
	#set Para(topic) "sin_cos_table_tab.htm"
	#set Para(webhelp) "$Para(webhelpTop)#$Para(topic)"
}
