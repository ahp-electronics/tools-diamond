package provide IP_Generate 1.0.0

switch $tcl_platform(platform) {
  windows { set Path_sep ";" }  
  unix { set Path_sep ":" }
}

switch $tcl_platform(os) {
  "Windows NT" {
  } "Linux" {
  set Unix_system lin
  } "SunOS" {
  set Unix_system sol
  }
}

#********************************************************************************
# REVEAL Version 0.1
#********************************************************************************

#********************************************************************************
# Load any parameters required for IP generation
#********************************************************************************

proc LoadIPParameters {} {
    package require IP_Control
	global Para
        #
        # Load parameters from lpc file
        #
	set ret [LoadLPCParameter $Para(CoreName) $Para(para_file) 0]
	if {$ret < 0} {
	    puts $Para(msg)
	    return -1
	} else {
	    return 0
	}
}

#********************************************************************************
# Load any optional files required for IP generation
#********************************************************************************

proc LoadIPOptionalFiles {} {
	global Para
        #
        # No optional files required
        #
	return 1
}

#********************************************************************************
# Check IP parameters for valid values
#********************************************************************************

proc CheckIPParameters {} {
    package require IP_Control
	global Para
        #
        # Check  lpc parameters
        #
	set ret [CheckValues]
	if {$ret < 0} {
	    return -1
	} else {
	    AdjustPins
	    return 0
	}
 }

#********************************************************************************
# Generate required IP template files
#********************************************************************************

proc GenerateIPTemplates {} {
    package require IP_Templates
	global Para
	set ret [WriteFiles]
	if {$ret < 0} {
	    return -1
	} else {
	    return 0
	}
}

#********************************************************************************
# Generate templates/files supporting IP Place And Route (PAR)
#********************************************************************************

proc GenerateIPPARFiles {} {
        #
        # No PAR files provided
        #
	return 1
}

#********************************************************************************
# Create REVEAL IP core
#********************************************************************************

