#$Header: L:/module/pll/latticeecp3/gui/core_template.tcl 1.27 mghuang Exp $

#Rev 1.27: Diamond 1.4.1 IPExpress: Fixed CR_54178, UM rev 3.9

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
			return $y
		}
		return $x
	} else {
		return $val;
	}	
} 

proc SetDivider3 {val err}  {
	if {[regexp {\(([0-9]+)\)([0-9]+)} $val match x y]}  {
		if {$err != 0} {
#			set msg "CLKOP Divider cannot take user specified value of $x."
			set msg "$x is illegal for CLKOP divider. The optimal value for maximum fVCO is $y."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return $y
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
	
set frmProperty [.frmProperties childsite]
set win [.sf childsite]	
set frmClkI [$win.frmLeft1.frmClkI childsite]
set frmClkOPOS [$win.frmRight1.frmClkOPOS childsite]
set frmClkOP [$win.frmRight1.frmClkOP childsite]
set frmTrimP [$frmClkOP.frmTrimP childsite]
set frmClkFB [$win.frmLeft1.frmClkFB childsite]
set frmClkOS [$win.frmRight1.frmClkOS childsite]
set frmStatic [$frmClkOS.frame11.frmStatic childsite]
set frmDynamic [$frmClkOS.frmDynamic childsite]
set frmDutyTrim [$frmClkOS.frmDutyTrim childsite]
set frmPhaseDuty [$win.frmLeft1.frmPhaseDuty childsite]
set frmClkOK [$win.frmRight1.frmClkOK childsite]

	if {$Para(EnCLKOS) == 1 && $Para(ClkOSBp) == 0} {
		set duty [expr $Para(Duty)/16.0]
		if {$duty < 0.5} {
			set min_duty $duty
		} else {
			set min_duty [expr 1-$duty]
		}
		set CLKOS_period [expr $min_duty*1000/$Para(OFrq)]
		if {$CLKOS_period < 1.0} {
			$frmStatic.frame111.cboDuty.lwchildsite.entry config -fg red
			set msg "The selected duty cycle causes a minimum pulse width error."
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
			return -1
		} else {
			$frmStatic.frame111.cboDuty.lwchildsite.entry config -fg black
		}
	}
	return 0
}

proc DRC {}  {
	global Para
set frmProperty [.frmProperties childsite]
set win [.sf childsite]	
set frmClkI [$win.frmLeft1.frmClkI childsite]
set frmClkOPOS [$win.frmRight1.frmClkOPOS childsite]
set frmClkOP [$win.frmRight1.frmClkOP childsite]
set frmTrimP [$frmClkOP.frmTrimP childsite]
set frmClkFB [$win.frmLeft1.frmClkFB childsite]
set frmClkOS [$win.frmRight1.frmClkOS childsite]
set frmStatic [$frmClkOS.frame11.frmStatic childsite]
set frmDynamic [$frmClkOS.frmDynamic childsite]
set frmDutyTrim [$frmClkOS.frmDutyTrim childsite]
set frmPhaseDuty [$win.frmLeft1.frmPhaseDuty childsite]
set frmClkOK [$win.frmRight1.frmClkOK childsite]

	set m $Para(Div)
	set n $Para(Mult)
	set v $Para(Post)
	set k $Para(SecD)

	# Divider Mode
	if {$Para(mode) == "advanced"}  {
		if {[string is integer $m] == 0}  {
			$frmClkI.frmTop.cboMDiv.lwchildsite.entry config -fg red
			set m [SetDivider  $m]
			set n [SetDivider2 $n 0]
			set v [SetDivider3 $v 0]
			set Para(Div) $m
			set Para(Mult) $n
			set Para(Post) $v
			set Para(BoolFlag) 0
			return -1
		} else  {
			set ret [IsInRange "CLKI Divider" 1 64 $m]
			if {$ret == -1} {
				$frmClkI.frmTop.cboMDiv.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			}
		} 
		if {[string is integer $n] == 0}  {
			$frmClkFB.cboNDiv.lwchildsite.entry config -fg red
			set n [SetDivider2 $n 1]
			set Para(Mult) $n
			if {[string is integer $v] == 0}  {
				$frmClkOPOS.cboVDiv.lwchildsite.entry config -fg red
				set v [SetDivider3 $v 0]
				set Para(Post) $v
			}
			set Para(BoolFlag) 0
			return -1
		} else  {
			set ret [IsInRange "CLKFB Divider" 1 64 $n]
			if {$ret == -1} {
				$frmClkFB.cboNDiv.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			}
		} 
		if {[string is integer $v] == 0}  {
			$frmClkOPOS.cboVDiv.lwchildsite.entry config -fg red
			set v [SetDivider3  $v 1]
			set Para(Post) $v
		} else  {
			if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"} {
				#ISPL_CR_29211
				set ret [IsInList1 "CLKOP Divider" {2 4 8 16 32 48 64 80 96 112 128} $v]
				if {$ret == -1} {
					$frmClkOPOS.cboVDiv.lwchildsite.entry config -fg red
					set Para(BoolFlag) 0
					return -1
				}
			} else {
				#ISPL_CR_29211
				set ret [IsInList1 "CLKOP Divider" {2 4 8 16 32 48 64 80 96 112 128} $v]
				if {$ret == -1} {
					$frmClkOPOS.cboVDiv.lwchildsite.entry config -fg red
					set Para(BoolFlag) 0
					return -1
				}
			} 
		} 
		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"} {
			if {[string is integer $k] == 0}  {
				# This will never happen! - $k is always legal
				#$frmClkOK.frame21.cboKDiv.lwchildsite.entry config -fg red
				#set k [SetDivider "CLKOK Divider" $k]
				$frmClkOK.frame21.cboKDiv.lwchildsite.entry config -fg black
				$frmClkOK.frame21.cboKDiv clear list
				$frmClkOK.frame21.cboKDiv insert list end $k
			} else  {
				if {$Para(EnCLKOK) == 1}  {
					set ret [IsInRange "ClkOK Divider" 2 128 $k]
					if {$ret == -1} {
						$frmClkOK.frame21.cboKDiv.lwchildsite.entry config -fg red
						set Para(BoolFlag) 0
						return -1
					}
					if {[expr fmod($k,2)] != 0}  {
						set msg "Legal values for ClkOK Divider are 2,4,6,8,...,128."
						tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
						$frmClkOK.frame21.cboKDiv.lwchildsite.entry config -fg red
						set Para(BoolFlag) 0
						return -1
					} 
				} 
			} 
		}
		$frmClkOPOS.entOFrq.lwchildsite.entry config -fg black
	} 
	
	# Frequency Mode
	if {$Para(mode) == "normal"}  {
		if {$Para(ClkOPBp) == 0} {
			set ret [CheckTolerance "ClkOP" $Para(U_OFrq) $Para(OFrq) $Para(OP_Tol)]
			if {$ret == -1} {
				$frmClkOPOS.entOFrq.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			} else {
				$frmClkOPOS.entOFrq.lwchildsite.entry config -fg black
			} 
		}
		if {$Para(EnCLKOK) == 1 && $Para(ClkOKBp) == 0} {
			set ret [CheckTolerance "CLKOK" $Para(U_KFrq) $Para(KFrq) $Para(OK_Tol)]
			if {$ret == -1} {
				$frmClkOK.frame21.entKFrq.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			} else  {
				$frmClkOK.frame21.entKFrq.lwchildsite.entry config -fg black
			} 
		} 
	} 

	set ret [CheckPusleWidth]
	if {$ret == -1} {
		set Para(BoolFlag) 0
		return -1
	}

	set Para(BoolFlag) 1
	return 0
}

