

proc FILEVIEW:browse {key} {
    set fn [tk_getOpenFile]
    if [UTIL:strck $fn] {FILEVIEW:set $key  1 $fn 1}
}

proc FILEVIEW:create {key  cmds {toplabel ""} {title "File View"}} {
    global FILEVIEW_state

    FILEVIEW:flush $key

    set tln .fileview_${key}
    if [winfo exists $tln] {
	wm deiconify $tln
	raise $tln
	return
    }

##This is the global list of files 
    set FILEVIEW_state($key,files) [list]



    set tl [toplevel .fileview_${key}]
    wm title $tl "$title"


    set top      [frame $tl.top]
    set FILEVIEW_state($key.top) $top

    set text     [text $top.text -relief sunken -bd 2 -yscrollcommand "$top.tscroll set" -width 60 -height 10]
    scrollbar $top.tscroll -command "$text yview"



    set filelbl [label $top.lbl  -text "  File:" -anchor w]

    set bcf [frame $top.bcf -bd 2  -relief sunken ]
    set bc  [canvas $bcf.c    -yscrollcommand [list $top.cscroll set] -scrollregion {0 0 100 2000}  ]
    pack $bc -side top -expand 1 -fill both 

    scrollbar $top.cscroll  -orient vertical -command [list $bc  yview] 

    set toprow 0

    if [UTIL:strck $toplabel] {
	set toplbl   [label $top.hdr -text $toplabel]
	grid $toplbl -row $toprow -columnspan 3 -sticky ew
	incr toprow
    }
    grid $filelbl -row $toprow -column 2 -sticky ew
    incr toprow 


    grid $top.cscroll -row $toprow -column 0 -sticky ns

    set bcfcol 1
    grid $bcf         -row $toprow -column 1  -sticky ns

    grid $text        -row $toprow -column 2 -sticky news
    grid $top.tscroll -row $toprow -column 3  -sticky ns

    incr toprow

    grid rowconfigure $top 1 -weight 1 
    grid columnconfigure $top 2 -weight 1  -pad 2


    set FILEVIEW_state($key,top)     $tl
    set FILEVIEW_state($key,topfr)     $top
    set FILEVIEW_state($key,buttonc) $bc
    set FILEVIEW_state($key,filelbl) $filelbl
    set FILEVIEW_state($key,text)    $text

    set  buttons [frame $bc.buttons ] 

    $bc create window 0 0 -window $buttons -anchor nw -tag buttons


    set row 0
    grid columnconfigure $buttons 0  -weight 1 

    frame $top.all
    button $top.all.on  -text "On"    -command "FILEVIEW:set_all $key 1"  -bd 1 -padx 1 -pady 1 -highlightthickness 0 -anchor w 
    button $top.all.off -text "Off"   -command "FILEVIEW:set_all $key 0 " -bd 1 -padx 1 -pady 1 -highlightthickness 0 -anchor w 
    set FILEVIEW_state($key,pattern) ""
    entry $top.all.pattern   -width 10 -textvariable FILEVIEW_state($key,pattern) 
    button $top.all.add -text "Add: " -command  "FILEVIEW:add_match $key  \$FILEVIEW_state($key,pattern)" -bd 1 -padx 1 -pady 1 -highlightthickness 0 -anchor w 
    button $top.all.browse -text "Browse" -command  "FILEVIEW:browse $key " -bd 1 -padx 1 -pady 1 -highlightthickness 0 -anchor w 



    Balloon:help $top.all.on "Turn all files on"
    Balloon:help $top.all.off "Turn all files on"
    Balloon:help $top.all.add "Add files that match pattern"
    pack  $top.all.on $top.all.off $top.all.add $top.all.pattern $top.all.browse -side left -padx 1


    grid $top.all -row $toprow -column 1  -sticky w
    incr toprow

    
    set cmd [frame $tl.cmd]

    set i 0
    foreach c $cmds {
	set lbl [lindex $c 0]
	set c [lindex $c 1]
	button $cmd.cmd$i -text "$lbl" -command "$c"
	pack   $cmd.cmd$i  -side left -fill x -expand 1
	incr i
    }



    grid $top -row 0 -column 0  -sticky news
    grid $cmd -row 1 -column 0  -sticky ew
    grid columnconfigure $tl  0  -weight 1 
    grid rowconfigure $tl  0  -weight 1 

    tkwait visibility $buttons
    FILEVIEW:resize $key $bc $buttons  

    return $tl

}


