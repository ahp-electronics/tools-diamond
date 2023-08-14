#$Header: L:/module/ram_dp/machxo2/gui/core_template.tcl 1.7 mghuang Exp $

#Rev 1.7: Diamond 3.1 IPExpress: Fixed SOF-118756
#Rev 1.6: Diamond 3.1 IPExpress: XO3 support
# Rev 1.5: Diamond 2.0.1 IPExpress: Fixed CR_57842
# Rev 1.4: 8.1s1 IPExpress: Fixed #49829
#Rev 1.1: UM Rev 3.11, #48730
# Rev 1.2: Fixed #48134
# Rev 1.3: Fixed cr_48848

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	#28189
	if {$Para(RAddress) > 0 &&
		$Para(RData) > 0 &&
		$Para(WAddress) > 0 &&
		$Para(WData) > 0 }  {DrawPins}
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
	
	set Para(RData) [string trimleft $Para(RData) 0]
	set Para(WData) [string trimleft $Para(WData) 0]
	if {$Para(RData) == "" || $Para(WData) == "" || $Para(RData) == 0 || $Para(WData) == 0} {
		set x 0
	} else {
		set x [expr $Para(RData)/$Para(WData)]
	}
	
	if {$Para(WData) < 9} {
		set Para(enByte) 0
		.cbByte config -state disabled
		.cboByte config -state disabled
	}
	if {$Para(WData) == 9 && $x <= 2} {
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
	if {$Para(WData) > 9 && $x <= 2} {
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
		.cbClkEn config -state normal
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
		.cbClkEn config -state disabled
		set Para(ClockEn) 0
		.rdo1Assert config -state disabled
		.rdo2Assert config -state disabled
		.rdo1Release config -state disabled
		.rdo2Release config -state disabled
	}
	
	if {$Para(Init) == "mem"} {
		.entMemFile config -state normal
		.btnMemFile config -state normal
		.lblFormat  config -state normal
		.rdo1Format config -state normal 
		.rdo2Format config -state normal 
		.rdo3Format config -state normal 
	} else {
		.entMemFile config -state disabled
		.btnMemFile config -state disabled
		.lblFormat  config -state disabled
		.rdo1Format config -state disabled 
		.rdo2Format config -state disabled 
		.rdo3Format config -state disabled 
	}

	if {$Para(RData) > 64 || $Para(WData) > 64} {
		if {$Para(EnECC) == "1"} {
			set tit "Warning"
			set msg "Enable ECC option is not supported for Data Width > 64."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		}
		.ckEnECC config -state disable
		set Para(EnECC) 0
	} else {
		if {$Para(RData) != $Para(WData)} {
			.ckEnECC config -state disable
			set Para(EnECC) 0
		} else {
			.ckEnECC config -state normal
		}
	}
	
	#49829
	if {$Para(Init) == "1"} {
		.ckEnECC config -state disable
		set Para(EnECC) 0
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
		.cbno_init config -text "No initialization(power up with random data),\nfor PUF simulation,please select the initialization for all 0's,all 1's or Memory file." 
	} else {
		.cbinit_data config -state disabled
		.frmInit config -labeltext "Initialization for PUF simulation only"
		.cbno_init config -text "No initialization(power up with random data)" 
		set Para(init_data) 0
	}
}
	
	

	CallDrawPins
}

