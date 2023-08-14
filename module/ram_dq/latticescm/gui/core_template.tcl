#$Header: L:/module/ram_dq/latticescm/gui/rcs/core_template.tcl 1.13 2008/10/30 07:31:44Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(Address)] >0 &&
		[string length $Para(Data)]    >0}  {DrawPins}
} 

proc ChangeReadCmd {} {
	global Para
	if {$Para(Read) == "1"} {
		set Para(LUT) 0
	}
}

proc ChangeLutCmd {} {
	global Para
	if {$Para(LUT) == "1"} {
		set Para(Read) 0
	}
}

proc ChangeResetCmd {} {
	global Para
	if {$Para(sync_reset) == "Async"} {
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
	.rdo3PortAWM config -state disabled

	if {$Para(write_mode_0) == 2} {
		set tit "Warning"
		set msg "The source LPC file contains \"Read before Write\" option and this option is not\n \
				 supported for this family. The option will be set to default \"Normal\" mode."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		set Para(write_mode_0) 0
	}

	#note 3
	if {$Para(EnECC) == 0} {
		.cboPipeline config -state disabled
	} else {
		.cboPipeline config -state normal
	}

	CallDrawPins
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para
	if {$Para(arch) == "or5s00"} {
		CallDrawPins
		#if {$Para(sync_reset) == 0}  {set Para(sync_reset) Async}
		#if {$Para(sync_reset) == 1}  {set Para(sync_reset) Sync}
	} 
}

# *** Check or5s00's Parameters ***
proc Check5SParameter {}  {
	global Para

	set ret [IsInRange "Address Size" 2 131072 $Para(Address)]
	if {$ret == -1} {return -1}
	#20761
#	if {[expr int(fmod($Para(Address),256))] > 0} {
#		set msg "Write port memory size should be a multiple of 256."
#		set tit "Check Parameter"
#		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
#		return -1
#	} 
	set ret [IsInRange "Data Width" 1 256 $Para(Data)]
	if {$ret == -1} {return -1}

	return 0
}

# *** Check or5g00's Parameters ***
proc Check5GParameter {}  {
	global Para

	set ret [IsInRange "Address Size" 512 8192 $Para(Address)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width" 1 256 $Para(Data)]
	if {$ret == -1} {return -1}

	return 0
} 

proc CheckGeneralParameter {}  {
	global Para

	set ret [IsInRange "Address Size" 256 8192 $Para(Address)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width" 1 256 $Para(Data)]
	if {$ret == -1} {return -1}

	if {$Para(Read) == "1" && $Para(LUT) == "1"} {
		set msg "Read decode in PFU and Mux based read decode cannot be used together"
		set tit "Check Parameter"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
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
	
	set ret [Check5SParameter]
	if {$ret == -1} {return -1}

	if [string length $Para(MemFile)] {
		if {[file exists $Para(MemFile)] == "0"} {
			set msg "Memory file $Para(MemFile) doesn't exist!"
			set t "Check Parameter"
			tk_messageBox -default ok -icon warning -message $msg -title $t -type ok
			return -1
		}
	}

	return 0
}

#*** Command-line for or5s00 device ***
proc Or5s00CmdLine {} {
	global Para

	set str "-arch $Para(arch) -type bram -wp 10 -rp 1000 -num_rows $Para(Address) -data_width $Para(Data)"

	set reg_list {"No Registers" "Read Address Input Only" "Read Output Only" "Input and Output"}
	set argum_list {noreg inreg outreg ioreg}
	set read_reg0 [lindex $argum_list [lsearch -exact $reg_list $Para(Path)]]
#	lappend str -read_reg0 $read_reg0
	if {$Para(Path) == 1}  {lappend str -read_reg0 outreg} 

	if [string length $Para(MemFile)] {lappend str -memfile $Para(MemFile) -memformat $Para(MemFormat)}
	#lappend str -gsr [string toupper $Para(GSR)]

	if {$Para(sync_reset) == "Sync"} {lappend str -sync_reset}
	lappend str -write_mode_0 $Para(write_mode_0)
#	if {$Para(no_init_recof) == "1"} {lappend str -no_init_recof} 
	
	if {$Para(enByte) == "1"} {lappend str -byte $Para(ByteSize)}

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

	set str [Or5s00CmdLine] 

#	set tit "Command Line"
#	tk_messageBox -default ok -icon warning -message $str -title $tit -type ok
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
	switch $tcl_platform(platform) {
		windows {AttributeSetting 440 380}
		unix    {AttributeSetting 460 380}
	}
	set pin_flag 1
	DrawImage 220 300
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***
	#--- Page #1 ---
		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties
		set frmProperty [.frmProperties childsite]
		
		#*** Size of block RAM ***
		label .lblSize -text "Specify the size of RAM_DQ" 
		pack .lblSize -in $frmProperty -side top -anchor w -padx 20 -pady 10
		iwidgets::Labeledframe .frmAddData1
		set lblframe [.frmAddData1 childsite]

		frame .frmAddress1
		iwidgets::entryfield .entAddress1 -labeltext "Address Depth" -labelpos w -textvariable Para(Address) \
			-width 8 -validate {digit %c} -fixed 6
		label .lblAddress1 -text "(2-131072)"
		pack .entAddress1 .lblAddress1 -in .frmAddress1 -side left

		frame .frmData1
		iwidgets::entryfield .entData1 -labeltext "Data Width" -labelpos w -textvariable Para(Data) \
			-width 8 -validate {digit %c} -fixed 3
		label .lblData1 -text "(1-256)"
		pack .entData1 .lblData1 -in .frmData1 -side left

		pack .frmAddress1 .frmData1 -in $lblframe -side left -padx 5 -anchor w
		pack .frmAddData1 -in $frmProperty -after .lblSize -side top -fill x
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
		pack .frmByte -in $frmProperty -side top -anchor w

		checkbutton .cbPath -text "Enable Output Registers" -variable Para(Path) -command {ChangeValueCmd}
		pack .cbPath -in $frmProperty -side top -anchor w -padx 20 -pady 2

		#checkbutton .ckGSR -text "Enable GSR" -variable Para(GSR) -offvalue Disabled -onvalue Enabled -command {ChangeValueCmd}
		#pack .ckGSR -in $frmProperty -side top -anchor w -padx 20

		frame .frmReset
		label .lblReset -text "Reset Mode" -width 14 -anchor w
		radiobutton .rdo1Reset -text Async -width 8 -value Async -variable Para(sync_reset) -anchor w -command {ChangeResetCmd;ChangeValueCmd}
		radiobutton .rdo2Reset -text Sync  -width 8 -value Sync  -variable Para(sync_reset) -anchor w -command {ChangeResetCmd;ChangeValueCmd}
		pack .lblReset .rdo1Reset .rdo2Reset -in .frmReset -side left
		pack .frmReset -in $frmProperty -side top -anchor w -padx 20 -pady 2

		frame .frmOptimize
		label .lblOptimize -text "Optimization" -width 14 -anchor w
		radiobutton .rdo1Optimize -text Area -width 8 -value Area -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Optimize -text Speed  -width 8 -value Speed  -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		pack .lblOptimize .rdo1Optimize .rdo2Optimize -in .frmOptimize -side left
		pack .frmOptimize	-in $frmProperty -side top -fill x -pady 2 -padx 20

		#*** Mem File ***
		frame .frmMemory
		iwidgets::entryfield .entMemFile -labeltext "Memory file" -labelpos w -width 35 \
			-textvariable Para(MemFile)
		button .btnMemFile -text "..." -width 2 -command {
			set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
			if {$ret != "" }  {
				set Para(Mem_File) $ret
				Convert $ret
			} 
		}
		pack .entMemFile .btnMemFile -in .frmMemory -side left
		pack .frmMemory -in $frmProperty -side top -fill x -padx 20 -pady 5

		Create3RadioItem $frmProperty MFormat "Memory File Format:" 18 "Binary" bin "Hex" hex "Addressed Hex" orca 6 left Para(MemFormat) {}
		.rdo3MFormat config -width 13

		checkbutton .ckEnECC -text "Enable ECC (not supported for Data Width > 64)" -variable Para(EnECC) -command {ChangeValueCmd}
		pack .ckEnECC -in $frmProperty -side top -anchor w -padx 20 -pady 2

		iwidgets::combobox .cboPipeline -labeltext "Pipeline Stages for Q and ERROR Outputs" -width 4 -editable false -textvariable Para(Pipeline) \
			-selectioncommand {ChangeValueCmd}
		.cboPipeline insert list end 0 1 2
		pack .cboPipeline -in $frmProperty -side top -anchor w -padx 40 -pady 2

		pack .frmProperties -in $page -side top -fill both -expand 1

	#--- Page Advanced ---
		set page1 [$tnb add -label "Advanced"]
		iwidgets::Labeledframe .frmAdvanced
		set frmAdvanced [.frmAdvanced childsite]

		#Write Mode
		label .lblWriteModeA -text "Write Mode" -anchor w
		pack .lblWriteModeA -in $frmAdvanced -side top -anchor w -padx 25
		Create3RadioItem $frmAdvanced PortAWM "" 20 \
			"Normal" 0 \
			"Write Through" 1 \
			"Read before Write" 2 15 top Para(write_mode_0)
		pack .frmPortAWM -in $frmAdvanced -side top -anchor w -padx 40

		pack .frmAdvanced -in $page1 -side top -fill both -expand 1
	
		$tnb view 0

	ChangeValueCmd
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
#	FunctionButton
#	CenterPosition
	GeneralConfig
}