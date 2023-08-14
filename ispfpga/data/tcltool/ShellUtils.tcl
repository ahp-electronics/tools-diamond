



##global _ran
##set _ran [expr [clock clicks]%65536]
##proc UTIL:random {{range 2}} {
##  global _ran
##  set _ran [expr ($_ran * 9301 + 49297) % 233280]
##  return [expr int($range * ($_ran / double(233280)))]
##}



proc Wait:create {{base ""} {key 0} } {
    global Wait_state
    set Wait_state($key,cx) 0
    set Wait_state($key,cy) 0
    set Wait_state($key,running) 0
    set Wait_state($key,incrx) 5
    set Wait_state($key,incry) 1
    set Wait_state($key,canvas) [canvas  $base.wait_canvas -width 200 -height 15 -bd 1 -relief groove]
    $Wait_state($key,canvas) create bitmap  0 -1  -bitmap [WidgetGfx:get_bitmap_file ants.xbm]  -tags {box} -anchor nw
##  set Wait_state($key,canvas) [canvas  $base.wait_canvas -width 200 -height 7 -bd 1 -relief groove]
##    $Wait_state($key,canvas) create rect 0 -1 10 11 -fill #444 -outline #444 -tags {box}

    return $Wait_state($key,canvas)
}

proc Wait:stop {{key 0} } {
    global Wait_state
    set Wait_state($key,running) 0
}

proc Wait:start {{key 0} } {
    global Wait_state

    if {$Wait_state($key,running)} {
	return
    }   
    set Wait_state($key,running) 1
    Wait:tick $key
}

proc Wait:tick {{key 0} } {
    global Wait_state

    if {!$Wait_state($key,running)} {
	Wait:reset $key
	return
    }


    if {$Wait_state($key,cx) >= 190 && $Wait_state($key,incrx) >0 } {set Wait_state($key,incrx) -5}
    if {$Wait_state($key,cx) <= 0 && $Wait_state($key,incrx) <0 } {set Wait_state($key,incrx) 5}

    if {$Wait_state($key,cy) < -15} { 
	set  Wait_state($key,incry) 1
    } elseif  {$Wait_state($key,cy) >15} { 
	set  Wait_state($key,incry) -1
    }

    set Wait_state($key,cy) [expr $Wait_state($key,cy)+$Wait_state($key,incry)] 
    set Wait_state($key,cx) [expr $Wait_state($key,cx)+$Wait_state($key,incrx)] 

##  $Wait_state($key,canvas) coords box  $Wait_state($key,cx)  -1  [expr $Wait_state($key,cx)+10] 11    
    $Wait_state($key,canvas) coords box  $Wait_state($key,cx)     $Wait_state($key,cy)    
    after 50 "Wait:tick  $key"
} 


proc Wait:reset {{key 0}} {
    global Wait_state

    if {![info exists Wait_state($key,cx)]} {
	return
    } 
    set Wait_state($key,cx) 0
    set Wait_state($key,incrx) 10
##  $Wait_state($key,canvas) coords box  $Wait_state($key,cx)  -1  [expr $Wait_state($key,cx)+10] 11    
    $Wait_state($key,canvas) coords box  $Wait_state($key,cx)  -1  
} 






proc Shell:Copyright:create { {w ""} } {
    frame $w.copyright 
    label $w.copyright.text -text "Copyright (c) 1995-1999 Lucent Technologies. All rights reserved."  
    pack $w.copyright.text -side bottom -fill x -expand 1
    return $w.copyright
}



proc Shell:files_exist {files} {
    set bad ""
    foreach f $files {
	set f [lindex $f 0]
	if ![ file exists $f] {set bad "$bad $f"}
    }
    return $bad
}



proc Shell:Script:init {} {
    set name [tk_getSaveFile -title "Script file name:"]

    if {![UTIL:strck $name]}  {return ""}

    set myfile [open $name w]
    global Application_state

    if {!$Application_state(windoze)} {
	
    } else {
	puts $myfile "#!/bin/csh -f\n"
    }


    return $myfile

}



proc Shell:Script:write {file  cmd} {
    global Application_state
    if {!$Application_state(windoze)} {
	puts $file "echo \"Starting: $cmd\""
	puts $file "$cmd"
	puts $file "if  (\$status != 0)	then\n\techo \"ERROR: Shell exit\"\n\texit(1)\nendif\n"
    } else {
	puts $file "echo Starting: $cmd"
	puts $file "$cmd"
	puts $file "if  not errorstatus 0 echo \"ERROR: Shell exit\"\n\texit(1)\nendif\n"
    }
}










