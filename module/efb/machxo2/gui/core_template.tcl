#$Header: L:/module/efb/machxo2/gui/core_template.tcl 1.45 mghuang Exp $

#Rev 1.45: Diamond 3.4.1 IPExpress: XO3LF UFM size updated
#Rev 1.44: Diamond 3.4.1 IPExpress: XO3LF support
#Rev 1.43: Diamond 3.2 IPExpress: Fixed SOF-120649
#Rev 1.42: Diamond 3.1 IPExpress: XO3 support
#Rev 1.41: Diamond 3.0 IPExpress: Fixed SOF-117403
#Rev 1.40: Diamond 3.0 IPExpress: Fixed SOF-115586
#Rev 1.39: Diamond 2.2 IPExpress: CR_58644, EFB UM rev 2.91
#Rev 1.38: Diamond 2.1 IPExpress: CR_57800, MachXO2_SPI_Usage_Model_v2.80
#Rev 1.37.1.0: Diamond 2.0.1 IPExpress: Fixed ISPL_PATCH_218
#Rev 1.36/1.37: Diamond 2.0 IPExpress: POJO2 support.
#Rev 1.35: Diamond 2.0 IPExpress: Fixed cr_56694
#Rev 1.34: Diamond 2.0 IPExpress: Fixed cr_55417
#Rev 1.33: Diamond 2.0 IPExpress: Undo cr_56262
#Rev 1.32: Diamond 2.0 IPExpress: Fixed cr_56393,56551
#Rev 1.31: Diamond 2.0 IPExpress: Fixed cr_56262
#Rev 1.30: Diamond 1.4.2 IPExpress: Fixed cr_56103, UM rev 3.12.
#Rev 1.29: Diamond 1.4.2 IPExpress: Fixed cr_56047.
#Rev 1.28: Diamond 1.4.2 IPExpress: Fixed cr_56046.
#Rev 1.27: Diamond 1.4.2 IPExpress: EFB UM rev 2.90 & I2C UM rev 3.11
#Rev 1.26: UM 2.89, Diamond 1.3 IPExpress: Fixed CR_53730
#Rev 1.25: Diamond 1.3 IPExpress: Fixed CR_53083
#Rev 1.24: Diamond 1.3 IPExpress: Fixed CR_53005
#Rev 1.23: Diamond 1.3 IPExpress: SCR_1101/CR_52661, UFM size change
#Rev 1.22: Diamond 1.2 IPExpress: Fixed CR_52544
#Rev 1.21: Diamond 1.2 IPExpress: Fixed CR_52409
#Rev 1.20: Diamond 1.2 IPExpress: SPI UM V2.73, MASTER is not supported in this version of Diamond.
#Rev 1.19: Diamond 1.2 IPExpress: Fixed CR_51945

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CallDrawPins {}  {
	global Para pin_flag

	if {[string length $Para(wb_clk_freq)] > 0 && $Para(spi_freq) > 0}  {
		  if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
			if {$Para(ufm0) == 1 || $Para(ufm1) == 1 || $Para(ufm2) == 1 || $Para(ufm3) == 1 || $Para(ufm_cfg0) == 1 || $Para(ufm_cfg1) == 1} {
				#if {$Para(mem_size0) > 0} {
				#	DrawPins
				#}
				#if {$Para(mem_size1) > 0} {
				#	DrawPins
				#}
				#if {$Para(mem_size2) > 0} {
				#	DrawPins
				#}
				#if {$Para(mem_size3) > 0} {
				#	DrawPins
				#}
				#if {$Para(mem_size_cfg1) > 0} {
				#	DrawPins
				#}
				DrawPins
				
			} else {
				DrawPins
			}
		} else {
			if {$Para(ufm) == 1 } {
				if {$Para(mem_size) > 0} {
					DrawPins
				}
			} else {
				DrawPins
			}
		}
	} 
} 

proc GetDeviceDensity {}  {
	global Para
	# Following Modules for MachXO,MachXO2 are only support for 1/2k device.
	if {$Para(arch) == "xo2c00" || $Para(arch) == "xo3c00a" || $Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
		regexp {(^[a-zA-Z0-9]+)-([0-9]+)?(.*)$} $Para(PartType) match x y z
	}
	#! POJO2
	if {$Para(arch) == "xo2c00p"} {
		set a [string range $Para(PartType) 5 5]
		switch $a {
			"0" {set y 640}
			"1" {set y 1200}
			"4" {set y 4000}
			"7" {set y 7000}
		}
	}
	#if {$y == 256 || $y == 640}  {set EBR_Dev_Flag 0}
	#tk_messageBox -default ok -icon warning -message $y -title $Para(PartType) -type ok
	
	return $y
} 

proc UFMCmd {} {
	global Para

	set density [GetDeviceDensity]

	if {[string first "U" $Para(PartType)]  > 0} {
		set u_flag "true"
	} else {
		set u_flag "false"
	}
	set max 0
	if {$Para(arch) == "xo3c00f" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
		switch $density {
			"640" -
			"1300" {set max 511}
			"2100" {set max 639}
			"4300" {set max 767}
			"6900" {set max 2046}
			"9400" {set max 3582}
		}
	} else {
		switch $density {
			"256" {set max 0}
			"640" {
				if { $u_flag == "false"} {
					set max 191
				} else {
					set max 511
				}
			}
			"1200" {
				if { $u_flag == "false"} {
					set max 511
				} else {
					set max 639
				}
			}
			"2000" {
				if { $u_flag == "false"} {
					set max 639
				} else {
					set max 767
				}
			}
			"4000" {set max 767}
			"7000" {set max 2046}
			"10000" {set max 3582}
		}
	}
	if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	} else {
		if {[string length $Para(mem_size)] >1} {
			set Para(mem_size) [string trimleft $Para(mem_size) 0]
		}
		if {$Para(mem_size) < 0} {
			set Para(ufm_ebr) $max
		} else {
			set Para(ufm_ebr) [expr $max - $Para(mem_size)]
		}
		if {$Para(ufm_init) == "0"} {
			.entufm_df config -state disabled
			.btnufm_df config -state disabled
			.rdo1ufm_dt config -state disabled
			.rdo2ufm_dt config -state disabled
		} else {
			.entufm_df config -state normal
			.btnufm_df config -state normal
			.rdo1ufm_dt config -state normal
			.rdo2ufm_dt config -state normal
		}

	
	}
	
	
    if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	
	#UFM0
	#set Para(max_0) 3582
	set Para(max_0) $Para(efb_max_0)
	if {[string length $Para(mem_size0)] >1} {
		set Para(mem_size0) [string trimleft $Para(mem_size0) 0]
	}
	if {$Para(mem_size0) < 0} {
		set Para(ufm0_ebr) $Para(max_0)
	} else {
		set Para(ufm0_ebr) [expr $Para(max_0) - $Para(mem_size0)]
	}
	
	if {$Para(ufm0_init) == "0"} {
		.entufm_df0 config -state disabled
		.btnufm_df0 config -state disabled
		.rdo1ufm_dt0 config -state disabled
		.rdo2ufm_dt0 config -state disabled
	} else {
		.entufm_df0 config -state normal
		.btnufm_df0 config -state normal
		.rdo1ufm_dt0 config -state normal
		.rdo2ufm_dt0 config -state normal
	}
	
	#UFM1
	#set Para(max_1) 3582
	set Para(max_1) $Para(efb_max_1)
	if {[string length $Para(mem_size1)] >1} {
		set Para(mem_size1) [string trimleft $Para(mem_size1) 0]
	}
	if {$Para(mem_size1) < 0} {
		set Para(ufm1_ebr) $Para(max_1)
	} else {
		set Para(ufm1_ebr) [expr $Para(max_1) - $Para(mem_size1)]
	}
	
	if {$Para(ufm1_init) == "0"} {
		.entufm_df1 config -state disabled
		.btnufm_df1 config -state disabled
		.rdo1ufm_dt1 config -state disabled
		.rdo2ufm_dt1 config -state disabled
	} else {
		.entufm_df1 config -state normal
		.btnufm_df1 config -state normal
		.rdo1ufm_dt1 config -state normal
		.rdo2ufm_dt1 config -state normal
	}
	#UFM2
	#set Para(max_2) 1151
	set Para(max_2) $Para(efb_max_2)
	if {[string length $Para(mem_size2)] >1} {
		set Para(mem_size2) [string trimleft $Para(mem_size2) 0]
	}
	if {$Para(mem_size2) < 0} {
		set Para(ufm2_ebr) $Para(max_2)
	} else {
		set Para(ufm2_ebr) [expr $Para(max_2) - $Para(mem_size2)]
	}
	
	if {$Para(ufm2_init) == "0"} {
		.entufm_df2 config -state disabled
		.btnufm_df2 config -state disabled
		.rdo1ufm_dt2 config -state disabled
		.rdo2ufm_dt2 config -state disabled
	} else {
		.entufm_df2 config -state normal
		.btnufm_df2 config -state normal
		.rdo1ufm_dt2 config -state normal
		.rdo2ufm_dt2 config -state normal
	}
	#UFM3
	#set Para(max_3) 191
	set Para(max_3) $Para(efb_max_3)
	if {[string length $Para(mem_size3)] >1} {
		set Para(mem_size3) [string trimleft $Para(mem_size3) 0]
	}
	if {$Para(mem_size3) < 0} {
		set Para(ufm3_ebr) $Para(max_3)
	} else {
		set Para(ufm3_ebr) [expr $Para(max_3) - $Para(mem_size3)]
	}
	
	if {$Para(ufm3_init) == "0"} {
		.entufm_df3 config -state disabled
		.btnufm_df3 config -state disabled
		.rdo1ufm_dt3 config -state disabled
		.rdo2ufm_dt3 config -state disabled
	} else {
		.entufm_df3 config -state normal
		.btnufm_df3 config -state normal
		.rdo1ufm_dt3 config -state normal
		.rdo2ufm_dt3 config -state normal
	}
	
	#UFM_CFG0
	if {[string length $Para(mem_size_cfg0)] >1} {
		set Para(mem_size_cfg0) [string trimleft $Para(mem_size_cfg0) 0]
	}
	#set Para(max_cfg0) 12542
	set Para(max_cfg0) $Para(efb_max_cfg0)
	if {$Para(mem_size_cfg0) < 0} {
		set Para(ufm_cfg0_ebr) $Para(max_cfg0)
	} else {
		set Para(ufm_cfg0_ebr) [expr $Para(max_cfg0) - $Para(mem_size_cfg0)]
	}
	if {$Para(ufm_cfg0_init) == "0"} {
		.entufm_df_cfg0 config -state disabled
		.btnufm_df_cfg0 config -state disabled
		.rdo1ufm_dt_cfg0 config -state disabled
		.rdo2ufm_dt_cfg0 config -state disabled
	} else {
		.entufm_df_cfg0 config -state normal
		.btnufm_df_cfg0 config -state normal
		.rdo1ufm_dt_cfg0 config -state normal
		.rdo2ufm_dt_cfg0 config -state normal
	}
	
	#UFM_CFG1
	if {[string length $Para(mem_size_cfg1)] >1} {
		set Para(mem_size_cfg1) [string trimleft $Para(mem_size_cfg1) 0]
	}
	#set Para(max_cfg1) 12542
	set Para(max_cfg1) $Para(efb_max_cfg1)
	if {$Para(mem_size_cfg1) < 0} {
		set Para(ufm_cfg1_ebr) $Para(max_cfg1)
	} else {
		set Para(ufm_cfg1_ebr) [expr $Para(max_cfg1) - $Para(mem_size_cfg1)]
	}
	if {$Para(ufm_cfg1_init) == "0"} {
		.entufm_df_cfg1 config -state disabled
		.btnufm_df_cfg1 config -state disabled
		.rdo1ufm_dt_cfg1 config -state disabled
		.rdo2ufm_dt_cfg1 config -state disabled
	} else {
		.entufm_df_cfg1 config -state normal
		.btnufm_df_cfg1 config -state normal
		.rdo1ufm_dt_cfg1 config -state normal
		.rdo2ufm_dt_cfg1 config -state normal
	}
    }
}

proc TCCmd {} {
	global Para
	
	if {$Para(static_tc) == "Static"} {
		.cbtc_oflow config -state disabled
		.cbtc_opcomp config -state disabled
		.cbtc_ipcap config -state disabled
		.cbtc_sa_oflow config -state normal
		set Para(tc_oflow) 0
		set Para(tc_opcomp) 0
		set Para(tc_ipcap) 0
	} else {
		.cbtc_oflow config -state normal
		.cbtc_opcomp config -state normal
		.cbtc_ipcap config -state normal
		.cbtc_sa_oflow config -state disabled
		set Para(tc_sa_oflow) 0
	}
	
	if {$Para(tc_ctr) == 0} {
		.entrytc_top config -state disabled
		set Para(tc_top) 65535
	} else {
		.entrytc_top config -state normal
	}
	
	if {$Para(tc_mode) == "CTCM"} {
		.entrytc_ocr config -state disabled
	} else {
		.entrytc_ocr config -state normal
	}
}

proc SPICmd {} {
	global Para
	
	if {$Para(wb_clk_freq) > 0 && $Para(spi_freq) > 0 } {
		set Para(wb_clk_freq) [string trimleft $Para(wb_clk_freq) 0]
		set Para(spi_freq) [string trimleft $Para(spi_freq) 0]
		#CR_49873
		#round($Para(wb_clk_freq)/$Para(spi_freq)) = int($Para(wb_clk_freq)/$Para(spi_freq))
		#round($Para(wb_clk_freq)*1.00/$Para(spi_freq)) != int($Para(wb_clk_freq)*1.00/$Para(spi_freq))
		set div [expr round($Para(wb_clk_freq)*1.00/$Para(spi_freq)*1.00)]
		#CR_51195
		if {$div < 1.00} {
			set div 1.00
		}
		if {$div > 50.00} {
			set div 50.00
		}
#		if {$div != 0} {
			set Para(spi_freq2) [format "%.2f" [expr $Para(wb_clk_freq)*1.00/$div]]
#		} else {
#			set Para(spi_freq2) 0
#		}
	} else {
		set Para(spi_freq2) 0
	}
	
	if {$Para(spi_mode) == "Master"} {
		.entryspi_freq 	config -state normal
		.cbospi_cs 		config -state normal
		.csspi_we 		config -state disabled
		.cbspi_hs 		config -state disabled
		set Para(spi_we) 0
		set Para(spi_hs) 0
	} else {
#		.cbspi_hs 		config -state disabled
#		.entryspi_freq 	config -state disabled
#		.cbospi_cs 		config -state disabled
	}
	#CR_49980
	if {$Para(spi_mode) == "Slave"} {
		.entryspi_freq 	config -state disabled
		.cbospi_cs 		config -state disabled
		.csspi_we 		config -state normal
		.cbspi_hs 		config -state normal
	} else {
#		.cbspi_hs 		config -state disabled
#		.csspi_we 		config -state disabled
#		set Para(spi_we) 0
#		set Para(spi_hs) 0
	}
	if {$Para(spi_mode) == "Both"} {
		.entryspi_freq 	config -state normal
		.cbospi_cs 		config -state normal
		.csspi_we 		config -state normal
		.cbspi_hs 		config -state normal
	}
}

