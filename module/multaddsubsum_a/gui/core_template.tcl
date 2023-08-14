#$Header: L:/module/multaddsubsum_a/gui/rcs/core_template.tcl 1.16 2009/11/10 06:47:48Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para pin_flag

	if {[string length $Para(pmi_dataa_width)] > 0 &&
		[string length $Para(pmi_datab_width)] > 0 &&
		[string length $Para(pmi_additional_pipeline)] > 0 } {DrawPins}
} 

proc GetTopicCB {} {
	global Para

	set Para(topic) ""
}

proc ChangeValueCmd {} {
	global Para

	set Para(pmi_datap_width) [expr $Para(pmi_dataa_width)+$Para(pmi_datab_width) + 2]

	if {[string length $Para(pmi_dataa_width)] > 0 &&
		[string length $Para(pmi_datab_width)] > 0} {
		#set tmp [expr $Para(pmi_dataa_width)>=$Para(pmi_datab_width)?$Para(pmi_dataa_width):$Para(pmi_datab_width)]
		if {$Para(pmi_dataa_width)>=$Para(pmi_datab_width)} {
			set tmp $Para(pmi_dataa_width)
		} else {
			set tmp $Para(pmi_datab_width)
		}
		if {$Para(pmi_implemenntation) == "DSP"}  {
			.lbl2Stage config -text "(0 to 3)"
		} else  {
			#ISPL_CR_31370
			.lbl2Stage config -text "(0 - $tmp)"
		} 
	}

	#ISPL_CR_33179 
	if {$Para(arch) == "ep5g00p" && $Para(pmi_implemenntation) == "DSP"} {
		set Para(pmi_signb) $Para(pmi_signa)
		.cboSignB config -state disabled
	} else {
		.cboSignB config -state normal
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
	set ret [IsInRange "Input A0/A1/A2/A3 Width" 2 36 $Para(pmi_dataa_width)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Input B0/B1/B2/B3 Width" 2 36 $Para(pmi_datab_width)]
	if {$ret == "-1"} {return -1}

	if {$Para(pmi_implemenntation) == "DSP"}  {
#		set ret [IsInList "the Number of Pipeline Stages" {0 1} $Para(pmi_additional_pipeline)]
		set ret [IsInRange "the Number of Pipeline Stages" 0 3 $Para(pmi_additional_pipeline)]
		if {$ret == "-1"} {return -1}
	} else  {
		#ISPL_CR_31370
		set tmp [expr $Para(pmi_dataa_width)>=$Para(pmi_datab_width)?$Para(pmi_dataa_width):$Para(pmi_datab_width)]
		set ret [IsInRange "the Number of Pipeline Stages" 0 $tmp $Para(pmi_additional_pipeline)]
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

	set str "-arch $Para(arch) -type dspmaddsum -simple_portname"
        set l_has_reg 0

	if {$Para(pmi_implemenntation) == "LUT"}  {lappend str -pfu_mult -pfu_add -pfu_sum}

	lappend str -m$Para(pmi_operation0)0 -m$Para(pmi_operation1)1
	lappend str -widtha $Para(pmi_dataa_width) -widthb $Para(pmi_datab_width) -widthsum $Para(pmi_datap_width)

	switch $Para(pmi_signa) {
	    "Unsigned" {
			switch $Para(pmi_signb)  {
				"Unsigned" {}
				"Signed"   {lappend str -signed -unsigneda}
			} 
		}
	    "Signed"   {
			switch $Para(pmi_signb)  {
				"Unsigned" {lappend str -signed -unsignedb}
				"Signed"   {lappend str -signed}
			} 
		}
	}
	lappend str -PL_stages $Para(pmi_additional_pipeline)

	if {$Para(pmi_input_reg) == "Yes"}  {lappend str -input_reg; set l_has_reg 1} 
	if {$Para(pmi_output_reg) == "Yes"}  {lappend str -output_reg; set l_has_reg 1} 
	if {$Para(pmi_additional_pipeline) > 0} {set l_has_reg 1}

	if {$l_has_reg == 1} {lappend str -clk0 -ce0 -rst0}
#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit
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

	AttributeSetting 500 420
	set pin_flag 1
	DrawImage 220 360 
	set tnb $Para(tnb)

	set page [$tnb add -label "Configuration"]
	iwidgets::labeledframe .frmP1 -labeltext "" -labelpos nw
	set frmP1 [.frmP1 childsite]

	CreateLabelCombobox $frmP1 Block "Block Implementation" 20 8 Para(pmi_implemenntation) {} {ChangeValueCmd}
	.lblBlock config -width 20 -anchor w
	pack .frmBlock -in $frmP1 -side top -anchor w -padx 10 -pady 8
	#ISPL_CR_30403 | ISPL_CR_30410 | ISPL_CR_30430, the DSP option only for ECP and ECP2
	if {[lsearch $Para(dsp_lst) $Para(arch)] != -1}  {
		.cboBlock insert list end DSP LUT	
	} else  {
		.cboBlock insert list end LUT	
	} 

	CreateRadioItem $frmP1 Operation0 "Add/Sub 0 Operation" 8 Add add Sub sub 6 left Para(pmi_operation0) {ChangeValueCmd}
	.lblOperation0 config -width 20 -anchor w
	pack .frmOperation0 -in $frmP1 -side top -anchor w -padx 10

	CreateRadioItem $frmP1 Operation1 "Add/Sub 1 Operation" 8 Add add Sub sub 6 left Para(pmi_operation1) {ChangeValueCmd}
	.lblOperation1 config -width 20 -anchor w
	pack .frmOperation1 -in $frmP1 -side top -anchor w -padx 10

	frame .frmWidth1
	CreateLabelEntryLabel .frmWidth1 WidthA "Input A0/A1/A2/A3 Width" 4 "(2 - 36)" "" Para(pmi_dataa_width) integer
	CreateLabelCombobox .frmWidth1 SignA "Representation" 15 8 Para(pmi_signa) {Signed Unsigned} {ChangeValueCmd}
	pack .frmWidthA .frmSignA -in .frmWidth1 -side left
	
	frame .frmWidth2
	CreateLabelEntryLabel .frmWidth2 WidthB "Input B0/B1/B2/B3 Width" 4 "(2 - 36)" "" Para(pmi_datab_width) integer
	CreateLabelCombobox .frmWidth2 SignB "Representation" 14 8 Para(pmi_signb) {Signed Unsigned} {ChangeValueCmd}
	pack .frmWidthB .frmSignB -in .frmWidth2 -side left
	
	CreateLabelEntryLabel $frmP1 WidthP "Product Bit Width" 4 "" "" Para(pmi_datap_width) integer
	
	pack .frmWidth1 .frmWidth2 .frmWidthP -in $frmP1 -side top -anchor w -pady 4
	
	.entryWidthP config -state disable
	.lblWidthA config -width 24 -anchor w
	.lblSignA config -width 14 -anchor w
	.lblWidthB config -width 24 -anchor w
	.lblSignB config -width 14 -anchor w
	.lblWidthP config -width 24 -anchor w

	.entryWidthA.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	.entryWidthB.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}

	CreateLabelEntryLabel $frmP1 Stage "Specify the Number of Pipeline Stages" 4 "" "" Para(pmi_additional_pipeline) integer
	.lblStage config -width 35 -anchor w
	pack .frmStage -in $frmP1 -side top -anchor w -padx 10 -pady 8
	.entryStage.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}

	checkbutton .ckInReg  -text "Enable Input Registers" -variable Para(pmi_input_reg) -onvalue Yes -offvalue No -command {ChangeValueCmd}
	checkbutton .ckOutReg -text "Enable Output Registers" -variable Para(pmi_output_reg) -onvalue Yes -offvalue No -command {ChangeValueCmd}
	pack .ckInReg .ckOutReg -in $frmP1 -side top -anchor w -padx 10 -pady 2

	pack .frmP1 -in $page -fill both -expand 1

	ChangeValueCmd

	$tnb view 0

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
#	set Para(topic) "multaddsubsum_arithmetic.htm"
#	set Para(webhelp) "$Para(webhelpTop)#$Para(topic)"
}
