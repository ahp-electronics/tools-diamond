#$Header: L:/module/pll/gui/rcs/core_template.tcl 1.16 2008/06/23 08:23:12Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(IFrq)] > 0 &&
		[string length $Para(U_OFrq)] > 0 &&
		[string length $Para(U_KFrq)] > 0}  {DrawBusPins} 
} 

#X is illegal for CLKOP divider. The optimal value for maximum fVCO is Y.
proc IsInList1 {str lst para} {
	if {[string length $para] == 0} {
		set msg "Please input $str!"
		tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		return -1
	}
	if {[lsearch $lst $para] == -1} {
		set msg "Legal values for $str are $lst"
		tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		return -1
	}
	return 0
}

proc SetDivider {val}  {
	if {[regexp {\(([0-9]+)\)([0-9]+)} $val match x y]}  {
		set msg "CLKI Divider cannot take user specified value of $x. \nThe legal values are 1 to $y."
		tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		return $x
	} 
} 

proc SetDivider2 {val err}  {
	if {[regexp {\(([0-9]+)\)([0-9]+)} $val match x y]}  {
		if {$err != 0} {
			set msg "CLKFB Divider cannot take user specified value of $x.\nThe legal values are 1 to $y (CLKOP Divider = 2).\nThe range of legal values depends on the value of CLKOP Divider."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		}
		return $x
	} else {
		return $val;
	}	
} 

proc SetDivider3 {val err}  {
	if {[regexp {\(([0-9]+)\)([0-9]+)} $val match x y]}  {
		if {$err != 0} {
			#set msg "CLKOP Divider cannot take user specified value of $x."
			set msg "$x is illegal for CLKOP divider. The optimal value for maximum fVCO is $y."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		}
		return $x
	} else {
		return $val;
	}	
} 

proc CheckTolerance {str req act tol}  {
	global Para
	set t1 [expr abs($req-$act)]
	set t2 [expr $req*$tol/100]
	if {$t1 > $t2}  {
		set msg "The Requested Frequency of $str cannot be generated. \nTry to change the Desired Frequency or Tolerance."
		tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		return -1
	} 
	return 0
} 

#ISPL_CR_33651 
proc CheckPusleWidth {} {
	global Para
	
	if {$Para(EnCLKOS) == 1} {
		set duty [expr $Para(Duty)/8.0]
		if {$duty < 0.5} {
			set min_duty $duty
		} else {
			set min_duty [expr 1-$duty]
		}
		#tk_messageBox -default ok -icon warning -message $min_duty -title "min_duty" -type ok
		set CLKOS_period [expr $min_duty*1000/$Para(OFrq)]
		#tk_messageBox -default ok -icon warning -message $CLKOS_period -title "CLKOS_period" -type ok
		if {$CLKOS_period < 1.0} {
			.cboDuty.lwchildsite.entry config -fg red
			set msg "The selected duty cycle causes a minimum pulse width error."
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
			return -1
		} else {
			.cboDuty.lwchildsite.entry config -fg black
		}
	}
	return 0
}

