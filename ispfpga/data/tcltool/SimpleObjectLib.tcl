


proc OL:write {obj_name file {replace ""} {with ""} } {
    global map_attr_cnt
    set map_attr_cnt 0
    global  map_attr
    array set map_attr ""
    set doreplace   [string length $replace]
    _OL:write $obj_name $file $doreplace "$replace" "$with"
    
    foreach s  [array names map_attr] {
	set out $map_attr($s)
	if {$doreplace} {
	    regsub -all "$replace" "$out" "$with" out
	}
	puts $file "$out"
    }

}


proc _OL:write {obj_name  file {doreplace 0} {replace ""}  {with ""} } {
    global map_attr_cnt
    global  map_attr

    set obj [OL:get_object $obj_name 0]
    global $obj
    set attr ${obj}-a
    global $attr
    set children ${obj}-c
    global $children


    set full [set ${attr}(full_name)] 
    if {$doreplace} {
	regsub -all "$replace" "$full" "$with" full
    }

    puts $file "\nOL:define  $full \{ "

    foreach a [array names $attr] {
#Don't write out the attributes that get created dynamically
	switch  $a {
	    frame { }
	    widget { }
	    full_name { }
	    name { }
	    this { }
	    default {
		set v1 [set ${attr}($a) ]
		if {[string compare $a map_attr]  == 0} {
		    set map_attr($map_attr_cnt)  "$v1"
		    incr map_attr_cnt
		} else { 
		    regsub -all {\"}  $v1 {\\"}  v1  
		    puts $file "\t\{$a \"$v1\" \}"
		}

	    }
	}
    }

    puts $file "\}"


    foreach c [array names $children] {
	_OL:write ${obj}_$c $file  $doreplace "$replace" "$with"
    }
}


proc OL:get_files {obj} {
    return  [Widget:Multifile:get [OL:get_value $obj frame]]
}   

proc OL:get_textview_value {obj} {
    set tv  [Widget:Textview:get [OL:get_value $obj frame]]
    if {[winfo exists  $tv]} {
	return  [$tv get 1.0 end]
    } else {
	return [OL:get_value $obj value ""]
    }
    return ""
}


proc OL:value_as_string {obj_name   {doreplace 0} {replace ""}  {with ""} } {
    set obj [OL:get_object $obj_name 0]
    set attr ${obj}-a
    set children ${obj}-c
    global  $attr $children 

    set full [set ${attr}(full_name)] 

    if {$doreplace} {
	regsub  "$replace" "$full" "$with" full
    }

    set my ""

    if [_OL:exists $obj value] {
	set type [_OL:get_value $obj type ""]
	if {[string compare $type textview] == 0} {
	    set v1 "[OL:get_textview_value $obj]"
	} elseif {[string compare $type multifile] == 0} {
	    set v1 "[OL:get_files $obj]"
	} else {
	    set v1 [_OL:get_value $obj value ""]
	}
	regsub -all {\\}  $v1 {\\\\}  v1  
	regsub -all {\"}  $v1 {\\"}  v1  
	set my  "\tOL:define $full \{\{value \"$v1\" \}\};\n"
    }


    foreach c [array names $children] {
	set childs [OL:value_as_string ${obj}_$c  $doreplace "$replace" "$with"]
	if [UTIL:strck $childs] {
	    set  my "$my$childs" 
	}

    }
    return $my

}





proc OL:sort_object {o1 o2} {
    global ${o1}-a ${o2}-a
    return [expr [set ${o1}-a(order)] > [set ${o2}-a(order)] ]
}



proc OL:get_children {_name {sort 0} } {
    set obj [OL:get_object $_name 0]
    return [_OL:get_children $obj $sort]
}


proc _OL:has_children {obj } {
    global ${obj}-c
    return [array size  ${obj}-c]
}



