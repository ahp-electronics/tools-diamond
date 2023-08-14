#$Header: L:/module/distributed_dpram/gui/rcs/core_template.tcl 1.8 2006/08/25 08:10:51Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	#28189
	if {$Para(Addresses) > 0 &&
		$Para(Data) > 0}  {DrawPins}
} 

proc ChangeValueCmd {} {
	global Para

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
	ChangeValueCmd
}

# For orca5 & or5s00 & lv5g00 device
proc CheckOrca5Para {} {
	global Para

	# 27207 - Usage Model 2.2
	set ret [IsInRange "Addresses" 2 8192 $Para(Addresses)]
	if {$ret == -1} {return -1}

	set ret [IsInRange "Data" 1 256 $Para(Data)]
	if {$ret == -1} {return -1}
 
	return 0
}

proc CheckGeneralPara {} {
	global Para

	set ret [IsInRange "Addresses" 2 1024 $Para(Addresses)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data" 1 64 $Para(Data)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Row" 1 99 $Para(PlaceRow)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Column" 1 99 $Para(PlaceColumn)]
	if {$ret == -1} {return -1}

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
		if {[lsearch $Para(mem_lst) $Para(arch)] == -1}  {
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
		SC_CMD  {set ret [CheckOrca5Para]  }
		default {set ret [CheckGeneralPara]}
	} 

	return $ret
}

# Command-Line for orca5 & or5s00 & lv5g00 device
proc Orca5CmdLine {} {
	global Para

	set str "-arch $Para(arch) -type sdpram -num_rows $Para(Addresses) -data_width $Para(Data)"

	if {$Para(LUT) == "1"} {lappend str -pipe_final_output}

	return $str
}

proc GeneralCmdLine {} {
	global Para

	set str ""
	return $str
}

proc Mg5g00CmdLine {}  {
	global Para

	set str "-arch $Para(arch)"
	lappend str -dram -type ramdps
	set Para(Addresses) [string trimleft $Para(Addresses) 0]
	lappend str -raddr_width [expr int(ceil(log($Para(Addresses))/log(2)))] -rwidth $Para(Data)
	lappend str -waddr_width [expr int(ceil(log($Para(Addresses))/log(2)))] -wwidth $Para(Data)
	lappend str -rnum_words $Para(Addresses)
	lappend str -wnum_words $Para(Addresses)

	if {$Para(LUT) == "1"} {
		lappend str -outData REGISTERED
	} else  {
		lappend str -outData UNREGISTERED
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
		SC_CMD  {set str [Orca5CmdLine  ]}
		default {set str [GeneralCmdLine]}
	} 
	if [string length $Para(MemFile)] {lappend str -memfile $Para(MemFile) -memformat $Para(MemFormat)}
#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

#*** set private value ***
proc Create_Image {} {
    global Para diagram tnb tcl_platform pin_flag ft mem_types
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
	#*** Draw Pin ***
	#DrawPin
	switch $tcl_platform(platform) {
		windows {AttributeSetting 450 410}
		unix    {AttributeSetting 450 410}
	}
	set pin_flag 1
	DrawImage 220 300
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***
	#--- Page #1 ---
	set page [$tnb add -label "Configuration"]
	iwidgets::Labeledframe .frmProperties
	set frmProperty [.frmProperties childsite]
	
	#*** Size of RAM ***
	label .lblSize -text "Specify the size of the RAM"
	pack .lblSize -in $frmProperty -side top -anchor w -padx 20 -pady 10

	pack .frmProperties -in $page -side top -fill both -expand 1

	iwidgets::Labeledframe .frmAddData1 -labelpos nw
	set lblframe [.frmAddData1 childsite]

	frame .frmAddresses1
	iwidgets::entryfield .entAddresses1 -labeltext "Address Depth" -labelpos w -textvariable Para(Addresses) \
		-width 8 -validate integer -fixed 4
	.entAddresses1.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}
	label .lblAddresses1 -text "(2-8192)" 
	pack .entAddresses1 .lblAddresses1 -in .frmAddresses1 -side left
	
	frame .frmData1
	iwidgets::entryfield .entData1 -labeltext "Data Width" -labelpos w \
		-width 8 -textvariable Para(Data) -validate integer -fixed 3
	.entData1.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}
	label .lblData1 -text "(1-256)"
	pack .entData1 .lblData1 -in .frmData1 -side left

	pack .frmAddresses1 .frmData1 -in $lblframe -side left -padx 5 -pady 4
	pack .frmAddData1 -in $frmProperty -after .lblSize -fill x

	pack forget .entAddresses .frmAddData

	checkbutton .cbEOR  -text "Enable Output Register" -variable Para(LUT) -command {ChangeValueCmd}
	pack .cbEOR -in $frmProperty -side top -anchor w -padx 15 -pady 4

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
	pack .frmMemory -in $frmProperty -side top -fill x -padx 20 -pady 10

	#22796 - radio button "Orca" to "Addressed Hex"
	Create3RadioItem $frmProperty MFormat "Memory File Format:" 18 "Binary" bin "Hex" hex "Addressed Hex" orca 6 left Para(MemFormat) {}
	.rdo3MFormat config -width 13
	
	#if {$Para(CmdLine) != "SC_CMD"} 
	if {[lsearch $Para(mem_lst) $Para(arch)] == -1}  {
		.entMemFile config -state disabled -foreground gray50
		.btnMemFile config -state disabled
		.lblMFormat config -state disable
		.rdo1MFormat config -state disable
		.rdo2MFormat config -state disable
		.rdo3MFormat config -state disable
	}

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	ChangeValueCmd
	GeneralConfig
}
