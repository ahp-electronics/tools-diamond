# These functions can be used in the tcl scripts of the synthesis and simulation
# Copyright (c), 2008-2009, Lattice Semiconductor Corporation, All Rights Reserved

package provide simulation_generation 1.0.0

namespace eval ::bali::simulation {
	variable Para
	set Para(VHDLSUFFIX) {.vhd .vhdl .hdl .vho}
	set Para(VERISUFFIX) {.v .ver .veri .tf .vo .vm}
	set Para(SYSTEMVERILOGSUFFIX) {.sv .svh}
}

proc get_file_path {path} {
	set pl [ split $path / ]
	if {[llength $pl] == 1} {
		return "."
	}
	return [join [lrange $pl 0 end-1] /]
}
# -----------------------------------------------------------------------
# generate cmd file and run active-HDL tool
# -----------------------------------------------------------------------
# the pesudo code is changed as the following by CR52408. justin wu Feb.23, 2011.
# setenv SIM_WORKING_FOLDER .
# if {![file exists <current project>]} {
#	design create rtl_sim <project>
#   design open <project>
#   cd <project path>
#   <set include path>
# }	else {
#   design open <project>
#   cd <project path>
# }
# <clear clear library>
# <set simulation libs>
# <set macros>
# <remove all existing files>
# <add current all files>
# <del all libraries components>
# <compile all files>
# #the end#

