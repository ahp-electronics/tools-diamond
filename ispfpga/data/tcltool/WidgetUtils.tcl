



proc Widget:scrolled_frame:create {base} {
    set basef [frame $base.sc_basef]
    pack $basef -side top -expand 1 -fill both
    set  c [canvas $basef.c  -yscrollcommand "$basef.scr set" -border 1 -relief raised]
    set f [frame $basef.c.frame]
    $basef.c create window 0 0 -window $basef.c.frame -anchor nw 
    scrollbar $basef.scr -orient vertical -command "$c yview"
    grid  $basef.scr -sticky ns
    grid  $basef.c -row 0 -column 1 -sticky news
    grid columnconfigure $basef  1 -weight 1 
    bind   $f <Configure>  "Widget:scrolled_frame:config $basef.c"
    return $basef.c.frame
}


proc Widget:scrolled_frame:config {c} {
    set w [winfo width    $c.frame] 
    set h [winfo height   $c.frame] 
    $c  config -width $w  -scrollregion "0 0 $w  $h"
}





proc Widget:change_all {f text_value widget_value} {
    set class [winfo class $f]

## If the widget is a label then change it's color and return
    if {[string compare $class "Label"] == 0} {
	$f configure -foreground $text_value 
	return
    } 

##If this is a regular widget then we'll return
    if {[catch "$f configure -state $widget_value"] == 0} {return}

    set children [winfo  children $f]
    foreach child  $children {
	Widget:change_all $child $text_value $widget_value
    }
}



proc Widget:disable {f} {Widget:change_all $f grey disabled}

proc Widget:enable {f {s 1}} {
    if {$s} {
	Widget:change_all $f black normal
    } else {Widget:disable $f}
}





proc Widget:Label:create  {base label {label_args "-width 20 -anchor e"} } {
    return [eval "label $base.label -text \"$label\" $label_args"]
}



proc Widget:OneOf:create {base  obj widget_args} {
    set var [OL:create_if_needed $obj value ]  
    set widget_packer_args [_OL:get_value $obj sub_widget_pack_args {-side left} ]  
    set my_base [eval frame $base.widget $widget_args]
    set i 0
    foreach l [_OL:get_value $obj choices {}]  {
	set subl [llength $l]
	if {$subl <2} {
	    radiobutton $my_base.$i -text $l -variable $var -value $l 
	} else {
	    radiobutton $my_base.$i -text [lindex  $l 0] -variable $var -value [lindex  $l 1] 
	}
	eval pack $my_base.$i $widget_packer_args
	incr i
    }
    return $my_base
}







proc Widget:List:reset {lb l} {
    if [string length $lb] {
	$lb delete 0 end
	foreach item $l {
	    $lb insert end $item
	}
    }

}