proc DRC4XP {}  {
	global Para

	set tit "Check Parameter"
	set msg "Read-before-Write is supported for memory configurations in x9, x18, x36 datawidth.\nData width should be set to match this requirement."
	if {$Para(CoreName)=="RAM_DQ"} {
		if {$Para(Write) == "ReadBeforeWrite"}  {
			if {[expr $Para(RData)%9] != 0}  {
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			} 
		} 
	}
	return 0
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

	set ret [IsInRange "Read Address Depth" 2 65536 $Para(RAddress)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Read Data Width" 1 256 $Para(RData)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Write Address Depth" 2 65536 $Para(WAddress)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Write Data Width" 1 256 $Para(WData)]
	if {$ret == -1} {return -1}

	set ret [DRC4XP]
	if {$ret == -1}  {return -1}

	if [string length $Para(MemFile)] {
		if {[file exists $Para(MemFile)] == "0"} {
			set msg "Memory file $Para(MemFile) doesn't exist!"
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
	}

	#! CR_57842, XO2/LPTM2 RAM_DP, allow W/R ratio 1 and 2
	if {$Para(enByte) == 1} {
		set x 0
		if {$Para(RData) > 0 && $Para(WData) > 0 }  {
			set x [expr $Para(WData)/$Para(RData)]
		}
		if {$x != "1" && $x != "2"} {
			set msg "The ratio of (Write Width/Read Width) should be 1 or 2 when Byte Enables is set."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
	}

	if {$Para(RData) == "" || $Para(WData) == "" || $Para(RData) == 0 || $Para(WData) == 0} {
		set x 0
	} else {
		if {$Para(RData) > $Para(WData)} {
			set x [expr $Para(RData)/$Para(WData)]
		} else {
			set x [expr $Para(WData)/$Para(RData)]
		}
	}
	set msg "Ratio of Data Width values (Width/Width) cannot be greater than 16."
	if {$x > 16}  {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
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

	set str "-arch $Para(arch) -type ramdps"
	lappend str -device $Para(PartType)
	set Para(RAddress) [string trimleft $Para(RAddress) 0]
	set Para(WAddress) [string trimleft $Para(WAddress) 0]
	lappend str -raddr_width [expr int(ceil(log($Para(RAddress))/log(2)))] -rwidth $Para(RData)
	lappend str -waddr_width [expr int(ceil(log($Para(WAddress))/log(2)))] -wwidth $Para(WData)
	lappend str -rnum_words $Para(RAddress)
	lappend str -wnum_words $Para(WAddress)
	if {$Para(enByte) == "1"} {lappend str -byte $Para(ByteSize)}
	if {$Para(OutputEn) == "1"} {lappend str -outdata REGISTERED}  
	if {$Para(ClockEn) == "1"} {lappend str -out_enable_1}
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
	if {$Para(Init) == "0"} {lappend str -mem_init0}
	if {$Para(Init) == "1"} {lappend str -mem_init1}
	if {$Para(Init) == "mem"} {
		if [string length $Para(MemFile)] {
			append str " -memfile \"$Para(MemFile)\" -memformat $Para(MemFormat)"
		}
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
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	AttributeSetting 460 560
} else  {
	AttributeSetting 460 530
}
	
	set pin_flag 1
	DrawImage 220 300
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***
	#--- Page #1 ---
		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties ;#-labeltext "Properties" -labelpos nw
		set frmProperty [.frmProperties childsite]
		
		#*** Size of block RAM ***
		label .lblSize -text "Specify the size of the RAM_DP" 
		
		iwidgets::Labeledframe .frmRead -labeltext "Read Port" -labelpos nw
		set frmRead [.frmRead childsite]
		iwidgets::entryfield .entRAddress -labeltext "Address Depth" -textvariable Para(RAddress) -width 8 -validate {digit %c} -fixed 6
		label .lblRAddress -text "(2-65536)"
		iwidgets::entryfield .entRData -labeltext "Data Width" -textvariable Para(RData) -width 8 -validate {digit %c} -fixed 4
		.entRData.label config -width 16 -justify right
		label .lblRData -text "(1-256)"
		pack .entRAddress .lblRAddress .entRData .lblRData -in $frmRead -side left
		.entRAddress.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
		.entRData.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

		iwidgets::Labeledframe .frmWrite -labeltext "Write Port" -labelpos nw
		set frmWrite [.frmWrite childsite]
		iwidgets::entryfield .entWAddress -labeltext "Address Depth" -textvariable Para(WAddress) -width 8 -validate {digit %c} -fixed 6
		label .lblWAddress -text "(2-65536)"
		iwidgets::entryfield .entWData -labeltext "Data Width" -textvariable Para(WData) -width 8 -validate {digit %c} -fixed 4
		.entWData.label config -width 16 -justify right
		label .lblWData -text "(1-256)"
		pack .entWAddress .lblWAddress .entWData .lblWData -in $frmWrite -side left
		.entWAddress.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
		.entWData.lwchildsite.entry config -validate key -vcmd {
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
		checkbutton .cbClkEn -text "Enable Output ClockEn" -variable Para(ClockEn) -command {ChangeValueCmd}
		pack .cbOutputEn .cbClkEn -in .frmOutput -side left -padx 10

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
			checkbutton .cbno_init -text "No initialization(power up with random data),\nfor PUF simulation,please select the initialization for all 0's,all 1's or Memory file."  -justify left -variable Para(no_init) -command {ChangeValueCmd} 
			pack .cbno_init -in .frmNoInit -side left -padx 10
		}
		
		#*** Mem File ***
		iwidgets::Labeledframe .frmInit -labeltext "Initialization" -labelpos nw
		set frmInit [.frmInit childsite]
		radiobutton .rdo1Init -text "Initialize to all 0's" -value 0 -variable Para(Init) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Init -text "Initialize to all 1's" -value 1  -variable Para(Init) -anchor w -command {ChangeValueCmd}
		frame .frmRdo3
		radiobutton .rdo3Init -text "Memory File" -value mem  -variable Para(Init) -anchor w -command {ChangeValueCmd}
		iwidgets::entryfield .entMemFile -labeltext "" -textvariable Para(MemFile) -labelpos w -width 30
		button .btnMemFile -text "..." -width 2 -command {
			set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
			if {$ret != "" }  {
				set Para(Mem_File) $ret
				Convert $ret
			} 
		}
		pack .rdo3Init .entMemFile .btnMemFile -in .frmRdo3 -side left
		frame .frmFormat
		label .lblFormat -text "Memory File Format:"
		radiobutton .rdo1Format -text "Binary" -value bin -variable Para(MemFormat) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Format -text "Hex" -value hex  -variable Para(MemFormat) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo3Format -text "Addressed Hex" -value orca  -variable Para(MemFormat) -anchor w -command {ChangeValueCmd}
		pack .lblFormat .rdo1Format .rdo2Format .rdo3Format -in .frmFormat -side left -padx 10
		checkbutton .cbinit_data  -text "Allow update of initialization file stored in UFM"  -variable Para(init_data) -command {ChangeValueCmd}
		
		pack .rdo1Init .rdo2Init .frmRdo3 .frmFormat -in $frmInit -fill x -anchor w
		pack .cbinit_data -in $frmInit -anchor w -padx 10
		
		checkbutton .ckEnECC -text "Enable ECC (not supported for Data Width > 64)" -variable Para(EnECC) -command {ChangeValueCmd}
		iwidgets::combobox .cboPipeline -labeltext "Pipeline Stages for Q and ERROR Outputs" -textvariable Para(Pipeline) -width 4 -editable false \
			-selectioncommand {ChangeValueCmd}
		.cboPipeline insert list end 0 1 2
		
		pack .lblSize 		-in $frmProperty -anchor w
		pack .frmRead	 	-in $frmProperty -fill x -anchor w
		pack .frmWrite	 	-in $frmProperty -fill x -anchor w
		pack .frmByte 		-in $frmProperty -fill x -anchor w
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