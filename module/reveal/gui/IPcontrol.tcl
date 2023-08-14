#$Header:

package provide IP_Control 1.0.0

proc Hex2Bin {v} {
	set len [string length $v]
	for {set i 0} {$i < $len} {incr i} {
		set temp [string range $v $i $i]
		switch $temp {
			0 {set str 0000}
			1 {set str 0001}
			2 {set str 0010}
			3 {set str 0011}
			4 {set str 0100}
			5 {set str 0101}
			6 {set str 0110}
			7 {set str 0111}
			8 {set str 1000}
			9 {set str 1001}
			a -
			A {set str 1010}
			b -
			B {set str 1011}
			c -
			C {set str 1100}
			d -
			D {set str 1101}
			e -
			E {set str 1110}
			f -
			F {set str 1111}
		}
		append ret_str $str
	}
	return $ret_str
}
#*******************************************
# Load Lpc file
#*******************************************
proc LoadLPCParameter {core_name para_file {flag 0}} {
	global Para
	if [catch {open $para_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $para_file." \
			-title "Open file error - LoadDefaultParameter" \
			-type ok
		#set err_msg "ERROR - Cannot open $para_file."
		puts "ERROR - Cannot open $para_file."
		#set Para(msg) $msg
		#SendMessage $err_msg
		return -1
		#exit
	}

        while {[gets $fileid line] >= 0} {
            if {[string first "CoreName" $line] > -1} {
                set temp $line
                regexp {([^=]*)=(.*)} $temp match parameter value
                if {[string compare -nocase $value $core_name] != 0} {
                    #set Para(msg) "Core name found in the lpc file, $value, does not match the selected core type, %core_name."
                    puts "Core name found in the lpc file, $value, does not match the selected core type, %core_name."
                    return -1
                }
            }
        }

	seek $fileid 0 start
	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[Device\]"] == 0} {
			continue
		}
		if {[string compare -nocase $line "\[IP\]"] == 0} {
			continue
		}
		if {[string compare -nocase $line "\[Parameters\]"] == 0} {
			set flag 0
			continue
		}
		if {$flag == 0} {
			if [regexp {([^=]*)=(.*)} $line match parameter value] {
				if [regexp {([ |\t]*;)} $parameter match] {continue}
				if [regexp {(.*)[ |\t]*;} $value match temp] {
					set Para($parameter) $temp
				} else {
					set Para($parameter) $value
				}
			}
		}
	}
	close $fileid
	catch LoadParaCB
}
#*******************************************
# log base 2
#*******************************************
proc log2 {x}  {
	set y [log10(x)/log10(2)]
	return $y
}