proc FILEVIEW:flush {key} {
    global FILEVIEW_state

    if [info exists FILEVIEW_state($key,files)] {
	foreach file [set FILEVIEW_state($key,files)] {
	    unset FILEVIEW_state($key,files,$file) 
	}
    }

    set FILEVIEW_state($key,rows)   0
    set FILEVIEW_state($key,files) [list]
}



proc FILEVIEW:set {key dflt files {append 0} } {
    global FILEVIEW_state

    if {![info  exists FILEVIEW_state($key,top)]} {
	return
    }

    if {![info  exists FILEVIEW_state($key,rows)]} {
	set FILEVIEW_state($key,rows) 0 
    }

    set bc  $FILEVIEW_state($key,buttonc)
    set buttons  $bc.buttons

    set text     $FILEVIEW_state($key,text)
    set filelbl  $FILEVIEW_state($key,filelbl)

    set anychange  0

    if {!$append} {

	foreach child [grid slaves $buttons] {
	    set anychange  1
	    destroy $child
	}

	FILEVIEW:flush $key 
    }


     foreach file $files {
	set anychange  1
	set file [string trim $file]
	if [info exists FILEVIEW_state($key,files,$file)] {
	    continue 
	} 
	if {![file  exists $file]} {continue}


	lappend FILEVIEW_state($key,files) $file


	set FILEVIEW_state($key,files,$file) 1

	if {![info exists FILEVIEW_state($key,$file,select)]} {
	    set FILEVIEW_state($key,$file,select) $dflt
	}

	set entry_key $FILEVIEW_state($key,rows)   


	set ext ""
	if [file isdirectory $file] {set ext "Dir: "}


	set cb  [checkbutton  $buttons.cb$entry_key    -text "$ext$file"  -variable FILEVIEW_state($key,$file,select) -onvalue 1 -offvalue 0 -anchor w]
	if [UTIL:strck $ext] {
	    set view [label $buttons.lbl$entry_key -text ""]
	} else {
	    set view [button       $buttons.view$entry_key -text ">"  -command "FILEVIEW:view  $file $text $filelbl" -height 1  -padx 1 -pady 1 -highlightthickness 0 -bd 1]
	}

	grid $cb  $view  -row $FILEVIEW_state($key,rows)    -padx 2 -sticky ew 
	incr FILEVIEW_state($key,rows)   
    }



    update
##    tkwait visibility $buttons
    if $anychange {FILEVIEW:resize $key $bc $buttons  }





}


proc FILEVIEW:resize {key bc buttons } {
    global FILEVIEW_state
    set w [winfo width  $buttons]
    set colw [winfo width $FILEVIEW_state($key,topfr).all]
    if {$w < $colw} {set w $colw}
    $bc itemconfigure buttons  -width $w
    set h [winfo height $buttons]
    $bc  config -width $w   -scrollregion "0 0 $w $h" 

}





proc FILEVIEW:set_all {key which} {
    global FILEVIEW_state
    foreach file $FILEVIEW_state($key,files) {
	set FILEVIEW_state($key,$file,select) $which
    }
}


proc FILEVIEW:view {file text lbl} {
    $text configure -state normal
    $text delete 1.0  end 
    $lbl config -text "  File:$file"
    if {![file exists $file]} {
	$text insert end "File does not exist\n" 
    }  elseif {[file isdirectory $file]}  {
	$text insert end "File is a directory\n"
    } else {
	set bytes [file size $file]
	if {$bytes > 1000000} {
	    $text insert end  "The file is too large ($bytes bytes) to view"
	} else {
	    set in [open $file r]
	    set line ""
	    while  {![eof  $in] } {
		if { [gets $in line] > 0} {$text insert end "$line\n" }
	    }
	    close $in
	}
    }
    $text configure -state disabled
}





proc FILEVIEW:add_match {key pattern} {
    if {![UTIL:strck [string trim $pattern]]} {return}
    set files [glob -nocomplain $pattern]
    FILEVIEW:set  $key 1 "$files" 1
}


proc FILEVIEW:get {key} {
    global FILEVIEW_state
    set ret [list]
    foreach file $FILEVIEW_state($key,files) {
	if $FILEVIEW_state($key,$file,select) {
	    lappend ret $file
	}
    }    
    return $ret
}
