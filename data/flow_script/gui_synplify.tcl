# These functions can be used in the tcl scripts in the Bali project manager
# to generate the synthesis project tcl file
# Copyright (c), 2009, Lattice Semiconductor Corporation, All Rights Reserved

proc apply_guisyn_result {implement} {
	set prj_dir [bali_core::bali_property Project.project_path]
	set working_dir $prj_dir/[bali_core::bali_property Project.implementations.${implement}.dir]
	set result_file $working_dir/${implement}.edi
	set target_file $working_dir/[bali_core::bali_property Project.project_path]
	if [ file isfile $result_file ] {
		if {[catch { file copy -force $result_file $working_dir/[bali_core::bali_property Project.title]_${implement}.edi } err] } {
			return -code error $err
		}
	} else {
		return -code error "Synthesis result has not been generated."
	}
	if [catch {	bali_core::bali_setbuildstatus -impl $implement -milestone Synthesis Updated } err] {
		return -code error $err
	}	
}

# convert PN SystemVerilog option to Synplify vlog_std command
#   "Verilog 95"     => v95
#   "Verilog 2001"   => v2001
#   "System Verilog" => sysv
proc to_vlog_std_cmd {vlog_std_option} {
    if { $vlog_std_option == "Verilog 95"} {
        set vlog_std v95
    } elseif { $vlog_std_option == "Verilog 2001"} {
        set vlog_std v2001
    } elseif { $vlog_std_option == "System Verilog"} {
        set vlog_std sysv
    } else {
        set vlog_std v2001
    }
    return $vlog_std
}

