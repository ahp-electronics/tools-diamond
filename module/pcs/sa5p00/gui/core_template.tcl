#$Header: L:/module/pcs/sa5p00/gui/core_template.tcl 1.2 mghuang Exp $

#Rev 1.9: Diamond 3.6 Clarity:    SCR1112  & SCR1111
#P4 Rev 1.2: Diamond 3.5 Clarity: Sapphire DCU spreadsheet rev 2.56
#Rev 1.8: Diamond 3.4 Clarity: Sapphire DCU spreadsheet rev 2.53
#Rev 1.7: Diamond 3.3 IPExpress: Sapphire DCU spreadsheet rev 2.44,SOF-119127,SOF-122161
#Rev 1.6: Diamond 3.3 IPExpress: Sapphire DCU spreadsheet rev 2.44
#Rev 1.5: Diamond 3.3 IPExpress: Sapphire DCU spreadsheet rev 2.42
#Rev 1.4: Diamond 3.3 IPExpress: Sapphire DCU spreadsheet rev 2.41
#Rev 1.3: Diamond 3.2 IPExpress: Sapphire DCU spreadsheet rev 2.32
#Rev 1.19: Diamond 3.2 IPExpress: change SCI back to SCIPORT
#Rev 1.18: Diamond 3.2 IPExpress: SCR_1078
#Rev 1.17: Diamond 3.2 IPExpress: Import SRV file
#Rev 1.16: Diamond 3.1 IPExpress: Fixed SOF-119370
#Rev 1.15: Diamond 3.1 IPExpress: Fixed SOF-119430
#Rev 1.14: Diamond 3.1 IPExpress: Fixed SOF-119211
#Rev 1.13: Diamond 3.1 IPExpress: SCR_1069
#Rev 1.12: Diamond 3.1 IPExpress: SCR_1065 
#Rev 1.11: Diamond 3.1 IPExpress: IP support 
#Rev 1.10: Diamond 3.0 IPExpress: Fixed SOF-117671,117684,117686 
#Rev 1.9: Diamond 3.0 IPExpress: set the GUI default per protocol
#Rev 1.8: Diamond 3.0 IPExpress: SCR_1047
#Rev 1.7: Diamond 3.0 IPExpress: Fixed SOF-117072
#Rev 1.6: Diamond 3.0 IPExpress: Fixed SOF-116966 and grayout Reset Sequence Select
#Rev 1.5: Diamond 3.0 IPExpress: Fixed SOF-116144
#Rev 1.3/1.4: Diamond 2.2 IPExpress: Fixed SOF-115630
#Rev 1.2: Diamond 2.2 IPExpress: Fixed SOF-115629, xlsm v2.10.
#Rev 1.1: Diamond 2.2 IPExpress: ECP4UM support.
#Rev 1.0: Diamond 2.2 IPExpress: init rev, UM rev 1.0

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc GetDevType {} {
	global Para

	regexp {(^[a-zA-Z0-9]+)-([0-9]+)?(.*)$} $Para(PartType) match x y z
	set Para(dev_type) $y
	#tk_messageBox -default ok -icon info -message "$x=$y=$z" -title GetDevType -type ok
}

set attribute_lst {PROTOCOL NUM_CHS CH_MODE TX_MAX_RATE TXPLLMULT REFCLK_RATE TXPLLLOLTHRESHOLD \
	CDR_MAX_RATE CDR_MULT RX_RATE_DIV CDR_REF_RATE RX_LINE_RATE RX_DATA_WIDTH RX_FICLK_RATE RXLDR CDRLOLRANGE \
	TX_LINE_RATE TX_RATE_DIV TX_DATA_WIDTH TX_FICLK_RATE TXLDR \
	IO_TYPE TXAMPLITUDE TXDIFFTERM TXDEPRE TXDEPOST RXDIFFTERM RXCOUPLING LEQ RXLOSTHRESHOLD \
	TXINVPOL TX8B10B TXFIFO_ENABLE RXINVPOL RX8B10B RXFIFO_ENABLE RXLSM RXWA RXSC RXCOMMAA RXCOMMAB RXCOMMAM \
	RXCTC RXCTCMATCHPATTERN RXCTCBYTEN RXCTCBYTEN1 RXCTCBYTEN2 RXCTCBYTEN3 RXMCAENABLE ACHARA ACHARB ACHARM \
	LOOPBACK RCSRC LOSPORT CDRLOLACTION RSTSEQSEL SCIPORT}

set widget_lst {.cboPROTOCOL .cboNUM_CHS .cboCH_MODE .entryTX_MAX_RATE .cboTXPLLMULT .entryREFCLK_RATE .cboTXPLLLOLTHRESHOLD \
	.entryCDR_MAX_RATE .cboCDR_MULT .cboRX_RATE_DIV .entryCDR_REF_RATE .entryRX_LINE_RATE .cboRX_DATA_WIDTH .entryRX_FICLK_RATE .cbRXLDR .cboCDRLOLRANGE \
	.entryTX_LINE_RATE .cboTX_RATE_DIV .cboTX_DATA_WIDTH .entryTX_FICLK_RATE .cbTXLDR \
	.cboIO_TYPE .entryTXAMPLITUDE .cboTXDIFFTERM .cboTXDEPRE .cboTXDEPOST .cboRXDIFFTERM .cboRXCOUPLING .cboLEQ .cboRXLOSTHRESHOLD \
	.cboTXINVPOL .cbTX8B10B .cboTXFIFO_ENABLE .cboRXINVPOL .cbRX8B10B .cboRXFIFO_ENABLE .cbRXLSM .cboRXWA .cboRXSC .entryRXCOMMAA .entryRXCOMMAB .entryRXCOMMAM \
	.cbRXCTC .cboRXCTCMATCHPATTERN .cbKBYTE0 .cbKBYTE1 .cbKBYTE2 .cbKBYTE3 .cbRXMCAENABLE .cbKBYTEA .cbKBYTEB .cbKBYTEM \
	.cboLOOPBACK .cboRCSRC .cboLOSPORT .cboCDRLOLACTION .cbRSTSEQSEL .cbSCIPORT}

proc ParaSave {} {
	global Para

	set Para(RXCTCBYTEN) "$Para(KBYTE0) $Para(BYTE0)H"
	set Para(RXCTCBYTEN1) "$Para(KBYTE1) $Para(BYTE1)H"
	set Para(RXCTCBYTEN2) "$Para(KBYTE2) $Para(BYTE2)H"
	set Para(RXCTCBYTEN3) "$Para(KBYTE3) $Para(BYTE3)H"
	
	#set Para(ACHARA) "$Para(KBYTEA) $Para(BYTEA)H"
	#set Para(ACHARB) "$Para(KBYTEB) $Para(BYTEB)H"
	#set Para(ACHARM) "$Para(KBYTEM) $Para(BYTEM)H"
}

proc IsInList1 {str lst para} {
	if {[string length $para] == 0} {
		set msg "Please input $str!"
		tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		return -1
	}
	if {[lsearch $lst $para] == -1} {
		set msg "Increment for $str should be 20!"
		tk_messageBox -default ok -icon warning -message $msg -title "Check Parameters" -type ok
		return -1
	}
	return 0
}

proc Para_Init {} {
	global Para

	set Para(KBYTE0) [string range $Para(RXCTCBYTEN) 0 0]
	set Para(KBYTE1) [string range $Para(RXCTCBYTEN1) 0 0]
	set Para(KBYTE2) [string range $Para(RXCTCBYTEN2) 0 0]
	set Para(KBYTE3) [string range $Para(RXCTCBYTEN3) 0 0]
	set Para(BYTE0) [string range $Para(RXCTCBYTEN) end-2 end-1]
	set Para(BYTE1) [string range $Para(RXCTCBYTEN1) end-2 end-1]
	set Para(BYTE2) [string range $Para(RXCTCBYTEN2) end-2 end-1]
	set Para(BYTE3) [string range $Para(RXCTCBYTEN3) end-2 end-1]

	#set Para(KBYTEA) [string range $Para(ACHARA) 0 0]
	#set Para(KBYTEB) [string range $Para(ACHARB) 0 0]
	#set Para(KBYTEM) [string range $Para(ACHARM) 0 0]
	#set Para(BYTEA) [string range $Para(ACHARA) end-2 end-1]
	#set Para(BYTEB) [string range $Para(ACHARB) end-2 end-1]
	#set Para(BYTEM) [string range $Para(ACHARM) end-2 end-1]
}

proc SaveProtocolCB {} {
	global Para
}

proc RestoreProtocolCB {} {
	global Para
}

proc restoreLPCinfo {} {
	global Para
	
	if {$Para(new) == 1}  {
		# create a new module
		set mn $Para(ModuleName)
		set sf $Para(SourceFormat)
		set familyy [string tolower $Para(family)]
		set default_file [file join $Para(ipdir) sa5p00 preference "default.lpc"]
		if {[file exists $default_file] == 0} {
			set default_file [file join $Para(ipdir) preference "default.lpc"]
		}
		LoadDefaultParameter $Para(CoreName) $default_file 1
		set Para(ModuleName)   $mn
		set Para(SourceFormat) $sf
	} else {
		set mn $Para(ModuleName)
		set sf $Para(SourceFormat)
		set familyy [string tolower $Para(family)]
		set default_file [file join $Para(ipdir) sa5p00 preference "default.lpc"]
		if {[file exists $default_file] == 0} {
			set default_file [file join $Para(ipdir) preference "default.lpc"]
		}
		LoadDefaultParameter $Para(CoreName) $default_file 1
		set Para(ModuleName)   $mn

		# open an existing module
		set i [LoadParameter $Para(CoreName) $Para(ParaFile)]
		if {$i == -1} {exit -1}
		if {[string length $Para(newmodule)] > 0}  {
			set Para(ModuleName) $Para(newmodule)
		} 
		set Para(SourceFormat) $sf
	} 
}
	
