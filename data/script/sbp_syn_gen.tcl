# This function is used to generate synplify project tcl for SBP user design importing.
# Copyright (c), 2013-, Lattice Semiconductor Corporation, All Rights Reserved
package provide ImportUsrDesign_Syn_Gen 1.0.0

# array set design_info {
# top sbx
# technology LATTICE-XP2 
# part LFXP2_17E
# package FT256C 
# speed 6
# family LatticeXP2
# verilog_files {a.v b.v}
# include_path {./A ./B}
# vhdl_files {a.vhd worka b.vhd workb c.vhd workc}
# verilog_macro {macro0 macro1=value1 macro2=value2}
# hdl_params {param1=value1 param2=value2}
# work_dir E:/public/Diamond/systembuilder
# result_file sbx
# top_rtl  Verilog
# }

#proc generate_synthesis_tcl {rep_name} {

proc gen_synthesis_synplify_sbp {} {
	global design_info
	if {0 ==[info exists design_info]} {
		return -code error "No design infomation has been loaded."
	}

	set rep_name $design_info(top)
	if {0 == [string length rep_name] } {
		return -code error "Doesn't specify a name for result file."
	}
	
	set file_name "$design_info(work_dir)/${rep_name}_synplify.tcl"
	if {[catch {set cf [open $file_name w]} err]} {
		return -code "open $file_name failed: $err"
	}

	if {[catch {
		puts $cf "#Lattice Semiconductor Corporation Ltd."
		puts $cf "#Synplify OEM project file for System Builder/Planner"
		puts $cf ""
		
		puts $cf "#device options"
        puts $cf "set_option -technology $design_info(technology)"			
		puts $cf "set_option -part $design_info(part)"
		puts $cf "set_option -package $design_info(package)"
		puts $cf "set_option -speed_grade -$design_info(speed)"
		
		puts $cf ""
		puts $cf "#compilation/mapping options"
		puts $cf "set_option -symbolic_fsm_compiler true"
		puts $cf "set_option -resource_sharing true"
		puts $cf "#use verilog 2001 standard option"
		puts $cf "set_option -vlog_std v2001"
		
		puts $cf ""
		puts $cf "#map options"
		puts $cf "set_option -frequency auto"
		puts $cf "set_option -maxfan 1000"
		puts $cf "set_option -auto_constrain_io 0"
		puts $cf "set_option -disable_io_insertion true"
		puts $cf "set_option -retiming false; set_option -pipe true"
		puts $cf "set_option -force_gsr false"
		puts $cf "set_option -compiler_compatible 0"
		puts $cf "set_option -dup false"
		puts $cf "set_option -default_enum_encoding default"
		
		puts $cf ""
		puts $cf "#simulation options"
		puts $cf "#timing analysis options"
		puts $cf "#automatic place and route (vendor) options"
		puts $cf "set_option -write_apr_constraint 1"

		puts $cf ""
		puts $cf "#synplifyPro options"
		puts $cf "set_option -fix_gated_and_generated_clocks 1"
		puts $cf "set_option -update_models_cp 0"
		puts $cf "set_option -resolve_multiple_driver 1"

		puts $cf ""
		puts $cf "#add_file options"
		puts $cf "set_option include_path $design_info(work_dir)"
		if [info exists design_info(include_path)] {
			foreach {path} $design_info(include_path) {
				#absolute path or relative path?
				puts $cf "set_option include_path \{$path\}"
			}
		}
		
		if {$design_info(top_rtl) == "VHDL"} {
			if [info exists design_info(verilog_files)] {
				foreach {src} $design_info(verilog_files) {
					puts $cf "add_file -verilog \{$src\}"
				}
			}
			
			if [info exists design_info(vhdl_files)] {
				foreach {src work_lib} $design_info(vhdl_files) {
					puts $cf "add_file -vhdl -lib \"$work_lib\" \{$src\}"
				}
			}
		} else {
			if [info exists design_info(vhdl_files)] {
				foreach {src work_lib} $design_info(vhdl_files) {
					puts $cf "add_file -vhdl -lib \"$work_lib\" \{$src\}"
				}
			}		
			
			if [info exists design_info(verilog_files)] {
				foreach {src} $design_info(verilog_files) {
					puts $cf "add_file -verilog \{$src\}"
				}
			}
		}
		
		puts $cf ""
		if [info exists design_info(verilog_macro)] {
            puts $cf "#hdl defines"
			foreach {defines} $design_info(verilog_macro) {
                foreach {key value} [split $defines "="] {
                    if {[string length $value] == 0} {
                        puts $cf "set_option -hdl_define -set $key"
                    } else {
                        puts $cf "set_option -hdl_define -set \"$key=$value\""
                    }
                }
			}
		}
		
		puts $cf ""
		if [info exists design_info(hdl_params)] {
            puts $cf "#hdl params"
			foreach {params} $design_info(hdl_params) {
				lassign [split $params "="] param_key parem_val
				puts $cf "set_option -hdl_param -set $param_key \{$parem_val\}"
			}
		}
		
		#puts $cf "add_file -constraint \{xxx\}"
		puts $cf "set_option -hdl_define -set SBP_SYNTHESIS"
		
		puts $cf ""
		puts $cf "#top module name"
		puts $cf "set_option -top_module $design_info(top)"

		puts $cf ""
		puts $cf "#set result format/file last"
		if [info exists design_info(work_dir)] {
			puts $cf "project -result_file \{$design_info(work_dir)/$design_info(result_file)\}"
		}	
		
		puts $cf ""
		puts $cf "#error message log file"
		puts $cf "project -log_file \{$design_info(work_dir)/$rep_name.srf\}"
		
		puts $cf ""
		puts $cf "#run Synplify with 'arrange HDL file'"
		if {$design_info(top_rtl) == "VHDL"} {
			puts $cf "project -run hdl_info_gen -fileorder"
		}
		puts $cf "project -run -clean"
	} err]} {
		close $cf
		return $err -code error
		}
	close $cf
}