proc Shell:Output:create {key base {width 60} } {
    global  Shell_state  
    set msg_text [text $base.text -relief sunken -bd 2 -yscrollcommand "$base.scroll set" -width $width ]
    scrollbar $base.scroll -command "$msg_text yview"
    pack $base.scroll -side right -fill y
    pack $msg_text -side left -expand 1 -fill both 
    $msg_text tag configure  hotline -underline 1
    $msg_text tag configure  error   -foreground red
    $msg_text tag configure  abort   -foreground red
    $msg_text tag configure  warning -foreground orange
    $msg_text tag configure  cmd     -foreground blue
    $msg_text tag configure  done    -foreground #50b256
    set Shell_state(output,$key,text) $msg_text
    set Shell_state(output,$key,filter) 0
    return $msg_text
}





proc Shell:Output:clear {key} {
    global Shell_state
    set t $Shell_state(output,$key,text)
    if [catch {$t configure -state normal}] {return}
    $t delete 1.0 end
    $t configure -state disabled
    $t  see 1.0
}


proc Shell:Output:write {key msg {tag ""} {cmd ""}}  {
    global  Shell_state  Application_state
    set t $Shell_state(output,$key,text)
    $t configure -state normal
    if {[UTIL:strck $cmd]} {
	incr  Application_state(counter)
	set b [button $t.bu$Application_state(counter) -text "$msg" -command "$cmd" -bd 1 -padx 0 -pady 0 -highlightthickness 0 ]
	$t window create end -window $b
    } else {
	$t insert end "$msg" $tag
    }
    $t configure -state disabled
    $t see end
}


##proc Shell:Output:display_help {t line tag} {}

