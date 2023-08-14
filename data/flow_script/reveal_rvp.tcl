#Generate the reveal flow project file for both rtl and edif level
proc gen_reveal_rvp {{level undefined}} {
	set imp_dir "[runtime_property value impl_dir]"
	set result_dir "[runtime_property value result_dir]"
	set rep_name "[runtime_property value report_base]"
	set file_name "${rep_name}.rvp"
	set prj_name [runtime_property value project.title]
	set prj_dir [runtime_property value project.project_path]
	if {[catch {set cf [open $file_name w]} err]} {
		runtime_log -err "open $file_name failed: $err\n"
		return -code error
	}
	if {[catch {
			puts $cf "#-- Lattice Semiconductor Corporation Ltd."
			puts $cf "#-- Bali Reveal project file"
			puts $cf ""
			puts $cf "#device options"
			puts $cf "\[Device\]"
			puts $cf "part = [runtime_property value device.part]"
			puts $cf "family = [runtime_property value device.family]"
			puts $cf "device = [runtime_property value device.device]"
			puts $cf "speed = [runtime_property value device.speed]"
			puts $cf "package = [runtime_property value device.package]"
			puts $cf "operation = [runtime_property value device.operation]"
			puts $cf ""
			puts $cf "#design options"
			puts $cf "\[Design\]"
			puts $cf "title = $prj_name"
			puts $cf "path = $result_dir"
			puts $cf "core_generate = $result_dir"
			set search_path [::bali::utility::path::get_absolute_path_list $prj_dir [runtime_property value implementation.include\ path] ]
			lappend search_path $prj_dir
			puts $cf "search_path = [ join $search_path ";" ]"
			set top_module [runtime_property value implementation.top]
			if {[string length $top_module] == 0} {
				set top_module [runtime_property value implementation.def_top]
			}
			puts $cf "top = $top_module"
			puts $cf "lpf = [runtime_property value "implementation.Logic Preference.absolutefilepath"]"
			#puts $cf "synthesis = [runtime_property value "implementation.synthesis"]"
			set synthesis_engine [runtime_property value "implementation.synthesis"]
			puts $cf "synthesis = $synthesis_engine"
			#add key_datat_file
			set key_data_file [runtime_property value "implementation.security_keys"]
			if {[string length $key_data_file] > 0} {
				puts $cf "key_data_file = [ join $key_data_file ";" ]"
			}
			puts $cf ""
			puts $cf "#strategy options"	
			set VHDL2008_RVP "false"
			if { $synthesis_engine == "synplify" } {
				set SYN_VHDL2008 [runtime_strategy cmd_option PROP_SYN_VHDL2008]
				if {$SYN_VHDL2008 == "set_option -vhdl2008 1"} {
					set VHDL2008_RVP "true"
				}
			} elseif { $synthesis_engine == "lse" } {
				set LSE_VHDL2008 [runtime_strategy cmd_option PROP_LST_VHDL2008]
				if {$LSE_VHDL2008 == "-vh2008"} {
					set VHDL2008_RVP "true"
				}
			}
			puts $cf "VHDL2008 = $VHDL2008_RVP"
			puts $cf ""
			puts $cf "#HDLs options"
			puts $cf "\[HDLs\]"
			if { $level == "undefined" } {
				if { [runtime_property value implementation.EDIF._COUNT] > 0 } {
					set level edif
				}
			}
			lappend hdls
			if { $level == "undefined" || $level == "rtl" } {
				set size [runtime_property value implementation.synthesis_hdls._COUNT]
				set hasVHDL 0
				set hasVerilog 0
				array set hdlArray {}
				for {set x 0} {$x<$size} {incr x} {
					set src [runtime_property value implementation.synthesis_hdls.$x]
					set type [runtime_property value "implementation.synthesis_hdls.$x.type"]
					set stype [runtime_property value "implementation.synthesis_hdls.$x.subtype"]
					# skip dup of HDL
					if {[info exist hdlArray(${src})]} {
						continue
					} else {
						set hdlArray(${src}) 1
					}
					# reveal only accepts "System Verilog"
					if { $stype == "SystemVerilog"} {
						set stype "System Verilog"
					}
					set line "$src = $stype"
					if { $type == "Verilog" } {
						set hasVerilog 1
#						if {$hasVHDL == 1} { 
#                           set level edif
#						    break
#                        }
					} elseif { $type == "VHDL" } {
							set hasVHDL 1
#							if {$hasVerilog == 1} { 
#                                set level edif
#                                break
#                            }
							set work_lib [runtime_property value implementation.synthesis_hdls.$x.lib]
							if { [string length $work_lib] == 0 } {
								set work_lib work
							}
							set line "${line}, $work_lib"
					} else {
						set level edif
						break
					}
					lappend hdls $line
				}
				if { $level != "edif" } {
					if { $hasVerilog == 0 && $hasVHDL == 0 } {
						set level edif 
					} else {
						set level rtl
					}
				}
				set size [runtime_property value implementation.EDIF._COUNT]
				for {set x 0} {$x<$size} {incr x} {
					set edif [runtime_property value "implementation.EDIF.$x.absolutefilepath"]
					set line "$edif = EDIF"
					lappend hdls $line					
				}
			}
			if { $level != "rtl" } {
				#Now we only support rtl and edif, so any none rtl level will be handled as edif
				set size [runtime_property value implementation.EDIF._COUNT]
				for {set x 0} {$x<$size} {incr x} {
					set edif [runtime_property value "implementation.EDIF.$x.absolutefilepath"]
					set line "$edif = EDIF"
					puts $cf $line
				}
			} else {
				#Here we handle the rtl level inserter flow	
				foreach hdl $hdls {
					puts $cf $hdl
				}
				#Now we add the VERILOG_DIRECTIVES
				#If the option dose not exist, the prj option command will return error.
				#We need catch the error
				puts $cf "\[HDL_Defines\]"
				if [catch { foreach hdl_param [prj_impl option VERILOG_DIRECTIVES] {
								puts $cf "$hdl_param"
							}
				} r] { }				
				puts $cf "SBP_SYNTHESIS="
				puts $cf "\[HDL_Param\]"
				if [catch { foreach hdl_param [prj_impl option VERILOG_DIRECTIVES] {
								puts $cf "$hdl_param"
							}
				} r] { }
                if [catch { foreach hdl_param [prj_impl option HDL_PARAM] {
								puts $cf "$hdl_param"
							}
                } r] { }
			}
		} err]} {
		close $cf
		return $err -code error
	}	
	close $cf
}
