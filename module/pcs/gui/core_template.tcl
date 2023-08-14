#$Header: L:/module/pcs/gui/rcs/core_template.tcl 1.18 2009/04/23 08:48:45Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc GetTopicCB {} {
	global Para

	set Para(topic) "PCS"
}

proc ChangePins {} {
	global Para
	
}

proc ChangeCntlBitCmd {}  {
	global Para

	if {$Para(Bit1) == "0"}  {
		.entC1 config -state disabled
	} else  {
		.entC1 config -state normal	   
	} 
	if {$Para(Bit2) == "0"}  {
		.entC2 config -state disabled
	} else  {
		.entC2 config -state normal	   
	} 
	if {$Para(Bit3) == "0"}  {
		.entC3 config -state disabled
	} else  {
		.entC3 config -state normal	   
	} 
} 

proc ChangeModeCmd {} {
	global Para
	if {$Para(QuadMode) == "PCI-Express"}  {
		set Para(Bit1) 1
		set Para(Bit2) 1
		set Para(Bit3) 1
		set Para(Word1) FF
		set Para(Word2) BC
		set Para(Word3) BC
	} 
	if {$Para(QuadMode) == "Serial RapidIO"}  {
		set Para(Bit1) 1
		set Para(Bit2) 1
		set Para(Bit3) 1
		set Para(Word1) FF
		set Para(Word2) FB
		set Para(Word3) FB
	} 
	if {$Para(QuadMode) == "XAUI"}  {
		set Para(Bit1) 1
		set Para(Bit2) 1
		set Para(Bit3) 1
		set Para(Word1) FF
		set Para(Word2) 7C
		set Para(Word3) 7C
	} 
	if {$Para(QuadMode) == "Generic 8b10b"}  {
		set Para(Bit1) 0
		set Para(Bit2) 0
		set Para(Bit3) 0
#		set Para(Word1) ""
#		set Para(Word2) ""
#		set Para(Word3) ""
	} 
}

