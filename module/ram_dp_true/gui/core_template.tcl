#$Header: L:/module/ram_dp_true/gui/rcs/core_template.tcl 1.29 2009/11/20 07:22:24Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc GetDevType {} {
	global Para

	regexp {(^[a-zA-Z0-9]+)-([0-9]+)?(.*)$} $Para(PartType) match x y z
	set Para(dev_type) $z
	return $z
	#tk_messageBox -default ok -icon info -message $Para(dev_type) -title GetDevType -type ok
}

proc CallDrawPins {}  {
	global Para
	#28189
	if {$Para(AAddress) >0 &&
		$Para(AData)    >0 &&
		$Para(BAddress) >0 &&
		$Para(BData)    >0}  {DrawPins}
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
	
	set Para(AAddress) [string trimleft $Para(AAddress) 0]
	set Para(BAddress) [string trimleft $Para(BAddress) 0]
	set Para(AData) [string trimleft $Para(AData) 0]
	set Para(BData) [string trimleft $Para(BData) 0]
	set ratio 0
	if {$Para(BData) < 9} {
		set Para(enByte) 0
		.cbByte config -state disabled
	}
	if {$Para(BData) == 9} {
		if {$Para(AData)    > 0 &&
			$Para(BData)    > 0}  {
			set ratio [expr $Para(AData)*1.0/$Para(BData)]
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
	if {$Para(BData) > 9} {
		if {$Para(AData)    > 0 &&
			$Para(BData)    > 0}  {
			set ratio [expr $Para(AData)*1.0/$Para(BData)]
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

	if {$Para(AData)>64 || $Para(BData)>64 || $Para(enByte) == "1"} {
		.ckEnECC config -state disable
		set Para(EnECC) 0
	} else {
		if {$Para(AData)!=$Para(BData)} {
			.ckEnECC config -state disable
			set Para(EnECC) 0
		} else {
			.ckEnECC config -state normal
		}
	}
	
	if {$Para(enByte) == "1"} {
#		.cboByte config -state normal
	} else {
#		.cboByte config -state disabled
	}

	#cr_42180
	#"Read before Write" option should not be supported for SC/SCM/ECP2/ECP2M/ECP2S/ECP2MS/XP2/ECP3E
	set arch_lst {slayer or5s00 or5s00m ep5a00 ep5a00s ep5m00 ep5m00s mg5a00 xo3c00h}
	if {[lsearch $arch_lst $Para(arch)] != -1 ||
		($Para(arch) == "ep5c00" && [GetDevType] == "E")}  {
		.rdo3PortAWM config -state disabled
		.rdo3PortBWM config -state disabled

		if {$Para(WriteA) == "ReadBeforeWrite" ||
			$Para(WriteB) == "ReadBeforeWrite"} {
			set tit "Warning"
			set msg "The source LPC file contains \"Read before Write\" option and this option is not\n \
					 supported for this family. The option will be set to default \"Normal\" mode."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		}

		if {$Para(WriteA) == "ReadBeforeWrite"} {
			set Para(WriteA) Normal
		}

		if {$Para(WriteB) == "ReadBeforeWrite"} {
			set Para(WriteB) Normal
		}
	} else {
		.rdo3PortAWM config -state normal
		.rdo3PortBWM config -state normal
	}
	
	#note 3
	if {$Para(EnECC) == 0} {
		.cboPipeline config -state disabled
	} else {
		.cboPipeline config -state normal
	}
	
	CallDrawPins
}

proc ChangeDataWidth {}  {
	global Para

	switch $Para(AData) {
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
		18 {
			.cboWData clear list
			.cboWData insert list end 18 9
		}
	} 
#		if {[lsearch -exact [.cboWData get] $Para(WData)] == -1}  {
#			set Para(BData) [.cboWData get 0]
#		} 
} 

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para
	
	ChangeDataWidth
	DrawPins
}

proc DRC4XPA {}  {
	global Para

	set tit "Check Parameter"
	set msg "Read-before-Write is supported for memory configurations in x9, x18, x36 datawidth.\nData width should be set to match this requirement."
	if {$Para(CmdLine) != "SC_CMD"} {
		if {$Para(WriteA) == "ReadBeforeWrite"}  {
			if {[expr $Para(AData)%9] != 0}  {
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			} 
		} 
	}
	return 0
}

proc DRC4XPB {}  {
	global Para

	set tit "Check Parameter"
	set msg "Read-before-Write is supported for memory configurations in x9, x18, x36 datawidth.\nData width should be set to match this requirement."
	if {$Para(CmdLine) != "SC_CMD"} {
		if {$Para(WriteB) == "ReadBeforeWrite"}  {
			if {[expr $Para(BData)%9] != 0}  {
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

	set ret [IsInRange "Address Depth of Port A" $MinAddWidth $MaxAddWidth $Para(AAddress)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width of Port A" $MinDataWidth $MaxDataWidth $Para(AData)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Address Depth of Port B" $MinAddWidth $MaxAddWidth $Para(BAddress)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width of Port B" $MinDataWidth $MaxDataWidth $Para(BData)]
	if {$ret == -1} {return -1}

	set a_size [expr $Para(AAddress)*$Para(AData)]
	set b_size [expr $Para(BAddress)*$Para(BData)]

	# removed memory size checking depend on #26579
	set msg "Total value of (Depth * Width) must be the same for A set and B set ports."
	if {$a_size != $b_size}  {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	set ret [DRC4XPA]
	if {$ret == -1}  {return -1}

	set ret [DRC4XPB]
	if {$ret == -1}  {return -1}

	#26607
	set ratio [expr $Para(AData)>$Para(BData)?$Para(AData)/$Para(BData):$Para(BData)/$Para(AData)]
	set msg "Ratio of Data Width values (Width/Width) cannot be greater than 16."
	if {$ratio > 16}  {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	set temp [expr int(ceil(log($ratio)/log(2)))]
	if {[expr pow(2,$temp) - $ratio] > 0}  {
		set msg "The ratio of write/read widths must be a power of 2."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	if {$Para(enByte) == 1} {
		set dev_lst {or5s00 or5s00m slayer ep5a00 ep5c00 ep5a00s ep5m00 ep5m00s mg5a00 xo3c00h}
		if {[lsearch $dev_lst $Para(arch)] != -1} {
			#ISPL_CR_39761 
			#if {[expr $Para(AData)/$Para(BData)] > 1.0} 
			if {$Para(AData) != $Para(BData)} {
				set msg "Please make sure Width A = Width B when Byte Enables is set."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
			set a $ratio
			if {$Para(AData) > $Para(BData)} {
				set b [expr ceil($Para(AData)/($Para(ByteSize)*1.0))/ceil($Para(BData)/($Para(ByteSize)*1.0))]
			} else {
				set b [expr ceil($Para(BData)/($Para(ByteSize)*1.0))/ceil($Para(AData)/($Para(ByteSize)*1.0))]
			}
			if {$a != $b} {
				set msg "The ratio of write/read bits must equal the ratio of write/read bytes."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
	}

	return 0
} 

proc CheckOr5s00Para {}  {
	global Para data_lst

	set MinAddWidth [GetMinAddWidthRange]
	set MaxAddWidth [GetMaxAddWidthRange]
	set MinDataWidth [GetMinDataWidthRange]
	set MaxDataWidth [GetMaxDataWidthRange]

	set ret [IsInRange "Address Depth of Port A" $MinAddWidth $MaxAddWidth $Para(AAddress)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width of Port A" $MinDataWidth $MaxDataWidth $Para(AData)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Address Depth of Port B" $MinAddWidth $MaxAddWidth $Para(BAddress)]
	if {$ret == -1} {return -1}
	set ret [IsInRange "Data Width of Port B" $MinDataWidth $MaxDataWidth $Para(BData)]
	if {$ret == -1} {return -1}

	set a_size [expr $Para(AAddress)*$Para(AData)]
	set b_size [expr $Para(BAddress)*$Para(BData)]
	set tit "Check Parameter"
	set msg "Total value of (Depth * Width) must be the same for A set and B set ports."
	if {$a_size != $b_size}  {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	#26607
	set ratio [expr $Para(AData)>$Para(BData)?$Para(AData)/$Para(BData):$Para(BData)/$Para(AData)]
	set msg "Ratio of Data Width values (Width/Width) cannot be greater than 16."
	if {$ratio > 16}  {
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	set temp [expr int(ceil(log($ratio)/log(2)))]
	if {[expr pow(2,$temp) - $ratio] > 0}  {
		set msg "The ratio of write/read widths must be a power of 2."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	if {$Para(enByte) == 1} {
		set dev_lst {or5s00 or5s00m slayer ep5a00 ep5c00 ep5a00s ep5m00 ep5m00s mg5a00 xo3c00h}
		if {[lsearch $dev_lst $Para(arch)] != -1} {
			#ISPL_CR_39761 
			#if {[expr $Para(AData)/$Para(BData)] > 1.0} 
			if {$Para(AData) != $Para(BData)} {
				set msg "Please make sure Width A = Width B when Byte Enables is set."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
			set a $ratio
			if {$Para(AData) > $Para(BData)} {
				set b [expr ceil($Para(AData)/($Para(ByteSize)*1.0))/ceil($Para(BData)/($Para(ByteSize)*1.0))]
			} else {
				set b [expr ceil($Para(BData)/($Para(ByteSize)*1.0))/ceil($Para(AData)/($Para(ByteSize)*1.0))]
			}
			if {$a != $b} {
				set msg "The ratio of write/read bits must equal the ratio of write/read bytes."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
	}

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
		default {set ret 0}
	} 
	
	return $ret
}

proc GeneralCmdLine {}  {
	global Para
	set str "-arch $Para(arch) -type ramdp"
	lappend str -aaddr_width $Para(AAddress) -widtha $Para(AData)
	lappend str -baddr_width $Para(BAddress) -widthb $Para(BData)
	lappend str -anum_words [expr int(pow(2,$Para(AAddress)))]
	lappend str -bnum_words [expr int(pow(2,$Para(BAddress)))]
	if {$Para(enByte) == "1"} {lappend str -byte $Para(ByteSize)}
	if {$Para(AoutPipeline) == "1"} {lappend str -outdataA REGISTERED} 
	if {$Para(BoutPipeline) == "1"} {lappend str -outdataB REGISTERED} 
	if {$Para(AadPipeline) == "1"} {lappend str -adAPipeline}
	if {$Para(BadPipeline) == "1"} {lappend str -adBPipeline}
	if {$Para(AinPipeline) == "1"} {lappend str -inAPipeline}
	if {$Para(BinPipeline) == "1"} {lappend str -inBPipeline}
	if {$Para(AMOR) == "1"} {lappend str -outAPipeline}
	if {$Para(BMOR) == "1"} {lappend str -outBPipeline}

	if [string length $Para(MemFile)] {
		lappend str -memfile $Para(MemFile) -memformat $Para(MemFormat)
	}
	return $str
} 

proc Mg5g00CmdLine {}  {
	global Para
	set str "-arch $Para(arch) -type ramdp -device $Para(PartType)"
#	lappend str -aaddr_width $Para(AAddress) -widtha $Para(AData)
#	lappend str -baddr_width $Para(BAddress) -widthb $Para(BData)
#	lappend str -anum_words [expr int(pow(2,$Para(AAddress)))]
#	lappend str -bnum_words [expr int(pow(2,$Para(BAddress)))]
	lappend str -aaddr_width [expr int(ceil(log($Para(AAddress))/log(2)))] -widtha $Para(AData)
	lappend str -baddr_width [expr int(ceil(log($Para(BAddress))/log(2)))] -widthb $Para(BData)
	lappend str -anum_words $Para(AAddress)
	lappend str -bnum_words $Para(BAddress)
	if {$Para(enByte) == "1"} {lappend str -byte $Para(ByteSize)}
	if {$Para(AoutPipeline) == "1"} {lappend str -outdataA REGISTERED} 
	if {$Para(BoutPipeline) == "1"} {lappend str -outdataB REGISTERED} 
	if {$Para(AadPipeline) == "1"} {lappend str -adAPipeline}
	if {$Para(BadPipeline) == "1"} {lappend str -adBPipeline}
	if {$Para(AinPipeline) == "1"} {lappend str -inAPipeline}
	if {$Para(BinPipeline) == "1"} {lappend str -inBPipeline}
	if {$Para(AMOR) == "1"} {lappend str -outAPipeline}
	if {$Para(BMOR) == "1"} {lappend str -outBPipeline}

	#lappend str -gsr [string toupper $Para(GSR)]
	lappend str -writemodeA [string toupper $Para(WriteA)]
	lappend str -writemodeB [string toupper $Para(WriteB)]
	if {$Para(arch) != "ep5c00"} {lappend str -resetmode [string toupper $Para(Reset)]}
	if {$Para(Pad)}  {lappend str -buffer} 

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

#*** Command-Line for or5s00 device
proc Or5s00CmdLine {}  {
	global Para

	set str "-arch $Para(arch) -type bram -wp 11 -rp 1010 -num_rows $Para(AAddress) -data_width $Para(AData)"
	lappend str -rdata_width $Para(BData)
	if {$Para(AoutPipeline) == 1}  {lappend str -read_reg0 outreg} 
	if {$Para(BoutPipeline) == 1}  {lappend str -read_reg1 outreg} 
	if [string length $Para(MemFile)] {lappend str -memfile $Para(MemFile) -memformat $Para(MemFormat)}
	if {$Para(enByte) == "1"} {lappend str -byte $Para(ByteSize)}
	#lappend str -gsr [string toupper $Para(GSR)]
	if {$Para(Reset) == "Sync"} {lappend str -sync_reset}

	switch $Para(WriteA)  {
		Normal {set mode0 0}
		WriteThrough {set mode0 1}
		ReadBeforeWrite {set mode0 2}
	} 
	switch $Para(WriteB)  {
		Normal {set mode1 0}
		WriteThrough {set mode1 1}
		ReadBeforeWrite {set mode1 2}
	} 
	lappend str -write_mode_0 $mode0 -write_mode_1 $mode1
	#if {$Para(no_init_recof) == "1"} {lappend str -no_init_recof} 
	
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
		SC_CMD  {set str [Or5s00CmdLine ]}
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
	global Para diagram tnb tcl_platform pin_flag

	package require OrcaModule

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface
	switch $tcl_platform(platform) {
			windows {AttributeSetting 450 425}
			unix {AttributeSetting 450 455}
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
		label .lblSize -text "Specify the size of the block RAM_DP_TRUE" 
		pack .lblSize -in $frmProperty -side top -anchor w -padx 20 -pady 5

		frame .frmTitle
		label .lblTitle -width 20
		label .lblPortA -text "Port A"  -width 8
		label .lblPortB -text "Port B"  -width 8
		pack .lblTitle .lblPortA .lblPortB -in .frmTitle -side left -padx 10
		pack .frmTitle -in $frmProperty -side top -anchor w -padx 20

		frame .frmAddSize
		label .lblAddSize -text "Address Size"  -width 20 -anchor w
		entry .entAAddSize -width 8 -textvariable Para(AAddress)
		entry .entBAddSize -width 8 -textvariable Para(BAddress)
		pack .lblAddSize .entAAddSize .entBAddSize -in .frmAddSize -side left -padx 10
		pack .frmAddSize -in $frmProperty -side top -anchor w -padx 20

		frame .frmDataSize
		label .lblDataSize -text "Data Size"  -width 20 -anchor w
		entry .entADataSize -width 8 -textvariable Para(AData)
		entry .entBDataSize -width 8 -textvariable Para(BData)
		pack .lblDataSize .entADataSize .entBDataSize -in .frmDataSize -side left -padx 10
		pack .frmDataSize -in $frmProperty -side top -anchor w -padx 20 -pady 5

		#*** checkbutton ***
		frame .frmAddress
		label .lblAddress -text "Enable Address Input\nPipeline Register"  -width 20 -anchor w
		checkbutton .cbAAddress -text "Port A"  -width 5 -variable Para(AadPipeline)
		checkbutton .cbBAddress -text "Port B"  -width 5 -variable Para(BadPipeline)
		pack .lblAddress .cbAAddress .cbBAddress -in .frmAddress -side left -padx 10

		frame .frmData
		label .lblData -text "Enable Data Input\nPipeline Register"  -width 20 -anchor w
		checkbutton .cbAData -text "Port A"  -width 5 -variable Para(AinPipeline)
		checkbutton .cbBData -text "Port B"  -width 5 -variable Para(BinPipeline)
		pack .lblData .cbAData .cbBData -in .frmData -side left -padx 10

		frame .frmOutput
		label .lblOutput -text "Enable Output Register"  -width 20 -anchor w
		checkbutton .cbAOutput -text "Port A"  -width 5 -variable Para(AoutPipeline)
		checkbutton .cbBOutput -text "Port B"  -width 5 -variable Para(BoutPipeline)
		pack .lblOutput .cbAOutput .cbBOutput -in .frmOutput -side left -padx 10

		frame .frmMOR
		label .lblMOR -text "Enable Memory Ouput\nRegister (MOR)"  -width 20 -anchor w
		checkbutton .cbAMOR -text "Port A"  -width 5 -variable Para(AMOR)
		checkbutton .cbBMOR -text "Port B"  -width 5 -variable Para(BMOR)
		pack .lblMOR .cbAMOR .cbBMOR -in .frmMOR -side left -padx 10

		#*** Register Options ***
		frame .frmPath
		label .lblPath -text "Input Data"  -width 20 -anchor w
		iwidgets::combobox .cboAPath -textvariable Para(AInData) -width 10 -editable 0
		.cboAPath insert list end "Registered"
		pack .lblPath .cboAPath -in .frmPath -side left -padx 8

		frame .frmAddr
		label .lblAddr -text "Address Control"  -width 20 -anchor w
		iwidgets::combobox .cboAAddr -textvariable Para(AAdControl) -width 10 -editable 0
		.cboAAddr insert list end "Registered"

		pack .lblAddr .cboAAddr -in .frmAddr -side left -padx 8

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
	#GUI for mg5g00 & ep5g00 device.
	#**********************************
	#	wm title . "Lattice Module -- EBR $Para(CoreName)"

		.lblSize config -text "Specify the size of RAM_DP_TRUE"
		pack forget .frmTitle .frmAddSize .frmDataSize .frmOutput
		pack forget .frmPath .frmAddr

		iwidgets::Labeledframe .frmPortA -labeltext "Port A" -labelpos nw
		set portA [.frmPortA childsite]
		frame .frmAddDataA

		frame .frmAddA
		iwidgets::entryfield .entAddA  -labeltext "Address Depth" -labelpos w -width 8 -textvariable Para(AAddress) -validate numeric -fixed 6
		label .lblAddARange -text "($MinAddWidth-$MaxAddWidth)"
		pack .entAddA .lblAddARange -in .frmAddA -side left

		frame .frmDataA
		iwidgets::entryfield .entDataA -labeltext "Data Width" -labelpos w -width 8 -textvariable Para(AData) -validate numeric -fixed 4
		label .lblDataA -text "($MinDataWidth-$MaxDataWidth)"
		pack .entDataA .lblDataA -in .frmDataA -side left
		pack .frmAddA .frmDataA -in .frmAddDataA -side left -padx 5
		checkbutton .cbOutputA -text "Enable Output Register" -variable Para(AoutPipeline)
		pack .frmAddDataA -in $portA -side top -anchor w -padx 1
		pack .cbOutputA   -in $portA -side top -anchor w -padx 10

		iwidgets::Labeledframe .frmPortB -labeltext "Port B" -labelpos nw
		set portB [.frmPortB childsite]
		frame .frmAddDataB

		frame .frmAddB
		iwidgets::entryfield .entAddB  -labeltext "Address Depth" -labelpos w -width 8 -textvariable Para(BAddress) -validate numeric -fixed 6
		label .lblAddBRange -text "($MinAddWidth-$MaxAddWidth)"
		pack .entAddB .lblAddBRange -in .frmAddB -side left

		frame .frmDataB
		iwidgets::entryfield .entDataB -labeltext "Data Width" -labelpos w -width 8 -textvariable Para(BData) -validate numeric -fixed 4
		label .lblDataB -text "($MinDataWidth-$MaxDataWidth)"
		pack .entDataB .lblDataB -in .frmDataB -side left
		pack .frmAddB .frmDataB -in .frmAddDataB -side left -padx 5
		checkbutton .cbOutputB -text "Enable Output Register" -variable Para(BoutPipeline)
		pack .frmAddDataB -in $portB -side top -anchor w -padx 1
		pack .cbOutputB   -in $portB -side top -anchor w -padx 10

		#*** Byte Enable ***
		#Byte Enable is only for SC, ECP2*, XP2, and ECP3
		frame .frmByte
		checkbutton .cbByte -text "Provide Byte Enables" -variable Para(enByte) -command {ChangeValueCmd}
		iwidgets::combobox .cboByte -labeltext "Byte Size" -width 4 -editable false -textvariable Para(ByteSize) \
			-selectioncommand {ChangeValueCmd}
		.cboByte insert list end 8 9
		pack .cbByte .cboByte -in .frmByte -side left -padx 20

		#checkbutton .ckGSR -text "Enable GSR" -variable Para(GSR) -offvalue Disabled -onvalue Enabled

		frame .frmReset
		label .lblReset -text "Reset Mode" -width 10 -anchor w
		radiobutton .rdo1Reset -text Async -width 8 -value Async -variable Para(Reset) -anchor w -command {ChangeResetCmd;ChangeValueCmd}
		radiobutton .rdo2Reset -text Sync  -width 8 -value Sync  -variable Para(Reset) -anchor w -command {ChangeResetCmd;ChangeValueCmd}
		pack .lblReset .rdo1Reset .rdo2Reset -in .frmReset -side left -padx 8

		frame .frmOptimize
		label .lblOptimize -text "Optimization" -width 10 -anchor w
		radiobutton .rdo1Optimize -text Area -width 8 -value Area -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		radiobutton .rdo2Optimize -text Speed  -width 8 -value Speed  -variable Para(Optimization) -anchor w -command {ChangeValueCmd}
		pack .lblOptimize .rdo1Optimize .rdo2Optimize -in .frmOptimize -side left -padx 8

	#	frame .frmGSR
	#	label .lblGSR -text "GSR" -width 10 -anchor w
	#	radiobutton .rdo1GSR -text Enabled   -width 8 -value Enabled   -variable Para(GSR) -anchor w
	#	radiobutton .rdo2GSR -text Disabled  -width 8 -value Disabled  -variable Para(GSR) -anchor w
	#	pack .lblGSR .rdo1GSR .rdo2GSR -in .frmGSR -side left -padx 8

		pack .frmPortA   -in $frmProperty -side top -fill x
		pack .frmPortB   -in $frmProperty -side top -fill x
		set dev_lst {or5s00 or5s00m slayer ep5a00 ep5c00 ep5a00s ep5m00 ep5m00s mg5a00 xo3c00h}
		if {[lsearch $dev_lst $Para(arch)] != -1} {
			pack .frmByte -in $frmProperty -side top -anchor w -pady 2
		}
		#pack .ckGSR      -in $frmProperty -side top -anchor w -padx 20
		pack .frmReset	 -in $frmProperty -side top -fill x -padx 20 -pady 2
	#	pack .frmGSR	 -in $frmProperty -side top -fill x -pady 2  -padx 20
		pack .frmOptimize -in $frmProperty -side top -fill x -padx 20 -pady 2
		pack .frmMemory  -in $frmProperty -side top -fill x -pady 2  -padx 20
		#22796 - radio button "Orca" to "Addressed Hex"
		Create3RadioItem $frmProperty MFormat "Memory File Format:" 18 "Binary" bin "Hex" hex "Addressed Hex" orca 6 left Para(MemFormat) {}
		.rdo3MFormat config -width 13

		set page1 [$tnb add -label "Advanced"]
		iwidgets::Labeledframe .frmAdvanced
		set frmAdvanced [.frmAdvanced childsite]

		#Port A Write Mode
		label .lblWriteModeA -text "Port A Write Mode" -anchor w
		pack .lblWriteModeA -in $frmAdvanced -side top -anchor w -padx 25
		Create3RadioItem $frmAdvanced PortAWM "" 20 \
			"Normal" Normal \
			"Write Through" WriteThrough \
			"Read before Write" ReadBeforeWrite 15 top Para(WriteA) DRC4XPA
		pack .frmPortAWM -in $frmAdvanced -side top -anchor w -padx 40

		frame .sep2 -width 320 -height 2 -borderwidth 1 -relief sunken
		pack .sep2 -in $frmAdvanced -side top -anchor center -pady 5

		#Port B Write Mode
		label .lblWriteModeB -text "Port B Write Mode" -anchor w
		pack .lblWriteModeB -in $frmAdvanced -side top -anchor w -padx 25
		Create3RadioItem $frmAdvanced PortBWM "" 20 \
			"Normal" Normal \
			"Write Through" WriteThrough \
			"Read before Write" ReadBeforeWrite 15 top Para(WriteB) DRC4XPB
		pack .frmPortBWM -in $frmAdvanced -side top -anchor w -padx 40

		pack .frmAdvanced -in $page1 -side top -fill both -expand 1
		.btnMemFile config -command {
			set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
			if {$ret != "" }  {
				set Para(Mem_File) $ret
				Convert $ret
			} 
		}

	# DTS-22715
	#	pack forget .entDataA .entDataB 

	#	iwidgets::combobox .cboRData -labeltext "Data Width" -labelpos w -textvariable Para(AData) -width 8 -editable 0 -selectioncommand {ChangeDataWidth}
	#	.cboRData insert list end 18 16 9 8 4 2 1
	#	pack .cboRData -in .frmAddDataA -side left -padx 10

	#	iwidgets::combobox .cboWData -labeltext "Data Width" -labelpos w -textvariable Para(BData) -width 8 -editable 0
	#	.cboWData insert list end 16 8 4 2 1
	#	pack .cboWData -in .frmAddDataB -side left -padx 10

		.entAddA.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
		.entDataA.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
		.entAddB.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
		.entDataB.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	#	.cbOutputA config -command DrawPins
	#	.cbOutputB config -command DrawPins
	#	.ckGSR     config -command DrawPins
	#	.rdo1Reset config -command DrawPins
	#	.rdo2Reset config -command DrawPins
		if {$Para(arch) == "ep5c00"} {
			pack forget .frmReset
		}

	#DTS25358 SC: remove MM gui EBR advanced tab option 2005/03/08
	#if {$Para(arch) == "or5s00"}  {
	#	checkbutton .cbDisInit -text "Disable Initialization of Memory during Reconfiguration" -variable Para(no_init_recof)
	#	pack .cbDisInit -in $frmAdvanced -side top -anchor w -padx 20 -pady 8
	#}
	
	checkbutton .ckEnECC -text "Enable ECC (not supported for Data Width > 64)" -variable Para(EnECC) -command {ChangeValueCmd}
	pack .ckEnECC -in $frmProperty -side top -anchor w -padx 20 -pady 2
	
	iwidgets::combobox .cboPipeline -labeltext "Pipeline Stages for Q and ERROR Outputs" -width 4 -editable false -textvariable Para(Pipeline) \
		-selectioncommand {ChangeValueCmd}
	.cboPipeline insert list end 0 1 2
	pack .cboPipeline -in $frmProperty -side top -anchor w -padx 40 -pady 2

		pack .frmProperties -in $page -side top -fill both -expand 1

	ChangeValueCmd
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}