proc Widget:List:create {    base      obj     widget_args    } {

    OL:create_if_needed $obj value  

    set var  ${obj}-a 
    set index  value 
    global $var
    set crnt  [set ${var}($index)]

    set  widget [frame $base.list]
    set list_widget  [eval    listbox $widget.listbox $widget_args \
	    -exportselection false \
	    -yscrollcommand \"[list $widget.sy set]\" \
	    -selectmode single     ]
    scrollbar $widget.sy -orient vertical -command "$list_widget yview"
    
    OL:set_value $obj widget $list_widget


    pack $widget.sy -side right  -fill y


    set i 0
    foreach entry [OL:get_value $obj choices {}] {
	set subl [llength $entry]
	if {$subl <2} {
	    set text $entry
	    set value $entry
	} else {
	    set text [lindex $entry 0]
	    set value [lindex $entry 1]
	}
	$list_widget insert end $text
	if  {[string compare $crnt $value] == 0} {
	    $list_widget selection set $i
	}
	incr i
    }

    bind $list_widget <ButtonRelease-1>  "Widget:List:select %W $var $index "

    pack $list_widget -side left -fill both -expand 1
    return $widget


}


proc Widget:List:select {l var index } {
    global $var 


    set sel [$l curselection]
    if [string length $sel] {
	$l activate $sel
	set v [$l get $sel $sel]
	set ${var}($index) $v
    }


}










proc Widget:Menu:create {base   obj widget_args} {
	OL:create_if_needed $obj value  
	set dflt_l [_OL:get_value $obj value ]


	set widget [eval menubutton  $base.mb  -text \"$dflt_l\" -menu  $base.mb.menu $widget_args ]
	set mm  [menu $widget.menu -font fixed -tearoff 0 -bd 1]

	set var ${obj}-a 
	set index value 
	global $var
	set crnt  [set ${var}($index)]
	set max 0


	foreach l  [_OL:get_value $obj choices {}]  {

	    set subl [llength $l]

	    if {$subl <2} {
		set text $l
		set value $l
	    } else {
		set text [lindex $l 0]
		set value [lindex $l 1]
	    }
	    set tmp [string length $text]
	    if {$tmp > $max} {set max $tmp}	
	    Widget:Popup:add_command $widget $widget.menu  $text "global $var;   set ${var}($index) $value"
	    if {[string compare $crnt $value] == 0} {
		$widget configure -text "$text"
	    }
	}

##puts "MAX:$max"
##	$widget configure -width $max
	return $widget
}







proc Widget:Entry:create {base obj widget_args } {
    return  [eval entry $base.entry \
	    -textvariable  [OL:create_if_needed $obj value ]  \
	    $widget_args \
    ]
}





proc Widget:Popup:create { f {default ""} {isvar 0} {args  ""}}  {
    set myargs "-anchor w -font fixed  -relief groove -bd 0 -padx 0 -pady 1 -highlightthickness 0" 
    if {$isvar} {
	set mb [eval menubutton  $f -textvariable $default -menu  $f.menu  $myargs $args    ]
    } else  {
	set mb [eval menubutton  $f -text "$default" -menu  $f.menu $myargs $args ]
    }
    set mm  [menu $mb.menu -font fixed -tearoff 0 -bd 1]
    return $mb
}


proc Widget:Popup:add_command {mb menu label cmd {isvar 0} {lblvar ""} } { 
    if {$isvar} {
	$menu add command -label "$label" \
		-command "[concat  Widget:Popup:command $lblvar  $mb  "{"  $cmd "}" $isvar ] "
    } else {
	$menu add command -label "$label"  \
		-command "[concat  Widget:Popup:command "{" $label "}" $mb  "{"  $cmd "}" $isvar ] "
    }

}



proc Widget:Popup:command {label mb cmd {label_isvar 0} } {
    eval $cmd

    if {$label_isvar} {
	global $label
	set label [global $label; set $label]
    } else {
	$mb configure -text  $label
    }

}





proc Widget:Textview:get {base} {
    return $base.frame.text
}

proc Widget:Textview:create {base obj widget_args} {
    set var [OL:create_if_needed $obj value ]  
    set txt [eval frame $base.frame [_OL:get_value $obj frame_args ]]
    set msg_text [eval text $txt.text  -yscrollcommand \"$txt.scroll set\" [_OL:get_value $obj frame_args ]]




    scrollbar $txt.scroll -command "$msg_text yview"
    pack $txt.scroll -side left -fill y
    pack $msg_text -side left -expand 1 -fill both 
    $msg_text insert end [_OL:get_value $obj value]
##bind the destroy of the dummy button to reset the value from the textview
    button $msg_text.dummy
    bind $msg_text.dummy <Destroy> "set $var \[$msg_text get 1.0 end\]"
    return $txt
}


proc Widget:Checkbutton:create {  base obj widget_args } {
    set var [OL:create_if_needed $obj value ]  
    set lbl [_OL:get_value $obj cb_label]
    set on  [_OL:get_value $obj on_value 1]
    set off [_OL:get_value $obj off_value 0]
    return  [ eval checkbutton  $base.button \
	    -text \"$lbl\"   \
	    -variable $var \
	    -onvalue \"$on\" \
	    -offvalue \"$off\" \
	    $widget_args \
	    ]
}





proc Widget:File:create args  {

    set specs {
	{-base "" "" ""}
        {-widget_args "" "" ""}
        {-frame_args "" "" ""}
        {-label "" "" ""}
	{-filter  "" "" "*"}
	{-files  "" "" ""}
	{-var "" "" ""}
	{-index "" "" ""}
    }


    set w File_privVar
    upvar #0 $w data
    tclParseConfigSpec $w $specs "" $args

    set widget [eval frame $data(-base).widget $data(-frame_args)]

    set var  $data(-var)
    set index $data(-index)
    global $var


    set entry  [eval "entry $widget.entry  -textvariable ${var}($index) -bd 1 -relief sunken $data(-widget_args)" ]
    set browse [button $widget.browse -text "Browse..." -highlightthickness 0 -width 0  -bd 1 -relief raised -command "Widget:File:browse  $var $index $data(-filter)"]

    pack $browse  -side right  
    pack $entry   -side right -expand 1 -fill x

    return  $widget
}





proc Widget:File:browse {var {index ""}  {filter "*"}} {
    
    global $var
    set v $var
    if [string length $index] {set v ${var}($index)}
    set newName [tk_getOpenFile -initialfile [set $v]]
    if [string length $newName] {
	set $v $newName
    }
}




proc Widget:Canvas:create { c name width height region } {
	canvas $c.$name  -width $width -height $height \
		-scrollregion $region \
		-xscrollcommand [list $c.xscroll set] \
		-yscrollcommand [list $c.yscroll set]
	scrollbar $c.xscroll -orient horizontal \
		-command [list $c.$name xview] -highlightthickness 0
	scrollbar $c.yscroll -orient vertical \
		-command [list $c.$name yview] -highlightthickness 0


    grid $c.$name    -sticky news 
    grid $c.yscroll  -sticky nws  -row 0 -column 1 
    grid $c.xscroll  -sticky new  -row 1 -column 0
    grid columnconfigure $c  0 -weight 1 
    grid rowconfigure $c  0 -weight 1 

    return $c.$name
}

# Menu chapter

proc Menu:setup { {frame .menubar} } {
	global Menu_state
	frame $frame 
        pack $frame -side left -fill x -expand 1
	set Menu_state(menubar) $frame
	set Menu_state(uid) 0

}


proc Menu:create {  id label {underline -1} {packargs "-side left"}} {
	global Menu_state
	if [info exists Menu_state(menu,$id)] {
	    error "Menu $label already defined"
	}
	# Create the menubutton and its menu
	set name $Menu_state(menubar).mb$Menu_state(uid)
	set menuName $name.menu
	incr Menu_state(uid)
	if {$underline > -1} {
	    set mb [menubutton $name -text $label -menu $menuName -underline $underline]
	} else {
	    set mb [menubutton $name -text $label -menu $menuName]
	}

	eval  "pack $mb $packargs"
	set menu [menu $menuName -tearoff 0]
    
	# Remember the widget name under a variable derived from the label.
	# This allows mxMenuBind to be passed the label instead of the widget.
	set Menu_state(menu,$id) $menu
	return $menu
}


proc Menu:exists {name} {
    global Menu_state
    return [info exists Menu_state(menu,$name)]
}

proc Menu:get {name} {
	global Menu_state
	if [catch {set Menu_state(menu,$name)} menu] {
	    return ""
	}
	return $menu
}

proc Menu:disable {name patt} {
    if [Menu:exists $name] {
	[Menu:get ${name}] entryconfigure "$patt"  -state disabled
    }
}

proc Menu:enable {name patt} {
    if [Menu:exists $name] {
	[Menu:get ${name}] entryconfigure "$patt"  -state normal
    }
}



proc Menu:command {menuName label command {underline -1} {bm 0} } {
	global Menu_state
	if [catch {set Menu_state(menu,$menuName)} menu] {
		error "No such menu: $menuName"
	}
	if {$underline != -1} { 
	    $menu add command -label $label -command "$command"  -underline $underline
	} else {
	    if  $bm {
		$menu add command -bitmap [WidgetGfx:get_bitmap_file $label] -command "$command"  
	    } else {
		$menu add command -label $label -command "$command"  
	    }
	}
}

proc Menu:check { menuName label var { command  {#} } {onvalue 1} {offvalue 0}  } {
	global Menu_state
	if [catch {set Menu_state(menu,$menuName)} menu] {
		error "No such menu: $menuName"
	}

	$menu add check -label $label -command "$command " \
		-variable $var -onvalue "$onvalue" -offvalue "$offvalue"
}

proc Menu:radio { menuName label var {value {}} { command  {} } {bm 0} } {
	global Menu_state
	if [catch {set Menu_state(menu,$menuName)} menu] {
		error "No such menu: $menuName"
	}
	if {[string length $value] == 0} {
	    set value $label
	}
	if {$bm} {
	    $menu add radio -bitmap [WidgetGfx:get_bitmap_file $label] -command $command \
		    -value $value -variable $var
	} else {
	    $menu add radio -label $label -command $command \
		    -value $value -variable $var
	}
}


proc Menu:separator { menuName } {
	global Menu_state
	if [catch {set Menu_state(menu,$menuName)} menu] {
		error "No such menu: $menuName"
	}
	$menu add separator
}

proc Menu:cascade { parent id label } {
	global Menu_state
	if [catch {set Menu_state(menu,$parent)} menu] {
	    error "No such menu: $parent"
	}
	if [info exists Menu_state(menu,$id)] {
		error "Menu $id already defined"
	}
	set sub $menu.sub$Menu_state(uid)
	incr Menu_state(uid)
	menu $sub -tearoff 0
	$menu add cascade -label "$label" -menu $sub
	set Menu_state(menu,$id) $sub
}








##This is a modified version of the  tk_messageBox code
##Added a list entry
proc Widget:tkMessageBox {args} {
    global widget_tkPriv 

    set w widget_tkPrivMsgBox
    upvar #0 $w data

    #
    # The default value of the title is space (" ") not the empty string
    # because for some window managers, a 
    #		wm title .foo ""
    # causes the window title to be "foo" instead of the empty string.
    #
    set specs {
	{-default "" "" ""}
        {-icon "" "" "info"}
        {-message "" "" ""}
        {-parent "" "" .}
        {-title "" "" " "}
        {-type "" "" "ok"}
	{-list "" "" ""}
    }

    tclParseConfigSpec $w $specs "" $args

    if {[lsearch {info warning error question} $data(-icon)] == -1} {
	error "invalid icon \"$data(-icon)\", must be error, info, question or warning"
    }

    if ![winfo exists $data(-parent)] {
	error "bad window path name \"$data(-parent)\""
    }

    case $data(-type) {
	abortretryignore {
	    set buttons {
		{abort  -width 6 -text Abort -under 0}
		{retry  -width 6 -text Retry -under 0}
		{ignore -width 6 -text Ignore -under 0}
	    }
	}
	ok {
	    set buttons {
		{ok -width 6 -text OK -under 0}
	    }
	    if {$data(-default) == ""} {
		set data(-default) "ok"
	    }
	}
	okcancel {
	    set buttons {
		{ok     -width 6 -text OK     -under 0}
		{cancel -width 6 -text Cancel -under 0}
	    }
	}
	retrycancel {
	    set buttons {
		{retry  -width 6 -text Retry  -under 0}
		{cancel -width 6 -text Cancel -under 0}
	    }
	}
	yesno {
	    set buttons {
		{yes    -width 6 -text Yes -under 0}
		{no     -width 6 -text No  -under 0}
	    }
	}
	yesnocancel {
	    set buttons {
		{yes    -width 6 -text Yes -under 0}
		{no     -width 6 -text No  -under 0}
		{cancel -width 6 -text Cancel -under 0}
	    }
	}
	default {
	    set l [split $data(-type) :]
	    set buttons [list]
	    foreach b $l {
		set a [split $b -]
		lappend buttons "[lindex $a 0]  -text \"[lindex $a 1]\""
	    }
	}
    }

    if [string compare $data(-default) ""] {
	set valid 0
	foreach btn $buttons {
	    if ![string compare [lindex $btn 0] $data(-default)] {
		set valid 1
		break
	    }
	}
	if !$valid {
	    error "invalid default button \"$data(-default)\""
	}
    }

    # 2. Set the dialog to be a child window of $parent
    #
    #
    if [string compare $data(-parent) .] {
	set w $data(-parent).__tk__messagebox
    } else {
	set w .__tk__messagebox
    }

    # 3. Create the top-level window and divide it into top
    # and bottom parts.

    catch {destroy $w}
    toplevel $w -class Dialog
    wm title $w $data(-title)
    wm iconname $w Dialog
    wm protocol $w WM_DELETE_WINDOW { }
    wm transient $w $data(-parent)

    frame $w.bot -relief raised -bd 1
    pack $w.bot -side bottom -fill both
    frame $w.top -relief raised -bd 1
    pack $w.top -side top -fill both -expand 1


    if [string compare $data(-list) ""] {
	set  widget [frame $w.top.list]
	set l  [listbox $widget.listbox  -yscrollcommand "$widget.sy set" ]
	bind $l <Button> {}
	scrollbar $widget.sy -orient vertical -command "$l yview"
	pack $widget.sy -side right  -fill y
	pack  $widget -side top -fill both -expand 1
	foreach e $data(-list) {
	    $l insert end $e
	}
	pack $l -side left -fill both -expand 1
    }




    # 4. Fill the top part with bitmap and message (use the option
    # database for -wraplength so that it can be overridden by
    # the caller).

    option add *Dialog.msg.wrapLength 3i widgetDefault
    label $w.msg -justify left -text $data(-message)
    catch {$w.msg configure -font \
		-Adobe-Times-Medium-R-Normal--*-180-*-*-*-*-*-*
    }
    pack $w.msg -in $w.top -side right -expand 1 -fill both -padx 3m -pady 3m
    if {$data(-icon) != ""} {
	label $w.bitmap -bitmap $data(-icon)
	pack $w.bitmap -in $w.top -side left -padx 3m -pady 3m
    }

    # 5. Create a row of buttons at the bottom of the dialog.

    set i 0
    foreach but $buttons {
	set name [lindex $but 0]
	set opts [lrange $but 1 end]
	if ![string compare $opts {}] {
	    # Capitalize the first letter of $name
	    set capName \
		[string toupper \
		    [string index $name 0]][string range $name 1 end]
	    set opts [list -text $capName]
	}

	eval button $w.$name $opts -command [list "set widget_tkPriv(button) $name"]

	if ![string compare $name $data(-default)] {
	    frame $w.default -relief sunken -bd 1
	    raise $w.$name $w.default
	    pack $w.default -in $w.bot -side left -expand 1 -padx 3m -pady 2m
	    pack $w.$name -in $w.default -padx 2m -pady 2m
	} else {
	    pack $w.$name -in $w.bot -side left -expand 1 \
		-padx 3m -pady 2m
	}

	# create the binding for the key accelerator, based on the underline
	#
	set underIdx [$w.$name cget -under]
	if {$underIdx >= 0} {
	    set key [string index [$w.$name cget -text] $underIdx]
	    bind $w <Alt-[string tolower $key]>  "$w.$name invoke"
	    bind $w <Alt-[string toupper $key]>  "$w.$name invoke"
	}
	incr i
    }

    # 6. Create a binding for <Return> on the dialog if there is a
    # default button.

    if [string compare $data(-default) ""] {
	bind $w <Return> "tkButtonInvoke $w.$data(-default)"
    }

    # 7. Withdraw the window, then update all the geometry information
    # so we know how big it wants to be, then center the window in the
    # display and de-iconify it.

    wm withdraw $w
    update idletasks
    set x [expr [winfo screenwidth $w]/2 - [winfo reqwidth $w]/2 \
	    - [winfo vrootx [winfo parent $w]]]
    set y [expr [winfo screenheight $w]/2 - [winfo reqheight $w]/2 \
	    - [winfo vrooty [winfo parent $w]]]
    wm geom $w +$x+$y
    wm deiconify $w

    # 8. Set a grab and claim the focus too.

    set oldFocus [focus]
    set oldGrab [grab current $w]
    if {$oldGrab != ""} {
	set grabStatus [grab status $oldGrab]
    }
    grab $w
    if [string compare $data(-default) ""] {
	focus $w.$data(-default)
    } else {
	focus $w
    }

    # 9. Wait for the user to respond, then restore the focus and
    # return the index of the selected button.  Restore the focus
    # before deleting the window, since otherwise the window manager
    # may take the focus away so we can't redirect it.  Finally,
    # restore any grab that was in effect.

    tkwait variable widget_tkPriv(button)
    catch {focus $oldFocus}
    destroy $w
    if {$oldGrab != ""} {
	if {$grabStatus == "global"} {
	    grab -global $oldGrab
	} else {
	    grab $oldGrab
	}
    }
    return $widget_tkPriv(button)
}






###############   Font utilities   ##############################
#From the  Font chapter of Brent Welch's book

proc Font:find {{sizes 14} {weight medium} {slant r}} {
    global dummyWidget
    foreach family {times courier helvetica} {
	foreach size $sizes {
	    if {[catch {$dummyWidget config -font \
		    -*-$family-$weight-$slant-*-*-$size-*}] == 0} {
		return -*-$family-$weight-$slant-*-*-$size-*
	    }
	}
    }
    return fixed
}



proc Font:init {} {
    if [CONFIG:called Font] {return}
    global Font_state
    set Font_state(dummy) [label .dummy_widget]
    set Font_state(fonts,copyright) [Font:find   12  medium i]
    set Font_state(fonts,big) [Font:find   24 medium]
}



Font:init



proc Widget:Multifile:create {base obj widget_args} {


    set top [eval frame $base.widget]
##Add a dummy widget to catch the window destroy
    button $top.dummy
    bind $top.dummy <Destroy>     "OL:set_value $obj value \[Widget:Multifile:get $base\]"



    set l_f [frame $top.label_f]
    label $l_f.lbl -text "[_OL:get_value $obj label]"

    button $l_f.add -text "Add File" -command "Widget:Multifile:add -base $base  -widget_args \"$widget_args\"" -highlightthickness 0 -width 0 -bd 1
    Balloon:help $l_f.add "Create a new file entry"

    pack $l_f.add -side right    
    pack $l_f.lbl -side left
    pack $l_f -side top -fill x -expand 1 

    set c_f [frame  $top.c_f -bd 1 -relief raised]
    pack $c_f -expand 1 -fill y
    set c [canvas $c_f.c  -yscrollcommand "$c_f.scr set"  -height 150 ]
    set scr [scrollbar $c_f.scr -orient vertical -command "$c yview" -highlightthickness 0]

    pack $c -side left -expand 1 -fill y -padx 0
    pack $scr -side left -expand 1 -fill y -padx 0

    set filelist  [frame $c.frame ]
    $c create window 0 2  -window $filelist -anchor nw

    global Widget_state
    set hook [_OL:get_value $obj hook]
    if [UTIL:strck $hook] {set Widget_state(Multifile,$base,hook) $hook}

    set Widget_state(Multifile,$base,id) 0
    set Widget_state(Multifile,$base,row) 0
    set Widget_state(Multifile,$base,filelist) $filelist
    set Widget_state(Multifile,$base,filter) [_OL:get_value $obj filter]


    grid columnconfigure $filelist 1 -weight 1
    

    foreach file [_OL:get_value $obj value ] {
	Widget:Multifile:add -base $base -file $file	-widget_args $widget_args
    }


    Widget:Multifile:add -base $base  -widget_args $widget_args

    bind $c  <Map>  "Widget:Multifile:adjust $filelist $c"

    return  $top
}



proc Widget:Multifile:add args  {

    set specs {
	{-base "" "" ""}
        {-widget_args "" "" ""}
	{-file  "" "" ""}
    }


    set w MultifileAdd_privVar
    upvar #0 $w data
    tclParseConfigSpec $w $specs "" $args



    global Widget_state

    set my_id $Widget_state(Multifile,$data(-base),id) 
    incr Widget_state(Multifile,$data(-base),id)
    set row $Widget_state(Multifile,$data(-base),row) 
    incr Widget_state(Multifile,$data(-base),row) 



    set f $Widget_state(Multifile,$data(-base),filelist) 
    set row_f [frame $f.row_f$my_id -bd 1 -relief groove]


    if [info exists Widget_state(Multifile,$data(-base),hook) ] {
	catch "eval $Widget_state(Multifile,$data(-base),hook):create  $data(-base) $row_f $my_id"
    }


    set Widget_state(Multifile,$data(-base),$my_id,widgets)   $row_f
    set Widget_state(Multifile,$data(-base),$my_id,file)      $data(-file)
    set Widget_state(Multifile,$data(-base),$my_id,row)       $row
    set Widget_state(Multifile,$data(-base),$row,id)          $my_id


    set entry  [eval entry $row_f.entry -bd 1 -relief sunken $data(-widget_args)  -textvariable  Widget_state(Multifile,$data(-base),$my_id,file) ]


    set ud_f [frame $row_f.ud_f]
    set up [button $ud_f.up -bitmap [WidgetGfx:get_bitmap_file up.xbm] -command "Widget:Multifile:up_down $data(-base) $my_id"  -highlightthickness 0 -width 0 -bd 0]
    set dn [button $ud_f.dn -bitmap [WidgetGfx:get_bitmap_file down.xbm] -command "Widget:Multifile:up_down $data(-base) $my_id +1"  -highlightthickness 0 -width 0 -bd 0]

    Balloon:help $up "Move this entry up in the list"
    Balloon:help $dn "Move this entry down in the list"

    set mb [eval menubutton  $row_f.mb -text Tools -menu  $row_f.mb.menu -bd 1 -relief raised]
    set menu  [menu $mb.menu -font fixed -tearoff 0 -bd 1]
    $menu add command -label   "Browse..."	-command  "Widget:Multifile:browse $data(-base) $my_id"  
    $menu add command -label   "Remove"	        -command  "Widget:Multifile:remove $data(-base) $my_id"  


    set remove [button $row_f.remove -text "Remove" -bd 1 -relief raised -command "Widget:Multifile:remove $data(-base)  $my_id"  -highlightthickness 0 -width 0 ] 


    grid $row_f -sticky ew -row $row 
    pack $up $dn -side top
    pack $ud_f   -side left  
    pack $entry  -side left -expand 1 -fill  x 
    pack $mb -side left  


}




proc Widget:Multifile:adjust {filelist c} {
    set widget ""
    foreach child [winfo  children $filelist]  {
	set widget $child
	break;
    }
    if {![UTIL:strck $widget]} {set widget $filelist}
    set w [winfo width  $widget] 
    set h [winfo height  $widget] 
    $c  config -width $w -yscrollincrement $h -scrollregion "0 0 $w [expr $h * 40]" -height [expr $h*5]
    bind $c  <Map>  {}
}



proc Widget:Multifile:get {base} {
    global Widget_state
    set row $Widget_state(Multifile,$base,row) 
    set l [list]
    for {set idx 0} {$idx < $row} {incr idx} {
	set id $Widget_state(Multifile,$base,$idx,id)
	set file $Widget_state(Multifile,$base,$id,file)     	
	if [UTIL:strck $file] {
	    lappend l $file
	}
    }
    return $l
}



proc Widget:Multifile:browse {base my_id} {
    global  Widget_state
    set filter  $Widget_state(Multifile,$base,filter)
    set newName [tk_getOpenFile -initialfile  $Widget_state(Multifile,$base,$my_id,file)    -filetypes $filter ]
    if [UTIL:strck $newName] {
	set Widget_state(Multifile,$base,$my_id,file)      $newName
    }
}



proc Widget:Multifile:remove {base my_id} {
    global Widget_state

    if {![info exists Widget_state(Multifile,$base,$my_id,widgets)] } {return}

    if [info exists Widget_state(Multifile,$base,hook) ] {
	catch "eval $Widget_state(Multifile,$base,hook):destroy  $base   $my_id"
    }

    foreach widget $Widget_state(Multifile,$base,$my_id,widgets) {
	destroy $widget
    }
    set row $Widget_state(Multifile,$base,$my_id,row)
    unset Widget_state(Multifile,$base,$row,id)        


##  puts "\nRemoving row: $row"

    foreach name [array names Widget_state Multifile,$base,$my_id,*] {
	unset Widget_state($name)
    }

    for {incr row } {$row <  $Widget_state(Multifile,$base,row) } {incr row} {
##	puts "\tChanging row $row"
	set id $Widget_state(Multifile,$base,$row,id)
	Widget:Multifile:change_row $base $id [expr $row - 1]
    }

##    puts "\n"

    incr Widget_state(Multifile,$base,row)  -1

##    puts "Current row value is $Widget_state(Multifile,$base,row) \n "

}


proc Widget:Multifile:change_row {base id new_row} {
    global Widget_state

    set col 0
    foreach w $Widget_state(Multifile,$base,$id,widgets)   {
	grid $w -row $new_row -column $col -sticky ew; incr col    
    }

    set Widget_state(Multifile,$base,$id,row) $new_row
    set Widget_state(Multifile,$base,$new_row,id) $id

}



proc Widget:Multifile:up_down {base my_id {incr -1} } {
    global Widget_state
    set my_row  $Widget_state(Multifile,$base,$my_id,row)

    set other_row  [expr $my_row+$incr]

    if {![info exists Widget_state(Multifile,$base,$other_row,id)] } {return}        

    set other_id $Widget_state(Multifile,$base,$other_row,id)        

    Widget:Multifile:change_row $base $my_id $other_row
    Widget:Multifile:change_row $base $other_id $my_row
}











