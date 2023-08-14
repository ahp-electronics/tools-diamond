#$Header: L:/module/scripts/lpcgen.tcl 1.1 mghuang Exp $

#rev 1.1: Diamond 2.0.1 IPExpress: Fixed CR_57820.
#rev 1.0: Diamond 2.0 IPExpress: Script for pojo2 module + 64bit support.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

proc GetPlatform {} {
	global tcl_platform
	
	set cpu  $tcl_platform(machine)

	switch $cpu {
		intel -
		i*86* {
			set cpu ix86
		}
		x86_64 {
			if {$tcl_platform(wordSize) == 4} {
				set cpu ix86
			}
		}
	}

	switch $tcl_platform(platform) {
		windows {
			if {$cpu == "amd64"} {
				# Do not check wordSize, win32-x64 is an IL32P64 platform.
				set cpu x86_64
			}
			if {$cpu == "x86_64"} {
				return "nt64"
			} else {
				return "nt"
			}
		}
		unix {
			if {$tcl_platform(os) == "Linux"}  {
				if {$cpu == "x86_64"} {
					return "lin64"
				} else {
					return "lin"
				}
			} else  {
				return "sol"
			}
		}
	}
	return "nt"
}

proc ParseCommandLine {} {
	global Para argc argv argv0
	
	set value ""

	foreach arg $argv {
		if {[string first "-" $arg 0] == 0} {
			if {[string length $value] > 0} {
				lappend value_list $value
				set value ""
			}
			lappend argv_list [string range $arg 1 end]
		} else {
			if {[string length $value] > 0} {
				append value " "
			}
			append value $arg
		}
	}
	if {[string length $value] > 0} {
		lappend value_list $value
		set value ""
	}

	foreach argument $argv_list value $value_list {
		switch $argument {
			"dir"   {
				set Para(ProjectPath)  $value
				regsub -all "\"" $Para(ProjectPath) "" Para(ProjectPath)
				regsub -all "\"" $Para(ProjectPath) "" Para(ProjectPath)
			}
			"lpc" {set Para(LpcFile)   $value; regsub -all "\"" $Para(LpcFile) "" Para(LpcFile)}
			"root" {set Para(Root)       $value; regsub -all "\"" $Para(Root) "" Para(Root)}
		}
	}
	set Para(FPGAPath) [file join $Para(Root) ispfpga]
	set Para(Bin) [file join $Para(Root) ispcpld bin]
}

proc LoadLpcFile {para_file} {
	global Para

	#set para_file [file join $Para(ProjectPath) $Para(LpcFile)]
	if [catch {open $para_file r} fileid] {
		#tk_messageBox -default ok -icon warning \
		#	-message "Cannot open $para_file file!" \
		#	-title "Open file error" \
		#	-type ok
		puts stderr "Open file error: Cannot open $para_file file!"
		exit -1
	}

	seek $fileid 0 start
	while {[gets $fileid line] >= 0} {
		if [regexp {([^=]*)=(.*)} $line match parameter value] {
			if [regexp {([ |\t]*;)} $parameter match] {continue}
			if [regexp {(.*)[ |\t]*;} $value match temp] {
				set Para($parameter) $temp
			} else {
				set Para($parameter) $value
			}
		}
	}
	close $fileid
}

proc LoadCfgFile {para_file} {
	if [catch {open $para_file r} fileid] {
		#tk_messageBox -default ok -icon warning \
		#	-message "Cannot open $para_file file!" \
		#	-title "Open file error" \
		#	-type ok
		puts stderr "Open file error: Cannot open $para_file file!"
		exit -1
	}

	seek $fileid 0 start
	while {[gets $fileid line] >= 0} {
		if [regexp {([^=]*)=(.*)} $line match parameter value] {
			if [regexp {([ |\t]*;)} $parameter match] {continue}
			if [regexp {(.*)[ |\t]*;} $value match temp] {
				set parameter [string trim $parameter]
				set temp [string trim $temp]
				set $parameter $temp
			} else {
				set parameter [string trim $parameter]
				set value [string trim $value]
				set $parameter $value
			}
		}
	}
	close $fileid
	
	return $CoreName
}