proc _OL:get_children {obj {sort 0} } {
    global ${obj}-c
    set l [list]

    if {![ info exists ${obj}-c]} {return $l }

    foreach tag [array names ${obj}-c] {
	lappend l [set ${obj}-c($tag)]
    }

    if {$sort} { 
	return  [lsort -command OL:sort_object $l]
    }
    return $l
}


proc _OL:map_value  {source sindex1 sindex2 target tindex1  {filter ""} } {
    global $source 
    if {[string length $sindex1]} {
	set var $source
	set index $sindex1
	if {[string length $sindex2]} {
	    set var [set ${source}($sindex1)]
	    set index $sindex2
	    global $var
	} 

	trace variable  ${var}($index)  w  "OL:rcv $target $tindex1 \"$filter\""

	set ${var}($index) [set ${var}($index)]

    }    else  {
	trace variable  ${source}  w  "OL:rcv $target $tindex1 \"$filter\""
	set ${source}  [set  ${source}]
    }
}



proc OL:map_value_to_attr  {source sindex1  target tindex1  {filter ""} } {
    set str   "OL:map_value_to_attr $source $sindex1 $target $tindex1 \"$filter\" "

    OL:define $target " \{map_attr \{ $str; \} \}   " 1


    set target  [OL:get_object $target]

    if { [string compare $tindex1 enabled] == 0} {
	global ${target}-a
  	trace variable  ${target}-a(enabled)  w  "OL:enabled_watcher ${target}-a"
    } elseif { [string compare $tindex1 display] == 0} {
	global ${target}-a
  	trace variable  ${target}-a(display)  w  "OL:display_watcher ${target}-a"
    } 





    _OL:map_value ${source} $sindex1 "" ${target}-a  $tindex1 $filter
}


proc OL:map_attr  {source sindex1  target tindex1  {filter ""} } {

    set sobj [OL:get_object $source] 
    set tobj [OL:get_object $target]

    if {[string compare $tindex1 enabled] == 0} {
	global ${tobj}-a
  	trace variable  ${tobj}-a(enabled)  w  "OL:enabled_watcher ${tobj}-a"
    } elseif {[string compare $tindex1 display] == 0} {
	global ${tobj}-a
  	trace variable  ${tobj}-a(display)  w  "OL:display_watcher ${tobj}-a"
    }

    
    OL:define  $tobj " \{constrained_by   ${sobj}-a($sindex1) \}" 1

    set str   "OL:map_attr $source $sindex1 $target $tindex1 \"$filter\" "

    OL:define $source " \{map_attr \{ $str; \} \}   " 1

    _OL:map_value ${sobj}-a $sindex1 "" ${tobj}-a $tindex1 "$filter"
}



proc OL:rcv {target  index  filter source name2 op} {


    global $target
    set tvar $target

    if [string length $index] {
	set tvar ${target}($index)
    }

    global $source
    set svar $source
    if [string length $name2] {set svar ${source}($name2)}
    
    set v [set $svar]

    if [string length $filter] {
	set cmd_str ""
	regsub -all %V "$filter" "$v" cmd_str
	set v [eval $cmd_str]
    }


    set $tvar $v
}

proc OL:enabled_watcher {target name1 name2 op} {

    set w ""
    global $target
    if [catch "set  ${target}(frame)" w] {return}


    set e 1
    if [catch "set  ${target}(enabled)" e] {
	set ${target}(enabled) 1
	set e 1
    }

    if [string length $w] {Widget:enable $w $e}

}


proc OL:display_watcher {target name1 name2 op} {


    set w ""
    global $target
    if [catch "set  ${target}(frame)" w] {return}


    set e 1
    if [catch "set  ${target}(display)" e] {
	set ${target}(display) 1
	set e 1
    }


    if [UTIL:strck $w] {
	set pack_args ""
	if {[info  exists  ${target}(parent)]} {
	    set pack_args [OL:get_value ${target}(parent)   pack_args "-expand 1 -fill x"]
	}


	if {$e} "eval pack  $w $pack_args"  else {pack forget $w}
    }

}