proc DRC {}  {
	global Para

	set m $Para(Div)
	set n $Para(Mult)
	set v $Para(Post)
	set k $Para(SecD)

	# Divider Mode
	if {$Para(mode) == "advanced"}  {
		if {[string is integer $m] == 0}  {
			.cboMDiv.lwchildsite.entry config -fg red
			set m [SetDivider  $m]
			set n [SetDivider2 $n 0]
			set v [SetDivider3 $v 0]
			set Para(Div) $m
			set Para(Mult) $n
			set Para(Post) $v
			set Para(BoolFlag) 0
			return -1
			#.cboMDiv.lwchildsite.entry config -fg black
			#.cboMDiv clear list
			#.cboMDiv insert list end $m
		} else  {
			set ret [IsInRange "CLKI Divider" 1 16 $m]
			if {$ret == -1} {
				.cboMDiv.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			}
		} 
		if {[string is integer $n] == 0}  {
			.cboNDiv.lwchildsite.entry config -fg red
			set n [SetDivider2 $n 1]
			set Para(Mult) $n
			if {[string is integer $v] == 0}  {
				.cboVDiv.lwchildsite.entry config -fg red
				set v [SetDivider3 $v 0]
				set Para(Post) $v
			}
			set Para(BoolFlag) 0
			return -1
			#.cboNDiv.lwchildsite.entry config -fg black
			#.cboNDiv clear list
			#.cboNDiv insert list end $n
		} else  {
			set ret [IsInRange "CLKFB Divider" 1 16 $n]
			if {$ret == -1} {
				.cboNDiv.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			}
		} 
		if {[string is integer $v] == 0}  {
			.cboVDiv.lwchildsite.entry config -fg red
			set v [SetDivider3  $v 1]
			set Para(Post) $v
#			set Para(BoolFlag) 0
#			return -1
			#.cboVDiv.lwchildsite.entry config -fg black
			#.cboVDiv clear list
			#.cboVDiv insert list end $v
		} else  {
			#ISPL_CR_29590
			#if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"} 
			if {$Para(EnCLKOS) == 1}  {
				set ret [IsInList1 "CLKOP Divider" {2 4 8 16 32} $v]
				if {$ret == -1} {
					.cboVDiv.lwchildsite.entry config -fg red
					set Para(BoolFlag) 0
					return -1
				}
			} else {
				set ret [IsInList1 "CLKOP Divider" {2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32} $v]
				if {$ret == -1} {
					.cboVDiv.lwchildsite.entry config -fg red
					set Para(BoolFlag) 0
					return -1
				}
			} 
		} 
		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"} {
			if {[string is integer $k] == 0}  {
				# This will never happen! - $k is always legal
				#.cboKDiv.lwchildsite.entry config -fg red
				#set k [SetDivider "CLKOK Divider" $k]
#				set Para(BoolFlag) 0
#				return -1
				.cboKDiv.lwchildsite.entry config -fg black
				.cboKDiv clear list
				.cboKDiv insert list end $k
			} else  {
				if {$Para(EnCLKOK) == 1}  {
					set ret [IsInRange "ClkOK Divider" 2 128 $k]
					if {$ret == -1} {
						.cboKDiv.lwchildsite.entry config -fg red
						set Para(BoolFlag) 0
						return -1
					}
					if {[expr fmod($k,2)] != 0}  {
						set msg "Legal values for ClkOK Divider are 2,4,6,8,...,128."
						tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
						.cboKDiv.lwchildsite.entry config -fg red
						set Para(BoolFlag) 0
						return -1
					} 
				} 
			} 
		}
		.entOFrq.lwchildsite.entry config -fg black
	} 
	
	# Frequency Mode
	if {$Para(mode) == "normal"}  {
		set ret [CheckTolerance "CLKOP" $Para(U_OFrq) $Para(OFrq) $Para(OP_Tol)]
		if {$ret == -1} {
			.entOFrq.lwchildsite.entry config -fg red
			set Para(BoolFlag) 0
			return -1
		} else {
			.entOFrq.lwchildsite.entry config -fg black
		} 
		if {($Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc") && $Para(EnCLKOK) == 1} {
			set ret [CheckTolerance "CLKOK" $Para(U_KFrq) $Para(KFrq) $Para(OK_Tol)]
			if {$ret == -1} {
				.entKFrq.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			} else  {
				.entKFrq.lwchildsite.entry config -fg black
			} 
		} 
	} 
	
	set ret [CheckPusleWidth]
	if {$ret == -1} {
		set Para(BoolFlag) 0
		return -1
	}

	#set Para(Div) $m
	#set Para(Mult) $n
	#set Para(Post) $v
	#set Para(SecD) $k
	set Para(BoolFlag) 1
	return 0
}

proc ChangeDefaultSet {} {
	global Para
	#xp
	if {$Para(arch) == "mg5g00"} {
		if {$Para(mode) == "advanced"} {
			if {$Para(EnCLKOS) == "1"} {
				set Para(Post) 4
			} else {
				set Para(Post) 6
			}
		}
	}
}

