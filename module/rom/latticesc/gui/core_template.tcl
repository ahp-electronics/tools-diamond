#$Header: L:/module/rom/latticesc/gui/rcs/core_template.tcl 1.12 2008/10/30 07:31:51Z mghuang Exp $
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

proc ChangeReadCmd {} {
	global Para
	if {$Para(Read) == "1"} {
		set Para(LUT) Async
	}
}

proc ChangeLutCmd {} {
	global Para
	if {$Para(LUT) == "Sync"} {
		set Para(Read) 0
	}
}

proc ChangeResetCmd {} {
	global Para
	if {$Para(LUT) == "Async"} {
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
	
	if {$Para(Data)>64} {
		.ckEnECC config -state disable
		set Para(EnECC) 0
	} else {
		.ckEnECC config -state normal
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
	#if {$Para(LUT) == "0"} {set Para(LUT) Async}
	#if {$Para(LUT) == "1"} {set Para(LUT) Sync}
}

proc Check5SParameter {}  {
	global Para
	set ret [IsInRange "Address Size" 2 131072 $Para(Address)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width" 1 256 $Para(Data)]
	if {$ret == -1} {return -1}
	return 0
} 

proc CheckGeneralPara {} {
	global Para
	set ret [IsInRange "Address Size" 512 8192 $Para(Address)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width" 1 256 $Para(Data)]
	if {$ret == -1} {return -1}

	if {$Para(Read) == "1" && $Para(LUT) == "Sync"} {
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
	
	set t "Check Parameter"
	if {[string length $Para(MemFile)] == 0} {
		set msg "Please specify memory file for ROM!"
		tk_messageBox -default ok -icon warning -message $msg -title $t	-type ok
		return -1
	} 
	if [string length $Para(MemFile)] {
		if {[file exists $Para(MemFile)] == "0"} {
			set msg "Memory file $Para(MemFile) doesn't exist!"
			tk_messageBox -default ok -icon warning -message $msg -title $t -type ok
			return -1
		}
	}

	return 0
}

#*** Command-line for or5s00 device ***
proc Or5s00CmdLine {} {
	global Para
	set str "-arch $Para(arch) -type bram -wp 00 -rp 1100 -num_rows $Para(Address) -data_width $Para(Data)"

	if {$Para(Path) == 1}  {lappend str -read_reg0 outreg} 
#	lappend str -read_reg0 $read_reg0

	if [string length $Para(MemFile)] {lappend str -memfile $Para(MemFile) -memformat $Para(MemFormat)}
	#lappend str -gsr [string toupper $Para(GSR)]
	if {$Para(LUT) == "Sync"} {lappend str -sync_reset}
	
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
		windows {AttributeSetting 440 360}
		unix    {AttributeSetting 460 360}
	}
	set pin_flag 1
	DrawImage 220 300
	set tnb $Para(tnb)

		wm title . "ORCA Module -- 4E Block RAM based ROM"
	#*** Here for user to add extra pages ***
	#--- Page #1 ---
		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties ;#-labeltext "Properties" -labelpos nw
		set frmProperty [.frmProperties childsite]
		
		#*** Size of block RAM ***
		label .lblSize -text "Specify the size of the block RAM"
		pack .lblSize -in $frmProperty -side top -anchor w -padx 20 -pady 10
		frame .frmAddData
		iwidgets::entryfield .entAddress -labeltext "Address Size" -labelpos n -textvariable Para(Address) \
			-width 8 -validate {digit %c} -fixed 6
		iwidgets::entryfield .entData -labeltext "Data Width" -labelpos n -textvariable Para(Data) \
			-width 8 -validate {digit %c} -fixed 3
		pack .entAddress .entData -in .frmAddData -side left -padx 50
		pack .frmAddData -in $frmProperty -side top -fill x

		#*** checkbutton ***
		checkbutton .cbWrite -text "Write Decode in PFU" -variable Para(Write)
		pack .cbWrite -in $frmProperty -side top -anchor w -padx 20 -pady 10
		frame .frmCB2
		checkbutton .cbRead -text "Read Decode in PFU" -variable Para(Read) -command {ChangeReadCmd}
		checkbutton .cbLUT  -text "Use LUT based mux decode" -variable Para(LUT) -command {ChangeLutCmd}
		pack .cbRead .cbLUT -in .frmCB2 -side left -padx 20
		pack .frmCB2 -in $frmProperty -side top -fill x

		#*** Register Options ***
		frame .frmPath
		iwidgets::combobox .cboPath -labeltext "Read Path Registers" -labelmargin 15 -labelpos w -textvariable Para(Path) -width 25 -editable 0
		.cboPath insert list end "No Registers" "Read Address Input Only" "Read Output Only" "Input and Output"
		pack .cboPath -in .frmPath -side left -padx 20
		pack .frmPath -in $frmProperty -side top -fill x ;#-pady 20

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
		pack .frmMemory -in $frmProperty -side top -fill x -padx 20 ;#-pady 10

		pack .frmProperties -in $page -side top -fill both -expand 1

	#**********************************
	# GUI config for or5s00 device
	#**********************************
		wm title . "ORCA Module -- EBR ROM"
		pack forget .cbWrite .frmCB2
		.lblSize config -text "Specify the size of ROM"
		#21483
		pack forget .frmAddData
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

		pack forget .cboPath
		checkbutton .cbPath -text "Enable Output Registers" -variable Para(Path)
		pack .cbPath -in .frmPath -side left -padx 20

		#checkbutton .ckGSR -text "Enable GSR" -variable Para(GSR) -offvalue Disabled -onvalue Enabled
		#pack .ckGSR -in $frmProperty -before .frmMemory -side top -anchor w -padx 20 -pady 4

		#set Para(LUT) Async 
		frame .frmReset
		label .lblReset -text "Reset Mode" -width 14 -anchor w
		radiobutton .rdo1Reset -text Async -width 8 -value Async -variable Para(LUT) -anchor w -command {ChangeResetCmd;ChangeValueCmd}
		radiobutton .rdo2Reset -text Sync  -width 8 -value Sync  -variable Para(LUT) -anchor w -command {ChangeResetCmd;ChangeValueCmd}
		pack .lblReset .rdo1Reset .rdo2Reset -in .frmReset -side left
		pack .frmReset -in $frmProperty -before .frmMemory -side top -anchor w -padx 20 -pady 4
		
		frame .frmOptimize
		label .lblOptimize -text "Optimization" -width 14 -anchor w
		radiobutton .rdo1Optimize -text Area -width 8 -value Area -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Optimize -text Speed  -width 8 -value Speed  -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		pack .lblOptimize .rdo1Optimize .rdo2Optimize -in .frmOptimize -side left
		pack .frmOptimize -in $frmProperty -before .frmMemory -side top -anchor w -padx 20 -pady 4

		#22796 - radio button "Orca" to "Addressed Hex"
		Create3RadioItem $frmProperty MFormat "Memory File Format:" 18 "Binary" bin "Hex" hex "Addressed Hex" orca 6 left Para(MemFormat) {}
		.rdo3MFormat config -width 13
	
	checkbutton .ckEnECC -text "Enable ECC (not supported for Data Width > 64)" -variable Para(EnECC) -command {ChangeValueCmd}
	pack .ckEnECC -in $frmProperty -side top -anchor w -padx 20

	iwidgets::combobox .cboPipeline -labeltext "Pipeline Stages for Q and ERROR Outputs" -width 4 -editable false -textvariable Para(Pipeline) \
		-selectioncommand {ChangeValueCmd}
	.cboPipeline insert list end 0 1 2
	pack .cboPipeline -in $frmProperty -side top -anchor w -padx 40 -pady 2

		$tnb view 0
		
		ChangeValueCmd

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
#	FunctionButton
#	CenterPosition
	GeneralConfig
}