proc ChangeI2CBitCmd1 {} {
	global Para
	
	set temp [string range $Para(i2c1_sa) end-4 end]
	if {$Para(i2c1_addr) == "7-Bit Addressing"} {
		#set Para(i2c1_sa) "10000"
		set Para(i2c1_sa) $temp
	} else {
		#set Para(i2c1_sa) "00010000"
		set Para(i2c1_sa) "000$temp"
	}
}

proc ChangeI2CBitCmd2 {} {
	global Para
	
	set temp [string range $Para(i2c2_sa) end-4 end]
	if {$Para(i2c2_addr) == "7-Bit Addressing"} {
		#set Para(i2c2_sa) "10000"
		set Para(i2c2_sa) $temp
	} else {
		#set Para(i2c2_sa) "00010000"
		set Para(i2c2_sa) "000$temp"
	}
}

proc I2CCmd {} {
	global Para

	#cr_49682
	#divider_val(raw) = Freq_wb(MHz)*1000 / (Freq_scl(KHz) * 4)
	if {$Para(wb_clk_freq) > 0} {
		set Para(wb_clk_freq) [string trimleft $Para(wb_clk_freq) 0]
		#CR_52409
		#The divided value must always be rounded up to the next integer if it is not divisible.
		set Para(i2c1_prescale) [expr int(ceil($Para(wb_clk_freq)*1000.0/($Para(i2c1_freq)*4)))]
		set Para(i2c2_prescale) [expr int(ceil($Para(wb_clk_freq)*1000.0/($Para(i2c2_freq)*4)))]
	} else {
		set Para(i2c1_prescale) ""
		set Para(i2c2_prescale) ""
	}
	if {$Para(i2c1) == 1 || $Para(i2c1config) == 1} {
		.ck1I2C1     config -state normal
		.ck2I2C1	  config -state normal	
		.cboi2c1_freq config -state normal
		.cboi2c1_addr config -state normal
		.entryi2c1_sa config -state normal
		
		if {$Para(i2c1_addr) == "7-Bit Addressing"} {
			.entryi2c1_sa config -fixed 5
			if {[string length $Para(i2c1_sa)] > 5} {
#				set Para(i2c1_sa) "00010"
			}
		} else {
			.entryi2c1_sa config -fixed 8
			if {[string length $Para(i2c1_sa)] < 8} {
#				set Para(i2c1_sa) "00000010"
			}
		}
	} else {
		.ck1I2C1     config -state disabled
		.ck2I2C1	  config -state disabled	
		.cboi2c1_freq config -state disabled
		.cboi2c1_addr config -state disabled
		.entryi2c1_sa config -state disabled
	}
	
	if {$Para(i2c2) == 1} {
		.ck1I2C2     config -state normal
		.ck2I2C2     config -state normal
		.cboi2c2_freq config -state normal
		.cboi2c2_addr config -state normal
		.entryi2c2_sa config -state normal

		if {$Para(i2c2_addr) == "7-Bit Addressing"} {
			.entryi2c2_sa config -fixed 5
			if {[string length $Para(i2c2_sa)] > 5} {
#				set Para(i2c2_sa) "00010"
			}
		} else {
			.entryi2c2_sa config -fixed 8
			if {[string length $Para(i2c2_sa)] < 8} {
#				set Para(i2c2_sa) "00000010"
			}
		}
	} else {
		.ck1I2C2     config -state disabled
		.ck2I2C2     config -state disabled
		.cboi2c2_freq config -state disabled
		.cboi2c2_addr config -state disabled
		.entryi2c2_sa config -state disabled
	}		
	
	#I2C UM v3.05, P14, note 5.
	if {($Para(i2c1) == 1 || $Para(i2c1config) == 1) && $Para(i2c2) == 1} {
		if {$Para(i2c1_addr) == $Para(i2c2_addr)} {
			set Para(i2c2_sa) $Para(i2c1_sa)
			.entryi2c2_sa config -state disabled
		} else {
			if {$Para(i2c1_addr) == "7-Bit Addressing"} {
				set Para(i2c1_sa) [string range $Para(i2c2_sa) 3 end]
				.entryi2c1_sa config -state disabled
			} else {
				set Para(i2c2_sa) [string range $Para(i2c1_sa) 3 end]
				.entryi2c2_sa config -state disabled
			}
		}
	}
}

proc PllCmd {density} {
	global Para
	
	#set density [GetDeviceDensity]
	if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	set win [.sfSMI childsite]
	if {$density <= 640} {
		set Para(pll) 0
		$win.ck_pll     config -state disabled
		$win.cbopll_cnt config -state disabled
		$win.lblpll_cnt config -state disabled
	}
	if {$density > 640 && $density <= 2000} {
		$win.ck_pll     config -state normal
		set Para(pll_cnt) 1
		if {$Para(pll) == 1} {
			$win.cbopll_cnt config -state normal
			$win.lblpll_cnt config -state normal
			$win.cbopll_cnt clear list
			$win.cbopll_cnt insert list end 1
		} else {
			$win.cbopll_cnt config -state disabled
			$win.lblpll_cnt config -state disabled
		}
	}
	if {$density > 2000} {
		$win.ck_pll     config -state normal
		if {$Para(pll) == 1} {
			$win.cbopll_cnt config -state normal
			$win.lblpll_cnt config -state normal
			$win.cbopll_cnt clear list
			$win.cbopll_cnt insert list end 1 2
		} else {
			$win.cbopll_cnt config -state disabled
			$win.lblpll_cnt config -state disabled
		}
	}
	} else {
	if {$density <= 640} {
		set Para(pll) 0
		.ck_pll     config -state disabled
		.cbopll_cnt config -state disabled
		.lblpll_cnt config -state disabled
	}
	if {$density > 640 && $density <= 2000} {
		.ck_pll     config -state normal
		set Para(pll_cnt) 1
		if {$Para(pll) == 1} {
			.cbopll_cnt config -state normal
			.lblpll_cnt config -state normal
			.cbopll_cnt clear list
			.cbopll_cnt insert list end 1
		} else {
			.cbopll_cnt config -state disabled
			.lblpll_cnt config -state disabled
		}
	}
	if {$density > 2000} {
		.ck_pll     config -state normal
		if {$Para(pll) == 1} {
			.cbopll_cnt config -state normal
			.lblpll_cnt config -state normal
			.cbopll_cnt clear list
			.cbopll_cnt insert list end 1 2
		} else {
			.cbopll_cnt config -state disabled
			.lblpll_cnt config -state disabled
		}
	}
	}
	
	
}

proc ChangeValueCmd {} {
	global Para
	
	set density [GetDeviceDensity]
	
	set tnb $Para(tnb)
	if {$Para(i2c1) == 1 || $Para(i2c1config) == 1 || $Para(i2c2) == 1} {
		$tnb pageconfigure 1 -state normal
		#! I2C settings.
		I2CCmd

		set Para(ufm_addr) $Para(i2c1_addr)
		set Para(ufm_sa) $Para(i2c1_sa)
	} else {
		$tnb pageconfigure 1 -state disabled
	}
	
	if {$Para(spi) == 1} {
		$tnb pageconfigure 2 -state normal
		#! SPI Settings
		SPICmd
	} else {
		$tnb pageconfigure 2 -state disabled
	}
	
if {$Para(arch) == "xo3c00a"} {
		.ck_ufm config -state disabled
		set Para(ufm) 0
		pack forget .ck_ufm
}
	
	
#	if {$Para(arch) == "xo3c00a"} {
#		.ck_ufm config -state disabled
#		set Para(ufm) 0
#		pack forget .ck_ufm
#		grid forget .csUFMConfig
#	} else {
		if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
		
			set win [.sfSMI childsite]
			if {$Para(tc) == 1} {
				$tnb pageconfigure 3 -state normal
				$win.rdo1tc config -state normal
				$win.rdo2tc config -state normal
				#! TC Settings
				TCCmd
			} else {
				$tnb pageconfigure 3 -state disabled
				$win.rdo1tc config -state disabled
				$win.rdo2tc config -state disabled
			}
			
			#! PLL Settings.
			PllCmd $density
		   
			
		} else {
		
			if {$Para(tc) == 1} {
				$tnb pageconfigure 3 -state normal
				.rdo1tc config -state normal
				.rdo2tc config -state normal
				#! TC Settings
				TCCmd
			} else {
				$tnb pageconfigure 3 -state disabled
				.rdo1tc config -state disabled
				.rdo2tc config -state disabled
			}
			
			#! PLL Settings.
			PllCmd $density
	
			if {$density == 256} {
				.ck_ufm config -state disabled
				set Para(ufm) 0
			} else {
				.ck_ufm config -state normal
			}

			if {$Para(ufm) == 1} {
if {$Para(arch) != "xo3c00a"} {
				$tnb pageconfigure 4 -state normal
}
				#! UFM Settings.
				UFMCmd
			} else {
if {$Para(arch) != "xo3c00a"} {
				$tnb pageconfigure 4 -state disabled
}
			}

		}
	   if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	   
	   	set win [.sfSMI childsite]
	   
	   #UFM_CFG0
		if {$density == 256} {
			$win.ck_ufm_cfg0 config -state disabled
			set Para(ufm_cfg0) 0
		} else {
			$win.ck_ufm_cfg0 config -state normal
		}
		if {$Para(ufm_cfg0) == 1} {
			$tnb pageconfigure 4 -state normal
			#! UFM Settings.
			UFMCmd
		} else {
			$tnb pageconfigure 4 -state disabled
		}
	    #UFM0	
		if {$density == 256} {
			$win.ck_ufm0 config -state disabled
			set Para(ufm0) 0
		} else {
			$win.ck_ufm0 config -state normal
		}		
		if {$Para(ufm0) == 1} {
			$tnb pageconfigure 5 -state normal
			#! UFM Settings.
			UFMCmd
		} else {
			$tnb pageconfigure 5 -state disabled
		}
		
		#UFM_CFG1
		if {$density == 256} {
			$win.ck_ufm_cfg1 config -state disabled
			set Para(ufm_cfg1) 0
		} else {
			$win.ck_ufm_cfg1 config -state normal
		}
		if {$Para(ufm_cfg1) == 1} {
			$tnb pageconfigure 6 -state normal
			#! UFM Settings.
			UFMCmd
		} else {
			$tnb pageconfigure 6 -state disabled
		}
		
		#UFM1	
		if {$density == 256} {
			$win.ck_ufm1 config -state disabled
			set Para(ufm1) 0
		} else {
			$win.ck_ufm1 config -state normal
		}		
		if {$Para(ufm1) == 1} {
			$tnb pageconfigure 7 -state normal
			#! UFM Settings.
			UFMCmd
		} else {
			$tnb pageconfigure 7 -state disabled
		}
		
		#UFM2
		if {$density == 256} {
			$win.ck_ufm2 config -state disabled
			set Para(ufm2) 0
		} else {
			$win.ck_ufm2 config -state normal
		}
		if {$Para(ufm2) == 1} {
			$tnb pageconfigure 8 -state normal
			#! UFM Settings.
			UFMCmd
		} else {
			$tnb pageconfigure 8 -state disabled
		}
		
		#UFM3
		if {$density == 256} {
			$win.ck_ufm3 config -state disabled
			set Para(ufm3) 0
		} else {
			$win.ck_ufm3 config -state normal
		}
		if {$Para(ufm3) == 1} {
			$tnb pageconfigure 9 -state normal
			#! UFM Settings.
			UFMCmd
		} else {
			$tnb pageconfigure 9 -state disabled
		}		
		
	    }
