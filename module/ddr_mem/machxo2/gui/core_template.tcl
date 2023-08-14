#$Header: x:/module/ddr_mem/machxo2/gui/core_template.tcl 1.4 mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

#Rev 1.3: Fixed cr_48428,48433
#Rev 1.4: #48422-UM Rev 2.17
		#48696-UM Rev 2.18	

package provide core_template 1.0.0

proc GetDevType {} {
	global Para

	regexp {(^[a-zA-Z0-9]+)-([0-9]+)?(.*)$} $Para(PartType) match x y z
	set Para(dev_type) $z
	#tk_messageBox -default ok -icon info -message $Para(dev_type) -title GetDevType -type ok
}

proc ChangeModeCmd {} {
	global Para
#DDR = 83 - 100MHz
#DDR2 = 125 - 150MHz
#LPDDR = 0 - 133MHz

	if {$Para(Mode) == "DDR"} {
		if {$Para(Frequency) < "83" || $Para(Frequency) > "100"} {
			set Para(Frequency) 100
		}
		set Para(num_clk) 1
		set Para(num_ce) 1
		set Para(addr_width) 13
		set Para(bank_width) 2
		set Para(num_odt) ""
		set Para(num_cs) 1		
	}
	if {$Para(Mode) == "DDR2"} {
		if {$Para(Frequency) < "125" || $Para(Frequency) > "150"} {
			set Para(Frequency) 150
		}
		set Para(num_clk) 1
		set Para(num_ce) 1
		set Para(addr_width) 14
		set Para(bank_width) 2
		set Para(num_odt) 1
		set Para(num_cs) 1		
	}
	if {$Para(Mode) == "LPDDR"} {
		if {$Para(Frequency) <= "0" || $Para(Frequency) > "133"} {
			set Para(Frequency) 133
		}
		set Para(num_clk) 1
		set Para(num_ce) 1
		set Para(addr_width) 13
		set Para(bank_width) 2
		set Para(num_odt) ""
		set Para(num_cs) 1		
	}
}

