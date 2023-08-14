

proc ARCHIVE:write_file  {out   files {prefix "" } {encode 1}} {
    global Application_state

    foreach file $files {
	if [file isdirectory $file] {
	    ARCHIVE:write_file $out  [glob -nocomplain [file join $file *]]  "$prefix" $encode
	} else {
	    set in [open "| $Application_state(path,perl) [CONFIG:find_file pilot_uuencode.pl] $file " r]
	    set bytes [file size $file]
	    puts $out "\n${prefix}FILE:$file $bytes"
	    while {! [eof $in] } {
		puts -nonewline $out  [read  $in 50000]
	    }
	    close $in
	}
    }
}

proc ARCHIVE:write_collect  {files list} {
    upvar $list mylist
    foreach file $files {
	puts -nonewline  "$file"
	if [file isdirectory $file] {
	    ARCHIVE:write_collect  [glob -nocomplain [file join $file *]]  mylist
	} else {
	    lappend mylist $file
	}
    }
}



proc ARCHIVE:write {archive_name hdr files  {prefix ""} {encode 1}} {
    set out [open $archive_name w]
    puts  $out "${prefix}BEGIN_PROLOG"
    puts  $out "$hdr"
    puts  $out "${prefix}END_PROLOG"
    ARCHIVE:write_file $out  "$files"  "$prefix" $encode
    close $out
}


proc ARCHIVE:read {archive_name {prefix ""} {suffix ""} {check_on_overwrite 1} } {
    set in [open $archive_name r]
    set line ""

    #Read archive  header
    set didprolog 0
    
    set hdr ""
    while {![eof $in]} {
	if [catch "gets $in line"] {
	    return ""
	}

	if [regexp {END_PROLOG} "$line"] {break}
	if {![regexp {BEGIN_PROLOG} "$line"]} {
	    set hdr "$hdr$line\n"
	} else {
	    set didprolog 1
	}
    }

    if {!$didprolog } {
	tk_messageBox  -type ok -default ok -message "The file: $archive_name, does not seem to be a valid archive"
	close $in
	return
    }

    option add *Dialog.msg.wrapLength 6i 
    set ret [tk_messageBox  -type yesno -default yes -message "Read archive:\n$hdr\nProceed?\n"] 


    if [string compare yes $ret] {
	close $in
	return""
    }


    set bytes 0
    set newfile ""
    set match ""

    set write_ok 0
    set files  [list]
    set out ""

    global Application_state
    while {1} {
	if [catch "gets $in line"] {
	    return ""
	}
	if [eof $in] {
	    catch "close  $out"
	    break
	}


	if {[regexp  {^.*FILE:([^ ]+)[ ]+([0-9]+)$} "$line" match file bytes]} {
	    set write_ok 1
	    catch "flush $out"
	    catch "close $out"
	    set target $prefix$file$suffix 
	    if [regexp {^(\/|\~|\.\.)} $target] {
		set ret [Widget:tkMessageBox -icon warning -type "absolute-Save as full path:file-Save as [file tail $target]:skip-Skip this file" \
			-default absolute \
			-message "A file has been encountered with an absolute path:\n$target.\n\
			What should I do: \n"

		]

		switch $ret {
		    absolute {}
		    skip {set writeOk 0}
		    file {
			set target  [file tail $target]
		    }
		}
	    } else {
		set dir [file dirname $target]
		if [string length $dir] {
		    if {![file exists $dir]} {
			file mkdir $dir 
		    }
		}
	    }
	
	    if {$write_ok && [file exists $target]  && $check_on_overwrite} {
		set ret [Widget:tkMessageBox -icon question -type "yes-Overwrite:cancel-Overwrite all:no-Do not overwrite" -default yes  -message "File: $target exists.\nWhat should I do? "]

		switch $ret {
		    no     {set write_ok 0}
		    cancel {set check_on_overwrite 0}
		}
	    }

	    set out [open "| $Application_state(path,perl) [CONFIG:find_file pilot_uudecode.pl]  $target" w]

	    if {$write_ok} {
		lappend files $target
	    }
	} else {
	    if {$write_ok} {
		puts -nonewline $out "$line"
	    }
	}
    }
    close $in
    return "$files"
}






proc ARCHIVE:init_once {} {
    
    catch {if [CONFIG:called ARCHIVE] "return"}

    global ARCHIVE_state Application_state
    set ARCHIVE_state(abort) 0
    if {[catch "CONFIG:find_file FOOBAR"]} {proc CONFIG:find_file {f} {return $f}}
    
    if {![info exists Application_state(path,perl)]} {set Application_state(path,perl) perl}
}


ARCHIVE:init_once