#	}
	
	#cr_56046,56047
	#if {$Para(tc) == 1 && $Para(static_tc) == "Static" && $Para(i2c1) == 0 && 
	#	$Para(i2c2) == 0 && $Para(spi) == 0 && $Para(pll) == 0 && $Para(ufm) == 0} {
	#	.ck_wb config -state disabled
	#	set Para(wb) 0
	#} else {
	 if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	 
	   if {$Para(i2c1) == 1 || $Para(i2c2) == 1 || $Para(spi) == 1 || $Para(pll) == 1 || $Para(ufm0) == 1 || $Para(ufm1) == 1 || $Para(ufm2) == 1 || $Para(ufm3) == 1 || $Para(ufm_cfg0) == 1 || $Para(ufm_cfg1) == 1} {
			$win.ck_wb config -state disabled
			set Para(wb) 1
			if {$Para(tc) == 1} {
				$win.rdo1tc config -state disabled
				set Para(static_tc) Dynamic
			}
		} else {
			if {$Para(tc) == 1} {
				$win.ck_wb config -state disabled
				if {$Para(static_tc) == "Static"} {
					set Para(wb) 0
				} else {
					set Para(wb) 1
				}
			} else {
				$win.ck_wb config -state normal
			}
		}
		#SOF-117403
		if {$Para(i2c1config) == 1 && $Para(i2c1) == 0  && $Para(i2c2) == 0 && $Para(spi) == 0 && 
			$Para(tc) == 0 && $Para(pll) == 0 && $Para(ufm0) == 0 && $Para(ufm1) == 0 && $Para(ufm2) == 0 && $Para(ufm3) == 0 && $Para(ufm_cfg0) == 0 && $Para(ufm_cfg1) == 0} {
			set Para(wb) 0
			$win.ck_wb config -state disabled
		}
	
		if {$Para(i2c1) == 0  && $Para(i2c1config) == 0 && $Para(i2c2) == 0 && $Para(spi) == 0 && 
			$Para(tc) == 0 && $Para(pll) == 0 && $Para(ufm0) == 0 && $Para(ufm1) == 0 && $Para(ufm2) == 0 && $Para(ufm3) == 0 && $Para(ufm_cfg0) == 0 && $Para(ufm_cfg1) == 0 && $Para(wb) == 0} {
			$Para(generate_cfg) configure -state disabled
			#/set msg "At least one function must be enabled (I2C, SPI, etc)."
			#tk_messageBox -default ok -icon warning -message $msg -title $Para(PartType) -type ok
		} else {
			$Para(generate_cfg) configure -state normal
		}

	 } else {
	 
	 
		if {$Para(i2c1) == 1 || $Para(i2c2) == 1 || $Para(spi) == 1 || $Para(pll) == 1 || $Para(ufm) == 1} {
			.ck_wb config -state disabled
			set Para(wb) 1
			if {$Para(tc) == 1} {
				.rdo1tc config -state disabled
				set Para(static_tc) Dynamic
			}
		} else {
			if {$Para(tc) == 1} {
				.ck_wb config -state disabled
				if {$Para(static_tc) == "Static"} {
					set Para(wb) 0
				} else {
					set Para(wb) 1
				}
			} else {
				.ck_wb config -state normal
			}
		}
		#SOF-117403
		if {$Para(i2c1config) == 1 && $Para(i2c1) == 0  && $Para(i2c2) == 0 && $Para(spi) == 0 && 
			$Para(tc) == 0 && $Para(pll) == 0 && $Para(ufm) == 0} {
			set Para(wb) 0
			.ck_wb config -state disabled
		}
	
		if {$Para(i2c1) == 0  && $Para(i2c1config) == 0 && $Para(i2c2) == 0 && $Para(spi) == 0 && 
			$Para(tc) == 0 && $Para(pll) == 0 && $Para(ufm) == 0 && $Para(wb) == 0} {
			$Para(generate_cfg) configure -state disabled
			#/set msg "At least one function must be enabled (I2C, SPI, etc)."
			#tk_messageBox -default ok -icon warning -message $msg -title $Para(PartType) -type ok
		} else {
			$Para(generate_cfg) configure -state normal
		}
	 
	 }
	 
		
	#}
 if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	set Para(efb_ufm_boot) ""
	set win [.sfSMI childsite]
	
	if {$Para(efb_ufm) == 0} {
	
		$win.rdo1boot_option config -state disabled
		$win.cboboot_option_internal config -state disabled
		$win.lblimag0 config -state disabled
		$win.ck_internal_ufm0 config -state disabled
		$win.lblimag1 config -state disabled
		$win.ck_internal_ufm1 config -state disabled
		$win.rdo2boot_option config -state disabled
		
		$win.ck_ufm_cfg0 config -state disabled
		$win.ck_ufm_cfg1 config -state disabled
		$win.ck_ufm0 config -state disabled
		$win.ck_ufm1 config -state disabled
		$win.ck_ufm2 config -state disabled
		$win.ck_ufm3 config -state disabled


		$win.lblufm_option config -state disabled
		set Para(ufm_cfg0) 0
		set Para(ufm_cfg1) 0
		set Para(ufm0) 0
		set Para(ufm1) 0
		set Para(ufm2) 0
		set Para(ufm3) 0
		
		$tnb pageconfigure 4 -state disabled
		$tnb pageconfigure 5 -state disabled
		$tnb pageconfigure 6 -state disabled
		$tnb pageconfigure 7 -state disabled
		$tnb pageconfigure 8 -state disabled
		$tnb pageconfigure 9 -state disabled
		#.ck_wb config -state normal
	} else {
		$win.rdo1boot_option config -state normal
		$win.cboboot_option_internal config -state normal
		$win.lblimag0 config -state normal
		$win.ck_internal_ufm0 config -state normal
		$win.lblimag1 config -state normal
		$win.ck_internal_ufm1 config -state normal
		$win.rdo2boot_option config -state normal
		
		$win.ck_ufm_cfg0 config -state normal
		$win.ck_ufm_cfg1 config -state normal
		$win.ck_ufm0 config -state normal
		$win.ck_ufm1 config -state normal
		$win.ck_ufm2 config -state normal
		$win.ck_ufm3 config -state normal
		$win.lblufm_option config -state normal
	}
	
	
	#set Para(max_0) 3582
	#set Para(max_1) 3582
	#set Para(max_2) 1151
	#set Para(max_3) 191
	#set Para(max_cfg0) 12542
	#set Para(max_cfg1) 12542
	
	
    set Para(max_0) $Para(efb_max_0)
	set Para(max_1) $Para(efb_max_1)
	set Para(max_2) $Para(efb_max_2)
	set Para(max_3) $Para(efb_max_3)
	set Para(max_cfg0) $Para(efb_max_cfg0)
	set Para(max_cfg1) $Para(efb_max_cfg1)
	
	set Para(x_value) 0
	set Para(y_value) 0
	if {$Para(efb_ufm) == 1} {
	
		if {$Para(boot_option) == "Internal" } {
		    $win.lblimag0  config -state normal
			$win.ck_internal_ufm0 config -state normal
			$win.lblimag1  config -state normal
			$win.ck_internal_ufm1 config -state normal
			$win.cboboot_option_internal config -state normal
		
		} else {
			$win.lblimag0  config -state disabled
			$win.ck_internal_ufm0 config -state disabled
			$win.lblimag1  config -state disabled
			$win.ck_internal_ufm1 config -state disabled
			$win.cboboot_option_internal config -state disabled
			set Para(internal_ufm0) 0
			set Para(internal_ufm1) 0
			set Para(boot_option_internal) "Single Boot"
		}
	
		if {$Para(boot_option_internal) == "Single Boot"} {
			$win.lblimag1  config -state disabled
			$win.ck_internal_ufm1 config -state disabled
		} else {
			#$win.lblimag1 config -state normal
			#$win.ck_internal_ufm1  config -state normal
		}
		
	
		if {$Para(boot_option) == "Internal" && $Para(boot_option_internal) == "Single Boot" && $Para(internal_ufm0) == 0} {
			$win.ck_ufm_cfg0 config -state disabled
			set Para(ufm_cfg0) 0
			$tnb pageconfigure 4 -state disabled
			$win.ck_ufm_cfg1 config -state normal
			$win.ck_ufm0 config -state normal
			$win.ck_ufm1 config -state normal
			$win.ck_ufm2 config -state normal
			$win.ck_ufm3 config -state normal
			set Para(efb_ufm_boot) INT_SINGLE_BOOT_CFG0
			set Para(x_value) [expr $Para(max_cfg1)+$Para(max_0)+$Para(max_1)+$Para(max_2)+$Para(max_3)]
			#set Para(y_value) [expr $Para(mem_size_cfg1)+$Para(mem_size)+$Para(mem_size1)+$Para(mem_size2)+$Para(mem_size3)]
		}
		
		if {$Para(boot_option) == "Internal" && $Para(boot_option_internal) == "Single Boot" && $Para(internal_ufm0) == 1} {
		
			$win.ck_ufm_cfg0 config -state disabled
			$win.ck_ufm0 config -state disabled
			set Para(ufm_cfg0) 0
			set Para(ufm0) 0
			$tnb pageconfigure 4 -state disabled
			$tnb pageconfigure 5 -state disabled
			$win.ck_ufm_cfg1 config -state normal
			$win.ck_ufm1 config -state normal
			$win.ck_ufm2 config -state normal
			$win.ck_ufm3 config -state normal
			set Para(efb_ufm_boot) INT_SINGLE_BOOT_CFG0_UFM0
			set Para(x_value) [expr $Para(max_cfg1)+$Para(max_1)+$Para(max_2)+$Para(max_3)]
			#set Para(y_value) [expr $Para(mem_size_cfg1)+$Para(mem_size1)+$Para(mem_size2)+$Para(mem_size3)]
		}
		
		if {$Para(boot_option) == "Internal" && $Para(boot_option_internal) == "Dual Boot" && $Para(internal_ufm0) == 0 && $Para(internal_ufm1) == 0} {
		
			$win.ck_ufm_cfg0 config -state disabled
			set Para(ufm_cfg0) 0
			$tnb pageconfigure 4 -state disabled
			$win.ck_ufm0 config -state normal
			$win.ck_ufm_cfg1 config -state disabled
			set Para(ufm_cfg1) 0
			$tnb pageconfigure 6 -state disabled
			$win.ck_ufm1 config -state normal
			$win.ck_ufm2 config -state normal
			$win.ck_ufm3 config -state normal
			set Para(efb_ufm_boot) INT_DUAL_BOOT_CFG0_CFG1
			set Para(x_value) [expr $Para(max_0)+$Para(max_1)+$Para(max_2)+$Para(max_3)]
			#set Para(y_value) [expr $Para(mem_size)+$Para(mem_size1)+$Para(mem_size2)+$Para(mem_size3)]
		}
		
		if {$Para(boot_option) == "Internal" && $Para(boot_option_internal) == "Dual Boot" && $Para(internal_ufm0) == 1 && $Para(internal_ufm1) == 0} {
		
			$win.ck_ufm_cfg0 config -state disabled
			$win.ck_ufm0 config -state disabled
			$win.ck_ufm_cfg1 config -state disabled
			set Para(ufm_cfg0) 0
			set Para(ufm0) 0
			set Para(ufm_cfg1) 0
			$tnb pageconfigure 4 -state disabled
			$tnb pageconfigure 5 -state disabled
			$tnb pageconfigure 6 -state disabled
			$win.ck_ufm1 config -state normal
			$win.ck_ufm2 config -state normal
			$win.ck_ufm3 config -state normal
			set Para(efb_ufm_boot) INT_DUAL_BOOT_CFG0_UFM0_CFG1
			set Para(x_value) [expr $Para(max_1)+$Para(max_2)+$Para(max_3)]
			#set Para(y_value) [expr $Para(mem_size1)+$Para(mem_size2)+$Para(mem_size3)]
		}
		
		if {$Para(boot_option) == "Internal" && $Para(boot_option_internal) == "Dual Boot" && $Para(internal_ufm0) == 0 && $Para(internal_ufm1) == 1} {
		
			$win.ck_ufm_cfg0 config -state disabled
			set Para(ufm_cfg0) 0
			$tnb pageconfigure 4 -state disabled
			$win.ck_ufm0 config -state normal
			$win.ck_ufm_cfg1 config -state disabled
			set Para(ufm_cfg1) 0
			$tnb pageconfigure 6 -state disabled
			$win.ck_ufm1 config -state disabled
			set Para(ufm1) 0
			$tnb pageconfigure 7 -state disabled
			$win.ck_ufm2 config -state normal
			$win.ck_ufm3 config -state normal
			set Para(efb_ufm_boot) INT_DUAL_BOOT_CFG0_CFG1_UFM1
			set Para(x_value) [expr $Para(max_0)+$Para(max_2)+$Para(max_3)]
			#set Para(y_value) [expr $Para(mem_size)+$Para(mem_size2)+$Para(mem_size3)]
		}
		
		if {$Para(boot_option) == "Internal" && $Para(boot_option_internal) == "Dual Boot" && $Para(internal_ufm0) == 1 && $Para(internal_ufm1) == 1} {
		
			$win.ck_ufm_cfg0 config -state disabled
			set Para(ufm_cfg0) 0
			$tnb pageconfigure 4 -state disabled
			$win.ck_ufm0 config -state disabled
			$win.ck_ufm_cfg1 config -state disabled
			$tnb pageconfigure 6 -state disabled
			set Para(ufm_cfg1) 0
			$win.ck_ufm1 config -state disabled
			set Para(ufm1) 0
			$tnb pageconfigure 7 -state disabled
			set Para(ufm0) 0
			$tnb pageconfigure 5 -state disabled
			$win.ck_ufm2 config -state normal
			$win.ck_ufm3 config -state normal
			set Para(efb_ufm_boot) INT_DUAL_BOOT_CFG0_UFM0_CFG1_UFM1
			set Para(x_value) [expr $Para(max_2)+$Para(max_3)]
			#set Para(y_value) [expr $Para(mem_size2)+$Para(mem_size3)]
		}
		
		if {$Para(boot_option) == "External"} {
			
			$win.ck_ufm_cfg0 config -state normal
			$win.ck_ufm0 config -state normal
			$win.ck_ufm_cfg1 config -state normal
			$win.ck_ufm1 config -state normal			
			$win.ck_ufm2 config -state normal
			$win.ck_ufm3 config -state normal
			set Para(efb_ufm_boot) EXTERNAL_BOOT
			set Para(x_value) [expr $Para(max_cfg0)+$Para(max_cfg1)+$Para(max_0)+$Para(max_1)+$Para(max_2)+$Para(max_3)]
			#set Para(y_value) [expr $Para(mem_size_cfg0)+$Para(mem_size_cfg1)+$Para(mem_size)+$Para(mem_size1)+$Para(mem_size2)+$Para(mem_size3)]
		}
	}
	set y_value 0
    if {$Para(ufm_cfg0) == 1 && [string length $Para(mem_size_cfg0)] >0 && $Para(mem_size_cfg0) != "-"} {

		set y_value [expr $y_value+$Para(mem_size_cfg0)]
    }
	if {$Para(ufm0) == 1 && [string length $Para(mem_size0)] >0 && $Para(mem_size0) != "-"} {

		set y_value [expr $y_value+$Para(mem_size0)]
    }
	if {$Para(ufm_cfg1) == 1 && [string length $Para(mem_size_cfg1)] >0 && $Para(mem_size_cfg1) != "-"} {

		set y_value [expr $y_value+$Para(mem_size_cfg1)]
    }
	if {$Para(ufm1) == 1 && [string length $Para(mem_size1)] >0 && $Para(mem_size1) != "-"} {

		set y_value [expr $y_value+$Para(mem_size1)]
    }
	if {$Para(ufm2) == 1 && [string length $Para(mem_size2)] >0 && $Para(mem_size2) != "-" } {

		set y_value [expr $y_value+$Para(mem_size2)]
    }
	if {$Para(ufm3) == 1 &&  [string length $Para(mem_size3)] >0 && $Para(mem_size3) != "-"} {
	
		set y_value [expr $y_value+$Para(mem_size3)]
    }
	
	set x_display_value [expr $Para(x_value)*16]
	set y_display_value [expr $y_value*16]
	
	
	$win.lblufm_option config -text  "Total available UFM: $Para(x_value) pages($x_display_value bytes) and UFM used in EFB: $y_value Pages($y_display_value bytes)"
	
	
	if {$Para(tamperdr) == 1} {
		$tnb pageconfigure 10 -state normal

	} else {
		$tnb pageconfigure 10 -state disabled
	}
}
	
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

	#.rdo1spi_mode config -state disabled
	pack forget .rdo1spi_mode
	
	#tk_messageBox -default ok -icon warning -message "Para(new)=$Para(new)" -title "LoadParaCB" -type ok
	if {$Para(new) == 0} {
		if {$Para(spi_mode) == "Master"} {
			set Para(spi_mode) Both
			set msg "The SPI_MODE attribute MASTER is not supported in this version of Diamond. The attribute value has been changed to BOTH.  To use the SPI port in the Master mode the Wishbone master must change the port operation using the state control register: SPICR2\[7\]"
			tk_messageBox -default ok -icon warning -message $msg -title "Regenerate" -type ok
		}
	} else {
		set Para(spi_mode) Slave
	}
	ChangeValueCmd
}