proc OL:define {name {attr_list {}} {append_attr 0} } {
    global  OL_state
    set ol [split $name :]

    set parent ""
    set obj ""
    set validParent 0;
    set path ""

    foreach obj_name $ol {
	if {$validParent} {
	    set obj ${parent}_${obj_name}
	    set path "$path:${obj_name}"
	}  else {
	    set obj ${obj_name}
    	    set path "${obj_name}"
	}

	global $obj
	global ${obj}-c
	global ${obj}-a

	if {![info exists $obj]} {

	    array set ${obj}-c ""

	    set ${obj}(attr) ${obj}-a
	    set ${obj}(children) ${obj}-c


	    incr OL_state(count)

	    set ${obj}-a(order) $OL_state(count)
	    set ${obj}-a(this)  $obj
	    set ${obj}-a(name)  $obj_name
	    set ${obj}-a(full_name) $path

	    if {$validParent} {
		set ${obj}-a(parent) $parent
		global ${parent}-c
		set ${parent}-c($obj_name) $obj 
	    } 


	}
	set parent $obj
	set validParent 1
    }

    global $obj ${obj}-a

    set listener ""
    foreach attr_pair $attr_list {
	set len [llength $attr_pair]



	if {$len > 0} {
	    set attr [lindex $attr_pair 0]
	    if {$len >1} {
		set value "[lindex $attr_pair 1]"
	    } else {
		set value ""
	    }
	    if {[string compare $attr values] == 0 } {
		global ${obj}_values_list
		array set ${obj}_values_list ""
		set ${obj}-a(values)  ${obj}_values_list
		set idx 0
		foreach subvalue $value {
		    set ${obj}_values_list([lindex $subvalue 0]) [lindex $subvalue 1]
		}
	    } else {
		if {[string compare $attr listener] == 0 } {
		    set listener $value
		}

		if { $append_attr && [info exists ${obj}-a($attr)] } { 
		    set ${obj}-a($attr) "[set ${obj}-a($attr)] $value"
		} else {
		    set ${obj}-a($attr) "$value"
		}

		if {[string compare $attr value] == 0 } {
		    if {[string length $listener]} {
			trace variable  ${obj}-a(value)  w  "$listener ${obj} "		    
			set ${obj}-a($attr) $value
		    }
		} 
		if {[string compare $attr enabled] == 0} {
		    trace variable  ${obj}-a(enabled)  w  "OL:enabled_watcher ${obj}-a"
		}
	    }
	}
    }
    return $obj
} 

proc OL:is_object {_name} {
    return  [string length [OL:get_object $_name 0]]
}


proc OL:get_object {name {create 0} } {
    set obj ""
    regsub -all {:} "$name"	"_"  obj
    global $obj



    if { ![info exists $obj] } {
	if { $create } {
	    return [OL:define  $name]
	} 
	return ""
    }
    return $obj
}

proc OL:get_value {name attr {default ""} {create 0} } {
    set obj [OL:get_object $name]
    if [string length $obj] {
	return [_OL:get_value  $obj $attr "$default" $create]
    }
    return $default
}



proc _OL:get_value {obj attr {default ""} {create 0} } {
    set ret $default
    global ${obj}-a
    if [catch " set  ${obj}-a($attr) " ret] {
	if {$create} {
	    catch " set  ${obj}-a($attr) $default"
	}
	return $default
    }

    return $ret
}



proc OL:set_value {name attr v } {
    set obj [OL:get_object $name]
    if [string length $obj] {
	global ${obj}-a
	set ${obj}-a($attr) $v
    }

}

proc OL:exists {name attr} {
    set obj [OL:get_object $name]
    return [_OL:exists $obj $attr]
}

proc _OL:exists {obj attr} {
    global ${obj}-a
    return [expr ![catch " set  ${obj}-a($attr) "]]
}

proc OL:create_if_needed {name attr} {
    set obj [OL:get_object $name]
    global ${obj}-a
    if {![OL:exists $obj $attr]}  {
	set ${obj}-a($attr) ""
    }    

    return ${obj}-a($attr)    
}