proc ChangeClkOPCmd {} {
	global Para
	if {$Para(ClkOPBp) == "1"} {
		set Para(EnCLKOS) 1
		set Para(ClkOSBp) 1
		set Para(EnCLKOK) 1
		set Para(ClkOKBp) 1
	}
}

proc ChangeValueCmd {} {
	global Para frmProperty in_pins out_pins frmCLKOS
set frmProperty [.frmProperties childsite]
set win [.sf childsite]	
set frmClkI [$win.frmLeft1.frmClkI childsite]
set frmClkOPOS [$win.frmRight1.frmClkOPOS childsite]
set frmClkOP [$win.frmRight1.frmClkOP childsite]
set frmTrimP [$frmClkOP.frmTrimP childsite]
set frmClkFB [$win.frmLeft1.frmClkFB childsite]
set frmClkOS [$win.frmRight1.frmClkOS childsite]
set frmStatic [$frmClkOS.frame11.frmStatic childsite]
set frmDynamic [$frmClkOS.frmDynamic childsite]
set frmDutyTrim [$frmClkOS.frmDutyTrim childsite]
set frmPhaseDuty [$win.frmLeft1.frmPhaseDuty childsite]
set frmClkOK [$win.frmRight1.frmClkOK childsite]

	if {$Para(BoolFlag) == "1"}  {
		$Para(generate_cfg) configure -state normal
	} else  {
		$Para(generate_cfg) configure -state disabled
	} 

	if {$Para(mode) == "normal"}  {
	#Frequency Mode
		$frmClkI.frmTop.cboMDiv config -state disabled
		$frmClkFB.cboNDiv config -state disabled
		$frmClkOPOS.cboVDiv config -state disabled
		$frmClkOK.frame21.cboKDiv config -state disabled
		$frmClkOPOS.entU_OFrq config -state normal -foreground black
		$frmClkOPOS.cboOP_Tol config -state normal -foreground black
		$frmClkOK.frame21.entU_KFrq config -state normal -foreground black
		$frmClkOK.frame21.cboOK_Tol config -state normal -foreground black
		if {$Para(PhaseDuty) == "Dynamic"} {
			$frmTrimP.rdoTrimP0 config -state normal
			$frmTrimP.rdoTrimP1 config -state normal
			$frmTrimP.cboDelayMultP config -state normal
			if {$Para(DutyTrimP) == "Rising"} {
				$frmTrimP.cboDelayMultP clear list
				$frmTrimP.cboDelayMultP insert list end 0 1 2 3 4 5 6 7
			} else {
				$frmTrimP.cboDelayMultP clear list
				$frmTrimP.cboDelayMultP insert list end 0 1 2 3 4 5 6 7
			}
		} else {
			$frmTrimP.rdoTrimP0 config -state disable
			$frmTrimP.rdoTrimP1 config -state disable
			$frmTrimP.cboDelayMultP config -state disabled
		}
		if {$Para(ClkOPBp) == 1}  {
			$frmClkOPOS.entU_OFrq config -state disabled
			$frmClkOPOS.cboOP_Tol config -state disabled
			$frmTrimP.rdoTrimP0 config -state disable
			$frmTrimP.rdoTrimP1 config -state disable
			$frmTrimP.cboDelayMultP config -state disabled
			set Para(CLKOK_INPUT) CLKOS
		}
		if {$Para(EnCLKOK) == 0}  {
			$frmClkOK.frame20.cbClkOKBp config -state disabled
			$frmClkOK.frame2.rdoClkPAsIn config -state disabled 
			$frmClkOK.frame2.rdoClkSAsIn config -state disabled
			set Para(ClkOKBp) 0
			$frmClkOK.frame21.entU_KFrq config -state disabled
			$frmClkOK.frame21.cboOK_Tol config -state disabled
			$frmClkOK.frame21.entKFrq   config -state disabled
			$frmClkOK.cbClkRst  config -state disable
			set Para(ClkRst) 0
		} else  {
			$frmClkOK.frame20.cbClkOKBp config -state normal
			$frmClkOK.frame2.rdoClkPAsIn config -state normal 
			$frmClkOK.frame2.rdoClkSAsIn config -state normal
			#10 b. If (※CLKOP Bypass = TRUE§ and ※CLKOS Bypass = TRUE§):
			if {$Para(ClkOPBp) == 1 && $Para(ClkOSBp) == 1} {
				$frmClkOK.frame20.cbClkOKBp config -state disabled
				if {$Para(EnCLKOK) == 1} {set Para(ClkOKBp) 1}	
			}
			if {$Para(ClkOKBp) == 1}  {
				$frmClkOK.frame2.rdoClkPAsIn config -state disabled 
				$frmClkOK.frame2.rdoClkSAsIn config -state disabled
				$frmClkOK.frame21.entU_KFrq config -state disabled
				$frmClkOK.frame21.cboOK_Tol config -state disabled
				$frmClkOK.frame21.entKFrq   config -state disabled
				$frmClkOK.cbClkRst  config -state disable
				set Para(ClkRst) 0
			} else  {
				$frmClkOK.frame21.entU_KFrq config -state normal
				$frmClkOK.frame21.cboOK_Tol config -state normal
				$frmClkOK.frame21.entKFrq   config -state normal
				$frmClkOK.cbClkRst  config -state normal
			}
		} 
	} else {
	#Divider Mode
		$frmClkI.frmTop.cboMDiv config -state normal
		$frmClkFB.cboNDiv config -state normal
		$frmClkOPOS.cboVDiv config -state normal
		$frmClkOK.frame21.cboKDiv config -state normal -foreground black
		$frmClkOPOS.entU_OFrq config -state disabled -foreground gray50
		$frmClkOPOS.cboOP_Tol config -state disabled -foreground gray50
		$frmClkOK.frame21.entU_KFrq config -state disabled -foreground gray50
		$frmClkOK.frame21.cboOK_Tol config -state disabled -foreground gray50
		if {$Para(PhaseDuty) == "Dynamic"} {
			$frmTrimP.rdoTrimP0 config -state normal
			$frmTrimP.rdoTrimP1 config -state normal
			$frmTrimP.cboDelayMultP config -state normal
			if {$Para(DutyTrimP) == "Rising"} {
				$frmTrimP.cboDelayMultP clear list
				$frmTrimP.cboDelayMultP insert list end 0 1 2 3 4 5 6 7
			} else {
				$frmTrimP.cboDelayMultP clear list
				$frmTrimP.cboDelayMultP insert list end 0 1 2 3 4 5 6 7
			}
		} else {
			$frmTrimP.rdoTrimP0 config -state disable
			$frmTrimP.rdoTrimP1 config -state disable
			$frmTrimP.cboDelayMultP config -state disabled
		}
		if {$Para(ClkOPBp) == 1}  {
			$frmClkOPOS.cboVDiv config -state disabled
			$frmTrimP.rdoTrimP0 config -state disable
			$frmTrimP.rdoTrimP1 config -state disable
			$frmTrimP.cboDelayMultP config -state disabled
		} 
		if {$Para(EnCLKOK) == 0}  {
			$frmClkOK.frame20.cbClkOKBp config -state disabled
			$frmClkOK.frame2.rdoClkPAsIn config -state disabled 
			$frmClkOK.frame2.rdoClkSAsIn config -state disabled
			set Para(ClkOKBp) 0
			$frmClkOK.frame21.cboKDiv   config -state disabled
			$frmClkOK.frame21.entKFrq   config -state disabled
			$frmClkOK.cbClkRst  config -state disable
			set Para(ClkRst) 0
		} else  {
			$frmClkOK.frame20.cbClkOKBp config -state normal
			$frmClkOK.frame2.rdoClkPAsIn config -state normal 
			$frmClkOK.frame2.rdoClkSAsIn config -state normal
			#10 b. If (※CLKOP Bypass = TRUE§ and ※CLKOS Bypass = TRUE§):
			if {$Para(ClkOPBp) == 1 && $Para(ClkOSBp) == 1} {
				$frmClkOK.frame20.cbClkOKBp config -state disabled
				if {$Para(EnCLKOK) == 1} {set Para(ClkOKBp) 1}	
			}
			if {$Para(ClkOKBp) == 1}  {
				$frmClkOK.frame2.rdoClkPAsIn config -state disabled 
				$frmClkOK.frame2.rdoClkSAsIn config -state disabled
				$frmClkOK.frame21.cboKDiv   config -state disabled
				$frmClkOK.cbClkRst  config -state disable
				set Para(ClkRst) 0
			} else  {
				$frmClkOK.frame21.cboKDiv   config -state normal
				$frmClkOK.frame21.entKFrq   config -state normal
				$frmClkOK.cbClkRst  config -state normal
			}
		} 
	} 
	$frmStatic.frame111.cboPhase config -state normal -foreground black
	$frmStatic.frame111.cboDuty  config -state normal -foreground black
	$frmStatic.cboDelayMultS config -state normal -foreground black
	$frmClkOK.frame21.entKFrq  config -state disabled -foreground black -disabledforeground black

	#.cbDDC	  config -state normal

	if {$Para(EnCLKOS) == 0}  {
		$frmClkOS.frame1.cbClkOSBp config -state disabled
		set Para(ClkOSBp) 0
		$frmStatic.frame111.cboPhase  config -state disabled
		$frmStatic.frame111.cboDuty   config -state disabled
		$frmStatic.cboDelayMultS config -state disabled
		$frmDynamic.rdoDPD0   config -state disable
		$frmDynamic.rdoDPD1   config -state disable
		$frmDutyTrim.rdoDutyTrim0 config -state disable
		$frmDutyTrim.rdoDutyTrim1 config -state disable
		$frmDutyTrim.cboDelayMultD config -state disabled
		$frmClkOS.cbClkOSDelay config -state disable
		set Para(ClkOSDelay) 0

		if {$Para(EnCLKOK) == 1 && $Para(ClkOKBp) == 0} {
			$frmClkOK.frame2.rdoClkSAsIn config -state disable
			set Para(CLKOK_INPUT) CLKOP
		}
	} else  {
		$frmClkFB.cboFB_Mode clear list
		$frmClkFB.cboFB_Mode insert list end Internal CLKOP CLKOS "User Clock"

		$frmClkOS.frame1.cbClkOSBp config -state normal
		if {$Para(ClkOSBp) == 1}  {
			$frmStatic.frame111.cboPhase  config -state disabled
			$frmStatic.frame111.cboDuty   config -state disabled
			$frmStatic.cboDelayMultS config -state disabled
			$frmDynamic.rdoDPD0   config -state disable
			$frmDynamic.rdoDPD1   config -state disable
			$frmDutyTrim.rdoDutyTrim0 config -state disable
			$frmDutyTrim.rdoDutyTrim1 config -state disable
			$frmDutyTrim.cboDelayMultD config -state disabled
			$frmClkOS.cbClkOSDelay config -state disable
			set Para(ClkOSDelay) 0
			
			if {$Para(EnCLKOK) == 1 && $Para(ClkOKBp) == 0} {
				$frmClkOK.frame2.rdoClkSAsIn config -state disable
				set Para(CLKOK_INPUT) CLKOP
			}
		} else {
			if {$Para(PhaseDuty) == "Static"} {
				$frmStatic.frame111.cboPhase  config -state normal
				$frmStatic.frame111.cboDuty   config -state normal
				$frmStatic.cboDelayMultS config -state normal
				$frmDynamic.rdoDPD0   config -state disable
				$frmDynamic.rdoDPD1   config -state disable
				$frmDutyTrim.rdoDutyTrim0 config -state disable
				$frmDutyTrim.rdoDutyTrim1 config -state disable
				$frmDutyTrim.cboDelayMultD config -state disabled
			} else {
				$frmStatic.frame111.cboPhase  config -state disabled
				$frmStatic.frame111.cboDuty   config -state disabled
				$frmStatic.cboDelayMultS config -state disabled
				$frmDynamic.rdoDPD0   config -state normal
				$frmDynamic.rdoDPD1   config -state normal
				$frmDutyTrim.rdoDutyTrim0 config -state normal
				$frmDutyTrim.rdoDutyTrim1 config -state normal
				$frmDutyTrim.cboDelayMultD config -state normal
				if {$Para(DutyTrimS) == "Rising"} {
					$frmDutyTrim.cboDelayMultD clear list
					$frmDutyTrim.cboDelayMultD insert list end 0 1 2 3
				} else {
					$frmDutyTrim.cboDelayMultD clear list
					$frmDutyTrim.cboDelayMultD insert list end 0 1 2 3
				}
			}
			$frmClkOS.cbClkOSDelay config -state normal

			if {$Para(EnCLKOK) == 1 && $Para(ClkOKBp) == 0} {
				$frmClkOK.frame2.rdoClkSAsIn config -state normal
				#set Para(CLKOK_INPUT) CLKOP
			}
		} 
	}

	#4 + #10
	if {$Para(ClkOPBp) == 1}  {
		if {$Para(EnCLKOS) == 0}  {
			$frmClkFB.cboFB_Mode clear list
			$frmClkFB.cboFB_Mode insert list end "User Clock"
			set Para(fb_mode) "User Clock"
		} else {
			if {$Para(ClkOSBp) == 1}  {
				$frmClkFB.cboFB_Mode clear list
				$frmClkFB.cboFB_Mode insert list end "User Clock"
				set Para(fb_mode) "User Clock"
			} else {
				$frmClkFB.cboFB_Mode clear list
				$frmClkFB.cboFB_Mode insert list end CLKOS "User Clock"
				if {$Para(fb_mode) == "CLKOP" || $Para(fb_mode) == "Internal"} {set Para(fb_mode) CLKOS}
				if {$Para(EnCLKOK) == 1} {
					$frmClkOK.frame2.rdoClkPAsIn config -state disabled
				}
			}
		}
	} else {
		if {$Para(EnCLKOS) == 0}  {
			$frmClkFB.cboFB_Mode clear list
			$frmClkFB.cboFB_Mode insert list end Internal CLKOP "User Clock"
			if {$Para(fb_mode) == "CLKOS"} {set Para(fb_mode) CLKOP}
		} else {
			if {$Para(ClkOSBp) == 1}  {
				$frmClkFB.cboFB_Mode clear list
				$frmClkFB.cboFB_Mode insert list end Internal CLKOP "User Clock"
				if {$Para(fb_mode) == "CLKOS"} {set Para(fb_mode) CLKOP}
			} else {
				$frmClkFB.cboFB_Mode clear list
				$frmClkFB.cboFB_Mode insert list end Internal CLKOP CLKOS "User Clock"
			}
		}
	}

	#9. (CLKOS Enable = TRUE and CLKOS Bypass = FALSE).
	if {$Para(EnCLKOS) == 1 && $Para(ClkOSBp) == 0} {
		$win.frmLeft1.cbFINDELA config -state normal
	} else {
		$win.frmLeft1.cbFINDELA config -state disabled
		set Para(FINDELA) 0
	}
	
	#12.
	if {$Para(ClkOPBp) == 1 && $Para(ClkOSBp) == 1} {
		$win.frmLeft1.frmMode.rdoNormal config -state disabled
		$win.frmLeft1.frmMode.rdoAdvanced config -state disabled
		
		$frmClkFB.cboFB_Mode config -state disabled
		$frmClkFB.cboNDiv config -state disabled
		
		$frmPhaseDuty.rdoP_D0 config -state disabled
		$frmPhaseDuty.rdoP_D1 config -state disabled
		
		$win.frmLeft1.cbPCDR config -state disabled
		set Para(PCDR) 0
		
		$frmClkOPOS.cboVDiv config -state disabled
		$frmClkOPOS.entU_OFrq config -state disabled -foreground gray50
		$frmClkOPOS.cboOP_Tol config -state disabled -foreground gray50
	} else {
		$win.frmLeft1.frmMode.rdoNormal config -state normal
		$win.frmLeft1.frmMode.rdoAdvanced config -state normal
		
		$frmClkFB.cboFB_Mode config -state normal
		
		$frmPhaseDuty.rdoP_D0 config -state normal
		$frmPhaseDuty.rdoP_D1 config -state normal
		
		$win.frmLeft1.cbPCDR config -state normal

		if {$Para(mode) == "normal"} {
			$frmClkFB.cboNDiv config -state disabled

			$frmClkOPOS.cboVDiv config -state disabled
			$frmClkOPOS.entU_OFrq config -state normal -foreground black
			$frmClkOPOS.cboOP_Tol config -state normal -foreground black
		} else {
			$frmClkFB.cboNDiv config -state normal

			$frmClkOPOS.cboVDiv config -state normal
			$frmClkOPOS.entU_OFrq config -state disabled -foreground gray50
			$frmClkOPOS.cboOP_Tol config -state disabled -foreground gray50
		}
	}

	#ISPL_CR_36005  10 每 435 MHz
	set min 4.0000
	set max 500.0000
	if {$Para(IFrq) < 2.0000 || $Para(IFrq) > $max} {
		$frmClkI.frmTop.entIFrq.lwchildsite.entry config -fg red
	} else  {
		$frmClkI.frmTop.entIFrq.lwchildsite.entry config -fg black
	} 
	if {$Para(mode) == "normal"}  {
		if {$Para(U_OFrq) < $min || $Para(U_OFrq) > $max} {
			$frmClkOPOS.entU_OFrq.lwchildsite.entry config -fg red
		} else  {
			$frmClkOPOS.entU_OFrq.lwchildsite.entry config -fg black
		} 

		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"}  {
			if {$Para(U_KFrq) < 0.03125 || $Para(U_KFrq) > 250.0000} {
				$frmClkOK.frame21.entU_KFrq.lwchildsite.entry config -fg red
			} else  {
				$frmClkOK.frame21.entU_KFrq.lwchildsite.entry config -fg black
			} 
		} 
	} 

	set m [string trim $Para(Div)]
	set n [string trim $Para(Mult)]
	set v [string trim $Para(Post)]
	set k [string trim $Para(SecD)]
	if {[string is integer $m] == 1}  {
		$frmClkI.frmTop.cboMDiv.lwchildsite.entry config -fg black
	} 
	if {[string is integer $n] == 1}  {
		$frmClkFB.cboNDiv.lwchildsite.entry config -fg black
	} 
	if {[string is integer $v] == 1}  {
		$frmClkOPOS.cboVDiv.lwchildsite.entry config -fg black
	} 
	if {[string is integer $k] == 1}  {
		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"} {
			$frmClkOK.frame21.cboKDiv.lwchildsite.entry config -fg black
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

	#ISPL_CR_36005  10 每 435 MHz
	set min 4.0000
	set max 500.0000
	set ret [IsInRange "CLKI Frequency" 2.0000 $max $Para(IFrq)]
	if {$ret == -1} {return -1}
	if {$Para(mode) == "normal"}  {
		set ret [IsInRange "CLKOP Frequency" $min $max $Para(U_OFrq)]
		if {$ret == -1} {return -1}

		#0.03125每 250
		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"}  {
			set ret [IsInRange "CLKOK Frequency" 0.03125 250.0000 $Para(U_KFrq)]
			if {$ret == -1} {return -1}
		} 
	} 

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
		set ret [IsInRange "Duty Cycle Selection" 2 14 $Para(Duty)]
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
	set ret [CheckMg5g00Para]
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
	set str "-arch $Para(arch) -type pll -fin $Para(IFrq)"
	#28059 + 32391
	set u_ofrq $Para(U_OFrq)
	set u_kfrq $Para(U_KFrq)
	lappend str -phase_cntl [string toupper $Para(PhaseDuty)]
	if {$Para(ClkOPBp) == 1}  {
		lappend str -bypassp
		#-clkoki 0
		set u_ofrq $Para(IFrq)
	} else {
		if {$Para(PhaseDuty) == "Dynamic"} {
			if {$Para(DutyTrimP) == "Rising"} {
				#set tmp [expr 1*$Para(DelayMultP)]
				if {$Para(DelayMultP) != 0} {lappend str -trimp [expr 1*$Para(DelayMultP)]}
			} else {
				#set tmp [expr -1*$Para(DelayMultP)]
				lappend str -trimp [expr -1*$Para(DelayMultP)]
			}
		}
		#if {$Para(PhaseDuty) == "Dynamic"} {lappend str -trimp $tmp}
	}
	if {$Para(ClkOSBp) == 1}  {
		lappend str -bypasss 
		#if {$Para(ClkOPBp) == 0} {lappend str -clkoki 1}
	} 
	if {$Para(ClkOKBp) == 1}  {lappend str -bypassk;set u_kfrq $Para(IFrq)} 
	if {$Para(mode)=="normal"} {
		lappend str -fclkop $u_ofrq -fclkop_tol $Para(OP_Tol)
	} else  {
		lappend str -mdiv $Para(Div) -ndiv $Para(Mult) -vdiv $Para(Post)
	} 
	switch $Para(fb_mode)  {
		"Internal"   {lappend str -fb_mode INTERNAL}
		"CLKOP"      {lappend str -fb_mode CLOCKTREE}
		"CLKOS"      {lappend str -fb_mode CLKOS}
		"User Clock" {lappend str -fb_mode USERCLOCK}
	}

	if {$Para(EnCLKOS) == 0}  {
		lappend str -noclkos
	} else  {
		if {$Para(PhaseDuty) == "Dynamic"} {
			if {$Para(DutyTrimS) == "Rising"} {
				#set tmp [expr 1*$Para(DelayMultS)]
				if {$Para(DelayMultD) != 0} {lappend str -trims [expr 1*$Para(DelayMultD)]}
			} else {
				#set tmp [expr -1*$Para(DelayMultS)]
				lappend str -trims [expr -1*$Para(DelayMultD)]
			}
			#lappend str -trims $tmp
			if {$Para(DPD) == "50% Duty"} {lappend str -duty50}
		} else {
			#phase + 360*delayMult
			set x [expr $Para(Phase)+360*$Para(DelayMultS)]
			lappend str -phaseadj $x -duty $Para(Duty)
		}
		if {$Para(ClkOSDelay) == 1} {lappend str -fdel 1}
	} 

	if {$Para(EnCLKOK) == 0}  {
		lappend str -noclkok
	} else  {
		if {$Para(mode)=="normal"} {
			lappend str -fclkok $u_kfrq -fclkok_tol $Para(OK_Tol)
		} else  {
			lappend str -kdiv $Para(SecD) 
		} 	   
		if {$Para(ClkOKBp) == 0} {
			if {$Para(CLKOK_INPUT) == "CLKOP"} {
				lappend str -clkoki 0
			} else {
				lappend str -clkoki 1
			}
		}
		if {$Para(ClkRst) == 1}  {lappend str -rstk}
	} 

	#28113 + 29210
	if {$Para(PCDR) == 1}  {
		lappend str -use_rst
	} else {
		lappend str -norst
	}
	if {$Para(enClkOK2) == 0} {lappend str -noclkok2}
	
	#ISPL_CR_38623
	if {$Para(FINDELA) == 1} {lappend str -fdel 1}
	
	lappend str -bw

	#tk_messageBox -default ok -icon warning -message $str -title "GenerateCB" -type ok
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
set frmProperty [.frmProperties childsite]
set win [.sf childsite]	
set frmClkI [$win.frmLeft1.frmClkI childsite]
set frmClkOPOS [$win.frmRight1.frmClkOPOS childsite]
set frmClkOP [$win.frmRight1.frmClkOP childsite]
set frmTrimP [$frmClkOP.frmTrimP childsite]
set frmClkFB [$win.frmLeft1.frmClkFB childsite]
set frmClkOS [$win.frmRight1.frmClkOS childsite]
set frmStatic [$frmClkOS.frame11.frmStatic childsite]
set frmDynamic [$frmClkOS.frmDynamic childsite]
set frmDutyTrim [$frmClkOS.frmDutyTrim childsite]
set frmPhaseDuty [$win.frmLeft1.frmPhaseDuty childsite]
set frmClkOK [$win.frmRight1.frmClkOK childsite]