proc DRCSlaveAddr {addr i2c} {
	global Para
	if {$addr == "0000000" ||
		$addr == "0000001" ||
		$addr == "0000010" ||
		$addr == "0000011" ||
		[string range $addr 0 4] == "00001" ||
		[string range $addr 0 4] == "11111" ||
		[string range $addr 0 4] == "11110"} {
		set tit "Check Parameter"
		if {$i2c == "Primary"} {
			set msg "The slave address $Para(i2c1_sa)01 of I2C $i2c is reserved by I2C spec."
		} else {
			set msg "The slave address $Para(i2c2_sa)10 of I2C $i2c is reserved by I2C spec."
		}
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}
	return 0
}

proc CheckSlaveAddr {addr i2c} {
	global Para
	
	if {[string length $addr] == "11"} {
		if {[string index $addr 0] == "0"} {
			set str [string range $addr 3 end]
			return [DRCSlaveAddr $str $i2c]
		} else {
			set str [string range $addr 3 end-2]
			if {$str == "11110"} {
				set tit "Check Parameter"
				if {$i2c == "Primary"} {
					set msg "The slave address $Para(i2c1_sa)01 of I2C $i2c is reserved by I2C spec."
				} else {
					set msg "The slave address $Para(i2c2_sa)10 of I2C $i2c is reserved by I2C spec."
				}
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
	}
	
	if {[string length $addr] == "7"} {
		return [DRCSlaveAddr $addr $i2c]
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
	
	set tit "Check Parameter"
	set ret [IsInRange "WISHBONE Clock Frequency" 0 133 $Para(wb_clk_freq)]
	if {$ret == "-1"} {return -1}
	if {$Para(wb_clk_freq) <= 0} {
		set msg "WISHBONE Clock Frequency is illegal."
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}
	#! I2C DRC.
	if {$Para(i2c1) == 1 && $Para(i2c1config) == 1} {
		set msg "The user can only select the combinations of I2C\n1) Primary Configuration\n2) Primary User\n3) Secondary user\n4) Primary Configuration, Secondary user\n5) Primary User, Secondary user"
		tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
		return -1
	}
	
	if {$Para(i2c1) == 1 || $Para(i2c1config) == 1} {
		if {$Para(i2c1_addr) == "7-Bit Addressing"} {
			if {[string length $Para(i2c1_sa)] != 5} {
				set msg "The slave address of I2C Primary is illegal."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		} else {
			if {[string length $Para(i2c1_sa)] != 8} {
				set msg "The slave address of I2C Primary is illegal."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
		set ret [CheckSlaveAddr $Para(i2c1_sa)01 "Primary"]
		if {$ret == "-1"} {return -1}
	}

	if {$Para(i2c2) == 1} {
		if {$Para(i2c2_addr) == "7-Bit Addressing"} {
			if {[string length $Para(i2c2_sa)] != 5} {
				set msg "The slave address of I2C Secondary is illegal."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		} else {
			if {[string length $Para(i2c2_sa)] != 8} {
				set msg "The slave address of I2C Secondary is illegal."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
		set ret [CheckSlaveAddr $Para(i2c2_sa)10 "Secondary"]
		if {$ret == "-1"} {return -1}
	}
	
	#! SPI DRC.
	if {$Para(spi) == 1} {
		#CR_57800
		if {$Para(spi_mode) == "Both"} {
			set max [format "%.4f" [expr $Para(wb_clk_freq)/3.00]]
			set ret [IsInRange "Master Clock Rate of SPI" 1 $max $Para(spi_freq)]
			if {$ret == "-1"} {return -1}
		}
	}
	
	#! TC DRC.
	if {$Para(tc) == 1} {
		if {$Para(static_tc) == "Static" && $Para(tc_mode) == "WATCHDOG"} {
			set msg "Watchdog Mode is not a valid mode without the Wishbone bus."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		set ret [IsInRange "Timer/Counter Top value" 0 65535 $Para(tc_top)]
		if {$ret == "-1"} {return -1}
		set ret [IsInRange "Output Compare value" 0 65535 $Para(tc_ocr)]
		if {$ret == "-1"} {return -1}
		
		if {[.entrytc_top cget -state] == "normal" && [.entrytc_ocr cget -state] == "normal"} {
			if {$Para(tc_ocr) >= $Para(tc_top)} {
				set msg "Top output compare value must be set less than the top counter value."
				tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
				return -1
			}
		}
	}
	if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	} else {
	#! UFM DRC.
	if {$Para(ufm) == 1} {
		if {$Para(mem_size) <= 0} {
			set msg "Please Enter Number of Pages."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm_ebr) < 0} {
			set msg "Initialization Data Starts at Page should >= 0."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm_init) != "0"} {
			if [string length $Para(memfile)] {
				if {[file exists $Para(memfile)] == "0"} {
					set msg "Memory file $Para(memfile) doesn't exist!"
					#CR_51945
#					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
#					return -1
				}
			}
		}
	}
	}
     if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	 	#! UFM0 DRC.
	if {$Para(ufm0) == 1} {
		if {$Para(mem_size0) <= 0} {
			set msg "Please Enter Number of Pages."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm0_ebr) < 0} {
			set msg "Initialization Data Starts at Page should >= 0."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm0_init) != "0"} {
			if [string length $Para(memfile0)] {
				if {[file exists $Para(memfile0)] == "0"} {
					set msg "Memory file $Para(memfile0) doesn't exist!"
					#CR_51945
#					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
#					return -1
				}
			}
		}
	}
	
	#! UFM1 DRC.
	if {$Para(ufm1) == 1} {
		if {$Para(mem_size1) <= 0} {
			set msg "Please Enter Number of Pages."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm1_ebr) < 0} {
			set msg "Initialization Data Starts at Page should >= 0."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm1_init) != "0"} {
			if [string length $Para(memfile1)] {
				if {[file exists $Para(memfile1)] == "0"} {
					set msg "Memory file $Para(memfile1) doesn't exist!"
					#CR_51945
#					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
#					return -1
				}
			}
		}
	}
	
	#! UFM2 DRC.
	if {$Para(ufm2) == 1} {
		if {$Para(mem_size2) <= 0} {
			set msg "Please Enter Number of Pages."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm2_ebr) < 0} {
			set msg "Initialization Data Starts at Page should >= 0."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm2_init) != "0"} {
			if [string length $Para(memfile2)] {
				if {[file exists $Para(memfile2)] == "0"} {
					set msg "Memory file $Para(memfile2) doesn't exist!"
					#CR_51945
#					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
#					return -1
				}
			}
		}
	}

	#! UFM3 DRC.
	if {$Para(ufm3) == 1} {
		if {$Para(mem_size3) <= 0} {
			set msg "Please Enter Number of Pages."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm3_ebr) < 0} {
			set msg "Initialization Data Starts at Page should >= 0."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm3_init) != "0"} {
			if [string length $Para(memfile3)] {
				if {[file exists $Para(memfile3)] == "0"} {
					set msg "Memory file $Para(memfile3) doesn't exist!"
					#CR_51945
#					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
#					return -1
				}
			}
		}
	}
	
	#! UFM_CFG0 DRC.
	if {$Para(ufm_cfg0) == 1} {
		if {$Para(mem_size_cfg0) <= 0} {
			set msg "Please Enter Number of Pages."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm_cfg0_ebr) < 0} {
			set msg "Initialization Data Starts at Page should >= 0."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm_cfg0_init) != "0"} {
			if [string length $Para(memfile_cfg0)] {
				if {[file exists $Para(memfile_cfg0)] == "0"} {
					set msg "Memory file $Para(memfile_cfg0) doesn't exist!"
					#CR_51945
#					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
#					return -1
				}
			}
		}
	}
	
	#! UFM_CFG1 DRC.
	if {$Para(ufm_cfg1) == 1} {
		if {$Para(mem_size_cfg1) <= 0} {
			set msg "Please Enter Number of Pages."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm_cfg1_ebr) < 0} {
			set msg "Initialization Data Starts at Page should >= 0."
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
		if {$Para(ufm_cfg1_init) != "0"} {
			if [string length $Para(memfile_cfg1)] {
				if {[file exists $Para(memfile_cfg1)] == "0"} {
					set msg "Memory file $Para(memfile_cfg1) doesn't exist!"
					#CR_51945
#					tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
#					return -1
				}
			}
		}
	}
      }
	
	return 0
}

# Command Line for xo2 device
proc XO2CmdLine {}  {
	global Para

	set str [list -type efb -arch $Para(arch) -freq $Para(wb_clk_freq) ]
	
	#! I2C cmd-line.
	#When Configuration I2C is enabled in the GUI, please pass the following 3 option to scuba:
	#-i2c1config -i2c1_sa <address> -i2c1_addr <no_of_bits>
	if {$Para(i2c1config) == 1} {		
		#lappend str -i2c1config -i2c1_sa $Para(i2c1_sa)01
		lappend str -i2c1config -i2c1_freq $Para(i2c1_freq) -i2c1_sa $Para(i2c1_sa)01
		if {$Para(i2c1_addr) == "7-Bit Addressing"} {
			lappend str -i2c1_addr 7
		} else {
			lappend str -i2c1_addr 10
		}
	}
	
	if {$Para(i2c1) == 1} {		
		lappend str -i2c1 -i2c1_freq $Para(i2c1_freq) -i2c1_sa $Para(i2c1_sa)01
		if {$Para(i2c1_ce) == 1} {
			lappend str -i2c1_ce
		} 
		if {$Para(i2c1_we) == 1} {
			lappend str -i2c1_we
		}
		if {$Para(i2c1_addr) == "7-Bit Addressing"} {
			lappend str -i2c1_addr 7
		} else {
			lappend str -i2c1_addr 10
		}
	}
	
	if {$Para(i2c2) == 1} {
		lappend str -i2c2 -i2c2_freq $Para(i2c2_freq) -i2c2_sa $Para(i2c2_sa)10
		if {$Para(i2c2_ce) == 1} {
			lappend str -i2c2_ce
		} 
		if {$Para(i2c2_we) == 1} {
			lappend str -i2c2_we
		}
		if {$Para(i2c2_addr) == "7-Bit Addressing"} {
			lappend str -i2c2_addr 7
		} else {
			lappend str -i2c2_addr 10
		}
	}

	#! SPI cmd-line.
	if {$Para(spi) == 1} {
		lappend str -spi 

		lappend str -spi_mode $Para(spi_mode)

		if {$Para(spi_lsb) == 1} {lappend str -spi_lsb}
		if {$Para(spi_clkinv) == 1} {lappend str -spi_clkinv}
		if {$Para(spi_ph) == 1} {lappend str -spi_ph}
		if {$Para(spi_rxo) == 1} {lappend str -spi_rxo}
		if {$Para(spi_rxr) == 1} {lappend str -spi_rxr}
		if {$Para(spi_txo) == 1} {lappend str -spi_txo}
		if {$Para(spi_txr) == 1} {lappend str -spi_txr}
		if {$Para(spi_en) == 1} {lappend str -spi_en}
		if {$Para(spi_we) == 1} {lappend str -spi_we}
		if {$Para(spi_hs) == 1} {lappend str -spi_shm}
		if {$Para(spi_mode) == "Master" || $Para(spi_mode) == "Both"} {
			lappend str -spi_freq $Para(spi_freq) -spi_cs $Para(spi_cs)
		}
	}
	
	#! TC cmd-line
	if {$Para(tc) == 1} {
		if {$Para(static_tc) == "Static"} {lappend str -static_tc}
		lappend str -tc -tc_mode $Para(tc_mode) -tc_o $Para(tc_o) -tc_div $Para(tc_div) -tc_top $Para(tc_top) -tc_ocr $Para(tc_ocr)
		#lappend str -tc_clkinv
		if {$Para(tc_clkinv) == "Negative"} {lappend str -tc_clkinv}
		if {$Para(tc_sa_oflow) == 1} {lappend str -tc_sa_oflow}
		if {$Para(tc_opcomp) == 1} {lappend str -tc_opcomp}
		if {$Para(tc_ipcap) == 1} {lappend str -tc_ipcap}
		if {$Para(tc_oflow) == 1} {lappend str -tc_oflow}
		if {$Para(tc_osc) == 1} {lappend str -tc_osc}
		if {$Para(tc_ctr) == 1} {lappend str -tc_ctr}
	}
	
	#! PLL cmd-line
	if {$Para(pll) == 1} {
		#CR_50650
		if {$Para(pll_cnt) == 1} {
			lappend str -pll1
		} else {
			lappend str -pll1 -pll2
		}
	}
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {	
} else {	
	#! UFM cmd-line
	if {$Para(ufm) == 1} {
		lappend str -ufm
		lappend str -ufm_ebr $Para(ufm_ebr) -mem_size $Para(mem_size)
		if {$Para(ufm_init) == 0} {
			lappend str -ufm_0
		} else {
			if {[string length $Para(memfile)] > 0} {
				lappend str -memfile $Para(memfile) -memformat $Para(ufm_dt)
			}
		}
	}
}
	
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {	
	#! UFM0 cmd-line
	if {$Para(ufm0) == 1} {
		lappend str -ufm0
		lappend str -ufm0_ebr $Para(ufm0_ebr) -mem_size0 $Para(mem_size0)
		if {$Para(ufm0_init) == 0} {
			lappend str -ufm0_0
		} else {
			if {[string length $Para(memfile0)] > 0} {
				lappend str -memfile0 $Para(memfile0) -memformat0 $Para(ufm0_dt)
			}
		}
	}
	
	#! UFM1 cmd-line
	if {$Para(ufm1) == 1} {
		lappend str -ufm1
		lappend str -ufm1_ebr $Para(ufm1_ebr) -mem_size1 $Para(mem_size1)
		if {$Para(ufm1_init) == 0} {
			lappend str -ufm1_0
		} else {
			if {[string length $Para(memfile1)] > 0} {
				lappend str -memfile1 $Para(memfile1) -memformat1 $Para(ufm1_dt)
			}
		}
	}
	
	#! UFM2 cmd-line
	if {$Para(ufm2) == 1} {
		lappend str -ufm2
		lappend str -ufm2_ebr $Para(ufm2_ebr) -mem_size2 $Para(mem_size2)
		if {$Para(ufm2_init) == 0} {
			lappend str -ufm2_0
		} else {
			if {[string length $Para(memfile2)] > 0} {
				lappend str -memfile2 $Para(memfile2) -memformat2 $Para(ufm2_dt)
			}
		}
	}
	
	#! UFM3 cmd-line
	if {$Para(ufm3) == 1} {
		lappend str -ufm3
		lappend str -ufm3_ebr $Para(ufm3_ebr) -mem_size3 $Para(mem_size3)
		if {$Para(ufm3_init) == 0} {
			lappend str -ufm3_0
		} else {
			if {[string length $Para(memfile3)] > 0} {
				lappend str -memfile3 $Para(memfile3) -memformat3 $Para(ufm3_dt)
			}
		}
	}
	
	#! UFM_cfg0 cmd-line
	if {$Para(ufm_cfg0) == 1} {
		lappend str -ufm_cfg0
		lappend str -ufm_cfg0_ebr $Para(ufm_cfg0_ebr) -mem_size_cfg0 $Para(mem_size_cfg0)
		if {$Para(ufm_cfg0_init) == 0} {
			lappend str -ufm_cfg0_0
		} else {
			if {[string length $Para(memfile_cfg0)] > 0} {
				lappend str -memfile_cfg0 $Para(memfile_cfg0) -memformat_cfg0 $Para(ufm_cfg0_dt)
			}
		}
	}
	
	#! UFM_cfg1 cmd-line
	if {$Para(ufm_cfg1) == 1} {
		lappend str -ufm_cfg1
		lappend str -ufm_cfg1_ebr $Para(ufm_cfg1_ebr) -mem_size_cfg1 $Para(mem_size_cfg1)
		if {$Para(ufm_cfg1_init) == 0} {
			lappend str -ufm_cfg1_0
		} else {
			if {[string length $Para(memfile_cfg1)] > 0} {
				lappend str -memfile_cfg1 $Para(memfile_cfg1) -memformat_cfg1 $Para(ufm_cfg1_dt)
			}
		}
	}
}
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	if {$Para(efb_ufm_boot) != ""} {lappend str -efb_ufm_boot $Para(efb_ufm_boot)}
}	
	
	#! WISHBONE enable cmd-line
	if {$Para(wb) == 1} {lappend str -wb}
	
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	if {$Para(tamperdr) == 1} {lappend str -tamperdr}
	if {$Para(t_pwd) == 1} {lappend str -t_pwd}
	if {$Para(t_lockflash) == 1} {lappend str -t_lockflash}
	if {$Para(t_manmode) == 1} {lappend str -t_manmode}
	if {$Para(t_jtagport) == 1} {lappend str -t_jtagport}
	if {$Para(t_sspiport) == 1} {lappend str -t_sspiport}
	if {$Para(t_sic2port) == 1} {lappend str -t_sic2port}
	if {$Para(t_wbport) == 1} {lappend str -t_wbport}
	if {$Para(t_portlock) == 1} {lappend str -t_portlock}
}	
	
	
	

	set density [GetDeviceDensity]
	lappend str -dev $density
	
	#CR_53083
	if {[string first "U" $Para(PartType)] !=-1} {lappend str -u}

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
	
	set str [XO2CmdLine ]