proc ::bali::simulation::ActiveHDL_Run {} {
	variable Para	
	
	set filename $Para(PROJECTPATH)/$Para(PROJECT)/$Para(PROJECT)
	set adofile $Para(PROJECTPATH)/$Para(PROJECT)/$Para(PROJECT).ado
	if [catch {open "$adofile" w} DoFile ] {
		return -1
	}
	puts $DoFile "setenv SIM_WORKING_FOLDER ."
	puts $DoFile "set newDesign 0"
	puts $DoFile "if \{!\[file exists \"$filename.adf\"\]\} \{ "
	puts $DoFile "	design create $Para(PROJECT) \"$Para(PROJECTPATH)\""
	puts $DoFile "  set newDesign 1"
	puts $DoFile "\}"
	puts $DoFile "design open \"$Para(PROJECTPATH)/$Para(PROJECT)\""
	puts $DoFile "cd \"$Para(PROJECTPATH)\""
	
	#set include path
	puts $DoFile "designverincludedir -clear"
	set var ""
	foreach inc $Para(GLBINCLIST) {
		append var "\"$inc\" "
	}
	if {[string length $var] > 0} {
		puts $DoFile "designverincludedir $var"
	}
		
	#clear library
	puts $DoFile "designverlibrarysim -PL -clear"
	puts $DoFile "designverlibrarysim -L -clear"
	
	#set simulation libs
	foreach i $Para(SIMLIBLIST) {
		if {[string equal -nocase $i "pmi_work"]} {
			puts $DoFile "designverlibrarysim -PL $i"
		} else {
			puts $DoFile "designverlibrarysim $i"
		}
	}
	#set macros
	puts $DoFile "designverdefinemacro -clear"
	foreach i $Para(MACROLIST) {
		puts $DoFile "designverdefinemacro +define+$i"
	}
	
	#add files
	puts $DoFile "if \{\$newDesign == 0\} \{ "
	puts $DoFile "  removefile -Y -D *"
	puts $DoFile "\}"
	
	foreach i $Para(FILELIST) {
		puts $DoFile "addfile \"$i\""
	}
	
	#add sdf file
	if {[string length $Para(SDFPATH)] > 0} {
		puts $DoFile "addfile -sdf \"$Para(SDFPATH)\""
	}
		
	# delete all lib

	set libs ""
	foreach work $Para(WORKLIBLIST) {
		if { ![string equal -nocase $work ""]}	{
			if { [lsearch $libs $work] == -1 } {
				puts $DoFile "vlib \"$Para(PROJECTPATH)/$Para(PROJECT)/$work\""
				lappend libs $work
			}
		}
	}
	if { [lsearch $libs "work"] == -1 } {
		puts $DoFile "	vlib \"$Para(PROJECTPATH)/$Para(PROJECT)/work\""
	}

	puts $DoFile "set worklib work"
	puts $DoFile "adel -all"

	foreach i $Para(FILELIST) compiler $Para(COMPLIST) inc $Para(INCLIST) work $Para(WORKLIBLIST) {
		#set compiler
		set k [string last . $i]
        set CompileCommand ""
		set v_command ""
		if {$k != -1} {
			set len [string length $i]
			set suf [string range $i [expr $k] [expr $len-1]]
			
			if { [string equal -nocase $compiler "verilog"] } {
				set v_command "vlog"
				if { [lsearch $Para(SYSTEMVERILOGSUFFIX) $suf] != -1 } {
					set v_command "vlog -sv2k12"
				}
			} elseif { [string equal -nocase $compiler "vhdl"] } {
				set v_command "vcom"
			} else {
				if { [lsearch $Para(VERISUFFIX) $suf] != -1 } {
					set v_command "vlog"
				} elseif { [lsearch $Para(SYSTEMVERILOGSUFFIX) $suf] != -1 } {
					set v_command "vlog -sv2k12"
				} elseif { [lsearch $Para(VHDLSUFFIX) $suf] != -1 } {
					set v_command "vcom"
				}
			}
			
			set CompileCommand $v_command
			append CompileCommand " -dbg "
			if { ![string equal -nocase $inc "none"] } {
				foreach eachinc $inc	{
					append CompileCommand " +incdir+"
					append CompileCommand "\"$eachinc\""
				}
			}		
			#add global include path
			foreach inc $Para(GLBINCLIST) {
				append CompileCommand " +incdir+"
				append CompileCommand "\"$inc\""
			}			
		}

		#add source files and compile them
        if { [string length $CompileCommand] } {
			if { ![string equal -nocase $work ""]} {
                puts $DoFile "$CompileCommand -work $work \"$i\""
			}	else	{
                puts $DoFile "$CompileCommand \"$i\""
			}
		}	
	}
	
	
	#set top module
	if {[string length $Para(SIMULATIONTOPMODULE)] > 0} {
	
		if { [string equal -nocase $Para(LANGUAGE) "verilog"] } {
			puts $DoFile "module $Para(SIMULATIONTOPMODULE)"
		} elseif { [string equal -nocase $Para(LANGUAGE) "vhdl"] } {
			puts $DoFile "entity $Para(SIMULATIONTOPMODULE)"
		} 
	
	}


	#load sdf
    set sdfArgumentsForWaveform ""
	if {[string length $Para(SDFPATH)] > 0 && [string length $Para(SIMULATIONINSTANCE)] > 0 } {
        set instanceWithTestBech "/$Para(SIMULATIONTOPMODULE)$Para(SIMULATIONINSTANCE)"
        append sdfArgumentsForWaveform "-sdfmax $instanceWithTestBech=\"$Para(SDFPATH)\""
        puts $DoFile "designsdffile \"$Para(SDFPATH)\" $instanceWithTestBech -sdfmax -load yes" 
        
        puts $DoFile "designsimaddoptions +transport_path_delays +transport_int_delays"
	}
	

    #get simulation libs
    set simulationLibs ""
    foreach i $Para(SIMLIBLIST) {
        if {[string equal -nocase $i "pmi_work"]} {
            append simulationLibs " -L $i"
        } else {
            append simulationLibs " -L $i"
        }
    }
    #get hdl parameters;
    set hdlParameters ""
    foreach i $Para(HDLPARAMETERS) {
        append hdlParameters " -G$i"       
    }
    
    #initialize simulation
    if {[string length $Para(SDFPATH)] > 0 && [string length $Para(SIMULATIONINSTANCE)] > 0 } {
        puts $DoFile "vsim $hdlParameters +access +r $Para(SIMULATIONTOPMODULE) $sdfArgumentsForWaveform $simulationLibs  +transport_path_delays +transport_int_delays"
    } else {
        puts $DoFile "vsim $hdlParameters +access +r $Para(SIMULATIONTOPMODULE) $sdfArgumentsForWaveform $simulationLibs"
    }
        
    #add top-level signals to waveform display    
    if { $Para(ADDTOPLEVELSIGNALSTOWAVEFORM) == "1" } {
        
        puts $DoFile "add wave *"
    }
    
    #run simulation
    if { $Para(RUNSIMULATION) == "1" } {
        puts $DoFile "run 1000ns"
    }
        
	close $DoFile

	return 0
}

