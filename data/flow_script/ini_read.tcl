# These functions can be used in the tcl scripts in the Bali flow engine (BDK)
# Copyright (c), 2008, Lattice Semiconductor Corporation, All Rights Reserved

namespace eval bali::utility {

	#Read an ini file and get a whole section 
	proc get_ini_section { inifile sec } {
		if [catch {open $inifile r} fileid] {
			return -code error "ERROR - Cannot open $inifile."
		}
		set found_sec 0
		seek $fileid 0 start
		while {[gets $fileid line] >= 0} {
			if {$found_sec == 0} {
				if [regexp -nocase "^\\s*\\\[$sec]\\s*;*" $line ] {
					set found_sec 1
				}
				continue
			}
			if {$found_sec != 0} {
				if [regexp "^\\s*;" $line ] continue
				if {[regexp {[[^\[]*]} $line ]} break
			}			
			if {[regexp {^\s*([^\s;=][^;=]*?)\s*=\s*(\S.*)??\s*$} $line match member value ]} {
				lappend result $member
				lappend result $value
				if [info exists ::DEBUG] {
					puts stdout "$member = $value"
				}
			}
		}
		close $fileid
		if [info exists result] {
			return $result
		}
	}

	#Read an ini file and get a memeber in a section 
	proc get_ini_member { inifile sec mem  dlft } {
		if [catch {open $inifile r} fileid] {
			return -code error "ERROR - Cannot open $inifile."
		}
		array set r [get_ini_section $inifile $sec]
		if [info exists r($mem)] {
			set result $r($mem)
		} else { set result $dlft }
		close $fileid
		return $result
	}

}