#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit

	return $str
}

proc Create_Image {} {
	global Para tcl_platform pin_flag mem_types

	package require OrcaModule

	ProjectSet
	MainInterface
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	switch $tcl_platform(platform) {
		windows {AttributeSetting 750 750}
		unix    {AttributeSetting 780 810}
	}
} else {

	switch $tcl_platform(platform) {
		windows {AttributeSetting 580 480}
		unix    {AttributeSetting 630 540}
	}

}

	set pin_flag 1
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
	DrawImage 260 380 
} else {
	DrawImage 230 380 
}
	
	set tnb $Para(tnb)

	wm title . "Lattice Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	set page [$tnb add -label "EFB Enables"]
	
	


if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
		
	set density [GetDeviceDensity]
	set Para(efb_max_0) 3582
	set Para(efb_max_1) 3582
	set Para(efb_max_2) 1150
	set Para(efb_max_3) 191
	set Para(efb_max_cfg0) 12541
	set Para(efb_max_cfg1) 12541

	if {$density == 2100 || $density == 4300} {
		set Para(efb_max_0) 767
		set Para(efb_max_1) 767
		set Para(efb_max_2) 1150
		set Para(efb_max_3) 191
		set Para(efb_max_cfg0) 5758
		set Para(efb_max_cfg1) 5758
	}			

	iwidgets::labeledframe .setframe -labeltext "EFB Function Enables" -labelpos nw
	set setframe [.setframe childsite]
	
	iwidgets::scrolledframe .sfSMI -width 15i -height 6.8i -relief sunken -borderwidth 0 -vscrollmode dynamic -hscrollmode none 
	pack .sfSMI -in $setframe -side top -anchor w -padx 30
	set win [.sfSMI childsite]
	
	

	label $win.lblLabel00 -text "I2C"
	pack $win.lblLabel00 -in $win -anchor w -padx 30
	
	checkbutton $win.ck_i2c1config -text "Primary Configuration" -variable Para(i2c1config) -command ChangeValueCmd
	pack $win.ck_i2c1config -in $win -anchor w -padx 50

	checkbutton $win.ck_i2c1 -text "Primary User" -variable Para(i2c1) -command ChangeValueCmd
	pack $win.ck_i2c1 -in $win -anchor w -padx 50  -pady 2

	checkbutton $win.ck_i2c2 -text "Secondary User" -variable Para(i2c2) -command ChangeValueCmd
	pack $win.ck_i2c2 -in $win -anchor w -padx 50

	checkbutton $win.ck_spi -text "SPI" -variable Para(spi) -command ChangeValueCmd
	pack $win.ck_spi -in $win -anchor w -padx 30  -pady 2

	checkbutton $win.ck_tc -text "Timer/Counter" -variable Para(tc) -command ChangeValueCmd
	pack $win.ck_tc -in $win -anchor w -padx 30
	iwidgets::labeledframe $win.csTimer -labeltext "Timer/Counter Use" -labelpos nw
	set csTimer [$win.csTimer childsite]
	radiobutton $win.rdo1tc -width 50 -text "Static settings only (no WISHBONE access)." -value Static  -variable Para(static_tc) -anchor w -command {ChangeValueCmd}
	radiobutton $win.rdo2tc -width 50 -text "Dynamic register changes via WISHBONE."     -value Dynamic -variable Para(static_tc) -anchor w -command {ChangeValueCmd}
	pack $win.rdo1tc $win.rdo2tc -in $csTimer -side top -anchor w -pady 2
	pack $win.csTimer -in $win -anchor w -padx 40	-fill x

	checkbutton $win.ck_pll -text "PLL (Dynamic access)" -variable Para(pll) -command ChangeValueCmd
	pack $win.ck_pll -in $win -anchor w -padx 30
	iwidgets::labeledframe $win.csPll -labeltext "PLL Options" -labelpos nw
	set csPll [$win.csPll childsite]
	iwidgets::combobox $win.cbopll_cnt -labeltext "Number of PLL's of dynamic access:" -width 3 -editable false -textvariable Para(pll_cnt) -selectioncommand {ChangeValueCmd}
	$win.cbopll_cnt insert list end 1 2
	pack $win.cbopll_cnt -in $csPll -side top -anchor w
	label $win.lblpll_cnt -text "(See IPExpress PLL module to set PLL initial settings)."
	pack $win.lblpll_cnt -in $csPll -side top -anchor w
	pack $win.csPll -in $win -anchor w -padx 40 -fill x
	
	

	checkbutton $win.ck_efb_ufm -text "User Flash Memory" -variable Para(efb_ufm) -command ChangeValueCmd
	pack $win.ck_efb_ufm -in $win -anchor w -padx 30
	
	iwidgets::labeledframe $win.cs_efb_ufm  -labeltext "User Flash Memory Options" -labelpos nw
	set cs_efb_ufm [$win.cs_efb_ufm childsite]
	
	#iwidgets::scrolledframe .sfSMI -width 15i -height 2.1i -relief sunken -borderwidth 0 -vscrollmode dynamic -hscrollmode none 
	#pack .sfSMI -in $cs_efb_ufm -side top -anchor w -padx 30
	#set win [.sfSMI childsite]
	
	radiobutton $win.rdo1boot_option -width 10 -text "Internal Boot" -value Internal  -variable Para(boot_option) -anchor w -command {ChangeValueCmd}
	
    iwidgets::combobox $win.cboboot_option_internal -labeltext "" -width 10 -editable false -textvariable Para(boot_option_internal) -selectioncommand {ChangeValueCmd}
	$win.cboboot_option_internal insert list end "Single Boot" "Dual Boot"	
	
	label $win.lblimag0 -text "Image-0: CFG0&"
	checkbutton $win.ck_internal_ufm0 -text "UFM(UFM0)" -variable Para(internal_ufm0) -command ChangeValueCmd
	label $win.lblimag1 -text "Image-1: CFG1&"
	checkbutton $win.ck_internal_ufm1 -text "UFM(UFM1)" -variable Para(internal_ufm1) -command ChangeValueCmd

	radiobutton $win.rdo2boot_option -width 10 -text "External Boot" -value External -variable Para(boot_option) -anchor w -command {ChangeValueCmd}

	#checkbutton $win.ck_ufm_cfg0 -text "User Flash Memory(CFG0) located at FLASH-A and total number of pages: 12542" -variable Para(ufm_cfg0) -command ChangeValueCmd
	checkbutton $win.ck_ufm_cfg0 -text "User Flash Memory(CFG0) located at FLASH-A and total number of pages: $Para(efb_max_cfg0)" -variable Para(ufm_cfg0) -command ChangeValueCmd
	#checkbutton $win.ck_ufm0 -text "User Flash Memory(UFM0) located at FLASH-A and total number of pages: 3582" -variable Para(ufm0) -command ChangeValueCmd
	checkbutton $win.ck_ufm0 -text "User Flash Memory(UFM0) located at FLASH-A and total number of pages: $Para(efb_max_0)" -variable Para(ufm0) -command ChangeValueCmd
	#checkbutton $win.ck_ufm_cfg1 -text "User Flash Memory(CFG1) located at FLASH-B and total number of pages: 12542" -variable Para(ufm_cfg1) -command ChangeValueCmd
	checkbutton $win.ck_ufm_cfg1 -text "User Flash Memory(CFG1) located at FLASH-B and total number of pages: $Para(efb_max_cfg1)" -variable Para(ufm_cfg1) -command ChangeValueCmd
	#checkbutton $win.ck_ufm1 -text "User Flash Memory(UFM1) located at FLASH-B and total number of pages: 3582" -variable Para(ufm1) -command ChangeValueCmd
	checkbutton $win.ck_ufm1 -text "User Flash Memory(UFM1) located at FLASH-B and total number of pages: $Para(efb_max_1)" -variable Para(ufm1) -command ChangeValueCmd
	#checkbutton $win.ck_ufm2 -text "User Flash Memory(UFM2) located at FLASH-C and total number of pages: 1151" -variable Para(ufm2) -command ChangeValueCmd
	checkbutton $win.ck_ufm2 -text "User Flash Memory(UFM2) located at FLASH-C and total number of pages:  $Para(efb_max_2)" -variable Para(ufm2) -command ChangeValueCmd
	#checkbutton $win.ck_ufm3 -text "User Flash Memory(UFM3) located at FLASH-C and total number of pages: 191" -variable Para(ufm3) -command ChangeValueCmd
	checkbutton $win.ck_ufm3 -text "User Flash Memory(UFM3) located at FLASH-C and total number of pages: $Para(efb_max_3)" -variable Para(ufm3) -command ChangeValueCmd
	
	label $win.lblufm_option -text "Total available UFM: X pages(X*16 bytes) and UFM used in EFB: Y Pages(Y*16 bytes)"
	
    grid $win.rdo1boot_option $win.cboboot_option_internal $win.lblimag0 $win.ck_internal_ufm0 $win.lblimag1  $win.ck_internal_ufm1 -in $cs_efb_ufm -padx 2 -sticky w 
	grid $win.rdo2boot_option  -in $cs_efb_ufm
	grid  $win.lblufm_option -columnspan 6 -in $cs_efb_ufm -padx 2 -sticky w 
	grid  $win.ck_ufm_cfg0 -columnspan 6 -in $cs_efb_ufm -padx 2 -sticky w 
	grid  $win.ck_ufm0 -columnspan 6 -in $cs_efb_ufm -padx 2 -sticky w 
	grid  $win.ck_ufm_cfg1 -columnspan 6  -in $cs_efb_ufm -padx 2 -sticky w 
	grid  $win.ck_ufm1 -columnspan 6 -in $cs_efb_ufm -padx 2 -sticky w 
	grid  $win.ck_ufm2 -columnspan 6  -in $cs_efb_ufm -padx 2 -sticky w 
	grid  $win.ck_ufm3 -columnspan 6  -in $cs_efb_ufm -padx 2 -sticky w 
	
	pack $win.cs_efb_ufm -in $win -anchor w -padx 40 -fill x
	
	#pack .cs_efb_ufm -in $setframe -anchor w -padx 40 -fill x
	
	#pack .ck_ufm0 .ck_ufm_cfg0 .ck_ufm1 .ck_ufm_cfg1 .ck_ufm2 .ck_ufm3 -in $setframe -anchor w -padx 30	
	
	 # checkbutton $win.ck_ufm -text "User Flash Memory" -variable Para(ufm) -command ChangeValueCmd
	 #	pack $win.ck_ufm -in $win -anchor w -padx 30
		
		checkbutton $win.ck_wb -text "WISHBONE" -variable Para(wb) -command ChangeValueCmd
	pack $win.ck_wb -in $win -anchor w -padx 30
	
	
	iwidgets::labeledframe $win.cswb -labeltext "WISHBONE Clock" -labelpos nw
	set cswb [$win.cswb childsite]	
	
	
	iwidgets::entryfield $win.frmwb_clk_freq -labeltext "WISHBONE Clock Frequency:" -textvariable Para(wb_clk_freq) -width 10 -validate real
	$win.frmwb_clk_freq.label config -width 30 -anchor w
	label $win.lblclk_freq -text "MHz"
	
	 grid $win.frmwb_clk_freq   $win.lblclk_freq  -in $cswb -padx 2 -sticky w 
	#pack $win.frmwb_clk_freq  $win.lblclk_freq -in $cswb -padx 2 -sticky w 
	 $win.frmwb_clk_freq.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}

	pack $win.cswb -in $win  -anchor w -padx 40 -fill x
	
	checkbutton $win.ck_tdr -text "Tamper Detection/Response" -variable Para(tamperdr) -command ChangeValueCmd
	pack $win.ck_tdr -in $win -anchor w -padx 30
	
	pack .setframe -in $page -fill x
	
	
} else {


iwidgets::labeledframe .setframe -labeltext "EFB Function Enables" -labelpos nw
	set setframe [.setframe childsite]
	
	label .lblLabel00 -text "I2C"
	pack .lblLabel00 -in $setframe -anchor w -padx 30
	
	checkbutton .ck_i2c1config -text "Primary Configuration" -variable Para(i2c1config) -command ChangeValueCmd
	pack .ck_i2c1config -in $setframe -anchor w -padx 50

	checkbutton .ck_i2c1 -text "Primary User" -variable Para(i2c1) -command ChangeValueCmd
	pack .ck_i2c1 -in $setframe -anchor w -padx 50  -pady 2

	checkbutton .ck_i2c2 -text "Secondary User" -variable Para(i2c2) -command ChangeValueCmd
	pack .ck_i2c2 -in $setframe -anchor w -padx 50

	checkbutton .ck_spi -text "SPI" -variable Para(spi) -command ChangeValueCmd
	pack .ck_spi -in $setframe -anchor w -padx 30  -pady 2

	checkbutton .ck_tc -text "Timer/Counter" -variable Para(tc) -command ChangeValueCmd
	pack .ck_tc -in $setframe -anchor w -padx 30
	iwidgets::labeledframe .csTimer -labeltext "Timer/Counter Use" -labelpos nw
	set csTimer [.csTimer childsite]
	radiobutton .rdo1tc -width 50 -text "Static settings only (no WISHBONE access)." -value Static  -variable Para(static_tc) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2tc -width 50 -text "Dynamic register changes via WISHBONE."     -value Dynamic -variable Para(static_tc) -anchor w -command {ChangeValueCmd}
	pack .rdo1tc .rdo2tc -in $csTimer -side top -anchor w -pady 2
	pack .csTimer -in $setframe -anchor w -padx 40	-fill x

	checkbutton .ck_pll -text "PLL (Dynamic access)" -variable Para(pll) -command ChangeValueCmd
	pack .ck_pll -in $setframe -anchor w -padx 30
	iwidgets::labeledframe .csPll -labeltext "PLL Options" -labelpos nw
	set csPll [.csPll childsite]
	iwidgets::combobox .cbopll_cnt -labeltext "Number of PLL's of dynamic access:" -width 3 -editable false -textvariable Para(pll_cnt) -selectioncommand {ChangeValueCmd}
	.cbopll_cnt insert list end 1 2
	pack .cbopll_cnt -in $csPll -side top -anchor w
	label .lblpll_cnt -text "(See IPExpress PLL module to set PLL initial settings)."
	pack .lblpll_cnt -in $csPll -side top -anchor w
	pack .csPll -in $setframe -anchor w -padx 40 -fill x
	
	
        checkbutton .ck_ufm -text "User Flash Memory" -variable Para(ufm) -command ChangeValueCmd
		pack .ck_ufm -in $setframe -anchor w -padx 30
		
		checkbutton .ck_wb -text "WISHBONE" -variable Para(wb) -command ChangeValueCmd
	pack .ck_wb -in $setframe -anchor w -padx 30
	
	
	iwidgets::labeledframe .cswb -labeltext "WISHBONE Clock" -labelpos nw
	set cswb [.cswb childsite]
	CreateLabelEntry $cswb wb_clk_freq "WISHBONE Clock Frequency:" "MHz" 10 e left Para(wb_clk_freq) real
	pack .frmwb_clk_freq -in $cswb -side top -anchor w -padx 35 -pady 4
#	pack .cswb -in $setframe -anchor w -padx 25 -fill x
	.entrywb_clk_freq.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}

	pack .setframe .cswb -in $page -fill x

}	
	
	
	
	

	#"I2C"
	set page2 [$tnb add -label "I2C"]
	iwidgets::labeledframe .csI2C
	set csI2C [.csI2C childsite]

	catch {image delete i2c_gif}
	set gif_file [file join $Para(ipdir) machxo2 gui "i2c.gif"]
	image create photo i2c_gif -file $gif_file
	label .lblI2CImage -image i2c_gif
	
	#Primary I2C
	iwidgets::labeledframe .csI2C1 -labeltext "Primary I2C" -labelpos nw
	set csI2C1 [.csI2C1 childsite]
	checkbutton .ck1I2C1 -text "General Call Enable" -variable Para(i2c1_ce) -anchor w -command {ChangeValueCmd}
	checkbutton .ck2I2C1 -text "Wakeup Enable"       -variable Para(i2c1_we) -anchor w -command {ChangeValueCmd}
	iwidgets::labeledframe .csi2c1_freq -labeltext "I2C Bus Performance" -labelpos nw
	set csi2c1_freq [.csi2c1_freq childsite]
	iwidgets::combobox .cboi2c1_freq -labeltext "KHz" -labelpos e -width 8 -editable false -textvariable Para(i2c1_freq) -selectioncommand {ChangeValueCmd}
	.cboi2c1_freq insert list end 50 100 400
	pack .cboi2c1_freq -in $csi2c1_freq -side top -anchor w -padx 10
	iwidgets::labeledframe .csi2c1_prescale -labeltext "Clock Prescale Value" -labelpos nw
	set csi2c1_prescale [.csi2c1_prescale childsite]
	iwidgets::entryfield .entryi2c1_prescale -textvariable Para(i2c1_prescale) -state disabled -width 10
	pack .entryi2c1_prescale -in $csi2c1_prescale -side top -anchor w -padx 10
	iwidgets::labeledframe .csi2c1_addr -labeltext "I2C Addressing" -labelpos nw
	set csi2c1_addr [.csi2c1_addr childsite]
	iwidgets::combobox .cboi2c1_addr -textvariable Para(i2c1_addr) -selectioncommand {ChangeI2CBitCmd1;ChangeValueCmd} -editable false -width 16
	.cboi2c1_addr insert list end "7-Bit Addressing" "10-Bit Addressing"
	pack .cboi2c1_addr -in $csi2c1_addr -side top -anchor w -padx 10
	iwidgets::labeledframe .csi2c1_sa -labeltext "Slave Address" -labelpos nw
	set csi2c1_sa [.csi2c1_sa childsite]
	iwidgets::entryfield .entryi2c1_sa -labeltext "01" -labelpos e -textvariable Para(i2c1_sa) -width 10 -fixed 5 -validate {bin %c}
	pack .entryi2c1_sa -in $csi2c1_sa -side top -anchor w -padx 10
	pack .ck1I2C1 .ck2I2C1 .csi2c1_freq .csi2c1_prescale .csi2c1_addr .csi2c1_sa -in $csI2C1 -side top -anchor w -fill x
	#Secondary I2C
	iwidgets::labeledframe .csI2C2 -labeltext "Secondary I2C" -labelpos nw
	set csI2C2 [.csI2C2 childsite]
	checkbutton .ck1I2C2 -text "General Call Enable" -variable Para(i2c2_ce) -anchor w -command {ChangeValueCmd}
	checkbutton .ck2I2C2 -text "Wakeup Enable"       -variable Para(i2c2_we) -anchor w -command {ChangeValueCmd}
	iwidgets::labeledframe .csi2c2_freq -labeltext "I2C Bus Performance" -labelpos nw
	set csi2c2_freq [.csi2c2_freq childsite]
	iwidgets::combobox .cboi2c2_freq -labeltext "KHz" -labelpos e -width 8 -editable false -textvariable Para(i2c2_freq) -selectioncommand {ChangeValueCmd}
	.cboi2c2_freq insert list end 50 100 400
	pack .cboi2c2_freq -in $csi2c2_freq -side top -anchor w -padx 10
	iwidgets::labeledframe .csi2c2_prescale -labeltext "Clock Prescale Value" -labelpos nw
	set csi2c2_prescale [.csi2c2_prescale childsite]
	iwidgets::entryfield .entryi2c2_prescale -textvariable Para(i2c2_prescale) -state disabled -width 10
	pack .entryi2c2_prescale -in $csi2c2_prescale -side top -anchor w -padx 10
	iwidgets::labeledframe .csi2c2_addr -labeltext "I2C Addressing" -labelpos nw
	set csi2c2_addr [.csi2c2_addr childsite]
	iwidgets::combobox .cboi2c2_addr -textvariable Para(i2c2_addr) -selectioncommand {ChangeI2CBitCmd2;ChangeValueCmd} -editable false -width 16
	.cboi2c2_addr insert list end "7-Bit Addressing" "10-Bit Addressing"
	pack .cboi2c2_addr -in $csi2c2_addr -side top -anchor w -padx 10
	iwidgets::labeledframe .csi2c2_sa -labeltext "Slave Address" -labelpos nw
	set csi2c2_sa [.csi2c2_sa childsite]
	iwidgets::entryfield .entryi2c2_sa -labeltext "10" -labelpos e -width 10 -textvariable Para(i2c2_sa) -fixed 5 -validate {bin %c}
	pack .entryi2c2_sa -in $csi2c2_sa -side top -anchor w -padx 10
	pack .ck1I2C2 .ck2I2C2 .csi2c2_freq .csi2c2_prescale .csi2c2_addr .csi2c2_sa -in $csI2C2 -side top -anchor w -fill x
	.entryi2c1_sa.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}
	.entryi2c2_sa.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}
	#UFM/Configuration I2C
	if {$Para(arch) == "xo3c00a" || $Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {
		iwidgets::labeledframe .csUFMConfig -labeltext "Configuration I2C" -labelpos nw
	} else  {
		iwidgets::labeledframe .csUFMConfig -labeltext "UFM/Configuration I2C" -labelpos nw
	}
	
	set csUFMConfig [.csUFMConfig childsite]
	iwidgets::labeledframe .csufm_addr -labeltext "I2C Addressing" -labelpos nw
	set csufm_addr [.csufm_addr childsite]
	iwidgets::combobox .cboufm_addr -textvariable Para(ufm_addr) -selectioncommand {ChangeI2CBitCmd2;ChangeValueCmd} -editable false -width 16
	.cboufm_addr insert list end "7-Bit Addressing" "10-Bit Addressing"
	pack .cboufm_addr -in $csufm_addr -side top -anchor w -padx 10
	iwidgets::labeledframe .csufm_sa -labeltext "Slave Address" -labelpos nw
	set csufm_sa [.csufm_sa childsite]
	iwidgets::entryfield .entryufm_sa -labeltext "00" -labelpos e -width 10 -textvariable Para(ufm_sa) -fixed 5 -validate {bin %c}
	pack .entryufm_sa -in $csufm_sa -side top -anchor w -padx 10
	pack .csufm_sa .csufm_addr -in $csUFMConfig -side bottom -anchor w -fill x
	.cboufm_addr config -state disabled
	.entryufm_sa config -state disabled

#	grid .lblI2CImage -row 0 -column 0 -columnspan 2 -in $csI2C
#	pack .lblImage -in $csI2C
	grid .csI2C1 .csI2C2 .csUFMConfig -in $csI2C -sticky ns;#-side left
#	grid .csI2C1 .csI2C2 -row 1 -in $csI2C;# -sticky nswe
	pack .csI2C -in $page2 -fill x

	#"SPI"
	set page3 [$tnb add -label "SPI"]
	iwidgets::labeledframe .csspi
	set csspi [.csspi childsite]

	catch {image delete spi_gif}
	set gif_file [file join $Para(ipdir) machxo2 gui "spi.gif"]
	image create photo spi_gif -file $gif_file
	label .lblSpiImage -image spi_gif

	iwidgets::labeledframe .csspi_mode -labeltext "SPI Mode" -labelpos nw
	set csspi_mode [.csspi_mode childsite]
	radiobutton .rdo1spi_mode -text "Master" -value Master  -variable Para(spi_mode) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2spi_mode -text "Slave"  -value Slave   -variable Para(spi_mode) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo3spi_mode -text "Slave & Master"  -value Both   -variable Para(spi_mode) -anchor w -command {ChangeValueCmd}
#	checkbutton .cbspi_mode -text "Include Both" -variable Para(spi_ib) -command {ChangeValueCmd}
#	grid .rdo1spi_mode .rdo2spi_mode -in $csspi_mode -sticky w
#	grid .cbspi_mode -in $csspi_mode -columnspan 2 -sticky w
	pack .rdo1spi_mode .rdo2spi_mode .rdo3spi_mode -in $csspi_mode -side top -anchor w

	iwidgets::labeledframe .csspi_pt -labeltext "SPI Protocol Options"	-labelpos nw
	set csspi_pt [.csspi_pt childsite]
	checkbutton .cbspi_lsb -text "LSB First" -variable Para(spi_lsb) -command {ChangeValueCmd}
	checkbutton .cbspi_clkinv -text "Inverted Clock" -variable Para(spi_clkinv) -command {ChangeValueCmd}
	checkbutton .cbspi_ph -text "Phase Adjust" -variable Para(spi_ph) -command {ChangeValueCmd}
	checkbutton .cbspi_hs -text "Slave Handshake Mode" -variable Para(spi_hs) -command {ChangeValueCmd}
	pack .cbspi_lsb .cbspi_clkinv .cbspi_ph .cbspi_hs -in $csspi_pt -side top -anchor w
	
	iwidgets::labeledframe .csspi_cr -labeltext "Master Clock Rate" -labelpos nw
	set csspi_cr [.csspi_cr childsite]
	iwidgets::entryfield .entryspi_freq -labeltext "Desired" -textvariable Para(spi_freq) -width 10 -fixed 5 -validate real
	label .lblspi_freq -text "MHz  "
	iwidgets::entryfield .entryspi_freq2 -labeltext "Actual" -textvariable Para(spi_freq2) -width 10 -fixed 5 -validate real -state disabled 
	label .lblspi_freq2 -text "MHz  "
	.entryspi_freq.label config -width 8 -anchor w
	.entryspi_freq2.label config -width 8 -anchor w
	grid .entryspi_freq .lblspi_freq -in $csspi_cr -sticky e -pady 2
	grid .entryspi_freq2 .lblspi_freq2 -in $csspi_cr
	.entryspi_freq.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}
	
	iwidgets::labeledframe .csspi_cs -labeltext "Master Chip Selects" -labelpos nw
	set csspi_cs [.csspi_cs childsite]
	iwidgets::combobox .cbospi_cs -editable false -width 8 -textvariable Para(spi_cs) -selectioncommand {ChangeValueCmd}
	.cbospi_cs insert list end 1 2 3 4 5 6 7 8
	#.cbospi_cs.label config -width 18 -anchor w
	pack .cbospi_cs -in $csspi_cs;# -padx 20
	
	iwidgets::labeledframe .csspi_ir -labeltext "Interrupts" -labelpos nw
	set csspi_ir [.csspi_ir childsite]
	checkbutton .cbspi_txr -text "Tx Ready" -variable Para(spi_txr) -command {ChangeValueCmd}
	checkbutton .cbspi_txo -text "Tx Overrun" -variable Para(spi_txo) -command {ChangeValueCmd}
	checkbutton .cbspi_rxr -text "Rx Ready" -variable Para(spi_rxr) -command {ChangeValueCmd}
	checkbutton .cbspi_rxo -text "Rx Overrun" -variable Para(spi_rxo) -command {ChangeValueCmd}
	checkbutton .cbspi_en  -text "Enable Port" -variable Para(spi_en) -command {ChangeValueCmd}
	grid .cbspi_txr .cbspi_rxr -in $csspi_ir -padx 10 -sticky w
	grid .cbspi_txo .cbspi_rxo -in $csspi_ir -padx 10 -sticky w
	grid .cbspi_en -in $csspi_ir -columnspan 2 -sticky we
	
	iwidgets::labeledframe .csspi_ms -labeltext "Misc" -labelpos nw
	set csspi_ms [.csspi_ms childsite]
	checkbutton .csspi_we -text "Wakeup Enable" -variable Para(spi_we) -command {ChangeValueCmd}
	grid .csspi_we -in $csspi_ms
	
	#grid .lblSpiImage -columnspan 2 -in $csspi -sticky we
	grid .csspi_mode .csspi_cr -in $csspi -sticky nswe
	grid .csspi_pt   .csspi_cs -in $csspi -sticky nswe
	grid .csspi_ir -in $csspi -columnspan 2 -sticky we
	grid .csspi_ms -in $csspi -columnspan 2 -sticky we

	pack .csspi -in $page3 -fill x
	
	#"Timer/Counter"
	set page4 [$tnb add -label "Timer/Counter"]
	iwidgets::labeledframe .cstc
	set cstc [.cstc childsite]
	
	catch {image delete tc_gif}
	set gif_file [file join $Para(ipdir) machxo2 gui "tc.gif"]
	image create photo tc_gif -file $gif_file
	label .lblTCImage -image tc_gif
	
	iwidgets::labeledframe .cstc_mode -labeltext "Mode Selection" -labelpos nw
	set cstc_mode [.cstc_mode childsite]
	iwidgets::combobox .cbotc_mode -labeltext "Timer/Counter Mode" -width 22 -editable false -textvariable Para(tc_mode) -selectioncommand {ChangeValueCmd}
	iwidgets::combobox .cbotc_o    -labeltext "Output Function"    -width 22 -editable false -textvariable Para(tc_o)  -selectioncommand {ChangeValueCmd}
	.cbotc_mode.label config 	-width 18 -anchor w
	.cbotc_o.label config 		-width 18 -anchor w
	.cbotc_mode insert list end WATCHDOG CTCM FASTPWM PFCPWM
	.cbotc_o    insert list end STATIC TOGGLE WAVE_GENERATOR INV_WAVE_GENERATOR
	pack .cbotc_mode .cbotc_o -in $cstc_mode -side top -anchor w -pady 2
	
	iwidgets::labeledframe .cstc_cs -labeltext "Clock Selections" -labelpos nw
	set cstc_cs [.cstc_cs childsite]
	checkbutton .cbtc_osc -text "Use On-Chip Oscillator" -variable Para(tc_osc)
	iwidgets::combobox .cbotc_clkinv -labeltext "Clock Edge Selection"   -width 12 -editable false -textvariable Para(tc_clkinv) -selectioncommand {ChangeValueCmd}
	iwidgets::combobox .cbotc_div    -labeltext "Prescale Divider Value" -width 10 -editable false -textvariable Para(tc_div)  -selectioncommand {ChangeValueCmd}
	.cbotc_clkinv.label config 	-width 18 -anchor w
	.cbotc_div.label config 	-width 18 -anchor w
	.cbotc_clkinv insert list end Positive Negative
	.cbotc_div    insert list end 0 1 8 64 256 1024
	pack .cbotc_clkinv .cbtc_osc .cbotc_div -in $cstc_cs -side top -anchor w -pady 2
	
	iwidgets::labeledframe .cstc_eir -labeltext "Enable Interrupt Register" -labelpos nw
	set cstc_eir [.cstc_eir childsite]
	checkbutton .cbtc_oflow -text "Overflow" -variable Para(tc_oflow) -command {ChangeValueCmd}
	checkbutton .cbtc_opcomp -text "Output Compare Match" -variable Para(tc_opcomp) -command {ChangeValueCmd}
	checkbutton .cbtc_ipcap -text "Input Capture" -variable Para(tc_ipcap) -command {ChangeValueCmd}
	checkbutton .cbtc_sa_oflow -text "Standalone Overflow (No Wishbone Bus)" -variable Para(tc_sa_oflow) -command {ChangeValueCmd}
	pack .cbtc_oflow .cbtc_opcomp .cbtc_ipcap .cbtc_sa_oflow -in $cstc_eir -side top -anchor w -pady 2
	
	iwidgets::labeledframe .cstc_cv -labeltext "Counter Values" -labelpos nw
	set cstc_cv [.cstc_cv childsite]
	checkbutton .cbtc_ctr -text "Set Top Counter Value" -variable Para(tc_ctr) -command {ChangeValueCmd}
	label .lbltc_top -text "Timer/Counter Top"
	iwidgets::entryfield .entrytc_top -labeltext "(0 - 65535)" -labelpos e -textvariable Para(tc_top) -width 8 -fixed 6 -validate integer
	label .lbltc_ocr -text "Output Compare Value"
	iwidgets::entryfield .entrytc_ocr -labeltext "(0 - 65535)" -labelpos e -textvariable Para(tc_ocr) -width 8 -fixed 6 -validate integer
	label .lblBlandTc -text ""
	grid .cbtc_ctr -in $cstc_cv -columnspan 2 -sticky w
	grid .lbltc_top .entrytc_top -in $cstc_cv -sticky w -pady 2
	grid .lbltc_ocr .entrytc_ocr -in $cstc_cv -sticky w
	grid .lblBlandTc -in $cstc_cv -sticky w -pady 2
		