proc  OL:set_defaults {var type value } {
    global  OL_state
    set OL_state(dflts,$var,$type) $value
}


proc     OL:revert_defaults {var type} {
    global OL_state
    if [info exists  OL_state($var,$type,default)  ] {
	set OL_state(dflts,$var,$type)  $OL_state(dflts,$var,$type,default)  
    }  elseif  [info exists  OL_state($var,*,default)  ] {
	set OL_state(dflts,$var,$type)  $OL_state(dflts,$var,*,default)  
    }  else {
	set OL_state(dflts,$var,$type)  ""
    }
}

proc OL:define_dflt  {var type value} {
    global OL_state 
    set OL_state(dflts,$var,$type,default) $value
    set OL_state(dflts,$var,$type)         $value
}


proc OL:initialize {} {
    if [CONFIG:called OL] return

    global  OL_state

    set OL_state(count) 0

    set OL_state(types) [list entry label menu yes_no no_yes one_of file multifile textview checkbutton list menu]
   
    foreach type  $OL_state(types) {
	set OL_state(type,$type) ""
    }

    set OL_state(globals) [list widget_args widget_pack_args label_args label_pack_args]
    foreach var  $OL_state(globals) {
	set OL_state(dflts,$var,*) ""
    }


    OL:define_dflt widget_args textview    	"-width 20 -height 20"
    OL:define_dflt widget_args list    		"-height 4 -width 10" 
    OL:define_dflt widget_args menu    		"-bd 1 -relief raised -anchor w"
    OL:define_dflt widget_args file    		"-width 21" 
    OL:define_dflt widget_args multifile    	"-width 20" 

    OL:define_dflt widget_pack_args *             "-side right -expand 1 -fill x"
    OL:define_dflt label_args *                   "-anchor e "
    OL:define_dflt label_pack_args *              "-side left"

}



OL:initialize


proc OL:create_default_widget {obj frame  } {
    set name [_OL:get_value $obj name]
    set base_frame    [eval "frame $frame.${name}_f [_OL:get_value $obj  frame_args ""]"]

    global OL_state  ${obj}-a

    set type [OL:get_value $obj type entry]


    foreach var $OL_state(globals) {
	if {[info exists OL_state(dflts,$var,$type)]} {
	    set $var    [_OL:get_value $obj $var    $OL_state(dflts,$var,$type)]
	} else {
	    set $var    [_OL:get_value $obj $var    $OL_state(dflts,$var,*)]
	}
    }



    set label_ok 1
    set label              [_OL:get_value $obj label      ""]
    set widget ""


    switch -exact $type {
	label {}

	textview {set widget [Widget:Textview:create   $base_frame   $obj $widget_args]	}

	checkbutton {set widget [Widget:Checkbutton:create  $base_frame $obj  $widget_args]}

	one_of { set widget [Widget:OneOf:create  $base_frame $obj  $widget_args ]}

	menu {  set widget [ Widget:Menu:create $base_frame  $obj 	$widget_args ]}

	list {  set widget [Widget:List:create $base_frame  $obj $widget_args]	}

	file {
	    OL:create_if_needed $obj value  
	    set widget [ Widget:File:create \
		    -base $base_frame  \
		    -var ${obj}-a      \
		    -index  value      \
		    -widget_args $widget_args \
		    -filter "[_OL:get_value $obj file_filter {*}]"   \
		    ]
	    
	}

	multifile {
	    set label_ok 0
	    set widget [Widget:Multifile:create   $base_frame  $obj $widget_args]
	}
	
	entry  {set widget [ Widget:Entry:create  $base_frame   $obj $widget_args]}
	default {set widget [ Widget:Entry:create  $base_frame   $obj $widget_args]}


    }


    if {$label_ok && [UTIL:strck  $label]} {
	set label [Widget:Label:create $base_frame "$label" "$label_args" ]
	OL:make_help $obj $label
	eval pack $label  $label_pack_args
    } else {
	OL:make_help $obj $widget 1
    }

    if [UTIL:strck $widget] "eval pack $widget  $widget_pack_args"

    return $base_frame
}




