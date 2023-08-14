#$Header:

package provide Core_Generate 1.0.0

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

proc GenerateCore {{template_only 0}} {

  package require IP_Generate
	package require IP_Control
	global Para tcl_platform Unix_system Path_sep env
	if {[info exists env(TOOLRTF)] == 1} {
		global done proj_dir install_dir bin_dir
        
#********************************************************************************
# Setup IP generation environment variables
#********************************************************************************
		
#	set Para(command_line) 0
		set Para(para_file) [file join "$Para(BuildDir)" $Para(ModuleName).lpc]
		set done 0
		switch $tcl_platform(platform) {
		   windows {
			#set env(PATH) "."
			}
		}

		#
		# Project path
		#
		set proj_dir "$Para(ProjectPath)"
		cd $proj_dir
		#
		# Get ispLever cpld and fpga bin paths
		#
		set install_dir $Para(install_dir)
		set bin_dir [file join $install_dir bin]
		
		switch $tcl_platform(platform) {
			windows {
				set bin_dir [file join $bin_dir  "nt"]
			}
			unix {
				set bin_dir [file join $bin_dir "$Unix_system"]
			}
		}

		if {[string match "*$bin_dir$Path_sep*" $env(PATH)] == 0 } {
			set env(PATH) "$bin_dir$Path_sep$env(PATH)"  
		}
               
	} else {
		global done env proj_dir install_dir cpld_bin fpga_dir fpga_bin

#********************************************************************************
# Setup IP generation environment variables
#********************************************************************************
		
#	set Para(command_line) 0
		set Para(para_file) [file join "$Para(BuildDir)" $Para(ModuleName).lpc]
		set done 0
		switch $tcl_platform(platform) {
		   windows {
			set env(PATH) "."
			}
		}
        #
        # Project path
        #
        set proj_dir "$Para(ProjectPath)"
        cd $proj_dir
        #
        # Get ispLever cpld and fpga bin paths
        #
        set install_dir $Para(install_dir)

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
           set env(PATH) "$cpld_bin$Path_sep$env(PATH)" };
	}

	# set the device technology
	if { $Para(Family) == "LatticeSC" } {
		set Para(tech_syn) LATTICE-SC
		set Para(tech_pmi) SC
		set Para(tech_cae) sc
		set Para(tech_ngd) LatticeSC

	} elseif { $Para(Family) == "LatticeSCM" } {
		set Para(tech_syn) LATTICE-SCM
		set Para(tech_pmi) SCM
		set Para(tech_cae) scm
		set Para(tech_ngd) LatticeSCM

	} elseif { $Para(Family) == "LatticeXP" } {
		set Para(tech_syn) LATTICE-XP
		set Para(tech_pmi) XP
		set Para(tech_cae) xp
		set Para(tech_ngd) LatticeXP

	} elseif { $Para(Family) == "LatticeXP2" } {
		set Para(tech_syn) LATTICE-XP2
		set Para(tech_pmi) XP2
		set Para(tech_cae) xp2
		set Para(tech_ngd) LatticeXP2

	} elseif { $Para(Family) == "LatticeEC" } {
		set Para(tech_syn) LATTICE-EC
		set Para(tech_pmi) EC
		set Para(tech_cae) ec
		set Para(tech_ngd) LatticeEC

	} elseif { $Para(Family) == "LatticeECP" } {
		set Para(tech_syn) LATTICE-ECP
		set Para(tech_pmi) ECP
		set Para(tech_cae) ecp
		set Para(tech_ngd) LatticeECP

	} elseif { $Para(Family) == "LatticeECP2" } {
		set Para(tech_syn) LATTICE-ECP2
		set Para(tech_pmi) ECP2
		set Para(tech_cae) ecp2
		set Para(tech_ngd) LatticeECP2

	} elseif { $Para(Family) == "LatticeECP2MS" } {
		set Para(tech_syn) LATTICE-ECP2MS
		set Para(tech_pmi) ECP2MS
		set Para(tech_cae) ecp2ms
		set Para(tech_ngd) LatticeECP2MS

	} elseif { $Para(Family) == "LatticeECP2S" } {
		set Para(tech_syn) LATTICE-ECP2S
		set Para(tech_pmi) ECP2S
		set Para(tech_cae) ecp2s
		set Para(tech_ngd) LatticeECP2S

	} elseif { $Para(Family) == "LatticeECP2M" } {
		set Para(tech_syn) LATTICE-ECP2M
		set Para(tech_pmi) ECP2M
		set Para(tech_cae) ecp2m
		set Para(tech_ngd) LatticeECP2M

	} elseif { $Para(Family) == "LatticeECP3" } {
		set Para(tech_syn) LATTICE-ECP3
		set Para(tech_pmi) ECP3
		set Para(tech_cae) ecp3
		set Para(tech_ngd) LatticeECP3

	} elseif { $Para(Family) == "LatticeECP4UM" } {
		set Para(tech_syn) LATTICE-ECP4UM
		set Para(tech_pmi) ECP4UM
		set Para(tech_cae) ecp4um
		set Para(tech_ngd) LatticeECP4UM

	} elseif { $Para(Family) == "ECP5UM5G" } {
		set Para(tech_syn) ECP5UM5G
		set Para(tech_pmi) ECP5UM5G
		set Para(tech_cae) ecp5um5g
		set Para(tech_ngd) ECP5UM5G
		
	} elseif { $Para(Family) == "ECP5UM" } {
		set Para(tech_syn) ECP5UM
		set Para(tech_pmi) ECP5UM
		set Para(tech_cae) ecp5um
		set Para(tech_ngd) ECP5UM

	} elseif { $Para(Family) == "ECP5U" } {
		set Para(tech_syn) ECP5U
		set Para(tech_pmi) ECP5U
		set Para(tech_cae) ecp5u
		set Para(tech_ngd) ECP5U

	} elseif { $Para(Family) == "LIFMD" } {
		set Para(tech_syn) LIFMD
		set Para(tech_pmi) LIFMD
		set Para(tech_cae) lifmd
		set Para(tech_ngd) LIFMD

	} elseif { $Para(Family) == "LIFMDF" } {
		set Para(tech_syn) LIFMDF
		set Para(tech_pmi) LIFMDF
		set Para(tech_cae) lifmdf
		set Para(tech_ngd) LIFMDF

	} elseif { $Para(Family) == "PRISM" } {
		set Para(tech_syn) PRISM
		set Para(tech_pmi) PRISM
		set Para(tech_cae) prism
		set Para(tech_ngd) PRISM
		
	} elseif { $Para(Family) == "MachXO" } {
		set Para(tech_syn) MachXO
		set Para(tech_pmi) XO
		set Para(tech_cae) machxo
		set Para(tech_ngd) MachXO

	} elseif { $Para(Family) == "MachXO2" } {
		set Para(tech_syn) MachXO2
		set Para(tech_pmi) XO2
		set Para(tech_cae) machxo2
		set Para(tech_ngd) MachXO2
		
	} elseif { $Para(Family) == "MachXO3L" } {
		set Para(tech_syn) MachXO3L
		set Para(tech_pmi) XO3L
		set Para(tech_cae) machxo3l
		set Para(tech_ngd) MachXO3L
	} elseif { $Para(Family) == "MachXO3LF" } {
		set Para(tech_syn) MachXO3LF
		set Para(tech_pmi) XO3LF
		set Para(tech_cae) machxo3lf
		set Para(tech_ngd) MachXO3LF
	} elseif { $Para(Family) == "MachXO3H" } {
		set Para(tech_syn) MachXO3H
		set Para(tech_pmi) XO3H
		set Para(tech_cae) machxo3h
		set Para(tech_ngd) MachXO3H
	} elseif { $Para(Family) == "MachXO3D" } {
		set Para(tech_syn) MachXO3D
		set Para(tech_pmi) XO3D
		set Para(tech_cae) machxo3d
		set Para(tech_ngd) MachXO3D
	} elseif { $Para(Family) == "LFMNX" } {
		set Para(tech_syn) LFMNX
		set Para(tech_pmi) LFMNX
		set Para(tech_cae) lfmnx
		set Para(tech_ngd) LFMNX
	} else {
		puts "Unsupported device family \"$Para(Family)\""
		return -1
	}

	# set the IP generation script version
	#support burst shift
	#set Para(ipgen_ver) 1_5_062609
	#support pattern check
	set Para(ipgen_ver) 1_6_042617

