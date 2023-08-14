#$Header: L:/module/rom/machxo2/gui/core_template.tcl 1.4 mghuang Exp $

#Rev 1.4: Diamond 3.1 IPExpress: XO3 support
#History.
# Rev 1.1
# MachXO2 Memory Usage Model 3.07.doc
# Fixed CR_48022
# Rev 1.2: UM Rev 3.11, #47915,48212
# Rev 1.3: Fixed #48134

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	#28189
	if {$Para(Address) > 0 &&
		$Para(Data) > 0 }  {DrawPins}
} 

proc GetTopicCB {} {
	global Para

	set Para(topic) ""
}

proc ChangeResetCmd {} {
	global Para
	if {$Para(Reset) == "Async"} {
		set tit "Reset Mode"
		set msg "All EBR operation is halted during reset in synchronous mode, but writes \
		\nmay continue during reset in asynchronous mode."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
	}
}

proc ChangeValueCmd {}  {
	global Para
	
	if {$Para(Data) < 9} {
		set Para(enByte) 0
		.cbByte config -state disabled
		.cboByte config -state disabled
	}
	if {$Para(Data) == 9} {
		.cbByte config -state normal
		set Para(ByteSize) 8
		if {$Para(enByte) == "1"} {
			.cboByte config -state normal
			.cboByte clear list
			.cboByte insert list end 8
		} else {
			.cboByte config -state disabled
		}
	}
	if {$Para(Data) > 9} {
		.cbByte config -state normal
		if {$Para(enByte) == "1"} {
			.cboByte config -state normal
			.cboByte clear list
			.cboByte insert list end 8 9
		} else {
			.cboByte config -state disabled
		}
	}

	if {$Para(enByte) == "1"} {
		.cboByte config -state normal
	} else {
		.cboByte config -state disabled
	}

	if {$Para(OutputEn) == "1"} {
		.rdo1Assert config -state normal
		.rdo2Assert config -state normal
		if {$Para(Reset) == "Async"} {
			.rdo1Release config -state normal
			.rdo2Release config -state normal
		} else {
			.rdo1Release config -state disabled
			.rdo2Release config -state disabled
		}
	} else {
		.rdo1Assert config -state disabled
		.rdo2Assert config -state disabled
		.rdo1Release config -state disabled
		.rdo2Release config -state disabled
	}
	
	if {$Para(Data) > 64} {
		if {$Para(EnECC) == "1"} {
			set tit "Warning"
			set msg "Enable ECC option is not supported for Data Width > 64."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		}
		.ckEnECC config -state disable
		set Para(EnECC) 0
	} else {
		.ckEnECC config -state normal
	}

	if {$Para(EnECC) == 0} {
		.cboPipeline config -state disabled
	} else {
		.cboPipeline config -state normal
	}
	
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {

	if {$Para(no_init) == 0} {
		.cbinit_data config -state normal
		.frmInit config -labeltext "Initialization"
		.cbno_init config -text "No initialization(power up with random data),\nfor PUF simulation,please select the initialization for Memory file." 
	} else {
		.cbinit_data config -state disabled
		.frmInit config -labeltext "Initialization for PUF simulation only"
		.cbno_init config -text "No initialization(power up with random data)" 
		set Para(init_data) 0
	}
}

	CallDrawPins
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para

	set tit "Check Parameter"

	set ret [IsInRange "Address Depth" 2 65536 $Para(Address)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width" 1 256 $Para(Data)]
	if {$ret == -1} {return -1}

	if {[string length $Para(MemFile)] == 0} {
		set msg "Please specify memory file for ROM!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} else {
		if {[file exists $Para(MemFile)] == "0"} {
			set msg "Memory file $Para(MemFile) doesn't exist!"
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
	}

	return $ret
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para

	set str "-arch $Para(arch) -type romblk"
	lappend str -device $Para(PartType)
	set Para(Address) [string trimleft $Para(Address) 0]
	lappend str -addr_width [expr int(ceil(log($Para(Address))/log(2)))] -data_width $Para(Data)
	lappend str -num_words $Para(Address)
	if {$Para(OutputEn) == "1"} {lappend str -outdata REGISTERED}  
	if {$Para(Optimization) == "Area"} {
		lappend str -cascade 11
	} else {
		lappend str -cascade -1
	}
	if {$Para(OutputEn) == "1"} {
		lappend str -resetmode [string toupper $Para(Reset)]
		if {$Para(Reset) == "Async"} {
			lappend str -reset_rel [string toupper $Para(Reset1)]
		} else {
			lappend str -sync_reset
		}
	}
	if [string length $Para(MemFile)] {
		append str " -memfile \"$Para(MemFile)\" -memformat $Para(MemFormat)"
	}
	
	if {$Para(init_data) == 1} {lappend str -init_data DYNAMIC}
	
	if {$Para(EnECC) == "1"} {lappend str -eccmode $Para(Pipeline)}

	
	if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
		if {$Para(no_init) == 1} {lappend str -no_init}
	}
	
#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

#*** set private value ***
set mem_types {
	{"Memory files"		{.mem}	}
	{"All files"		{*.*}	}
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface
	#AttributeSetting 460 460

	AttributeSetting 460 460


	set pin_flag 1
	DrawImage 220 300
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***
	#--- Page #1 ---
		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties ;#-labeltext "Properties" -labelpos nw
		set frmProperty [.frmProperties childsite]
		
		#*** Size of block RAM ***
		label .lblSize -text "Specify the size of the ROM" 
		
		iwidgets::Labeledframe .frmAddData -labelpos nw
		set frmAddData [.frmAddData childsite]
		iwidgets::entryfield .entAddress -labeltext "Address Depth" -textvariable Para(Address) -width 8 -validate {digit %c} -fixed 6
		label .lblAddress -text "(2-65536)"
		iwidgets::entryfield .entData -labeltext "Data Width" -textvariable Para(Data) -width 8 -validate {digit %c} -fixed 4
		.entData.label config -width 16 -justify right
		label .lblData -text "(1-256)"
		pack .entAddress .lblAddress .entData .lblData -in $frmAddData -side left
		.entAddress.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
		.entData.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

		#*** Byte Enable ***
		frame .frmByte
		checkbutton .cbByte -text "Provide Byte Enables" -variable Para(enByte) -command {ChangeValueCmd}
		iwidgets::combobox .cboByte -labeltext "Byte Size" -textvariable Para(ByteSize) -width 4 -editable false -selectioncommand {ChangeValueCmd}
		.cboByte insert list end 8 9
		pack .cbByte .cboByte -in .frmByte -side left -padx 10
		
		#*** checkbutton ***
		frame .frmOutput
		checkbutton .cbOutputEn  -text "Enable Output Register"  -variable Para(OutputEn) -command {ChangeValueCmd}
		pack .cbOutputEn -in .frmOutput -side left -padx 10

		frame .frmOptimize
		label .lblOptimize -text "Optimization"
		radiobutton .rdo1Optimize -text Area -width 8 -value Area -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Optimize -text Speed  -width 8 -value Speed  -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		pack .lblOptimize .rdo1Optimize .rdo2Optimize -in .frmOptimize -side left -padx 10

		#*** Reset Mode ***
		iwidgets::Labeledframe .frmReset -labeltext "Reset Mode" -labelpos nw
		set frmReset [.frmReset childsite]
		iwidgets::Labeledframe .frmAssert -labeltext "Assertion" -labelpos nw
		set frmAssert [.frmAssert childsite]
		radiobutton .rdo1Assert -text Async -width 8 -value Async -variable Para(Reset) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Assert -text Sync  -width 8 -value Sync  -variable Para(Reset) -anchor w -command {ChangeValueCmd}
		pack .rdo1Assert .rdo2Assert -in $frmAssert -side left -padx 10
		iwidgets::Labeledframe .frmRelease -labeltext "Release" -labelpos nw
		set frmRelease [.frmRelease childsite]
		radiobutton .rdo1Release -text Async -width 8 -value Async -variable Para(Reset1) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Release -text Sync  -width 8 -value Sync  -variable Para(Reset1) -anchor w -command {ChangeValueCmd}
		pack .rdo1Release .rdo2Release -in $frmRelease -side left -padx 10
		pack .frmAssert .frmRelease -in $frmReset -side left

		if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
			frame .frmNoInit
			checkbutton .cbno_init -text "No initialization(power up with random data),\nfor PUF simulation,please select the initialization for Memory file."  -justify left -variable Para(no_init) -command {ChangeValueCmd}
			pack .cbno_init -in .frmNoInit -side left -padx 10
		}
		#*** Mem File ***
		iwidgets::Labeledframe .frmInit -labeltext "Initialization" -labelpos nw
		set frmInit [.frmInit childsite]
#		radiobutton .rdo1Init -text "Initialize to all 0's" -value 0 -variable Para(Init) -anchor w -command {ChangeValueCmd}
#		radiobutton .rdo2Init -text "Initialize to all 1's" -value 1  -variable Para(Init) -anchor w -command {ChangeValueCmd}
		frame .frmRdo3
#		radiobutton .rdo3Init -text "Memory File" -value mem  -variable Para(Init) -anchor w -command {ChangeValueCmd}
		label .lblmemoryfile -text "Memory File"
		iwidgets::entryfield .entMemFile -labeltext "" -textvariable Para(MemFile) -labelpos w -width 30
		button .btnMemFile -text "..." -width 2 -command {
			set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
			if {$ret != "" }  {
				set Para(Mem_File) $ret
				Convert $ret
			} 
		}
		pack .lblmemoryfile .entMemFile .btnMemFile -in .frmRdo3 -side left -padx 10 -pady 2
		frame .frmFormat
		label .lblFormat -text "Memory File Format:"
		radiobutton .rdo1Format -text "Binary" -value bin -variable Para(MemFormat) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Format -text "Hex" -value hex  -variable Para(MemFormat) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo3Format -text "Addressed Hex" -value orca  -variable Para(MemFormat) -anchor w -command {ChangeValueCmd}
		pack .lblFormat .rdo1Format .rdo2Format .rdo3Format -in .frmFormat -side left -padx 10
		checkbutton .cbinit_data  -text "Allow update of initialization file stored in UFM"  -variable Para(init_data) -command {ChangeValueCmd}
		pack .frmRdo3 .frmFormat -in $frmInit -fill x -anchor w
		pack .cbinit_data -in $frmInit -anchor w -padx 10
		
		checkbutton .ckEnECC -text "Enable ECC (not supported for Data Width > 64)" -variable Para(EnECC) -command {ChangeValueCmd}
		iwidgets::combobox .cboPipeline -labeltext "Pipeline Stages for Q and ERROR Outputs" -textvariable Para(Pipeline) -width 4 -editable false \
			-selectioncommand {ChangeValueCmd}
		.cboPipeline insert list end 0 1 2
		
		pack .lblSize 		-in $frmProperty -anchor w
		pack .frmAddData 	-in $frmProperty -fill x -anchor w
		pack .frmOutput 	-in $frmProperty -fill x -anchor w -pady 4
		pack .frmOptimize 	-in $frmProperty -fill x -anchor w
		pack .frmReset 		-in $frmProperty -fill x -anchor w
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
		pack .frmNoInit		-in $frmProperty -fill x -anchor w -pady 4
}

		pack .frmInit 		-in $frmProperty -fill x -anchor w
		pack .ckEnECC 		-in $frmProperty -anchor w -padx 10
		pack .cboPipeline 	-in $frmProperty -anchor w -padx 30

	pack .frmProperties -in $page -side top -fill both -expand 1

	if {$Para(arch) == "xo3c00a"} {
		pack forget .cbinit_data
		set Para(init_data) 0
	}
	
	ChangeValueCmd
	#	$tnb view 0

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}