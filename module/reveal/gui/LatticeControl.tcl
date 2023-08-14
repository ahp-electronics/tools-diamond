
#$Header: L:/module_gen/bin/tcltk_template/lattice/rcs/LatticeControl.tcl 1.31 2004/07/29 07:38:02Z mghuang Exp mghuang $

#!/usr/local/bin/wish
package require Iwidgets

package provide LatticeIPCore 1.0.0

proc GetEnvVariables {}  {
	global env Para tcl_platform

	#set ispsys_file [file join $Para(TemplateDir) "../../../../.." config "ispsys.ini"]
	set ispsys_file [file join $Para(leverpath) ispcpld config "ispsys.ini"]

	if {[catch {set fileid [open $ispsys_file]} msg]} {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $ispsys_file file!" \
			-title "Generate error" \
			-type ok
		set err_msg "ERROR - Cannot open $ispsys_file."
		SendMessage $err_msg
		return -1
	}

	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[Settings\]"] == 0} {
			continue
		}
		if [regexp {([^=]*)=(.*)} $line match parameter value] {
			if [regexp {([ |\t]*;)} $parameter match] {continue}
			if [regexp {(.*)[ |\t]*;} $value match temp] {
				set EnvVar($parameter) $temp
			} else {
				set parameter [string trim $parameter]
				set EnvVar($parameter) $value
			}
		}
	}
	close $fileid

#	tk_messageBox -default ok -icon warning -message $EnvVar(DefaultProduct) -title "DefaultProduct" -type ok
#	tk_messageBox -default ok -icon warning -message $EnvVar(IniFileName) -title "IniFileName" -type ok
	set lscfile $EnvVar(IniFileName)
	set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
	set lsvini_path [file join $lsvini_dir $lscfile]
	if {[catch {set fid [open $lsvini_path]} msg]} {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $lsvini_path file!" \
			-title "Generate error" \
			-type ok
		set err_msg "ERROR - Cannot open $lsvini_path."
		SendMessage $err_msg
		return false
	} else {set data [read $fid]; close $fid }
	foreach line [split $data '\n'] {
		set lline [string tolower $line]
		set lline [string trim $lline]
		if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
		if {$path && [regexp {^\[} $lline]} {set path 0; break}
		if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
		if {$path && [regexp {^config} $lline]} {set config_dir $line; continue}
		if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
		if {$path && [regexp {^root} $lline]} {set root_dir $line}
	}

	set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
	regsub -all "\"" $cpld_bin "" cpld_bin
	set cpld_bin [file join $cpld_bin]
	set config_dir [string range $config_dir [expr [string first "=" $config_dir]+1] end]
	regsub -all "\"" $config_dir "" config_dir
	set config_dir [file join $config_dir]
	set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
	regsub -all "\"" $fpga_dir "" fpga_dir
	set fpga_dir [file join $fpga_dir]
	set root_dir [string range $root_dir [expr [string first "=" $root_dir]+1] end]
	regsub -all "\"" $root_dir "" root_dir
	set root_dir [file join $root_dir]
#	tk_messageBox -default ok -icon warning -message $cpld_bin -title "cpld_bin" -type ok
#	tk_messageBox -default ok -icon warning -message $config_dir -title "config_dir" -type ok
#	tk_messageBox -default ok -icon warning -message $fpga_dir -title "fpga_dir" -type ok
#	tk_messageBox -default ok -icon warning -message $root_dir -title "root_dir" -type ok

	set Para(Bin) $cpld_bin
	set Para(Config) $config_dir
	set Para(FPGAPath) $fpga_dir
	set Para(Root) $root_dir
}

proc SendMessage {msg} {
	global Para tcl_platform
#	if {$Para(invoke)==0} {
#		tk_messageBox -default ok -icon info -message $msg -title "Information" -type ok
#	} else {
		switch $tcl_platform(platform) {
			windows {
#				set msgr [file join $Para(CoreDir) "../../../../.." bin msgr.exe]
				set msgr [file join $Para(Bin) msgr.exe]
			}
			unix {
#				set msgr [file join $Para(CoreDir) "../../../../.." bin msgr]
				set msgr [file join $Para(Bin) msgr]
			}
		}
		regsub -all "\t" $msg "    " msg
#		set msg "4  \n$msg"
#		while {[string length $msg] > 2028} {
#			set idx [string last "\n" $msg 2027]
#			if {$idx == -1} {set idx 2027} else {incr idx -1}
#			catch {exec $msgr [string range $msg 4 $idx] &}
#			set msg [string range $msg [expr $idx+2] end]
#			set msg "4 $msg"
#		}
		set msg_file [file join $Para(ProjectPath) "msg_file.log"]
		if [catch {open $msg_file w} outputfile] {
			tk_messageBox -default ok -icon warning \
				-message "Cannot open $msg_file file!" \
				-title "Generate error" \
				-type ok
			return -1
		}
		puts $outputfile $msg
		close $outputfile
		if {[string length $msg] > 0} {
#			catch {exec $msgr $msg &}
			catch {exec $msgr 4 $msg_file &}
		}
#	}
}

##*************************************
## Place the main window to the central screen
##*************************************
#proc CenterPosition {} {
##	after idle {
##		update idletasks
##		set xmax [winfo screenwidth .]
##		set ymax [winfo screenheight .]
##		set x [expr ($xmax - [winfo reqwidth .])/2]
##		set y [expr ($ymax - [winfo reqheight .])/2]
##		wm geometry . "+$x+$y"
##	}
#	global Para
#	after idle {
#		update idletasks
#		regexp {(\d+)x(\d+)\+(-*\d+)\+(-*\d+)} $Para(guiRect) match xmax ymax x y
#		set x [expr $x + ($xmax - [winfo reqwidth .])/2]
#		set y [expr $y + ($ymax - [winfo reqheight .])/2]
#		wm geometry . "+$x+$y"
#		if {$Para(invoke)==1} {wm deiconify .}
#	}
#}

#*************************************
# Check the input value is hex or not
#*************************************
proc hex {i} {
	if [string match {[a-fA-F0-9]} $i] {
		return true
	} else {
		return false
	}
}

#*************************************
# Check the input value is digit or not
#*************************************
proc digit {i} {
	if [string match {[0-9]} $i] {
		return true
	} else {
		return false
	}
}

proc bin {i} {
	if [string match {[0-1]} $i] {
		return true
	} else {
		return false
	}
}

proc Hex2Bin {v} {
	set len [string length $v]
	for {set i 0} {$i < $len} {incr i} {
		set temp [string range $v $i $i]
		switch $temp {
			0 {set str 0000}
			1 {set str 0001}
			2 {set str 0010}
			3 {set str 0011}
			4 {set str 0100}
			5 {set str 0101}
			6 {set str 0110}
			7 {set str 0111}
			8 {set str 1000}
			9 {set str 1001}
			a -
			A {set str 1010}
			b -
			B {set str 1011}
			c -
			C {set str 1100}
			d -
			D {set str 1101}
			e -
			E {set str 1110}
			f -
			F {set str 1111}
		}
		append ret_str $str
	}
	return $ret_str
}

proc Bin2Hex {v} {
	set len [string length $v]
	for {set i 0} {$i < $len} {incr i 4} {
		set temp [string range $v $i [expr $i+3]]
		switch $temp {
			0000 {set str 0}
			0001 {set str 1}
			0010 {set str 2}
			0011 {set str 3}
			0100 {set str 4}
			0101 {set str 5}
			0110 {set str 6}
			0111 {set str 7}
			1000 {set str 8}
			1001 {set str 9}
			1010 {set str A}
			1011 {set str B}
			1100 {set str C}
			1101 {set str D}
			1110 {set str E}
			1111 {set str F}
		}
		append ret_str $str
	}
	return $ret_str
}

