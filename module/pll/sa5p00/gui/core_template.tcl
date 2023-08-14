#$Header: L:/module/pll/sa5p00/gui/core_template.tcl 1.3 mghuang Exp $

#Rev 1.7: Diamond 3.6 IPExpress: Sapphire SCR_1110 from 10Mhz to 8Mhz
#Rev 1.3: Diamond 3.3 IPExpress: Fixed SOF-122745
#Rev 1.4: Diamond 3.3 IPExpress: Fixed SOF-121249
#Rev 1.3: Diamond 3.2 IPExpress: SCR_1080
#Rev 1.2: Diamond 3.0: SCR_1059
#Rev 1.1: Diamond 2.2: Remove Fractional-N divider.
#Rev 1.0: Diamond 2.1: Initial version

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	if {[string length $Para(CLKI_FREQ)] > 0 &&
		[string length $Para(CLKOP_FREQ)] > 0 &&
		[string length $Para(CLKOS_FREQ)] > 0 &&
		[string length $Para(CLKOS2_FREQ)] > 0 &&
		[string length $Para(CLKOS3_FREQ)] > 0 &&
		[string length $Para(CLKOP_DPHASE)] > 0 &&
		[string length $Para(CLKOS_DPHASE)] > 0 &&
		[string length $Para(CLKOS2_DPHASE)] > 0 &&
		[string length $Para(CLKOS3_DPHASE)] > 0 }  {DrawBusPins} 
} 

proc SetDivider {str val}  {
	if {[regexp {([0-9]+)\(([0-9]+)\)} $val match x y]}  {
		set msg "$str Divider cannot take user specified value of $x. \nThe legal values are $y."
		tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		return $y
	} else {
		return $val
	}
} 

proc CheckTolerance {str req act tol}  {
	global Para
	set t1 [expr abs($req-$act)]
	set t2 [expr $req*$tol/100]
	if {$t1 > $t2}  {
		#set msg "The Requested Frequency of $str cannot be generated. \nTry to change the Desired Frequency or Tolerance."
		set msg "The Requested Frequencies cannot be generated. Try to change to Desired Frequency or Tolerance."
		tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		return -1
	} 
	return 0
} 

proc RemoveFBOptions {key} {
	global Para
	set lst {}
	set n [.cboFEEDBK_PATH size]
	for {set i 0} {$i < $n} {incr i} {
		set str [.cboFEEDBK_PATH get $i]
		if {$str != $key} {
			lappend lst $str
		}
	}
	.cboFEEDBK_PATH clear list
	foreach item $lst {
		.cboFEEDBK_PATH insert list end $item
	}
	if {$Para(FEEDBK_PATH) == $key} {set Para(FEEDBK_PATH) [.cboFEEDBK_PATH get 0]}	
	if {$Para(FEEDBK_PATH) == "" && [.cboFEEDBK_PATH size] > 0} {set Para(FEEDBK_PATH) [.cboFEEDBK_PATH get 0]}	
}

proc FrequencyDRC {} {
	global Para 
	
	set min 8.0000
	set max 625.0000
	set ret [IsInRange "CLKI Frequency" $min $max $Para(CLKI_FREQ)]
	if {$ret == -1} {return -1}

	set min 3.125
	set max 400.0000
	set frequency 8
	if {$Para(CLKOP_MUXA) == "DISABLED"} {
		set ret [IsInRange "CLKOP Frequency" $min $max $Para(CLKOP_FREQ)]
		if {$ret == -1} {return -1}
		if {$Para(FEEDBK_PATH) == "CLKOP"} {
			if {$Para(CLKOP_FREQ) < "$frequency"} {
				set msg "The Feedback frequency must be greater than $frequency MHz.  (Ffbk = Fout / N). \
				To generate a low frequency output; use a clock output not used in the feedback path."
				tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
				return -1
			}
		}
	}
	if {$Para(CLKOS_Enable) == "ENABLED" && $Para(CLKOS_MUXB) == "DISABLED"} {
		set ret [IsInRange "CLKOS Frequency" $min $max $Para(CLKOS_FREQ)]
		if {$ret == -1} {return -1}
		if {$Para(FEEDBK_PATH) == "CLKOS"} {
			if {$Para(CLKOS_FREQ) < "$frequency"} {
				set msg "The Feedback frequency must be greater than $frequency MHz.  (Ffbk = Fout / N). \
				To generate a low frequency output; use a clock output not used in the feedback path."
				tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
				return -1
			}
		}
	}
	if {$Para(CLKOS2_Enable) == "ENABLED" && $Para(CLKOS2_MUXC) == "DISABLED"} {
		set ret [IsInRange "CLKOS2 Frequency" $min $max $Para(CLKOS2_FREQ)]
		if {$ret == -1} {return -1}
		if {$Para(FEEDBK_PATH) == "CLKOS2"} {
			if {$Para(CLKOS2_FREQ) < "$frequency"} {
				set msg "The Feedback frequency must be greater than $frequency MHz.  (Ffbk = Fout / N). \
				To generate a low frequency output; use a clock output not used in the feedback path."
				tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
				return -1
			}
		}
	}
	if {$Para(CLKOS3_Enable) == "ENABLED" && $Para(CLKOS3_MUXD) == "DISABLED"} {
		set ret [IsInRange "CLKOS3 Frequency" $min $max $Para(CLKOS3_FREQ)]
		if {$ret == -1} {return -1}
		if {$Para(FEEDBK_PATH) == "CLKOS3"} {
			if {$Para(CLKOS3_FREQ) < "$frequency"} {
				set msg "The Feedback frequency must be greater than $frequency MHz.  (Ffbk = Fout / N). \
				To generate a low frequency output; use a clock output not used in the feedback path."
				tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
				return -1
			}
		}
	}

	return 0
}

proc DividerDRC {} {
	global Para
	
	set Para(CLKI_DIV) [SetDivider "CLKI Divider" $Para(CLKI_DIV)]
	set Para(CLKFB_DIV) [SetDivider "CLKFB Divider" $Para(CLKFB_DIV)]
	
	if {$Para(CLKOP_MUXA) == "DISABLED"} {
		set Para(CLKOP_DIV) [SetDivider "CLKOP Divider" $Para(adiv)]
	}
	if {$Para(CLKOS_Enable) == "ENABLED" && $Para(CLKOS_MUXB) == "DISABLED"} {
		set Para(CLKOS_DIV) [SetDivider "CLKOS Divider" $Para(bdiv)]
	}
	if {$Para(CLKOS2_Enable) == "ENABLED" && $Para(CLKOS2_MUXC) == "DISABLED"} {
		set Para(CLKOS2_DIV) [SetDivider "CLKOS2 Divider" $Para(cdiv)]
	}
	if {$Para(CLKOS3_Enable) == "ENABLED" && $Para(CLKOS3_MUXD) == "DISABLED"} {
		set Para(CLKOS3_DIV) [SetDivider "CLKOS3 Divider" $Para(ddiv)]
	}
	
	return 0
}

proc ToleranceDRC {} {
	global Para
	
	if {$Para(CLKOP_MUXA) == "DISABLED"} {
		set ret [CheckTolerance "CLKOP" $Para(CLKOP_FREQ) $Para(CLKOP_ACTUAL_FREQ) $Para(CLKOP_TOL)]
		if {$ret == -1} {return -1}
	}
	if {$Para(CLKOS_Enable) == "ENABLED" && $Para(CLKOS_MUXB) == "DISABLED"} {
		set ret [CheckTolerance "CLKOS" $Para(CLKOS_FREQ) $Para(CLKOS_ACTUAL_FREQ) $Para(CLKOS_TOL)]
		if {$ret == -1} {return -1}
	}
	if {$Para(CLKOS2_Enable) == "ENABLED" && $Para(CLKOS2_MUXC) == "DISABLED"} {
		set ret [CheckTolerance "CLKOS2" $Para(CLKOS2_FREQ) $Para(CLKOS2_ACTUAL_FREQ) $Para(CLKOS2_TOL)]
		if {$ret == -1} {return -1}
	}
	if {$Para(CLKOS3_Enable) == "ENABLED" && $Para(CLKOS3_MUXD) == "DISABLED"} {
		set ret [CheckTolerance "CLKOS3" $Para(CLKOS3_FREQ) $Para(CLKOS3_ACTUAL_FREQ) $Para(CLKOS3_TOL)]
		if {$ret == -1} {return -1}
	}
	
	return 0
}

