#$Header: L:/module/ufm/wi5s00/gui/core_template.tcl 1.1  Exp $

#Rev 1.1: Diamond 3.6: intial ver.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para pin_flag
	
	if {$Para(mem_size) > 0} {
		DrawPins
	}

}


proc GetDeviceDensity {}  {
	global Para
	# Following Modules for MachXO,MachXO2 are only support for 1/2k device.
	if {$Para(arch) == "xo2c00" || $Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
		regexp {(^[a-zA-Z0-9]+)-([0-9]+)?(.*)$} $Para(PartType) match x y z
	}
	#! POJO2
	if {$Para(arch) == "xo2c00p"} {
		set a [string range $Para(PartType) 5 5]
		switch $a {
			"0" {set y 640}
			"1" {set y 1200}
			"4" {set y 4000}
			"7" {set y 7000}
		}
	}
	#if {$y == 256 || $y == 640}  {set EBR_Dev_Flag 0}
	#tk_messageBox -default ok -icon warning -message $y -title $Para(PartType) -type ok
	set y 6000
	return $y
} 

proc ChangeValueCmd {} {
	global Para	
	
	set density [GetDeviceDensity]
	set max 0
	switch $density {
			"256" {set max 0}
			"640" {
				if { $u_flag == "false"} {
					set max 191
				} else {
					set max 511
				}
			}
			"1200" {
				if { $u_flag == "false"} {
					set max 511
				} else {
					set max 639
				}
			}
			"2000" {
				if { $u_flag == "false"} {
					set max 639
				} else {
					set max 767
				}
			}
			"4000" {set max 767}
			"6000" {set max 65024}
			"7000" {set max 2046}
			"10000" {set max 3582}
	}
	
	if {[string length $Para(mem_size)] >1} {
			set Para(mem_size) [string trimleft $Para(mem_size) 0]
	}
	if {$Para(mem_size) < 0} {
		set Para(ufm_ebr) $max
	} else {
		set Para(ufm_ebr) [expr $max - $Para(mem_size)]
	}
	
	if {$Para(ufm_init) == "0"} {
		.entufm_df config -state disabled
		.btnufm_df config -state disabled
		.rdo1ufm_dt config -state disabled
		.rdo2ufm_dt config -state disabled
	} else {
		.entufm_df config -state normal
		.btnufm_df config -state normal
		.rdo1ufm_dt config -state normal
		.rdo2ufm_dt config -state normal
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
	
	if {$Para(mem_size) <= 0} {
		set msg "Please Enter Number of Pages."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}
	if {$Para(ufm_ebr) < 0} {
		set msg "Initialization Data Starts at Page should >= 0."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}
	if {$Para(ufm_init) != "0"} {
		if [string length $Para(memfile)] {
			if {[file exists $Para(memfile)] == "0"} {
				set msg "Memory file $Para(memfile) doesn't exist!"
				#CR_51945
#					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
#					return -1
			}
		}
	}
	
	return 0
}

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for snow device
proc SnowCmdLine {}  {
	global Para

	set str [list -type ufm -arch $Para(arch) ]
	
	#! UFM cmd-line
	lappend str -ufm_ebr $Para(ufm_ebr) -mem_size $Para(mem_size)
	if {$Para(ufm_init) == 0} {
		lappend str -ufm_0
	} else {
		if {[string length $Para(memfile)] > 0} {
			lappend str -memfile $Para(memfile) -memformat $Para(ufm_dt)
		}
	}
	
    set density [GetDeviceDensity]
	lappend str -dev $density


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
	
	set str [SnowCmdLine ]

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {
	global Para tcl_platform pin_flag
	
	global Para tcl_platform pin_flag mem_types

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 550 600
	set pin_flag 1
	DrawImage 220 300 

	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "UFM"]


	iwidgets::labeledframe .csUfm
	set csUfm [.csUfm childsite]
	
	iwidgets::labeledframe .csufm_uu -labeltext "Initialize User Flash Memory" -labelpos nw
	set csufm_uu [.csufm_uu childsite]
	iwidgets::entryfield .entryufm_remain -labeltext "Enter Number of Pages(128 bits in one Page)" -textvariable Para(mem_size) -width 8 -validate integer
	iwidgets::entryfield .entryufm_start  -labeltext "Initialization Data Starts at Page" -textvariable Para(ufm_ebr) -width 8 -validate integer -state disabled
	.entryufm_remain.label config -width 45 -anchor w
	.entryufm_start.label config -width 45 -anchor w
	pack .entryufm_remain .entryufm_start -in $csufm_uu -side top -anchor w -pady 2
	.entryufm_start config -disabledforeground black
	.entryufm_remain.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}
	
#	radiobutton .rdo1ufm_usage -text "TAG Memory Only" -value TAB_ONLY -variable Para(ufm_usage) -anchor w -command {ChangeValueCmd}
#	radiobutton .rdo2ufm_usage -text "Shared TAG Memory and EBR Initialization" -value SHARED_EBR_TAG -variable Para(ufm_usage) -anchor w -command {ChangeValueCmd}
#	pack .rdo1ufm_usage .rdo2ufm_usage -in $csufm_uu -side top -anchor w
	
#	iwidgets::labeledframe .csufm_sua -labeltext "Shared UFM Array" -labelpos nw
#	set csufm_sua [.csufm_sua childsite]
#	iwidgets::combobox .cboufm_ebr -labeltext "Number of EBR Blocks with Unique Initialization Data" -width 4 -editable false -textvariable Para(ufm_ebr) -selectioncommand {ChangeValueCmd}
#	iwidgets::entryfield .entryufm_remain -labeltext "The Number of Remaining TAG Bytes" -textvariable Para(ufm_remain) -width 8 -validate integer -state disabled
#	iwidgets::entryfield .entryufm_start  -labeltext "Starting TAG Address" -textvariable Para(ufm_start) -width 8 -validate integer -state disabled
#	.cboufm_ebr.label config -width 42 -anchor w
#	.entryufm_remain.label config -width 30 -anchor w
#	.entryufm_start.label config -width 30 -anchor w
#	pack .cboufm_ebr .entryufm_remain .entryufm_start -in $csufm_sua -side top -anchor w -pady 2
	
	set mem_types {
		{"Memory files"		{.mem}	}
		{"All files"		{*.*}	}
	}
	radiobutton .rdo1ufm_usage -text "User Flash Memory Is Initialized With All 0s" -value 0 -variable Para(ufm_init) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_usage -text "Upload User Flash  Memory Initialization Data File" -value mem -variable Para(ufm_init) -anchor w -command {ChangeValueCmd}

	#	label .lblufm_df -text "Upload TAG Initialization Data File (Optional)"
	frame .frmufm_df
	iwidgets::entryfield .entufm_df -width 40 -textvariable Para(memfile)
	button .btnufm_df -text "..." -width 2 -command {
		set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
		if {$ret != "" }  {
			set Para(memfile) $ret
			Convert $ret
			#CR_51945
			set Para(memfile) [file tail $ret]
		} 
	}
	pack .entufm_df .btnufm_df -in .frmufm_df -side left
	frame .frmufm_dt
	radiobutton .rdo1ufm_dt -text "Binary" -value bin -variable Para(ufm_dt) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_dt -text "Hexadecimal"    -value hex -variable Para(ufm_dt) -anchor w -command {ChangeValueCmd}
	pack .rdo2ufm_dt .rdo1ufm_dt -in .frmufm_dt -side left
	
#	pack .csufm_uu .csufm_sua -in $csUfm -side top -fill x
	pack .csufm_uu -in $csUfm -side top -fill x
	pack .rdo1ufm_usage .rdo2ufm_usage -in $csUfm -side top -anchor w -padx 20
	pack .frmufm_df .frmufm_dt -in $csUfm -side top -anchor w -padx 30
	pack .csUfm -in $page -fill x
	
	
	GeneralConfig

	ChangeValueCmd

	pack forget .cboBusOrder 
	
	$tnb delete 0
	$tnb view 0
}