proc GetVhd2Naf {} {
	global env tcl_platform Para

	switch $tcl_platform(platform) {
		windows {set path [file join $Para(Bin) "hdl2jhd.exe"]}
		unix {
			if {$tcl_platform(os) == "Linux"}  {
				set path [file join $Para(Bin) "hdl2jhd"]
			} else  {
				set path [file join $Para(Bin) "hdl2jhd"]
			}
		}
	}
	return $path
}

proc GetVlog2Jhd {} {
	global env tcl_platform Para

	switch $tcl_platform(platform) {
		windows {set path [file join $Para(Bin) "hdl2jhd.exe"]}
		unix {
			if {$tcl_platform(os) == "Linux"}  {
				set path [file join $Para(Bin) "hdl2jhd"]
			} else  {
				set path [file join $Para(Bin) "hdl2jhd"]
			}
		}
	}
	return $path
}

proc GetVhd2Jhd {} {
	global env tcl_platform Para

	switch $tcl_platform(platform) {
		windows {set path [file join $Para(Bin) "vhd2jhd.exe"]}
		unix {
			if {$tcl_platform(os) == "Linux"}  {
				set path [file join $Para(Bin) "vhd2jhd"]
			} else  {
				set path [file join $Para(Bin) "vhd2jhd"]
			}
		}
	}
	return $path
}

proc GetNaf2Sym {} {
	global tcl_platform Para env
	switch $tcl_platform(platform) {
		windows {set path [file join $Para(Bin) "naf2sym.exe"]}
		unix {
			if {$tcl_platform(os) == "Linux"}  {
				set path [file join $Para(Bin) "naf2sym"]
			} else  {
				set path [file join $Para(Bin) "naf2sym"]
			}
		}
	}
	return $path
}

proc ReadmeOut {out_msg}  {
	global Para tcl_platform

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
		[string equal -nocase $Para(SourceFormat) "VHDL"]}  {
		set vhd2naf [GetVhd2Naf]
		switch $tcl_platform(platform) {
			windows {
#				append out_msg "$vhd2naf -tfi -mod $Para(ModuleName) -ext readme -out $Para(ModuleName) -p $Para(Root)/generic -tpl $Para(ModuleName).tft $Para(ModuleName).vhd\n\n"
				append out_msg "$vhd2naf -tfi -mod $Para(ModuleName) -ext readme -out $Para(ModuleName) -tpl $Para(ModuleName).tft $Para(ModuleName).vhd\n\n"
				catch {exec $vhd2naf -tfi -mod $Para(ModuleName) -ext readme -out $Para(ModuleName) -tpl $Para(ModuleName).tft $Para(ModuleName).vhd} ret
			}
			unix {
#				append out_msg "$vhd2naf -tfi -mod $Para(ModuleName) -ext readme -out $Para(ModuleName) -p $Para(Root)/generic -tpl $Para(ModuleName).tft $Para(ModuleName).vhd\n\n"
				append out_msg "$vhd2naf -tfi -mod $Para(ModuleName) -ext readme -out $Para(ModuleName) -tpl $Para(ModuleName).tft $Para(ModuleName).vhd\n\n"
				catch {exec $vhd2naf -tfi -mod $Para(ModuleName) -ext readme -out $Para(ModuleName) -tpl $Para(ModuleName).tft $Para(ModuleName).vhd} ret
			}
		}
	}
	if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog"]} {
		set vlog2jhd [GetVlog2Jhd]
		switch $tcl_platform(platform) {
			windows {
				append out_msg "$vlog2jhd -tfi -mod $Para(ModuleName) -out $Para(ModuleName) -ext readme -tpl $Para(ModuleName).tft $Para(ModuleName).v\n\n"
				catch {exec $vlog2jhd -tfi -mod $Para(ModuleName) -out $Para(ModuleName) -ext readme -tpl $Para(ModuleName).tft $Para(ModuleName).v} ret
			}
			unix {
				append out_msg "$vlog2jhd -tfi -mod $Para(ModuleName) -out $Para(ModuleName) -ext readme -tpl $Para(ModuleName).tft $Para(ModuleName).v\n\n"
				catch {exec $vlog2jhd -tfi -mod $Para(ModuleName) -out $Para(ModuleName) -ext readme -tpl $Para(ModuleName).tft $Para(ModuleName).v} ret
			}
		}
	}
	append out_msg "Done successfully!"

	return $out_msg
}


