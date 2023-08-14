#Generate the synthesis tcl project file for precision
proc gen_precision_tcl {{using_reveal no_reveal}} {
	set result_dir "[runtime_property value result_dir]"
	set rep_name "[runtime_property value report_base]"
	set file_name "${rep_name}_precision.tcl"
	set prj_name [runtime_property value project.title]
	set prj_dir $result_dir
	set root_dir [runtime_property value project.project_path]
	if {[catch {set cf [open $file_name w]} err]} {
		runtime_log -err "open $file_name failed: $err\n"
		return -code error
	}
	puts $cf "if \{ \[catch \{"
    puts $cf "new_project -name verilog_hierarchical_design -folder \"$prj_dir\" -createimpl_name \"${prj_name}_impl\" -force"
	set has_verilog 0
	set has_vhdl 0
	if {$using_reveal == "reveal"} {
		set rvp_file "${rep_name}.rvp"
		foreach {src src_opt} [bali::utility::get_ini_section $rvp_file "Generated"] {
			regsub -all {,\s*} $src_opt "," src_opt
			set options [split $src_opt ","]
			set type [lindex $options 0]
			if { $type == "VHDL" } {
				set work_lib [lindex $options 1]
				if { [string length $work_lib] == 0 } {
					set work_lib work
				}
				set cmd "add_input_file -format vhdl  \{\"$src\"\} -work \"$work_lib\""
				set has_vhdl 1
			} elseif { $type == "Verilog" } {
				set cmd "add_input_file -format verilog \{\"$src\"\} "
				set has_verilog 1
			}
			lappend hdls $cmd
		}
	} else {
		set size [runtime_property value implementation.synthesis_hdls._COUNT]
		for {set x 0} {$x<$size} {incr x} {
			set src [runtime_property value implementation.synthesis_hdls.$x]
			set type [runtime_property value implementation.synthesis_hdls.$x.type]
			if { $type == "Verilog" } {
				set has_verilog 1
				set search_path [::bali::utility::path::get_absolute_path_list $root_dir [split [runtime_property value "implementation.synthesis_hdls.$x.include path"] ";" ] ]
				lappend search_path [::bali::utility::path::get_file_path $src] 
				set cmd "add_input_file -format verilog \{\"$src\"\} "
				if { [string length $search_path] != 0 } {
					append cmd "-search_path \{$search_path\}"
				}
			} else {
				set has_vhdl 1
				set work_lib [runtime_property value "implementation.synthesis_hdls.$x.lib"]
				if { [string length $work_lib] == 0 } {
					set work_lib work
				}
				set cmd "add_input_file -format vhdl \{\"$src\"\} -work \"$work_lib\""
			}
			lappend hdls $cmd
		}
	}
	if { $has_verilog == 1 } {
		puts $cf "add_input_file -format verilog \"[runtime_property value  InstallPath]/cae_library/synthesis/verilog/[runtime_property value device.PrimitiveLib].v\""
	} elseif { $has_vhdl == 1 } {
		puts $cf "add_input_file -format vhdl \"[runtime_property value  InstallPath]/cae_library/synthesis/vhdl/[runtime_property value device.PrimitiveLib].vhd\""
	}
    if {$using_reveal == "reveal"} {
        puts $cf "add_input_file -format verilog \"[runtime_property value  InstallPath]/cae_library/synthesis/verilog/pmi_def.v\""
        puts $cf "add_input_file -format verilog \"[runtime_property value  InstallPath]/module/reveal/src/ertl/ertl.v\""
    }
	foreach hdl $hdls {
		puts $cf $hdl
	}
	if { $has_verilog == 1 } {
		set search_path [::bali::utility::path::get_absolute_path_list $root_dir [split [runtime_property value "implementation.include path"] ";" ] ]
		lappend search_path $root_dir
		puts $cf "setup_design -search_path \{$search_path\}"
	}
	set top_module [runtime_property value implementation.top]
	#If the design is mixed hdl entry, we have to set the top for synthesis
	if { [string length $top_module] == 0 && $has_verilog == 1 && $has_vhdl == 1 } {
		set top_module [runtime_property value implementation.def_top]
	}
	puts $cf "setup_design -design=\"${top_module}\""
	puts $cf "setup_design -manufacturer Lattice -family \"[runtime_property value device.family]\" -part [runtime_property value device.device] -speed [runtime_property value device.speed] -package [runtime_property value device.package]"
	puts $cf "setup_design -basename \"[runtime_property value report_base]\""
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynPrf]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynComArea]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfArrayBoundsCase]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfAutoResOfRam]"	
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynFreq]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSyninpd]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynoutd]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynOutPref]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynFSM]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynCritcal]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynRetime]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynGatedClk]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynIOPad]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynGSR]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfFullCase]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfIgnoreRamRWCol]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfDSPAcrossHie]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfParaCase]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfResSharing]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfReencodeFSM]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfUseSafeFSM]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynTransform]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfVlog2001]"
	#puts $cf "setup_design -verilog"
	#puts $cf "setup_design -vhdl"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynOutNetForm]"
	puts $cf "compile"
	puts $cf "synthesize"
	puts $cf "report_timing -all_clocks"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynTimSum]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_VSynRepClkFreq]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfMissConstraint]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfTimingViolation]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfClockDomainCross]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_EdfNetFanout]"
	puts $cf "[runtime_strategy cmd_option PROP_PRE_CmdLineArgs]"
	puts $cf "save_impl"
	puts $cf "file copy -force \"./${prj_name}_impl/[runtime_property value report_base].edf\" \"${rep_name}.edi\""
	puts $cf "close_project"
	puts $cf "\} result\]\} \{"
	puts $cf "save_impl"
	puts $cf "close_project"
	puts $cf "exit 1\}"
	close $cf
}