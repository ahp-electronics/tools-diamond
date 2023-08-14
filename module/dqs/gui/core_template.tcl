#$Header: G:/synario/lev110/module/dqs/gui/rcs/core_template.tcl 1.1 2005/08/18 03:40:45Z mghuang Exp $

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

	return 0
}

proc CreatePpFile {} {
	global Para

	set outPpFile [file join $Para(ProjectPath) $Para(ModuleName).pp]
	if [catch {open $outPpFile w} outputfile] {
		puts stderr "Cannot open file: $outPpFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outPpFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}

	puts $outputfile "#define _circuit_name  $Para(ModuleName)\n"

	puts $outputfile "#define _number_of_dqs $Para(Number)\n"
	puts $outputfile "#define _frquency_of_dqs $Para(Frequency)\n"
	puts $outputfile "#define _postamble_solution $Para(Postamble)\n"
	puts $outputfile "#define _tristate_dqs $Para(EnDQS)\n"

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		puts $outputfile "#define _lang vhdl\n"
		puts $outputfile "#include <sc_dqs.vhd>"
	}
	if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {
		puts $outputfile "#define _lang verilog\n"
		puts $outputfile "#include <sc_dqs.v>"
	}

	close $outputfile
	return 0
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para tcl_platform
	
	set ret [CheckParameterCB]
	if {$ret == -1} {return -1}

	set out_msg "\tModule Name: $Para(ModuleName)\n\tCore Type: $Para(CoreName)\n\tLPC file : $Para(ModuleName).lpc"

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] || \
	    [string equal -nocase $Para(SourceFormat) "VHDL"] || \
	    [string equal -nocase $Para(SourceFormat) "Verilog HDL"] || \
	    [string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"]} {

		set ret [CreatePpFile]
		if {$ret == -1} {return -1}
		append out_msg "\n\tPP File : $Para(ModuleName).pp"

		set oldPath [pwd]
		cd $Para(ProjectPath)
		set ppFile  "$Para(ModuleName).pp"
		set orcappFile  [GetFpscEngine]
		catch {exec $orcappFile -For5s00 $ppFile} ret
		cd $oldPath
		# send message to IP Manager
		regsub -all "\n\n\n+" $ret "\n\n" ret
		append out_msg "\n\tCommand line: $orcappFile -For5s00 $ppFile"
		append out_msg "\n\tReturn Value:"
		foreach item [split $ret "\n"] {append out_msg "\n\t$item"}

		set tmp_str [string tolower $out_msg]
		if {[string first "error" $tmp_str] == -1}  {
			append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"
		} 
	} else  {
		append out_msg "\n Only Parameter configuration file $Para(ModuleName).lpc has been created in $Para(ProjectPath)."
	} 

	return $out_msg
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	#*** set private value ***

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
	set Para(Fdir) "For5s00"
	set pin_flag orcapp
	DrawImage 250 270
	set tnb $Para(tnb)

	wm title . "ORCA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]

		iwidgets::labeledframe .frmConfig -labeltext "" -labelpos nw
		set frmConfig [.frmConfig childsite]

		iwidgets::combobox .cboNumber -labeltext "Number of DQS" -width 8 -editable false -textvariable Para(Number) -selectioncommand DrawPins
		.cboNumber.label config -width 25 -anchor w
		.cboNumber insert list end 1 2 4 8

		iwidgets::combobox .cboFreq -labeltext "Frequency of DQS(MHz)" -width 8 -editable false -textvariable Para(Frequency)
		.cboFreq.label config -width 25 -anchor w
		.cboFreq insert list end 100 133 166 200

		CreateRadioItem $frmConfig Post "DQS Postamble Solution" 24 "Yes" Yes "No" No 10 left Para(Postamble) {}
		.lblPost config -anchor w

		checkbutton .ckEnDQS  -text "DDR Tristate Enable for DQS Output" -variable Para(EnDQS) -onvalue ON -offvalue OFF -command DrawPins

		pack .cboNumber   -in $frmConfig  -anchor w -padx 30 -pady 5
		pack .cboFreq     -in $frmConfig  -anchor w -padx 30 -pady 3
		pack .frmPost     -in $frmConfig  -anchor w -padx 30 -pady 4
		pack .ckEnDQS     -in $frmConfig  -anchor w -padx 30

		pack .frmConfig -in $page -fill both -expand 1

		.cbEdif config -state disabled
		pack forget .cbIO .lblOrder .cboOrder

		$tnb view 0

	#FunctionButton
	#CenterPosition
	GeneralConfig
}