proc Hex2Bin {v} {
	set len [string length $v]
	for {set i 0} {$i < $len} {incr i} {
		set temp [string range $v $i $i]
		switch $temp {
			0 {set str 0000}
			1 {set str 0001}
			2 {set str 0010}
			3 {set str 0011}
			4 {set str 0100}
			5 {set str 0101}
			6 {set str 0110}
			7 {set str 0111}
			8 {set str 1000}
			9 {set str 1001}
			a -
			A {set str 1010}
			b -
			B {set str 1011}
			c -
			C {set str 1100}
			d -
			D {set str 1101}
			e -
			E {set str 1110}
			f -
			F {set str 1111}
		}
		append ret_str $str
	}
	return $ret_str
}

proc Bin2Hex {v} {
	set len [string length $v]
	for {set i 0} {$i < $len} {incr i 4} {
		set temp [string range $v $i [expr $i+3]]
		switch $temp {
			0000 {set str 0}
			0001 {set str 1}
			0010 {set str 2}
			0011 {set str 3}
			0100 {set str 4}
			0101 {set str 5}
			0110 {set str 6}
			0111 {set str 7}
			1000 {set str 8}
			1001 {set str 9}
			1010 {set str A}
			1011 {set str B}
			1100 {set str C}
			1101 {set str D}
			1110 {set str E}
			1111 {set str F}
		}
		append ret_str $str
	}
	return $ret_str
}

proc IsInRange {str min max para} {
	if {[string length $para] == 0} {
		set msg "Please input $str!"
		#tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		puts stderr "$msg"
		return -1
	}
	if {$para > $max || $para < $min} {
		set msg "$str should be between $min and $max!"
		#tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		puts stderr "$msg"
		return -1
	}
	return 0
}

proc IsInList {str lst para} {
	if {[string length $para] == 0} {
		set msg "Please input $str!"
		#tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		puts stderr "$msg"
		return -1
	}
	if {[lsearch $lst $para] == -1} {
		set msg "$str is illegal!"
		#tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		puts stderr "$msg"
		return -1
	}
	return 0
}

proc IsHex {str len para} {
	set strlen [string length $para]
	if {$strlen != $len} {
		set msg "$str is illegal!"
		#tk_messageBox -default ok -icon warning -message $msg -title "Check Parameter" -type ok
		puts stderr "$msg"
		return -1
	}
	for {set i 0} {$i < $len} {incr i} {
		set k [string index $para $i]
		if {[hex $k] == "false"} {
			set msg "$str is illegal!"
			#tk_messageBox -default ok -icon warning -message $msg -title "Check Parameter" -type ok
			puts stderr "$msg"
			return -1
		}
	}
	return 0
}

proc doFPGAdir {dirname} {
	global Para
	set filename "nodeinfo.cfg"

	cd $dirname
	foreach dir [glob *] {
		if {[file isdirectory $dir]} {
			set cfg_file [file join $dirname $dir $filename]
			if {[file exists $cfg_file]==0} {continue}
			set core_name [LoadCfgFile $cfg_file]
			if {$core_name == $Para(CoreName)} {
				cd $Para(ProjectPath)
				return $dir
			}
		}
	}
}

proc FindCoreDir {} {
	global Para
	
	set module_dir [file join $Para(Root) module]
	set core_dir [doFPGAdir $module_dir]
	set core_dir [file join $module_dir $core_dir]
	return $core_dir
}

