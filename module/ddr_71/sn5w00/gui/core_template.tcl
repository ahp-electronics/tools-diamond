#$Header: L:/module/ddr_71/sn5w00/gui/core_template.tcl 1.1 mghuang Exp $

#Rev 1.1: Diamond 3.5: intial ver.
#Rev 1.2: Diamond 3.8: SOF-126923:IP SCR_5025 for SNOW, LVCMOS12 de-feature

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(freq_in)] > 0 &&
		[string length $Para(Width)] > 0}  {
		DrawPins
	} 
} 

proc ChangeValueCmd {} {
	global Para
	
	set gear 7
	set Para(BandWidth) [string trimleft $Para(BandWidth) 0]
	if {$Para(mode) == "Receive"} {
		if {$Para(BandWidth) == "900"} {
			.cbogear config -state normal
			.cbogear clear list
			.cbogear insert list end 1:7 1:14
			set Para(gear) "1:14"
			set gear 14
		} else {
			.cbogear config -state disabled
			if {$Para(BandWidth) >= "10" && $Para(BandWidth) <"900"} {
				set Para(gear) "1:7"
				set gear 7
			} else {
				set Para(gear) "1:14"
				set gear 14
			}
			
		}
		
		# Gray out the checkbox. Anything relying on this softip is not supposed to work
		.cbEnSofIP config -state normal
		#.cbEnSofIP config -state disabled
		.cbenClkIBuf config -state disabled
		set Para(enClkIBuf) 0
	} else {
		if {$Para(BandWidth) == "900"} {
			.cbogear config -state normal
			.cbogear clear list
			.cbogear insert list end 7:1 14:1
			set Para(gear) "14:1"
			set gear 14
		} else {
			.cbogear config -state disabled
			if {$Para(BandWidth) >= "10" && $Para(BandWidth) <"900"} {
				set Para(gear) "7:1"
				set gear 7
			} else {
				set Para(gear) "14:1"
				set gear 14
			}
		}
		.cbEnSofIP config -state disabled
		set Para(EnSofIP) 0
		.cbenClkIBuf config -state normal
	}
		
	if {[string length $Para(BandWidth)] > 0} {
		set Para(freq_in) [expr $Para(BandWidth)/$gear]
	}
	
	if {$Para(enClkIBuf) == "0"} {
		.cboClkIBuf config -state disabled
		.lblClkIBuf config -state disabled
	} else {
		.cboClkIBuf config -state normal
		.lblClkIBuf config -state normal
	}
	
	if {$Para(EnSofIP) == "0"} {
		.cbEnDELAYF config -state disabled
	} else {
		.cbEnDELAYF config -state normal
	}

	CallDrawPins
}

proc CaculateFreq {} {
	global Para	
	
	set div 1
	if {[string first "7" $Para(gear)] != -1} {set div 7}
	if {[string first "14" $Para(gear)] != -1} {set div 14}
	
    if {[string length $Para(BandWidth)] > 0} {
	   set Para(freq_in) [expr $Para(BandWidth)/$div]
	}
	
}