proc ChangeValueCmd {} {
	global Para

	set tnb $Para(tnb)
#	switch $Para(QuadMode)  {
#		"8-bit SERDES Only"       -
#		"10-bit SERDES Only"      -
#		"Generic 8b10b"           {set Para(BitClkRate) 3.4} 
#		"XAUI"                   -
#		"4x Serial RapidIO*"      {set Para(BitClkRate) 3.125} 
#		"1x PCI-Express"          -
#		"4x PCI-Express*"         {set Para(BitClkRate) 2.5} 
#		"Gigabit Ethernet"        -
#		"1x Serial RapidIO"       {set Para(BitClkRate) 1.25} 
#		"Fibre Channel"           {set Para(BitClkRate) 1.0625} 
#		"SONET(STS-12 or STS-48)" {set Para(BitClkRate) 0.622} 
#	} 
	.ckB0 config -state disabled
	.ckB1 config -state disabled
	.ckB2 config -state disabled

	if {$Para(QuadMode) == "XAUI"}  {
		.ckA0 config -state disabled
		.ckA1 config -state disabled
		.ckA2 config -state disabled
		.ckA3 config -state disabled
		set Para(enChannel0) 1
		set Para(enChannel1) 1
		set Para(enChannel2) 1
		set Para(enChannel3) 1
	} else  {
		.ckA0 config -state normal
		.ckA1 config -state normal
		.ckA2 config -state normal
		.ckA3 config -state normal
	} 

	if {$Para(enChannel0) == "1" && $Para(enChannel1) == "1"}  {
		.ckB0 config -state normal
	} else  {
		set Para(enAlign0) 0
	} 

	if {$Para(enChannel2) == "1" && $Para(enChannel3) == "1"}  {
		.ckB1 config -state normal
	} else  {
		set Para(enAlign1) 0
	} 

	if {$Para(enChannel0) == "1" && $Para(enChannel1) == "1" && 
		$Para(enChannel2) == "1" && $Para(enChannel3) == "1"}  {
		if {$Para(enAlign0) == "1" || $Para(enAlign1) == "1"}  {
			.ckB2 config -state disabled
			set Para(enAlign2) 0
		} else  {
			.ckB2 config -state normal
		} 
		if {$Para(enAlign2) == "1"}  {
			.ckB0 config -state disabled
			.ckB1 config -state disabled
			set Para(enAlign0) 0
			set Para(enAlign1) 0
		} else  {
			.ckB0 config -state normal
			.ckB1 config -state normal
		} 
	} else  {
		set Para(enAlign2) 0
	} 

	if {$Para(enAlign0) == "1" || $Para(enAlign1) == "1" || $Para(enAlign2) == "1"}  {
		$tnb pageconfigure end -state normal		
	} else  {
		$tnb pageconfigure end -state disabled
	} 

	if {$Para(QuadMode) != "8-bit SERDES Only" &&
	    $Para(QuadMode) != "SONET(STS-12 or STS-48)"}  {
		if {$Para(BitClkRate) > "1.7"}  {
			.cboClkMult clear list
			.cboClkMult insert list end 20X 10X 5X
			if {[lsearch {20X 10X 5X} $Para(RefClkMult)] == -1}  {set Para(RefClkMult) 20X} 
		} 
		if {$Para(BitClkRate) < "1.2"}  {
			.cboClkMult clear list
			.cboClkMult insert list end 10X 5X (5/2)X
			if {[lsearch {10X 5X (5/2)X} $Para(RefClkMult)] == -1}  {set Para(RefClkMult) 10X} 
		} 
		if {$Para(BitClkRate) >= "1.2" && $Para(BitClkRate) <= "1.7"}  {
			.cboClkMult clear list
			.cboClkMult insert list end 20X 10X 5X (5/2)X
			if {[lsearch {20X 10X 5X (5/2)X} $Para(RefClkMult)] == -1}  {set Para(RefClkMult) 20X} 
		} 
	} else  {
		if {$Para(BitClkRate) > "1.7"}  {
			.cboClkMult clear list
			.cboClkMult insert list end 16X 8X 4X
			if {[lsearch {16X 8X 4X} $Para(RefClkMult)] == -1}  {set Para(RefClkMult) 16X} 
		} 
		if {$Para(BitClkRate) < "1.2"}  {
			.cboClkMult clear list
			.cboClkMult insert list end 8X 4X 2X
			if {[lsearch {8X 4X 2X} $Para(RefClkMult)] == -1}  {set Para(RefClkMult) 8X} 
		} 
		if {$Para(BitClkRate) >= "1.2" && $Para(BitClkRate) <= "1.7"}  {
			.cboClkMult clear list
			.cboClkMult insert list end 16X 8X 4X 2X
			if {[lsearch {16X 8X 4X 2X} $Para(RefClkMult)] == -1}  {set Para(RefClkMult) 16X} 
		} 
	} 

	if {$Para(QuadMode) == "10-bit SERDES Only"}  {
		.cboBusWidth clear list
		.cboBusWidth insert list end 10 20
		if {[lsearch {10 20} $Para(BusWidth)] == -1}  {set Para(BusWidth) 10} 
	} else  {
		.cboBusWidth clear list
		.cboBusWidth insert list end 8 16
		if {[lsearch {8 16} $Para(BusWidth)] == -1}  {set Para(BusWidth) 8} 
	} 

	set clkmult_lst {20X 10X 5X (5/2)X 16X 8X 4X 2X}
	set ratio_lst {20 10 5 2.5 16 8 4 2}
	set ratio [lindex $ratio_lst [lsearch -exact $clkmult_lst $Para(RefClkMult)]]
	#ISPL_CR_29652 
	if {$Para(BitClkRate) >0}  {
		set Para(RefClkRate) [expr $Para(BitClkRate) * 1000 / $ratio]
	} 

	#26710
	if {$Para(QuadMode) != "8-bit SERDES Only" &&
	    $Para(QuadMode) != "SONET(STS-12 or STS-48)"}  {
		if {$Para(BusWidth) == "8" || $Para(BusWidth) == "10"}  {
			set Para(IntClkRate) [expr $Para(RefClkRate)*$ratio/10]
		} 
		if {$Para(BusWidth) == "16" || $Para(BusWidth) == "20"}  {
			set Para(IntClkRate) [expr $Para(RefClkRate)*$ratio/20]
		} 
	} else  {
		set Para(IntClkRate) [expr $Para(RefClkRate)*$ratio/$Para(BusWidth)]
	} 

#	if {$ratio >= $Para(BusWidth)}  {
#		set ratio [expr int($ratio/$Para(BusWidth))]
#	} else {
#		set temp [expr int($Para(BusWidth)/$ratio)]
#		switch $temp  {
#			2 {set ratio 0.5}
#			4 {set ratio 0.25}
#			8 {set ratio 0.125}
#		} 
#	} 
#	set Para(IntClkRate) [expr $Para(RefClkRate)*$ratio]

	ChangeCntlBitCmd

	if {$Para(QuadMode) == "Generic 8b10b"}  {
		.ck10gLsm config -state normal
	} else {
		.ck10gLsm config -state disabled
		set Para(en10gLsm) 0
	}
	
	#CR_34704
	if {$Para(enAlign0) == "1" && $Para(enAlign1) == "1"}  {
		.ckC0 config -state disabled
		set Para(enQuad) 0
	} else {
		.ckC0 config -state normal
	}

	if {$Para(enQuad) == "1"}  {
		.cboQuadGroup config -state normal
	} else  {
		.cboQuadGroup config -state disabled
	} 
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para OldPara

	if {$Para(new) == 0} {LoadParameter $Para(CoreName) $Para(ParaFile)}

	ChangeValueCmd
	ChangePins
}

