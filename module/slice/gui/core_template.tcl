#$Header: L:/module/slice/gui/core_template.tcl 1.25 mghuang Exp $

#Rev 1.25: Diamond 3.0 IPExpress: Fixed SOF-116588
#Rev 1.24: Diamond 2.0 IPExpress: Fixed CR_55146

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(WidthAA)] > 0 && [string length $Para(WidthAB)] > 0}  {
		DrawPins
	} 
} 

	# === ECP3 Cmd-Line ===
proc ECP3CmdLine {} {
	global Para

	set str "-arch $Para(arch) -type dspslice"
	
	if {$Para(EnMultA) == "ENABLED"} {lappend str -enable_multa}
	if {$Para(EnMultB) == "ENABLED"} {lappend str -enable_multb}
	if {$Para(reset) == "SYNC"} {lappend str -enable_sync}
	if {$Para(EnMatchReg) == "ENABLED"} {lappend str -enable_cascade}
	if {$Para(EnALU) == "ENABLED"} {lappend str -enable_alu
		switch $Para(Operation) {
			"A + B + C" {lappend str -opcode_alu 0}
			"A - B + C" {lappend str -opcode_alu 1}
			"A + B - C" {lappend str -opcode_alu 2} 
			"A - B - C" {lappend str -opcode_alu 3}
			"B XNOR C" {lappend str -opcode_alu 4}
			"B XOR C" {lappend str -opcode_alu 5}
			"B NAND C" {lappend str -opcode_alu 6}
			"B AND C" {lappend str -opcode_alu 7}
			"B OR C" {lappend str -opcode_alu 8}
			"B NOR C" {lappend str -opcode_alu 9}
			"DYNAMIC" {lappend str -opcode_alu 10}
		}
		switch $Para(InputA) {
			"ALU Feedback" {lappend str -opcode_muxa 0}
			"MultA" {lappend str -opcode_muxa 1}
			"A_ALU" {lappend str -opcode_muxa 2}
			"0" {lappend str -opcode_muxa 3}
			"DYNAMIC" {lappend str -opcode_muxa 4}
		}
		switch $Para(InputB) {
			"MultB Shift 18 L" {lappend str -opcode_muxb 0}
			"MultB" {lappend str -opcode_muxb 1}
			"B_ALU" {lappend str -opcode_muxb 2}
			"0" {lappend str -opcode_muxb 3}
			"DYNAMIC" {lappend str -opcode_muxb 4}
		}
		switch $Para(InputC) {
			"0" {lappend str -opcode_muxc 0}
			"CIN Shift 18 R" {lappend str -opcode_muxc 1}
			"CIN" {lappend str -opcode_muxc 2}
			"C_ALU" {lappend str -opcode_muxc 3}
			"A_ALU" {lappend str -opcode_muxc 4}
			"ALU Feedback" {lappend str -opcode_muxc 5}
			"RNDtoPN" {lappend str -opcode_muxc 6}
			"RNDtoPNM1" {lappend str -opcode_muxc 7}
			"DYNAMIC" {lappend str -opcode_muxc 8}
		}

		if {$Para(MCPAT)=="DYNAMIC"} {
			lappend str -mcpat_source
		} else {
			lappend str -mcpat 0x$Para(xMCPAT)
		}
		if {$Para(MASKPAT)=="DYNAMIC"} {
			lappend str -maskpat_source
		} else {
			lappend str -maskpat 0x$Para(xMASKPAT)
		}

		lappend str -mask01 0x$Para(xMASK01) -rndpat 0x$Para(xRNDPAT) -nrndpat $Para(nRNDPAT)
	}
	
	#if {$Para(gsr) == "ENABLED"} {lappend str -gsr}
	#lappend str -gsr $Para(gsr)
	
	if {$Para(EnMultA) == "ENABLED" || $Para(InputA) == "A_ALU" || $Para(InputA) == "DYNAMIC" || $Para(InputC) == "A_ALU"} {
		lappend str -widtha $Para(WidthAA) -widthb $Para(WidthAB)
		switch $Para(SourceAA) {
		    "Parallel" {}
		    "Shift"    {lappend str -shiftina0}
		    "Dynamic"  {lappend str -dynamica0}
		}
		switch $Para(SourceAB) {
		    "Parallel" {}
		    "Shift"    {lappend str -shiftinb0}
		    "Dynamic"  {lappend str -dynamicb0}
		}
		switch $Para(SignAA) {
		    "Unsigned" {
				switch $Para(SignAB)  {
					"Unsigned" {lappend str -unsigned}
					"Signed"   {lappend str -signed -unsigneda}
					"Dynamic"  {lappend str -signedb -unsigneda}
				} 
			}
		    "Signed"   {
				switch $Para(SignAB)  {
					"Unsigned" {lappend str -signed -unsignedb}
					"Signed"   {lappend str -signed}
					"Dynamic"  {lappend str -signed -signedb}
				} 
			}
		    "Dynamic"  {
				switch $Para(SignAB)  {
					"Unsigned" {lappend str -signeda -unsignedb}
					"Signed"   {lappend str -signed -signeda}
					"Dynamic"  {lappend str -signeda -signedb}
				} 
			}
		}
	}

#The GUI must have the following command-line option for SignBA and SignBB:

#mult B:  -unsigned_b           (for all both input unsigned)
#         -signed_b               (for all both input signed)
#         -signed_b_a           ( input A dynamic signed)
#         -signed_b_b           ( input B dynamic signed)
#         -unsigned_b_a       ( input A unsigned)
#         -unsigned_b_b       ( input B unsigned)

#Currently, the multA (signAA and signBA) options work fine.

	if {$Para(EnMultB) == "ENABLED" || $Para(InputB) == "B_ALU" || $Para(InputB) == "DYNAMIC"} {
		lappend str -width_ba $Para(WidthBA) -width_bb $Para(WidthBB)
		switch $Para(SourceBA) {
		    "Parallel" {}
		    "Shift"    {lappend str -shiftina1}
		    "Dynamic"  {lappend str -dynamica1}
		}
		switch $Para(SourceBB) {
		    "Parallel" {}
		    "Shift"    {lappend str -shiftinb1}
		    "Dynamic"  {lappend str -dynamicb1}
		}

		switch $Para(SignBA) {
		    "Unsigned" {
				switch $Para(SignBB)  {
					"Unsigned" {lappend str -unsigned_b}
					"Signed"   {lappend str -signed_b -unsigned_b_a}
					"Dynamic"  {lappend str -signed_b_b -unsigned_b_a}
				} 
			}
		    "Signed"   {
				switch $Para(SignBB)  {
					"Unsigned" {lappend str -signed_b -unsigned_b_b}
					"Signed"   {lappend str -signed_b}
					"Dynamic"  {lappend str -signed -signed_b_b}
				} 
			}
		    "Dynamic"  {
				switch $Para(SignBB)  {
					"Unsigned" {lappend str -signed_b_a -unsigned_b_b}
					"Signed"   {lappend str -signed_b -signed_b_a}
					"Dynamic"  {lappend str -signed_b_a -signed_b_b}
				} 
			}
		}
	}
	
	if {$Para(InputA) == "A_ALU" || $Para(InputB) == "B_ALU" || $Para(InputC) == "C_ALU" || 
		$Para(InputC) == "A_ALU" || $Para(InputC) == "DYNAMIC" || 
		$Para(InputA) == "DYNAMIC" || $Para(InputB) == "DYNAMIC" ||
		($Para(InputC) != "C_ALU" && $Para(InputC) != "A_ALU" && $Para(InputA) != "A_ALU" && $Para(InputB) != "B_ALU" &&
		( $Para(MASKPAT) == "DYNAMIC" || $Para(MCPAT) == "DYNAMIC"))} {
		lappend str -widthc $Para(WidthC)
	}

	if {$Para(shiftoutb)=="ENABLED"} {lappend str -shiftouta -shiftoutb}

	set cntl_lst {EnIRAA EnIRAB EnIRBA EnIRBB EnIRC EnPRA EnPRB EnORA EnORB EnAOR EnAOPR EnAOFR}
	set para_lst {a0 b0 a1 b1 c p0 p1 o0 o1 as0 as1 o}
	#set cntl_lst {EnIRAA EnIRAB EnIRBA EnIRBB EnIRC EnPRA EnPRB EnAOR EnAOPR EnAOFR}
	#set para_lst {a0 a1 b0 b1 c p0 p1 as0 as1 o}

	foreach cntl $cntl_lst p $para_lst {
		if {$Para($cntl) == "ENABLED"}  {
			lappend str -reg$p
			lappend str -reg${p}clk $Para(${cntl}Clk)
			if {$Para(${cntl}CE) != "NONE"}  {
				lappend str -reg${p}ce $Para(${cntl}CE)
			} 
			if {$Para(${cntl}RST) != "NONE"}  {
				lappend str -reg${p}rst $Para(${cntl}RST)
			}
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

	set opt_lst {CLK0 CLK1 CLK2 CLK3 CE0 CE1 CE2 CE3 RST0 RST1 RST2 RST3}
	set tmp [split $str " "]
	foreach opt $opt_lst {
		if {[lsearch $tmp $opt] != -1}  {
			lappend str -[string tolower $opt]
		} 
	}
#	tk_messageBox -default ok -icon warning -message $str -title "Command-Line" -type ok
#	exit

	return $str
}

proc ChangeMCPATCmd {} {
	global Para
	if {$Para(MCPAT)=="DYNAMIC"} {
		set Para(MASKPAT) STATIC
	}
}

proc ChangeMASKPATCmd {} {
	global Para
	if {$Para(MASKPAT)=="DYNAMIC"} {
		set Para(MCPAT) STATIC
	}
}

proc ChangeCKCmd {}  {
	global Para

	set cntl_lst {EnIRAA EnIRAB EnIRBA EnIRBB EnIRC EnPRA EnPRB EnORA EnORB EnAOR EnAOPR EnAOFR}
	
	foreach p $cntl_lst {
		if {$Para($p) == "DISABLED"}  {
			.cb${p}Clk config -state disabled
			.cb${p}CE  config -state disabled
			.cb${p}RST config -state disabled
			set Para(${p}Clk) CLK0
			set Para(${p}CE)  CE0
			set Para(${p}RST) RST0
		} else  {
			.cb${p}Clk config -state normal
			.cb${p}CE  config -state normal
			.cb${p}RST config -state normal
		} 
	}
} 

proc ChangeMcpatCmd {} {
	global Para
	if {$Para(MCPAT) == "DYNAMIC"} {set Para(MASKPAT) STATIC}
}

proc ChangeMaskpatCmd {} {
	global Para
	if {$Para(MASKPAT) == "DYNAMIC"} {set Para(MCPAT) STATIC}
}

	# === For ECP3 ===
proc ChangeECP3Cmd {} {
	global Para
	
	#14
	if {$Para(EnInReg)=="DISABLED"} {
		set Para(EnIRAA) DISABLED
		set Para(EnIRAB) DISABLED
		set Para(EnIRBA) DISABLED
		set Para(EnIRBB) DISABLED
		set Para(EnIRC) DISABLED
		set Para(EnAOR) DISABLED

		.ckEnIRAA config -state disabled
		.ckEnIRAB config -state disabled
		.ckEnIRBA config -state disabled
		.ckEnIRBB config -state disabled
		.ckEnIRC config -state disabled
		.ckEnAOR config -state disabled
	} else  {
		set Para(EnIRAA) ENABLED
		set Para(EnIRAB) ENABLED
		set Para(EnIRBA) ENABLED
		set Para(EnIRBB) ENABLED
		set Para(EnIRC) ENABLED
		set Para(EnAOR) ENABLED

		.ckEnIRAA config -state normal
		.ckEnIRAB config -state normal
		.ckEnIRBA config -state normal
		.ckEnIRBB config -state normal
		.ckEnIRC config -state normal
		.ckEnAOR config -state normal
	} 
	#15
	if {$Para(EnPipeReg)=="DISABLED"} {
		set Para(EnPRA) DISABLED
		set Para(EnPRB) DISABLED
		set Para(EnAOPR) DISABLED

		.ckEnPRA config -state disabled
		.ckEnPRB config -state disabled
		.ckEnAOPR config -state disabled
	} else  {
		set Para(EnPRA) ENABLED
		set Para(EnPRB) ENABLED
		set Para(EnAOPR) ENABLED

		.ckEnPRA config -state normal
		.ckEnPRB config -state normal
		.ckEnAOPR config -state normal
	} 
	#16
	if {$Para(EnOutReg)=="DISABLED"} {
		set Para(EnORA) DISABLED
		set Para(EnORB) DISABLED
		set Para(EnAOFR) DISABLED
		.ckEnORA config -state disabled
		.ckEnORB config -state disabled
		.ckEnAOFR config -state disabled
	} else  {
		set Para(EnORA) ENABLED
		set Para(EnORB) ENABLED
		set Para(EnAOFR) ENABLED
		.ckEnORA config -state normal
		.ckEnORB config -state normal
		.ckEnAOFR config -state normal
	} 

	#2
	if {$Para(EnMultB) == "DISABLED"} {
		.ckEnMatchReg config -state disabled
		.ckshiftoutb  config -state disabled
		set Para(EnMatchReg) DISABLED
		set Para(shiftoutb) DISABLED
		
		set Para(EnIRBA) DISABLED
		set Para(EnIRBB) DISABLED
		set Para(EnPRB) DISABLED
		set Para(EnORB) DISABLED
		.ckEnIRBA config -state disabled
		.ckEnIRBB config -state disabled
		.ckEnPRB config -state disabled
		.ckEnORB config -state disabled

		.cboWidthBA  config -state disabled
		.cboSourceBA config -state disabled
		.cboSignBA   config -state disabled
		.cboWidthBB  config -state disabled
		.cboSourceBB config -state disabled
		.cboSignBB   config -state disabled
	} else {
		.ckEnMatchReg config -state normal
		.ckshiftoutb  config -state normal
		
		#set Para(EnIRBA) ENABLED
		#set Para(EnIRBB) ENABLED
		#set Para(EnPRB) ENABLED
		#set Para(EnORB) ENABLED
		.ckEnIRBA config -state normal
		.ckEnIRBB config -state normal
		.ckEnPRB config -state normal
		.ckEnORB config -state normal

	}
	        
	#3
	if {$Para(EnALU) == "DISABLED"} {
		.cboOperation config -state disabled
		.cboInputA config -state disabled
		.cboInputB config -state disabled
		.cboInputC config -state disabled
		.cboMCPAT config -state disabled
		.cboMASKPAT config -state disabled
		.entryxMCPAT config -state disabled
		.entryxMASKPAT config -state disabled
		.entryxMASK01 config -state disabled
		.entryxRNDPAT config -state disabled
		
		.lblInputA config -state disabled
		.lblInputB config -state disabled
		.lblInputC config -state disabled
		.lblxMCPAT config -state disabled
		.lblxMASKPAT config -state disabled
		.lblxMASK01 config -state disabled
		.lblxRNDPAT config -state disabled
		.lbl2xMCPAT config -state disabled
		.lbl2xMASKPAT config -state disabled
		.lbl2xMASK01 config -state disabled
		.lbl2xRNDPAT config -state disabled
		
		set Para(EnAOR) DISABLED
		set Para(EnAOPR) DISABLED
		set Para(EnAOFR) DISABLED
		.ckEnAOR config -state disabled
		.ckEnAOPR config -state disabled
		.ckEnAOFR config -state disabled
	} else {
		.cboOperation config -state normal
		.cboInputA config -state normal
		.cboInputB config -state normal
		.cboInputC config -state normal
		.cboMCPAT config -state normal
		.cboMASKPAT config -state normal
		.entryxMCPAT config -state normal
		.entryxMASKPAT config -state normal
		.entryxMASK01 config -state normal
		.entryxRNDPAT config -state normal

		.lblInputA config -state normal
		.lblInputB config -state normal
		.lblInputC config -state normal
		.lblxMCPAT config -state normal
		.lblxMASKPAT config -state normal
		.lblxMASK01 config -state normal
		.lblxRNDPAT config -state normal
		.lbl2xMCPAT config -state normal
		.lbl2xMASKPAT config -state normal
		.lbl2xMASK01 config -state normal
		.lbl2xRNDPAT config -state normal

		.ckEnAOR config -state normal
		.ckEnAOPR config -state normal
		.ckEnAOFR config -state normal
	}
	
	set a 0
	set b 0
	#4.a
	if {$Para(Operation) == "A + B + C" || $Para(Operation) == "A - B + C" || 
		$Para(Operation) == "A + B - C" || $Para(Operation) == "A - B - C" ||
		$Para(Operation) == "DYNAMIC"} {
		if {$Para(InputA) == "0" && $Para(InputB) == "0" && $Para(InputC) == "0"} {
			set msg "Not support the configuration: Input A = 0, Input B = 0 and Input C = 0 when Operation is $Para(Operation)."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set a 1
		}
		if {$Para(InputA) == "0" && $Para(InputB) == "0" && $Para(InputC) == "ALU Feedback"} {
			set msg "Not support the configuration: Input A = 0, Input B = 0 and Input C = ALU Feedback when Operation is $Para(Operation)."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set a 1
		}
		if {$Para(InputA) == "ALU Feedback" && $Para(InputB) == "0" && $Para(InputC) == "0"} {
			set msg "Not support the configuration: Input A = ALU Feedback, Input B = 0 and Input C = 0 when Operation is $Para(Operation)."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set a 1
		}
		if {$Para(InputA) == "ALU Feedback" && $Para(InputB) == "0" && $Para(InputC) == "ALU Feedback"} {
			set msg "Not support the configuration: Input A = ALU Feedback, Input B = 0 and Input C = ALU Feedback when Operation is $Para(Operation)."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set a 1
		}
	}
	if {$Para(Operation) == "B XNOR C" || $Para(Operation) == "B XOR C" || $Para(Operation) == "B NAND C" || 
		$Para(Operation) == "B AND C" || $Para(Operation) == "B OR C" || $Para(Operation) == "B NOR C"} {
		if {$Para(InputB) == "0" && $Para(InputC) == "0"} {
			set msg "Not support the configuration: Input B = 0 and Input C = 0 when Operation is $Para(Operation)."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set b 1
		}
		if {$Para(InputB) == "0" && $Para(InputC) == "ALU Feedback"} {
			set msg "Not support the configuration: Input B = 0 and Input C = ALU Feedback when Operation is $Para(Operation)."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set b 1
		}
	}

	#4.b
	if {$Para(EnMultA) == "ENABLED"} {
		.cboOperation clear list
		.cboOperation insert list end "A + B + C" "A - B + C" "A + B - C" "A - B - C" DYNAMIC
		if {[lsearch {"A + B + C" "A - B + C" "A + B - C" "A - B - C" DYNAMIC} $Para(Operation)] == -1} {
			set Para(Operation) "A + B + C"
		}
		#5.b
		.cboInputA clear list
		.cboInputA insert list end MultA DYNAMIC
		if {[lsearch {MultA DYNAMIC} $Para(InputA)] == -1} {
			set Para(InputA) MultA
		}

		#set Para(EnIRAA) ENABLED
		#set Para(EnIRAB) ENABLED
		#set Para(EnPRA) ENABLED
		#set Para(EnORA) ENABLED
		.ckEnIRAA config -state normal
		.ckEnIRAB config -state normal
		.ckEnPRA config -state normal
		.ckEnORA config -state normal
	} else {
		.cboOperation clear list
		.cboOperation insert list end "A + B + C" "A - B + C" "A + B - C" "A - B - C" "B XNOR C" "B XOR C" "B NAND C" "B AND C" "B OR C" "B NOR C" DYNAMIC

		.cboInputA clear list
		.cboInputA insert list end "ALU Feedback" A_ALU 0 DYNAMIC
		if {[lsearch {"ALU Feedback" A_ALU 0 DYNAMIC} $Para(InputA)] == -1} {
			set Para(InputA) "ALU Feedback"
		}

		set Para(EnIRAA) DISABLED
		set Para(EnIRAB) DISABLED
		set Para(EnPRA) DISABLED
		set Para(EnORA) DISABLED
		.ckEnIRAA config -state disabled
		.ckEnIRAB config -state disabled
		.ckEnPRA config -state disabled
		.ckEnORA config -state disabled

		.cboWidthAA  config -state disabled
		.cboSourceAA config -state disabled
		.cboSignAA   config -state disabled
		.cboWidthAB  config -state disabled
		.cboSourceAB config -state disabled
		.cboSignAB   config -state disabled
	}
	
	#4.c
	if {[lsearch {"B XNOR C" "B XOR C" "B NAND C" "B AND C" "B OR C" "B NOR C"} $Para(Operation)] != -1} {
		set Para(InputA) 0
		.cboInputA config -state disabled
	} else {
		if {$Para(EnALU) != "DISABLED"} {.cboInputA config -state normal}
	}
	
	#6.b
	if {$Para(EnMultB) == "ENABLED"} {
		.cboInputB clear list
		.cboInputB insert list end "MultB Shift 18 L" MultB DYNAMIC
		if {[lsearch {"MultB Shift 18 L" MultB DYNAMIC} $Para(InputB)] == -1} {
			set Para(InputB) MultB
		}
	} else {
		.cboInputB clear list
		.cboInputB insert list end B_ALU 0 DYNAMIC
		if {[lsearch {B_ALU 0 DYNAMIC} $Para(InputB)] == -1} {
			set Para(InputB) B_ALU
		}
	}
	
	#8
	#if {$Para(EnALU) == "ENABLED"} 
	if {$Para(InputC) == "C_ALU" || $Para(InputC) == "A_ALU" || $Para(InputA) == "A_ALU" ||
		$Para(InputB) == "B_ALU"} {
		.cboMCPAT config -state disabled
		.cboMASKPAT config -state disabled
	} else {
		.cboMCPAT config -state normal
		.cboMASKPAT config -state normal
		if {$Para(MCPAT) == "DYNAMIC"} {
			.entryxMCPAT config -state disabled
		} else {
			.entryxMCPAT config -state normal
		}
		if {$Para(MASKPAT) == "DYNAMIC"} {
			.entryxMASKPAT config -state disabled
		} else {
			.entryxMASKPAT config -state normal
		}
	}
	
	#9,10
	if {$Para(EnMultA) == "ENABLED" || $Para(InputA) == "A_ALU" || $Para(InputC) == "A_ALU" || $Para(InputA) == "DYNAMIC" } {
		.cboWidthAA  config -state normal
		.cboSourceAA config -state normal
		.cboSignAA   config -state normal
		.cboWidthAB  config -state normal
		.cboSourceAB config -state normal
		.cboSignAB   config -state normal

		.ckEnIRAA config -state normal
		.ckEnIRAB config -state normal
		set Para(EnIRAA) ENABLED
		set Para(EnIRAB) ENABLED
	}
	
	if {$Para(EnALU) == "DISABLED" && $Para(EnMultA) == "DISABLED"} {
		.cboWidthAA  config -state disabled
		.cboSourceAA config -state disabled
		.cboSignAA   config -state disabled
		.cboWidthAB  config -state disabled
		.cboSourceAB config -state disabled
		.cboSignAB   config -state disabled
	}

	#11,12
	if {$Para(EnMultB) == "ENABLED" || $Para(InputB) == "B_ALU" || $Para(InputB) == "DYNAMIC"} {
		.cboWidthBA  config -state normal
		.cboSourceBA config -state normal
		.cboSignBA   config -state normal
		.cboWidthBB  config -state normal
		.cboSourceBB config -state normal
		.cboSignBB   config -state normal

		.ckEnIRBB config -state normal
		.ckEnIRBA config -state normal
		set Para(EnIRBA) ENABLED
		set Para(EnIRBB) ENABLED
	}

	if {$Para(EnALU) == "DISABLED" && $Para(EnMultB) == "DISABLED"} {
		.cboWidthBA  config -state disabled
		.cboSourceBA config -state disabled
		.cboSignBA   config -state disabled
		.cboWidthBB  config -state disabled
		.cboSourceBB config -state disabled
		.cboSignBB   config -state disabled
	}
	
	#11.b If (AA is enabled and BA is enabled) and ¡°BA Source = Shift¡±: Gray out ¡°BA Sign¡± field and ¡°BA Sign = AA Sign¡±.
	if {[.cboWidthAA cget -state] == "normal" && [.cboWidthBA cget -state] == "normal" && $Para(SourceBA) == "Shift"} {
		.cboSignBA config -state disabled
		set Para(SignBA) $Para(SignAA)
	}
	
	#12.b If (AB is enabled and BB is enabled) and ¡°BB Source = Shift¡±: Gray out ¡°BB Sign¡± field and ¡°BB Sign = AB Sign¡±.
	if {[.cboWidthAB cget -state] == "normal" && [.cboWidthBB cget -state] == "normal" && $Para(SourceBB) == "Shift"} {
		.cboSignBB config -state disabled
		set Para(SignBB) $Para(SignAB)
	}

	#13
	if {$Para(InputA) == "A_ALU" || $Para(InputB) == "B_ALU" || $Para(InputC) == "C_ALU" || 
		$Para(InputC) == "A_ALU" || $Para(InputC) == "DYNAMIC" || 
		$Para(InputA) == "DYNAMIC" || $Para(InputB) == "DYNAMIC" ||
		($Para(InputC) != "C_ALU" && $Para(InputC) != "A_ALU" && $Para(InputA) != "A_ALU" && $Para(InputB) != "B_ALU" &&
		( $Para(MASKPAT) == "DYNAMIC" || $Para(MCPAT) == "DYNAMIC"))} {
		.cboWidthC  config -state normal
		.ckEnIRC config -state normal
	} else {
		.cboWidthC  config -state disabled
		set Para(EnIRC) DISABLED
		.ckEnIRC config -state disabled
	}
	
	#Tab "Register Setup"
	#9. 
	if {$Para(EnMultA) == "ENABLED" && $Para(EnALU) == "DISABLED" && $Para(EnOutReg) == "ENABLED"} {
		#set Para(EnORA) ENABLED
		.ckEnORA config -state normal
	} else {
		set Para(EnORA) DISABLED
		.ckEnORA config -state disabled
	}
	#10. 
	if {$Para(EnMultB) == "ENABLED" && $Para(EnALU) == "DISABLED" && $Para(EnOutReg) == "ENABLED"} {
		.ckEnORB config -state normal
	} else {
		set Para(EnORB) DISABLED
		.ckEnORB config -state disabled
	}
	
	set c 0
	#17.d
	if {$Para(EnMultA) == "DISABLED" && $Para(EnMultB) == "DISABLED" && $Para(EnALU) == "DISABLED"} {
		set c 1
	}
	
	if {$a == 1 || $b == 1 || $c == 1} {
		$Para(generate_cfg) configure -state disabled
	} else {
		$Para(generate_cfg) configure -state normal
	}
	
	#18
	if {$Para(InputC) == "RNDtoPN" || $Para(InputC) == "RNDtoPNM1" || $Para(InputC) == "DYNAMIC"} {
		.lblnRNDPAT config -state normal
		.entrynRNDPAT config -state normal
		.lbl2nRNDPAT config -state normal
	} else {
		.lblnRNDPAT config -state disabled
		.entrynRNDPAT config -state disabled
		.lbl2nRNDPAT config -state disabled
	}

	set cntl_lst {AA AB BA BB C}
	foreach p $cntl_lst {
		set s [.cboWidth$p cget -state]
		if {$Para(EnInReg) == "ENABLED"} {
			if {$s == "normal"} {
				set Para(EnIR$p) ENABLED
			} else {
				set Para(EnIR$p) DISABLED
				#.ckEnIR$p config -state disabled
			}
		} else {
			set Para(EnIR$p) DISABLED
		}
	}

	ChangeCKCmd
}

proc ChangeValueCmd {} {
	global Para

	ChangeECP3Cmd

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

proc FillZero {len para}  {

	set paralen [string length $para]
	if {$paralen >= $len}  {
		return $para
	} 

	set rest [expr $len-$paralen]
	set retval $para
	while {$rest != 0}  {
		set retval 0$retval
		incr rest -1
	} 
	return $retval
} 

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para

	set Para(xMCPAT) [FillZero 14 $Para(xMCPAT)]
	set ret [IsInRange "MCPAT" 0 3fffffffffffff $Para(xMCPAT)]
	if {$ret == "-1"} {return -1}

	set Para(xMASKPAT) [FillZero 14 $Para(xMASKPAT)]
	set ret [IsInRange "MASKPAT" 0 3fffffffffffff $Para(xMASKPAT)]
	if {$ret == "-1"} {return -1}

	set Para(xMASK01) [FillZero 14 $Para(xMASK01)]
	set ret [IsInRange "MASK01" 0 3fffffffffffff $Para(xMASK01)]
	if {$ret == "-1"} {return -1}

	set Para(xRNDPAT) [FillZero 14 $Para(xRNDPAT)]
	set ret [IsInRange "RNDPAT" 0 3fffffffffffff $Para(xRNDPAT)]
	if {$ret == "-1"} {return -1}
	
	set ret [IsInRange "n for RNDPAT" 1 53 $Para(nRNDPAT)]
	if {$ret == "-1"} {return -1}

	return 0
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
		windows {AttributeSetting 600 600}
		unix    {AttributeSetting 650 710}
	}
	set pin_flag 1
	DrawImage 260 450
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***

	#Configuration tab
	set page1 [$tnb add -label "Configuration"]
	iwidgets::labeledframe .frmMultSel -labeltext "Mult and ALU Selection" -labelpos nw
	set frmMultSel [.frmMultSel childsite]
	
	frame .frmTop0
	
	frame .frmSel0
	frame .frmSel00
	checkbutton .ckEnMultA -text "Enable MultA" -variable Para(EnMultA) -onvalue ENABLED -offvalue DISABLED -command ChangeValueCmd 
	checkbutton .ckEnMultB -text "Enable MultB" -variable Para(EnMultB) -onvalue ENABLED -offvalue DISABLED -command ChangeValueCmd
	checkbutton .ckEnMatchReg -text "Cascade Match Register" -variable Para(EnMatchReg) -onvalue ENABLED -offvalue DISABLED -command ChangeValueCmd
	checkbutton .ckshiftoutb -text "Select Shift Out B" -variable Para(shiftoutb) -onvalue ENABLED -offvalue DISABLED -command ChangeValueCmd
	pack .ckEnMultB -in .frmSel00 -side top -anchor w -padx 4
	pack .ckEnMatchReg .ckshiftoutb -in .frmSel00 -side top -anchor w -padx 10
	pack .ckEnMultA .frmSel00 -in .frmSel0 -side left -padx 4 -anchor n
	
	iwidgets::labeledframe .frmOption
	set frmOption [.frmOption childsite]
	#CreateRadioItem $frmOption cbgsr "GSR" 13 Enabled ENABLED Disabled DISABLED 10 left Para(gsr) {ChangeValueCmd}
	CreateRadioItem $frmOption cbreset "Reset Mode" 13 SYNC SYNC ASYNC ASYNC 10 left Para(reset) {ChangeValueCmd}
	#.lblcbgsr       config -anchor w
	.lblcbreset     config -anchor w

	pack .frmSel0 .frmOption -in .frmTop0 -side left
	pack .frmTop0 -in $frmMultSel -side top -fill x

	checkbutton .ckEnALU   -text "Enable ALU"   -variable Para(EnALU) -onvalue ENABLED -offvalue DISABLED   -command ChangeValueCmd 
	pack .ckEnALU -in $frmMultSel -side top -anchor w -padx 4
	
	iwidgets::combobox .cboOperation -labeltext "Operation" -width 16 -editable false -textvariable Para(Operation) -selectioncommand {ChangeValueCmd}
	.cboOperation insert list end "A + B + C" "A - B + C" "A + B - C" "A - B - C" "B XNOR C" "B XOR C" "B NAND C" "B AND C" "B OR C" "B NOR C" DYNAMIC
	.cboOperation.label config -width 8 -anchor w
	pack .cboOperation -in $frmMultSel -side top -anchor w -padx 8 -pady 2
	
	frame .frmIn
	label .lblInputA -text "Input A\n(A Mux)" -width 7 -anchor w
	label .lblInputB -text "Input B\n(B Mux)"
	label .lblInputC -text "Input C\n(C Mux)"
	iwidgets::combobox .cboInputA -width 14 -editable false -textvariable Para(InputA) -selectioncommand {ChangeValueCmd}
	.cboInputA insert list end "ALU Feedback" MultA A_ALU 0 DYNAMIC
	iwidgets::combobox .cboInputB -width 14 -editable false -textvariable Para(InputB) -selectioncommand {ChangeValueCmd}
	.cboInputB insert list end "MultB Shift 18 L" MultB B_ALU 0 DYNAMIC
	iwidgets::combobox .cboInputC -width 14 -editable false -textvariable Para(InputC) -selectioncommand {ChangeValueCmd}
	.cboInputC insert list end 0 "CIN Shift 18 R" CIN C_ALU A_ALU "ALU Feedback" RNDtoPN RNDtoPNM1 DYNAMIC
	pack .lblInputA .cboInputA .lblInputB .cboInputB .lblInputC .cboInputC -in .frmIn -side left -padx 4
	pack .frmIn -in $frmMultSel -side top -anchor w -padx 4
	
	frame .frmbottom
	frame .frmleft
	iwidgets::combobox .cboMCPAT -labeltext "MCPAT_SOURCE" -width 13 -editable false -textvariable Para(MCPAT) -selectioncommand {ChangeMcpatCmd;ChangeValueCmd}
	.cboMCPAT insert list end STATIC DYNAMIC
	iwidgets::combobox .cboMASKPAT -labeltext "MASKPAT_SOURCE" -width 13 -editable false -textvariable Para(MASKPAT) -selectioncommand {ChangeMaskpatCmd;ChangeValueCmd}
	.cboMASKPAT insert list end STATIC DYNAMIC
	.cboMCPAT.label config -width 18 -anchor w
	.cboMASKPAT.label config -width 18 -anchor w
	pack .cboMCPAT .cboMASKPAT -in .frmleft -side top -anchor w -padx 4 -pady 8
	
	frame .frmright
	CreateLabelEntryLabel .frmright xMCPAT "MCPAT" 16 "0x00000000000000\n- 0x3fffffffffffff" "0x" Para(xMCPAT) {}
	CreateLabelEntryLabel .frmright xMASKPAT "MASKPAT" 16 "0x00000000000000\n- 0x3fffffffffffff" "0x" Para(xMASKPAT) {}
	CreateLabelEntryLabel .frmright xMASK01 "MASK01" 16 "0x00000000000000\n- 0x3fffffffffffff" "0x" Para(xMASK01) {}
	CreateLabelEntryLabel .frmright xRNDPAT "RNDPAT" 16 "0x00000000000000\n- 0x3fffffffffffff" "0x" Para(xRNDPAT) {}
	CreateLabelEntryLabel .frmright nRNDPAT "n for RNDPAT" 4 "1 - 53" "" Para(nRNDPAT) {}
	.entryxMASK01 config -validate hexidecimal
	.entryxMASKPAT config -validate hexidecimal
	.entryxMCPAT config -validate hexidecimal
	.entryxRNDPAT config -validate hexidecimal
	.lblxMCPAT   config -width 10 -anchor w
	.lblxMASKPAT config -width 10 -anchor w
	.lblxMASK01  config -width 10 -anchor w
	.lblxRNDPAT  config -width 10 -anchor w
	.lblnRNDPAT  config -width 16 -anchor w
	
	pack .frmleft .frmright -in .frmbottom -side left -anchor n
	pack .frmbottom -in $frmMultSel -side top -anchor w
	
	#
	iwidgets::labeledframe .frmInputSel -labeltext "Input Selection" -labelpos nw
	set frmInputSel [.frmInputSel childsite]
	
	frame .frmAA
	label .lblAA -text "AA:  "
	iwidgets::combobox .cboWidthAA -labeltext "Width" -width 6 -editable false -textvariable Para(WidthAA) -selectioncommand {ChangeValueCmd}
	.cboWidthAA insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
	iwidgets::combobox .cboSourceAA -labeltext "Source" -width 10 -editable false -textvariable Para(SourceAA) -selectioncommand {ChangeValueCmd}
	.cboSourceAA insert list end Parallel Shift Dynamic
	iwidgets::combobox .cboSignAA -labeltext "Sign" -width 10 -editable false -textvariable Para(SignAA) -selectioncommand {ChangeValueCmd}
	.cboSignAA insert list end Signed Unsigned Dynamic
	pack .lblAA .cboWidthAA .cboSourceAA .cboSignAA -in .frmAA -side left -padx 8

	frame .frmAB
	label .lblAB -text "AB:  "
	iwidgets::combobox .cboWidthAB -labeltext "Width" -width 6 -editable false -textvariable Para(WidthAB) -selectioncommand {ChangeValueCmd}
	.cboWidthAB insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
	iwidgets::combobox .cboSourceAB -labeltext "Source" -width 10 -editable false -textvariable Para(SourceAB) -selectioncommand {ChangeValueCmd}
	.cboSourceAB insert list end Parallel Shift Dynamic
	iwidgets::combobox .cboSignAB -labeltext "Sign" -width 10 -editable false -textvariable Para(SignAB) -selectioncommand {ChangeValueCmd}
	.cboSignAB insert list end Signed Unsigned Dynamic
	pack .lblAB .cboWidthAB .cboSourceAB .cboSignAB -in .frmAB -side left -padx 8
	
	frame .frmBA
	label .lblBA -text "BA:  "
	iwidgets::combobox .cboWidthBA -labeltext "Width" -width 6 -editable false -textvariable Para(WidthBA) -selectioncommand {ChangeValueCmd}
	.cboWidthBA insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
	iwidgets::combobox .cboSourceBA -labeltext "Source" -width 10 -editable false -textvariable Para(SourceBA) -selectioncommand {ChangeValueCmd}
	.cboSourceBA insert list end Parallel Shift Dynamic
	iwidgets::combobox .cboSignBA -labeltext "Sign" -width 10 -editable false -textvariable Para(SignBA) -selectioncommand {ChangeValueCmd}
	.cboSignBA insert list end Signed Unsigned Dynamic
	pack .lblBA .cboWidthBA .cboSourceBA .cboSignBA -in .frmBA -side left -padx 8

	frame .frmBB
	label .lblBB -text "BB:  "
	iwidgets::combobox .cboWidthBB -labeltext "Width" -width 6 -editable false -textvariable Para(WidthBB) -selectioncommand {ChangeValueCmd}
	.cboWidthBB insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
	iwidgets::combobox .cboSourceBB -labeltext "Source" -width 10 -editable false -textvariable Para(SourceBB) -selectioncommand {ChangeValueCmd}
	.cboSourceBB insert list end Parallel Shift Dynamic
	iwidgets::combobox .cboSignBB -labeltext "Sign" -width 10 -editable false -textvariable Para(SignBB) -selectioncommand {ChangeValueCmd}
	.cboSignBB insert list end Signed Unsigned Dynamic
	pack .lblBB .cboWidthBB .cboSourceBB .cboSignBB -in .frmBB -side left -padx 8
	
	frame .frmC
	label .lblC -text "C:   "
	iwidgets::combobox .cboWidthC -labeltext "Width" -width 6 -editable false -textvariable Para(WidthC) -selectioncommand {ChangeValueCmd}
	for {set i 1} {$i<55} {incr i} {
		.cboWidthC insert list end $i
	}
	iwidgets::labeledframe .frmRegister
	set frmReg [.frmRegister childsite]
	checkbutton .ckEnInReg -text "Enable\nInput\nRegisters" -justify left -variable Para(EnInReg) -onvalue ENABLED -offvalue DISABLED -command ChangeValueCmd 
	checkbutton .ckEnPipeReg -text "Enable\nPipeline\nRegisters" -justify left -variable Para(EnPipeReg) -onvalue ENABLED -offvalue DISABLED -command ChangeValueCmd 
	checkbutton .ckEnOutReg -text "Enable\nOutput\nRegisters" -justify left -variable Para(EnOutReg) -onvalue ENABLED -offvalue DISABLED -command ChangeValueCmd 
	pack .ckEnInReg .ckEnPipeReg .ckEnOutReg -in $frmReg -side left -padx 4
	pack .lblC .cboWidthC .frmRegister -in .frmC -side left -padx 8
	
	pack .frmAA .frmAB .frmBA .frmBB .frmC -in $frmInputSel -side top -pady 2

	pack .frmMultSel .frmInputSel -in $page1 -side top -fill x
	
	#Register Setup tab
	set page2 [$tnb add -label "Register Setup"]

	iwidgets::labeledframe .advanceoption -labeltext "Select Pipelining" -labelpos nw 
	set advanceoption [.advanceoption childsite]

	label .lblClock   -text "Clock"
	label .lblClockEn -text "CE"
	label .lblReset   -text "Reset"

	# Enable Input Register AA
	checkbutton .ckEnIRAA -text "Enable Input Register AA" -variable Para(EnIRAA) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnIRAAClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRAAClk)  -selectioncommand {ChangeValueCmd}
	.cbEnIRAAClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnIRAACE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRAACE)  -selectioncommand {ChangeValueCmd}
	.cbEnIRAACE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnIRAARST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRAARST)  -selectioncommand {ChangeValueCmd}
	.cbEnIRAARST insert list end "RST0" "RST1"
	# Enable Input Register AB
	checkbutton .ckEnIRAB -text "Enable Input Register AB" -variable Para(EnIRAB) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}
	iwidgets::combobox .cbEnIRABClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRABClk)  -selectioncommand {ChangeValueCmd}
	.cbEnIRABClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnIRABCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRABCE)  -selectioncommand {ChangeValueCmd}
	.cbEnIRABCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnIRABRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRABRST)  -selectioncommand {ChangeValueCmd}
	.cbEnIRABRST insert list end "RST0" "RST1"
	# Enable Input Register BA
	checkbutton .ckEnIRBA  -text "Enable Input Register BA" -variable Para(EnIRBA) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnIRBAClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBAClk)  -selectioncommand {ChangeValueCmd}
	.cbEnIRBAClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnIRBACE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBACE)  -selectioncommand {ChangeValueCmd}
	.cbEnIRBACE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnIRBARST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBARST)  -selectioncommand {ChangeValueCmd}
	.cbEnIRBARST insert list end "RST0" "RST1"
	# Enable Input Register BB
	checkbutton .ckEnIRBB  -text "Enable Input Register BB" -variable Para(EnIRBB) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnIRBBClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBBClk)  -selectioncommand {ChangeValueCmd}
	.cbEnIRBBClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnIRBBCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBBCE)  -selectioncommand {ChangeValueCmd}
	.cbEnIRBBCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnIRBBRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRBBRST)  -selectioncommand {ChangeValueCmd}
	.cbEnIRBBRST insert list end "RST0" "RST1"
	# Enable Input Register C
	checkbutton .ckEnIRC  -text "Enable Input Register C" -variable Para(EnIRC) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnIRCClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRCClk)  -selectioncommand {ChangeValueCmd}
	.cbEnIRCClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnIRCCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRCCE)  -selectioncommand {ChangeValueCmd}
	.cbEnIRCCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnIRCRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnIRCRST)  -selectioncommand {ChangeValueCmd}
	.cbEnIRCRST insert list end "RST0" "RST1"

	# Enable MultA Pipeline Register
	checkbutton .ckEnPRA  -text "Enable MultA Pipeline Register" -variable Para(EnPRA) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnPRAClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRAClk)  -selectioncommand {ChangeValueCmd}
	.cbEnPRAClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnPRACE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRACE)  -selectioncommand {ChangeValueCmd}
	.cbEnPRACE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnPRARST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRARST)  -selectioncommand {ChangeValueCmd}
	.cbEnPRARST insert list end "RST0" "RST1"
	# Enable MultB Pipeline Register
	checkbutton .ckEnPRB  -text "Enable MultB Pipeline Register" -variable Para(EnPRB) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnPRBClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRBClk)  -selectioncommand {ChangeValueCmd}
	.cbEnPRBClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnPRBCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRBCE)  -selectioncommand {ChangeValueCmd}
	.cbEnPRBCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnPRBRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnPRBRST)  -selectioncommand {ChangeValueCmd}
	.cbEnPRBRST insert list end "RST0" "RST1"

	# Enable MultA Output Register
	checkbutton .ckEnORA  -text "Enable MultA Output Register" -variable Para(EnORA) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnORAClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORAClk)  -selectioncommand {ChangeValueCmd}
	.cbEnORAClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnORACE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORACE)  -selectioncommand {ChangeValueCmd}
	.cbEnORACE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnORARST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORARST)  -selectioncommand {ChangeValueCmd}
	.cbEnORARST insert list end "RST0" "RST1"
	# Enable MultB Output Register
	checkbutton .ckEnORB  -text "Enable MultB Output Register" -variable Para(EnORB) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnORBClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORBClk)  -selectioncommand {ChangeValueCmd}
	.cbEnORBClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnORBCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORBCE)  -selectioncommand {ChangeValueCmd}
	.cbEnORBCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnORBRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnORBRST)  -selectioncommand {ChangeValueCmd}
	.cbEnORBRST insert list end "RST0" "RST1"

	# Enable ALU Opcode Register
	checkbutton .ckEnAOR  -text "Enable ALU Opcode Register" -variable Para(EnAOR) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnAORClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAORClk)  -selectioncommand {ChangeValueCmd}
	.cbEnAORClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnAORCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAORCE)  -selectioncommand {ChangeValueCmd}
	.cbEnAORCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnAORRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAORRST)  -selectioncommand {ChangeValueCmd}
	.cbEnAORRST insert list end "RST0" "RST1"

	# Enable ALU Opcode Pipeline Register
	checkbutton .ckEnAOPR  -text "Enable ALU Opcode Pipeline Register" -variable Para(EnAOPR) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnAOPRClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAOPRClk)  -selectioncommand {ChangeValueCmd}
	.cbEnAOPRClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnAOPRCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAOPRCE)  -selectioncommand {ChangeValueCmd}
	.cbEnAOPRCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnAOPRRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAOPRRST)  -selectioncommand {ChangeValueCmd}
	.cbEnAOPRRST insert list end "RST0" "RST1"

	# Enable ALU Output and Flag Register
	checkbutton .ckEnAOFR  -text "Enable ALU Output and Flag Register" -variable Para(EnAOFR) -onvalue ENABLED -offvalue DISABLED -command {ChangeCKCmd;CallDrawPins}  
	iwidgets::combobox .cbEnAOFRClk -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAOFRClk)  -selectioncommand {ChangeValueCmd}
	.cbEnAOFRClk insert list end "CLK0" "CLK1"
	iwidgets::combobox .cbEnAOFRCE -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAOFRCE)  -selectioncommand {ChangeValueCmd}
	.cbEnAOFRCE insert list end "CE0" "CE1" "CE2" "CE3"
	iwidgets::combobox .cbEnAOFRRST -width 6 -editable false \
		-listheight 90  -textvariable Para(EnAOFRRST)  -selectioncommand {ChangeValueCmd}
	.cbEnAOFRRST insert list end "RST0" "RST1"

	grid  x .lblClock .lblClockEn .lblReset  -in $advanceoption -sticky w -padx 2
	grid .ckEnIRAA .cbEnIRAAClk .cbEnIRAACE .cbEnIRAARST -in $advanceoption -sticky w -padx 2 -pady 2
	grid .ckEnIRAB .cbEnIRABClk .cbEnIRABCE .cbEnIRABRST -in $advanceoption -sticky w -padx 2 -pady 2
	grid .ckEnIRBA .cbEnIRBAClk .cbEnIRBACE .cbEnIRBARST -in $advanceoption -sticky w -padx 2 -pady 2
	grid .ckEnIRBB .cbEnIRBBClk .cbEnIRBBCE .cbEnIRBBRST -in $advanceoption -sticky w -padx 2 -pady 2
	grid .ckEnIRC .cbEnIRCClk .cbEnIRCCE .cbEnIRCRST -in $advanceoption -sticky w -padx 2 -pady 2

	grid .ckEnPRA .cbEnPRAClk .cbEnPRACE .cbEnPRARST -in $advanceoption -sticky w -padx 2 -pady 2
	grid .ckEnPRB .cbEnPRBClk .cbEnPRBCE .cbEnPRBRST -in $advanceoption -sticky w -padx 2 -pady 2
	grid .ckEnORA .cbEnORAClk .cbEnORACE .cbEnORARST -in $advanceoption -sticky w -padx 2 -pady 2
	grid .ckEnORB .cbEnORBClk .cbEnORBCE .cbEnORBRST -in $advanceoption -sticky w -padx 2 -pady 2
	grid .ckEnAOR .cbEnAORClk .cbEnAORCE .cbEnAORRST -in $advanceoption -sticky w -padx 2 -pady 2
	grid .ckEnAOPR .cbEnAOPRClk .cbEnAOPRCE .cbEnAOPRRST -in $advanceoption -sticky w -padx 2 -pady 2
	grid .ckEnAOFR .cbEnAOFRClk .cbEnAOFRCE .cbEnAOFRRST -in $advanceoption -sticky w -padx 2 -pady 2
	
	pack .advanceoption -in $page2 -padx 1 -fill x

	$tnb delete 0
	iwidgets::combobox .cboBusOrder -labeltext "Bus Ordering Style:" -labelpos nw \
			-width 25 -textvariable Para(Order) -editable false -selectioncommand {SelectOrderCmd}
	.cboBusOrder insert list end "Big Endian \[MSB:LSB\]" "Little Endian \[LSB:MSB\]" "None"
	pack .cboBusOrder -in $Para(f1) -side bottom -pady 8
	
	$tnb view 0

	.cboOrder clear
	.cboOrder insert list end "Big Endian \[MSB:LSB\]" "Little Endian \[LSB:MSB\]"

	ChangeValueCmd

	GeneralConfig
}
