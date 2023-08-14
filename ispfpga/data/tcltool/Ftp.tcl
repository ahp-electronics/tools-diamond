

proc FTP:open {to {port 21}} {
    set fd ""
    global FTP_state

    if {[string length [string trim $to]] == 0} {
	FTP_staterm  "Error: No ftp server specified\n" error
	return $fd
    }


    FTP_staterm "Opening connection to: $to\n"

    if {[catch "socket -async $to $port" fd]} {
	FTP_staterm "I was unable to open an ftp connection to: $to due to the following reason:\n"  error
	FTP_staterm "$fd\n\n" error
	FTP_staterm "You could try  ftp'ing the file on the command line.\n"; 
	FTP_staterm "\tftp $FTP_state(to)\n\tlogin as $FTP_state(user)\n\tPassword:  $FTP_state(passwd)\n"
	FTP_staterm "\tcd $FTP_state(destdir)\n\tput  $FTP_state(destfile)\n"
	return ""
    }
    fconfigure $fd -blocking 0	
    return $fd
}



proc FTP:write_file {} {
    global FTP_state

    if {[catch "open $FTP_state(file)" in]} {
	FTP:error "Could not open file: $FTP_state(file)"
	return 
    }

    while {1} {
	if {[eof $in]} { break}
	set line [read $in 10000]
##	set line [gets $in]
	if [catch "puts -nonewline  $FTP_state(data_fd) \"$line\"" err] {
	    FTP:error "FTP write_file  failed: $err"
	    return 
	}
	flush $FTP_state(data_fd) 
    }
    close $FTP_state(data_fd) 
    close $in
}







proc FTP:write {line} {
    global FTP_state
    if [catch "puts $FTP_state(cntl_fd) \"$line\"" res] {
	FTP:error "FTP write error: $res"
    } else {
	flush $FTP_state(cntl_fd) 
    }
}



proc FTP_staterm {msg {tag ""} } {
    global FTP_state

    if {![winfo exists $FTP_state(text)]} {
	puts $msg
    } else {
	$FTP_state(text) insert end "$msg" $tag
	$FTP_state(text) see    end 
    }
}


proc FTP:read {} {
    global FTP_state
    set line ""
    set bytes  0
    if {[catch "gets $FTP_state(cntl_fd) line" bytes]} {
	FTP:error "FTP read error: $bytes"
	return
    }
    set FTP_state(response) 0
    set FTP_state(line) "$line"
    if {$bytes > 0} {
	regexp {([0-9]+) *} "$line" all FTP_state(response)
    }
    return $bytes

}






proc FTP:set_src {} {
    global FTP_state
    set fn [tk_getOpenFile  -initialfile $FTP_state(file)]
    if {$fn != ""} {
	set FTP_state(file) $fn;
	set FTP_state(destfile) [file tail $fn]
	set  FTP_state(filed)  $FTP_state(destfile) 
    }
}