proc IO_TYPEsetting {io_type} {
	global Para attribute_lst widget_lst
	
	return

	set familyy [string tolower $Para(family)]
	if {$Para(arch) == "sa5p00g"} {
		set data_file [file join $Para(ipdir) sa5p00 gui "default5g.dat"]
	} else {
		set data_file [file join $Para(ipdir) sa5p00 gui "default.dat"]
	}
	#!load data file
	if [catch {open $data_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $data_file file!" \
			-title "Open file error" \
			-type ok
		return
	}

	set io_type_match 0
	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[IO_TYPE.$io_type\]"] == 0} {
			set io_type_match 1
			continue
		}
		if {$io_type_match == 1} {
			#lind include [, another protocol
			if {[string first "\[" $line] != -1} {
				set io_type_match 0
				break
			}
			#line include & continue;
			if {[string first "&" $line] != -1} continue
			if [regexp {([^=]*)=(.*)} $line match parameter value] {
				if [regexp {([ |\t]*;)} $parameter match] {continue}
				if [regexp {(.*)[ |\t]*;} $value match temp] {
					#set Data($parameter) $temp
					set attr $parameter
					set val_lst $temp
				} else {
					#set Data($parameter) $value
					set attr $parameter
					set val_lst $value
				}
#				if {$attr == "RXCOUPLING"} continue
				set idx [lsearch $attribute_lst $attr]
				set w [lindex $widget_lst $idx]
				set valid_val_lst [split $val_lst "|"]
				$w clear list
				foreach v $valid_val_lst {$w insert list end $v}
				#if {[lsearch $valid_val_lst $Para($attr)] == -1} {
					set Para($attr) [lindex $valid_val_lst 0]
				#}
			}
		}
	}
	close $fileid
}

proc loadDefaultPerProtocl {} {
	global Para

	set familyy [string tolower $Para(family)]
	if {$Para(arch) == "sa5p00g"} {
		set data_file [file join $Para(ipdir) sa5p00 gui "default5g.dat"]
	} else {
		set data_file [file join $Para(ipdir) sa5p00 gui "default.dat"]
	}
	#!load data file
	if [catch {open $data_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $data_file file!" \
			-title "Open file error" \
			-type ok
		return -1
	}

	seek $fileid 0 start
	set default_match 0
	set protocol $Para(PROTOCOL)
	while {[gets $fileid line] >= 0} {
		if {[string first "\[Default.$protocol\]" $line] == 0} {
			set default_match 1
			continue
		}
		if {[string first "\[" $line] == 0} {
			set default_match 0
		}
		if {$default_match == 1} {
			if [regexp {([^=]*)=(.*)} $line match parameter value] {
				if [regexp {([ |\t]*;)} $parameter match] {continue}
				if [regexp {(.*)[ |\t]*;} $value match temp] {
					set temp [string trimleft $temp '\"']
					set temp [string trimright $temp '\"']
					set Para($parameter) $temp
				} else {
					set value [string trimleft $value '\"']
					set value [string trimright $value '\"']
					set Para($parameter) $value
				}
			}
		}
	}
	set default_match 0
	close $fileid
	
	Para_Init
}

proc loadProtocolData {protocol} {
	global Para Attr_lst Val_lst

	set familyy [string tolower $Para(family)]
	if {$Para(arch) == "sa5p00g"} {
		set data_file [file join $Para(ipdir) sa5p00 gui "default5g.dat"]
	} else {
		set data_file [file join $Para(ipdir) sa5p00 gui "default.dat"]
	}
	#!load data file
	if [catch {open $data_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $data_file file!" \
			-title "Open file error" \
			-type ok
		return
	}

	set Attr_lst ""
	set Val_lst ""
	set protocol_match 0
	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[PROTOCOL.$protocol\]"] == 0} {
			set protocol_match 1
			continue
		}
		if {$protocol_match == 1} {
			#lind include [, another protocol
			if {[string first "\[" $line] != -1} {
				set protocol_match 0
				break
			}
			#line include & continue;
			if {[string first "&" $line] != -1} continue
			if [regexp {([^=]*)=(.*)} $line match parameter value] {
				if [regexp {([ |\t]*;)} $parameter match] {continue}
				if [regexp {(.*)[ |\t]*;} $value match temp] {
					#set Data($parameter) $temp
					lappend Attr_lst $parameter
					lappend Val_lst $temp					
				} else {
					#set Data($parameter) $value
					lappend Attr_lst $parameter
					lappend Val_lst $value					
				}
			}
		}
	}
	close $fileid
}

