# convert PN SystemVerilog option to Synplify vlog_std command
#   "Verilog 95"     => v95
#   "Verilog 2001"   => v2001
#   "System Verilog" => sysv
proc to_vlog_std_cmd {vlog_std_option} {
    if { $vlog_std_option == "Verilog 95" || $vlog_std_option == "Verilog_95"} {
        set vlog_std v95
    } elseif { $vlog_std_option == "Verilog 2001" || $vlog_std_option == "Verilog_2001"} {
        set vlog_std v2001
    } elseif { $vlog_std_option == "System Verilog" || $vlog_std_option == "System_Verilog"} {
        set vlog_std sysv
    } else {
        set vlog_std v2001
    }
    return $vlog_std
}

#Generate the synthesis tcl project file for synplify
proc gen_synplify_tcl {{using_reveal no_reveal}} {
	set result_dir "[runtime_property value result_dir]"
    set rep_name "[runtime_property value report_base]"
    if {$using_reveal == "gen_core"} {
        set log_name "reveal_coretop"
        set target_file "reveal_debug_coretop"
        set file_name "${log_name}_synplify.tcl"
    } else {
        set target_file $rep_name
        set log_name $rep_name
        set file_name "${rep_name}_synplify.tcl"
    }
	set prj_name [runtime_property value project.title]
	set prj_dir [runtime_property value project.project_path]
	set imp_name [runtime_property value implementation.title]
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
			puts $cf "set_option -part [runtime_property value device.SynplifyPart]"
			puts $cf "set_option -package [runtime_property value device.short_package]"
			puts $cf "set_option -speed_grade -[runtime_property value device.speed]"
			puts $cf ""
			puts $cf "#compilation/mapping options"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfSymFSM]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfResSharing]"
			puts $cf ""
			puts $cf "#use verilog 2001 standard option"
            if {$using_reveal == "gen_core"} {
                puts $cf "set_option -vlog_std v2001" 
            } else {
                #puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfVerilogInput]"
                set vlog_std [runtime_property value implementation.VerilogStandard]
                puts $cf "set_option -vlog_std [to_vlog_std_cmd $vlog_std]"
            }
			puts $cf ""
			puts $cf "#map options"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfFrequency]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfFanout]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfUnconsClk]"
            if {$using_reveal == "gen_core"} {
                puts $cf "set_option -disable_io_insertion true"
            } else {
                puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfInsertIO]"
            }
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfRunRetiming]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfGSR]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfPushTirstates]"
            if {$using_reveal == "reveal"} {
                puts $cf "set_option -dup 1"
            } else {
                puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfAllowDUPMod]"
            }			
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfArea]"
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfInConsFile]"
            foreach sdc_file [runtime_property value "implementation.Synplify Design Constraints File"] {
                puts $cf "add_file -constraint \{$sdc_file\}"
            }
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfOutNetForm]"      
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfDefEnumEncode]"
			
			puts $cf ""
			puts $cf "#simulation options"
			#puts $cf "set_option -write_verilog true"
			#puts $cf "set_option -write_vhdl true"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfOutNetForm]"
			puts $cf ""
			puts $cf "#timing analysis options"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfNumCritPath]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfNumStartEnd]"
			puts $cf ""
			puts $cf "#automatic place and route (vendor) options"
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfInPrfWrite]"
			puts $cf "set_option -write_apr_constraint 1"

			puts $cf ""
			puts $cf "#synplifyPro options"
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfFixGateClocks]"
			#puts $cf "[runtime_strategy cmd_option PROP_SYN_EdfFixGeneratedClocks]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_ClockConversion]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_UpdateCompilePtTimData]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_ResolvedMixedDrivers]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_VHDL2008]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_LibPath]"
			puts $cf "[runtime_strategy cmd_option PROP_SYN_DisableRegisterRep]"
			puts $cf ""	
			puts $cf "#-- add_file options"
			#Setup the synthesis source data
			set has_verilog 0
			set has_vhdl 0
			if {$using_reveal == "reveal" || $using_reveal == "gen_core"} {
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
						set cmd "add_file -vhdl -lib \"$work_lib\" \{$src\}"
						set has_vhdl 1
					} elseif { $type == "Verilog" } {
						set cmd "add_file -verilog -vlog_std v2001 \{$src\}"
						set has_verilog 1
					} elseif { $type == "System Verilog" } {
                        set cmd "add_file -verilog -vlog_std sysv \{$src\} "
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
						#set cmd "add_file -verilog \{$src\}"
						set vlog_std_option [runtime_property value implementation.synthesis_hdls.$x.VerilogStandard]
                        set cmd "add_file -verilog -vlog_std [to_vlog_std_cmd $vlog_std_option] \{$src\}"
						set has_verilog 1
					} else {
						set work_lib [runtime_property value implementation.synthesis_hdls.$x.lib]
						if { [string length $work_lib] == 0 } {
							set work_lib work
						}
						set cmd "add_file -vhdl -lib \"$work_lib\" \{$src\}"
						set has_vhdl 1
					}
					lappend hdls $cmd
			    }
			}
            if {$using_reveal != "gen_core"} {
                if [catch { foreach hdl_param [prj_impl option -impl $imp_name HDL_PARAM] {
                        if { [string length $hdl_param] > 0 } {
                            #If we use the Tcl8.5, then the following foreach command can be replaced by lassign command
                            foreach {param_key parem_val} [split $hdl_param \=] { break }
                            puts $cf "set_option -hdl_param -set $param_key \{$parem_val\}"
                        }
                    } } r] { }
            }
            
			if { $has_verilog == 1 } {
                if {$using_reveal != "gen_core"} { 
                    #If the option dose not exist, the prj option command will return error.
                    #We need catch the error				
					set size [runtime_property value implementation.SBX._COUNT]
					for {set x 0} {$x<$size} {incr x} {
						if [catch { foreach search_path [runtime_property value implementation.SBX.$x.inc_path_syn] {
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
                    if [catch { foreach search_path [prj_impl option -impl $imp_name include\ path] {
                        if { [string length $search_path] > 0 } {
                                set search_path [::bali::utility::path::get_absolute_path $prj_dir $search_path]
                                puts $cf "set_option -include_path \{$search_path\}"
                            }
                        }
                    } r] {}
                    puts $cf "set_option -include_path \{$prj_dir\}"
                    if [catch { 
					    set hdl_directives [prj_impl option -impl $imp_name VERILOG_DIRECTIVES]
						if { [string length $hdl_directives] > 0} {
						    puts $cf "set_option -hdl_define -set \"$hdl_directives\""
						}
					} r] { }
                }
				#D3.0, synpilfy could add primitive automatically
				#puts $cf "add_file -verilog \{[runtime_property value  InstallPath]/cae_library/synthesis/verilog/[runtime_property value device.PrimitiveLib].v\}"
			} elseif { $has_vhdl == 1 } {
				puts $cf "add_file -vhdl \{[runtime_property value  InstallPath]/cae_library/synthesis/vhdl/[runtime_property value device.PrimitiveLib].vhd\}"
			}
            if {$using_reveal == "reveal" || $using_reveal == "gen_core"} {
                puts $cf "add_file -verilog \{[runtime_property value  InstallPath]/cae_library/synthesis/verilog/pmi_def.v\}"
                puts $cf "add_file -verilog \{[runtime_property value  InstallPath]/module/reveal/src/ertl/ertl.v\}"
            }
            if {$using_reveal == "reveal"} {
                puts $cf "add_file -verilog \{[runtime_property value  InstallPath]/module/reveal/src/rvl_j2w_module/rvl_j2w_module.v\}"
				puts $cf "add_file -verilog \{[runtime_property value  InstallPath]/module/reveal/src/rvl_j2w_module/wb2sci.v\}"
				puts $cf "add_file -verilog \{[runtime_property value  InstallPath]/module/reveal/src/ertl/JTAG_SOFT.v\}"
            }
			
            foreach hdl $hdls {
				puts $cf $hdl
			}
			puts $cf ""
            if {$using_reveal == "gen_core"} {
                set top_module reveal_coretop
            } else {
                set top_module [runtime_property value implementation.top]
                #If the design is mixed hdl entry, we have to set the top for synthesis
                #If in reveal flow, we also have to set the top for synthesis
                #So we always set the top for synthesis
                if { [string length $top_module] == 0 } {
                    set top_module [runtime_property value implementation.def_top]
                }    
            }
            if { [string length $top_module] > 0 } {
                puts $cf "#-- top module name"
                puts $cf "set_option -top_module $top_module"
            }
			puts $cf ""
			puts $cf "#-- set result format/file last"
			puts $cf "project -result_file \{${result_dir}/${target_file}.edi\}"
			puts $cf ""
			puts $cf "#-- error message log file"
			puts $cf "project -log_file \{${log_name}.srf\}"
            puts $cf ""
            if {$using_reveal != "gen_core"} {
                puts $cf "#-- set any command lines input by customer"
                puts $cf "[runtime_strategy cmd_option PROP_SYN_CmdLineArgs]"
            
                puts $cf ""
                puts $cf "#-- run Synplify with 'arrange HDL file'"
                if { $has_vhdl == 1 } {
                    if {[catch { 
                        if { [string equal -nocase [runtime_strategy value PROP_SYN_EdfArrangeVHDLFiles] "True" ] } {
                            puts $cf "project -run hdl_info_gen -fileorder"
                        }
                    } no_option]} {	}
                }
            }
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
