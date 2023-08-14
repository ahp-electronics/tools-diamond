


proc HELP:show {f} {
    switch -regexp [file extension $f] {
	.html      {HELP:show_url $f}
	{.html#.*} {HELP:show_url $f}
	.htm      {HELP:show_url $f}
	{.htm#.*} {HELP:show_url $f}
	.pdf       {HELP:show_pdf $f}
	default {
	    HELP:show_text_file $f
	}
    }
}




proc HELP:find_file {f var {tell_user 1}} {
    global   Application_state  
    upvar $var the_file



    if [file exists $f] {set the_file $f; return 1;}

    set haveit 0
    set tmpf ""


    foreach path $Application_state(path,docs) {
	set tmpf  [file join $path $f]
	if {[file exists $tmpf]} {set haveit 1;break;}
    }

    if {!$haveit} {
	if {$tell_user} {
	    tk_messageBox -type ok -default ok -message "Unable to find document: $f"
	}
	return 0
    }

    set the_file $tmpf
    return 1
}


proc HELP:register {key help} {
    global HELP_state
    set HELP_state(help,$key) $help
}

proc HELP:show_text_file {f} {
    global HELP_state
    if [info exists HELP_state(help,$f)] {
	HELP:show_text $HELP_state(help,$f)
	return
    }

    if {![HELP:find_file $f f ]} {return}
    if {[catch "open $f r" fd]} {
	tk_messageBox -icon error -type ok -default ok -message "Error: $fd"
	return
    }


    HELP:show_text [read  $fd] "File: $f" 
    close $fd
}



proc HELP:show_text {text {label ""}} {

    if {! [winfo exists .help_text]} {
	toplevel .help_text
	label .help_text.label -anchor w 
	pack .help_text.label -side top -fill x -expand 1
	set top [frame .help_text.top]
	pack $top -fill both -expand 1
	set msg_text [text $top.text -relief sunken -bd 2 -yscrollcommand "$top.scroll set"  -wrap word   ]
	scrollbar $top.scroll -command "$msg_text yview"
	pack $top.scroll -side right -fill y
	pack $msg_text -side left -expand 1 -fill both
	set bottom [frame .help_text.bottom]
	pack $bottom -fill both -expand 1
	set close [button $bottom.close -text "Close" -command "destroy .help_text"]
	pack $close -expand 1 -fill x
    } else {
	wm deiconify .help_text
	raise .help_text
	set msg_text .help_text.top.text
    }

    .help_text.label config -text $label
    $msg_text delete 1.0 end 
    $msg_text insert 1.0 $text
}




proc HELP:show_pdf {pdffile} {
    global env  Application_state  HELP_state

    set f ""
    if {![HELP:find_file $pdffile f ]} {return}

    if {![UTIL:strck $Application_state(path,pdfbrowser)]} {
	    tk_messageBox  -icon error -type ok -default ok -message "No PDF browser defined"
	    return
    }


    if [catch "exec $Application_state(path,pdfbrowser) -useFrontEndProgram  $f &" out] {
	tk_messageBox -icon error -type ok -default ok -message "Unable to execute: $Application_state(path,pdfbrowser)\n$out"
    } elseif {! $HELP_state(noshow)}  {
	option add *Dialog.msg.wrapLength 6i 
	set ret [ Widget:tkMessageBox   -type {ok-Ok:noshow-Don't show this anymore}  -default ok -message "Bringing up:\n$Application_state(path,pdfbrowser)  $f"]
	if [string compare $ret ok] {
	    set HELP_state(noshow) 1
	}

	option add *Dialog.msg.wrapLength 3i 
    }

}


proc HELP:show_url {url} {
    global Application_state env 




    if {![UTIL:strck $Application_state(path,htmlbrowser)]} {
	tk_messageBox  -icon error -type ok -default ok -message "No HTML browser defined"
	return
    }

    
    set l [split "$url" #]
    set url [lindex $l 0]
    set tag ""
    if {[llength $l] >1} {
	set tag "#[lindex $l 1]"
    }
    set actualUrl  $url


    if {![regexp {^[^ \t]+:} $actualUrl] || ![regexp {^file:} $actualUrl] } {
	set file ""
	regsub {^file:} "$actualUrl" "" file
	regsub {#.*} "$file" "" file
	set haveit 0
        foreach path $Application_state(path,docs) {
	    set f [file join $path $file]
	    if {[file exists $f]} {set haveit 1;break;}
	}

        if {!$haveit} {
	    set actualUrl "http://www.micro.lucent.com/micro/fpga/$url"
	} else {
	    set actualUrl "file:$f"
	}
    }



    if [catch "exec $Application_state(path,htmlbrowser) -remote  \"openURL($actualUrl$tag)\""  res] {
	if [regexp {not[ ]+running}  $res] {
	    if {[catch "exec $Application_state(path,htmlbrowser)  $actualUrl$tag &" res]} {
		tk_messageBox  -icon error  -message "Unable to execute html browser:\n$res" -type ok -default ok
	    }
	}
    }
}


proc HELP:init_once {} {
    if [CONFIG:called HELP] {return}
    global Application_state  HELP_state env
    set HELP_state(noshow) 0
    set Application_state(path,pdfbrowser) acroread
    set Application_state(path,htmlbrowser) netscape
    set Application_state(path,docs)  [list    /home/jeffm/docs  ~ [file join ~ docs] ] 
}


HELP:init_once  





proc Tutorial:create {} {
    global Tutorial_state
    set Tutorial_state(toplevel) .tutorial_text


    if {! [winfo exists $Tutorial_state(toplevel)]} {
	toplevel $Tutorial_state(toplevel)

	set labelf [frame $Tutorial_state(toplevel).labelf]


	set controls [frame $Tutorial_state(toplevel).controls]

	set textf [frame $Tutorial_state(toplevel).textf]
	set bottom [frame $Tutorial_state(toplevel).bottom]


	grid $labelf -sticky news
	grid  $controls -row 1 -column  0 -sticky ew
	grid  $textf -row 2 -column  0 -sticky news
	grid $bottom -row 3 -column  0 -sticky ew

	grid columnconfigure  $Tutorial_state(toplevel) 0 -weight 1
	grid rowconfigure  $Tutorial_state(toplevel) 2 -weight 1


	set t [text $textf.text  -relief sunken -bd 2 -yscrollcommand "$textf.scroll set"  -wrap word    ]

	set Tutorial_state(labelf) $labelf
	set Tutorial_state(controls) $controls
	set Tutorial_state(text) $t


	$t tag configure  title       -underline 1 -justify center
	$t tag configure  underline   -underline 1 
	$t tag configure  abort   -foreground red
	$t tag configure  warning -foreground orange
	$t tag configure  cmd     -foreground blue
	$t tag configure  done    -foreground #50b256


	scrollbar $textf.scroll -command "$Tutorial_state(text) yview"
	pack $textf.scroll -side right -fill y
	pack $t  -side left -expand 1 -fill both


	set close [button $bottom.close -text "Close" -command "destroy $Tutorial_state(toplevel)"]
	pack $close -expand 1 -fill x
    } else {
	wm deiconify $Tutorial_state(toplevel)
	raise $Tutorial_state(toplevel)
    }
}




proc Tutorial:clear {} {
    global Tutorial_state
    Tutorial:create
    $Tutorial_state(text) delete 1.0 end 
}


proc Tutorial:add {t {tag ""}} {
    global Tutorial_state
    Tutorial:create
    $Tutorial_state(text) insert end $t $tag
}


proc Tutorial:hilite_control {key {on "-bd 2 -relief sunken"} {off "-bd 1 -relief raised"}} {
    global Tutorial_state
    foreach name [array names Tutorial_state "controls,*"] {
	eval $Tutorial_state($name) configure $off
    } 
    if [info exists  Tutorial_state(controls,$key) ] {
	eval  $Tutorial_state(controls,$key) configure $on
    }

}


proc Tutorial:control:register {w key} {
    global Tutorial_state
    set Tutorial_state(controls,$key) $w 
}


proc Tutorial:exists {} {
    global Tutorial_state
    if {![info exists Tutorial_state(toplevel)]} {return 0}
    return  [winfo exists $Tutorial_state(toplevel)]
}

proc Tutorial:add_button {msg cmd {args ""} } {
    global Tutorial_state     
    Tutorial:create
    set t $Tutorial_state(text) 

    set b [eval button $t.bu$Tutorial_state(cnt)  -text \"$msg\" -command \"$cmd\" -bd 1 -padx 0 -pady 0 -highlightthickness 0 -cursor hand2 $args]

    incr Tutorial_state(cnt) 
    $t window create end -window $b
}


proc Tutorial:add_image {file } {
    global Tutorial_state     
    Tutorial:create
    set t $Tutorial_state(text) 
    set img1 [WidgetGfx:make_image $file]
    set l  [label $t.bu$Tutorial_state(cnt)  -image $img1]
    incr Tutorial_state(cnt) 
    $t window create end -window $l 
}



global Tutorial_state
set Tutorial_state(cnt) 0