proc gen_synthesis_lse_sbp {} {
	global design_info
	if {0 ==[info exists design_info]} {
		return -code error "No design infomation has been loaded."
	}

	set rep_name $design_info(top)
	if {0 == [string length rep_name] } {
		return -code error "Doesn't specify a name for result file."
	}
	
	set file_name "$design_info(work_dir)/${rep_name}_lse.synproj"
	if {[catch {set cf [open $file_name w]} err]} {
		return -code "open $file_name failed: $err"
	}

	if {[catch {
		puts $cf "#Lattice Semiconductor Corporation Ltd."
		puts $cf "#Lattice synthesis engine project file for System Builder/Planner"
		puts $cf ""
		
        puts $cf "-a \"$design_info(technology)\""			
		puts $cf "-d $design_info(part)"
		puts $cf "-t $design_info(package)"
		puts $cf "-s $design_info(speed)"
	    puts $cf "-frequency 200"
		puts $cf "-optimization_goal Balanced"
		puts $cf "-bram_utilization 100"
		puts $cf "-ramstyle auto"
		puts $cf "-romstyle auto"
		puts $cf "-use_carry_chain 1"
		puts $cf "-carry_chain_length 0"
	    puts $cf "-force_gsr auto"
		puts $cf "-resource_sharing 1"
		puts $cf "-propagate_constants 1"
		puts $cf "-remove_duplicate_regs 1"
		puts $cf "-mux_style Auto"
		puts $cf "-max_fanout 1000"
		puts $cf "-fsm_encoding_style Auto"
		puts $cf "-twr_paths 3"
		puts $cf "-fix_gated_clocks 1"
		puts $cf "-use_io_insertion 0"
		puts $cf "-resolve_mixed_drivers 0"
		puts $cf "-use_io_reg 1"
		
		puts $cf ""
		puts $cf "-lpf 1"
		puts $cf "#add_file options"
		puts $cf "-p \"$design_info(work_dir)\""
		if [info exists design_info(include_path)] {
			foreach {path} $design_info(include_path) {
				#absolute path or relative path?
				puts $cf "-p \"$path\""
			}
		}
		
		if {$design_info(top_rtl) == "VHDL"} {
			if [info exists design_info(verilog_files)] {
				foreach {src} $design_info(verilog_files) {
					puts $cf "-ver \"$src\""
				}
			}
			
			if [info exists design_info(vhdl_files)] {
				foreach {src work_lib} $design_info(vhdl_files) {
					puts $cf "-lib \"$work_lib\" -vhd \"$src\""
				}
			}
		} else {
			if [info exists design_info(vhdl_files)] {
				foreach {src work_lib} $design_info(vhdl_files) {
					puts $cf "-lib \"$work_lib\" -vhd \"$src\""
				}
			}		
			
			if [info exists design_info(verilog_files)] {
				foreach {src} $design_info(verilog_files) {
					puts $cf "-ver \"$src\""
				}				
			}
			puts $cf "-hdl_param SBP_SYNTHESIS \"\""
		}
		
		puts $cf ""
		if [info exists design_info(verilog_macro)] {
            puts $cf "#hdl defines"
			foreach {defines} $design_info(verilog_macro) {
                foreach {key value} [split $defines "="] {
                    if {[string length $value] == 0} {
                        puts $cf "-hdl_param $key \"\""
                    } else {
                        puts $cf "-hdl_param $key \"$value\""
                    }
                }
			}
		}
		
		puts $cf ""
		if [info exists design_info(hdl_params)] {
            puts $cf "#hdl params"
			foreach {params} $design_info(hdl_params) {
				lassign [split $params "="] param_key parem_val
				puts $cf "-hdl_param $param_key \"$parem_val\""
			}
		}
		
		#puts $cf "add_file -constraint \{xxx\}"
		
		puts $cf ""
		puts $cf "#top module name"
		puts $cf "-top $design_info(top)"

		puts $cf ""
		puts $cf "#set result format/file last"
		if [info exists design_info(work_dir)] {
			puts $cf "-ngo \"$design_info(result_file)\""
		}	
		
	} err]} {
		close $cf
		return $err -code error
		}
	close $cf
}
