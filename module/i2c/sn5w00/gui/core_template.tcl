#$Header: L:/module/i2c/sn5w00/gui/core_template.tcl 1.1  Exp $

#Rev 1.1: Diamond 3.6: intial ver.
#Rev 1.2 Update based on SCR_1047: Changed I2C0 2 LSBs of slave address from 01 to 10 && Changed I2C1 2 LSBs of slave address from 10 to 01

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para
	
	if {($Para(i2c0_en) == "1" && [string length $Para(clk_freq0)] > 0) ||
		($Para(i2c1_en) == "1" && [string length $Para(clk_freq1)] > 0)} {
		DrawBusPins
	}
} 

proc ChangeValueCmd {} {
	global Para
	set tnb $Para(tnb)
					
	# Hard IP Enables tab
	if {$Para(i2c0_en) == "0"} {
		.lblclk_freq0 config -state disabled
		.entryclk_freq0 config -state disabled
		setEnableI2c0 disabled
	} else {
		.lblclk_freq0 config -state normal
		.entryclk_freq0 config -state normal
		setEnableI2c0 normal
		CalculateI2c0Actual
	}
	
	if {$Para(i2c1_en) == "0"} {
		.lblclk_freq1 config -state disabled
		.entryclk_freq1 config -state disabled
		setEnableI2c1 disabled
	} else {
		.lblclk_freq1 config -state normal
		.entryclk_freq1 config -state normal
		setEnableI2c1 normal
		CalculateI2c1Actual
	}
	
	if {$Para(i2c0_en) == "1" || $Para(i2c1_en) == "1" } {
		$Para(generate_cfg) configure -state normal
		$tnb pageconfigure 1 -state normal
		$tnb pageconfigure 2 -state normal

	} else {
		$Para(generate_cfg) configure -state disabled
		$tnb pageconfigure 1 -state disabled
		$tnb pageconfigure 2 -state disabled

	}
	ChangeValueCmd_I2C0_FIFO_ENB
	ChangeValueCmd_I2C1_FIFO_ENB
	ChangeSlaveValueCmd
	ChangeMasterValueCmd
	ChangeMasterReadCompleteCmd
	CallDrawPins
}
proc ChangeSlaveValueCmd {} {
	global Para
	if {$Para(i2c0_en) == "0" } {
		return
	}
	
	if {$Para(i2c0_wakeup_slave) == 1 } {
		.ck1i2c0_wakeup_master config -state disabled
	} else {
		.ck1i2c0_wakeup_master config -state normal
	}
	
	if {$Para(i2c0_fifo_enb) == "0" } {
		return
	}
	
	if {$Para(i2c0_wakeup_slave) == 1 } {
		.ck1I2C0_fifo_mrxrdy config -state disabled
		set Para(i2c0_fifo_mrxrdy) 0
	} else {
		.ck1I2C0_fifo_mrxrdy config -state normal
	}
	
}

proc ChangeMasterValueCmd {} {
	global Para
	if {$Para(i2c0_en) == "0" } {
		return
	}
	if {$Para(i2c0_wakeup_master) == 1 || ($Para(i2c0_fifo_enb) == "1" && $Para(i2c0_fifo_mrxrdy) == 1) } {
		.ck1i2c0_wakeup_slave config -state disabled
	} else {
		.ck1i2c0_wakeup_slave config -state normal
	}
}

proc ChangeMasterReadCompleteCmd {} {
	global Para
	if {$Para(i2c0_en) == "0" } {
		return
	}
	if {$Para(i2c0_fifo_enb) == "0" } {
		return
	}	
	if {$Para(i2c0_fifo_mrxrdy) == 1 || $Para(i2c0_wakeup_master) == 1} {
		.ck1i2c0_wakeup_slave config -state disabled
	} else {
		.ck1i2c0_wakeup_slave config -state normal
	}
}

proc CalculateI2c0Actual {} {
	global Para
	#I2C0 - Desired 
	set Para(i2c0_divider) 1
	if {$Para(i2c0_en) == "1" && [string length $Para(clk_freq0)] > 0 && $Para(clk_freq0) > 0 && $Para(clk_freq0) < 500 && [string is double -strict $Para(clk_freq0)] != 0} {

		set divider [expr round($Para(clk_freq0)*1000/$Para(i2c0_bus_perf))]
		set freq  [expr $Para(clk_freq0)*1000]
		if {$divider != 0} {
			set Para(i2c0_clk_divider) [expr round($freq/$divider)]
			set Para(i2c0_divider) $divider
		}
		#set Para(i2c0_clk_divider) [expr round($Para(clk_freq0)*1000/(round($Para(clk_freq0)*1000/$Para(i2c0_bus_perf))))]		

	} else {
		set Para(i2c0_clk_divider) 1
	}
	
	CallDrawPins
}

proc CalculateI2c1Actual {} {
	global Para
	#I2C1 - Desired 
	set Para(i2c1_divider) 1
	if {$Para(i2c1_en) == "1" && [string length $Para(clk_freq1)] > 0 && $Para(clk_freq1) > 0 && $Para(clk_freq1) < 500 && [string is double -strict $Para(clk_freq1)] != 0} {
		set divider [expr round($Para(clk_freq1)*1000/$Para(i2c1_bus_perf))]
		set freq  [expr $Para(clk_freq1)*1000]
		if {$divider != 0} {
			set Para(i2c1_clk_divider) [expr round($freq/$divider)]
			set Para(i2c1_divider) $divider
		}
		#set Para(i2c1_clk_divider) [expr round($Para(clk_freq1)*1000/(round($Para(clk_freq1)*1000/$Para(i2c1_bus_perf))))]
	} else {
		set Para(i2c1_clk_divider) 1
	}
	
	CallDrawPins
}