proc FindFamilyDir {} {
	global Para
	
	switch $Para(arch) {
		"ep5m00" {set dev_dir latticeecp2m}
		"ep5a00" {set dev_dir latticeecp2}
		"ep5g00p" {set dev_dir latticeecp}
		"ep5g00" {set dev_dir latticeec}
		"mg5g00" {set dev_dir latticexp}
		"mg5a00" {set dev_dir latticexp2}
		"xo3c00h" {set dev_dir machxo3h}
		"mj5g00p" -
		"mj5g00" {set dev_dir machxo}
		"xo2c00p" -
		"xo3c00f" -
		"se5c00" -
		"se5r00" -
		"machxo3d" -
		"xo2c00" {set dev_dir machxo2}
		"slayer" {set dev_dir latticesc}
		"or5s00" {set dev_dir latticescm}
		"or2c00a" -
		"or2t00a" -
		"or2t00b" {set Para(arch) orca2a;return}
		"or3c00" -
		"or3l00b" -
		"or3t00" {set Para(arch) orca3;return}
		"or4e00" {set Para(arch) orca4;return}
		default {set dev_dir $Para(arch)}
	} 
	return $dev_dir
}

proc SetArchValue {} {
	global Para

	#tk_messageBox -default ok -icon info -message $Para(arch) -title SetArchValue -type ok
	set temp [string tolower $Para(arch)]
	switch $temp {
		"ep5m00" -
		"latticeecp2m-dsp" {
			set Para(arch) ep5m00
			set Para(CmdLine) EC_CMD
		}
		"ep5a00" -
		"latticeecp2-dsp" {
			set Para(arch) ep5a00 
			set Para(CmdLine) EC_CMD
		}
		"latticeecp" -
		"latticeecp-dsp" -
		"ep5g00p" {
			set Para(arch) ep5g00p
			set Para(CmdLine) EC_CMD
		}
		"latticeec" -
		"ep5g00" {
			set Para(arch) ep5g00
			set Para(CmdLine) EC_CMD
		}
		"latticexp" -
		"mg5g00" {
			set Para(arch) mg5g00
			set Para(CmdLine) EC_CMD
		}
		"latticexp2" -
		"mg5a00" {
			set Para(arch) mg5a00
			set Para(CmdLine) EC_CMD
		}
		"machxo3h" -
		"xo3c00h" {
			set Para(arch) xo3c00h
			set Para(CmdLine) EC_CMD
		}
		"machxo" -
		"mj5g00" {
			set Para(arch) mj5g00
			set Para(CmdLine) EC_CMD
		}
		"machxo2" -
		"xo2c00" {
			set Para(arch) xo2c00
			set Para(CmdLine) EC_CMD
		}
		"platform manager" -
		"pojo" -
		"mj5g00p" {
			set Para(arch) mj5g00p
			set Para(CmdLine) EC_CMD
		}
		"platform manager 2" -
		"pojo2" -
		"xo2c00p" {
			set Para(arch) xo2c00p
			set Para(CmdLine) EC_CMD
		}
		"lattice-sc" -
		"latticesc" -
		"or5s00" {
			#28567
			set Para(arch) slayer
			set Para(CmdLine) SC_CMD
		}
		"lattice-scm" -
		"latticescm" -
		"or5scm00" -
		"or5s00m" {
			#28567
			set Para(arch) or5s00
			set Para(CmdLine) SC_CMD
		}
		"machxo3lf" -
		"se5r00" -
		"xo3c00f" {
			set Para(arch) xo3c00f
			set Para(CmdLine) EC_CMD
		}
		"se5c00" -
		"machxo3d" {
			set Para(arch) se5c00
			set Para(CmdLine) EC_CMD
		}
		default {
			set Para(arch) $temp
			set Para(CmdLine) $Para(arch)
		}
	} 
}

