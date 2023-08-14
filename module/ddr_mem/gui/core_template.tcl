#$Header: G:/synario/lev110/module/ddr_mem/gui/rcs/core_template.tcl 1.1 2005/08/18 03:39:15Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc ChangeWidthCmd {}  {
	global Para
	set Para(Number) [expr $Para(Width)/8]
} 

proc ChangeDqsCmd {}  {
	global Para
	set Para(Width) [expr $Para(Number)*8]
} 

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

	if {$Para(arch) == "ep5g00"} {
		if {$Para(Family) == "ep5g00p"} {
			puts $outputfile "#define _ecp  1\n"
		} else  {
			puts $outputfile "#define _ec  1\n"
		} 
	}
	if {$Para(arch) == "mg5g00"} {
		puts $outputfile "#define _xp  1\n"
	}
	puts $outputfile "#define _circuit_name  $Para(ModuleName)\n"

	puts $outputfile "#define _io_buffer_config $Para(IO_buffer)\n"
	puts $outputfile "#define _ddr_data_width $Para(Width)\n"
	puts $outputfile "#define _number_of_dqs $Para(Number)\n"
	puts $outputfile "#define _frquency_of_dqs $Para(Frequency)\n"
#	puts $outputfile "#define _dqs_phase_shift_step $Para(Step)\n"
#	puts $outputfile "#define _phase_shift_direction $Para(Direction)\n"
	puts $outputfile "#define _lock_jitter_sensitivity $Para(Sensitivity)\n"
	puts $outputfile "#define _lsr_for_ddr_inreg $Para(LSRInReg)\n"
	puts $outputfile "#define _clock_en_ddr_inreg $Para(InReg)\n"
	puts $outputfile "#define _tristate_data_outreg $Para(OutReg)\n"
	puts $outputfile "#define _tristate_dqs $Para(EnDQS)\n"

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		puts $outputfile "#define _lang vhdl\n"
		puts $outputfile "#include <ec_dqs.vhd>"
	}
	if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {
		puts $outputfile "#define _lang verilog\n"
		puts $outputfile "#include <ec_dqs.v>"
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
	    [string equal -nocase $Para(SourceFormat) "Verilog HDL"] || \
	    [string equal -nocase $Para(SourceFormat) "VHDL"] || \
	    [string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"]} {

		set ret [CreatePpFile]
		if {$ret == -1} {return -1}
		append out_msg "\n\tPP File : $Para(ModuleName).pp"

		set oldPath [pwd]
		cd $Para(ProjectPath)
		set ppFile  "$Para(ModuleName).pp"
		set orcappFile  [GetFpscEngine]
		catch {exec $orcappFile -Fep5g00 -D_dqs_phase_shift_step=0 -D_phase_shift_direction=PLUS $ppFile} ret
		#catch {exec $orcappFile -Fep5g00 $ppFile} ret
		cd $oldPath
		# send message to IP Manager
		regsub -all "\n\n\n+" $ret "\n\n" ret
		append out_msg "\n\tCommand line: $orcappFile -Fep5g00 $ppFile"
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
		windows {AttributeSetting 410 380}
		unix    {AttributeSetting 420 380}
	}
	set Para(Fdir) "Fep5g00"
	set pin_flag orcapp
	DrawImage 250 350
	set tnb $Para(tnb)

	wm title . "ORCA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]

		iwidgets::labeledframe .frmConfig -labeltext "" -labelpos nw
		set frmConfig [.frmConfig childsite]

		CreateRadioItem $frmConfig IO "I/O Buffer Configuration" 24 "SSTL25_I" SSTL25_I "SSTL25_II" SSTL25_II 10 left Para(IO_buffer) {DrawPins}
		.lblIO config -anchor w

		iwidgets::combobox .cboWidth -labeltext "DDR Data Width" -width 8 -editable false -textvariable Para(Width) -selectioncommand {ChangeWidthCmd;DrawPins}
		.cboWidth.label config -width 25 -anchor w
		.cboWidth insert list end 8 16 32 64

		iwidgets::combobox .cboNumber -labeltext "Number of DQS" -width 8 -editable false -textvariable Para(Number) -selectioncommand {ChangeDqsCmd;DrawPins}
		.cboNumber.label config -width 25 -anchor w
		.cboNumber insert list end 1 2 4 8

		iwidgets::combobox .cboFreq -labeltext "Frequency of DQS(MHz)" -width 8 -editable false -textvariable Para(Frequency)
		.cboFreq.label config -width 25 -anchor w
		#25276 add 200 MHz to "Frequency of DQS"
		#.cboFreq insert list end 100 133 166
		.cboFreq insert list end 100 133 166 200

		iwidgets::combobox .cboStep -labeltext "DQS Phase Shift Step" -width 8 -editable false -textvariable Para(Step)
		.cboStep.label config -width 25 -anchor w
		for { set i 0 } {$i < 65} {incr i} {.cboStep insert list end $i}

		CreateRadioItem $frmConfig Direct "Phase Shift Direction" 24 "PLUS" PLUS "MINUS" MINUS 10 left Para(Direction) {DrawPins}
		.lblDirect config -anchor w

		CreateRadioItem $frmConfig Sensit "Lock/Jitter Sensitivity" 24 "HIGH" HIGH "LOW" LOW 10 left Para(Sensitivity) {DrawPins}
		.lblSensit config -anchor w

		CreateRadioItem $frmConfig LSRInReg "LSR for DDR Input Registers" 24 "RESET" RESET "SET" SET 10 left Para(LSRInReg) {DrawPins}
		.lblLSRInReg config -anchor w

		checkbutton .ckInReg  -text "Create Clock Enable for DDR Data Input Registers" -variable Para(InReg) -onvalue ON -offvalue OFF -command DrawPins
		checkbutton .ckOutReg -text "Tristate Enable for DDR Data Output Registers" -variable Para(OutReg) -onvalue ON -offvalue OFF -command DrawPins
		checkbutton .ckEnDQS  -text "DDR Tristate Enable for DQS" -variable Para(EnDQS) -onvalue ON -offvalue OFF -command DrawPins

		pack .frmIO       -in $frmConfig  -anchor w -padx 30 -pady 6
		pack .cboWidth    -in $frmConfig  -anchor w -padx 30
		pack .cboNumber   -in $frmConfig  -anchor w -padx 30 -pady 6
		pack .cboFreq     -in $frmConfig  -anchor w -padx 30
	# 23885
	#	pack .cboStep     -in $frmConfig  -anchor w -padx 30 -pady 6
	#	pack .frmDirect   -in $frmConfig  -anchor w -padx 30
		pack forget .frmDirect
		pack .frmSensit   -in $frmConfig  -anchor w -padx 30 -pady 6
		pack .frmLSRInReg -in $frmConfig  -anchor w -padx 30
		pack .ckInReg     -in $frmConfig  -anchor w -padx 30
		pack .ckOutReg    -in $frmConfig  -anchor w -padx 30
		pack .ckEnDQS     -in $frmConfig  -anchor w -padx 30

		pack .frmConfig -in $page -fill both -expand 1

		.cbEdif config -state disabled

		$tnb delete 0

		$tnb view 0

		pack forget .lblOrder .cboOrder .cbIO

	#FunctionButton
	#CenterPosition
	GeneralConfig
}