proc IsInRange {str min max para} {
	if {[string length $para] == 0} {
		set msg "Please input $str!"
		tk_messageBox -default ok -icon info -message $msg -title "Check Parameters" -type ok
		return -1
	}
	if {$para > $max || $para < $min} {
		set msg "$str is out of range!"
		tk_messageBox -default ok -icon info -message $msg -title "Check Parameters" -type ok
		return -1
	}
	return 0
}

proc IsInList {str lst para} {
	if {[string length $para] == 0} {
		set msg "Please input $str!"
		tk_messageBox -default ok -icon info -message $msg -title "Check Parameters" -type ok
		return -1
	}
	if {[lsearch $lst $para] == -1} {
		set msg "$str is illegal!"
		tk_messageBox -default ok -icon info -message $msg -title "Check Parameters" -type ok
		return -1
	}
	return 0
}

proc IsHex {str len para} {
	set strlen [string length $para]
	if {$strlen != $len} {
		if {$strlen > $len}  {
			set msg "$str is illegal!"
			tk_messageBox -default ok -icon info -message $msg -title "Check Parameters" -type ok
			return -1
		} else  {
			set para [format "%0$len\s" $para]
		}
	}
	for {set i 0} {$i < $len} {incr i} {
		set k [string index $para $i]
		if {[hex $k] == "false"} {
			set msg "$str is illegal!"
			tk_messageBox -default ok -icon info -message $msg -title "Check Parameters" -type ok
			return -1
		}
	}
	return 0
}

#*************************************
# Set Font: ft
#*************************************
proc SetFont {} {
	global tcl_platform ft
	switch $tcl_platform(platform) {
		windows {
			set ft {{MS Sans Serif} 8}
		}
		unix {
			set ft {times -12}
		}
	}
}

