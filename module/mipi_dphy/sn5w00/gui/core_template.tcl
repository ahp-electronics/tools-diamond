#$Header: L:/module/mipi_dphy/sn5w00/gui/core_template.tcl 1.1  Exp $

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

	if {$Para(mode) == "Receive"} {	
	
		if {[string first "8" $Para(gear)] != -1} {set Para(gear) 1:8}
	    if {[string first "16" $Para(gear)] != -1} {set Para(gear) 1:16}
	
		#Gearing Ratio
		.cbogear clear list
		if {$Para(freq_in) >= 600 && $Para(dphy_module_type) == "Hard MIPI DPHY"} {
			.cbogear insert list end 1:16
		} else {
			.cbogear insert list end 1:8 1:16
		}
		
		#.cbogear insert list end 1:8 1:16
		#Receiver DPHY Module Type
		.lbldphy_module_type config -state normal
		.cbodphy_module_type config -state normal
		#MIPI DPHY PLL Input Reference Clock Frequency
		.entryPll_Freq config -state disabled
		.lblPll_Freq config -state disabled
		.lbl2Pll_Freq config -state disabled
		.cbenClkIBuf config -state disabled
		set Para(enClkIBuf) 0
	} else {

		if {[string first "8" $Para(gear)] != -1} {set Para(gear) 8:1}
	    if {[string first "16" $Para(gear)] != -1} {set Para(gear) 16:1}
		
		#Gearing Ratio
		.cbogear clear list
		if {$Para(freq_in) >= 600 } {
		   .cbogear insert list end 16:1
		   set Para(gear) 16:1
		} else {
		   .cbogear insert list end 8:1 16:1
		}
		
		#Receiver DPHY Module Type
		set Para(dphy_module_type) "Hard MIPI DPHY"
		.cbodphy_module_type config -state disabled
		.lbldphy_module_type config -state disabled
		#MIPI DPHY PLL Input Reference Clock Frequency
		.entryPll_Freq config -state normal
		.lblPll_Freq config -state normal
		.lbl2Pll_Freq config -state normal
		
		.cbenClkIBuf config -state normal
	}
	#Interface Frequency
	if {$Para(mode) == "Transmit" || $Para(dphy_module_type) == "Hard MIPI DPHY"} {
		.lbl2freq_in config -text "(10 - 750)MHz"
	} else {
		.lbl2freq_in config -text "(10 - 600)MHz"
	}
	
	set Para(freq_in) [string trimleft $Para(freq_in) 0]
	#Data Rate
	if {[string length $Para(freq_in)] == 0} {
		set Para(data_rate) ""
	} else {
		if {$Para(freq_in) == 0 || [string is double -strict $Para(freq_in)] == 0} {
			set Para(data_rate) 0
		} else {
			set Para(data_rate) [expr $Para(freq_in)*2]
		}
	}
	
	#Include Start up Synchronization logic
	if {$Para(mode) == "Receive" && $Para(dphy_module_type) == "Soft MIPI DPHY"} {
		.cbIncludeStartUp config -state normal
	} else {
		.cbIncludeStartUp config -state disabled
		set Para(cbIncludeStartUp) 0
	}
	
	if {$Para(enClkIBuf) == "0"} {
		.cboClkIBuf config -state disabled
		.lblClkIBuf config -state disabled
	} else {
		.cboClkIBuf config -state normal
		.lblClkIBuf config -state normal
	}
	

	CallDrawPins
}

