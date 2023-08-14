#$Header: L:/module/extref/latticeecp4u/gui/core_template.tcl 1.0 mghuang Exp $

#Rev 1.0: Diamond 2.2 IPExpress: intial ver. UM rev 0.7

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para

	CreateDummyLpcFile

	DrawPins
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

	return 0
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para pin_flag

	set ret [CheckParameterCB]
	if {$ret == -1} {return -1}
	
	CreateGenerateFile
	
	set out_msg "\tModule Name: $Para(ModuleName)\n\tCore Name: $Para(CoreName)\n\tLPC file : $Para(ModuleName).lpc"
	append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"

	return $out_msg
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	set Para(DOUBLE_QUOTES_IN_LPC_flag) Enabled
	
	ProjectSet
	MainInterface
	AttributeSetting 360 320
	set pin_flag "MACO"
	DrawImage 220 300 

	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***
	set w 22
	set page [$tnb add -label "Configuration"]

	#*** EXTREFCLK ***
	iwidgets::labeledframe .frmEXTREFCLK -labeltext "EXTREFCLK" -labelpos nw
	set frmEXTREFCLK [.frmEXTREFCLK childsite]

	set EXTREFTERMRES_lst {"50 ohms" "Hi-Z ohms"}
	CreateLabelCombobox $frmEXTREFCLK EXTREFTERMRES "Termination Resistance" $w 14 Para(EXTREFTERMRES) $EXTREFTERMRES_lst {ChangeValueCmd}
	.lblEXTREFTERMRES config -anchor w
	checkbutton .cbEXTREFDCBIAS -text "DC Bias Enabled" -variable Para(EXTREFDCBIAS) -onvalue Enabled -offvalue Disabled -command {ChangeValueCmd}
	pack .cbEXTREFDCBIAS -in $frmEXTREFCLK -side top -anchor w -padx 10

	pack .frmEXTREFCLK -in $page -fill x

	GeneralConfig

	ChangeValueCmd

	pack forget .cboBusOrder 
	
	$tnb delete 0
	$tnb view 0
}