proc OL:make_help {obj l {widget 0}} {
    set help [_OL:get_value $obj help] 
    set msg  [_OL:get_value $obj msg "$help"] 
    if [UTIL:strck $help] {	
	Balloon:help $l "B2 to show help file: $help" 1000 0 "$msg"
	bind  $l <ButtonPress-2> "HELP:show \"$help\"" 
    }  else {
	Balloon:help $l "$msg" 1000 0 "$msg"

    }
}











proc OL:create_shell {  id  elt  {base_frame "" } {title "Shell"}  {create_proc ""} {verify_proc ""}   } {

    if {![UTIL:strck $base_frame]} {
	set rootWindow .
    } else {
	set rootWindow [winfo toplevel $base_frame]
    }
    if {![OL:is_object $id] && [UTIL:strck $create_proc]} {
	$create_proc ${id} $elt
    }

    OL:define ${id}  " \{window $base_frame\} "

    wm   title $rootWindow "$title"
    global     Balloon_state
    set msgvar [Balloon:define_msg_var $base_frame]


    frame $base_frame.params
    pack $base_frame.params   -expand 1 -fill both 

    set gui_proc [OL:get_value  ${id} create_gui_proc OL:create_default_frame]
    set mainframe [$gui_proc   ${id}  $base_frame.params]  
    pack $mainframe  -pady 2  -expand 1 -fill both 
    frame  $base_frame.commands
    pack $base_frame.commands -fill both -expand 1 -side top 

##    set close [button $base_frame.commands.close   -text "Iconize"          -command "wm iconify $base_frame"]
    set quit  [button $base_frame.commands.quit    -text "Close Dialog"     -command "OL:window_destroy $id "]
    if {[UTIL:strck $verify_proc]} {
	set verify  [button $base_frame.commands.verify    -text "Verify Settings"     -command "OL:verify $id $verify_proc"]
	pack $verify   -side left -fill x -expand 1 -pady 2 -padx 0
    }


##    pack  $close  $quit   -side left -fill x -expand 1 -pady 2 -padx 0
    pack    $quit   -side left -fill x -expand 1 -pady 2 -padx 0

    set msgfr [ frame $base_frame.msgfr]
    pack $msgfr -side top -expand 1 -fill x



    set msg   [label $msgfr.msgvar -textvariable $msgvar -bd 1 -relief sunken  -width 40 -anchor w]



    set cp  [Shell:Copyright:create $msgfr] 
    pack $msg $cp  -side top -expand 1 -fill x
    return $id
}




proc OL:create_standalone_shell {  id   {base_frame "" }  {title "Shell"} {create_proc ""} } {

    if {![OL:is_object $id] && [UTIL:strck $create_proc]} {
	$create_proc ${id} $elt
    }

    OL:define ${id}  " \{window $base_frame\} "
    wm   title $base_frame "$title"

    frame $base_frame.params
    pack $base_frame.params   -expand 1 -fill both 

    set gui_proc [OL:get_value  ${id} create_gui_proc OL:create_default_frame]
    set mainframe [$gui_proc   ${id}  $base_frame.params]  
    pack $mainframe  -pady 2  -expand 1 -fill both 
    frame  $base_frame.commands
    pack $base_frame.commands -fill both -expand 1 -side top 

##    set close [button $base_frame.commands.close   -text "Iconize"          -command "wm iconify $base_frame"]
    set quit  [button $base_frame.commands.quit    -text "Close Dialog"     -command "OL:window_destroy $id "]
##    pack  $close  $quit   -side left -fill x -expand 1 -pady 2 -padx 0
    pack    $quit   -side left -fill x -expand 1 -pady 2 -padx 0
    pack [Shell:Copyright:create $base_frame] -side top -expand 1 -fill x
    return $id
}




