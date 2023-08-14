#$Header: L:/module/power_guard/machxo2/gui/core_template.tcl 1.1 mghuang Exp $

#Rev 1.1: 8.1p IPExpress: Fixed cr_49821

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(width)] > 0}  {
		DrawPins
	} 
} 

proc ChangeValueCmd {} {
	global Para 

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

	set Para(width) [string trimleft $Para(width) 0]

	set ret [IsInRange "Power Guard bus" 1 999 $Para(width)]
	if {$ret == "-1"} {return -1}
	
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

	set str [list -arch $Para(arch) -type power_guard -width $Para(width)]

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
	AttributeSetting 380 260
	set pin_flag 1
	DrawImage 200 200
	set tnb $Para(tnb)

	wm title . "Lattice FPGA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]
	iwidgets::Labeledframe .frmConfig ;
	set frmConfig [.frmConfig childsite]

	label .lblWidth -text "Specify the width of the $Para(CoreName) bus: "
	pack .lblWidth -in $frmConfig -side top -anchor w -padx 20 -pady 8
	
	iwidgets::entryfield .entWidth -labeltext "(1 - 999)" -textvariable Para(width) -labelpos e -width 8 -validate {digit %c} -fixed 3
	.entWidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	pack .entWidth -in $frmConfig -side top
	
	label .lblNote -text "Note: Enable logic must be the same for all\nIOs with Power Guard in a bank." -justify left
	pack .lblNote -in $frmConfig -side top -anchor w -padx 20 -pady 8

	pack .frmConfig -in $page -side top -fill both -expand 1

	$tnb view 0
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}