proc FindTemplateFile {core_dir} {
	global Para
	
	set family [FindFamilyDir]
	set dirname [file join $core_dir $family gui core_template.tcl]
	if {[file exists $dirname]==0} {
		set template_file [file join $core_dir gui core_template.tcl]
	} else {
		set template_file $dirname
	}
	return $template_file
}

proc GetScubaEngine {} {
	global tcl_platform Para env
	
	set platformpath [GetPlatform]
	
	set foundry $Para(FPGAPath)
	switch $tcl_platform(platform) {
		windows {
			set str [file join $foundry "bin" $platformpath "scuba.exe"]
		}
		unix {
			if {$tcl_platform(os) == "Linux"}  {
				set str [file join $foundry "bin" $platformpath "scuba"]
			} else  {
				set str [file join $foundry "bin" $platformpath "scuba"]
			}
		}
	}
	return $str
}

proc GetGeneralArgs {} {
	global Para

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		append cmd " -lang vhdl"
	} 
	if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {
		append cmd " -lang verilog"
	} 

	if {$Para(Destination) != "Simulation"} {
		set synth_list {"Precision" "Synplicity"}
		set cmd_list {spectrum synplify}
		set synth [lindex $cmd_list [lsearch $synth_list $Para(Destination)]]
		append cmd " -synth $synth"
	}
	if {$Para(Expression) != "None"} {
		set bus_exp_list {"BusA(0)" "BusA_0" "BusA0" "BusA<0>"	"BusA\[0\]" "BusA\[0 to 7\]" "BusA(0 to 7)"}
		set bus_exp [expr [lsearch -exact $bus_exp_list $Para(Expression)] + 1]
		append cmd " -bus_exp $bus_exp"
	}
	if {$Para(Order) == "Big Endian \[MSB:LSB\]"} {
		append cmd " -bb"
	}
	if {$Para(Order) == "Little Endian \[LSB:MSB\]"} {
		append cmd " -bl"
	}

	if $Para(IO) {
		append cmd " -buffer"
	}

	return $cmd
}

proc DoFPGAFlow {} {
	global Para
	
	set core_dir [FindCoreDir]
	set template_file [FindTemplateFile $core_dir]
	#puts stderr "$template_file"
	set family [FindFamilyDir]
	set default_lpc [file join $core_dir $family "preference" "default.lpc"]
	if {[file exists $default_lpc] == 0} {
		set default_lpc [file join $core_dir "preference" "default.lpc"]
	}
	LoadLpcFile $default_lpc
	set lpc_file [file join $Para(ProjectPath) $Para(LpcFile)]
	LoadLpcFile $lpc_file
	
	source $template_file
}

proc FindCoreEntryDir {dirname} {
	global Para
	set filename "core_interface.inf"

	cd $dirname
	if {[catch {glob $filename} filelist]==0} {
		set cfg_file [file join [pwd] $filename]
		set core_name [LoadCfgFile $cfg_file]
		if {$core_name == $Para(CoreName)} {
			#cd $Para(ProjectPath)
			set core_dir [pwd]
			return $core_dir
		}
	}
	set dirlist [glob *]
	foreach dir $dirlist {
		if {[file isdirectory $dir]} {
			set core_dir [FindCoreEntryDir $dir]
			if {[string length $core_dir] != 0} {return $core_dir}
		}
	}
	cd ..
}

proc FindCoreTemplateDir {core_interface_file core_dir} {
	global Para
	
	if [catch {open $core_interface_file r} fileid] {
		#tk_messageBox -default ok -icon warning \
		#	-message "Cannot open $core_interface_file file!" \
		#	-title "Open file error" \
		#	-type ok
		puts stderr "Open file error: Cannot open $core_interface_file file!"
		exit -1
	}

	while {[gets $fileid line] >= 0} {
		catch {eval $line}
		if {[info exists Para(CoreDir)] != 0} {
			set Para(CoreDir) $core_dir
		}
		if {[info exists Para(TemplateDir)] != 0} {
			break;
		}
	}
	close $fileid
	
	return $Para(TemplateDir)
}