proc ChangeValueCmd {} {
	global Para frmProperty in_pins out_pins frmCLKOS

	if {$Para(BoolFlag) == "1"}  {
		$Para(generate_cfg) configure -state normal
		#$Para(generate) configure -state normal
	} else  {
		$Para(generate_cfg) configure -state disabled
		#$Para(generate) configure -state disabled
	} 

	if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"} {
	# PLL Type = ehxpllb
		if {$Para(mode) == "normal"}  {
		#Frequency Mode
			.cboMDiv config -state disabled
			.cboNDiv config -state disabled
			.cboVDiv config -state disabled
			.cboKDiv config -state disabled
			.entU_OFrq config -state normal -foreground black
			.cboOP_Tol config -state normal -foreground black
			.entU_KFrq config -state normal -foreground black
			.cboOK_Tol config -state normal -foreground black
			if {$Para(EnCLKOK) == 0}  {
				.entU_KFrq config -state disabled
				.cboOK_Tol config -state disabled
				.entKFrq   config -state disabled
			} else  {
				.entU_KFrq config -state normal
				.cboOK_Tol config -state normal
				.entKFrq   config -state normal
			} 
		} else {
		#Divider Mode
			.cboMDiv config -state normal
			.cboNDiv config -state normal
			.cboVDiv config -state normal
			.cboKDiv config -state normal -foreground black
			.entU_OFrq config -state disabled -foreground gray50
			.cboOP_Tol config -state disabled -foreground gray50
			.entU_KFrq config -state disabled -foreground gray50
			.cboOK_Tol config -state disabled -foreground gray50
			if {$Para(EnCLKOK) == 0}  {
				.cboKDiv   config -state disabled
				.entKFrq   config -state disabled
			} else  {
				.cboKDiv   config -state normal
				.entKFrq   config -state normal
			} 
		} 
		.cboPhase config -state normal -foreground black
		.cboDuty  config -state normal -foreground black
		.entKFrq  config -state disabled -foreground black -disabledforeground black

		.cboVDiv clear list
		# DTS - 25494 + 25567
		if {$Para(arch) == "mg5g00"}  {
			.cboVDiv insert list end 2 4 8 16
		} else  {
			.cboVDiv insert list end 2 4 8 16 32
		} 
		#.cboDelay clear list
		#.cboDelay insert list end Static Dynamic
		.cbDDC	  config -state normal
	} else {
	# PLL Type = epllb
		if {$Para(mode) == "normal"}  {
		#Frequency Mode
			.cboMDiv config -state disabled
			.cboNDiv config -state disabled
			.cboVDiv config -state disabled
			.entU_OFrq config -state normal -foreground black
			.cboOP_Tol config -state normal -foreground black
		} else  {
		#Divider Mode
			.cboMDiv config -state normal
			.cboNDiv config -state normal
			.cboVDiv config -state normal
			.entU_OFrq config -state disabled -foreground gray50
			.cboOP_Tol config -state disabled -foreground gray50
		} 
		.cboPhase  config -state disabled -foreground gray50
		.cboDuty   config -state disabled -foreground gray50
		.cboKDiv   config -state disabled -foreground gray50
		.entU_KFrq config -state disabled -foreground gray50
		.cboOK_Tol config -state disabled -foreground gray50
		.entKFrq   config -state disabled -foreground gray50 -disabledforeground gray50

		.cboVDiv clear list
		# DTS - 25494 + 25567
		if {$Para(arch) == "mg5g00"}  {
			.cboVDiv insert list end 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30
		} else  {
			.cboVDiv insert list end 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32
		} 
		#.cboDelay clear list
		#.cboDelay insert list end Static
		#set Para(DelayControl) Static
		.cbDDC	  config -state disabled
		set Para(DelayControl) Static
	} 

	.cboVDiv clear list
	if {$Para(EnCLKOS) == 0}  {
		.cboPhase config -state disabled
		.cboDuty  config -state disabled
		.lblClkOS config -state disabled
		if {$Para(arch) == "mg5g00"}  {
			.cboVDiv insert list end 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30
			#set Para(Post) 6
		} else  {
			.cboVDiv insert list end 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32
		} 
	} else  {
		.cboPhase config -state normal
		.cboDuty  config -state normal
		.lblClkOS config -state normal
		if {$Para(arch) == "mg5g00"}  {
			.cboVDiv insert list end 2 4 8 16
		} else  {
			.cboVDiv insert list end 2 4 8 16 32
		} 
		if {[lsearch {2 4 8 16 32} $Para(Post)] == -1} {
			set Para(Post) 4
		}	
	} 

	.cboMDiv clear list
	.cboNDiv clear list
	.cboKDiv clear list
	# DTS - 25494 + 25567
	if {$Para(arch) == "mg5g00"}  {
		.cboMDiv insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		.cboNDiv insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	} else  {
		.cboMDiv insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		.cboNDiv insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
	} 
	for {set i 2} {$i<129} {set i [expr $i+2]} {
		.cboKDiv insert list end $i
	} 

	if {$Para(arch) == "mg5g00"}  {
		set max 375.0000
	} 
	if {$Para(arch) == "ep5g00" || $Para(arch) == "mj5g00" || $Para(arch) == "ep5g00p"}  {
		set max 420.0000
	} 
	if {$Para(IFrq) < 25.0000 || $Para(IFrq) > $max} {
		.entIFrq.lwchildsite.entry config -fg red
	} else  {
		.entIFrq.lwchildsite.entry config -fg black
	} 
	if {$Para(mode) == "normal"}  {
		if {$Para(U_OFrq) < 25.0000 || $Para(U_OFrq) > $max} {
			.entU_OFrq.lwchildsite.entry config -fg red
		} else  {
			.entU_OFrq.lwchildsite.entry config -fg black
		} 

		#ISPL_CR_37233
		if {$Para(arch) == "mg5g00"}  {
			set u_kfrq 187.5000
		} else {
			set u_kfrq 210.0000
		}
		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"}  {
			if {$Para(U_KFrq) < 0.1953 || $Para(U_KFrq) > $u_kfrq} {
				.entU_KFrq.lwchildsite.entry config -fg red
			} else  {
				.entU_KFrq.lwchildsite.entry config -fg black
			} 
		} 
	} 

	set m [string trim $Para(Div)]
	set n [string trim $Para(Mult)]
	set v [string trim $Para(Post)]
	set k [string trim $Para(SecD)]
	if {[string is integer $m] == 1}  {
		.cboMDiv.lwchildsite.entry config -fg black
	} 
	if {[string is integer $n] == 1}  {
		.cboNDiv.lwchildsite.entry config -fg black
	} 
	if {[string is integer $v] == 1}  {
		.cboVDiv.lwchildsite.entry config -fg black
	} 
	if {[string is integer $k] == 1}  {
		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"} {
			.cboKDiv.lwchildsite.entry config -fg black
		}
	} 
}

