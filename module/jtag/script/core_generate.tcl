#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide Core_Generate 1.0.0
#package require core_template
#package require Iwidgets

proc GenerateCore {} {

	#set done 0

        global Para tcl_platform env done

        #tk_messageBox -default ok -icon info -message "Family=what" \
	#			-title "Info" -type ok

        #
        # Project path
        #
        set proj_dir $Para(ProjectPath)
        cd $proj_dir
        #
        # Get ispLever bin paths
        #
        set install_dir $Para(install_dir)
        set cpld_bin [file join $install_dir ispcpld bin]
        set fpga_dir [file join $install_dir ispfpga bin]
        set synpbase_bin [file join $install_dir synpbase bin]

        switch $tcl_platform(platform) {
           windows {
              set fpga_bin [file join $fpga_dir  "nt"]
        	     if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
        	        set env(PATH) "$fpga_bin;$env(PATH)" } }
           unix {
              set fpga_bin [file join $fpga_dir "sol"]
              if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
                 set env(PATH) "$fpga_bin;$env(PATH)"}}}

        if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
           set env(PATH) "$cpld_bin;$env(PATH)" }

        # Commands to make the Process:
        # Generate Bitstream Data
        
        set ispTracyBinPath [file join $install_dir ispjtools bin]

      #if {$Para(GenTracy) == 1 && $Para(GenSpi) == 1} {
      #  if [runCmd "\"$ispTracyBinPath/cge\" -p \"$Para(ProjectPath)\" -i $Para(ModuleName).lpc -a 3"] {
      #  	return
      #  } else {
      #  	vwait done
      #  	if [checkResult $done] {
      #  		return
      #  	}
      #  }
      #}

        set verilog [string last "Verilog" $Para(design)]
        if {$verilog != -1} {
           set lang "-verilog"
        } else {
           set vhdl [string last "VHDL" $Para(design)]
           if {$vhdl != -1} {
              set lang "-vhdl"
           } else {
             set lang ""
           }      
        }

       # tk_messageBox -default ok -icon info -message "lagn=$lang" \
       #				-title "Info" -type ok


      if {$Para(GenSpi) == 0 && $Para(GenTracy) == 1} {
        if {$Para(GenER1) == 1} {
          set ret [runCmd "\"$ispTracyBinPath/cge\" -p \"$Para(ProjectPath)\" -i $Para(ModuleName).lpc -a 2 $lang"]
        } else {
          set ret [runCmd "\"$ispTracyBinPath/cge\" -p \"$Para(ProjectPath)\" -i $Para(ModuleName).lpc -a 3 $lang"]
        }
        if $ret {
        	return
        } else {
        	vwait done
        	if [checkResult $done] {
        		return
        	}
        }
      }

        if {$Para(Family) == "mg5g00"} {
           set family lattice-xp
           set synfamily lattice-xp
	   set sysFileDir ec
        } else {
	   if {$Para(Family) == "ep5g00" || $Para(Family) == "ep5g00p" } {
               set family lattice-ec
               set synfamily lattice-ec
	       set sysFileDir ec
           } else {
              if {$Para(Family) == "or5s00" } {
                 set family lattice-sc
                 set synfamily lattice-sc
  	         set sysFileDir sc
              } else {
                 if {$Para(Family) == "or5scm00" } {
                    set family lattice-scm
                    set synfamily lattice-scm
 	            set sysFileDir sc
                 } else {
	            if {$Para(Family) == "ep5a00" } {
                    set family latticeECP2-DSP
		    set synfamily lattice-ECP2
 	            set sysFileDir ec2
                    } else {
		        if {$Para(Family) == "ep5m00" } {
        	            set family latticeECP2M-DSP
			    set synfamily lattice-ECP2M
	 	            set sysFileDir ec2
			} else {
                     if {$Para(Family) == "mg5a00"} {
                        set family lattice-xp2
                        set synfamily lattice-xp2
	                  set sysFileDir xp2
                     } 
                  }
		    }
                 }

              }
           }
        }

      if {$Para(GenTracy) != 0 || $Para(GenSpi) != 0} {

       if {$Para(Synpro) != "0"} {
        if [runCmd "\"$Para(Synpro)\" -batch $Para(ModuleName).prj"] {
        	return
        } else {
        	vwait done
        	if [checkResult $done] {
        		return
        	}
        }
       } else {
        if [runCmd "\"$cpld_bin/synpwrap\" -e $Para(ModuleName) -target $synfamily"] {
        	return
        } else {
        	vwait done
        	if [checkResult $done] {
        		return
        	}
        }
       }
#        file delete $Para(ModuleName).cmd
#        file delete $Para(ModuleName).vhd
#        file delete $Para(ModuleName)_wrapper.vhd

        set trfile [file join $install_dir  ispTracy coredata $sysFileDir "isptracy.vhd"]
        file delete -force $trfile

        if [runCmd "\"$fpga_bin/edif2ngd\" -l $family -nopropwarn \"$Para(ModuleName).edi\" \"$Para(ModuleName).ngo\""] {
        	return
        } else {
        	vwait done
        	if [checkResult $done] {
        		return
        	}
        }
     }

    set rtl [string last "Verilog" $Para(design)]
    if {$rtl == -1} {
          set lang "vhd"
          set dlang "v"
    } else {
          set lang "v"
          set dlang "vhd"
    }
    
    set result0 " Module Name: $Para(ModuleName)\n\
                 Core Type: $Para(CoreName)\n\
                 LPC file: $Para(ModuleName).lpc\n"
    if {$Para(GenTracy) != 0 || $Para(GenSpi) != 0} {
       set edf [string last "EDIF" $Para(design)]
       if {$edf == -1} {
           set result1 "$result0 NGO file: $Para(ModuleName).ngo\n\
                 Template file:$Para(ModuleName)_tmpl.$lang\n"
       } else {
           set result1 "$result0 NGO file: $Para(ModuleName).ngo\n\
                 Edif file:$Para(ModuleName).edi\n"
       }
      set result "$result1 Module $Para(CoreName) has been generated successfully in $Para(ProjectPath)."
    } else {
  
      set result "$result0 Module $Para(CoreName) has been generated successfully in $Para(ProjectPath)."
    }

    puts "$result\n"

}

