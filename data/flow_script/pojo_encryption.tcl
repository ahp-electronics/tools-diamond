#Generate the synthesis tcl project file for synplify, only for pojo2
proc gen_pojo_synplify_tcl {{using_argument no_argument}} {
	set result_dir "[runtime_property value result_dir]"
	set rep_name "ASCVM"
	set target_file $rep_name
	set log_name $rep_name
	set file_name "${rep_name}_synplify.tcl"
	set prj_name [runtime_property value project.title]
	set prj_dir [runtime_property value project.project_path]
	set imp_name [runtime_property value implementation.title]
	set ptm_name [runtime_property value implementation.PTM.basename]
	if {[catch {set cf [open $file_name w]} err]} {
		runtime_log -err "open $file_name failed: $err\n"
		return -code error
	}
	if {[catch {
			puts $cf "#-- Lattice Semiconductor Corporation Ltd."
			puts $cf "#-- Synplify OEM project file"
			puts $cf ""
			puts $cf "#device options"
			puts $cf "set_option -technology [runtime_property value device.SynplifyTech]"
			#puts $cf "set_option -technology machx02"
			puts $cf "set_option -part [runtime_property value device.SynplifyPart]"
			#puts $cf "set_option -part LCMXO2_4000HC"
			puts $cf "set_option -package [runtime_property value device.short_package]"
			#puts $cf "set_option -package CSBGA132"
			#puts $cf "set_option -speed_grade -[runtime_property value device.speed]"
			puts $cf "set_option -speed_grade 5"
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfResSharing]"
			puts $cf "set_option -resource_sharing true"			
			puts $cf ""
			puts $cf "#use verilog 2001 standard option"
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfVerilogInput]"
			puts $cf "set_option -vlog_std v2001"
			puts $cf ""
			puts $cf "#map options"
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfFrequency]"
			puts $cf "set_option -frequency 8.00"
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfFanout]"
			puts $cf "set_option -fanout_limit 100"
            #puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfInsertIO]"
			puts $cf "set_option -disable_io_insertion true"			
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfRunRetiming]"
			puts $cf "set_option -retiming false"
			puts $cf "set_option -pipe false"
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfGSR]"
			puts $cf "set_option -force_gsr auto"			
			puts $cf ""	
			puts $cf "#simulation options"
			puts $cf "set_option -write_verilog false"
			puts $cf "set_option -write_vhdl false"
			puts $cf ""				
			puts $cf "#automatic place and route (vendor) options"
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfInPrfWrite]"
			puts $cf "set_option -write_apr_constraint 0"
			puts $cf ""	
			puts $cf "#-- add_file options"
			if [catch { foreach search_path [prj_impl option -impl $imp_name include\ path] {
				if { [string length $search_path] > 0 } {
						set search_path [::bali::utility::path::get_absolute_path $prj_dir $search_path]
						puts $cf "set_option -include_path \{$search_path\}"
					}
				}
			} r] {}
			puts $cf "set_option -include_path \{$prj_dir\}"			
			puts $cf "add_file -verilog \{[runtime_property value  InstallPath]/cae_library/synthesis/verilog/machxo2.v\}"
			puts $cf "add_file -verilog \{[runtime_property value implementation.PTM.absolutepath]/${ptm_name}_ptm/ASCVM/src/params/verilog/ASCVM_PARAMS.v\}"
			puts $cf "add_file -verilog \{[runtime_property value implementation.PTM.absolutepath]/${ptm_name}_ptm/ASCVM/src/ertl/verilog/ertl.v\}"
			puts $cf ""
			puts $cf "#-- top module name"
			puts $cf "set_option -top_module ${rep_name}"			
			puts $cf ""
			puts $cf "#-- set result format/file last"
			puts $cf "project -result_file \{${result_dir}/${target_file}.edi\}"
			puts $cf ""
			puts $cf "#-- error message log file"
			puts $cf "project -log_file \{${log_name}.srf\}"
            #puts $cf ""
			#puts $cf "#-- set any command lines input by customer"
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_CmdLineArgs]"
			puts $cf ""
			puts $cf "#-- run Synplify with 'arrange HDL file'"
			#puts $cf "project -run"
			#if 'rerun' Synplify or 'rerun all', add '-clean' option
			set runType [runtime_property value VARIABLE::_CurrentRunType]	
			set runmilestone [runtime_property value VARIABLE::_CurrentRunMilestone]
			set runtask [runtime_property value VARIABLE::_CurrentRunTask]
			if { $runType == "ForceRunAll" } {
				puts $cf "project -run -clean"
			} elseif { $runType == "ForceOne"} 	{
				if { [string equal -nocase $runmilestone "Synthesis"] && ([string length $runtask] == 0 || [string equal -nocase $runtask "Synplify_Synthesis"]) } {
					puts $cf "project -run -clean"
				} else {
					puts $cf "project -run"
				}
			} else {
				puts $cf "project -run"
			}			
		} err]} {
		close $cf
		return $err -code error
	}
	close $cf
}