proc getDefaultList {attr} {
	global Para

	set familyy [string tolower $Para(family)]
	if {$Para(arch) == "sa5p00g"} {
		set data_file [file join $Para(ipdir) sa5p00 gui "default5g.dat"]
	} else {
		set data_file [file join $Para(ipdir) sa5p00 gui "default.dat"]
	}
	#!load data file
	if [catch {open $data_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $data_file file!" \
			-title "Open file error" \
			-type ok
		return -1
	}

	set default_match 0
	set attr_lst ""
	while {[gets $fileid line] >= 0} {
		if {[string first "\[Default\]" $line] == 0} {
			set default_match 1
			continue
		}
		if {$default_match == 1} {
			#lind include [, another protocol
			if {[string first "\[" $line] != -1} {
				set default_match 0
				break
			}
			#line include PROTOCOL= ;
			if {[string first "$attr=" $line] == 0} {
				set attr_lst [lindex [split $line "="] 1]
				break
			}
		}
	}
	close $fileid
	
	return $attr_lst
}

proc initDefaultSetting {} {
	global Para attribute_lst widget_lst
	
	#####! 1. enable all items			!#####
	#####! 2. get default value list	!#####
	#####! 3. set default value			!#####
	#####! 4. special items process.	!#####
	
	foreach attr $attribute_lst {
#		if {$attr == "RXCOUPLING"} continue
		set idx [lsearch $attribute_lst $attr]
		if {$idx != -1} {
	#####! 1. enable all items			!#####
			set w [lindex $widget_lst $idx]
			$w config -state normal
	#####! 2. get default value list	!#####
			set tmp_lst [getDefaultList $attr]
			set valid_val_lst [split [lindex [split $tmp_lst ";"] 0] "|"]
	#####! 3. set default value			!#####
			set default_value [lindex [split $tmp_lst ";"] 1]
			if {$attr == "PROTOCOL"} {continue}
			set Para($attr) $default_value
	#####! 4. special items process.	!#####
			if {$w == ".cbo$attr"} {
				$w clear list
				foreach v $valid_val_lst {$w insert list end $v}
			}
			if {$attr == "CH_MODE"} {
				.cboCH_MODE config -state normal
			}
#	tk_messageBox -default ok -icon warning -message $w=$attr=$default_value -title "test" -type ok
			set Para(${attr}_gray) false
			continue
		}
	}
}

proc CallDrawPins {} {
	global Para
	
	ParaSave
	#output pcs.lpc file for asbgen
	CreateDummyLpcFile
	
	DrawPins
}

proc ConfigCommaValue {} {
	global Para

	switch $Para(RXSC) {
		K28P5   {
			set Para(RXCOMMAA) 1010000011
			set Para(RXCOMMAB) 0101111100
			set Para(RXCOMMAM) 1111111111
		}		
		K28P157 {
			#set Para(RXCOMMAA) 1100000100
			#set Para(RXCOMMAB) 0011111000
			#set Para(RXCOMMAM) 1111111100
			set Para(RXCOMMAA) 0010000011
			set Para(RXCOMMAB) 0001111100
			set Para(RXCOMMAM) 0011111111
		}
	}
}

proc initCombineSetting {attr val} {
	global Para
	
	if {[string first "_" $val] != -1} {
		set k [string range $val 0 0]
		set byte [string range $val end-1 end]
	} else {
		set k [string range $val end-2 end-2]
		set byte [string range $val end-1 end]
	}
	set Para($attr) "$k $byte"
	append Para($attr) H
	switch $attr {
		"RXCTCBYTEN" {set Para(KBYTE0) $k; set Para(BYTE0) $byte}
		"RXCTCBYTEN1" {set Para(KBYTE1) $k; set Para(BYTE1) $byte}
		"RXCTCBYTEN2" {set Para(KBYTE2) $k; set Para(BYTE2) $byte}
		"RXCTCBYTEN3" {set Para(KBYTE3) $k; set Para(BYTE3) $byte}
#		"ACHARA" {set Para(KBYTEA) $k; set Para(BYTEA) $byte}
#		"ACHARB" {set Para(KBYTEB) $k; set Para(BYTEB) $byte}
#		"ACHARM" {set Para(KBYTEM) $k; set Para(BYTEM) $byte}
	}
}

proc initCheckbuttonSetting {w attr val} {
	global Para
	
	set onvalue [string tolower [$w cget -onvalue]]
	set offvalue [string tolower [$w cget -offvalue]]
	#tk_messageBox -default ok -icon warning -message $w=$attr=$val -title "test" -type ok
	#tk_messageBox -default ok -icon warning -message "$w=$val:onvalue=$onvalue;offvalue=$offvalue" -title "test" -type ok
	if {[string first "|" $val] == -1} {
		#! only one value
		set state [string tolower $val]
		if {$state == $offvalue || $state == $onvalue} {
			set Para($attr) $val
			set Para(${attr}_gray) true
			$w config -state disabled
		}
	} else {
		#! more than 1 value
		#! *************************************************
		#! cr_56754, Jamie's comment in email, 4/20/2012 - Re: Diamond 2.0 Beta Pri 0 CR's - Update 4/18/12
		#! The EFBWBEN has the value of Enabled first for CPRI.  Therefore it should be set in the GUI by default for CPRI.  
		#! Since Disabled is also a valid value for CPRI it should be possible to select Disabled.  If the EFBWBEN is not listed 
		#! in the protocol column, then you should default to Disabled as set by the UM default, but still allow the user to set it 
		#! to Enabled.  Only when you have EFBWBEN(Enabled) and nothing else should you force the control to Enabled and grey.
		
		#! Same rule is apply for other attributes
		#! *************************************************
		
	#tk_messageBox -default ok -icon warning -message $w=$attr=$val -title "initCheckbuttonSetting" -type ok
		set first_value [string tolower [lindex [split $val "|"] 0]]
		if {$first_value == $onvalue || $first_value == $offvalue} {
			set Para(${attr}_gray) false
			set Para($attr) [lindex [split $val "|"] 0]
		}
	}
}

proc initCH_MODEsetting {val} {
	global Para

	set val_lst {Disabled "Rx and Tx" "Rx Only" "Tx Only"}

	if {[string first "|" $val] == -1 && [lsearch $val_lst $val] == -1} {
		return
	}
	
	if {[string first "|" $val] == -1} {
		.cboCH_MODE clear list
		.cboCH_MODE insert list end $val
		set Para(CH_MODE) $val
	} else {
		.cboCH_MODE clear list
		set valid_val_lst [split $val "|"]
		foreach v $valid_val_lst {
			.cboCH_MODE insert list end $v
		}
		if {[lsearch $valid_val_lst $Para(CH_MODE)] == -1} {
			set Para(CH_MODE) [lindex $valid_val_lst 0]
		}
	}
	#tk_messageBox -default ok -icon warning -message "Para(CH_MODE)=$val" -title "test" -type ok
}

proc ProtocolSetting {protocol} {
	global Para Attr_lst Val_lst attribute_lst widget_lst
	
	#
	loadProtocolData $protocol
	#
	foreach attr $Attr_lst val $Val_lst {
		set idx [lsearch $attribute_lst $attr]
		if {$idx != -1} {
			set w [lindex $widget_lst $idx]
#	tk_messageBox -default ok -icon warning -message $w=$attr=$val -title "test" -type ok
			#! 1. * = all default
			if {[string first "*" $val] != -1} {
				set tmp_lst [getDefaultList $attr]
				set valid_val_lst [split [lindex [split $tmp_lst ";"] 0] "|"]
				if {$w == ".cbo$attr"} {
					$w clear list
					foreach v $valid_val_lst {$w insert list end $v}
					if {[lsearch $valid_val_lst $Para($attr)] == -1} {
						set Para($attr) [lindex $valid_val_lst 0]
					}
				}
				if {$w == ".cb$attr"} {
					$w config -state normal
				}
				if {$attr == "CH_MODE"} {
					.cboCH_MODE config -state normal
				}
				if {[string first "|" $val] != -1} {
					#! IO_TYPE=PCIe PIPE SR|*
					set default_val [lindex [split $val "|"] 0]
					set Para($attr) $default_val
					if {$attr == "IO_TYPE"} {IO_TYPEsetting $Para(IO_TYPE)}
				}
				continue
			}
			#! 2. include |, value list.
			if {[string first "|" $val] != -1} {
				set valid_val_lst [split $val "|"]
				if {$w == ".cbo$attr"} {
					$w clear list
					foreach v $valid_val_lst {$w insert list end $v}
					if {[lsearch $valid_val_lst $Para($attr)] == -1} {
						set Para($attr) [lindex $valid_val_lst 0]
					}
				}
				if {$w == ".cb$attr"} {
					$w config -state normal
					initCheckbuttonSetting $w $attr $val
				}
				if {$attr == "CH_MODE"} {
					initCH_MODEsetting $val
				}
				continue
			} else {
			#! 3. only one value, gray out.
				set combine_lst {RXCTCBYTEN RXCTCBYTEN1 RXCTCBYTEN2 RXCTCBYTEN3 ACHARA ACHARB ACHARM}
				if {[lsearch $combine_lst $attr] != -1} {
					if {[string first "value" $val] != -1} continue
#	tk_messageBox -default ok -icon warning -message $w=$attr=$val -title "test" -type ok
					initCombineSetting $attr $val
				}
				if {$w == ".cbo$attr"} {
					set DATA_WIDTH_lst {8/10-Bit 16/20-Bit 32/40-Bit}
					set MACO_DATA_WIDTH_lst {X1 X2 X4}
					if {[lsearch $MACO_DATA_WIDTH_lst $val] != -1} {set val [lindex $DATA_WIDTH_lst [lsearch $MACO_DATA_WIDTH_lst $val]]}
					$w clear list
					$w insert list end $val
					set Para($attr) $val
				}
				if {$w == ".cb$attr"} {
					initCheckbuttonSetting $w $attr $val
				}
				if {$attr == "CH_MODE"} {
					initCH_MODEsetting $val
				}
				if {$w == ".entry$attr"} {
					if {[lsearch {MAX_RATE CDR_MAX_RATE} $attr] != -1} {
#	tk_messageBox -default ok -icon warning -message $w=$attr=$val -title "test" -type ok
						if {$Para(MACO_GUI_flag) == "false"} {
							set Para($attr) $val
						}
					}
				}
				continue
			}
		}
	}
}

proc initProtocolSetting {} {
	global Para
	
	ProtocolSetting $Para(PROTOCOL)
}

proc initIO_TYPEsetting {} {
	global Para
	
	IO_TYPEsetting $Para(IO_TYPE)
}

proc GrayOutItems {} {
	global Para
	
	set a_lst {TXINVPOL TX8B10B TXFIFO_ENABLE RXINVPOL RX8B10B RXFIFO_ENABLE RXLSM RXWA RXSC RXCOMMAA RXCOMMAB RXCOMMAM \
		RXCTC RXCTCMATCHPATTERN RXCTCBYTEN RXCTCBYTEN1 RXCTCBYTEN2 RXCTCBYTEN3 RXMCAENABLE ACHARA ACHARB ACHARM \
		LOOPBACK RCSRC LOSPORT CDRLOLACTION}

	set w_lst {.cboTXINVPOL .cbTX8B10B .cboTXFIFO_ENABLE .cboRXINVPOL .cbRX8B10B .cboRXFIFO_ENABLE .cbRXLSM .cboRXWA .cboRXSC .entryRXCOMMAA .entryRXCOMMAB .entryRXCOMMAM \
		.cbRXCTC .cboRXCTCMATCHPATTERN .cbKBYTE0 .cbKBYTE1 .cbKBYTE2 .cbKBYTE3 .cbRXMCAENABLE .cbKBYTEA .cbKBYTEB .cbKBYTEM \
		.cboLOOPBACK .cboRCSRC .cboLOSPORT .cboCDRLOLACTION}
		
	foreach attr $a_lst {
		set idx [lsearch $a_lst $attr]
		if {$idx != -1} {
			set w [lindex $w_lst $idx]
			if {$Para(${attr}_gray) == "true"} {
				$w config -state disabled
			}
		}
	}
}

proc initSDI027Config {} {
	global Para
	
	if {$Para(PROTOCOL) == "SDI" && $Para(TX_LINE_RATE) == "0.27" && $Para(RX_LINE_RATE) == "0.27"} {
		#set Para(TXAMPLITUDE) "0"
		#set Para(TXDIFFTERM) "75 ohms"
	}
	if {$Para(PROTOCOL) == "SDI" && $Para(TX_LINE_RATE) == "2.97" && $Para(RX_LINE_RATE) == "2.97"} {
		#set Para(TXAMPLITUDE) "0"
		#set Para(TXDIFFTERM) "50 ohms"
	}
	CallDrawPins
}

proc ChangeValueCmd {} {
	global Para	
	
	# add new scope for edp	
	if {$Para(arch) == "sa5p00g"} {
		.lbl2TX_MAX_RATE config -text "(0.27 - 5.0) Gbps"
		.lbl2CDR_MAX_RATE config -text "(0.27 - 5.0) Gbps"	
	} else {
		if {$Para(PROTOCOL) == "eDP"} {	
			.lbl2TX_MAX_RATE config -text "(0.27 - 3.24) Gbps"
			.lbl2CDR_MAX_RATE config -text "(0.27 - 3.24) Gbps"		
		} else {
			.lbl2TX_MAX_RATE config -text "(0.27 - 3.125) Gbps"
			.lbl2CDR_MAX_RATE config -text "(0.27 - 3.125) Gbps"	
		}
	}
	
	.cboPROTOCOL clear list
	set tmp_lst [getDefaultList PROTOCOL]
	set PROTOCOL_lst [split [lindex [split $tmp_lst ";"] 0] "|"]
	foreach x $PROTOCOL_lst {
		#[SCR_1047] 25K only has 2 channels, only for x1 and x2
		if {$Para(dev_type) == "25" && $x == "XAUI"} {continue}
		
		if {$Para(MACO_GUI_flag) == "false"} {
			if {[string first "MACO" $x] == -1} {
				.cboPROTOCOL insert list end $x
			}
		} else {
			.cboPROTOCOL insert list end $x
		}
	}
	if {[lsearch $PROTOCOL_lst $Para(PROTOCOL)] == -1} {set Para(PROTOCOL) [lindex $PROTOCOL_lst 0]}	
	
	set rx_options {.entryCDR_MAX_RATE .cboCDR_MULT .cboRX_RATE_DIV .cboRX_DATA_WIDTH .cbRXLDR .cboCDRLOLRANGE \
		.cboRXDIFFTERM .cboRXCOUPLING .cboLEQ .cboRXLOSTHRESHOLD \
		.cboRXINVPOL .cbRX8B10B .cboRXFIFO_ENABLE .cbRXLSM .cboRXWA .cboRXSC .entryRXCOMMAA .entryRXCOMMAB .entryRXCOMMAM \
		.cbRXCTC .cboRXCTCMATCHPATTERN .cbKBYTE0 .cbKBYTE1 .cbKBYTE2 .cbKBYTE3 .cbRXMCAENABLE .cbKBYTEA .cbKBYTEB .cbKBYTEM \
		.entryBYTE0 .entryBYTE1 .entryBYTE2 .entryBYTE3 .entryBYTEA .entryBYTEB .entryBYTEM .cboPPORT_RX_RDY .entryPWAIT_RX_RDY}
		
	set tx_options {.entryTX_MAX_RATE .cboTXPLLMULT .cboTXPLLLOLTHRESHOLD .cboTX_RATE_DIV .cboTX_DATA_WIDTH .cbTXLDR \
		.entryTXAMPLITUDE .cboTXDIFFTERM .cboTXDEPRE .cboTXDEPOST \
		.cboTXINVPOL .cbTX8B10B .cboTXFIFO_ENABLE .cboPPORT_TX_RDY .entryPWAIT_TX_RDY}
	
	#[SCR_1047] 25K only has 2 channels, only for x1 and x2
	if {$Para(dev_type) == "25"} {
		if {[.cboNUM_CHS size] > 1} {
			#set size [.cboNUM_CHS size]
			set curselection [.cboNUM_CHS getcurselection]
			if {[.cboNUM_CHS get end] == "4"} {
				.cboNUM_CHS delete list end end
				if {$curselection == "4"} {	set Para(NUM_CHS) [.cboNUM_CHS get 0]}
			}
		}
	}
	
	if {$Para(CH_MODE) == "Disabled"} {
		foreach w $rx_options {
			$w config -state disabled
		}
		foreach w $tx_options {
			$w config -state disabled
		}
	}	
	if {$Para(CH_MODE) == "Tx Only"} {
		foreach w $rx_options {
			$w config -state disabled
		}
		foreach w $tx_options {
			$w config -state normal
		}
	}	
	if {$Para(CH_MODE) == "Rx Only"} {
		foreach w $tx_options {
			$w config -state disabled
		}
		foreach w $rx_options {
			$w config -state normal
		}
	}	
	if {$Para(CH_MODE) == "Rx and Tx"} {
		foreach w $tx_options {
			$w config -state normal
		}
		foreach w $rx_options {
			$w config -state normal
		}
	}	
	
	if {$Para(MACO_GUI_flag) == "true"} {
		.cboPROTOCOL config -state disabled
		.cboNUM_CHS  config -state disabled
		.cboCH_MODE config -state disabled
		.entryTX_MAX_RATE config -state disabled
		.entryCDR_MAX_RATE config -state disabled
	}
	
	#calculate bus freq based on Rate, div and data width.
	
	set RATE_lst {"Full Rate" "Div2 Rate" "Div11 Rate"}
	set rdiv_lst {1 2 11}

	set DATA_WIDTH_lst {8/10-Bit 16/20-Bit}
	set wdiv_lst {10 20}

	set MACO_DATA_WIDTH_lst {X1 X2}

	set CDR_MULT_lst {8X 10X 16X 20X 25X}
	set mdiv_lst {8 10 16 20 25}

	#disable calculated items.
	.entryREFCLK_RATE config -state disabled
	.entryCDR_REF_RATE config -state disabled
	.entryRX_LINE_RATE config -state disabled
	.entryRX_FICLK_RATE config -state disabled
	.entryTX_LINE_RATE config -state disabled
	.entryTX_FICLK_RATE config -state disabled
	
	set txpllmult [lindex $mdiv_lst [lsearch $CDR_MULT_lst $Para(TXPLLMULT)]]
	if {[string length $Para(TX_MAX_RATE)] > 0 && $Para(TX_MAX_RATE) != "." && $Para(TX_MAX_RATE) != "-" && $Para(TX_MAX_RATE) != "-." && $Para(TX_MAX_RATE) != "+" && $Para(TX_MAX_RATE) != "+."} {
		set Para(REFCLK_RATE) [expr $Para(TX_MAX_RATE)*1000.0/$txpllmult]
		set Para(REFCLK_RATE) [format "%.4f" $Para(REFCLK_RATE)]
	} else {
		set Para(REFCLK_RATE) 0
	}

	set mdiv [lindex $mdiv_lst [lsearch $CDR_MULT_lst $Para(CDR_MULT)]]
	set rdiv [lindex $rdiv_lst [lsearch $RATE_lst $Para(RX_RATE_DIV)]]
	set wdiv [lindex $wdiv_lst [lsearch $DATA_WIDTH_lst $Para(RX_DATA_WIDTH)]]
	if {$Para(PROTOCOL) == "8BSER"} {
		set wdiv [expr $wdiv * 0.8]
	}
	if {[string length $Para(CDR_MAX_RATE)] > 0 && $Para(CDR_MAX_RATE) != "." && $Para(CDR_MAX_RATE) != "-" && $Para(CDR_MAX_RATE) != "-." && $Para(CDR_MAX_RATE) != "+" && $Para(CDR_MAX_RATE) != "+."} {
		set Para(CDR_REF_RATE) [expr $Para(CDR_MAX_RATE) * 1000.0 / $mdiv]
		set Para(CDR_REF_RATE) [format "%.4f" $Para(CDR_REF_RATE)]
		set Para(RX_LINE_RATE) [expr $Para(CDR_MAX_RATE) * 1.0 / $rdiv]
		set Para(RX_LINE_RATE) [format "%.4f" $Para(RX_LINE_RATE)]
		#tk_messageBox -default ok -icon warning -message $Para(RX_LINE_RATE) -title "CheckParameter" -type ok
		#if {$Para(PROTOCOL) == "CPRI"} {
		#	.cboRX_DATA_WIDTH clear list
		#	if {$Para(RX_LINE_RATE) <= "2.4576"} {
		#		.cboRX_DATA_WIDTH insert list end "8/10-Bit"
		#		set Para(RX_DATA_WIDTH) "8/10-Bit"
		#	} else {
		#		.cboRX_DATA_WIDTH insert list end "16/20-Bit"
		#		set Para(RX_DATA_WIDTH) "16/20-Bit"
		#	}
		#	set wdiv [lindex $wdiv_lst [lsearch $DATA_WIDTH_lst $Para(RX_DATA_WIDTH)]]
		#}
		set Para(RX_FICLK_RATE) [expr $Para(CDR_MAX_RATE) * 1000.0 / $wdiv / $rdiv]
		set Para(RX_FICLK_RATE) [format "%.4f" $Para(RX_FICLK_RATE)]
	} else {
		set Para(CDR_REF_RATE) 0
		set Para(RX_LINE_RATE) 0
		set Para(RX_FICLK_RATE) 0
	}

	set rdiv [lindex $rdiv_lst [lsearch $RATE_lst $Para(TX_RATE_DIV)]]
	set wdiv [lindex $wdiv_lst [lsearch $DATA_WIDTH_lst $Para(TX_DATA_WIDTH)]]
	if {$Para(PROTOCOL) == "8BSER"} {
		set wdiv [expr $wdiv * 0.8]
	}
	if {[string length $Para(TX_MAX_RATE)] > 0 && $Para(TX_MAX_RATE) != "." && $Para(TX_MAX_RATE) != "-" && $Para(TX_MAX_RATE) != "-." && $Para(TX_MAX_RATE) != "+" && $Para(TX_MAX_RATE) != "+."} {
		set Para(TX_LINE_RATE) [expr $Para(TX_MAX_RATE) * 1.0 / $rdiv]
		set Para(TX_LINE_RATE) [format "%.4f" $Para(TX_LINE_RATE)]
		#if {$Para(PROTOCOL) == "CPRI"} {
		#	.cboTX_DATA_WIDTH clear list
		#	if {$Para(TX_LINE_RATE) <= "2.4576"} {
		#		.cboTX_DATA_WIDTH insert list end "8/10-Bit"
		#		set Para(TX_DATA_WIDTH) "8/10-Bit"
		#	} else {
		#		.cboTX_DATA_WIDTH insert list end "16/20-Bit"
		#		set Para(TX_DATA_WIDTH) "16/20-Bit"
		#	}
		#	set wdiv [lindex $wdiv_lst [lsearch $DATA_WIDTH_lst $Para(TX_DATA_WIDTH)]]
		#}		
		set Para(TX_FICLK_RATE) [expr $Para(TX_MAX_RATE) * 1000.0 / $wdiv / $rdiv]
		set Para(TX_FICLK_RATE) [format "%.4f" $Para(TX_FICLK_RATE)]
	} else {
		set Para(TX_LINE_RATE) 0
		set Para(TX_FICLK_RATE) 0
	}

	#The CTC group should be grey¡¯d out when the CTC is grey¡¯d out or disabled. 
	set ctc_options_lst {.cboRXCTCMATCHPATTERN .cbKBYTE0 .cbKBYTE1 .cbKBYTE2 .cbKBYTE3 .entryBYTE0 .entryBYTE1 .entryBYTE2 .entryBYTE3}
	if {$Para(CH_MODE) != "Tx Only"} {
		if {[.cbRXCTC cget -state] != "normal" || $Para(RXCTC) == "Disabled"} {
			foreach w $ctc_options_lst {
				$w config -state disabled
			}
		}
	}

	#The Multi-Channel Alignment group should be grey¡¯d out when the MCA is grey¡¯d out or disabled.
	set mca_options_lst {.cbKBYTEA .cbKBYTEB .cbKBYTEM .entryBYTEA .entryBYTEB .entryBYTEM}
	if {$Para(CH_MODE) != "Tx Only"} {
		if {[.cbRXMCAENABLE cget -state] != "normal" || $Para(RXMCAENABLE) == "Disabled"} {
			foreach w $mca_options_lst {
				$w config -state disabled
			}
		}
	}
	
	#config Comma
	if {[.cboRXSC cget -state] == "normal"} {
		if {$Para(RXSC) == "User Defined"} {
			.entryRXCOMMAA config -state normal
			.entryRXCOMMAB config -state normal
			.entryRXCOMMAM config -state normal
		} else {
			.entryRXCOMMAA config -state disabled
			.entryRXCOMMAB config -state disabled
			.entryRXCOMMAM config -state disabled
			ConfigCommaValue
		}
	}
	
	GrayOutItems
	
	#Cindy: Reset Sequence Select is grayed out based on Saphhire EAPR beta release criteria rev-C 
	#set Para(RSTSEQSEL) "None"
	#.cboRSTSEQSEL config -state disabled	
	if {$Para(RSTSEQSEL) == "Disabled"} {
		.cboPPORT_TX_RDY config -state disabled
		.cboPPORT_RX_RDY config -state disabled
		
		.entryPWAIT_TX_RDY config -state disabled
		.entryPWAIT_RX_RDY config -state disabled
	} else {
		if {$Para(PPORT_TX_RDY) == "Disabled"} {
			.entryPWAIT_TX_RDY config -state disabled
		}
		if {$Para(PPORT_RX_RDY) == "Disabled"} {
			.entryPWAIT_RX_RDY config -state disabled
		}
	}	
#	return
	
	CallDrawPins
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
	if {$Para(PROTOCOL) == "MACO_XMAC"} {
		if {$Para(NUM_CHS) != "4"} {
			set msg "MACO_XMAC must have 4 channels always!"
			tk_messageBox -default ok -icon warning -message $msg -title "CheckParameter" -type ok
			return -1
		}
	}
	set Para(max_rate_min) 0.27
	set Para(max_rate_max) 3.125
	
	if {$Para(arch) == "sa5p00g"} {
		set Para(max_rate_max) 5.0
	} else {
		# add new scope for edp
		if {$Para(PROTOCOL) == "eDP"} {
			set Para(max_rate_max) 3.24
		}
	}
	set ret [IsInRange "Tx Max Data Rate" $Para(max_rate_min) $Para(max_rate_max) $Para(TX_MAX_RATE)]
	if {$ret == "-1"} {return -1}
	set ret [IsInRange "Receive Max Data Rate (CDR)" $Para(max_rate_min) $Para(max_rate_max) $Para(CDR_MAX_RATE)]
	if {$ret == "-1"} {return -1}
	
	if {[.entryBYTE0 cget -state] == "normal"} {
		if {[string length $Para(BYTE0)] != "2"} {
			set msg "Please input Byte N!"
			tk_messageBox -default ok -icon warning -message $msg -title "CheckParameter" -type ok
			return -1
		}
	}
	foreach i {1 2 3} {
		if {[.entryBYTE$i cget -state] == "normal"} {
			if {[string length $Para(BYTE$i)] != "2"} {
				set msg "Please input Byte N+$i!"
				tk_messageBox -default ok -icon warning -message $msg -title "CheckParameter" -type ok
				return -1
			}
		}
	}
	foreach i {A B M} {
		if {[.entryBYTE$i cget -state] == "normal"} {
			if {[string length $Para(BYTE$i)] != "2"} {
				#set msg "Please input Alignment Character $i!"
				#tk_messageBox -default ok -icon warning -message $msg -title "CheckParameter" -type ok
				#return -1
			}
		}
	}

	if {[.entryPWAIT_TX_RDY cget -state] == "normal"} {
		set ret [IsInRange "Tx Ready Wait Time" 4 4095 $Para(PWAIT_TX_RDY)]
		if {$ret == "-1"} {return -1}
	}
	if {[.entryPWAIT_RX_RDY cget -state] == "normal"} {
		set ret [IsInRange "Rx Ready Wait Time" 4 4095 $Para(PWAIT_RX_RDY)]
		if {$ret == "-1"} {return -1}
	}
	
	set ret [IsInRange "Differential Amplitude" 100 1300 $Para(TXAMPLITUDE)]
	if {$ret == "-1"} {return -1}
	
	set AmplitudeValue [expr int(fmod($Para(TXAMPLITUDE),100))]
	
	set ret [IsInList1 "Differential Amplitude" {0 20 40 60 80} $AmplitudeValue]
	if {$ret == -1} {
		return -1
	}
	
	ParaSave
	CreateDummyLpcFile
	set ret [GetDummyAsbPorts]
	if {$ret == -1} {
		tk_messageBox -default ok -icon warning -message $Para(scuba_error_msg) -title "CheckParameter" -type ok
		return -1
	}

	return 0
}

proc OutputGenerateFile {} {
	global Para

	set generate_file [file join $Para(ProjectPath) "generate_core.tcl"]

	if [catch {open $generate_file w} outputfile] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $generate_file file!" \
			-title "Generate error" \
			-type ok
		return -1
	}

	puts $outputfile "#!/usr/local/bin/wish\n"
#	puts $outputfile "if \{\$argc > 0\} \{"
#	puts $outputfile "\tset asbgen \[lindex \$argv 0\]"
#	puts $outputfile "\tset modulename \[lindex \$argv 1\]"
#	puts $outputfile "\tset lang \[lindex \$argv 2\]"
#	puts $outputfile "\tset lpcfile \[lindex \$argv 3\]"
	puts $outputfile "set asbgen \"$Para(Asbgen_Engine)\""
	puts $outputfile "set modulename \"$Para(ModuleName)\""
	puts $outputfile "set lang \"$Para(SourceFormat)\""
	set lpc_file [file join $Para(ProjectPath) $Para(ModuleName).lpc]
	puts $outputfile "set lpcfile \"$lpc_file\""
	
	puts $outputfile "set Para(result) \[catch \{eval exec \$asbgen -n \$modulename -lang \$lang -fp \$lpcfile\} msg\]"
	puts $outputfile "#puts \$msg"
#	puts $outputfile "\}"
	
	close $outputfile	
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

	ParaSave
	
	CreateGenerateFile
	
	set out_msg "\tModule Name: $Para(ModuleName)\n\tCore Name: $Para(CoreName)\n\tLPC file : $Para(ModuleName).lpc"
	append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"

	return $out_msg
}

