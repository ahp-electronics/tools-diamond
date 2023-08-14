#$Header: L:/module/pll/latticeecp2m/gui/rcs/core_template.tcl 1.26 2009/09/07 03:36:22Z mghuang Exp $
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
set win [.sf childsite]	
set frmClkI [$win.frmLeft1.frmClkI childsite]
set frmClkOP [$win.frmRight1.frmClkOP childsite]
set frmClkFB [$win.frmLeft1.frmClkFB childsite]
set frmClkOS [$win.frmRight1.frmClkOS childsite]
set frmStatic [$frmClkOS.frame11.frmStatic childsite]
set frmDynamic [$frmClkOS.frmDynamic childsite]
set frmPhaseDuty [$win.frmLeft1.frmPhaseDuty childsite]
set frmDelay [$win.frmLeft1.frmDelay childsite]
set frmClkOK [$win.frmRight1.frmClkOK childsite]
set frmExternal [$win.frmLeft1.frmExternal childsite]
	
	if {$Para(EnCLKOS) == 1 && $Para(ClkOSBp) == 0} {
		set duty [expr $Para(Duty)/16.0]
		if {$duty < 0.5} {
			set min_duty $duty
		} else {
			set min_duty [expr 1-$duty]
		}
		set CLKOS_period [expr $min_duty*1000/$Para(OFrq)]
		if {$CLKOS_period < 1.0} {
			$frmStatic.cboDuty.lwchildsite.entry config -fg red
			set msg "The selected duty cycle causes a minimum pulse width error."
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
			return -1
		} else {
			$frmStatic.cboDuty.lwchildsite.entry config -fg black
		}
	}
	return 0
}

proc ExternalSetting {} {
	global Para
	
	if {[string length $Para(IFrq)] == 0}  {return 0}
	set Fpd [expr $Para(IFrq)/$Para(Div)]
	#b
	if {$Para(DelayControl) == "Dynamic" || $Para(DelayControl) == "Static" || $Para(DelayControl) == "GPLL_NO_DELAY"} {
		#i
		if {$Fpd < "20"} {
			set Para(External) ENABLED
		}
		#ii
		if {$Fpd >= "20"} {
			set Para(External) DISABLED
		}
	}
	#c
	if {$Para(DelayControl) == "SPLL_NO_DELAY"} {
		#i
		if {$Fpd < "33"} {
			set Para(External) ENABLED
		}
		#ii
		if {$Fpd >= "33"} {
			set Para(External) DISABLED
		}
	}
	#d
	if {$Para(DelayControl) == "AUTO_NO_DELAY"} {
		#i
		if {$Fpd < "20"} {
			set Para(External) ENABLED
		}
		#ii
		if {$Fpd >= "20" && $Fpd < "33"} {
			set Para(External) AUTO
		}
		#iii
		if {$Fpd >= "33"} {
			set Para(External) DISABLED
		}
	}
}

proc CheckExtSetting {} {
	global Para
	
	set Fpd [expr $Para(IFrq)/$Para(Div)]
	#b
	if {$Para(DelayControl) == "Dynamic" || $Para(DelayControl) == "Static" || $Para(DelayControl) == "GPLL_NO_DELAY"} {
		#i
		if {$Fpd < "20"} {
			if {$Para(OFrq) < "5" || $Para(OFrq) > "50"} {
				set msg "The selected PLL configuration requires GPLL site with external capacitor \
						 pin enabled. The Actual CLKOP Frequency is outside the operating range \
						 (5 MHz to 50 MHz)."
				tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
				return -1
			} else {
				set msg "The selected PLL configuration requires GPLL site with external capacitor \
						 pin enabled. See PAR report for the placement information."
				tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
				return 0
			}
		}
		#ii
		if {$Fpd >= "20"} {
			set msg "The selected PLL configuration requires GPLL site. See PAR \
					 report for the placement information."
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
			return 0
		}
	}
	#c
	if {$Para(DelayControl) == "SPLL_NO_DELAY"} {
		#i
		if {$Fpd < "33"} {
			if {$Para(OFrq) < "5" || $Para(OFrq) > "50"} {
				set msg "The selected PLL configuration requires SPLL site with external capacitor \
						 pin enabled. The Actual CLKOP Frequency is outside the operating range \
						 (5 MHz to 50 MHz)."
				tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
				return -1
			} else {
				set msg "The selected PLL configuration requires SPLL site with external capacitor \
						 pin enabled. See PAR report for the placement information."
				tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
				return 0
			}
		}
		#ii
		if {$Fpd >= "33"} {
			set msg "The selected PLL configuration requires SPLL site. See PAR \
					 report for the placement information."
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
			return 0
		}
	}
	#d
	if {$Para(DelayControl) == "AUTO_NO_DELAY"} {
		#i
		if {$Fpd < "20"} {
			if {$Para(OFrq) < "5" || $Para(OFrq) > "50"} {
				set msg "The selected PLL configuration requires external capacitor pin enabled \
						 either on SPLL site or GPLL site. The Actual CLKOP Frequency is outside \
						 the operating range (5 MHz to 50MHz)."
				tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
				return -1
			} else {
				set msg "The selected PLL configuration requires external capacitor pin enabled \
						 either on SPLL site or GPLL site. See PAR report for the placement \
						 information."
				tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
				return 0
			}
		}
		#ii
		if {$Fpd >= "20" && $Fpd < "33"} {
			set msg "The selected PLL configuration will be placed either on SPLL site or GPLL \
					 site. If the PLL is placed on SPLL site then external capacitor is required. \
					 See PAR report for the placement information."
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
			return 0
		}
		#iii
		if {$Fpd >= "33"} {
			set msg "The selected PLL configuration will be placed either on SPLL site or GPLL \
					 site. See PAR report for the placement information."
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
			return 0
		}
	}
	
	return 0
}