proc ChangeValueCmd {} {
	global Para
	
	#.cboFrequency clear list
	if {$Para(Mode) == "DDR"} {
		.cboIO_buffer clear list
		.cboIO_buffer insert list end SSTL25_I
		if {[lsearch {SSTL25_I} $Para(IO_buffer)] == -1} {set Para(IO_buffer) SSTL25_I}
		
		.cboDQSBuffer config -state disabled
		set Para(DQSBuffer) "Single-ended"
	}
	
	if {$Para(Mode) == "DDR2"} {
		.cboDQSBuffer config -state normal

		.cboIO_buffer clear list
		.cboIO_buffer insert list end SSTL18_I
		if {[lsearch {SSTL18_I} $Para(IO_buffer)] == -1} {set Para(IO_buffer) SSTL18_I}
	}
	
	if {$Para(Mode) == "LPDDR"} {
		.cboDQSBuffer config -state disabled
		set Para(DQSBuffer) "Single-ended"

		.cboIO_buffer clear list
		.cboIO_buffer insert list end LVCMOS18
		set Para(IO_buffer) LVCMOS18
	}
	
	for {set i 1} {$i < 3} {incr i} {
		if {$i <= $Para(Number)} {
			.lbldqs$i config -state normal
			.cbodqs$i config -state normal
		} else {
			.lbldqs$i config -state disabled
			.cbodqs$i config -state disabled
		}
	}
	
	if {$Para(cac) == "DISABLED"} {
		.lblnum_clk config -state disabled
		.lblnum_ce config -state disabled
		.lbladdr_width config -state disabled
		.lblbank_width config -state disabled
		.lblnum_odt config -state disabled
		.lblnum_cs config -state disabled
		
		.cbonum_clk config -state disabled
		.cbonum_ce config -state disabled
		.cboaddr_width config -state disabled
		.cbobank_width config -state disabled
		.cbonum_odt config -state disabled
		.cbonum_cs config -state disabled
		
		set Para(num_clk) ""
		set Para(num_ce) ""
		set Para(addr_width) ""
		set Para(bank_width) ""
		set Para(num_odt) ""
		set Para(num_cs) ""
	} else {
		.lblnum_clk config -state normal
		.lblnum_ce config -state normal
		.lbladdr_width config -state normal
		.lblbank_width config -state normal
		.lblnum_odt config -state normal
		.lblnum_cs config -state normal
		
		.cbonum_clk config -state normal
		.cbonum_ce config -state normal
		.cboaddr_width config -state normal
		.cbobank_width config -state normal
		.cbonum_odt config -state normal
		.cbonum_cs config -state normal
		
		if {$Para(num_clk) == ""} {set Para(num_clk) 1}
		if {$Para(num_ce) == ""} {set Para(num_ce) 1}
		if {$Para(Mode) == "DDR"} {
			.cbonum_clk clear list
			.cbonum_clk insert list end 1 2
			.cbonum_ce clear list
			.cbonum_ce insert list end 1 2
			.cboaddr_width clear list
			.cboaddr_width insert list end 12 13 14
			if {[lsearch {12 13 14} $Para(addr_width)] == -1} {set Para(addr_width) 13}
			.cbobank_width clear list
			.cbobank_width insert list end 2
			set Para(bank_width) 2
			.cbobank_width config -state disabled
			.cbonum_odt config -state disabled
			set Para(num_odt) ""
			.cbonum_cs clear list
			.cbonum_cs insert list end 1 2
			if {[lsearch {1 2} $Para(num_cs)] == -1} {set Para(num_cs) 1}
		}
		if {$Para(Mode) == "DDR2"} {
			.cbonum_clk clear list
			.cbonum_clk insert list end 1 2
			.cbonum_ce clear list
			.cbonum_ce insert list end 1 2
			.cboaddr_width clear list
			.cboaddr_width insert list end 13 14 15 16
			if {[lsearch {13 14 15 16} $Para(addr_width)] == -1} {set Para(addr_width) 14}
			.cbobank_width clear list
			.cbobank_width insert list end 2 3
			if {[lsearch {2 3} $Para(bank_width)] == -1} {set Para(bank_width) 2}
			.cbonum_odt clear list
			.cbonum_odt insert list end 1 2
			if {[lsearch {1 2} $Para(num_odt)] == -1} {set Para(num_odt) 1}
			.cbonum_cs clear list
			.cbonum_cs insert list end 1 2
			if {[lsearch {1 2} $Para(num_cs)] == -1} {set Para(num_cs) 1}
		}
		if {$Para(Mode) == "LPDDR"} {
			.cbonum_clk clear list
			.cbonum_clk insert list end 1
			set Para(num_clk) 1
			.cbonum_clk config -state disabled
			
			.cbonum_ce clear list
			.cbonum_ce insert list end 1
			set Para(num_ce) 1
			.cbonum_ce config -state disabled
			
			.cboaddr_width clear list
			.cboaddr_width insert list end 12 13 14
			if {[lsearch {12 13 14} $Para(addr_width)] == -1} {set Para(addr_width) 13}
			
			.cbobank_width clear list
			.cbobank_width insert list end 2
			set Para(bank_width) 2
			.cbobank_width config -state disabled
			
			.cbonum_odt config -state disabled
			set Para(num_odt) ""
			
			.cbonum_cs clear list
			.cbonum_cs insert list end 1
			set Para(num_cs) 1
			.cbonum_cs config -state disabled
		}
	}
	
	if {$Para(Number) == 2} {
		set Para(Width) [expr $Para(dqs1) + $Para(dqs2)]
	} else {
		set Para(Width) $Para(dqs1)
	}
	
	DrawPins
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

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para

	#set ret [IsInRange "Data Width" 2 72 $Para(Width)]
	#if {$ret == "-1"} {return -1}
	
	if {$Para(Mode) == "DDR"} {
		set min 83
		set max 100
	}
	if {$Para(Mode) == "DDR2"} {
		set min 125
		set max 150
	}
	if {$Para(Mode) == "LPDDR"} {
		set min 0
		set max 133
	}
	set ret [IsInRange "DDR Frequency" $min $max $Para(Frequency)]
	if {$ret == "-1"} {return -1}

	return 0
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para 
	
	#GetDevType

	set str "-arch $Para(arch) -type iol -mode mem"
	
	lappend str -io_type $Para(IO_buffer) -freq_in $Para(Frequency)
	for {set i 1} {$i <= $Para(Number)} {incr i} {
		lappend str -dqs $i $Para(dqs$i)
	}
	if {$Para(DQSBuffer)=="Differential"} {lappend str -dqs_diff}
	
	#lappend str -width $Para(Width) -sensitivity [string tolower $Para(Sensitivity)]
	lappend str -sensitivity [string tolower $Para(Sensitivity)]
	
	if {$Para(data_mask) == "ENABLED"} {lappend str -data_mask}
	if {$Para(cac) == "ENABLED"} {
		lappend str -num_clk $Para(num_clk) -num_ce $Para(num_ce) -addr_width $Para(addr_width) -bank_width $Para(bank_width)
		if {$Para(num_odt) != ""} {lappend str -num_odt $Para(num_odt)}
		lappend str -num_cs $Para(num_cs)
	} 
	
	return $str
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	#*** set private value ***

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface
	AttributeSetting 480 450
	set pin_flag 1
	DrawImage 250 350
	set tnb $Para(tnb)

	wm title . "Lattice FPGA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***
	
	#GetDevType

	set page [$tnb add -label "Configuration"]

	iwidgets::labeledframe .frmConfig -labeltext "" -labelpos nw
	set frmConfig [.frmConfig childsite]

	set w 22
	CreateLabelCombobox $frmConfig Mode "Interface" $w 10 Para(Mode) {DDR DDR2 LPDDR} {ChangeModeCmd;ChangeValueCmd}
	.lblMode config -anchor w
	
	set io_type_lst {SSTL25_I SSTL25_II SSTL18_I SSTL18_II LVCMOS18}
	CreateLabelCombobox $frmConfig IO_buffer "I/O Buffer Configuration" $w 16 Para(IO_buffer) $io_type_lst {ChangeValueCmd}
	.lblIO_buffer config -anchor w

	CreateLabelEntryLabel $frmConfig Frequency "DDR Frequency" 16 "MHz" "" Para(Frequency) real
	.lblFrequency config -width 22 -anchor w
#	set freq_list {125 200 266.667}
#	CreateLabelCombobox $frmConfig Frequency "Maximum DDR Frequency" $w 10 Para(Frequency) $freq_list {ChangeValueCmd}
#	.lblFrequency config -anchor w
#	.cboFrequency config -labeltext "MHz" -labelpos e

	#DQS Grouping
	iwidgets::labeledframe .frmDQSGrouping -labeltext "DQS Grouping" -labelpos nw
	set frmDQSGrouping [.frmDQSGrouping childsite]
	CreateLabelCombobox $frmDQSGrouping Number "Number of DQS" 16 8 Para(Number) {1 2} {ChangeValueCmd}
	.lblNumber config -anchor w
	pack .frmNumber -in $frmDQSGrouping -side top -anchor center
	
	frame .frame0
	frame .frmLeft
	CreateLabelCombobox .frmLeft dqs1 "DQS Group1" 16 4 Para(dqs1) {1 2 3 4 5 6 7 8} {ChangeValueCmd}
	.lbldqs1 config -anchor w
	frame .frmRight
	CreateLabelCombobox .frmRight dqs2 "DQS Group2" 16 4 Para(dqs2) {1 2 3 4 5 6 7 8} {ChangeValueCmd}
	.lbldqs2 config -anchor w
	pack .frmLeft .frmRight -in .frame0 -side left -padx 8
	pack .frame0 -in $frmDQSGrouping -side top -fill x
	
	CreateLabelCombobox $frmDQSGrouping DQSBuffer "DQS Buffer Configuration" 22 16 Para(DQSBuffer) {Single-ended Differential} {ChangeValueCmd}
	.lblDQSBuffer config -width 22 -anchor w
	CreateLabelEntryLabel $frmDQSGrouping Width "Data Width" 10 "" "" Para(Width) integer
	.entryWidth config -state disabled
	.lblWidth config -width 22 -anchor w
	
	pack .frmDQSGrouping -in $frmConfig -fill x
	
	checkbutton .ckcac -text "Clock / Address / Command" -variable Para(cac) -offvalue DISABLED -onvalue ENABLED -command ChangeValueCmd
	checkbutton .ckdata_mask -text "Data Mask" -variable Para(data_mask) -offvalue DISABLED -onvalue ENABLED -command ChangeValueCmd
	pack .ckcac .ckdata_mask -in $frmConfig -anchor w -padx 8
	
	CreateRadioItem $frmConfig Sensitivity "Lock/ Jitter Sensitivity" $w "HIGH" HIGH "LOW" LOW 8 left Para(Sensitivity) {ChangeValueCmd}
	.lblSensitivity config -anchor w

	pack .frmConfig -in $page -fill both -expand 1

	set w 24
	set page2 [$tnb add -label "Clock/Address/Command"]
	iwidgets::labeledframe .frmpage2 -labeltext "" -labelpos nw
	set frmpage2 [.frmpage2 childsite]
	CreateLabelCombobox $frmpage2 num_clk "Number of Clocks" $w 8 Para(num_clk) {1 2 4} {ChangeValueCmd}
	.lblnum_clk config -anchor w
	
	CreateLabelCombobox $frmpage2 num_ce "Number of Clock Enables" $w 8 Para(num_ce) {1 2 4} {ChangeValueCmd}
	.lblnum_ce config -anchor w

	CreateLabelCombobox $frmpage2 addr_width "Address Width" $w 8 Para(addr_width) {12 13 14 15 16} {ChangeValueCmd}
	.lbladdr_width config -anchor w

	CreateLabelCombobox $frmpage2 bank_width "Bank Address Width" $w 8 Para(bank_width) {2 3} {ChangeValueCmd}
	.lblbank_width config -anchor w

	CreateLabelCombobox $frmpage2 num_odt "Number of ODT" $w 8 Para(num_odt) {1 2 4} {ChangeValueCmd}
	.lblnum_odt config -anchor w

	CreateLabelCombobox $frmpage2 num_cs "Number of Chip Selects" $w 8 Para(num_cs) {1 2 4  8} {ChangeValueCmd}
	.lblnum_cs config -anchor w

	pack .frmpage2 -in $page2 -fill both -expand 1

	.cbEdif config -state disabled

	$tnb delete 0

	$tnb view 0

	pack forget .lblOrder .cboOrder .cbIO
	
	ChangeValueCmd

	#FunctionButton
	#CenterPosition
	GeneralConfig
}