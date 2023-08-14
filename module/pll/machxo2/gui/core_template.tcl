#$Header: L:/module/pll/machxo2/gui/core_template.tcl 1.22 mghuang Exp $

#Rev 1.22: Diamond 3.2 IPExpress: Fixed SOF-119052
#Rev 1.21: Diamond 3.0 IPExpress: Fixed SOF-101186, XO2_PLL_Usage_Model_Rev_3.13
#Rev 1.20: Diamond 3.0 IPExpress: Fixed SOF-117514
#Rev 1.19: Diamond 2.1 IPExpress: Fixed CR_58329
#Rev 1.18: Diamond 2.0.1 IPExpress: Fixed CR_57812
#Rev 1.17: Diamond 2.0 IPExpress: UM rev 3.12
#Rev 1.16: Diamond 2.0 IPExpress: Fixed CR_56402
#Rev 1.14,1.15: 8.1s1 IPExpress: Fixed CR_51159
#Rev 1.13: 8.1s1 IPExpress: Fixed cr_49715,50337,50339
#Rev 1.12: 8.1s1 IPExpress: Fixed cr_49491,49831
#Rev 1.11: 8.1s1 IPExpress: Fixed cr_49816,49833
#Rev 1.10: 8.1s1 IPExpress: Fixed cr_49492,49831,49851
#Rev 1.9: 8.1p IPExpress: Fixed cr_49775,49776
#Rev 1.8: 8.1p IPExpress: Fixed cr_49398
#Rev 1.7: Fixed cr_49570
#Rev 1.6: Fixed cr_49491,49494
#Rev 1.5: Fixed cr_49398,49492
#Rev 1.4: UM Rev 2.98
#Rev 1.3: UM Rev 2.97, Fixed 48881,49354
#Rev 1.2: UM Rev 2.96, Fixed 48358,48502,48548

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(CLKI)] > 0 &&
		[string length $Para(FREQ_PIN_CLKOP)] > 0 &&
		[string length $Para(FREQ_PIN_CLKOS)] > 0 &&
		[string length $Para(FREQ_PIN_CLKOS2)] > 0 &&
		[string length $Para(FREQ_PIN_CLKOS3)] > 0 }  {DrawBusPins} 
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
set frmClkI [$win.frmLeft.frmClkI childsite]
set frmClkOP [$win.frmRight.frmClkOP childsite]
#set frmClkOP [$win.frmRight.frmClkOP childsite]
set frmTrimP [$frmClkOP.frmTrimP childsite]
set frmClkFB [$win.frmLeft.frmClkFB childsite]
set frmClkOS [$win.frmRight.frmClkOS childsite]
#set frmStatic [$frmClkOS.frmStatic childsite]
#set frmDynamic [$frmClkOS.frmDynamic childsite]
#set frmDutyTrim [$frmClkOS.frmDutyTrim childsite]
#set frmPhaseDuty [$win.frmLeft.frmPhaseDuty childsite]
#set frmClkOK [$win.frmRight.frmClkOK childsite]

	if {$Para(EnCLKOS) == 1 && $Para(ClkOSBp) == 0} {
		set duty [expr $Para(Duty)/16.0]
		if {$duty < 0.5} {
			set min_duty $duty
		} else {
			set min_duty [expr 1-$duty]
		}
		set CLKOS_period [expr $min_duty*1000/$Para(CLKOP_AFREQ)]
		if {$CLKOS_period < 1.0} {
			$frmStatic.entDutyDe.lwchildsite.entry config -fg red
			set msg "The selected duty cycle causes a minimum pulse width error."
			tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
			return -1
		} else {
			$frmStatic.entDutyDe.lwchildsite.entry config -fg black
		}
	}
	return 0
}

proc RemoveFBOptions {key} {
	global Para frmProperty
	set frmProperty [.frmProperties childsite]
	set win [.sf childsite]	
	set frmClkFB [$win.frmLeft.frmClkFB childsite]
	set lst {}
	set n [$frmClkFB.cboFB_Mode size]
	for {set i 0} {$i < $n} {incr i} {
		set str [$frmClkFB.cboFB_Mode get $i]
		if {$str != $key} {
			lappend lst $str
		}
	}
	$frmClkFB.cboFB_Mode clear list
	foreach item $lst {
		$frmClkFB.cboFB_Mode insert list end $item
	}
	if {$Para(fb_mode) == $key} {set Para(fb_mode) [$frmClkFB.cboFB_Mode get 0]}	
	if {$Para(fb_mode) == "" && [$frmClkFB.cboFB_Mode size] > 0} {set Para(fb_mode) [$frmClkFB.cboFB_Mode get 0]}	
}