proc Change_DELAYF_Value_Cmd {} {
	global Para
	
	if {$Para(EnSofIP) == "0"} {
		.cbEnDELAYF config -state disabled
		set Para(EnDELAYF) 0
	} else {
		.cbEnDELAYF config -state normal
		set Para(EnDELAYF) 1
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

	set ret [IsInRange "Bus Width" 1 16 $Para(Width)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Interface Bandwidth" 10 1200 $Para(BandWidth)]
	if {$ret == "-1"} {return -1}

	return 0
}

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for ecp4 device
proc ECP4CmdLine {}  {
	global Para

	set str "-arch $Para(arch) -type iol"

	lappend str -io_type LVDS
	switch $Para(mode) {
	"Receive"          { lappend str -mode Receive}
	"Transmit"         { lappend str -mode Transmit}
	}
	if {[string length $Para(freq_in)] > 0} {lappend str -freq_in $Para(freq_in)}
	if {$Para(Width) > 0}  {lappend str -width $Para(Width)}
	if {[string first "7" $Para(gear)] != -1} {lappend str -gear 7}
	if {[string first "14" $Para(gear)] != -1} {lappend str -gear 14}
	if {$Para(EnSofIP) == "1"} {lappend str -bw_align}
	if {$Para(EnDELAYF) == "1"} {lappend str -del 256}
	if {$Para(enClkIBuf) == "1"} {lappend str -clkibuf $Para(ClkIBuf)}

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
	
	set str [ECP4CmdLine ]

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 620 370
	set pin_flag 1
	DrawImage 220 300 

	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]

	iwidgets::labeledframe .setframe
	set setframe [.setframe childsite]

	set w 28
	CreateLabelCombobox $setframe mode "Interface Type" $w 16 Para(mode) {Transmit Receive} {ChangeValueCmd;Change_DELAYF_Value_Cmd;DrawPins}
	.lblmode config -anchor w
	
	CreateLabelEntryLabel $setframe Width "Bus Width" 10 "(1 - 16)" "" Para(Width) integer
	#.entryWidth config -state disabled
	.lblWidth config -width $w -anchor w
	.entryWidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entryWidth config -fixed 2

	CreateLabelEntryLabel $setframe BandWidth "Interface Bandwidth" 10 "(10 - 1200)mbps" "" Para(BandWidth) integer
	.lblBandWidth config -width $w -anchor w
	.entryBandWidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entryBandWidth config -fixed 4

	CreateLabelEntryLabel $setframe freq_in "Clock Frequency" 12 "" "" Para(freq_in) real
	.lblfreq_in config -width $w -anchor w
	.entryfreq_in.lwchildsite.entry config -validate key -vcmd {
			after idle {}
			return 1
		}
	.entryfreq_in config -state disabled

	CreateLabelCombobox $setframe gear "IO Gearing Ratio" $w 16 Para(gear) {1:7 1:14} {CaculateFreq;DrawPins}
	.lblgear config -anchor w
	#.cbogear config -state disabled

	checkbutton .cbEnSofIP -text "Enable Bit Alignment & Word Alignment Soft IP" -variable Para(EnSofIP) -command {ChangeValueCmd;Change_DELAYF_Value_Cmd}
	
	pack .frmmode .frmWidth .frmBandWidth .frmfreq_in .frmgear -in $setframe -side top -padx 12 -pady 4
	pack .cbEnSofIP -in $setframe -side top -anchor w -padx 12 -pady 4
	
	checkbutton .cbEnDELAYF -text "Enable DELAYF Tuning(Uses Dynamic Input Delay block for adjusting Data and Clock Delay)" -variable Para(EnDELAYF) -command {}
	.cbEnDELAYF config -state disabled
	pack .cbEnDELAYF -in $setframe -side top -anchor w -padx 25 -pady 4

	checkbutton .cbenClkIBuf -text "Reference Clock from I/O Pin" -variable Para(enClkIBuf) -command {ChangeValueCmd}
	pack .cbenClkIBuf -in $setframe -side top -anchor w -padx 12 -pady 4

	#set rx_type_lst {LVDS SUBLVDS SLVS LVTTL33 LVCMOS33 \
	#			LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS12}
	set rx_type_lst {LVDS SUBLVDS SLVS LVTTL33 LVCMOS33 \
				LVCMOS25 LVCMOS25D LVCMOS18}
	CreateLabelCombobox $setframe ClkIBuf "Reference Clock Input Buffer Type" 30 16 Para(ClkIBuf) $rx_type_lst {ChangeValueCmd}
	.lblClkIBuf config -anchor w
	pack .frmClkIBuf -in $setframe -side top -anchor w -padx 25 -pady 4

	pack .setframe -in $page -fill both -expand 1

#		$tnb view 0

	GeneralConfig

	ChangeValueCmd

	pack forget .cboBusOrder 
	
	$tnb delete 0
	$tnb view 0
}