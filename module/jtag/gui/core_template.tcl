#$Header:$
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0
package require Iwidgets

proc LoadParaCB {} {
}

proc CheckParameterCB {} {
	#ReDrawPins
}

#*******************************************
# Generate Files
#*******************************************
proc GenerateCB {} {
	global Para tcl_platform


	set ret [DRC]

        if {$ret == -1} {
	   return $ret
        }

        set Para(ispTracyPath) [file join $Para(leverpath)  isptracy coredata ec]
        set Para(ispTracyBinPath) [file join $Para(leverpath)  ispjtools bin]

        set encFile ec.enc
	if {$Para(Family) == "or5s00" || $Para(Family) == "or5scm00" } {
            set encFile sc.enc
            set Para(ispTracyPath) [file join $Para(leverpath)  isptracy coredata sc]
        } else {
		if {$Para(Family) == "ep5a00" || $Para(Family) == "ep5m00"} {
	            set encFile ec2.enc
        	    set Para(ispTracyPath) [file join $Para(leverpath)  isptracy coredata ec2]
	        } else {
		      if {$Para(Family) == "mg5a00"} {
	                  set encFile xp2.enc
        	            set Para(ispTracyPath) [file join $Para(leverpath)  isptracy coredata xp2]
                      }
             }
	}

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

	if {$Para(params_switch) == "on"}  {
		set ret [WriteParamFile]
		if {$ret == -1}  {
			set msg "Error while generating $Para(ModuleName)_tmpl in $Para(ProjectPath)!"
			SendMessage $msg
			return -1
		} 
	}
       if {$Para(GenTracy) == 1} {

          CreateLpcFile
          
          if {$Para(GenTracy) == 1 && $Para(GenSpi) == 1} {
		switch $tcl_platform(platform) {
			windows	{set executePath [file join $Para(ispTracyBinPath) "cge.exe"]}
			unix	{
				if {$tcl_platform(os) == "Linux"}  {
					set executePath [file join $Para(ispTracyBinPath)  "cge"]
				} else  {
					set executePath [file join $Para(ispTracyBinPath) "cge"]
				} 
			}
		}

		if {$Para(params_switch) == "on" && [file exists $executePath]}	{
			catch {
				set oldPath [pwd]
				cd $Para(ProjectPath)
				set ret [catch {exec $executePath -p \"$Para(ProjectPath)" -i $Para(ModuleName).lpc -a 3 $lang} msg]
				tk_messageBox -default ok -icon info -message "read there" 
				#tk_messageBox -default ok -icon info -message "ret cge=$ret" \
				#		-title "Info" -type ok


				cd $oldPath
				set execOK "1"
				if {$msg != ""}	{
				#	tk_messageBox -default ok -icon info -message $msg \
				#		-title "Info" -type ok
				}
			}
		}
           }
		switch $tcl_platform(platform) {
			windows	{set executePath [file join $Para(ispTracyBinPath) "encode.exe"]}
			unix	{
				if {$tcl_platform(os) == "Linux"}  {
					set executePath [file join $Para(ispTracyBinPath) "encode"]
				} else  {
					set executePath [file join $Para(ispTracyBinPath) "encode"]
				} 
			}
		}

		if {$Para(params_switch) == "on" && [file exists $executePath]}	{
			# create parameter files
			#if {[CreateLpcFile]==-1} {return -1}
			# call CAPI
			catch {
				set oldPath [pwd]
				cd $Para(ispTracyPath)
                                #cd $Para(ProjectPath)

				catch {exec $executePath $encFile isptracy.vhd} msg
				#catch {exec $executePath ec.enc isptracy.vhd} msg
                                #catch {exec $executePath ec.enc isptracy.vhd}
				cd $oldPath
				set execOK "1"
				#if {$msg != ""}	{
				#	tk_messageBox -default ok -icon info -message $msg \
				#		-title "Info" -type ok
				#}
                                
			}
		}
        }

	set msg "\tModule Name: $Para(ModuleName)\n\
                 \tCore Type: $Para(CoreName)\n\
                 \tLPC file: $Para(ModuleName).lpc\n\
                 \tTemplate file:$Para(ModuleName)_tmpl.v\n\
                 \tModule $Para(CoreName) has been generated successfully in $Para(ProjectPath)."
	SendMessage $msg

	WriteTemplateFile

	return 0
}

 proc okCallback {} {
     puts "You selected [.nmfsd get]"
     .nmfsd deactivate
 }


