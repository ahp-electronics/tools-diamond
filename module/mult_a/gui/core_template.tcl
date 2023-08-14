#$Header: L:/module/mult_a/gui/rcs/core_template.tcl 1.23 2009/11/10 06:47:47Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

# Note: $max>0 must
proc CheckIntRanger {int min max} {
	global Para
	
	set len [string length $int]
	set min_len [string length $min]
	set max_len [string length $max]
	if {[string index $int 0] == "-"} { 
		# $i<0
		if {[string index $min 0] == "-"} {
			# $i<0 and $min<0
			if {$len > $min_len} {
				return -1
			} else {
				if {$len < $min_len} {
					return 0
				} else {
					set a [string range $int 1 [expr $len-1]]
					set b [string range $min 1 [expr $len-1]]
					if {$a>$b} {
						return -1
					}
				}
			}
		} else {
			# $i<0 and $min>0
			return -1
		}
	} else {
		# $i>0
		if {[string index $min 0] == "-"} {
			# $min<0
			if {$len > $max_len} {
				return -1
			} else {
				if {$len < $max_len} {
					return 0
				} else {
					set a [string range $int 1 $len]
					set b [string range $max 1 $len]
					if {$a>$b} {
						return -1
					}
				}
			}
		} else {
			# $min>0
			if {$len < $min_len} {
				return -1
			} else {
				if {$len == $min_len} {
					if {$int < $min} {
						return -1
					}
				} else {
					if {$len > $max_len} {
						return -1
					} else {
						if {$len < $max_len} {
							return 0
						} else {
							set a [string range $int 1 $len]
							set b [string range $max 1 $len]
							if {$a>$b} {
								return -1
							}
						}
					}
				}
			}
		}
	}
	
	return 0
}

proc CallDrawPins {}  {
	global Para pin_flag

	if {[string length $Para(pmi_dataa_width)] > 0 &&
		[string length $Para(pmi_datab_width)] > 0 &&
		[string length $Para(pmi_additional_pipeline)] > 0 &&
		[string length $Para(pmi_coeff_value)] > 0 } {DrawPins}
} 

proc GetTopicCB {} {
	global Para

	set Para(topic) ""
}

