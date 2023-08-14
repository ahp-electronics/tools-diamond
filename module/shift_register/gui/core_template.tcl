#$Header: L:/module/shift_register/gui/core_template.tcl 1.15 mghuang Exp $

#Rev 1.15: Diamond 3.0 IPExpress: SOF-119222
#Rev 1.13/1.14: Diamond 3.0 IPExpress: Fixed SOF-116170

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {$Para(DataWidth) < 1 || $Para(DataWidth) > 256} {return}
	if {$Para(Type) == "Fixed"}  {
		if {$Para(NoOfShifts) > 1}  {DrawPins}
	} elseif {$Para(Type) == "VarLossy"} {
		if {$Para(MaxLossyShifts) > 1}  {DrawPins}
	} else {
		if {$Para(MaxLosslessShifts) > 1}  {DrawPins}
	}
} 

proc ChangeValueCmd {} {
	global Para

	set Para(EBR_Dev_Flag) [GetEBRDeviceFlag]
	if {$Para(EBR_Dev_Flag) == "0"} {
		.rdobram config -state disable
		#set Para(RamType) dram
	} else {
		.rdobram config -state normal
	}
	
	if { [lsearch $Para(mem_lst) $Para(arch)] == -1} {
		.entMemFile config -state disabled -foreground gray50
		.btnMemFile config -state disabled
		.lblMFormat config -state disable
		.rdo1MFormat config -state disable
		.rdo2MFormat config -state disable
		.rdo3MFormat config -state disable
	} else {
		.entMemFile config -state normal -foreground black
		.btnMemFile config -state normal
		.lblMFormat config -state normal
		.rdo1MFormat config -state normal
		.rdo2MFormat config -state normal
		.rdo3MFormat config -state normal
	}
	
	if {$Para(Type) == "Fixed"}  {
		.entFixed config -state normal -foreground black
		.lblFixed config -state normal
		.entVarLossy config -state disabled -foreground gray50
		.lblVarLossy config -state disabled
		.entVarLossless config -state disabled -foreground gray50
		.lblVarLossless config -state disabled

	} elseif {$Para(Type) == "VarLossy"} {
		.entFixed config -state disabled -foreground gray50
		.lblFixed config -state disabled
		.entVarLossy config -state normal -foreground black
		.lblVarLossy config -state normal
		.entVarLossless config -state disabled -foreground gray50
		.lblVarLossless config -state disabled
	} else {
		.entFixed config -state disabled -foreground gray50
		.lblFixed config -state disabled
		.entVarLossy config -state disabled -foreground gray50
		.lblVarLossy config -state disabled
		.entVarLossless config -state normal -foreground black
		.lblVarLossless config -state normal
	}

	#6
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para
	ChangeValueCmd
}

