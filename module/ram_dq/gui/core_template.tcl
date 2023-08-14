#$Header: L:/module/ram_dq/gui/core_template.tcl 1.15 mghuang Exp $

#Rev 1.15: Diamond 2.0 IPExpress: Fixed CR_56142
#Rev 1.14: Diamond 1.2 IPExpress: Fixed CR_51865

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

proc SlayerHelp {}  {
	global Para
	if {[.tnb view] == 2}  {
		set Para(topic) "sc_ram_dq_advanced_tab.htm"
		return
	} 
} 

proc MagmaHelp {}  {
	global Para

	switch [.tnb view] {
		0 {set Para(topic) "general_options_tab.htm"}
		1 {
			set tmp [string tolower $Para(CoreName)]
			set Para(topic) "ec_ebr_$tmp"
			append Para(topic) "_configuration_tab.htm"
		}
	}
} 

proc GetTopicCB {} {
	global Para

	# modules: ram_dq & rom.
	# device: mg5g00, ep5g00, lc5kmx, or5s00, etc.
	# GUI has 3 tab:
	# 1. General Options Tab
	# 2. Configuration Tab (lc5kmx has only this Tab)
	# 3. Advanced Tab      (only for or5s00's ram_dq)
	switch $Para(arch)  {
		mg5g00 -
		mj5g00 -
		ep5g00 {MagmaHelp}
		or5s00 {SlayerHelp}
	} 
}

proc ChangeResetCmd {} {
	global Para
	if {$Para(Reset) == "Async"} {
		set tit "Reset Mode"
		set msg "The selected Reset Mode ASYNC has a limitation: \
		\nThe use of the EBR block asynchronous reset requires that certain timing be met \
		\nbetween the clock and the reset within the memory block. See the device specific \
		\ndatasheet for additional details."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
	}
}