proc DRC {}  {
	global Para
set win [.sf childsite]	
set frmClkI [$win.frmLeft1.frmClkI childsite]
set frmClkOP [$win.frmRight1.frmClkOP childsite]
set frmClkFB [$win.frmLeft1.frmClkFB childsite]
set frmClkOS [$win.frmRight1.frmClkOS childsite]
set frmStatic [$frmClkOS.frame11.frmStatic childsite]
set frmDynamic [$frmClkOS.frmDynamic childsite]
set frmPhaseDuty [$win.frmLeft1.frmPhaseDuty childsite]
set frmDelay [$win.frmLeft1.frmDelay childsite]
set frmClkOK [$win.frmRight1.frmClkOK childsite]
set frmExternal [$win.frmLeft1.frmExternal childsite]

	set m $Para(Div)
	set n $Para(Mult)
	set v $Para(Post)
	set k $Para(SecD)

	# Divider Mode
	if {$Para(mode) == "advanced"}  {
		if {[string is integer $m] == 0}  {
			$frmClkI.cboMDiv.lwchildsite.entry config -fg red
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
				$frmClkI.cboMDiv.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			}
		} 
		if {[string is integer $n] == 0}  {
			$frmClkFB.cboNDiv.lwchildsite.entry config -fg red
			set n [SetDivider2 $n 1]
			set Para(Mult) $n
			if {[string is integer $v] == 0}  {
				$frmClkOP.cboVDiv.lwchildsite.entry config -fg red
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
			$frmClkOP.cboVDiv.lwchildsite.entry config -fg red
			set v [SetDivider3  $v 1]
			set Para(Post) $v
		} else  {
			if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"} {
				#ISPL_CR_29211
				set ret [IsInList1 "CLKOP Divider" {2 4 8 16 32 48 64 80 96 112 128} $v]
				if {$ret == -1} {
					$frmClkOP.cboVDiv.lwchildsite.entry config -fg red
					set Para(BoolFlag) 0
					return -1
				}
			} else {
				#ISPL_CR_29211
				set ret [IsInList1 "CLKOP Divider" {2 4 8 16 32 48 64 80 96 112 128} $v]
				if {$ret == -1} {
					$frmClkOP.cboVDiv.lwchildsite.entry config -fg red
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
		$frmClkOP.entOFrq.lwchildsite.entry config -fg black
	} 
	
	# Frequency Mode
	if {$Para(mode) == "normal"}  {
		if {$Para(ClkOPBp) == 0} {
			set ret [CheckTolerance "ClkOP" $Para(U_OFrq) $Para(OFrq) $Para(OP_Tol)]
			if {$ret == -1} {
				$frmClkOP.entOFrq.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			} else {
				$frmClkOP.entOFrq.lwchildsite.entry config -fg black
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
	
	set ret [CheckExtSetting]
	if {$ret == -1} {
		set Para(BoolFlag) 0
		return -1
	}
	#ISPL_CR_41790
	ExternalSetting

	set Para(BoolFlag) 1
	return 0
}

proc ChangeValueCmd {} {
	global Para frmProperty in_pins out_pins frmCLKOS

set win [.sf childsite]	
set frmClkI [$win.frmLeft1.frmClkI childsite]
set frmClkOP [$win.frmRight1.frmClkOP childsite]
set frmClkFB [$win.frmLeft1.frmClkFB childsite]
set frmClkOS [$win.frmRight1.frmClkOS childsite]
set frmStatic [$frmClkOS.frame11.frmStatic childsite]
set frmDynamic [$frmClkOS.frmDynamic childsite]
set frmPhaseDuty [$win.frmLeft1.frmPhaseDuty childsite]
set frmDelay [$win.frmLeft1.frmDelay childsite]
set frmClkOK [$win.frmRight1.frmClkOK childsite]
set frmExternal [$win.frmLeft1.frmExternal childsite]
	
	if {$Para(BoolFlag) == "1"}  {
		$Para(generate_cfg) configure -state normal
	} else  {
		$Para(generate_cfg) configure -state disabled
	} 

	if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"} {
	# PLL Type = ehxpllb
		if {$Para(mode) == "normal"}  {
		#Frequency Mode
			$frmClkI.cboMDiv config -state disabled
			$frmClkFB.cboNDiv config -state disabled
			$frmClkOP.cboVDiv config -state disabled
			$frmClkOK.frame21.cboKDiv config -state disabled
			$frmClkOP.entU_OFrq config -state normal -foreground black
			$frmClkOP.cboOP_Tol config -state normal -foreground black
			$frmClkOK.frame21.entU_KFrq config -state normal -foreground black
			$frmClkOK.frame21.cboOK_Tol config -state normal -foreground black
			if {$Para(ClkOPBp) == 1}  {
				$frmClkOP.entU_OFrq config -state disabled
				$frmClkOP.cboOP_Tol config -state disabled
				
				set Para(EnCLKOK) 0
				$frmClkOK.frame2.cbEnCLKOK config -state disabled
				set Para(EnCLKOS) 0
				$frmClkOS.frame1.cbEnCLKOS config -state disabled
				
				$frmClkFB.cboFB_Mode clear list
				$frmClkFB.cboFB_Mode insert list end Internal "User Clock"
				if {[lsearch {Internal "User Clock"} $Para(fb_mode)] == -1} {set Para(fb_mode) Internal}
			} else {
				$frmClkOK.frame2.cbEnCLKOK config -state normal
				$frmClkOS.frame1.cbEnCLKOS config -state normal
				if {$Para(EnCLKOK) == 0}  {
					$frmClkOK.frame2.cbClkOKBp config -state disabled
					set Para(ClkOKBp) 0
					$frmClkOK.frame21.entU_KFrq config -state disabled
					$frmClkOK.frame21.cboOK_Tol config -state disabled
					$frmClkOK.frame21.entKFrq   config -state disabled
					$frmClkOK.cbClkRst  config -state disable
					set Para(ClkRst) 0
				} else  {
					$frmClkOK.frame2.cbClkOKBp config -state normal
					if {$Para(ClkOKBp) == 1}  {
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
			}
		} else {
		#Divider Mode
			$frmClkI.cboMDiv config -state normal
			$frmClkFB.cboNDiv config -state normal
			$frmClkOP.cboVDiv config -state normal
			$frmClkOK.frame21.cboKDiv config -state normal -foreground black
			$frmClkOP.entU_OFrq config -state disabled -foreground gray50
			$frmClkOP.cboOP_Tol config -state disabled -foreground gray50
			$frmClkOK.frame21.entU_KFrq config -state disabled -foreground gray50
			$frmClkOK.frame21.cboOK_Tol config -state disabled -foreground gray50
			if {$Para(ClkOPBp) == 1}  {
				$frmClkOP.cboVDiv config -state disabled

				set Para(EnCLKOK) 0
				$frmClkOK.frame2.cbEnCLKOK config -state disabled
				set Para(EnCLKOS) 0
				$frmClkOS.frame1.cbEnCLKOS config -state disabled
			} else {
				$frmClkOK.frame2.cbEnCLKOK config -state normal
				$frmClkOS.frame1.cbEnCLKOS config -state normal
				if {$Para(EnCLKOK) == 0}  {
					$frmClkOK.frame2.cbClkOKBp config -state disabled
					set Para(ClkOKBp) 0
					$frmClkOK.frame21.cboKDiv   config -state disabled
					$frmClkOK.frame21.entKFrq   config -state disabled
					$frmClkOK.cbClkRst  config -state disable
					set Para(ClkRst) 0
				} else  {
					$frmClkOK.frame2.cbClkOKBp config -state normal
					if {$Para(ClkOKBp) == 1}  {
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
		} 
		$frmStatic.cboPhase config -state normal -foreground black
		$frmStatic.cboDuty  config -state normal -foreground black
		$frmClkOK.frame21.entKFrq  config -state disabled -foreground black -disabledforeground black

		#.cbDDC	  config -state normal
	} else {
	# PLL Type = epllb
		if {$Para(mode) == "normal"}  {
		#Frequency Mode
			$frmClkI.cboMDiv config -state disabled
			$frmClkFB.cboNDiv config -state disabled
			$frmClkOP.cboVDiv config -state disabled
			$frmClkOP.entU_OFrq config -state normal -foreground black
			$frmClkOP.cboOP_Tol config -state normal -foreground black
		} else  {
		#Divider Mode
			$frmClkI.cboMDiv config -state normal
			$frmClkFB.cboNDiv config -state normal
			$frmClkOP.cboVDiv config -state normal
			$frmClkOP.entU_OFrq config -state disabled -foreground gray50
			$frmClkOP.cboOP_Tol config -state disabled -foreground gray50
		} 
		$frmStatic.cboPhase  config -state disabled -foreground gray50
		$frmStatic.cboDuty   config -state disabled -foreground gray50
		$frmClkOK.frame21.cboKDiv   config -state disabled -foreground gray50
		$frmClkOK.frame21.entU_KFrq config -state disabled -foreground gray50
		$frmClkOK.frame21.cboOK_Tol config -state disabled -foreground gray50
		$frmClkOK.frame21.entKFrq   config -state disabled -foreground gray50 -disabledforeground gray50

		set Para(DelayControl) Static
	} 

	if {$Para(ClkOPBp) == 0}  {
		if {$Para(EnCLKOS) == 0}  {
			$frmClkOS.frame1.cbClkOSBp config -state disabled
			set Para(ClkOSBp) 0
			$frmStatic.cboPhase  config -state disabled
			$frmStatic.cboDuty   config -state disabled
			$frmDynamic.rdoDPD0   config -state disable
			$frmDynamic.rdoDPD1   config -state disable
			
			$frmClkFB.cboFB_Mode clear list
			$frmClkFB.cboFB_Mode insert list end Internal CLKOP "User Clock"
			if {[lsearch {Internal CLKOP "User Clock"} $Para(fb_mode)] == -1} {set Para(fb_mode) CLKOP}
		} else  {
			$frmClkOS.frame1.cbClkOSBp config -state normal
			if {$Para(ClkOSBp) == 1}  {
				$frmStatic.cboPhase  config -state disabled
				$frmStatic.cboDuty   config -state disabled
				$frmDynamic.rdoDPD0   config -state disable
				$frmDynamic.rdoDPD1   config -state disable

				$frmClkFB.cboFB_Mode clear list
				$frmClkFB.cboFB_Mode insert list end Internal CLKOP "User Clock"
				if {[lsearch {Internal CLKOP "User Clock"} $Para(fb_mode)] == -1} {set Para(fb_mode) CLKOP}
			} else {
				if {$Para(PhaseDuty) == "Static"} {
					$frmStatic.cboPhase  config -state normal
					$frmStatic.cboDuty   config -state normal
					$frmDynamic.rdoDPD0   config -state disable
					$frmDynamic.rdoDPD1   config -state disable
				} else {
					#CR_41590
					$frmStatic.cboPhase  config -state normal
					$frmStatic.cboDuty   config -state normal
					#set Para(Phase) 0.0
					#set Para(Duty) 8
					$frmDynamic.rdoDPD0   config -state normal
					$frmDynamic.rdoDPD1   config -state normal
				}
				$frmClkFB.cboFB_Mode clear list
				$frmClkFB.cboFB_Mode insert list end Internal CLKOP CLKOS "User Clock"
				#if {[lsearch {Internal CLKOP CLKOS "User Clock"} $Para(fb_mode)] == -1} {set Para(fb_mode) CLKOP}
			} 
		}
	}
	
	if {$Para(ClkOPBp) == 1}  {
		set Para(ClkOSBp) 1
		$frmClkOS.frame1.cbClkOSBp config -state normal
		set Para(ClkOKBp) 1
		$frmClkOK.frame2.cbClkOKBp config -state normal

		$frmClkOK.frame21.entU_KFrq config -state disabled
		$frmClkOK.frame21.cboOK_Tol config -state disabled
		$frmClkOK.frame21.entKFrq   config -state disabled
		$frmClkOK.cbClkRst  config -state disable
		set Para(ClkRst) 0
		$frmClkOK.frame21.cboKDiv   config -state disabled

		$frmStatic.cboPhase  config -state disabled
		$frmStatic.cboDuty   config -state disabled
		$frmDynamic.rdoDPD0   config -state disable
		$frmDynamic.rdoDPD1   config -state disable

		$frmClkFB.cboFB_Mode clear list
		$frmClkFB.cboFB_Mode insert list end Internal "User Clock"
		if {[lsearch {Internal "User Clock"} $Para(fb_mode)] == -1} {set Para(fb_mode) Internal}
	} 

	set max 420.0000
	if {$Para(IFrq) < 2.0000 || $Para(IFrq) > 420.0000} {
		$frmClkI.entIFrq.lwchildsite.entry config -fg red
	} else  {
		$frmClkI.entIFrq.lwchildsite.entry config -fg black
	} 
	if {$Para(mode) == "normal"}  {
		if {$Para(U_OFrq) < 5.0000 || $Para(U_OFrq) > 420.0000} {
			$frmClkOP.entU_OFrq.lwchildsite.entry config -fg red
		} else  {
			$frmClkOP.entU_OFrq.lwchildsite.entry config -fg black
		} 

		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"}  {
			if {$Para(U_KFrq) < 0.039 || $Para(U_KFrq) > 210.0000} {
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
		$frmClkI.cboMDiv.lwchildsite.entry config -fg black
	} 
	if {[string is integer $n] == 1}  {
		$frmClkFB.cboNDiv.lwchildsite.entry config -fg black
	} 
	if {[string is integer $v] == 1}  {
		$frmClkOP.cboVDiv.lwchildsite.entry config -fg black
	} 
	if {[string is integer $k] == 1}  {
		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"} {
			$frmClkOK.frame21.cboKDiv.lwchildsite.entry config -fg black
		}
	} 
	
	ExternalSetting
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

proc LoadSpecialSettingCB {} {
	global Para OldPara
	#CR_34348
	if {$OldPara(CoreRevision) <= "3.1"} {
		set Para(PCDR) 1
	}
}

proc CheckMg5g00Para {}  {
	global Para

	set max 420.0000
	set ret [IsInRange "CLKI Frequency" 2.0000 420.0000 $Para(IFrq)]
	if {$ret == -1} {return -1}
	if {$Para(mode) == "normal"}  {
		set ret [IsInRange "CLKOP Frequency" 5.0000 420.0000 $Para(U_OFrq)]
		if {$ret == -1} {return -1}

		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"}  {
			set ret [IsInRange "CLKOK Frequency" 0.039 210.0000 $Para(U_KFrq)]
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
	lappend str -phase_cntl [string toupper $Para(PhaseDuty)]
	#28059 + 32391
	set u_ofrq $Para(U_OFrq)
	set u_kfrq $Para(U_KFrq)
	if {$Para(ClkOPBp) == 1}  {lappend str -bypassp;set u_ofrq $Para(IFrq)}
	if {$Para(ClkOSBp) == 1}  {lappend str -bypasss} 
	if {$Para(ClkOKBp) == 1}  {lappend str -bypassk;set u_kfrq $Para(IFrq)} 
	if {$Para(mode)=="normal"} {
		lappend str -fclkop $u_ofrq -fclkop_tol $Para(OP_Tol)
	} else  {
		lappend str -mdiv $Para(Div) -ndiv $Para(Mult) -vdiv $Para(Post)
	} 
	lappend str -delay_cntl [string toupper $Para(DelayControl)]
	if {$Para(DelayControl) == "Static"} {lappend str -fdel 0}
	switch $Para(fb_mode)  {
		"Internal"   {lappend str -fb_mode INTERNAL}
		"CLKOP"      {lappend str -fb_mode CLOCKTREE}
		"CLKOS"      {lappend str -fb_mode CLKOS}
		"User Clock" {lappend str -fb_mode USERCLOCK}
	}
	if {$Para(BoolFlag)==0} {
		lappend str -extcap AUTO
	} else {
		lappend str -extcap [string toupper $Para(External)]
	}

	if {$Para(EnCLKOS) == 0}  {
		lappend str -noclkos
	} else  {
		lappend str -phaseadj $Para(Phase) -duty $Para(Duty)
		if {$Para(PhaseDuty) == "Dynamic"} {
			if {$Para(DPD) == "50% Duty"} {lappend str -duty50}
		}
	} 

	if {$Para(EnCLKOK) == 0}  {
		lappend str -noclkok
	} else  {
		if {$Para(mode)=="normal"} {
			lappend str -fclkok $u_kfrq -fclkok_tol $Para(OK_Tol)
		} else  {
			lappend str -kdiv $Para(SecD) 
		} 	   
		if {$Para(ClkRst) == 1}  {lappend str -rstk}
	} 

	#28113 + 29210
	if {$Para(PCDR) == 1}  {
		lappend str -use_rst
	} else {
		lappend str -norst
	}

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

set win [.sf childsite]	
set frmClkI [$win.frmLeft1.frmClkI childsite]
set frmClkOP [$win.frmRight1.frmClkOP childsite]
set frmClkFB [$win.frmLeft1.frmClkFB childsite]
set frmClkOS [$win.frmRight1.frmClkOS childsite]
set frmStatic [$frmClkOS.frame11.frmStatic childsite]
set frmDynamic [$frmClkOS.frmDynamic childsite]
set frmPhaseDuty [$win.frmLeft1.frmPhaseDuty childsite]
set frmDelay [$win.frmLeft1.frmDelay childsite]
set frmClkOK [$win.frmRight1.frmClkOK childsite]
set frmExternal [$win.frmLeft1.frmExternal childsite]
	
#	You could call scuba with a specific option (such as "-cal "), and the 
#	DIV values and the Freq values can be written to the stdout.
#		Div: 1,2,3,4
#		Freq: 100.000, 100.000

	# 28067 : 1< IFrq <420, 3.28< U_OFrq <420;
	set max 420.0000
	set ret [IsInRange "CLKI Frequency" 2.0000 420.0000 $Para(IFrq)]
	if {$ret == -1} {
		$frmClkI.entIFrq.lwchildsite.entry config -fg red
		set Para(BoolFlag) 0
		return -1
	}
	if {$Para(mode) == "normal"}  {
		set ret [IsInRange "CLKOP Frequency" 5.0000 420.0000 $Para(U_OFrq)]
		if {$ret == -1} {
			$frmClkOP.entU_OFrq.lwchildsite.entry config -fg red
			set Para(BoolFlag) 0
			return -1
		}

		if {$Para(Type) == "ehxpllb" || $Para(Type) == "ehxpllc"}  {
			set ret [IsInRange "CLKOK Frequency" 0.039 210.0000 $Para(U_KFrq)]
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

	set Para(Div)  [string trim [lindex $div 0]]
	set Para(Mult) [string trim [lindex $div 1]]
	set Para(Post) [string trim [lindex $div 2]]
	set Para(OFrq) [string trim [lindex $freq 0]]
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
	set Para(BoolFlag) 0
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

		frame $win.frmRight1.frmMode
		radiobutton $win.frmRight1.frmMode.rdoNormal   -text "Frequency Mode" -command {EditFreq;CallDrawPins} -width 16 -variable Para(mode) -value normal
		radiobutton $win.frmRight1.frmMode.rdoAdvanced -text "Divider Mode"   -command {EditFreq;CallDrawPins} -width 16 -variable Para(mode) -value advanced
		pack $win.frmRight1.frmMode.rdoNormal $win.frmRight1.frmMode.rdoAdvanced -side left;# -in $win.frmRight1.frmMode

		#*** CLKI Frequency ***
		iwidgets::Labeledframe $win.frmLeft1.frmClkI -labeltext "CLKI" -labelpos nw
		set frmClkI [$win.frmLeft1.frmClkI childsite]
		iwidgets::entryfield $frmClkI.entIFrq -labeltext "\nFrequency" -labelpos n -width 13 -textvariable Para(IFrq) -validate real
		iwidgets::combobox   $frmClkI.cboMDiv -labeltext "\nDivider"   -labelpos n -width 6  -textvariable Para(Div) -editable false -selectioncommand EditFreq
		for {set i 1} {$i<65} {incr i}  {
			$frmClkI.cboMDiv insert list end $i
		} 
		pack $frmClkI.entIFrq $frmClkI.cboMDiv -side left -padx 2 -fill x;# -in $frmClkI
		$frmClkI.entIFrq.lwchildsite.entry config -validate key -vcmd {
			after idle {EditFreq;CallDrawPins}
			return 1
		}

		#*** CLKOP Frequency ***
		iwidgets::Labeledframe $win.frmRight1.frmClkOP -labeltext "CLKOP" -labelpos nw
		set frmClkOP [$win.frmRight1.frmClkOP childsite]
		checkbutton $frmClkOP.cbClkOPBp -text "Bypass (CLKOP=CLKI)" -variable Para(ClkOPBp) -command {EditFreq;CallDrawPins}
		pack $frmClkOP.cbClkOPBp -anchor e -padx 12;# -in $frmClkOP
		iwidgets::combobox   $frmClkOP.cboVDiv   -labeltext "\nDivider"            -labelpos n -width 6  -textvariable Para(Post) -editable false -selectioncommand EditFreq
		iwidgets::entryfield $frmClkOP.entU_OFrq -labeltext "Desired\nFrequency" -labelpos n -width 12 -textvariable Para(U_OFrq) -validate real
		iwidgets::combobox   $frmClkOP.cboOP_Tol -labeltext "\nTolerance"          -labelpos n -width 8  -textvariable Para(OP_Tol) -editable false -selectioncommand EditFreq
		iwidgets::entryfield $frmClkOP.entOFrq   -labeltext "Actual\nFrequency"    -labelpos n -width 12 -textvariable Para(OFrq) -fixed 10 -state disabled -disabledforeground black
		#ISPL_CR_29211
		$frmClkOP.cboVDiv insert list end 2 4 8 16 32 48 64 80 96 112 128
		#24674
		$frmClkOP.cboOP_Tol insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
		pack $frmClkOP.cboVDiv $frmClkOP.entU_OFrq $frmClkOP.cboOP_Tol $frmClkOP.entOFrq -side left -padx 2 -fill x;# -in $frmClkOP
		$frmClkOP.entU_OFrq.lwchildsite.entry config -validate key -vcmd {
			after idle {EditFreq;CallDrawPins}
			return 1
		}

		#*** CLKFB ***
		iwidgets::Labeledframe $win.frmLeft1.frmClkFB -labeltext "CLKFB" -labelpos nw
		set frmClkFB [$win.frmLeft1.frmClkFB childsite]
		#25228
		iwidgets::combobox $frmClkFB.cboFB_Mode -labeltext "Feedback\nMode" -labelpos n -width 12 -textvariable Para(fb_mode) -editable false -selectioncommand {EditFreq;CallDrawPins}
		iwidgets::combobox $frmClkFB.cboNDiv    -labeltext "\nDivider"      -labelpos n -width 6  -textvariable Para(Mult) -editable false -selectioncommand EditFreq
		$frmClkFB.cboFB_Mode insert list end Internal CLKOP "User Clock"
		#ISPL_CR_33436
		for {set i 1} {$i<17} {incr i}  {
			$frmClkFB.cboNDiv insert list end $i
		} 
		pack $frmClkFB.cboFB_Mode $frmClkFB.cboNDiv -side left -padx 2 -fill x;# -in $frmClkFB

		#*** CLKOS ***
		iwidgets::Labeledframe $win.frmRight1.frmClkOS -labeltext "CLKOS" -labelpos nw
		set frmClkOS [$win.frmRight1.frmClkOS childsite]
		# 26615
		frame $frmClkOS.frame1
		checkbutton $frmClkOS.frame1.cbEnCLKOS -text "Enable CLKOS" -variable Para(EnCLKOS) -command {EditFreq;CallDrawPins}
		checkbutton $frmClkOS.frame1.cbClkOSBp -text "Bypass (CLKOS=CLKI)" -variable Para(ClkOSBp) -command {EditFreq;CallDrawPins}
		pack $frmClkOS.frame1.cbEnCLKOS -side left
		pack $frmClkOS.frame1.cbClkOSBp -side right -anchor e
		pack $frmClkOS.frame1 -anchor w -padx 12 -fill x -pady 4

		frame $frmClkOS.frame11
		iwidgets::Labeledframe $frmClkOS.frame11.frmStatic -labeltext "Phase & Duty Options(Static Mode)" -labelpos nw
		set frmStatic [$frmClkOS.frame11.frmStatic childsite]
		iwidgets::combobox $frmStatic.cboPhase -labeltext "Phase Shift (degree)" -labelpos n -width 6 -textvariable Para(Phase) -editable false -selectioncommand EditFreq
		#28088
		iwidgets::combobox $frmStatic.cboDuty  -labeltext "Duty Cycle (*1/16)" -labelpos n -width 6 -textvariable Para(Duty) -editable false -selectioncommand EditFreq
		$frmStatic.cboPhase insert list end 0.0 22.5 45.0 67.5 90.0 112.5 135.0 157.5 180.0 202.5 225.0 247.5 270.0 292.5 315.0 337.5
		$frmStatic.cboDuty  insert list end 2 3 4 5 6 7 8 9 10 11 12 13 14
		pack $frmStatic.cboPhase $frmStatic.cboDuty -side left -padx 4

		label $frmClkOS.frame11.lblClkOS -text "Actual\nFrequency\nSame as\nCLKOP" -justify left
		pack $frmClkOS.frame11.frmStatic $frmClkOS.frame11.lblClkOS -side left -fill x

		iwidgets::Labeledframe $frmClkOS.frmDynamic -labeltext "Phase & Duty Options(Dynamic Mode)" -labelpos nw
		set frmDynamic [$frmClkOS.frmDynamic childsite]
		radiobutton $frmDynamic.rdoDPD0 -text "Dynamic Phase with\n50% Duty" -variable Para(DPD) -value "50% Duty" -command {EditFreq;CallDrawPins}
		radiobutton $frmDynamic.rdoDPD1 -text "Dynamic Phase with\nDynamic Duty" -variable Para(DPD) -value "Dynamic Duty" -command {EditFreq;CallDrawPins}
		pack $frmDynamic.rdoDPD0 $frmDynamic.rdoDPD1 -side left -padx 4

		pack $frmClkOS.frame11 $frmClkOS.frmDynamic -side top -fill x

		iwidgets::Labeledframe $win.frmLeft1.frmPhaseDuty -labeltext "PLL Phase & Duty Options" -labelpos nw
		set frmPhaseDuty [$win.frmLeft1.frmPhaseDuty childsite]
		radiobutton $frmPhaseDuty.rdoP_D0 -text "Static Mode" -command {EditFreq;CallDrawPins} -variable Para(PhaseDuty) -value Static
		radiobutton $frmPhaseDuty.rdoP_D1 -text "Dynamic Mode" -command {EditFreq;CallDrawPins} -variable Para(PhaseDuty) -value Dynamic
		pack $frmPhaseDuty.rdoP_D0 $frmPhaseDuty.rdoP_D1 -side top -anchor w
		
		#*** Delay Adjust ***
		iwidgets::Labeledframe $win.frmLeft1.frmDelay -labeltext "Delay Adjust" -labelpos nw
		set frmDelay [$win.frmLeft1.frmDelay childsite]
		radiobutton $frmDelay.rdoDelay0 -text "GPLL (Dynamic Delay)" -command {EditFreq;CallDrawPins} -variable Para(DelayControl) -value Dynamic
		radiobutton $frmDelay.rdoDelay1 -text "GPLL (Static Delay)" -command {EditFreq;CallDrawPins} -variable Para(DelayControl) -value Static
		radiobutton $frmDelay.rdoDelay2 -text "GPLL (No Delay)" -command {EditFreq;CallDrawPins} -variable Para(DelayControl) -value GPLL_NO_DELAY
		radiobutton $frmDelay.rdoDelay3 -text "SPLL (No Delay)" -command {EditFreq;CallDrawPins} -variable Para(DelayControl) -value SPLL_NO_DELAY
		radiobutton $frmDelay.rdoDelay4 -text "SPLL or GPLL (No Delay)" -command {EditFreq;CallDrawPins} -variable Para(DelayControl) -value AUTO_NO_DELAY
		pack $frmDelay.rdoDelay0 $frmDelay.rdoDelay1 $frmDelay.rdoDelay2 $frmDelay.rdoDelay3 $frmDelay.rdoDelay4 -side top -anchor w

		#*** CLKOK Frequency ***
		iwidgets::Labeledframe $win.frmRight1.frmClkOK -labeltext "CLKOK" -labelpos nw
		set frmClkOK [$win.frmRight1.frmClkOK childsite]
		# 26615
		frame $frmClkOK.frame2
		checkbutton $frmClkOK.frame2.cbEnCLKOK -text "Enable CLKOK" -variable Para(EnCLKOK) -command {EditFreq;CallDrawPins}
		checkbutton $frmClkOK.frame2.cbClkOKBp -text "Bypass (CLKOK=CLKI)" -variable Para(ClkOKBp) -command {EditFreq;CallDrawPins}
		pack $frmClkOK.frame2.cbEnCLKOK -side left  -anchor w
		pack $frmClkOK.frame2.cbClkOKBp -side right -anchor e

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
		pack $frmClkOK.frame21.cboKDiv $frmClkOK.frame21.entU_KFrq $frmClkOK.frame21.cboOK_Tol $frmClkOK.frame21.entKFrq -side left -padx 2 -fill x
		$frmClkOK.frame21.entU_KFrq.lwchildsite.entry config -validate key -vcmd {
			after idle {EditFreq;CallDrawPins}
			return 1
		}
		checkbutton $frmClkOK.cbClkRst -text "Provide CLKOK Divider Reset" -variable Para(ClkRst) -command {EditFreq;CallDrawPins}
		pack $frmClkOK.frame2 $frmClkOK.frame21 -fill x -anchor w
		pack $frmClkOK.cbClkRst -anchor w

		button $win.frmRight1.btnCal -text "Calculate" -width 16 -command {CalculateCmd}

		checkbutton $win.frmRight1.cbPCDR -text "Provide PLL Reset" -variable Para(PCDR) -command {EditFreq;CallDrawPins}
		
		iwidgets::Labeledframe $win.frmLeft1.frmExternal -labeltext "External Capacitor Pin" -labelpos nw
		set frmExternal [$win.frmLeft1.frmExternal childsite]
		#ISPL_CR_30549 
		#label .lblExternal -text "Refer to PAR report for the\ncapacitor requirement" -justify left
		radiobutton $frmExternal.rdoExternal0 -text "Enabled" -command {EditFreq;CallDrawPins} -variable Para(External) -value ENABLED
		radiobutton $frmExternal.rdoExternal1 -text "Disabled" -command {EditFreq;CallDrawPins} -variable Para(External) -value DISABLED
		radiobutton $frmExternal.rdoExternal2 -text "Auto" -command {EditFreq;CallDrawPins} -variable Para(External) -value AUTO
		pack $frmExternal.rdoExternal0 $frmExternal.rdoExternal1 $frmExternal.rdoExternal2 -side top -anchor w
		$frmExternal.rdoExternal0 config -state disabled
		$frmExternal.rdoExternal1 config -state disabled
		$frmExternal.rdoExternal2 config -state disabled

		pack $win.frmLeft1.cboPllType $win.frmLeft1.frmClkI $win.frmLeft1.frmClkFB $win.frmLeft1.frmPhaseDuty $win.frmLeft1.frmDelay -fill x -anchor w;# -in $win.frmLeft1
		pack $win.frmLeft1.frmExternal -fill x -anchor w;# -in $win.frmLeft1
		pack $win.frmRight1.frmMode $win.frmRight1.frmClkOP $win.frmRight1.frmClkOS $win.frmRight1.frmClkOK -fill x;# -in $win.frmRight1
		pack $win.frmRight1.cbPCDR -anchor w -padx 20;# -in $win.frmRight1
		pack $win.frmRight1.btnCal -anchor e;# -in $win.frmRight1
		
pack $win.frmLeft1 $win.frmRight1 -side left
pack .sf -in $frmProperty -fill both -expand yes

#		pack .frmLeft1 .frmRight1 -in $frmProperty -side left
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