proc CreateIPCore {} {
	global Para env tcl_platform Unix_system Path_sep

	set Para(para_file) [file join "$Para(BuildDir)" $Para(ModuleName).lpc]
	set done 0
	switch $tcl_platform(platform) {
	   windows {
			if {[info exists env(TOOLRTF)] != 1} {
				set env(PATH) "."
			}
		}
	}

	set Para(msg) ""

	#
	# Project path
	#
	switch $tcl_platform(platform) {
		windows {
			set src_dir "$Para(lib)/../src/ertl"
		}
		unix {
			set src_dir "$Para(src)/ertl"
		}
	}
	cd "$Para(BuildDir)"
	#
	# Get ispLever cpld and fpga bin paths
	#
	set install_dir $Para(install_dir)
	if {[info exists env(TOOLRTF)] == 1} {
		set bin_dir [file join $install_dir bin]
		if {[info exists env(FOUNDRY)] == 1} {
		  set fpga_bin [file join $env(FOUNDRY) bin]
		} else {
		  set fpga_bin [file join $install_dir ispFPGA bin]
		}

		switch $tcl_platform(platform) {
			windows {
				set bin_dir [file join $bin_dir  "nt"]
				set fpga_bin [file join $fpga_bin  "nt"]
			}
			unix {
				set bin_dir [file join $bin_dir "$Unix_system"]
				set fpga_bin [file join $fpga_bin "$Unix_system"]
			}
		}

		if {[string match "*$bin_dir$Path_sep*" $env(PATH)] == 0 } {
			set env(PATH) "$bin_dir$Path_sep$env(PATH)"  
		}
		#if {[string match "*$fpga_bin$Path_sep*" $env(PATH)] == 0 } {
		#	set env(PATH) "$fpga_bin$Path_sep$env(PATH)"  
		#}

		if {[string equal -nocase $Para(synthesis) lse]} {
		  if [catch {open $Para(ModuleName).synproj w} rspFile] {
		    puts "ERROR - Cannot create response file $Para(ModuleName).synproj: $rspFile"
		    return -1
		  } else {
		    puts $rspFile "-a $Para(tech_ngd)"
		    puts $rspFile "-d $Para(PartType)"
            puts $rspFile "-top $Para(ModuleName)"
		    puts $rspFile "-ver \"$install_dir/cae_library/synthesis/verilog/$Para(tech_cae).v\" \"$install_dir/cae_library/synthesis/verilog/pmi_def.v\" \"$Para(BuildDir)/$Para(ModuleName)_gen.v\" \"$Para(BuildDir)/$Para(ModuleName)_trig_gen.v\""
		    puts $rspFile "-lpf 1\n-use_io_insertion 0\n-force_gsr No\n-frequency $Para(FMax)\n-max_fanout 50"
		    puts $rspFile "-ip_dir \"$src_dir/../../..\""
		    puts $rspFile "-corename $Para(Module)"
		    puts $rspFile "-ertl_file \"$src_dir/ertl.v\""
		    puts $rspFile "-ngo \"$Para(ModuleName).ngo\""
		    close $rspFile
		  }

		  if [runCmd "\"synthesis\" -f \"$Para(ModuleName).synproj\""] {
		    return
		  } else {
		    vwait done
		    if [checkResult $done] {
		      return  
		    }
		  }		  
		} else {
		  file mkdir "$Para(BuildDir)/syn_results"
		  if [catch {open $Para(ModuleName).cmd w} rspFile] {
			  puts "ERROR - Cannot create response file $Para(ModuleName).cmd: $rspFile"
			  return -1
		  } else {
			  puts $rspFile "PROJECT: $Para(ModuleName)
			  working_path: \"$Para(BuildDir)/syn_results\"
			  module: $Para(ModuleName)
			verilog_file_list: \"$install_dir/cae_library/synthesis/verilog/$Para(tech_cae).v\" \"$install_dir//cae_library/synthesis/verilog/pmi_def.v\" \"$Para(BuildDir)/$Para(ModuleName)_gen.v\" \"$Para(BuildDir)/$Para(ModuleName)_trig_gen.v\" \"$src_dir/ertl.v\"
			  suffix_name: edi
			  output_file_name: $Para(ModuleName)
			  write_prf: true
			  vlog_std_v2001: true
			  disable_io_insertion: true
			  force_gsr: false
			  frequency: $Para(FMax)
		  fanout_limit: 50
			  retiming: false
			  pipe: false
			  part: $Para(PartType)
			  speed_grade: $Para(SpeedGrade)
			  "
			  close $rspFile
		  }
		  
		  set synpwrap_cmd "$bin_dir/synpwrap"
			  
		  if [runCmd "\"$synpwrap_cmd\" -rem -e $Para(ModuleName) -target $Para(tech_syn)"] {
			  return
		  } else {
			  vwait done
			  if [checkResult $done] {
				  return  
			  }
		  }
		  puts "\nSynplify Log Output\n\n";
		  dump2log $Para(ModuleName).log
  
		  file delete automake.err
		  #	file delete $Para(ModuleName).cmd
		  if [runCmd "\"edif2ngd\" -ip \"$src_dir/../../..\" -ic $Para(Module) -l $Para(tech_ngd) -d $Para(PartType) -nopropwarn \"syn_results/$Para(ModuleName).edi\" \"$Para(ModuleName).ngo\""] {
			  return
		  } else {
			  vwait done
			  if [checkResult $done] {
				  return
			  }
		  }
  
		  switch $tcl_platform(os) {
			  "SunOS" {
				  file delete -force dummy.sty
			  }
		  }
		}
	} else {
		set cpld_bin [file join $install_dir ispcpld bin]

		set fpga_dir [file join $install_dir ispfpga bin]
		switch $tcl_platform(platform) {
		   windows {
			  set fpga_bin [file join $fpga_dir  "nt"]
				 if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
					set env(PATH) "$fpga_bin;$env(PATH)" } }
		   unix {
			  set fpga_bin [file join $fpga_dir "$Unix_system"]
			  if {[string match "*$fpga_bin:*" $env(PATH)] == 0 } {
				 set env(PATH) "$fpga_bin:$env(PATH)"}}
		}



		if {[string match "*$cpld_bin$Path_sep*" $env(PATH)] == 0 } {
			set env(PATH) "$cpld_bin$Path_sep$env(PATH)" }

			file mkdir "$Para(BuildDir)/syn_results"

			if [catch {open $Para(ModuleName).cmd w} rspFile] {
				puts "ERROR - Cannot create response file $Para(ModuleName).cmd: $rspFile"
				return -1
			} else {
				puts $rspFile "PROJECT: $Para(ModuleName)
				working_path: \"$Para(BuildDir)/syn_results\"
				module: $Para(ModuleName)
				verilog_file_list: \"$install_dir/ispcpld/../cae_library/synthesis/verilog/$Para(tech_cae).v\" \"$install_dir/ispcpld/../cae_library/synthesis/verilog/pmi_def.v\" \"$Para(BuildDir)/$Para(ModuleName)_gen.v\" \"$Para(BuildDir)/$Para(ModuleName)_trig_gen.v\" \"$src_dir/ertl.v\"
				suffix_name: edi
				output_file_name: $Para(ModuleName)
				write_prf: true
				vlog_std_v2001: true
				disable_io_insertion: true
				force_gsr: false
				frequency: $Para(FMax)
			fanout_limit: 50
				retiming: false
				pipe: false
				part: $Para(PartType)
				speed_grade: $Para(SpeedGrade)
				"
				close $rspFile
			}

			if {$tcl_platform(platform) == "unix"} {
				set synpwrap_cmd "$env(SYNPLIFY)/bin/synpwrap"
			} else {
				set synpwrap_cmd "$cpld_bin/synpwrap"
			}

			if [runCmd "\"$synpwrap_cmd\" -rem -e $Para(ModuleName) -target $Para(tech_syn)"] {
				return
			} else {
				vwait done
				if [checkResult $done] {
					return
				}
			}
			puts "\nSynplify Log Output\n\n";
			dump2log $Para(ModuleName).log

			file delete automake.err
			#	file delete $Para(ModuleName).cmd
			if [runCmd "\"$fpga_bin/edif2ngd\" -ip \"$src_dir/../../..\" -ic $Para(Module) -l $Para(tech_ngd) -d $Para(PartType) -nopropwarn 			\"syn_results/$Para(ModuleName).edi\" \"$Para(ModuleName).ngo\""] {
				return
			} else {
				vwait done
				if [checkResult $done] {
					return
				}
			}

			switch $tcl_platform(os) {
				"SunOS" {
					file delete -force dummy.sty
				}
			}
		}
	}
    return 0
}

#********************************************************************************
# Clean up
#********************************************************************************

proc CleanUp {} {

	global Para tcl_platform

	return 0
}