proc ChangeValueCmd {}  {
	global Para

	set Para(Address) [string trimleft $Para(Address) 0]
	set Para(Data) [string trimleft $Para(Data) 0]
	
#6. Byte Enable Selection:
#a. If ¡°Write Port Data Width < 9¡±: ¡°Provide Byte Enables¡± and ¡°Byte Size¡± should be grayed
#out and not available for selection.
#b. If (¡°Write Port Data Width = 9¡±): ¡°Provide Byte Enables¡± should be available for selection
#and ¡°Byte Size¡± can only be 8.
#c. If (¡°Write Port Data Width > 9¡±): ¡°Provide Byte Enables¡± should be available for selection
#and ¡°Byte Size¡± can be 8 or 9.
	if {$Para(Data) < 9} {
		set Para(enByte) 0
		.cbByte config -state disabled
		.cboByte config -state disabled
	}
	if {$Para(Data) == 9} {
		.cbByte config -state normal
		set Para(ByteSize) 8
		#.cboByte config -state disabled
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

	if {$Para(Data)>64} {
		.ckEnECC config -state disable
		set Para(EnECC) 0
	} else {
		.ckEnECC config -state normal
	}
	
	if {$Para(enByte) == "1"} {
		.cboByte config -state normal
	} else {
		.cboByte config -state disabled
	}

	#cr_42180
	#"Read before Write" option should not be supported for SC/SCM/ECP2/ECP2M/ECP2S/ECP2MS/XP2
	#cr_56142: This feature is supported in ECP3 EA devices
	set arch_lst {slayer or5s00 or5s00m ep5a00 ep5a00s ep5m00 ep5m00s mg5a00 xo3c00h}
	if {[lsearch $arch_lst $Para(arch)] != -1 || ($Para(arch) == "ep5c00" && [string first "EA" $Para(PartType)] == -1)}  {
		.rdo3PortAWM config -state disabled
		
		if {$Para(Write) == "ReadBeforeWrite"} {
			set tit "Warning"
			set msg "The source LPC file contains \"Read before Write\" option and this option is not\n \
					 supported for this family. The option will be set to default \"Normal\" mode."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		}

		if {$Para(Write) == "ReadBeforeWrite"} {
			set Para(Write) Normal
		}
	} else {
		.rdo3PortAWM config -state normal
	}

	#note 3
	if {$Para(EnECC) == 0} {
		.cboPipeline config -state disabled
	} else {
		.cboPipeline config -state normal
	}

	CallDrawPins
}

proc DRC4XP {}  {
	global Para

	set tit "Check Parameter"
	set msg "Read-before-Write is supported for memory configurations in x9, x18, x36 datawidth.\nData width should be set to match this requirement."
	if {$Para(CoreName)=="RAM_DQ"} {
		if {$Para(Write) == "ReadBeforeWrite"}  {
			if {[expr $Para(Data)%9] != 0}  {
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			} 
		} 
	}
	return 0
} 

proc CheckMg5g00Para {}  {
	global Para

	set tit "Check Parameter"

	set MinAddWidth [GetMinAddWidthRange]
	set MaxAddWidth [GetMaxAddWidthRange]
	set MinDataWidth [GetMinDataWidthRange]
	set MaxDataWidth [GetMaxDataWidthRange]

	set ret [IsInRange "Address Depth" $MinAddWidth $MaxAddWidth $Para(Address)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width" $MinDataWidth $MaxDataWidth $Para(Data)]
	if {$ret == -1} {return -1}

	set ret [DRC4XP]
	if {$ret == -1}  {return -1}

	return 0
} 

proc CheckOr5s00Para {}  {
	global Para data_lst

	set MinAddWidth [GetMinAddWidthRange]
	set MaxAddWidth [GetMaxAddWidthRange]
	set MinDataWidth [GetMinDataWidthRange]
	set MaxDataWidth [GetMaxDataWidthRange]

	set ret [IsInRange "Address Depth" $MinAddWidth $MaxAddWidth $Para(Address)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width" $MinDataWidth $MaxDataWidth $Para(Data)]
	if {$ret == -1} {return -1}

	return 0
} 

proc GetMinDataWidthRange {} {
	return 1
}

proc GetMaxDataWidthRange {} {
    global Para

    switch $Para(CmdLine)  {
	EC_CMD -
	SC_CMD  {
		return 256
		}
	default {return 256}
    } 
}

proc GetMinAddWidthRange {} {
	return 2
}

proc GetMaxAddWidthRange {} {
    global Para

    switch $Para(CmdLine)  {
	EC_CMD {
		#ecp2,xp2 etc
		set dual_lst {ep5a00 ep5c00 ep5a00s ep5m00 ep5m00s mg5a00 xo3c00h}
		if {[lsearch $dual_lst $Para(arch)] != -1}  {
			return 131072
		} 
		#xo.
		if {$Para(arch) == "mj5g00"} {
			return 16384
		} 
		#xp, ec, ecp.
		return 65536
		}
	SC_CMD {return 131072}
	default {return 99999999}
     }
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

	switch $Para(CmdLine)  {
		EC_CMD  {set ret [CheckMg5g00Para ]}
		SC_CMD  {set ret [CheckOr5s00Para ]}
		default {set ret 0}
	} 

	if [string length $Para(MemFile)] {
		if {[file exists $Para(MemFile)] == "0"} {
			set msg "Memory file $Para(MemFile) doesn't exist!"
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
	}

	return $ret
}

proc GeneralCmdLine {}  {
	global Para
	if {$Para(CoreName)=="ROM"}  {
		set str "-arch $Para(arch) -type romblk"
	} else  {
		set str "-arch $Para(arch) -type ramdq"
	} 
	lappend str -addr_width $Para(Address) -data_width $Para(Data)
	lappend str -num_words [expr int(pow(2,$Para(Address)))]
	if {$Para(outPipeline) == "1"} {lappend str -outdata REGISTERED}  
	if {$Para(adPipeline) == "1"} {lappend str -adPipeline}
	if {$Para(inPipeline) == "1"} {lappend str -inPipeline}
	if {$Para(MOR) == "1"} {lappend str -outPipeline}

	if {$Para(enByte) == "1"} {lappend str -byte $Para(ByteSize)}
	
	if [string length $Para(MemFile)] {
		append str " -memfile \"$Para(MemFile)\" -memformat $Para(MemFormat)"
	}

	return $str
} 

proc Mg5g00CmdLine {}  {
	global Para
	if {$Para(CoreName)=="ROM"}  {
		set str "-arch $Para(arch) -type romblk"
	} else  {
		set str "-arch $Para(arch) -type ramdq"
	} 
	lappend str -device $Para(PartType)
#	lappend str -addr_width $Para(Address) -data_width $Para(Data)
#	lappend str -num_words [expr int(pow(2,$Para(Address)))]
	lappend str -addr_width [expr int(ceil(log($Para(Address))/log(2)))] -data_width $Para(Data)
	lappend str -num_words $Para(Address)
	if {$Para(outPipeline) == "1"} {lappend str -outdata REGISTERED}  
	if {$Para(adPipeline) == "1"} {lappend str -adPipeline}
	if {$Para(inPipeline) == "1"} {lappend str -inPipeline}
	if {$Para(MOR) == "1"} {lappend str -outPipeline}

	#lappend str -gsr [string toupper $Para(GSR)]
	if {$Para(CoreName)!="ROM"}  {
		if {($Para(arch) == "mg5a00" || $Para(arch) == "xo3c00h") && $Para(Write) == "ReadBeforeWrite"} {
			lappend str -writemode NORMAL
		} else {
			lappend str -writemode [string toupper $Para(Write)]
		}
	}
	if {$Para(arch) != "ep5c00"} {lappend str -resetmode [string toupper $Para(Reset)]}
	if {$Para(Pad)}  {lappend str -buffer} 

	if {$Para(enByte) == "1"} {lappend str -byte $Para(ByteSize)}
	
	if [string length $Para(MemFile)] {
		append str " -memfile \"$Para(MemFile)\" -memformat $Para(MemFormat)"
	}
	
	if {$Para(EnECC) == "1"} {lappend str -eccmode $Para(Pipeline)}
	
	if {$Para(Optimization) == "Area"} {
		lappend str -cascade 11
	} else {
		lappend str -cascade -1
	}

	return $str
} 

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para

	switch $Para(CmdLine)  {
		EC_CMD  {set str [Mg5g00CmdLine ]}
		default {set str [GeneralCmdLine]}
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

	set MinDataWidth [GetMinDataWidthRange]
	set MaxDataWidth [GetMaxDataWidthRange]
	set MinAddWidth [GetMinAddWidthRange]
        set MaxAddWidth [GetMaxAddWidthRange]
	
	switch $tcl_platform(platform) {
		windows {AttributeSetting 440 400}
		unix	{AttributeSetting 460 400}
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
		label .lblSize -text "Specify the size of the RAM_DQ" 
		pack .lblSize -in $frmProperty -side top -anchor w -padx 20 -pady 10
		
		iwidgets::Labeledframe .frmAddData1 -labelpos nw
		set lblframe [.frmAddData1 childsite]

		frame .frmAddress1
		iwidgets::entryfield .entAddress1 -labeltext "Address Depth" -textvariable Para(Address) \
			-width 8 -validate {digit %c} -fixed 6
		label .lblAddress1 -text "($MinAddWidth-$MaxAddWidth)"
		pack .entAddress1 .lblAddress1 -in .frmAddress1 -side left
		
		frame .frmData1
		iwidgets::entryfield .entData1 -labeltext "Data Width" -textvariable Para(Data) \
			-width 8 -validate {digit %c} -fixed 4
		label .lblData1 -text "($MinDataWidth-$MaxDataWidth)"
		pack .entData1 .lblData1 -in .frmData1 -side left
		pack .frmAddress1 .frmData1 -in $lblframe -side left -padx 10
		pack .frmAddData1 -in $frmProperty -fill x

		.entAddress1.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
		.entData1.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

		#*** Byte Enable ***
		#Byte Enable is only for SC, ECP2*, XP2, and ECP3
		frame .frmByte
		checkbutton .cbByte -text "Provide Byte Enables" -variable Para(enByte) -command {ChangeValueCmd}
		iwidgets::combobox .cboByte -labeltext "Byte Size" -width 4 -editable false -textvariable Para(ByteSize) \
			-selectioncommand {ChangeValueCmd}
		.cboByte insert list end 8 9
		pack .cbByte .cboByte -in .frmByte -side left -padx 20
		
		#*** checkbutton ***
		checkbutton .cbLUT  -text "Enable Output Register"  -variable Para(outPipeline) -command {ChangeValueCmd}
		#checkbutton .ckGSR -text "Enable GSR" -variable Para(GSR) -offvalue Disabled -onvalue Enabled
		pack .cbLUT     -in $frmProperty -side top -pady 2 -padx 20 -anchor w
		#pack .ckGSR     -in $frmProperty -side top -anchor w -padx 20
		pack .frmByte -in $frmProperty -side top -pady 2 -anchor w

		#CR_51865
		#EC/ECP/XP/XO hardware does not support Byte enable.
		set not_support_dev_lst {ep5g00 ep5g00p mg5g00 mj5g00}
		if {[lsearch $not_support_dev_lst $Para(arch)] != -1} {
			pack forget .frmByte
		}
		
		frame .frmReset
		label .lblReset -text "Reset Mode" -width 14 -anchor w
		radiobutton .rdo1Reset -text Async -width 8 -value Async -variable Para(Reset) -anchor w -command {ChangeResetCmd;ChangeValueCmd}
		radiobutton .rdo2Reset -text Sync  -width 8 -value Sync  -variable Para(Reset) -anchor w -command {ChangeResetCmd;ChangeValueCmd}
		pack .lblReset .rdo1Reset .rdo2Reset -in .frmReset -side left
		pack .frmReset	-in $frmProperty -side top -fill x -pady 2 -padx 20

		frame .frmOptimize
		label .lblOptimize -text "Optimization" -width 14 -anchor w
		radiobutton .rdo1Optimize -text Area -width 8 -value Area -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Optimize -text Speed  -width 8 -value Speed  -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		pack .lblOptimize .rdo1Optimize .rdo2Optimize -in .frmOptimize -side left
		pack .frmOptimize	-in $frmProperty -side top -fill x -pady 2 -padx 20

		#*** Mem File ***
		frame .frmMemory
		iwidgets::entryfield .entMemFile -labeltext "Memory File" -labelpos w -width 30 \
			-textvariable Para(MemFile)
		button .btnMemFile -text "..." -width 2 -command {
			set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
			if {$ret != "" }  {
				set Para(Mem_File) $ret
				Convert $ret
			} 
		}
		pack .entMemFile .btnMemFile -in .frmMemory -side left
		pack .frmMemory -in $frmProperty -side top -fill x -padx 20

		Create3RadioItem $frmProperty MFormat "Memory File Format:" 18 "Binary" bin "Hex" hex "Addressed Hex" orca 6 left Para(MemFormat) {}
		.rdo3MFormat config -width 13
		
		checkbutton .ckEnECC -text "Enable ECC (not supported for Data Width > 64)" -variable Para(EnECC) -command {ChangeValueCmd}
		pack .ckEnECC -in $frmProperty -side top -anchor w -padx 20 -pady 2

		iwidgets::combobox .cboPipeline -labeltext "Pipeline Stages for Q and ERROR Outputs" -width 4 -editable false -textvariable Para(Pipeline) \
			-selectioncommand {ChangeValueCmd}
		.cboPipeline insert list end 0 1 2
		pack .cboPipeline -in $frmProperty -side top -anchor w -padx 40 -pady 2
		
	pack .frmProperties -in $page -side top -fill both -expand 1

	#--- Page #2 ---
		set page1 [$tnb add -label "Advanced"]
		iwidgets::Labeledframe .frmAdvanced
		set frmAdvanced [.frmAdvanced childsite]

		label .lblWriteModeA -text "Write Mode" -anchor w
		pack .lblWriteModeA -in $frmAdvanced -side top -anchor w -padx 25
		Create3RadioItem $frmAdvanced PortAWM "" 20 \
			"Normal" Normal \
			"Write Through" WriteThrough \
			"Read before Write" ReadBeforeWrite 15 top Para(Write) DRC4XP
		pack .frmPortAWM -in $frmAdvanced -side top -anchor w -padx 40

	pack .frmAdvanced -in $page1 -side top -fill both -expand 1

	if {$Para(arch) == "ep5c00"} {
		pack forget .frmReset
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