proc setEnableI2c0 {val} {
	global Para
	#I2C
	.ck1I2C0 config -state $val
	.ck2I2C0 config -state $val
	.cboi2c0_Input_Delay config -state $val
	.lbli2c0_Input_Delay config -state $val
	.cboi2c0_Output_Delay config -state $val
	.lbli2c0_Output_Delay config -state $val
	.cboi2c0_desired config -state $val
	.lbli2c0_desired config -state $val
	.lbli2c0_actual config -state $val
	.ck1i2c0_fifo_enb config -state $val
	.ck1i2c0_fifo_clkstr config -state $val
	.cboi2c0_almost_full config -state $val
	.lbli2c0_almost_full config -state $val
	.cboi2c0_almost_empty config -state $val
	.lbli2c0_almost_empty config -state $val
	.cboi2c0_bitaddressing config -state $val
	.entryi2c0_slave_addr config -state $val
	.entryi2c0_fifo_slave_addr config -state $val
	.ck1i2c0_wakeup_slave config -state $val
	.ck1i2c0_wakeup_master config -state $val
	#I2C Interupts
	.ck1I2C0_arbitration_lost config -state $val
	.ck2I2C0_txrxready config -state $val
	.ck3I2C0_intr_nack config -state $val
	.ck4I2C0_intr_gc config -state $val
	.ck1I2C0_fifo_intr_gc config -state $val
	.ck1I2C0_fifo_receive_nack config -state $val
	.ck1I2C0_fifo_mrxrdy config -state $val
	.ck1I2C0_fifo_intr_arbit config -state $val
	.ck1I2C0_fifo_txsync config -state $val
	.ck1I2C0_fifo_txunder config -state $val
	.ck1I2C0_fifo_rrover config -state $val
}

proc setEnableI2c1 {val} {
	global Para	
	#I2C
	.ck1I2C1 config -state $val
	.ck2I2C1 config -state $val
	.cboi2c1_Input_Delay config -state $val
	.lbli2c1_Input_Delay config -state $val
	.cboi2c1_Output_Delay config -state $val
	.lbli2c1_Output_Delay config -state $val
	.cboi2c1_desired config -state $val
	.lbli2c1_desired config -state $val
	.lbli2c1_actual config -state $val
	.ck1i2c1_fifo_enb config -state $val
	.ck1i2c1_fifo_clkstr config -state $val
	.cboi2c1_almost_full config -state $val
	.lbli2c1_almost_full config -state $val
	.cboi2c1_almost_empty config -state $val
	.lbli2c1_almost_empty config -state $val
	.cboi2c1_bitaddressing config -state $val
	.entryi2c1_slave_addr config -state $val
	.entryi2c1_fifo_slave_addr config -state $val	
	#I2C Interupts
	.ck1I2C1_arbitration_lost config -state $val
	.ck2I2C1_txrxready config -state $val
	.ck3I2C1_intr_nack config -state $val
	.ck4I2C1_intr_gc config -state $val
	.ck1I2C1_fifo_intr_gc config -state $val
	.ck1I2C1_fifo_receive_nack config -state $val
	.ck1I2C1_fifo_mrxrdy config -state $val
	.ck1I2C1_fifo_intr_arbit config -state $val
	.ck1I2C1_fifo_txsync config -state $val
	.ck1I2C1_fifo_txunder config -state $val
	.ck1I2C1_fifo_rrover config -state $val
}

proc setEnableI2c0_FIFO {val} {
	global Para		
	#I2C0
	.ck1i2c0_fifo_clkstr config -state $val
	.cboi2c0_almost_full config -state $val
	.lbli2c0_almost_full config -state $val
	.cboi2c0_almost_empty config -state $val
	.lbli2c0_almost_empty config -state $val
	#I2C Interupts
	.ck1I2C0_fifo_intr_gc config -state $val
	.ck1I2C0_fifo_receive_nack config -state $val
	.ck1I2C0_fifo_mrxrdy config -state $val
	.ck1I2C0_fifo_intr_arbit config -state $val
	.ck1I2C0_fifo_txsync config -state $val
	.ck1I2C0_fifo_txunder config -state $val
	.ck1I2C0_fifo_rrover config -state $val
}


proc setEnableI2c1_FIFO {val} {
	global Para		
	#I2C0
	.ck1i2c1_fifo_clkstr config -state $val
	.cboi2c1_almost_full config -state $val
	.lbli2c1_almost_full config -state $val
	.cboi2c1_almost_empty config -state $val
	.lbli2c1_almost_empty config -state $val
	#I2C Interupts
	.ck1I2C1_fifo_intr_gc config -state $val
	.ck1I2C1_fifo_receive_nack config -state $val
	.ck1I2C1_fifo_mrxrdy config -state $val
	.ck1I2C1_fifo_intr_arbit config -state $val
	.ck1I2C1_fifo_txsync config -state $val
	.ck1I2C1_fifo_txunder config -state $val
	.ck1I2C1_fifo_rrover config -state $val
}


proc setEnableI2C0_SystemBus {val} {
	global Para	
	#I2C0 Interupts-System bus Interupts
	.ck1I2C0_arbitration_lost config -state $val
	.ck2I2C0_txrxready config -state $val
	.ck3I2C0_intr_nack config -state $val	
	.ck4I2C0_intr_gc config -state $val	
}

proc setEnableI2C1_SystemBus {val} {
	global Para	
	#I2C1 Interupts-System bus Interupts
	.ck1I2C1_arbitration_lost config -state $val
	.ck2I2C1_txrxready config -state $val
	.ck3I2C1_intr_nack config -state $val	
	.ck4I2C1_intr_gc config -state $val	
}

proc ChangeValueCmd_I2C0_FIFO_ENB {} {
	global Para
	if {$Para(i2c0_en) == "0" } {
		return
	}
	if {$Para(i2c0_fifo_enb) == "1" } {
		.entryi2c0_fifo_slave_addr config -state normal
		.entryi2c0_slave_addr config -state disabled
		setEnableI2C0_SystemBus disabled
		setEnableI2c0_FIFO normal
	} else {
		.entryi2c0_fifo_slave_addr config -state disabled
		.entryi2c0_slave_addr config -state normal
		setEnableI2C0_SystemBus normal
		setEnableI2c0_FIFO disabled
		set Para(i2c0_fifo_mrxrdy) 0
	}
	ChangeSlaveValueCmd
	CallDrawPins
}