#	grid .lblTCImage -row 0 -column 0 -rowspan 2 -in $cstc -sticky wens
	grid .cstc_mode -row 0 -column 0 -in $cstc -sticky wens
	grid .cstc_cs -row 0 -column 1   -in $cstc -sticky wens
	grid .cstc_eir .cstc_cv -in $cstc -sticky wens
	#pack .cstc_eir .cstc_mode .cstc_cs .cstc_cv -in $page4 -side top -fill x

	pack .cstc -in $page4 -fill x
	

	
if {$Para(arch) == "se5c00" || $Para(arch) == "se5r00"} {

#"UFM_CFG0"
	set page5 [$tnb add -label "UFM_CFG0"]
	iwidgets::labeledframe .csUfm_cfg0
	set csUfm_cfg0 [.csUfm_cfg0 childsite]
	
	iwidgets::labeledframe .csufm_uu_cfg0 -labeltext "Initialize User Flash Memory" -labelpos nw
	set csufm_uu_cfg0 [.csufm_uu_cfg0 childsite]
	iwidgets::entryfield .entryufm_remain_cfg0 -labeltext "Enter Number of Pages(128 bits in one Page)" -textvariable Para(mem_size_cfg0) -width 8 -validate integer
	iwidgets::entryfield .entryufm_start_cfg0  -labeltext "Initialization Data Starts at Page" -textvariable Para(ufm_cfg0_ebr) -width 8 -validate integer -state disabled
	.entryufm_remain_cfg0.label config -width 45 -anchor w
	.entryufm_start_cfg0.label config -width 45 -anchor w
	pack .entryufm_remain_cfg0 .entryufm_start_cfg0 -in $csufm_uu_cfg0 -side top -anchor w -pady 2
	.entryufm_start_cfg0 config -disabledforeground black
	.entryufm_remain_cfg0.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}	

	
	set mem_types {
		{"Memory files"		{.mem}	}
		{"All files"		{*.*}	}
	}
	radiobutton .rdo1ufm_usage_cfg0 -text "User Flash Memory Is Initialized With All 0s" -value 0 -variable Para(ufm_cfg0_init) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_usage_cfg0 -text "Upload User Flash  Memory Initialization Data File" -value mem_cfg0 -variable Para(ufm_cfg0_init) -anchor w -command {ChangeValueCmd}

	frame .frmufm_df_cfg0
	iwidgets::entryfield .entufm_df_cfg0 -width 40 -textvariable Para(memfile_cfg0)
	button .btnufm_df_cfg0 -text "..." -width 2 -command {
		set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
		if {$ret != "" }  {
			set Para(memfile_cfg0) $ret
			Convert $ret
			#CR_51945
			set Para(memfile_cfg0) [file tail $ret]
		} 
	}
	pack .entufm_df_cfg0 .btnufm_df_cfg0 -in .frmufm_df_cfg0 -side left
	frame .frmufm_dt_cfg0
	radiobutton .rdo1ufm_dt_cfg0 -text "Binary" -value bin -variable Para(ufm_cfg0_dt) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_dt_cfg0 -text "Hexadecimal"    -value hex -variable Para(ufm_cfg0_dt) -anchor w -command {ChangeValueCmd}
	pack .rdo2ufm_dt_cfg0 .rdo1ufm_dt_cfg0 -in .frmufm_dt_cfg0 -side left
	

	pack .csufm_uu_cfg0 -in $csUfm_cfg0 -side top -fill x
	pack .rdo1ufm_usage_cfg0 .rdo2ufm_usage_cfg0 -in $csUfm_cfg0 -side top -anchor w -padx 20
	pack .frmufm_df_cfg0 .frmufm_dt_cfg0 -in $csUfm_cfg0 -side top -anchor w -padx 30
	pack .csUfm_cfg0 -in $page5 -fill x
	
