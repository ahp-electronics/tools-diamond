#$Header$
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc myspin {win step min max} {
	set oldsize [$win get]
	set size [expr [$win get] + $step]
    if {$size < $min} {set size $max}
    if {$size > $max} {set size $min}
    $win delete 0 end
    $win insert 0 $size
	if {[CheckSpinValues]==0}  {
		set size $oldsize
		if {$size < $min} {set size $max}
		if {$size > $max} {set size $min}
		$win delete 0 end
		$win insert 0 $size
	}
}

#*******************************************
#  Label + Spinner
#*******************************************
proc CreateMySpinner {parent main label lblwidth width min max para {p {}} {v {digit %c}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $label -width $lblwidth -font $ft -anchor e
	iwidgets::spinner .spin$main -width $width -fixed $width \
		-decrement "[list myspin .spin$main -1 $min $max]; $p" \
		-increment "[list myspin .spin$main 1 $min $max]; $p" -textvariable $para \
		-validate $v
	bind .spin$main <Enter> {ValidateValues}
	pack .lbl$main .spin$main -in .frm$main -side left -fill x
	pack .frm$main -in $parent -side top -fill x -padx 8 -pady 2
}

proc CreateMy3RadioItem {parent main label lblwidth text1 val1 text2 val2 text3 val3 rdowidth side para {p {}}} {
	global ft
	frame .frm$main
	radiobutton .rdo1$main -text $text1 -width 10 -value $val1 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo2$main -text $text2 -width 10 -value $val2 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo3$main -text $text3 -width 15 -value $val3 -variable $para -anchor w -font $ft -command $p
	if {[string length $label] == 0} {
		pack .rdo1$main .rdo2$main .rdo3$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor center -padx 8
	} else {
		label .lbl$main -text $label -width $lblwidth -anchor e -font $ft
		pack .lbl$main .rdo1$main .rdo2$main .rdo3$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor w -pady 4 -padx 8
	}
}

proc CreateMyLabelEntry {parent main text lbltext width entrywidth lblpos side para {p {}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $text -font $ft -anchor e -width $width
	iwidgets::entryfield .entry$main -labeltext $lbltext -labelpos $lblpos -labelfont $ft \
		-width $entrywidth -textvariable $para -fixed [expr $width-2] -validate $p
	pack .lbl$main .entry$main -in .frm$main -side $side
	pack .frm$main -in $parent -side top -anchor w -pady 4 -padx 8
}

proc CreateMyTextEntry {parent main text lbltext width entrywidth lblpos side para {p {}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $text -font $ft -anchor e -width $width
	iwidgets::entryfield .entry$main -labeltext $lbltext -labelpos $lblpos -labelfont $ft \
		-width $entrywidth -textvariable $para -fixed [expr $width-2] -validate $p
	pack .lbl$main .entry$main -in .frm$main -side $side
	pack .frm$main -in $parent -side top -anchor w -pady 4 -padx 4
}

proc CreateMyFileEntry {parent main text lbltext width entrywidth lblpos side para {p {}}} {
	global ft Para
	frame .frm$main
	label .lbl$main -text $text -font $ft -anchor e -width $width
	iwidgets::entryfield .entry$main -labeltext $lbltext -labelpos $lblpos -labelfont $ft \
		-width $entrywidth -textvariable $para -fixed [expr $width-2] -validate $p
	button .btn$main -text "..." -command {
		set Para(CoeffFile) [tk_getOpenFile -initialdir $Para(ProjectPath)]
	}
	bind .entry$main <Leave> {ValidateValues}
	pack .lbl$main .entry$main .btn$main -in .frm$main -side $side
	pack .frm$main -in $parent -side top -anchor w -pady 4 -padx 4
}

proc MyMessage { msgtxt } {
	global ft

	toplevel .mymsg
	# center of screen
	set x [expr ([winfo screenwidth .]-[winfo reqwidth .mymsg])/2]
	set y [expr ([winfo screenheight .]-[winfo reqheight .mymsg])/2]
	wm title .mymsg "ERROR!"
	wm geometry .mymsg +$x+$y
	label .mymsg.msg -text $msgtxt -font $ft
	pack .mymsg.msg -padx 4 -pady 4
	button .mymsg.dismiss -text "OK" -command {destroy .mymsg}
	pack .mymsg.dismiss -padx 4 -pady 4
}

#*******************************************
# Init Value
#*******************************************
proc InitVal {}  {
	global Para pin_name_list

	set parameter_file [file join $Para(CoreDir) gui default.lpc]
	LoadParameter $Para(CoreName) $parameter_file
}

#*******************************************
# Generate Files
#*******************************************
proc GenerateCB {} {

	global Para

	set ret [CheckValues]
	if {$ret == -1} { return -1 }

#	set ret [WriteFiles]
#	if {$ret == -1}  {
#	   return -1
#	}
#
#	set ret [ExecScuba]
#	if {$ret == -1}  {
#	   return -1
#	}

	return 0
}

#*******************************************
# Redraw the pin image
#*******************************************
proc ReDrawPins {}  {
	global pin_name_list pin_direction_list bus_width_list pin_side_list
	AdjustPins;
	DrawPins $pin_name_list $pin_direction_list $bus_width_list $pin_side_list;
}


proc CreateCheckBox {parent main label width para {p {}}} {
	global ft
	frame .frm$main
	checkbutton .ck$main -text $label -variable $para -font $ft -command $p
	bind .ck$main <Enter> {ValidateValues}
	pack .ck$main -in .frm$main -side left -fill x
	pack .frm$main -in $parent -side top -fill x -padx 8 -pady 2
}

proc CheckSpinValues {}  {
	global Para

	#NUM_MULT must not exceed NUM_TAP.
	if {$Para(nMult) > $Para(nTap)}  {
		return 0
	}

	return 1
}

proc ValidateValues {}  {
	global Para

	set ret 1

	ReDrawPins

	set Para(nILBin) [expr $Para(DWidth)-$Para(nIRBin)]
	set Para(nTapLBin) [expr $Para(DWidth)-$Para(nTapRBin)]
	set Para(nOLBin) [expr $Para(OWidth)-$Para(nORBin)]

	# maximum multipliers
	if {$Para(nTap) > 32}  {
		set maxMult 32
	} else  {
		set maxMult $Para(nTap)
	}

	if {$Para(nTap) > 256}  {
		set maxIF 256
	} else  {
		set maxIF $Para(nTap)
	}

	# if INTERNAL MEMORY is defined, enable the Coefficient update box,
	# else the Coefficient update box should be disabled
	if {$Para(Memory)==0} {
		.ckCoeff config -state normal
		.entryCoeffFile config -state normal -textbackground white
		.btnCoeffFile config -state normal
		.rdo1RAMType config -state normal
		.rdo2RAMType config -state normal
		# if RAMType is PLC (1), Coeff and CoeffFile can't both be set
		if {$Para(RAMType) == 1} {
			if {$Para(Coeff) == 1} {
				set Para(CoeffFile) ""
				.entryCoeffFile config -state disabled -textbackground grey80
				.btnCoeffFile config -state disabled
			}
			if {$Para(CoeffFile) != ""} {
				set Para(Coeff) 0
				.ckCoeff config -state disabled
			}
		}
	} else {		
		set Para(Coeff) 0
		.ckCoeff config -state disabled
		.entryCoeffFile config -state disabled -textbackground grey80
		.rdo1RAMType config -state disabled
		.rdo2RAMType config -state disabled
	}


#	Coefficient (nIRBin) and tap (nTapRBin) binary point settings
	.spinnIRBin config -decrement "[list myspin .spinnIRBin -1 0 $Para(DWidth)];ValidateValues"\
						-increment "[list myspin .spinnIRBin 1 0 $Para(DWidth)];ValidateValues"
	.spinnTapRBin config -decrement "[list myspin .spinnTapRBin -1 0 $Para(DWidth)];ValidateValues"\
						-increment "[list myspin .spinnTapRBin 1 0 $Para(DWidth)];ValidateValues"

	#number of bits left of binary is DWIDTH - binary_point
	set Para(nILBin) [expr $Para(DWidth)-$Para(nIRBin)]
	set Para(nTapLBin) [expr $Para(DWidth)-$Para(nTapRBin)]

	#number of bits for full precision -- read only
	set Para(nPrec) [expr $Para(DWidth)*2+[GetBinLen [expr $Para(nTap)-1]]]

	#Output settings
	set min 2
	set max 72
	if {$Para(nPrec) < 72} {
		set max $Para(nPrec)
	}

	.spinOWidth config -decrement "[list myspin .spinOWidth -1 $min $max];ValidateValues"\
						-increment "[list myspin .spinOWidth 1 $min $max];ValidateValues"

	.spinnORBin config -decrement "[list myspin .spinnORBin -1 0 $Para(OWidth)];ValidateValues"\
						-increment "[list myspin .spinnORBin 1 0 $Para(OWidth)];ValidateValues"

	#number of bits left of binary is OWIDTH - binary_point
	set Para(nOLBin) [expr $Para(OWidth)-$Para(nORBin)]

	# Saturation is invalid if
	#    OWIDTH >= [(DWIDTH*2) + log2(NUM_TAP)+ (INPUT_BIN_PT_Tap + INPUT_BIN_PT_COEFF - nORBin)]
	set x [expr log10($Para(nTap))/log10(2)+$Para(DWidth)*2-$Para(nIRBin)-$Para(nTapRBin)+$Para(nORBin)]
	if {$Para(OWidth) >= $x}  {
		set Para(Saturation) 0
		.rdo1Saturation config -state disabled
		.rdo2Saturation config -state disabled
	} else  {
		.rdo1Saturation config -state normal
		.rdo2Saturation config -state normal
	}

	# Rounding is invalid if
	#     nORBin >= nIRBin + nTapRBin
	set x [expr $Para(nIRBin)+$Para(nTapRBin)]
	if {$Para(nORBin) >= $x}  {
		set Para(Round)  3
		.rdo1Round config -state disabled
		.rdo2Round config -state disabled
		.rdo3Round config -state disabled
	} else  {
		.rdo1Round config -state normal
		.rdo2Round config -state normal
		.rdo3Round config -state normal
	}

	if {$Para(VarInterp) > 0}  { 
		.spinnIFactor config -state normal -textbackground white\
			-decrement "[list myspin .spinnIFactor -1 2 $maxIF];ValidateValues"\
			-increment "[list myspin .spinnIFactor 1 2 $maxIF];ValidateValues"
		if {$Para(nIFactor) == 1} {set Para(nIFactor) 2}
	} else { 
		set Para(nIFactor) 1
		.spinnIFactor config -state disabled -textbackground grey80
	}

	if {$Para(VarDecim) > 0}  { 
		.spinnDFactor config -state normal -textbackground white\
			-decrement "[list myspin .spinnDFactor -1 2 256];ValidateValues"\
			-increment "[list myspin .spinnDFactor 1 2 256];ValidateValues"
		if {$Para(nDFactor) == 1} {set Para(nDFactor) 2}
	} else { 
		set Para(nDFactor) 1
		.spinnDFactor config -state disabled -textbackground grey80
	}

	#output data type (display only)
	if {$Para(DType) == 1} {
		set Para(ODType) "Unsigned"
	}
	if {$Para(DType) == 2} {
		set Para(ODType) "Signed"
	}

}


#*******************************************
# Main Part
#*******************************************
proc Create_Image {} {
	package require IP_Control

	global pin_name_list pin_direction_list bus_width_list pin_side_list Para diagram tnb tcl_platform ft

	package require LatticeIPCore
        wm title . "Lattice IP Core -- FIR Filter Core v2.2"

        ProjectSet
        #MainInterface 900x400
        MainInterface
        AdjustPins
        set diagram [DrawImage 300 550 $pin_name_list $pin_direction_list $bus_width_list $pin_side_list]
        set tnb [AttributeSetting 500 600]
        #InitVal

        option add *font $ft
        option add *labelFont $ft
        set Page [$tnb add -label "General"]

        set Para(OldM) $Para(nMult)
        set Para(Family) [string tolower $Para(Family)]

        #Page 1
        set width 20
        iwidgets::Labeledframe .frm1 -labelpos nw -labeltext "Architectural Specification"
        set Frm [.frm1 childsite]
        pack .frm1 -side top -in $Page -fill x
        CreateRadioItem  $Frm Memory "Memory:" $width "Internal Memory" 0 "External Memory" 1 15 left Para(Memory) {ValidateValues}
        CreateMySpinner $Frm nChan "Number of Channels:" $width 6 1 256 Para(nChan) {ValidateValues}

        CreateRadioItem  $Frm VarTap "Number of Taps:" $width "Fixed" 0 "Variable" 1 8 left Para(VarTap) {ValidateValues}
        CreateMySpinner $Frm nTap "Number of Taps:" $width 6 2 2048 Para(nTap) {ValidateValues}
        CreateMySpinner $Frm nMult "Number of Multipliers:" $width 6 1 32 Para(nMult) {ValidateValues}

        iwidgets::Labeledframe .frm2 -labelpos nw -labeltext "Filter Characteristics"
        set Frm [.frm2 childsite]
        pack .frm2 -side top -in $Page -fill x

        Create3RadioItem  $Frm VarInterp "Interpolation:" $width "None" 0 "Fixed" 1 "Variable" 2 8 left Para(VarInterp) {ValidateValues}
        CreateMySpinner $Frm nIFactor "Interpolation:" $width 6 1 $Para(nTap) Para(nIFactor) {ValidateValues}

        Create3RadioItem  $Frm VarDecim "Decimation:" $width "None" 0 "Fixed" 1 "Variable" 2 8 left Para(VarDecim) {ValidateValues}
        CreateMySpinner $Frm nDFactor "Decimation:" $width 6 1 256 Para(nDFactor) {ValidateValues}

        iwidgets::Labeledframe .frm25 -labelpos nw -labeltext "Performance"
        set Frm [.frm25 childsite]
        pack .frm25 -side top -in $Page -fill x
        CreateLabelCombobox $Frm nPerformance "Area(0)-Speed(4):" $width 6 Para(nPerformance) {0 1 2 3 4} {ValidateValues}
        CreateMyTextEntry $Frm FMax "Clock Frequency (MHz):" "" 21 10 w left Para(FMax) {}

		# Additional Features
        iwidgets::Labeledframe .frm3 -labelpos nw -labeltext "Additional Features"
        set Frm [.frm3 childsite]
        pack .frm3 -side top -in $Page -fill x

        CreateCheckBox  $Frm Coeff "Coefficient Update" $width Para(Coeff) {ValidateValues}
        #CreateMyTextEntry $Frm CoeffFile "Coefficient File:" "" 14 50 w left Para(CoeffFile) {}
        CreateMyFileEntry $Frm CoeffFile "Coefficient File:" "" 14 50 w left Para(CoeffFile) {ValidateValues}
        CreateRadioItem  $Frm RAMType " RAM Type:" 10 "EBR" 0 "PLC" 1 6 left Para(RAMType) {ValidateValues}
        CreateCheckBox  $Frm GSR "Connect reset port to GSR" $width Para(GSR) {}
		set Para(GSR) 1
        .ckGSR config -state disabled

		# Generate Options
        iwidgets::Labeledframe .frm35 -labelpos nw -labeltext "Generation Options"
        set Frm [.frm35 childsite]
        pack .frm35 -side top -in $Page -fill x
		checkbutton $Frm.genBehav -text "Behavioral Model  " -variable Para(GenBehav) -font $ft
		checkbutton $Frm.genNetlist -text "Netlist (.ngo)  " -variable Para(GenNetlist) -font $ft
		checkbutton $Frm.genEval -text "Evaluation Directory" -variable Para(GenEval) -font $ft
		pack $Frm.genBehav $Frm.genNetlist $Frm.genEval -side left

        #Page 2
        set width 25
        set Page [$tnb add -label "I/O"]
        iwidgets::Labeledframe .frm4 -labelpos nw -labeltext "Input Specification"
        set Frm [.frm4 childsite]
        pack .frm4 -side top -in $Page -fill x

        CreateLabelCombobox $Frm DWidth "Data Width(taps and coefficients):" 30 6 Para(DWidth) {9 18 36} {ValidateValues}
        CreateRadioItem  $Frm DType "Data Type" 15 "Unsigned" 1 "Signed" 2 10 left Para(DType) {ValidateValues}
        .cboDWidth clear list
        for {set i 2} {$i<= 36} {incr i} {
        	.cboDWidth insert list end $i
        }

 #       set Para(nIRBin) 0
        set Para(nILBin) [expr $Para(DWidth)-$Para(nIRBin)]
        CreateMyLabelEntry $Frm nILBin "Bits left of Binary Point:" "" $width 6 w left Para(nILBin) {}
        CreateMySpinner $Frm nIRBin "Bits right of Binary Point" $width 4 0 $Para(DWidth) Para(nIRBin) {ValidateValues}
  
        .entrynILBin config -state disabled -textbackground grey80
        .lblnILBin config -width 35
        .lblnILBin config -text "Coefficients:  Bits left of Binary Point:"
        .lblnIRBin config -width 35
        .lblnIRBin config -text "              Bits right of Binary Point:"

 #       set Para(nTapRBin) 0
        set Para(nTapLBin) [expr $Para(DWidth)-$Para(nTapRBin)]
        #    label $Frm.lbltap -text "Taps:" -font $ft -width 15 -anchor w
        #    pack $Frm.lbltap
        CreateMyLabelEntry $Frm nTapLBin "a" "" $width 6 w left Para(nTapLBin) {}
        CreateMySpinner $Frm nTapRBin " a" $width 4 0 $Para(DWidth) Para(nTapRBin) {ValidateValues}
        .entrynTapLBin config -state disabled -textbackground grey80
        .lblnTapLBin config -width 35
        .lblnTapLBin config -text "Taps:         Bits left of Binary Point:"
        .lblnTapRBin config -width 35
        .lblnTapRBin config -text "              Bits right of Binary Point:"

        iwidgets::Labeledframe .frm5 -labelpos nw -labeltext "Output Specification"
        set Frm [.frm5 childsite]
        pack .frm5 -side top -in $Page -fill x
        set Para(nPrec) 40
        CreateMyLabelEntry $Frm nPrec "Output Width for Full Precision:" "" $width 4 w left Para(nPrec) {}
        .entrynPrec config -state disabled -textbackground grey80
        CreateMySpinner $Frm OWidth "Output Width:" $width 6 9 83 Para(OWidth) {ValidateValues}
#        CreateMyLabelEntry $Frm nODType "Data Type:" "" $width $width w left Para(ODType) {ValidateValues}
        CreateMyLabelEntry $Frm nODType "Data Type:" "" $width $width w left Para(ODType) {ValidateValues}
        .entrynODType config -state disabled -textbackground grey80

 #       set Para(nORBin) 0
        set Para(nOLBin) [expr $Para(OWidth)-$Para(nORBin)]
        CreateMyLabelEntry $Frm nOLBin "Bits left of Binary Point:" "" $width 6 w left Para(nOLBin) {}
        CreateMySpinner $Frm nORBin "Bits right of Binary Point" $width 4 0 $Para(DWidth) Para(nORBin) {ValidateValues}

        CreateRadioItem  $Frm Saturation "Overflow Handling:" $width "None" 0 "Saturate" 1 8 left Para(Saturation) {}
        CreateMy3RadioItem  $Frm Round "Rounding:" 15 "Nearest" 1 "Convergent" 2 "Truncate" 3 10 left Para(Round) {}
        .entrynOLBin config -state disabled  -textbackground grey80

	  ValidateValues

        $tnb view 0

#       #CheckValues
        #FunctionButton
        #.Loadpara config -command {
        #	set parameter_file [tk_getOpenFile -filetypes $types -initialdir $Para(ProjectPath)]
        #	if {[string length $parameter_file] > 0} {
        #		set answer [tk_messageBox -icon warning \
        #			-message "This function will replace previous configuration! Continue?" \
        #			-title "Load Parameters" \
        #			-type yesno]
        #		if {$answer == "yes"} {
        #			LoadParameter $Para(CoreName) $parameter_file
        #			ValidateValues
        #		}
        #	}
        #}
        #CenterPosition
}
