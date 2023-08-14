#$Header: L:/module/gui/lattice_orca/OrcaControl.tcl 1.7 mghuang Exp $

#P4 Rev 1.7: Diamond 3.6 Clarity: SCR1111 (3G eDP) and SCR1112 (5G).
#P4 Rev 1.7: Diamond 3.5 Clarity: Updated generate_ngd.tcl, support _softlogic.v for PCS
#P4 Rev 1.6: Diamond 3.5 Clarity: LSE SNOW support
#P4 Rev 1.4/1.5: Diamond 3.5 Clarity: SNOW support
#Rev 1.120: Diamond 3.4.1 IPExpress: XO3LF support
#Rev 1.119: Diamond 3.4 IPExpress: Fixed SOF-121642, -synth lse
#Rev 1.118: Diamond 3.3 IPExpress: Fixed SOF-122064 + LDC file support
#Rev 1.117: Diamond 3.3 IPExpress: Fixed SOF-121835
#Rev 1.116: Diamond 3.3 IPExpress: Fixed SOF-121607
#Rev 1.115: Diamond 3.3 IPExpress: update Para(tech_syn)
#Rev 1.113: Diamond 3.3 IPExpress: support Chrome online help + LSE support
#Rev 1.112: Diamond 3.2 IPExpress: Sapphire PLL run with synpwrap.
#Rev 1.111: Diamond 3.2 IPExpress: updated SYSTEMPNR
#Rev 1.109: Diamond 3.2 IPExpress: ECP4 to ECP5
#Rev 1.108: Diamond 3.1 IPExpress: Fixed SOF-119357, vlog_std_v2001: true
#Rev 1.107: Diamond 3.1 IPExpress: Updated generate_ngd.tcl, support _rsl.v for PCS
#Rev 1.106: Diamond 3.1 IPExpress: Updated generate_ngd.tcl, support VHDL and no synpwrap for scuba.
#Rev 1.105: Diamond 3.1 IPExpress: XO3 support
#Rev 1.104: Diamond 3.1 IPExpress: Updated generate_ngd.tcl.
#Rev 1.103: Diamond 3.1 IPExpress: SBP supports.
#Rev 1.102: Diamond 3.0 IPExpress: Fixed SOF-117671
#Rev 1.101: Diamond 3.0 IPExpress: Case insensitive.
#Rev 1.100: Diamond 2.2 IPExpress: ECP4UM enhancement.
#Rev 1.99: Diamond 2.2 IPExpress: ECP4UM GUI check-in.
#Rev 1.98: Diamond 2.1 IPExpress: Sapphire GUI check-in.
#Rev 1.97: Diamond 2.1 IPExpress: Fixed CR_58055
#Rev 1.96: Diamond 2.0.1 IPExpress: Fixed CR_57193.
#Rev 1.95: Diamond 2.0 IPExpress: ECP4 PCS enhancement.
#Rev 1.94: Diamond 2.0 IPExpress: POJO2 support.
#Rev 1.93: Diamond 2.0 IPExpress: POJO/POJO2 support.
#Rev 1.92: Diamond 2.0 IPExpress: ECP4 MACO help support.
#Rev 1.91: Diamond 2.0 IPExpress: ECP4 ddr_generic support.
#Rev 1.90: Diamond 2.0 IPExpress: CreateDummyLpcFile, GetDummyAsbPorts
#Rev 1.89: Diamond 2.0 IPExpress: MRD Item 6023: Copy of a configured instance.
#Rev 1.88: Diamond 2.0 IPExpress: MRD Item 6027: relative path.
#Rev 1.87: Diamond 2.0 IPExpress: 64-bit support.

#!/usr/local/bin/wish
package require Iwidgets

package provide OrcaModule 1.0.0

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

proc AddExt {fn ext}  {
	if {[string first "." $fn)] == -1} {
		set str [append fn $ext]
	}
	return $str
}

proc GetLeverHelpTopic {} {
	global Para

	set Para(webhelpTop) $Para(webhelp)
	set core_name [string tolower $Para(CoreName)]
	switch $core_name {

		"digital cdr"				{set Para(topic) "digital_cdr.htm"}
		orcastra					{set Para(topic) "orcastra.htm"}
		complex_multiplier			{set Para(topic) "complex_multiplier.htm"}
		mult_add_sub				{set Para(topic) "multaddsub_arithmetic.htm"}
		mult_add_sub_sum			{set Para(topic) "multaddsubsum_arithmetic.htm"}
		multiplier					{set Para(topic) "mult_arithmetic.htm"}
		multiply_accumulate			{set Para(topic) "mac_arithmetic.htm"}

		"10 gigabit ethernet hard ip"		{set Para(topic) "10_gigabit_ethernet.htm"}
		"ddr/ddr2 memory controller" {set Para(topic) "ddr_ddr2_memory_controller.htm"}
		"gigabit ethernet hard ip"			{set Para(topic) "gigabit_ethernet.htm"}
		"2.5g pcie hard ip"					{set Para(topic) "pci_asi.htm"}
		"qdr memory controller"		{set Para(topic) "qdr_memory_controller.htm"}
		"rldram memory controller"	{set Para(topic) "rldram_memory_controller.htm"}
		spi4						{set Para(topic) "spi4.htm"}

		ddr							{set Para(topic) "ddr.htm"}
		ddr_generic					{set Para(topic) "ddr_generic.htm"}
		ddr_mem						{set Para(topic) "ddr_mem.htm"}
		dqs							{set Para(topic) "dqs.htm"}
		sdr							{set Para(topic) "sdr.htm"}

		dll							{set Para(topic) "dll.htm"}
		jtag						{set Para(topic) "jtag.htm"}
		pcs							{set Para(topic) "pcs.htm"}
		pll							{set Para(topic) "pll.htm"}
		system_bus					{set Para(topic) "system_bus.htm"}

		adder						{set Para(topic) "adder.htm"}
		adder_subtractor			{set Para(topic) "adder_subtractor.htm"}
		comparator					{set Para(topic) "comparator.htm"}
		convert                     {set Para(topic) "convert.htm"}
		counter						{set Para(topic) "counter.htm"}
		fft_butterfly				{set Para(topic) "fft_butterfly.htm"}
		lfsr						{set Para(topic) "lfsr.htm"}
		multiplier					{set Para(topic) "multiplier.htm"}
		sin-cos_table               {set Para(topic) "sin_cos_table_tab.htm"}
		subtractor					{set Para(topic) "subtractor.htm"}

		distributed_dpram			{set Para(topic) "distributed_dpram.htm"}
		distributed_rom				{set Para(topic) "distributed_rom.htm"}
		distributed_spram			{set Para(topic) "distributed_spram.htm"}
		ram_based_shift_register	{set Para(topic) "ram_based_shift_register.htm"}
		"tag memory"				{set Para(topic) "tag_memory.htm"}

		fifo						{set Para(topic) "fifo.htm"}
		fifo_dc						{set Para(topic) "fifo_dc.htm"}
		ram_dp						{set Para(topic) "ram_dp.htm"}
		ram_dp_true					{set Para(topic) "ram_dp_true.htm"}
		ram_dq						{set Para(topic) "ram_dq.htm"}
		rom							{set Para(topic) "rom.htm"}

		adder_tree					{set Para(topic) "adder_tree.htm"}
		mac							{set Para(topic) "mac.htm"}
		mmac						{set Para(topic) "mmac.htm"}
		mult						{set Para(topic) "mult.htm"}
		multaddsub					{set Para(topic) "multaddsub.htm"}
		multaddsubsum				{set Para(topic) "multaddsubsum.htm"}
		slice						{set Para(topic) "slice_ref.htm"}
		wide_mux					{set Para(topic) "wide_mux.htm"}
		barrel_shifter				{set Para(topic) "barrel_shifter.htm"}

		"efb"						{set Para(topic) "efb.htm"}
		"power guard"				{set Para(topic) "power_guard.htm"}
		"dynamic bank controller"	{set Para(topic) "dynamic_bank_controller.htm"}
		"power controller"			{set Para(topic) "power_controller.htm"}
		"gddr_7:1"					{set Para(topic) "GDDR_71.htm"}
		"mipi_dphy"					{set Para(topic) "MIPI_DPHY.htm"}
		"i2c"						{set Para(topic) "I2C.htm"}
		"pmu"						{set Para(topic) "PMU.htm"}

		default						{set Para(topic) ""}
	}

	set Para(webhelp) "$Para(webhelp)#$Para(topic)"
	#tk_messageBox -default ok -icon warning -message $Para(webhelp) -title "GetHelpTopic" -type ok
}

proc GetBaliHelpTopic {} {
	global Para env

	#set Para(webhelp) "$env(TOOLRTF)/docs/webhelp/eng/index.htm?context=IPexpress&topic="
	set Para(webhelp) "$env(TOOLRTF)/docs/webhelp/eng/index.htm#context/ref/"
	regsub -all "\"" $Para(webhelp) "" Para(webhelp)
	regsub -all "\\\\" $Para(webhelp) "/" Para(webhelp)
	#tk_messageBox -default ok -icon warning -message $Para(webhelp) -title "Para(webhelp)" -type ok
	set Para(webhelpTop) $Para(webhelp)
	set core_name [string tolower $Para(CoreName)]
	switch $core_name {
		"digital cdr"				{set Para(topic) "digital_cdr_main"}
		orcastra					{set Para(topic) "ORCAstra"}
		complex_multiplier			{set Para(topic) "complex_multiplier"}
		mult_add_sub				{set Para(topic) "MULTADDSUB_Arithmetic"}
		mult_add_sub_sum			{set Para(topic) "MULTADDSUBSUM_Arithmetic"}
		multiplier					{set Para(topic) "MULT_Arithmetic"}
		multiply_accumulate			{set Para(topic) "MAC_Arithmetic"}

		ddr							{set Para(topic) "DDR"}
		ddr_generic					{set Para(topic) "DDR_GENERIC"}
		ddr_mem						{set Para(topic) "ddr_mem_main"}
		dqs							{set Para(topic) "DQS"}
		sdr							{set Para(topic) "SDR"}

		dll							{set Para(topic) "DLL"}
		jtag						{set Para(topic) "JTAG"}
		pcs							{set Para(topic) "PCS"}
		pll							{set Para(topic) "PLL"}
		system_bus					{set Para(topic) "System_Bus"}
		"tag memory"				{set Para(topic) "Tag_Memory"}

		adder						{set Para(topic) "Adder"}
		adder_subtractor			{set Para(topic) "Adder_Subtractor"}
		comparator					{set Para(topic) "Comparator"}
		convert                     {set Para(topic) "Convert"}
		counter						{set Para(topic) "counter_main"}
		fft_butterfly				{set Para(topic) "fft_butterfly_main"}
		lfsr						{set Para(topic) "LFSR"}
		multiplier					{set Para(topic) "multiplier.htm"}
		sin-cos_table               {set Para(topic) "sin_cos_table_main"}
		subtractor					{set Para(topic) "subtractor_main"}

		distributed_dpram			{set Para(topic) "Distributed_DPRAM"}
		distributed_rom				{set Para(topic) "Distributed_ROM"}
		distributed_spram			{set Para(topic) "Distributed_SPRAM"}
		ram_based_shift_register	{set Para(topic) "RAM_Based_Shift_Register"}

		fifo						{set Para(topic) "FIFO"}
		fifo_dc						{set Para(topic) "FIFO_DC"}
		ram_dp						{set Para(topic) "RAM_DP"}
		ram_dp_true					{set Para(topic) "RAM_DP_TRUE"}
		ram_dq						{set Para(topic) "RAM_DQ"}
		rom							{set Para(topic) "ROM"}

		adder_tree					{set Para(topic) "ADDER_TREE"}
		mac							{set Para(topic) "MAC"}
		mmac						{set Para(topic) "MMAC"}
		mult						{set Para(topic) "MULT"}
		multaddsub					{set Para(topic) "MULTADDSUB"}
		multaddsubsum				{set Para(topic) "MULTADDSUBSUM"}
		slice						{set Para(topic) "SLICE_ref"}
		wide_mux					{set Para(topic) "WIDE_MUX"}
		barrel_shifter				{set Para(topic) "BARREL_SHIFTER"}

		"efb"						{set Para(topic) "EFB"}
		"power guard"				{set Para(topic) "Power_Guard"}
		"dynamic bank controller"	{set Para(topic) "Dynamic_Bank_Controller"}
		"power controller"			{set Para(topic) "Power_Controller"}
		"gddr_7:1"					{set Para(topic) "GDDR_71"}

		"1d_filter"					{set Para(topic) "1D_FILTER"}
		"clock data recovery"		{set Para(topic) "CRU"}

		"hspll"						{set Para(topic) "HSPLL"}
		"lspll"						{set Para(topic) "LSPLL"}
		"extref"					{set Para(topic) "EXTREF"}

		"clock control"				{set Para(topic) "clockcontrol"}
		"oscillator"				{set Para(topic) "OCS"}
		"mipi_dphy"					{set Para(topic) "MIPI_DPHY"}
		"i2c"						{set Para(topic) "I2C"}
		"pmu"						{set Para(topic) "PMU"}

		default						{set Para(topic) ""}
	}

	#set Para(webhelp) "$Para(webhelp)$Para(topic)&single=true"
	set Para(webhelp) "$Para(webhelp)$Para(topic)"

	#tk_messageBox -default ok -icon warning -message $Para(webhelp) -title "URL" -type ok
}

proc GetHelpTopic {} {
	global Para
	if {$Para(bali) == "false"} {
		GetLeverHelpTopic
	} else {
		GetBaliHelpTopic
	}
}

proc GeneralConfig {}  {
	global Para

	set tnb $Para(tnb)
	#21105, #23098
	if {[string length $Para(InterCoreName)] != 0}  {
		wm title . "Lattice FPGA Module -- $Para(InterCoreName)"
	} else  {
		wm title . "Lattice FPGA Module -- $Para(CoreName)"
	}
	#wm title . "Lattice FPGA Module -- $Para(CoreName)"

	if {$Para(CoreName) == "Adder" ||
		$Para(CoreName) == "Adder_Subtractor" ||
		$Para(CoreName) == "Comparator" ||
		$Para(CoreName) == "Convert" ||
		$Para(CoreName) == "Counter" ||
		$Para(CoreName) == "FFT_Butterfly" ||
		$Para(CoreName) == "LFSR" ||
		$Para(CoreName) == "Complex_Multiplier" ||
		$Para(CoreName) == "Multiplier" ||
		$Para(CoreName) == "Multiply_Accumulate" ||
		$Para(CoreName) == "Mult_Add_Sub" ||
		$Para(CoreName) == "Mult_Add_Sub_Sum" ||
		$Para(CoreName) == "Sin-Cos_Table" ||
		$Para(CoreName) == "Subtractor" ||
		$Para(CoreName) == "PLL" ||
		$Para(CoreName) == "Power Controller" ||
		$Para(CoreName) == "Dynamic Bank Controller" ||
		$Para(CoreName) == "Power Guard" ||
		$Para(CoreName) == "DLL" ||
		$Para(CoreName) == "DDR" ||
		$Para(CoreName) == "DQS" ||
		$Para(CoreName) == "SDR" ||
		$Para(CoreName) == "PCS" ||
		$Para(CoreName) == "GIG_Ethernet" ||
		$Para(CoreName) == "10_GIG_Ethernet" ||
		$Para(CoreName) == "PCI/ASI" ||
		$Para(CoreName) == "System_Bus" ||
		$Para(CoreName) == "ADDER_TREE" ||
		$Para(CoreName) == "MAC" ||
		$Para(CoreName) == "MULT" ||
		$Para(CoreName) == "MULTADDSUB" ||
		$Para(CoreName) == "MULTADDSUBSUM" ||
		$Para(CoreName) == "WIDE_MUX" ||
		$Para(CoreName) == "BARREL_SHIFTER" ||
		$Para(CoreName) == "Distributed_DPRAM" ||
		$Para(CoreName) == "Distributed_ROM" ||
		$Para(CoreName) == "Distributed_SPRAM" ||
		$Para(CoreName) == "RAM_Based_Shift_Register" ||
		$Para(CoreName) == "Tag Memory" ||
		$Para(CoreName) == "FIFO" ||
		$Para(CoreName) == "FIFO_DC" ||
		$Para(CoreName) == "RAM_DP" ||
		$Para(CoreName) == "RAM_DP_TRUE" ||
		$Para(CoreName) == "RAM_DQ" ||
		$Para(CoreName) == "ROM" ||
		$Para(CoreName) == "Clock Control" ||
		$Para(CoreName) == "Oscillator" }  {
		$tnb delete 0
		iwidgets::combobox .cboBusOrder -labeltext "Bus Ordering Style:" -labelpos nw \
				-width 25 -textvariable Para(Order) -editable false -selectioncommand {SelectOrderCmd}
		.cboBusOrder insert list end "Big Endian \[MSB:LSB\]" "Little Endian \[LSB:MSB\]" "None"
		pack .cboBusOrder -in $Para(f1) -side bottom -pady 8
		$tnb view 0
	}
	if {$Para(CoreName) == "MAC" ||
		$Para(CoreName) == "MULT" ||
		$Para(CoreName) == "MULTADDSUB" ||
		$Para(CoreName) == "MULTADDSUBSUM"}  {
		.cboBusOrder config -labelpos w
	}
	if {$Para(CoreName) == "DDR_GENERIC" ||
		$Para(CoreName) == "DDR_MEM" ||
		$Para(CoreName) == "DLL" ||
		$Para(CoreName) == "DQS" ||
		$Para(CoreName) == "PCS" ||
		$Para(CoreName) == "GIG_Ethernet" ||
		$Para(CoreName) == "10_GIG_Ethernet" ||
		$Para(CoreName) == "PCI/ASI" ||
		$Para(CoreName) == "System_Bus" ||
		$Para(CoreName) == "PLL" ||
		$Para(CoreName) == "Clock Control" ||
		$Para(CoreName) == "Oscillator"	} {
		pack forget .cboBusOrder
	}

	GetHelpTopic
}