#*******************************************
# Get length of bin var
#*******************************************
proc GetBinLen {x}  {
global Para
	if {$x<=0}  {
		return 1
	}

	set y [format %x $x]
	set y [Hex2Bin $y]
	set y [string trimleft $y 0]
	set len [string length $y]
	return $len
}
#*******************************************
# Set the output file name
#*******************************************
proc SetOutputFilesCB {} {
	global Para output_files_list

	set output_files_list ""
	if {![info exists Para(ModuleName)] || $Para(ModuleName)==""} return

	set output_files_list [list "$Para(ModuleName).lpc"]
	if {$Para(NetList)==1} {
		lappend output_files_list "$Para(ModuleName).ngo"
		if {$Para(SourceFormat)=="Schematic/VHDL"} {
			lappend output_files_list "$Para(ModuleName)_comp.vhd" "$Para(ModuleName)_inst.vhd"
		}
		if {$Para(SourceFormat)=="Schematic/Verilog HDL"} {
			lappend output_files_list "$Para(ModuleName)_comp.v" "$Para(ModuleName)_inst.v"
		}
	}
	if {$Para(SimInst)} {
		lappend output_files_list "fir_core_sim_inst.v"
	}
}
#*******************************************
# Adjust pin list
#*******************************************
proc AdjustPins {} {
	global Para
	global pin_name_list pin_direction_list bus_width_list pin_side_list

######################### ModuleName must not contain spaces ###########################

	if {[string last " " $Para(ModuleName)] < 0} {
			} else {
			set answer [tk_messageBox -icon error \
 				-message "File Name may not contain any spaces!" \
 				-title "Error" \
 				-type ok]
 			exit
	}
########################################################################################

########################## Check for existing ModuleName ###############################

	if [file exists $Para(ProjectPath)/fir_core_eval/$Para(ModuleName)] {
			set answer [tk_messageBox -icon warning \
 				-message "IP generation will overwrite existing IP core\n\
                                 \"$Para(ModuleName)\" design files and eval directory!\n\
                                 Continue?" \
 				-title "Warning" \
 				-type yesno]
 			if {$answer == "yes"} {
				file delete -force $Para(ProjectPath)/fir_core_eval/$Para(ModuleName)
			} else {
			exit
			}
		}
########################################################################################


	set Para(RowsPerOut) [expr int(ceil(double($Para(nTap))/($Para(nMult)*$Para(nIFactor))))]
	set Para(Rows) [expr $Para(RowsPerOut) * $Para(nIFactor)]
	set Para(CWidth) [GetBinLen [expr $Para(nChan) - 1]]
	set Para(AWidth) [GetBinLen [expr $Para(Rows) - 1]]
	set Para(Log2M) [expr ($Para(nMult) > 1)? [GetBinLen [expr $Para(nMult) - 1]] : 0 ]
	set Para(MW) [expr $Para(DWidth)*$Para(nMult)]
	set Para(RAdrSz) [expr $Para(CWidth) + $Para(AWidth)]
	set Para(WAdrSz) [expr $Para(RAdrSz) + $Para(Log2M)]
	set Para(DSize) [GetBinLen [expr $Para(nDFactor) - 1]]
	set Para(ISize) [GetBinLen [expr $Para(RowsPerOut) - 1]]

	if {$Para(Memory)==0} {
		set pin_name_list {clk rst "" \
						   crdy irdy din chan_in "" \
		                   numtaps_r interp_r decim_r "" \
						   coeffwr coeffaddr coeffwdat \
						   "" "" "" "" "" "" \
						   "" "" "" "" \
						   ordy dout chan_out "" "" math_err seq_err \
						   "" "" "" "" "" \
						   "" ""}
		set pin_direction_list {0 0 0 \
								1 0 0 0 0 \
								0 0 0 0 \
								0 0 0 \
								0 0 0 0 0 0 \
								1 1 1 1 \
								1 1 1 1 1 1 1 1 \
								1 1 1 1 1 \
						        1 1}
		set bus_width_list     {0 0 0 \
		                        0 0 $Para(DWidth) $Para(CWidth) 0 \
								$Para(AWidth) $Para(ISize) $Para(DSize) 0 \
								0 $Para(WAdrSz) $Para(DWidth) \
								0 0 0 0 0 0 \
								0 0 0 0 \
								0 $Para(OWidth) $Para(CWidth) 0 0 0 0 0 \
								0 0 0 0 0 \
								0 0}
		set pin_side_list {21 19}
	} else {
		set pin_name_list {clk rst "" \
						   crdy irdy din chan_in "" \
		                   numtaps_r interp_r decim_r "" \
						   taprack tap_in "" \
						   "" "" "" "" coeffrack coeff_in \
						   "" "" "" "" \
						   ordy dout chan_out "" "" math_err seq_err "" \
						   taprd tapraddr tapwr tapwaddr tap_out \
						   coeffrd coeffraddr}
		set pin_direction_list {0 0 0 \
								1 0 0 0 0 \
								0 0 0 0 \
								0 0 0 \
								0 0 0 0 0 0 \
								1 1 1 1 \
								1 1 1 1 1 1 1 1 \
								1 1 1 1 1 \
								1 1}
		set bus_width_list     {0 0 0 \
		                        0 0 $Para(DWidth) $Para(CWidth) 0 \
								$Para(AWidth) $Para(ISize) $Para(DSize) 0\
								0 $Para(MW) 0 \
								0 0 0 0 0 $Para(MW) \
								0 0 0 0 \
								0 $Para(OWidth) $Para(CWidth) 0 0 0 0 0 \
								0 $Para(RAdrSz) 0 $Para(RAdrSz) $Para(DWidth)\
								0 $Para(RAdrSz)}
		set pin_side_list {21 19}
	}
	if {$Para(nChan)>1} {
		set pin_name_list [lreplace $pin_name_list 6 6 "chan_in"]
		set pin_name_list [lreplace $pin_name_list 27 27 "chan_out"]
	} else {
		set pin_name_list [lreplace $pin_name_list 6 6 ""]
		set pin_name_list [lreplace $pin_name_list 27 27 ""]
	}
	if {$Para(Memory)==1} {
		set pin_name_list [lreplace $pin_name_list 12 12 "taprack"]
		set pin_name_list [lreplace $pin_name_list 13 13 "tap_in"]
		set pin_name_list [lreplace $pin_name_list 14 14 ""]
	} elseif {$Para(Coeff)==1} {
		set pin_name_list [lreplace $pin_name_list 12 12 "coeffwr"]
		set pin_name_list [lreplace $pin_name_list 13 13 "coeffaddr"]
		set pin_name_list [lreplace $pin_name_list 14 14 "coeffwdat"]
	} else {
		set pin_name_list [lreplace $pin_name_list 12 12 ""]
		set pin_name_list [lreplace $pin_name_list 13 13 ""]
		set pin_name_list [lreplace $pin_name_list 14 14 ""]
	}
	if {$Para(VarTap)==1} {
		set pin_name_list [lreplace $pin_name_list 8 8 "numtaps_r"]
	} else {
		set pin_name_list [lreplace $pin_name_list 8 8 ""]
	}
	if {$Para(VarDecim)==2} {
		set pin_name_list [lreplace $pin_name_list 10 10 "decim_r"]
	
	} else {
		set pin_name_list [lreplace $pin_name_list 10 10 ""]
	}
	if {$Para(VarInterp)==2} {
		if {$Para(RowsPerOut) > 1} {
			set pin_name_list [lreplace $pin_name_list 9 9 "interp_r"]
		} else {
			set pin_name_list [lreplace $pin_name_list 9 9 ""]
		}

		#set pin_name_list [lreplace $pin_name_list 9 9 "interp_r"]
	} else {
		set pin_name_list [lreplace $pin_name_list 9 9 ""]
	}
}

