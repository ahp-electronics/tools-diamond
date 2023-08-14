#$Header: L:/module/lfsr/gui/rcs/core_template.tcl 1.12 2006/04/17 07:03:46Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(Number)] > 0 &&
		[string length $Para(Poly)] > 0 &&
		[string length $Para(Value)] > 0 } {
		DrawPins
	}
} 

proc ChangeValueCmd {} {
	global Para
	CallDrawPins
}

proc LoadParaCB {} {
	global Para
}

proc CheckParameterCB {} {
	global Para
	
	set tit "Check Parameter"
	#ISPL_CR_30878
	if {$Para(arch) == "slayer" || $Para(arch) == "or5s00"}  {
		set min 2
	} else  {
		set min 1
	} 
	set ret [IsInRange "Number of Bits" $min 512 $Para(Number)]
	if {$ret == "-1"} {return -1}

	#ISPL_CR_30332
	if {[string length $Para(Poly)] == 0} {
		set msg "Please input Feedback Polynomial!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}

	if {[string length $Para(Value)] == 0 } {
		set msg "Please input Initial Value!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}

	#ISPL_CR_31065
	if {[string length $Para(Poly)] > [expr ($Para(Number)+3)/4]}  {
		set msg "Feedback polynomial has too many hex numbers!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	if {[string length $Para(Value)] > [expr ($Para(Number)+3)/4]}  {
		set msg "Initial value has too many hex numbers!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 

	return 0
}

proc GenerateCB {} {
	global Para
	set str [list -arch $Para(arch) -type lfsr]
	if {$Para(Mode) == "Galois"} {lappend str -galois_mode}
	if {$Para(Gate) == "XNOR"} {lappend str -xnor_gate}
	#lappend str -[string tolower $Para(Type)] 
	lappend str -stage $Para(Number) -feedback_poly $Para(Poly) -init_seed $Para(Value)
	if {$Para(Para) == "1"}  {lappend str -parallel_out} 
	#ISPL_CR_30331
	if {$Para(Seed) == "1"}  {lappend str -reloadable} 
	
	#tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
	#exit

	return $str
}

proc Create_Image {} {
	global Para diagram tnb tcl_platform pin_flag ft

	package require OrcaModule

	#*** set private value ***

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	global pin_flag

	ProjectSet
	MainInterface
	AttributeSetting 380 360
	set pin_flag 1
	DrawImage 220 300
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***
	set page [$tnb add -label "Configuration"]
	iwidgets::Labeledframe .frmConfig ;
	set frmConfig [.frmConfig childsite]

	CreateLabelCombobox $frmConfig Mode "LFSR Type:" 16 10 Para(Mode) {Fibonacci Galois} {ChangeValueCmd}
	#ISPL_CR_31218
	#CreateLabelCombobox $frmConfig Type "Arithmetic Type:" 16 10 Para(Type) {Signed Unsigned} {ChangeValueCmd}
	CreateLabelCombobox $frmConfig Gate "Gate Type:" 16 10 Para(Gate) {XOR XNOR} {ChangeValueCmd}
	.lblMode config -anchor w
	#.lblType config -anchor w
	.lblGate config -anchor w

	CreateLabelEntryLabel $frmConfig Width "Number of Bits:" 8 "(1 - 512)" "" Para(Number) integer
	CreateLabelEntryLabel $frmConfig Poly  "Feedback Polynomial:" 66 "" "0x" Para(Poly) hexidecimal
	CreateLabelEntryLabel $frmConfig Value "Initial Value:" 66 "" "0x" Para(Value) hexidecimal
	.lblWidth config -width 16 -anchor w
	.lblPoly config -anchor w
	.lblValue config -anchor w
	
	#ISPL_CR_30878
	if {$Para(arch) == "slayer" || $Para(arch) == "or5s00"}  {
		.lbl2Width config -text "(2 - 512)"
	} 

	.entryWidth.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}

	frame .frmCK1
	checkbutton .cbPara  -text "Enable Parallel Output" -variable Para(Para) -command {ChangeValueCmd}
	checkbutton .cbReset -text "Use Reset Port" -variable Para(Reset) -command {ChangeValueCmd}
	checkbutton .cbSeed  -text "Use Reloadable Seed Values" -variable Para(Seed) -command {ChangeValueCmd}
	checkbutton .cbEnable -text "Use Enable Port" -variable Para(Enable) -command {ChangeValueCmd}
	#ISPL_CR_30391
	grid .cbPara -in .frmCK1 -sticky w
	grid .cbSeed -in .frmCK1 -sticky w

	pack .frmMode .frmGate .frmWidth .frmPoly .frmValue -in $frmConfig -padx 20 -pady 4
	pack .frmCK1 -in $frmConfig -side top -anchor w -padx 20
	pack .frmConfig -in $page  -fill both -expand true 

	$tnb view 0
		
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}