proc ChangeValueCmd {} {
	global Para frmProperty in_pins out_pins frmCLKOS
	
	set frmProperty [.frmProperties childsite]
	set win [.sf childsite]	
	set frmClkI [$win.frmLeft.frmClkI childsite]
	set frmClkOP [$win.frmRight.frmClkOP childsite]
	set frmTrimP [$frmClkOP.frmTrimP childsite]
	set frmClkFB [$win.frmLeft.frmClkFB childsite]
	set frmOPS [$win.frmLeft.frmOPS childsite]
	set frmPRO [$win.frmLeft.frmPRO childsite]
	set frmLock [$win.frmLeft.frmLock childsite]
	set frmWB [$win.frmLeft.frmWB childsite]
	set frmTrimP [$frmClkOP.frmTrimP childsite]
	set frmClkOS [$win.frmRight.frmClkOS childsite]
	set frmTrimS [$frmClkOS.frmTrimS childsite]
	set frmClkOS2 [$win.frmRight.frmClkOS2 childsite]
	set frmClkOS3 [$win.frmRight.frmClkOS3 childsite]

	if {$Para(BoolFlag) == "1"}  {
		$Para(generate_cfg) configure -state normal
	} else  {
		$Para(generate_cfg) configure -state disabled
	} 

	set min 7.0000
	set max 400.0000
	
	if {$Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"}  {
		set max 450.0000
	}
	if {$Para(CLKI) < $min || $Para(CLKI) > $max} {
		$frmClkI.entIFrq.lwchildsite.entry config -fg red
	} else  {
		$frmClkI.entIFrq.lwchildsite.entry config -fg black
	} 
	
	#note 1,2
	if {$Para(mode) == "Frequency"}  {
		$frmClkI.cboMDiv	config -state disabled
		$frmClkFB.cboNDiv	config -state disabled	
		$frmClkOP.cboVDiv	config -state disabled
		$frmClkOS.cboVDiv	config -state disabled
		$frmClkOS2.cboVDiv	config -state disabled
		$frmClkOS3.cboVDiv	config -state disabled

		$frmClkOP.entFREQ_PIN_CLKOP	config -state normal
		$frmClkOS.entFREQ_PIN_CLKOS	config -state normal
		$frmClkOS2.entFREQ_PIN_CLKOS2	config -state normal
		$frmClkOS3.entFREQ_PIN_CLKOS3	config -state normal
		
		$frmClkOP.cboOP_Tol	config -state normal
		$frmClkOS.cboOS_Tol	config -state normal
		$frmClkOS2.cboOS2_Tol	config -state normal
		$frmClkOS3.cboOS3_Tol	config -state normal

	} else {
		$frmClkI.cboMDiv	config -state normal
		$frmClkFB.cboNDiv	config -state normal		
		$frmClkOP.cboVDiv	config -state normal
		$frmClkOS.cboVDiv	config -state normal
		$frmClkOS2.cboVDiv	config -state normal
		$frmClkOS3.cboVDiv	config -state normal

		$frmClkOP.entFREQ_PIN_CLKOP	config -state disabled
		$frmClkOS.entFREQ_PIN_CLKOS	config -state disabled
		$frmClkOS2.entFREQ_PIN_CLKOS2	config -state disabled
		$frmClkOS3.entFREQ_PIN_CLKOS3	config -state disabled

		$frmClkOP.cboOP_Tol	config -state disabled
		$frmClkOS.cboOS_Tol	config -state disabled
		$frmClkOS2.cboOS2_Tol	config -state disabled
		$frmClkOS3.cboOS3_Tol	config -state disabled
	}
	
	#
	if {$Para(OPBypass) == 1 && 
		($Para(EnCLKOS) == 0 || $Para(OSBypass) == 1) &&
		($Para(EnCLKOS2) == 0 || $Para(OS2Bypass) == 1) &&
		($Para(EnCLKOS3) == 0 || $Para(OS3Bypass) == 1) } {
		$frmClkFB.cboFB_Mode config -state disabled
		set Para(fb_mode) "UserClock"
	} else {
		$frmClkFB.cboFB_Mode config -state normal
	}

	$frmClkFB.cboFB_Mode clear list
	$frmClkFB.cboFB_Mode insert list end CLKOP CLKOS CLKOS2 CLKOS3 INT_OP INT_OS INT_OS2 INT_OS3 "UserClock"
	
	#note 3
	if {$Para(OPBypass) == 1} {
		RemoveFBOptions CLKOP	
		RemoveFBOptions INT_OP	
		RemoveFBOptions UserClock	
		$frmClkOP.entFREQ_PIN_CLKOP config -state disabled
		$frmClkOP.cboOP_Tol 		config -state disabled
		$frmClkOP.cboVDiv 			config -state disabled
		$frmClkOP.entCLKOP_AFREQ 	config -state disabled -disabledforeground gray
		$frmClkOP.cboPhaseADJ		config -state disabled
		$frmTrimP.rdoTrimP0			config -state disabled
		$frmTrimP.rdoTrimP1			config -state disabled
		$frmTrimP.cboDelayMultP		config -state disabled

		#Cindy: disable the Clock Divider checkbox when Bypass mode is enabled in the Frequency mode FOR NOW (EAPR).
		$frmClkOP.cbUseDiv			config -state normal
		if {$Para(OPUseDiv) == 1} {
			if {$Para(mode) == "Frequency"}  {
				$frmClkOP.entFREQ_PIN_CLKOP config -state disabled
				$frmClkOP.cboVDiv 			config -state normal
			} else {
				$frmClkOP.cboVDiv 			config -state normal
			}
		} else {
			$frmClkOP.cboVDiv 			config -state disabled
		}
	} else {
		if {$Para(mode) == "Frequency"}  {
			$frmClkOP.entFREQ_PIN_CLKOP config -state normal
			$frmClkOP.cboOP_Tol 		config -state normal
		} else {
			$frmClkOP.cboVDiv 			config -state normal
		}
		$frmClkOP.entCLKOP_AFREQ 	config -state disabled -disabledforeground black
		$frmClkOP.cboPhaseADJ		config -state normal
		$frmTrimP.rdoTrimP0			config -state normal
		$frmTrimP.rdoTrimP1			config -state normal
		$frmTrimP.cboDelayMultP		config -state normal
		$frmClkOP.cbUseDiv			config -state disabled
		set Para(OPUseDiv) 0
	}
	
	if {$Para(EnCLKOS) == 0} {
		RemoveFBOptions CLKOS	
		RemoveFBOptions INT_OS	
		$frmClkOS.cbOSBypass		config -state disabled
		$frmClkOS.cbUseDiv			config -state disabled
		$frmClkOS.entFREQ_PIN_CLKOS config -state disabled
		$frmClkOS.cboOS_Tol 		config -state disabled
		$frmClkOS.cboVDiv 			config -state disabled
		$frmClkOS.entCLKOS_AFREQ	config -state disabled -disabledforeground gray
		$frmClkOS.cboPhaseADJ		config -state disabled
		$frmTrimS.rdoTrimS0			config -state disabled
		$frmTrimS.rdoTrimS1			config -state disabled
		$frmTrimS.cboDelayMultS		config -state disabled
		set Para(OSBypass) 0
		set Para(OSUseDiv) 0
	} else {
		$frmClkOS.cbOSBypass		config -state normal
		if {$Para(OSBypass) == 0} {
			$frmClkOS.cbUseDiv			config -state disabled
			if {$Para(mode) == "Frequency"}  {
				$frmClkOS.entFREQ_PIN_CLKOS config -state normal
				$frmClkOS.cboOS_Tol 		config -state normal
			} else {
				$frmClkOS.cboVDiv 			config -state normal
			}
			$frmClkOS.entCLKOS_AFREQ	config -state disabled -disabledforeground black
			$frmClkOS.cboPhaseADJ		config -state normal
			$frmTrimS.rdoTrimS0			config -state normal
			$frmTrimS.rdoTrimS1			config -state normal
			$frmTrimS.cboDelayMultS		config -state normal
			set Para(OSUseDiv) 0
		} else {
			RemoveFBOptions CLKOS	
			RemoveFBOptions INT_OS	
			#Cindy: disable the Clock Divider checkbox when Bypass mode is enabled in the Frequency mode FOR NOW (EAPR).
			$frmClkOS.cbUseDiv			config -state normal
			$frmClkOS.entFREQ_PIN_CLKOS config -state disabled
			$frmClkOS.cboOS_Tol 		config -state disabled
			$frmClkOS.cboVDiv 			config -state disabled
			$frmClkOS.entCLKOS_AFREQ	config -state disabled -disabledforeground gray
			$frmClkOS.cboPhaseADJ		config -state disabled
			$frmTrimS.rdoTrimS0			config -state disabled
			$frmTrimS.rdoTrimS1			config -state disabled
			$frmTrimS.cboDelayMultS		config -state disabled
			if {$Para(OSUseDiv) == 1} {
				if {$Para(mode) == "Frequency"}  {
					$frmClkOS.entFREQ_PIN_CLKOS config -state disabled
					$frmClkOS.cboVDiv 			config -state normal
				} else {
					$frmClkOS.cboVDiv 			config -state normal
				}
			} else {
				$frmClkOS.cboVDiv 			config -state disabled
			}
		}
	}

	if {$Para(EnCLKOS2) == 0} {
		RemoveFBOptions CLKOS2	
		RemoveFBOptions INT_OS2	
		$frmClkOS2.cbOS2Bypass			config -state disabled
		$frmClkOS2.cbUseDiv				config -state disabled
		$frmClkOS2.entFREQ_PIN_CLKOS2 	config -state disabled
		$frmClkOS2.cboOS2_Tol 			config -state disabled
		$frmClkOS2.cboVDiv 				config -state disabled
		$frmClkOS2.entCLKOS2_AFREQ		config -state disabled -disabledforeground gray
		$frmClkOS2.cboPhaseADJ			config -state disabled
		set Para(OS2Bypass) 0
		set Para(OS2UseDiv) 0
		$frmPRO.cbClkOS2Rst				config -state disabled
		set Para(ClkOS2Rst) 0
	} else {
		$frmClkOS2.cbOS2Bypass			config -state normal
		$frmPRO.cbClkOS2Rst				config -state normal
		if {$Para(OS2Bypass) == 0} {
			$frmClkOS2.cbUseDiv				config -state disabled
			if {$Para(mode) == "Frequency"}  {
				$frmClkOS2.entFREQ_PIN_CLKOS2 	config -state normal
				$frmClkOS2.cboOS2_Tol 			config -state normal
			} else {
				$frmClkOS2.cboVDiv 				config -state normal
			}
			$frmClkOS2.entCLKOS2_AFREQ		config -state disabled -disabledforeground black
			$frmClkOS2.cboPhaseADJ			config -state normal
			set Para(OS2UseDiv) 0
		} else {
			RemoveFBOptions CLKOS2	
			RemoveFBOptions INT_OS2	
			#Cindy: disable the Clock Divider checkbox when Bypass mode is enabled in the Frequency mode FOR NOW (EAPR).
			$frmClkOS2.cbUseDiv				config -state normal
			$frmClkOS2.entFREQ_PIN_CLKOS2 	config -state disabled
			$frmClkOS2.cboOS2_Tol 			config -state disabled
			$frmClkOS2.cboVDiv 				config -state disabled
			$frmClkOS2.entCLKOS2_AFREQ		config -state disabled -disabledforeground gray
			$frmClkOS2.cboPhaseADJ			config -state disabled
			if {$Para(OS2UseDiv) == 1} {
				if {$Para(mode) == "Frequency"}  {
					$frmClkOS2.entFREQ_PIN_CLKOS2 	config -state disabled
					$frmClkOS2.cboVDiv 			config -state normal
				} else {
					$frmClkOS2.cboVDiv 			config -state normal
				}
			} else {
				$frmClkOS2.cboVDiv 			config -state disabled
			}
		}
	}	
	
	if {$Para(EnCLKOS3) == 0} {
		RemoveFBOptions CLKOS3
		RemoveFBOptions INT_OS3	
		$frmClkOS3.cbOS3Bypass			config -state disabled
		$frmClkOS3.cbUseDiv				config -state disabled
		$frmClkOS3.entFREQ_PIN_CLKOS3 	config -state disabled
		$frmClkOS3.cboOS3_Tol 			config -state disabled
		$frmClkOS3.cboVDiv 				config -state disabled
		$frmClkOS3.entCLKOS3_AFREQ		config -state disabled -disabledforeground gray
		$frmClkOS3.cboPhaseADJ			config -state disabled
		set Para(OS3Bypass) 0
		set Para(OS3UseDiv) 0
		$frmPRO.cbClkOS3Rst				config -state disabled
		set Para(ClkOS3Rst) 0
	} else {
		$frmClkOS3.cbOS3Bypass			config -state normal
		$frmPRO.cbClkOS3Rst				config -state normal
		if {$Para(OS3Bypass) == 0} {
			$frmClkOS3.cbUseDiv				config -state disabled
			if {$Para(mode) == "Frequency"}  {
				$frmClkOS3.entFREQ_PIN_CLKOS3 	config -state normal
				$frmClkOS3.cboOS3_Tol 			config -state normal
			} else {
				$frmClkOS3.cboVDiv 				config -state normal
			}
			$frmClkOS3.entCLKOS3_AFREQ		config -state disabled -disabledforeground black
			$frmClkOS3.cboPhaseADJ			config -state normal
			set Para(OS3UseDiv) 0
		} else {
			RemoveFBOptions CLKOS3
			RemoveFBOptions INT_OS3	
			#Cindy: disable the Clock Divider checkbox when Bypass mode is enabled in the Frequency mode FOR NOW (EAPR).
			$frmClkOS3.cbUseDiv				config -state normal
			$frmClkOS3.entFREQ_PIN_CLKOS3 	config -state disabled
			$frmClkOS3.cboOS3_Tol 			config -state disabled
			$frmClkOS3.cboVDiv 				config -state disabled
			$frmClkOS3.entCLKOS3_AFREQ		config -state disabled -disabledforeground gray
			$frmClkOS3.cboPhaseADJ			config -state disabled
			if {$Para(OS3UseDiv) == 1} {
				if {$Para(mode) == "Frequency"}  {
					$frmClkOS3.entFREQ_PIN_CLKOS3 	config -state disabled
					$frmClkOS3.cboVDiv 			config -state normal
				} else {
					$frmClkOS3.cboVDiv 			config -state normal
				}
			} else {
				$frmClkOS3.cboVDiv 			config -state disabled
			}
		}
	}
	
	#note 12
	if {$Para(FRACN_ENABLE) == 0} {
		$frmClkFB.entFNDiv config -state disabled
	} else {
		$frmClkFB.entFNDiv config -state normal
	}
	
	#note 13
	# A Clock output signal in a Bypass mode shall NOT be an available setting except if CLKOP is the 
	# only enabled output and CLKOP is bypassed then the feedback setting shall be INT_OP.  
	if {$Para(OPBypass) == 1 && 
		($Para(EnCLKOS) == 0 || $Para(OSBypass) == 1) &&
		($Para(EnCLKOS2) == 0 || $Para(OS2Bypass) == 1) &&
		($Para(EnCLKOS3) == 0 || $Para(OS3Bypass) == 1) } {
		$frmClkFB.cboFB_Mode config -state normal
		set Para(fb_mode) "INT_OP"
	}
	
	#invalid frequency input will be red font.
	if {$Para(mode) == "Frequency"}  {
		set min 1.562
		if {$Para(OPBypass) == 0} {
			if {$Para(FREQ_PIN_CLKOP) < $min || $Para(FREQ_PIN_CLKOP) > $max} {
				$frmClkOP.entFREQ_PIN_CLKOP.lwchildsite.entry config -fg red
			} else  {
				$frmClkOP.entFREQ_PIN_CLKOP.lwchildsite.entry config -fg black
			} 
		}
		set min 0.012
		if {$Para(EnCLKOS) == 1 && $Para(OSBypass) == 0} {
			if {$Para(FREQ_PIN_CLKOS) < $min || $Para(FREQ_PIN_CLKOS) > $max} {
				$frmClkOS.entFREQ_PIN_CLKOS.lwchildsite.entry config -fg red
			} else  {
				$frmClkOS.entFREQ_PIN_CLKOS.lwchildsite.entry config -fg black
			} 
		}
		if {$Para(EnCLKOS2) == 1 && $Para(OS2Bypass) == 0} {
			if {$Para(FREQ_PIN_CLKOS2) < $min || $Para(FREQ_PIN_CLKOS2) > $max} {
				$frmClkOS2.entFREQ_PIN_CLKOS2.lwchildsite.entry config -fg red
			} else  {
				$frmClkOS2.entFREQ_PIN_CLKOS2.lwchildsite.entry config -fg black
			} 
		}
		if {$Para(EnCLKOS3) == 1 && $Para(OS3Bypass) == 0} {
			if {$Para(FREQ_PIN_CLKOS3) < $min || $Para(FREQ_PIN_CLKOS3) > $max} {
				$frmClkOS3.entFREQ_PIN_CLKOS3.lwchildsite.entry config -fg red
			} else  {
				$frmClkOS3.entFREQ_PIN_CLKOS3.lwchildsite.entry config -fg black
			} 
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
}

proc CheckMachXO2Para {}  {
	global Para

	set frmProperty [.frmProperties childsite]
	set win [.sf childsite]	
	set frmClkOP [$win.frmRight.frmClkOP childsite]
	set frmClkOS [$win.frmRight.frmClkOS childsite]
	set frmClkOS2 [$win.frmRight.frmClkOS2 childsite]
	set frmClkOS3 [$win.frmRight.frmClkOS3 childsite]

	set min 7.0000
	set max 400.0000
	
	if {$Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"}  {
		set max 450.0000
	}
	
	set ret [IsInRange "CLKI Frequency" $min $max $Para(CLKI)]
	if {$ret == -1} {return -1}

	if {$Para(FRACN_ENABLE) == 1} {
		set ret [IsInRange "Fractional-N Divider" 0 65535 $Para(FRACN_DIV)]
		if {$ret == -1} {return -1}
	}
	
	if {$Para(mode) == "Divider"} {
		if {$Para(CLKI_DIV) < 1 || $Para(CLKI_DIV) > 40} {
			set msg "The requested CLKI Divider cannot be implemented."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return -1
		}
		if {$Para(CLKFB_DIV) < 1 || $Para(CLKFB_DIV) > 40} {
			set msg "The requested CLKFB Divider cannot be implemented."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return -1
		}
	}
	if {[$frmClkOP.cboVDiv cget -state] == "normal"} {
		if {$Para(CLKOP_DIV) < 1 || $Para(CLKOP_DIV) > 128} {
			set msg "The requested CLKOP Divider cannot be implemented."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return -1
		}
	}
	if {[$frmClkOS.cboVDiv cget -state] == "normal"} {
		if {$Para(CLKOS_DIV) < 1 || $Para(CLKOS_DIV) > 128} {
			set msg "The requested CLKOS Divider cannot be implemented."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return -1
		}
	}
	if {[$frmClkOS2.cboVDiv cget -state] == "normal"} {
		if {$Para(CLKOS2_DIV) < 1 || $Para(CLKOS2_DIV) > 128} {
			set msg "The requested CLKOS2 Divider cannot be implemented."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return -1
		}
	}
	if {[$frmClkOS3.cboVDiv cget -state] == "normal"} {
		if {$Para(CLKOS3_DIV) < 1 || $Para(CLKOS3_DIV) > 128} {
			set msg "The requested CLKOS3 Divider cannot be implemented."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return -1
		}
	}

	#CR_51159
	if {[$frmClkOP.cboPhaseADJ cget -state] == "normal"} {
		if {($Para(fb_mode) == "CLKOP" || $Para(fb_mode) == "INT_OP" || $Para(fb_mode) == "UserClock")
			&& $Para(CLKOP_PHASEADJ) != "0"} {
			set msg "A PLL output clock port with a static phase shift should not be used as the feedback signal for the PLL."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return -1
		}
	}
	if {[$frmClkOS.cboPhaseADJ cget -state] == "normal"} {
		if {($Para(fb_mode) == "CLKOS" || $Para(fb_mode) == "INT_OS")
			&& $Para(CLKOS_PHASEADJ) != "0"} {
			set msg "A PLL output clock port with a static phase shift should not be used as the feedback signal for the PLL."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return -1
		}
	}
	if {[$frmClkOS2.cboPhaseADJ cget -state] == "normal"} {
		if {($Para(fb_mode) == "CLKOS2" || $Para(fb_mode) == "INT_OS2")
			&& $Para(CLKOS2_PHASEADJ) != "0"} {
			set msg "A PLL output clock port with a static phase shift should not be used as the feedback signal for the PLL."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return -1
		}
	}
	if {[$frmClkOS3.cboPhaseADJ cget -state] == "normal"} {
		if {($Para(fb_mode) == "CLKOS3" || $Para(fb_mode) == "INT_OS3")
			&& $Para(CLKOS3_PHASEADJ) != "0"} {
			set msg "A PLL output clock port with a static phase shift should not be used as the feedback signal for the PLL."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			return -1
		}
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
	set ret [CheckMachXO2Para]
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

	set str "-arch $Para(arch) -type pll -fin $Para(CLKI)"

	if {$Para(mode) == "Frequency"} {
		if {$Para(OPBypass) == 0} {
			lappend str -fclkop $Para(FREQ_PIN_CLKOP) -fclkop_tol $Para(OP_Tol)
		}
		
		if {$Para(EnCLKOS) == 1} {
			if {$Para(OSBypass) == 0} {
				lappend str -fclkos $Para(FREQ_PIN_CLKOS) -fclkos_tol $Para(OS_Tol)
			}
		}
		if {$Para(EnCLKOS2) == 1} {
			if {$Para(OS2Bypass) == 0} {
				lappend str -fclkos2 $Para(FREQ_PIN_CLKOS2) -fclkos2_tol $Para(OS2_Tol)
			}
		}
		if {$Para(EnCLKOS3) == 1} {
			if {$Para(OS3Bypass) == 0} {
				lappend str -fclkos3 $Para(FREQ_PIN_CLKOS3) -fclkos3_tol $Para(OS3_Tol)
			}
		}
	} else {
		lappend str -mdiv $Para(CLKI_DIV) -ndiv $Para(CLKFB_DIV)
	}

	if {$Para(OPBypass) == 1} {
		lappend str -bypassp
		if {$Para(OPUseDiv) == 1} {
			lappend str -bypass_divp
			if {$Para(mode) == "Frequency"}  {
				lappend str -fclkop [expr $Para(CLKI)*1.000/$Para(CLKOP_DIV)]
			} else {
				lappend str -adiv $Para(CLKOP_DIV)
			}
		}
	} else {
		lappend str -trimp $Para(CLKOP_TRIM_DELAY) -phasep $Para(CLKOP_PHASEADJ)
		if {$Para(CLKOP_TRIM_POL) == "Rising"} {lappend str -trimp_r}
		if {$Para(mode) == "Divider"} {lappend str -adiv $Para(CLKOP_DIV)} 
	}
	if {$Para(EnCLKOS) == 1} {
		if {$Para(OSBypass) == 1} {
			lappend str -bypasss
			if {$Para(OSUseDiv) == 1} {
				lappend str -bypass_divs
				if {$Para(mode) == "Frequency"}  {
					lappend str -fclkos [expr $Para(CLKI)*1.000/$Para(CLKOS_DIV)]
				} else {
					lappend str -bdiv $Para(CLKOS_DIV)
				}
			}
		} else {
			if {$Para(EnCLKOS) == 1} {lappend str -trims $Para(CLKOS_TRIM_DELAY) -phases $Para(CLKOS_PHASEADJ)}
			if {$Para(CLKOS_TRIM_POL) == "Rising"} {lappend str -trims_r}
			if {$Para(mode) == "Divider"} {lappend str -bdiv $Para(CLKOS_DIV)} 
		}
	}
	if {$Para(EnCLKOS2) == 1} {
		if {$Para(OS2Bypass) == 1} {
			lappend str -bypasss2
			if {$Para(OS2UseDiv) == 1} {
				lappend str -bypass_divs2
				if {$Para(mode) == "Frequency"}  {
					lappend str -fclkos2 [expr $Para(CLKI)*1.000/$Para(CLKOS2_DIV)]
				} else {
					lappend str -cdiv $Para(CLKOS2_DIV)
				}
			}
		} else {
			lappend str -phases2 $Para(CLKOS2_PHASEADJ)
			if {$Para(mode) == "Divider"} {lappend str -cdiv $Para(CLKOS2_DIV)} 
		}
	}
	if {$Para(EnCLKOS3) == 1} {
		if {$Para(OS3Bypass) == 1} {
			lappend str -bypasss3
			if {$Para(OS3UseDiv) == 1} {
				lappend str -bypass_divs3
				if {$Para(mode) == "Frequency"}  {
					lappend str -fclkos3 [expr $Para(CLKI)*1.000/$Para(CLKOS3_DIV)]
				} else {
					lappend str -ddiv $Para(CLKOS3_DIV)
				}
			}
		} else {
			lappend str -phases3 $Para(CLKOS3_PHASEADJ)
			if {$Para(mode) == "Divider"} {lappend str -ddiv $Para(CLKOS3_DIV)} 
		}
	}
		
	lappend str -phase_cntl $Para(DynamicPhase)
	if {$Para(Standby) == 1} {lappend str -standby}
	if {$Para(ClkEnable) == 1} {lappend str -enable_ports}
	if {$Para(PLLRst) == 1} {lappend str -rst}
	if {$Para(Enable_sel) == 1} {lappend str -enable_sel}
	if {$Para(PLLMRst) == 1} {lappend str -rstm}
	if {$Para(ClkOS2Rst) == 1} {lappend str -rsts2}
	if {$Para(ClkOS3Rst) == 1} {lappend str -rsts3}

	switch $Para(fb_mode)  {
		"CLKOP"      {lappend str -fb_mode 1}
		"CLKOS"      {lappend str -fb_mode 2}
		"CLKOS2"     {lappend str -fb_mode 3}
		"CLKOS3"     {lappend str -fb_mode 4}
		"INT_OP"   	 {lappend str -fb_mode 5}
		"INT_OS"     {lappend str -fb_mode 6}
		"INT_OS2"    {lappend str -fb_mode 7}
		"INT_OS3"    {lappend str -fb_mode 8}
		"UserClock"  {lappend str -fb_mode 9}
	}

	if {$Para(LockSig) == 1} {lappend str -lock}
	if {$Para(LockStk) == 1} {lappend str -sticky}
	if {$Para(WBProt) == 1} {lappend str -wb}
	if {$Para(FRACN_ENABLE) == 1 && $Para(FRACN_DIV) >= 0} {lappend str -fracn $Para(FRACN_DIV)}

	#tk_messageBox -default ok -icon warning -message $str -title "GenerateCB" -type ok
	return $str
}

proc DRC_divider {} {
	global Para
	
	set frmProperty [.frmProperties childsite]
	set win [.sf childsite]	
	set frmClkOP [$win.frmRight.frmClkOP childsite]
	set frmClkOS [$win.frmRight.frmClkOS childsite]
	set frmClkOS2 [$win.frmRight.frmClkOS2 childsite]
	set frmClkOS3 [$win.frmRight.frmClkOS3 childsite]
	
	if {$Para(mode) == "Divider"} {
		if {[regexp {([0-9]+)\(([0-9]+)\)} $Para(CLKI_DIV) match x y]} {
			set msg "CLKI Divider cannot take user specified value of $x. \nThe legal values are $y."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(CLKI_DIV) $x
			return -1
		}
		if {[regexp {([0-9]+)\(([0-9]+)\)} $Para(CLKFB_DIV) match x y]} {
			set msg "CLKFB Divider cannot take user specified value of $x. \nThe legal values are $y."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(CLKFB_DIV) $x
			return -1
		}
	} else {
		if {[regexp {([0-9]+)\(([0-9]+)\)} $Para(CLKI_DIV) match x y]} {
			set Para(CLKI_DIV) $y
		}
		if {[regexp {([0-9]+)\(([0-9]+)\)} $Para(CLKFB_DIV) match x y]} {
			set Para(CLKFB_DIV) $y
		}
	}
	if {[$frmClkOP.cboVDiv cget -state] == "normal"} {
		if {[regexp {([0-9]+)\(([0-9]+)\)} $Para(CLKOP_DIV) match x y]} {
			set msg "CLKOP Divider cannot take user specified value of $x. \nThe legal values are $y."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(CLKOP_DIV) $x
			return -1
		}
	} else {
		if {[regexp {([0-9]+)\(([0-9]+)\)} $Para(CLKOP_DIV) match x y]} {
			set Para(CLKOP_DIV) $y
#			return -1
		}
	}
	if {[$frmClkOS.cboVDiv cget -state] == "normal"} {
		if {[regexp {([0-9]+)\(([0-9]+)\)} $Para(CLKOS_DIV) match x y]} {
			set msg "CLKOS Divider cannot take user specified value of $x. \nThe legal values are $y."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(CLKOS_DIV) $x
			return -1
		}
	}
	if {[$frmClkOS2.cboVDiv cget -state] == "normal"} {
		if {[regexp {([0-9]+)\(([0-9]+)\)} $Para(CLKOS2_DIV) match x y]} {
			set msg "CLKOS2 Divider cannot take user specified value of $x. \nThe legal values are $y."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(CLKOS2_DIV) $x
			return -1
		}
	}
	if {[$frmClkOS3.cboVDiv cget -state] == "normal"} {
		if {[regexp {([0-9]+)\(([0-9]+)\)} $Para(CLKOS3_DIV) match x y]} {
			set msg "CLKOS3 Divider cannot take user specified value of $x. \nThe legal values are $y."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(CLKOS3_DIV) $x
			return -1
		}
	}
	
	return 0
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
#	tk_messageBox -default ok -icon warning -message $ret -title "GetStdoutStr" -type ok
#	tk_messageBox -default ok -icon warning -message $msg -title "GetStdoutStr" -type ok
	if {$ret != 0} {return -1}
	
	return $msg
} 

proc CalculateCmd {}  {
	global Para
	
	set frmProperty [.frmProperties childsite]
	set win [.sf childsite]	
	set frmClkI [$win.frmLeft.frmClkI childsite]
	set frmClkOP [$win.frmRight.frmClkOP childsite]
	set frmTrimP [$frmClkOP.frmTrimP childsite]
	set frmClkFB [$win.frmLeft.frmClkFB childsite]
	set frmOPS [$win.frmLeft.frmOPS childsite]
	set frmPRO [$win.frmLeft.frmPRO childsite]
	set frmLock [$win.frmLeft.frmLock childsite]
	set frmWB [$win.frmLeft.frmWB childsite]
	set frmTrimP [$frmClkOP.frmTrimP childsite]
	set frmClkOS [$win.frmRight.frmClkOS childsite]
	set frmTrimS [$frmClkOS.frmTrimS childsite]
	set frmClkOS2 [$win.frmRight.frmClkOS2 childsite]
	set frmClkOS3 [$win.frmRight.frmClkOS3 childsite]
	
	set min 7.0000
	set max 400.0000
	
	if {$Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"}  {
		set max 450.0000
	}
	set ret [IsInRange "CLKI Frequency" $min $max $Para(CLKI)]
	if {$ret == -1} {
#		$frmClkI.entIFrq.lwchildsite.entry config -fg red
		set Para(BoolFlag) 0
		return -1
	}
	
	if {$Para(mode) == "Frequency"}  {
		set min 1.562
		if {$Para(OPBypass) == 0} {
			set ret [IsInRange "CLKOP Desired Frequency" $min $max $Para(FREQ_PIN_CLKOP)]
			if {$ret == -1} {
				set Para(BoolFlag) 0
				return -1
			}
			if {$Para(fb_mode) == "CLKOP"} {
				if {$Para(FREQ_PIN_CLKOP) < "7"} {
					set msg "The Feedback frequency must be greater than 7 MHz.  (Ffbk = Fout / N). \
					To generate a low frequency output; use a clock output not used in the feedback path."
					tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
					set Para(BoolFlag) 0
					return -1
				}
			}
		}
		set min 0.012
		if {$Para(EnCLKOS) == 1 && $Para(OSBypass) == 0} {
			set ret [IsInRange "CLKOS Desired Frequency" $min $max $Para(FREQ_PIN_CLKOS)]
			if {$ret == -1} {
				set Para(BoolFlag) 0
				return -1
			}
			if {$Para(fb_mode) == "CLKOS"} {
				if {$Para(FREQ_PIN_CLKOS) < "7"} {
					set msg "The Feedback frequency must be greater than 7 MHz.  (Ffbk = Fout / N). \
					To generate a low frequency output; use a clock output not used in the feedback path."
					tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
					set Para(BoolFlag) 0
					return -1
				}
			}
		}
		if {$Para(EnCLKOS2) == 1 && $Para(OS2Bypass) == 0} {
			set ret [IsInRange "CLKOS2 Desired Frequency" $min $max $Para(FREQ_PIN_CLKOS2)]
			if {$ret == -1} {
				set Para(BoolFlag) 0
				return -1
			}
			if {$Para(fb_mode) == "CLKOS2"} {
				if {$Para(FREQ_PIN_CLKOS2) < "7"} {
					set msg "The Feedback frequency must be greater than 7 MHz.  (Ffbk = Fout / N). \
					To generate a low frequency output; use a clock output not used in the feedback path."
					tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
					set Para(BoolFlag) 0
					return -1
				}
			}
		}
		if {$Para(EnCLKOS3) == 1 && $Para(OS3Bypass) == 0} {
			set ret [IsInRange "CLKOS3 Desired Frequency" $min $max $Para(FREQ_PIN_CLKOS3)]
			if {$ret == -1} {
				set Para(BoolFlag) 0
				return -1
			}
			if {$Para(fb_mode) == "CLKOS3"} {
				if {$Para(FREQ_PIN_CLKOS3) < "7"} {
					set msg "The Feedback frequency must be greater than 7 MHz.  (Ffbk = Fout / N). \
					To generate a low frequency output; use a clock output not used in the feedback path."
					tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
					set Para(BoolFlag) 0
					return -1
				}
			}
		}
	}

#	You could call scuba with a specific option (such as "-cal "), and the 
#	DIV values and the Freq values can be written to the stdout.
#Div: 1, 1, 6, 1, 1, 1
#Freq: 100.000000, 600.000000 600.000000 600.000000
#Phase: 0, 45, 0, 0
#VCO/BW: 800.000  8.000
#The "Div:" values are for CLKI, Feedback Divider, and CLKOP, CLKOS, CLKOS2, and CLKOS3 dividers. 
#The frequency are for the CLKOP, CLKOS, CLKOS2, and CLKOS3 outputs. 
#the phase of the output clocks (CLKOP, CLKOS, CLKOS2, and CLKOS3). 

	set ret [GetStdoutStr]
	if {$ret == -1}  {return -1}

	foreach str [split $ret '\n'] {
		set str [string trim $str]
		if {[string first "Div:" $str] != -1} {
			set div_str [lindex [split $str ':'] 1]
		}
		if {[string first "Freq:" $str] != -1} {
			set freq_str [lindex [split $str ':'] 1]
		}
		if {[string first "Phase:" $str] != -1} {
			set phase_str [lindex [split $str ':'] 1]
		}
		if {[string first "VCO/BW:" $str] != -1} {
			set bw_str [lindex [split $str ':'] 1]
		} else {
			set bw_str ""
		}
	}
	set div [split $div_str ,]
	set freq [split [string trim $freq_str] " "]
	set phase [split $phase_str ,]
	if {[string first "," $bw_str] != -1} {	
		set bw_vco [split [string trim $bw_str] ,]
	} else {
		set bw_vco [split [string trim $bw_str] " "]
	}

	set Para(CLKI_DIV)  [string trim [lindex $div 0]]
	set Para(CLKFB_DIV) [string trim [lindex $div 1]]
#	set Para(CLKOP_DIV) [string trim [lindex $div 2]]
#	set Para(CLKOS_DIV) [string trim [lindex $div 3]]
#	set Para(CLKOS2_DIV) [string trim [lindex $div 4]]
#	set Para(CLKOS3_DIV) [string trim [lindex $div 5]]
	
	set adiv [string trim [lindex $div 2]]
	set bdiv [string trim [lindex $div 3]]
	set cdiv [string trim [lindex $div 4]]
	set ddiv [string trim [lindex $div 5]]
	set fdiv [string trim [lindex $div 6]]
	#tk_messageBox -default ok -icon error -message "$adiv $bdiv $cdiv $ddiv" -title "Check Parameters" -type ok
	if {$adiv >= 1} {set Para(CLKOP_DIV) $adiv}
	if {$bdiv >= 1} {set Para(CLKOS_DIV) $bdiv}
	if {$cdiv >= 1} {set Para(CLKOS2_DIV) $cdiv}
	if {$ddiv >= 1} {set Para(CLKOS3_DIV) $ddiv}
	if {$fdiv >= 0} {set Para(FRACN_DIV) $fdiv}
	
	set ret [DRC_divider]
	if {$ret == -1}  {return -1}
	
	set Para(CLKOP_AFREQ) [string trim [lindex $freq 0] ,]
	if {$Para(EnCLKOS) == 1} {set Para(CLKOS_AFREQ) [string trim [lindex $freq 1]]}
	if {$Para(EnCLKOS2) == 1} {set Para(CLKOS2_AFREQ) [string trim [lindex $freq 2]]}
	if {$Para(EnCLKOS3) == 1} {set Para(CLKOS3_AFREQ) [string trim [lindex $freq 3]]}
	
	set clkop_phaseadj  [string trim [lindex $phase 0]]
	set clkos_phaseadj  [string trim [lindex $phase 1]]
	set clkos2_phaseadj [string trim [lindex $phase 2]]
	set clkos3_phaseadj [string trim [lindex $phase 3]]

	if {$Para(OPBypass) == 0} {
		if {$Para(CLKOP_PHASEADJ) != $clkop_phaseadj} {
			set msg "The requested phase shift of CLKOP cannot be implemented."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(BoolFlag) 0
			return -1
		}
	}
	if {$Para(EnCLKOS) == 1 && $Para(OSBypass) == 0} {
		if {$Para(CLKOS_PHASEADJ) != $clkos_phaseadj} {
			set msg "The requested phase shift of CLKOS cannot be implemented."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(BoolFlag) 0
			return -1
		}
	}
	if {$Para(EnCLKOS2) == 1 && $Para(OS2Bypass) == 0} {
		if {$Para(CLKOS2_PHASEADJ) != $clkos2_phaseadj} {
			set msg "The requested phase shift of CLKOS2 cannot be implemented."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(BoolFlag) 0
			return -1
		}
	}
	if {$Para(EnCLKOS3) == 1 && $Para(OS3Bypass) == 0} {
		if {$Para(CLKOS3_PHASEADJ) != $clkos3_phaseadj} {
			set msg "The requested phase shift of CLKOS3 cannot be implemented."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(BoolFlag) 0
			return -1
		}
	}

	# Frequency Mode
	if {$Para(mode) == "Frequency"}  {
		if {$Para(OPBypass) == 0} {
			set ret [CheckTolerance "CLKOP" $Para(FREQ_PIN_CLKOP) $Para(CLKOP_AFREQ) $Para(OP_Tol)]
			if {$ret == -1} {
#				$frmClkOP.entFREQ_PIN_CLKOP.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			} else {
				$frmClkOP.entFREQ_PIN_CLKOP.lwchildsite.entry config -fg black
			} 
		}
		if {$Para(EnCLKOS) == 1 && $Para(OSBypass) == 0} {
			set ret [CheckTolerance "CLKOS" $Para(FREQ_PIN_CLKOS) $Para(CLKOS_AFREQ) $Para(OS_Tol)]
			if {$ret == -1} {
#				$frmClkOS.entFREQ_PIN_CLKOS.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			} else  {
				$frmClkOS.entFREQ_PIN_CLKOS.lwchildsite.entry config -fg black
			} 
		} 
		if {$Para(EnCLKOS2) == 1 && $Para(OS2Bypass) == 0} {
			set ret [CheckTolerance "CLKOS2" $Para(FREQ_PIN_CLKOS2) $Para(CLKOS2_AFREQ) $Para(OS2_Tol)]
			if {$ret == -1} {
#				$frmClkOS2.entFREQ_PIN_CLKOS2.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			} else  {
				$frmClkOS2.entFREQ_PIN_CLKOS2.lwchildsite.entry config -fg black
			} 
		} 
		if {$Para(EnCLKOS3) == 1 && $Para(OS3Bypass) == 0} {
			set ret [CheckTolerance "CLKOS3" $Para(FREQ_PIN_CLKOS3) $Para(CLKOS3_AFREQ) $Para(OS3_Tol)]
			if {$ret == -1} {
#				$frmClkOS3.entFREQ_PIN_CLKOS3.lwchildsite.entry config -fg red
				set Para(BoolFlag) 0
				return -1
			} else  {
				$frmClkOS3.entFREQ_PIN_CLKOS3.lwchildsite.entry config -fg black
			} 
		} 
	} 
	
	#CR_51159
	if {[$frmClkOP.cboPhaseADJ cget -state] == "normal"} {
		if {($Para(fb_mode) == "CLKOP" || $Para(fb_mode) == "INT_OP" || $Para(fb_mode) == "UserClock")
			&& $Para(CLKOP_PHASEADJ) != "0"} {
			set msg "CLKOP with a static phase shift should not be used as the feedback signal for the PLL."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(BoolFlag) 0
			return -1
		}
	}
	if {[$frmClkOS.cboPhaseADJ cget -state] == "normal"} {
		if {($Para(fb_mode) == "CLKOS" || $Para(fb_mode) == "INT_OS")
			&& $Para(CLKOS_PHASEADJ) != "0"} {
			set msg "CLKOS with a static phase shift should not be used as the feedback signal for the PLL."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(BoolFlag) 0
			return -1
		}
	}
	if {[$frmClkOS2.cboPhaseADJ cget -state] == "normal"} {
		if {($Para(fb_mode) == "CLKOS2" || $Para(fb_mode) == "INT_OS2")
			&& $Para(CLKOS2_PHASEADJ) != "0"} {
			set msg "CLKOS2 with a static phase shift should not be used as the feedback signal for the PLL."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(BoolFlag) 0
			return -1
		}
	}
	if {[$frmClkOS3.cboPhaseADJ cget -state] == "normal"} {
		if {($Para(fb_mode) == "CLKOS3" || $Para(fb_mode) == "INT_OS3")
			&& $Para(CLKOS3_PHASEADJ) != "0"} {
			set msg "CLKOS3 with a static phase shift should not be used as the feedback signal for the PLL."
			tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
			set Para(BoolFlag) 0
			return -1
		}
	}
	
	set Para(BW)  [string trim [lindex $bw_vco 1]]
	set Para(VCO)  [string trim [lindex $bw_vco 0]]
	
#	set ret [DRC]
#	if {$ret == -1}  {return -1}

	if { [string is double $Para(CLKOP_AFREQ)]} {
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

		frame $win.frmLeft
		frame $win.frmRight

		#*** PLL Type ***
###		iwidgets::combobox $win.frmLeft.cboPllType -labeltext "PLL Type" -width 10 -textvariable Para(Type) -editable false -selectioncommand {EditFreq;CallDrawPins}
###		$win.frmLeft.cboPllType insert list end epllb ehxpllb

	frame $win.frmLeft.frmMode
	radiobutton $win.frmLeft.frmMode.rdoNormal   -text "Frequency Mode" -command {EditFreq;CallDrawPins} -variable Para(mode) -value Frequency
	radiobutton $win.frmLeft.frmMode.rdoAdvanced -text "Divider Mode"   -command {EditFreq;CallDrawPins} -variable Para(mode) -value Divider
	pack $win.frmLeft.frmMode.rdoNormal $win.frmLeft.frmMode.rdoAdvanced -in $win.frmLeft.frmMode -side top -anchor w -pady 2

	#*** CLKI Frequency ***
	iwidgets::Labeledframe $win.frmLeft.frmClkI -labeltext "CLKI" -labelpos nw
	set frmClkI [$win.frmLeft.frmClkI childsite]
	iwidgets::entryfield $frmClkI.entIFrq -labeltext "Frequency" -labelpos n -width 13 -textvariable Para(CLKI) -validate real
	iwidgets::combobox   $frmClkI.cboMDiv -labeltext "Divider"   -labelpos n -width 6  -textvariable Para(CLKI_DIV) -editable false -selectioncommand EditFreq
	for {set i 1} {$i<41} {incr i}  {
		$frmClkI.cboMDiv insert list end $i
	} 
	#pack $frmClkI.entIFrq $frmClkI.cboMDiv -in $frmClkI -side left -padx 2 -fill x
	$frmClkI.entIFrq.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	iwidgets::entryfield $frmClkI.entBW -labeltext "~Bandwidth" -labelpos n -width 13 -textvariable Para(BW) -validate real;# -state disabled
	iwidgets::entryfield $frmClkI.entVCO -labeltext "VCO Freq." -labelpos n -width 13 -textvariable Para(VCO) -validate real;# -state disabled
	$frmClkI.entBW.lwchildsite.entry config -state disabled
	$frmClkI.entVCO.lwchildsite.entry config -state disabled
	grid $frmClkI.entIFrq $frmClkI.cboMDiv -in $frmClkI;# -side left -padx 2 -fill x
	grid $frmClkI.entBW $frmClkI.entVCO -in $frmClkI

	#*** CLKFB ***
	iwidgets::Labeledframe $win.frmLeft.frmClkFB -labeltext "CLKFB" -labelpos nw
	set frmClkFB [$win.frmLeft.frmClkFB childsite]
	iwidgets::combobox $frmClkFB.cboFB_Mode -labeltext "FBK Mode" -labelpos n -width 12 -textvariable Para(fb_mode) -editable false -selectioncommand {EditFreq;CallDrawPins}
	iwidgets::combobox $frmClkFB.cboNDiv    -labeltext "FBK Divider"      -labelpos n -width 6  -textvariable Para(CLKFB_DIV) -editable false -selectioncommand EditFreq
#	$frmClkFB.cboFB_Mode insert list end CLKOP CLKOS CLKOS2 CLKOS3 INT_DIVA INT_DIVB INT_DIVC INT_DIVD "User Clock"
	$frmClkFB.cboFB_Mode insert list end CLKOP CLKOS CLKOS2 CLKOS3 INT_OP INT_OS INT_OS2 INT_OS3 "UserClock"
	for {set i 1} {$i<41} {incr i}  {
		$frmClkFB.cboNDiv insert list end $i
	} 
	label $frmClkFB.lblFNDiv -text "Fractional-N Divider (0 - 65535)"
	checkbutton $frmClkFB.cbEnFRACN -text "Enable" -variable Para(FRACN_ENABLE) -command {EditFreq;CallDrawPins}
	iwidgets::entryfield $frmClkFB.entFNDiv -labeltext "" -labelpos n -width 7 -fixed 5 -textvariable Para(FRACN_DIV) -validate integer
	grid $frmClkFB.cboFB_Mode $frmClkFB.cboNDiv -in $frmClkFB;# -side left -padx 2 -fill x
	grid $frmClkFB.lblFNDiv -columnspan 2 -in $frmClkFB
	grid $frmClkFB.cbEnFRACN $frmClkFB.entFNDiv -in $frmClkFB

	#***Optional Port Selections ***
	iwidgets::Labeledframe $win.frmLeft.frmOPS -labeltext "Optional Port Selections" -labelpos nw
	set frmOPS [$win.frmLeft.frmOPS childsite]
	checkbutton $frmOPS.cbDynamicPhase -text "Dynamic Phase Ports" -variable Para(DynamicPhase) -command {EditFreq;CallDrawPins} -offvalue STATIC -onvalue DYNAMIC
	checkbutton $frmOPS.cbClkEnable    -text "Clock Enable Ports" -variable Para(ClkEnable) -command {EditFreq;CallDrawPins}
	checkbutton $frmOPS.cbStandby	   -text "Standby Ports" -variable Para(Standby) -command {EditFreq;CallDrawPins}
	checkbutton $frmOPS.cbEnable_sel   -text "Enable Clock Select" -variable Para(Enable_sel) -command {EditFreq;CallDrawPins}
	pack $frmOPS.cbDynamicPhase $frmOPS.cbClkEnable $frmOPS.cbStandby $frmOPS.cbEnable_sel -in $frmOPS -anchor w
	
	#***PLL Reset Options ***
	iwidgets::Labeledframe $win.frmLeft.frmPRO -labeltext "PLL Reset Options" -labelpos nw
	set frmPRO [$win.frmLeft.frmPRO childsite]
	checkbutton $frmPRO.cbPLLRst    -text "Provide PLL Reset" -variable Para(PLLRst) -command {EditFreq;CallDrawPins}
	checkbutton $frmPRO.cbPLLMRst   -text "Provide PLLM Reset" -variable Para(PLLMRst) -command {EditFreq;CallDrawPins}
	checkbutton $frmPRO.cbClkOS2Rst -text "PLL CLKOS2 Reset" -variable Para(ClkOS2Rst) -command {EditFreq;CallDrawPins}
	checkbutton $frmPRO.cbClkOS3Rst -text "PLL CLKOS3 Reset" -variable Para(ClkOS3Rst) -command {EditFreq;CallDrawPins}
	pack $frmPRO.cbPLLRst $frmPRO.cbPLLMRst $frmPRO.cbClkOS2Rst $frmPRO.cbClkOS3Rst -in $frmPRO -anchor w
	
	#***Lock Settings ***
	iwidgets::Labeledframe $win.frmLeft.frmLock -labeltext "Lock Settings" -labelpos nw
	set frmLock [$win.frmLeft.frmLock childsite]
	checkbutton $frmLock.cbLockSig -text "Provide PLL Lock signal" -variable Para(LockSig) -command {EditFreq;CallDrawPins}
	checkbutton $frmLock.cbLockStk -text "PLL Lock is Sticky" -variable Para(LockStk) -command {EditFreq;CallDrawPins}
	pack $frmLock.cbLockSig -in $frmLock -anchor w
	pack $frmLock.cbLockStk -in $frmLock -anchor w -padx 20

	#***Wishbone BUS ***
	iwidgets::Labeledframe $win.frmLeft.frmWB -labeltext "Wishbone BUS" -labelpos nw
	set frmWB [$win.frmLeft.frmWB childsite]
	checkbutton $frmWB.cbWBProt -text "Provide WB Ports" -variable Para(WBProt) -command {EditFreq;CallDrawPins}
	label $frmWB.lblReq -text "Requires instantiation"
	label $frmWB.lblEFB -text "of EFB block"
	pack $frmWB.cbWBProt -in $frmWB -anchor w
	pack $frmWB.lblReq -in $frmWB -anchor w -padx 20
	pack $frmWB.lblEFB -in $frmWB -anchor w -padx 20

	button $win.frmRight.btnCal -text "Calculate" -width 16 -command {CalculateCmd}

	#*** CLKOP Frequency ***
	iwidgets::Labeledframe $win.frmRight.frmClkOP -labeltext "CLKOP" -labelpos nw
	set frmClkOP [$win.frmRight.frmClkOP childsite]
	checkbutton $frmClkOP.cbOPBypass -text "Bypass" -variable Para(OPBypass) -command {EditFreq;CallDrawPins}
	checkbutton $frmClkOP.cbUseDiv  -text "Clock Divider" -variable Para(OPUseDiv) -command {EditFreq;CallDrawPins}
	iwidgets::combobox   $frmClkOP.cboVDiv   -labeltext "\nDivider"            -labelpos n -width 6  -textvariable Para(CLKOP_DIV) -editable false -selectioncommand EditFreq
	iwidgets::entryfield $frmClkOP.entFREQ_PIN_CLKOP -labeltext "Desired\nFrequency" -labelpos n -width 12 -textvariable Para(FREQ_PIN_CLKOP) -validate real
	iwidgets::combobox   $frmClkOP.cboOP_Tol -labeltext "\nTolerance %"          -labelpos n -width 8  -textvariable Para(OP_Tol) -editable false -selectioncommand EditFreq
	iwidgets::entryfield $frmClkOP.entCLKOP_AFREQ   -labeltext "Actual\nFrequency"    -labelpos n -width 12 -textvariable Para(CLKOP_AFREQ) -fixed 10 -state disabled -disabledforeground black
	for {set i 1} {$i<129} {incr i} {
		$frmClkOP.cboVDiv insert list end $i
	} 
	$frmClkOP.cboOP_Tol insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
	$frmClkOP.entFREQ_PIN_CLKOP.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	iwidgets::combobox $frmClkOP.cboPhaseADJ -labeltext "Static Phase Shift\n- degrees" -textvariable Para(CLKOP_PHASEADJ) -labelpos n -width 6 -selectioncommand EditFreq -editable false
	#$frmClkOP.cboPhaseADJ insert list end 0 22.5 45 67.5 90 112.5 135 157.5 180 202.5 225 247.5 270 292.5 315 337.5
	$frmClkOP.cboPhaseADJ insert list end 0 45 90 135 180 225 270 315	
	iwidgets::Labeledframe $frmClkOP.frmTrimP -labeltext "Duty Trim Options" -labelpos nw
	set frmTrimP [$frmClkOP.frmTrimP childsite]
	radiobutton $frmTrimP.rdoTrimP0 -text "Rising" -variable Para(CLKOP_TRIM_POL) -value Rising -command {EditFreq;CallDrawPins}
	radiobutton $frmTrimP.rdoTrimP1 -text "Falling" -variable Para(CLKOP_TRIM_POL) -value Falling -command {EditFreq;CallDrawPins}
	iwidgets::combobox $frmTrimP.cboDelayMultP -labeltext "Delay Multiplier" -textvariable Para(CLKOP_TRIM_DELAY) -labelpos n -width 6 -editable false -selectioncommand EditFreq
	#pack $frmTrimP.rdoTrimP0 $frmTrimP.rdoTrimP1 $frmTrimP.cboDelayMultP -in $frmTrimP -side left -padx 2
	$frmTrimP.cboDelayMultP insert list end 0 1 2 4
	grid $frmTrimP.rdoTrimP0 -row 0 -column 0 -in $frmTrimP
	grid $frmTrimP.rdoTrimP1 -row 1 -column 0 -in $frmTrimP
	grid $frmTrimP.cboDelayMultP -row 0 -column 1 -rowspan 2 -in $frmTrimP -padx 8
	
	grid $frmClkOP.cbOPBypass -row 0 -column 1 -columnspan 2 -in $frmClkOP
	grid $frmClkOP.cbUseDiv -row 0 -column 3 -in $frmClkOP
	grid $frmClkOP.entFREQ_PIN_CLKOP $frmClkOP.cboOP_Tol $frmClkOP.cboVDiv $frmClkOP.entCLKOP_AFREQ -in $frmClkOP -ipadx 2
	grid $frmClkOP.cboPhaseADJ -columnspan 2 -in $frmClkOP
	grid $frmClkOP.frmTrimP -row 2 -column 2 -columnspan 2 -in $frmClkOP -columnspan 3
	#grid $frmClkOP.frmTrimP -in $frmClkOP -columnspan 4

	#*** CLKOS ***
	iwidgets::Labeledframe $win.frmRight.frmClkOS -labeltext "CLKOS" -labelpos nw
	set frmClkOS [$win.frmRight.frmClkOS childsite]
	checkbutton $frmClkOS.cbEnClkOS -text "Enable" -variable Para(EnCLKOS) -command {EditFreq;CallDrawPins}
	checkbutton $frmClkOS.cbOSBypass -text "Bypass" -variable Para(OSBypass) -command {EditFreq;CallDrawPins}
	checkbutton $frmClkOS.cbUseDiv  -text "Clock Divider" -variable Para(OSUseDiv) -command {EditFreq;CallDrawPins}
	iwidgets::combobox   $frmClkOS.cboVDiv   -labeltext "\nDivider"            -labelpos n -width 6  -textvariable Para(CLKOS_DIV) -editable false -selectioncommand EditFreq
	iwidgets::entryfield $frmClkOS.entFREQ_PIN_CLKOS -labeltext "Desired\nFrequency" -labelpos n -width 12 -textvariable Para(FREQ_PIN_CLKOS) -validate real
	iwidgets::combobox   $frmClkOS.cboOS_Tol -labeltext "\nTolerance %"          -labelpos n -width 8  -textvariable Para(OS_Tol) -editable false -selectioncommand EditFreq
	iwidgets::entryfield $frmClkOS.entCLKOS_AFREQ   -labeltext "Actual\nFrequency"    -labelpos n -width 12 -textvariable Para(CLKOS_AFREQ) -fixed 10 -state disabled -disabledforeground black
	for {set i 1} {$i<129} {incr i} {
		$frmClkOS.cboVDiv insert list end $i
	} 
	$frmClkOS.cboOS_Tol insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
	$frmClkOS.entFREQ_PIN_CLKOS.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	iwidgets::combobox $frmClkOS.cboPhaseADJ -labeltext "Static Phase Shift\n- degrees" -textvariable Para(CLKOS_PHASEADJ) -labelpos n -width 6 -selectioncommand EditFreq -editable false
	$frmClkOS.cboPhaseADJ insert list end 0 45 90 135 180 225 270 315
	iwidgets::Labeledframe $frmClkOS.frmTrimS -labeltext "Duty Trim Options" -labelpos nw
	set frmTrimS [$frmClkOS.frmTrimS childsite]
	radiobutton $frmTrimS.rdoTrimS0 -text "Rising" -variable Para(CLKOS_TRIM_POL) -value Rising -command {EditFreq;CallDrawPins}
	radiobutton $frmTrimS.rdoTrimS1 -text "Falling" -variable Para(CLKOS_TRIM_POL) -value Falling -command {EditFreq;CallDrawPins}
	iwidgets::combobox $frmTrimS.cboDelayMultS -labeltext "Delay Multiplier" -textvariable Para(CLKOS_TRIM_DELAY) -labelpos n -width 6 -editable false -selectioncommand EditFreq
	#pack $frmTrimS.rdoTrimS0 $frmTrimS.rdoTrimS1 $frmTrimS.cboDelayMultS -in $frmTrimS -side left -padx 2
	$frmTrimS.cboDelayMultS insert list end 0 1 2 4
	grid $frmTrimS.rdoTrimS0 -row 0 -column 0 -in $frmTrimS
	grid $frmTrimS.rdoTrimS1 -row 1 -column 0 -in $frmTrimS
	grid $frmTrimS.cboDelayMultS -row 0 -column 1 -rowspan 2 -in $frmTrimS -padx 8
	
	grid $frmClkOS.cbEnClkOS -row 0 -column 0 -in $frmClkOS -sticky w
	grid $frmClkOS.cbOSBypass -row 0 -column 1 -columnspan 2 -in $frmClkOS
	grid $frmClkOS.cbUseDiv -row 0 -column 3 -in $frmClkOS
	grid $frmClkOS.entFREQ_PIN_CLKOS $frmClkOS.cboOS_Tol $frmClkOS.cboVDiv $frmClkOS.entCLKOS_AFREQ -in $frmClkOS -ipadx 2
	grid $frmClkOS.cboPhaseADJ -columnspan 2 -in $frmClkOS
	grid $frmClkOS.frmTrimS -row 2 -column 2 -columnspan 2 -in $frmClkOS -columnspan 3

	#*** CLKOS2 Frequency ***
	iwidgets::Labeledframe $win.frmRight.frmClkOS2 -labeltext "CLKOS2" -labelpos nw
	set frmClkOS2 [$win.frmRight.frmClkOS2 childsite]
	checkbutton $frmClkOS2.cbEnClkOS2 -text "Enable" -variable Para(EnCLKOS2) -command {EditFreq;CallDrawPins}
	checkbutton $frmClkOS2.cbOS2Bypass -text "Bypass" -variable Para(OS2Bypass) -command {EditFreq;CallDrawPins}
	checkbutton $frmClkOS2.cbUseDiv  -text "Clock Divider" -variable Para(OS2UseDiv) -command {EditFreq;CallDrawPins}
	iwidgets::combobox   $frmClkOS2.cboVDiv   -labeltext "\nDivider"            -labelpos n -width 6  -textvariable Para(CLKOS2_DIV) -editable false -selectioncommand EditFreq
	iwidgets::entryfield $frmClkOS2.entFREQ_PIN_CLKOS2 -labeltext "Desired\nFrequency" -labelpos n -width 12 -textvariable Para(FREQ_PIN_CLKOS2) -validate real
	iwidgets::combobox   $frmClkOS2.cboOS2_Tol -labeltext "\nTolerance %"          -labelpos n -width 8  -textvariable Para(OS2_Tol) -editable false -selectioncommand EditFreq
	iwidgets::entryfield $frmClkOS2.entCLKOS2_AFREQ   -labeltext "Actual\nFrequency"    -labelpos n -width 12 -textvariable Para(CLKOS2_AFREQ) -fixed 10 -state disabled -disabledforeground black
	for {set i 1} {$i<129} {incr i} {
		$frmClkOS2.cboVDiv insert list end $i
	} 
	$frmClkOS2.cboOS2_Tol insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
	$frmClkOS2.entFREQ_PIN_CLKOS2.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	iwidgets::combobox $frmClkOS2.cboPhaseADJ -labeltext "Static Phase Shift - degrees" -textvariable Para(CLKOS2_PHASEADJ) -width 10 -selectioncommand EditFreq -editable false
	$frmClkOS2.cboPhaseADJ insert list end 0 45 90 135 180 225 270 315
	
	grid $frmClkOS2.cbEnClkOS2 -row 0 -column 0 -in $frmClkOS2 -sticky w
	grid $frmClkOS2.cbOS2Bypass -row 0 -column 1 -columnspan 2 -in $frmClkOS2
	grid $frmClkOS2.cbUseDiv -row 0 -column 3 -in $frmClkOS2
	grid $frmClkOS2.entFREQ_PIN_CLKOS2 $frmClkOS2.cboOS2_Tol $frmClkOS2.cboVDiv $frmClkOS2.entCLKOS2_AFREQ -in $frmClkOS2 -ipadx 2
	grid $frmClkOS2.cboPhaseADJ -columnspan 4 -in $frmClkOS2 -sticky w -pady 2
	
	#*** CLKOS3 Frequency ***
	iwidgets::Labeledframe $win.frmRight.frmClkOS3 -labeltext "CLKOS3" -labelpos nw
	set frmClkOS3 [$win.frmRight.frmClkOS3 childsite]
	checkbutton $frmClkOS3.cbEnClkOS3 -text "Enable" -variable Para(EnCLKOS3) -command {EditFreq;CallDrawPins}
	checkbutton $frmClkOS3.cbOS3Bypass -text "Bypass" -variable Para(OS3Bypass) -command {EditFreq;CallDrawPins}
	checkbutton $frmClkOS3.cbUseDiv  -text "Clock Divider" -variable Para(OS3UseDiv) -command {EditFreq;CallDrawPins}
	iwidgets::combobox   $frmClkOS3.cboVDiv   -labeltext "\nDivider"            -labelpos n -width 6  -textvariable Para(CLKOS3_DIV) -editable false -selectioncommand EditFreq
	iwidgets::entryfield $frmClkOS3.entFREQ_PIN_CLKOS3 -labeltext "Desired\nFrequency" -labelpos n -width 12 -textvariable Para(FREQ_PIN_CLKOS3) -validate real
	iwidgets::combobox   $frmClkOS3.cboOS3_Tol -labeltext "\nTolerance %"          -labelpos n -width 8  -textvariable Para(OS3_Tol) -editable false -selectioncommand EditFreq
	iwidgets::entryfield $frmClkOS3.entCLKOS3_AFREQ   -labeltext "Actual\nFrequency"    -labelpos n -width 12 -textvariable Para(CLKOS3_AFREQ) -fixed 10 -state disabled -disabledforeground black
	for {set i 1} {$i<129} {incr i} {
		$frmClkOS3.cboVDiv insert list end $i
	} 
	$frmClkOS3.cboOS3_Tol insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
	$frmClkOS3.entFREQ_PIN_CLKOS3.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	iwidgets::combobox $frmClkOS3.cboPhaseADJ -labeltext "Static Phase Shift - degrees" -textvariable Para(CLKOS3_PHASEADJ) -width 10 -selectioncommand EditFreq -editable false
	$frmClkOS3.cboPhaseADJ insert list end 0 45 90 135 180 225 270 315
	
	grid $frmClkOS3.cbEnClkOS3 -row 0 -column 0 -in $frmClkOS3 -sticky w
	grid $frmClkOS3.cbOS3Bypass -row 0 -column 1 -columnspan 2 -in $frmClkOS3
	grid $frmClkOS3.cbUseDiv -row 0 -column 3 -in $frmClkOS3
	grid $frmClkOS3.entFREQ_PIN_CLKOS3 $frmClkOS3.cboOS3_Tol $frmClkOS3.cboVDiv $frmClkOS3.entCLKOS3_AFREQ -in $frmClkOS3 -ipadx 2
	grid $frmClkOS3.cboPhaseADJ -columnspan 4 -in $frmClkOS3 -sticky w -pady 2
	
	#GUI pack
	pack $win.frmLeft.frmMode $win.frmLeft.frmClkI $win.frmLeft.frmClkFB -in $win.frmLeft -fill x -anchor w
	pack $win.frmLeft.frmOPS $win.frmLeft.frmPRO $win.frmLeft.frmLock $win.frmLeft.frmWB -in $win.frmLeft -fill x -anchor w
	
	pack $win.frmRight.frmClkOP $win.frmRight.frmClkOS $win.frmRight.frmClkOS2 $win.frmRight.frmClkOS3 -in $win.frmRight -fill x
	pack $win.frmRight.btnCal -in $win.frmRight -anchor e
		
pack $win.frmLeft $win.frmRight -in $win -side left
pack .sf -in $frmProperty -fill both -expand yes	
	pack .frmProperties -in $page -side top -fill both -expand 1

		#17787 - depend on pshin 11/24/03
		set Para(Expression) None
		set Para(Order)      None

###		pack forget $win.frmLeft.cboPllType

		$tnb view 0

	EditFreq

	GeneralConfig
	$Para(generate_cfg) configure -state disabled
}