proc GetEnvVariables {}  {
	global env Para tcl_platform

	if {$Para(bali) == "true"} {return}

    set ispsys_file [file join $Para(leverpath) ispcpld config "ispsys.ini"]

	if {[catch {set fileid [open $ispsys_file]} msg]} {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $ispsys_file file!" \
			-title "Generate error" \
			-type ok
		set err_msg "ERROR - Cannot open $ispsys_file."
		SendMessage $err_msg
		return -1
	}

	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[Settings\]"] == 0} {
			continue
		}
		if [regexp {([^=]*)=(.*)} $line match parameter value] {
			if [regexp {([ |\t]*;)} $parameter match] {continue}
			if [regexp {(.*)[ |\t]*;} $value match temp] {
				set EnvVar($parameter) $temp
			} else {
				set parameter [string trim $parameter]
				set EnvVar($parameter) $value
			}
		}
	}
	close $fileid

	#tk_messageBox -default ok -icon warning -message $EnvVar(DefaultProduct) -title "DefaultProduct" -type ok
	set lscfile $EnvVar(IniFileName)
	set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
	set lsvini_path [file join $lsvini_dir $lscfile]
	if {[catch {set fid [open $lsvini_path]} msg]} {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $lsvini_path file!" \
			-title "Generate error" \
			-type ok
		set err_msg "ERROR - Cannot open $lsvini_path."
		SendMessage $err_msg
		return false
	} else {set data [read $fid]; close $fid }
	foreach line [split $data '\n'] {
		set lline [string tolower $line]
		set lline [string trim $lline]
		if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
		if {$path && [regexp {^\[} $lline]} {set path 0; break}
		if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
		if {$path && [regexp {^config} $lline]} {set config_dir $line; continue}
		if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
		if {$path && [regexp {^root} $lline]} {set root_dir $line}
	}

	set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
	regsub -all "\"" $cpld_bin "" cpld_bin
	set cpld_bin [file join $cpld_bin]
	set config_dir [string range $config_dir [expr [string first "=" $config_dir]+1] end]
	regsub -all "\"" $config_dir "" config_dir
	set config_dir [file join $config_dir]
	set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
	regsub -all "\"" $fpga_dir "" fpga_dir
	set fpga_dir [file join $fpga_dir]
	set root_dir [string range $root_dir [expr [string first "=" $root_dir]+1] end]
	regsub -all "\"" $root_dir "" root_dir
	set root_dir [file join $root_dir]
#	tk_messageBox -default ok -icon warning -message $cpld_bin -title "cpld_bin" -type ok
#	tk_messageBox -default ok -icon warning -message $config_dir -title "config_dir" -type ok
#	tk_messageBox -default ok -icon warning -message $fpga_dir -title "fpga_dir" -type ok
#	tk_messageBox -default ok -icon warning -message $root_dir -title "root_dir" -type ok

	set Para(Bin) $cpld_bin
	set Para(Config) $config_dir
	set Para(FPGAPath) $fpga_dir
	set Para(Root) $root_dir
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

#*************************************
# GetFpscEngineLocation
#*************************************
proc GetFpscEngine {} {
	global env tcl_platform Para

	set platformpath [GetPlatform]

	if {$Para(bali) == "false"} {
		set fpsc $Para(FPGAPath)
	} else {
		set fpsc $Para(FOUNDRY)
	}
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

#******************************************************************************
# Public Template Function:
#		Call Back proc for Generate Ports to draw pins
#  Input: None
# Output: ports (prts string)
#******************************************************************************
proc GetPorts {}  {
	global Para env

	#ISPL_CR_31787
	set modulename $Para(ModuleName)
	set Para(ModuleName) dummy_sym

	set ret [CreatePpFile]
	if {$ret == -1} {return -1}

	set ppFile  "$Para(ModuleName).pp"
	set orcappFile  [GetFpscEngine]
	catch {exec $orcappFile -$Para(Fdir) $ppFile} ret

	if {$Para(bali) == "false"} {
		set tft_file [file join $Para(Root) generic symbol.tft]
	} else {
		set tft_file [file join $env(TOOLRTF) data templates symbol.tft]
	}
	if {[file exists $tft_file] == 0} {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $tft_file file!" \
			-title "Open file error" \
			-type ok
		return -1
	}
	set p_dir $Para(Root)/generic
	if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog"]} {
		set vlog2jhd [GetVlog2Jhd]
		catch {exec $vlog2jhd -tfi -mod $Para(ModuleName) -out res -ext sym -tpl $tft_file $Para(ModuleName).v} ret
		#tk_messageBox -default ok -icon warning -message $ret -title "hdl2jhd" -type ok
		set v_file [file join $Para(ProjectPath) $Para(ModuleName).v]
		if {[file exists $v_file]}  {file delete -force $v_file}
	}

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] || \
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		set vhd2naf [GetVhd2Naf]
		catch {exec $vhd2naf -tfi -mod $Para(ModuleName) -out res -ext sym -tpl $tft_file $Para(ModuleName).vhd} ret
		#tk_messageBox -default ok -icon warning -message $ret -title "hdl2jhd" -type ok
		set vhd_file [file join $Para(ProjectPath) $Para(ModuleName).vhd]
		if {[file exists $vhd_file]}  {file delete -force $vhd_file}
	}

	set sym_file [file join $Para(ProjectPath) res.sym]
	if [catch {open $sym_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $sym_file file!" \
			-title "Open file error" \
			-type ok
		exit -1
	}
	while {[gets $fileid line] >= 0} {lappend ports $line}
	close $fileid

	set tft_file [file join $Para(ProjectPath) $Para(ModuleName).tft]
	if {[file exists $tft_file]}  {file delete -force $tft_file}
	if {[file exists $ppFile]}    {file delete -force $ppFile}
	if {[file exists $sym_file]}  {file delete -force $sym_file}
	set sym_txt_file [file join $Para(ProjectPath) $Para(ModuleName).txt]
	if {[file exists $sym_txt_file]}  {file delete -force $sym_txt_file}

	set Para(ModuleName) $modulename

	return $ports
}

#****************
# call asbgen to get the port string for MACO.
#****************
proc GetAsbPorts {}  {
	global Para env tcl_platform

	set CurrentPath [pwd]
	set modulename $Para(ModuleName)

	set platformpath [GetPlatform]
	#set Para(ModuleName) dummy_sym

	switch $tcl_platform(platform) {
		windows {set asbgen [file join $Para(FOUNDRY) "bin" $platformpath "asbgen.exe"]}
		unix {
			if {$tcl_platform(os) == "Linux"}  {
				set asbgen [file join $Para(FOUNDRY) "bin" $platformpath "asbgen"]
			} else  {
				set asbgen [file join $Para(FOUNDRY) "bin" $platformpath "asbgen"]
			}
		}
	}

	if {[file exists $asbgen] == 0} {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $asbgen file!" \
			-title "Open file error" \
			-type ok

		return -1
	}

	set Para(Asbgen_Engine) $asbgen

	if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog"]} {
		set lang verilog
	}

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] || \
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		set lang vhdl
	}
	set lpc_file [file join $Para(ProjectPath) $Para(ModuleName).lpc]
	if {[file exists $lpc_file] == 0} {
		if {$Para(arch) == "sa5p00m" || $Para(arch) == "sa5p00g"} {
			set lpc_file [file join $Para(ipdir) sa5p00 preference default.lpc]
		} else {
			set lpc_file [file join $Para(ipdir) $Para(family) preference default.lpc]
		}
	}

	switch $Para(CoreName) {
		LSPLL {set arg "l"}
		HSPLL {set arg "l"}
		EXTREF {set arg "e"}
		PCS {set arg "p"}
	}
	set ret [catch {eval exec \"$asbgen\" -n \"$Para(ModuleName)\" -lang \"$lang\" -arch $Para(arch) -f$arg \"$lpc_file\" -symbol} msg]
	set Para(ModuleName) $modulename

	#tk_messageBox -default ok -icon warning -message $ret -title "Get ports" -type ok

	#tk_messageBox -default ok -icon warning -message $msg -title "Get ports" -type ok

	set Para(scuba_error_msg) ""
	if {$ret != 0} {
		set Para(scuba_error_msg) $msg
		return -1
	}

	return $msg
}

proc GetDummyAsbPorts {}  {
	global Para

	set CurrentPath [pwd]
	set modulename $Para(ModuleName)

	set Para(ModuleName) dummy_module

	set msg [GetAsbPorts]

	set dummy_lpc_file [file join $Para(ProjectPath) $Para(ModuleName).lpc]
	if {[file exists $dummy_lpc_file]}    {file delete -force $dummy_lpc_file}

	set Para(ModuleName) $modulename

	return $msg
}

proc putsGetPlatform {outputfile} {
	puts $outputfile "#!/usr/local/bin/wish\n"

	puts $outputfile "proc GetPlatform \{\} \{"
	puts $outputfile "	global tcl_platform\n"

	puts $outputfile "	set cpu  \$tcl_platform(machine)\n"

	puts $outputfile "	switch \$cpu \{"
	puts $outputfile "		intel -"
	puts $outputfile "		i*86* \{"
	puts $outputfile "			set cpu ix86"
	puts $outputfile "		\}"
	puts $outputfile "		x86_64 \{"
	puts $outputfile "			if \{\$tcl_platform(wordSize) == 4\} \{"
	puts $outputfile "				set cpu ix86"
	puts $outputfile "			\}"
	puts $outputfile "		\}"
	puts $outputfile "	\}\n"

	puts $outputfile "	switch \$tcl_platform(platform) \{"
	puts $outputfile "		windows \{"
	puts $outputfile "			if \{\$cpu == \"amd64\"\} \{"
	puts $outputfile "				# Do not check wordSize, win32-x64 is an IL32P64 platform."
	puts $outputfile "				set cpu x86_64"
	puts $outputfile "			\}"
	puts $outputfile "			if \{\$cpu == \"x86_64\"\} \{"
	puts $outputfile "				return \"nt64\""
	puts $outputfile "			\} else \{"
	puts $outputfile "				return \"nt\""
	puts $outputfile "			\}"
	puts $outputfile "		\}"
	puts $outputfile "		unix \{"
	puts $outputfile "			if \{\$tcl_platform(os) == \"Linux\"\}  \{"
	puts $outputfile "				if \{\$cpu == \"x86_64\"\} \{"
	puts $outputfile "					return \"lin64\""
	puts $outputfile "				\} else \{"
	puts $outputfile "					return \"lin\""
	puts $outputfile "				\}"
	puts $outputfile "			\} else  \{"
	puts $outputfile "				return \"sol\""
	puts $outputfile "			\}"
	puts $outputfile "		\}"
	puts $outputfile "	\}"
	puts $outputfile "	return \"nt\""
	puts $outputfile "\}\n"
}

#****************
# output generate_core.tcl for MACO.
#****************
proc CreateGenerateFile {} {
	global Para

	set generate_file [file join $Para(ProjectPath) "generate_core.tcl"]

	if [catch {open $generate_file w} outputfile] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $generate_file file!" \
			-title "Generate error" \
			-type ok
		return -1
	}

	putsGetPlatform $outputfile

	puts $outputfile "set platformpath \[GetPlatform\]"

	puts $outputfile "set Para(spx_dir) \[file dirname \[info script\]\]"
	puts $outputfile "set Para(install_dir) \$env(TOOLRTF)"
	puts $outputfile "set Para(FPGAPath) \"\[file join \$Para(install_dir) ispfpga bin \$platformpath\]\"\n"

	puts $outputfile "set asbgen \"\$Para(FPGAPath)\/asbgen\""
	puts $outputfile "set modulename \"$Para(ModuleName)\""
	if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog"]} {
		puts $outputfile "set lang \"verilog\""
	}

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] || \
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		puts $outputfile "set lang \"vhdl\""
	}
	#set lpc_file [file join $Para(ProjectPath) $Para(ModuleName).lpc]
	puts $outputfile "set lpcfile \"\$Para(spx_dir)\/\$modulename.lpc\""
	puts $outputfile "set arch \"$Para(arch)\""

	switch $Para(CoreName) {
		LSPLL {set arg "l"}
		HSPLL {set arg "l"}
		EXTREF {set arg "e"}
		PCS {set arg "p"}
	}
	puts $outputfile "set Para(result) \[catch \{exec \"\$asbgen\" -n \"\$modulename\" -lang \"\$lang\" -arch \"\$arch\"\ -f$arg \"\$lpcfile\"\} msg\]"
	puts $outputfile "#puts \$msg"
#	puts $outputfile "\}"

	close $outputfile
}

#****************
# output generate_core.tcl for Scuba modules.
#****************
proc CreateGenerateCoreFile {} {
	global Para

	set generate_file [file join $Para(ProjectPath) "generate_core.tcl"]

	if [catch {open $generate_file w} outputfile] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $generate_file file!" \
			-title "Generate error" \
			-type ok
		return -1
	}

	putsGetPlatform $outputfile

	puts $outputfile "proc GetCmdLine \{lpcfile\} \{"
	puts $outputfile "	global Para"
	puts $outputfile ""
	puts $outputfile "	if \[catch \{open \$lpcfile r\} fileid\] \{"
	puts $outputfile "		puts \"Cannot open \$para_file file!\""
	puts $outputfile "		exit -1"
	puts $outputfile "	\}"
	puts $outputfile ""
	puts $outputfile "	seek \$fileid 0 start"
	puts $outputfile "	set default_match 0"
	puts $outputfile "	while \{\[gets \$fileid line\] >= 0\} \{"
	puts $outputfile "		if \{\[string first \"\\\[Command\\\]\" \$line\] == 0\} \{"
	puts $outputfile "			set default_match 1"
	puts $outputfile "			continue"
	puts $outputfile "		\}"
	puts $outputfile "		if \{\[string first \"\\\[\" \$line\] == 0\} \{"
	puts $outputfile "			set default_match 0"
	puts $outputfile "		\}"
	puts $outputfile "		if \{\$default_match == 1\} \{"
	puts $outputfile "			if \[regexp \{(\[^=\]*)=(.*)\} \$line match parameter value\] \{"
	puts $outputfile "				if \[regexp \{(\[ |\\t\]*;)\} \$parameter match\] \{continue\}"
	puts $outputfile "				if \[regexp \{(.*)\[ |\\t\]*;\} \$value match temp\] \{"
	puts $outputfile "					set Para(\$parameter) \$temp"
	puts $outputfile "				\} else \{"
	puts $outputfile "					set Para(\$parameter) \$value"
	puts $outputfile "				\}"
	puts $outputfile "			\}"
	puts $outputfile "		\}"
	puts $outputfile "	\}"
	puts $outputfile "	set default_match 0"
	puts $outputfile "	close \$fileid"
	puts $outputfile ""
	puts $outputfile "	return \$Para(cmd_line)"
	puts $outputfile "\}\n"

	puts $outputfile "set platformpath \[GetPlatform\]"

	puts $outputfile "set Para(sbp_path) \[file dirname \[info script\]\]"
	puts $outputfile "set Para(install_dir) \$env(TOOLRTF)"
	puts $outputfile "set Para(FPGAPath) \"\[file join \$Para(install_dir) ispfpga bin \$platformpath\]\"\n"

	puts $outputfile "set scuba \"\$Para(FPGAPath)\/scuba\""
	puts $outputfile "set modulename \"$Para(ModuleName)\""
	if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog"]} {
		puts $outputfile "set lang \"verilog\""
	}

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] || \
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		puts $outputfile "set lang \"vhdl\""
	}
	#set lpc_file [file join $Para(ProjectPath) $Para(ModuleName).lpc]
	puts $outputfile "set lpcfile \"\$Para(sbp_path)\/\$modulename.lpc\""
	puts $outputfile "set arch \"$Para(arch)\""

	puts $outputfile "set cmd_line \[GetCmdLine \$lpcfile\]"
	puts $outputfile "set fdcfile \"\$Para(sbp_path)\/\$modulename.fdc\""
	puts $outputfile "if \{\[file exists \$fdcfile\] == 0\} \{"
	puts $outputfile "	append scuba \" \" \$cmd_line"
	puts $outputfile "\} else \{"
	if {[string equal -nocase $Para(CoreName) "pmu"] ||
		[string equal -nocase $Para(CoreName) "i2c"]}  {
		puts $outputfile "	append scuba \" \" \$cmd_line"
	} else {	
		puts $outputfile "	append scuba \" \" \$cmd_line \" \" -fdc \" \" \\\"\$fdcfile\\\""
	}	
	puts $outputfile "\}"
	puts $outputfile "set Para(result) \[catch \{eval exec \"\$scuba\"\} msg\]"
	puts $outputfile "#puts \$msg"

	close $outputfile
}