proc EditFreq {}  {
	global Para
	set Para(BoolFlag) 0
	ChangeValueCmd
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
	if {$Para(pll_fbk_attribute) == "VDIVOUT"}  {set Para(pll_fbk_attribute) CLKTREE} 
}

proc CheckMg5g00Para {}  {
	global Para

	if {$Para(arch) == "mg5g00"}  {
		set max 375.0000
	} 
	if {$Para(arch) == "ep5g00" || $Para(arch) == "mj5g00" || $Para(arch) == "ep5g00p"}  {
		set max 420.0000
	} 
	set ret [IsInRange "CLKI Frequency" 25.0000 $max $Para(IFrq)]
	if {$ret == -1} {return -1}
	if {$Para(mode) == "normal"}  {
		set ret [IsInRange "CLKOP Frequency" 25.0000 $max $Para(U_OFrq)]
		if {$ret == -1} {return -1}

		#ISPL_CR_37233
		if {$Para(arch) == "mg5g00"}  {
			set u_kfrq 187.5000
		} else {
			set u_kfrq 210.0000
		}
		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"}  {
			set ret [IsInRange "CLKOK Frequency" 0.1953 $u_kfrq $Para(U_KFrq)]
			if {$ret == -1} {return -1}
		} 
	} 

	if {[expr fmod($Para(Post),2)] != 0}  {
		set msg "Legal values for ClkOP Divider are 2,4,6...,22,24."
		tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		return -1
	} 
	set ret [IsInRange "Fine Delay Adjust" -8 8 $Para(PllDly)]
	if {$ret == -1} {return -1}

	#21764
	if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"} {
		if {$Para(EnCLKOK) == 1}  {
			set ret [IsInRange "ClkOK Divider" 2 128 $Para(SecD)]
			if {$ret == -1} {return -1}
			if {[expr fmod($Para(SecD),2)] != 0}  {
				set msg "Legal values for ClkOK Divider are 2,4,...,128."
				tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
				return -1
			} 
		} 
		set ret [IsInList1 "PhaseADJ" {0 45 90 135 180 225 270 315} $Para(Phase)]
		if {$ret == -1} {return -1}
		set ret [IsInRange "Duty Cycle Selection" 1 7 $Para(Duty)]
		if {$ret == -1} {return -1}
	}
	
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

	switch $Para(arch) {
		mg5g00 -
		ep5g00  {set ret [CheckMg5g00Para]}
		default {set ret 0}
	}

	return $ret
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para

	#25489
	if {$Para(Family) == "ep5g00p"}  {
		set str "-arch ep5g00p -type pll -fin $Para(IFrq)"
	} else  {
		set str "-arch $Para(arch) -type pll -fin $Para(IFrq)"
	} 
	if {$Para(mode)=="normal"} {
		if {$Para(Type) == "epllb"}  {
			lappend str -fclkop $Para(U_OFrq) -fclkop_tol $Para(OP_Tol)
		} else  {
			lappend str -fclkop $Para(U_OFrq) -fclkop_tol $Para(OP_Tol)
		} 
	} else  {
		if {$Para(Type) == "epllb"}  {
			lappend str -mdiv $Para(Div) -ndiv $Para(Mult) -vdiv $Para(Post)
		} else  {
			lappend str -mdiv $Para(Div) -ndiv $Para(Mult) -vdiv $Para(Post)
		} 
	} 
	lappend str -delay_cntl [string toupper $Para(DelayControl)]
	lappend str -fdel $Para(PllDly) -fb_mode $Para(fb_mode)

	if {$Para(EnCLKOS) == 0}  {
		lappend str -noclkos
	} else  {
		lappend str -phaseadj $Para(Phase) -duty $Para(Duty)
	} 

	if {$Para(EnCLKOK) == 0}  {
		lappend str -noclkok
	} else  {
		if {$Para(mode)=="normal"} {
			lappend str -fclkok $Para(U_KFrq) -fclkok_tol $Para(OK_Tol)
		} else  {
			#28586 + #29059
			lappend str -kdiv $Para(SecD);# -fclkok $Para(U_KFrq) -fclkok_tol $Para(OK_Tol)
		} 	   
	} 


