

proc WidgetGfx:configure {c tag which value} {
    eval $c._${tag} config $which "$value" 
}



proc WidgetGfx:getvalue {c tag} {
    global  _${tag}_variable
    return [set   _${tag}_variable ]
}


proc WidgetGfx:set_value_from_c {c tag value} {
    set lbl_var     _${tag}_variable_lbl
    global  _${tag}_variable $lbl_var
    set   _${tag}_variable  $value
    if [info exists $lbl_var] {
	set  $lbl_var   $value
    }

}

proc WidgetGfx:coords {c tag} {
    return [$c coords _$tag ]
}


proc WidgetGfx:bbox {c tag} {
    set bbox [$c bbox _$tag ]
    if {[UTIL:strck $bbox] == 0} {return "0.0 0.0 10.0 10.0"}
    return  $bbox
}



proc WidgetGfx:text_width {c text} {
    $c.dummy config -text "$text"
    return  [winfo width $c.dummy]
}


proc WidgetGfx:move { c tag x y w h } {

    $c itemconfigure "_$tag"  -width  $w -height $h 
    $c coords _$tag $x $y 
}

proc WidgetGfx:expand {c tag source name2 op} {
    global  _${tag}_variable    
    set w   $c._${tag}
    set width [WidgetGfx:text_width $c [set   _${tag}_variable]]
    $c itemconfigure  _${tag}  -width $width
}


proc WidgetGfx:autosize {c tag } {
    global  _${tag}_variable    
    trace variable   _${tag}_variable  w  "WidgetGfx:expand $c $tag"
}



proc WidgetGfx:new {c w tag} {
    global Widget_state
    set Widget_state(map,$c,_$tag) $w
}



proc WidgetGfx:delete {c tag} {
    global Widget_state _${tag}_variable    _${tag}_variable_prev _${tag}_variable_lbl        
    $c delete _$tag
    destroy $Widget_state(map,$c,_$tag)
    catch {unset _${tag}_variable}
    catch {unset _${tag}_variable_lbl}
    catch {unset _${tag}_variable_prev}
}


##proc WidgetGfx:tracer {tag source name op } {
##    WidgetGfx:listener  $tag 
##}



proc WidgetGfx:listener {tag {var _variable} {target "value"}} {
    global  _${tag}$var
    WidgetGfx:set_value_to_c $tag $target "[set  _${tag}$var]" 
}



proc WidgetGfx:entry_listener {tag } {
    global  _${tag}_variable    _${tag}_variable_prev 
    if [string compare [set _${tag}_variable] [set   _${tag}_variable_prev ] ] {
	set _${tag}_variable_prev   [set _${tag}_variable]
	WidgetGfx:listener  $tag 
    }
}



proc WidgetGfx:image_button_tracer {w var source name op } {
    global $var 

#The WidgetGfx:image_toggle call can fail if we have deleted the widget
#if so then untrace this command
    if [catch "WidgetGfx:image_toggle $w [set $var]"] {
	trace vdelete  $var  w  "WidgetGfx:image_button_tracer  $w $var "
    }

}



proc WidgetGfx:image_toggle {i {b 1}} {
return
    if {$b} {
	$i configure -background grey50
	$i configure -activebackground grey55
    } else  {
	$i configure -background grey80
	$i configure -activebackground grey95
    }
}




proc WidgetGfx:get_bitmap_file {f {prefix @} } {
    global CONFIG_state CONFIG_search_paths

    if {![ info exists CONFIG_state(bitmap,$f)] } {
	set found [ CONFIG:find_file  $f] 
	set CONFIG_state(bitmap,$f) $found
	if [file exists $found] {
	    set CONFIG_state(bitmap,$f) ${prefix}${found} 
	} else {
	    set CONFIG_state(bitmap,$f) ""
	}
    } 
    return  $CONFIG_state(bitmap,$f)
}



proc WidgetGfx:make_image {name} {
    set n [ CONFIG:find_file  $name]     
    set img ""
    if [catch "image create bitmap -file $n" img] {
	set img [image create photo -file $n]
    }
    return $img
}









proc WidgetGfx:create_radiobutton {c tag  x y width height bd value  {label ""} } {
    global  _${tag}_variable  
    set  _${tag}_variable $value
    set w [checkbutton $c._${tag} -relief groove -bd $bd  -text "$label" -onvalue 1 -offvalue 0 -variable _${tag}_variable -command   "WidgetGfx:listener $tag"]
    $c create window $x $y -window  $w  -tags "_$tag widget"  -anchor nw 
    $w config -cursor crosshair
    WidgetGfx:new $c $w $tag
    return $w
}



