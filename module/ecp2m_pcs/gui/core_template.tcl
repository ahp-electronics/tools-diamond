#$Header: L:/module/ecp2m_pcs/gui/rcs/core_template.tcl 1.1 2006/03/07 07:28:25Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc ChangeValueCmd {} {
	global Para pin_flag in_pins out_pins

	if {$Para(mode) == "XAUI"}  {
		set Para(Channel0) GROUP1
		set Para(Channel1) GROUP1
		set Para(Channel2) GROUP1
		set Para(Channel3) GROUP1
		.rdo1Channel0 config -state disable			
		.rdo3Channel0 config -state disable			
		.rdo4Channel0 config -state disable			
		.rdo1Channel1 config -state disable			
		.rdo3Channel1 config -state disable			
		.rdo4Channel1 config -state disable			
		.rdo1Channel2 config -state disable			
		.rdo3Channel2 config -state disable			
		.rdo4Channel2 config -state disable			
		.rdo1Channel3 config -state disable			
		.rdo3Channel3 config -state disable			
		.rdo4Channel3 config -state disable			
	} else  {
		.rdo1Channel0 config -state normal			
		.rdo3Channel0 config -state normal			
		.rdo4Channel0 config -state normal			
		.rdo1Channel1 config -state normal			
		.rdo3Channel1 config -state normal			
		.rdo4Channel1 config -state normal			
		.rdo1Channel2 config -state normal			
		.rdo3Channel2 config -state normal			
		.rdo4Channel2 config -state normal			
		.rdo1Channel3 config -state normal			
		.rdo3Channel3 config -state normal			
		.rdo4Channel3 config -state normal			
	} 

	switch $Para(ClkMult)  {
		20X {set mult 20}
	} 
	set Para(CalClkRate) [expr $Para(ClkRate)*1000/$mult]
	set Para(FPGAClkRate) [expr $Para(CalClkRate)/$Para(DataWidth)]

	if {$Para(Ports3) == "FALSE"}  {
		 .ckPorts3_1 config -state disable
		 set Para(Ports3_1) FALSE   
	} else  {
		 .ckPorts3_1 config -state normal
		 set Para(Ports3_1) TRUE   
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

proc CreatePpFile {} {
	global Para

	set outPpFile [file join $Para(ProjectPath) $Para(ModuleName).pp]
	if [catch {open $outPpFile w} outputfile] {
		puts stderr "Cannot open file: $outPpFile!"
		tk_messageBox -default ok -icon error \
			-message "Cannot open file: $outPpFile!" \
			-title "Write file error" \
			-type ok
		return -1
	}

	set dsp_lst {"Gigabit Ethernet" "1G Fibre Channel" "2G Fibre Channel" XAUI "SRIO Type1" "SRIO Type2" "SRIO Type3" PCI-Express OBSAI CPRI "SATA Type1" "SATA Type2"	SMPTE259M SMPTE292M SMPTE344M "Generic 8B10B" "10-bit SERDES Only" "8-bit SERDES Only" "User Defined"}
	set index [lsearch -exact $dsp_lst $Para(mode)]
	set mode_lst {GIGE 1GFC 2GFC XAUI SRIOT1 SRIOT2 SRIOT3 PCIE OBSAI CPRI SATAT1 SATAT2 SMPTE259M SMPTE292M SMPTE344M G8B10B 10BSER 8BSER USERDEF}
	set mode [lindex $mode_lst $index]

	puts $outputfile "#define _protocol \"$mode\" 
#define _ch0_mode \"$Para(Channel0)\" 
#define _ch1_mode \"$Para(Channel1)\" 
#define _ch2_mode \"$Para(Channel2)\" 
#define _ch3_mode \"$Para(Channel3)\" 
#define _pll_txsrc \"$Para(TxRefClk)\" 
#define _pll_rxsrc \"$Para(RxRefClk)\" 
#define _datarange \"$Para(ClkRate)\" 
#define _refclk_mult \"$Para(ClkMult)\" 
#define _refclk_rate $Para(CalClkRate)
#define _data_width \"$Para(DataWidth)\" 
#define _fpgaintclk_rate $Para(FPGAClkRate)
#define _ch0_tdrv_amp \"$Para(VCh0)\" 
#define _ch1_tdrv_amp \"$Para(VCh1)\" 
#define _ch2_tdrv_amp \"$Para(VCh2)\" 
#define _ch3_tdrv_amp \"$Para(VCh3)\" 
#define _ch0_tx_pre \"$Para(PreCh0)\" 
#define _ch1_tx_pre \"$Para(PreCh1)\" 
#define _ch2_tx_pre \"$Para(PreCh2)\" 
#define _ch3_tx_pre \"$Para(PreCh3)\" 
#define _ch0_rterm_tx \"$Para(TxCh0)\" 
#define _ch1_rterm_tx \"$Para(TxCh1)\" 
#define _ch2_rterm_tx \"$Para(TxCh2)\" 
#define _ch3_rterm_tx \"$Para(TxCh3)\" 
#define _ch0_rx_eq \"$Para(EqCh0)\" 
#define _ch1_rx_eq \"$Para(EqCh1)\" 
#define _ch2_rx_eq \"$Para(EqCh2)\" 
#define _ch3_rx_eq \"$Para(EqCh3)\" 
#define _ch0_rterm_rx \"$Para(RxTermCh0)\" 
#define _ch1_rterm_rx \"$Para(RxTermCh1)\" 
#define _ch2_rterm_rx \"$Para(RxTermCh2)\" 
#define _ch3_rterm_rx \"$Para(RxTermCh3)\" 
#define _ch0_rx_dcc \"$Para(RxCoupCh0)\" 
#define _ch1_rx_dcc \"$Para(RxCoupCh1)\" 
#define _ch2_rx_dcc \"$Para(RxCoupCh2)\" 
#define _ch3_rx_dcc \"$Para(RxCoupCh3)\" 
#define _los_threshold \"$Para(Loss)\" 
#define _cdr_lol_set \"$Para(CDRLoss)\" 
#define _pll_term \"$Para(TxTerm)\" 
#define _pll_dcc \"$Para(TxCoup)\" 
#define _pll_lol_set \"$Para(TxPllLoss)\" 
#define _ch0_tx_sb \"$Para(TxInvCh0)\" 
#define _ch1_tx_sb \"$Para(TxInvCh1)\" 
#define _ch2_tx_sb \"$Para(TxInvCh2)\" 
#define _ch3_tx_sb \"$Para(TxInvCh3)\" 
#define _ch0_rx_sb \"$Para(RxInvCh0)\" 
#define _ch1_rx_sb \"$Para(RxInvCh1)\" 
#define _ch2_rx_sb \"$Para(RxInvCh2)\" 
#define _ch3_rx_sb \"$Para(RxInvCh3)\" 
#define _ch0_8b10b \"$Para(RxModeCh0)\" 
#define _ch1_8b10b \"$Para(RxModeCh1)\" 
#define _ch2_8b10b \"$Para(RxModeCh2)\" 
#define _ch3_8b10b \"$Para(RxModeCh3)\" 
#define _comma_a \"$Para(Plus)\" 
#define _comma_b \"$Para(Minus)\" 
#define _comma_m \"$Para(Mask)\" 
#define _comma_align \"$Para(Align)\" 
#define _ch0_ctc_byp \"$Para(CTCCh0)\" 
#define _ch1_ctc_byp \"$Para(CTCCh1)\" 
#define _ch2_ctc_byp \"$Para(CTCCh2)\" 
#define _ch3_ctc_byp \"$Para(CTCCh3)\" 
#define _cc_match1 \"$Para(CC_MATCH1)\" 
#define _cc_match2 \"$Para(CC_MATCH2)\" 
#define _cc_match3 \"$Para(CC_MATCH3)\" 
#define _cc_match_mode \"$Para(CC_MATCH_MODE)\" 
#define _cc_min_ipg \"$Para(MinIPG)\" 
#define _cchmark \"$Para(High)\" 
#define _cclmark \"$Para(Low)\" 
#define _ch0_ird \"$Para(RxDataCh0)\" 
#define _ch1_ird \"$Para(RxDataCh1)\" 
#define _ch2_ird \"$Para(RxDataCh2)\" 
#define _ch3_ird \"$Para(RxDataCh3)\" 
#define _ch0_cgalign \"$Para(AlignerCh0)\" 
#define _ch1_cgalign \"$Para(AlignerCh1)\" 
#define _ch2_cgalign \"$Para(AlignerCh2)\" 
#define _ch3_cgalign \"$Para(AlignerCh3)\" 
#define _ch0_sd \"$Para(DetectCh0)\" 
#define _ch1_sd \"$Para(DetectCh1)\" 
#define _ch2_sd \"$Para(DetectCh2)\" 
#define _ch3_sd \"$Para(DetectCh3)\" 
#define _dlbports \"$Para(Ports0)\" 
#define _errsports \"$Para(Ports1)\" 
#define _refck2core \"$Para(Ports2)\" 
#define _sci_ports \"$Para(Ports3)\" 
#define _sci_int_port \"$Para(Ports3_1)\" "

	puts $outputfile "#define _circuit_name $Para(ModuleName)"

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
		[string equal -nocase $Para(SourceFormat) "VHDL"]} {
		puts $outputfile "#define _lang vhdl\n"
		puts $outputfile "#include <pcs/PCS.vhd>"
	}
	if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {
		puts $outputfile "#define _lang verilog\n"
		puts $outputfile "#include <pcs/PCS.v>"
	}

	close $outputfile
	return 0
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

	set ret [IsInRange "Serial Bit Clock Rate" 0.27 3.2 $Para(ClkRate)]
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
	global Para pin_flag

	set ret [CheckParameterCB]
	if {$ret == -1} {return -1}

	set ret [CreatePpFile]
	if {$ret == -1} {return -1}

	set out_msg "\tModule Name: $Para(ModuleName)\n\tCore Name: $Para(CoreName)\n\tLPC file : $Para(ModuleName).lpc"
	append out_msg "\n\tParameter File : $Para(ModuleName).pp"
#	append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"

	set pin_flag orcapp

	set oldPath [pwd]
	cd $Para(ProjectPath)
	set ppFile  "$Para(ModuleName).pp"
	set orcappFile  [GetFpscEngine]
	catch {exec $orcappFile -Fmaco $ppFile} ret
	cd $oldPath
	# send message to IP Manager
	regsub -all "\n\n\n+" $ret "\n\n" ret
	append out_msg "\n\tCommand line: $orcappFile -Fmaco $ppFile"
	append out_msg "\n\tReturn Value:"
	foreach item [split $ret "\n"] {append out_msg "\n\t$item"}

	set tmp_str [string tolower $out_msg]
	if {[string first "error" $tmp_str] == -1}  {
		append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"
	} 

	set out_msg [ReadmeOut $out_msg]

	return $out_msg
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet

	#*** Here for user to add extra pages ***
	MainInterface
	AttributeSetting 520 490
	set pin_flag 2
	set Para(Fdir) "Fmaco"
	DrawImage 230 320
	set tnb $Para(tnb)
	$tnb delete 0

	#*** Quad Setup ***
	set page [$tnb add -label "Quad"]
	iwidgets::labeledframe .frmP1 -labeltext "" -labelpos nw
	set frmP1 [.frmP1 childsite]

	set mode_lst {"Gigabit Ethernet" "1G Fibre Channel" "2G Fibre Channel" XAUI "SRIO Type1" "SRIO Type2" "SRIO Type3" PCI-Express OBSAI CPRI "SATA Type1" "SATA Type2"	SMPTE259M SMPTE292M SMPTE344M "Generic 8B10B" "10-bit SERDES Only" "8-bit SERDES Only" "User Defined"}
	CreateLabelCombobox $frmP1 Mode "Quad Protocol Mode" 20 20 Para(mode) $mode_lst {ChangeValueCmd}
	.lblMode config -width 20 -anchor w
	pack .frmMode -in $frmP1 -anchor w -padx 30 -pady 8

	iwidgets::labeledframe .frmP11 -labeltext "Channel Selection and Grouping" -labelpos nw
	set frmP11 [.frmP11 childsite]
	Create4RadioItem $frmP11 Channel0 Channel0 10 Single SINGLE "MCA\nGroup1" GROUP1 "MCA\nGroup2" GROUP2 Disable DISABLE 8 left Para(Channel0) {}
	Create4RadioItem $frmP11 Channel1 Channel1 10 Single SINGLE "MCA\nGroup1" GROUP1 "MCA\nGroup2" GROUP2 Disable DISABLE 8 left Para(Channel1) {}
	Create4RadioItem $frmP11 Channel2 Channel2 10 Single SINGLE "MCA\nGroup1" GROUP1 "MCA\nGroup2" GROUP2 Disable DISABLE 8 left Para(Channel2) {}
	Create4RadioItem $frmP11 Channel3 Channel3 10 Single SINGLE "MCA\nGroup1" GROUP1 "MCA\nGroup2" GROUP2 Disable DISABLE 8 left Para(Channel3) {}
	pack .frmP11 -in $frmP1 -fill both

	pack .frmP1 -in $page -fill both -expand 1

	#*** Reference Clocks Setup ***
	set page [$tnb add -label "Reference Clocks"]
	iwidgets::labeledframe .frmP2 -labeltext "" -labelpos nw
	set frmP2 [.frmP2 childsite]

	iwidgets::labeledframe .frmP21 -labeltext "Tx Reference Clock Source Selection" -labelpos nw
	set frmP21 [.frmP21 childsite]
	CreateRadioItem $frmP21 TxRefClk "" 1 "Use REFCLK" REFCLK "Use CORE_TXREFCLK" CORE_TXREFCLK 18 left Para(TxRefClk) {}
	pack .frmP21 -in $frmP2 -fill both

	iwidgets::labeledframe .frmP22 -labeltext "Rx Reference Clock Source Selection" -labelpos nw
	set frmP22 [.frmP22 childsite]
	CreateRadioItem $frmP22 RxRefClk "" 1 "Use REFCLK" REFCLK "Use CORE_RXREFCLK" CORE_RXREFCLK 18 left Para(RxRefClk) {}
	pack .frmP22 -in $frmP2 -fill both

	iwidgets::labeledframe .frmP23 -labeltext "Reference Clock Rate Multiplier" -labelpos nw
	set frmP23 [.frmP23 childsite]
	CreateLabelEntryLabel $frmP23 ClkRate "Serial Bit Clock Rate" 10 "GHz" "" Para(ClkRate) real
	CreateLabelCombobox $frmP23 ClkMult "Reference Clock Multiplier" 25 10 Para(ClkMult) {20X} {ChangeValueCmd}
	CreateLabelEntryLabel $frmP23 CalClkRate "Calculated Reference Clock Rate" 10 "MHz" "" Para(CalClkRate) real
	CreateLabelCombobox $frmP23 DataWidth "FPGA Interface Data Bus Width" 25 10 Para(DataWidth) {8} {ChangeValueCmd}
	CreateLabelEntryLabel $frmP23 FPGAClkRate "Calculated FPGA Interface Clock Rate" 10 "MHz" "" Para(FPGAClkRate) real
	.lblClkRate config -width 36 -anchor w
	.lblClkMult config -width 36 -anchor w
	.lblCalClkRate config -width 36 -anchor w
	.entryCalClkRate config -state disable
	.lblDataWidth config -width 36 -anchor w
	.lblFPGAClkRate config -width 36 -anchor w
	.entryFPGAClkRate config -state disable
	pack .frmP23 -in $frmP2 -fill both

	.entryClkRate.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}

	pack .frmP2 -in $page -fill both -expand 1

	#*** SerDes Advanced Setup ***
	set page [$tnb add -label "SerDes Advanced"]
		#*** Transmit Settings ***#
	iwidgets::labeledframe .frmP31 -labeltext "Transmit Settings" -labelpos nw
	set frmP31 [.frmP31 childsite]
	label .lblTxCh0 -text Ch0
	label .lblTxCh1 -text Ch1
	label .lblTxCh2 -text Ch2
	label .lblTxCh3 -text Ch3
	grid x .lblTxCh0 .lblTxCh1 .lblTxCh2 .lblTxCh3 -in $frmP31 -sticky w

	label .lblOutV -text "Differential Output Voltage"
	iwidgets::combobox .cboVCh0 -width 8 -editable false -textvariable Para(VCh0) -selectioncommand {}
	iwidgets::combobox .cboVCh1 -width 8 -editable false -textvariable Para(VCh1) -selectioncommand {}
	iwidgets::combobox .cboVCh2 -width 8 -editable false -textvariable Para(VCh2) -selectioncommand {}
	iwidgets::combobox .cboVCh3 -width 8 -editable false -textvariable Para(VCh3) -selectioncommand {}
	.cboVCh0 insert list end 0
	.cboVCh1 insert list end 0
	.cboVCh2 insert list end 0
	.cboVCh3 insert list end 0
	grid .lblOutV .cboVCh0 .cboVCh1 .cboVCh2 .cboVCh3 -in $frmP31 -padx 2 -sticky w

	label .lblPre -text "PreEmphasis"
	iwidgets::combobox .cboPreCh0 -width 8 -editable false -textvariable Para(PreCh0) -selectioncommand {}
	iwidgets::combobox .cboPreCh1 -width 8 -editable false -textvariable Para(PreCh1) -selectioncommand {}
	iwidgets::combobox .cboPreCh2 -width 8 -editable false -textvariable Para(PreCh2) -selectioncommand {}
	iwidgets::combobox .cboPreCh3 -width 8 -editable false -textvariable Para(PreCh3) -selectioncommand {}
	.cboPreCh0 insert list end DISABLE
	.cboPreCh1 insert list end DISABLE
	.cboPreCh2 insert list end DISABLE
	.cboPreCh3 insert list end DISABLE
	grid .lblPre .cboPreCh0 .cboPreCh1 .cboPreCh2 .cboPreCh3 -in $frmP31 -padx 2 -sticky w -pady 4

	label .lblTx -text "TX I/O Termination(Ohms)"
	iwidgets::combobox .cboTxCh0 -width 8 -editable false -textvariable Para(TxCh0) -selectioncommand {}
	iwidgets::combobox .cboTxCh1 -width 8 -editable false -textvariable Para(TxCh1) -selectioncommand {}
	iwidgets::combobox .cboTxCh2 -width 8 -editable false -textvariable Para(TxCh2) -selectioncommand {}
	iwidgets::combobox .cboTxCh3 -width 8 -editable false -textvariable Para(TxCh3) -selectioncommand {}
	.cboTxCh0 insert list end 50
	.cboTxCh1 insert list end 50
	.cboTxCh2 insert list end 50
	.cboTxCh3 insert list end 50
	grid .lblTx .cboTxCh0 .cboTxCh1 .cboTxCh2 .cboTxCh3 -in $frmP31 -padx 2 -sticky w

	pack .frmP31 -in $page -fill both

		#*** Receive Settings ***#
	iwidgets::labeledframe .frmP32 -labeltext "Receive Settings" -labelpos nw
	set frmP32 [.frmP32 childsite]
	label .lblRxCh0 -text Ch0
	label .lblRxCh1 -text Ch1
	label .lblRxCh2 -text Ch2
	label .lblRxCh3 -text Ch3
	grid x .lblRxCh0 .lblRxCh1 .lblRxCh2 .lblRxCh3 -in $frmP32 -sticky w

	label .lblEq -text "Equalization"
	iwidgets::combobox .cboEqCh0 -width 8 -editable false -textvariable Para(EqCh0) -selectioncommand {}
	iwidgets::combobox .cboEqCh1 -width 8 -editable false -textvariable Para(EqCh1) -selectioncommand {}
	iwidgets::combobox .cboEqCh2 -width 8 -editable false -textvariable Para(EqCh2) -selectioncommand {}
	iwidgets::combobox .cboEqCh3 -width 8 -editable false -textvariable Para(EqCh3) -selectioncommand {}
	.cboEqCh0 insert list end DISABLE
	.cboEqCh1 insert list end DISABLE
	.cboEqCh2 insert list end DISABLE
	.cboEqCh3 insert list end DISABLE
	grid .lblEq .cboEqCh0 .cboEqCh1 .cboEqCh2 .cboEqCh3 -in $frmP32 -padx 2 -sticky w

	label .lblRxTerm -text "RX I/O Termination(Ohms)"
	iwidgets::combobox .cboRxTermCh0 -width 8 -editable false -textvariable Para(RxTermCh0) -selectioncommand {}
	iwidgets::combobox .cboRxTermCh1 -width 8 -editable false -textvariable Para(RxTermCh1) -selectioncommand {}
	iwidgets::combobox .cboRxTermCh2 -width 8 -editable false -textvariable Para(RxTermCh2) -selectioncommand {}
	iwidgets::combobox .cboRxTermCh3 -width 8 -editable false -textvariable Para(RxTermCh3) -selectioncommand {}
	.cboRxTermCh0 insert list end 50
	.cboRxTermCh1 insert list end 50
	.cboRxTermCh2 insert list end 50
	.cboRxTermCh3 insert list end 50
	grid .lblRxTerm .cboRxTermCh0 .cboRxTermCh1 .cboRxTermCh2 .cboRxTermCh3 -in $frmP32 -padx 2 -sticky w -pady 4

	label .lblRxCoup -text "RX I/O Coupling"
	iwidgets::combobox .cboRxCoupCh0 -width 8 -editable false -textvariable Para(RxCoupCh0) -selectioncommand {}
	iwidgets::combobox .cboRxCoupCh1 -width 8 -editable false -textvariable Para(RxCoupCh1) -selectioncommand {}
	iwidgets::combobox .cboRxCoupCh2 -width 8 -editable false -textvariable Para(RxCoupCh2) -selectioncommand {}
	iwidgets::combobox .cboRxCoupCh3 -width 8 -editable false -textvariable Para(RxCoupCh3) -selectioncommand {}
	.cboRxCoupCh0 insert list end AC
	.cboRxCoupCh1 insert list end AC
	.cboRxCoupCh2 insert list end AC
	.cboRxCoupCh3 insert list end AC
	grid .lblRxCoup .cboRxCoupCh0 .cboRxCoupCh1 .cboRxCoupCh2 .cboRxCoupCh3 -in $frmP32 -padx 2 -sticky w

	label .lblLoss -text "Loss of Threshold"
	iwidgets::combobox .cboLoss -width 8 -editable false -textvariable Para(Loss) -selectioncommand {}
	.cboLoss insert list end 0
	grid .lblLoss .cboLoss -in $frmP32 -padx 2 -sticky w -pady 4

	label .lblCDRLoss -text "CDR Loss of Lock"
	iwidgets::combobox .cboCDRLoss -width 8 -editable false -textvariable Para(CDRLoss) -selectioncommand {}
	.cboCDRLoss insert list end 0
	grid .lblCDRLoss .cboCDRLoss -in $frmP32 -padx 2 -sticky w

	pack .frmP32 -in $page -fill both

		#*** Clock and PLL Settings ***#
	iwidgets::labeledframe .frmP33 -labeltext "Clock and PLL Settings" -labelpos nw
	set frmP33 [.frmP33 childsite]
	CreateLabelCombobox $frmP33 TxTerm "TX PLL Reference Clock IO Termination(Ohms)" 20 8 Para(TxTerm) {50} {ChangeValueCmd}
	.lblTxTerm config -width 40 -anchor w
	CreateLabelCombobox $frmP33 TxCoup "TX PLL Reference Clock IO Coupling" 20 8 Para(TxCoup) {AC} {ChangeValueCmd}
	.lblTxCoup config -width 40 -anchor w
	CreateLabelCombobox $frmP33 TxPllLoss "PLL Loss of Lock" 20 8 Para(TxPllLoss) {0} {ChangeValueCmd}
	.lblTxPllLoss config -width 40 -anchor w

	pack .frmP33 -in $page -fill both

	#*** PCS Advanced Setup ***
	set page [$tnb add -label "PCS Advanced"]
		#*** Transmit Settings ***#
	iwidgets::labeledframe .frmP41 -labeltext "Transmit Settings" -labelpos nw
	set frmP41 [.frmP41 childsite]
	label .lblTxCh40 -text Ch0
	label .lblTxCh41 -text Ch1
	label .lblTxCh42 -text Ch2
	label .lblTxCh43 -text Ch3
	grid x .lblTxCh40 .lblTxCh41 .lblTxCh42 .lblTxCh43 -in $frmP41 -sticky w

	label .lblTxInv -text "TxInvert" -width 16 -anchor w
	iwidgets::combobox .cboTxInvCh0 -width 8 -editable false -textvariable Para(TxInvCh0) -selectioncommand {}
	iwidgets::combobox .cboTxInvCh1 -width 8 -editable false -textvariable Para(TxInvCh1) -selectioncommand {}
	iwidgets::combobox .cboTxInvCh2 -width 8 -editable false -textvariable Para(TxInvCh2) -selectioncommand {}
	iwidgets::combobox .cboTxInvCh3 -width 8 -editable false -textvariable Para(TxInvCh3) -selectioncommand {}
	.cboTxInvCh0 insert list end NORMAL
	.cboTxInvCh1 insert list end NORMAL
	.cboTxInvCh2 insert list end NORMAL
	.cboTxInvCh3 insert list end NORMAL
	grid .lblTxInv .cboTxInvCh0 .cboTxInvCh1 .cboTxInvCh2 .cboTxInvCh3 -in $frmP41 -padx 2 -sticky w

	pack .frmP41 -in $page -fill both

		#*** Receive Settings ***#
	iwidgets::labeledframe .frmP42 -labeltext "Receive Settings" -labelpos nw
	set frmP42 [.frmP42 childsite]
	frame .frmP421
	label .lblRxCh420 -text Ch0
	label .lblRxCh421 -text Ch1
	label .lblRxCh422 -text Ch2
	label .lblRxCh423 -text Ch3
	grid x .lblRxCh420 .lblRxCh421 .lblRxCh422 .lblRxCh423 -in .frmP421 -sticky w

	label .lblRxInv -text "RxInvert" -width 16 -anchor w
	iwidgets::combobox .cboRxInvCh0 -width 8 -editable false -textvariable Para(RxInvCh0) -selectioncommand {}
	iwidgets::combobox .cboRxInvCh1 -width 8 -editable false -textvariable Para(RxInvCh1) -selectioncommand {}
	iwidgets::combobox .cboRxInvCh2 -width 8 -editable false -textvariable Para(RxInvCh2) -selectioncommand {}
	iwidgets::combobox .cboRxInvCh3 -width 8 -editable false -textvariable Para(RxInvCh3) -selectioncommand {}
	.cboRxInvCh0 insert list end NORMAL
	.cboRxInvCh1 insert list end NORMAL
	.cboRxInvCh2 insert list end NORMAL
	.cboRxInvCh3 insert list end NORMAL
	grid .lblRxInv .cboRxInvCh0 .cboRxInvCh1 .cboRxInvCh2 .cboRxInvCh3 -in .frmP421 -padx 2 -sticky w

	label .lblRxMode -text "Rx 8B10B Mode" -width 16 -anchor w
	iwidgets::combobox .cboRxModeCh0 -width 8 -editable false -textvariable Para(RxModeCh0) -selectioncommand {}
	iwidgets::combobox .cboRxModeCh1 -width 8 -editable false -textvariable Para(RxModeCh1) -selectioncommand {}
	iwidgets::combobox .cboRxModeCh2 -width 8 -editable false -textvariable Para(RxModeCh2) -selectioncommand {}
	iwidgets::combobox .cboRxModeCh3 -width 8 -editable false -textvariable Para(RxModeCh3) -selectioncommand {}
	.cboRxModeCh0 insert list end NORMAL
	.cboRxModeCh1 insert list end NORMAL
	.cboRxModeCh2 insert list end NORMAL
	.cboRxModeCh3 insert list end NORMAL
	grid .lblRxMode .cboRxModeCh0 .cboRxModeCh1 .cboRxModeCh2 .cboRxModeCh3 -in .frmP421 -padx 2 -sticky w -pady 4

	pack .frmP421 -in $frmP42 -side top
	
			#*** Word Algnment ***#
	iwidgets::labeledframe .frmP422 -labeltext "Word Algnment" -labelpos nw
	set frmP422 [.frmP422 childsite]
	CreateLabelEntryLabel $frmP422 Plus "Plus Comma Value" 12 "" "" Para(Plus) hexidecimal
	CreateLabelEntryLabel $frmP422 Minus "Minus Comma Value" 12 "" "" Para(Minus) hexidecimal
	CreateLabelEntryLabel $frmP422 Mask "Comma Mask" 12 "" "" Para(Mask) hexidecimal
	CreateLabelCombobox $frmP422 Align "Comma Align" 20 8 Para(Align) {AUTO} {ChangeValueCmd}
	.lblTxCoup config -width 40 -anchor w
	.lblPlus config -width 20 -anchor w
	.lblMinus config -width 20 -anchor w
	.lblMask config -width 20 -anchor w
	.lblAlign config -width 20 -anchor w

	pack .frmP422 -in $frmP42 -side top -fill both

			#*** Word Algnment ***#
	iwidgets::labeledframe .frmP423 -labeltext "Clock Tolerence Compensation" -labelpos nw
	set frmP423 [.frmP423 childsite]
	label .lblRxCh4230 -text Ch0
	label .lblRxCh4231 -text Ch1
	label .lblRxCh4232 -text Ch2
	label .lblRxCh4233 -text Ch3
	grid x .lblRxCh4230 .lblRxCh4231 .lblRxCh4232 .lblRxCh4233 -in $frmP423 -sticky w

	label .lblCTC -text "CTC" -width 16 -anchor w
	iwidgets::combobox .cboCTCCh0 -width 8 -editable false -textvariable Para(CTCCh0) -selectioncommand {}
	iwidgets::combobox .cboCTCCh1 -width 8 -editable false -textvariable Para(CTCCh1) -selectioncommand {}
	iwidgets::combobox .cboCTCCh2 -width 8 -editable false -textvariable Para(CTCCh2) -selectioncommand {}
	iwidgets::combobox .cboCTCCh3 -width 8 -editable false -textvariable Para(CTCCh3) -selectioncommand {}
	.cboCTCCh0 insert list end NORMAL
	.cboCTCCh1 insert list end NORMAL
	.cboCTCCh2 insert list end NORMAL
	.cboCTCCh3 insert list end NORMAL
	grid .lblCTC .cboCTCCh0 .cboCTCCh1 .cboCTCCh2 .cboCTCCh3 -in $frmP423 -padx 2 -sticky w

	label .lblCC_MATCH1 -text "CC_MATCH1"
	iwidgets::entryfield .entryCC_MATCH1 -width 12 -textvariable Para(CC_MATCH1) -fixed 10 -validate integer
	grid .lblCC_MATCH1 .entryCC_MATCH1 -in $frmP423 -padx 2 -sticky w -pady 4

	label .lblCC_MATCH2 -text "CC_MATCH2"
	iwidgets::entryfield .entryCC_MATCH2 -width 12 -textvariable Para(CC_MATCH2) -fixed 10 -validate integer
	label .lblMinIPG -text "RX CTC Min IPG"
	iwidgets::combobox .cboMinIPG -width 8 -editable false -textvariable Para(MinIPG) -selectioncommand {}
	.cboMinIPG insert list end 3
	grid .lblCC_MATCH2 .entryCC_MATCH2 -in $frmP423 -padx 2 -sticky w
	grid .lblMinIPG -in $frmP423 -row 3 -column 2 -columnspan 2 -sticky w
	grid .cboMinIPG -in $frmP423 -row 3 -column 4 -sticky w

	label .lblCC_MATCH3 -text "CC_MATCH3"
	iwidgets::entryfield .entryCC_MATCH3 -width 12 -textvariable Para(CC_MATCH3) -fixed 10 -validate integer
	label .lblHigh -text "High Watermark"
	iwidgets::combobox .cboHigh -width 8 -editable false -textvariable Para(High) -selectioncommand {}
	.cboHigh insert list end 9
	grid .lblCC_MATCH3 .entryCC_MATCH3 -in $frmP423 -padx 2 -sticky w -pady 4
	grid .lblHigh -in $frmP423 -row 4 -column 2 -columnspan 2 -sticky w
	grid .cboHigh -in $frmP423 -row 4 -column 4 -sticky w

	label .lblCC_MATCH4 -text "CC_MATCH4"
	iwidgets::entryfield .entryCC_MATCH4 -width 12 -textvariable Para(CC_MATCH4) -fixed 10 -validate integer
	label .lblLow -text "Low Watermark"
	iwidgets::combobox .cboLow -width 8 -editable false -textvariable Para(Low) -selectioncommand {}
	.cboLow insert list end 9
	grid .lblCC_MATCH4 .entryCC_MATCH4 -in $frmP423 -padx 2 -sticky w
	grid .lblLow -in $frmP423 -row 5 -column 2 -columnspan 2 -sticky w
	grid .cboLow -in $frmP423 -row 5 -column 4 -sticky w

	label .lblCC_MATCH_MODE -text "CC_MATCH_MODE"
	iwidgets::combobox .cboCC_MATCH_MODE -width 11 -editable false -textvariable Para(CC_MATCH_MODE) -selectioncommand {}
	.cboCC_MATCH_MODE insert list end MATCH_3_4
	grid .lblCC_MATCH_MODE .cboCC_MATCH_MODE -in $frmP423 -padx 2 -sticky w -pady 4

	pack .frmP423 -in $frmP42 -side top -fill both

	pack .frmP42 -in $page -fill both

	#*** Optional Port Setup ***
	set page [$tnb add -label "Optional Port"]
	iwidgets::labeledframe .frmP5 -labeltext "" -labelpos nw
	set frmP5 [.frmP5 childsite]

	iwidgets::labeledframe .frmP51 -labeltext "Control Ports" -labelpos nw
	set frmP51 [.frmP51 childsite]
	label .lblRxData -text "Dynamic Inversion of Received Data"
	checkbutton .ckRxDataCh0 -text Ch0 -variable Para(RxDataCh0) -onvalue TRUE -offvalue FALSE
	checkbutton .ckRxDataCh1 -text Ch1 -variable Para(RxDataCh1) -onvalue TRUE -offvalue FALSE
	checkbutton .ckRxDataCh2 -text Ch2 -variable Para(RxDataCh2) -onvalue TRUE -offvalue FALSE
	checkbutton .ckRxDataCh3 -text Ch3 -variable Para(RxDataCh3) -onvalue TRUE -offvalue FALSE
	grid .lblRxData .ckRxDataCh0 .ckRxDataCh1 .ckRxDataCh2 .ckRxDataCh3 -in $frmP51 -padx 2 -sticky w

	label .lblAligner -text "Enable Comma Aligner"
	checkbutton .ckAlignerCh0 -text Ch0 -variable Para(AlignerCh0) -onvalue TRUE -offvalue FALSE
	checkbutton .ckAlignerCh1 -text Ch1 -variable Para(AlignerCh1) -onvalue TRUE -offvalue FALSE
	checkbutton .ckAlignerCh2 -text Ch2 -variable Para(AlignerCh2) -onvalue TRUE -offvalue FALSE
	checkbutton .ckAlignerCh3 -text Ch3 -variable Para(AlignerCh3) -onvalue TRUE -offvalue FALSE
	grid .lblAligner .ckAlignerCh0 .ckAlignerCh1 .ckAlignerCh2 .ckAlignerCh3 -in $frmP51 -padx 2 -sticky w

	label .lblDetect -text "Signal Detect"
	checkbutton .ckDetectCh0 -text Ch0 -variable Para(DetectCh0) -onvalue TRUE -offvalue FALSE
	checkbutton .ckDetectCh1 -text Ch1 -variable Para(DetectCh1) -onvalue TRUE -offvalue FALSE
	checkbutton .ckDetectCh2 -text Ch2 -variable Para(DetectCh2) -onvalue TRUE -offvalue FALSE
	checkbutton .ckDetectCh3 -text Ch3 -variable Para(DetectCh3) -onvalue TRUE -offvalue FALSE
	grid .lblDetect .ckDetectCh0 .ckDetectCh1 .ckDetectCh2 .ckDetectCh3 -in $frmP51 -padx 2 -sticky w

	pack .frmP51 -in $frmP5 -fill both

	checkbutton .ckPorts0 -text "Diagnostic and Loopback Ports" -variable Para(Ports0) -onvalue TRUE -offvalue FALSE
	checkbutton .ckPorts1 -text "Error Status Ports" -variable Para(Ports1) -onvalue TRUE -offvalue FALSE
	checkbutton .ckPorts2 -text "Reference Clock to FPGA Core Port" -variable Para(Ports2) -onvalue TRUE -offvalue FALSE
	checkbutton .ckPorts3 -text "SCI Ports" -variable Para(Ports3) -onvalue TRUE -offvalue FALSE -command ChangeValueCmd
	pack .ckPorts0 .ckPorts1 .ckPorts2 .ckPorts3 -in $frmP5 -anchor w -padx 20

	checkbutton .ckPorts3_1 -text "SCI Interrupt Ports" -variable Para(Ports3_1) -onvalue TRUE -offvalue FALSE
	pack .ckPorts3_1 -in $frmP5 -anchor w -padx 40

	pack .frmP5 -in $page -fill both -expand 1

	$tnb view 0

	ChangeValueCmd

	#FunctionButton
	#CenterPosition
	GeneralConfig
}