proc PhaseDRC {} {
	global Para
	
	if {$Para(CLKOP_MUXA) == "DISABLED"} {
		if {$Para(FEEDBK_PATH) != "CLKOP"} {
			if {$Para(CLKOP_DPHASE) != $Para(CLKOP_APHASE)} {
				set msg "The requested phase shift of CLKOP cannot be implemented."
				tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
				return -1
			}
		}
	}
	if {$Para(CLKOS_Enable) == "ENABLED" && $Para(CLKOS_MUXB) == "DISABLED"} {
		if {$Para(FEEDBK_PATH) != "CLKOS"} {
			if {$Para(CLKOS_DPHASE) != $Para(CLKOS_APHASE)} {
				set msg "The requested phase shift of CLKOS cannot be implemented."
				tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
				return -1
			}
		}
	}
	if {$Para(CLKOS2_Enable) == "ENABLED" && $Para(CLKOS2_MUXC) == "DISABLED"} {
		if {$Para(FEEDBK_PATH) != "CLKOS2"} {
			if {$Para(CLKOS2_DPHASE) != $Para(CLKOS2_APHASE)} {
				set msg "The requested phase shift of CLKOS2 cannot be implemented."
				tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
				return -1
			}
		}
	}
	if {$Para(CLKOS3_Enable) == "ENABLED" && $Para(CLKOS3_MUXD) == "DISABLED"} {
		if {$Para(FEEDBK_PATH) != "CLKOS3"} {
			if {$Para(CLKOS3_DPHASE) != $Para(CLKOS3_APHASE)} {
				set msg "The requested phase shift of CLKOS3 cannot be implemented."
				tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
				return -1
			}
		}
	}
	
	return 0
}

