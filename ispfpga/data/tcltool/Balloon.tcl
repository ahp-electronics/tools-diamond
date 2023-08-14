


proc Balloon:define_msg_var {w} {
    global Balloon_state
    set  Balloon_state($w,msgvar) ""
    return Balloon_state($w,msgvar) 
}

proc Balloon:help {w msg1 {time 1000} {hilite 0} {msg2 ""}} {
    global Balloon_state
    set win $w
##Find the variable we place msg2 into. This is keyed off of widget name
    set thewin ""
    while {1} {
	if {[info exists Balloon_state($win,msgvar)]} {
	    set thewin $win
	    break;
	}
	if {[catch "winfo parent $win" win]} {break;}
    }
    if {![UTIL:strck $msg2]} {set msg2 $msg1}
    bind $w <Enter>   "Balloon:enter $w \"$msg1\" \"$msg2\" $time $hilite \"$thewin\""
    bind $w <Leave>   "Balloon:clear $w $thewin"
    bind $w <Button>  "Balloon:clear $w $thewin"
}

 

proc Balloon:set_message_var {w {lbl ""}}  {
    global Balloon_state
    if [info exists Balloon_state(${w},msgvar) ] {
	set Balloon_state(${w},msgvar) $lbl
    } else {
	foreach name [array names Balloon_state  ",msgvar"] {
	    set Balloon_state($name) ""
	}
    }
}

proc Balloon:enter {w msg1 msg2  {time 1000} {hilite 0} {varwidget ""}} {
    global Balloon_state
    set Balloon_state(current,widget) ""
    if [UTIL:strck $msg1] {
	set Balloon_state(current,widget) $w
	after $time "Balloon:popup $w \"$msg1\""
    }
    Balloon:set_message_var $varwidget "$msg2"
    if {$hilite} {$w config -bg #ececec    }
}


proc Balloon:clear {w {varwidget ""}} {
    global Balloon_state	
    if {[winfo exist $Balloon_state(current,window)]}  {
	destroy  $Balloon_state(current,window)
    }
    Balloon:set_message_var $varwidget ""
    set Balloon_state(current,widget) ""
}    


proc Balloon:popup {w lbl} {
    global Balloon_state	
    if {!$Balloon_state(active)} {return}
    if {[string compare $w $Balloon_state(current,widget)] } {return}   
    set top $Balloon_state(current,window)
    if {![winfo exist $top]} {
	set top [toplevel  .balloonhelp]
	wm    overrideredirect $top  1
	set Balloon_state(current,window) $top
	frame $top.f -bg black 
	pack  $top.f 
	label $top.f.l -text "$lbl" -bg  #FFFEBC
	pack  $top.f.l -padx 1 -pady 1 
    } else {
	raise $top
	wm deiconify $top
        $top.f.l config -text "$lbl"
    }

    set x  [winfo pointerx $w]
    set y  [expr [winfo rooty $w] + [winfo height $w]]
    wm geometry $top +[expr $x]+[expr $y]
}



proc Balloon:init_once {} {
    if [CONFIG:called Balloon] {return}
    global Balloon_state
    set Balloon_state(active)         1
    set Balloon_state(current,widget) ""
    set Balloon_state(current,window) ""
    bind all <Any-KeyRelease> {Balloon:clear %W}
}


Balloon:init_once