#****************
# Is run synpwrap for Scuba modules.
#****************
proc isNgdModule {} {
	global Para

	set core_name [string tolower $Para(CoreName)]
	switch $core_name {
		"convert" -
		"pll" -
		"pcs" -
		"extref" -
		"ddr_generic" -
		"ddr_mem" -
		"gddr_7:1" {return true}
		default {return false}
	}
}

#****************
# Is run synplify for Scuba modules.
#****************
proc synplifyFlow {outputfile} {
	global Para

	puts $outputfile "\#create response file(*.cmd) for Synpwrap"
	puts $outputfile "proc CreateCmdFile \{\} \{"
	puts $outputfile "	global Para\n"

	puts $outputfile "	file mkdir \"\$Para(sbp_path)\/syn_results\""
	puts $outputfile "	if \[catch \{open \$Para(ModuleName).cmd w\} rspFile\] \{"
	puts $outputfile "		puts \"Cannot create response file \$Para(ModuleName).cmd.\""
	puts $outputfile "		exit -1"
	puts $outputfile "	\} else \{"
	puts $outputfile "		puts \$rspFile \"PROJECT: \$Para(ModuleName)"
	puts $outputfile "		working_path: \\\"\$Para(sbp_path)\/syn_results\\\""
	puts $outputfile "		module: \$Para(ModuleName)"

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		if {$Para(CoreName) == "PCS"} {
			if {$Para(SOFTLOL) == "Disabled" && $Para(RSTSEQSEL) == "Disabled"} {
				puts $outputfile "		verilog_file_list: \\\"\$Para(sbp_path)\/\$Para(ModuleName).vhd\\\""
			} else {
				puts $outputfile "		verilog_file_list: \\\"\$Para(sbp_path)\/\$Para(ModuleName).vhd\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName)_softlogic.v\\\""
			}
		} else {
			puts $outputfile "		verilog_file_list: \\\"\$Para(sbp_path)\/\$Para(ModuleName).vhd\\\""
		}
		puts $outputfile "		vlog_std_v2001: true"
	} else {
		if {$Para(CoreName) == "PCS"} {
			if {$Para(SOFTLOL) == "Disabled" && $Para(RSTSEQSEL) == "Disabled"} {
				if {$Para(arch) == "sa5p00g"} {
					puts $outputfile "		verilog_file_list: \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/\ecp5um.v\\\" \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/pmi_def.v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName).v\\\""				
				} elseif {$Para(arch) == "wi5s00"}  {
					puts $outputfile "		verilog_file_list: \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/\lifmd.v\\\" \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/pmi_def.v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName).v\\\""				
				} else {
					puts $outputfile "		verilog_file_list: \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/\$Para(tech_cae).v\\\" \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/pmi_def.v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName).v\\\""				
				}
			} else {
				if {$Para(arch) == "sa5p00g"} {
					puts $outputfile "		verilog_file_list: \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/\ecp5um.v\\\" \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/pmi_def.v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName).v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName)_softlogic.v\\\""			
				} elseif {$Para(arch) == "wi5s00"}  {
					puts $outputfile "		verilog_file_list: \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/\lifmd.v\\\" \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/pmi_def.v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName).v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName)_softlogic.v\\\""			
				} else {
					puts $outputfile "		verilog_file_list: \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/\$Para(tech_cae).v\\\" \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/pmi_def.v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName).v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName)_softlogic.v\\\""			
				}
			}
		} else {
			if {$Para(arch) == "sa5p00g"} {
				puts $outputfile "		verilog_file_list: \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/\ecp5um.v\\\" \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/pmi_def.v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName).v\\\""
			} elseif {$Para(arch) == "wi5s00"}  {
				puts $outputfile "		verilog_file_list: \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/\lifmd.v\\\" \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/pmi_def.v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName).v\\\""
			} else {
				puts $outputfile "		verilog_file_list: \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/\$Para(tech_cae).v\\\" \\\"\$Para(install_dir)\/cae_library\/synthesis\/verilog\/pmi_def.v\\\" \\\"\$Para(sbp_path)\/\$Para(ModuleName).v\\\""
			}
		}
		puts $outputfile "		vlog_std_v2001: true"
	}
	puts $outputfile "		constraint_file_name: \\\"\$Para(sbp_path)\/\$Para(ModuleName).fdc\\\""
	puts $outputfile "		suffix_name: edn"
	puts $outputfile "		output_file_name: \$Para(ModuleName)"
	puts $outputfile "		write_prf: true"
	puts $outputfile "		disable_io_insertion: true"
	puts $outputfile "		force_gsr: false"
	puts $outputfile "		frequency: \$Para(FMax)"
	puts $outputfile "		fanout_limit: 50"
	puts $outputfile "		retiming: false"
	puts $outputfile "		pipe: false"
	puts $outputfile "		part: \$Para(PartType)"
	puts $outputfile "		speed_grade: \$Para(SpeedGrade)"
	puts $outputfile "		\""
	puts $outputfile "		close \$rspFile"
	puts $outputfile "	\}"
	puts $outputfile "\}\n"

	#synpwrap -rem -e prep1 -target LATTICE-EC -part LFEC20E
	puts $outputfile "\#synpwrap"
	puts $outputfile "CreateCmdFile"
	puts $outputfile "set synpwrap \"\$Para(bin_dir)\/synpwrap\""
	puts $outputfile "if \{\[file exists \$fdcfile\] == 0\} \{"
	puts $outputfile "	set Para(result) \[catch \{eval exec \$synpwrap -rem -e \$Para(ModuleName) -target \$Para(tech_syn)\} msg\]"
	puts $outputfile "\} else \{"
	
	if {[string equal -nocase $Para(CoreName) "pmu"] ||
		[string equal -nocase $Para(CoreName) "i2c"]}  {
		puts $outputfile "	set Para(result) \[catch \{eval exec \$synpwrap -rem -e \$Para(ModuleName) -target \$Para(tech_syn)\} msg\]"
	} else {	
		puts $outputfile "	set Para(result) \[catch \{eval exec \$synpwrap -rem -e \$Para(ModuleName) -target \$Para(tech_syn) -fdc \$fdcfile\} msg\]"
	}	
	puts $outputfile "\}"
	puts $outputfile "\#puts \$msg\n"
}