proc    HOOK:imagebutton {tag bitmap w} {}


proc WidgetGfx:create_imagebutton {c tag  x y width  height bd value bitmap {border 0} } {
    if {[UTIL:strck  $value] == 0} {set value 0}  

    set bitmap [WidgetGfx:get_bitmap_file  $bitmap]
    if {[UTIL:strck $bitmap] == 0} {
	set bitmap [WidgetGfx:get_bitmap_file  null.xbm]
    }
    set var  _${tag}_variable
    global  $var

    set w [
    button  $c._${tag} \
	    -relief raised -border $bd     \
	    -highlightthickness 0 \
	    -bitmap $bitmap    \
	    -command  \
	    "set $var \[expr ! \[set $var\] \] ;  \
	    WidgetGfx:listener $tag;                                          \
	    WidgetGfx:image_toggle $c._${tag} \[set $var\];
    "
    ]


    HOOK:imagebutton $tag $bitmap $w

    trace variable  $var  w  "WidgetGfx:image_button_tracer  $w $var "

    set  $var "$value"

    $w config -cursor crosshair
    $c create window $x $y -window  $w  -tags  "_$tag widget"  -anchor nw 
    WidgetGfx:new $c $w $tag
    return $w
}






proc WidgetGfx:create_textfield {c tag  x y width height bd value autosize} {
    global  _${tag}_variable    _${tag}_variable_prev 

    
    set w [
    entry  $c._${tag} -relief raised -bd $bd  -text \"$value\" 	     \
	    -textvariable  _${tag}_variable -highlightthickness 0
    ]

    $w config -cursor pencil
    bind $w <Return>  "WidgetGfx:listener  $tag "
    bind $w <Leave>   "WidgetGfx:entry_listener $tag"


    $c create window $x $y -window  $w  -tags "_$tag widget"  -anchor nw 
    WidgetGfx:new $c $w $tag
    if {$autosize} {WidgetGfx:autosize $c $tag}

    set  _${tag}_variable "$value"
    set  _${tag}_variable_prev  "$value"

    return $w
}




proc pulldownmenu_setmenu {c tag value  entries } {

    set var _${tag}_variable
    set lbl_var     _${tag}_variable_lbl


    global $var $lbl_var
    set  $var "$value"


    set menu_button $c._${tag}
    set current_menu $menu_button.menu
    set max 0
    $menu_button.menu delete 0 last



    set cnt 0
    foreach e $entries {
	set subl [llength $e]
	if {$subl <2} {
	    set menu_value $e
	    set menu_text $e
	}  else {
	    set menu_value [lindex $e 0]
	    set menu_text  [lindex $e 1]
	}

	set tmp [string length $menu_text]
	if {$tmp > $max} {set max $tmp}	


	switch $menu_value {
	    cascade {
		set current_menu  $menu_button.menu.sub$cnt
		incr cnt
		if { [winfo exists $current_menu] } {
		    destroy $current_menu 
		}
		menu $current_menu  -tearoff 0
		$menu_button.menu add cascade -label "$menu_text" -menu $current_menu
	    } 

	    uncascade {
		set current_menu $menu_button.menu
	    }

	    default {

		Widget:Popup:add_command $menu_button $current_menu "$menu_text"  " \
			global $var $lbl_var;\
			set $var $menu_value;  	\
			set $lbl_var \"$menu_text\";       \
			WidgetGfx:listener $tag _variable value; 	 \
			WidgetGfx:listener $tag _variable_lbl label ;"     \
			1 $lbl_var

		if {[string compare $menu_value $value] == 0} {
		    set $lbl_var "$menu_text" 
		}
	    }
	}

    }



    WidgetGfx:new $c $menu_button $tag
    $c itemconfigure  _$tag   -width [expr $max* 7]

    return $menu_button
}


proc WidgetGfx:create_pulldownmenu {c tag  x y width height bd value  entries} {
    set lbl_var     _${tag}_variable_lbl
    global  $lbl_var
    set  $lbl_var   " "

    set w [
        Widget:Popup:create  $c._${tag} $lbl_var 1
    ]


    pulldownmenu_setmenu $c $tag "$value"  "$entries" 


    $w config -cursor sb_down_arrow -relief groove -bd $bd
    $c create window $x $y -window  $w  -tags "_$tag widget"  -anchor nw  

    return $w

}



proc WidgetGfx:set_menu_list {c tag value entries} {
    pulldownmenu_setmenu $c $tag "$value"  "$entries" 
} 