#PCS setting via MACO.
proc PcsSettingViaMACO {} {
	global Para

	if {$Para(MACO_GUI_flag) == "true"} {
		
#tk_messageBox -default ok -icon warning -message Para(MACO_PROTOCOL)=$Para(MACO_PROTOCOL) -title PcsSettingViaMACO -type ok
		set Para(PROTOCOL) $Para(MACO_PROTOCOL)
		set Para(NUM_CHS) $Para(MACO_NUM_CHS)
		set Para(CH_MODE) $Para(CH_MODE)
		set Para(MAX_RATE) $Para(MACO_MAX_RATE)
		set Para(CDR_MAX_RATE) $Para(MACO_MAX_RATE)
		
		switch $Para(MACO_PROTOCOL) {
			"MACO_SRIO" -
			"MACO_SRIOX1" -
			"MACO_SRIOXN" {
				#set Para(PROTOCOL) $Para(MACO_PROTOCOL)
				#set Para(NUM_CHS) $Para(MACO_NUM_CHS)
				set Para(CH_MODE) "Rx and Tx"
				#set Para(MAX_RATE) $Para(MACO_MAX_RATE)
				#set Para(CDR_MAX_RATE) $Para(MACO_MAX_RATE)
				#.cboPROTOCOL config -state disabled
				#.cboNUM_CHS  config -state disabled
				#.rdo1CH_MODE config -state disabled
				#.rdo2CH_MODE config -state disabled
				#.rdo3CH_MODE config -state disabled
				#.entryMAX_RATE config -state disabled
			}
			"MACO_XMAC" {
				#set Para(PROTOCOL) "MACO_XMAC"
				set Para(NUM_CHS) 4
				set Para(CH_MODE) "Rx and Tx"
				#set Para(MAX_RATE) $Para(MACO_MAX_RATE)
				#set Para(CDR_MAX_RATE) $Para(MACO_MAX_RATE)
				#.cboPROTOCOL config -state disabled
				#.cboNUM_CHS  config -state disabled
				#.rdo1CH_MODE config -state disabled
				#.rdo2CH_MODE config -state disabled
				#.rdo3CH_MODE config -state disabled
				#.entryMAX_RATE config -state disabled
			}
			"MACO_EMAC" {
				#set Para(PROTOCOL) "MACO_EMAC"
				set Para(NUM_CHS) 1
				set Para(CH_MODE) "Rx and Tx"
				#set Para(MAX_RATE) $Para(MACO_MAX_RATE)
				#set Para(CDR_MAX_RATE) $Para(MACO_MAX_RATE)
				#.cboPROTOCOL config -state disabled
				#.cboNUM_CHS  config -state disabled
				#.rdo1CH_MODE config -state disabled
				#.rdo2CH_MODE config -state disabled
				#.rdo3CH_MODE config -state disabled
				#.entryMAX_RATE config -state disabled
			}
			"MACO_PCIE" -
			"MACO_PCIEX1" -
			"MACO_PCIEXN" {
				#set Para(PROTOCOL) $Para(MACO_PROTOCOL)
				#set Para(NUM_CHS) $Para(MACO_NUM_CHS)
				#set Para(CH_MODE) $Para(CH_MODE)
				#set Para(MAX_RATE) $Para(MACO_MAX_RATE)
				#set Para(CDR_MAX_RATE) $Para(MACO_MAX_RATE)
				#.cboPROTOCOL config -state disabled
				#.cboNUM_CHS  config -state disabled
				#.rdo1CH_MODE config -state disabled
				#.rdo2CH_MODE config -state disabled
				#.rdo3CH_MODE config -state disabled
				#.entryMAX_RATE config -state disabled
			}
			default {
				set Para(PROTOCOL) $Para(MACO_PROTOCOL)
				set Para(NUM_CHS) $Para(MACO_NUM_CHS)
				set Para(CH_MODE) $Para(CH_MODE)
				set Para(TX_MAX_RATE) $Para(MACO_MAX_RATE)
				set Para(CDR_MAX_RATE) $Para(MACO_MAX_RATE)
				#.cboPROTOCOL config -state disabled
				#.cboNUM_CHS  config -state disabled
				#.entryTX_MAX_RATE config -state disabled
				#.entryCDR_MAX_RATE config -state disabled
			}
		}
	}
}