#"UFM0"
	set page6 [$tnb add -label "UFM0"]
	iwidgets::labeledframe .csUfm0
	set csUfm0 [.csUfm0 childsite]
	
	iwidgets::labeledframe .csufm_uu0 -labeltext "Initialize User Flash Memory" -labelpos nw
	set csufm_uu0 [.csufm_uu0 childsite]
	iwidgets::entryfield .entryufm_remain0 -labeltext "Enter Number of Pages(128 bits in one Page)" -textvariable Para(mem_size0) -width 8 -validate integer
	iwidgets::entryfield .entryufm_start0  -labeltext "Initialization Data Starts at Page" -textvariable Para(ufm0_ebr) -width 8 -validate integer -state disabled
	.entryufm_remain0.label config -width 45 -anchor w
	.entryufm_start0.label config -width 45 -anchor w
	pack .entryufm_remain0 .entryufm_start0 -in $csufm_uu0 -side top -anchor w -pady 2
	.entryufm_start0 config -disabledforeground black
	.entryufm_remain0.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}	

	
	set mem_types {
		{"Memory files"		{.mem}	}
		{"All files"		{*.*}	}
	}
	radiobutton .rdo1ufm_usage0 -text "User Flash Memory Is Initialized With All 0s" -value 0 -variable Para(ufm0_init) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_usage0 -text "Upload User Flash  Memory Initialization Data File" -value mem0 -variable Para(ufm0_init) -anchor w -command {ChangeValueCmd}

	frame .frmufm_df0
	iwidgets::entryfield .entufm_df0 -width 40 -textvariable Para(memfile0)
	button .btnufm_df0 -text "..." -width 2 -command {
		set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
		if {$ret != "" }  {
			set Para(memfile0) $ret
			Convert $ret
			#CR_51945
			set Para(memfile0) [file tail $ret]
		} 
	}
	pack .entufm_df0 .btnufm_df0 -in .frmufm_df0 -side left
	frame .frmufm_dt0
	radiobutton .rdo1ufm_dt0 -text "Binary" -value bin -variable Para(ufm0_dt) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_dt0 -text "Hexadecimal"    -value hex -variable Para(ufm0_dt) -anchor w -command {ChangeValueCmd}
	pack .rdo2ufm_dt0 .rdo1ufm_dt0 -in .frmufm_dt0 -side left
	

	pack .csufm_uu0 -in $csUfm0 -side top -fill x
	pack .rdo1ufm_usage0 .rdo2ufm_usage0 -in $csUfm0 -side top -anchor w -padx 20
	pack .frmufm_df0 .frmufm_dt0 -in $csUfm0 -side top -anchor w -padx 30
	pack .csUfm0 -in $page6 -fill x

#"UFM_CFG1"
	set page7 [$tnb add -label "UFM_CFG1"]
	iwidgets::labeledframe .csUfm_cfg1
	set csUfm_cfg1 [.csUfm_cfg1 childsite]
	
	iwidgets::labeledframe .csufm_uu_cfg1 -labeltext "Initialize User Flash Memory" -labelpos nw
	set csufm_uu_cfg1 [.csufm_uu_cfg1 childsite]
	iwidgets::entryfield .entryufm_remain_cfg1 -labeltext "Enter Number of Pages(128 bits in one Page)" -textvariable Para(mem_size_cfg1) -width 8 -validate integer
	iwidgets::entryfield .entryufm_start_cfg1  -labeltext "Initialization Data Starts at Page" -textvariable Para(ufm_cfg1_ebr) -width 8 -validate integer -state disabled
	.entryufm_remain_cfg1.label config -width 45 -anchor w
	.entryufm_start_cfg1.label config -width 45 -anchor w
	pack .entryufm_remain_cfg1 .entryufm_start_cfg1 -in $csufm_uu_cfg1 -side top -anchor w -pady 2
	.entryufm_start_cfg1 config -disabledforeground black
	.entryufm_remain_cfg1.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}	

	
	set mem_types {
		{"Memory files"		{.mem}	}
		{"All files"		{*.*}	}
	}
	radiobutton .rdo1ufm_usage_cfg1 -text "User Flash Memory Is Initialized With All 0s" -value 0 -variable Para(ufm_cfg1_init) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_usage_cfg1 -text "Upload User Flash  Memory Initialization Data File" -value mem_cfg1 -variable Para(ufm_cfg1_init) -anchor w -command {ChangeValueCmd}

	frame .frmufm_df_cfg1
	iwidgets::entryfield .entufm_df_cfg1 -width 40 -textvariable Para(memfile_cfg1)
	button .btnufm_df_cfg1 -text "..." -width 2 -command {
		set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
		if {$ret != "" }  {
			set Para(memfile_cfg1) $ret
			Convert $ret
			#CR_51945
			set Para(memfile_cfg1) [file tail $ret]
		} 
	}
	pack .entufm_df_cfg1 .btnufm_df_cfg1 -in .frmufm_df_cfg1 -side left
	frame .frmufm_dt_cfg1
	radiobutton .rdo1ufm_dt_cfg1 -text "Binary" -value bin -variable Para(ufm_cfg1_dt) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_dt_cfg1 -text "Hexadecimal"    -value hex -variable Para(ufm_cfg1_dt) -anchor w -command {ChangeValueCmd}
	pack .rdo2ufm_dt_cfg1 .rdo1ufm_dt_cfg1 -in .frmufm_dt_cfg1 -side left
	

	pack .csufm_uu_cfg1 -in $csUfm_cfg1 -side top -fill x
	pack .rdo1ufm_usage_cfg1 .rdo2ufm_usage_cfg1 -in $csUfm_cfg1 -side top -anchor w -padx 20
	pack .frmufm_df_cfg1 .frmufm_dt_cfg1 -in $csUfm_cfg1 -side top -anchor w -padx 30
	pack .csUfm_cfg1 -in $page7 -fill x
