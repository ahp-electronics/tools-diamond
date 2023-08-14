#$Header: L:/module/ddr_generic/gui/rcs/core_template.tcl 1.3 2005/12/12 08:16:31Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc ChangeValueCmd {} {
	global Para pin_flag in_pins out_pins

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

	#28609
	set ret [IsInRange "DDR Data Width" 1 64 $Para(Width)]
	if {$ret == -1} {return -1}

	return 0
}

proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
}

# Command Line for LatticeEC device
proc LatticeECCmd {}  {
	global Para

	set str "-arch $Para(arch)"
#	lappend str -device $Para(PartType)
	lappend str -type iol
	lappend str -width $Para(Width)
	lappend str -mode $Para(OutReg)

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
		EC_CMD  {set str [LatticeECCmd]}
		default {set str [GeneralCmd  ]}
	}

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {

	global Para diagram tnb tcl_platform pin_flag
	#*** set private value ***

	package require OrcaModule

	#set source_file [file join $Para(TemplateDir) core_template.tcl]
	#source $source_file

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface


	switch $tcl_platform(platform) {
		windows {AttributeSetting 410 280}
		unix    {AttributeSetting 420 280}
	}
	set tnb $Para(tnb)

	set pin_flag 1
	DrawImage 220 300 

	wm title . "ORCA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]

	    iwidgets::labeledframe .frmConfig -labeltext "" -labelpos nw
		set frmConfig [.frmConfig childsite]

		iwidgets::combobox .cboWidth -labeltext "DDR Data Width" -width 8 -editable true -textvariable Para(Width) -selectioncommand {DrawPins}
		.cboWidth.label config -width 25 -anchor w
		for { set i 1 } {$i < 65} {incr i} {.cboWidth insert list end $i}

		checkbutton .ckOutReg -text "Tristate Enable for DDR Data Output Registers" -variable Para(OutReg) -onvalue tri -offvalue out -command DrawPins

		pack .cboWidth  -in $frmConfig  -anchor w -padx 30 -pady 8
		pack .ckOutReg  -in $frmConfig  -anchor w -padx 30 -pady 8

		pack .frmConfig -in $page -fill both -expand 1

		.cbEdif config -state disabled

		#23436
		pack forget .cbIO

		$tnb delete 0

		$tnb view 0

	#FunctionButton
	#CenterPosition
	GeneralConfig
}