#************** import SRV file (start) *********** #
proc CheckParaInSRVFile {attr val} {
	global Para attribute_lst
	
	if {[lsearch $attribute_lst $attr] != -1} {
		set tmp_lst [getDefaultList $attr]
		set valid_value_lst [split [lindex [split $tmp_lst ";"] 0] "|"]
		if {[lsearch $valid_value_lst $val] == -1} {
			set msg "$attr=$val is invalid. Ignore this setting."
			set title "Import Reveal SERDES Analyzer Setting"
			tk_messageBox -default ok -icon warning -message $msg -title $title -type ok
			return
		}
		set Para($attr) $val
	}
}

proc LoadSRVFileDataCmd {} {
	global Para
	
	set section $Para(DCU)$Para(Channel)
	set srv_file $Para(SRVFile)
	
	#!load data file
	if [catch {open $srv_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $srv_file file!" \
			-title "Open file error" \
			-type ok
		return -1
	}

	set section_match 0
	while {[gets $fileid line] >= 0} {
		if {[string first "\[$section\]" $line] == 0} {
			set section_match 1
			continue
		}
		if {$section_match == 1} {
			if {[string first "\[" $line] != -1} {
				set section_match 0
				break
			}
			if [regexp {([^=]*)=(.*)} $line match parameter value] {
				if [regexp {([ |\t]*;)} $parameter match] {continue}
				if [regexp {(.*)[ |\t]*;} $value match temp] {
					set temp [string trimleft $temp '\"']
					set temp [string trimright $temp '\"']
					#set Para($parameter) $temp
					CheckParaInSRVFile $parameter $temp
				} else {
					set value [string trimleft $value '\"']
					set value [string trimright $value '\"']
					#set Para($parameter) $value
					CheckParaInSRVFile $parameter $value
				}
			}
		}
	}
	close $fileid
	
	ChangeValueCmd
}

proc selectSRVFileCmd {} {
	global Para
	
	set srv_types {
		{"SRV files"		{.srv}	}
	}

	set Para(SRVFilePath) $Para(ProjectPath)
	if {[string length $Para(SRVFile)] > 0} {
		set Para(SRVFilePath) [file dirname $Para(SRVFile)]
	}
	set ret [tk_getOpenFile -filetypes $srv_types -initialdir $Para(SRVFilePath)]
	if {$ret != "" }  {
		set Para(SRVFile) $ret
	} 
}

proc ImportSRVFile {} {
	global Para

	set Para(DCU) D0
	set Para(Channel) CH0
	set w 10
	
	catch [destroy .d]
	iwidgets::dialogshell .d

	.d add ok -text "OK" -command {
		set ret [LoadSRVFileDataCmd]
		if {$ret == -1} {
			return
		} else {
			.d deactivate
		}
	}
	.d add cancel -text "Cancel" -command {.d deactivate}
	.d default ok
	
	set win [.d childsite]
	set frmImport [frame $win.frmImport]
	label $frmImport.lblImport -text "Import File:" -width $w -anchor e
	iwidgets::entryfield $frmImport.entImport -width 30 -textvariable Para(SRVFile)
	
	button $frmImport.btnImport -text "..." -width 2 -command {selectSRVFileCmd}
	pack $frmImport.lblImport $frmImport.entImport $frmImport.btnImport -side left -padx 2
	
	set frmQuad [frame $win.frmQuad]
	label $frmQuad.lblQuad -text "DCU:" -width $w -anchor e
	radiobutton $frmQuad.rdo0Quad -text D0 -width 4 -value D0 -variable Para(DCU) -anchor w -command {}
	radiobutton $frmQuad.rdo1Quad -text D1 -width 4 -value D1 -variable Para(DCU) -anchor w -command {}
	pack $frmQuad.lblQuad $frmQuad.rdo0Quad $frmQuad.rdo1Quad -side left -padx 2
	
	set frmChannel [frame $win.frmChannel]
	label $frmChannel.lblChannel -text "Channel:" -width $w -anchor e
	radiobutton $frmChannel.rdo0Channel -text CH0 -width 4 -value CH0 -variable Para(Channel) -anchor w -command {}
	radiobutton $frmChannel.rdo1Channel -text CH1 -width 4 -value CH1 -variable Para(Channel) -anchor w -command {}
	pack $frmChannel.lblChannel $frmChannel.rdo0Channel $frmChannel.rdo1Channel -side left -padx 2
	
	pack $frmImport $frmQuad $frmChannel -side top -anchor w -pady 2
	#pack $win -fill x
	
    .d configure -modality application -title "Import Reveal SERDES Analyzer Setting"
	.d center
    .d activate
}
#************** import SRV file (end) *********** #

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	set Para(DOUBLE_QUOTES_IN_LPC_flag) Enabled
	
	ProjectSet
	MainInterface
	AttributeSetting 620 660
	set pin_flag MACO
	DrawImage 300 480 1.3
	set tnb $Para(tnb)

	#*** Here for user to add extra pages ***
	GetDevType
	RestoreProtocolCB
	Para_Init
	
	set w 26
	#*** Instance Setup ***
	set page0 [$tnb add -label "Instance Setup"]

	#Instance Protocol
	iwidgets::labeledframe .frmInstance -labeltext "Instance Protocol" -labelpos nw
	set frmInstance [.frmInstance childsite]
	set PROTOCOL_lst {G8B10B PCIe GbE SGMII XAUI SDI SRIO CPRI JESD204 10BSER 8BSER eDP}
	CreateLabelCombobox $frmInstance PROTOCOL "Protocol" $w 16 Para(PROTOCOL) $PROTOCOL_lst {initDefaultSetting;initProtocolSetting;loadDefaultPerProtocl;ChangeValueCmd}
	.lblPROTOCOL config -anchor w
	set NUM_CHS_lst {1 2 4}
	CreateLabelCombobox $frmInstance NUM_CHS "Number of Channels" $w 8 Para(NUM_CHS) $NUM_CHS_lst {initProtocolSetting;ChangeValueCmd}
	.lblNUM_CHS config -anchor w
	set CH_MODE_lst {Disabled "Rx and Tx" "Rx Only" "Tx Only"}
	CreateLabelCombobox $frmInstance CH_MODE "Mode" $w 16 Para(CH_MODE) $CH_MODE_lst {ChangeValueCmd}
	.lblCH_MODE config -anchor w
	
	#TxPLL
	iwidgets::labeledframe .frmTxPLL -labeltext "TxPLL" -labelpos nw
	set frmTxPLL [.frmTxPLL childsite]
	CreateLabelEntryLabel $frmTxPLL TX_MAX_RATE "Tx Max Data Rate" 10 "Gbps" "" Para(TX_MAX_RATE) real
	.lblTX_MAX_RATE config -width $w -anchor w
	.lbl2TX_MAX_RATE config -text "(0.27 - 3.125) Gbps"
	.entryTX_MAX_RATE.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	CreateLabelCombobox $frmTxPLL TXPLLMULT "PLL Multiplier" $w 10 Para(TXPLLMULT) {8X 10X 16X 20X 25X} {ChangeValueCmd}
	.lblTXPLLMULT config -width $w -anchor w
	CreateLabelEntryLabel $frmTxPLL REFCLK_RATE "Ref Clk Freq" 10 "MHz" "" Para(REFCLK_RATE) real
	.lblREFCLK_RATE config -width $w -anchor w
	.entryREFCLK_RATE config -state disabled
	CreateLabelCombobox $frmTxPLL TXPLLLOLTHRESHOLD "Loss Of Lock Setting" $w 8 Para(TXPLLLOLTHRESHOLD) {0 1 2 3} {ChangeValueCmd}
	.lblTXPLLLOLTHRESHOLD config -anchor w
	
	#Receive
	iwidgets::labeledframe .frmInstRx -labeltext "Receive" -labelpos nw
	set frmInstRx [.frmInstRx childsite]
	CreateLabelEntryLabel $frmInstRx CDR_MAX_RATE "Receive Max Data Rate (CDR)" 10 "Gbps" "" Para(CDR_MAX_RATE) real
	.lblCDR_MAX_RATE config -width $w -anchor w
	.lbl2CDR_MAX_RATE config -text "(0.27 - 3.125) Gbps"
	.entryCDR_MAX_RATE.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
		}
	CreateLabelCombobox $frmInstRx CDR_MULT "CDR Multiplier" $w 10 Para(CDR_MULT) {8X 10X 16X 20X 25X} {ChangeValueCmd}
	.lblCDR_MULT config -width $w -anchor w
	set RX_RATE_lst {"Full Rate" "Div2 Rate" "Div11 Rate"}
	CreateLabelCombobox $frmInstRx RX_RATE_DIV "Rx Rate" $w 16 Para(RX_RATE_DIV) $RX_RATE_lst {ChangeValueCmd;initSDI027Config}
	.lblRX_RATE_DIV config -anchor w
	CreateLabelEntryLabel $frmInstRx CDR_REF_RATE "CDR Refclk" 10 "MHz" "" Para(CDR_REF_RATE) real
	.lblCDR_REF_RATE config -width $w -anchor w
	.entryCDR_REF_RATE config -state disabled
	CreateLabelEntryLabel $frmInstRx RX_LINE_RATE "Rx Line Rate" 10 "Gbps" "" Para(RX_LINE_RATE) real
	.lblRX_LINE_RATE config -width $w -anchor w
	.entryRX_LINE_RATE config -state disabled
	set RX_DATA_WIDTH_lst {8/10-Bit 16/20-Bit}
	CreateLabelCombobox $frmInstRx RX_DATA_WIDTH "Rx FPGA Bus Width" $w 16 Para(RX_DATA_WIDTH) $RX_DATA_WIDTH_lst {ChangeValueCmd}
	.lblRX_DATA_WIDTH config -anchor w
	CreateLabelEntryLabel $frmInstRx RX_FICLK_RATE "Rx FPGA Bus Freq" 10 "MHz" "" Para(RX_FICLK_RATE) real
	.lblRX_FICLK_RATE config -width $w -anchor w
	.entryRX_FICLK_RATE config -state disabled
	checkbutton .cbRXLDR -text "Rx Low Data Rate Path" -variable Para(RXLDR) -onvalue On -offvalue Off -command {ChangeValueCmd}
	pack .cbRXLDR -in $frmInstRx -padx 10 -anchor w
	set CDRLOLRANGE_lst {0 1 2 3}
	CreateLabelCombobox $frmInstRx CDRLOLRANGE "CDR Loss of Lock Range" 25 8 Para(CDRLOLRANGE) $CDRLOLRANGE_lst {ChangeValueCmd}
	.lblCDRLOLRANGE config -width $w -anchor w
	
	#Transmit
	iwidgets::labeledframe .frmInstTx -labeltext "Transmit" -labelpos nw
	set frmInstTx [.frmInstTx childsite]
	set TX_RATE_lst {"Full Rate" "Div2 Rate" "Div11 Rate"}
	CreateLabelCombobox $frmInstTx TX_RATE_DIV "Tx Rate" $w 16 Para(TX_RATE_DIV) $TX_RATE_lst {ChangeValueCmd;initSDI027Config}
	.lblTX_RATE_DIV config -anchor w
	CreateLabelEntryLabel $frmInstTx TX_LINE_RATE "Tx Line Rate" 10 "Gbps" "" Para(TX_LINE_RATE) real
	.lblTX_LINE_RATE config -width $w -anchor w
	.entryTX_LINE_RATE config -state disabled
	set TX_DATA_WIDTH_lst {8/10-Bit 16/20-Bit}
	CreateLabelCombobox $frmInstTx TX_DATA_WIDTH "Tx FPGA Bus Width" $w 16 Para(TX_DATA_WIDTH) $TX_DATA_WIDTH_lst {ChangeValueCmd}
	.lblTX_DATA_WIDTH config -anchor w
	CreateLabelEntryLabel $frmInstTx TX_FICLK_RATE "Tx FPGA Bus Freq" 10 "MHz" "" Para(TX_FICLK_RATE) real
	.lblTX_FICLK_RATE config -width $w -anchor w
	.entryTX_FICLK_RATE config -state disabled
	checkbutton .cbTXLDR -text "Tx Low Data Rate Path" -variable Para(TXLDR) -onvalue On -offvalue Off -command {ChangeValueCmd}
	pack .cbTXLDR -in $frmInstTx -padx 10 -anchor w

	pack .frmInstance .frmTxPLL .frmInstRx .frmInstTx -in $page0 -side top -fill x
	
	set w 30
	#*** SerDes Setup ***
	set page1 [$tnb add -label "SerDes Setup"]
	iwidgets::labeledframe .frmSerDes -labeltext "" -labelpos nw
	set frmSerDes [.frmSerDes childsite]
	
	iwidgets::labeledframe .frmStandard -labeltext "I/O Standard" -labelpos nw
	set frmStandard [.frmStandard childsite]
	CreateLabelCombobox $frmStandard IO_TYPE "I/O Standard" $w 16 Para(IO_TYPE) {Custom} {initIO_TYPEsetting;ChangeValueCmd}
	.lblIO_TYPE config -anchor w
	
	iwidgets::labeledframe .frmTransmit -labeltext "Transmit" -labelpos nw
	set frmTransmit [.frmTransmit childsite]
	#set TXAMPLITUDE_lst {0 1 2 3 4 5 6 7 8 9}
	#CreateLabelCombobox $frmTransmit TXAMPLITUDE "Differential Amplitude" $w 16 Para(TXAMPLITUDE) $TXAMPLITUDE_lst {ChangeValueCmd}
	#.lblTXAMPLITUDE config -anchor w
	
	CreateLabelEntryLabel $frmTransmit TXAMPLITUDE "Differential Amplitude" 18 "mv(100-1300,increment of 20)" "" Para(TXAMPLITUDE) integer
	.lblTXAMPLITUDE config -width $w -anchor w
	.entryTXAMPLITUDE.lwchildsite.entry config -validate key -vcmd {
			after idle {ChangeValueCmd}
			return 1
	}
	
	set TXDIFFTERM_lst {"50 ohms" "75 ohms" "5K ohms"}
	CreateLabelCombobox $frmTransmit TXDIFFTERM "Output Termination" $w 16 Para(TXDIFFTERM) $TXDIFFTERM_lst {ChangeValueCmd}
	.lblTXDIFFTERM config -anchor w
	set TXDEPRE_lst {Disabled 0 1 2 3 4 5 6 7 8 9 10 11}
	CreateLabelCombobox $frmTransmit TXDEPRE "De-emphasis Pre-cursor Select" $w 16 Para(TXDEPRE) $TXDEPRE_lst {ChangeValueCmd}
	.lblTXDEPRE config -anchor w
	set TXDEPOST_lst {Disabled 0 1 2 3 4 5 6 7 8 9 10 11}
	CreateLabelCombobox $frmTransmit TXDEPOST "De-emphasis Post-cursor Select" $w 16 Para(TXDEPOST) $TXDEPOST_lst {ChangeValueCmd}
	.lblTXDEPOST config -anchor w

	iwidgets::labeledframe .frmReceive -labeltext "Receive" -labelpos nw
	set frmReceive [.frmReceive childsite]
	set RXDIFFTERM_lst {"50 ohms" "60 ohms" "75 ohms" "Hi-Z"}
	CreateLabelCombobox $frmReceive RXDIFFTERM "Input Termination" $w 16 Para(RXDIFFTERM) $RXDIFFTERM_lst {ChangeValueCmd}
	.lblRXDIFFTERM config -anchor w
	set RXCOUPLING_lst {AC DC}
	CreateLabelCombobox $frmReceive RXCOUPLING "AC/DC Couple" $w 16 Para(RXCOUPLING) $RXCOUPLING_lst {ChangeValueCmd}
	.lblRXCOUPLING config -anchor w
	set LEQ_lst {Disabled 0 1 2 3}
	CreateLabelCombobox $frmReceive LEQ "Linear Equalizer" $w 16 Para(LEQ) $LEQ_lst {ChangeValueCmd}
	.lblLEQ config -anchor w
	set RXLOSTHRESHOLD_lst {0 1 2 3 4 5 6 7}
	CreateLabelCombobox $frmReceive RXLOSTHRESHOLD "Loss of Signal Threshold Select" $w 16 Para(RXLOSTHRESHOLD) $RXLOSTHRESHOLD_lst {ChangeValueCmd}
	.lblRXLOSTHRESHOLD config -anchor w

	button .btnImport1 -text "Import.." -width 16 -command {ImportSRVFile}
	
	pack .frmStandard .frmTransmit .frmReceive -in $frmSerDes -fill x
	pack .btnImport1 -in $frmSerDes -side top -padx 10 -anchor e
	pack .frmSerDes -in $page1 -fill both -expand 1

	set w 28
	#*** PCS Setup ***
	set page2 [$tnb add -label "PCS Setup"]
	iwidgets::labeledframe .frmPCS -labeltext "" -labelpos nw
	set frmPCS [.frmPCS childsite]
	iwidgets::labeledframe .frmTransmit2 -labeltext "Transmit" -labelpos nw
	set frmTransmit2 [.frmTransmit2 childsite]
	set TXINVPOL_lst {Non-invert Invert}
	CreateLabelCombobox $frmTransmit2 TXINVPOL "Invert Tx Data Polarity" $w 15 Para(TXINVPOL) $TXINVPOL_lst {ChangeValueCmd}
	.lblTXINVPOL config -anchor w
	checkbutton .cbTX8B10B -text "Enable 8B10B Encoder" -variable Para(TX8B10B) -onvalue Enabled -offvalue Disabled -command {ChangeValueCmd}
	set TXFIFO_ENABLE_lst {Enabled Disabled}
	CreateLabelCombobox $frmTransmit2 TXFIFO_ENABLE "FPGA Bridge Tx FIFO" $w 15 Para(TXFIFO_ENABLE) $TXFIFO_ENABLE_lst {ChangeValueCmd}
	.lblTXFIFO_ENABLE config -anchor w
	pack .frmTXINVPOL .cbTX8B10B .frmTXFIFO_ENABLE -in $frmTransmit2 -anchor w -padx 2
	
	set w 28
	iwidgets::labeledframe .frmReceive2 -labeltext "Receive" -labelpos nw
	set frmReceive2 [.frmReceive2 childsite]
	iwidgets::labeledframe .frmGeneral -labeltext "" -labelpos nw
	set frmGeneral [.frmGeneral childsite]
	set RXINVPOL_lst {Non-invert Invert "User Port"}
	CreateLabelCombobox $frmReceive2 RXINVPOL "Invert Rx Data Polarity" $w 15 Para(RXINVPOL) $RXINVPOL_lst {ChangeValueCmd}
	.lblRXINVPOL config -anchor w
	checkbutton .cbRX8B10B -text "Enable 8B10B Decoder" -variable Para(RX8B10B) -onvalue Enabled -offvalue Disabled -command {ChangeValueCmd}
	set RXFIFO_ENABLE_lst {Enabled Disabled}
	CreateLabelCombobox $frmGeneral RXFIFO_ENABLE "FPGA Bridge Rx FIFO" $w 15 Para(RXFIFO_ENABLE) $RXFIFO_ENABLE_lst {ChangeValueCmd}
	.lblRXFIFO_ENABLE config -anchor w
	checkbutton .cbRXLSM -text "Enable Internal Link State Machine" -variable Para(RXLSM) -onvalue Enabled -offvalue Disabled -command {ChangeValueCmd}
	set RXWA_lst {Disabled "Barrel Shift" "BitSlip"}
	CreateLabelCombobox $frmGeneral RXWA "Word Alignment (WA) Mode" $w 15 Para(RXWA) $RXWA_lst {ChangeValueCmd}
	.lblRXWA config -anchor w
	set RXSC_lst {"User Defined" K28P5 K28P157}
	CreateLabelCombobox $frmGeneral RXSC "Specific Comma" $w 15 Para(RXSC) $RXSC_lst {ChangeValueCmd}
	.lblRXSC config -anchor w
	CreateLabelEntryLabel $frmGeneral RXCOMMAA "Comma A Char" 12 "" "" Para(RXCOMMAA) {bin %c}
	CreateLabelEntryLabel $frmGeneral RXCOMMAB "Comma B Char" 12 "" "" Para(RXCOMMAB) {bin %c}
	CreateLabelEntryLabel $frmGeneral RXCOMMAM "Comma Mask Char" 12 "" "" Para(RXCOMMAM) {bin %c}
	.lblRXCOMMAA config -width $w -anchor w
	.lblRXCOMMAB config -width $w -anchor w
	.lblRXCOMMAM config -width $w -anchor w
	pack .frmRXINVPOL .cbRX8B10B .frmRXFIFO_ENABLE .cbRXLSM .frmRXWA .frmRXSC .frmRXCOMMAA .frmRXCOMMAB .frmRXCOMMAM -in $frmGeneral -side top -anchor w -padx 2

	set w 28
	iwidgets::labeledframe .frmCTC -labeltext "Receive CTC" -labelpos nw
	set frmCTC [.frmCTC childsite]
	checkbutton .cbRXCTC -text "Enable CTC FIFO" -variable Para(RXCTC) -onvalue Enabled -offvalue Disabled -command {ChangeValueCmd}
	set RXCTCMATCHPATTERN_lst {M1-S1 M2-S2 M4-S4 M4-S1}
	CreateLabelCombobox $frmCTC RXCTCMATCHPATTERN "Match Pattern" $w 6 Para(RXCTCMATCHPATTERN) $RXCTCMATCHPATTERN_lst {ChangeValueCmd}
	.lblRXCTCMATCHPATTERN config -anchor w
	foreach i {0 1 2 3} {
		frame .frmRXCTCBYTE$i
		label .lblRXCTCBYTE$i -text "Byte N+$i" -width [expr $w-9] -anchor w
		checkbutton .cbKBYTE$i -text K -variable Para(KBYTE$i) -onvalue 1 -offvalue 0
		iwidgets::entryfield .entryBYTE$i -labeltext 0x -width 4 -textvariable Para(BYTE$i) -fixed 2 -validate {hex %c}
		pack .lblRXCTCBYTE$i .cbKBYTE$i .entryBYTE$i -in .frmRXCTCBYTE$i -side left	
	}
	.lblRXCTCBYTE0 config -text "Byte N"
	pack .cbRXCTC .frmRXCTCMATCHPATTERN .frmRXCTCBYTE0 .frmRXCTCBYTE1 .frmRXCTCBYTE2 .frmRXCTCBYTE3 -in $frmCTC -side top -anchor w -padx 2
	
	set w 30
	iwidgets::labeledframe .frmAlignment -labeltext "Multi-Channel Alignment" -labelpos nw
	set frmAlignment [.frmAlignment childsite]
	checkbutton .cbRXMCAENABLE -text "Rx Multi-Channel Alignment Enable" -variable Para(RXMCAENABLE) -onvalue Enabled -offvalue Disabled -command {ChangeValueCmd}
	foreach i {A B M} {
		frame .frmACHAR$i
		label .lblACHAR$i -text "Alignment Character $i" -width [expr $w-9] -anchor w
		checkbutton .cbKBYTE$i -text K -variable Para(KBYTE$i) -onvalue 1 -offvalue 0
		iwidgets::entryfield .entryBYTE$i -labeltext 0x -width 4 -textvariable Para(BYTE$i) -fixed 2 -validate {hex %c}
		pack .lblACHAR$i .cbKBYTE$i .entryBYTE$i -in .frmACHAR$i -side left	
	}
	.lblACHARM config -text "Alignment Character Mask"
	
	grid .cbRXMCAENABLE -in $frmAlignment -sticky w -padx 2
	grid .frmACHARA -in $frmAlignment -sticky w -padx 2
	grid .frmACHARB -in $frmAlignment -sticky w -padx 2
	grid .frmACHARM -in $frmAlignment -sticky w -padx 2

	grid .frmGeneral .frmCTC -in $frmReceive2 -sticky nswe
	#grid .frmAlignment -columnspan 2 -in $frmReceive2 -sticky we
	
	pack .frmTransmit2 .frmReceive2 -in $frmPCS -fill x
	pack .frmPCS -in $page2 -fill both -expand 1
	
	set w 28
	#*** Control Setup ***
	set page3 [$tnb add -label "Control Setup"]
	iwidgets::labeledframe .frmControl -labeltext "" -labelpos nw
	set frmControl [.frmControl childsite]
	
	iwidgets::labeledframe .frmOther -labeltext "Other Channel Controls" -labelpos nw
	set frmOther [.frmOther childsite]
	set LOOPBACK_lst {Disabled "Rx Parallel to Tx"}
	CreateLabelCombobox $frmOther LOOPBACK "Loopback Mode" $w 18 Para(LOOPBACK) $LOOPBACK_lst {ChangeValueCmd}
	.lblLOOPBACK config -anchor w
	set RCSRC_lst {Disabled Enabled}
	CreateLabelCombobox $frmOther RCSRC "Dynamic Rate Control Interface" $w 18 Para(RCSRC) $RCSRC_lst {ChangeValueCmd}
	.lblRCSRC config -anchor w
	set LOSPORT_lst {Disabled Enabled}
	CreateLabelCombobox $frmOther LOSPORT "Receive Loss-of-Signal Port" $w 18 Para(LOSPORT) $LOSPORT_lst {ChangeValueCmd}
	.lblLOSPORT config -anchor w
	set CDRLOLACTION_lst {"Nothing" "Full Recalibration"}
	CreateLabelCombobox $frmOther CDRLOLACTION "CDR LOL Action" $w 18 Para(CDRLOLACTION) $CDRLOLACTION_lst {ChangeValueCmd}
	.lblCDRLOLACTION config -anchor w	

	iwidgets::labeledframe .frmReset -labeltext "Reset Sequence" -labelpos nw
	set frmReset [.frmReset childsite]
	#set RSTSEQSEL_lst {None "Tx Before Rx" "Tx/RX Independent"}
	#CreateLabelCombobox $frmReset RSTSEQSEL "Reset Sequence Select" $w 18 Para(RSTSEQSEL) $RSTSEQSEL_lst {ChangeValueCmd}
	#.lblRSTSEQSEL config -anchor w	
	checkbutton .cbRSTSEQSEL -text "Select Reset Sequence" -variable Para(RSTSEQSEL) -onvalue Enabled -offvalue Disabled -command {ChangeValueCmd}
	set w 20
	set PPORT_TX_RDY_lst {Disabled Enabled}
	CreateLabelCombobox $frmReset PPORT_TX_RDY "Tx Ready Port" $w 14 Para(PPORT_TX_RDY) $PPORT_TX_RDY_lst {ChangeValueCmd}
	.lblPPORT_TX_RDY config -anchor w	
	CreateLabelEntryLabel $frmReset PWAIT_TX_RDY "Tx Ready Wait Time" 6 "(4 - 4095)" "" Para(PWAIT_TX_RDY) {digit %c}
	.lblPWAIT_TX_RDY config -width $w -anchor w
	set PPORT_RX_RDY_lst {Disabled Enabled}
	CreateLabelCombobox $frmReset PPORT_RX_RDY "Rx Ready Port" $w 14 Para(PPORT_RX_RDY) $PPORT_RX_RDY_lst {ChangeValueCmd}
	.lblPPORT_RX_RDY config -anchor w	
	CreateLabelEntryLabel $frmReset PWAIT_RX_RDY "Rx Ready Wait Time" 6 "(4 - 4095)" "" Para(PWAIT_RX_RDY) {digit %c}
	.lblPWAIT_RX_RDY config -width $w -anchor w

	grid .cbRSTSEQSEL -in $frmReset -columnspan 2 -sticky w -padx 2
	grid .frmPPORT_TX_RDY .frmPWAIT_TX_RDY -in $frmReset -sticky w -padx 10 -pady 4
	grid .frmPPORT_RX_RDY .frmPWAIT_RX_RDY -in $frmReset -sticky w -padx 10

	button .btnImport2 -text "Import.." -width 16 -command {ImportSRVFile}
	
	pack .frmOther .frmReset -in $frmControl -fill x
	pack .btnImport2 -in $frmControl -side top -padx 10 -anchor e
	pack .frmControl -in $page3 -fill both -expand 1
	
	#*** Advanced Setup ***
	set page4 [$tnb add -label "Advanced Setup"]
	iwidgets::labeledframe .frmAdvanced -labeltext "SCI Interface" -labelpos nw
	set frmAdvanced [.frmAdvanced childsite]
	checkbutton .cbSCIPORT -text "SCI Port Enable" -variable Para(SCIPORT) -onvalue Enabled -offvalue Disabled -command {ChangeValueCmd}
	label .lblSCIPORT -text "SCI Interface is used for debugging Serdes. User needs to enable the port if this capability\nis needed.\
		If SCI ports are not enabled, user cannot use this capability." -justify left
	pack .cbSCIPORT .lblSCIPORT -in $frmAdvanced -side top -anchor w -padx 20 -pady 10
	pack .frmAdvanced -in $page4 -fill both -expand 1
	
	GeneralConfig
	$tnb view 0


	#! backup the lpc file values since ASBgen will overwrite lpc file.
	#backupLPCfileInfo.
	if {$Para(new) == 0} {
		set protocol $Para(PROTOCOL)
		set num_chs $Para(NUM_CHS)
	}
	initDefaultSetting
	PcsSettingViaMACO	
	if {$Para(new) == 0} {set Para(NUM_CHS) $num_chs}
	initProtocolSetting
	initIO_TYPEsetting
	#ProtocolInit
	#load para.
	#! restore the LPC file info to avoid overwirte by protocol setting.
	if {$Para(new) == 0} {restoreLPCinfo}
	if {$Para(new) == 0} {set Para(PROTOCOL) $protocol}
	RestoreProtocolCB
	Para_Init
	ChangeValueCmd
}
