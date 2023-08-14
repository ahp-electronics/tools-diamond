#$Header: L:/module/ddr_mem/latticexp2/gui/rcs/core_template.tcl 1.8 2007/05/16 02:05:54Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc ChangeValueCmd {} {
	global Para
	if {$Para(Mode) == "DDR"} {
		.cboIO clear list
		.cboIO insert list end SSTL25_I SSTL25_II
		if {[lsearch {SSTL25_I SSTL25_II} $Para(IO_buffer)] == -1} {set Para(IO_buffer) SSTL25_I}
		.cboDDR2 config -state disabled
		
		.cboFreq clear list
		.cboFreq insert list end 100 133 166 200
		if {[lsearch {100 133 166 200} $Para(Frequency)] == -1} {set Para(Frequency) 133}
	} else {
		.cboIO clear list
		.cboIO insert list end SSTL18_I SSTL18_II
		if {[lsearch {SSTL18_I SSTL18_II} $Para(IO_buffer)] == -1} {set Para(IO_buffer) SSTL18_I}
		#ISPL_CR_33610 
		if {$Para(IO_buffer) == "SSTL18_II"} {
			.cboDDR2 config -state normal
		} else {
			.cboDDR2 config -state disabled
		}

		.cboFreq clear list
		.cboFreq insert list end 166 200 266
		if {[lsearch {166 200 266} $Para(Frequency)] == -1} {set Para(Frequency) 200}
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

	set str [list -arch $Para(arch) -type iol -mode mem]
	#ISPL_CR_35965
	if {$Para(Mode) == "DDR"} {
		lappend str -ddr 1
	} else {
		lappend str -ddr 2
	}
	#CR_35306
	set width [expr $Para(Width)+256*$Para(Number)]
	lappend str -width $width -freq $Para(Frequency) -sensitivity [string tolower $Para(Sensitivity)]
	switch $Para(IO_buffer) {
		SSTL25_I  {lappend str -iobuf 251}
		SSTL25_II {lappend str -iobuf 252}
		SSTL18_I {lappend str -iobuf 181}
		SSTL18_II {lappend str -iobuf 182}
	}
	lappend str -lsr [string tolower $Para(LSRInReg)]
	if {$Para(InReg) == "ON"} {lappend str -iclken}
	if {$Para(OutReg) == "ON"} {lappend str -tristate dq}
	if {$Para(EnDQS) == "ON"} {lappend str -tristate dqs}
	if {$Para(OutReg) == "OFF" && $Para(EnDQS) == "OFF"} {lappend str -tristate none}

	if {$Para(IO_buffer) == "SSTL18_II" && $Para(DQSBuffer) == "Differential"} {lappend str -sstld}

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
	switch $tcl_platform(platform) {
		windows {AttributeSetting 410 380}
		unix    {AttributeSetting 420 380}
	}
	set Para(Fdir) "Fep5g00"
	set pin_flag 1
	DrawImage 250 350
	set tnb $Para(tnb)

	wm title . "ORCA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "Configuration"]

		iwidgets::labeledframe .frmConfig -labeltext "" -labelpos nw
		set frmConfig [.frmConfig childsite]

		iwidgets::combobox .cboMode -labeltext "Mode" -width 8 -editable false -textvariable Para(Mode) -selectioncommand {ChangeValueCmd}
		.cboMode.label config -width 25 -anchor w
		.cboMode insert list end DDR DDR2

		iwidgets::combobox .cboIO -labeltext "I/O Buffer Configuration" -width 10 -editable false -textvariable Para(IO_buffer) -selectioncommand {ChangeValueCmd}
		.cboIO.label config -width 25 -anchor w
		.cboIO insert list end SSTL25_I SSTL25_II

		iwidgets::combobox .cboWidth -labeltext "DDR Data Width" -width 8 -editable false -textvariable Para(Width) -selectioncommand {ChangeValueCmd}
		.cboWidth.label config -width 25 -anchor w
		.cboWidth insert list end 8 16 18 32 64

		iwidgets::combobox .cboNumber -labeltext "Number of DQS" -width 8 -editable false -textvariable Para(Number) -selectioncommand {ChangeValueCmd}
		.cboNumber.label config -width 25 -anchor w
		.cboNumber insert list end 1 2 4 8

		iwidgets::combobox .cboFreq -labeltext "Frequency of DQS(MHz)" -width 8 -editable false -textvariable Para(Frequency)
		.cboFreq.label config -width 25 -anchor w
		.cboFreq insert list end 100 133 166 200

		CreateRadioItem $frmConfig Sensit "Lock/Jitter Sensitivity" 24 "HIGH" HIGH "LOW" LOW 10 left Para(Sensitivity) {ChangeValueCmd}
		.lblSensit config -anchor w

		CreateRadioItem $frmConfig LSRInReg "LSR for DDR Input Registers" 24 "RESET" RESET "SET" SET 10 left Para(LSRInReg) {ChangeValueCmd}
		.lblLSRInReg config -anchor w

		checkbutton .ckInReg  -text "Create Clock Enable for DDR Data Input Registers" -variable Para(InReg) -onvalue ON -offvalue OFF -command ChangeValueCmd
		checkbutton .ckOutReg -text "DDR Tristate Enable for DDR Data Output Registers" -variable Para(OutReg) -onvalue ON -offvalue OFF -command ChangeValueCmd
		checkbutton .ckEnDQS  -text "DDR Tristate Enable for DQS" -variable Para(EnDQS) -onvalue ON -offvalue OFF -command ChangeValueCmd

		iwidgets::combobox .cboDDR2 -labeltext "DQS Buffer Configuration for DDR2" -width 12 -editable false -textvariable Para(DQSBuffer)
		.cboDDR2.label config -width 30 -anchor w
		.cboDDR2 insert list end Single-ended Differential
		.cboDDR2 config -state disabled

		pack .cboMode     -in $frmConfig  -anchor w -padx 30
		pack .cboIO       -in $frmConfig  -anchor w -padx 30 -pady 6
		pack .cboWidth    -in $frmConfig  -anchor w -padx 30
		pack .cboNumber   -in $frmConfig  -anchor w -padx 30 -pady 6
		pack .cboFreq     -in $frmConfig  -anchor w -padx 30

		pack .frmSensit   -in $frmConfig  -anchor w -padx 30 -pady 6
		pack .frmLSRInReg -in $frmConfig  -anchor w -padx 30
		#pack .ckInReg     -in $frmConfig  -anchor w -padx 30
		pack .ckOutReg    -in $frmConfig  -anchor w -padx 30
		pack .ckEnDQS     -in $frmConfig  -anchor w -padx 30
		pack .cboDDR2     -in $frmConfig  -anchor w -padx 30 -pady 6

		pack .frmConfig -in $page -fill both -expand 1

		.cbEdif config -state disabled

		$tnb delete 0

		$tnb view 0

		pack forget .lblOrder .cboOrder .cbIO

	#FunctionButton
	#CenterPosition
	GeneralConfig
}