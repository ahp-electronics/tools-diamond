#$Header: L:/module/ddr_71/latticeecp3/gui/rcs/core_template.tcl 1.2 2009/09/01 06:38:30Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(freq_in)] > 0}  {
		DrawPins
	} 
} 

proc ChangeValueCmd {} {
	global Para

	.cboio_type config -state disabled
	if {$Para(mode) == "Receive"} {
		set Para(io_type) "GDDRX2_RX.7:1"

		.lbldel config -state disabled
		.cbodel config -state disabled
		set Para(del) ""
	} else {
		set Para(io_type) "GDDRX2_TX.7:1"
		
		set del_lst {BYPASS DEL1 DEL2 DEL3 DEL4 DEL5 DEL6 DEL7}
		.lbldel config -state normal
		.cbodel config -state normal
		if {[lsearch $del_lst $Para(del)] == -1} {set Para(del) "BYPASS"}
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

	set ret [IsInRange "Clock Frequency" 4 500 $Para(freq_in)]
	if {$ret == "-1"} {return -1}

	return 0
}

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for ecp3 device
proc ECP3CmdLine {}  {
	global Para

	set str "-arch $Para(arch) -type iol"

	switch $Para(mode) {
	"Receive"          { lappend str -mode ddr71i}
	"Transmit"         { lappend str -mode ddr71o}
	}
	#lappend str -io_type $Para(io_type) 
	lappend str -freq_in $Para(freq_in)

	if {$Para(mode) == "Transmit"}  {
		switch $Para(del) {
		"BYPASS"    { lappend str -del -1 }
		"DEL1"	    { lappend str -del 1 }
		"DEL2"	    { lappend str -del 2 }
		"DEL3"	    { lappend str -del 3 }
		"DEL4"	    { lappend str -del 4 }
		"DEL5"	    { lappend str -del 5 }
		"DEL6"	    { lappend str -del 6 }
		"DEL7"	    { lappend str -del 7 }
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
	
	set str [ECP3CmdLine ]

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 400 320
	set pin_flag 1
	DrawImage 220 300 

	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

		set page [$tnb add -label "Configuration"]

		iwidgets::labeledframe .setframe
		set setframe [.setframe childsite]

		set w 26
		CreateLabelCombobox $setframe mode "Interface Type" $w 16 Para(mode) {Transmit Receive} {ChangeValueCmd}
		.lblmode config -anchor w
		
		set io_type_lst {GDDRX2_RX.7:1 GDDRX2_TX.7:1}
		CreateLabelCombobox $setframe io_type "Interface" $w 16 Para(io_type) $io_type_lst {ChangeValueCmd}
		.lblio_type config -anchor w

		CreateLabelEntryLabel $setframe freq_in "High-Speed Clock Frequency" 12 "(4 - 500MHz)" "" Para(freq_in) real
		.lblfreq_in config -width $w -anchor w
		.entryfreq_in.lwchildsite.entry config -validate key -vcmd {
				after idle {ChangeValueCmd}
				return 1
			}
		
		set del_lst {BYPASS DEL1 DEL2 DEL3 DEL4 DEL5 DEL6 DEL7}
		CreateLabelCombobox $setframe del "ISI Calibration" $w 12 Para(del) $del_lst {ChangeValueCmd}
		.lbldel config -anchor w
		
		pack .frmmode .frmio_type .frmfreq_in .frmdel -in $setframe -side top -padx 12 -pady 4
		pack .setframe -in $page -fill both -expand 1

#		$tnb view 0

	GeneralConfig

		ChangeValueCmd

		pack forget .cboBusOrder 
		
		$tnb delete 0
		$tnb view 0
}