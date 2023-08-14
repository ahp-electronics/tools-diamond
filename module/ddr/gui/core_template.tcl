#$Header: L:/module/ddr/gui/rcs/core_template.tcl 1.10 2007/11/30 06:57:35Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc ChangeValueCmd {} {
	global Para

	set tnb $Para(tnb)

	# DTS-23428
	if {$Para(mode) == "Tristate" || $Para(mode) == "Bidirectional"}  {
		set Para(gear) 1x
		.cboGear config -state disabled
	} else  {
		.cboGear config -state normal
	} 
	
	#Notes #2,3,4
	if {$Para(gear) == "1x"}  {
		.ckCdiv config -state disabled
		set Para(cdiv) 0
		if {$Para(mode) == "Input" || $Para(mode) == "Bidirectional"}  {
			set Para(clk1x) 1
			.cboClkMode config -state normal
			.ckClk1x config -state normal
		} else {
			.cboClkMode config -state disabled
			set Para(ClkMode) Edge
			set Para(clk1x) 0
			.ckClk1x config -state disabled
		}		
		if {$Para(mode) == "Output" ||	$Para(mode) == "Bidirectional" || $Para(mode) == "Tristate"}  {
			.cboOutClkMode config -state normal
		} else {
			.cboOutClkMode config -state disabled
			set Para(OutClkMode) Edge
		}
	} else  {
		.ckCdiv config -state normal
		.cboClkMode config -state disabled
		set Para(ClkMode) Edge
		.cboOutClkMode config -state disabled
		set Para(OutClkMode) Edge
		set Para(clk1x) 0
		.ckClk1x config -state disabled
	} 

	if {$Para(mode) == "Input" || $Para(mode) == "Bidirectional"}  {
		.cboDel config -state normal
	} else {
		.cboDel config -state disabled
		set Para(del) None
	}
	
	#Notes #5,6
	if {$Para(ClkMode) == "Edge"}  {
		.cboDel clear list
		.cboDel insert list end "None" "DLL" "Edge Clock" "ECLK Injection" "User Defined"
		set edge_lst {"None" "DLL" "Edge Clock" "ECLK Injection" "User Defined"}
		if {[lsearch $edge_lst $Para(del)] == -1}  {
			set Para(del) None
		} 
	} else  {
		.cboDel clear list
		.cboDel insert list end "None" "Primary Clock" "User Defined"
		set primary_lst {"None" "Primary Clock" "User Defined"}
		if {[lsearch $primary_lst $Para(del)] == -1}  {
			set Para(del) None
		} 
	} 

	if {$Para(mode) == "Input" || $Para(mode) == "Bidirectional"}  {
		$tnb pageconfigure 1 -state normal
	} else  {
		$tnb pageconfigure 1 -state disabled
		set Para(ail) 0
	} 

	if {$Para(ail) == "1"}  {
		.cboAilAW config -state normal
		
		.cboDel config -state disabled
		set Para(del) None
	} else  {
		.cboAilAW config -state disabled
	} 

	#Notes #1
	if {$Para(del) == "User Defined"}  {
		.cboCDel config -state normal
		.cboFDel config -state normal
	} else  {
		.cboCDel config -state disabled
		.cboFDel config -state disabled
	} 

	if {[string length $Para(width)] > 0} {DrawPins}
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para

	if {$Para(ail) == "1" && $Para(del) != "None"}  {
		set tit "Check Parameter"
		set msg "When AIL is selected, the Data Delay option has to be set to None."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
	}
	
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

	set ret [IsInRange "Bus Width" 1 64 $Para(width)]
	if {$ret == "-1"} {return -1}

	return 0
}

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for or5s00 device
proc Or5s00Cmd {}  {
	global Para

	set str "-arch $Para(arch) -type iol"

	switch $Para(mode) {
	"Input"          { lappend str -mode in }
	"Output"         { lappend str -mode out }
	"Bidirectional"  { lappend str -mode io }
	"Tristate"       { lappend str -mode tri }
	}
	lappend str -width $Para(width) -reg [string tolower $Para(reg)]

	switch $Para(gear) {
	"1x" { lappend str -gear 1 }
	"2x" { lappend str -gear 2 }
	"4x" { lappend str -gear 4 }
	}

#	switch $Para(rst) {
#	"Edge"   { lappend str -rst 0 }
#	"Local"  { lappend str -rst 1 }
#	}
	if {$Para(gear) != "1x"}  {
		if {$Para(cdiv) == "1"}  {lappend str -cdiv} 
	} else {
		if {$Para(clk1x) == "1"}  {lappend str -1clk} 
	}
	switch $Para(ClkMode) {
	"Edge"   { lappend str -cmode 0 }
	"Primary/Secondary"  { lappend str -cmode 1 }
	}

	if {$Para(gear) == "1x" && ($Para(mode) == "Output" ||
		$Para(mode) == "Bidirectional" || $Para(mode) == "Tristate")}  {
		switch $Para(OutClkMode) {
			"Edge"   { lappend str -ocmode 0 }
			"Primary/Secondary"  { lappend str -ocmode 1 }
		}
	}

	if {$Para(mode) == "Input" || $Para(mode) == "Bidirectional"}  {
		switch $Para(del) {
		"None"          { lappend str -del 0 }
		"DLL"		    { lappend str -del 1 }
		"Primary Clock" { lappend str -del 2 }
		"Edge Clock"    { lappend str -del 3 }
		"ECLK Injection" {lappend str -del 4 }
		"User Defined"  { lappend str -del 5 }
		}
		if {$Para(del) == "User Defined"}  {
			lappend str -cdel $Para(cdel) -fdel $Para(fdel)
		} 
	}

	#Advanced item
	if {$Para(mode) == "Input" || $Para(mode) == "Bidirectional"}  {
		if {$Para(ail) == "1"}  {
			lappend str -ail 
			#lappend str -step [expr $Para(step)/2] -ckedge $Para(ckedge) 
			#lappend str -swap [string tolower $Para(swap)] -bf [string tolower $Para(bf)]
			lappend str -ckedge 2 -swap on -bf off
			switch $Para(AilAW)  {
				400  {set step 2}
				720  {set step 4}
				1040 {set step 6}
				1360 {set step 8}
			} 
			lappend str -step [expr $step/2]
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
		SC_CMD  {set str [Or5s00Cmd ]}
		default {set str [GeneralCmd]}
	} 

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 380 380
	set pin_flag 1
	DrawImage 220 300 

	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

		set page [$tnb add -label "Configuration"]

		iwidgets::labeledframe .setframe
		set setframe [.setframe childsite]

		iwidgets::combobox .cboMode -labeltext "Mode" -width 12 -editable false -textvariable Para(mode) -selectioncommand {ChangeValueCmd}
		.cboMode insert list end Input Output Bidirectional Tristate
		.cboMode.label config -width 16 -anchor w

		frame .frmWidth
		iwidgets::entryfield .entWidth -labeltext  "Bus Width" -width 8 -fixed 3 -textvariable Para(width) -validate integer
		.entWidth.label config -width 16 -anchor w
		.entWidth.lwchildsite.entry config -validate key -vcmd {
			after idle {
				if {[string length $Para(width)] > 0} {ChangeValueCmd}
			}
			return 1
		}
		label .lblWidth -text "(1 - 64)"
		pack .entWidth .lblWidth -in .frmWidth -side left

		iwidgets::combobox .cboReg -labeltext "Register" -width 12 -editable false -textvariable Para(reg) -selectioncommand {ChangeValueCmd} 
		.cboReg insert list end DDR SDR
		.cboReg.label config -width 16 -anchor w

		iwidgets::combobox .cboGear -labeltext "Gearing Ratio" -width 12 -editable false -textvariable Para(gear) -selectioncommand {ChangeValueCmd} 
		.cboGear insert list end 1x 2x 4x
		.cboGear.label config -width 16 -anchor w

		iwidgets::combobox .cboClkMode -labeltext "Input Clock Mode" -width 16 -editable false -textvariable Para(ClkMode) -selectioncommand {ChangeValueCmd} 
		.cboClkMode insert list end Edge Primary/Secondary
		.cboClkMode.label config -width 16 -anchor w

		iwidgets::combobox .cboOutClkMode -labeltext "Output Clock Mode" -width 16 -editable false -textvariable Para(OutClkMode) -selectioncommand {ChangeValueCmd} 
		.cboOutClkMode insert list end Edge Primary/Secondary
		.cboOutClkMode.label config -width 16 -anchor w

	#	iwidgets::combobox .cboRst -labeltext "Reset Type" -width 12 -editable false -textvariable Para(rst) -selectioncommand {ChangeValueCmd} 
	#	.cboRst insert list end Edge Local
	#	.cboRst.label config -width 12 -anchor w

		iwidgets::labeledframe .frmDelay
		set frmDelay [.frmDelay childsite]
		iwidgets::combobox .cboDel -labeltext "Data Delay" -width 12 -editable false -textvariable Para(del) -selectioncommand {ChangeValueCmd}
		.cboDel insert list end "None" "DLL" "Edge Clock" "Primary Clock" "ECLK Injection" "User Defined"
		.cboDel.label config -width 12 -anchor w
		pack .cboDel -in $frmDelay -anchor w -padx 21 -pady 4

		iwidgets::combobox .cboCDel -labeltext "CDEL" -width 6 -editable false -textvariable Para(cdel) 
		.cboCDel insert list end 0 1 2 3
		iwidgets::combobox .cboFDel -labeltext "FDEL" -width 6 -editable false -textvariable Para(fdel) 
		for {set i 0} {$i<48} {incr i}  {
			.cboFDel insert list end $i
		} 
		pack .cboCDel .cboFDel -in $frmDelay -side top -anchor w -padx 65 -pady 4

		CreateRadioItem $setframe Reset "Reset Type" 12 "Edge" Edge "Local" Local 8 left Para(rst)
		.lblReset config -anchor w

		checkbutton .ckCdiv -text "Use CLKDIV" -variable Para(cdiv) -command {ChangeValueCmd}
		checkbutton .ckClk1x -text "Use Single Clock for 1x" -variable Para(clk1x) -command {ChangeValueCmd}

		pack .cboMode .frmWidth .cboGear .cboClkMode .cboOutClkMode -in $setframe -anchor w -padx 30 -pady 4
		pack .frmDelay                   -in $setframe -fill x
		pack .frmReset                   -in $setframe -anchor w -padx 30
		pack .ckCdiv                     -in $setframe -anchor w -padx 30 -pady 2
		pack .ckClk1x                    -in $setframe -anchor w -padx 30
		pack .setframe -in $page -fill both -expand 1

	set page2 [$tnb add -label "Advanced"]

		iwidgets::labeledframe .advanced
		set advanced [.advanced childsite]

		checkbutton .ckAil -text "Use AIL" -variable Para(ail) -command {ChangeValueCmd}

		catch {image delete image1b}
		set gif_file [file join $Para(ipdir) gui "ail.GIF"]
		image create photo image1b -file $gif_file
		label .lblImage -image image1b

		iwidgets::combobox .cboStep -labeltext "Step" -width 8 -editable false -textvariable Para(step) 
	#	.cboStep insert list end 1 2 3 4
		#DTS - 26522
		.cboStep insert list end 2 4 6 8
		.cboStep.label config -width 12 -anchor w

		iwidgets::combobox .cboClock -labeltext "Clock Edge" -width 8 -editable false -textvariable Para(ckedge) 
		.cboClock insert list end 1 2
		.cboClock.label config -width 12 -anchor w

		iwidgets::combobox .cboSwap -labeltext "Extended" -width 8 -editable false -textvariable Para(swap) 
		.cboSwap insert list end Off On
		.cboSwap.label config -width 12 -anchor w

		iwidgets::combobox .cboBf -labeltext "Best Fit" -width 8 -editable false -textvariable Para(bf) 
		.cboBf insert list end Off On
		.cboBf.label config -width 12 -anchor w

		#28741
		iwidgets::combobox .cboAilAW -labeltext "AIL Acquisition Window (ps)" -width 8 -editable false -textvariable Para(AilAW) 
		.cboAilAW insert list end 400 720 1040 1360
		.cboAilAW.label config -width 25 -anchor w

		#pack .ckAil .cboStep .cboClock .cboSwap .cboBf -in $advanced -anchor w -padx 30 -pady 4
		pack .ckAil .lblImage .cboAilAW -in $advanced -anchor w -padx 30 -pady 4
		pack .advanced -in $page2 -fill both -expand 1

		$tnb view 0

	GeneralConfig
		ChangeValueCmd

		#22527
		.cbEdif config -state disabled
		pack forget .cbIO

		#23291 
		pack forget .frmReset

#	GeneralConfig

		pack forget .cboBusOrder
}