#****************
# Is run LSE for Scuba modules.
#****************
proc lseFlow {outputfile} {
	global Para

	puts $outputfile "\#create LSE project file(*.synproj)"

	puts $outputfile "proc CreateSynprojFile \{\} \{"
	puts $outputfile "	global Para\n"

	puts $outputfile "	if \[catch \{open \$Para(ModuleName).synproj w\} synprojFile\] \{"
	puts $outputfile "		puts \"Cannot create LSE project file \$Para(ModuleName).synproj.\""
	puts $outputfile "		exit -1"
	puts $outputfile "	\} else \{"
	puts $outputfile "		puts \$synprojFile \"-a \\\"\$Para(tech_syn)\\\""
	puts $outputfile "-d \$Para(PartType)"
	puts $outputfile "-t \$Para(Package)"
	puts $outputfile "-s \$Para(SpeedGrade)"
	puts $outputfile "-frequency 200"
	puts $outputfile "-optimization_goal Balanced"
	puts $outputfile "-bram_utilization 100"
	puts $outputfile "-ramstyle auto"
	puts $outputfile "-romstyle auto"
	puts $outputfile "-use_carry_chain 1"
	puts $outputfile "-carry_chain_length 0"
	puts $outputfile "-force_gsr auto"
	puts $outputfile "-resource_sharing 1"
	puts $outputfile "-propagate_constants 1"
	puts $outputfile "-remove_duplicate_regs 1"
	puts $outputfile "-mux_style Auto"
	puts $outputfile "-max_fanout 1000"
	puts $outputfile "-fsm_encoding_style Auto"
	puts $outputfile "-twr_paths 3"
	puts $outputfile "-fix_gated_clocks 1"
	puts $outputfile "-use_io_insertion 0"
	puts $outputfile "-resolve_mixed_drivers 0"
	puts $outputfile "-use_io_reg 1"
	puts $outputfile ""
	puts $outputfile "-lpf 1"
	puts $outputfile "-p \$Para(sbp_path)"

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		puts $outputfile "-vhd \$Para(sbp_path)\/\$Para(ModuleName).vhd"
	} else {
		if {$Para(arch) == "sa5p00g"} {
			puts $outputfile {-ver \"$Para(install_dir)/cae_library/synthesis/verilog/ecp5um.v\"}
		} elseif {$Para(arch) == "wi5s00"}  {
			puts $outputfile {-ver \"$Para(install_dir)/cae_library/synthesis/verilog/lifmd.v\"}
		} else {
			puts $outputfile {-ver \"$Para(install_dir)/cae_library/synthesis/verilog/$Para(tech_cae).v\"}
		}
		puts $outputfile {\"$Para(install_dir)/cae_library/synthesis/verilog/pmi_def.v\"}
		puts $outputfile {\"$Para(sbp_path)/$Para(ModuleName).v\"}
	}
	if {$Para(CoreName) == "PCS" && ($Para(SOFTLOL) == "Enabled" || $Para(RSTSEQSEL) == "Enabled")} {
		puts $outputfile {-ver \"$Para(sbp_path)/$Para(ModuleName)_softlogic.v\"}
	}
	puts $outputfile "-top \$Para(ModuleName)"
	puts $outputfile "-ngo \\\"\$Para(sbp_path)\/\$Para(ModuleName).ngo\\\""

	puts $outputfile "		\""
	puts $outputfile "		close \$synprojFile"
	puts $outputfile "	\}"
	puts $outputfile "\}\n"

	puts $outputfile "\#LSE"
	puts $outputfile "CreateSynprojFile"
	#synthesis -f modulename.synproj -sdc modulename.ldc -gui
	puts $outputfile "set ldcfile \"\$Para(sbp_path)\/\$Para(ModuleName).ldc\""
	puts $outputfile "set synthesis \"\$Para(FPGAPath)\/synthesis\""
	puts $outputfile "if \{\[file exists \$ldcfile\] == 0\} \{"
	puts $outputfile "	set Para(result) \[catch \{eval exec \$synthesis -f \\\"\$Para(ModuleName).synproj\\\" -gui\} msg\]"
	puts $outputfile "\} else \{"
	puts $outputfile "	set Para(result) \[catch \{eval exec \$synthesis -f \\\"\$Para(ModuleName).synproj\\\" -sdc \\\"\$ldcfile\\\" -gui\} msg\]"
	puts $outputfile "\}"
	puts $outputfile "\#puts \$msg\n"
}

#****************
# output generate_ngd.tcl for Scuba modules.
#****************
proc CreateGenerateNGDFile {} {
	global Para

	set generate_file [file join $Para(ProjectPath) "generate_ngd.tcl"]

	if [catch {open $generate_file w} outputfile] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $generate_file file!" \
			-title "Generate error" \
			-type ok
		return -1
	}

	putsGetPlatform $outputfile

	puts $outputfile "set platformpath \[GetPlatform\]"
	puts $outputfile "set Para(sbp_path) \[file dirname \[info script\]\]"
	puts $outputfile "set Para(install_dir) \$env(TOOLRTF)"
	puts $outputfile "set Para(FPGAPath) \"\[file join \$Para(install_dir) ispfpga bin \$platformpath\]\""
	puts $outputfile "set Para(bin_dir) \"\[file join \$Para(install_dir) bin \$platformpath\]\"\n"

	puts $outputfile "set Para(ModuleName) \"$Para(ModuleName)\""
	puts $outputfile "set Para(Module) \"$Para(CoreName)\""
	puts $outputfile "set Para(libname) $Para(family)"
	puts $outputfile "set Para(arch_name) $Para(arch)"
	puts $outputfile "set Para(PartType) \"$Para(PartType)\"\n"

	puts $outputfile "set Para(tech_syn) $Para(family)"
	puts $outputfile "set Para(tech_cae) $Para(family)"
	puts $outputfile "set Para(Package) \"$Para(Package)\""
	puts $outputfile "set Para(SpeedGrade) \"$Para(SpeedGrade)\""
	puts $outputfile "set Para(FMax) \"100\""
	puts $outputfile "set fdcfile \"\$Para(sbp_path)\/\$Para(ModuleName).fdc\"\n"

	if {$Para(synthesistool) == "synplify"} {
		if {[isNgdModule] == "true"} {
			#synpplify flow
			synplifyFlow $outputfile
		}

		#edif2ngd -l <library_name> <source>.edn
		puts $outputfile "\#edif2ngd"
		puts $outputfile "set edif2ngd \"\$Para(FPGAPath)\/edif2ngd\""
		if {[isNgdModule] == "true"} {
			puts $outputfile "set Para(result) \[catch \{eval exec \$edif2ngd -l \$Para(libname) -d \$Para(PartType) -nopropwarn \\\"syn_results\/\$Para(ModuleName).edn\\\" \$Para(ModuleName).ngo\} msg\]"
		} else {
			puts $outputfile "set Para(result) \[catch \{eval exec \$edif2ngd -l \$Para(libname) -d \$Para(PartType) -nopropwarn \$Para(ModuleName).edn \$Para(ModuleName).ngo\} msg\]"
		}
		puts $outputfile "\#puts \$msg\n"
	} else {
		#LSE flow
		lseFlow $outputfile
	}

	#ngdbuild -a LatticeSC %design%.ngo %design%.ngd
	puts $outputfile "\#ngdbuild"
	puts $outputfile "set ngdbuild \"\$Para(FPGAPath)\/ngdbuild\""
	puts $outputfile "set Para(result) \[catch \{eval exec \$ngdbuild -addiobuf -dt -a \$Para(arch_name) \$Para(ModuleName).ngo \$Para(ModuleName).ngd\} msg\]"
	puts $outputfile "\#puts \$msg"

	close $outputfile
}

proc Convert {ret}  {
	global Para tcl_platform

	set Para(MemFile) $ret
	#Make Lower Case
	switch $tcl_platform(platform) {
		windows {
			set newPrjPath [string tolower $Para(ProjectPath)]
			set newMemPath [string tolower [file dirname $Para(MemFile)]]
			set mem_file [string tolower [file tail $Para(MemFile)]]
		}
		unix {
			set newPrjPath $Para(ProjectPath)
			set newMemPath [file dirname $Para(MemFile)]
			set mem_file [file tail $Para(MemFile)]
		}
	}

	#Convert all "\\" to "/" in Path String
	set newPrjPath [join [split $newPrjPath "\\"] "/"]
	set newMemPath [join [split $newMemPath "\\"] "/"]

	#Convert all "////...//" to "/" in Path String
	set newList {}
	set tmpList [split $newPrjPath "/"]
	foreach x $tmpList  {
		if {$x != {}}  {
			lappend newList $x
		}
	}
	set newPrjPath [join $newList "/"]

	set newList {}
	set tmpList [split $newMemPath "/"]
	foreach x $tmpList  {
		if {$x != {}}  {
			lappend newList $x
		}
	}
	set newMemPath [join $newList "/"]

	#Try to search Proj Path in Mem path
	set len [string length $newPrjPath]
	incr len -1
	set tmpStr [string range $newMemPath 0 $len]
	if {[string compare $tmpStr $newPrjPath] != 0}  {
		set Para(Result) $newMemPath
	} else  {
	   if {[string index $newPrjPath end] != "/"}  {
			incr len
	   }
	   incr len
	   set Para(Result) [string range $newMemPath $len end]
	}
	#set Para(ProjectPath) $newPrjPath
	set Para(MemFile) [file join $Para(Result) $mem_file]
	if {$tcl_platform(platform)=="unix"} {
		if {[string first "/" $Para(MemFile)] != -1 }  {
			set Para(MemFile) [file join "/" $Para(Result) $mem_file]
		}
	}
}

proc SelectMemFile {}  {
	global Para tcl_platform

	set mem_file_dir [file dirname $Para(MemFile)]
	set mem_file [file tail $Para(MemFile)]
	set file_mem [file join $mem_file_dir $mem_file]
	set tmp_file [file join $Para(ProjectPath) $mem_file]

	#string to lower
	if {$tcl_platform(platform) == "windows"}  {
		set file_mem_l [string tolower $file_mem]
		set tmp_file_l [string tolower $tmp_file]
	} else  {
		set file_mem_l $file_mem
		set tmp_file_l $tmp_file
	}
	if {$file_mem_l == $tmp_file_l} {
		set str [file tail $Para(MemFile)]
	} else {
		if {[file exists $tmp_file]} {
			set msg "$mem_file is exists in $Para(ProjectPath), overwrite it?"
			set tit "Memory File"
			set ret [tk_messageBox -icon question -message $msg -title $tit -type yesno]
			if {$ret == "yes"} {
				catch {file copy -force $Para(MemFile) $tmp_file}
			}
		} else {
			catch {file copy -force $Para(MemFile) $tmp_file}
		}
	}
	set Para(MemFile) $tmp_file
}

proc ProcessMemFile {}  {
	global Para
	if {[string length $Para(MemFile)] > 0 } {
		set str [file tail $Para(MemFile)]
	} else {
	    set str ""
	}
	return $str
}

#*******************************************
# Function template for graphical image
#*******************************************
proc DrawBlankImage {} {
	global ft Para

	set diagram $Para(diagram)

	set H [$diagram cget -height]
	set W [$diagram cget -width]
	$diagram addtag allpins all
	$diagram delete allpins

	set txt "For more information on this\nmodule, please click the\n Help button."
	$diagram create text [expr $W/2] [expr $H/2] -text $txt -font $ft

	#pack $diagram -in .leftTop -fill y
}

proc GetPortStr {}  {
	global Para init_flag pin_flag
	#*** Get current module's argument ***
	if {[info exists Para(arch)] == 0}  {SetArchValue}
	if {[string length $Para(ModuleName)] == 0}  {
		set Para(ModuleName) test
		set Para(EDIF) 1
		set Para(MemFile) ""
	}

	#set ret [CheckParameterCB]
	#if {$ret == -1} {return -1}

	set str [GenerateCB]

	set scuba [GetScubaEngine]

	#*** General Options Command arguments ***
	set cmd [GetGeneralArgs]
	if {$init_flag == "0"} {
		set init_flag 1
	}

	append cmd_line $scuba " -w -n" " " $Para(ModuleName) $cmd " " $str
	append command_line [list $scuba] " -w -n" " " $Para(ModuleName) $cmd " " $str

	if {$pin_flag == "ecxp"}  {
		lappend command_line -symbol1
		set ret [catch {eval exec $command_line} msg]
		if {$ret != 1} {return -1}
	} else  {
		lappend command_line -symbol
		set ret [catch {eval exec $command_line} msg]
		if {$ret != 0} {return -1}
	}

#	tk_messageBox -default ok -icon warning -message $ret -title "Get ports" -type ok

#	tk_messageBox -default ok -icon warning -message $msg -title "Get ports" -type ok

	return $msg
}

#*******************************************
# Function template for draw all pins twice or more.
#*******************************************
proc DrawBusPins {} {
	global Para ft pin_flag in_pins out_pins

	set diagram $Para(diagram)

	set H $Para(canvas_width)
	set W $Para(canvas_height)

	# clear all items in canvas
	$diagram addtag allpins all
	$diagram delete allpins

	# draw all items in canvas
	if {[string length $Para(InterCoreName)] != 0}  {
		$diagram create text [expr $W/2] 20 -text $Para(InterCoreName)
	} else  {
		$diagram create text [expr $W/2] 20 -text $Para(CoreName)
	}

	set rect(x) 35
	set rect(y) 40
	set rect(width) [expr $W-70]
	set rect(height) [expr $H-60]

	# No Pin image
	if {$pin_flag == 0} {
		return
	}

	set ports_line 2
	if {$pin_flag == 1} {
		set ret [GetPortStr]
		if {$ret == -1}  {return -1}

		set show_res_flag 0
		set res_txt ""
		set inouts ""
		#append ret "\nLatency: 112"
		set Para(Latency) 0
		foreach line [split $ret '\n'] {
			set line [string trim $line]
			if {[regexp -nocase {^inputs} $line]}  {
				set inputs [split [string range $line [expr [string first : $line]+1] end] ,]
			}
			if {[regexp -nocase {^outputs} $line]}  {
				set outputs [split [string range $line [expr [string first : $line]+1] end] ,]
			}
			if {[regexp -nocase {^inouts} $line]}  {
				set ports_line 3
				set inouts [split [string range $line [expr [string first : $line]+1] end] ,]
			}
			# *** get the resources info ***
			if {[regexp -nocase {^estimated} $line]}  {
				set show_res_flag 1
				set res_txt $line
			}
		}

		#*** show resources info ***
		if {$show_res_flag =="1"} {
			#set res_txt "Estimated Resource Usage:; LUT: 3272; EBR: 512; Reg: 6"
			# *** extr 60 size for resoures info ***
			set H [expr $H + 60]
			$diagram config -height $H
			set rect(height) [expr $H-120]
			set h [expr $H - 120 + 45]

			set i 0
			foreach line [split $res_txt '\;'] {
				set line [string trim $line]
				# *** Latency: 2 ***
				if {[regexp -nocase {^Latency} $line]}  {
					set Para(Latency) [string range $line [expr [string first : $line]+1] end]
				} else {
					if {$i == "0"} {
						$diagram create text [expr $W/2] $h -text $line -anchor n -font $ft
					} else {
						$diagram create text [expr $W/2 -30] $h -text $line -anchor nw -font $ft
					}
					set h [expr $h+10]
					incr i
				}
			}
		}
	}

	# Pin image refer to Datasheet.
	if {$pin_flag == 2} {
		DrawBlankImage
		return
	}

	if {$pin_flag == 3} {
		set inputs $in_pins
		set outputs $out_pins
	}

	if {$pin_flag == "orcapp"} {
		set ret [GetPorts]
		if {$ret == -1}  {return -1}

		set inputs_str [lindex $ret 1]
		set inputs [split [string range $inputs_str [expr [string first : $inputs_str]+1] end] ,]
		set outputs_str [lindex $ret 2]
		set outputs [split [string range $outputs_str [expr [string first : $outputs_str]+1] end] ,]
		if {[llength $ret] > 2}  {
			set ports_line 3
			set inouts_str [lindex $ret 3]
			set inouts [split [string range $inouts_str [expr [string first : $inouts_str]+1] end] ,]
		} else  {
		   set inouts ""
		}
	}

	if {$pin_flag == "ecxp"} {
		set ret [GetPortStr]
		if {$ret == -1}  {return -1}

		foreach line [split $ret '\n'] {
			set line [string trim $line]
			if {[regexp -nocase {^inputs} $line]}  {
				set inputs [split [string range $line [expr [string first : $line]+1] end] ,]
			}
			if {[regexp -nocase {^outputs} $line]}  {
				set outputs [split [string range $line [expr [string first : $line]+1] end] ,]
				break
			}
		}
	}

	if {$pin_flag == "MACO"} {
		#set ret [GetAsbPorts]
		set ret [GetDummyAsbPorts]
		if {$ret == -1}  {return -1}

		foreach line [split $ret '\n'] {
			set line [string trim $line]
			if {[regexp -nocase {^error} $line]}  {
				tk_messageBox -default ok -icon warning -message $line -title "error line" -type ok
			}
			if {[regexp -nocase {^inputs} $line]}  {
				set inputs [split [string range $line [expr [string first : $line]+1] end] ,]
			}
			if {[regexp -nocase {^outputs} $line]}  {
				set outputs [split [string range $line [expr [string first : $line]+1] end] ,]
				break
			}
		}
	}

	if {$ports_line == "3"} {
		set input_num [llength $inputs]
		set inout_num [llength $inouts]
		set input_pin_num [expr $input_num + $inout_num ]
	} else  {
		set input_pin_num [llength $inputs]
	}
	set output_pin_num [llength $outputs]

	#--- draw left pin ---
	set incr_y [expr $rect(height)/[expr $input_pin_num+1]]
	set y [expr $rect(y)+$incr_y]
	foreach pin_name $inputs {
		if {[string length $pin_name] == 0} {
			set y [expr {$y+$incr_y}]
			continue
		}
		$diagram create text [expr $rect(x)+2] $y -anchor w -text $pin_name -font $ft
		if {[string first : $pin_name] == -1}  {
			set line_width 1
		} else  {
			set line_width 3
		}
		set arrow_direction "last"
		$diagram create line 10 $y $rect(x) $y -arrow $arrow_direction -width $line_width
		set y [expr {$y+$incr_y}]
	}

	#--- draw inouts pin --- only for Orcapp
	if {$ports_line == "3"} {
		foreach pin_name $inouts {
			if {[string length $pin_name] == 0} {
				set y [expr {$y+$incr_y}]
				continue
			}
			$diagram create text [expr $rect(x)+2] $y -anchor w -text $pin_name -font $ft
			if {[string first : $pin_name] == -1}  {
				set line_width 1
			} else  {
				set line_width 3
			}
			set arrow_direction "last"
			$diagram create line 10 $y $rect(x) $y -arrow both -width $line_width
			set y [expr {$y+$incr_y}]
		}
	}

	#--- draw right pin ---
	set incr_y [expr $rect(height)/[expr $output_pin_num+1]]
	set y [expr $rect(y) + $incr_y]
	foreach pin_name $outputs {
		if {[string length $pin_name] == 0} {
			set y [expr {$y+$incr_y}]
			continue
		}
		$diagram create text [expr $W-37] $y -anchor e -text $pin_name -fill #000000 -font $ft

		if {[string first : $pin_name] == -1}  {
			set line_width 1
		} else  {
			set line_width 3
		}
		set arrow_direction "last"
		$diagram create line [expr $W-34] $y [expr $W-10] $y -arrow $arrow_direction \
			-width $line_width
		set y [expr {$y+$incr_y}]
	}
	$diagram create rectangle $rect(x) $rect(y) [expr {$rect(x)+$rect(width)}] \
		[expr {$rect(y)+$rect(height)}]
	#pack $diagram -in .leftTop -fill y
}

# 27759 + #28638
proc DrawPins {}  {
	global Para

	if {$Para(Order) != "None"}  {
		DrawBusPins
	} else  {
		set Para(Order) "Big Endian \[MSB:LSB\]"
		DrawBusPins
		set Para(Order) "None"
	}
}

#*******************************************
# Function template for graphical image
#*******************************************
proc DrawImage {W H {ratio {0}}} {
	global ft tcl_platform Para

    set f1 $Para(f1)

	if {$tcl_platform(platform) == "windows"}  {
		set dt [expr [font metrics $ft -ascent]-11]
		set w_n [expr $W/20]
		set h_n [expr $H/20]
		set W [expr $W+$dt*$w_n]
		set H [expr $H+$dt*$h_n]
	}
	set Para(canvas_width) [expr $H+$H*$ratio*0.98]
	set Para(canvas_height) $W
	if {$ratio == 0} {
		set diagram  [canvas $f1.diagram -width $W -height $H -relief sunken -borderwidth 2 -bg #ffffff]
		#set diagram  [canvas $f1.diagram -width $W -relief sunken -borderwidth 2 -bg #ffffff]
		set Para(diagram) $diagram
		DrawPins
		pack $diagram -fill both -expand yes;#-side left
	} else {
		set x $W
		set y [expr $H+$H*$ratio]
		set region [list 0 0 $x $y]
		set diagram  [canvas $f1.diagram -width $W -height $H -relief sunken -borderwidth 2 -bg #ffffff \
			-scrollregion $region -yscrollcommand ".vscroll set"]
		#set diagram  [canvas $f1.diagram -width $W -relief sunken -borderwidth 2 -bg #ffffff \
		#	-scrollregion $region -yscrollcommand ".vscroll set"]
		set Para(diagram) $diagram
		scrollbar .vscroll -command "$Para(diagram) yview"
		DrawPins
		pack $diagram -side left -fill both -expand yes
		pack .vscroll -in $f1 -side left -fill y
	}
}

#*************************************
# Place the main window to the central screen
#*************************************
proc CenterPosition {} {
	global Para
	after idle {
		update idletasks
		regexp {(\d+)x(\d+)\+(-*\d+)\+(-*\d+)} $Para(guiRect) match xmax ymax x y
		set x [expr $x + ($xmax - [winfo reqwidth .])/2]
		set y [expr $y + ($ymax - [winfo reqheight .])/2]
		wm geometry . "+$x+$y"
	}
	set Para(ISPCPLD) $Para(Root)
}

#*************************************
# Check the input value is hex or not
#*************************************
proc hex {i} {
	if [string match {[a-fA-F0-9]} $i] {
		return true
	} else {
		return false
	}
}

#*************************************
# Check the input value is digit or not
#*************************************
proc digit {i} {
	if [string match {[0-9]} $i] {
		return true
	} else {
		return false
	}
}

proc bin {i} {
	if [string match {[0-1]} $i] {
		return true
	} else {
		return false
	}
}

proc double {i} {
	if [string match {[0-9.]} $i] {
		return true
	} else {
		return false
	}
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
		tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		return -1
	}
	if {$para > $max || $para < $min} {
		set msg "$str should be between $min and $max!"
		tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		return -1
	}
	return 0
}

proc IsInList {str lst para} {
	if {[string length $para] == 0} {
		set msg "Please input $str!"
		tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		return -1
	}
	if {[lsearch $lst $para] == -1} {
		set msg "$str is illegal!"
		tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		return -1
	}
	return 0
}

proc IsHex {str len para} {
	set strlen [string length $para]
	if {$strlen != $len} {
		set msg "$str is illegal!"
		tk_messageBox -default ok -icon warning -message $msg -title "Check Parameter" -type ok
		return -1
	}
	for {set i 0} {$i < $len} {incr i} {
		set k [string index $para $i]
		if {[hex $k] == "false"} {
			set msg "$str is illegal!"
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameter" -type ok
			return -1
		}
	}
	return 0
}

#*************************************
# Set Font: ft
#*************************************
proc SetFont {} {
	global tcl_platform ft
	switch $tcl_platform(platform) {
		windows {
			set ft {{MS Sans Serif} 8}
		}
		unix {
			set ft {times -12}
		}
	}
}

#*******************************************
# Label + string
#*******************************************
proc CreateLabelItem {parent main txt str {s {top}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $txt -font $ft
	label .val$main -text $str -font $ft
	pack .lbl$main .val$main -in .frm$main -side left -pady 2 -padx 8
	pack .frm$main -in $parent -side top -anchor w -padx 8
}

#*******************************************
# Label + radiobutton1 + radiobutton2
#*******************************************
proc CreateRadioItem {parent main label lblwidth text1 val1 text2 val2 rdowidth side para {p {}}} {
	global ft
	frame .frm$main
	radiobutton .rdo1$main -text $text1 -width $rdowidth -value $val1 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo2$main -text $text2 -width $rdowidth -value $val2 -variable $para -anchor w -font $ft -command $p
	if {[string length $label] == 0} {
		pack .rdo1$main .rdo2$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor center -padx 8
	} else {
		label .lbl$main -text $label -width $lblwidth -anchor e -font $ft
		pack .lbl$main .rdo1$main .rdo2$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor w -padx 8
	}
}

#*******************************************
# Label + radiobutton1 + radiobutton2 + radiobutton3
#*******************************************
proc Create3RadioItem {parent main label lblwidth text1 val1 text2 val2 text3 val3 rdowidth side para {p {}}} {
	global ft
	frame .frm$main
	radiobutton .rdo1$main -text $text1 -width $rdowidth -value $val1 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo2$main -text $text2 -width $rdowidth -value $val2 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo3$main -text $text3 -width $rdowidth -value $val3 -variable $para -anchor w -font $ft -command $p
	if {[string length $label] == 0} {
		pack .rdo1$main .rdo2$main .rdo3$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor center -padx 8
	} else {
		label .lbl$main -text $label -width $lblwidth -anchor e -font $ft
		pack .lbl$main .rdo1$main .rdo2$main .rdo3$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor w -padx 8
	}
}

proc Create4RadioItem {parent main label lblwidth text1 val1 text2 val2 text3 val3 text4 val4 rdowidth side para {p {}}} {
	global ft
	frame .frm$main
	radiobutton .rdo1$main -text $text1 -width $rdowidth -value $val1 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo2$main -text $text2 -width $rdowidth -value $val2 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo3$main -text $text3 -width $rdowidth -value $val3 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo4$main -text $text4 -width $rdowidth -value $val4 -variable $para -anchor w -font $ft -command $p
	if {[string length $label] == 0} {
		pack .rdo1$main .rdo2$main .rdo3$main .rdo4$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor center -padx 8
	} else {
		label .lbl$main -text $label -width $lblwidth -anchor e -font $ft
		pack .lbl$main .rdo1$main .rdo2$main .rdo3$main .rdo4$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor w -padx 8
	}
}

#*******************************************
# Label + Entry + Label
#*******************************************
proc CreateLabelEntryLabel {parent main lblstr width text lbltxt para {p {hex %c}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $lblstr -width 20 -font $ft -anchor e
	iwidgets::entryfield .entry$main -labeltext $lbltxt -labelpos w -labelfont $ft \
		-width $width -textvariable $para -fixed [expr $width-2] -validate $p
	label .lbl2$main -text $text -font $ft
	pack .lbl$main .entry$main .lbl2$main -in .frm$main -side left
	pack .frm$main -in $parent -side top -anchor w -pady 2 -padx 8
}

#*******************************************
# Label + Combobox
#*******************************************
proc CreateLabelCombobox {parent main lblstr lblwidth cbowidth para list {p {}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $lblstr -font $ft -width $lblwidth -anchor e
	iwidgets::combobox .cbo$main -width $cbowidth -editable false -textvariable $para \
		-selectioncommand $p
	foreach x $list {
		.cbo$main insert list end $x
	}
	pack .lbl$main .cbo$main -in .frm$main -side left
	pack .frm$main -in $parent -side top -anchor w -pady 2 -padx 8
}

#*******************************************
#  Label + Entry
#*******************************************
proc CreateLabelEntry {parent main text lbltext width lblpos side para {p {hex %c}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $text -font $ft -anchor e
	iwidgets::entryfield .entry$main -labeltext $lbltext -labelpos $lblpos -labelfont $ft \
		-width $width -textvariable $para -fixed [expr $width-2] -validate $p
	pack .lbl$main .entry$main -in .frm$main -side $side
	pack .frm$main -in $parent -side left -anchor w -padx 8 -expand true
}

proc CreateEntry {parent main lbltext lblwidth width side para {p {hex %c}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $lbltext -font $ft -anchor e -width $lblwidth
	iwidgets::entryfield .entry$main -width $width -textvariable $para -fixed [expr $width-2] -validate $p
	pack .lbl$main .entry$main -in .frm$main -side $side
	pack .frm$main -in $parent -side left -anchor w -padx 8 -expand true
}

proc LabelEntry {parent main lbltext lblwidth width para {p {hex %c}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $lbltext -font $ft -anchor e -width $lblwidth
	iwidgets::entryfield .entry$main -width $width -textvariable $para -fixed [expr $width-2] -validate $p
	pack .lbl$main .entry$main -in .frm$main -side left
	pack .frm$main -in $parent -side top -anchor w -padx 8 -expand true -pady 3
}

#*******************************************
#  Click spinner button
#*******************************************
proc spin {win step min max} {
	set size [expr [$win get] + $step]
    if {$size < $min} {set size $max}
    if {$size > $max} {set size $min}
    $win delete 0 end
    $win insert 0 $size
}

#*******************************************
#  Label + Spinner
#*******************************************
proc CreateSpinner {parent main label lblwidth width min max para {p {}} {v {digit %c}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $label -width $lblwidth -font $ft -anchor e
	iwidgets::spinner .spin$main -width $width -fixed $width \
		-decrement "[list spin .spin$main -1 $min $max]; $p" \
		-increment "[list spin .spin$main 1 $min $max]; $p" -textvariable $para \
		-validate $v
	pack .lbl$main .spin$main -in .frm$main -side left -fill x
	pack .frm$main -in $parent -side top -fill x -padx 8 -pady 2
}

#********************************************
#  Entry + CheckBox
#********************************************
proc CreateEntryCheck {parent main width anchor {para1 {}} {para2 {}} {p {}}} {
	global ft
	frame .frm$main
	entry .ent$main -width $width -font $ft -textvariable $para1
	checkbutton .cb$main -variable $para2 -command $p
	pack .ent$main .cb$main -in .frm$main -side left
	pack .frm$main -in $parent -side top -fill x -anchor $anchor
}

#********************************************
#  Label + CheckBox
#********************************************
proc CreateLabelCheck {parent main anchor {para1 {}} {para2 {}} {p {}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $para1 -font $ft
	checkbutton .cb$main -variable $para2 -command $p
	if {$anchor == "e"} {
		pack .lbl$main .cb$main -in .frm$main -side left
	} else {
		pack .cb$main .lbl$main -in .frm$main -side left
	}
	pack .frm$main -in $parent -side top -fill x -anchor $anchor
}

proc CoreNameMap {value}  {
	global Para device_support

	set map_file [file join $Para(Root) "module_gen" $device_support(DieName) modmap.txt]
	if {[file exists $map_file] == 0} {return $value}

	if [catch {open $map_file r} fileid] {
		set err_msg "ERROR - Cannot open $map_file."
		tk_messageBox -default ok -icon warning -message $err_msg -title "Open file error" -type ok
		SendMessage $err_msg
		exit -1
	}

	while {[gets $fileid line] >= 0} {
		if [regexp {([^=]*)=(.*)} $line match left right] {
			set old [lindex [split $left ";"]  end]
			set new [lindex [split $right ";"] end]
			if {[string compare -nocase $old $value] == 0}  {
				set value $new
			}
		}
	}
	close $fileid

	return $value
}

proc RetargetType {val}  {
	switch $val  {
		latticescm  -
		latticesc   -
		lattice-sc  -
		lattice-scm -
		or5s00      {set ret 1}
		default     {set ret 2}
	}
	return $ret
}

proc CheckCoreName {fileid core_name} {
	global Para
	while {[gets $fileid line] >= 0} {
		if {$Para(Retargetable) == 0}  {
			if {[info exists Para(family)] == 1} {
				if {[string first "Family" $line] > -1} {
					set temp $line
					regexp {([^=]*)=(.*)} $temp match parameter value
					if {$value != $Para(family)} {
						if {[RetargetType $Para(family)] != [RetargetType $value]} {
							set msg "The re-targeting is not possible for the module between these two device families."
							set tit "Load Parameters - $core_name"
							tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
							return -1
						}
					}
				}
			}
		}
		if {[string first "CoreName" $line] > -1} {
			set temp $line
			regexp {([^=]*)=(.*)} $temp match parameter value
			#set value [CoreNameMap $value]
			if {[string compare -nocase $value $core_name] != 0} {
				tk_messageBox -default ok -icon error \
					-message "Wrong module parameter file!" \
					-title "Load Parameters" \
					-type ok
				return -1
			}
		}
	}
	return 0
}

proc LoadDefaultParameter {core_name para_file {flag 0}} {
	global Para
	if [catch {open $para_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $para_file file!" \
			-title "Open file error" \
			-type ok
		exit -1
	}

	#set i [CheckCoreName $fileid $core_name]
	#if {$i == -1} {return -1}

	seek $fileid 0 start
	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[Device\]"] == 0} {
			continue
		}
		if {[string compare -nocase $line "\[IP\]"] == 0} {
			continue
		}
		if {[string compare -nocase $line "\[Parameters\]"] == 0} {
			set flag 0
			continue
		}
		if {$flag == 0} {
			if [regexp {([^=]*)=(.*)} $line match parameter value] {
				if [regexp {([ |\t]*;)} $parameter match] {continue}
				if [regexp {(.*)[ |\t]*;} $value match temp] {
					#if {$Para(DOUBLE_QUOTES_IN_LPC_flag) == "Enabled"} {
						set temp [string trimleft $temp '\"']
						set temp [string trimright $temp '\"']
					#}
					set Para($parameter) $temp
				} else {
					#if {$Para(DOUBLE_QUOTES_IN_LPC_flag) == "Enabled"} {
						set value [string trimleft $value '\"']
						set value [string trimright $value '\"']
					#}
					set Para($parameter) $value
				}
			}
		}
	}
	close $fileid
	#set Para(CoreName) [CoreNameMap $Para(CoreName)]
	#catch LoadParaCB
}

proc LoadParameter {core_name para_file} {
	global Para OldPara

	if [catch {open $para_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $para_file file!" \
			-title "Open file error" \
			-type ok
		exit -1
	}

	set i [CheckCoreName $fileid $core_name]
	if {$i == -1} {return -1}

	seek $fileid 0 start
	set flag 1
	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[Device\]"] == 0} {
			continue
		}
		if {[string compare -nocase $line "\[IP\]"] == 0} {
			set flag 0
			continue
		}
		if {[string compare -nocase $line "\[Parameters\]"] == 0} {
			set flag 0
			continue
		}
		if {$flag == 0} {
			if [regexp {([^=]*)=(.*)} $line match parameter value] {
				if [regexp {([ |\t]*;)} $parameter match] {continue}
				if [regexp {(.*)[ |\t]*;} $value match temp] {
					#if {$Para(DOUBLE_QUOTES_IN_LPC_flag) == "Enabled"} {
						set temp [string trimleft $temp '\"']
						set temp [string trimright $temp '\"']
					#}
					set OldPara($parameter) $temp
					set Para($parameter) $temp
				} else {
					#if {$Para(DOUBLE_QUOTES_IN_LPC_flag) == "Enabled"} {
						set value [string trimleft $value '\"']
						set value [string trimright $value '\"']
					#}
					set OldPara($parameter) $value
					set Para($parameter) $value
				}
			}
		}
	}
	close $fileid

	#set Para(CoreName) [CoreNameMap $Para(CoreName)]

	#set j [CheckParameterCB]
	#if {$j == -1} {
	#	foreach {index value} [array get Bak] {
	#		set Para($index) $value
	#	}
	#	return -1
	#}

	#catch LoadParaCB
}

proc CreateLpcFile {} {
	global Para device_support pin_flag

	set lcd_file [file join $Para(lpc) "default.lpc"]
	if {[file exists $lcd_file] == 0} {
		set lcd_file [file join $Para(lpc) "../../preference/default.lpc"]
	}

	#ISPL_CR_37596
	set lpc_file [file join $Para(ProjectPath) "$Para(ModuleName).lpc"]
	#set lpc_file $Para(ParaFile)
	#if [file exists $lpc_file] {
	#	set msg "Design files with the same module name already exist. Overwrite?"
	#	set answer [tk_messageBox -message $msg -type yesno -icon question -title "LPC file"]
	#	if {[string compare -nocase $answer "no"] == 0} {return -1}
	#}
	if [catch {open $lpc_file w} outputfile] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $lpc_file file!" \
			-title "Generate error" \
			-type ok
		return -1
	}
	if [catch {open $lcd_file r} inputfile] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $lcd_file file!" \
			-title "Generate error" \
			-type ok
		return -1
	}

	#Format=DevFile,Device,Speed,Package,Condition,Info,VCIfile,status,PkgName,DiePkgName

	puts $outputfile "\[Device\]"
	puts $outputfile "Family=$Para(family)"
	puts $outputfile "PartType=$Para(PartType)"
	puts $outputfile "PartName=$Para(PartName)"
	puts $outputfile "SpeedGrade=$Para(SpeedGrade)"
	puts $outputfile "Package=$Para(Package)"
	puts $outputfile "OperatingCondition=$Para(OperatingCondition)"
	puts $outputfile "Status=$Para(Status)\n"

	puts $outputfile "\[IP\]"
	puts $outputfile "VendorName=$Para(VendorName)"
	puts $outputfile "CoreType=$Para(CoreType)"
	puts $outputfile "CoreStatus=$Para(CoreStatus)"
	puts $outputfile "CoreName=$Para(CoreName)"
	puts $outputfile "CoreRevision=$Para(Version)"
	puts $outputfile "ModuleName=$Para(ModuleName)"
	puts $outputfile "SourceFormat=$Para(SourceFormat)"
	puts $outputfile "ParameterFileVersion=$Para(ParameterFileVersion)"
	set Para(Date) [clock format [clock seconds] -format "%m/%d/%Y"]
	puts $outputfile "Date=$Para(Date)"
	set Para(Time) [clock format [clock seconds] -format "%H:%M:%S"]
	puts $outputfile "Time=$Para(Time)\n"

	set write_flag 0
	while {[gets $inputfile line] >= 0} {
		if {[string compare -nocase $line "\[Parameters\]"] == 0} {
			set write_flag 1
			puts $outputfile $line
	#******** Added for #16084
			puts $outputfile "Verilog=$Para(Verilog)"
			puts $outputfile "VHDL=$Para(VHDL)"
			puts $outputfile "EDIF=$Para(EDIF)"
			puts $outputfile "Destination=$Para(Destination)"
			puts $outputfile "Expression=$Para(Expression)"
			puts $outputfile "Order=$Para(Order)"
			puts $outputfile "IO=$Para(IO)"
		}
		if {$write_flag == 1} {
			if [regexp {([ |\t]*;)} $line match] {
				puts $outputfile $line
			} else {
				if [regexp {([^=]*)=(.*)} $line match parameter value] {
					if {$Para(DOUBLE_QUOTES_IN_LPC_flag) == "Enabled"} {
						puts $outputfile "$parameter=\"$Para($parameter)\""
					} else {
						puts $outputfile "$parameter=$Para($parameter)"
					}
				}
			}
		}
	}

	#Diamond: new feature for IPX file.
	if {$Para(CoreName) == "PCS"} {
		puts $outputfile "\n\[FilesGenerated\]"
		puts $outputfile "$Para(ModuleName).pp=pp"
		puts $outputfile "$Para(ModuleName).tft=tft"
		puts $outputfile "$Para(ModuleName).txt=pcs_module"
		puts $outputfile "$Para(ModuleName).sym=sym"

		if {($Para(arch) == "sa5p00" || $Para(arch) == "sa5p00m" || $Para(arch) == "sa5p00g") &&
			$Para(ModuleName) == "dummy_module"} {
			puts $outputfile "\n\[SYSTEMPNR\]"
			 puts $outputfile "LN3=DCU0_CH3"
			 puts $outputfile "LN2=DCU0_CH2"
			 puts $outputfile "LN1=DCU0_CH1"
			 puts $outputfile "LN0=DCU0_CH0"
		}
	}
	set mem_module {Distributed_DPRAM Distributed_ROM Distributed_SPRAM	RAM_DP RAM_DP_TRUE \
		RAM_DQ ROM RAM_Based_Shift_Register	"Tag Memory"}
	if {[lsearch $mem_module $Para(CoreName)] != -1} {
		puts $outputfile "\n\[FilesGenerated\]"
		puts $outputfile "$Para(MemFile)=mem"
	}

	if {$pin_flag != "orcapp" && $pin_flag != "MACO"} {
		puts $outputfile "\n\[Command\]"

		set str [GenerateCB]
		set cmd [GetGeneralArgs]
		#append cmd_line " -w -n" " " $Para(ModuleName) $cmd " " $str
		append command_line " -w -n" " " $Para(ModuleName) $cmd " " $str
		#lappend command_line -e

		puts $outputfile "cmd_line=$command_line"
	}

	close $inputfile
	close $outputfile
}

proc CreateDummyLpcFile {} {
	global Para
	set mn $Para(ModuleName)
	set Para(ModuleName) "dummy_module"
	CreateLpcFile
	set Para(ModuleName) $mn
}

proc GetScubaEngine {} {
	global tcl_platform Para env

	set platformpath [GetPlatform]

	if {$Para(bali) == "false"} {
		set foundry $Para(FPGAPath)
	} else {
		set foundry $Para(FOUNDRY)
	}
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
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog"]} {
		append cmd " -lang verilog"
	}
	if {[string equal -nocase $Para(SourceFormat) "EDIF"]}  {
#		set cmd " -e"
	}
	#26805
	if {$Para(Destination) != "Simulation"} {
		set synth_list {"Precision" "Synplicity"}
		set cmd_list {spectrum synplify}
		set synth [lindex $cmd_list [lsearch $synth_list $Para(Destination)]]
		#append cmd " -synth $synth"
		append cmd " -synth $Para(synthesistool)"
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

proc SendMessage {msg} {
	global Para tcl_platform

	switch $tcl_platform(platform) {
		windows {
			set msgr [file join $Para(Bin) msgr.exe]
		}
		unix {
			set msgr [file join $Para(Bin) msgr]
		}
	}
	regsub -all "\t" $msg "    " msg
	set msg_file [file join $Para(ProjectPath) "msg_file.log"]
	if [catch {open $msg_file w} outputfile] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $msg_file file!" \
			-title "Generate error" \
			-type ok
		return -1
	}
	puts $outputfile $msg
	close $outputfile
	catch {exec $msgr 4 $msg_file &}
}

proc CreateSymbol {out_msg}  {
	global Para
	#24915 - schematic generate from Module Manager
#	if {$Para(SourceFormat) == "Schematic/Verilog HDL" || $Para(SourceFormat) == "Schematic/VHDL"}  {
		#DTS 25228 XP PLL remove "NAF to symbol" window
		set symFile [file join $Para(ProjectPath) $Para(ModuleName)]
		set symFile "[file rootname $symFile].sym"
		catch {file delete -- $symFile}

		if {$Para(SourceFormat) == "Schematic/Verilog HDL" ||
			$Para(SourceFormat) == "Verilog HDL" ||
			$Para(SourceFormat) == "Verilog"} {
			set hdl2naf [GetVlog2Jhd]
			append hdl2naf " -nojhd"
			set hdl_file $Para(ModuleName).v
		} else  {
			set hdl2naf [GetVhd2Naf]
#			append hdl2naf " -p $Para(Root)/generic"
			set hdl_file $Para(ModuleName).vhd
		}
		#27551 item 10
		if {[file exists $hdl_file] == 1}  {
			append hdl2naf " $hdl_file"
			set ret [catch {eval exec $hdl2naf} msg]
			#27821
			if {$Para(bCreateSymbol) != 0}  {
				set naf2sym [GetNaf2Sym]
				##! bali cmd-line: naf2sym -i <input naf file name> [-mod <module_name> -o <output symbol file name>]
				##! Lever cmd-line: naf2ysm moudlename.
				if {$Para(bali) == "true"} {
					lappend naf2sym -i $Para(ModuleName).naf
				} else {
				append naf2sym " $Para(ModuleName)"
				}
				set ret [catch {eval exec $naf2sym} msg]
			} else  {
			    append out_msg "\nWarning: No symbol created because the sequence limited to 1024 names.\n"
			}
		}
#	}
	return $out_msg
}

proc GetDevResource {}  {
	global Para device_list device_support DevInfo

	if {$Para(bali) == "true"} {return}
	#Format=DevKit,DevFile,Device,Speed,Package,Condition,Info,VCIfile,status,PkgName,DiePkgName
	#Format =       		Density, Voltage  ,   LUT, Block RAM, Dist RAM, SERDES Pairs, PIO Cells, PIO Pins
	#Format =	Voltage,   LUT, Block RAM, Dist RAM, sysDSP, SERDES Pairs, PIO Cells, PIO Pins, Registers
	set tmp_lst [split $device_support(Format) ',']
	set tmp_idx [lsearch -exact $tmp_lst "Info"]

	set tmp_lst [split $device_list($Para(device)) ',']
	set Para(Info) [lindex $tmp_lst $tmp_idx]

	set key_lst [split $DevInfo(Format) ',']
	set val_lst [split $DevInfo($Para(Info)) ',']
	foreach key $key_lst val $val_lst  {
		set key [string trim $key]
		set val [string trim $val]
		# process key="PLL/DLL"???
		if {[string first "K" $val] != -1}  {
			set val [expr [string range $val 0 end-1]*1024]
		}
		if {[string first "M" $val] != -1}  {
			set val [expr [string range $val 0 end-1]*1024*1024]
		}
		set Para(Dev_$key) $val
	#tk_messageBox -default ok -icon warning -message "Para(Dev_$key) =$val" -title GetDevResource -type ok
	}
	#tk_messageBox -default ok -icon warning -message $msg -title GetDevResource -type ok
}

proc GetUsedResource {str}  {
	global Para
	#Resource Usage : LUT = 183, EBR = 1, Reg = 164
	set v_scale 1
	set item_lst [split $str ':']
	set key2 [string trim [lindex $item_lst 0]]
	set val [string trim [lindex $item_lst 1]]
	#For Block RAMs, v_scale = 1000*18 for SC, SCM, ECP2/ECP2M/XP2, and 1000*9 for other architectures.
	if {$Para(arch) == "slayer" || $Para(arch) == "or5s00" ||
		$Para(arch) == "ep5a00" || $Para(arch) == "ep5m00" ||
		$Para(arch) == "mg5a00" || $Para(arch) == "ep5c00" || $Para(arch) == "xo3c00h" || 
		$Para(arch) == "sa5p00" || $Para(arch) == "sa5p00m" || $Para(arch) == "sa5p00g" ||
		$Para(arch) == "sn5w00" || $Para(arch) == "wi5s00"}  {
		set m_ebr 18
	} else  {
		set m_ebr 9
	}
	#For Dist RAM, v_scale = 16*4 for ECP2, and 16*2 for all other architecrures.
	if {$Para(arch) == "ep5a00"}  {
		set m_dram 4
	} else  {
		set m_dram 2
	}
	switch $key2 {
		LUT  { set key LUT}
#		EBR  { set key "EBR Blocks"; #set v_scale [expr 1000*$m_ebr]; #set val [expr $val*$v_scale]}
#		DRAM { set key "Dist RAM";  set v_scale [expr 16*$m_dram]; set val [expr $val*$v_scale]}
		EBR  { set key "EBR_Blocks"; #set v_scale [expr 1000*$m_ebr]; #set val [expr $val*$v_scale]}
		DRAM { set key "Dist_RAM";  set v_scale [expr 16*$m_dram]; set val [expr $val*$v_scale]}
		#CR_58055 - Peng changed the DSP resource normalization from DSP_9x9 to DSP_SLICE.
		DSP_9x9 { set key sysDSP; set val [expr $val/8]}
		DSP_SLICE { set key sysDSP; set val [expr $val/8]}
		Reg { set key Registers }
	}
	set Para(Used_$key) $val
	#tk_messageBox -default ok -icon warning -message "Para(Used_$key) =$val" -title GetDevResource -type ok
	#
	if {[info exists Para(Dev_$key)] && ($Para(Dev_$key) != "-" && $Para(Dev_$key) != "*")}  {
		if {$Para(Used_$key) > $Para(Dev_$key)}  {
			set Para(res_over) 1
			set res_extr_percent [expr (100*($Para(Used_$key) - $Para(Dev_$key))/$Para(Dev_$key))]
			set res_extr_percent [format "%.2f" $res_extr_percent]
			set des_res [expr $Para(Used_$key)/$v_scale]
			set dev_res [expr $Para(Dev_$key)/$v_scale]
			if {$key != "Registers"}  {
				set key3 [format "%s" $key]
			} else  {
			    set key3 $key
			}
			set msg "Resource usage of $key is larger than the resource of this device by $res_extr_percent%\nDesign requires $des_res $key3, but device has only $dev_res."
			tk_messageBox -default ok -icon warning -message $msg -title Generate -type ok
		}
	}
}

proc GetTghfile {} {
	global tcl_platform Para env
	switch $tcl_platform(platform) {
		windows {set path [file join $Para(Bin) "tghfile.exe"]}
		unix {
			if {$tcl_platform(os) == "Linux"}  {
				set path [file join $Para(Bin) "tghfile"]
			} else  {
				set path [file join $Para(Bin) "tghfile"]
			}
		}
	}
	return $path
}

proc Generate {} {
	global Para pin_flag tcl_platform

	if {$pin_flag == "MACO"}  {
		set str [GenerateCB]
		if {$str == -1} {return -2}
		#! ECP4 - special process
		if {($Para(arch) == "sa5p00" || $Para(arch) == "sa5p00m" || $Para(arch) == "sa5p00g") && $Para(CoreName) == "PCS"} {SaveProtocolCB}
		set ret [CreateLpcFile]
		if {$ret == -1} {return -1}

		#! ECP4 - special process
		if {($Para(arch) == "sa5p00" || $Para(arch) == "sa5p00m" || $Para(arch) == "sa5p00g") && $Para(CoreName) == "PCS"} {RestoreProtocolCB}

		#! output generate_ngd.tcl for asbgen.
		CreateGenerateNGDFile

		set Para(msg) $str
		SendMessage $Para(msg)

		return 0
	}

	set Para(cmd) ""
	set out_msg ""
	set Para(res_over) 0
	set ret 0

	set ret [CheckParameterCB]
	if {$ret == -1} {return -2}

	#ISPL_CR_41524 - R7.1SP01
	if {[info exists Para(MemFile)]} {
		set memFile [file tail $Para(MemFile)]
		if {[string first " " $memFile] != -1} {
			set msg "Memory file name with space(s) is not supported!"
			set tit "Check Parameter"
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -2
		}
	}

	set ret [CreateLpcFile]
	if {$ret == -1} {return -1}

	#ISPL_CR_30553
	#set lpc_file [file join $Para(ProjectPath) "$Para(ModuleName).lpc"]
	set lpc_file $Para(ParaFile)
	set tgh_cmd [GetTghfile]
	lappend tgh_cmd -u $Para(ModuleName).lpc
	if {$Para(CoreName) == "PCS" && ($Para(family) == "latticeecp3" ||
		$Para(family) == "latticeecp2m" || $Para(family) == "latticeecp2ms")} {
		#need not to touch LPC file.
	} else {
		set ret [catch {eval exec $tgh_cmd} msg]
	}

	#*** Get current module's argument ***
	set str [GenerateCB]

	if {$pin_flag != "orcapp"}  {
		#21327 -> #24391
		set Para(EDIF) 1
		#set Para(Expression) "BusA(0 to 7)"

		set scuba [GetScubaEngine]

	#*** General Options Command arguments ***
		set cmd [GetGeneralArgs]

		append cmd_line $scuba " -w -n" " " $Para(ModuleName) $cmd " " $str
		append command_line [list $scuba] " -w -n" " " $Para(ModuleName) $cmd " " $str
		#28238 + #28726
#		lappend command_line -e

	#tk_messageBox -default ok -icon warning -message $command_line -title "Command Line" -type ok
	#exit

		set ret [catch {eval exec $command_line} msg]

		#set Para(MessageList) [split $msg '\n']
		#cr_54677
		set Para(MessageList) ""
		foreach line [split $msg '\n'] {
			set string_line [string trim $line]
			# *** Latency: 2 ***
			if {[regexp -nocase {^Latency} $string_line]}  {
				continue
			} else {
				lappend Para(MessageList) $line
			}
		}

		if {$ret == 0}  {
		# run success. return 0.
			set used_flag 0
			foreach outtext $Para(MessageList) {
				if {[string length $outtext] == 0 } {
					set outtext "  "
					set used_flag 0
				} else  {
					if {$used_flag}  {GetUsedResource $outtext}
				}
				if {[string first "Estimated Resource Usage" $outtext] != -1}  {
					set used_flag 1
				}
				append out_msg "$outtext\n"
			}

			#output generate_core.tcl
			CreateGenerateCoreFile

			#output generate_ngd.tcl
			CreateGenerateNGDFile
		} else  {
		# run failure. return !0.
			foreach outtext $Para(MessageList) {
				if {[string length $outtext] == 0 } {
					set outtext "  "
				}
				append out_msg "$outtext\n"
			}
			set msg "\nERROR: Child process exited abnormally."
			append out_msg $msg
			set ret -1
		}

	} else  {
		set out_msg $str

		#Regenerate PCS file only update the TXT file
		#seems run after double click lpc file.
		if {$Para(CoreName) == "PCS" && ($Para(family) == "latticeecp3" ||
			$Para(family) == "latticeecp2m" || $Para(family) == "latticeecp2ms")} {
			if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
				[string equal -nocase $Para(SourceFormat) "VHDL"]} {
				set tail vhd
			}
			if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
				[string equal -nocase $Para(SourceFormat) "Verilog HDL"] ||
				[string equal -nocase $Para(SourceFormat) "Verilog"]} {
				set tail v
			}
			set tgh_cmd [GetTghfile]
			#eval exec $tgh_cmd
			set ret [CheckRegenerate]
			if {$Para(bali) == "false"} {
			#for ispLever.
				switch $Para(Regen) {
				#1. Automatic (Generate Module and Settings as needed)
					"auto" {
						#touch txt file
						set tgh_cmd [GetTghfile]
						#lappend tgh_cmd $Para(ModuleName).txt
						if {[string length $Para(prj)] > 0} {
							lappend tgh_cmd [file rootname $Para(prj)].tcp
						} else {
							lappend tgh_cmd unknownn.tcp
						}
						set rret [catch {eval exec $tgh_cmd} msg]
						if {$Para(new) == 1 || $ret == 1} {
							#touch lpc file
							set tgh_cmd [GetTghfile]
							lappend tgh_cmd -u $Para(ModuleName).lpc
							set rret [catch {eval exec $tgh_cmd} msg]
							#touch HDL file
							set tgh_cmd [GetTghfile]
							lappend tgh_cmd -u $Para(ModuleName).$tail
							set rret [catch {eval exec $tgh_cmd} msg]
						}
					}
				#2. Force Module and Settings Generation
					"module" {
						#touch txt file
						set tgh_cmd [GetTghfile]
						lappend tgh_cmd $Para(ModuleName).txt
						set rret [catch {eval exec $tgh_cmd} msg]
						#touch lpc file
						set tgh_cmd [GetTghfile]
						lappend tgh_cmd -u $Para(ModuleName).lpc
						set rret [catch {eval exec $tgh_cmd} msg]
						#touch HDL file
						set tgh_cmd [GetTghfile]
						lappend tgh_cmd -u $Para(ModuleName).$tail
						set rret [catch {eval exec $tgh_cmd} msg]
					}
				#3. Force Settings Generation Only (error if module generation required)
					"setting" {
						#make sure no change HDL file.
						set tgh_cmd [GetTghfile]
						#lappend tgh_cmd $Para(ModuleName).txt
						if {[string length $Para(prj)] > 0} {
							lappend tgh_cmd [file rootname $Para(prj)].tcp
						} else {
							lappend tgh_cmd unknownn.tcp
						}
						set rret [catch {eval exec $tgh_cmd} msg]
					}
		        }
			} else {
			#for Diamond.
				set tgh_file [file join $Para(ProjectPath) "$Para(ModuleName)_tgh.tgh"]
				if {$ret == 0} {
					#if only modify TXT file.
					if [catch {open $tgh_file w} outputfile] {
						tk_messageBox -default ok -icon warning \
							-message "Cannot open $tgh_file file!" \
							-title "Generate error" \
							-type ok
						return -1
					}
				#1. Automatic (Generate Module and Settings as needed)
					if {$Para(Regen) == "auto"} {
						if {$Para(PAR3) == 0 && $Para(PARTrace3) == 0} {
							puts $outputfile "Export,Bitgen"
						}
						if {$Para(PARTrace1) == 1} {
							puts $outputfile "PAR,PARTrace"
						}
						if {$Para(PAR1) == 1} {
							puts $outputfile "PAR,PAR"
						}
					}
				#3. Force Settings Generation Only (error if module generation required)
					if {$Para(Regen) == "setting"} {
						if {$Para(PAR3) == 0 && $Para(PARTrace3) == 0} {
							puts $outputfile "Export,Bitgen"
						}
						if {$Para(PARTrace3) == 1} {
							puts $outputfile "PAR,PARTrace"
						}
						if {$Para(PAR3) == 1} {
							puts $outputfile "PAR,PAR"
						}
					}
					close $outputfile
				#2. Force Module and Settings Generation
					if {$Para(Regen) == "module"} {
						if {[file exists $tgh_file]}  {file delete -force $tgh_file}
					}
				} else {
					#HDL file moified.
					if {[file exists $tgh_file]}  {file delete -force $tgh_file}
				}
			}

			set Para(new) 0
			LoadParameter $Para(CoreName) $Para(ParaFile)
		}
	}

	if {$Para(res_over) == 1}  {
		set msg "WARNING: The resource usage is larger than the resource of this device!"
		append out_msg "\n$msg\n"
	}

	set Para(msg) $out_msg
	set Para(msg) [CreateSymbol $out_msg]
	catch ExtraMsgCB
	SendMessage $Para(msg)

	return 0
}

proc SelectVhdlCmd {} {
	global Para
	if {$Para(VHDL) == "1"} {
		set Para(Verilog) 0
	}
}

proc SelectVerilogCmd {} {
	global Para
	if {$Para(Verilog) == "1"} {
		set Para(VHDL) 0
	}
}

proc SelectEDIFCmd {}  {
	global Para
	if {$Para(EDIF) == "0"}  {
		.cboExpression config -state disabled -foreground gray50
		set Para(Expression) "None"
	} else  {
		.cboExpression config -state normal -foreground black
	}
}

proc SelectOrderCmd {}  {
	global pin_flag Para

	if {$Para(Order) == "None"}  {
		set Para(Expression) None
	}
	if {($pin_flag == "1" || $pin_flag == "ecxp") && $Para(Order) != "None"}  {
		DrawPins
	}
}

proc AddPlacementTab {} {
	global ft Para tcl_platform

	set tnb $Para(tnb)

	set placetab [$tnb add -label "Placement"]
	iwidgets::Labeledframe .frmPlacement ;
	set placement [.frmPlacement childsite]
}

#*******************************************
# Function template for controls of pins and
# attributes of the IP core
#*******************************************
proc AttributeSetting {W H} {
	global ft Para pin_flag tcl_platform

	set f1 $Para(f1)

	frame .page
	pack .page -in .right -side top -fill both -expand 1

	if {$tcl_platform(platform) == "windows"}  {
		set dt [expr [font metrics $ft -ascent]-11]
		set w_n [expr $W/20]
		set h_n [expr $H/20]
		set W [expr $W+$dt*$w_n]
		set H [expr $H+$dt*$h_n]
	}
	set tnb [iwidgets::tabnotebook $f1.tnb -width $W -height $H -borderwidth 1 \
		-backdrop [. cget -bg] -tabpos n -equaltabs false \
		-raiseselect true -background [. cget -background] -font $ft]
	pack $f1.tnb -side right -fill both -expand yes

	set Para(tnb) $tnb

	set options [$tnb add -label "General Options"]
	iwidgets::Labeledframe .frmOptions ;#-labeltext "Properties" -labelpos nw
	set frmOptions [.frmOptions childsite]

	#*** Netlist format ***
	checkbutton .cbEdif -text "EDIF"

	#*** Netlist Destination ***
	iwidgets::combobox .cboDestination

	#*** Bus Expression Style ***
	iwidgets::combobox .cboExpression

	#*** Bus Ordering Style ***
	iwidgets::combobox .cboOrder

	#*** Insert I/O Buffers ***
	checkbutton .cbIO

	pack .frmOptions -in $options -side top -fill both -expand 1

#	SelectEDIFCmd
	focus $tnb
	$tnb view 0
}

proc HelpCB {} {
	global Para tcl_platform

	set tit "Open Help"
	set helpdir [file join $Para(Root) "webhelp/mergedProjects/ipexpress"]
	set helpfile [file join $helpdir "ipexpress.htm"]
	if {[catch GetHelpTopic] != 0}  {
		set msg "No help for this module."
		tk_messageBox -default ok -icon error -message $msg	-title $tit	-type ok
		return
	}
	set helpfile "$helpfile\#$Para(topic)"

	set Para(TmpHelpFile) [file join $Para(ProjectPath) "webhelp_tmp.htm"]

	if [catch {open $Para(TmpHelpFile) w} fileId] {
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}

	puts $fileId "<html>"
	puts $fileId "<body>"
	puts $fileId "<script language=\"JavaScript\">"
	puts $fileId "<!--"
	puts $fileId "var sURL = \"file://$helpfile\";"
	puts $fileId "document.location.href=sURL;"
	puts $fileId "//-->"
	puts $fileId "</script>"
	puts $fileId "</body>"
	puts $fileId "</html>"

	close $fileId

#	switch $tcl_platform(platform) {
#		windows {exec "cmd.exe" /C $Para(TmpHelpFile) &}
#		unix    {exec "mfcie" $Para(TmpHelpFile) &}
#	}
	set Para(webhelp) $Para(TmpHelpFile)
}

#*******************************************
# Function template for Function Buttons.
#*******************************************
proc FunctionButton {} {
	global ft types Para

	frame .bottom
	frame .sep -width 280 -height 2 -borderwidth 1 -relief sunken
	frame .button
	button .generate -text "Generate" -font $ft -width 8 -command {Generate}
	button .loadpara -text "Load Parameters.." -font $ft -command {
		set parameter_file [tk_getOpenFile -filetypes $types -initialdir $Para(ProjectPath)]
		if {[string length $parameter_file] > 0} {
			set answer [tk_messageBox -icon warning \
				-message "This function will replace previous configuration! Continue?" \
				-title "Load Parameters" \
				-type yesno]
			if {$answer == "yes"} {
				LoadParameter $Para(CoreName) $parameter_file
			}
		}
	}
	button .cancel -text "Cancel" -font $ft -width 8 -command {
			set msg "The module generation has been canceled."
			SendMessage $msg
			exit -1
		}
	button .help -text "Help" -font $ft -width 8 -command {catch HelpCB}
	pack .generate .loadpara .cancel .help -in .button -side left -padx 3
	pack .sep .button -in .bottom -side top -pady 4
	pack .bottom -in .right -side top -pady 4 -fill x
}

#*******************************************
# Function template for parameters dialog window.
#*******************************************
proc MainInterface {{WxH {}}} {
	if {[string length $WxH] > 0} {
		wm geometry . $WxH
	}
	frame .left
	frame .leftTop
	frame .leftBottom
	pack .leftTop .leftBottom -in .left -side top
	frame .right
	pack .left .right -side left -padx 7 -pady 7 -fill x ;#-fill y -expand 1
}

set types {
	{"LPC files"		{.lpc}	}
	{"All files"		*}
}

proc ReadSDSFile {{p {}}} {
	global Para device_list device_support entry_list DevInfo

	if {$Para(bali) == "true"} {return}

	if {[string length $p] == 0}  {
		set sds_file [file join $Para(Config) $Para(DeviceFile)]
	} else  {
		# virtual device's SDS file.
	    set sds_file $p
	}
	if {[file exists $sds_file] == 0} {
		set dir [tk_chooseDirectory -initialdir $Para(ProjectPath) -title "Specify the SDS file"]
		if [string compare $dir ""] {
			set sds_file [file join $dir $Para(DeviceFile)]
		} else {
			tk_messageBox -default ok -icon warning \
				-message "Not specify the location of SDS file." \
				-title "Open file error" \
				-type ok
			exit -1
		}
	}

	if [catch {open $sds_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $sds_file." \
			-title "Open file error" \
			-type ok
		set err_msg "ERROR - Cannot open $sds_file."
		SendMessage $err_msg
		exit -1
	}

	if [info exists device_support]  {
		unset device_support
	}
	if [info exists device_list]  {
		unset device_list
	}
	set read_flag 0
	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[Device Support\]"] == 0} {
			set p device_support
			set read_flag 1
			continue
		}
		if {[string compare -nocase $line "\[Generic Devices\]"] == 0} {
			set p device_list
			set read_flag 1
			continue
		}
		if {[string compare -nocase $line "\[Device Families\]"] == 0} {
			set p Para
			set read_flag 1
			continue
		}
		if {[string compare -nocase $line "\[Device Info\]"] == 0} {
			set p DevInfo
			set read_flag 1
			continue
		}
		if {[string compare -nocase $line "\[Schematic/VHDL\]"] == 0 ||
			[string compare -nocase $line "\[VHDL\]"] == 0} {
			set read_flag 0
			continue
		}
		if {[string compare -nocase $line "\[EDIF\]"] == 0} {
			set read_flag 0
			continue
		}
		if {[string compare -nocase $line "\[Schematic/Verilog HDL\]"] == 0 ||
			[string compare -nocase $line "\[Verilog HDL\]"] == 0} {
			set read_flag 0
			continue
		}
		if $read_flag {
			if [regexp {([^=]*)=(.*)} $line match parameter value] {
				if [regexp {([ |\t]*;)} $parameter match] {continue}
				if [regexp {(.*)[ |\t]*;} $value match temp] {
					set ${p}($parameter) $temp
				} else {
					#process "LFX1200B-05F900C ="
					set parameter [string trim $parameter]
					set ${p}($parameter) $value
				}
				if {$p == "Para"}  {
					# read Para(arch)
					set Para(arch) $parameter
					set read_flag 0
				}
			}
		}
	}
	close $fileid
}

proc GetDeviceInfo {} {
	global Para device_list device_support

	set found FALSE
	foreach pn [array names device_list] {
		if {[string compare -nocase $pn $Para(device)] == 0} {
			set found TRUE
			set Para(PartName) $pn
			break
		}
	}
	if {$found == "FALSE"} {
		set msg "This device does not support this Module!"
		set tit "Open error"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}

	#Format=DevFile,Device,Speed,Package,Condition,Info,VCIfile,Status,PkgName,DiePkgName
	#for ecp3 sds file
	#Format=DevKit,DevFile,Device,Speed,Package,Condition,Info,VCIfile,status,PkgName,DiePkgName,DevDef,DieName

	set temp_list [split $device_list($Para(PartName)) ,]
	if {[info exists device_support(Format)]==0} {
		set Para(family) $device_support(DieName)
		set Para(PartType) [lindex $temp_list 1]
		set Para(SpeedGrade) [lindex $temp_list 3]
		set Para(Package) [lindex $temp_list 4]
		set Para(OperatingCondition) [lindex $temp_list 5]
		set Para(Status) [lindex $temp_list 6]
	} else {
		set format_list [split $device_support(Format) ,]
		set idx [lsearch -regexp $format_list {^[dD][iI][eE][nN][aA][mM][eE]$}]
		if {$idx!=-1} {
			set Para(family) [lindex $temp_list $idx]
		} else {
			set Para(family) [string tolower $device_support(DieName)]
		}
		set idx [lsearch -regexp $format_list {^[dD][eE][vV][iI][cC][eE]$}]
		if {$idx!=-1} {set Para(PartType) [lindex $temp_list $idx]}
		set idx [lsearch -regexp $format_list {^[sS][pP][eE][eE][dD]$}]
		if {$idx!=-1} {set Para(SpeedGrade) [lindex $temp_list $idx]}
		set idx [lsearch -regexp $format_list {^[pP][aA][cC][kK][aA][gG][eE]$}]
		if {$idx!=-1} {set Para(Package) [lindex $temp_list $idx]}
		set idx [lsearch -regexp $format_list {^[cC][oO][nN][dD][iI][tT][iI][oO][nN]$}]
		if {$idx!=-1} {set Para(OperatingCondition) [lindex $temp_list $idx]}
		set idx [lsearch -regexp $format_list {^[sS][tT][aA][tT][uU][sS]$}]
		if {$idx!=-1} {set Para(Status) [lindex $temp_list $idx]}
	}

	return 0
}

proc CheckModuleName {}  {
	global Para

	if {[string match {[A-Za-z]*} $Para(ModuleName)] == 0}  {
		set msg "Invalid Module Name: $Para(ModuleName)\nThe Module Name must start with a letter \[a-z\]."
		tk_messageBox -default ok -icon info -message $msg -title "Error" -type ok
		exit -1
	}
	set len [string length $Para(ModuleName)]
	if {[string first "_" $Para(ModuleName)] != -1}  {
		if {[string first "_" $Para(ModuleName)] == [expr $len -1]} {
			set msg "Invalid Module Name: $Para(ModuleName)\nThe Module Name cannot end with '_'."
			tk_messageBox -default ok -icon info -message $msg -title "Error" -type ok
			exit -1
		} else {
			for {set i 1} {$i < $len} {incr i}  {
				if {[string match {[A-Za-z0-9_]*} [string index $Para(ModuleName) $i]] == 0}  {
					set msg "Invalid Module Name: $Para(ModuleName)\nThe Module Name cannot include '!@#$' etc."
					tk_messageBox -default ok -icon info -message $msg -title "Error" -type ok
					exit -1
				}
			}
		}
	} else {
		for {set i 1} {$i < $len} {incr i}  {
			if {[string match {[A-Za-z0-9]*} [string index $Para(ModuleName) $i]] == 0}  {
				set msg "Invalid Module Name: $Para(ModuleName)\nThe Module Name cannot include '!@#$' etc."
				tk_messageBox -default ok -icon info -message $msg -title "Error" -type ok
				exit -1
			}
		}
	}
}

proc SetArchValue {} {
	global Para

	#tk_messageBox -default ok -icon info -message $Para(arch) -title SetArchValue -type ok
	set temp [string tolower $Para(arch)]
	switch $temp {
	    "slayer" -
		"lattice-sc" -
		"latticesc" -
		"or5s00" {
			#28567
			#47800
			if {$Para(bali) == "false"} {
				set Para(arch) slayer
			} else {
				set Para(arch) $temp
			}
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
		default {
			set Para(arch) $temp
			set Para(CmdLine) EC_CMD
		}
	}
}

#proc SpecialControl {}  {
#	global Para
#	# Following Modules for MachXO are only support for 1/2k device.
#	if {$Para(arch) == "mj5g00"}  {
#		regexp {(^[a-zA-Z]+)([0-9]+)?.*$} $Para(PartType) match x y
#		if {$y == 256 || $y == 640}  {
#			switch $Para(CoreName)  {
#				"PLL"			-
#				"FIFO_DC"		-
#				"RAM_DP"		-
#				"RAM_DP_TRUE"	-
#				"RAM_DQ"		-
#				"ROM"			{set enFlag 0}
#				default			{set enFlag 1}
#			}
#			if {$enFlag == "0"}  {
#				set msg "This device does not support this Module!"
#				set tit "Open error"
#				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
#				SendMessage $msg
#				exit 0
#			}
#		}
#	}
#}

proc GetEBRDeviceFlag {}  {
	global Para
	# Following Modules for MachXO,MachXO2 are only support for 1/2k device.
	set EBR_Dev_Flag 1
	if {$Para(arch) == "mj5g00"}  {
		regexp {(^[a-zA-Z]+)([0-9]+)?.*$} $Para(PartType) match x y
		if {$y == 256 || $y == 640}  {set EBR_Dev_Flag 0}
	}
	if {$Para(arch) == "xo2c00" || $Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
		regexp {(^[a-zA-Z0-9]+)-([0-9]+)?(.*)$} $Para(PartType) match x y z
		if {$y == 256}  {set EBR_Dev_Flag 0}
	}
	#R8_1s1: POJO=xo's 640.
	if {$Para(arch) == "mj5g00p"}  {
		set EBR_Dev_Flag 0
	}
	#! POJO2 >= 640
	if {$Para(arch) == "xo2c00p"} {
	}
	#if {$y == 256 || $y == 640}  {set EBR_Dev_Flag 0}
	#tk_messageBox -default ok -icon warning -message $y -title $Para(PartType) -type ok

	return $EBR_Dev_Flag
}

proc InitPara {}  {
	global Para init_flag

	set Para(InterCoreName) ""
	set Para(new) 0
	set pin_flag  0
	set init_flag 0
	set Para(VHDL) 0
	set Para(Verilog) 0
	set Para(newmodule) ""
	set Para(newpath) ""
	set Para(vsds) ""

	set Para(Destination) "Synplicity"
	set Para(Order) "Big Endian \[MSB:LSB\]"
	set Para(IO) 0

	#21327 -> #24391
	set Para(EDIF) 1
	set Para(Expression) "BusA(0 to 7)"

	set Para(synthesistool) "synplify"

	#========================================
	# Para(DevCategory) - device category
	# 1. CPLD_SPLD :
	#			  ispXPLD 5000MX,
	#			  ispMACH 4000B/C/V,
	#			  ispMACH 4000Z, #
	#			  ispMACH/ispLSI 5000
	#			  MACH 5,
	#			  ispGAL/GAL
	# 2. DIGITAL  :
	#		ispGDX2/ispGDX2-E
	#		ispGDXV
	#		ispGDX
	# 3. FPGA		:
	#		LatticeECP-DSP, LatticeEC, LatticeXP, LatticeSC, MachXO, LatticeECP2
	#
	# 4. ORCA		:
	# 5. FPSC		:
	# 6. Others		:
	#========================================
	set Para(DevCategory) Others

	#========================================
	# Para(CmdLine) - command line
	# 1. EC_CMD		: LatticeECP-DSP, LatticeEC, LatticeXP, MachXO, LatticeECP2
	# 2. SC_CMD		: LatticeSC
	# 3. ORCA4_FPSC	:
	# 4. ORCA2A		:
	# 5. ORCA3		:
	# 5. Others		:
	#========================================
	set Para(CmdLine) Others

	#set Para(fpga_lst) {or5s00 ep5g00 ep5g00p mg5g00 mj5g00 ep5a00 ep5m00 or5s00m slayer mg5a00 ep5m00s ep5a00s ep5c00 xo2c00 xo3c00h}
	set Para(orca_lst) {orca2a orca3 orca4}
	set Para(dsp_lst) {ep5g00p ep5a00 ep5m00 mg5a00 ep5a00s ep5m00s ep5c00 sa5p00 sa5p00m sa5p00g xo3c00h}

	#This list is only for distributed_spram/dpram/shift_register.
	#ISPL_CR_38614 Distribtued_memory initialziation for XP2 (similar to SC/SCM)
	#ISPL_CR_41226 for ECP3
	set Para(mem_lst) {or5s00 or5s00m slayer mg5a00 ep5c00 xo2c00 sa5p00 xo2c00p sa5p00m sa5p00g xo3c00a xo3c00f sn5w00 wi5s00 xo3c00h se5c00 se5r00}

	#27821
	set Para(bCreateSymbol) 1

	GetDevResource
}

#**********************************************
#Common dialog window for set project info
#**********************************************
proc ProjectSet {} {
    global Para argc argv argv0 device_list ft pin_flag init_flag device_support env

	#tk_messageBox -default ok -icon info -message "Argv list: $argv0 $argv" -title ProjectSet -type ok
	#tk_messageBox -default ok -icon info -message "Argv list: prj = $Para(prj)" -title ProjectSet -type ok
	#!***********************
	#Para(bali)
	# false - ispLever
	# true  - bali
	#!***********************
	set Para(bali) false
	if {[info exists env(TOOLRTF)] == 1} {
		set Para(bali) true
	}
	#!***********************

	wm withdraw .
	SetFont

	option add *font $ft
	option add *textFont $ft
	option add *labelFont $ft

	GetEnvVariables
	ReadSDSFile

	InitPara
	#PCS setting via MACO.
	#set Para(DOUBLE_QUOTES_IN_LPC_flag) Disabled
	#if {$Para(family) == "latticeecp4" && $Para(CoreName) == "PCS"}
	if {[info exists Para(DOUBLE_QUOTES_IN_LPC_flag)] == 0} {
		set Para(DOUBLE_QUOTES_IN_LPC_flag) Disabled
	}
	set Para(DOUBLE_QUOTES_IN_LPC_flag) Disabled
	set Para(MACO_GUI_flag) false

	set value ""

	foreach arg $argv {
		if {([string first "-" $arg 0] == 0) && [string length [string range $arg 1 end]] > 0} {
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

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< dts 27463 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	foreach argument $argv_list value $value_list {
		if {$Para(bali) == "true"} {
            set value [string trim $value]
            set argument [string trim $argument]
            #
            # Look for xxxK and xxxM and generate the correct values
            #
            set val [string range $value 0 end-1]
            set k [string range $value end end]

            if {[string equal $k "K"] == 1 } {
                if {[string is double $val]} {
                    set value [expr $val*1024]
                } elseif {[string equal $k "M"] == 1 } {
                    set value [expr $val*1024*1024]
                }
            }
		}
		switch $argument {
			"path"   {
				set Para(ProjectPath)  $value
			    regsub -all "\"" $Para(ProjectPath) "" Para(ProjectPath)
			    regsub -all "\\\\" $Para(ProjectPath) "/" Para(ProjectPath)
			}
			"module" {set Para(ModuleName)   $value; regsub -all "\"" $Para(ModuleName) "" Para(ModuleName)}
			"design" {set Para(SourceFormat) $value; regsub -all "\"" $Para(SourceFormat) "" Para(SourceFormat)}
			"family" {set Para(family)       $value; regsub -all "\"" $Para(family) "" Para(family)}
			"ipdir"  {set Para(ipdir)        $value; regsub -all "\"" $Para(ipdir) "" Para(ipdir)}
			"device" {set Para(device)       $value; regsub -all "\"" $Para(device) "" Para(device)}
			"new"    {set Para(new)          $value; regsub -all "\"" $Para(new) "" Para(new)}
			"newmodule" {set Para(newmodule) $value; regsub -all "\"" $Para(newmodule) "" Para(newmodule)}
			"newpath"   {
				set Para(newpath)   $value
			    regsub -all "\"" $Para(newpath) "" Para(newpath)
			    regsub -all "\\\\" $Para(newpath) "/" Para(newpath)
			}
			"vsds" {set Para(vsds)	$value; regsub -all "\"" $Para(vsds) "" Para(vsds)}

			"ach"       {set Para(arch) $value; regsub -all "\"" $Para(arch) "" Para(arch)}
			"device"    {set device $value; regsub -all "\"" $device "" device}
			"pty"       {set pty $value; regsub -all "\"" $pty "" pty}
			"spd"       {set spd $value; regsub -all "\"" $spd "" spd}
			"pkg"       {set pkg $value; regsub -all "\"" $pkg "" pkg}
			"opt"       {set opt $value; regsub -all "\"" $opt "" opt}
			"sta"       {set sta $value; regsub -all "\"" $sta "" sta}
			"vlt"       {set Para(Dev_Voltage) $value; regsub -all "\"" $Para(Dev_Voltage) "" Para(Dev_Voltage)}
			"lut"       {set Para(Dev_LUT) $value; regsub -all "\"" $Para(Dev_LUT) "" Para(Dev_LUT)}
			"reg"       {set Para(Dev_Registers) $value; regsub -all "\"" $Para(Dev_Registers) "" Para(Dev_Registers)}
			"EBT"       {set Para(Dev_EBR_Bits) $value; regsub -all "\"" $Para(Dev_EBR_Bits) "" Para(Dev_EBR_Bits)}
			"EBB"       {set Para(Dev_EBR_Blocks) $value; regsub -all "\"" $Para(Dev_EBR_Blocks) "" Para(Dev_EBR_Blocks)}
			"RAM"       {set Para(Dev_Dist_RAM) $value; regsub -all "\"" $Para(Dev_Dist_RAM) "" Para(Dev_Dist_RAM)}
			"DSP"       {set Para(Dev_sysDSP) $value; regsub -all "\"" $Para(Dev_sysDSP) "" Para(Dev_sysDSP)}
			"PLL"       {set Para(Dev_PLL) $value; regsub -all "\"" $Para(Dev_PLL) "" Para(Dev_PLL)}
			"DLL"       {set Para(Dev_DLL) $value; regsub -all "\"" $Para(Dev_DLL) "" Para(Dev_DLL)}
			"PCS"       {set Para(Dev_SERDES_Pairs) $value; regsub -all "\"" $Para(Dev_SERDES_Pairs) "" Para(Dev_SERDES_Pairs)}
			"IOC"       {set Para(Dev_PIO_Cells) $value; regsub -all "\"" $Para(Dev_PIO_Cells) "" Para(Dev_PIO_Cells)}

			"SPIO"       {set Para(SPIO) $value; regsub -all "\"" $Para(SPIO) "" Para(SPIO)}
			"SDQS"       {set Para(SDQS) $value; regsub -all "\"" $Para(SDQS) "" Para(SDQS)}

			#PCS setting via MACO.
			#-PROTOCOL MACO_SRIO -NUM_CHS $Para(LANE_SEL) -MAX_RATE $Para(GBAUD)
			"ip"	   {set Para(MACO_GUI_flag) true}
			"PROTOCOL" {set Para(MACO_PROTOCOL)	$value; regsub -all "\"" $Para(MACO_PROTOCOL) "" Para(MACO_PROTOCOL)}
			"NUM_CHS"  {set Para(MACO_NUM_CHS)	$value; regsub -all "\"" $Para(MACO_NUM_CHS) "" Para(MACO_NUM_CHS)}
			"MAX_RATE" {set Para(MACO_MAX_RATE)	$value; regsub -all "\"" $Para(MACO_MAX_RATE) "" Para(MACO_MAX_RATE)}

			"synthesis" {set Para(synthesistool) $value; regsub -all "\"" $Para(synthesistool) "" Para(synthesistool)}
		}
	}

	SetArchValue

	#set Para(vsds) "E:/work_list/sds/testdev_lfscm3ga15e_a_fam.sds"
	#set Para(device) "testdev_LFSCM3GA15E_A-7FPBGA256C"
	# Read SDS file of Virtual Device.
	if {[string length $Para(vsds)] > 0}  {
		set arch $Para(arch)
		ReadSDSFile $Para(vsds)
		set Para(arch) $arch
	}
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< dts 27463 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	# Following para passed from IPWidgets.
	#	Para(TYPE) = IP
	#	Para(DeviceFamily) = LatticeXP
	#	Para(CoreName) = PCI_Target
	#	Para(Version) = 1.0
	#	Para(Category) =
	#	Para(DesignEntry) = VHDL, Verilog HDL
	#	Para(DeviceFile)=mg5g00.sds
	#	Para(ispLeverVersion)=5.1

	#tk_messageBox -default ok -icon info -message $Para(Version) -title ProjectSet -type ok

	# special control for SC since the intername are not-consistent in SDS file.
	#if {[string compare -nocase $Para(family) "LatticeSC"] == 0}  {set Para(family) lattice-sc}

	#set Para(ProjectPath) [file join $Para(ProjectPath) [file dirname $Para(ModuleName)]]
	set dirname [file dirname $Para(ModuleName)]
	set Para(ModuleName) [file tail $Para(ModuleName)]
	CheckModuleName
	set Para(LpcFile) [AddExt $Para(ModuleName) ".lpc"]
	set Para(ParaFile) [file join $Para(ProjectPath) $dirname $Para(LpcFile)]
	set Para(ProjectPath) [file dirname $Para(ParaFile)]

	if {$Para(new) == 1}  {
		# create a new module
		set mn $Para(ModuleName)
		set sf $Para(SourceFormat)
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< dts 27463 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#		#set default_file [file join $Para(ipdir) $Para(family) Preference "default.lpc"]
#		set familyy [string tolower $Para(family)]
#		set default_file [file join $Para(ipdir) $familyy preference "default.lpc"]
#		if {[file exists $default_file] == 0} {
#			set default_file [file join $Para(ipdir) preference "default.lpc"]
#		}
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< dts 27463 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		set default_file [file join $Para(lpc) "default.lpc"]		
		LoadDefaultParameter $Para(CoreName) $default_file
		set Para(ModuleName)   $mn
		set Para(SourceFormat) $sf
	} else {
		# 28160 - load init value
		set mn $Para(ModuleName)
		set sf $Para(SourceFormat)
#		set familyy [string tolower $Para(family)]
#		set default_file [file join $Para(ipdir) $familyy preference "default.lpc"]
#		if {[file exists $default_file] == 0} {
#			set default_file [file join $Para(ipdir) preference "default.lpc"]
#		}
		set default_file [file join $Para(lpc) "default.lpc"]
		LoadDefaultParameter $Para(CoreName) $default_file
		set Para(ModuleName)   $mn

		# open an existing module
		#set Para(LpcFile) [AddExt $Para(ModuleName) ".lpc"]
		#set Para(ParaFile) [file join $Para(ProjectPath) $Para(LpcFile)]
		set i [LoadParameter $Para(CoreName) $Para(ParaFile)]
		if {$i == -1} {exit -1}
		#set Para(newmodule) test123
		if {[string length $Para(newmodule)] > 0}  {
			set Para(ModuleName) $Para(newmodule)
		}
		set Para(SourceFormat) $sf
		catch LoadSpecialSettingCB
	}
#	catch LoadParaCB

	#set Para(ProjectPath) "x:/test"
	if {[string length $Para(newpath)] > 0}  {
		set Para(ProjectPath) $Para(newpath)
	}
	#17830
	set sf [string tolower $Para(SourceFormat)]
	switch $sf {
		"verilog" -
		"verilog hdl" -
		"schematic/verilog hdl" {set Para(Verilog) 1}
		"vhdl" -
		"schematic/vhdl" {set Para(VHDL) 1}
		"edif" {set Para(EDIF) 1}
	}

	if {$Para(bali) == "false"} {
		if {[GetDeviceInfo] == -1} {exit -1}
	} else {
		#
		# Get device information from command line
		#

		set Para(PartName) $Para(device)
		set Para(PartType) $pty
		set Para(SpeedGrade) $spd
		set Para(Package) $pkg
		set Para(OperatingCondition) $opt
		set Para(Status) $sta

		set speed [string range $Para(SpeedGrade) 0 end-1]
		set minus [string range $Para(SpeedGrade) end end]
		if {[string equal $minus "-"] == 1} {
			unset Para(SpeedGrade)
			append Para(SpeedGrade) $minus $speed
		}

		SetArchValue
	}
		#tk_messageBox -default ok -icon warning -message "Status: $Para(Status)\nPartType: $Para(PartType)\nSpeedGrade: $Para(SpeedGrade)\nPackage: $Para(Package)\nCondition: $Para(OperatingCondition)" -title OrcaControl.ProjectSet -type ok
        #tk_messageBox -default ok -icon warning -message "arch: $Para(arch)\nDev_Voltage: $Para(Dev_Voltage)\nDev_LUT: $Para(Dev_LUT)\nDev_Registers: $Para(Dev_Registers)\nDev_EBR_Bits: $Para(Dev_EBR_Bits)" -title OrcaControl.ProjectSet -type ok
        #tk_messageBox -default ok -icon warning -message "Dev_EBR_Blocks: $Para(Dev_EBR_Blocks)\nDev_Dist_RAM: $Para(Dev_Dist_RAM)\nDev_sysDSP: $Para(Dev_sysDSP)\nDev_PLL: $Para(Dev_PLL)" -title OrcaControl.ProjectSet -type ok
        #tk_messageBox -default ok -icon warning -message "Dev_DLL: $Para(Dev_DLL)\nDev_SERDES_Pairs: $Para(Dev_SERDES_Pairs)\nDev_PIO_Cells: $Para(Dev_PIO_Cells)\nDev_PIO_Pins: $Para(Dev_PIO_Pins)" -title OrcaControl.ProjectSet -type ok

	cd $Para(ProjectPath)
}

proc Copy {} {
	global Para

	ProjectSet

	set Para(MessageList) ""

	set ret [CreateLpcFile]
	CreateGenerateFile

	return $ret
}

