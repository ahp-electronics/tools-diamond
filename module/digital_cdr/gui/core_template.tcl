#$Header: L:/module/digital_cdr/gui/rcs/core_template.tcl 1.5 2009/11/10 06:47:45Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc ChangePins {} {
	global Para	
}

proc ChangeValueCmd {} {
	global Para
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
	ChangePins
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

	if {$Para(FREQ) <= 200} {
		set freq "LOW"
	}
	if {$Para(FREQ) > 200 && $Para(FREQ) <= 300} {
		set freq "MED"
	}
	if {$Para(FREQ) > 300} {
		set freq "HIGH"
	}
	puts $outputfile "#define _num_slave_grps $Para(NUM_SLAVE_GRPS)\n"
	puts $outputfile "#define _bus_width      $Para(BUS_WIDTH)\n"
	puts $outputfile "#define _refclk_src     \"$Para(REFCLK_SRC)\"\n"
	puts $outputfile "#define _lock_mode      \"$Para(LOCK_MODE)\"\n"
	puts $outputfile "#define _freq           \"$freq\"\n"
	puts $outputfile "#define _gsr            \"$Para(GSR)\"\n"
	puts $outputfile "#define _circuit_name $Para(ModuleName)\n"
	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		puts $outputfile "#define _lang vhdl\n"
		puts $outputfile "#include <pcs/LSCDR.vhd>"
	}
	if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {
		puts $outputfile "#define _lang verilog\n"
		puts $outputfile "#include <pcs/LSCDR.v>"
	}
	
	close $outputfile
	return 0
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
	global Para tcl_platform pin_flag

	set ret [CheckParameterCB]
	if {$ret == -1} {return -1}

	set ret [CreatePpFile]
	if {$ret == -1} {return -1}

	set out_msg "\tModule Name: $Para(ModuleName)\n\tCore Name: $Para(CoreName)\n\tLPC file : $Para(ModuleName).lpc"
	append out_msg "\n\tParameter File : $Para(ModuleName).pp"
	append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"

	set pin_flag orcapp
	if {$pin_flag == "orcapp"} {
		set oldPath [pwd]
		cd $Para(ProjectPath)
		set ppFile  "$Para(ModuleName).pp"
		set orcappFile  [GetFpscEngine]
		catch {exec $orcappFile -Fmaco $ppFile} ret
		cd $oldPath
		# send message to IP Manager
		regsub -all "\n\n\n+" $ret "\n\n" ret
		append out_msg "\n\tCommand line: $orcappFile -Fmaco"
		#$ppFile"
		append out_msg "\n\tReturn Value:"
		foreach item [split $ret "\n"] {append out_msg "\n\t$item"}

		set tmp_str [string tolower $out_msg]
		if {[string first "error" $tmp_str] == -1}  {
			append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"
		} 

		set out_msg [ReadmeOut $out_msg]
	} 
	
	return $out_msg
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. DrawImage
	# 4. ProjectInfo
	# 5. AttributeSetting
	ProjectSet
	MainInterface
	AttributeSetting 400 350
	set Para(Fdir) "Fmaco"
	set pin_flag 2
	DrawImage 200 300
	set tnb $Para(tnb)
	$tnb delete 0
	
	wm title . "Lattice FPGA Module -- $Para(CoreName)"

	#*** Here for user to add extra pages ***
	#--- Page Options ---
	set page [$tnb add -label "Options"]
	iwidgets::Labeledframe .para1
	set Left [.para1 childsite]

	CreateLabelCombobox $Left Channel "Number of channel groups\n(3 channels per group)" 30 4 Para(NUM_SLAVE_GRPS) {1 2 3 4 5 6} { ChangeValueCmd}
	CreateLabelCombobox $Left Width "Bus width of the channel output" 30 4 Para(BUS_WIDTH) {1 2 4} { ChangeValueCmd }
	CreateLabelEntry $Left Freq "REFCLK Frequency" "(MHz)" 10 e left Para(FREQ) real
	pack .frmFreq -in $Left -side top -anchor w -pady 2
	CreateLabelCombobox $Left Mode "CDR Lock Mode" 30 10 Para(LOCK_MODE) {SYNC ASYNC} { ChangeValueCmd }
	CreateLabelCombobox $Left Rout "REFCLK source routing" 30 10 Para(REFCLK_SRC) {EDGE PRIMARY} { ChangeValueCmd }
	checkbutton .cbGSR -variable Para(GSR) -text "GSR Enabled" -onvalue ENABLED -offvalue DISABLED -command ChangeValueCmd
	pack .cbGSR -in $Left -side top -anchor w -padx 10 -pady 2

	.lblChannel config -anchor w
	.lblWidth config -anchor w
	.lblFreq config -width 30 -anchor w
	.lblMode config -anchor w
	.lblRout config -anchor w

	pack .para1 -in $page -side top -fill x

	ChangeValueCmd	

	$tnb view 0

	#*** Public Template Functions ***
	GeneralConfig
#	set Para(topic) "digital_cdr.htm"
#	set Para(webhelp) "$Para(webhelp)#$Para(topic)"
}