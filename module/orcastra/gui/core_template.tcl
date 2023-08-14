#$Header: L:/module/orcastra/gui/core_template.tcl 1.5 mghuang Exp $

#Rev 1.5: Diamond: Fixed cr_50348. Linux uppercase.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
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
	puts $outputfile "#define _device \"$Para(Family)\"\n"

	if {$Para(arch) == "slayer" || $Para(arch) == "or5s00"} {
		set pfile "ORCAstra_SC"
	} 
	if {$Para(arch) == "ep5m00"} {
		set pfile "ORCAstra_ECP2M"
	} 
	if {$Para(arch) == "ep5m00s"} {
		set pfile "ORCAstra_ECP2M"
	} 
	if {$Para(arch) == "ep5c00" || $Para(arch) == "mg5a00" || $Para(arch) == "xo3c00h" } {
		set pfile "ORCAstra_XP2_ECP3"
	} 
	
	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		puts $outputfile "#define _lang vhdl\n"
		puts $outputfile "#include <pcs/$pfile.vhd>"
	}
	if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {
		puts $outputfile "#define _lang verilog\n"
		puts $outputfile "#include <pcs/$pfile.v>"
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
	global Para pin_flag

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
		catch {exec $orcappFile -Fmaco $ppFile} ret
		cd $oldPath
		# send message to IP Manager
		regsub -all "\n\n\n+" $ret "\n\n" ret
		append out_msg "\n\tCommand line: $orcappFile -Fmaco $ppFile"
		append out_msg "\n\tReturn Value:"
		foreach item [split $ret "\n"] {append out_msg "\n\t$item"}

		set tmp_str [string tolower $out_msg]
		if {[string first "error" $tmp_str] == -1}  {
			append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"
		} 
		set out_msg [ReadmeOut $out_msg]
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
	AttributeSetting 380 260
	set pin_flag orcapp
	set Para(Fdir) "Fmaco"
	DrawImage 220 250 
	set tnb $Para(tnb)
	$tnb delete 0

	#*** Here for user to add extra pages ***
	set page [$tnb add -label "Configuration"]
	iwidgets::Labeledframe .frmProperties ;
	set frmProperty [.frmProperties childsite]

	pack .frmProperties -in $page  -fill both -expand true 

	$tnb view 0

	#*** Public Template Functions ***
	GeneralConfig
	
#	set Para(topic) "orcastra.htm"
#	set Para(webhelp) "$Para(webhelpTop)#$Para(topic)"
}