proc ChangeValueCmd_I2C1_FIFO_ENB {} {
	global Para

	if {$Para(i2c1_en) == "0" } {
		return
	}
	if {$Para(i2c1_fifo_enb) == "1" } {
		.entryi2c1_fifo_slave_addr config -state normal
		.entryi2c1_slave_addr config -state disabled
		setEnableI2C1_SystemBus disabled
		setEnableI2c1_FIFO normal
	} else {
		.entryi2c1_fifo_slave_addr config -state disabled
		.entryi2c1_slave_addr config -state normal
		setEnableI2C1_SystemBus normal
		setEnableI2c1_FIFO disabled
	}
	CallDrawPins
}

proc ChangeI2CBitCmd1 {} {
	global Para
	set temp [string range $Para(i2c0_slave_addr) end-4 end]
	set temp_fifo [string range $Para(i2c0_fifo_slave_addr) end-6 end]
	if {$Para(i2c0_bitaddressing) == "7-Bit Addressing"} {
		#set Para(i2c0_slave_addr) "10000"
		set Para(i2c0_slave_addr) $temp
		set Para(i2c0_fifo_slave_addr) $temp_fifo
		.entryi2c0_slave_addr config -fixed 5
		.entryi2c0_fifo_slave_addr config -fixed 7
	} else {
		#set Para(i2c0_slave_addr) "00010000"
		set Para(i2c0_slave_addr) "000$temp"
		set Para(i2c0_fifo_slave_addr) "000$temp_fifo"
		.entryi2c0_slave_addr config -fixed 8
		.entryi2c0_fifo_slave_addr config -fixed 10
	}
}