proc ChangeValueCmd {} {
	global Para 
	
	set min 8.0000
	set max 625.0000
	if {$Para(CLKI_FREQ) < $min || $Para(CLKI_FREQ) > $max} {
		.entCLKI_FREQ.lwchildsite.entry config -fg red
	} else  {
		.entCLKI_FREQ.lwchildsite.entry config -fg black
	} 
	
	#Fractional N Enable setting
	if {$Para(FRACN_ENABLE) == "DISABLED"} {
		.entFRACN_DIV config -state disabled -disabledforeground gray
	} else {
		.entFRACN_DIV config -state disabled -disabledforeground black
	}
	
	if {$Para(REFERENCE) == "0"} {
		.lblIOBUF config -state disabled
		.cboIOBUF config -state disabled
	} else {
		.lblIOBUF config -state normal
		.cboIOBUF config -state normal
	}
	
	.cboFEEDBK_PATH clear list
	.cboFEEDBK_PATH insert list end CLKOP CLKOS CLKOS2 CLKOS3 INT_OP INT_OS INT_OS2 INT_OS3 "UserClock"

	#CLKOP Bypass setting
	if {$Para(CLKOP_MUXA) == "ENABLED"} {
		RemoveFBOptions CLKOP	
		RemoveFBOptions INT_OP	
		RemoveFBOptions UserClock	
		.entCLKOP_FREQ config -state disabled
		.cboCLKOP_TOL  config -state disabled
		.entCLKOP_DIV         config -state disabled -disabledforeground gray
		.entCLKOP_ACTUAL_FREQ config -state disabled -disabledforeground gray
		
		.entCLKOP_DPHASE     config -state disabled
		.entCLKOP_APHASE     config -state disabled -disabledforeground gray
		.rdoCLKOP_TRIM_POL0  config -state disabled
		.rdoCLKOP_TRIM_POL1  config -state disabled
		.cboCLKOP_TRIM_DELAY config -state disabled
		
		.cbENABLE_CLKOP      config -state disabled
		set Para(ENABLE_CLKOP) DISABLED
	} else {
		.entCLKOP_FREQ config -state normal
		.cboCLKOP_TOL  config -state normal
		.entCLKOP_DIV         config -state disabled -disabledforeground black
		.entCLKOP_ACTUAL_FREQ config -state disabled -disabledforeground black

		.entCLKOP_DPHASE     config -state normal
		.entCLKOP_APHASE     config -state disabled -disabledforeground black
		.rdoCLKOP_TRIM_POL0  config -state normal
		.rdoCLKOP_TRIM_POL1  config -state normal
		.cboCLKOP_TRIM_DELAY config -state normal

		if {$Para(FEEDBK_PATH) == "CLKOP" || $Para(FEEDBK_PATH) == "INT_OP"} {
			.cbENABLE_CLKOP      config -state disabled
			set Para(ENABLE_CLKOP) DISABLED
			
			.entCLKOP_DPHASE     config -state disabled
			.entCLKOP_APHASE     config -state disabled -disabledforeground gray
			.rdoCLKOP_TRIM_POL0  config -state disabled
			.rdoCLKOP_TRIM_POL1  config -state disabled
			.cboCLKOP_TRIM_DELAY config -state disabled
		} else {
			#CR_53569
			if {$Para(FEEDBK_PATH) == "UserClock"} {
				.cbENABLE_CLKOP      config -state disabled
				set Para(ENABLE_CLKOP) DISABLED
			} else {
				.cbENABLE_CLKOP      config -state normal
			}
		}
	}
	
	#CLKOS Enable setting
	if {$Para(CLKOS_Enable) == "DISABLED"} {
		RemoveFBOptions CLKOS	
		RemoveFBOptions INT_OS	
		set Para(CLKOS_MUXB) "DISABLED"
		.cbCLKOS_MUXB  config -state disabled
		.entCLKOS_FREQ config -state disabled
		.cboCLKOS_TOL  config -state disabled
		.entCLKOS_DIV         config -state disabled -disabledforeground gray
		.entCLKOS_ACTUAL_FREQ config -state disabled -disabledforeground gray
		
		.entCLKOS_DPHASE     config -state disabled
		.entCLKOS_APHASE     config -state disabled -disabledforeground gray
		.rdoCLKOS_TRIM_POL0  config -state disabled
		.rdoCLKOS_TRIM_POL1  config -state disabled
		.cboCLKOS_TRIM_DELAY config -state disabled
		
		.cbENABLE_CLKOS      config -state disabled
		set Para(ENABLE_CLKOS) DISABLED
	} else {
		.cbCLKOS_MUXB  config -state normal
		#CLKOS Bypass setting
		if {$Para(CLKOS_MUXB) == "ENABLED"} {
			RemoveFBOptions CLKOS	
			RemoveFBOptions INT_OS	
			.entCLKOS_FREQ config -state disabled
			.cboCLKOS_TOL  config -state disabled
			.entCLKOS_DIV         config -state disabled -disabledforeground gray
			.entCLKOS_ACTUAL_FREQ config -state disabled -disabledforeground gray
			
			.entCLKOS_DPHASE     config -state disabled
			.entCLKOS_APHASE     config -state disabled -disabledforeground gray
			.rdoCLKOS_TRIM_POL0  config -state disabled
			.rdoCLKOS_TRIM_POL1  config -state disabled
			.cboCLKOS_TRIM_DELAY config -state disabled
			
			.cbENABLE_CLKOS      config -state disabled
			set Para(ENABLE_CLKOS) DISABLED
		} else {
			.entCLKOS_FREQ config -state normal
			.cboCLKOS_TOL  config -state normal
			.entCLKOS_DIV         config -state disabled -disabledforeground black
			.entCLKOS_ACTUAL_FREQ config -state disabled -disabledforeground black
			
			.entCLKOS_DPHASE     config -state normal
			.entCLKOS_APHASE     config -state disabled -disabledforeground black
			.rdoCLKOS_TRIM_POL0  config -state normal
			.rdoCLKOS_TRIM_POL1  config -state normal
			.cboCLKOS_TRIM_DELAY config -state normal
			
			if {$Para(FEEDBK_PATH) == "CLKOS" || $Para(FEEDBK_PATH) == "INT_OS"} {
				.cbENABLE_CLKOS      config -state disabled
				set Para(ENABLE_CLKOS) DISABLED

				.entCLKOS_DPHASE     config -state disabled
				.entCLKOS_APHASE     config -state disabled -disabledforeground gray
				.rdoCLKOS_TRIM_POL0  config -state disabled
				.rdoCLKOS_TRIM_POL1  config -state disabled
				.cboCLKOS_TRIM_DELAY config -state disabled
			} else {
				.cbENABLE_CLKOS      config -state normal
			}
		}
	}
	
	#CLKOS2 Enable setting
	if {$Para(CLKOS2_Enable) == "DISABLED"} {
		RemoveFBOptions CLKOS2	
		RemoveFBOptions INT_OS2	
		set Para(CLKOS2_MUXC) "DISABLED"
		.cbCLKOS2_MUXC  config -state disabled
		.entCLKOS2_FREQ config -state disabled
		.cboCLKOS2_TOL  config -state disabled
		.entCLKOS2_DIV         config -state disabled -disabledforeground gray
		.entCLKOS2_ACTUAL_FREQ config -state disabled -disabledforeground gray
		
		.entCLKOS2_DPHASE     config -state disabled
		.entCLKOS2_APHASE     config -state disabled -disabledforeground gray
		.rdoCLKOS2_TRIM_POL0  config -state disabled
		.rdoCLKOS2_TRIM_POL1  config -state disabled
		.cboCLKOS2_TRIM_DELAY config -state disabled
		
		.cbENABLE_CLKOS2      config -state disabled
		set Para(ENABLE_CLKOS2) DISABLED
	} else {
		.cbCLKOS2_MUXC  config -state normal
		#CLKOS2 Bypass setting
		if {$Para(CLKOS2_MUXC) == "ENABLED"} {
			RemoveFBOptions CLKOS2	
			RemoveFBOptions INT_OS2	
			.entCLKOS2_FREQ config -state disabled
			.cboCLKOS2_TOL  config -state disabled
			.entCLKOS2_DIV         config -state disabled -disabledforeground gray
			.entCLKOS2_ACTUAL_FREQ config -state disabled -disabledforeground gray
			
			.entCLKOS2_DPHASE     config -state disabled
			.entCLKOS2_APHASE     config -state disabled -disabledforeground gray
			.rdoCLKOS2_TRIM_POL0  config -state disabled
			.rdoCLKOS2_TRIM_POL1  config -state disabled
			.cboCLKOS2_TRIM_DELAY config -state disabled
			
			.cbENABLE_CLKOS2      config -state disabled
			set Para(ENABLE_CLKOS2) DISABLED
		} else {
			.entCLKOS2_FREQ config -state normal
			.cboCLKOS2_TOL  config -state normal
			.entCLKOS2_DIV         config -state disabled -disabledforeground black
			.entCLKOS2_ACTUAL_FREQ config -state disabled -disabledforeground black
			
			.entCLKOS2_DPHASE     config -state normal
			.entCLKOS2_APHASE     config -state disabled -disabledforeground black
			.rdoCLKOS2_TRIM_POL0  config -state normal
			.rdoCLKOS2_TRIM_POL1  config -state normal
			.cboCLKOS2_TRIM_DELAY config -state normal
			
			if {$Para(FEEDBK_PATH) == "CLKOS2" || $Para(FEEDBK_PATH) == "INT_OS2"} {
				.cbENABLE_CLKOS2      config -state disabled
				set Para(ENABLE_CLKOS2) DISABLED
				
				.entCLKOS2_DPHASE     config -state disabled
				.entCLKOS2_APHASE     config -state disabled -disabledforeground gray
				.rdoCLKOS2_TRIM_POL0  config -state disabled
				.rdoCLKOS2_TRIM_POL1  config -state disabled
				.cboCLKOS2_TRIM_DELAY config -state disabled
			} else {
				.cbENABLE_CLKOS2      config -state normal
			}
		}
	}

	#CLKOS3 Enable setting
	if {$Para(CLKOS3_Enable) == "DISABLED"} {
		RemoveFBOptions CLKOS3	
		RemoveFBOptions INT_OS3	
		set Para(CLKOS3_MUXD) "DISABLED"
		.cbCLKOS3_MUXD  config -state disabled
		.entCLKOS3_FREQ config -state disabled
		.cboCLKOS3_TOL  config -state disabled
		.entCLKOS3_DIV         config -state disabled -disabledforeground gray
		.entCLKOS3_ACTUAL_FREQ config -state disabled -disabledforeground gray
		
		.entCLKOS3_DPHASE     config -state disabled
		.entCLKOS3_APHASE     config -state disabled -disabledforeground gray
		.rdoCLKOS3_TRIM_POL0  config -state disabled
		.rdoCLKOS3_TRIM_POL1  config -state disabled
		.cboCLKOS3_TRIM_DELAY config -state disabled
		
		.cbENABLE_CLKOS3      config -state disabled
		set Para(ENABLE_CLKOS3) DISABLED
	} else {
		.cbCLKOS3_MUXD  config -state normal
		#CLKOS3 Bypass setting
		if {$Para(CLKOS3_MUXD) == "ENABLED"} {
			RemoveFBOptions CLKOS3	
			RemoveFBOptions INT_OS3	
			.entCLKOS3_FREQ config -state disabled
			.cboCLKOS3_TOL  config -state disabled
			.entCLKOS3_DIV         config -state disabled -disabledforeground gray
			.entCLKOS3_ACTUAL_FREQ config -state disabled -disabledforeground gray
			
			.entCLKOS3_DPHASE     config -state disabled
			.entCLKOS3_APHASE     config -state disabled -disabledforeground gray
			.rdoCLKOS3_TRIM_POL0  config -state disabled
			.rdoCLKOS3_TRIM_POL1  config -state disabled
			.cboCLKOS3_TRIM_DELAY config -state disabled
			
			.cbENABLE_CLKOS3      config -state disabled
			set Para(ENABLE_CLKOS3) DISABLED
		} else {
			.entCLKOS3_FREQ config -state normal
			.cboCLKOS3_TOL  config -state normal
			.entCLKOS3_DIV         config -state disabled -disabledforeground black
			.entCLKOS3_ACTUAL_FREQ config -state disabled -disabledforeground black
			
			.entCLKOS3_DPHASE     config -state normal
			.entCLKOS3_APHASE     config -state disabled -disabledforeground black
			.rdoCLKOS3_TRIM_POL0  config -state normal
			.rdoCLKOS3_TRIM_POL1  config -state normal
			.cboCLKOS3_TRIM_DELAY config -state normal
			
			if {$Para(FEEDBK_PATH) == "CLKOS3" || $Para(FEEDBK_PATH) == "INT_OS3"} {
				.cbENABLE_CLKOS3      config -state disabled
				set Para(ENABLE_CLKOS3) DISABLED
			
				.entCLKOS3_DPHASE     config -state disabled
				.entCLKOS3_APHASE     config -state disabled -disabledforeground gray
				.rdoCLKOS3_TRIM_POL0  config -state disabled
				.rdoCLKOS3_TRIM_POL1  config -state disabled
				.cboCLKOS3_TRIM_DELAY config -state disabled
			} else {
				.cbENABLE_CLKOS3      config -state normal
			}
		}
	}

	if {$Para(CLKOP_MUXA) == "ENABLED" && 
		($Para(CLKOS_Enable) == "DISABLED" || $Para(CLKOS_MUXB) == "ENABLED") &&
		($Para(CLKOS2_Enable) == "DISABLED" || $Para(CLKOS2_MUXC) == "ENABLED") &&
		($Para(CLKOS3_Enable) == "DISABLED" || $Para(CLKOS3_MUXD) == "ENABLED") } {
		.cboFEEDBK_PATH config -state normal
		set Para(FEEDBK_PATH) "INT_OP"
	}
	
	#CR_53563
	if {$Para(DPHASE_SOURCE) == "DYNAMIC"} {
		.entCLKOP_DPHASE     config -state disabled
		.entCLKOS_DPHASE     config -state disabled
		.entCLKOS2_DPHASE     config -state disabled
		.entCLKOS3_DPHASE     config -state disabled
		#set Para(CLKOP_DPHASE) 0
		#set Para(CLKOS_DPHASE) 0
		#set Para(CLKOS2_DPHASE) 0
		#set Para(CLKOS3_DPHASE) 0
	}

	if {$Para(PLL_LOCK_MODE) == "ENABLED"} {
		.cbPLL_LOCK_STK config -state normal
	} else {
		set Para(PLL_LOCK_STK) "DISABLED"
		.cbPLL_LOCK_STK config -state disabled
	}
	
	set min 3.125
	set max 400.0000
	if {$Para(CLKOP_MUXA) == "DISABLED"} {
		if {$Para(CLKOP_FREQ) < $min || $Para(CLKOP_FREQ) > $max} {
			.entCLKOP_FREQ.lwchildsite.entry config -fg red
		} else  {
			.entCLKOP_FREQ.lwchildsite.entry config -fg black
		} 
	}
	if {$Para(CLKOS_Enable) == "ENABLED" && $Para(CLKOS_MUXB) == "DISABLED"} {
		if {$Para(CLKOS_FREQ) < $min || $Para(CLKOS_FREQ) > $max} {
			.entCLKOS_FREQ.lwchildsite.entry config -fg red
		} else  {
			.entCLKOS_FREQ.lwchildsite.entry config -fg black
		} 
	}
	if {$Para(CLKOS2_Enable) == "ENABLED" && $Para(CLKOS2_MUXC) == "DISABLED"} {
		if {$Para(CLKOS2_FREQ) < $min || $Para(CLKOS2_FREQ) > $max} {
			.entCLKOS2_FREQ.lwchildsite.entry config -fg red
		} else  {
			.entCLKOS2_FREQ.lwchildsite.entry config -fg black
		} 
	}
	if {$Para(CLKOS3_Enable) == "ENABLED" && $Para(CLKOS3_MUXD) == "DISABLED"} {
		if {$Para(CLKOS3_FREQ) < $min || $Para(CLKOS3_FREQ) > $max} {
			.entCLKOS3_FREQ.lwchildsite.entry config -fg red
		} else  {
			.entCLKOS3_FREQ.lwchildsite.entry config -fg black
		} 
	}
}