#"UFM1"
	set page8 [$tnb add -label "UFM1"]
	iwidgets::labeledframe .csUfm1
	set csUfm1 [.csUfm1 childsite]
	
	iwidgets::labeledframe .csufm_uu1 -labeltext "Initialize User Flash Memory" -labelpos nw
	set csufm_uu1 [.csufm_uu1 childsite]
	iwidgets::entryfield .entryufm_remain1 -labeltext "Enter Number of Pages(128 bits in one Page)" -textvariable Para(mem_size1) -width 8 -validate integer
	iwidgets::entryfield .entryufm_start1  -labeltext "Initialization Data Starts at Page" -textvariable Para(ufm1_ebr) -width 8 -validate integer -state disabled
	.entryufm_remain1.label config -width 45 -anchor w
	.entryufm_start1.label config -width 45 -anchor w
	pack .entryufm_remain1 .entryufm_start1 -in $csufm_uu1 -side top -anchor w -pady 2
	.entryufm_start1 config -disabledforeground black
	.entryufm_remain1.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}	

	
	set mem_types {
		{"Memory files"		{.mem}	}
		{"All files"		{*.*}	}
	}
	radiobutton .rdo1ufm_usage1 -text "User Flash Memory Is Initialized With All 0s" -value 0 -variable Para(ufm1_init) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_usage1 -text "Upload User Flash  Memory Initialization Data File" -value mem1 -variable Para(ufm1_init) -anchor w -command {ChangeValueCmd}

	frame .frmufm_df1
	iwidgets::entryfield .entufm_df1 -width 40 -textvariable Para(memfile1)
	button .btnufm_df1 -text "..." -width 2 -command {
		set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
		if {$ret != "" }  {
			set Para(memfile1) $ret
			Convert $ret
			#CR_51945
			set Para(memfile1) [file tail $ret]
		} 
	}
	pack .entufm_df1 .btnufm_df1 -in .frmufm_df1 -side left
	frame .frmufm_dt1
	radiobutton .rdo1ufm_dt1 -text "Binary" -value bin -variable Para(ufm1_dt) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_dt1 -text "Hexadecimal"    -value hex -variable Para(ufm1_dt) -anchor w -command {ChangeValueCmd}
	pack .rdo2ufm_dt1 .rdo1ufm_dt1 -in .frmufm_dt1 -side left
	

	pack .csufm_uu1 -in $csUfm1 -side top -fill x
	pack .rdo1ufm_usage1 .rdo2ufm_usage1 -in $csUfm1 -side top -anchor w -padx 20
	pack .frmufm_df1 .frmufm_dt1 -in $csUfm1 -side top -anchor w -padx 30
	pack .csUfm1 -in $page8 -fill x

#"UFM2"
	set page9 [$tnb add -label "UFM2"]
	iwidgets::labeledframe .csUfm2
	set csUfm2 [.csUfm2 childsite]
	
	iwidgets::labeledframe .csufm_uu2 -labeltext "Initialize User Flash Memory" -labelpos nw
	set csufm_uu2 [.csufm_uu2 childsite]
	iwidgets::entryfield .entryufm_remain2 -labeltext "Enter Number of Pages(128 bits in one Page)" -textvariable Para(mem_size2) -width 8 -validate integer
	iwidgets::entryfield .entryufm_start2  -labeltext "Initialization Data Starts at Page" -textvariable Para(ufm2_ebr) -width 8 -validate integer -state disabled
	.entryufm_remain2.label config -width 45 -anchor w
	.entryufm_start2.label config -width 45 -anchor w
	pack .entryufm_remain2 .entryufm_start2 -in $csufm_uu2 -side top -anchor w -pady 2
	.entryufm_start2 config -disabledforeground black
	.entryufm_remain2.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}	

	
	set mem_types {
		{"Memory files"		{.mem}	}
		{"All files"		{*.*}	}
	}
	radiobutton .rdo1ufm_usage2 -text "User Flash Memory Is Initialized With All 0s" -value 0 -variable Para(ufm2_init) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_usage2 -text "Upload User Flash  Memory Initialization Data File" -value mem2 -variable Para(ufm2_init) -anchor w -command {ChangeValueCmd}

	frame .frmufm_df2
	iwidgets::entryfield .entufm_df2 -width 40 -textvariable Para(memfile2)
	button .btnufm_df2 -text "..." -width 2 -command {
		set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
		if {$ret != "" }  {
			set Para(memfile2) $ret
			Convert $ret
			#CR_51945
			set Para(memfile2) [file tail $ret]
		} 
	}
	pack .entufm_df2 .btnufm_df2 -in .frmufm_df2 -side left
	frame .frmufm_dt2
	radiobutton .rdo1ufm_dt2 -text "Binary" -value bin -variable Para(ufm2_dt) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_dt2 -text "Hexadecimal"    -value hex -variable Para(ufm2_dt) -anchor w -command {ChangeValueCmd}
	pack .rdo2ufm_dt2 .rdo1ufm_dt2 -in .frmufm_dt2 -side left
	

	pack .csufm_uu2 -in $csUfm2 -side top -fill x
	pack .rdo1ufm_usage2 .rdo2ufm_usage2 -in $csUfm2 -side top -anchor w -padx 20
	pack .frmufm_df2 .frmufm_dt2 -in $csUfm2 -side top -anchor w -padx 30
	pack .csUfm2 -in $page9 -fill x	
	
#"UFM3"
	set page10 [$tnb add -label "UFM3"]
	iwidgets::labeledframe .csUfm3
	set csUfm3 [.csUfm3 childsite]
	
	iwidgets::labeledframe .csufm_uu3 -labeltext "Initialize User Flash Memory" -labelpos nw
	set csufm_uu3 [.csufm_uu3 childsite]
	iwidgets::entryfield .entryufm_remain3 -labeltext "Enter Number of Pages(128 bits in one Page)" -textvariable Para(mem_size3) -width 8 -validate integer
	iwidgets::entryfield .entryufm_start3  -labeltext "Initialization Data Starts at Page" -textvariable Para(ufm3_ebr) -width 8 -validate integer -state disabled
	.entryufm_remain3.label config -width 45 -anchor w
	.entryufm_start3.label config -width 45 -anchor w
	pack .entryufm_remain3 .entryufm_start3 -in $csufm_uu3 -side top -anchor w -pady 2
	.entryufm_start3 config -disabledforeground black
	.entryufm_remain3.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}	

	
	set mem_types {
		{"Memory files"		{.mem}	}
		{"All files"		{*.*}	}
	}
	radiobutton .rdo1ufm_usage3 -text "User Flash Memory Is Initialized With All 0s" -value 0 -variable Para(ufm3_init) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_usage3 -text "Upload User Flash  Memory Initialization Data File" -value mem3 -variable Para(ufm3_init) -anchor w -command {ChangeValueCmd}

	frame .frmufm_df3
	iwidgets::entryfield .entufm_df3 -width 40 -textvariable Para(memfile3)
	button .btnufm_df3 -text "..." -width 2 -command {
		set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
		if {$ret != "" }  {
			set Para(memfile3) $ret
			Convert $ret
			#CR_51945
			set Para(memfile3) [file tail $ret]
		} 
	}
	pack .entufm_df3 .btnufm_df3 -in .frmufm_df3 -side left
	frame .frmufm_dt3
	radiobutton .rdo1ufm_dt3 -text "Binary" -value bin -variable Para(ufm3_dt) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_dt3 -text "Hexadecimal"    -value hex -variable Para(ufm3_dt) -anchor w -command {ChangeValueCmd}
	pack .rdo2ufm_dt3 .rdo1ufm_dt3 -in .frmufm_dt3 -side left
	

	pack .csufm_uu3 -in $csUfm3 -side top -fill x
	pack .rdo1ufm_usage3 .rdo2ufm_usage3 -in $csUfm3 -side top -anchor w -padx 20
	pack .frmufm_df3 .frmufm_dt3 -in $csUfm3 -side top -anchor w -padx 30
	pack .csUfm3 -in $page10 -fill x
	
	
	#"Tamper"
	set page11 [$tnb add -label "Tamper"]
	iwidgets::labeledframe .cstamper
	set cstamper [.cstamper childsite]
	
	iwidgets::labeledframe .csettr -labeltext "Enable Tamper Type Register"  -labelpos nw
	set csettr [.csettr childsite]
	checkbutton .cbt_pwd -text "Password Protection"  -width 50 -anchor w -variable Para(t_pwd) -command {ChangeValueCmd}
	checkbutton .cbt_lockflash -text "Locked Flash or SRAM"  -width 50 -anchor w -variable Para(t_lockflash) -command {ChangeValueCmd}
	checkbutton .cbt_mmode -text "Manufacture Mode" -width 50 -anchor w -variable Para(t_manmode) -command {ChangeValueCmd}
	pack .cbt_pwd .cbt_lockflash .cbt_mmode -in $csettr -side top -anchor w -pady 2
	
	
	iwidgets::labeledframe .csetsr -labeltext "Enable Tamper Source Register"  -labelpos nw
	set csetsr [.csetsr childsite]
	checkbutton .cbt_jtag -text "JTAG Port" -width 50 -anchor w -variable Para(t_jtagport) -command {ChangeValueCmd}
	checkbutton .cbt_sspi -text "SSPI Port" -width 50 -anchor w -variable Para(t_sspiport) -command {ChangeValueCmd}
	checkbutton .cbt_sic2 -text "SI2C Port" -width 50 -anchor w -variable Para(t_sic2port) -command {ChangeValueCmd}
    checkbutton .cbt_wbport -text "WB Port" -width 50 -anchor w -variable Para(t_wbport) -command {ChangeValueCmd}
	pack .cbt_jtag .cbt_sspi .cbt_sic2 .cbt_wbport -in $csetsr -side top -anchor w -pady 2 
	
	
	grid .csettr .csetsr -in $cstamper -sticky wens 
	
	checkbutton .cbt_plock -text "Port Lock" -width 50 -anchor w -variable Para(t_portlock) -command {ChangeValueCmd}
    grid .cbt_plock -in $cstamper -sticky wens 
	pack .cstamper -in $page11 -fill x

} else {
	#"UFM"
if {$Para(arch) != "xo3c00a"} {
	set page5 [$tnb add -label "UFM"]
	iwidgets::labeledframe .csUfm
	set csUfm [.csUfm childsite]
	
	iwidgets::labeledframe .csufm_uu -labeltext "Initialize User Flash Memory" -labelpos nw
	set csufm_uu [.csufm_uu childsite]
	iwidgets::entryfield .entryufm_remain -labeltext "Enter Number of Pages(128 bits in one Page)" -textvariable Para(mem_size) -width 8 -validate integer
	iwidgets::entryfield .entryufm_start  -labeltext "Initialization Data Starts at Page" -textvariable Para(ufm_ebr) -width 8 -validate integer -state disabled
	.entryufm_remain.label config -width 45 -anchor w
	.entryufm_start.label config -width 45 -anchor w
	pack .entryufm_remain .entryufm_start -in $csufm_uu -side top -anchor w -pady 2
	.entryufm_start config -disabledforeground black
	.entryufm_remain.lwchildsite.entry config -validate key -vcmd {
		after idle {ChangeValueCmd}
		return 1
	}
	
#	radiobutton .rdo1ufm_usage -text "TAG Memory Only" -value TAB_ONLY -variable Para(ufm_usage) -anchor w -command {ChangeValueCmd}
#	radiobutton .rdo2ufm_usage -text "Shared TAG Memory and EBR Initialization" -value SHARED_EBR_TAG -variable Para(ufm_usage) -anchor w -command {ChangeValueCmd}
#	pack .rdo1ufm_usage .rdo2ufm_usage -in $csufm_uu -side top -anchor w
	
#	iwidgets::labeledframe .csufm_sua -labeltext "Shared UFM Array" -labelpos nw
#	set csufm_sua [.csufm_sua childsite]
#	iwidgets::combobox .cboufm_ebr -labeltext "Number of EBR Blocks with Unique Initialization Data" -width 4 -editable false -textvariable Para(ufm_ebr) -selectioncommand {ChangeValueCmd}
#	iwidgets::entryfield .entryufm_remain -labeltext "The Number of Remaining TAG Bytes" -textvariable Para(ufm_remain) -width 8 -validate integer -state disabled
#	iwidgets::entryfield .entryufm_start  -labeltext "Starting TAG Address" -textvariable Para(ufm_start) -width 8 -validate integer -state disabled
#	.cboufm_ebr.label config -width 42 -anchor w
#	.entryufm_remain.label config -width 30 -anchor w
#	.entryufm_start.label config -width 30 -anchor w
#	pack .cboufm_ebr .entryufm_remain .entryufm_start -in $csufm_sua -side top -anchor w -pady 2
	
	set mem_types {
		{"Memory files"		{.mem}	}
		{"All files"		{*.*}	}
	}
	radiobutton .rdo1ufm_usage -text "User Flash Memory Is Initialized With All 0s" -value 0 -variable Para(ufm_init) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_usage -text "Upload User Flash  Memory Initialization Data File" -value mem -variable Para(ufm_init) -anchor w -command {ChangeValueCmd}

	#	label .lblufm_df -text "Upload TAG Initialization Data File (Optional)"
	frame .frmufm_df
	iwidgets::entryfield .entufm_df -width 40 -textvariable Para(memfile)
	button .btnufm_df -text "..." -width 2 -command {
		set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
		if {$ret != "" }  {
			set Para(memfile) $ret
			Convert $ret
			#CR_51945
			set Para(memfile) [file tail $ret]
		} 
	}
	pack .entufm_df .btnufm_df -in .frmufm_df -side left
	frame .frmufm_dt
	radiobutton .rdo1ufm_dt -text "Binary" -value bin -variable Para(ufm_dt) -anchor w -command {ChangeValueCmd}
	radiobutton .rdo2ufm_dt -text "Hexadecimal"    -value hex -variable Para(ufm_dt) -anchor w -command {ChangeValueCmd}
	pack .rdo2ufm_dt .rdo1ufm_dt -in .frmufm_dt -side left
	
#	pack .csufm_uu .csufm_sua -in $csUfm -side top -fill x
	pack .csufm_uu -in $csUfm -side top -fill x
	pack .rdo1ufm_usage .rdo2ufm_usage -in $csUfm -side top -anchor w -padx 20
	pack .frmufm_df .frmufm_dt -in $csUfm -side top -anchor w -padx 30
	pack .csUfm -in $page5 -fill x
}

}
	$tnb delete 0

#	if {$Para(arch) == "xo3c00a"} {
#		.ck_ufm config -state disabled
#		set Para(ufm) 0
#		pack forget .ck_ufm
#		grid forget .csUFMConfig
#		$tnb delete 4 4
#	}
	$tnb view 0

	GeneralConfig

	LoadParaCB
#	ChangeValueCmd

	pack forget .cboBusOrder 
}