#	You could call scuba with a specific option (such as "-cal "), and the 
#	DIV values and the Freq values can be written to the stdout.
#		Div: 1,2,3,4
#		Freq: 100.000, 100.000
#		Extcap: 0
#		bw: 2.191564

	# 28067 : 1< IFrq <420, 3.28< U_OFrq <420;
	#ISPL_CR_36005  10 每 435 MHz
	set min 4.0000
	set max 500.0000
	set ret [IsInRange "CLKI Frequency" 2.0000 $max $Para(IFrq)]
	if {$ret == -1} {
		$frmClkI.frmTop.entIFrq.lwchildsite.entry config -fg red
		set Para(BoolFlag) 0
		return -1
	}
	if {$Para(mode) == "normal"}  {
		set ret [IsInRange "CLKOP Frequency" $min $max $Para(U_OFrq)]
		if {$ret == -1} {
			$frmClkOPOS.entU_OFrq.lwchildsite.entry config -fg red
			set Para(BoolFlag) 0
			return -1
		}

		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"}  {
			set ret [IsInRange "CLKOK Frequency" 0.03125 250.0000 $Para(U_KFrq)]
			if {$ret == -1} {
				$frmClkOK.frame21.entU_KFrq.lwchildsite.entry config -fg red
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
	set bw_str [lindex $stdout_str 3]
	set bw [split [string range $bw_str [expr [string first : $bw_str]+1] end] ,]

	set Para(Div)  [string trim [lindex $div 0]]
	set Para(Mult) [string trim [lindex $div 1]]
	set Para(Post) [string trim [lindex $div 2]]
	set Para(OFrq) [string trim [lindex $freq 0]]
	set Para(Bandwidth) [string trim [lindex $bw 0]]
	# 25352
	if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"}  {
		if {$Para(EnCLKOK) == 1}  {
			set Para(SecD) [string trim [lindex $div 3]]
			set Para(KFrq) [string trim [lindex $freq 1]]
		} 
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
	} else  {
		$Para(generate_cfg) configure -state disabled
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
	AttributeSetting 580 440
	set pin_flag 1
	DrawImage 220 400
	set tnb $Para(tnb)

		set Para(BoolFlag) 0

		wm title . "Lattice Module -- PLL"
	#*** Here for user to add extra pages ***
	#--- Page #1 ---
		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties
		set frmProperty [.frmProperties childsite]

iwidgets::scrolledframe .sf -width 560 -height 400 -vscrollmode dynamic -hscrollmode dynamic
set win [.sf childsite]		

		frame $win.frmLeft1
		frame $win.frmRight1

		#*** PLL Type ***
		iwidgets::combobox $win.frmLeft1.cboPllType -labeltext "PLL Type" -width 10 -textvariable Para(Type) -editable false -selectioncommand {EditFreq;CallDrawPins}
		$win.frmLeft1.cboPllType insert list end epllb ehxpllb

		frame $win.frmLeft1.frmMode
		radiobutton $win.frmLeft1.frmMode.rdoNormal   -text "Frequency Mode" -command {EditFreq;CallDrawPins} -variable Para(mode) -value normal
		radiobutton $win.frmLeft1.frmMode.rdoAdvanced -text "Divider Mode"   -command {EditFreq;CallDrawPins} -variable Para(mode) -value advanced
		pack $win.frmLeft1.frmMode.rdoNormal $win.frmLeft1.frmMode.rdoAdvanced -in $win.frmLeft1.frmMode -side top -anchor w -pady 4

		#*** CLKI Frequency ***
		iwidgets::Labeledframe $win.frmLeft1.frmClkI -labeltext "CLKI" -labelpos nw
		set frmClkI [$win.frmLeft1.frmClkI childsite]
		frame $frmClkI.frmTop
		iwidgets::entryfield $frmClkI.frmTop.entIFrq -labeltext "\nFrequency" -labelpos n -width 13 -textvariable Para(IFrq) -validate real
		iwidgets::combobox   $frmClkI.frmTop.cboMDiv -labeltext "\nDivider"   -labelpos n -width 6  -textvariable Para(Div) -editable false -selectioncommand EditFreq
		for {set i 1} {$i<65} {incr i}  {
			$frmClkI.frmTop.cboMDiv insert list end $i
		} 
		pack $frmClkI.frmTop.entIFrq $frmClkI.frmTop.cboMDiv -in $frmClkI.frmTop -side left -padx 2 -fill x
		$frmClkI.frmTop.entIFrq.lwchildsite.entry config -validate key -vcmd {
			after idle {EditFreq;CallDrawPins}
			return 1
		}
		frame $frmClkI.frmBottom
		label $frmClkI.frmBottom.lblBandwidth -text "Approximate\nBandwidth"
		iwidgets::entryfield $frmClkI.frmBottom.entBandwidth -labeltext "MHz" -labelpos e -width 12 -textvariable Para(Bandwidth) -state disabled
		pack $frmClkI.frmBottom.lblBandwidth $frmClkI.frmBottom.entBandwidth -in $frmClkI.frmBottom -side left -padx 2 -fill x
		
		pack $frmClkI.frmTop $frmClkI.frmBottom -in $frmClkI -side top -anchor w -fill x

		#*** CLKOP Frequency ***
		#CLKOP/CLKOS
		iwidgets::Labeledframe $win.frmRight1.frmClkOPOS -labeltext "CLKOP/CLKOS(Non Bypass Mode)" -labelpos nw
		set frmClkOPOS [$win.frmRight1.frmClkOPOS childsite]
		#frame $frmClkOPOS.frmP1
		iwidgets::combobox   $frmClkOPOS.cboVDiv   -labeltext "\nDivider"            -labelpos n -width 6  -textvariable Para(Post) -editable false -selectioncommand EditFreq
		iwidgets::entryfield $frmClkOPOS.entU_OFrq -labeltext "Desired\nFrequency" -labelpos n -width 12 -textvariable Para(U_OFrq) -validate real
		iwidgets::combobox   $frmClkOPOS.cboOP_Tol -labeltext "\nTolerance"          -labelpos n -width 8  -textvariable Para(OP_Tol) -editable false -selectioncommand EditFreq
		iwidgets::entryfield $frmClkOPOS.entOFrq   -labeltext "Actual\nFrequency"    -labelpos n -width 12 -textvariable Para(OFrq) -fixed 10 -state disabled -disabledforeground black
		#ISPL_CR_29211
		$frmClkOPOS.cboVDiv insert list end 2 4 8 16 32 48 64 80 96 112 128
		#24674
		$frmClkOPOS.cboOP_Tol insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
		pack $frmClkOPOS.cboVDiv $frmClkOPOS.entU_OFrq $frmClkOPOS.cboOP_Tol $frmClkOPOS.entOFrq -in $frmClkOPOS -side left -padx 2 -fill x
		$frmClkOPOS.entU_OFrq.lwchildsite.entry config -validate key -vcmd {
			after idle {EditFreq;CallDrawPins}
			return 1
		}
		
		#CLKOP
		iwidgets::Labeledframe $win.frmRight1.frmClkOP -labeltext "CLKOP" -labelpos nw
		set frmClkOP [$win.frmRight1.frmClkOP childsite]
		checkbutton $frmClkOP.cbClkOPBp -text "Bypass (CLKOP=CLKI)" -variable Para(ClkOPBp) -command {EditFreq;CallDrawPins}
		pack $frmClkOP.cbClkOPBp -in $frmClkOP -anchor e -padx 12

		iwidgets::Labeledframe $frmClkOP.frmTrimP -labeltext "Duty Trim Options(Dynamic Mode)" -labelpos nw
		set frmTrimP [$frmClkOP.frmTrimP childsite]
		radiobutton $frmTrimP.rdoTrimP0 -text "Rising" -variable Para(DutyTrimP) -value Rising -command {EditFreq;CallDrawPins}
		radiobutton $frmTrimP.rdoTrimP1 -text "Falling" -variable Para(DutyTrimP) -value Falling -command {EditFreq;CallDrawPins}
		iwidgets::combobox $frmTrimP.cboDelayMultP -labeltext "Delay Multiplier" -width 6 -textvariable Para(DelayMultP) -editable false -selectioncommand EditFreq
		pack $frmTrimP.rdoTrimP0 $frmTrimP.rdoTrimP1 $frmTrimP.cboDelayMultP -in $frmTrimP -side left -padx 2
		$frmTrimP.cboDelayMultP insert list end 0 1 2 3 4 5 6 7
		
		pack $frmClkOP.frmTrimP -in $frmClkOP -fill x -anchor w

		#*** CLKFB ***
		iwidgets::Labeledframe $win.frmLeft1.frmClkFB -labeltext "CLKFB" -labelpos nw
		set frmClkFB [$win.frmLeft1.frmClkFB childsite]
		#25228
		iwidgets::combobox $frmClkFB.cboFB_Mode -labeltext "Feedback\nMode" -labelpos n -width 12 -textvariable Para(fb_mode) -editable false -selectioncommand {EditFreq;CallDrawPins}
		iwidgets::combobox $frmClkFB.cboNDiv    -labeltext "\nDivider"      -labelpos n -width 6  -textvariable Para(Mult) -editable false -selectioncommand EditFreq
		$frmClkFB.cboFB_Mode insert list end Internal CLKOP CLKOS "User Clock"
		for {set i 1} {$i<65} {incr i}  {
			$frmClkFB.cboNDiv insert list end $i
		} 
		pack $frmClkFB.cboFB_Mode $frmClkFB.cboNDiv -in $frmClkFB -side left -padx 2 -fill x

		#*** CLKOS ***
		iwidgets::Labeledframe $win.frmRight1.frmClkOS -labeltext "CLKOS" -labelpos nw
		set frmClkOS [$win.frmRight1.frmClkOS childsite]
		# 26615
		frame $frmClkOS.frame1
		checkbutton $frmClkOS.frame1.cbEnCLKOS -text "Enable CLKOS" -variable Para(EnCLKOS) -command {EditFreq;CallDrawPins}
		checkbutton $frmClkOS.frame1.cbClkOSBp -text "Bypass (CLKOS=CLKI)" -variable Para(ClkOSBp) -command {EditFreq;CallDrawPins}
		pack $frmClkOS.frame1.cbEnCLKOS -in $frmClkOS.frame1 -side left
		pack $frmClkOS.frame1.cbClkOSBp -in $frmClkOS.frame1 -side right -anchor e
		pack $frmClkOS.frame1 -in $frmClkOS -anchor w -padx 12 -fill x

		frame $frmClkOS.frame11
		iwidgets::Labeledframe $frmClkOS.frame11.frmStatic -labeltext "Phase & Duty Options(Static Mode)" -labelpos nw
		set frmStatic [$frmClkOS.frame11.frmStatic childsite]
		
		frame $frmStatic.frame111
		iwidgets::combobox $frmStatic.frame111.cboPhase -labeltext "Phase Shift (degree)" -labelpos n -width 6 -textvariable Para(Phase) -editable false -selectioncommand EditFreq
		#28088
		iwidgets::combobox $frmStatic.frame111.cboDuty  -labeltext "Duty Cycle (*1/16)" -labelpos n -width 6 -textvariable Para(Duty) -editable false -selectioncommand EditFreq
		$frmStatic.frame111.cboPhase insert list end 0.0 22.5 45.0 67.5 90.0 112.5 135.0 157.5 180.0 202.5 225.0 247.5 270.0 292.5 315.0 337.5
		$frmStatic.frame111.cboDuty  insert list end 2 3 4 5 6 7 8 9 10 11 12 13 14
		pack $frmStatic.frame111.cboPhase $frmStatic.frame111.cboDuty -in $frmStatic.frame111 -side left -padx 4

		iwidgets::combobox $frmStatic.cboDelayMultS -labeltext "Delay Multiplier" -width 6 -textvariable Para(DelayMultS) -editable false -selectioncommand EditFreq
		$frmStatic.cboDelayMultS insert list end 0 1 2 3 4 5 6 7 8  9 10 11 12 13 14 15
		pack $frmStatic.frame111 $frmStatic.cboDelayMultS -in $frmStatic -pady 4

		label $frmClkOS.frame11.lblClkOS -text "Actual\nFrequency\nSame as\nCLKOP" -justify left
		pack $frmClkOS.frame11.frmStatic $frmClkOS.frame11.lblClkOS -in $frmClkOS.frame11 -side left -fill x

		iwidgets::Labeledframe $frmClkOS.frmDynamic -labeltext "Phase & Duty Options(Dynamic Mode)" -labelpos nw
		set frmDynamic [$frmClkOS.frmDynamic childsite]
		radiobutton $frmDynamic.rdoDPD0 -text "Dynamic Phase with\n50% Duty" -variable Para(DPD) -value "50% Duty" -command {EditFreq;CallDrawPins}
		radiobutton $frmDynamic.rdoDPD1 -text "Dynamic Phase with\nDynamic Duty" -variable Para(DPD) -value "Dynamic Duty" -command {EditFreq;CallDrawPins}
		pack $frmDynamic.rdoDPD0 $frmDynamic.rdoDPD1 -in $frmDynamic -side left -padx 4
		
		iwidgets::Labeledframe $frmClkOS.frmDutyTrim -labeltext "Duty Trim Options(Dynamic Mode)" -labelpos nw
		set frmDutyTrim [$frmClkOS.frmDutyTrim childsite]
		radiobutton $frmDutyTrim.rdoDutyTrim0 -text "Rising" -variable Para(DutyTrimS) -value Rising -command {EditFreq;CallDrawPins}
		radiobutton $frmDutyTrim.rdoDutyTrim1 -text "Falling" -variable Para(DutyTrimS) -value Falling -command {EditFreq;CallDrawPins}
		iwidgets::combobox $frmDutyTrim.cboDelayMultD -labeltext "Delay Multiplier" -width 6 -textvariable Para(DelayMultD) -editable false -selectioncommand EditFreq
		pack $frmDutyTrim.rdoDutyTrim0 $frmDutyTrim.rdoDutyTrim1 $frmDutyTrim.cboDelayMultD -in $frmDutyTrim -side left -padx 2
		$frmDutyTrim.cboDelayMultD insert list end 0 1 2 3
		
		checkbutton $frmClkOS.cbClkOSDelay -text "Provide CLKOS Fine Delay" -variable Para(ClkOSDelay) -command {EditFreq;CallDrawPins}

		pack $frmClkOS.frame11 $frmClkOS.frmDynamic $frmClkOS.frmDutyTrim -in $frmClkOS -side top -fill x
		#pack $frmClkOS.cbClkOSDelay -in $frmClkOS -anchor w

		iwidgets::Labeledframe $win.frmLeft1.frmPhaseDuty -labeltext "PLL Phase & Duty Options" -labelpos nw
		set frmPhaseDuty [$win.frmLeft1.frmPhaseDuty childsite]
		radiobutton $frmPhaseDuty.rdoP_D0 -text "Static Mode" -command {EditFreq;CallDrawPins} -variable Para(PhaseDuty) -value Static
		radiobutton $frmPhaseDuty.rdoP_D1 -text "Dynamic Mode" -command {EditFreq;CallDrawPins} -variable Para(PhaseDuty) -value Dynamic
		pack $frmPhaseDuty.rdoP_D0 $frmPhaseDuty.rdoP_D1 -in $frmPhaseDuty -side top -anchor w
		
		#*** Delay Adjust ***
#		iwidgets::Labeledframe .frmDelay -labeltext "CLKOS Delay Adjust" -labelpos nw
#		set frmDelay [.frmDelay childsite]
#		radiobutton .rdoDelay0 -text "Dynamic Delay" -command {EditFreq;CallDrawPins} -variable Para(DelayControl) -value Dynamic
#		radiobutton .rdoDelay1 -text "Static Delay" -command {EditFreq;CallDrawPins} -variable Para(DelayControl) -value Static
#		radiobutton .rdoDelay2 -text "No Delay" -command {EditFreq;CallDrawPins} -variable Para(DelayControl) -value No
#		pack .rdoDelay2 .rdoDelay1 .rdoDelay0 -in $frmDelay -side top -anchor w

		#*** CLKOK Frequency ***
		iwidgets::Labeledframe $win.frmRight1.frmClkOK -labeltext "CLKOK" -labelpos nw
		set frmClkOK [$win.frmRight1.frmClkOK childsite]

		frame $frmClkOK.frame20
		checkbutton $frmClkOK.frame20.cbEnCLKOK -text "Enable CLKOK" -variable Para(EnCLKOK) -command {EditFreq;CallDrawPins}
		checkbutton $frmClkOK.frame20.cbClkOKBp -text "Bypass (CLKOK=CLKI)" -variable Para(ClkOKBp) -command {EditFreq;CallDrawPins}
		pack $frmClkOK.frame20.cbEnCLKOK -in $frmClkOK.frame20 -side left
		pack $frmClkOK.frame20.cbClkOKBp -in $frmClkOK.frame20 -side right -anchor e
		pack $frmClkOK.frame20 -in $frmClkOK -anchor w -padx 12 -fill x
		
		frame $frmClkOK.frame2
		radiobutton $frmClkOK.frame2.rdoClkPAsIn -text "CLKOP as Input" -command {EditFreq;CallDrawPins} -variable Para(CLKOK_INPUT) -value CLKOP
		radiobutton $frmClkOK.frame2.rdoClkSAsIn -text "CLKOS as Input" -command {EditFreq;CallDrawPins} -variable Para(CLKOK_INPUT) -value CLKOS
		pack $frmClkOK.frame2.rdoClkPAsIn $frmClkOK.frame2.rdoClkSAsIn -in $frmClkOK.frame2 -side left -padx 10
		
		frame $frmClkOK.frame21
		iwidgets::combobox   $frmClkOK.frame21.cboKDiv   -labeltext "\nDivider"            -labelpos n -width 6  -textvariable Para(SecD) -editable false -selectioncommand EditFreq
		iwidgets::entryfield $frmClkOK.frame21.entU_KFrq -labeltext "Desired\nFrequency" -labelpos n -width 12 -textvariable Para(U_KFrq) -validate real
		iwidgets::combobox   $frmClkOK.frame21.cboOK_Tol -labeltext "\nTolerance"          -labelpos n -width 8  -textvariable Para(OK_Tol) -editable false -selectioncommand EditFreq
		iwidgets::entryfield $frmClkOK.frame21.entKFrq   -labeltext "Actual\nFrequency"    -labelpos n -width 12 -textvariable Para(KFrq) -fixed 10 -state disabled -disabledforeground black
		for {set i 2} {$i<129} {set i [expr $i+2]} {
			$frmClkOK.frame21.cboKDiv insert list end $i
		} 
		#24674
		$frmClkOK.frame21.cboOK_Tol insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
		pack $frmClkOK.frame21.cboKDiv $frmClkOK.frame21.entU_KFrq $frmClkOK.frame21.cboOK_Tol $frmClkOK.frame21.entKFrq -in $frmClkOK.frame21 -side left -padx 2 -fill x
		$frmClkOK.frame21.entU_KFrq.lwchildsite.entry config -validate key -vcmd {
			after idle {EditFreq;CallDrawPins}
			return 1
		}
		checkbutton $frmClkOK.cbClkRst -text "Provide CLKOK Divider Reset" -variable Para(ClkRst) -command {EditFreq;CallDrawPins}
		pack $frmClkOK.frame2 $frmClkOK.frame21 -in $frmClkOK -fill x -anchor w
		pack $frmClkOK.cbClkRst -in $frmClkOK -anchor w

		checkbutton $win.frmLeft1.cbClkOK2 -text "Enable CLKOK2(CLKOP/3)" -variable Para(enClkOK2) -command {EditFreq;CallDrawPins}
		
		button $win.frmLeft1.btnCal -text "Calculate" -width 16 -command {CalculateCmd}

		checkbutton $win.frmLeft1.cbPCDR -text "Provide PLL Reset" -variable Para(PCDR) -command {EditFreq;CallDrawPins}
		checkbutton $win.frmLeft1.cbFINDELA -text "Provide FINDELA Port" -variable Para(FINDELA) -command {EditFreq;CallDrawPins}

#		iwidgets::Labeledframe .frmInfo -labeltext "Info" -labelpos nw
#		set frmInfo [.frmInfo childsite]
#		iwidgets::entryfield $frmInfo.entVcoRate  -labeltext "\nVCO Rate (MHz)" -labelpos n -width 12 -textvariable Para(VcoRate) -fixed 10 -state disabled -disabledforeground black
#		iwidgets::entryfield $frmInfo.entBandwidth  -labeltext "Approximate PLL\nBandwidth (MHz)" -labelpos n -width 12 -textvariable Para(Bandwidth) -fixed 10 -state disabled -disabledforeground black
#		pack $frmInfo.entVcoRate $frmInfo.entBandwidth -in $frmInfo -side left -padx 2 -fill x
		
		pack $win.frmLeft1.frmMode $win.frmLeft1.cboPllType $win.frmLeft1.frmClkI $win.frmLeft1.frmClkFB $win.frmLeft1.frmPhaseDuty -in $win.frmLeft1 -fill x -anchor w -pady 4
#		pack .cbPCDR .cbFINDELA .frmInfo -in $win.frmLeft1 -anchor w -pady 4
		pack $win.frmLeft1.cbPCDR $win.frmLeft1.cbFINDELA -in $win.frmLeft1 -anchor w -pady 4
		pack $win.frmRight1.frmClkOPOS $win.frmRight1.frmClkOP $win.frmRight1.frmClkOS $win.frmRight1.frmClkOK -in $win.frmRight1 -fill x
		pack $win.frmLeft1.cbClkOK2 -in $win.frmLeft1 -anchor w
		pack $win.frmLeft1.btnCal -in $win.frmLeft1 -anchor e
		
pack $win.frmLeft1 $win.frmRight1 -in $win -side left
pack .sf -in $frmProperty -fill both -expand yes	
		pack .frmProperties -in $page -side top -fill both -expand 1

		#17787 - depend on pshin 11/24/03
		set Para(Expression) None
		set Para(Order)      None

		pack forget $win.frmLeft1.cboPllType

		$tnb view 0

	EditFreq

	GeneralConfig
	$Para(generate_cfg) configure -state disabled
}