proc launch_synplify_prj {implement} {
	if { [string length [bali_core::bali_property Project]] == 0 } {
		set err "No project is opened."
		return -code error $err
	}
	if { [string length [bali_core::bali_property Project.implementations.$implement]] == 0 } {
		set err "Can't find implementation '$implement' in current project."
		return -code error $err
	}
	set prj_dir [bali_core::bali_property Project.project_path]
	set working_dir $prj_dir/[bali_core::bali_property Project.implementations.${implement}.dir]
	set synplify_prj ${working_dir}/${implement}_syn.prj
	set file_name ${working_dir}/launch_synplify.tcl
	if {[catch {set cf [open $file_name w]} err]} {
		return -code error $err
	}
	if {[catch {
			puts $cf "#-- Lattice Semiconductor Corporation Ltd."
			puts $cf "#-- Synplify OEM project file ${file_name}"
			puts $cf "#-- Written on [clock format [clock seconds] -format "%a %b %e %T %G"]\n"
            #puts $cf "set create_new 0"
			puts $cf "project -close"
			puts $cf "set filename \"$synplify_prj\""
			#D2.1 ECN 100
			set export_setting [bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_ExportSetting.value]
			if { [string compare -nocase $export_setting "Yes"] == 0 } {
				puts $cf "project -new \"\$filename\"" 
				puts $cf "set create_new 1"			
			} elseif { [string compare -nocase $export_setting "Only on First Launch"] == 0 } {
				puts $cf "if (\[file exists \"\$filename\"\]) \{"
				puts $cf "\tproject -load \"\$filename\""
				puts $cf "\tproject_file -remove *"
				puts $cf "\tset create_new 0"
				puts $cf "\} else \{"
				puts $cf "\tproject -new \"\$filename\""
				puts $cf "\tset create_new 1"
				puts $cf "\}"							
			} else {
				puts $cf "if (\[file exists \"\$filename\"\]) \{"
				puts $cf "\tproject -load \"\$filename\""
				puts $cf "\tproject_file -remove *"
				puts $cf "\} else \{"
				puts $cf "\tproject -new \"\$filename\"" 				
				puts $cf "\}"
				puts $cf "set create_new 0"
			}
			puts $cf ""
			puts $cf  "#device options"
			puts $cf "set_option -technology [bali_core::bali_property Project.device.SynplifyTech]"
			puts $cf "set_option -part [bali_core::bali_property Project.device.SynplifyPart]"
            puts $cf "set_option -package [bali_core::bali_property Project.device.short_package]"
			puts $cf "set_option -speed_grade -[bali_core::bali_property Project.device.speed]"
			puts $cf ""
# for D2.1 ECN 70. pass the diamond settings to synplify project, and keep changes by user.
            puts $cf "if \{\$create_new == 1\} \{"
            puts $cf "#-- add synthesis options"
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfSymFSM.command_line]"
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfResSharing.command_line]"
            #puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfVerilogInput.command_line]"
            set vlog_std [bali_core::bali_property Project.implementations.${implement}.VerilogStandard]
            puts $cf "\tset_option -vlog_std [to_vlog_std_cmd $vlog_std]"

            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfFrequency.command_line]"
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfFanout.command_line]"
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfUnconsClk.command_line]"
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfInsertIO.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfRunRetiming.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfGSR.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfPushTirstates.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfAllowDUPMod.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfArea.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfDefEnumEncode.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfOutNetForm.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfNumCritPath.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfNumStartEnd.command_line]" 
            #puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfInPrfWrite.command_line]" 
			puts $cf "\tset_option -write_apr_constraint 1" 
            #puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfFixGateClocks.command_line]" 
            #puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_EdfFixGeneratedClocks.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_ClockConversion.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_UpdateCompilePtTimData.command_line]" 
            puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_ResolvedMixedDrivers.command_line]"
			puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_VHDL2008.command_line]"
			puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_LibPath.command_line]"
			puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_DisableRegisterRep.command_line]"
			puts $cf "\t[bali_core::bali_property Project.implementations.${implement}.strategy.PROP_SYN_CmdLineArgs.command_line]"
            puts $cf "\}"
			puts $cf "#-- add_file options"
            #Setup the SDC file
            foreach sdc_file [bali_core::bali_property Project.implementations.${implement}.Synplify\ Design\ Constraints\ File] {
                if {[string length $sdc_file] > 0 } {
                    puts $cf "add_file -constraint \{$sdc_file\}"
                }
            }
			#Setup the synthesis source data
			set has_verilog 0
			set has_vhdl 0
			set size [bali_core::bali_property Project.implementations.${implement}.synthesis_hdls._COUNT]
			for {set x 0} {$x<$size} {incr x} {
				set src [bali_core::bali_property Project.implementations.${implement}.synthesis_hdls.$x]
				set type [bali_core::bali_property Project.implementations.${implement}.synthesis_hdls.$x.type]
				if { $type == "Verilog" } {
					set vlog_std_option [bali_core::bali_property Project.implementations.${implement}.synthesis_hdls.$x.VerilogStandard]
                    set cmd "add_file -verilog -vlog_std [to_vlog_std_cmd $vlog_std_option] \"$src\""
					set has_verilog 1
				} else {
					set work_lib [bali_core::bali_property Project.implementations.${implement}.synthesis_hdls.$x.lib]
					if { [string length $work_lib] == 0 } {
						set work_lib work
					}
					set cmd "add_file -vhdl -lib \"$work_lib\" \"$src\""
					set has_vhdl 1
				}
				lappend hdls $cmd
			}
			if [catch { foreach hdl_param [prj_impl option -impl $implement HDL_PARAM] {
				if { [string length $hdl_param] > 0 } {
					#If we use the Tcl8.5, then the following foreach command can be replaced by lassign command
					foreach {param_key parem_val} [split $hdl_param \=] { break }
					puts $cf "set_option -hdl_param -set $param_key {$parem_val}"
				}
			} } r] { }
			if { $has_verilog == 1 } {
				set size [bali_core::bali_property Project.implementations.${implement}.SBX._COUNT]
				for {set x 0} {$x<$size} {incr x} {
					if [catch { foreach search_path [bali_core::bali_property Project.implementations.${implement}.SBX.$x.inc_path_syn] {
						if { [string length $search_path] > 0 } {
								set search_path [::bali::utility::path::get_absolute_path $prj_dir $search_path]
								puts $cf "set_option -include_path \{$search_path\}"
							}
						}
					} r] {}
				}
				if {$size > 0} {
					puts $cf "set_option -hdl_define -set SBP_SYNTHESIS"
				}
				#If the option dose not exist, the prj option command will return error.
				#We need catch the error
				if [catch { foreach search_path [prj_impl option  -impl $implement include\ path] {
					if { [string length $search_path] > 0 } {
							set search_path [::bali::utility::path::get_absolute_path $prj_dir $search_path]
							puts $cf "set_option -include_path \"$search_path\""
						}
					}
				} r] {}
				puts $cf "set_option -include_path \"$prj_dir\""
                if [catch { 
					set hdl_directives [prj_impl option -impl $implement VERILOG_DIRECTIVES]
					if { [string length $hdl_directives] > 0} {
						puts $cf "set_option -hdl_define -set \"$hdl_directives\""
					}
				} r] { }
				#D3.0, synpilfy could add primitive automatically
				#puts $cf "add_file -verilog \"[bali_core::bali_property -env InstallPath]/cae_library/synthesis/verilog/[bali_core::bali_property Project.device.PrimitiveLib].v\""
			} elseif { $has_vhdl == 1 } {
				puts $cf "add_file -vhdl \"[bali_core::bali_property -env InstallPath]/cae_library/synthesis/vhdl/[bali_core::bali_property Project.device.PrimitiveLib].vhd\""
			}
			if [info exists hdls] {
				foreach hdl $hdls {
					puts $cf $hdl
				}
			}
			set top_module [bali_core::bali_property Project.implementations.${implement}.top]
			#If the design is mixed hdl entry, we have to set the top for synthesis
			if { [string length $top_module] == 0 && $has_verilog == 1 && $has_vhdl == 1 } {
				set top_module [bali_core::bali_property Project.implementations.${implement}.def_top]
			}
			#if { [string length $top_module] > 0 } {
				puts $cf "#-- top module name"
				puts $cf "set_option -top_module \{$top_module\}"
			#}
			puts $cf "project -result_file \{$working_dir/${implement}.edi\}"
			puts $cf "project -save \"\$filename\""
	} err]} {
		close $cf
		return -code error $err 
	}
	close $cf
	cd $working_dir
	exec synpwrap -int $file_name &
	cd $prj_dir
}