#*******************************************
# Generate parameter File
#*******************************************
proc WriteParamFile {} {
	global Para tcl_platform
   set Para(Synpro) "0"
   if {$Para(GenTracy) != 1 && $Para(GenSpi) != 1} {
      return 0
   }

   set synpbase_bin [file join $Para(leverpath) synpbase bin]

   switch $tcl_platform(platform) {
	windows	{ set synp_loc [file join $synpbase_bin "synplify.exe"] }
	unix	{
  		  if {$tcl_platform(os) == "Linux"}  {
                        set synp_loc [file join $synpbase_bin "synplify"]
		  } else  {
                        set synp_loc [file join $synpbase_bin "synplify"]
		    } 
		}
   }

#   set synp_loc [file join $synpbase_bin "synplify.exe"]

#	tk_messageBox -default ok -icon info -message "$synp_loc" \
#			-title "Info" -type ok

   if {![file exists $synp_loc]} {
	tk_messageBox -default ok -icon info -message "Please set Synplify Pro install directory" \
			-title "Info" -type ok

	 #iwidgets::fileselectiondialog .nmfsd -title "Synplify Pro location"
	 #.nmfsd buttonconfigure OK -command okCallback
	 #.nmfsd activate

 	 #
	 # Modal example
	 #
	 iwidgets::fileselectiondialog .mfsd -modality application -title "Set Synplify Pro install directory" \
                             -fileson false -selectionlabel "Synplify install directory"
         #.mfsd buttonconfigure OK
	 .mfsd center

	 if {[.mfsd activate]} {
	    set Para(Synpro) [.mfsd get]
#	    tk_messageBox -default ok -icon info -message "You selected $Para(Synpro)" \
#			-title "Info" -type ok
            switch $tcl_platform(platform) {
	       windows	{ set Para(Synpro) [file join $Para(Synpro) bin synplify_pro.exe] }
	       unix	{ set Para(Synpro) [file join $Para(Synpro) bin synplify_pro] }
            }
	    #set Para(Synpro) [file join $Para(Synpro) bin synplify_pro.exe]
	    if {![file exists $Para(Synpro)]} {
               tk_messageBox -default ok -icon info -message "The synplify_pro executable doesn't exist!" \
			-title "Info" -type ok
               set Para(Synpro) "0"
            }

	 } else {
	   set Para(Synpro) "0"
	   tk_messageBox -default ok -icon info -message "Synplify Pro location was not specified!" \
			-title "Info" -type ok
	 }
   }

   regsub -all "\"" $Para(ProjectPath) "" Para(ProjectPath)
   regsub -all "\"" $Para(ModuleName) "" Para(ModuleName)

   set cmdFile [file join $Para(ProjectPath) $Para(ModuleName).cmd]
   if [catch {open $cmdFile w} cmdfileId] {
		puts stderr "Cannot open file: $cmdFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $cmdFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}

   if {$Para(GenTracy) == 1 && $Para(GenSpi) == 1} {
        WriteJtagCmdFile $cmdfileId
        WriteJtagWrapperFile
        if {$Para(Synpro) != "0"} {
           WriteJtagPrjFile
        }
#tk_messageBox -default ok -icon info -message "finish wrapper" \
#			-title "Info" -type ok

	return 0
  
   } else {
     if {$Para(GenTracy) == 1} {
	
	puts $cmdfileId "PROJECT: $Para(ModuleName)"

	puts $cmdfileId "WORKING_PATH: \"$Para(ProjectPath)\""
        puts $cmdfileId "MODULE: $Para(ModuleName)"

	puts $cmdfileId "VHDL_FILE_LIST: \"$Para(ispTracyPath)/isptracy.vhd\" $Para(ModuleName).vhd"
        #puts $cmdfileId "VHDL_FILE_LIST: \"$Para(ProjectPath)/isptracy.vhd\" $Para(ModuleName).vhd"

        puts $cmdfileId "OUTPUT_FILE_NAME: $Para(ModuleName)"
        puts $cmdfileId "SUFFIX_NAME: edi"
        #puts $cmdfileId "WRITE_PRF:false"
        puts $cmdfileId "DISABLE_IO_INSERTION: true"
        puts $cmdfileId "FREQUENCY: 300"

	close $cmdfileId
	
	if {$Para(Synpro) != "0"} {
           WriteTracyPrjFile
        }

	return 0
       }
    if {$Para(GenSpi) == 1} {


	puts $cmdfileId "PROJECT: $Para(ModuleName)"

	puts $cmdfileId "WORKING_PATH: \"$Para(ProjectPath)\""
        puts $cmdfileId "MODULE: $Para(ModuleName)"

	puts $cmdfileId "VHDL_FILE_LIST: \"$Para(lpc)\\spisource.vhd\" $Para(ProjectPath)/$Para(ModuleName).vhd"

        puts $cmdfileId "OUTPUT_FILE_NAME: $Para(ModuleName)"
        puts $cmdfileId "SUFFIX_NAME: edi"
        puts $cmdfileId "DISABLE_IO_INSERTION: true"

	close $cmdfileId

        set rtl [string last "Verilog" $Para(design)]
#tk_messageBox -default ok -icon info -message "rtl=$rtl" -title "" -type ok

      if {$rtl != -1 } {
 	set outFile [file join $Para(ProjectPath) "$Para(ModuleName)_tmpl.v"]
	if [catch {open $outFile w} fileId] {
		puts stderr "Cannot open file: $outFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}
	
        WriteSpiVloTemplate $fileId
        close $fileId
      } else {
	set outFile [file join $Para(ProjectPath) "$Para(ModuleName)_tmpl.vhd"]
	if [catch {open $outFile w} fileId] {
		puts stderr "Cannot open file: $outFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}
	
        WriteSpiVhdlTemplate $fileId
        close $fileId
      }
	set outFile [file join $Para(ProjectPath) "$Para(ModuleName).vhd"]
	if [catch {open $outFile w} fileId] {
		puts stderr "Cannot open file: $outFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}
	
        WriteSpi $fileId

	close $fileId
	return 0
      }
   }
}

#*******************************************
# Generate Jtag Cmd File
#*******************************************

proc WriteJtagCmdFile {cmdfileId} {
   global Para
	puts $cmdfileId "PROJECT: $Para(ModuleName)_wrapper"

	puts $cmdfileId "WORKING_PATH: \"$Para(ProjectPath)\""
        puts $cmdfileId "MODULE: $Para(ModuleName)_wrapper"

	puts $cmdfileId "VHDL_FILE_LIST: \"$Para(ispTracyPath)/isptracy.vhd\" \"$Para(lpc)\\spiprog.vhd\" $Para(ModuleName).vhd $Para(ModuleName)_wrapper.vhd"

        puts $cmdfileId "OUTPUT_FILE_NAME: $Para(ModuleName)"
        puts $cmdfileId "SUFFIX_NAME: edi"
        #puts $cmdfileId "WRITE_PRF:false"
        puts $cmdfileId "DISABLE_IO_INSERTION: true"
        puts $cmdfileId "FREQUENCY: 300"

	close $cmdfileId

}

#*******************************************
# Generate Jtag Core Synplify_Pro Project File
#*******************************************

proc WriteJtagPrjFile {} {
   global Para

   set prjFile [file join $Para(ProjectPath) "$Para(ModuleName)_wrapper.prj"]
   if [catch {open $prjFile w} prjfileId] {
		puts stderr "Cannot open file: $prjFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $prjFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}

puts $prjfileId "add_file -vhdl -lib work \"$Para(ispTracyPath)/isptracy.vhd\" \"$Para(lpc)\\spiprog.vhd\" $Para(ModuleName).vhd $Para(ModuleName)_wrapper.vhd"

puts $prjfileId "set_option -default_enum_encoding default
set_option -symbolic_fsm_compiler 1
set_option -resource_sharing 1

set_option -frequency 300
set_option -fanout_limit 100
set_option -disable_io_insertion 1
set_option -retiming 0
set_option -pipe 0
set_option -force_gsr auto

set_option -write_verilog 0
set_option -write_vhdl 0

set_option -write_apr_constraint 1
"
puts $prjfileId "project -result_format \"edif\"
project -result_file \"$Para(ModuleName).edi\""

puts $prjfileId "set_option -vlog_std v2001
set_option -project_relative_includes 1"

	close $prjfileId

}


#*******************************************
# Generate Tracy Core Synplify_Pro Project File
#*******************************************

proc WriteTracyPrjFile {} {
   global Para

   set prjFile [file join $Para(ProjectPath) "$Para(ModuleName).prj"]
   if [catch {open $prjFile w} prjfileId] {
		puts stderr "Cannot open file: $prjFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $prjFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}

puts $prjfileId "add_file -vhdl -lib work \"$Para(ispTracyPath)/isptracy.vhd\" $Para(ModuleName).vhd"


   if {$Para(Family) == "mg5g00"} {
	  puts $prjfileId "set_option -technology LATTICE-XP
set_option -part LFXP3C
set_option -package T100C
set_option -speed_grade -3"           
   } else {
       if {$Para(Family) == "ep5g00" || $Para(Family) == "ep5g00p"} {
	  puts $prjfileId "set_option -technology LATTICE-EC
set_option -part LFEC1E
set_option -package T100C
set_option -speed_grade -3"           
        } 
   }

puts $prjfileId "set_option -default_enum_encoding default
set_option -symbolic_fsm_compiler 1
set_option -resource_sharing 1

set_option -frequency 300
set_option -fanout_limit 100
set_option -disable_io_insertion 1
set_option -retiming 0
set_option -pipe 0
set_option -force_gsr auto

set_option -write_verilog 0
set_option -write_vhdl 0

set_option -write_apr_constraint 1
"
puts $prjfileId "project -result_format \"edif\"
project -result_file \"$Para(ModuleName).edi\""

puts $prjfileId "set_option -vlog_std v2001
set_option -project_relative_includes 1"

	close $prjfileId

}

proc WriteJtagWrapperFile {} {
   global Para

	set outFile [file join $Para(ProjectPath) "$Para(ModuleName)_wrapper.vhd"]
	if [catch {open $outFile w} fp] {
		puts stderr "Cannot open file: $outFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}

   WriteVhdlHeader $fp
   set Date [clock format [clock seconds]]
   puts $fp "-- generated at $Date"


   puts $fp "library ieee;"
   puts $fp "use ieee.std_logic_1164.all;"
   puts $fp ""
   puts $fp "entity $Para(ModuleName)_wrapper is"

   WriteJtagVhdPort $fp

   puts $fp "end $Para(ModuleName)_wrapper; "

   puts $fp ""
   puts $fp "architecture $Para(ModuleName)_wrapper_a of $Para(ModuleName)_wrapper is"

   set num $Para(NumIspLA)

   puts $fp "component $Para(ModuleName)
      port (
      -- Connections to external ER1.vhd module
      JTCK             : in  std_logic;
      JTDI             : in  std_logic;
      JSHIFT           : in  std_logic;
      JUPDATE          : in  std_logic;
      JRSTN            : in  std_logic;
      JCE2             : in  std_logic;
      ISPTRACY_ER2_TDO : out std_logic;
      ISPTRACY_ENABLE  : in  std_logic;
      CONTROL_DATAN    : in  std_logic;"

   set wflag 1
   WriteTracyVhdlPort $fp $wflag
 
   puts $fp "\t);"
   puts $fp "end component;"
   puts $fp ""

   puts $fp "component ER1
      port (
      	 TCKA             : in  std_logic;
      	 TMSA             : in  std_logic;
      	 TDIA             : in  std_logic;
      	 TDOA             : out std_logic;
         JTCK             : out std_logic;
         JTDI             : out std_logic;
         JSHIFT           : out std_logic;
         JUPDATE          : out std_logic;
         JRSTN            : out std_logic;
         JCE2             : out std_logic;
         JRTI2            : out std_logic;
         ER2_TDO          : in  std_logic_vector(14 downto 0);
         ISPTRACY_ER2_TDO : in  std_logic;
         IP_ENABLE        : out std_logic_vector(14 downto 0);
         ISPTRACY_ENABLE  : out std_logic;
         CONTROL_DATAN    : out std_logic
      );
   end component;

   component SPIPROG
      port (
         JTCK           : in  std_logic;
         JTDI           : in  std_logic;
         JTDO2          : out std_logic;
         JSHIFT         : in  std_logic;
         JUPDATE        : in  std_logic;
         JRSTN          : in  std_logic;
         JCE2           : in  std_logic;
         SPIPROG_ENABLE : in  std_logic;
         CONTROL_DATAN  : in  std_logic;
         SPI_C          : out std_logic;
         SPI_D          : out std_logic;
         SPI_SN         : out std_logic;
         SPI_Q          : in  std_logic
      );
   end component;

   signal tck          : std_logic;
   signal tdi          : std_logic;
   signal tdoEr2       : std_logic;
   signal shiftDr      : std_logic;
   signal updateDr     : std_logic;
   signal resetN       : std_logic;
   signal enableEr2    : std_logic;
   signal er2TDO       : std_logic_vector(14 downto 0);
   signal ipEnable     : std_logic_vector(14 downto 0);
   signal controlDataN : std_logic;
   signal tracyEnable  : std_logic;
   signal tracyEr2     : std_logic;"

   puts $fp ""
   puts $fp "   attribute syn_noprune : boolean;"
   puts $fp "   attribute syn_noprune of ER1_inst : label is true;"
   puts $fp "   attribute syn_noprune of SPIPROG_inst : label is true;"
   puts $fp ""

   puts $fp "begin


   ER1_inst : ER1
   port map (
      TCKA             =>	  TCKA,
      TMSA             =>         TMSA,
      TDIA             =>	  TDIA,
      TDOA             =>         TDOA,
      JTCK             =>          tck,
      JTDI             =>          tdi,
      JSHIFT           =>      shiftDr,
      JUPDATE          =>     updateDr,
      JRSTN            =>       resetN,
      JCE2             =>    enableEr2,
      JRTI2            =>         open,
      ER2_TDO          =>       er2TDO,
      ISPTRACY_ER2_TDO =>     tracyEr2,
      IP_ENABLE        =>     ipEnable,
      ISPTRACY_ENABLE  =>    tracyEnable,
      CONTROL_DATAN    => controlDataN
   );"

   puts $fp ""
   puts $fp "   er2TDO <= \"11111111111111\" & tdoEr2;"
   puts $fp ""

   puts $fp "SPIPROG_inst : SPIPROG
   port map (
      JTCK           =>          tck,
      JTDI           =>          tdi,
      JTDO2          =>       tdoEr2,
      JSHIFT         =>      shiftDr,
      JUPDATE        =>     updateDr,
      JRSTN          =>       resetN,
      JCE2           =>    enableEr2,
      SPIPROG_ENABLE =>  ipEnable(0),
      CONTROL_DATAN  => controlDataN,
      SPI_C          =>    SPI_PIN_C,
      SPI_D          =>    SPI_PIN_D,
      SPI_SN         =>   SPI_PIN_SN,
      SPI_Q          =>    SPI_PIN_Q
   );"

   puts $fp ""
   puts $fp "$Para(ModuleName)_inst : $Para(ModuleName)" 
   puts $fp "    port map(
      -- Connections to external ER1.vhd module
      TCKA             =>	  TCKA,
      TMSA             =>	  TMSA,
      TDIA             =>	  TDIA,
      TDOA             =>	  TDOA,
      JTCK             =>          tck,
      JTDI             =>          tdi,
      JSHIFT           =>      shiftDr,
      JUPDATE          =>     updateDr,
      JRSTN            =>       resetN,
      JCE2             =>    enableEr2,
      ISPTRACY_ER2_TDO =>     tracyEr2,
      ISPTRACY_ENABLE  =>  tracyEnable,
      CONTROL_DATAN    => controlDataN,"

   set num $Para(NumIspLA)
   
   for {set i 1} {$i <= $num} {incr i 1} {
            set x [expr $i-1]
            if {$Para(TriggerSameAsTrace$x) == "OFF"} {
               puts $fp "\tTRIG_SIG_$x=> TRIG_SIG_$x,"
            }
        
            puts $fp "\tTRACE_SIG_$x=> TRACE_SIG_$x,"

            if {$Para(TriggerInput$x) == "ON"} {
               puts $fp "\tTRIG_IN_$x=> TRIG_IN_$x,"
            }
            if {$Para(TriggerOutput$x) == "ON"} {
                  puts $fp "\tTRIG_OUT_$x=> TRIG_OUT_$x,"
            }
            if { $i == $num } {  
              puts $fp "\tSAMPLE_CLK_$x=> SAMPLE_CLK_$x"
            } else {
              puts $fp "\tSAMPLE_CLK_$x=> SAMPLE_CLK_$x,"
            }
   }



   puts $fp "      );"

   puts $fp "end $Para(ModuleName)_wrapper_a;"

   close $fp
}
#*******************************************
# Generate template File
#*******************************************
proc WriteTemplateFile {} {
   global Para

   set rtl [string last "Verilog" $Para(design)]

   if {$Para(GenTracy) == 1 && $Para(GenSpi) == 1} {
      if {$rtl != -1 } {
	set outFile [file join $Para(ProjectPath) "$Para(ModuleName)_tmpl.v"]
	if [catch {open $outFile w} fileId] {
		puts stderr "Cannot open file: $outFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}
	
        WriteJtagVlogTempl $fileId
	close $fileId
      } else {	set outFile [file join $Para(ProjectPath) "$Para(ModuleName)_tmpl.vhd"]
	if [catch {open $outFile w} fileId] {
		puts stderr "Cannot open file: $outFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}
	
        
        WriteJtagVhdlTempl $fileId
	close $fileId

	return 0
      }  
   } else {
    if {$Para(GenSpi) == 1} {
#tk_messageBox -default ok -icon info -message "rtl=$rtl" -title "" -type ok

      if {$rtl != -1 } {
 	set outFile [file join $Para(ProjectPath) "$Para(ModuleName)_tmpl.v"]
	if [catch {open $outFile w} fileId] {
		puts stderr "Cannot open file: $outFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}
	
        WriteSpiVloTemplate $fileId
        close $fileId

      } else {
	set outFile [file join $Para(ProjectPath) "$Para(ModuleName)_tmpl.vhd"]
	if [catch {open $outFile w} fileId] {
		puts stderr "Cannot open file: $outFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}
	
        WriteSpiVhdlTemplate $fileId
        close $fileId
      }
   }
 }
}

proc WriteJtagVlogTempl {fp} {
   global Para

   WriteVlogHeader $fp
   set Date [clock format [clock seconds]]
   puts $fp "// generated at $Date"
   puts $fp "// Lattice JTAG module declaration"
   puts $fp ""
   puts $fp "module $Para(ModuleName) "
   puts $fp "("

   set num $Para(NumIspLA)

   puts $fp "   TCKA,"
   puts $fp "   TMSA,"
   puts $fp "   TDIA,"
   puts $fp "   TDOA,"

   for {set i 1} {$i <= $num} {incr i 1} {
            set x [expr $i-1]
            puts $fp "\t// -- ispLA $x"
            if {$Para(TriggerSameAsTrace$x) == "OFF"} {
               puts $fp "   TRIG_SIG_$x,"
            }
        
            puts $fp "   TRACE_SIG_$x,"

            if {$Para(TriggerInput$x) == "ON"} {
               puts $fp "   TRIG_IN_$x,"
            }
            if {$Para(TriggerOutput$x) == "ON"} {
                  puts $fp "   TRIG_OUT_$x,"
            }
            puts $fp "   SAMPLE_CLK_$x,"
   }

   puts $fp "   SPI_PIN_Q,
   SPI_PIN_C,
   SPI_PIN_D,
   SPI_PIN_SN"
   puts $fp ");"

   puts $fp " "
   puts $fp "   //Inputs"
   puts $fp "   input TCKA;"
   puts $fp "   input TMSA;"
   puts $fp "   input TDIA;"

   for {set i 1} {$i <= $num} {incr i 1} {
            set x [expr $i-1]
            if {$Para(TriggerSameAsTrace$x) == "OFF"} {
               set y [expr $Para(TriggerWidth$x)-1]
               puts $fp "   input \[ $y: 0\]TRIG_SIG_$x;"
            }
            set z [expr $Para(TraceWidth$x)-1]
            puts $fp "   input \[ $z: 0\]TRACE_SIG_$x;"

            if {$Para(TriggerInput$x) == "ON"} {
               puts $fp "   input TRIG_IN_$x;"
            }
            puts $fp "   input SAMPLE_CLK_$x;"
   }

   puts $fp "   input SPI_PIN_Q;"
   puts $fp ""
   puts $fp "   //Outputs"

   puts $fp "   output TDOA;"

   for {set i 1} {$i <= $num} {incr i 1} {
            set x [expr $i-1]
            if {$Para(TriggerOutput$x) == "ON"} {
                  puts $fp "   output TRIG_OUT_$x;"
            }
   }

   puts $fp "   output SPI_PIN_C;"
   puts $fp "   output SPI_PIN_D;"
   puts $fp "   output SPI_PIN_SN;"
   puts $fp ""
   puts $fp "endmodule"

   puts $fp ""
   puts $fp ""

   puts $fp "// Lattice JTAG module instantiation"

   puts $fp "$Para(ModuleName) __ ("

   puts $fp "   .TCKA (),
   .TMSA (),
   .TDIA (),
   .TDOA (),"

   for {set i 1} {$i <= $num} {incr i 1} {
            set x [expr $i-1]
            if {$Para(TriggerSameAsTrace$x) == "OFF"} {
               puts $fp "   .TRIG_SIG_$x (),"
            }
        
            puts $fp "   .TRACE_SIG_$x (),"

            if {$Para(TriggerInput$x) == "ON"} {
               puts $fp "   .TRIG_IN_$x (),"
            }
            if {$Para(TriggerOutput$x) == "ON"} {
                  puts $fp "   .TRIG_OUT_$x (),"
            }
            puts $fp "   .SAMPLE_CLK_$x (),"
   }

   puts $fp "   .SPI_PIN_Q (),
   .SPI_PIN_C (),
   .SPI_PIN_D (),
   .SPI_PIN_SN ());"

}

proc WriteJtagVhdlTempl {fp} {

   global Para

   WriteVhdlHeader $fp
   set Date [clock format [clock seconds]]
   puts $fp "-- generated at $Date"

   puts $fp "-- Lattice JTAG module declaration"
   puts $fp ""
   puts $fp "component $Para(ModuleName) "

   WriteJtagVhdPort $fp

   puts $fp "end component; "

   puts $fp ""
   puts $fp ""

   puts $fp "-- Lattice Jtag module instantiation"
   puts $fp ""
   puts $fp "__ : $Para(ModuleName)";
   puts $fp "    port map ("

   set num $Para(NumIspLA)
   
   puts $fp "\tTCKA=>__,"
   puts $fp "\tTMSA=>__,"
   puts $fp "\tTDIA=>__,"
   puts $fp "\tTDOA=>__,"

   for {set i 1} {$i <= $num} {incr i 1} {
            set x [expr $i-1]
            if {$Para(TriggerSameAsTrace$x) == "OFF"} {
               puts $fp "\tTRIG_SIG_$x=>__,"
            }
        
            puts $fp "\tTRACE_SIG_$x=>__,"

            if {$Para(TriggerInput$x) == "ON"} {
               puts $fp "\tTRIG_IN_$x=>__,"
            }
            if {$Para(TriggerOutput$x) == "ON"} {
                  puts $fp "\tTRIG_OUT_$x=>__,"
            }
            puts $fp "\tSAMPLE_CLK_$x=>__,"
   }


   puts $fp "\tSPI_PIN_Q=>__,"
   puts $fp "\tSPI_PIN_C=>__,"
   puts $fp "\tSPI_PIN_D=>__,"
   puts $fp "\tSPI_PIN_SN=>__);"

}


proc WriteJtagVhdPort {fp} {
   global Para
   puts $fp "   port ("

   set wflag 0
   WriteTracyVhdlPort $fp $wflag

   WriteSpiVhdlPort $fp

   puts $fp ");"

}



proc WriteTracyVhdlPort {fp wflag} {
   global Para

   puts $fp "\tTCKA\t:   in   std_logic;"
   puts $fp "\tTMSA\t:   in   std_logic;"
   puts $fp "\tTDIA\t:   in   std_logic;"
   puts $fp "\tTDOA\t:   out   std_logic;"

   set num $Para(NumIspLA)

   for {set i 1} {$i <= $num} {incr i 1} {
            set x [expr $i-1]
            puts $fp "\t-- ispLA $x"
            if {$Para(TriggerSameAsTrace$x) == "OFF"} {
               set y [expr $Para(TriggerWidth$x)-1]
               puts $fp "\tTRIG_SIG_$x \t:   in   std_logic_vector($y downto 0);"
            }

            set z [expr $Para(TraceWidth$x)-1]
            puts $fp "\tTRACE_SIG_$x \t:   in   std_logic_vector($z downto 0);"

            if {$Para(TriggerInput$x) == "ON"} {
               puts $fp "\tTRIG_IN_$x\t:   in   std_logic;"
            }
            if {$Para(TriggerOutput$x) == "ON"} {
                  puts $fp "\tTRIG_OUT_$x\t:   out  std_logic;"
            }
            if { $wflag == 1 && $i == $num } {
            puts $fp "\tSAMPLE_CLK_$x\t:   in   std_logic"

            } else {
            puts $fp "\tSAMPLE_CLK_$x\t:   in   std_logic;"
            }
   }


}

proc WriteSpiVhdlPort {fp} {
   puts $fp "\tSPI_PIN_Q\t:   in   std_logic;"
   puts $fp "\tSPI_PIN_C\t:   out  std_logic;"
   puts $fp "\tSPI_PIN_D\t:   out  std_logic;"
   puts $fp "\tSPI_PIN_SN\t:   out  std_logic"   
}

proc WriteVlogHeader {fp} {

	puts $fp "//----------------------------------------------------------------------------
//  Copyright 2005 Lattice Semiconductor Corporation.  All rights reserved.
//
//----------------------------------------------------------------------------
// Permission:
//
//   Lattice Semiconductor grants permission to use this code for use
//   in synthesis for any Lattice programmable logic product.  Other
//   use of this code, including the selling or duplication of any
//   portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL or Verilog source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Lattice Semiconductor provides no warranty
//   regarding the use or functionality of this code.
//----------------------------------------------------------------------------
//
//    Lattice Semiconductor Corporation
//    5555 NE Moore Court
//    Hillsboro, OR 97124
//    U.S.A
//
//    TEL: 1-800-Lattice (USA and Canada)
//    408-826-6000 (other locations)
//
//    web: http://www.latticesemi.com/
//    email: techsupport@latticesemi.com
// 
//----------------------------------------------------------------------------"
}

proc WriteVhdlHeader {fp} {

	puts $fp "------------------------------------------------------------------------------
--  Copyright 2005 Lattice Semiconductor Corporation.  All rights reserved.
--
------------------------------------------------------------------------------
-- Permission:
--
--   Lattice Semiconductor grants permission to use this code for use
--   in synthesis for any Lattice programmable logic product.  Other
--   use of this code, including the selling or duplication of any
--   portion is strictly prohibited.
--
-- Disclaimer:
--
--   This VHDL or Verilog source code is intended as a design reference
--   which illustrates how these types of functions can be implemented.
--   It is the user's responsibility to verify their design for
--   consistency and functionality through the use of formal
--   verification methods.  Lattice Semiconductor provides no warranty
--   regarding the use or functionality of this code.
------------------------------------------------------------------------------
--
--    Lattice Semiconductor Corporation
--    5555 NE Moore Court
--    Hillsboro, OR 97124
--    U.S.A
--
--    TEL: 1-800-Lattice (USA and Canada)
--    408-826-6000 (other locations)
--
--    web: http://www.latticesemi.com/
--    email: techsupport@latticesemi.com
-- 
------------------------------------------------------------------------------
"
}

proc WriteSpiVloTemplate {fp} {

   global Para

#tk_messageBox -default ok -icon info -message "Entry=$Para(design)" \
#			-title "Info" -type ok

   WriteVlogHeader $fp;

   set Date [clock format [clock seconds]]
   puts $fp "// generated at $Date"
   puts $fp ""
   
   puts $fp "// Lattice SPI module declaration
module $Para(ModuleName) (
   SPI_PIN_Q,
   SPI_PIN_C,
   SPI_PIN_D,"

   puts $fp "   SPI_PIN_SN);"
   puts $fp ""
   puts $fp ""

   puts $fp "input SPI_PIN_Q;
output SPI_PIN_C, SPI_PIN_D, SPI_PIN_SN;"
   puts $fp "";
   puts $fp "endmodule"
   puts $fp "";
   puts $fp "";
   puts $fp "// Lattice SPI module instantiation"

   puts $fp ""
   puts $fp "$Para(ModuleName) __ (
   .SPI_PIN_Q        (),
   .SPI_PIN_C        (),
   .SPI_PIN_D        (),
   .SPI_PIN_SN       ());"

}

proc WriteSpiVhdlTemplate {fp} {

   global Para

   WriteVhdlHeader $fp;
   
   set Date [clock format [clock seconds]]
   puts $fp "-- generated at $Date"
   puts $fp "-- Lattice SPI module declaration"
   puts $fp ""

   puts $fp "component  $Para(ModuleName)"
   puts $fp "   port ("
   puts $fp "      SPI_PIN_Q : in std_logic;"
   puts $fp "      SPI_PIN_C : out std_logic;"
   puts $fp "      SPI_PIN_D : out std_logic;"

   puts $fp "     SPI_PIN_SN : out std_logic"
   
   puts $fp ");"
   puts $fp "end component;"
   puts $fp ""
   puts $fp ""

   puts $fp "-- Lattice SPI module instantiation"
   puts $fp ""
   puts $fp "__ : $Para(ModuleName)";
   puts $fp "    port map (SPI_PIN_Q=>__, SPI_PIN_C=>__, SPI_PIN_D=>__, SPI_PIN_SN=>__);"

}

proc WriteSpi {fp} {

   global Para

   #WriteVlogHeader $fp;

   puts $fp "-- Lattice SPI module"

   set Date [clock format [clock seconds]]
	puts $fp "-- generated at $Date"
        puts $fp ""
        puts $fp ""
	puts $fp "library ieee;"

   puts $fp "use ieee.std_logic_1164.all;"
   puts $fp "entity $Para(ModuleName) is"
   puts $fp "   port ("
   puts $fp "    SPI_PIN_C  : out std_logic;"
   puts $fp "    SPI_PIN_D  : out std_logic;"
   puts $fp "    SPI_PIN_SN : out std_logic;"
   puts $fp "    SPI_PIN_Q  : in  std_logic);"
   puts $fp "end $Para(ModuleName);"
   puts $fp ""
   puts $fp ""

   puts $fp "architecture $Para(ModuleName)_a of $Para(ModuleName) is"
   puts $fp "   component ER1"
   puts $fp "      port ("
   puts $fp "         JTCK             : out std_logic;"
   puts $fp "         JTDI             : out std_logic;"
   puts $fp "         JSHIFT           : out std_logic;"
   puts $fp "         JUPDATE          : out std_logic;"
   puts $fp "         JRSTN            : out std_logic;"
   puts $fp "         JCE2             : out std_logic;"
   puts $fp "         JRTI2            : out std_logic;"
   puts $fp "         ER2_TDO          : in  std_logic_vector(14 downto 0);"
   puts $fp "         ISPTRACY_ER2_TDO : in  std_logic;"
   puts $fp "         IP_ENABLE        : out std_logic_vector(14 downto 0);"
   puts $fp "         ISPTRACY_ENABLE  : out std_logic;"
   puts $fp "         CONTROL_DATAN    : out std_logic"
   puts $fp "      );"
   puts $fp "   end component;"
   puts $fp ""
   puts $fp ""

   puts $fp "   component SPIPROG"
   puts $fp "      port ("
   puts $fp "         JTCK           : in  std_logic;"
   puts $fp "         JTDI           : in  std_logic;"
   puts $fp "         JTDO2          : out std_logic;"
   puts $fp "         JSHIFT         : in  std_logic;"
   puts $fp "         JUPDATE        : in  std_logic;"
   puts $fp "         JRSTN          : in  std_logic;"
   puts $fp "         JCE2           : in  std_logic;"
   puts $fp "         SPIPROG_ENABLE : in  std_logic;"
   puts $fp "         CONTROL_DATAN  : in  std_logic;"
   puts $fp "         SPI_C          : out std_logic;"
   puts $fp "         SPI_D          : out std_logic;"
   puts $fp "         SPI_SN         : out std_logic;"
   puts $fp "         SPI_Q          : in  std_logic"
   puts $fp "      );"
   puts $fp "   end component;"
   puts $fp ""
   puts $fp ""

   puts $fp "   signal tck          : std_logic;"
   puts $fp "   signal tdi          : std_logic;"
   puts $fp "   signal tdoEr2       : std_logic;"
   puts $fp "   signal shiftDr      : std_logic;"
   puts $fp "   signal updateDr     : std_logic;"
   puts $fp "   signal resetN       : std_logic;"
   puts $fp "   signal enableEr2    : std_logic;"
   puts $fp "   signal er2TDO       : std_logic_vector(14 downto 0);"
   puts $fp "   signal ipEnable     : std_logic_vector(14 downto 0);"
   puts $fp "   signal controlDataN : std_logic;"
   puts $fp ""
   puts $fp ""

   puts $fp "begin

   ER1_inst : ER1
    port map (
      JTCK             =>          tck,
      JTDI             =>          tdi,
      JSHIFT           =>      shiftDr,
      JUPDATE          =>     updateDr,
      JRSTN            =>       resetN,
      JCE2             =>    enableEr2,
      JRTI2            =>         open,
      ER2_TDO          =>       er2TDO,
      ISPTRACY_ER2_TDO =>          '0',
      IP_ENABLE        =>     ipEnable,
      ISPTRACY_ENABLE  =>         open,
      CONTROL_DATAN    => controlDataN"

   puts $fp "   );"

   puts $fp "   er2TDO <= \"11111111111111\" & tdoEr2;"
   puts $fp ""
   puts $fp ""

   puts $fp "   SPIPROG_inst : SPIPROG"
   puts $fp "   port map ("
   puts $fp "      JTCK           =>          tck,
      JTDI           =>          tdi,
      JTDO2          =>       tdoEr2,
      JSHIFT         =>      shiftDr,
      JUPDATE        =>     updateDr,
      JRSTN          =>       resetN,
      JCE2           =>    enableEr2,
      SPIPROG_ENABLE =>  ipEnable(0),
      CONTROL_DATAN  => controlDataN,
      SPI_C          =>    SPI_PIN_C,
      SPI_D          =>    SPI_PIN_D,
      SPI_SN         =>   SPI_PIN_SN,
      SPI_Q          =>    SPI_PIN_Q
   );"

   puts $fp "end $Para(ModuleName)_a;"

}


#*******************************************
# DRC
#*******************************************

proc DRC {} {
	global Para tcl_platform

      for {set i 0} {$i < $Para(NumIspLA)} {incr i 1} {
	if { $Para(TriggerWidth$i) > 127 } {
	   tk_messageBox -default ok -icon info -message "trigger $i width is bigger than 127" \
		-title "Info" -type ok
           return -1;
	}
      }

      for {set i 0} {$i < $Para(NumIspLA)} {incr i 1} {
       if { $Para(TriggerSameAsTrace$i) == "ON" } {
	if { $Para(TraceWidth$i) > 127 } {
	   tk_messageBox -default ok -icon info -message \
                  "Trigger width is same as trace width which is bigger than 127 for ispLA $i, \
change it to 127." \
		-title "Info" -type ok
           set Para(TraceWidth$i) 127
           #return -1;

	}
       }
      }

      return 0;
}


#*******************************************
# Adjust pin list
#*******************************************

#*******************************************
# Redraw the pin image
#*******************************************
proc ReDrawPins {}  {
	global pin_name_list pin_direction_list bus_width_list pin_side_list
	AdjustPins;
	DrawPins $pin_name_list $pin_direction_list $bus_width_list $pin_side_list;
} 

#*******************************************
# Set the output file name
#*******************************************
proc SetOutputFilesCB {} {
	global Para output_files_list

	set output_files_list ""
	if {![info exists Para(ModuleName)] || $Para(ModuleName)==""} return

	set output_files_list [list "$Para(ModuleName).lpc"]
	if {$Para(SourceFormat)=="Schematic/VHDL"} {
		lappend output_files_list "fft_params.v" "$Para(ModuleName).vhd" "$Para(ModuleName).ld2"
	}
	if {$Para(SourceFormat)=="Schematic/Verilog HDL"} {
		lappend output_files_list "fft_params.v" "$Para(ModuleName).v" "$Para(ModuleName).ld2"
	}
	if {$Para(SourceFormat)=="EDIF"} {
		lappend output_files_list "fft_params.v"
	}
}

proc CreateFrm3RadioItem {parent main label text1 val1 text2 val2 text3 val3 rdowidth side para {p {}}} {
	global ft
	iwidgets::Labeledframe .frm$main -labeltext $label -labelpos nw
	set cs [.frm$main childsite]
	radiobutton .rdo1$main -text $text1 -width 8 -value $val1 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo2$main -text $text2 -width 8 -value $val2 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo3$main -text $text3 -width $rdowidth -value $val3 -variable $para -anchor w -font $ft -command $p
	pack .rdo1$main .rdo2$main .rdo3$main -in $cs -side $side -pady 12
	pack .frm$main -in $parent -side top -anchor center -padx 8
}

proc ShowIspLA  {page1 option options tracyoption tracyoptions} {

    global Para pin_flag in_pins out_pins 

    set num $Para(NumIspLA)

    if {$num > 1} {
      for {set i 2} {$i <= $num} {incr i 1} {
           if {$Para(laflag[expr $i-1]) == 0} {
		#tk_messageBox -default ok -icon info -message "insert la$i" \
		#	-title "Info" -type ok

              AddIspLA $tracyoption $i
           }     	
       #set x [expr $num-1]
       set x [expr $i-1]

       grid $tracyoption.ck$x $tracyoption.cb[expr $x]1 $tracyoption.cb[expr $x]2 \
            $tracyoption.cb[expr $x]3 $tracyoption.cb[expr $x]4 $tracyoption.cb[expr $x]5 \
            $tracyoption.cb[expr $x]6 $tracyoption.cb[expr $x]7 \
	    $tracyoption.cb[expr $x]8 $tracyoption.cb[expr $x]9 $tracyoption.cb[expr $i]0 \
           -sticky w -padx 2

       #pack .tracyoption -in $page1 -padx 1 -fill x
     if {$Para(GenTracy) == 1} {   
       #temprorily commented out     
       pack .tracy$option -in $tracyoptions -padx 1 -fill x
       pack .tracy$options -in $page1 -padx 1 -fill x
       #pack $tracyoption -in $page1 -padx 1 -fill x
     }
       set Para(laflag[expr $i-1]) 1       
       #set Para(laflag[expr $num-1]) 1       
      }
    }

    for {set i $num} {$i <$Para(PreNumIspLA)} {incr i 1} {
      if {$Para(laflag[expr $i]) == 1} {
         set y [expr $i+1]
         ForgetIspLA $tracyoption $y
      }
    }

    set Para(PreNumIspLA) $num

	#tk_messageBox -default ok -icon info -message "tracy enable= $Para(GenTracy)"  \
	#	-title "Info" -type ok

   if {$Para(GenTracy) == 1} {
    ReDrawPins
   }
}

proc AddIspLA {tracyoption idx} {

	#global Para tracyoption 
        global Para

        set x [expr $idx-1]

	label $tracyoption.ck$x  -text "ispLA$x" 
	iwidgets::combobox $tracyoption.cb[expr $x]1 -width 6 -editable false \
		-listheight 90  -textvariable Para(SizeComparision$x) 
	$tracyoption.cb[expr $x]1 insert list end "ON" "OFF" 
	iwidgets::combobox $tracyoption.cb[expr $x]2 -width 6 -editable false \
		-listheight 90  -textvariable Para(EventCounter$x) 
	$tracyoption.cb[expr $x]2 insert list end "NONE" "8" "16"
	iwidgets::combobox $tracyoption.cb[expr $x]3 -width 6 -editable false \
		-listheight 90  -textvariable Para(TriggerSameAsTrace$x) \
                -selectioncommand "setTrigTraceSame $tracyoption $x"
	$tracyoption.cb[expr $x]3 insert list end "ON" "OFF"
	iwidgets::combobox $tracyoption.cb[expr $x]4 -width 6 -editable false \
		-listheight 90  -textvariable Para(TriggerWidth$x) \
                -selectioncommand "RedrawAndUpdateEdgeSig $x $tracyoption"
        for {set i 4} {$i < 128} {incr i 1} {
           $tracyoption.cb[expr $x]4 insert list end $i
        }
        if {$Para(TriggerSameAsTrace$x) == "ON"} {
           $tracyoption.cb[expr $x]4 config -state disabled
        } else {
           $tracyoption.cb[expr $x]4 config -state normal
        }

	iwidgets::combobox $tracyoption.cb[expr $x]5 -width 6 -editable false \
		-listheight 90  -textvariable Para(TraceWidth$x) \
                -selectioncommand "RedrawAndUpdateEdgeSig $x $tracyoption"
        for {set i 1} {$i < 257} {incr i 1} {
           $tracyoption.cb[expr $x]5 insert list end $i
        }	
	iwidgets::combobox $tracyoption.cb[expr $x]6 -width 6 -editable false \
		-listheight 90  -textvariable Para(TraceDepth$x) 
	$tracyoption.cb[expr $x]6 insert list end "512" "1024" "2048" "4096"
 
	iwidgets::combobox $tracyoption.cb[expr $x]7 -width 6 -editable false \
		-listheight 90  -textvariable Para(SampleAroundTrigger$x) 
	$tracyoption.cb[expr $x]7 insert list end "ON" "OFF"
	iwidgets::combobox $tracyoption.cb[expr $x]8 -width 6 -editable false \
		-listheight 90  -textvariable Para(NumEdgeTriggerSignal$x) \
                -selectioncommand "UpdateEdgeSignal $x $tracyoption"
        if {$Para(TriggerSameAsTrace$x) == "ON"} {
           for {set i 0} {$i < $Para(TraceWidth$x)} {incr i 1} {
               $tracyoption.cb[expr $x]8 insert list end $i
           }	
        } else {
           for {set i 0} {$i < $Para(TriggerWidth$x)} {incr i 1} {
              $tracyoption.cb[expr $x]8 insert list end $i
           }
        }	
  
	iwidgets::combobox $tracyoption.cb[expr $x]9 -width 6 -editable false \
		-listheight 90  -textvariable Para(TriggerInput$x) \
                -selectioncommand ReDrawPins
	$tracyoption.cb[expr $x]9 insert list end "ON" "OFF"
	iwidgets::combobox $tracyoption.cb[expr $idx]0 -width 6 -editable false \
		-listheight 90  -textvariable Para(TriggerOutput$x) \
                -selectioncommand ReDrawPins

	$tracyoption.cb[expr $idx]0 insert list end "ON" "OFF"

}

proc RedrawAndUpdateEdgeSig {idx tracyoption} {

   #tk_messageBox -default ok -icon info -message "update edge$idx" \
   #					-title "Info" -type ok

   UpdateEdgeSignal $idx $tracyoption
   ReDrawPins
}

proc UpdateEdgeSignal {x tracyoption} {
   global Para 
        $tracyoption.cb[expr $x]8 clear list
	#tk_messageBox -default ok -icon info -message "update edge$x" \
	#		-title "Info" -type ok

        if {$Para(TriggerSameAsTrace$x) == "ON"} {
           for {set i 0} {$i < $Para(TraceWidth$x)} {incr i 1} {
               $tracyoption.cb[expr $x]8 insert list end $i
           }	
        } else {
           for {set i 0} {$i < $Para(TriggerWidth$x)} {incr i 1} {
              $tracyoption.cb[expr $x]8 insert list end $i
           }
        }	

}

proc ForgetIspLA {tracyoption idx} {

global Para 
        set x [expr $idx-1]

        grid forget $tracyoption.ck$x

        for {set i 1} {$i < 10} {incr i 1} {
            set xi "$x$i"
            grid forget $tracyoption.cb${xi}
        }

        grid forget $tracyoption.cb[expr $idx]0
        set Para(laflag$x) 2
}

proc ReDrawPins {}  {
global Para pin_name_list pin_direction_list bus_width_list pin_side_list diagram

        if {$Para(NumIspLA) > 3} {
           #DrawBlankImage
           #set diagram [DrawImage 204 550 $pin_name_list $pin_direction_list $bus_width_list $pin_side_list]
        }
	
	AdjustPins;
	DrawPins $pin_name_list $pin_direction_list $bus_width_list $pin_side_list

} 
proc DrawBlankImage {} {
	global Para ft

	set H [.diagram cget -height]
	set W [.diagram cget -width]
	.diagram addtag allpins all
	.diagram delete allpins

	set txt "For more information on this\nmodule, please click the\n Help button."
	.diagram create text [expr $W/2] [expr $H/2] -text $txt -font $ft

	pack .diagram -in .left -fill y
}

proc AdjustPins {} {
	global Para
	global pin_name_list pin_direction_list bus_width_list pin_side_list

   if {$Para(GenTracy) == 1} {
	set pin_name_list {SAMPLE_CLK_0}
        #set pin_name_list {""}
        set pin_direction_list {0}
        set bus_width_list {0}

        set num $Para(NumIspLA)

        for {set i 1} {$i <= $num} {incr i 1} {
            set x [expr $i-1]
         
            if {$x > 0} {
	    	if { $num >= 15 } {
		      if { $x == 7 } {
	               #lappend pin_name_list "SAMPLE_CLK_$x"
                        set qq [expr $num -2]
			lappend pin_name_list "SAMPLE_CLK_1..$qq"
        	       lappend pin_direction_list 0
               	       lappend bus_width_list 0
                      } else {
              		set qq [ expr $num -1]
  		      	if { $x == $qq } {
	               lappend pin_name_list "SAMPLE_CLK_$x"
        	       lappend pin_direction_list 0
            	       lappend bus_width_list 0
                        }
                      }

               	} else {
	               lappend pin_name_list "SAMPLE_CLK_$x"
        	       lappend pin_direction_list 0
            	       lappend bus_width_list 0
                }
            }

            if {$Para(TriggerSameAsTrace$x) == "OFF"} {
               lappend pin_name_list TRIG_SIG_$x
               lappend pin_direction_list 0
               lappend bus_width_list $Para(TriggerWidth$x)
            }
        
            lappend pin_name_list TRACE_SIG_$x
            lappend pin_direction_list 0
            lappend bus_width_list $Para(TraceWidth$x)

            if {$Para(TriggerInput$x) == "ON"} {
               lappend pin_name_list TRIG_IN_$x
               lappend pin_direction_list 0
               lappend bus_width_list 0
            }
            
        }

        if {$Para(GenSpi) == 1} {
               lappend pin_name_list "SPI_PIN_Q"
               lappend pin_direction_list 0
               lappend bus_width_list 0
        }

        set y 0
        for {set i 1} {$i <= $num} {incr i 1} {
            set x [expr $i-1]
            if {$Para(TriggerOutput$x) == "ON"} {
               lappend pin_name_list TRIG_OUT_$x
               lappend pin_direction_list 1
               lappend bus_width_list 0
               incr y 1
            }
        }
        if {$Para(GenSpi) == 1} {
               lappend pin_name_list "SPI_PIN_C"
               lappend pin_direction_list 1
               lappend bus_width_list 0
               incr y 1
               lappend pin_name_list "SPI_PIN_D"
               lappend pin_direction_list 1
               lappend bus_width_list 0
               incr y 1
               lappend pin_name_list "SPI_PIN_SN"
               lappend pin_direction_list 1
               lappend bus_width_list 0
               incr y 1
        }

        set pinside_list {1}
        set pi_pinside_list [lreplace $pinside_list 0 0 $y]
	#tk_messageBox -default ok -icon info -message "Setting pi_pinside_list $pi_pinside_list"  \
		#-title "Info" -type ok

        set wd [llength $pin_name_list]

        set ww [expr $wd-$y]

        set pin_side_list [linsert $pi_pinside_list 0 $ww]
   } else {
      if {$Para(GenSpi) == 1} {
	set pin_name_list {"SPI_PIN_Q" "SPI_PIN_C" "SPI_PIN_D" "SPI_PIN_SN"}
        set pin_direction_list {0 1 1 1}
        set bus_width_list {0 0 0 0}
        set pin_side_list {1 3}
      } else {
	set pin_name_list {""}
        set pin_direction_list {0}
        set bus_width_list {0}
        set pin_side_list {0}
      }
   }
	#tk_messageBox -default ok -icon info -message $pin_side_list  \
	#	-title "Info" -type ok

}

proc AdjustPins_bak {} {
	global Para
	global pin_name_list pin_direction_list bus_width_list pin_side_list

   if {$Para(GenTracy) == 1 && $Para(curPage) == 0} {
	set pin_name_list {SAMPLE_CLK_0}
        #set pin_name_list {""}
        set pin_direction_list {0}
        set bus_width_list {0}

        set num $Para(NumIspLA)

        for {set i 1} {$i <= $num} {incr i 1} {
            set x [expr $i-1]
         
            if {$x > 0} {
               lappend pin_name_list "SAMPLE_CLK_$x"
               lappend pin_direction_list 0
               lappend bus_width_list 0
            }

            if {$Para(TriggerSameAsTrace$x) == "OFF"} {
               lappend pin_name_list TRIG_SIG_$x
               lappend pin_direction_list 0
               lappend bus_width_list $Para(TriggerWidth$x)
            }
        
            lappend pin_name_list TRACE_SIG_$x
            lappend pin_direction_list 0
            lappend bus_width_list $Para(TraceWidth$x)

            if {$Para(TriggerInput$x) == "ON"} {
               lappend pin_name_list TRIG_IN_$x
               lappend pin_direction_list 0
               lappend bus_width_list 0
            }
            
        }


        set y 0
        for {set i 1} {$i <= $num} {incr i 1} {
            set x [expr $i-1]
            if {$Para(TriggerOutput$x) == "ON"} {
               lappend pin_name_list TRIG_OUT_$x
               lappend pin_direction_list 1
               lappend bus_width_list 0
               incr y 1
            }
        }
        set pinside_list {1}
        set pi_pinside_list [lreplace $pinside_list 0 0 $y]
	#tk_messageBox -default ok -icon info -message "Setting pi_pinside_list $pi_pinside_list"  \
		#-title "Info" -type ok

        set wd [llength $pin_name_list]

        set ww [expr $wd-$y]

        set pin_side_list [linsert $pi_pinside_list 0 $ww]
   } else {
      if {$Para(GenSpi) == 1 && $Para(curPage) == 1} {
	set pin_name_list {"SPI_PIN_Q" "SPI_PIN_C" "SPI_PIN_D" "SPI_PIN_SN"}
        set pin_direction_list {0 1 1 1}
        set bus_width_list {0 0 0 0}
        set pin_side_list {1 3}
      } else {
	set pin_name_list {""}
        set pin_direction_list {0}
        set bus_width_list {0}
        set pin_side_list {0}
      }
   }
	#tk_messageBox -default ok -icon info -message $pin_side_list  \
	#	-title "Info" -type ok

}

proc DrawIspTracyPins {} {
     global Para
     set Para(curPage) 0
     ReDrawPins
}

proc DrawSpiPins {} {
     global Para
     set Para(curPage) 1
     ReDrawPins
}

proc setTrigTraceSame {tracyoption idx} {
   global Para 

   if {$Para(TriggerSameAsTrace$idx) == "ON"} {
        $tracyoption.cb[expr $idx]4 config -state disabled

	#set qq [expr $tracyoption.cb[expr $idx]5 size]
	#set qq1 [expr $qq-1]
	$tracyoption.cb[expr $idx]5 delete list 0 255
        for {set i 4} {$i < 128} {incr i 1} {
           $tracyoption.cb[expr $idx]5 insert list end $i
        }

   } else {
        $tracyoption.cb[expr $idx]4 config -state normal
	
	$tracyoption.cb[expr $idx]5 delete list 0 125
        for {set i 1} {$i < 257} {incr i 1} {
           $tracyoption.cb[expr $idx]5 insert list end $i
        }
   }

   RedrawAndUpdateEdgeSig $idx $tracyoption
}

proc showIspTRACY {page1 tnb option options tracyoption tracyoptions} {
   #global Para tracyoptions page1
   global Para

   #tk_messageBox -default ok -icon info -message $Para(GenTracy)  \
   #	-title "Info" -type ok

   if {$Para(GenTracy) == 1} {
      #$tnb view 1
	#pack $tracyoption -in $tracyoptions -padx 1 -fill x
        #pack $tracyoptions -in $page1 -padx 1 -fill x
       pack .tracy$option -in $tracyoptions -padx 1 -fill x
       pack .tracy$options -in $page1 -padx 1 -fill x

        #ReDrawPins

   } else {
        #$tnb view 0
	#pack forget $tracyoptions
        pack forget .tracy$options
        #DrawBlankImage
   }
   ReDrawPins
}

#*******************************************
# Function template for graphical image
#*******************************************
proc DrawInitImage {W H} {
	global ft Para diagram tcl_platform

	if {$tcl_platform(platform) == "windows"}  {
		set dt [expr [font metrics $ft -ascent]-11]
		set w_n [expr $W/20]
		set h_n [expr $H/20]
		set W [expr $W+$dt*$w_n]
		set H [expr $H+$dt*$h_n]
	} 
	set diagram [canvas .diagram -width $W -height $H -relief sunken \
		-borderwidth 2 -bg #ffffff]
	
	pack .diagram -in .left -side top
}

#*******************************************
# Main Part
#*******************************************
proc Create_Image {} {
  global pin_name_list pin_direction_list bus_width_list pin_side_list Para diagram tnb  tcl_platform ft

  package require JtagCore 
  #package require OrcaModule
  wm title . "Lattice Module -- JTAG v1.1"

ProjectSet
MainInterface

set Para(curPage) 0

AdjustPins
#DrawInitImage 230 400

        switch $tcl_platform(platform) {
                windows {
                        set dt [expr [font metrics $ft -ascent]-11]
                        set diagram [DrawImage 204 550 $pin_name_list $pin_direction_list $bus_width_list $pin_side_list]
                        #set diagram [DrawImage 204 400 $pin_name_list $pin_direction_list $bus_width_list $pin_side_list]
                        #set tnb [AttributeSetting [expr 745+$dt*25] [expr 550+$dt*21]]
			set tnb [AttributeSetting [expr 755+$dt*25] [expr 550+$dt*21]]
                        option add *disabledForeground SystemDisabledText
                }
                unix {
			#the following two are updated by hua
                        #set diagram [DrawImage 300 750 $pin_name_list $pin_direction_list $bus_width_list $pin_side_list]
                        #set tnb [AttributeSetting 500 540]
			set diagram [DrawImage 204 550 $pin_name_list $pin_direction_list $bus_width_list $pin_side_list]
                        set tnb [AttributeSetting 900 550]
                        #option add *disabledForeground #a3a3a3
                }
        }

option add *font $ft
option add *labelFont $ft

set width 20

set page1 [$tnb add -label "ispTRACY Cores" -command DrawIspTracyPins]

        iwidgets::labeledframe .tracyoptions -labeltext "ispTRACY Core Configuration" -labelpos nw         
	set tracyoptions [.tracyoptions childsite]

        iwidgets::labeledframe .tracyoption -labeltext "" -labelpos nw         
	set tracyoption [.tracyoption childsite]


# checkbutton .cbTracy -text "ispTRACY" -variable Para(GenTracy) -command \
#"showIspTRACY $page1 $tnb option options $tracyoption $tracyoptions"
checkbutton .cbTracy -text "Enable ispTRACY IP" -variable Para(GenTracy)  -command \
  "showIspTRACY $page1 $tnb option options $tracyoption $tracyoptions"
pack .cbTracy -in $page1 -side top -anchor w -padx $width

if {$Para(SourceFormat)=="EDIF"} {
  checkbutton .cbGenER1 -text "JTAG interface logic" -variable Para(GenER1)
  pack .cbGenER1 -in $page1 -side top -anchor w -padx $width
} else {
  set Para(GenER1) 1
}
 


#AdjustPins
#DrawInitImage 230 400 
#DrawImage 230 400 $pin_name_list $pin_direction_list $bus_width_list $pin_side_list

####################
## by hua
######################


	label $tracyoptions.numIspLA_txt   -text "Number Of Cores"

	iwidgets::combobox $tracyoptions.numIspLA -width 6  \
                 -editable false \
		-listheight 90  -textvariable Para(NumIspLA) \
                -selectioncommand "ShowIspLA $page1 option options $tracyoption $tracyoptions"

        for {set i 1} {$i < 17} {incr i 1} {
           $tracyoptions.numIspLA insert list end $i
           set Para(laflag[expr $i-1]) 0
        }	

        #set Para(NumIspLA) 1

        #grid $tracyoption.numIspLA_txt $tracyoption.numIspLA  -sticky w -padx 2

        #pack $tracyoptions.numIspLA_txt -side top -anchor w -padx 20 -pady 8

        #pack $tracyoptions.numIspLA_txt $tracyoptions.numIspLA -side top -padx 20 -pady 8
        pack $tracyoptions.numIspLA_txt $tracyoptions.numIspLA -side top 
        #pack $tracyoptions.numIspLA  -side center -anchor w -padx 20 -pady 8
        #pack $tracyoptions.numIspLA  -side top -padx 20 -pady 8

	label $tracyoption.size_compare   -text "Size\nComparison\nLogic"
	label $tracyoption.event_conter   -text "Event\nCounter\nSize"
	label $tracyoption.triggerSameAsTrace -text "Trigger\nSame\nAs Trace"
	label $tracyoption.triggerWidth -text "Trigger\nBus\nSize"
	label $tracyoption.traceWidth   -text "Trace\nBus\nSize"
	label $tracyoption.traceDepth   -text "Trace\nMemory\nDepth"
	label $tracyoption.sampleAroundTrigger   -text "Sample After\nTrigger\nMode Logic"
	label $tracyoption.numEdgeTriggerSignal   -text "Number Of\nEdge Trigger\nSignals"
	label $tracyoption.triggerInput   -text "Trigger\nInput\nLogic"
	label $tracyoption.triggerOutput   -text "Trigger\nOutput\nLogic"
	grid  x $tracyoption.size_compare $tracyoption.event_conter $tracyoption.triggerSameAsTrace \
              $tracyoption.triggerWidth $tracyoption.traceWidth $tracyoption.traceDepth \
              $tracyoption.sampleAroundTrigger $tracyoption.numEdgeTriggerSignal $tracyoption.triggerInput \
              $tracyoption.triggerOutput -sticky w -padx 2

        AddIspLA $tracyoption 1

	grid $tracyoption.ck0 $tracyoption.cb01 $tracyoption.cb02 $tracyoption.cb03 \
	     $tracyoption.cb04 $tracyoption.cb05 $tracyoption.cb06 $tracyoption.cb07 \
	     $tracyoption.cb08 $tracyoption.cb09 $tracyoption.cb10 \
             -sticky w -padx 2

        pack $tracyoptions.numIspLA_txt -side top -anchor w -padx 20 -pady 8
        pack $tracyoptions.numIspLA  -side top -anchor w -padx 20 -pady 8
        pack .tracyoptions -in $page1 -padx 1 -fill x

     if {$Para(GenTracy) == 1} {        
	pack .tracyoption -in $tracyoptions -padx 1 -fill x
        pack .tracyoptions -in $page1 -padx 1 -fill x
     }
        #ShowIspLA $Para(NumIspLA)
        set Para(PreNumIspLA) 1
        ShowIspLA $page1 option options $tracyoption $tracyoptions
        set Para(params_switch) on

	#if ECP2, ECP2M, XP2, remove SPI as the requirement in CR38195, 
	#tk_messageBox  -default ok -icon info -message $Para(Family)
	if {$Para(Family) == "ep5a00" || $Para(Family) == "ep5m00"  || $Para(Family) == "mg5a00" } {
		set Para(GenSpi) 0
	} else {
		set Page [$tnb add -label "SPI Programmer Core"  -command DrawSpiPins]
		checkbutton .cbSpi -text "SPI Programmer Core" -variable Para(GenSpi) -command ReDrawPins
		pack .cbSpi -in $Page -side top -anchor w -padx $width
	}

    if {$Para(GenTracy) == 1} {        
       $tnb view 0
    } else {
       $tnb view 1
    }

#FunctionButton

pack forget .frmRevision

#CenterPosition
}
