# Copyright (C) 1994-2016 Synopsys, Inc. This Synopsys software and all associated documentation are proprietary to Synopsys, Inc. and may only be used pursuant to the terms and conditions of a written license agreement with Synopsys, Inc. All other use, reproduction, modification, or distribution of the Synopsys software or the associated documentation is strictly prohibited.
proc Extract_Top { } {
        set top_mod [get_option top_module]
        if { [string match "" $top_mod] } {
                ### Extract the top level module from SRR ###
                ###  Ex: Selecting top level module prep2_2  => Verilog
                ###  Ex: Top entity is set to prep2_2.  => VHDL
		###  Ex: Selected Library: work Cell: prep2_2 View verilog as top level => SRS
                ###  For Mixed get_option top_module will return the proper value ###
                set SRR_FILE [get_option log_file]
                set SRR_FP [open $SRR_FILE]
                set SRR_DATA_LIST [split [read $SRR_FP] "\n" ]
                close $SRR_FP
                set Top_Line [lsearch -inline -regexp $SRR_DATA_LIST "(Selecting top level module)|(Top entity is set to)"]
		if { [string match "" $Top_Line] } {
			#### Must be a SRS based ###
			set Top_Line  [lsearch -inline -regexp $SRR_DATA_LIST "Selected Library:.*as top level"]
			set top_mod   [regsub {^.*: +([a-zA-Z0-9_-]+) +.*} $Top_Line {\1}]
	        } else {
	                ###  HDL Top level ####
		        set top_mod [regsub {\.$} [lindex $Top_Line end] "" ]
		}

                if { [string match "" $top_mod] } {
                        ###Top Level Extraction from SRR failed. Using Result File name as Top Level module name ###
                        set top_mod [file rootname [file tail [get_option result_file]]]
                        puts "Warning: Top Level Extraction from SRR failed."
                        puts "Using Result File name \"$top_mod\" as Top Level module name"
                }
        }
                        
        return "$top_mod"
}

proc Write_SBT_Tcl { runflowIIIFile {pcfFile ""} } {
	global env
	set top [Extract_Top]
	set family [regsub {^SBT} [get_option technology] {}]
	set device "[get_option part]"
	if {[string first "ice65" [string tolower $device]] != -1 } {
		set device "[get_option part][get_option package]C"
	} else {
		set device "[get_option part]-[get_option package]"
	}
	if { [file exists $env(SBT_DIR)/tcl/sbt_backend_synpl.tcl] } {
		set Sbt_Scr [open $runflowIIIFile w+]
		puts $Sbt_Scr "# TCL script for running Silicon Blue \n# Source: Synopsys Synplify"
		puts $Sbt_Scr "# TOP Design module"
		puts $Sbt_Scr "set top $top"
		puts $Sbt_Scr "set family $family" 
		puts $Sbt_Scr "set device $device"
		puts $Sbt_Scr "#   Vendor Tool Interface "
		puts $Sbt_Scr "set sbt_root \$::env(SBT_DIR)"
		puts $Sbt_Scr {set proj_dir [pwd]}
		puts $Sbt_Scr {set output_dir ""}
		###### Evalaute the extra_option string ######
		if { [string match "" $pcfFile] } {
			set extra_option ":router --pin_permutation"
		} else {
			set extra_option ":edifparser"
			if { ![string match "" $pcfFile] } {
				append extra_option " -y $pcfFile"
			} 
			append extra_option " :router --pin_permutation"
                }

		puts $Sbt_Scr "set extra_option \"$extra_option\""
                puts $Sbt_Scr "set base_name [file rootname [file tail [get_option result_file]]]"
		puts $Sbt_Scr {append sbt_tcl $sbt_root "/tcl/sbt_backend_synpl.tcl"}
		puts $Sbt_Scr {source $sbt_tcl }
		puts $Sbt_Scr {run_sbt_backend_auto $device $top $proj_dir $output_dir $extra_option $base_name}
		close $Sbt_Scr
		return 0
	} else {
		puts "SBT Backend TCL script \"$env(SBT_DIR)/tcl/sbt_backend_synpl.tcl\" does not exist. Check your SBT_DIR variable"
		return 1
	}
}
