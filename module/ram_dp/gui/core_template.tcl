#$Header: L:/module/ram_dp/gui/core_template.tcl 1.19 mghuang Exp $

# Rev 1.19: Diamond 2.0.1 IPExpress: Fixed CR_57842

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	#28189
	if {$Para(RAddress) > 0 &&
		$Para(RData)    > 0 &&
		$Para(WAddress) > 0 &&
		$Para(WData)    > 0}  {DrawPins}
} 

proc GetTopicCB {} {
	global Para

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
	
	#note 7
#b. If (¡°Write Port Data Width = 9¡±) and ((¡°Read Port Data Width¡± / ¡°Write Port Data Width¡±)
#<= 2): ¡°Provide Byte Enables¡± should be available for selection and ¡°Byte Size¡± can only
#be 8.
#c. If (¡°Write Port Data Width > 9¡±) and ((¡°Read Port Data Width¡± / ¡°Write Port Data Width¡±)
#<= 2): ¡°Provide Byte Enables¡± should be available for selection and ¡°Byte Size¡± can be 8
#or 9.
	if {$Para(enByte) == "1"} {
		#.cboByte config -state normal
	} else {
		#.cboByte config -state disabled
	}

	set Para(RAddress) [string trimleft $Para(RAddress) 0]
	set Para(WAddress) [string trimleft $Para(WAddress) 0]
	set Para(RData) [string trimleft $Para(RData) 0]
	set Para(WData) [string trimleft $Para(WData) 0]
	set ratio 0
	if {$Para(WData) < 9} {
		set Para(enByte) 0
		.cbByte config -state disabled
	}
	if {$Para(WData) == 9} {
		if {$Para(RData)    > 0 &&
			$Para(WData)    > 0}  {
			set ratio [expr $Para(RData)*1.0/$Para(WData)]
		}
		if {$ratio <= 2} {
			set Para(ByteSize) 8
			.cbByte config -state normal
			if {$Para(enByte) == "1"} {
				.cboByte config -state normal
				.cboByte clear list
				.cboByte insert list end 8
			} else {
				.cboByte config -state disabled
			}
		} else {
			set Para(enByte) 0
			.cbByte config -state disabled
			.cboByte config -state disabled
		}
	}
	if {$Para(WData) > 9} {
		if {$Para(RData)    > 0 &&
			$Para(WData)    > 0}  {
			set ratio [expr $Para(RData)*1.0/$Para(WData)]
		}
		if {$ratio <= 2} {
			.cbByte config -state normal
			if {$Para(enByte) == "1"} {
				.cboByte config -state normal
				.cboByte clear list
				.cboByte insert list end 8 9
			} else {
				.cboByte config -state disabled
			}
		} else {
			set Para(enByte) 0
			.cbByte config -state disabled
			.cboByte config -state disabled
		}
	}
	
	if {$Para(RData)>64 || $Para(WData)>64 || $Para(enByte) == "1"} {
		.ckEnECC config -state disable
		set Para(EnECC) 0
	} else {
		if {$Para(RData)!=$Para(WData)} {
			.ckEnECC config -state disable
			set Para(EnECC) 0
		} else {
			.ckEnECC config -state normal
		}
	}

	#note 3
	if {$Para(EnECC) == 0} {
		.cboPipeline config -state disabled
	} else {
		.cboPipeline config -state normal
	}
	
	CallDrawPins
}

proc ChangeValueCmd2 {}  {
	global Para
} 

proc ChangeDataWidth {}  {
	global Para

	switch $Para(RData) {
		1  -
		2  -
		4  {
			.cboWData clear list
			.cboWData insert list end 16 8 4 2 1
		}
		8  {
			.cboWData clear list
			.cboWData insert list end 8 4 2 1
		}
		16 {
			.cboWData clear list
			.cboWData insert list end 16 4 2 1
		}
		9  -
		18 -
		36 {
			.cboWData clear list
			.cboWData insert list end 36 18 9
		}
#		if {[lsearch -exact [.cboWData get] $Para(WData)] == -1}  {
#			set Para(WData) [.cboWData get 0]
#		} 
	}
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
	ChangeDataWidth
}

