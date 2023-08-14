#Generate the synthesis project file for lattice synthesis
proc gen_lattice_prj {project_type {using_reveal no_reveal}} {
    set result_dir "[runtime_property value result_dir]"
	set rep_name "[runtime_property value report_base]"
    if {$using_reveal == "gen_core"} {
        set log_name "reveal_coretop"
        set target_file "reveal_coretop"
        set file_name "${log_name}_lattice.synproj"
    } else {
        set target_file $rep_name
        set log_name $rep_name
	    set file_name "${rep_name}_lattice.synproj"
    }
	set prj_name [runtime_property value project.title]
	set prj_dir [runtime_property value project.project_path]
    set imp_name [runtime_property value implementation.title]

	if {[catch {set cf [open $file_name w]} err]} {
		runtime_log -err "open $file_name is failed: $err\n"
		return -code error
	}
	if {[catch {
            puts $cf "-a \"[runtime_property value device.family]\""
			puts $cf "-d [runtime_property value device.device]"
            puts $cf "-t [runtime_property value device.package]"
            puts $cf "-s [runtime_property value device.speed]"
            #puts $cf "[runtime_strategy cmd_option PROP_LST_EdfInConsFile]"
            #If it is in compile mode or gen_core, don't add the constraint file
            set use_ldc 1
            if {$project_type == "hdl_ngd_Compile"} {
                set project_type "hdl_ngd"
                set use_ldc 0
            } elseif {$project_type == "hdl_ngo_Compile"} {
                set project_type "hdl_ngo"
                set use_ldc 0
            }
            if {$using_reveal == "gen_core"} {
                set use_ldc 0
            }
            
            if {$use_ldc == 1} {
                foreach sdc_file [runtime_property value "implementation.LSE Design Constraints File"] {
                    puts $cf "-sdc \"$sdc_file\""
                }
            }
			puts $cf "[runtime_strategy cmd_option PROP_LST_EdfFrequency]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_OptimizeGoal]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_EBRUtil]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_RAMStyle]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_ROMStyle]"
			#puts $cf "[runtime_strategy cmd_option PROP_LST_DSPUsage]"
			#puts $cf "[runtime_strategy cmd_option PROP_LST_DSPUtil]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_DSPUtil]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_DSPStyle]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_CarryChain]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_CarryChainLength]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_ForceGSRInfer]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_ResourceShare]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_PropagatConst]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_RemoveDupRegs]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_MuxStyle]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_MaxFanout]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_FSMEncodeStyle]"
            puts $cf "[runtime_strategy cmd_option PROP_LST_NumCriticalPaths]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_FIXGATEDCLKS]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_LoopLimit]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_DisableDistRam]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_AllowDUPMod]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_DecodeUnreachableStates]"
            if {$using_reveal == "gen_core"} {
                puts $cf "-use_io_insertion 0"
            } else {
			    puts $cf "[runtime_strategy cmd_option PROP_LST_IOInsertion]"
                puts $cf "[runtime_strategy cmd_option PROP_LST_ResolvedMixedDrivers]"
            }
			#SOF-125579
			puts $cf "[runtime_strategy cmd_option PROP_LST_UseIOReg]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_VHDL2008]"
			puts $cf "[runtime_strategy cmd_option PROP_LST_InterFileDump]"
			#puts $cf "[runtime_strategy cmd_option PROP_LST_PrfOutput]"
            puts $cf "-lpf 1"

			#pass encryption key to engine
			set size [runtime_property value implementation.security_keys._COUNT]
		    if [catch { foreach hdl_key [prj_impl option -impl $imp_name HDL_KEYFILE] {
				if { [string length $hdl_key] > 0 } {
					#we only pass the first key to engine for D3.2
					set hdl_key_path [::bali::utility::path::get_absolute_path $prj_dir $hdl_key]
					puts $cf "-key \"$hdl_key_path\""
					break
				}
			} } r] { }
					
					
            #Setup the synthesis source data
			set has_verilog 0
			set has_vhdl 0
			set has_edif 0
            if {($project_type == "hdl_ngd" && $using_reveal == "reveal") || $using_reveal == "gen_core"} {
				set rvp_file "${rep_name}.rvp"
				set last_type ""
				set last_lib ""
                puts $cf "-ver \"[runtime_property value InstallPath]/cae_library/synthesis/verilog/pmi_def.v\""
                puts $cf "-ver \"[runtime_property value InstallPath]/module/reveal/src/ertl/ertl.v\""
				if {$using_reveal == "reveal"} {
					puts $cf "-ver \"[runtime_property value InstallPath]/module/reveal/src/rvl_j2w_module/rvl_j2w_module.v\""
					#puts $cf "-corename reveal"
					puts $cf "-ver \"[runtime_property value  InstallPath]/module/reveal/src/rvl_j2w_module/wb2sci.v\""
					puts $cf "-ver \"[runtime_property value  InstallPath]/module/reveal/src/ertl/JTAG_SOFT.v\""
				}				
                #puts $cf "-ip_dir \"[runtime_property value InstallPath]/module\""
                #puts $cf "-corename reveal"
				puts $cf "-key \"[runtime_property value InstallPath]/module/reveal/document/reveal_test.dat\""
				foreach {src src_opt} [bali::utility::get_ini_section $rvp_file "Generated"] {
					regsub -all {,\s*} $src_opt "," src_opt
					set options [split $src_opt ","]
					set type [lindex $options 0]
					if { $type == "VHDL" } {
						set work_lib [lindex $options 1]
						if { [string length $work_lib] == 0 } {
							set work_lib work
						}
						if { [string equal $last_type $type] && [string equal -nocase $last_lib $work_lib] } {
							set cmd \"$src\"
						} else {
							set cmd "-lib \"$work_lib\" -vhd \"$src\""
						}
						set has_vhdl 1
						set last_type $type
						set last_lib $work_lib
						
					} elseif { $type == "Verilog" } {
					    #if { [string equal $last_type $type] } {
						#	set cmd \"$src\"
						#} else {
						#	set cmd "-ver \"$src\""
						#}
						set cmd "-ver \"$src\""
						set has_verilog 1
						set last_type $type
					} elseif { $type == "EDIF" } {
					    if { [string equal $last_type $type] } {
							set cmd \"$src\"
						} else {
							set cmd "-input_edif \"$src\""
						}
						set has_edif 1
						set last_type $type
					}
					lappend hdls $cmd
				}
            } elseif { $project_type == "hdl_ngd" || $project_type == "hdl_ngo" } {
				set size [runtime_property value implementation.synthesis_hdls._COUNT]
				set last_type ""
				set last_lib ""
				for {set x 0} {$x<$size} {incr x} {
					set src [runtime_property value implementation.synthesis_hdls.$x]
					set type [runtime_property value "implementation.synthesis_hdls.$x.type"]
					if { $type == "Verilog" } {
						if { [string equal $last_type $type] } {
							set cmd \"$src\"
						} else {
							set cmd "-ver \"$src\""
						}
						set has_verilog 1
					} else {
						set work_lib [runtime_property value "implementation.synthesis_hdls.$x.lib"]
						if { [string length $work_lib] == 0 } {
							set work_lib work
						}
						if { [string equal $last_type $type] && [string equal -nocase $last_lib $work_lib] } {
							set cmd \"$src\"
						} else {
							set cmd "-lib \"$work_lib\" -vhd \"$src\""
						}
						set has_vhdl 1
						set last_lib $work_lib
					}
					set last_type $type
					lappend hdls $cmd
				}
				#edif
				set size [runtime_property value implementation.EDIF._COUNT]
				set last_type ""
				for {set x 0} {$x<$size} {incr x} {
					set src [runtime_property value implementation.EDIF.$x]
					set type [runtime_property value "implementation.EDIF.$x.type"]			
					set basename [runtime_property value "implementation.EDIF.$x.basename"]
					if { $type == "EDIF"} {
						if { [string equal $last_type $type] } {
							set cmd \"$src\"
						} else {						
							set cmd "-input_edif \"$src\""
						}
						set has_edif 1
					}
					set last_type $type
					lappend hdls $cmd
				}
                if {$using_reveal != "gen_core"} {
                    #Handle HDL Parameters
                    if [catch { foreach hdl_param [prj_impl option -impl $imp_name HDL_PARAM] {
                        if { [string length $hdl_param] > 0 } {
                            #If we use the Tcl8.5, then the following foreach command can be replaced by lassign command
                            foreach {param_key parem_val} [split $hdl_param \=] { break }
                            puts $cf "-hdl_param $param_key \"$parem_val\""
                        }
                    } } r] { }
                }
				if { $has_verilog == 1 } {
                    if {$using_reveal != "gen_core"} {
                        #If the option dose not exist, the prj option command will return error.
                        #We need catch the error
                        set path_n 0
                        if [catch { foreach search_path [prj_impl option -impl $imp_name include\ path] {
                            if { [string length $search_path] > 0 } {
                                    set search_path [::bali::utility::path::get_absolute_path $prj_dir $search_path]
                                    if { $path_n == 0 } {
                                        puts $cf "-p \"$search_path\""
                                    } else {
                                        puts $cf "\"$search_path\""
                                    }
                                    incr path_n
                                }
                            }
                        } r] {}
                        if { $path_n == 0 } {
                            puts $cf "-p \"$prj_dir\""
                        } else {
                            puts $cf \"$prj_dir\"
                        }
                        incr path_n
                        #Handle verilog directives
                        if [catch { foreach hdl_param [prj_impl option -impl $imp_name VERILOG_DIRECTIVES] {
                            if { [string length $hdl_param] > 0 } {
                                #If we use the Tcl8.5, then the following foreach command can be replaced by lassign command
                                foreach {param_key parem_val} [split $hdl_param \=] { break }
                                puts $cf "-hdl_param $param_key \"$parem_val\""
                            }
                        } } r] { }
                    }
				}
            }
            foreach hdl $hdls {
				puts $cf $hdl
			}
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
				#set top module name
				puts $cf "-top $top_module"
			}
            
            if {$using_reveal != "gen_core"} {
                set top_module reveal_coretop            
                #set any command lines input by customer"
                puts $cf "[runtime_strategy cmd_option PROP_LST_CmdLineArgs]"
                
                #set the memory ini file path
                set mem_paths {}
                foreach p [split [runtime_strategy value PROP_LST_EdfMemPath] {;}] {
                    if { [string length $p] > 0 } {
                        append mem_paths " \"$p\""
                    }
                }
                if { [string length $mem_paths] > 0 } {
                    puts $cf "-p $mem_paths"
                }
            }
            #set edifin option 
			puts $cf "[runtime_strategy cmd_option PROP_LST_EdfInRemLoc]"
            
            #set result format/file last
            if {$project_type == "hdl_ngo"} {
                puts $cf "-ngo \"${target_file}.ngo\""
            } else {
				#set edif source path for lse to search edif file
				if {[runtime_property exists implementation.EDIF] } {
					set size [runtime_property value implementation.EDIF._COUNT]
					for {set x 0} {$x<$size} {incr x} {
						set edif_path [runtime_property value implementation.EDIF.absolutepath]
						if { $x == 0} {
							puts -nonewline $cf "-p"
						}
						puts -nonewline $cf " \"$edif_path\""
					}
					puts $cf ""
				}
                #set ngo path for ngdbuild
                set ngo_paths "\"[runtime_property value FOUNDRY]/[runtime_property value device.pm]/data\""
                foreach p [split [runtime_strategy value PROP_LST_EdfInLibPath] {;}] {
                    append ngo_paths " \"$p\""
                }
                foreach p [runtime_property value implementation.ngo_path] {
                    append ngo_paths " \"$p\""
                }
                puts $cf "-p $ngo_paths"
                #set ngdbuild option
                puts $cf "[runtime_strategy cmd_option PROP_LST_EdfHardtimer]"
                puts $cf "-ngd \"${rep_name}.ngd\""
            }
			puts $cf ""
		} err]} {
		close $cf
		return $err -code error
	}
	close $cf
}