proc FTP:create_gui {} {
    global FTP_state
    if  {![winfo exists .ftp_dialog]} {
	set t [toplevel .ftp_dialog]
	set txt [frame $t.txt]
	set msg_text [text $txt.text -relief sunken -bd 2 -yscrollcommand "$txt.scroll set" -width 60 ]
	$msg_text tag configure  error -foreground red
	$msg_text tag configure  warning -foreground orange
	$msg_text tag configure  ok -foreground green
	$msg_text tag configure  cmd -foreground blue


	set FTP_state(text)  $msg_text
	scrollbar $txt.scroll -command "$msg_text yview"
	pack $txt.scroll -side right -fill y
	pack $msg_text -side left -expand 1 -fill both 

	set cmds1 [frame $t.cmds1]
	set cmds2 [frame $t.cmds2]

	set wcmds [frame $t.wcmds]

	set sendb [button $cmds1.send  -text "Send" -command    "FTP:init_run"]
	set abortb [button $cmds1.abort -text "Abort" -command  "FTP:abort" ]


	set tol  [label $cmds2.tobl -text "Ftp To:" -anchor e]
	set toe  [entry $cmds2.toe -textvariable FTP_state(to)  -width 20]
	set usrl  [label $cmds2.usrl -text "As User:" -anchor e]
	set usre  [entry $cmds2.usre -textvariable FTP_state(user)  -width 20]
	set passl  [label $cmds2.passl -text "Password:" -anchor e]
	set passe  [entry $cmds2.passe -textvariable FTP_state(passwd)  -width 20 -show *]


	set srcl [label $cmds2.srclbl -text "Source file:" -anchor e]
	set FTP_state(filed) [file tail  $FTP_state(file)]
	set srcb [label $cmds2.src  -textvariable  FTP_state(filed) -width 15 -anchor w -bd 1 -relief groove]
	set browseb [button $cmds2.browse  -text "Browse" -command  "FTP:set_src" ]

	foreach b "$browseb $sendb $abortb" {
	    $b config -padx 1 -pady 1 -highlightthickness 0
	}

 
	set ddirl [label $cmds2.destdirlbl -text "Destination directory:"]
	set ddire [entry $cmds2.destdir -textvariable FTP_state(destdir)  -width 20]

	set dfilel [label $cmds2.destfilelbl -text "Destination file:"]
	set dfilee [entry $cmds2.destfile -textvariable FTP_state(destfile)  -width 20]

	pack   $sendb $abortb -side left 


	set row 0
	grid $tol $toe -row $row -sticky ew -padx 2 -pady 2
	incr row
	grid $usrl $usre $passl $passe -row $row -sticky ew -padx 2 -pady 2
	incr row
	grid $srcl $srcb $browseb -row $row -sticky ew -padx 2 -pady 2
	incr row
	grid $ddirl $ddire $dfilel $dfilee -row $row -sticky ew -padx 2 -pady 2
	incr row
	
	for {set i 0} {$i < $row} {incr i} {
	    grid rowconfigure  $cmds2 $i  -weight 1
	}


	button $wcmds.clear -text Clear  -command     "$msg_text delete 1.0 end; $msg_text see 1.0" 
	button $wcmds.hide -text Iconify   -command "wm iconify $t" 
	button $wcmds.close -text "Abort and Close"    -command  "FTP:abort; destroy  $t" 


	pack $wcmds.clear  $wcmds.hide $wcmds.close -side left -expand  1 -fill x

	grid columnconfigure  $t 0  -weight 1
	grid rowconfigure     $t 0  -weight 1
	grid rowconfigure     $t 1  -weight 1
	grid rowconfigure     $t 2  -weight 1
	set row 0
	grid $cmds2   -sticky ew   -row $row 
	incr row
	grid $cmds1   -sticky ew   -row $row
	incr row
	grid $txt    -sticky news -row $row 
	incr row
	grid $wcmds   -sticky ew   -row $row  
	incr row



	set wait ""
	if {[catch "Wait:create $t ftp_wait" wait]} {
	    proc Wait:stop  {key} {}
	    proc Wait:start {key} {}
	} else {
	    grid  $wait -row $row 
	}

	incr row

	##pack $bottom -side bottom  -expand 1 -fill x -anchor s



    } else {
	deiconify .ftp_dialog
	raise .ftp_dialog
    }




}


proc FTP:init_once {} {
    catch {if [CONFIG:called FTP] return }


    global FTP_state
    set FTP_state(state)  NONE_Sent
    set FTP_state(line) ""
    set FTP_state(destdir) ""
    set FTP_state(destfile) ""
    set FTP_state(cntl_fd)  0
    set FTP_state(data_fd)  0
    set FTP_state(running)  0
    set FTP_state(response)  0
    set FTP_state(line) ""
    set FTP_state(file) ""
    set FTP_state(user) anonymous
    set FTP_state(to)   ""

    global env 
    if [info exists env(USER)] {
	set FTP_state(passwd)  $env(USER)@
    } else {
	set FTP_state(passwd)  "orcauser@"
    }





}

FTP:init_once

proc FTP:put { {file ""} {dest pub} {to ""} } {
    global FTP_state

    if [info exists FTP_state(running)] {
	if $FTP_state(running) return
    } else {
	set FTP_state(text)  ""
    }


    set FTP_state(state)  NONE_Sent
    set FTP_state(line) ""
    set FTP_state(destdir) "$dest"
    set FTP_state(destfile) "$file"
    set FTP_state(cntl_fd)  0
    set FTP_state(data_fd)  0
    set FTP_state(running)  0
    set FTP_state(response)  0
    set FTP_state(line) ""
    set FTP_state(file) $file
    set FTP_state(user) anonymous
    set FTP_state(to)   $to



    FTP:create_gui 


}



proc FTP:abort {} {
    FTP_staterm "FTP Aborted\n" 
    FTP:done
}

proc FTP:done {} {
    global FTP_state
    Wait:stop ftp_wait
    set FTP_state(running) 0
    set FTP_state(state) NONE_Sent
    catch "puts $FTP_state(cntl_fd) QUIT"
    catch "close $FTP_state(cntl_fd)"
    catch "close $FTP_state(data_fd)"
    set    FTP_state(cntl_fd) 0
    set    FTP_state(data_fd) 0
}



proc FTP:error {msg} {
    global FTP_state
    FTP:done
    FTP_staterm "$msg\n" error
}