proc setGearingRation {} {
	global Para
	
	#set value for Gearing Ratio
	if {[string length $Para(freq_in)] == 0} {
		set Para(gear) ""
		return
	}
	
	if {$Para(mode) == "Receive"} {
		if {$Para(freq_in) < 450 && $Para(dphy_module_type) == "Hard MIPI DPHY"} {
			set Para(gear) 1:16
		}
		
		if {$Para(freq_in) > 450 && $Para(dphy_module_type) == "Hard MIPI DPHY"} {
			set Para(gear) 1:16
		}
		
		if {$Para(freq_in) < 450 && $Para(dphy_module_type) == "Soft MIPI DPHY"} {
			set Para(gear) 1:8
		}
		
		if {$Para(freq_in) > 450 && $Para(dphy_module_type) == "Soft MIPI DPHY"} {
			set Para(gear) 1:16
		}
	} else {
		if {$Para(freq_in) < 450 && $Para(dphy_module_type) == "Hard MIPI DPHY"} {
			set Para(gear) 16:1
		}
		
		if {$Para(freq_in) > 450 && $Para(dphy_module_type) == "Hard MIPI DPHY"} {
			set Para(gear) 16:1
		}
		
		if {$Para(freq_in) < 450 && $Para(dphy_module_type) == "Soft MIPI DPHY"} {
			set Para(gear) 8:1
		}
		
		if {$Para(freq_in) > 450 && $Para(dphy_module_type) == "Soft MIPI DPHY"} {
			set Para(gear) 16:1
		}
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
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para
	
	#Interface Frequency 
	if {$Para(mode) == "Transmit" || $Para(dphy_module_type) == "Hard MIPI DPHY"} {
		# If Interface = Transmit OR If MIPI Receiver Type = Hard MIPI DPHY
		#"10Mhz-750Mhz"
		set ret [IsInRange "Interface Clock Frequency" 10 750 $Para(freq_in)]
		if {$ret == "-1"} {return -1}
	} else {
		#"10Mhz-600Mhz"
		set ret [IsInRange "Interface Clock Frequency" 10 600 $Para(freq_in)]
		if {$ret == "-1"} {return -1}
	}
	
	set ret [IsInRange "Bus Width" 1 4 $Para(Width)]
	if {$ret == "-1"} {return -1}
	
	if {$Para(mode) == "Transmit"} {
		set ret [IsInRange "DPHY PLL Input Reference Clock Frequency" 24 200 $Para(Pll_Freq)]
		if {$ret == "-1"} {return -1}
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

	set str "-arch $Para(arch) -type iol"

	lappend str -io_type LVDS
#	switch $Para(mode) {
#	"Receive"          { lappend str -mode Receive}
#	"Transmit"         { lappend str -mode Transmit}
#	}
	lappend str -mode MIPI
	if {[string length $Para(freq_in)] > 0} {lappend str -freq_in $Para(freq_in)}
	if {$Para(Width) > 0}  {lappend str -width $Para(Width)}
	if {$Para(mode) == "Receive" && $Para(mipi_app) == "CSI-2" && $Para(dphy_module_type) == "Hard MIPI DPHY"}  {lappend str -app CSI_RX_H}
	if {$Para(mode) == "Receive" && $Para(mipi_app) == "DSI" && $Para(dphy_module_type) == "Hard MIPI DPHY"}  {lappend str -app DSI_RX_H}
	if {$Para(mode) == "Receive" && $Para(mipi_app) == "CSI-2" && $Para(dphy_module_type) == "Soft MIPI DPHY"}  {lappend str -app CSI_RX}
	if {$Para(mode) == "Receive" && $Para(mipi_app) == "DSI" && $Para(dphy_module_type) == "Soft MIPI DPHY"}  {lappend str -app DSI_RX}	
	if {$Para(mode) == "Transmit" && $Para(mipi_app) == "CSI-2" && $Para(dphy_module_type) == "Hard MIPI DPHY"}  {lappend str -app CSI_TX_H}	
	if {$Para(mode) == "Transmit" && $Para(mipi_app) == "DSI" && $Para(dphy_module_type) == "Hard MIPI DPHY"}  {lappend str -app DSI_TX_H}
	if {[string first "8" $Para(gear)] != -1} {lappend str -gear 8}
	if {[string first "16" $Para(gear)] != -1} {lappend str -gear 16}
	if {$Para(enClkIBuf) == "1"} {lappend str -clkibuf $Para(ClkIBuf)}
	if {$Para(mode) == "Transmit" && $Para(Pll_Freq) > 0}  {lappend str -pll $Para(Pll_Freq)}
	if {$Para(mode) == "Receive" && $Para(dphy_module_type) == "Soft MIPI DPHY" && $Para(cbIncludeStartUp) == "1"}  {lappend str -soft_sync}

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

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 540 420
	set pin_flag 1
	DrawImage 220 300 

	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]

	iwidgets::labeledframe .setframe
	set setframe [.setframe childsite]

	set w 36
	CreateLabelCombobox $setframe mode "Interface Type" $w 16 Para(mode) {Receive Transmit} {ChangeValueCmd;DrawPins}
	.lblmode config -anchor w
	
    set w 36
	CreateLabelCombobox $setframe mipi_app "MIPI Interface Application" $w 16 Para(mipi_app) {CSI-2 DSI} {ChangeValueCmd}
	.lblmipi_app config -anchor w
	
	set w 36
	CreateLabelCombobox $setframe dphy_module_type "Receiver DPHY Module Type" $w 16 Para(dphy_module_type) {"Hard MIPI DPHY" "Soft MIPI DPHY"} {ChangeValueCmd}
	.lbldphy_module_type config -anchor w
	.cbodphy_module_type config -state disabled
	
     CreateLabelEntryLabel $setframe freq_in "Interface Clock Frequency" 12 "" "" Para(freq_in) real
	.lblfreq_in config -width $w -anchor w
	.entryfreq_in.lwchildsite.entry config -validate key -vcmd {
			after idle {setGearingRation;ChangeValueCmd}
			return 1
		}
#	.entryfreq_in config -state disabled
	
	
	CreateLabelEntryLabel $setframe data_rate "Interface Data Rate" 12 "(20Mbps - 1.5Gbps)" "" Para(data_rate) real
	.lbldata_rate config -width $w -anchor w
	.entrydata_rate.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entrydata_rate config -state disabled
	
	CreateLabelCombobox $setframe gear "Gearing Ratio" $w 16 Para(gear) {1:8 1:16} 
	.lblgear config -anchor w
#	.cbogear config -state disabled
	
	
	CreateLabelEntryLabel $setframe Width "Bus Width" 10 "(1 - 4)" "" Para(Width) integer
	#.entryWidth config -state disabled
	.lblWidth config -width $w -anchor w
	.entryWidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entryWidth config -fixed 2

	set w 36
	CreateLabelEntryLabel $setframe Pll_Freq "DPHY PLL Input Reference Clock Frequency" 20 "(24 - 200)MHz" "" Para(Pll_Freq) integer
	.lblPll_Freq config -width $w -anchor w
	.entryPll_Freq.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	.entryPll_Freq config -fixed 8

	
	pack .frmmode .frmmipi_app .frmdphy_module_type .frmfreq_in .frmdata_rate .frmgear .frmWidth .frmPll_Freq -in $setframe -side top -padx 12 -pady 4

	checkbutton .cbenClkIBuf -text "Reference Clock from I/O Pin" -variable Para(enClkIBuf) -command {ChangeValueCmd}
	pack .cbenClkIBuf -in $setframe -side top -anchor w -padx 12 -pady 4

	#set rx_type_lst {LVDS SUBLVDS SLVS LVTTL33 LVCMOS33 \
	#			LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS12}
	set rx_type_lst {LVDS SUBLVDS SLVS LVTTL33 LVCMOS33 \
				LVCMOS25 LVCMOS25D LVCMOS18}
	CreateLabelCombobox $setframe ClkIBuf "Reference Clock Input Buffer Type" 30 16 Para(ClkIBuf) $rx_type_lst {ChangeValueCmd}
	.lblClkIBuf config -anchor w
	pack .frmClkIBuf -in $setframe -side top -anchor w -padx 25 -pady 4
	
    checkbutton .cbIncludeStartUp -text "Include Start up Synchronization logic" -variable Para(cbIncludeStartUp) -command {ChangeValueCmd}
	pack .cbIncludeStartUp -in $setframe -side top -anchor w -padx 12 -pady 4

	pack .setframe -in $page -fill both -expand 1

#		$tnb view 0

	GeneralConfig

	ChangeValueCmd

	pack forget .cboBusOrder 
	
	$tnb delete 0
	$tnb view 0
}