#-----------------------------------------------------------------------
# generate script file and run ModelSim tool
#-----------------------------------------------------------------------
proc ::bali::simulation::ModelSim_Run {} {	
	variable Para	
	
	set filename $Para(PROJECTPATH)/$Para(PROJECT)/$Para(PROJECT)
	set mdofile $Para(PROJECTPATH)/$Para(PROJECT)/$Para(PROJECT).mdo
	if [catch {open "$mdofile" w} DoFile ] {
		return -1
	}
	puts $DoFile "if \{!\[file exists \"$filename.mpf\"\]\} \{ "
	puts $DoFile "	project new \"$Para(PROJECTPATH)/$Para(PROJECT)\" $Para(PROJECT)"
	
	foreach i $Para(FILELIST) {
		puts $DoFile "	project addfile \"$i\""
	}
	
	#delete all libs.
	set libs ""
	foreach work $Para(WORKLIBLIST) {
		if { ![string equal -nocase $work "none"]}	{
			#set default lib to "work" instead of empty string
			set mywork $work
			if { [string equal -nocase $work ""]} {
				set mywork "work"
			}
			if { [lsearch $libs $mywork] == -1 } {
				# create $work if not exist.
				puts $DoFile "	vlib  $mywork"			
				# del this lib in case to clean up existing libs.
				puts $DoFile "	vdel -lib $mywork -all "	
				# create this $work.				
				puts $DoFile "	vlib $mywork"				
				lappend libs $mywork
			}
		}
	}
    #refresh for pojo2
    if {[string length $Para(POJO2LIBREFRESH)] > 0 } {
        puts $DoFile "	$Para(POJO2LIBREFRESH)"
    }
    
    #set uaplatform_library_path "$Para(INSTALLATIONPATH)/cae_library/simulation/verilog/uaplatform"
    #set device_library_path "$Para(INSTALLATIONPATH)/cae_library/simulation/verilog/$Para(DEVICEFAMILYNAME)"
	#set pmi_lib  "$Para(INSTALLATIONPATH)/ip/pmi"
	set sv_file_list ""
	set sv_include_dir_list ""
	set sv_compile_command ""
	set hasVerilog 0
	set hasVhdl 0
	foreach i $Para(FILELIST) compiler $Para(COMPLIST) inc $Para(INCLIST) work $Para(WORKLIBLIST) {

		#set compiler
		set j [string last > $i]
		set k [string last . $i]
		set CompileCommand ""
		set v_command ""
		if {$k != -1} {
			set len [string length $i]
			if {$j != -1} {
				set suf [string range $i [expr $k] [expr $j-1]]
			} else {
				set suf [string range $i [expr $k] [expr $len-1]]
			}
				
			if { [string equal -nocase $compiler "verilog"] } {
				set v_command "vlog"
				if { [lsearch $Para(SYSTEMVERILOGSUFFIX) $suf] != -1 } {
					set v_command "vlog -sv"
				}
			} elseif { [string equal -nocase $compiler "vhdl"] } {
				set v_command "vcom"
			} else {
				if { [lsearch $Para(VERISUFFIX) $suf] != -1 } {
					set v_command "vlog"
				} elseif { [lsearch $Para(SYSTEMVERILOGSUFFIX) $suf] != -1 } {
					set v_command "vlog -sv"
				} elseif { [lsearch $Para(VHDLSUFFIX) $suf] != -1 } {
					set v_command "vcom"
				}
			}
						
			set CompileCommand $v_command
			if { ![string equal -nocase $inc "none"] } {
				foreach eachinc $inc	{
					append CompileCommand " +incdir+$eachinc"
				}
			}
			
			foreach ginc $Para(GLBINCLIST) {                   
				if { [string first "+incdir+$ginc" $CompileCommand] == -1 } {
					append CompileCommand " +incdir+$ginc"
				}
			}
		}
		
		#add source files and compile them
		#put verilog file in one command
		if { ![string equal -nocase $work "none"] } {
			#set default lib to "work" instead of empty string
			set mywork $work
			if { [string equal -nocase $work ""]} {
				set mywork "work"
			}
			if { [string length $CompileCommand] && [string equal -nocase $v_command "vcom"] } {
				puts $DoFile "	$CompileCommand -work $mywork \"$i\""
				set hasVhdl 1

			} elseif { [string length $CompileCommand] && [string equal -nocase $v_command "vlog"] } {
				set file_path [get_file_path $i]
				puts $DoFile "	$CompileCommand  +incdir+$file_path  -work $mywork  \"$i\""
				set hasVerilog 1

			} elseif { [string length $CompileCommand] && [string equal -nocase $v_command "vlog -sv"] } {
				set file_path [get_file_path $i]
				set include_dir  "+incdir+$file_path" 
				lappend sv_file_list \"$i\"
				if { [lsearch $sv_include_dir_list $include_dir ] == -1 } {
					lappend sv_include_dir_list $include_dir
				}
			}
		}
	}

	set num_sv_files [llength $sv_file_list]
	if { $num_sv_files > 0 } {
		puts $DoFile "	vlog -sv -mfcu \\"
		set hasVerilog 1

		foreach sv_include_dir $sv_include_dir_list {
			puts $DoFile "	$sv_include_dir \\"
		}
		#puts $DoFile "	+incdir+$uaplatform_library_path \\"
		puts $DoFile " -work $mywork \\"
		set x 1
		foreach sv_file $sv_file_list {
			if {$x != $num_sv_files} {
				puts $DoFile "	$sv_file \\"
			} else {
				puts $DoFile "	$sv_file"
			}
			incr x
		}
	}
	puts $DoFile "\} else \{"
	puts $DoFile "	project open \"$Para(PROJECTPATH)/$Para(PROJECT)/$Para(PROJECT)\""
	puts $DoFile "	project compileoutofdate"
	puts $DoFile "\}"

	 #get simulation libs
	set simulationLibs ""
	foreach i $Para(SIMLIBLIST) {
		append simulationLibs "-L $i "
	}
	
	if { $Para(RUNSIMULATION) == "1" } {

		set timeScale ""
		if { $hasVerilog == 1 && $hasVhdl == 1 } {
			set timeScale "-t 1ps"
		}
		if {[string length $Para(SDFPATH)] > 0 && [string length $Para(SIMULATIONINSTANCE)] > 0 } {
			set instanceWithTestBech ""
			set sdfArgumentsForWaveform "-sdfmax /$Para(SIMULATIONTOPMODULE)$Para(SIMULATIONINSTANCE)=$Para(SDFPATH)"
			#added per DNG-8611
			puts $DoFile "vsim -L work ${simulationLibs} +transport_path_delays +transport_int_delays $Para(SIMULATIONTOPMODULE) $sdfArgumentsForWaveform"
		} else {
			puts $DoFile "vsim -L work ${simulationLibs} $Para(SIMULATIONTOPMODULE)"
		}

		#add top-level signals to waveform display    
		if { $Para(ADDTOPLEVELSIGNALSTOWAVEFORM) == "1" } {
			puts $DoFile "view wave"        
			puts $DoFile "add wave /*"     
		}
		puts $DoFile "run 1000ns"
	}
	
	close $DoFile
		
	return 0
}