proc FTP:init_run {} {
    global FTP_state
    if {$FTP_state(running) } {return}



    if {[string length [string trim $FTP_state(file)]] == 0} {
	FTP_staterm "You must specify a file to send\n" error
	return
    }


    if {![file exists $FTP_state(file)]} {
	FTP_staterm "The file: $FTP_state(file), does not exist\n" error
	return
    }


    
    if {$FTP_state(cntl_fd)  == "0" } {
	set fd [FTP:open $FTP_state(to)]
	if {![string length $fd]}  {
	    return
	}
	set FTP_state(cntl_fd)   $fd
    }
    set FTP_state(running) 1
    Wait:start ftp_wait
    FTP:run

}


proc FTP:run {} {
    global FTP_state
    if {!$FTP_state(running) } {return}

    
    if {[FTP:read] > 0} {
	switch $FTP_state(state) {
	    NONE_Sent {
		switch $FTP_state(response) {
		    220 {
			FTP:write "USER $FTP_state(user)"; 
			FTP_staterm  "$FTP_state(line)\n" cmd
			FTP_staterm "Logging in as $FTP_state(user)\n"; 
			set FTP_state(state) USER_Sent
		    }

		    120 {}
		    default {FTP:error "$FTP_state(line)"}
		}

	    }

	    USER_Sent {
		switch $FTP_state(response) {
		    331 {FTP:write "PASS $FTP_state(passwd)"; set FTP_state(state) PASS_Sent}
		    230 {FTP:write "PASV";           set FTP_state(state) PASV_Sent}
		    default {FTP:error "$FTP_state(line)"}
		}		
	    }

	    PASS_Sent {
		switch $FTP_state(response) {
		    230 {FTP:write "PASV";           set FTP_state(state) PASV_Sent}
		    202 {FTP:write "PASV";           set FTP_state(state) PASV_Sent}
		    default {FTP:error "$FTP_state(line)"}
		}		
	    }

	    PASV_Sent {
		switch $FTP_state(response) {
		    227 {
			if {![regexp {([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+)} $FTP_state(line) all  ip1 ip2 ip3  ip4 p1 p2]} {
			    FTP:error "Could not go into active mode"
			    return
			}
			if {[catch "socket $ip1.$ip2.$ip3.$ip4 [expr $p1*256 + $p2]" FTP_state(data_fd) ]} {
			    FTP:error "Could not open connection\n$FTP_state(data_fd)"
			    return
			}
			fconfigure $FTP_state(data_fd) -blocking 0 -translation binary

			FTP:write "TYPE I";        
			FTP_staterm  "$FTP_state(line)\n" cmd
			FTP_staterm "Setting type to binary\n"
			set FTP_state(state) TYPE_Sent
		    }
		    default {FTP:error "$FTP_state(line)"}
		}		
	    }

	    TYPE_Sent {
		switch $FTP_state(response) {
		    200 {
			set dd $FTP_state(destdir)
			if {[string length [string trim $dd]]  == 0} {
			    set dd .
			}
			FTP:write "CWD $dd"
			FTP_staterm  "$FTP_state(line)\n" cmd
			FTP_staterm "Changing remote directory to:$dd"
			set FTP_state(state) CWD_Sent
		    }
		    default {FTP:error "$FTP_state(line)"}
		}		

	    }

	    CWD_Sent {
		switch $FTP_state(response) {
		    250 {
			FTP:write "STOR $FTP_state(destfile)";
			FTP_staterm  "$FTP_state(line)\n" cmd
			FTP_staterm "Requesting to send file: $FTP_state(file)\n";        
			set FTP_state(state) STOR_Sent
		    }
		    default {FTP:error "$FTP_state(line)"}
		}		

	    }



	    STOR_Sent {
		switch $FTP_state(response) {
		    150 {
			FTP_staterm  "$FTP_state(line)\n" cmd
			FTP_staterm "Sending the file: $FTP_state(file)\n";        
			FTP:write_file
			set FTP_state(state) FILE_Sent
		    }
		    default {FTP:error "$FTP_state(line)"}
		}		
	    }

	    FILE_Sent {
		switch $FTP_state(response) {
		    226 {
			FTP_staterm  "$FTP_state(line)\n" cmd
			FTP_staterm "Transfer completed\n" 
			FTP:done
		    }
		    default {FTP:error "$FTP_state(line)"}
		}		
	    }


	    default {
		FTP:error "Unknown state: $FTP_state(state)\n$FTP_state(line)"
		return
	    }
	}
    }



    if {$FTP_state(running) } {
	after 10 FTP:run 
    }
}