#	tk_messageBox -default ok -icon warning -message $str -title "GenerateCB" -type ok
    return $str
}

proc GetStdoutStr {}  {
	global Para

	set str [GenerateCB]

	set scuba [GetScubaEngine]

#*** General Options Command arguments ***
	set cmd [GetGeneralArgs]

	append command_line [list $scuba] " -w -n" " " $Para(ModuleName) $cmd " " $str

	lappend command_line -cal
#	tk_messageBox -default ok -icon warning -message $command_line -title "GetStdoutStr" -type ok
	set ret [catch {eval exec $command_line} msg]
	if {$ret != 0} {return -1}

#	tk_messageBox -default ok -icon warning -message $ret -title "GetStdoutStr" -type ok

#	tk_messageBox -default ok -icon warning -message $msg -title "GetStdoutStr" -type ok
	
	return $msg
} 

proc CalculateCmd {}  {
	global Para

#	You could call scuba with a specific option (such as "-cal "), and the 
#	DIV values and the Freq values can be written to the stdout.
#		Div: 1,2,3,4
#		Freq: 100.000, 100.000

	if {$Para(arch) == "mg5g00"}  {
		set max 375.0000
	} 
	if {$Para(arch) == "ep5g00" || $Para(arch) == "mj5g00" || $Para(arch) == "ep5g00p"}  {
		set max 420.0000
	} 
	set ret [IsInRange "CLKI Frequency" 25.0000 $max $Para(IFrq)]
	if {$ret == -1} {
		.entIFrq.lwchildsite.entry config -fg red
		set Para(BoolFlag) 0
		return -1
	}
	if {$Para(mode) == "normal"}  {
		set ret [IsInRange "CLKOP Frequency" 25.0000 $max $Para(U_OFrq)]
		if {$ret == -1} {
			.entU_OFrq.lwchildsite.entry config -fg red
			set Para(BoolFlag) 0
			return -1
		}

		#ISPL_CR_37233
		if {$Para(arch) == "mg5g00"}  {
			set u_kfrq 187.5000
		} else {
			set u_kfrq 210.0000
		}
		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"}  {
			set ret [IsInRange "CLKOK Frequency" 0.1953 $u_kfrq $Para(U_KFrq)]
			if {$ret == -1} {
				.entU_KFrq.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			}
		} 
	} 

	set ret [GetStdoutStr]
	if {$ret == -1}  {return -1}

	set stdout_str [split $ret '\n']
	set div_str [lindex $stdout_str 0]
	set div [split [string range $div_str [expr [string first : $div_str]+1] end] ,]
	set freq_str [lindex $stdout_str 1]
	set freq [split [string range $freq_str [expr [string first : $freq_str]+1] end] ,]

	set Para(Div)  [string trim [lindex $div 0]]
	set Para(Mult) [string trim [lindex $div 1]]
	set Para(Post) [string trim [lindex $div 2]]
	set Para(OFrq) [string trim [lindex $freq 0]]
	# 25352 + 28856
	if {($Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc") && $Para(EnCLKOK) == 1}  {
		set Para(SecD) [string trim [lindex $div 3]]
		set Para(KFrq) [string trim [lindex $freq 1]]
	} 

	set ret [DRC]
	if {$ret == -1}  {return -1}

	if { [string is double $Para(OFrq)]  && [string is double $Para(KFrq)]} {
		set Para(BoolFlag) 1
	} else  {
		set Para(BoolFlag) 0
	} 

	if {$Para(BoolFlag) == "1"}  {
		$Para(generate_cfg) configure -state normal
		#$Para(generate) configure -state normal
	} else  {
		$Para(generate_cfg) configure -state disabled
		#$Para(generate) configure -state disabled
	} 
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
	AttributeSetting 600 450
	set pin_flag 1
	DrawImage 220 350
	set tnb $Para(tnb)

		set Para(BoolFlag) 0

		wm title . "Lattice Module -- PLL"
	#*** Here for user to add extra pages ***
	#--- Page #1 ---
		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties
		set frmProperty [.frmProperties childsite]

		#*** PLL Type ***
		iwidgets::combobox .cboPllType -labeltext "PLL Type" -width 10 -textvariable Para(Type) -editable false -selectioncommand {EditFreq;CallDrawPins}
		.cboPllType insert list end epllb ehxpllb

		frame .frmMode
		radiobutton .rdoNormal   -text "Frequency Mode" -command {EditFreq;CallDrawPins} -width 16 -variable Para(mode) -value normal
		radiobutton .rdoAdvanced -text "Divider Mode"   -command {ChangeDefaultSet;EditFreq;CallDrawPins} -width 16 -variable Para(mode) -value advanced
		pack .rdoNormal .rdoAdvanced -in .frmMode -side left

		#*** CLKI Frequency ***
		iwidgets::Labeledframe .frmClkI -labeltext "CLKI" -labelpos nw
		set frmClkI [.frmClkI childsite]
		iwidgets::entryfield .entIFrq -labeltext "\nFrequency" -labelpos n -width 13 -textvariable Para(IFrq) -validate real
		iwidgets::combobox   .cboMDiv -labeltext "\nDivider"   -labelpos n -width 6  -textvariable Para(Div) -editable false -selectioncommand EditFreq
		# DTS - 25494 + 25567
		if {$Para(arch) == "mg5g00"}  {
			.cboMDiv insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		} else  {
			.cboMDiv insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		} 
		pack .entIFrq .cboMDiv -in $frmClkI -side left -padx 2 -fill x
		.entIFrq.lwchildsite.entry config -validate key -vcmd {
			after idle {EditFreq;CallDrawPins}
			return 1
		}

		#*** CLKOP Frequency ***
		iwidgets::Labeledframe .frmClkOP -labeltext "CLKOP" -labelpos nw
		set frmClkOP [.frmClkOP childsite]
		iwidgets::combobox   .cboVDiv   -labeltext "\nDivider"            -labelpos n -width 6  -textvariable Para(Post) -editable false -selectioncommand EditFreq
		iwidgets::entryfield .entU_OFrq -labeltext "Desired\nFrequency" -labelpos n -width 12 -textvariable Para(U_OFrq) -validate real
		iwidgets::combobox   .cboOP_Tol -labeltext "\nTolerance"          -labelpos n -width 8  -textvariable Para(OP_Tol) -editable false -selectioncommand EditFreq
		iwidgets::entryfield .entOFrq   -labeltext "Actual\nFrequency"    -labelpos n -width 12 -textvariable Para(OFrq) -fixed 10 -state disabled -disabledforeground black
		# DTS - 25494 + 25567
		if {$Para(arch) == "mg5g00"}  {
			.cboVDiv insert list end 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30
		} else  {
			.cboVDiv insert list end 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32
		} 
		#24674
	#	.cboOP_Tol insert list end 0.01 0.02 0.05 1.0 2.0 5.0 10.0
		.cboOP_Tol insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
		pack .cboVDiv .entU_OFrq .cboOP_Tol .entOFrq -in $frmClkOP -side left -padx 2 -fill x
		.entU_OFrq.lwchildsite.entry config -validate key -vcmd {
			after idle {EditFreq;CallDrawPins}
			return 1
		}

		#*** CLKFB ***
		iwidgets::Labeledframe .frmClkFB -labeltext "CLKFB" -labelpos nw
		set frmClkFB [.frmClkFB childsite]
	#25228
	#	iwidgets::combobox .cboFB_Mode -labeltext "Feedback\nMode" -labelpos n -width 10 -textvariable Para(fb_mode) -editable false -selectioncommand EditFreq
		iwidgets::combobox .cboFB_Mode -labeltext "Feedback\nMode" -labelpos n -width 10 -textvariable Para(fb_mode) -editable false -selectioncommand {EditFreq;CallDrawPins}
		iwidgets::combobox .cboNDiv    -labeltext "\nDivider"      -labelpos n -width 6  -textvariable Para(Mult) -editable false -selectioncommand EditFreq
		.cboFB_Mode insert list end CLOCKTREE INTERNAL EXTERNAL
		# DTS - 25494 + 25567
		if {$Para(arch) == "mg5g00"}  {
			.cboNDiv insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		} else  {
			.cboNDiv insert list end 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
		} 
		pack .cboFB_Mode .cboNDiv -in $frmClkFB -side left -padx 2 -fill x

		#*** CLKOS ***
		iwidgets::Labeledframe .frmClkOS -labeltext "CLKOS" -labelpos nw
		set frmClkOS [.frmClkOS childsite]
		# 26615
		checkbutton .cbEnCLKOS -text "Enable CLKOS" -variable Para(EnCLKOS) -command {ChangeDefaultSet;EditFreq;CallDrawPins}
		pack .cbEnCLKOS -in $frmClkOS -anchor w -padx 12
		label .lblClkOS -text "Acutal\nFrequency\nSame as\nCLKOP"

		iwidgets::combobox .cboPhase -labeltext "\nPhaseADJ (degree)" -labelpos n -width 6 -textvariable Para(Phase) -editable false -selectioncommand EditFreq
		iwidgets::combobox .cboDuty  -labeltext "\nDuty Cycle (*1/8)" -labelpos n -width 6 -textvariable Para(Duty) -editable false -selectioncommand EditFreq
		.cboPhase insert list end 0 45 90 135 180 225 270 315
		.cboDuty  insert list end 1 2 3 4 5 6 7
		pack .cboPhase .cboDuty .lblClkOS -in $frmClkOS -side left -padx 11 -fill x

		#*** Delay Adjust ***
		iwidgets::Labeledframe .frmDelay -labeltext "Delay Adjust" -labelpos nw
		set frmDelay [.frmDelay childsite]
	#	iwidgets::combobox .cboPllDly -labeltext "Fine Delay\nAdjust" -labelpos n -width 6  -textvariable Para(PllDly) -editable false -selectioncommand EditFreq
		#25228
	#	iwidgets::combobox .cboDelay  -labeltext "Delay\nControl"     -labelpos n -width 10 -textvariable Para(DelayControl) -editable false -selectioncommand {EditFreq;CallDrawPins}
	#	.cboPllDly insert list end -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8
	#	.cboDelay  insert list end Static Dynamic
		checkbutton .cbDDC -text "Dynamic Delay Control" -variable Para(DelayControl) -onvalue Dynamic -offvalue Static -command {EditFreq;CallDrawPins}
		pack .cbDDC -in $frmDelay -side left -padx 2 -fill x

		#*** CLKOK Frequency ***
		iwidgets::Labeledframe .frmClkOK -labeltext "CLKOK" -labelpos nw
		set frmClkOK [.frmClkOK childsite]
		# 26615
		checkbutton .cbEnCLKOK -text "Enable CLKOK" -variable Para(EnCLKOK) -command {EditFreq;CallDrawPins}
		pack .cbEnCLKOK -in $frmClkOK -anchor w -padx 12

		iwidgets::combobox   .cboKDiv   -labeltext "\nDivider"            -labelpos n -width 6  -textvariable Para(SecD) -editable false -selectioncommand EditFreq
		iwidgets::entryfield .entU_KFrq -labeltext "Desired\nFrequency" -labelpos n -width 12 -textvariable Para(U_KFrq) -validate real
		iwidgets::combobox   .cboOK_Tol -labeltext "\nTolerance"          -labelpos n -width 8  -textvariable Para(OK_Tol) -editable false -selectioncommand EditFreq
		iwidgets::entryfield .entKFrq   -labeltext "Actual\nFrequency"    -labelpos n -width 12 -textvariable Para(KFrq) -fixed 10 -state disabled -disabledforeground black
		for {set i 2} {$i<129} {set i [expr $i+2]} {
			.cboKDiv insert list end $i
		} 
		#24674
	#	.cboOK_Tol insert list end 0.01 0.02 0.05 1.0 2.0 5.0 10.0
		.cboOK_Tol insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
		pack .cboKDiv .entU_KFrq .cboOK_Tol .entKFrq -in $frmClkOK -side left -padx 2 -fill x
		.entU_KFrq.lwchildsite.entry config -validate key -vcmd {
			after idle {EditFreq;CallDrawPins}
			return 1
		}

		button .btnCal -text "Calculate" -width 16 -command {CalculateCmd}

		grid .cboPllType .frmMode  -in $frmProperty -sticky w
		grid .frmClkI    .frmClkOP -in $frmProperty -sticky w
		grid .frmClkFB   .frmClkOS -in $frmProperty -sticky w
		grid .frmDelay   .frmClkOK -in $frmProperty -sticky w
		grid x           .btnCal   -in $frmProperty -sticky e
		pack .frmProperties -in $page -side top -fill both -expand 1

		#17787 - depend on pshin 11/24/03
		set Para(Expression) None
		set Para(Order)      None
		.cboExpression config -state disabled -foreground gray50
		.cboOrder      config -state disabled -foreground gray50
		.cbEdif        config -command {}

		#22290
	#	CreateLabelCombobox $frmProperty FbMode "FB_Mode" 20 10 Para(pll_fbk_attribute) $fbmode_list

	if {$Para(arch) == "mj5g00"}  {
		#26414, 26415
		.cboPllType clear list
		.cboPllType insert list end ehxpllc
		#26416
		.cboFB_Mode clear list
		.cboFB_Mode insert list end INTERNAL CLKOP USERCLOCK
	} 

		$tnb view 0

	#CalcNormal

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
#	FunctionButton
#	CenterPosition

	EditFreq

	GeneralConfig
	$Para(generate_cfg) configure -state disabled
	#$Para(generate) configure -state disabled
	grid forget .cboPllType
}