proc CheckGeneralPara {} {
	global Para

	set ret [IsInRange "Data Width" 1 256 $Para(DataWidth)]
	if {$ret == -1} {return -1}

	if {$Para(Type) == "Fixed"}  {
		set ret [IsInRange "Number of Shifts" 2 1024 $Para(NoOfShifts)]
		if {$ret == -1} {return -1}
	} elseif {$Para(Type) == "VarLossy"}  {
		set ret [IsInRange "Max Number of Shifts(Lossy)" 2 1024 $Para(MaxLossyShifts)]
		if {$ret == -1} {return -1}
	} else {
		set ret [IsInRange "Max Number of Shifts(Lossless)" 2 1024 $Para(MaxLosslessShifts)]
		if {$ret == -1} {return -1}
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
	if [string length $Para(MemFile)] {
		if { [lsearch $Para(mem_lst) $Para(arch)] == -1} {
			set msg "The memory initialization is not supported."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		} else {
			if {[file exists $Para(MemFile)] == "0"} {
				set msg "Memory file $Para(MemFile) doesn't exist!"
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
	}
	switch $Para(CmdLine)  {
		EC_CMD -
		SC_CMD -
		default {set ret [CheckGeneralPara]}
	} 

	return $ret
}

proc GeneralCmdLine {} {
	global Para

	set str "-arch $Para(arch) -type shiftreg -width $Para(DataWidth)"

	if {$Para(RamType) == "dram"} {
		if {$Para(Type) == "Fixed"}  {
			lappend str -depth $Para(NoOfShifts) -mode 0
		} elseif {$Para(Type) == "VarLossy"}  {
			lappend str -depth $Para(MaxLossyShifts) -mode 1
		} else {
			lappend str -depth $Para(MaxLosslessShifts) -mode 2
		}
	} elseif {$Para(RamType) == "bram"} {
		if {$Para(Type) == "Fixed"}  {
			lappend str -depth $Para(NoOfShifts) -mode 8
		} elseif {$Para(Type) == "VarLossy"}  {
			lappend str -depth $Para(MaxLossyShifts) -mode 9
		} else {
			lappend str -depth $Para(MaxLosslessShifts) -mode 10
		}
	}

	if {$Para(EOR) == "1"}  {
		lappend str -pipe_final_output
	} 
	if { [lsearch $Para(mem_lst) $Para(arch)] != -1} {
		if [string length $Para(MemFile)] {
			lappend str -memfile $Para(MemFile) -memformat $Para(MemFormat)
		}
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
		EC_CMD -
		SC_CMD -
		default {set str [GeneralCmdLine]}
	} 
#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

#*** set private value ***
proc Create_Image {} {
    global Para diagram tnb tcl_platform pin_flag mem_types
    package require OrcaModule

	set mem_types {
		{"Memory files"		{.mem}	}
		{"All files"		{*.*}	}
	}

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface
	AttributeSetting 480 410
	set pin_flag 1
	DrawImage 200 300
	set tnb $Para(tnb)


	#*** Here for user to add extra pages ***
	#--- Page #1 ---
		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties
		set frmProperty [.frmProperties childsite]
		
		CreateLabelEntry $frmProperty DataWidth "Data Width" "(1 to 256)" 6 e left Para(DataWidth) {CallDrawPins}
		pack .frmDataWidth -in $frmProperty -side top -anchor w -padx 20 -fill x -pady 8
		.entryDataWidth config -fixed 3 -validate numeric
		.lblDataWidth config -width 16 -anchor w
		.entryDataWidth.lwchildsite.entry config -validate key -vcmd {
			after idle {CallDrawPins}
			return 1
		}

		#Ram type:bram/dram
		iwidgets::Labeledframe .frmRamChoice -labeltext "Ram Type" -labelpos nw
		set frmRamChoice [.frmRamChoice childsite]
		radiobutton .rdodram -text "LUT Based" -width 10 -value "dram" -variable Para(RamType) -anchor w -command {ChangeValueCmd;CallDrawPins}
		radiobutton .rdobram -text "EBR Based" -width 10 -value "bram" -variable Para(RamType) -anchor w -padx 100 -command {ChangeValueCmd;CallDrawPins}
		pack .rdodram .rdobram -in $frmRamChoice -side left -padx 10
		pack .frmRamChoice -in $frmProperty -side top -fill x -anchor w

		iwidgets::Labeledframe .frmType -labeltext "Shift Register Type" -labelpos nw
		set frmType [.frmType childsite]
		pack .frmType -in $frmProperty -fill x
		
		frame .frmFixed
		radiobutton .rdo1Type -text "Fixed Length" -width 19 -value Fixed -variable Para(Type) -anchor w -command {ChangeValueCmd;CallDrawPins}
		iwidgets::entryfield .entFixed -labeltext "Number of Shifts" -labelpos w -width 6 -fixed 4 -textvariable Para(NoOfShifts) -fixed 4 -validate numeric 
		.entFixed.label config -width 20 -anchor e
		label .lblFixed -text "(2-1024)"
		pack .rdo1Type .entFixed .lblFixed -in .frmFixed -side left
		.entFixed.label config -width 24 -anchor e
		.entFixed.lwchildsite.entry config -validate key -vcmd {
			after idle {CallDrawPins}
			return 1
		}
		
		frame .frmVarLossy
		radiobutton .rdo2Type -text "Variable Length(Lossy)" -width 25 -value VarLossy -variable Para(Type) -anchor w -command {ChangeValueCmd;CallDrawPins}
		iwidgets::entryfield .entVarLossy -labeltext "Max Number of Shifts" -labelpos w -width 6 -fixed 4 -textvariable Para(MaxLossyShifts) -fixed 4 -validate numeric
		label .lblVarLossy -text "(2-1024)"
		pack .rdo2Type .entVarLossy .lblVarLossy -in .frmVarLossy -side left
		.entVarLossy.label config -width 18 -anchor e
		.entVarLossy.lwchildsite.entry config -validate key -vcmd {
			after idle {CallDrawPins}
			return 1
		}

		frame .frmVarLossless
		radiobutton .rdo3Type -text "Variable Length(Lossless)" -width 25 -value VarLossless -variable Para(Type) -anchor w -command {ChangeValueCmd;CallDrawPins}
		iwidgets::entryfield .entVarLossless -labeltext "Max Number of Shifts" -labelpos w -width 6 -fixed 4 -textvariable Para(MaxLosslessShifts) -fixed 4 -validate numeric
		label .lblVarLossless -text "(2-1024)"
		pack .rdo3Type .entVarLossless .lblVarLossless -in .frmVarLossless -side left
		.entVarLossless.label config -width 18 -anchor e
		.entVarLossless.lwchildsite.entry config -validate key -vcmd {
			after idle {CallDrawPins}
			return 1
		}

		pack .frmFixed .frmVarLossy .frmVarLossless -in $frmType -side top -fill x -pady 4 -padx 2

		checkbutton .cbEOR  -text "Enable Output Register" -variable Para(EOR) -command {CallDrawPins}
		pack .cbEOR -in $frmProperty -side top -anchor w -padx 15 -pady 4

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
		pack .frmMemory -in $frmProperty -side top -anchor w -padx 21 -pady 8

		Create3RadioItem $frmProperty MFormat "Memory File Format:" 18 "Binary" bin "Hex" hex "Addressed Hex" orca 6 left Para(MemFormat) {}
		.rdo3MFormat config -width 13

		if { [lsearch $Para(mem_lst) $Para(arch)] == -1} {
			.entMemFile config -state disabled -foreground gray50
			.btnMemFile config -state disabled
			.lblMFormat config -state disable
			.rdo1MFormat config -state disable
			.rdo2MFormat config -state disable
			.rdo3MFormat config -state disable
		}

		pack .frmProperties -in $page -fill x

		ChangeValueCmd

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}