proc CheckOr5s00Para {}  {
	global Para data_lst
	set tit "Check Parameter"

	#check address width range
	set min [GetMinAddWidthRange]
	set max [GetMaxAddWidthRange]
        set ret [IsInRange "Address Depth of Write Port" $min $max $Para(WAddress)]
        if {$ret == -1} {return -1}
        set ret [IsInRange "Address Depth of Read Port" $min $max $Para(RAddress)]
        if {$ret == -1} {return -1}

	set max [GetMaxDataWidthRange]
	set ret [IsInRange "Width of Write Port" 1 $max $Para(WData)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Width of Read Port" 1 $max $Para(RData)]
	if {$ret == -1} {return -1}
	set r_size [expr $Para(RAddress)*$Para(RData)]
	set w_size [expr $Para(WAddress)*$Para(WData)]
	set msg "Total value of (Depth * Width) must be the same for read set and write set ports."
	if {$r_size != $w_size}  {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 
	#26607
	set ratio [expr $Para(RData)>$Para(WData)?$Para(RData)/$Para(WData):$Para(WData)/$Para(RData)]
	set msg "Ratio of Data Width values (Width/Width) cannot be greater than 32."
	if {$ratio > 32}  {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 
	
	set temp [expr int(ceil(log($ratio)/log(2)))]
	if {[expr pow(2,$temp) - $ratio] > 0}  {
		set msg "The ratio of write/read widths must be a power of 2."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	#! CR_57842, RAM_DP, i.e. SC/ECP2/ECP3/ECP4/XP2, allow W/R ratio 1, 2, 4
	if {$Para(enByte) == 1} {
		set x 0
		if {$Para(RData) > 0 && $Para(WData) > 0 }  {
			set x [expr $Para(WData)/$Para(RData)]
		}
		if {$x != "1" && $x != "2" && $x != "4"} {
			set msg "The ratio of (Write Width/Read Width) should be 1, 2 or 4 when Byte Enables is set."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
	}

	return 0
} 

proc CheckMg5g00Para {}  {
	global Para

	#check address width range
	set min [GetMinAddWidthRange]
	set max [GetMaxAddWidthRange]
        set ret [IsInRange "Address Depth of Write Port" $min $max $Para(WAddress)]
        if {$ret == -1} {return -1}
        set ret [IsInRange "Address Depth of Read Port" $min $max $Para(RAddress)]
        if {$ret == -1} {return -1}

	#check data width range
        set max [GetMaxDataWidthRange]
        set ret [IsInRange "Data Width of Write Port" 1 $max $Para(WData)]
        if {$ret == -1} {return -1}
        set ret [IsInRange "Data Width of Read Port" 1 $max $Para(RData)]
        if {$ret == -1} {return -1}


	set tit "Check Parameter"

	set r_size [expr $Para(RAddress)*$Para(RData)]
	set w_size [expr $Para(WAddress)*$Para(WData)]

	# removed memory size checking depend on #26579

	set msg "Total value of (Depth * Width) must be the same for read set and write set ports."
	if {$r_size != $w_size}  {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	#! CR_57842, RAM_DP, i.e. SC/ECP2/ECP3/ECP4/XP2, allow W/R ratio 1, 2, 4
	if {$Para(enByte) == 1} {
		set dev_lst {or5s00 or5s00m slayer ep5a00 ep5c00 ep5a00s ep5m00 ep5m00s mg5a00 xo3c00h}
		if {[lsearch $dev_lst $Para(arch)] != -1} {
			set x 0
			if {$Para(RData) > 0 && $Para(WData) > 0 }  {
				set x [expr $Para(WData)/$Para(RData)]
			}
			if {$x != "1" && $x != "2" && $x != "4"} {
				set msg "The ratio of (Write Width/Read Width) should be 1, 2 or 4 when Byte Enables is set."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
	}

	#26607
	set ratio [expr $Para(RData)>$Para(WData)?$Para(RData)/$Para(WData):$Para(WData)/$Para(RData)]
	set msg "Ratio of Data Width values (Width/Width) cannot be greater than 32."
	if {$ratio > 32}  {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	set temp [expr int(ceil(log($ratio)/log(2)))]
	if {[expr pow(2,$temp) - $ratio] > 0}  {
		set msg "The ratio of write/read widths must be a power of 2."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 
	
	return 0
} 

proc CheckGeneralPara {} {
    # 27818
    set max 99999999
    set ret [IsInRange "Data Width of Write Port" 1 $max $Para(WData)]
    if {$ret == -1} {return -1}
    set ret [IsInRange "Data Width of Read Port" 1 $max $Para(RData)]
    if {$ret == -1} {return -1}
    set ret [IsInRange "Address Depth of Write Port" 1 $max $Para(WAddress)]
    if {$ret == -1} {return -1}
    set ret [IsInRange "Address Depth of Read Port" 1 $max $Para(RAddress)]
    if {$ret == -1} {return -1}
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
	default {return 99999999}
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
	if [string length $Para(MemFile)] {
		if {[file exists $Para(MemFile)] == "0"} {
			set msg "Memory file $Para(MemFile) doesn't exist!"
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
	}

	switch $Para(CmdLine)  {
	    EC_CMD  {set ret [CheckMg5g00Para ]}
	    SC_CMD  {set ret [CheckOr5s00Para ]}
	    default {set ret [CheckGeneralPara]}
	} 
	return $ret
}

#*** Command-line for or5s00 device ***
proc Or5s00CmdLine {}  {
	global Para
	set str "-arch $Para(arch) -type bram -wp 10 -rp 0011"
	lappend str -num_rows $Para(WAddress) -data_width $Para(WData) -rdata_width $Para(RData)
#	lappend str -rnum_rows $Para(RAddress)
	if {$Para(outPipeline) == 1}  {lappend str -read_reg1 outreg} 
	if {$Para(Reset) == "Sync"} {lappend str -sync_reset}
	if {$Para(enByte) == "1"} {lappend str -byte $Para(ByteSize)}
#	if {$Para(no_init_recof) == "1"} {lappend str -no_init_recof} 
	if [string length $Para(MemFile)] {lappend str -memfile $Para(MemFile) -memformat $Para(MemFormat)}
	#lappend str -gsr [string toupper $Para(GSR)]
	
	if {$Para(EnECC) == "1"} {lappend str -eccmode $Para(Pipeline)}
	if {$Para(Optimization) == "Area"} {
		lappend str -cascade 11
	} else {
		lappend str -cascade -1
	}
	return $str
} 

proc Mg5g00CmdLine {}  {
	global Para

	set str "-arch $Para(arch)"
	lappend str -device $Para(PartType)
	lappend str -type  ramdps

	lappend str -raddr_width [expr int(ceil(log($Para(RAddress))/log(2)))] -rwidth $Para(RData)
	lappend str -waddr_width [expr int(ceil(log($Para(WAddress))/log(2)))] -wwidth $Para(WData)
	lappend str -rnum_words $Para(RAddress)
	lappend str -wnum_words $Para(WAddress)

	if {$Para(outPipeline) == "1"} {lappend str -outdata REGISTERED}  
	#lappend str -gsr [string toupper $Para(GSR)]
	if {$Para(arch) != "ep5c00"} {lappend str -resetmode [string toupper $Para(Reset)]}
	if {$Para(Pad)}  {lappend str -buffer} 
	if {$Para(enByte) == "1"} {lappend str -byte $Para(ByteSize)}
	
	if [string length $Para(MemFile)] {
		lappend str -memfile $Para(MemFile) -memformat $Para(MemFormat)
	}
	
	if {$Para(EnECC) == "1"} {lappend str -eccmode $Para(Pipeline)}
	
	if {$Para(Optimization) == "Area"} {
		lappend str -cascade 11
	} else {
		lappend str -cascade -1
	}
	return $str
} 

proc GeneralCmdLine {}  {
	global Para

    set str "-arch $Para(arch) -type ramdps"
	lappend str -raddr_width $Para(RAddress) -rwidth $Para(RData)
	lappend str -waddr_width $Para(WAddress) -wwidth $Para(WData)

	lappend str -rnum_words [expr int(pow(2,$Para(RAddress)))]
	lappend str -wnum_words [expr int(pow(2,$Para(WAddress)))]

	if {$Para(outPipeline) == "1"} {lappend str -outdata REGISTERED}  
	if {$Para(adPipeline) == "1"}  {lappend str -adRPipeline -adWPipeline}
	if {$Para(inPipeline) == "1"}  {lappend str -inPipeline}
	if {$Para(MOR) == "1"}         {lappend str -outPipeline}
	if {$Para(enByte) == "1"} {lappend str -byte $Para(ByteSize)}
	
	if [string length $Para(MemFile)] {
		lappend str -memfile $Para(MemFile) -memformat $Para(MemFormat)
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
		SC_CMD  {set str [Or5s00CmdLine] }
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
	switch $tcl_platform(platform) {
		windows {AttributeSetting 450 420}
		unix	{AttributeSetting 460 430}
	}
	switch $Para(CmdLine) {
		EC_CMD  -
		SC_CMD  {set pin_flag 1}
		default {set pin_flag 2}
	} 
	#set pin_flag 2
	DrawImage 220 300 
	set tnb $Para(tnb)
        set MinDataWidth [GetMinDataWidthRange]
	set MaxDataWidth [GetMaxDataWidthRange]
	set MinAddWidth [GetMinAddWidthRange]
        set MaxAddWidth [GetMaxAddWidthRange]

	#*** Here for user to add extra pages ***
	#--- Page #1 ---
		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties
		set frmProperty [.frmProperties childsite]
		
		#*** Size of block RAM ***
		wm title . "ORCA Module -- EBR RAM_DP"
		label .lblSize -text "Specify the size of the block RAM_DP"
		pack .lblSize -in $frmProperty -side top -anchor w -padx 20 -pady 5

		#*** Read Port ***
		iwidgets::Labeledframe .frmRead -labeltext "Read Port" -labelpos nw
		set frmRead [.frmRead childsite]

                frame .frmRAddress
		iwidgets::entryfield .entRAddress -labeltext "Address Size" -labelpos w -textvariable Para(RAddress) \
			-width 8 -validate numeric -fixed 6
                label .lblRAddressRange -text "($MinAddWidth-$MaxAddWidth)"
                pack .entRAddress .lblRAddressRange -in .frmRAddress -side left

                frame .frmRData
		iwidgets::entryfield .entRData -labeltext "Data Size" -labelpos w -textvariable Para(RData) \
			-width 8 -validate numeric -fixed 6
                label .lblRDataRange -text "($MinDataWidth-$MaxDataWidth)"
                pack .entRData .lblRDataRange -in .frmRData -side left
		pack .frmRAddress .frmRData -in $frmRead -side left -padx 1
		pack .frmRead -in $frmProperty -side top -fill x -anchor w -padx 10

		#*** Write Port ***
		iwidgets::Labeledframe .frmWrite -labeltext "Write Port" -labelpos nw
		set frmWrite [.frmWrite childsite]

                frame .frmWAddress
		iwidgets::entryfield .entWAddress -labeltext "Address Size" -labelpos w -textvariable Para(WAddress) \
			-width 8 -validate numeric -fixed 6
                label .lblWAddressRange -text "($MinAddWidth-$MaxAddWidth)"
                pack .entWAddress .lblWAddressRange -in .frmWAddress -side left

                frame .frmWData
		iwidgets::entryfield .entWData -labeltext "Data Size" -labelpos w -textvariable Para(WData) \
			-width 8 -validate numeric -fixed 6
                label .lblWDataRange -text "($MinDataWidth-$MaxDataWidth)"
                pack .entWData .lblWDataRange -in .frmWData -side left
		pack .frmWAddress .frmWData -in $frmWrite -side left -padx 1
		pack .frmWrite -in $frmProperty -side top -fill x -anchor w -padx 10

		#*** Byte Enable ***
		#Byte Enable is only for SC, ECP2*, XP2, and ECP3
		frame .frmByte
		checkbutton .cbByte -text "Provide Byte Enables" -variable Para(enByte) -command {ChangeValueCmd}
		iwidgets::combobox .cboByte -labeltext "Byte Size" -width 4 -editable false -textvariable Para(ByteSize) \
			-selectioncommand {ChangeValueCmd}
		.cboByte insert list end 8 9
		pack .cbByte .cboByte -in .frmByte -side left -padx 20
		
		set dev_lst {or5s00 or5s00m slayer ep5a00 ep5c00 ep5a00s ep5m00 ep5m00s mg5a00 xo3c00h}
		if {[lsearch $dev_lst $Para(arch)] != -1} {
			pack .frmByte -in $frmProperty -side top -anchor w
		}
		
		#*** checkbutton ***
		checkbutton .cbLUT  -text "Enable Output Register" -variable Para(outPipeline) -command {ChangeValueCmd}

		#*** Register Options ***
		frame .frmPath
		iwidgets::combobox .cboPath -labeltext "Input Data" -labelpos w -textvariable Para(InData) -width 20 -editable 0
		.cboPath.label config -width 15 -anchor w
		.cboPath insert list end "Registered"
		pack .cboPath -in .frmPath -side left -padx 20

		frame .frmAddr
		iwidgets::combobox .cboAddr -labeltext "Address Control" -labelpos w -textvariable Para(AdControl) -width 20 -editable 0
		.cboAddr insert list end "Registered"
		pack .cboAddr -in .frmAddr -side left -padx 20

		#*** Mem File ***
		frame .frmMemory
		iwidgets::entryfield .entMemFile -labeltext "Memory File" -labelpos w -width 30 \
			-textvariable Para(MemFile)
		button .btnMemFile -text "..." -width 2 -command {
	#		set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
	#		if {$ret != "" }  {
	#			set Para(MemFile) $ret
	#		} 
		}
		pack .entMemFile .btnMemFile -in .frmMemory -side left

	#**********************************
	#GUI for mg5g00, ep5g00, and or5s00 device.
	#**********************************
		pack .cbLUT -in $frmProperty -side top -anchor w -padx 20 -pady 4

		#checkbutton .ckGSR -text "Enable GSR" -variable Para(GSR) -offvalue Disabled -onvalue Enabled -command {ChangeValueCmd}
		#pack .ckGSR -in $frmProperty -side top -anchor w -padx 20

		frame .frmReset
		label .lblReset -text "Reset Mode" -width 14 -anchor w
		radiobutton .rdo1Reset -text Async -width 8 -value Async -variable Para(Reset) -anchor w -command {ChangeResetCmd;ChangeValueCmd}
		radiobutton .rdo2Reset -text Sync  -width 8 -value Sync  -variable Para(Reset) -anchor w -command {ChangeResetCmd;ChangeValueCmd}
		pack .lblReset .rdo1Reset .rdo2Reset -in .frmReset -side left
		pack .frmReset -in $frmProperty -side top -anchor w -padx 20 -pady 4
		
		frame .frmOptimize
		label .lblOptimize -text "Optimization" -width 14 -anchor w
		radiobutton .rdo1Optimize -text Area -width 8 -value Area -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Optimize -text Speed  -width 8 -value Speed  -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		pack .lblOptimize .rdo1Optimize .rdo2Optimize -in .frmOptimize -side left
		pack .frmOptimize -in $frmProperty -side top -anchor w -padx 20 -pady 4
		
		.entRData config -labeltext "Data Width" -fixed 4
		.entWData config -labeltext "Data Width" -fixed 4

		pack .frmMemory -in $frmProperty -side top -fill x -padx 20 -pady 2
		#22796 - radio button "Orca" to "Addressed Hex"
		Create3RadioItem $frmProperty MFormat "Memory File Format:" 18 "Binary" bin "Hex" hex "Addressed Hex" orca 6 left Para(MemFormat) {}
		.rdo3MFormat config -width 13

		.lblSize config -text "Specify the size of RAM_DP"
		.entRAddress config -labeltext "Address Depth"
		.entWAddress config -labeltext "Address Depth"

		.btnMemFile config -command {
			set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
			if {$ret != "" }  {
				set Para(Mem_File) $ret
				Convert $ret
			} 
		}

		.entRAddress.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
		.entRData.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
		.entWAddress.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
		.entWData.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
		
		if {$Para(arch) == "ep5c00"} {
			pack forget .frmReset
		}

	#DTS25358 SC:remove MMgui EBR advanced tab option 2005/03/08
	#if {$Para(arch) == "or5s00"}  {
	#	set page1 [$tnb add -label "Advanced"]
	#	iwidgets::Labeledframe .frmAdvanced
	#	set frmAdvanced [.frmAdvanced childsite]

	#	set txt "Disable Initialization of Memory during Reconfiguration"
	#	checkbutton .cbDisInit -text $txt -variable Para(no_init_recof)
	#	pack .cbDisInit -in $frmAdvanced -side top -anchor w -padx 20

	#	pack .frmAdvanced -in $page1 -side top -fill both -expand 1
	#}
	
	checkbutton .ckEnECC -text "Enable ECC (not supported for Data Width > 64)" -variable Para(EnECC) -command {ChangeValueCmd}
	pack .ckEnECC -in $frmProperty -side top -anchor w -padx 20 -pady 2
	
	iwidgets::combobox .cboPipeline -labeltext "Pipeline Stages for Q and ERROR Outputs" -width 4 -editable false -textvariable Para(Pipeline) \
		-selectioncommand {ChangeValueCmd}
	.cboPipeline insert list end 0 1 2
	pack .cboPipeline -in $frmProperty -side top -anchor w -padx 40 -pady 2

	if {$Para(arch) == "ep5c00"} {
		#checkbutton .ckEnSleep -text "Enable Sleep Mode" -variable Para(EnSleep) -command {} -state disabled -onvalue ENABLED -offvalue DISABLED
		#pack .ckEnSleep -in $frmProperty -side top -anchor w -padx 20
	}

	pack .frmProperties -in $page -side top -fill both -expand 1

	ChangeValueCmd
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}