proc OL:window_destroy {id } {
    set window [OL:get_value $id window FOO]
    destroy $window
}    








proc OL:create_gui {name {base_frame ""}} {
    set obj [OL:get_object $name]
    set func [OL:get_value  $obj create_gui_proc OL:create_default_frame] 
    return [$func  $name  $base_frame]
}



proc OL:gridify {name cols args {startrow 0 } } {

    set col 0
    set row $startrow

    foreach child [_OL:get_children [OL:get_object $name] 1] {
	if {$col >= $cols} {set col 0;incr row}
	global ${child}-a
	set ${child}-a(grid_args) "-row $row -column $col $args"
	incr col
    }
}


proc OL:create_default_frame {object_name {base_frame ""} } {

    set parent [OL:get_object $object_name]

    if [_OL:exists $parent frame] {
	if [winfo exists [_OL:get_value $parent frame]] {
	    return [_OL:get_value $parent frame]
	}
    }


    set name [_OL:get_value $parent name]
    set pack_args     [_OL:get_value $parent  pack_args "-expand 1 -fill x"]
    set frame_args    [_OL:get_value $parent  frame_args ""]
    set parent_frame  [eval "frame  $base_frame.${name}_f $frame_args"]


    set grid          [_OL:get_value $parent  grid_pack 0]
    if $grid {
	set rows [_OL:get_value $parent  rows 1]
	set cols [_OL:get_value $parent  cols 1]
	for {set i 0} {$i < 6} {incr i} {
	    grid columnconfigure $parent_frame $i -weight 1 
	}
    }


    set label [_OL:get_value $parent  label ""]
    if [UTIL:strck  $label] {
	set l [eval label $parent_frame.frame_label -text \"$label\" [_OL:get_value $parent label_args]]
	OL:make_help $parent $l
	if $grid {grid $l -columnspan 4} else {pack $l -side top }
    }




    foreach child [_OL:get_children $parent 1] {
	if { [_OL:get_value $child show 1] ==0 } {continue}

	if  [_OL:has_children $child ]  {
	    set widget_proc [OL:get_value $child widget_proc  OL:create_default_frame]
	} else {
	    set widget_proc [OL:get_value $child widget_proc  OL:create_default_widget]
	}

	set child_frame [$widget_proc  $child  $parent_frame] 
	OL:set_value $child frame $child_frame

	if { [OL:get_value $child display 1] } {
	    if "$grid" {
		eval "grid $child_frame $pack_args [_OL:get_value $child grid_args]"
	    } else {
		eval "pack   $child_frame  $pack_args"
	    }
	}

	if {![OL:get_value $child enabled 1]} {
	    Widget:disable $child_frame
	}
    }

    OL:set_value  $parent frame $parent_frame
    return $parent_frame
}




proc OL:verify {id proc} {
    set errors [$proc $id ""]
    if [string length $errors] {
	option add *Dialog.msg.wrapLength 6i 
	tk_messageBox -icon error  -type ok   -message [join $errors "\n"]
	option add *Dialog.msg.wrapLength 3i 
    } else {
	tk_messageBox   -type ok   -message "Settings are valid"
    }
}



proc OL:verify_object {object error_list} {
    upvar  $error_list errors
    foreach child [OL:get_children $object] {
	if {[OL:get_value $child enabled 1] } {
             OL:verify_attribute $child errors

	}
	OL:verify_object $child errors
    }
}


proc OL:verify_attribute {object error_list} {
    upvar  $error_list errors
    set proc [OL:get_value $object verify_proc]
    if [string length $proc] { 
	set mess "Error"
	if {[llength $proc] >1} {
	    set mess [lindex $proc 1]
	    set proc [lindex $proc 0]
	}
	if {![eval "$proc  $object"]} {
	    lappend errors $mess
	}
    }
}





proc OL:check_greater { value attr} {
    if [OL:exists $attr value] {
	set v [OL:get_value $attr value]
	if [catch {expr $v+1}] {return 0}
	if {$v <= $value} {return 0}
    }
    return 1
}


proc OL:file_readable {obj {ok_if_null 1} } {
    set file [OL:get_value $obj value]
    if {[string length $file] == 0} {    
	if {!$ok_if_null} {return 0}
	return 1
    }
    return [file exists $file]
}


proc OL:file_set {obj } {
    set file [OL:get_value $obj value]
    if {[string length $file] == 0} {    
	return 0
    }
    return 1
}



proc OL:check_less { value attr} {
    if [OL:exists $attr value] {
	set v [OL:get_value $attr value]
	if [catch {expr $v+1}] {return 0}
	if {$v >= $value} {return 0}
    }
    return 1
}





proc OL:check_between { low high attr} {
    if [OL:exists $attr value] {
	set v [OL:get_value $attr value]
	if [catch {expr $v+1}] {return 0}
	if {$v < $low} {return 0}
	if {$v > $high} {return 0}
    }
    return 1
}



proc OL:check_non_null {attr} {
    if [OL:exists $attr value] {
	set v [OL:get_value $attr value]
	set r [string length [string trim $v]]
	return $r
    }
    return 1
}



##basic argument constructor routines

proc OL:arg_param_arg_if_set {obj} {
    set arg [OL:get_value $obj arg ""]
    set v   [string trim [OL:get_value $obj value]]
    if [string length $v] {return " $arg  $v " }
    return ""
}


proc OL:arg_choose { list obj} {
    set arg [OL:get_value $obj arg ""]
    set value   [string trim [OL:get_value $obj value]]
    foreach l $list {
	set v [string trim [lindex $l 0]]
	if {[string compare "$value" "$v"] == 0} {return "$arg [lindex $l 1]"}
    }
    return ""
}


proc OL:arg_get_value {obj} {
    global $obj
    set r ""
    catch {set r [OL:get_value $obj value]} 
    return " [string trim $r ] "
}

proc OL:arg_get_param_value  {obj} {
    global $obj
    set arg [OL:get_value $obj arg ""]
    set v   [string trim [OL:get_value $obj value]]
    return " $arg  $v " 
}

proc OL:collect_arg_values {obj} {
    global $obj
    set args ""

    foreach child [OL:get_children $obj ] {
	if {![OL:get_value $child enabled 1] } {continue;}
	if {![OL:get_value $child display 1] } {continue;}
	if {[OL:exists $child arg]  || [OL:exists $child arg_proc]} {

	    set arg_proc [OL:get_value $child arg_proc OL:arg_get_param_value]
	    set args "$args [string trim [eval $arg_proc $child]] "
	} else {
	    set args "$args [string trim [OL:collect_arg_values $child]]"
	}
    }
    return $args
}






proc OL:enable_when_equals  {target {value 1} source {index1 ""} {index2 ""} } {
    global $source 
    if {[string length $index1]} {
	set var $source
	set index $index1
	if {[string length $index2]} {
	    set var [set ${source}($index1)]
	    set index $index2
	} 
	global $var
	trace variable  ${var}($index)  w  "OL:set_enabled $target \"$value\""
	set ${var}($index) [set ${var}($index)]
    }    else  {
	trace variable  ${source}  w  "OL:set_enabled $target \"$value\""
	set ${source}  [set  ${source}]
    }

}



proc OL:set_enabled  {tar_get_attr  test source_var   index op} {
    global $source_var $tar_get_attr
    set result ""
    set v ""

    if {[string length $index] } { 
	set v [set ${source_var}($index)]
    } else {
	set v  $source_var
    }


    if [catch "expr $test == $v" result] {
	set result [expr [string compare $v $test] == 0]
    }


    if [OL:ok $tar_get_attr frame] {
	set frame [OL:get $tar_get_attr frame]
	if {$result} {Widget:enable $frame} else {Widget:disable $frame}
    }

    set ${tar_get_attr}(enabled) $result
}