proc Shell:Output:display_line {key  line {pre ">"} {tag text} } {
    global Shell_state  Application_state
    set t $Shell_state(output,$key,text)
    if [catch "$t configure -state normal"] {return}
    set p1 "" 
    set p2 ""
    set p3 ""
    set match ""



    if {[regexp  {^(.*)HELP:[\t ]*([^ ]+)[\t ]+("[^"]*"|[^ ]+)([\t ]*.*)$} "$line" match p1 p2  p3 p4]}  {
	$t insert end "$pre$p1"    $tag
	incr  Application_state(counter)
	regsub -all {"} $p3 "" p3
	if {![UTIL:strck $p3]} {set p3 "More Information"}
	set b [button $t.bu$Application_state(counter) -text "$p3" -command "HELP:show $p2" -bd 1 -padx 0 -pady 0 -highlightthickness 0 -cursor hand2 ]
	$t window create end -window $b 
	$t insert end "$p4\n"    $tag
    }  elseif {[regexp -nocase {^([ \t>]*)(error)(.*)$} "$line" match p1 p2 p3 ]}  {
	$t insert end "$pre$p1"    $tag
	$t insert end "$p2"    error
	$t insert end "$p3\n"     $tag
    }  elseif {[regexp -nocase {^([ \t>]*)(warning)(.*)$} "$line" match p1 p2 p3 ]}  {
	$t insert end "$pre$p1"   $tag
	$t insert end "$p2"    warning
	$t insert end "$p3\n"    $tag
    }  elseif {[regexp -nocase {^(.*)(1-800-EASY-FPG\(A\))(.*)$} "$line" match p1 p2 p3 ]}  {
	$t insert end "$pre$p1"   $tag
	$t insert end "$p2"    hotline
	$t insert end "$p3\n"    $tag
    }  elseif {[regexp -nocase {INTERNAL CODE} "$line" ]}  {
	$t insert end "$pre$line\n"   error
    }	else {
	if "!$Shell_state(output,$key,filter)" {
	    $t insert end "$pre$line\n"   $tag
	}
    }


    $t see end
    $t configure -state disabled
}



proc Shell:Output:save {key} {
    global Shell_state
    set t $Shell_state(output,$key,text)    
    set name [tk_getSaveFile  -title "Save text log as "]
    if {![UTIL:strck $name]} {return}
    set out [open $name w]
    puts $out [$t get 1.0 end]
    close  $out

}








proc Shell:Output:init_once {} {
	

}











proc Shell:abort { key {ask 1} } {
    global Shell_state
    if {$Shell_state($key,exec,pid) != 0} {
	catch "exec kill  $Shell_state($key,exec,pid)"
	catch "close $Shell_state($key,exec,fileid)"
    }
    set Shell_state($key,exec,pid) 0
    set Shell_state($key,exec,ok) 0
    Shell:done $key Aborted abort
}





proc Shell:create_gui { key  {standAlone 1} {title "Design Flow Execution"}} {
    global   Shell_state

    set tl [toplevel .${key}_exec_window ]

##Make the output text window
    set txt_frame [frame $tl.txt]
    Shell:Output:create $key $txt_frame


    set Shell_state($key,exec,error) 0
    set Shell_state($key,exec,ok)    1
    set Shell_state($key,exec,window) $tl
    set Shell_state($key,exec,pid)    0    
    set Shell_state($key,exec,fileid) 0
    set Shell_state($key,exec,running)     0

    wm title $tl $title
    set bottom [frame $tl.bottom]
    set exec_f [frame $tl.exec_fr  ]


    if {!$standAlone} {
	set stepb    [button $exec_f.step    -text    "Step"         -command "DFEXEC:start  $key 1"  -padx 1 -pady 1]
	set stopb    [checkbutton $exec_f.stop  -text    "Pause after"     -state disabled -bd 2 -relief raised -padx 1 -pady 1  -variable  Shell_state($key,exec,running) -onvalue 0 -offvalue 0 ]
	set cleanb  [button $exec_f.cleanup    -text "Clear nodes"     -command "DFEXEC:cleanup $key"  -padx 1 -pady 1]
	set Shell_state($key,exec,stopbutton) $stopb
	set Shell_state($key,exec,stepbutton) $stepb
	set Shell_state($key,exec,cleanbutton) $cleanb

	Balloon:help $stopb  "Stop after current tool completes"
	Balloon:help $stepb  "Run  next tool"
	Balloon:help $cleanb "Reset all nodes" 

    }



    set exec_lbl [label $tl.exec_lbl -text $title]
    set runb     [button $exec_f.run -text "Run" -command "DFEXEC:start  $key" -padx 1 -pady 1]


    set abortb   [button $exec_f.abort  -text  "Abort"  -state disabled -command "Shell:abort $key"  -padx 1 -pady 1]

    set shb     [button $exec_f.sh    -text    "Write Script"           -command "DFEXEC:write_script $key"  -padx 1 -pady 1]


    set display_lbl [label $tl.display_lbl -text "Display"]

    set clearb  [button $tl.clear  -text     "Clear display"    -command "Shell:Output:clear $key"  -padx 1 -pady 1]
    set writeb  [button $tl.write  -text     "Save display"    -command "Shell:Output:save $key"  -padx 1 -pady 1]
    set filterb [checkbutton $tl.filter  -text "Only show warnings and errors"    -variable  Shell_state(output,$key,filter)  -bd 2 -relief raised   -padx 1 -pady 1]


    set Shell_state($key,exec,execbutton) $runb
    set Shell_state($key,exec,abortbutton) $abortb


    Balloon:help $runb   "Begin running"
    Balloon:help $abortb "Abort current execution"
    Balloon:help $shb    "Write command script"
    Balloon:help $clearb "Clear the text display"
    Balloon:help $writeb "Save the text display"
    Balloon:help $filterb "Only show warnings and errors"




    pack [Wait:create $bottom $key] -side bottom

    set maxcol 4
    set row 0


    grid  $exec_lbl     -columnspan $maxcol        -row $row  -sticky ewns
    incr row


    if {!$standAlone} {
	grid  $runb  $stepb  $stopb  $abortb    $shb  $cleanb   -sticky ew -row 0
    } else {
	grid  $runb  $abortb    $shb     -sticky ew -row 0
    }


    grid rowconfigure   $exec_f  0 -weight 1
    for {set i 0} {$i < 6} {incr i} {
	grid columnconfigure   $exec_f  $i -weight 1
    }

    
    grid columnconfigure   $exec_f  0 -weight 1

    
    grid $exec_f -sticky ew -columnspan 4 -row $row
    incr row


    grid $txt_frame    -sticky news -row $row -columnspan $maxcol
    for {set i 0} {$i < $maxcol} {incr i} {
	grid columnconfigure  $tl $i -weight 1
    }
    grid rowconfigure     $tl $row -weight 1
    incr row

    grid  $display_lbl     -columnspan $maxcol        -row $row  -sticky ew
    incr row
    grid  $clearb $writeb $filterb      -row $row  -sticky ew





    grid $bottom -sticky ew -columnspan $maxcol

    return $tl
}




proc 	Shell:done {key {mess "Done"} {tag done} } {
    global  Shell_state
    Shell:Output:write $key ">$mess\n" $tag
    set Shell_state($key,exec,running) 0
    Wait:stop $key
    $Shell_state($key,exec,execbutton)  configure -state   normal
    $Shell_state($key,exec,abortbutton) configure -state   disabled

    catch {$Shell_state($key,exec,stepbutton)  configure -state   normal}
    catch {$Shell_state($key,exec,stopbutton)  configure -state   disabled}
    catch {$Shell_state($key,exec,cleanbutton) configure -state   normal}
}








proc Shell:error {doc stop {msg ""} {display_line 0} } {
    global  Shell_state
##    Shell:error $doc $stop $msg
    set Shell_state($doc,exec,error) 1
    foreach m $msg { 
	if $display_line  {
	    Shell:Output:display_line $doc "ERROR: $m" "" error
	} else {
	    Shell:Output:write $doc "ERROR: $m\n" error
	}
    }

    if "$stop" "Shell:done $doc"
}