#********************************************************************************
# Load required IP parameters
#********************************************************************************

 	set ret [LoadIPParameters]
	if {$ret < 0} {
	    puts $Para(msg)
	    return $ret
	} else {
	    puts "Parameters loaded ok."
	}

#********************************************************************************
# Load any optional files required by IP
#********************************************************************************

 	set ret [LoadIPOptionalFiles]
	if {$ret < 0} {
	    puts $Para(msg)
	    return $ret
	} elseif {$ret == 1} {
	    puts "No optional files required."
	} else {
	    puts "Optional files loaded ok."
	}

#********************************************************************************
# Check IP parameters
#********************************************************************************

# 	set ret [CheckIPParameters]
#	if {$ret < 0} {
#	    puts "ERROR - Parameter check failed."
#	    puts $Para(msg)
#	    return
#	} else {
#	    puts "Parameter values ok."
#	}

#********************************************************************************
# Generate IP templates
#********************************************************************************

 	set ret [GenerateIPTemplates]
	if {$ret < 0} {
	    return $ret
	} else {
	    puts "IP template generation completed ok."
	}

#For diamond new core generation flow, only generate the revel core RTL files
    if {$template_only ==0} {
#********************************************************************************
# Generate parameterized IP core
#********************************************************************************
        set ret [CreateIPCore]
        if {$ret < 0} {
            return $ret
        } else {
            puts "IP core generation completed ok."
        }
    }   
#********************************************************************************
# Clean Up
#********************************************************************************

# 	set ret [CleanUp]
#	if {$ret < 0} {
#	    return
#	} else {
#	    puts "Generation completed ok."
#	}

#********************************************************************************
# Exit process if running from command line
#********************************************************************************

 	if {[string length $Para(cmd)] > 0 } {
	    exit
	}
    return $ret
}