proc ChangeValueCmd {} {
	global Para

	set Para(pmi_datap_width) [expr $Para(pmi_dataa_width)+$Para(pmi_datab_width)+0]

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

	if {$Para(pmi_const_coeff) == "No"}  {
		.lblCoValue config -state disable
		.entryCoValue config -state disabled -foreground gray50
		.lbl2CoValue config -state disable
		#ISPL_CR_30410 
		.entryWidthB config -state normal -foreground black
		.lblWidthB config -state normal
		.lbl2WidthB config -state normal
		#ISPL_CR_33003
		.cboSignB config -state normal -foreground black
		.lblSignB config -state normal
		
		.ckRamMult config -state disable
		set Para(pmi_ram_mult) No
	} else  {
		.lblCoValue config -state normal
		.entryCoValue config -state normal -foreground black
		.lbl2CoValue config -state normal
		#ISPL_CR_30410 
#		.entryWidthB config -state disable -foreground gray50
#		.lblWidthB config -state disable
#		.lbl2WidthB config -state disable
		#ISPL_CR_33003
		.cboSignB config -state disabled -foreground gray50
		.lblSignB config -state disable
		set Para(pmi_signb) Signed
		
		.ckRamMult config -state normal
	} 

	#ISPL_CR_30403 | ISPL_CR_30410 | ISPL_CR_30430 | ISPL_CR_32639 , the DSP option only for ECP and ECP2/ECP2M/XP2
	.cboBlock clear list
	if {$Para(pmi_ram_mult) == "No"}  {
		if {[lsearch $Para(dsp_lst) $Para(arch)] != -1}  {
			if {$Para(pmi_implemenntation)!="DSP" && $Para(pmi_implemenntation)!="LUT"}  {set Para(pmi_implemenntation) LUT}
			.cboBlock insert list end DSP LUT	
		} else  {
			.cboBlock insert list end LUT
			set Para(pmi_implemenntation) LUT
		} 
	} else {
		if {$Para(pmi_implemenntation) == "DSP"} {set Para(pmi_implemenntation) LUT}
		set Para(EBR_Dev_Flag) [GetEBRDeviceFlag]
		if {$Para(EBR_Dev_Flag) == "0"} {
			.cboBlock insert list end LUT Auto	
		} else {
			.cboBlock insert list end LUT EBR Auto	
		}
	}

	#ISPL_CR_30459
	if {$Para(pmi_signa) == "Unsigned" && $Para(pmi_signb) == "Unsigned"}  {
		.lbl2CoValue config -text "(0 to 2^32-1)"
	} else  {
		.lbl2CoValue config -text "(-2^31 to 2^31-1)"
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
	set ret [IsInRange "Input A Width" 2 36 $Para(pmi_dataa_width)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Input B Width" 2 36 $Para(pmi_datab_width)]
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

	#ISPL_CR_30915 
	if {$Para(pmi_const_coeff) == "Yes"}  {
		if {[string length $Para(pmi_coeff_value)] == 0}  {
			set msg "Please input Constant Coefficient Value!"
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		} else {
			if {$Para(pmi_coeff_value) == "-"} {
				set msg "Please input Constant Coefficient Value!"
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
		
		if {$Para(pmi_signa) == "Unsigned" && $Para(pmi_signb) == "Unsigned"}  {
			if {[CheckIntRanger $Para(pmi_coeff_value) 2 4294967295] == -1} {
				set msg "Constant Coefficient Value should be 2 to 2^32-1"
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		} else  {
			if {[CheckIntRanger $Para(pmi_coeff_value) -2147483648 2147483647] == -1 } {
				set msg "Constant Coefficient Value should be -2^31 to 2^31-1"
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		} 
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

	set str "-arch $Para(arch) -type dspmult -simple_portname "
        set l_has_reg 0

	if {$Para(pmi_implemenntation) == "LUT"}  {lappend str -pfu_mult}
	#ISPL_CR_30835 
	if {$Para(pmi_const_coeff) == "Yes"}  {
		lappend str -value $Para(pmi_coeff_value) -widtha $Para(pmi_dataa_width) -widthb $Para(pmi_datab_width)
	} else  {
		lappend str -widtha $Para(pmi_dataa_width) -widthb $Para(pmi_datab_width) -widthp $Para(pmi_datap_width)
	} 
	
	#DSP LUT EBR Auto
	if {$Para(pmi_ram_mult) != "No"}  {
		switch $Para(pmi_implemenntation) {
			"DSP" {}
			"LUT" {lappend str -ram_mult 1}
			"EBR" {lappend str -ram_mult 2}
			"Auto" {lappend str -ram_mult 3}
		}
	}

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

	AttributeSetting 450 420
	set pin_flag 1
	DrawImage 220 300 
	set tnb $Para(tnb)

	set page [$tnb add -label "Configuration"]
	iwidgets::labeledframe .frmP1 -labeltext "" -labelpos nw
	set frmP1 [.frmP1 childsite]

	checkbutton .ckCoeff -text "Use a Constant Coefficient" -variable Para(pmi_const_coeff)	-onvalue Yes -offvalue No -command {ChangeValueCmd}
	pack .ckCoeff -in $frmP1 -side top -anchor w -padx 10 

	CreateLabelEntryLabel $frmP1 CoValue "Constant Coefficient Value" 13 "(-2^31 to 2^31-1)" "" Para(pmi_coeff_value) integer
	.lblCoValue config -width 22 -anchor w
	pack .frmCoValue -in $frmP1 -side top -anchor w -padx 30 
	.entryCoValue.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	# Usage Model Rev.3.1 
	checkbutton .ckRamMult -text "Use RAM Based Multiplier" -variable Para(pmi_ram_mult) -onvalue Yes -offvalue No -command {ChangeValueCmd}
	pack .ckRamMult -in $frmP1 -side top -anchor w -padx 30 

	CreateLabelCombobox $frmP1 Block "Block Implementation" 20 8 Para(pmi_implemenntation) {} {ChangeValueCmd}
	.lblBlock config -width 20 -anchor w
	pack .frmBlock -in $frmP1 -side top -anchor w -padx 10 -pady 8

	frame .frmWidth1
	CreateLabelEntryLabel .frmWidth1 WidthA "Input A Width" 4 "(2 - 36)" "" Para(pmi_dataa_width) integer
	CreateLabelCombobox .frmWidth1 SignA "Representation" 15 8 Para(pmi_signa) {Signed Unsigned} {ChangeValueCmd}
	pack .frmWidthA .frmSignA -in .frmWidth1 -side left
	
	frame .frmWidth2
	CreateLabelEntryLabel .frmWidth2 WidthB "Input B Width" 4 "(2 - 36)" "" Para(pmi_datab_width) integer
	CreateLabelCombobox .frmWidth2 SignB "Representation" 14 8 Para(pmi_signb) {Signed Unsigned} {ChangeValueCmd}
	pack .frmWidthB .frmSignB -in .frmWidth2 -side left
	
	CreateLabelEntryLabel $frmP1 WidthP "Product Bit Width" 4 "" "" Para(pmi_datap_width) integer
	
	pack .frmWidth1 .frmWidth2 .frmWidthP -in $frmP1 -side top -anchor w -pady 4
	
	.entryWidthP config -state disable
	.lblWidthA config -width 16 -anchor w
	.lblSignA config -width 14 -anchor w
	.lblWidthB config -width 16 -anchor w
	.lblSignB config -width 14 -anchor w
	.lblWidthP config -width 16 -anchor w

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
#	set Para(topic) "mult_arithmetic.htm"
#	set Para(webhelp) "$Para(webhelpTop)#$Para(topic)"
}