proc ChangeI2CBitCmd2 {} {
	global Para
	
	set temp [string range $Para(i2c1_slave_addr) end-4 end]
	set temp_fifo [string range $Para(i2c1_fifo_slave_addr) end-6 end]
	if {$Para(i2c1_bitaddressing) == "7-Bit Addressing"} {
		#set Para(i2c1_slave_addr) "10000"
		set Para(i2c1_slave_addr) $temp
		set Para(i2c1_fifo_slave_addr) $temp_fifo
		.entryi2c1_slave_addr config -fixed 5
		.entryi2c1_fifo_slave_addr config -fixed 7
	} else {
		#set Para(i2c1_slave_addr) "00010010"
		set Para(i2c1_slave_addr) "000$temp"
		set Para(i2c1_fifo_slave_addr) "000$temp_fifo"
		.entryi2c1_slave_addr config -fixed 8
		.entryi2c1_fifo_slave_addr config -fixed 10
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

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para
	set tit "Check Parameter"
	if {$Para(i2c0_en) == "1"} {
		set ret [IsInRange "System Bus Clock Frequency - I2C0 " 1 499 $Para(clk_freq0)]
		if {$ret == "-1"} {return -1}
		
		set ret [IsInRange "Divider(System Bus Clock Frequency/Desired) - I2C0" 1 1024 $Para(i2c0_divider)]
		if {$ret == "-1"} {return -1}
		
		set ret [IsInRange "Actual(KHz) - I2C0" 1 1024 $Para(i2c0_clk_divider)]
		if {$ret == "-1"} {return -1}
		
		# slave address
		if {$Para(i2c0_fifo_enb) == "0" } {
			if {$Para(i2c0_bitaddressing) == "7-Bit Addressing"} {
				if {[string length $Para(i2c0_slave_addr)] != 5} {
					set msg "The slave address of I2C0 is illegal."
					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
					return -1
				}
			} else {
				if {[string length $Para(i2c0_slave_addr)] != 8} {
					set msg "The slave address of I2C0 is illegal."
					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
					return -1
				}
			}
		} else {
			if {$Para(i2c0_bitaddressing) == "7-Bit Addressing"} {
				if {[string length $Para(i2c0_fifo_slave_addr)] != 7} {
					set msg "The slave address of I2C0 is illegal."
					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
					return -1
				}
			} else {
				if {[string length $Para(i2c0_fifo_slave_addr)] != 10} {
					set msg "The slave address of I2C0 is illegal."
					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
					return -1
				}
			}
		}		
	}
	if {$Para(i2c1_en) == "1"} {
		set ret [IsInRange "System Bus Clock Frequency - I2C1" 1 499 $Para(clk_freq1)]
		if {$ret == "-1"} {return -1}
		
		set ret [IsInRange "Divider(System Bus Clock Frequency/Desired) - I2C1" 1 1024 $Para(i2c1_divider)]
		if {$ret == "-1"} {return -1}
		
	    set ret [IsInRange "Actual(KHz) - I2C1" 1 1024 $Para(i2c1_clk_divider)]
		if {$ret == "-1"} {return -1}
		
		# slave address
		if {$Para(i2c1_fifo_enb) == "0" } {
			if {$Para(i2c1_bitaddressing) == "7-Bit Addressing"} {
				if {[string length $Para(i2c1_slave_addr)] != 5} {
					set msg "The slave address of I2C1 is illegal."
					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
					return -1
				}
			} else {
				if {[string length $Para(i2c1_slave_addr)] != 8} {
					set msg "The slave address of I2C1 is illegal."
					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
					return -1
				}
			}
		} else {
			if {$Para(i2c1_bitaddressing) == "7-Bit Addressing"} {
				if {[string length $Para(i2c1_fifo_slave_addr)] != 7} {
					set msg "The slave address of I2C1 is illegal."
					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
					return -1
				}
			} else {
				if {[string length $Para(i2c1_fifo_slave_addr)] != 10} {
					set msg "The slave address of I2C1 is illegal."
					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
					return -1
				}
			}
		}		
	}
	
	return 0
}

# Command Line for general device
proc GeneralCmd {}  {
	global Para

	set str ""

	return $str
} 

# Command Line for snow device
proc SnowCmdLine {}  {
	global Para

	set str [list -type efb -arch $Para(arch)]
	
	#Hard IP Enable
	if {$Para(i2c0_en) == 1 && $Para(clk_freq0) > 0} {lappend str -i2c_left $Para(clk_freq0)}
	if {$Para(i2c1_en) == 1 && $Para(clk_freq1) > 0} {lappend str -i2c_right $Para(clk_freq1)}

	#I2C - General Call Enable
	set general_call_enable_str none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_gen_call) == 1} {set general_call_enable_str left}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_gen_call) == 1} {set general_call_enable_str right}
	if {$Para(i2c0_en) == 1 && $Para(i2c1_en) == 1 && $Para(i2c0_gen_call) == 1 && $Para(i2c1_gen_call) == 1} {set general_call_enable_str both}
	lappend str -i2c_general_call_enable $general_call_enable_str
	#I2C - iobuffer
	set iobuffer none
	if {$Para(i2c0_en) == 1 && $Para(include_iob_i2c0) == 1} {set iobuffer left}
	if {$Para(i2c1_en) == 1 && $Para(include_iob_i2c1) == 1} {set iobuffer right}
	if {$Para(i2c0_en) == 1 && $Para(i2c1_en) == 1 && $Para(include_iob_i2c0) == 1 && $Para(include_iob_i2c1) == 1} {set iobuffer both}
	lappend str -i2c_iobuffer $iobuffer	
	#I2C - sda_input
	if {$Para(i2c0_en) == 1} {lappend str -i2c_sda_input_left $Para(i2c0_sda_i_delay)}
	if {$Para(i2c1_en) == 1} {lappend str -i2c_sda_input_right $Para(i2c1_sda_i_delay)}
	#I2C - sda_output
	if {$Para(i2c0_en) == 1} {lappend str -i2c_sda_output_left $Para(i2c0_sda_o_delay)}
	if {$Para(i2c1_en) == 1} {lappend str -i2c_sda_output_right $Para(i2c1_sda_o_delay)}
	#I2C - Desired I2C Bus Clock Performance
	if {$Para(i2c0_en) == 1} {lappend str -i2c_rate_left $Para(i2c0_bus_perf)}
	if {$Para(i2c1_en) == 1} {lappend str -i2c_rate_right $Para(i2c1_bus_perf)}
	#I2C - Enable FIFO Mode
	set fifo_enable none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1} {set fifo_enable left}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1} {set fifo_enable right}
	if {$Para(i2c0_en) == 1 && $Para(i2c1_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c1_fifo_enb) == 1} {set fifo_enable both}
	lappend str -i2c_fifo_enable $fifo_enable
	#I2C - CLK Stretch Enable
	set fifo_stretch_enable none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_clkstr) == 1} {
		set fifo_stretch_enable left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_clkstr) == 1} {
		set fifo_stretch_enable right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c1_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c0_fifo_clkstr) == 1 && $Para(i2c1_fifo_clkstr) == 1} {
		set fifo_stretch_enable both
	}
	lappend str -i2c_fifo_clkstr $fifo_stretch_enable
	#I2C - RxFIFO Almost Full & TxFIFO Almost Empty
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1} {
		lappend str -i2c_fifo_rxalmostf_left $Para(i2c0_fifo_rxalmostf)
		lappend str -i2c_fifo_txalmoste_left $Para(i2c0_fifo_txalmoste)
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1} {
		lappend str -i2c_fifo_rxalmostf_right $Para(i2c1_fifo_rxalmostf)
		lappend str -i2c_fifo_txalmoste_right $Para(i2c1_fifo_txalmoste)
	}
	#I2C0 - Slave Address
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1} {
		lappend str -i2c_addr_left $Para(i2c0_fifo_slave_addr)
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 0} {
		#lappend str -i2c_addr_left $Para(i2c0_slave_addr)01
		lappend str -i2c_addr_left $Para(i2c0_slave_addr)10
	}	
	#I2C1 - Slave Address
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1} {
		lappend str -i2c_addr_right $Para(i2c1_fifo_slave_addr)
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 0} {
		#lappend str -i2c_addr_right $Para(i2c1_slave_addr)10
		lappend str -i2c_addr_right $Para(i2c1_slave_addr)01
	}	
	#I2C - I2C_WAKEUP_SLAVE
	set wakeup_slave none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_wakeup_slave) == 1} {
		set wakeup_slave left
	}
	lappend str -i2c_wakeup_addr_match $wakeup_slave
	#I2C - I2C_WAKEUP_MASTER
	set wakeup_master none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_wakeup_master) == 1} {
		set wakeup_master left
	}
	lappend str -i2c_wakeup_fifo_af $wakeup_master
	
	#I2C -Arbitration Lost IRQ Enable
	set arbitration_lost none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 0 && $Para(i2c0_arbitration_lost) == 1} {
		set arbitration_lost left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 0 && $Para(i2c1_arbitration_lost) == 1} {
		set arbitration_lost right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 0 && $Para(i2c0_arbitration_lost) == 1 && $Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 0 && $Para(i2c1_arbitration_lost) == 1} {
		set arbitration_lost both
	}	
	lappend str -i2c_arbitration_lost $arbitration_lost
	
	#I2C -TxRx Ready IRQ Enable
	set txrx_ready none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 0 && $Para(i2c0_txrxready) == 1} {
		set txrx_ready left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 0 && $Para(i2c1_txrxready) == 1} {
		set txrx_ready right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 0 && $Para(i2c0_txrxready) == 1 && $Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 0 && $Para(i2c1_txrxready) == 1} {
		set txrx_ready both
	}
	lappend str -i2c_txrx_ready $txrx_ready
	
	#I2C -TxRx Overrun or NACK IRQ Enable 
	set overrun none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 0 && $Para(i2c0_intr_nack) == 1} {
		set overrun left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 0 && $Para(i2c1_intr_nack) == 1} {
		set overrun right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 0 && $Para(i2c0_intr_nack) == 1 && $Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 0 && $Para(i2c1_intr_nack) == 1} {
		set overrun both
	}
	lappend str -i2c_overrun $overrun
	
	#I2C -General Call IRQ Enable	
    set intr_gc none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 0 && $Para(i2c0_intr_gc) == 1} {
		set intr_gc left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 0 && $Para(i2c1_intr_gc) == 1} {
		set intr_gc right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 0 && $Para(i2c0_intr_gc) == 1 && $Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 0 && $Para(i2c1_intr_gc) == 1} {
		set intr_gc both
	}
	lappend str -i2c_intr_gc $intr_gc
	
	#I2C -General Call
	set fifo_intr_gc none	
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_intr_gc) == 1} {
		set fifo_intr_gc left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_intr_gc) == 1} {
		set fifo_intr_gc right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_intr_gc) == 1 && $Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_intr_gc) == 1} {
		set fifo_intr_gc both
	}
	lappend str -i2c_fifo_intr_gc $fifo_intr_gc
	
	#I2C -Receive NACK
	set receive_nack none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_receive_nack) == 1} {
		set receive_nack left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_receive_nack) == 1} {
		set receive_nack right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_receive_nack) == 1 && $Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_receive_nack) == 1} {
		set receive_nack both
	}
	lappend str -i2c_fifo_nack $receive_nack
	#I2C -Master Read Complete
	set master_read none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_mrxrdy) == 1} {
		set master_read left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_mrxrdy) == 1} {
		set master_read right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_mrxrdy) == 1 && $Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_mrxrdy) == 1} {
		set master_read both
	}
	lappend str -i2c_fifo_mrc $master_read
	
	#I2C -Arbitration Lost
	set arbitration_lost none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_intr_arbit) == 1} {
		set arbitration_lost left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_intr_arbit) == 1} {
		set arbitration_lost right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_intr_arbit) == 1 && $Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_intr_arbit) == 1} {
		set arbitration_lost both
	}
	lappend str -i2c_fifo_arbit $arbitration_lost
	
	#I2C -Tx FIFO Sync
	set tx_fifo_sync none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_txsync) == 1} {
		set tx_fifo_sync left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_txsync) == 1} {
		set tx_fifo_sync right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_txsync) == 1 && $Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_txsync) == 1} {
		set tx_fifo_sync both
	}
	lappend str -i2c_fifo_txsync $tx_fifo_sync
	
	#I2C -Tx FIFO Underflow
	set tx_fifo_underflow none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_txunder) == 1} {
		set tx_fifo_underflow left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_txunder) == 1} {
		set tx_fifo_underflow right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_txunder) == 1 && $Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_txunder) == 1} {
		set tx_fifo_underflow both
	}
	lappend str -i2c_fifo_txunder $tx_fifo_underflow
	
	#I2C -Rx FIFO Overflow
	set tx_fifo_overflow none
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_rrover) == 1} {
		set tx_fifo_overflow left
	}
	if {$Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_rrover) == 1} {
		set tx_fifo_overflow right
	}
	if {$Para(i2c0_en) == 1 && $Para(i2c0_fifo_enb) == 1 && $Para(i2c0_fifo_rrover) == 1 && $Para(i2c1_en) == 1 && $Para(i2c1_fifo_enb) == 1 && $Para(i2c1_fifo_rrover) == 1} {
		set tx_fifo_overflow both
	}
	lappend str -i2c_fifo_rxover $tx_fifo_overflow
	
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
	
	set str [SnowCmdLine ]

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	ProjectSet
	MainInterface
	AttributeSetting 600 600
	set pin_flag 1
	DrawImage 220 520 

	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	# Hard IP Enables tab
	set page [$tnb add -label "Hard IP Enables"]
	
	iwidgets::labeledframe .setframe -labeltext "Enable Hard Users IPs" -labelpos nw
	set setframe [.setframe childsite]
	
    checkbutton .ck_i2c0_en -text "Enable Hard Users I2C0" -variable Para(i2c0_en) -command {ChangeValueCmd;ChangeValueCmd_I2C0_FIFO_ENB}
	pack .ck_i2c0_en -in $setframe -anchor w -padx 5
	
	set w 25
	CreateLabelEntryLabel $setframe clk_freq0 "System Bus Clock Frequency" 20 "MHz" "" Para(clk_freq0) {real}
	.lblclk_freq0 config -width $w -anchor w
	.entryclk_freq0.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd;CalculateI2c0Actual}
			return 1
	}
	.lblclk_freq0 config -state disabled
	.entryclk_freq0 config -state disabled
	
    checkbutton .ck_i2c1_en -text "Enable Hard Users I2C1" -variable Para(i2c1_en) -command {ChangeValueCmd;ChangeValueCmd_I2C1_FIFO_ENB}
	pack .ck_i2c1_en -in $setframe -anchor w -padx 5
	
	set w 25
	CreateLabelEntryLabel $setframe clk_freq1 "System Bus Clock Frequency" 20 "MHz" "" Para(clk_freq1) {real}
	.lblclk_freq1 config -width $w -anchor w
	.entryclk_freq1.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd;CalculateI2c1Actual}
			return 1
	}
	.lblclk_freq1 config -state disabled
	.entryclk_freq1 config -state disabled
	
	pack .setframe -in $page -fill both -expand 1
	
	#I2C Settings tab
	set page2 [$tnb add -label "I2C Settings"]
	
    iwidgets::labeledframe .csI2C
	set csI2C [.csI2C childsite]
	
	#I2C0
	iwidgets::labeledframe .csI2C0 -labeltext "I2C0" -labelpos nw
	set csI2C0 [.csI2C0 childsite]
	#I2C0-General
 	iwidgets::labeledframe .csi2c0_general -labeltext "General" -labelpos nw
	set csi2c0_general [.csi2c0_general childsite]
	checkbutton .ck1I2C0 -text "General Call Enable" -variable Para(i2c0_gen_call) -anchor w -command {ChangeValueCmd}
	checkbutton .ck2I2C0 -text "Include IO Buffers" -variable Para(include_iob_i2c0) -anchor w -command {ChangeValueCmd}
	pack .ck1I2C0 .ck2I2C0 -in $csi2c0_general -side top -anchor w -padx 10
	
	set i_val_lst {0 50}
	CreateLabelCombobox $csi2c0_general i2c0_Input_Delay "SDA Input Delay (ns)" 20 8 Para(i2c0_sda_i_delay) $i_val_lst {ChangeValueCmd}
	.lbli2c0_Input_Delay config -width 20 -anchor w

	set o_val_lst {0 50 75 125 150 200 300 350}
	CreateLabelCombobox $csi2c0_general i2c0_Output_Delay "SDA Output Delay (ns)" 20 8 Para(i2c0_sda_o_delay) $o_val_lst {ChangeValueCmd}
	.lbli2c0_Output_Delay config -width 20 -anchor w
	
	#I2C0-Master Clock Rate
 	iwidgets::labeledframe .csi2c0_clkRate -labeltext "Master Clock Rate" -labelpos nw
	set csi2c0_clkRate [.csi2c0_clkRate childsite]
	
	set desired_lst {50 100 400 1000}
	CreateLabelCombobox $csi2c0_clkRate i2c0_desired "Desired(KHz)" 20 8 Para(i2c0_bus_perf) $desired_lst {CalculateI2c0Actual}
	.lbli2c0_desired config -width 20 -anchor w

	CreateLabelEntryLabel $csi2c0_clkRate i2c0_actual "Actual(KHz)" 10 "" "" Para(i2c0_clk_divider) {real}
	.lbli2c0_actual config -width 20 -anchor w
	.entryi2c0_actual.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
    .entryi2c0_actual config -state disabled
	
	#I2C0 - FIFO Mode
	iwidgets::labeledframe .csi2c0_fifomode -labeltext "FIFO Mode" -labelpos nw
	set csi2c0_fifomode [.csi2c0_fifomode childsite]
	
	checkbutton .ck1i2c0_fifo_enb -text "Enable FIFO Mode" -variable Para(i2c0_fifo_enb) -anchor w -command {ChangeValueCmd_I2C0_FIFO_ENB}
	checkbutton .ck1i2c0_fifo_clkstr -text "CLK Stretch Enable" -variable Para(i2c0_fifo_clkstr) -anchor w -command {ChangeValueCmd}
	pack .ck1i2c0_fifo_enb .ck1i2c0_fifo_clkstr -in $csi2c0_fifomode -side top -anchor w -padx 10
	
	CreateLabelCombobox $csi2c0_fifomode i2c0_almost_full "RxFIFO Almost Full" 20 8 Para(i2c0_fifo_rxalmostf) {} {ChangeValueCmd}
	.lbli2c0_almost_full config -width 20 -anchor w
	
	for {set i 32} {$i > 0} {set i [incr i -1]}  {
		.cboi2c0_almost_full insert list end $i
	} 
	
	CreateLabelCombobox $csi2c0_fifomode i2c0_almost_empty "TxFIFO Almost Empty" 20 8 Para(i2c0_fifo_txalmoste) {} {ChangeValueCmd}
	.lbli2c0_almost_empty config -width 20 -anchor w
	for {set i 32} {$i > 0} {set i [incr i -1]}  {
		.cboi2c0_almost_empty insert list end $i
	} 
	
	#I2C0 - I2C Addressing
	iwidgets::labeledframe .csi2c0_addressing -labeltext "I2C Addressing" -labelpos nw
	set csi2c0_addressing [.csi2c0_addressing childsite]
	
	iwidgets::combobox .cboi2c0_bitaddressing -textvariable Para(i2c0_bitaddressing) -selectioncommand {ChangeI2CBitCmd1;ChangeValueCmd} -editable false -width 16
	.cboi2c0_bitaddressing insert list end "7-Bit Addressing" "10-Bit Addressing"
	pack .cboi2c0_bitaddressing -in $csi2c0_addressing -side top -anchor w -padx 10 -pady 4

	#iwidgets::entryfield .entryi2c0_slave_addr -labeltext "01" -labelpos e -width 15 -textvariable Para(i2c0_slave_addr) -fixed 5 -validate {bin %c}
	iwidgets::entryfield .entryi2c0_slave_addr -labeltext "10" -labelpos e -width 15 -textvariable Para(i2c0_slave_addr) -fixed 5 -validate {bin %c}
	pack .entryi2c0_slave_addr -in $csi2c0_addressing -side top -anchor w -padx 10 -pady 4
	
	iwidgets::entryfield .entryi2c0_fifo_slave_addr -labelpos e -width 18 -textvariable Para(i2c0_fifo_slave_addr) -fixed 7 -validate {bin %c}
	pack .entryi2c0_fifo_slave_addr -in $csi2c0_addressing -side top -anchor w -padx 10 -pady 4
	
	#I2C0 - PMU Wake Options
	iwidgets::labeledframe .csi2c0_pmuwakeoptions -labeltext "PMU Wake Options" -labelpos nw
	set csi2c0_pmuwakeoptions [.csi2c0_pmuwakeoptions childsite]
	
	checkbutton .ck1i2c0_wakeup_slave -text "Address Match" -variable Para(i2c0_wakeup_slave) -anchor w -command {ChangeSlaveValueCmd;CallDrawPins}
	checkbutton .ck1i2c0_wakeup_master -text "RxFIFO Almost Full" -variable Para(i2c0_wakeup_master) -anchor w -command {ChangeMasterValueCmd;CallDrawPins}
	pack .ck1i2c0_wakeup_slave .ck1i2c0_wakeup_master -in $csi2c0_pmuwakeoptions -side top -anchor w -padx 10
	
	
	pack .csi2c0_general .csi2c0_clkRate .csi2c0_fifomode .csi2c0_addressing .csi2c0_pmuwakeoptions -in $csI2C0 -side top -anchor w -fill x
	
	#I2C1
	iwidgets::labeledframe .csI2C1 -labeltext "I2C1" -labelpos nw
	set csI2C1 [.csI2C1 childsite]
	#I2C1-General
 	iwidgets::labeledframe .csi2c1_general -labeltext "General" -labelpos nw
	set csi2c1_general [.csi2c1_general childsite]
	checkbutton .ck1I2C1 -text "General Call Enable" -variable Para(i2c1_gen_call) -anchor w -command {ChangeValueCmd}
	checkbutton .ck2I2C1 -text "Include IO Buffers" -variable Para(include_iob_i2c1) -anchor w -command {ChangeValueCmd}
	pack .ck1I2C1 .ck2I2C1 -in $csi2c1_general -side top -anchor w -padx 10
	
	set i_val_lst {0 50}
	CreateLabelCombobox $csi2c1_general i2c1_Input_Delay "SDA Input Delay (ns)" 20 8 Para(i2c1_sda_i_delay) $i_val_lst {ChangeValueCmd}
	.lbli2c1_Input_Delay config -width 20 -anchor w

	set o_val_lst {0 50 75 125 150 200 300 350}
	CreateLabelCombobox $csi2c1_general i2c1_Output_Delay "SDA Output Delay (ns)" 20 8 Para(i2c1_sda_o_delay) $o_val_lst {ChangeValueCmd}
	.lbli2c1_Output_Delay config -width 20 -anchor w
	
	#I2C1-Master Clock Rate
 	iwidgets::labeledframe .csi2c1_clkRate -labeltext "Master Clock Rate" -labelpos nw
	set csi2c1_clkRate [.csi2c1_clkRate childsite]
	
	set desired_lst {50 100 400 1000}
	CreateLabelCombobox $csi2c1_clkRate i2c1_desired "Desired(KHz)" 20 8 Para(i2c1_bus_perf) $desired_lst {CalculateI2c1Actual}
	.lbli2c1_desired config -width 20 -anchor w

	CreateLabelEntryLabel $csi2c1_clkRate i2c1_actual "Actual(KHz)" 10 "" "" Para(i2c1_clk_divider) {real}
	.lbli2c1_actual config -width 20 -anchor w
	.entryi2c1_actual.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
    .entryi2c1_actual config -state disabled
	
	#I2C1 - FIFO Mode
	iwidgets::labeledframe .csi2c1_fifomode -labeltext "FIFO Mode" -labelpos nw
	set csi2c1_fifomode [.csi2c1_fifomode childsite]
	
	checkbutton .ck1i2c1_fifo_enb -text "Enable FIFO Mode" -variable Para(i2c1_fifo_enb) -anchor w -command {ChangeValueCmd_I2C1_FIFO_ENB}
	checkbutton .ck1i2c1_fifo_clkstr -text "CLK Stretch Enable" -variable Para(i2c1_fifo_clkstr) -anchor w -command {ChangeValueCmd}
	pack .ck1i2c1_fifo_enb .ck1i2c1_fifo_clkstr -in $csi2c1_fifomode -side top -anchor w -padx 10
	
	CreateLabelCombobox $csi2c1_fifomode i2c1_almost_full "RxFIFO Almost Full" 20 8 Para(i2c1_fifo_rxalmostf) {} {ChangeValueCmd}
	.lbli2c1_almost_full config -width 20 -anchor w
	for {set i 32} {$i > 0} {set i [incr i -1]}  {
		.cboi2c1_almost_full insert list end $i
	} 
	
	CreateLabelCombobox $csi2c1_fifomode i2c1_almost_empty "TxFIFO Almost Empty" 20 8 Para(i2c1_fifo_txalmoste) {} {ChangeValueCmd}
	.lbli2c1_almost_empty config -width 20 -anchor w
	for {set i 32} {$i > 0} {set i [incr i -1]}  {
		.cboi2c1_almost_empty insert list end $i
	} 
	
	#I2C1 - I2C Addressing
	iwidgets::labeledframe .csi2c1_addressing -labeltext "I2C Addressing" -labelpos nw
	set csi2c1_addressing [.csi2c1_addressing childsite]
	
	iwidgets::combobox .cboi2c1_bitaddressing -textvariable Para(i2c1_bitaddressing) -selectioncommand {ChangeI2CBitCmd2;ChangeValueCmd} -editable false -width 16
	.cboi2c1_bitaddressing insert list end "7-Bit Addressing" "10-Bit Addressing"
	pack .cboi2c1_bitaddressing -in $csi2c1_addressing -side top -anchor w -padx 10 -pady 4

	#iwidgets::entryfield .entryi2c1_slave_addr -labeltext "10" -labelpos e -width 15 -textvariable Para(i2c1_slave_addr) -fixed 5 -validate {bin %c}
	iwidgets::entryfield .entryi2c1_slave_addr -labeltext "01" -labelpos e -width 15 -textvariable Para(i2c1_slave_addr) -fixed 5 -validate {bin %c}
	pack .entryi2c1_slave_addr -in $csi2c1_addressing -side top -anchor w -padx 10 -pady 4
	
	iwidgets::entryfield .entryi2c1_fifo_slave_addr -labelpos e -width 18 -textvariable Para(i2c1_fifo_slave_addr) -fixed 7 -validate {bin %c}
	pack .entryi2c1_fifo_slave_addr -in $csi2c1_addressing -side top -anchor w -padx 10 -pady 4
	
	pack .csi2c1_general .csi2c1_clkRate .csi2c1_fifomode .csi2c1_addressing -in $csI2C1 -side top -anchor w -fill x
	
	grid .csI2C0 .csI2C1 -in $csI2C -sticky ns;#-side left
	pack .csI2C -in $page2 -fill x
	
	
	
	#I2C Interupts tab
	set page3 [$tnb add -label "I2C Interrupts"]
	
    iwidgets::labeledframe .csI2CInterupts
	set csI2CInterupts [.csI2CInterupts childsite]
	
	
	#I2C0 Interupts
	iwidgets::labeledframe .csI2C0Interupt -labeltext "I2C0" -labelpos nw
	set csI2C0Interupt [.csI2C0Interupt childsite]
	set width 27
	#I2C0-System Bus Interupts
 	iwidgets::labeledframe .csi2c0_systembusintr -labeltext "System Bus Interrupts" -labelpos nw
	set csi2c0_systembusintr [.csi2c0_systembusintr childsite]
	checkbutton .ck1I2C0_arbitration_lost -width $width -text "Arbitration Lost" -variable Para(i2c0_arbitration_lost) -anchor w -command {ChangeValueCmd}
	checkbutton .ck2I2C0_txrxready -width $width -text "Tx/Rx Ready" -variable Para(i2c0_txrxready) -anchor w -command {ChangeValueCmd}
	checkbutton .ck3I2C0_intr_nack -width $width -text "Overrun or NACK" -variable Para(i2c0_intr_nack) -anchor w -command {ChangeValueCmd}
	checkbutton .ck4I2C0_intr_gc -width $width -text "General Call IRQ Enable" -variable Para(i2c0_intr_gc) -anchor w -command {ChangeValueCmd}
	pack .ck1I2C0_arbitration_lost .ck2I2C0_txrxready .ck3I2C0_intr_nack .ck4I2C0_intr_gc -in $csi2c0_systembusintr -side top -anchor w -padx 10
	
	#I2C0-FIFO Interupts
 	iwidgets::labeledframe .csI2C0_fifo_interupts -labeltext "FIFO Interrupts" -labelpos nw
	set csI2C0_fifo_interupts [.csI2C0_fifo_interupts childsite]
	checkbutton .ck1I2C0_fifo_intr_gc -width $width -text "General Call" -variable Para(i2c0_fifo_intr_gc) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1I2C0_fifo_receive_nack -width $width -text "Receive NACK" -variable Para(i2c0_receive_nack) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1I2C0_fifo_mrxrdy -width $width -text "Master Read Complete" -variable Para(i2c0_fifo_mrxrdy) -anchor w -command {ChangeMasterReadCompleteCmd;CallDrawPins}
	checkbutton .ck1I2C0_fifo_intr_arbit -width $width -text "Arbitration Lost" -variable Para(i2c0_fifo_intr_arbit) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1I2C0_fifo_txsync -width $width -text "Tx FIFO Sync" -variable Para(i2c0_fifo_txsync) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1I2C0_fifo_txunder -width $width -text "Tx FIFO Underflow" -variable Para(i2c0_fifo_txunder) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1I2C0_fifo_rrover -width $width -text "Rx FIFO Overflow" -variable Para(i2c0_fifo_rrover) -anchor w -command {ChangeValueCmd}
	pack .ck1I2C0_fifo_intr_gc .ck1I2C0_fifo_receive_nack .ck1I2C0_fifo_mrxrdy .ck1I2C0_fifo_intr_arbit .ck1I2C0_fifo_txsync .ck1I2C0_fifo_txunder .ck1I2C0_fifo_rrover -in $csI2C0_fifo_interupts -side top -anchor w -padx 10
		
	pack .csi2c0_systembusintr .csI2C0_fifo_interupts -in $csI2C0Interupt -side top -anchor w -fill both -expand 1
	
	#I2C1 Interupts
	iwidgets::labeledframe .csI2C1Interupt -labeltext "I2C1" -labelpos nw
	set csI2C1Interupt [.csI2C1Interupt childsite]
	
	#I2C1-System Bus Interupts
 	iwidgets::labeledframe .csI2C1_systembusintr -labeltext "System Bus Interrupts" -labelpos nw
	set csI2C1_systembusintr [.csI2C1_systembusintr childsite]
	checkbutton .ck1I2C1_arbitration_lost -width $width -text "Arbitration Lost" -variable Para(i2c1_arbitration_lost) -anchor w -command {ChangeValueCmd}
	checkbutton .ck2I2C1_txrxready -width $width -text "Tx/Rx Ready" -variable Para(i2c1_txrxready) -anchor w -command {ChangeValueCmd}
	checkbutton .ck3I2C1_intr_nack -width $width -text "Overrun or NACK" -variable Para(i2c1_intr_nack) -anchor w -command {ChangeValueCmd}	
	checkbutton .ck4I2C1_intr_gc -width $width -text "General Call IRQ Enable" -variable Para(i2c1_intr_gc) -anchor w -command {ChangeValueCmd}
	pack .ck1I2C1_arbitration_lost .ck2I2C1_txrxready .ck3I2C1_intr_nack .ck4I2C1_intr_gc -in $csI2C1_systembusintr -side top -anchor w -padx 10
	
	#I2C1-FIFO Interupts
 	iwidgets::labeledframe .csI2C1_fifo_interupts -labeltext "FIFO Interrupts" -labelpos nw
	set csI2C1_fifo_interupts [.csI2C1_fifo_interupts childsite]
	checkbutton .ck1I2C1_fifo_intr_gc -width $width -text "General Call" -variable Para(i2c1_fifo_intr_gc) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1I2C1_fifo_receive_nack -width $width -text "Receive NACK" -variable Para(i2c1_receive_nack) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1I2C1_fifo_mrxrdy -width $width -text "Master Read Complete" -variable Para(i2c1_fifo_mrxrdy) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1I2C1_fifo_intr_arbit -width $width -text "Arbitration Lost" -variable Para(i2c1_fifo_intr_arbit) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1I2C1_fifo_txsync -width $width -text "Tx FIFO Sync" -variable Para(i2c1_fifo_txsync) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1I2C1_fifo_txunder -width $width -text "Tx FIFO Underflow" -variable Para(i2c1_fifo_txunder) -anchor w -command {ChangeValueCmd}
	checkbutton .ck1I2C1_fifo_rrover -width $width -text "Rx FIFO Overflow" -variable Para(i2c1_fifo_rrover) -anchor w -command {ChangeValueCmd}
	pack .ck1I2C1_fifo_intr_gc .ck1I2C1_fifo_receive_nack .ck1I2C1_fifo_mrxrdy .ck1I2C1_fifo_intr_arbit .ck1I2C1_fifo_txsync .ck1I2C1_fifo_txunder .ck1I2C1_fifo_rrover -in $csI2C1_fifo_interupts -side top -anchor w -padx 10
		
	pack .csI2C1_systembusintr .csI2C1_fifo_interupts -in $csI2C1Interupt -side top -anchor w -fill both -expand 1
	
	grid .csI2C0Interupt .csI2C1Interupt -in $csI2CInterupts -sticky ns;
	pack .csI2CInterupts -in $page3 -fill both -expand 1
	
	$tnb delete 0

#		$tnb view 0

	GeneralConfig
	$Para(generate_cfg) configure -state disabled

	ChangeValueCmd

	pack forget .cboBusOrder 
	

	$tnb view 0
}