proc DoOrcaFlow {} {
	global Para
	
	set gen_dir [file join $Para(Root) ispcpld module_gen]
	set family_dir [file join $gen_dir $Para(Family) lpm]
	set core_entry_dir [FindCoreEntryDir $family_dir]
	set core_interface_file [file join $core_entry_dir "core_interface.tcl"]
	set template_dir [FindCoreTemplateDir $core_interface_file $core_entry_dir]
	set template_file [file join $template_dir core_template.tcl]
	catch {source $template_file}
}

#*************************************
# GetFpscEngineLocation
#*************************************
proc GetFpscEngine {} {
	global env tcl_platform Para

	set platformpath [GetPlatform]
	
	set fpsc $Para(FPGAPath)
	switch $tcl_platform(platform) {
		windows {set path [file join $fpsc "bin" $platformpath "orcapp.exe"]}
		unix {
			if {$tcl_platform(os) == "Linux"}  {
				set path [file join $fpsc "bin" $platformpath "orcapp"]
			} else  {
				set path [file join $fpsc "bin" $platformpath "orcapp"]
			}
		}
	}
	return $path
}

proc DoOrcappFlow {} {
	global Para pin_flag
	set core_dir [FindCoreDir]
	set template_file [FindTemplateFile $core_dir]
	catch {source $template_file}
	set pin_flag "orcapp"
	GenerateCB
}

proc DoOrcappFlow4Orca {} {
	global Para pin_flag
	set gen_dir [file join $Para(Root) ispcpld module_gen]
	set family_dir [file join $gen_dir $Para(Family) lpm]
	set core_entry_dir [FindCoreEntryDir $family_dir]
	set core_interface_file [file join $core_entry_dir "core_interface.tcl"]
	set template_dir [FindCoreTemplateDir $core_interface_file $core_entry_dir]
	set template_file [file join $template_dir core_template.tcl]
	catch {source $template_file}
	set pin_flag "orcapp"
	GenerateCB
}

proc InitPara {} {
	global Para
	set Para(fpga_lst) {or5s00 ep5g00 ep5g00p mg5g00 mj5g00 ep5a00 ep5m00 slayer mg5a00 xo2c00p xo3c00h}
	set Para(orca_lst) {orca2a or2c00a or2t00a or2t00b orca3 or3c00 or3l00b or3t00 orca4 or4e00}
	set Para(FPGA_orcapp_module) {"10 Gigabit Ethernet Hard IP" "DDR/DDR2 Memory Controller" DDR_MEM "Digital CDR" \
		DQS "Gigabit Ethernet Hard IP" "2.5G PCIE Hard IP" PCS "QDR Memory Controller" "RLDRAM Memory Controller" \
		SPI4 System_Bus}
	set Para(ORCA_orcapp_module) {DDR_MEM DQS PCS SPI4 System_Bus}
}

proc main {} {
	global Para
	
	InitPara
	
	ParseCommandLine
	
	set lpc_file [file join $Para(ProjectPath) $Para(LpcFile)]
	LoadLpcFile $lpc_file

	set Para(arch) $Para(Family)
	SetArchValue
	#puts stderr "Para(arch) = $Para(arch)"
	
	#puts stderr "Para(CoreName) = $Para(CoreName)"
	#FPGA modules
	if {[lsearch $Para(FPGA_orcapp_module) $Para(CoreName)] != -1}  {
		#orcapp engine for FPGA
		DoOrcappFlow
		exit 0
	} else {
		#Scuba Engine for FPGA
		DoFPGAFlow
	}

	cd $Para(ProjectPath)
	
	set scuba [GetScubaEngine]

	set module_args [GenerateCB]
	set general_args [GetGeneralArgs]

	append cmd_line $scuba " -w -e -n " $Para(ModuleName) $general_args " " $module_args

	set ret [catch {eval exec $cmd_line} msg]
}

main