proc CheckRegenerate {} {
	global Para OldPara

	#new a module
	if {$Para(new) == 1} { 
		return 1
	} else {
#		tk_messageBox -default ok -icon info -message $Para(newpath) -title newpath -type ok
#		tk_messageBox -default ok -icon info -message $Para(newmodule) -title newmodule -type ok
		if {[string length $Para(newpath)] > 0 && [string length $Para(newmodule)] > 0} {return 1}
	}
	
	set para_lst {VendorName CoreType Date Time CoreStatus CoreName CoreRevision ParameterFileVersion \
		enControlPorts enSystemBus AmpBoost}
	
	foreach pn [array names OldPara] {
		if {[lsearch $para_lst $pn] == -1 &&
			$OldPara($pn) != $Para($pn)} {return 1}
	}
	return 0
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

	set dsp_lst {"8-bit SERDES Only" \
				 "10-bit SERDES Only" \
				 "SONET(STS-12 or STS-48)" \
				 "Gigabit Ethernet" \
				 "Fibre Channel" \
				 "XAUI" \
				 "Serial RapidIO" \
				 "PCI-Express" \
				 "Generic 8b10b"}
	set index [lsearch -exact $dsp_lst $Para(QuadMode)]

	set mode_lst {"SERDES Only(8/16-bit)" \
				  "SERDES Only(10/20-bit)" \
				  "SONET(STS-12, STS-48)" \
				  "Gigabit Ethernet" \
				  "Fibre Channel(Single SERDES)" \
				  "XAUI" \
				  "Serial RapidIO" \
				  "PCI Express" \
				  "8b10b"}
	set mode [lindex $mode_lst $index]
	puts $outputfile "#define _circuit_name  $Para(ModuleName)\n"

	if {$Para(enChannel0) == 1}  {
		puts $outputfile "#define _channel_A_options \"$mode\"\n"
	} else  {
		puts $outputfile "#define _channel_A_options \"Disabled\"\n"
	} 
	if {$Para(enChannel1) == 1}  {
		puts $outputfile "#define _channel_B_options \"$mode\"\n"
	} else  {
		puts $outputfile "#define _channel_B_options \"Disabled\"\n"
	} 
	if {$Para(enChannel2) == 1}  {
		puts $outputfile "#define _channel_C_options \"$mode\"\n"
	} else  {
		puts $outputfile "#define _channel_C_options \"Disabled\"\n"
	} 
	if {$Para(enChannel3) == 1}  {
		puts $outputfile "#define _channel_D_options \"$mode\"\n"
	} else  {
		puts $outputfile "#define _channel_D_options \"Disabled\"\n"
	} 

	if {$Para(enAlign0) == "0" && $Para(enAlign1) == "0" && $Para(enAlign2) == "0"}  {
		puts $outputfile "#define _channel_align_mode	None\n"
	} 
	if {$Para(enAlign0) == "1" && $Para(enAlign1) == "0"}  {
		puts $outputfile "#define _channel_align_mode	align_01\n"
	} 
	if {$Para(enAlign0) == "0" && $Para(enAlign1) == "1"}  {
		puts $outputfile "#define _channel_align_mode	align_23\n"
	} 
	if {$Para(enAlign0) == "1" && $Para(enAlign1) == "1"}  {
		puts $outputfile "#define _channel_align_mode	align_01_23\n"
	} 
	if {$Para(enAlign2) == "1"}  {
		puts $outputfile "#define _channel_align_mode	all\n"
	} 

	puts $outputfile "#define _en_control_ports $Para(enControlPorts)\n"
	puts $outputfile "#define _enable_system_bus $Para(enSystemBus)\n"
	puts $outputfile "#define _enable_10g_lsm $Para(en10gLsm)\n"

	set cbo_list {"Dedicated CML Transmit/Receive Reference Clock" \
				  "Dedicated CML Transmit Reference Clock and Separate Dedicated CML Receive Reference Clock" \
				  "FPGA Logic Sourced Transmit/Receive Reference Clocks" \
				  "All Reference Clocks"}
	set clk_lst {refclk rxrefclk ff_refclk all}
	set index [lsearch -exact $cbo_list $Para(ClkSelect)]
	set clk_select [lindex $clk_lst $index]
	puts $outputfile "#define _ref_clock_select \"$clk_select\"\n"

	puts $outputfile "#define _ref_clk_mult $Para(RefClkMult)\n"
	if {$Para(BitClkRate) < "1.2"}  {
		puts $outputfile "#define _rate_mode \"half_rate\"\n"
		set rate_mode "half_rate"
		if {$Para(RefClkMult) == "8X" || $Para(RefClkMult) == "10X"}  {
			puts $outputfile "#define _refclk_mode 00\n"
		} 
		if {$Para(RefClkMult) == "4X" || $Para(RefClkMult) == "5X"}  {
			puts $outputfile "#define _refclk_mode 01\n"
		} 
		if {$Para(RefClkMult) == "2X" || $Para(RefClkMult) == "(5/2)X"}  {
			puts $outputfile "#define _refclk_mode 10\n"
		} 
	} 
	if {$Para(BitClkRate) > "1.7"}  {
		puts $outputfile "#define _rate_mode \"full_rate\"\n"
		set rate_mode "full_rate"
		if {$Para(RefClkMult) == "16X" || $Para(RefClkMult) == "20X"}  {
			puts $outputfile "#define _refclk_mode 00\n"
		} 
		if {$Para(RefClkMult) == "8X" || $Para(RefClkMult) == "10X"}  {
			puts $outputfile "#define _refclk_mode 01\n"
		} 
		if {$Para(RefClkMult) == "4X" || $Para(RefClkMult) == "5X"}  {
			puts $outputfile "#define _refclk_mode 10\n"
		} 
	} 
	if {$Para(BitClkRate) >= "1.2" && $Para(BitClkRate) <= "1.7"}  {
		if {$Para(RefClkMult) == "16X" || $Para(RefClkMult) == "20X"}  {
			puts $outputfile "#define _rate_mode \"full_rate\"\n"
			puts $outputfile "#define _refclk_mode 00\n"
			set rate_mode "full_rate"
		} 
		if {$Para(RefClkMult) == "8X" || $Para(RefClkMult) == "10X"}  {
			puts $outputfile "#define _rate_mode \"half_rate\"\n"
			puts $outputfile "#define _refclk_mode 00\n"
			set rate_mode "half_rate"
		} 
		if {$Para(RefClkMult) == "4X" || $Para(RefClkMult) == "5X"}  {
			puts $outputfile "#define _rate_mode \"half_rate\"\n"
			puts $outputfile "#define _refclk_mode 01\n"
			set rate_mode "half_rate"
		} 
		if {$Para(RefClkMult) == "2X" || $Para(RefClkMult) == "(5/2)X"}  {
			puts $outputfile "#define _rate_mode \"half_rate\"\n"
			puts $outputfile "#define _refclk_mode 10\n"
			set rate_mode "half_rate"
		} 
	} 

	if {$Para(BusWidth) == "16"}  {
		puts $outputfile "#define _16_bit_ch_a 1\n"
		puts $outputfile "#define _16_bit_ch_b 1\n"
		puts $outputfile "#define _16_bit_ch_c 1\n"
		puts $outputfile "#define _16_bit_ch_d 1\n"
	} 
	if {$Para(BusWidth) == "8"}  {
		puts $outputfile "#define _16_bit_ch_a 0\n"
		puts $outputfile "#define _16_bit_ch_b 0\n"
		puts $outputfile "#define _16_bit_ch_c 0\n"
		puts $outputfile "#define _16_bit_ch_d 0\n"
	} 
	if {$Para(BusWidth) == "20"}  {
		puts $outputfile "#define _20_bit_ch_a 1\n"
		puts $outputfile "#define _20_bit_ch_b 1\n"
		puts $outputfile "#define _20_bit_ch_c 1\n"
		puts $outputfile "#define _20_bit_ch_d 1\n"
	} 
	if {$Para(BusWidth) == "10"}  {
		puts $outputfile "#define _20_bit_ch_a 0\n"
		puts $outputfile "#define _20_bit_ch_b 0\n"
		puts $outputfile "#define _20_bit_ch_c 0\n"
		puts $outputfile "#define _20_bit_ch_d 0\n"
	} 

	#23720
	if {$rate_mode == "full_rate"}  {
		if {$Para(BitClkRate) <= "1.5" }  {
#			puts $outputfile "#define _maxrate f1_50g\n"
		} 
		if {$Para(BitClkRate) > "1.5" && $Para(BitClkRate) <= "2.8" }  {
#			puts $outputfile "#define _maxrate f2_80g\n"
		} 
		if {$Para(BitClkRate) > "2.8" }  {
#			puts $outputfile "#define _maxrate f3_40g\n"
		} 
	} else  {
		if {$Para(BitClkRate) <= "0.75" }  {
#			puts $outputfile "#define _maxrate h0_75g\n"
		} 
		if {$Para(BitClkRate) > "0.75" && $Para(BitClkRate) <= "1.4" }  {
#			puts $outputfile "#define _maxrate h1_40g\n"
		} 
		if {$Para(BitClkRate) > "1.4" }  {
#			puts $outputfile "#define _maxrate h1_70g\n"
		} 
	} 
	puts $outputfile "#define _maxrate $Para(BitClkRate)\n"
	puts $outputfile "#define _amp_boost \"$Para(AmpBoost)\"\n"

	if {$Para(enAlign0) == "1" || $Para(enAlign1) == "1" || $Para(enAlign2) == "1"}  {
		set len1 [string length $Para(Word1)]
		set len2 [string length $Para(Word2)]
		set len3 [string length $Para(Word3)]
		set word1 [string repeat 0 [expr 2 - $len1]]$Para(Word1)
		set word2 [string repeat 0 [expr 2 - $len2]]$Para(Word2)
		set word3 [string repeat 0 [expr 2 - $len3]]$Para(Word3)
		#puts $outputfile "#define _channel_align_mask  $Para(Bit1)$word1\n"
		#puts $outputfile "#define _channel_align_a  $Para(Bit2)$word2\n"
		#puts $outputfile "#define _channel_align_b  $Para(Bit3)$word3\n"
		puts $outputfile "#define _ch_align_mask_bit  $Para(Bit1)\n"
		puts $outputfile "#define _ch_align_mask_word  $word1\n"
		puts $outputfile "#define _ch_align_a_bit  $Para(Bit2)\n"
		puts $outputfile "#define _ch_align_a_word  $word2\n"
		puts $outputfile "#define _ch_align_b_bit  $Para(Bit3)\n"
		puts $outputfile "#define _ch_align_b_word  $word3\n"
		if {$Para(QuadGroup) == "Group 0"}  {set tmp group_0} 
		if {$Para(QuadGroup) == "Group 1"}  {set tmp group_1} 
		if {$Para(QuadGroup) == "Group 2"}  {set tmp group_2} 
		if {$Para(QuadGroup) == "Group 3"}  {set tmp group_3} 

		if {$Para(enQuad) == "0"}  {
			puts $outputfile "#define _enable_quad_align  none\n"
		} else  {
			puts $outputfile "#define _enable_quad_align  $tmp\n"
		} 
	}

	set ret [CheckRegenerate]
	if {$ret == 0} {
		puts $outputfile "#include <pcs/pcs_cfg.txt>"
	} else {
		if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
			[string equal -nocase $Para(SourceFormat) "VHDL"]} {
			puts $outputfile "#define _lang vhdl\n"
			puts $outputfile "#include <pcs/PCS.vhd>"
			puts $outputfile "#include <pcs/pcs_cfg.txt>"
		}
		if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
			[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {
			puts $outputfile "#define _lang verilog\n"
			puts $outputfile "#include <pcs/PCS.v>"
			puts $outputfile "#include <pcs/pcs_cfg.txt>"
		}
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
	if {[string length $Para(BitClkRate)] == 0}  {
		set msg "Please input Serial Bit Clock Rate!"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	} 
	return 0
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para tcl_platform

	set ret [CheckParameterCB]
	if {$ret == -1} {return -1}

	set out_msg "\tModule Name: $Para(ModuleName)\n\tCore Type: $Para(CoreName)\n\tLPC file : $Para(ModuleName).lpc"

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] || \
	    [string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "VHDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {

		set ret [CreatePpFile]
		if {$ret == -1} {return -1}
		append out_msg "\n\tPP File : $Para(ModuleName).pp"

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
	} else  {
		append out_msg "\n Only Parameter configuration file $Para(ModuleName).lpc has been created in $Para(ProjectPath)."
	} 

	return $out_msg
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	#*** Set Public value ***

	#*** set private value ***

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. DrawImage
	# 4. ProjectInfo
	# 5. AttributeSetting
	ProjectSet
	MainInterface
	AttributeSetting 410 400
	set Para(Fdir) "Fmaco"
	set pin_flag orcapp
	DrawImage 300 550
	set tnb $Para(tnb)

		wm title . "Lattice FPGA Module -- $Para(CoreName)"

	#*** Here for user to add extra pages ***
	#--- Page #1 ---
		set page [$tnb add -label "PCS"]
		iwidgets::Labeledframe .para -labeltext "PCS Quad Mode Definition" -labelpos nw -ipady 20
		set para [.para childsite]

		iwidgets::combobox .cboMode -labeltext "Quad Mode" -width 30 -editable false \
			-textvariable Para(QuadMode) -selectioncommand {ChangeValueCmd;ChangeModeCmd;DrawPins}
		.cboMode insert list end "8-bit SERDES Only" \
								 "10-bit SERDES Only" \
								 "SONET(STS-12 or STS-48)" \
								 "Gigabit Ethernet" \
								 "Fibre Channel" \
								 "XAUI" \
								 "Serial RapidIO" \
								 "PCI-Express" \
								 "Generic 8b10b" 
	#							 "Serial Digital Video"
		pack .cboMode -in $para -anchor w -padx 15 -pady 8

		frame .frmChannelAlign
		frame .frmChannel
		checkbutton .ckA0 -text "Channel 0 Enabled"  -variable Para(enChannel0) -command {ChangeValueCmd;DrawPins}
		checkbutton .ckA1 -text "Channel 1 Enabled"  -variable Para(enChannel1) -command {ChangeValueCmd;DrawPins}
		checkbutton .ckA2 -text "Channel 2 Enabled"  -variable Para(enChannel2) -command {ChangeValueCmd;DrawPins}
		checkbutton .ckA3 -text "Channel 3 Enabled"  -variable Para(enChannel3) -command {ChangeValueCmd;DrawPins}
		pack .ckA0 .ckA1 .ckA2 .ckA3 -in .frmChannel -anchor w -padx 10 -pady 4

		frame .frmAlign
		checkbutton .ckB0 -text "Align Channels 0 and 1"     -variable Para(enAlign0) -command {ChangeValueCmd;DrawPins}
		checkbutton .ckB1 -text "Align Channels 2 and 3"     -variable Para(enAlign1) -command {ChangeValueCmd;DrawPins}
		checkbutton .ckB2 -text "Align Channels 0,1,2 and 3" -variable Para(enAlign2) -command {ChangeValueCmd;DrawPins}
		pack .ckB0 .ckB1 .ckB2 -in .frmAlign -anchor w -padx 10 -pady 4
		pack .frmChannel .frmAlign -in .frmChannelAlign -side left
		pack .frmChannelAlign -in $para -anchor w -padx 20

		checkbutton .ckControl -text "Optional Direct Control & Status Register Access" \
			-variable Para(enControlPorts) -command DrawPins
		pack .ckControl -in $para -anchor w -padx 15 -pady 6

		checkbutton .ckSystemBus -text "Optional System Bus Interface" \
			-variable Para(enSystemBus) -command DrawPins
		pack .ckSystemBus -in $para -anchor w -padx 15 -pady 6

		checkbutton .ck10gLsm -text "Use internal 10G (XAUI) Link State Machine" \
			-variable Para(en10gLsm) -command DrawPins
		pack .ck10gLsm -in $para -anchor w -padx 15 -pady 6

		pack .para -in $page -expand 1 -fill both

	#--- Page #2 ---
		set page2 [$tnb add -label "Setup"]
		iwidgets::Labeledframe .para2 -labeltext "PCS Quad Clocking Setup" -labelpos nw
		set para2 [.para2 childsite]

		iwidgets::Labeledframe .clkSelect -labeltext "Reference Clock Source Selection" -labelpos nw
		set clkSelect [.clkSelect childsite]
		iwidgets::combobox .cboClock -width 50 -editable false \
			-textvariable Para(ClkSelect) -selectioncommand {ChangeValueCmd;DrawPins}
		#ISPL_CR_30524
		.cboClock insert list end "Dedicated CML Transmit/Receive Reference Clock" \
								  "FPGA Logic Sourced Transmit/Receive Reference Clocks" \
								  "All Reference Clocks"
		pack .cboClock -in $clkSelect -anchor w -pady 4
		pack .clkSelect -in $para2 -fill x -anchor w -pady 8

		iwidgets::Labeledframe .clkRate -labeltext "Reference Clock Rate Multiplier Selection" -labelpos nw
		set clkRate [.clkRate childsite]
		iwidgets::entryfield .entBitClkRate -labeltext "Serial Bit Clock Rate* (GHz)" -textvariable Para(BitClkRate) -width 10 -fixed 8 \
			-validate real -labelpos w
		.entBitClkRate.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
			}
		iwidgets::combobox .cboClkMult -labeltext "Reference Clock Multiplier" -textvariable Para(RefClkMult) -width 6 -editable false \
			-justify center -labelpos w -selectioncommand {ChangeValueCmd;DrawPins}
		iwidgets::entryfield .entClkRate -labeltext "Calculated Reference Clock Rate (MHz)" -textvariable Para(RefClkRate) -width 10 -fixed 8 \
			-validate real -labelpos w -state disabled -disabledforeground black
		iwidgets::combobox .cboBusWidth -labeltext "FPGA Interface Data Bus Width" -textvariable Para(BusWidth) -width 6 -editable false \
			-justify center -labelpos w -selectioncommand {ChangeValueCmd;DrawPins}
		iwidgets::entryfield .entFPGAClkRate -labeltext "FPGA Interface Clock Rate (MHz)" -textvariable Para(IntClkRate) -width 10 -fixed 8 \
			-validate real -labelpos w -state disabled -disabledforeground black
		.entBitClkRate.label  config -width 35 -anchor w
		.cboClkMult.label     config -width 35 -anchor w
		.entClkRate.label     config -width 35 -anchor w
		.cboBusWidth.label    config -width 35 -anchor w
		.entFPGAClkRate.label config -width 35 -anchor w
		pack .entBitClkRate .cboClkMult .entClkRate .cboBusWidth .entFPGAClkRate -in $clkRate -anchor w -padx 10 -pady 4

		frame .sep2 -width 300 -height 2 -borderwidth 1 -relief sunken
		pack .sep2 -in $clkRate -expand yes -pady 4

		label .lblText2 -text "*Individual channel and individual transmit and receive bit clock rates \ncan be set with certain limits. \
			See the LatticeSC PCS Data Sheet for\nadditional information." -justify left
		pack .lblText2 -in $clkRate -anchor w -padx 4
		pack .clkRate -in $para2 -fill x -anchor w

		checkbutton .ckAmpBoost -text "Amplitude Boost" \
			-variable Para(AmpBoost) -onvalue Enabled -offvalue Disabled -command DrawPins
		pack .ckAmpBoost -in $para2 -anchor w -padx 15
		
		pack .para2 -in $page2 -expand 1 -fill both

	#--- Page #3 ---
		set page3 [$tnb add -label "Multi-Channel Alignment"]
		iwidgets::Labeledframe .para3
		set para3 [.para3 childsite]

		iwidgets::Labeledframe .frmSetting1 -labeltext "Multi-channel Alignment Settings" -labelpos nw
		set frmSetting1 [.frmSetting1 childsite]

		label .lblContBit -text "Control Bit"
		label .lblWord    -text "Word"

		label .lblC1 -text "Channel alignment Character\nBit Mask (1 = compare bit)"
		iwidgets::combobox .cboC1 -width 2 -editable false -textvariable Para(Bit1) -selectioncommand {ChangeCntlBitCmd}
		iwidgets::entryfield .entC1 -labeltext "0x" -width 3 -textvariable Para(Word1)
		.cboC1 insert list end 0 1

		label .lblC2 -text "Channel Alignment Character \"A\""
		iwidgets::combobox .cboC2 -width 2 -editable false -textvariable Para(Bit2) -selectioncommand {ChangeCntlBitCmd}
		iwidgets::entryfield .entC2 -labeltext "0x" -width 3 -textvariable Para(Word2)
		.cboC2 insert list end 0 1

		label .lblC3 -text "Channel Alignment Character \"B\""
		iwidgets::combobox .cboC3 -width 2 -editable false -textvariable Para(Bit3) -selectioncommand {ChangeCntlBitCmd}
		iwidgets::entryfield .entC3 -labeltext "0x" -width 3 -textvariable Para(Word3)
		.cboC3 insert list end 0 1

		grid x .lblContBit .lblWord -in $frmSetting1
		grid .lblC1 .cboC1 .entC1 -in $frmSetting1 -sticky w
		grid .lblC2 .cboC2 .entC2 -in $frmSetting1 -sticky w -pady 2
		grid .lblC3 .cboC3 .entC3 -in $frmSetting1 -sticky w -pady 6
		pack .frmSetting1 -in $para3 -fill x -anchor w -pady 8

		iwidgets::Labeledframe .frmSetting2 -labeltext "Multi-Quad Alignment Settings" -labelpos nw
		set frmSetting2 [.frmSetting2 childsite]
		checkbutton .ckC0 -text "Enable Multi-Quad Alignment" -variable Para(enQuad) -anchor e -command {ChangeValueCmd;DrawPins}
		grid .ckC0 -in $frmSetting2 -columnspan 2 -sticky w -pady 4

		iwidgets::combobox .cboQuadGroup -labeltext "Select Muti-Quad Alignment Group" -width 10 -editable false \
			-textvariable Para(QuadGroup) -selectioncommand {ChangeValueCmd;DrawPins}
		.cboQuadGroup insert list end "Group 0" "Group 1" "Group 2" "Group 3"
		grid .cboQuadGroup -in $frmSetting2 -columnspan 2 -sticky w -pady 4

		pack .frmSetting2 -in $para3 -fill x -anchor w -pady 8

		pack .para3 -in $page3 -expand 1 -fill both

		$tnb view 0

		ChangeValueCmd

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}