proc EditFreq {}  {
	global Para
	set Para(BoolFlag) 0
	ChangeValueCmd
	if {$Para(BoolFlag) == "1"}  {
		$Para(generate_cfg) configure -state normal
	} else  {
		$Para(generate_cfg) configure -state disabled
	} 
} 


proc Edit_CLKOP_TOL {}  {
	global Para
	set Para(CLKOS_TOL) $Para(CLKOP_TOL)
	set Para(CLKOS2_TOL) $Para(CLKOP_TOL)
	set Para(CLKOS3_TOL) $Para(CLKOP_TOL)	
} 

proc Edit_CLKOS_TOL {}  {
	global Para
	set Para(CLKOP_TOL) $Para(CLKOS_TOL)
	set Para(CLKOS2_TOL) $Para(CLKOS_TOL)
	set Para(CLKOS3_TOL) $Para(CLKOS_TOL)	
} 

proc Edit_CLKOS2_TOL {}  {
	global Para
	set Para(CLKOP_TOL) $Para(CLKOS2_TOL)
	set Para(CLKOS_TOL) $Para(CLKOS2_TOL)
	set Para(CLKOS3_TOL) $Para(CLKOS2_TOL)	
} 

proc Edit_CLKOS3_TOL {}  {
	global Para
	set Para(CLKOP_TOL) $Para(CLKOS3_TOL)
	set Para(CLKOS_TOL) $Para(CLKOS3_TOL)
	set Para(CLKOS2_TOL) $Para(CLKOS3_TOL)	
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

proc CheckECP4Para {}  {
	global Para

	if {$Para(CLKOP_DPHASE) == ""} {
		set msg "Please input CLKOP desired phase!"
		tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		return -1
	}
	if {$Para(CLKOS_DPHASE) == ""} {
		set msg "Please input CLKOS desired phase!"
		tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		return -1
	}
	if {$Para(CLKOS2_DPHASE) == ""} {
		set msg "Please input CLKOS2 desired phase!"
		tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		return -1
	}
	if {$Para(CLKOS3_DPHASE) == ""} {
		set msg "Please input CLKOS3 desired phase!"
		tk_messageBox -default ok -icon error -message $msg -title "Check Parameters" -type ok
		return -1
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
	set ret [CheckECP4Para]
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

	set str "-arch $Para(arch) -type pll -fin $Para(CLKI_FREQ)"
	
	if {$Para(REFERENCE) == 1} {
		lappend str -clkibuf $Para(IOBUF)
	}
	
	#CLKOP cmd-line
	#lappend str -fclkop $Para(CLKOP_FREQ)
	if {$Para(CLKOP_MUXA) == "DISABLED"} {
		lappend str -fclkop $Para(CLKOP_FREQ) -fclkop_tol $Para(CLKOP_TOL)
		#lappend str -fclkop_tol $Para(CLKOP_TOL)
		if {$Para(FEEDBK_PATH) != "CLKOP" && $Para(FEEDBK_PATH) != "INT_OP"} {
			lappend str -phasep $Para(CLKOP_DPHASE) ;#-trimp $Para(CLKOP_TRIM_DELAY)
			#if {$Para(CLKOP_TRIM_POL) == "Rising"} {lappend str -trimp_r}
		}
	} else {
		if {$Para(CLKOP_FREQ) == $Para(CLKI_FREQ)} {
			lappend str -bypassp
		} else {
			lappend str -bypass_divp
		}
	}
	#CLKOS cmd-line
	if {$Para(CLKOS_Enable) == "ENABLED"} {
		#lappend str -fclkos $Para(CLKOS_FREQ)
		if {$Para(CLKOS_MUXB) == "DISABLED"} {
			lappend str -fclkos $Para(CLKOS_FREQ) -fclkos_tol $Para(CLKOS_TOL)
			#lappend str -fclkos_tol $Para(CLKOS_TOL)
			if {$Para(FEEDBK_PATH) != "CLKOS" && $Para(FEEDBK_PATH) != "INT_OS"} {
				lappend str -phases $Para(CLKOS_DPHASE) ;#-trims $Para(CLKOS_TRIM_DELAY)
				#if {$Para(CLKOS_TRIM_POL) == "Rising"} {lappend str -trims_r}
			}
		} else {
			if {$Para(CLKOS_FREQ) == $Para(CLKI_FREQ)} {
				lappend str -bypasss
			} else {
				lappend str -bypass_divs
			}
		}
	}
	#CLKOS2 cmd-line
	if {$Para(CLKOS2_Enable) == "ENABLED"} {
		#lappend str -fclkos2 $Para(CLKOS2_FREQ)
		if {$Para(CLKOS2_MUXC) == "DISABLED"} {
			lappend str -fclkos2 $Para(CLKOS2_FREQ) -fclkos2_tol $Para(CLKOS2_TOL)
			#lappend str -fclkos2_tol $Para(CLKOS2_TOL)
			if {$Para(FEEDBK_PATH) != "CLKOS2" && $Para(FEEDBK_PATH) != "INT_OS2"} {
				lappend str -phases2 $Para(CLKOS2_DPHASE) ;#-trims2 $Para(CLKOS2_TRIM_DELAY)
				#if {$Para(CLKOS2_TRIM_POL) == "Rising"} {lappend str -trims2_r}
			}
		} else {
			if {$Para(CLKOS2_FREQ) == $Para(CLKI_FREQ)} {
				lappend str -bypasss2
			} else {
				lappend str -bypass_divs2
			}
		}
	}
	#CLKOS3 cmd-line
	if {$Para(CLKOS3_Enable) == "ENABLED"} {
		#lappend str -fclkos3 $Para(CLKOS3_FREQ)
		if {$Para(CLKOS3_MUXD) == "DISABLED"} {
			lappend str -fclkos3 $Para(CLKOS3_FREQ) -fclkos3_tol $Para(CLKOS3_TOL)
			#lappend str -fclkos3_tol $Para(CLKOS3_TOL)
			if {$Para(FEEDBK_PATH) != "CLKOS3" && $Para(FEEDBK_PATH) != "INT_OS3"} {
				lappend str -phases3 $Para(CLKOS3_DPHASE) ;#-trims3 $Para(CLKOS3_TRIM_DELAY)
				#if {$Para(CLKOS3_TRIM_POL) == "Rising"} {lappend str -trims3_r}
			}
		} else {
			if {$Para(CLKOS3_FREQ) == $Para(CLKI_FREQ)} {
				lappend str -bypasss3
			} else {
				lappend str -bypass_divs3
			}
		}
	}
	
	if {$Para(CLKSEL_ENA) == "ENABLED"} {lappend str -enable_sel}
	lappend str -phase_cntl $Para(DPHASE_SOURCE)
	if {$Para(ENABLE_CLKOP) == "ENABLED"} {lappend str -enable_p}
	if {$Para(ENABLE_CLKOS) == "ENABLED"} {lappend str -enable_s}
	if {$Para(ENABLE_CLKOS2) == "ENABLED"} {lappend str -enable_s2}
	if {$Para(ENABLE_CLKOS3) == "ENABLED"} {lappend str -enable_s3}
	if {$Para(STDBY_ENABLE) == "ENABLED"} {lappend str -standby}
	if {$Para(PLL_USE_SMI) == "ENABLED"} {lappend str -wb}
	if {$Para(PLLRST_ENA) == "ENABLED"} {lappend str -rst}
	if {$Para(PLL_LOCK_MODE) == "ENABLED"} {lappend str -lock}
	if {$Para(PLL_LOCK_STK) == "ENABLED"} {lappend str -sticky}

	switch $Para(FEEDBK_PATH)  {
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

	if {$Para(FRACN_ENABLE) == "ENABLED"} {lappend str -fracn}
	if {$Para(ENABLE_HBW) == "ENABLED"} {lappend str -bw HIGH}

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
#	tk_messageBox -default ok -icon warning -message $ret -title "GetStdoutStr" -type ok
#	tk_messageBox -default ok -icon warning -message $msg -title "GetStdoutStr" -type ok
	if {$ret != 0} {return -1}
	
	return $msg
} 

#Calculate button
proc CalculateCmd {}  {
	global Para
	
	set ret [FrequencyDRC]
	if {$ret == -1}  {return -1}
	
	set ret [CheckECP4Para]
	if {$ret == -1}  {return -1}
	
	#Call scuba engine to get output string
	set ret [GetStdoutStr]
	if {$ret == -1}  {
		set tit "Frequency Calculate"
		set msg "The desired frequencies could not be generated."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}

	#Div: 1, 1, 6, 1, 1, 1
	#Freq: 100.000000, 600.000000 600.000000 600.000000
	#Phase: 0, 45, 0, 0
	#VCO/BW : 900.000, 7.003
	#The "Div:" values are for CLKI, Feedback Divider, and CLKOP, CLKOS, CLKOS2, and CLKOS3 dividers. 
	#The frequency are for the CLKOP, CLKOS, CLKOS2, and CLKOS3 outputs. 
	#the phase of the output clocks (CLKOP, CLKOS, CLKOS2, and CLKOS3). 
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
		if {[string first "VCO/BW" $str] != -1} {
			set vcobw_str [lindex [split $str ':'] 1]
		}
	}
	set div [split $div_str ,]
	set freq [split [string trim $freq_str] " "]
	set phase [split $phase_str ,]
	set vcobw [split [string trim $vcobw_str] " "]

	#Process Divider
	set Para(CLKI_DIV)  [string trim [lindex $div 0]]
	set Para(CLKFB_DIV) [string trim [lindex $div 1]]

	set Para(adiv) [string trim [lindex $div 2]]
	set Para(bdiv) [string trim [lindex $div 3]]
	set Para(cdiv) [string trim [lindex $div 4]]
	set Para(ddiv) [string trim [lindex $div 5]]
#	set Para(fdiv) [string trim [lindex $div 6]]
	#tk_messageBox -default ok -icon error -message "$adiv $bdiv $cdiv $ddiv" -title "Check Parameters" -type ok
	if {$Para(adiv) >= 1} {set Para(CLKOP_DIV) $Para(adiv)}
	if {$Para(bdiv) >= 1} {set Para(CLKOS_DIV) $Para(bdiv)}
	if {$Para(cdiv) >= 1} {set Para(CLKOS2_DIV) $Para(cdiv)}
	if {$Para(ddiv) >= 1} {set Para(CLKOS3_DIV) $Para(ddiv)}
#	if {$Para(fdiv) >= 0} {set Para(FRACN_DIV) $Para(fdiv)}

	set ret [DividerDRC]
	if {$ret == -1}  {return -1}

	#Process Actual Frequency
	#CR_53579 
#	if {$Para(CLKOP_MUXA) == "DISABLED"} 
	set Para(CLKOP_ACTUAL_FREQ) [string trim [lindex $freq 0] ,]
	if {$Para(CLKOS_Enable) == "ENABLED"} {
		set Para(CLKOS_ACTUAL_FREQ) [string trim [lindex $freq 1]]
	}
	if {$Para(CLKOS2_Enable) == "ENABLED"} {
		set Para(CLKOS2_ACTUAL_FREQ) [string trim [lindex $freq 2]]
	}
	if {$Para(CLKOS3_Enable) == "ENABLED"} {
		set Para(CLKOS3_ACTUAL_FREQ) [string trim [lindex $freq 3]]
	}
	
	set ret [ToleranceDRC]
	if {$ret == -1}  {return -1}
	
	set Para(VCO_RATE) [string trim [lindex $vcobw 0]]
	set Para(PLL_BW) [string trim [lindex $vcobw 1]]
	
	#Process Phase
#	foreach str [split $ret '\n'] {
#		if {[string first "Phase:" $str] != -1} {
#			set phase_str [lindex [split $str ':'] 1]
#		}
#	}
#	set phase [split $phase_str ,]
	set Para(CLKOP_APHASE)  [string trim [lindex $phase 0]]
	set Para(CLKOS_APHASE)  [string trim [lindex $phase 1]]
	set Para(CLKOS2_APHASE) [string trim [lindex $phase 2]]
	set Para(CLKOS3_APHASE) [string trim [lindex $phase 3]]
	
	set ret [PhaseDRC]
	if {$ret == -1}  {return -1}

	#Successfully!
	set Para(BoolFlag) 1

	if {$Para(BoolFlag) == "1"}  {
		$Para(generate_cfg) configure -state normal
	} else  {
		$Para(generate_cfg) configure -state disabled
	} 
} 

proc PageChangeCmd {} {
	global Para
	
	#CR_53562
	set Para(current_page) [$Para(tnb) view]
#	tk_messageBox -default ok -icon warning -message "current = $Para(current_page) \nprevious = $Para(previous_page)" -title "PageChangeCmd" -type ok
	if {[$Para(generate_cfg) cget -state] == "disabled"} {
		set msg "You must click the \"Calculate\" button in order to change tabs."
		if {$Para(current_page) == 0 && $Para(current_page) != $Para(previous_page)} {
			tk_messageBox -default ok -icon warning -message $msg -title "PageChangeCmd" -type ok
			after idle {$Para(tnb) view 1}
			set Para(previous_page) 1
		}
		if {$Para(current_page) == 1 && $Para(current_page) != $Para(previous_page)} {
			tk_messageBox -default ok -icon warning -message $msg -title "PageChangeCmd" -type ok
			after idle {$Para(tnb) view 0}
			set Para(previous_page) 0
		}
	} else {
		set Para(previous_page) [$Para(tnb) view]
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
	switch $tcl_platform(platform) {
		windows {AttributeSetting 550 580}
		unix    {AttributeSetting 570 700}
	}
	set pin_flag 1
	DrawImage 220 400
	set tnb $Para(tnb)

	set Para(BoolFlag) 0
	set Para(previous_page) 0

	wm title . "Lattice Module -- PLL"
	#*** Here for user to add extra pages ***
#--- Frequency ---
	set page [$tnb add -label "Frequency" -command {}]
	iwidgets::Labeledframe .frmFrequency
	set frmFrequency [.frmFrequency childsite]

	frame .frmLeft
	
	#*** CLKI Frequency ***
	iwidgets::Labeledframe .frmCLKI -labeltext "CLKI" -labelpos nw
	set frmCLKI [.frmCLKI childsite]
	iwidgets::entryfield .entCLKI_FREQ -labeltext "Frequency" -labelpos n -width 13 -fixed 13 -textvariable Para(CLKI_FREQ) -validate real
	iwidgets::entryfield .entCLKI_DIV  -labeltext "Refclk Divider"   -labelpos n -width 6  -textvariable Para(CLKI_DIV) -state disabled -disabledforeground black
	checkbutton .cbENABLE_HBW -text "Enable High Bandwidth" -variable Para(ENABLE_HBW) -onvalue ENABLED -offvalue DISABLED -command {EditFreq;CallDrawPins}
	checkbutton .cbREFERENCE -text "PLL Reference Clock from Pin" -variable Para(REFERENCE) -command {EditFreq;CallDrawPins}
	set rx_type_lst {LVDS SUBLVDS BLVDS25 MLVDS25 SLVS LVPECL33 LVTTL33 LVTTL33D \
				LVCMOS33 LVCMOS33D LVCMOS25 LVCMOS25D LVCMOS18 LVCMOS15 LVCMOS12}
	CreateLabelCombobox $frmCLKI IOBUF "CLKI Buffer Type" 15 14 Para(IOBUF) $rx_type_lst {EditFreq;CallDrawPins}
	grid .entCLKI_FREQ .entCLKI_DIV -in $frmCLKI -padx 2 -pady 2
	grid .cbENABLE_HBW -in $frmCLKI -columnspan 2 -sticky w
	grid .cbREFERENCE -in $frmCLKI -columnspan 2 -sticky w
	grid .frmIOBUF -in $frmCLKI -columnspan 2 -sticky w
	.entCLKI_FREQ.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	
	#*** CLKFB ***
	iwidgets::Labeledframe .frmCLKFB -labeltext "CLKFB" -labelpos nw
	set frmCLKFB [.frmCLKFB childsite]
	iwidgets::combobox .cboFEEDBK_PATH -labeltext "Feedback\nMode" -labelpos n -width 12 -textvariable Para(FEEDBK_PATH) -selectioncommand {EditFreq;CallDrawPins} -editable false
	iwidgets::entryfield .entCLKFB_DIV -labeltext "Feedback\nDivider" -labelpos n -width 10  -textvariable Para(CLKFB_DIV) -state disabled -disabledforeground black
	.cboFEEDBK_PATH insert list end CLKOP CLKOS CLKOS2 CLKOS3 INT_OP INT_OS INT_OS2 INT_OS3 "UserClock"
	label .lblFRACN_DIV -text "Fractional Accuracy Divider"
	checkbutton .cbFRACN_ENABLE -text "Enable" -variable Para(FRACN_ENABLE) -onvalue ENABLED -offvalue DISABLED -command {EditFreq;CallDrawPins}
	iwidgets::entryfield .entFRACN_DIV -labeltext "Fractional Divider" -labelpos n -width 10 -textvariable Para(FRACN_DIV)
	grid .cboFEEDBK_PATH .entCLKFB_DIV -in $frmCLKFB -padx 2
#	grid .lblFRACN_DIV -columnspan 2 -in $frmCLKFB -pady 2
#	grid .cbFRACN_ENABLE .entFRACN_DIV -in $frmCLKFB

	#*** Info ***
	iwidgets::Labeledframe .frmInfo -labeltext "Info" -labelpos nw
	set frmInfo [.frmInfo childsite]
	iwidgets::entryfield .entVCO_RATE -labeltext "\nVCO Rate(MHz)" -labelpos n -width 12 -textvariable Para(VCO_RATE) -state disabled -disabledforeground black
	iwidgets::entryfield .entPLL_BW -labeltext "Approximate PLL\nBandwidth(MHz)" -labelpos n -width 12 -textvariable Para(PLL_BW) -state disabled -disabledforeground black
	grid .entVCO_RATE .entPLL_BW -in $frmInfo -padx 2
	
	#*** Calculate Button1 ***
	button .btnCalculate1 -text "Calculate" -width 16 -command {CalculateCmd}	
	
	pack .frmCLKI .frmCLKFB .frmInfo -in .frmLeft -fill x
	pack .btnCalculate1 -in .frmLeft -pady 30
	
	frame .frmRight
	
	#*** CLKOP ***
	iwidgets::Labeledframe .frmCLKOP -labeltext "CLKOP" -labelpos nw
	set frmCLKOP [.frmCLKOP childsite]
	checkbutton .cbCLKOP_MUXA -text "Bypass" -variable Para(CLKOP_MUXA) -onvalue ENABLED -offvalue DISABLED -command {EditFreq;CallDrawPins}
	iwidgets::entryfield .entCLKOP_DIV -labeltext "Output Divider" -labelpos n -width 7 -fixed 5 -textvariable Para(CLKOP_DIV) -state disabled -disabledforeground black
	iwidgets::entryfield .entCLKOP_FREQ -labeltext "Desired\nFrequency" -labelpos n -width 13 -fixed 13 -textvariable Para(CLKOP_FREQ) -validate real
	iwidgets::combobox .cboCLKOP_TOL   -labeltext "\nTolerance %" -labelpos n -width 10 -textvariable Para(CLKOP_TOL) -selectioncommand {EditFreq;Edit_CLKOP_TOL} -editable false
	iwidgets::entryfield .entCLKOP_ACTUAL_FREQ -labeltext "Actual\nFrequency" -labelpos n -width 13 -fixed 13 -textvariable Para(CLKOP_ACTUAL_FREQ) -state disabled -disabledforeground black
	grid x .cbCLKOP_MUXA .entCLKOP_DIV -in $frmCLKOP
	grid .entCLKOP_FREQ .cboCLKOP_TOL .entCLKOP_ACTUAL_FREQ -in $frmCLKOP -padx 2 -pady 2
	.cboCLKOP_TOL insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
	.entCLKOP_FREQ.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	
	#*** CLKOS ***
	iwidgets::Labeledframe .frmCLKOS -labeltext "CLKOS" -labelpos nw
	set frmCLKOS [.frmCLKOS childsite]
	checkbutton .cbCLKOS_Enable -text "Enable" -variable Para(CLKOS_Enable) -onvalue ENABLED -offvalue DISABLED -command {EditFreq;CallDrawPins}
	checkbutton .cbCLKOS_MUXB -text "Bypass" -variable Para(CLKOS_MUXB) -onvalue ENABLED -offvalue DISABLED -command {EditFreq;ChangeValueCmd;CallDrawPins}
	iwidgets::entryfield .entCLKOS_DIV -labeltext "Output Divider" -labelpos n -width 7 -fixed 5 -textvariable Para(CLKOS_DIV) -state disabled -disabledforeground black
	iwidgets::entryfield .entCLKOS_FREQ -labeltext "Desired\nFrequency" -labelpos n -width 13 -fixed 13 -textvariable Para(CLKOS_FREQ) -validate real
	iwidgets::combobox .cboCLKOS_TOL   -labeltext "\nTolerance %" -labelpos n -width 10  -textvariable Para(CLKOS_TOL) -selectioncommand {EditFreq;Edit_CLKOS_TOL} -editable false
	iwidgets::entryfield .entCLKOS_ACTUAL_FREQ -labeltext "Actual\nFrequency" -labelpos n -width 13 -fixed 13 -textvariable Para(CLKOS_ACTUAL_FREQ) -state disabled -disabledforeground black
	grid .cbCLKOS_Enable .cbCLKOS_MUXB .entCLKOS_DIV -in $frmCLKOS
	grid .entCLKOS_FREQ .cboCLKOS_TOL .entCLKOS_ACTUAL_FREQ -in $frmCLKOS -padx 2 -pady 2
	.cboCLKOS_TOL insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
	.entCLKOS_FREQ.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	
	#*** CLKOS2 ***
	iwidgets::Labeledframe .frmCLKOS2 -labeltext "CLKOS2" -labelpos nw
	set frmCLKOS2 [.frmCLKOS2 childsite]
	checkbutton .cbCLKOS2_Enable -text "Enable" -variable Para(CLKOS2_Enable) -onvalue ENABLED -offvalue DISABLED -command {EditFreq;CallDrawPins}
	checkbutton .cbCLKOS2_MUXC -text "Bypass" -variable Para(CLKOS2_MUXC) -onvalue ENABLED -offvalue DISABLED -command {EditFreq;ChangeValueCmd;CallDrawPins}
	iwidgets::entryfield .entCLKOS2_DIV -labeltext "Output Divider" -labelpos n -width 7 -fixed 5 -textvariable Para(CLKOS2_DIV) -state disabled -disabledforeground black
	iwidgets::entryfield .entCLKOS2_FREQ -labeltext "Desired\nFrequency" -labelpos n -width 13 -fixed 13 -textvariable Para(CLKOS2_FREQ) -validate real
	iwidgets::combobox .cboCLKOS2_TOL   -labeltext "\nTolerance %" -labelpos n -width 10  -textvariable Para(CLKOS2_TOL) -selectioncommand {EditFreq;Edit_CLKOS2_TOL} -editable false
	iwidgets::entryfield .entCLKOS2_ACTUAL_FREQ -labeltext "Actual\nFrequency" -labelpos n -width 13 -fixed 13 -textvariable Para(CLKOS2_ACTUAL_FREQ) -state disabled -disabledforeground black
	grid .cbCLKOS2_Enable .cbCLKOS2_MUXC .entCLKOS2_DIV -in $frmCLKOS2
	grid .entCLKOS2_FREQ .cboCLKOS2_TOL .entCLKOS2_ACTUAL_FREQ -in $frmCLKOS2 -padx 2 -pady 2
	.cboCLKOS2_TOL insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
	.entCLKOS2_FREQ.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}

	#*** CLKOS3 ***
	iwidgets::Labeledframe .frmCLKOS3 -labeltext "CLKOS3" -labelpos nw
	set frmCLKOS3 [.frmCLKOS3 childsite]
	checkbutton .cbCLKOS3_Enable -text "Enable" -variable Para(CLKOS3_Enable) -onvalue ENABLED -offvalue DISABLED -command {EditFreq;CallDrawPins}
	checkbutton .cbCLKOS3_MUXD -text "Bypass" -variable Para(CLKOS3_MUXD) -onvalue ENABLED -offvalue DISABLED -command {EditFreq;ChangeValueCmd;CallDrawPins}
	iwidgets::entryfield .entCLKOS3_DIV -labeltext "Output Divider" -labelpos n -width 7 -fixed 5 -textvariable Para(CLKOS3_DIV) -state disabled -disabledforeground black
	iwidgets::entryfield .entCLKOS3_FREQ -labeltext "Desired\nFrequency" -labelpos n -width 13 -fixed 13 -textvariable Para(CLKOS3_FREQ) -validate real
	iwidgets::combobox .cboCLKOS3_TOL   -labeltext "\nTolerance %" -labelpos n -width 10  -textvariable Para(CLKOS3_TOL) -selectioncommand {EditFreq;Edit_CLKOS3_TOL} -editable false
	iwidgets::entryfield .entCLKOS3_ACTUAL_FREQ -labeltext "Actual\nFrequency" -labelpos n -width 13 -fixed 13 -textvariable Para(CLKOS3_ACTUAL_FREQ) -state disabled -disabledforeground black
	grid .cbCLKOS3_Enable .cbCLKOS3_MUXD .entCLKOS3_DIV -in $frmCLKOS3
	grid .entCLKOS3_FREQ .cboCLKOS3_TOL .entCLKOS3_ACTUAL_FREQ -in $frmCLKOS3 -padx 2 -pady 2
	.cboCLKOS3_TOL insert list end 0.0 0.1 0.2 0.5 1.0 2.0 5.0 10.0
	.entCLKOS3_FREQ.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}

	pack .frmCLKOP .frmCLKOS .frmCLKOS2 .frmCLKOS3 -in .frmRight
	pack .frmLeft .frmRight -in $frmFrequency -side left
	pack .frmFrequency -in $page -side top -fill both -expand 1

#--- Phase ---
	set page [$tnb add -label "Phase" -command {}]
	iwidgets::Labeledframe .frmPhase
	set frmPhase [.frmPhase childsite]
	
	#--- CLKOP Phase ---
	iwidgets::Labeledframe .frmCLKOP_PHASE -labeltext "CLKOP" -labelpos nw
	set frmCLKOP_PHASE [.frmCLKOP_PHASE childsite]
	iwidgets::entryfield .entCLKOP_DPHASE -labeltext "Desired Phase" -labelpos n -width 8 -textvariable Para(CLKOP_DPHASE) -validate real
	iwidgets::entryfield .entCLKOP_APHASE -labeltext "Actual Phase" -labelpos n -width 8  -textvariable Para(CLKOP_APHASE) -state disabled -disabledforeground black
	.entCLKOP_DPHASE.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	
	iwidgets::Labeledframe .frmCLKOP_TRIM -labeltext "Edge Trim Options" -labelpos nw
	set frmCLKOP_TRIM [.frmCLKOP_TRIM childsite]
	radiobutton .rdoCLKOP_TRIM_POL0 -text "Rising" -variable Para(CLKOP_TRIM_POL) -value Rising -command {EditFreq;CallDrawPins}
	radiobutton .rdoCLKOP_TRIM_POL1 -text "Falling" -variable Para(CLKOP_TRIM_POL) -value Falling -command {EditFreq;CallDrawPins}
	iwidgets::combobox .cboCLKOP_TRIM_DELAY -labeltext "Delay Multiplier" -textvariable Para(CLKOP_TRIM_DELAY) -labelpos n -width 6 -editable false -selectioncommand EditFreq
	.cboCLKOP_TRIM_DELAY insert list end 0 1 2 4
	grid .rdoCLKOP_TRIM_POL0 -row 0 -column 0 -in $frmCLKOP_TRIM
	grid .rdoCLKOP_TRIM_POL1 -row 1 -column 0 -in $frmCLKOP_TRIM
	grid .cboCLKOP_TRIM_DELAY -row 0 -column 1 -rowspan 2 -in $frmCLKOP_TRIM -padx 8
	
	grid .entCLKOP_DPHASE .entCLKOP_APHASE -in $frmCLKOP_PHASE -padx 2
	
	#--- CLKOS Phase ---
	iwidgets::Labeledframe .frmCLKOS_PHASE -labeltext "CLKOS" -labelpos nw
	set frmCLKOS_PHASE [.frmCLKOS_PHASE childsite]
	iwidgets::entryfield .entCLKOS_DPHASE -labeltext "Desired Phase" -labelpos n -width 8 -textvariable Para(CLKOS_DPHASE) -validate real
	iwidgets::entryfield .entCLKOS_APHASE -labeltext "Actual Phase" -labelpos n -width 8  -textvariable Para(CLKOS_APHASE) -state disabled -disabledforeground black
	.entCLKOS_DPHASE.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	
	iwidgets::Labeledframe .frmCLKOS_TRIM -labeltext "Edge Trim Options" -labelpos nw
	set frmCLKOS_TRIM [.frmCLKOS_TRIM childsite]
	radiobutton .rdoCLKOS_TRIM_POL0 -text "Rising" -variable Para(CLKOS_TRIM_POL) -value Rising -command {EditFreq;CallDrawPins}
	radiobutton .rdoCLKOS_TRIM_POL1 -text "Falling" -variable Para(CLKOS_TRIM_POL) -value Falling -command {EditFreq;CallDrawPins}
	iwidgets::combobox .cboCLKOS_TRIM_DELAY -labeltext "Delay Multiplier" -textvariable Para(CLKOS_TRIM_DELAY) -labelpos n -width 6 -editable false -selectioncommand EditFreq
	.cboCLKOS_TRIM_DELAY insert list end 0 1 2 4
	grid .rdoCLKOS_TRIM_POL0 -row 0 -column 0 -in $frmCLKOS_TRIM
	grid .rdoCLKOS_TRIM_POL1 -row 1 -column 0 -in $frmCLKOS_TRIM
	grid .cboCLKOS_TRIM_DELAY -row 0 -column 1 -rowspan 2 -in $frmCLKOS_TRIM -padx 8
	
	grid .entCLKOS_DPHASE .entCLKOS_APHASE -in $frmCLKOS_PHASE -padx 2

	#--- CLKOS2 Phase ---
	iwidgets::Labeledframe .frmCLKOS2_PHASE -labeltext "CLKOS2" -labelpos nw
	set frmCLKOS2_PHASE [.frmCLKOS2_PHASE childsite]
	iwidgets::entryfield .entCLKOS2_DPHASE -labeltext "Desired Phase" -labelpos n -width 8 -textvariable Para(CLKOS2_DPHASE) -validate real
	iwidgets::entryfield .entCLKOS2_APHASE -labeltext "Actual Phase" -labelpos n -width 8  -textvariable Para(CLKOS2_APHASE) -state disabled -disabledforeground black
	.entCLKOS2_DPHASE.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	
	iwidgets::Labeledframe .frmCLKOS2_TRIM -labeltext "Edge Trim Options" -labelpos nw
	set frmCLKOS2_TRIM [.frmCLKOS2_TRIM childsite]
	radiobutton .rdoCLKOS2_TRIM_POL0 -text "Rising" -variable Para(CLKOS2_TRIM_POL) -value Rising -command {EditFreq;CallDrawPins}
	radiobutton .rdoCLKOS2_TRIM_POL1 -text "Falling" -variable Para(CLKOS2_TRIM_POL) -value Falling -command {EditFreq;CallDrawPins}
	iwidgets::combobox .cboCLKOS2_TRIM_DELAY -labeltext "Delay Multiplier" -textvariable Para(CLKOS2_TRIM_DELAY) -labelpos n -width 6 -editable false -selectioncommand EditFreq
	.cboCLKOS2_TRIM_DELAY insert list end 0 1 2 4
	grid .rdoCLKOS2_TRIM_POL0 -row 0 -column 0 -in $frmCLKOS2_TRIM
	grid .rdoCLKOS2_TRIM_POL1 -row 1 -column 0 -in $frmCLKOS2_TRIM
	grid .cboCLKOS2_TRIM_DELAY -row 0 -column 1 -rowspan 2 -in $frmCLKOS2_TRIM -padx 8
	
	grid .entCLKOS2_DPHASE .entCLKOS2_APHASE -in $frmCLKOS2_PHASE -padx 2

	#--- CLKOS3 Phase ---
	iwidgets::Labeledframe .frmCLKOS3_PHASE -labeltext "CLKOS3" -labelpos nw
	set frmCLKOS3_PHASE [.frmCLKOS3_PHASE childsite]
	iwidgets::entryfield .entCLKOS3_DPHASE -labeltext "Desired Phase" -labelpos n -width 8 -textvariable Para(CLKOS3_DPHASE) -validate real
	iwidgets::entryfield .entCLKOS3_APHASE -labeltext "Actual Phase" -labelpos n -width 8  -textvariable Para(CLKOS3_APHASE) -state disabled -disabledforeground black
	.entCLKOS3_DPHASE.lwchildsite.entry config -validate key -vcmd {
		after idle {EditFreq;CallDrawPins}
		return 1
	}
	
	iwidgets::Labeledframe .frmCLKOS3_TRIM -labeltext "Edge Trim Options" -labelpos nw
	set frmCLKOS3_TRIM [.frmCLKOS3_TRIM childsite]
	radiobutton .rdoCLKOS3_TRIM_POL0 -text "Rising" -variable Para(CLKOS3_TRIM_POL) -value Rising -command {EditFreq;CallDrawPins}
	radiobutton .rdoCLKOS3_TRIM_POL1 -text "Falling" -variable Para(CLKOS3_TRIM_POL) -value Falling -command {EditFreq;CallDrawPins}
	iwidgets::combobox .cboCLKOS3_TRIM_DELAY -labeltext "Delay Multiplier" -textvariable Para(CLKOS3_TRIM_DELAY) -labelpos n -width 6 -editable false -selectioncommand EditFreq
	.cboCLKOS3_TRIM_DELAY insert list end 0 1 2 4
	grid .rdoCLKOS3_TRIM_POL0 -row 0 -column 0 -in $frmCLKOS3_TRIM
	grid .rdoCLKOS3_TRIM_POL1 -row 1 -column 0 -in $frmCLKOS3_TRIM
	grid .cboCLKOS3_TRIM_DELAY -row 0 -column 1 -rowspan 2 -in $frmCLKOS3_TRIM -padx 8
	
	grid .entCLKOS3_DPHASE .entCLKOS3_APHASE -in $frmCLKOS3_PHASE -padx 2

	#*** Calculate Button1 ***
	button .btnCalculate2 -text "Calculate" -width 16 -command {CalculateCmd}	

	pack .frmCLKOP_PHASE .frmCLKOS_PHASE .frmCLKOS2_PHASE .frmCLKOS3_PHASE -in $frmPhase -anchor w -padx 30 -fill x
	pack .btnCalculate2 -in $frmPhase -anchor w -padx 30 -pady 20
	pack .frmPhase -in $page -side top -fill both -expand 1
	
#--- Optional Ports ---
	set page [$tnb add -label "Optional Ports"]
	iwidgets::Labeledframe .frmOptional
	set frmOptional [.frmOptional childsite]
	checkbutton .cbCLKSEL_ENA -text "Enable Clock Select" -variable Para(CLKSEL_ENA) -onvalue ENABLED -offvalue DISABLED -command {ChangeValueCmd;CallDrawPins}
	checkbutton .cbDPHASE_SOURCE -text "Dynamic Phase Ports" -variable Para(DPHASE_SOURCE) -onvalue DYNAMIC -offvalue STATIC -command {ChangeValueCmd;CallDrawPins}
	checkbutton .cbENABLE_CLKOP -text "Clock Enable OP" -variable Para(ENABLE_CLKOP) -onvalue ENABLED -offvalue DISABLED -command {ChangeValueCmd;CallDrawPins}
	checkbutton .cbENABLE_CLKOS -text "Clock Enable OS" -variable Para(ENABLE_CLKOS) -onvalue ENABLED -offvalue DISABLED -command {ChangeValueCmd;CallDrawPins}
	checkbutton .cbENABLE_CLKOS2 -text "Clock Enable OS2" -variable Para(ENABLE_CLKOS2) -onvalue ENABLED -offvalue DISABLED -command {ChangeValueCmd;CallDrawPins}
	checkbutton .cbENABLE_CLKOS3 -text "Clock Enable OS3" -variable Para(ENABLE_CLKOS3) -onvalue ENABLED -offvalue DISABLED -command {ChangeValueCmd;CallDrawPins}
	checkbutton .cbSTDBY_ENABLE -text "Provide Standby Port" -variable Para(STDBY_ENABLE) -onvalue ENABLED -offvalue DISABLED -command {ChangeValueCmd;CallDrawPins}
	checkbutton .cbPLLRST_ENA -text "Provide PLL Reset" -variable Para(PLLRST_ENA) -onvalue ENABLED -offvalue DISABLED -command {ChangeValueCmd;CallDrawPins}
	checkbutton .cbPLL_LOCK_MODE -text "Provide PLL Lock Signal" -variable Para(PLL_LOCK_MODE) -onvalue ENABLED -offvalue DISABLED -command {ChangeValueCmd;CallDrawPins}
	checkbutton .cbPLL_LOCK_STK -text "PLL Lock is Sticky" -variable Para(PLL_LOCK_STK) -onvalue ENABLED -offvalue DISABLED -command {ChangeValueCmd;CallDrawPins}
	checkbutton .cbPLL_USE_SMI -text "Enable SMI Control Bus" -variable Para(PLL_USE_SMI) -onvalue ENABLED -offvalue DISABLED -command {ChangeValueCmd;CallDrawPins}

	pack .cbCLKSEL_ENA .cbDPHASE_SOURCE .cbENABLE_CLKOP .cbENABLE_CLKOS .cbENABLE_CLKOS2 .cbENABLE_CLKOS3 .cbSTDBY_ENABLE .cbPLLRST_ENA .cbPLL_LOCK_MODE -in $frmOptional -anchor w -padx 20 -pady 3
	pack .cbPLL_LOCK_STK -in $frmOptional -anchor w -padx 40
	pack .frmOptional -in $page -side top -fill both -expand 1
	
	$tnb view 0
	EditFreq

	GeneralConfig
	$Para(generate_cfg) configure -state disabled
	set Para(previous_page) [$Para(tnb) view]
#	$tnb pageconfigure 0 -command {PageChangeCmd}
}