#######################################################################################
#######################################################################################

proc CheckValues {}  {
	global Para

	# return value is 1 by default
	set ret 1
	#set Para(msg) ""
	set Para(nILBin) [expr $Para(DWidth)-$Para(nIRBin)]
	set Para(nTapLBin) [expr $Para(DWidth)-$Para(nTapRBin)]
	set Para(nOLBin) [expr $Para(OWidth)-$Para(nORBin)]
#		    .spinnORBin config -state normal -textbackground white

	#NUM_CHAN is limited to 256
	if {$Para(nChan) > 256}  {
#		set Para(nChan) 256
		set msg "ERROR: Number of Channels can not exceed 256.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#append Para(msg) $msg
		#MyMessage $msg
		set ret -1
	} else  {
		set Para(nChan) $Para(nChan)
	}

	#NUM_TAP must be between 2 and 2048
	if {$Para(nTap) < 2}  {
		set msg "ERROR: Number of Taps must be between 2 and 2048.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#append Para(msg) $msg
		#MyMessage $msg
#		set Para(nTap) 2
		set ret -1
	}
	if {$Para(nTap) > 2048}  {
		set msg "ERROR: Number of Taps must be between 2 and 2048.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
#		set Para(nTap) 2048
		set ret -1
	}

	# maximum multipliers
	if {$Para(nTap) > 32}  {
		set maxMult 32
	} else  {
		set maxMult $Para(nTap)
	}

	#NUM_MULT must not exceed NUM_TAP.
	if {$Para(nMult) > $Para(nTap)}  {
		set msg "ERROR: Number of Multipliers can not exceed Number of Taps.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
#		set Para(nMult) $maxMult
		set ret -1
	}

	#NUM_MULT must not exceed 32.
	if {$Para(nMult) > 32}  {
		set msg "ERROR: Number of Multipliers can not exceed 32.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
#		set Para(nMult) $maxMult
		set ret -1
	}

	#NUM_MULT is limited to 8 if DWIDTH > 18
	if {$Para(DWidth) > 18}  {
#		.spinnMult config -state normal -textbackground white\
#					-decrement "[list myspin .spinnMult -1 1 8];CheckValues"\
#					-increment "[list myspin .spinnMult 1 1 8];CheckValues"
		if {$Para(nMult) > 8} {
			set msg "ERROR: Number of Multipliers can not exceed 8 for Data Widths > 18.\n"
			tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
			#MyMessage $msg
			#append Para(msg) $msg
#                        set Para(nMult) 8
			set ret -1
		}
	} else  {
#		.spinnMult config -state normal -textbackground white\
#					-decrement "[list myspin .spinnMult -1 1 $maxMult];CheckValues"\
#					-increment "[list myspin .spinnMult 1 1 $maxMult];CheckValues"
	}



	# Saturation is invalid if
	#    OWIDTH >= [(DWIDTH*2) + log2(NUM_TAP)+ (INPUT_BIN_PT_Tap + INPUT_BIN_PT_COEFF - nORBin)]
#	set x [expr log10($Para(nTap))/log10(2)]
#	set x [expr $x+$Para(DWidth)*2 + $Para(nIRBin) + $Para(nTapRBin)- $Para(nORBin)]
#	if {$Para(OWidth) >= $x}  {
#		set Para(Saturation) 0
#		.rdo1Saturation config -state disabled
#		.rdo2Saturation config -state disabled
#	} else  {
#		.rdo1Saturation config -state normal
#		.rdo2Saturation config -state normal
#	}

	#If Para(nOLBin) is greater than or equal to (INPUT_BIN_PT_Tap + INPUT_BIN_PT_COEFF), ROUND_NEAR and ROUND_CONV are not valid
	set x [expr $Para(nIRBin)+$Para(nTapRBin)]
#	if {$Para(nORBin) >= $x}  {
#		set Para(Round)  0
#		.rdo1Round config -state disabled
#		.rdo2Round config -state disabled
#		.rdo3Round config -state disabled
#	} else  {
# 		.rdo1Round config -state normal
#		.rdo2Round config -state normal
#		.rdo3Round config -state normal
#		set Para(Round)  1
#	}

	# if INTERNAL MEMORY is defined, enable the Coefficient update box,
	# else the Coefficient update box should be disabled
	if {$Para(Memory)==0} {
#		.ckCoeff config -state normal
#		.entryCoeffFile config -state normal -textbackground white
	} else {
		set Para(Coeff) 0
#		.ckCoeff config -state disabled
#		.entryCoeffFile config -state disabled -textbackground grey80
	}

	#The Interpolation list box provides a choice between "None", "Fixed", and "Variable".
	#If "None" is selected, IFACTOR is defined as 1.
	#If "Fixed" is selected, IFACTOR takes the value contained in the text box.
	#If "Variable" is selected, VAR_INTERP is defined, and IFACTOR takes the value defined in the text box.
	# maximum IFACTOR
	if {$Para(nTap) > 256}  {
		set maxIF 256
	} else  {
		set maxIF $Para(nTap)
	}

	#Interpolation factor is limited to the lesser of 256 and NUM_TAP
	if {$Para(nIFactor) > $Para(nTap)} {
#		set Para(nIFactor) 1
		set msg "ERROR: Interpolation Factor can not exceed Number of Taps.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
		set ret -1
	}
	if {$Para(nIFactor) > 256} {
#		set Para(nIFactor) 1
		set msg "ERROR: Interpolation Factor can not exceed 256.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
		set ret -1
	}

	if {$Para(VarInterp) > 0}  { #Var
#		.spinnIFactor config -state normal -textbackground white\
#					-decrement "[list myspin .spinnIFactor -1 1 $maxIF];CheckValues"\
#					-increment "[list myspin .spinnIFactor 1 1 $maxIF];CheckValues"

	} else  {
#		if {$Para(VarInterp) == 0}  { #none
#			set Para(nIFactor) 1
#		}
#		.spinnIFactor config -state disabled -textbackground grey80
	}

	#Decimation factor is limited to 256
	if {$Para(nDFactor) > 256} {
#		set Para(nDFactor) 256
		set msg "ERROR: Decimation Factor can not exceed 256.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
		set ret -1
	}

	#The Decimation list box provides a choice between "None", "Fixed", and "Variable".
	#If "None" is selected, DFACTOR is defined as 1.
	#If "Fixed" is selected, DFACTOR takes the value contained in the text box.
	#If "Variable" is selected, VAR_DECIM is defined, and IFACTOR takes the value defined in the text box.
	if {$Para(VarDecim) > 0}  { #var
#		.spinnDFactor config -state normal -textbackground white\
#					-decrement "[list myspin .spinnDFactor -1 1 256];CheckValues"\
#					-increment "[list myspin .spinnDFactor 1 1 256];CheckValues"

	} else  {
		if {$Para(VarDecim) == 0}  { #none
			set Para(nDFactor) 1
		}
#		.spinnDFactor config -state disabled -textbackground grey80
	}

	#Data width must be between 2 and 36
	if {$Para(DWidth) < 2}  {
#		set Para(DWidth) 2
		set msg "ERROR: DWIDTH must be 2 or greater.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
		set ret -1
	}
	if {$Para(DWidth) > 36}  {
#		set Para(DWidth) 36
		set msg "ERROR: DWIDTH can not exceed 36.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
		set ret -1
	}

	#Coefficient (nIRBin) and tap (nTapRBin) binary point settings
#	.spinnIRBin config -decrement "[list myspin .spinnIRBin -1 0 $Para(DWidth)];CheckValues"\
#						-increment "[list myspin .spinnIRBin 1 0 $Para(DWidth)];CheckValues"
#	.spinnTapRBin config -decrement "[list myspin .spinnTapRBin -1 0 $Para(DWidth)];CheckValues"\
#						-increment "[list myspin .spinnTapRBin 1 0 $Para(DWidth)];CheckValues"

	#Binary point may not exceed data width
	if {$Para(nIRBin)>$Para(DWidth)}  {
#		set Para(nIRBin) 0
		set msg "ERROR: Binary point can not exceed Data Width.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
		set ret -1
	}
	if {$Para(nTapRBin)>$Para(DWidth)}  {
#		set Para(nTapRBin) 0
		set msg "ERROR: Binary point can not exceed Data Width.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
		set ret -1
	}

	#number of bits left of binary is DWIDTH - binary_point
	set Para(nILBin) [expr $Para(DWidth)-$Para(nIRBin)]
	set Para(nTapLBin) [expr $Para(DWidth)-$Para(nTapRBin)]

	#number of bits for full precision -- read only
	set Para(nPrec) [expr $Para(DWidth)*2+[GetBinLen [expr $Para(nTap)-1]]]

	#Output settings
	set min 2
	set max 72
	if {$Para(nPrec) < 72} {
		set max $Para(nPrec)
	}

#	.spinOWidth config -decrement "[list myspin .spinOWidth -1 $min $max];CheckValues"\
#						-increment "[list myspin .spinOWidth 1 $min $max];CheckValues"

#	.spinnORBin config -decrement "[list myspin .spinnORBin -1 0 $Para(OWidth)];CheckValues"\
#						-increment "[list myspin .spinnORBin 1 0 $Para(OWidth)];CheckValues"

	#OWIDTH is the lesser of 72 and full precision
	if {$Para(OWidth)>(72)}  {
#		set Para(OWidth) 72
		set msg "ERROR: Output Width can not exceed 72.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
		set ret -1
	}
	if {$Para(OWidth)>$Para(nPrec)}  {
#		set Para(OWidth) $Para(nPrec)
		set msg "ERROR: Output Width can not exceed full precision width.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
		set ret -1
	}

	#Binary point may not exceed data width
	if {$Para(nORBin)>$Para(OWidth)}  {
#		set Para(nORBin) 0
		set msg "ERROR: Output binary point can not exceed output data width.\n"
		tk_messageBox -default ok -icon error -message $msg -title "Error" -type ok
		#MyMessage $msg
		#append Para(msg) $msg
		set ret -1
	}
	#number of bits left of binary is OWIDTH - binary_point
	set Para(nOLBin) [expr $Para(OWidth)-$Para(nORBin)]

	#output data type (display only)
	if {$Para(DType) == 1} {
		set Para(ODType) "Unsigned"
	}
	if {$Para(DType) == 2} {
		set Para(ODType) "Signed"
	}

############################################# TEST STUFF #############################
	if [file exists $Para(ProjectPath)/fir_core/$Para(ModuleName)] {
			set answer [tk_messageBox -icon warning \
 				-message "IP generation will overwrite existing IP core\n\
                                 \"$Para(ModuleName)\" design files and eval directory!\n\
                                 Continue?" \
 				-title "Warning" \
 				-type yesno]
 			if {$answer == "yes"} {
				file delete -force $Para(ProjectPath)/fir_core/$Para(ModuleName)
			} else {
			exit
			}
		}
#######################################################################################

	# either Coeff or CoeffFile must be set
	if {$Para(Coeff) == 0} {
		if {[string equal -nocase $Para(CoeffFile) ""]} {
			set msg "ERROR: No coefficient file specified.\n\
				Need to enable coefficient update\n\
				or provide coefficient file.\n"
			tk_messageBox -default ok -icon error -message \
					$msg -title "Error" -type ok
			#MyMessage $msg
			#append Para(msg) $msg
			#puts $msg
			set ret -1
		}
	} 

	return $ret
}