#*******************************************
# Label + string
#*******************************************
proc CreateLabelItem {parent main txt str {s {top}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $txt -font $ft
	label .val$main -text $str -font $ft
	pack .lbl$main .val$main -in .frm$main -side left -pady 2 -padx 8
	pack .frm$main -in $parent -side top -anchor w -padx 8
}

#*******************************************
# Label + radiobutton1 + radiobutton2
#*******************************************
proc CreateRadioItem {parent main label lblwidth text1 val1 text2 val2 rdowidth side para {p {}}} {
	global ft
	frame .frm$main
	radiobutton .rdo1$main -text $text1 -width $rdowidth -value $val1 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo2$main -text $text2 -width $rdowidth -value $val2 -variable $para -anchor w -font $ft -command $p
	if {[string length $label] == 0} {
		pack .rdo1$main .rdo2$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor center -padx 8
	} else {
		label .lbl$main -text $label -width $lblwidth -anchor e -font $ft
		pack .lbl$main .rdo1$main .rdo2$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor w -padx 8
	}
}

#*******************************************
# Label + radiobutton1 + radiobutton2 + radiobutton3
#*******************************************
proc Create3RadioItem {parent main label lblwidth text1 val1 text2 val2 text3 val3 rdowidth side para {p {}}} {
	global ft
	frame .frm$main
	radiobutton .rdo1$main -text $text1 -width $rdowidth -value $val1 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo2$main -text $text2 -width $rdowidth -value $val2 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo3$main -text $text3 -width $rdowidth -value $val3 -variable $para -anchor w -font $ft -command $p
	if {[string length $label] == 0} {
		pack .rdo1$main .rdo2$main .rdo3$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor center -padx 8
	} else {
		label .lbl$main -text $label -width $lblwidth -anchor e -font $ft
		pack .lbl$main .rdo1$main .rdo2$main .rdo3$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor w -padx 8
	}
}

proc Create4RadioItem {parent main label lblwidth text1 val1 text2 val2 text3 val3 text4 val4 rdowidth side para {p {}}} {
	global ft
	frame .frm$main
	radiobutton .rdo1$main -text $text1 -width $rdowidth -value $val1 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo2$main -text $text2 -width $rdowidth -value $val2 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo3$main -text $text3 -width $rdowidth -value $val3 -variable $para -anchor w -font $ft -command $p
	radiobutton .rdo4$main -text $text4 -width $rdowidth -value $val4 -variable $para -anchor w -font $ft -command $p
	if {[string length $label] == 0} {
		pack .rdo1$main .rdo2$main .rdo3$main .rdo4$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor center -padx 8
	} else {
		label .lbl$main -text $label -width $lblwidth -anchor e -font $ft
		pack .lbl$main .rdo1$main .rdo2$main .rdo3$main .rdo4$main -in .frm$main -side $side
		pack .frm$main -in $parent -side top -anchor w -padx 8
	}
}

#*******************************************
# Label + Entry + Label
#*******************************************
proc CreateLabelEntryLabel {parent main lblstr width text lbltxt para {p {hex %c}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $lblstr -width 20 -font $ft -anchor e
	iwidgets::entryfield .entry$main -labeltext $lbltxt -labelpos w -labelfont $ft \
		-width $width -textvariable $para -fixed [expr $width-2] -validate $p
	label .lbl2$main -text $text -font $ft
	pack .lbl$main .entry$main .lbl2$main -in .frm$main -side left
	pack .frm$main -in $parent -side top -anchor w -pady 2 -padx 8
}

#*******************************************
# Label + Combobox
#*******************************************
proc CreateLabelCombobox {parent main lblstr lblwidth cbowidth para list {p {}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $lblstr -font $ft -width $lblwidth -anchor e
	iwidgets::combobox .cbo$main -width $cbowidth -editable false -textvariable $para \
		-selectioncommand $p
	foreach x $list {
		.cbo$main insert list end $x
	}
	pack .lbl$main .cbo$main -in .frm$main -side left
	pack .frm$main -in $parent -side top -anchor w -pady 2 -padx 8
}

#*******************************************
#  Label + Entry
#*******************************************
proc CreateLabelEntry {parent main text lbltext width lblpos side para {p {hex %c}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $text -font $ft -anchor e
	iwidgets::entryfield .entry$main -labeltext $lbltext -labelpos $lblpos -labelfont $ft \
		-width $width -textvariable $para -fixed [expr $width-2] -validate $p
	pack .lbl$main .entry$main -in .frm$main -side $side
	pack .frm$main -in $parent -side left -anchor w -padx 8 -expand true
}

proc CreateEntry {parent main lbltext lblwidth width side para {p {hex %c}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $lbltext -font $ft -anchor e -width $lblwidth
	iwidgets::entryfield .entry$main -width $width -textvariable $para -fixed [expr $width-2] -validate $p
	pack .lbl$main .entry$main -in .frm$main -side $side
	pack .frm$main -in $parent -side left -anchor w -padx 8 -expand true
}

proc LabelEntry {parent main lbltext lblwidth width para {p {hex %c}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $lbltext -font $ft -anchor e -width $lblwidth
	iwidgets::entryfield .entry$main -width $width -textvariable $para -fixed [expr $width-2] -validate $p
	pack .lbl$main .entry$main -in .frm$main -side left
	pack .frm$main -in $parent -side top -anchor w -padx 8 -expand true
}

#*******************************************
#  Click spinner button
#*******************************************
proc spin {win step min max} {
	set size [expr [$win get] + $step]
    if {$size < $min} {set size $max}
    if {$size > $max} {set size $min}
    $win delete 0 end
    $win insert 0 $size
}

#*******************************************
#  Label + Spinner
#*******************************************
proc CreateSpinner {parent main label lblwidth width min max para {p {}} {v {digit %c}}} {
	global ft
	frame .frm$main
	label .lbl$main -text $label -width $lblwidth -font $ft -anchor e
	iwidgets::spinner .spin$main -width $width -fixed $width \
		-decrement "[list spin .spin$main -1 $min $max]; $p" \
		-increment "[list spin .spin$main 1 $min $max]; $p" -textvariable $para \
		-validate $v
	pack .lbl$main .spin$main -in .frm$main -side left -fill x
	pack .frm$main -in $parent -side top -fill x -padx 8 -pady 2
}

proc CreateCoreVersion {parent main vendor version} {
	global ft
	frame .frm$main
	frame .frmLeft
	frame .frmRight
	label .image -image [image create photo -file \
		[file join [file dirname [info script]] "gui" "core_info.gif"]]
	pack .image -in .frmLeft
	label .lblVendor -text $vendor -font $ft
	label .lblVersion -text $version -font $ft
	pack .lblVendor .lblVersion -in .frmRight -side top -pady 4
	pack .frmLeft .frmRight -in .frm$main -side left -padx 4
	pack .frm$main -in $parent -anchor center -side top
}

proc CreateCoreType {parent main type family} {
	global ft
	frame .frm$main

	iwidgets::labeledwidget .coretype -labeltext "Core Type:" -labelfont $ft
	set CoreType [.coretype childsite]
	label $CoreType.label -text $type -font $ft
	pack $CoreType.label -side left

	iwidgets::labeledwidget .devicefamily -labeltext "Device Family:" -labelfont $ft
	set DeviceFamily [.devicefamily childsite]
	label $DeviceFamily.label -text $family -font $ft
	pack $DeviceFamily.label -side left

	grid .coretype .devicefamily -in .frm$main -padx 10
	pack .frm$main -in $parent -side top -fill x -pady 4
}

proc CheckCoreName {fileid core_name} {
	while {[gets $fileid line] >= 0} {
		if {[string first "CoreName" $line] > -1} {
			set temp $line
			regexp {([^=]*)=(.*)} $temp match parameter value
			if {[string compare -nocase $value $core_name] != 0} {
#				set err_msg "Error.\nParameter file isn't fit for this IP Core!"
#				SendMessage $err_msg
				tk_messageBox -default ok -icon error \
					-message "Wrong module parameter file!" \
					-title "Load Parameters" \
					-type ok
				set Para(msg) "Module parameter file does not match selected core."
				return -1
			}
		}
	}
	return 0
}

proc LoadDefaultParameter {core_name para_file {flag 0}} {
	global Para
	if [catch {open $para_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $para_file." \
			-title "Open file error - LoadDefaultParameter" \
			-type ok
		set err_msg "ERROR - Cannot open $para_file."
		set Para(msg) $msg
		SendMessage $err_msg
		return -1
		#exit
	}

	set i [CheckCoreName $fileid $core_name]
	if {$i == -1} {return -1}

	seek $fileid 0 start
	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[Device\]"] == 0} {
			continue
		}
		if {[string compare -nocase $line "\[IP\]"] == 0} {
			continue
		}
		if {[string compare -nocase $line "\[Parameters\]"] == 0} {
			set flag 0
			continue
		}
		if {$flag == 0} {
			if [regexp {([^=]*)=(.*)} $line match parameter value] {
				if [regexp {([ |\t]*;)} $parameter match] {continue}
				if [regexp {(.*)[ |\t]*;} $value match temp] {
					set Para($parameter) $temp
				} else {
					set Para($parameter) $value
				}
			}
		}
	}
	close $fileid
	catch LoadParaCB
}

proc LoadParameter {core_name para_file} {
	global pin_name_list pin_direction_list bus_width_list pin_side_list
	global Para
	if [catch {open $para_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $para_file." \
			-title "Open file error - LoadParameter" \
			-type ok
		set err_msg "ERROR - Cannot open $para_file."
		SendMessage $err_msg
		#exit
	}

	set i [CheckCoreName $fileid $core_name]
	if {$i == -1} {return -1}

	seek $fileid 0 start
	set flag 1
	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[Device\]"] == 0} {
			continue
		}
		if {[string compare -nocase $line "\[IP\]"] == 0} {
			set flag 0
			set p IP
			continue
		}
		if {[string compare -nocase $line "\[Parameters\]"] == 0} {
			set flag 0
			set p Para
			continue
		}
		if {$flag == 0} {
			if [regexp {([^=]*)=(.*)} $line match parameter value] {
				if [regexp {([ |\t]*;)} $parameter match] {continue}
				if [regexp {(.*)[ |\t]*;} $value match temp] {
					set Bak($parameter) $Para($parameter)
#					set Para($parameter) $temp
					set ${p}($parameter) $temp
				} else {
					set Bak($parameter) $Para($parameter)
#					set Para($parameter) $value
					set ${p}($parameter) $value
				}
			}
		}
	}
	close $fileid

	#Add this instruction for Revision Control
	if {$Para(CoreRevision) != $IP(CoreRevision)}  {
		set msg "Eval Package version is different! Continue?"
		set answer [tk_messageBox -message $msg -type yesno -icon question \
			-default yes -title "Load Parameters"]
		if {$answer == "no"}  {
			foreach {index value} [array get Bak] {
				set Para($index) $value
			}
			return -1
		}
	}

	set j [CheckParameterCB]
	if {$j == -1} {
		foreach {index value} [array get Bak] {
			set Para($index) $value
		}
		return -1
	}

	catch LoadParaCB

	DrawPins $pin_name_list $pin_direction_list $bus_width_list $pin_side_list
#	.commonWindow.modulename.entName icursor end
#	DspOutputFiles
}

proc CreateLpcFile {} {
	global Para device_support

	#set lcd_file [file join [file dirname [info script]] "gui" "default.lpc"]
	set lcd_file [file join $Para(lpc) "default.lpc"]

	set lpc_file [file join $Para(ProjectPath) "$Para(ModuleName).lpc"]
#	if [file exists $lpc_file] {
#		set answer [tk_messageBox -message "Overwrite $lpc_file?" -type yesno \
#			-icon question -title "LPC file"]
#		if {[string compare -nocase $answer "no"] == 0} {return -1}
#	}
	if [catch {open $lpc_file w} outputfile] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $lpc_file." \
			-title "Generate error" \
			-type ok
		set msg "ERROR - Cannot open $lpc_file."
		set Para(msg) $msg
		SendMessage $msg
		return -1
	}
	if [catch {open $lcd_file r} inputfile] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $lcd_file." \
			-title "Generate error" \
			-type ok
		send msg "ERROR - Cannot open $lcd_file."
		set Para(msg) $msg
		SendMessage $msg
		return -1
	}

	puts $outputfile "\[Device\]"
	puts $outputfile "Family=$Para(Family)"
#	puts $outputfile "Family=$device_support(DieName)"
	puts $outputfile "PartType=$Para(PartType)"
	puts $outputfile "PartName=$Para(PartName)"
	puts $outputfile "SpeedGrade=$Para(SpeedGrade)"
	puts $outputfile "Package=$Para(Package)"
	puts $outputfile "OperatingCondition=$Para(OperatingCondition)"
	puts $outputfile "Status=$Para(Status)\n"

	puts $outputfile "\[IP\]"
	puts $outputfile "VendorName=$Para(VendorName)"
	puts $outputfile "CoreType=$Para(CoreType)"
	puts $outputfile "CoreStatus=$Para(CoreStatus)"
	puts $outputfile "CoreName=$Para(CoreName)"
	puts $outputfile "CoreRevision=$Para(CoreRevision)"
	puts $outputfile "ModuleName=$Para(ModuleName)"
	puts $outputfile "SourceFormat=$Para(SourceFormat)"
	puts $outputfile "ParameterFileVersion=$Para(ParameterFileVersion)"
	set Para(Date) [clock format [clock seconds] -format "%m/%d/%Y"]
	puts $outputfile "Date=$Para(Date)"
	set Para(Time) [clock format [clock seconds] -format "%H:%M:%S"]
	puts $outputfile "Time=$Para(Time)\n"

	set write_flag 0
	while {[gets $inputfile line] >= 0} {
		if {[string compare -nocase $line "\[Parameters\]"] == 0} {
			set write_flag 1
			puts $outputfile $line
		}
		if {$write_flag == 1} {
			if [regexp {([ |\t]*;)} $line match] {
				puts $outputfile $line
			} else {
				if [regexp {([^=]*)=(.*)} $line match parameter value] {
					puts $outputfile "$parameter=$Para($parameter)"
				}
			}
		}
	}

	close $inputfile
	close $outputfile

	return 0
}

# Not use netlist.ini to get netlist file according to Kyoho Lee's email
# 3/5/2003
proc GetNetlistFile {} {
	global Para

	# remove existing {Project Path}\par and \soruce
#	set par_dir [file join $Para(ProjectPath) "par"]
#	catch {file delete -force $par_dir}
#	set source_dir [file join $Para(ProjectPath) "source"]
#	catch {file delete -force $source_dir}
	# copy \par & \source to Project Path
	set par_dir [file join $Para(CoreDir) "par"]
	catch {file copy $par_dir $Para(ProjectPath)}
	set source_dir [file join $Para(CoreDir) "source"]
	catch {file copy $source_dir $Para(ProjectPath)}

	set msg "\tModule Name: $Para(ModuleName)\n\tCore Type: $Para(CoreName)\n\tLPC file: $Para(ModuleName).lpc\n Module $Para(CoreName) has been generated successfully in $Para(ProjectPath) without the detail netlist. \n Please contact Lattice Semiconductor to download the netlist."
	SendMessage $msg
	return
}

proc GetNetlistFileOld {} {
	global Para tcl_platform

	set inFile [file join $Para(CoreDir) "netlist" "netlist.ini"]
	if [catch {open $inFile r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open file: $inFile!" \
			-title "Read file error" \
			-type ok
		set err_msg "ERROR - Cannot open $inFile."
		SendMessage $err_msg
		return
	} else {
		set setflag 0
		#----- read parameters from the file
		while {[gets $fileid line] >= 0} {
			if { [regexp {^\[Config.*\]} $line match]} {
				if {[info exists netlist]} break
				set setflag 1
				continue
			}
			if {$setflag == 1} {
				if [regexp {([^=]+)=(.*)} $line match parameter value] {
					if [regexp {([ |\t]*;)} $parameter match] {continue}
					if [regexp {(.*?)[ |\t]*;} $value match temp] {
						set value [string trim $temp]
					} else {
						set value [string trim $value]
					}
					if {$parameter=="netlist"} {
						set netlist $value
					} elseif {$parameter=="SourceFormat"} {
						if {[string first $Para(SourceFormat) $value] == -1} {
							set setflag 0
							if {[info exists netlist]} {unset netlist}
						}
					} elseif {$Para($parameter)!=$value} {
						set setflag 0
						if {[info exists netlist]} {unset netlist}
					}
				}
			}
		}
		close $fileid

		if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"]} {
			set Para(DesignEntry) "VHDL"
			set Para(TempFile) $Para(ModuleName).vhd
		}
		if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"]} {
			set Para(DesignEntry) "Verilog"
			set Para(TempFile) $Para(ModuleName).v
		}
		if {[string equal -nocase $Para(SourceFormat) "EDIF"]} {
			set Para(DesignEntry) "EDIF"
			set Para(TempFile) $Para(ModuleName).edn
		}
		if {[info exists netlist]} {
			if {[file size [file join $Para(CoreDir) "netlist" $netlist]] > 0} {
				set	sfile   [file join $Para(CoreDir) "netlist" $netlist]
				set	dfile	[file join $Para(ProjectPath) $Para(ModuleName).ld2]
				set	cpflag	"-y"
				switch $tcl_platform(platform) {
					windows {
#				set lsdbcp  [file join $Para(CoreDir) "../../../../.." bin lsdbcp.exe]
				set lsdbcp  [file join $Para(Bin) lsdbcp.exe]
					}
					unix {
#				set lsdbcp  [file join $Para(CoreDir) "../../../../.." bin lsdbcp]
				set lsdbcp  [file join $Para(Bin) lsdbcp]
					}
				}

				set nRet [exec $lsdbcp  $cpflag  $sfile  $dfile]
				if {$nRet == "0"} {
					if {[file exists $Para(ModelFile)] && [file size $Para(ModelFile)]}  {
						set msg "\tModule Name: $Para(ModuleName)\n\tCore Type: $Para(CoreName)\n\t$Para(DesignEntry) template: $Para(TempFile)\n\tNetlist output: $Para(ModuleName).ld2\n\tLPC file: $Para(ModuleName).lpc\n Module $Para(CoreName) has been generated successfully in $Para(ProjectPath)."
					} else  {
						set msg "\tModule Name: $Para(ModuleName)\n\tCore Type: $Para(CoreName)\n\tNetlist output: $Para(ModuleName).ld2\n\tLPC file: $Para(ModuleName).lpc\n Module $Para(CoreName) has been generated successfully in $Para(ProjectPath)."
					}
				} else {
					if {$nRet == "1"}  {
						set msg "ERROR - $Para(ModuleName).ld2 exists, overwrite flag is not specified."
					}
					if {$nRet == "2"}  {
						set msg "ERROR - $netlist is not accessable"
					}
					if {$nRet == "3"}  {
						set msg "ERROR - Can not get top design in $netlist."
					}
					if {$nRet == "4"}  {
						set msg "ERROR - Can not get top design name in $netlist."
					}
					if {$nRet == "5"}  {
						set msg "ERROR - Duplicated top design name in $netlist."
					}
					if {$nRet == "6"}  {
						set msg "ERROR - Can not save database."
					}
				}
			} else {
				if {[file exists $Para(ModelFile)] && [file size $Para(ModelFile)]}  {
					set msg "\tModule Name: $Para(ModuleName)\n\tCore Type: $Para(CoreName)\n\t$Para(DesignEntry) template: $Para(TempFile)\n\tLPC file: $Para(ModuleName).lpc\n Module $Para(CoreName) has been generated successfully in $Para(ProjectPath) without the detail netlist. \n Please contact Lattice Semiconductor to download the netlist."
				} else  {
					set msg "\tModule Name: $Para(ModuleName)\n\tCore Type: $Para(CoreName)\n\tLPC file: $Para(ModuleName).lpc\n Module $Para(CoreName) has been generated successfully in $Para(ProjectPath) without the detail netlist. \n Please contact Lattice Semiconductor to download the netlist."
				}
			}
		} else {
			if {[file exists $Para(ModelFile)] && [file size $Para(ModelFile)]}  {
				set msg "\tModule Name: $Para(ModuleName)\n\tCore Type: $Para(CoreName)\n\t$Para(DesignEntry) template: $Para(TempFile)\n\tLPC file: $Para(ModuleName).lpc\n Module $Para(CoreName) has been generated successfully in $Para(ProjectPath) without the detail netlist. \n Please contact Lattice Semiconductor to download the netlist."
			} else  {
				set msg "\tModule Name: $Para(ModuleName)\n\tCore Type: $Para(CoreName)\n\tLPC file: $Para(ModuleName).lpc\n Module $Para(CoreName) has been generated successfully in $Para(ProjectPath) without the detail netlist. \n Please contact Lattice Semiconductor to download the netlist."
			}
		}
#		tk_messageBox -default ok -icon info -message $msg -title "Generate" -type ok
		SendMessage $msg
	}
	return
}

proc Generate {} {
	global Para

	set Para(MessageList) ""

	if {[string length $Para(ModuleName)] == 0} {
		tk_messageBox -default ok -icon warning \
			-message "Please input Module Name!" \
			-title "Generate error" \
			-type ok
	} else {
		set ret [GenerateCB]
		if {$ret == -1} {
			tk_messageBox -default ok -icon warning \
				-message "One or more invalid parameters.\n   Please check configuration." \
				-title "Generate error" \
				-type ok
		} else {
			set ret [CreateLpcFile]
			#exit
		}
		return $ret
	}
}

proc Process {pin_name line_width} {
	global Para

	#case para+para*c
	set temp_list [split $line_width +]
	if {[llength $temp_list] == 2} {
		set para1 [lindex $temp_list 0]
		set temp_list [split [lindex $temp_list 1] *]
		set para2 [lindex $temp_list 0]
		set para3 [lindex $temp_list 1]
		set temp1 [expr $Para($para1) - 1]
		set temp2 [expr [expr $Para($para2)*$para3] - 1]
		set pin_name $pin_name\[$temp1:0\]\[$temp2:0\]
		set line_width 3
		return [list $pin_name $line_width]
	}

	#case para/c
	set temp_list [split $line_width /]
	if {[llength $temp_list] == 2} {
		set para1 [lindex $temp_list 0]
		set para2 [lindex $temp_list 1]
		set temp [expr [expr $Para($para1)/$para2] - 1]
		set pin_name $pin_name\[$temp:0\]
		set line_width 3
		return [list $pin_name $line_width]
	}

	#case para*c
	set temp_list [split $line_width *]
	if {[llength $temp_list] == 2} {
		set para1 [lindex $temp_list 0]
		set para2 [lindex $temp_list 1]
		set temp [expr [expr $Para($para1)*$para2] - 1]
		set pin_name $pin_name\[$temp:0\]
		set line_width 3
		return [list $pin_name $line_width]
	}

	#case [0:para] or [32:15]
	set temp_list [split $line_width :]
	if {[llength $temp_list] == 2} {
		set para1 [lindex $temp_list 0]
		set para2 [lindex $temp_list 1]
		#case para
		if [string match -nocase {[a-z]*} $para2] {
			set temp0 0
			set temp [expr $Para($para2)-1]
		} else {
		#case c
			set temp0 [expr $para1-1]
			set temp [expr $para2-1]
		}
		set pin_name $pin_name\[$temp0:$temp\]
		set line_width 3
		return [list $pin_name $line_width]
	}

	#case 0
	if {$line_width == 0} {
		set line_width 1
	} else {
		#case para
		if [string match -nocase {[a-z]*} $line_width] {
			set temp [expr $Para($line_width)-1]
			set pin_name $pin_name\[$temp:0\]
		} else {
			#case c
			set temp [expr $line_width -1]
			set pin_name $pin_name\[$temp:0\]
		}
		set line_width 3
	}
	return [list $pin_name $line_width]
}

#**********************************************************************
# Function template for draw all pins twice or more for ispIPExpress.
#**********************************************************************
proc DrawPins {pin_name_list pin_direction_list bus_width_list pin_side_list} {
	global Para ft

	set diagram $Para(cfg_canvas)

	set H [$diagram cget -height]
	set W [$diagram cget -width]

	# clear all items in canvas
	$diagram addtag allpins all
	$diagram delete allpins

	# draw all items in canvas
	$diagram create text [expr $W/2] 20 -text $Para(CoreName)

	set rect(x) 35
	set rect(y) 40
	set rect(width) [expr $W-70]
	set rect(height) [expr $H-60]

	set left_pin_num [expr [lindex $pin_side_list 0]-1]
	set right_pin_num [expr [lindex $pin_side_list 1]-1]

	#--- draw left pin ---
	set left_pin_name [lrange $pin_name_list 0 $left_pin_num]
	set left_pin_direction [lrange $pin_direction_list 0 $left_pin_num]
	set left_bus_width [lrange $bus_width_list 0 $left_pin_num]
	set incr_y [expr $rect(height)/[expr $left_pin_num+2]]
	set y [expr $rect(y)+$incr_y]
	foreach pin_name $left_pin_name arrow_direction $left_pin_direction \
		line_width $left_bus_width {

		if {[string length $pin_name] == 0} {
			set y [expr {$y+$incr_y}]
			continue
		}
		set temp_list [Process $pin_name $line_width]
		set pin_name [lindex $temp_list 0]
		set line_width [lindex $temp_list 1]

		$diagram create text [expr $rect(x)+2] $y -anchor w -text $pin_name -font $ft

		if {$arrow_direction == "0"} {
			set arrow_direction "last"
		} elseif {$arrow_direction == "1"} {
			set arrow_direction "first"
		} else {
			set arrow_direction "both"
		}
		$diagram create line 10 $y $rect(x) $y -arrow $arrow_direction \
			-width $line_width
		set y [expr {$y+$incr_y}]
	}

	#--- draw right pin ---
	set right_pin_name [lrange $pin_name_list [lindex $pin_side_list 0] end]
	set right_pin_direction [lrange $pin_direction_list [lindex $pin_side_list 0] end]
	set right_bus_width [lrange $bus_width_list [lindex $pin_side_list 0] end]
	set incr_y [expr $rect(height)/[expr $right_pin_num+2]]
	set y [expr $rect(y) + $incr_y]
	foreach pin_name $right_pin_name arrow_direction $right_pin_direction \
		line_width $right_bus_width {

		if {[string length $pin_name] == 0} {
			set y [expr {$y+$incr_y}]
			continue
		}
		set temp_list [Process $pin_name $line_width]
		set pin_name [lindex $temp_list 0]
		set line_width [lindex $temp_list 1]
		$diagram create text [expr $W-37] $y -anchor e -text $pin_name -fill #000000 -font $ft

		if {$arrow_direction == "0"} {
			set arrow_direction "first"
		} elseif {$arrow_direction == "1"} {
			set arrow_direction "last"
		} else {
			set arrow_direction "both"
		}
		$diagram create line [expr $W-34] $y [expr $W-10] $y -arrow $arrow_direction \
			-width $line_width
		set y [expr {$y+$incr_y}]
	}
	$diagram create rectangle $rect(x) $rect(y) [expr {$rect(x)+$rect(width)}] \
		[expr {$rect(y)+$rect(height)}]
}

#****************************************************
# Function template for ispIPExpress graphical image
#****************************************************
proc DrawImage {W H pin_name_list pin_direction_list bus_width_list pin_side_list} {
	global ft tcl_platform Para

	set f1 $Para(f1)
	if {$tcl_platform(platform) == "windows"}  {
		set dt [expr [font metrics $ft -ascent]-11]
		set w_n [expr $W/20]
		set h_n [expr $H/20]
		set W [expr $W+$dt*$w_n]
		set H [expr $H+$dt*$h_n]
	}

	set diagram [canvas $f1.diagram -width $W -height $H -relief sunken \
		-borderwidth 2 -bg #ffffff]

	set Para(cfg_canvas) $diagram
	DrawPins $pin_name_list $pin_direction_list $bus_width_list $pin_side_list
	pack $diagram -side left

	return $diagram
}

#*******************************************
# IP Core revision control for R3.1
#*******************************************
proc RevisionControl {}  {
	global Para

	frame .frmRevision
	CreateLabelEntry .frmRevision Eval "Eval Package:  ver" "" 6 w left Para(CoreRevision)
	pack .frmRevision -in .page -side top
	.entryEval config -state disabled
}

#*******************************************
# Function template for controls of pins and
# attributes of the IP core for ispIPExpress
#*******************************************
proc AttributeSetting {W H {tab_list {}} {page_one_list {}}} {
	global ft tcl_platform Para

	set f1 $Para(f1)

	#frame .page
	#pack .page -in .right -side top -fill both -expand 1

	# Add revision control here
	#RevisionControl

	if {$tcl_platform(platform) == "windows"}  {
		set dt [expr [font metrics $ft -ascent]-11]
		set w_n [expr $W/20]
		set h_n [expr $H/20]
		set W [expr $W+$dt*$w_n]
		set H [expr $H+$dt*$h_n]
	}

	set tnb [iwidgets::tabnotebook $f1.tnb -width $W -height $H -borderwidth 1 \
		-backdrop [. cget -bg] -tabpos n -equaltabs false \
		-raiseselect true -background [. cget -background]]
	pack $f1.tnb -side left

        set Para(tnb) $tnb

	return $tnb

#	.tnb view 0
}

proc GetHelpID {topic} {
	switch $topic {
		"Triple Speed Ethernet Media Access Controller"		{return 1037}
		"Tri_Speed_Ethernet_MAC"		{return 1037}

		"PCI Master/Target"				{return 1037}
		"PCI_Master"					{return 1037}
		"PCI_Master_2"					{return 1037}
		"PCI_Master_3"					{return 1037}
		"PCI_Master_5"					{return 1037}
		"PCI_Master_4"					{return 1037}

		"PL3 LNK Layer"					{return 1037}
		"PL3_LNK_Layer_Setting"			{return 1037}
		"PL3_LNK_Layer_txrx"			{return 1037}

		"PL3 PHY Layer"					{return 1037}
		"PL3_PHY_Layer_Setting"			{return 1037}
		"PL3_PHY_Layer_txrx"			{return 1037}

		"UTOPIA3 Master"				{return 1037}
		"Utopia3_Master"				{return 1037}
		"Utopia3_Master_Receive"		{return 1037}

		"UTOPIA3 Slave"					{return 1037}
		"Utopia3_Slaver"				{return 1037}
		"Utopia3_Slaver_Receive"		{return 1037}

		"PCI Target"					{return 1037}
		"PCI_Target"					{return 1037}
		"PCI_Target1"					{return 1037}
		"PCI_Target2"					{return 1037}
		"PCI_Target3"					{return 1037}
		"DDR SDRAM Controller"			{return 1037}
		"MC DMA Controller"				{return 1037}
		"Reed-Solomon Encoder"			{return 1037}
		default							{return 1037}
	}
}

#proc HelpCB {} {
#	global Para tcl_platform
#
##	set helpdir [file join $Para(TemplateDir) "../../../../.." "webhelp/mergedProjects/ispmg"]
#	set helpdir [file join $Para(Root) "webhelp/mergedProjects/ispmg"]
#	set helpfile [file join $helpdir "ispmg.htm"]
#	set Para(topic) "isplevercores.htm"
#	set helpfile "$helpfile\#$Para(topic)"
#	set Para(TmpHelpFile) [file join $Para(ProjectPath) "webhelp_tmp.htm"]
#
#	if [catch {open $Para(TmpHelpFile) w} fileId] {
#		tk_messageBox -default ok -icon error \
#			-message "Cannot open file: $outFile!" \
#			-title "Write file error" \
#			-type ok
#		return -1
#	}
#
#	puts $fileId "<html>"
#	puts $fileId "<body>"
#	puts $fileId "<script language=\"JavaScript\">"
#	puts $fileId "<!--"
#	puts $fileId "var sURL = \"file://$helpfile\";"
#	puts $fileId "document.location.href=sURL;"
#	puts $fileId "//-->"
#	puts $fileId "</script>"
#	puts $fileId "</body>"
#	puts $fileId "</html>"
#
#	close $fileId
#
#	switch $tcl_platform(platform) {
#		windows {exec "cmd.exe" /C $Para(TmpHelpFile) &}
#		unix    {exec "mfcie" $Para(TmpHelpFile) &}
#	}
#}

##*******************************************
## Function template for Function Buttons.
##*******************************************
#proc FunctionButton {} {
#	global ft types Para
#
#	frame .bottom
#	frame .sep -width 280 -height 2 -borderwidth 1 -relief sunken
#	frame .button
#	button .generate -text "Generate" -font $ft -width 8 -command Generate
#	button .loadpara -text "Load Parameters.." -font $ft -command {
##		set init_dir [file join $Para(CoreDir) "lpc"]
#		set parameter_file [tk_getOpenFile -filetypes $types -initialdir $Para(ProjectPath)]
#		if {[string length $parameter_file] > 0} {
#			set answer [tk_messageBox -icon warning \
#				-message "This function will replace previous configuration! Continue?" \
#				-title "Load Parameters" \
#				-type yesno]
#			if {$answer == "yes"} {
#				LoadParameter $Para(CoreName) $parameter_file
#			}
#		}
#	}
#	button .cancel -text "Cancel" -font $ft -width 8 -command {
#		set msg "The module generation has been canceled."
#		SendMessage $msg
#		#exit
#		}
#	button .help -text "Help" -font $ft -width 8 -command {catch HelpCB}
#	pack .generate .loadpara .cancel .help -in .button -side left -padx 3
#	pack .sep .button -in .bottom -side top -pady 4
#	pack .bottom -in .right -side top -pady 4 -fill x
#}

#*******************************************
# Function template for parameters dialog window.
#*******************************************
proc MainInterface {{WxH {}}} {
	global argv argc Para

#	if [string length $WxH] {wm geometry . $WxH}
	#wm resizable . 0 0
	frame .left
	frame .right
	pack .left .right -side left -padx 7 -pady 7 -fill x
}

set types {
	{"LPC files"		{.lpc}	}
	{"All files"		*}
}

proc ReadInfFile {} {
	global Para device_list device_support entry_list

#	set info_file [file join $Para(CoreDir) "core_interface.inf"]
	set info_file [file join $Para(inf) "core_interface.inf"]
	if [catch {open $info_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $info_file." \
			-title "Open file error - ReadInfFile" \
			-type ok
		set err_msg "ERROR - Cannot open $info_file."
		SendMessage $err_msg
		#exit
	}

	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[Vendor\]"] == 0} {
			set p Para
			continue
		}
		if {[string compare -nocase $line "\[Device Support\]"] == 0} {
			set p device_support
			continue
		}
		if {[string compare -nocase $line "\[Device\]"] == 0} {
			set p device_list
			continue
		}
		if {[string compare -nocase $line "\[DesignEntry\]"] == 0} {
			set p entry_list
			continue
		}
		if {[string compare -nocase $line "\[SDS]"] == 0} {
			set p Para
			continue
		}
		if [regexp {([^=]*)=(.*)} $line match parameter value] {
			if [regexp {([ |\t]*;)} $parameter match] {continue}
			if [regexp {(.*)[ |\t]*;} $value match temp] {
				set ${p}($parameter) $temp
			} else {
				#process "LFX1200B-05F900C ="
				set parameter [string trim $parameter]
				set ${p}($parameter) $value
			}
		}
	}
	close $fileid
}

proc ReadSDSFile {} {
	global Para device_list device_support entry_list

#	set sds_file [file join $Para(CoreDir) "../../../../.." config $Para(SDS)]
	set sds_file [file join $Para(Config) $Para(DeviceFile)]
	if {[file exists $sds_file] == 0} {
		set dir [tk_chooseDirectory -initialdir $Para(ProjectPath) -title "Specify the SDS file"]
		if [string compare $dir ""] {
			set sds_file [file join $dir $Para(DeviceFile)]
		} else {
			tk_messageBox -default ok -icon warning \
				-message "Not specify the location of SDS file." \
				-title "Open file error - ReadSDSFile" \
				-type ok
			#exit
		}
	}

	if [catch {open $sds_file r} fileid] {
		tk_messageBox -default ok -icon warning \
			-message "Cannot open $sds_file." \
			-title "Open file error - ReadSDSFile" \
			-type ok
		set err_msg "ERROR - Cannot open $sds_file."
		SendMessage $err_msg
		#exit
	}

	if [info exists device_support]  {
		unset device_support
	}
	if [info exists device_list]  {
		unset device_list
	}
	set read_flag 0
	while {[gets $fileid line] >= 0} {
		if {[string compare -nocase $line "\[Device Support\]"] == 0} {
			set p device_support
			set read_flag 1
			continue
		}
		if {[string compare -nocase $line "\[Generic Devices\]"] == 0} {
			set p device_list
			set read_flag 1
			continue
		}
		if {[string compare -nocase $line "\[Schematic/VHDL\]"] == 0} {
			set read_flag 0
			continue
		}
		if {[string compare -nocase $line "\[EDIF\]"] == 0} {
			set read_flag 0
			continue
		}
		if {[string compare -nocase $line "\[Schematic/Verilog HDL\]"] == 0} {
			set read_flag 0
			continue
		}
		if {[string compare -nocase $line "\[Device Families\]"] == 0}  {
			set read_flag 1
			set p device_family
			continue
		}
		if $read_flag {
			if [regexp {([^=]*)=(.*)} $line match parameter value] {
				if [regexp {([ |\t]*;)} $parameter match] {continue}
				if [regexp {(.*)[ |\t]*;} $value match temp] {
					set ${p}($parameter) $temp
					if {$p == "device_family"}  {
						set Para(Family) $parameter
						set read_flag 0
					}
				} else {
					#process "LFX1200B-05F900C ="
					set parameter [string trim $parameter]
					set ${p}($parameter) $value
					if {$p == "device_family"}  {
						set Para(Family) $parameter
						set read_flag 0
					}
				}
			}
		}
	}
	close $fileid
}

proc ReadCoreInfo {} {
	#ReadInfFile
	ReadSDSFile
}

proc GetDeviceInfo {} {
	global Para device_list device_support

#Format=DevFile,Device,Speed,Package,Condition,Info,VCIfile,Status,PkgName,DiePkgName

	set temp_list [split $device_list($Para(PartName)) ,]
	if {[info exists device_support(Format)]==0} {
#		set Para(Family) $device_support(DieName)
		set Para(PartType) [lindex $temp_list 1]
		set Para(SpeedGrade) [lindex $temp_list 3]
		set Para(Package) [lindex $temp_list 4]
		set Para(OperatingCondition) [lindex $temp_list 5]
		set Para(Status) [lindex $temp_list 6]
	} else {
		set format_list [split $device_support(Format) ,]
#		set Para(Family) [string tolower $device_support(DieName)]
		set idx [lsearch -regexp $format_list {^[dD][eE][vV][iI][cC][eE]$}]
		if {$idx!=-1} {set Para(PartType) [lindex $temp_list $idx]}
		set idx [lsearch -regexp $format_list {^[sS][pP][eE][eE][dD]$}]
		if {$idx!=-1} {set Para(SpeedGrade) [lindex $temp_list $idx]}
		set idx [lsearch -regexp $format_list {^[pP][aA][cC][kK][aA][gG][eE]$}]
		if {$idx!=-1} {set Para(Package) [lindex $temp_list $idx]}
		set idx [lsearch -regexp $format_list {^[cC][oO][nN][dD][iI][tT][iI][oO][nN]$}]
		if {$idx!=-1} {set Para(OperatingCondition) [lindex $temp_list $idx]}
		set idx [lsearch -regexp $format_list {^[sS][tT][aA][tT][uU][sS]$}]
		if {$idx!=-1} {set Para(Status) [lindex $temp_list $idx]}
	}
}

#**********************************************
#Common dialog window for set project info
#**********************************************
proc ProjectSet {} {
	global env Para argc argv argv0 device_list device_support ft

	if [info exists env(params_switch)] {
		set Para(params_switch) "on"
	} else  {
		set Para(params_switch) "off"
	}

	SetFont

	option add *font $ft
	option add *textFont $ft
	option add *labelFont $ft

	wm withdraw .

	set Para(guiRect) "[winfo screenwidth .]x[winfo screenheight .]+0+0"
#	set Para(ProjectPath) [file dirname [info script]]
#	set Para(CoreDir) [file join [pwd] [file dirname [info script]]]
	set Para(ProjectPath) $Para(CoreDir)
	GetEnvVariables
	ReadCoreInfo
	set family $Para(Family)

	set Para(invoke) 0
	set Para(pinvoke) 0

	if {$argc > 0} {
		for {set i 0} {$i < $argc} {incr i 2} {
			set temp [lindex $argv $i]
			set temp [string range $temp 1 end]
			lappend argv_list $temp
			lappend value_list [lindex $argv [expr $i+1]]
		}
		if {[info exist Para(ModuleName)] == 0} {
			#set Para(ParaFile) [file join $Para(CoreDir) "gui" "default.lpc"]
			set Para(ParaFile) [file join $Para(lpc) "default.lpc"]
			set i [LoadDefaultParameter $Para(CoreName) $Para(ParaFile)]
			#if {$i == -1} {exit}
		}
		foreach argument $argv_list value $value_list {
			switch $argument {
				#"invoke" {set Para(invoke) 1}
				"path" {set Para(ProjectPath) $value; set Para(pinvoke) 1}
				"projname" {set Para(ProjectName) $value; set Para(pinvoke) 1}
				"module" {
					set Para(ModuleName) $value
					if {[string first "." $value] == -1} {
						set Para(LpcFile) [append value ".lpc"]
					} else {
						set Para(LpcFile) $value
					}
					set Para(ParaFile) [file join $Para(ProjectPath) $Para(LpcFile)]
					if [file exists $Para(ParaFile)] {
						set i [LoadDefaultParameter $Para(CoreName) $Para(ParaFile)]
						#if {$i == -1} {exit}
					} else {
#						tk_messageBox -default ok -icon warning \
#							-message "Configuration file doesn't exist!" \
#							-title "Open error" \
#							-type ok
#						#exit
					}
				}
				"device" {
					set found FALSE
					foreach pn [array names device_list] {
						if {[string compare -nocase $pn $value] == 0} {
							set found TRUE
							set Para(PartName) $pn
							break
						}
					}
					if {$found == "FALSE"} {
						set msg "This type device isn't support this Module!"
						set tit "Open error"
						tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
						#exit
					}

					GetDeviceInfo
				}
				"design" {set Para(SourceFormat) $value}
				#"modname" {set Para(ModuleName) $value}
				"rect" {set Para(guiRect) $value}
			}
		}

	} else {
		#set Para(ParaFile) [file join $Para(CoreDir) "gui" "default.lpc"]
		set Para(ParaFile) [file join $Para(lpc) "default.lpc"]
		set i [LoadDefaultParameter $Para(CoreName) $Para(ParaFile)]
		#if {$i == -1} {exit}
	}
#	focus .
	set Para(Family) $family

#	if {$Para(invoke) == "0"} {
#
#		set w .commonWindow
#		toplevel .commonWindow
#		#wm resizable .commonWindow 0 0
#
#		wm title .commonWindow $Para(CoreName)
#		bind .commonWindow <Destroy> {exit}
#		wm protocol . WM_DELETE_WINDOW {wm withdraw .}
#
#		ProjectInfo
#		ModuleNameInfo
#		frame $w.middle
#		frame $w.middle.left
#		frame $w.middle.right
#		pack $w.middle -side top -pady 4
#		pack $w.middle.left $w.middle.right -side left -padx 4
#		CoreStatusTypeInfo
#		DeviceListInfo
#		DesignEntryInfo
#		OutputFilesInfo
#		ButtonSetting
#
#		focus .commonWindow.modulename.entName
#	}
}

proc DspOutputFiles {} {
	global output_files_list Para

	catch SetOutputFilesCB
	.commonWindow.middle.right.files.slFiles clear
	if {[string length $Para(ModuleName)] > 0} {
		set j 0
		foreach i $output_files_list {
			.commonWindow.middle.right.files.slFiles insert $j $i
			incr j
		}
	}
}
#proc ProjectInfo {} {
#	global ft Para
#	set w [frame .commonWindow.path]
#	label $w.lblDir -text "Project Directory:" -font $ft -width 15 -anchor e
#	entry $w.entDir -width 30 -textvariable Para(ProjectPath)
#
#	button $w.btnBrowse -text "Browse.." -command {
#		set dir [tk_chooseDirectory -initialdir $Para(ProjectPath)]
#		if [string compare $dir ""] {
#			set Para(ProjectPath) $dir
#		}
#	}
#	pack $w.lblDir $w.entDir $w.btnBrowse -side left
#	pack .commonWindow.path -side top -anchor w -pady 4
#}

#proc ModuleNameInfo {} {
#	global ft Para
#	set w [frame .commonWindow.modulename]
#	label $w.lblName -text "Module Name:" -font $ft -width 15 -anchor e
#	entry $w.entName -width 30 -validate key -vcmd {
#		after idle {
#			DspOutputFiles
#		}
#		return 1
#	} -textvariable Para(ModuleName)
#	pack $w.lblName $w.entName -side left
#	pack .commonWindow.modulename -side top -anchor w -pady 4
#}

#proc CoreStatusTypeInfo {} {
#	global ft Para
#	set w [frame .commonWindow.middle.left.type]
#	label $w.lblType -text "Core Type:" -font $ft -width 10 -anchor e
##	entry $w.entType -textvariable Para(CoreType) -state disabled -width 16
#	label $w.entType -text $Para(CoreType) -width 16 -font $ft -anchor w
#	pack $w.lblType $w.entType -side left -padx 4
#	pack .commonWindow.middle.left.type -side top -pady 4 -anchor w
#
#	set w [frame .commonWindow.middle.left.status]
#	label $w.lblStatus -text "Core Status:" -font $ft -width 10 -anchor e
##	entry $w.entStatus -textvariable Para(CoreStatus) -state disabled -width 16
#	label $w.entStatus -text $Para(CoreStatus) -width 16 -font $ft -anchor w
#	pack $w.lblStatus $w.entStatus -side left -padx 4
#	pack .commonWindow.middle.left.status -side top -pady 4 -anchor w
#}

#proc DeviceListInfo {} {
#	global ft Para device_list
#	set w [frame .commonWindow.middle.left.device]
#	label $w.lblDevice -text "Device:" -font $ft -width 11 -anchor e
#	iwidgets::combobox $w.cboDevice -width 20 -editable false -textvariable Para(PartName)
#	pack $w.lblDevice $w.cboDevice -side left
#	pack .commonWindow.middle.left.device -side top -pady 4 -anchor w
#	foreach {partname value} [array get device_list] {
#		$w.cboDevice insert list end $partname
#	}
#	$w.cboDevice configure -selectioncommand {
#		GetDeviceInfo
#		DspOutputFiles
#	}
#}

#proc DesignEntryInfo {} {
#	global ft Para entry_list
#	set w [frame .commonWindow.middle.left.entry]
#	label $w.lblEntry -text "Design Entry:" -font $ft -width 11 -anchor e
#	iwidgets::combobox $w.cboEntry -width 20 -editable false -textvariable Para(SourceFormat)
#	pack $w.lblEntry $w.cboEntry -side left
#	pack .commonWindow.middle.left.entry -side top -pady 4 -anchor w
#	foreach i [split $entry_list(Type) ,] {
#		$w.cboEntry insert list end $i
#	}
#	$w.cboEntry configure -selectioncommand {
#		DspOutputFiles
#	}
#}

#proc OutputFilesInfo {} {
#	global ft Para
#	set w [frame .commonWindow.middle.right.files]
#	iwidgets::scrolledlistbox $w.slFiles -labeltext "Output Files:" \
#		-vscrollmode dynamic -hscrollmode none -selectmode single \
#		-labelpos nw -relief sunken -borderwidth 2 \
#		-width 180 -height 120
#	DspOutputFiles
#	pack $w.slFiles -side top
#	pack .commonWindow.middle.right.files
#}

#proc DataSheetCB {} {
#	global Para tcl_platform
#
#	set data_file [file join $Para(CoreDir) datasheet datasheet.pdf]
#	switch $tcl_platform(platform) {
#		windows {
#	set open_cmd [file join $Para(ManagerDir) bin OpenDatasheet.exe]
#		}
#		unix {
#	set open_cmd [file join $Para(ManagerDir) bin opendatasheet]
#		}
#	}
#	if [file exists $data_file] {
#		exec $open_cmd $data_file &
#	} else {
#		tk_messageBox -default ok -icon warning \
#			-message "No datasheet.pdf file!" \
#			-title "Open DataSheet" \
#			-type ok
#	}
#	focus .commonWindow
#}

#proc MainHelpCB {} {
#	global Para tcl_platform
#
#	set help_file [file join $Para(ManagerDir) ".." bin ispmg.hlp]
#	switch $tcl_platform(platform) {
#		windows {
#	set openfile  [file join $Para(ManagerDir) bin OpenHelp.exe]
#		}
#		unix {
#	set openfile  [file join $Para(ManagerDir) bin openhelp]
#		}
#	}
#	set topic Entry_Window
#	set nID [GetHelpID $topic]
#
#	if [file exists $help_file] {
#		exec $openfile $help_file $nID &
#	} else {
#		tk_messageBox -default ok -icon warning \
#			-message "No help file!" \
#			-title "Open GUI Help" \
#			-type ok
#	}
#	focus .commonWindow
#}

#proc ButtonSetting {} {
#	global ft Para
#	set w [frame .commonWindow.button]
#	button $w.customize -text "Customize.." -font $ft -command {
#		if {[string length $Para(ModuleName)] == 0} {
#			tk_messageBox -default ok -icon warning \
#				-message "Please input Module Name!" \
#				-title "Generate error" \
#				-type ok
#		} else {
#			wm deiconify .
#		}
#	}
#	button $w.datasheet -text "Datasheet" -font $ft -command DataSheetCB
#	button $w.close -text "Close" -width 8 -command {exit} -font $ft
#	button $w.help -text "Help" -width 9 -command MainHelpCB -font $ft
#	pack $w.customize $w.close -side left -padx 6
#	pack .commonWindow.button -side top -pady 4
#}
