




CONFIG:source_file Balloon.tcl
CONFIG:source_file DragAndDrop.tcl
CONFIG:source_file ShellUtils.tcl
CONFIG:source_file WidgetUtils.tcl
CONFIG:source_file EscalanteWidgets.tcl
CONFIG:source_file GCMD.tcl
CONFIG:source_file Document.tcl


proc AddToList {e l} {
    upvar $l list
    if {[lsearch "$list" "$e"] == -1} {lappend list "$e"}
}


proc GC:set_shown {c type {s 0}} {
    global GC_state
    foreach elt [GRAPH:get_elements $GC_state($c,graph) $type] {
	GRAPH:set_attr $elt shown $s 
    }
}


proc GC:enable {c} {
    global GC_state
    if {$GC_state($c,enabled)} return
    set GC_state($c,enabled) 1
    GC:apply_to_children $c "%W config -state normal;"
}

proc GC:disable {c} {
    global GC_state
    if {!$GC_state($c,enabled)} return
    set GC_state($c,enabled) 0
    GC:apply_to_children $c "%W config -state disabled;"
}


proc GC:apply_to_children {c cmd} {
    set children [winfo  children $c]
    foreach child  $children {
	regsub -all {%W} "$cmd" "$child" ncmd
	catch "eval $ncmd"
    }
}


proc GC:init_bg {bg} {
    global GC_state
    set GC_state(bg)  $bg
    option add *graph_canvas.background        $GC_state(bg)
    option add *graph_canvas.Button.background $GC_state(bg)
    option add *graph_canvas.Menubutton.background  $GC_state(bg)
    option add *graph_canvas.Entry.background  $GC_state(bg)
}



proc GC:set_bg {c} {
    global GC_state
    set bg  [tk_chooseColor -initialcolor $GC_state(bg)]
    if [UTIL:strck $bg] {
	GC:init_bg $bg
	Application:apply_to_canvases "%C config -bg $bg;GC:apply_to_children %C \"%W config -bg $bg;\""
    }
}




proc GC:manhattan {c elts {refresh 0} {class VRelation}} {
    GRAPH:manhattan "$elts" $refresh $class
}


proc GC:manhattan_sel {c  {refresh 0} {class VRelation} } {
    GRAPH:manhattan "[GC:sel_get $c]" $refresh $class
}

proc GC:manhattan_all {c {refresh 0} {class VRelation}  } {
    global GC_state
    GRAPH:manhattan_all $GC_state($c,graph) $refresh $class
}


proc GC:snap {c {type VElement} } {
    global GC_state
    GRAPH:snap_to_grid $GC_state($c,graph) -class $type
}


proc GC:snap:toggle {s} {
    global  GC_state
    set   GC_state(snap,on) $s
    UTIL:set snap $s
}


proc GC:set_title {c f} {
    global GC_state
    wm title $GC_state($c,window)   "$f"
}

proc 	GC:signal_error {c message} {
    tk_messageBox  -message "$message"  -type ok  -default ok  -icon error
}


proc  GC:set_all_attr  {c type attr value } {
    global GC_state
    foreach elt [GRAPH:get_elements $GC_state($c,graph) $type] {
	GRAPH:set_attr $elt $attr "$value"
    }
}


proc GC:remove_canvas {c} {
    global GC_state
    set new_list [list]
    foreach oldc $GC_state(canvases) {
	if [string compare $c $oldc] {
	    lappend new_list $oldc
	}
    }
    set GC_state(canvases) $new_list
}


proc GC:close {c {tell_doc 1} } {
    global GC_state

    if {![info exists GC_state($c,doc)]} { return}
    if {$tell_doc} {
	if {![Document:remove_canvas $GC_state($c,doc) $c] } {
	    return;
	}
    }


    ##Remove this canvas from the graph's list of views
    GRAPH:remove_canvas_from_graph   $c $GC_state($c,graph)
    if [winfo exists $GC_state($c,window) ] {
	destroy $GC_state($c,window) 
    }


    GC:remove_canvas $c
}




proc GC:clear_mode {c} {
    GC:dflt_bindings $c
    global GC_state
    GC:set_palette $c
}


proc GC:dflt_bindings {c} {

    global GC_state


    GC:enable $c
    GC:ghost_hide $c  

    GC:set_mode $c "B1:Select group"  "B1/Cntl:(De)select one " "B2:Move" "B3:Tool Menu"
    set GC_state($c,sel_ok) 1

    bind $c <Motion>   {}
    bind $c <ButtonPress-1>   {}
    bind $c <ButtonRelease-1> {}
    bind $c <ButtonRelease-2> {}
    bind $c <ButtonPress-2>   "GCMD:dflt_move   $c \[$c canvasx %x\] \[$c canvasy  %y\] "

    $c config -cursor left_ptr
}


proc GC:cmd_exec {doc c cmd } {
    global  GC_state Document_state
    GC:dflt_bindings $c 
    if {$GC_state(cmds,$cmd,-moded)} {
	GC:set_palette $c ""
	if [UTIL:strck $GC_state(cmds,$cmd,-cursor)] {
	    $c config -cursor $GC_state(cmds,$cmd,-cursor)
	} 
	if [info exists GC_state(cmds,$cmd,-BP2)] {
	    set proc ""
	    regsub -all "%C" "$GC_state(cmds,$cmd,-BP2)" $c proc
	    regsub -all "%D" "$proc" $doc proc
	    eval bind  $c <ButtonPress-2>   \"$proc\"
	}

	if [info exists GC_state(cmds,$cmd,-BP1)] {
	    set proc ""
	    regsub -all "%C" "$GC_state(cmds,$cmd,-BP1)" $c proc
	    regsub -all "%D" "$proc" $doc proc
	    eval bind  $c <ButtonPress-1>   \"$proc\"
	}


	GC:set_mode $c  "$GC_state(cmds,$cmd,-label)" "$GC_state(cmds,$cmd,-M1)" "$GC_state(cmds,$cmd,-M2)" "$GC_state(cmds,$cmd,-M3)"
    }
    set proc ""
    regsub -all "%C" "$GC_state(cmds,$cmd,-command)" $c proc
    regsub -all "%D" "$proc" $doc proc
    eval "$proc"
}





proc   GC:cmd_add {doc c menu cmd} {
    global  GC_state
    if {![info exists GC_state(cmds,$cmd,-label)]} {
	puts "Error: Command $cmd does not exist";
	return
    }
    Menu:command $menu "$GC_state(cmds,$cmd,-label)" "GC:cmd_exec $doc $c $cmd"  $GC_state(cmds,$cmd,-underline)
    if {$GC_state(cmds,$cmd,-keybind) != ""} {
	global GC_state
	bind     $GC_state($c,window) <$GC_state(cmds,$cmd,-keymod)><$GC_state(cmds,$cmd,-keybind)> "GC:cmd_exec $doc $c $cmd"
    }

}



proc   GC:tb_cmd_add {doc c tb icon cmd} {
    global  GC_state
    pack [button $tb.$cmd -bitmap [WidgetGfx:get_bitmap_file $icon] \
	    -command  "GC:cmd_exec $doc $c $cmd" ] -side right
}



proc GC:cmd_define {name in_args} {
    global  GC_state
    if {![info exists GC_state(cmds,$name,-M1)]} {
	set GC_state(cmds,$name,-M1)     0
	set GC_state(cmds,$name,-M2)     0
	set GC_state(cmds,$name,-M3)     0
	set GC_state(cmds,$name,-cursor)     {}
	set GC_state(cmds,$name,-label)      {}
	set GC_state(cmds,$name,-command)    {}
	set GC_state(cmds,$name,-keymod)     Alt_L
	set GC_state(cmds,$name,-keybind)    {}
	set GC_state(cmds,$name,-underline)  -1
	set GC_state(cmds,$name,-moded)      1
    }
    array  set args "$in_args"
    foreach arg [array names args] {
	set GC_state(cmds,$name,$arg) "$args($arg)"
    }
}





proc GC:set_mode {c   {m1 0}  {m2 0} {m3 0} {m4 0}  } {
    global GC_state
    set GC_state($c,sel_ok) 0
    if {[string compare $m1 0]} {set GC_state($c,m1) $m1    }
    if {[string compare $m2 0]} {set GC_state($c,m2) $m2    }
    if {[string compare $m3 0]} {set GC_state($c,m3) $m3    }
    if {[string compare $m4 0]} {set GC_state($c,m4) $m4    }
}


proc GC:set_palette {c {titem ""}} {
    global GC_state
    set GC_state($c,palette_value) "$titem"
    if {!$GC_state(pbcmd)} {
	PB:clear $c
    }
}



##These hook procs allow derived canvas' to plug in their funcs

proc HOOK:rmenu {menu c elt x y} {}
proc HOOK:rmenu_find {g x y} {return [GRAPH:find $g  $x $y ]}
proc HOOK:elt_deleted {elt} {}
proc HOOK:write_state {f} {}
proc HOOK:created_rel {rel tl hd } {return 1 }
proc HOOK:created_elt {elt c} {return 1 }
proc HOOK:create_menubar1 {base top mb c doc} { }
proc HOOK:create_menubar2 {base top mb c doc} { }
proc HOOK:create_palette { c p plist} { }
proc HOOK:create_bottom {c doc base} {}
proc HOOK:init_canvas {c doc} {}


proc RECT_origin_y {r} {    return [lindex $r 1] }
proc RECT_origin_x {r} {    return [lindex $r 0] }
proc RECT_get {r pt}   {    
    global RECT_state
    return [lindex $r $RECT_state(idx,$pt)]
}




proc GC:eval:exec {c} {
    global GC_state
    regsub -all "%C" [$GC_state($c,eval,tv) get 1.0 end] $c  tmp
    if [catch "eval \{$tmp\}" ret] {
	tk_messageBox   -message "An error occurred: $ret"   -type ok  -default ok     -icon warning
    }
}


##The GC:eval procs allow one to popup  a text dialog
##that allows for the evaluation of arbitrary tcl code

proc GC:eval:load {c {flush 0}} {
    global GC_state
    set tv $GC_state($c,eval,tv) 
    set name [tk_getOpenFile -title "Load eval file"]
    if {[UTIL:strck $name] == 0} {return 0}
    set f [open  $name r]
    if $flush {$tv delete 1.0 end}
    $tv insert end "[read $f]"
    close $f
}


proc GC:eval:insert {c str} {
    global GC_state
    set tv $GC_state($c,eval,tv) 
    $tv insert end "$str"
}


proc GC:eval:create {c} {
    global GC_state
    if {![info exists GC_state($c,eval,window)]} {
	set GC_state($c,eval,window) ""
	set GC_state($c,eval,str) ""
    }
    if [winfo exists $GC_state($c,eval,window) ] {
	wm deiconify  $GC_state($c,eval,window)
	raise $GC_state($c,eval,window)	
	return
    }
    set tl [toplevel $c.eval_window]
    set top_f [frame $tl.top_f -bd 1 -relief raised]
    pack $top_f -expand 1 -fill both    
    set bottom_f [frame $tl.bottom_f]
    pack $bottom_f -expand 1 -fill both

    set tv [text $top_f.tv]
    set GC_state($c,eval,tv) $tv
    $tv insert end "global GC_state  Document_state;\nset graph \$GC_state(%C,graph);\n#to iterate thru the graph:\n#foreach elt \[GRAPH:get_elements \$graph] {\n#\n#}\n\n"

    set exec  [button $bottom_f.exec -text Execute -command "GC:eval:exec $c"]
    set load  [button $bottom_f.load -text Load    -command "GC:eval:load $c 1"]
    set merge [button $bottom_f.merge -text Merge    -command "GC:eval:load $c 0"]
    set close [button $bottom_f.close -text Close    -command "destroy $tl"]

    pack $tv -side top -fill both -expand 1

    pack $exec $load $merge $close -side left -fill x -expand 1

}






##The GC:grid procs allow one to draw a stippled grid on the canvas
##They use GC_state(<canvas>,grid,[x,y,show]) to determine 
##the layout of the grid

proc GC:grid:destroy {c} {
    $c delete grid_lines
    global GC_state
    set GC_state($c,grid,show) 0
}


proc GC:grid:set {c {v 1}} {
    global GC_state
    set GC_state($c,grid,show) $v
    GC:grid:create $c
}

proc GC:grid:create {c} {
    global GC_state
    $c delete grid_line
    if {!$GC_state($c,grid,show)} {return}
    set xspace $GC_state($c,grid,x)
    set yspace $GC_state($c,grid,y)
    

    set hline  [WidgetGfx:get_bitmap_file hline.xbm]
    set vline  [WidgetGfx:get_bitmap_file vline.xbm]

    for {set x 0} {$x < 5000} {incr x $xspace} {
	$c create line $x 0 $x 5000 -fill grey  -tag grid_line -stipple $vline
    }

    for {set y 0} {$y < 5000} {incr y $yspace} {
	$c create line  0 $y   5000 $y -fill grey -tag grid_line -stipple $hline
    }


}





proc GC:create_menu_bar {base c doc} {
    global GC_state Document_state Balloon_state

##DO we even create a menu bar
    if {!$GC_state(menu,show)} {return}


    set cmd_bar [frame $base.cmd_bar -relief raised  -bd 1 ]




    Menu:setup $cmd_bar.menubar
    Menu:create ${c}_File File 0
    Menu:create ${c}_Edit Edit
    Menu:create ${c}_View View


    HOOK:create_menubar1 $base $cmd_bar $cmd_bar.menubar $c $doc


    GC:cmd_add  $doc $c  ${c}_View   new_view


    GC:cmd_add   $doc $c  ${c}_View  clear_mode

    Menu:separator ${c}_View

    Menu:command  ${c}_View    "Set canvas color..."   "GC:set_bg $c"
    Menu:check   ${c}_View   "Ballon help active"    Balloon_state(active)
    Menu:check   ${c}_View   "Modeless interaction"  GC_state(modeless)     {}
    Menu:check   ${c}_View   "Show outline on add"   GC_state(ghost,ok)     {}
    Menu:check   ${c}_View   "Snap on"               GC_state(snap,on)      {UTIL:set snap $GC_state(snap,on)}
    Menu:check   ${c}_View   "Show Grid"             GC_state($c,grid,show) "GC:grid:create $c"
    Menu:check   ${c}_View   "Select contained"      GC_state(sel_type)     {} contained intersect


    if {$GC_state(menu,show,io)} {
	GC:cmd_add $doc $c ${c}_File new 
	GC:cmd_add $doc $c ${c}_File open
	GC:cmd_add $doc $c ${c}_File save
	GC:cmd_add $doc $c ${c}_File save_as
	GC:cmd_add $doc $c ${c}_File save_init
	Menu:separator ${c}_File
    } else {
	GC:cmd_add $doc $c ${c}_File save_init
	Menu:separator ${c}_File
    }

    GC:cmd_add $doc $c ${c}_File close 

    Menu:separator ${c}_File
    GC:cmd_add $doc $c ${c}_File exit





    GC:cmd_add  $doc $c  ${c}_Edit undo
    Menu:disable ${c}_Edit Undo
    Menu:separator ${c}_Edit

    GC:cmd_add  $doc $c ${c}_Edit cut
    GC:cmd_add  $doc $c ${c}_Edit copy
    GC:cmd_add  $doc $c ${c}_Edit paste
    GC:cmd_add  $doc $c ${c}_Edit select_all
    Menu:command  ${c}_Edit "Clear Selection"   "GC:sel_empty $c"

    Menu:disable ${c}_Edit Paste
    Menu:disable ${c}_Edit Copy
    Menu:disable ${c}_Edit Cut
##    Menu:disable ${c}_Edit "Clear Selection"


    Menu:separator ${c}_Edit



    GC:cmd_add  $doc $c ${c}_Edit delete_node
    GC:cmd_add  $doc $c ${c}_Edit delete_edge

    Menu:separator ${c}_Edit

    Menu:cascade ${c}_Edit  ${c}_Move Move
    Menu:cascade ${c}_Edit ${c}_Joints Joints


    GC:cmd_add  $doc $c ${c}_Move move_elt
    GC:cmd_add  $doc $c ${c}_Move snap
    GC:cmd_add  $doc $c ${c}_Move reshape_node
    GC:cmd_add  $doc $c ${c}_Move shrink_node
    Menu:command  ${c}_Move "Align top"      "GC:align $c NY"    
    Menu:command  ${c}_Move "Align bottom"   "GC:align $c SY"
    Menu:command  ${c}_Move "Align left"     "GC:align $c WX"
    Menu:command  ${c}_Move "Align right"    "GC:align $c EX"    




    GC:cmd_add  $doc $c ${c}_Joints joint_add
    GC:cmd_add  $doc $c ${c}_Joints joint_move
    GC:cmd_add  $doc $c ${c}_Joints joint_remove



    HOOK:create_menubar2 $base $cmd_bar $cmd_bar.menubar $c $doc


    return $cmd_bar

}




proc GC:changed {c} {
    global  GC_state
    Document:changed $GC_state($c,doc)
}






proc PB:enter {f} {
    bind $f <Leave>  "PB:leave $f [lindex [$f config -bg ] 3 ]"
    $f   config -bg #ececec
    $f.l config -bg #ececec 
    $f.i config -bg #ececec 
}

proc PB:leave {f c} {
    $f config -bg   $c
    $f.l config -bg $c
    $f.i config -bg $c
}



proc PB:create {c frame lbl cmd {im "empty.xbm" } {pack 1} } {
    global GC_state    PB_state

    set f [frame $frame  -bd 2 -relief raised ]
    set PB_state($c,state) ""
    if {![info exists PB_state($c,list)] } {
	set PB_state($c,list) [list]
    }
    lappend PB_state($c,list) $f
    set PB_state($frame,cmd) "$cmd"

    if {$pack}  {  pack $f -side top -fill x -expand 1 -padx 2 -pady 2 -anchor w }

    if { [catch "label $f.i -bitmap [WidgetGfx:get_bitmap_file $im] -anchor w"]} {
	label $f.i -bitmap [WidgetGfx:get_bitmap_file empty.xbm] -anchor w
    }


    pack  $f.i -side left  -anchor w  -padx 2 -pady 2
    label $f.l -text "$lbl" -anchor w
    pack  $f.l -side left  -anchor w  -padx 2 -pady 2

    bind $f     <Enter>          "PB:enter $f"


    bind $f       <ButtonPress-2><Motion>    "PB:press $c;DragAndDrop:create -src $f -type command -data \{$cmd\}"
    bind $f.l     <ButtonPress-2><Motion>    "PB:press $c;DragAndDrop:create -src $f -type command -data \{$cmd\}"    
    bind $f.i     <ButtonPress-2><Motion>    "PB:press $c;DragAndDrop:create -src $f -type command -data \{$cmd\}"


    bind $f   <ButtonPress-1>  "PB:press \"$c\" $f"
    bind $f.l <ButtonPress-1>  "PB:press \"$c\" $f"
    bind $f.i <ButtonPress-1>  "PB:press \"$c\" $f"

    bind $f     <Double-1>       "PB:double \"$c\" $f"    
    bind $f.l   <Double-1>       "PB:double \"$c\" $f"
    bind $f.i   <Double-1>       "PB:double \"$c\" $f"


    return $f
}


proc PB:clear {base} {PB:press $base ""}
proc PB:set   {f}    {$f config  -relief sunken }
proc PB:unset {f}    {$f config  -relief raised -bg #d9d9d9}

proc PB:press {base {which ""}} {
    global PB_state GC_state
    if {![info exists PB_state($base,list)] } {return}
    set cmd "#"
    foreach f $PB_state($base,list) {
	if {[string compare $f $which]} {
	    PB:unset $f
	} else {
	    PB:set $f
	    set cmd $PB_state($f,cmd)
	}
    }
    set GC_state(pbcmd) 1
    eval $cmd
    set GC_state(pbcmd) 0
}


proc PB:double {base which} {
    global PB_state Application_state
    set Application_state(button,double) 1
    eval $PB_state($which,cmd)
    set Application_state(button,double) 0
}



proc GC:ghost_get {c type} {
    return "rect -50 -50 0 0 -outline grey"
}

proc GC:ghost_create {c} {
    global GC_state
    if {! $GC_state($c,ghost,deleted)} {return}
    eval $c create [GC:ghost_get $c $GC_state($c,ghost,type)]  -tag ghost 
    $c move  ghost -1000 -1000
    set GC_state($c,ghost,deleted) 0
}


proc GC:ghost_show {c type} {
    global GC_state
    if $GC_state($c,ghost,show)  return
    set GC_state($c,ghost,show) 1
    set GC_state($c,ghost,type) $type

    GC:ghost_create $c

    set bbox [$c bbox ghost]
    set GC_state($c,ghost,x) [lindex $bbox 0]
    set GC_state($c,ghost,y) [lindex $bbox 1]

}




proc GC:ghost_delete  {c } {
    global GC_state
    if {!$GC_state($c,ghost,deleted)} {$c delete ghost}
    set GC_state($c,ghost,deleted) 1
}

proc GC:ghost_hide  {c } {
    global GC_state
    set GC_state($c,ghost,show) 0
    GC:ghost_delete $c
}


proc GC:ghost_move {c x y}     {
    global GC_state
    if {!$GC_state($c,ghost,show)} {return}
    if {!$GC_state(ghost,ok)} {
	set GC_state($c,ghost,deleted) 1
	$c delete ghost 
	return
    }

    if $GC_state($c,ghost,deleted) {
	GC:ghost_create $c
    }

    set r [where_to_put $GC_state($c,ghost,type)   $x $y ]

    set x [lindex $r 0]
    set y [lindex $r 1]

    set dx  [expr $x - $GC_state($c,ghost,x)]
    set dy  [expr $y - $GC_state($c,ghost,y)]

    $c move  ghost $dx $dy 
    set bbox [$c bbox ghost]
    set GC_state($c,ghost,x) [lindex $bbox 0]
    set GC_state($c,ghost,y) [lindex $bbox 1]

}




proc GC:undo {c} {
    global GC_state    
    eval $GC_state($c,undo,cmd)
    set GC_state($c,undo,cmd) ""
    Menu:disable ${c}_Edit Undo
}

proc GC:undo_clear {c} {
    global GC_state    
    set GC_state($c,undo,cmd) ""
    Menu:disable ${c}_Edit Undo
}

proc GC:undo_add {c cmd {name ""} } {
    global GC_state
    set GC_state($c,undo,cmd) "$cmd"
    set GC_state($c,undo,name) "$name"
    Menu:enable ${c}_Edit Undo
}



proc GC:sel_get {c} {
    global GC_state
    set g $GC_state($c,graph)
    set coll selection_$g
    global $coll
    if {![info exists $coll]} {return [list]}
    return [array names $coll] 
}

proc GC:sel_empty {c  {delete 0}   } {
    global GC_state
    set g $GC_state($c,graph)
    set coll selection_$g
    global $coll
    if {![info exists $coll]} {array set $coll ""}
    set buff ""

    Menu:disable ${c}_Edit Copy
    Menu:disable ${c}_Edit Cut
    Menu:disable ${c}_Edit "Clear Selection"


    if {$delete} {
	set buff "[GRAPH:delete [array names $coll] ]"
    }  else {
	foreach n [GRAPH:get_elements $g] {
	    GRAPH:set_attr $n sel 0
	}
    }
    catch "unset $coll"
    return $buff
}



proc GC:sel_cut {c } {
    global GC_state
    set GC_state(clipboard) [GC:sel_empty $c  1]
}

proc GC:sel_copy {c } {
    global GC_state
    set GC_state(clipboard) [GRAPH:clone [GC:sel_get $c]]
}



proc GC:sel_paste {c x y} {
    global GC_state  
    GC:add_and_offset $c $x $y "$GC_state(clipboard)"
##  GC:dflt_bindings $c;
    GC:continue $c
}


proc GC:align {c {lp N} } {
    set sel [GC:sel_get $c]
    set x 10000
    set y 10000
    foreach e $sel {
	set r  [GRAPH:get_rect $e]
	set pt [GRAPH:get_point $e $lp]
	set tx [lindex $pt 0]
	set ty [lindex $pt 1]
	if {$ty < $y} {set y $ty}
	if {$tx < $x} {set x $tx}
    }

    GRAPH:move_point_to "$sel" $lp $x $y


}






proc GC:add_and_offset {c x y data} {
    global GC_state  
    GRAPH:start cloning
    set all [GC:clone $c "$data"]
    GRAPH:stop cloning
    set oldBBox [GRAPH:bbox "$all"]

    set dx [expr [$c canvasx $x]  - [lindex $oldBBox 0] ]
    set dy [expr [$c canvasy $y]  - [lindex $oldBBox 1] ]


    UTIL:set lc 0
    GRAPH:move_by  "$all"   $dx $dy
    UTIL:set lc 1
}




proc GC:clone {c s} {
    global GC_state newnodes nodes edges
    array set nodes ""    
    array set newedges ""
    array set newnodes ""
    foreach elt [GRAPH:get_elements $GC_state($c,graph) VEntity] {
	set nodes($elt) $elt
    }

    GRAPH:set_current $GC_state($c,graph)
    eval $s
    GRAPH:set_current 0

    set all [list]
    foreach elt [array names newnodes] {
	GRAPH:set_attr $newnodes($elt) sel 0
	lappend all $newnodes($elt)
    }


    foreach elt [array names newedges] {
	GRAPH:set_attr $newedges($elt) sel 0
	lappend all $newedges($elt)
    }

    return $all
}



proc GC:select {c x y {ex -100} {ey -100} } {

    global GC_state
    set g $GC_state($c,graph)
    set toggle 1

    if {$ex != -100 && $ey != -100} {
	if {abs ($ex-$x) < 4} {return}
	if {abs ($ey-$y) < 4} {return}
	set elts [GRAPH:contained $g  $x $y $ex $ey -$GC_state(sel_type) -notclass $GC_state(select,nottype) -class $GC_state(select,type) ]
	set toggle 0
    } else {
	set elts [GRAPH:find $g  $x $y ]
    }


    if {![UTIL:strck $elts]} {return}

    Menu:enable ${c}_Edit Copy
    Menu:enable ${c}_Edit Cut
    Menu:enable ${c}_Edit  "Clear Selection"

    GC:sel_add $c "$elts" $toggle

}    

proc GC:sel_add {c elts {toggle 0}  } {
    global  GC_state
    set g $GC_state($c,graph)

    set coll selection_$g
    global $coll 


    if {![info exists $coll]} {	
	array set $coll ""    
	lappend GC_state(colls) $coll 
    }

    foreach elt $elts {
	set sel [GRAPH:get_attr $elt sel 0]
	if {$sel} {
	    if {$toggle} {
		GRAPH:set_attr $elt sel 0
		catch "unset ${coll}($elt)"
	    }
	} else {
	    GRAPH:set_attr $elt sel 1
	    set ${coll}($elt) $elt
	}
    }

} 


proc GC:sel_remove {c elts } {
    global  GC_state
    set g $GC_state($c,graph)
    set coll selection_$g
    global $coll 

##    if {![info exists $coll]} {return}

    foreach elt $elts {
	GRAPH:set_attr $elt sel 0
	catch "unset ${coll}($elt)"
    }
} 




proc GC:sel_start {c x y} {
    global GC_state  Application_state
    if {$Application_state(key,control)} {
	GC:select $c $x $y
	return
    }


    if {!$GC_state($c,sel_ok)} {return}

    set GC_state($c,sel_drawn) 1
    set GC_state($c,sel_x) $x
    set GC_state($c,sel_y) $y
    $c coords sel_rect $GC_state($c,sel_x)  $GC_state($c,sel_y) $x $y
}

proc GC:sel_clear {c} {
    global GC_state
    if {$GC_state($c,sel_drawn)} {
	set GC_state($c,sel_drawn) 0
	$c coords sel_rect -10 -10 -9 -9
    }
}




proc GC:constrain_drag {c w X Y} { }

proc GC:press {c x y X Y} {
    global   Application_state
    if $Application_state(key,alt) {
	DragAndDrop:create -src $c  -x $X -y $Y -type graph  -data "[GC:sel_get $c]" -funcargs graph.xbm 
    } else {
	GC:sel_start $c $x $y
    }
}


proc GC:rcv_drag_and_drop  {c} {
    global DragAndDrop_state
    set cx [expr  $DragAndDrop_state(rcv,x) - [winfo rootx $c]]
    set cy [expr  $DragAndDrop_state(rcv,y) - [winfo rooty $c]]
    if {[string compare $DragAndDrop_state(type) graph] == 0} {
	GC:add_and_offset $c $cx $cy  "[GRAPH:clone $DragAndDrop_state(data)]"
    } elseif  {[string compare $DragAndDrop_state(type) node] == 0} {
	set elt [GRAPH:create  $DragAndDrop_state(data) ]
	GRAPH:move $elt $cx $cy
    } elseif  {[string compare $DragAndDrop_state(type) command] == 0} {
	eval  $DragAndDrop_state(data) 
    }
}




proc GC:pressr {c x y X Y} {
    global GC_state 
    if {$GC_state(simple)} {return}

    set g $GC_state($c,graph)
    set menu $c.menu
    if {[winfo exists $menu]} {destroy $menu}
    menu $menu -tearoff 0


    if [UTIL:strck $GC_state($c,undo,cmd)] {
	$menu add command -label "Undo $GC_state($c,undo,name)"   -command "$GC_state($c,undo,cmd);GC:undo_clear $c"
	$menu add separator
    }

    set elt [HOOK:rmenu_find $g $x $y]


    if {[string compare $elt 0]} {
	GRAPH:set_attr $elt hilite  1 
	if [GRAPH:get_attr $elt sel 0] {
	    $menu add command -label Unselect  -command "GC:sel_remove  $c $elt"
	} else {
	    $menu add command -label Select  -command "GC:sel_add  $c $elt"
	}
	$menu add command -label Delete  -command "GCMD:delete $c $elt"
	HOOK:rmenu $menu $c $elt $x $y
	bind $menu <Unmap>  "GRAPH:set_attr $elt hilite  0; "
    } else {
	$menu add command -label "Clear selection"   -command "GC:sel_empty $c"
	$menu add separator	
	if {$GC_state(snap,on)}     {
	    $menu add command -label "Snap off"   -command "GC:snap:toggle 0"
	} else {
	    $menu add command -label "Snap on"   -command "GC:snap:toggle 1"
	}

	if $GC_state($c,grid,show)     {
	    $menu add command -label "Hide grid"   -command "GC:grid:set  $c 0"
	} else {
	    $menu add command -label "Show grid"   -command "GC:grid:set  $c 1"
	}

	if $GC_state(modeless)     {
	    $menu add command -label "Modeless off"   -command "set GC_state(modeless) 0"
	} else {
	    $menu add command -label "Modeless on"   -command "set GC_state(modeless) 1"
	}



    }

    if {! [ UTIL:strck $menu] } {return}

    tk_popup    $menu  [expr $X +2] [expr $Y +2]

}



proc GC:motion {c x y X Y} {
    global GC_state
    set  GC_state(current_canvas) $c
    GC:ghost_move  $c $x $y
    if {$GC_state($c,sel_drawn)} {
	$c coords sel_rect $GC_state($c,sel_x)  $GC_state($c,sel_y)  $x $y
    }
    if $GC_state($c,follow) {
	set dx 0
	set dy 0
	set h  [winfo height $c] 
	set w  [winfo width  $c] 
	if {$X < 0} {set dx  -1} elseif {$X >  $w} {set dx 1}
	if {$Y < 0} {set dy  -1} elseif {$Y >  $h} {set dy 1}
	if {$dx != 0} {
	    $c  xview scroll $dx units	
	}
	if {$dy != 0} {
	    $c  yview scroll $dy units	
	}
    }


}


proc GC:leave {c x  y} {
    global GC_state
    set  GC_state(current_canvas) ""
    GC:ghost_delete $c  
}





proc create args {
    global GC_state
    return [eval GRAPH:create $args  $GC_state(fixed_args)]
}

proc GC:elt_deleted {elt} {
    global GC_state
    foreach coll $GC_state(colls) {
	global $coll
	if {[info exists ${coll}($elt)]} {
	    unset ${coll}($elt)
	}
    }
    HOOK:elt_deleted $elt
}



proc GC:release {c x y} {
    global GC_state
    if {!$GC_state($c,sel_ok)} {return}

    if {$GC_state($c,sel_drawn) && $GC_state($c,sel_x) != $x && $GC_state($c,sel_y) != $y} {
	GC:select  $c $GC_state($c,sel_x) $GC_state($c,sel_y) $x $y
    } 
    GC:sel_clear $c
}





proc    GC:set_graph {c g} {
    GC:add_canvas_to_graph $c $g
}

proc GC:add_canvas_to_graph {c g} {
    global GC_state
    GRAPH:remove_canvas_from_graph $c $GC_state($c,graph)
    set GC_state($c,graph) $g
    GRAPH:add_canvas_to_graph      $c $g
}


proc GC:valid_canvas {c} {
    global GC_state
    if {[info exists GC_state($c,window)]} {
	if {[winfo exists $GC_state($c,window)]} {
	    return 1
	}
    }
    return 0
}


proc GC:get_canvases {} {
    global GC_state
    set old $GC_state(canvases) 
    set GC_state(canvases)  [list]
    foreach c $old {
	if {[GC:valid_canvas $c]} {
	    lappend GC_state(canvases) $c
	}
    }
    return $GC_state(canvases)
}



proc GC:new_view {c} {
    global GC_state  
    set base   [toplevel .gc$GC_state(id)  ] 
    set newc   [GC:create  $GC_state($c,doc)   $base 1 ]
    GC:set_graph $newc $GC_state($c,graph)
}



proc GC:drop {c} {
    
}


proc GC:create { doc  {base ""}  {create_menubar 1} {palette_items ""}  } {

	bind $base    <KeyPress>    {Application:key_press %K}    
	bind $base    <KeyRelease>  {Application:key_release}    
	bind $base    <Leave>       {Application:key_release}    
	bind $base    <Down>        {catch "$GC_state(current_canvas) yview scroll 2 units"}
	bind $base    <Up>          {catch "$GC_state(current_canvas) yview scroll -2 units"}

	bind $base    <Right>       {catch "$GC_state(current_canvas) xview scroll 2 units"}
	bind $base    <Left>        {catch "$GC_state(current_canvas) xview scroll -2 units"}

	bind $base    <Control-f>   {catch "$GC_state(current_canvas) xview scroll  2 units"}
	bind $base    <Control-b>   {catch "$GC_state(current_canvas) xview scroll -2 units"}
	bind $base    <Control-n>   {catch "$GC_state(current_canvas) yview scroll  2 units"}
	bind $base    <Control-p>   {catch "$GC_state(current_canvas) yview scroll -2 units"}

	bind $base    <Control-q>   {GC:close $GC_state(current_canvas)}


	global  GC_state  Document_state  Balloon_state  
	set msgvar [Balloon:define_msg_var $base]


	
	set full [frame $base.full]
	pack $full -side top -expand 1 -fill both
	if {0} {
	    set tabs [frame $full.tabs]
	    pack $tabs -side top -expand 1 -fill both
	    foreach b {hello there how are you} {
		pack [button $tabs.$b -text "$b"] -side left
	    }
	}
	incr GC_state(id)
    
	if {[UTIL:strck $palette_items] == 0} {
	    set palette_items  $GC_state(fixed_palette)
	}



	set middle_col 0
	set middle [frame $full.middle  ]
	grid rowconfigure $middle  0  -weight 1 


	set cfr    [frame $middle.cfr -bd 1 -relief raised ]
	if $GC_state(scrollbar_ok) {
	set c      [Widget:Canvas:create  $cfr graph_canvas $GC_state(dflt_width)    $GC_state(dflt_height)   $GC_state(dflt_region) ]
    } else {
	set c [canvas $cfr.graph_canvas  \
		-width  $GC_state(dflt_width)  \
		-height $GC_state(dflt_height)  \
		-scrollregion $GC_state(dflt_region) ]
	pack $c -expand 1 -fill both
    }

    DragAndDrop:register_rcv $c "GC:rcv_drag_and_drop $c" {graph node command}





    set GC_state($c,grid,x) 50
    set GC_state($c,grid,y) 50
    set GC_state($c,grid,show) 0
    set GC_state($c,follow)  1 
    set GC_state($c,sel_drawn)  0 
    set GC_state($c,sel_ok)     0 
    set GC_state($c,sel_x)      0 
    set GC_state($c,sel_y)      0 
    set GC_state($c,lastx)      100 
    set GC_state($c,lasty)      100 
    set GC_state($c,node1)      ""
    set GC_state($c,node2)      "" 


##Create a dummy label so we can figure out how wide text is
    label $c.dummy
    $c create window 100 100 -window $c.dummy -tag dummy
    $c coords dummy -1000 -1000  

    $c config -bg $GC_state(bg)

    lappend    GC_state(canvases)   $c 




    bindtags $c [list GraphCanvas Canvas $c all]
    bind GraphCanvas <Enter>            {set  GC_state(current_canvas) %W}
    bind GraphCanvas <Leave>     	{GC:leave  %W %X %Y }
    bind GraphCanvas <ButtonPress-1>    {GC:press %W [%W canvasx %x] [%W canvasy  %y] %X %Y }
    bind GraphCanvas <Motion>    	{GC:motion  %W [%W canvasx %x] [%W canvasy  %y] %x %y}
    bind GraphCanvas <ButtonRelease-1>  {GC:release %W [%W canvasx %x] [%W canvasy  %y]}
    bind GraphCanvas <ButtonPress-3>    {GC:pressr %W  [%W canvasx %x] [%W canvasy  %y] %X  %Y}




    $c create rect -10 -10 -9 -9  -tag {sel_rect} 

    set GC_state($c,ghost,deleted) 0
    GC:ghost_hide $c

    set GC_state($c,window) $base
    set bottom [frame  $full.bottom]

    if {[UTIL:strck $base ] == 0} "set GC_state($c,window) . "

    set GC_state($c,doc) $doc
    set GC_state($c,graph) 0
    set GC_state($c,current_proto) ""
    set GC_state($c,query) ""    
    set GC_state($c,done_quit) 1    
    set GC_state($c,palette_value) {}
    set GC_state($c,palette_items)  "$palette_items" 
    set GC_state($c,enabled)  1
    set GC_state($c,undo,name) {}
    set GC_state($c,undo,cmd) {}
    set GC_state($c,palette_window) ""


    GC:set_graph               $c $Document_state($doc,data)
    HOOK:init_canvas $c $doc
    Document:add_canvas $doc $c




    if {$GC_state(palette_ok)} {
	set palette_root [toplevel $base.palette]
	set GC_state($c,palette_window)  $palette_root
	bind $palette_root   <Double-1>         {Application:double 1}    
	bind $palette_root   <ButtonRelease>    {Application:double 0}    
	wm title $palette_root "Tool  Palette"
	grid columnconfigure $palette_root 0 -weight 1 
	grid rowconfigure    $palette_root 0 -weight 1 

	set p_frame    [frame $palette_root.p_frame ]
	grid $p_frame  -sticky news

	set p_row 0
	set p_col 0
	set useMenu  0
	set menu ""
	set mb ""
	set menuCnt 0

	foreach item $palette_items {
	    set type [lindex $item 0] 
	    set i2 ""; set i3 "" ; set i4 "";
	    if {[llength $item ] >1} {set i2   [lindex $item 1]}
	    if {[llength $item ] >2} {set i3   [lindex $item 2]}
	    if {[llength $item ] >3} {set i4   [lindex $item 3]}
	    
	    set p_widget ""

	    switch $type {


		new_menu {
		    set p_widget [eval menubutton  $p_frame.menu$menuCnt  \
			    -menu  $p_frame.menu$menuCnt.menu   -bd 2 -relief raised]
		    set mb $p_widget
		    set menu  [menu $p_widget.menu -font fixed -tearoff 0 -bd 1 ]
		    set useMenu 1
		    incr menuCnt
		}

		clear {
		    set useMenu  0
		}

		new_column {
		    set useMenu  0
		    incr p_col
		    set p_row 0
		}

		new_palette {
		    set useMenu  0
		    incr p_col
		    set p_row 0
		}
 
		label {
		    if {$useMenu} {
			$mb config -text    "$i2"  
		    } else {
			set p_widget [label $p_frame.lbl${p_row}_${p_col} -text "$i2"  -anchor w]
		    }
		}

		seperator {
		    if {$useMenu} {
			$menu add separator
		    } else {
			set p_widget [button $p_frame.add${p_row}_${p_col} -highlightthickness 0  -bitmap [WidgetGfx:get_bitmap_file null.im ] -state disabled -bd 0]
		    }
		}

		command {
		    regsub -all "%C" "$i3" $c  i3
		    regsub -all "%D" "$i3" $doc  i3
		    if {$useMenu} {
			$menu add command -label   "$i2"  -command "$i3"
		    } else {
			set p_widget [PB:create $c  $p_frame.add${p_row}_${p_col}  "$i2"  "$i3" "$i4"]
			##Balloon:help $p_widget  "Enter create $i2 mode"
		    }
		}
		
	    }
	    
	    if {[UTIL:strck $p_widget]} {
		grid  $p_widget  -column $p_col -row $p_row -sticky ew -padx 2
		incr p_row
	    }
	}

	for {set row 0} {$row < $p_row} {incr row} {
	    grid rowconfigure $p_frame $row -weight 1 
	}

	for {set col 0} {$col < $p_col} {incr col} {
	    grid columnconfigure $p_frame $col -weight 1 
	}

    }


grid columnconfigure $middle  $middle_col -weight 1 
grid  $cfr  -row 0 -column $middle_col -sticky news
set row 0



if {$GC_state(menubar_ok)} {
    set mb [GC:create_menu_bar $full $c $doc]
    grid $mb -row  $row -column 0 -sticky ew
    incr row
}




##Create bottom message bar 
if {!$GC_state(simple)} {
    set msgbar  [frame $full.message_bar   -bd 1 -relief raised]
    grid $msgbar -row  $row -column 0 -sticky ew
    incr row


    for {set i 1} {$i <= 4} {incr i} {
	set GC_state($c,m$i) ""
	pack   [label $msgbar.msg$i -textvariable GC_state($c,m$i)  -anchor w  -width 30]  -side left
    }
}



set msgfr [frame $bottom.msgfr]


set msg   [label $msgfr.msgvar -textvariable $msgvar   -bd 1 -relief sunken  -width 40 -anchor w]
set copyright  [Shell:Copyright:create $msgfr ] 
pack $msgfr -side bottom -fill x -expand 1 -padx 1 -pady 1 -ipadx 1 -ipady 1
pack $msg        -side left 
pack $copyright  -side right -fill x -expand 1

HOOK:create_bottom $c $doc $bottom


GC:dflt_bindings $c

grid rowconfigure    $full $row -weight 2
grid columnconfigure $full 0 -weight 1

grid $middle -row  $row -column 0 -sticky news
incr row

grid $bottom -row  $row -column 0 -sticky ew
incr row


pack $full -side top -expand 1 -fill both





return $c
}



proc GC:write_graph {doc filename} {
    global Document_state
    GRAPH:write_graph $Document_state($doc,data) $filename
}


proc GC:continue {c  } {
    global GC_state
    if {$GC_state(modeless)} {
	GC:dflt_bindings $c
	GC:set_palette $c
	return 0
    }
    return 1
}

proc GC:clipboard_change {source name op} {
    global GC_state
    set st 1
    if {![UTIL:strck $GC_state(clipboard)] } {set st 0}
    foreach c $GC_state(canvases) {
	if [winfo exists $c] {
	    if {$st} {Menu:enable ${c}_Edit Paste} else {Menu:disable ${c}_Edit Paste} 
	}
    }
}





proc   GC:write_init {f} {
    GC:write_state $f
    global Application_state

    puts $f "\n##Where we look for external tools:"
    puts $f  "global Application_state"
    puts $f  "set Application_state(path,htmlbrowser)    $Application_state(path,htmlbrowser)"
    puts $f  "set Application_state(path,pdfbrowser)     $Application_state(path,pdfbrowser)"
    puts $f  "set Application_state(path,perl)           $Application_state(path,perl)"

    puts $f "\n##Where  we look for online documentation:"
    foreach path $Application_state(path,docs) {
	puts $f  "AddToList  \"$path\" Application_state(path,docs)" 
    }

    puts $f  "\n\n#You can add  search paths (for bitmaps, tcl code, etc)"
    puts $f  "#by calling the procedure CONFIG:add_path <path name>"
    puts $f  "CONFIG:add_path {~}"
    puts $f  "CONFIG:add_path {.}"

}



proc GC:write_state {f} {
    global GC_state
    puts $f  "global GC_state Application_state;"
    puts $f  "GC:init_bg $GC_state(bg);"
    puts $f  "set GC_state(ghost,ok)  $GC_state(ghost,ok);"

    foreach name [array names GC_state "snap,*"] {
	puts $f  "set GC_state($name)   $GC_state($name);"
    }
    puts $f  "set GC_state(modeless)  $GC_state(modeless);"
    puts $f  "set GC_state(sel_type)   $GC_state(sel_type);"
    HOOK:write_state $f
}



proc GC:init_once {} {

    if [CONFIG:called GC] {return}

    global GC_state Application_state  RECT_state


    set RECT_state(idx,originx) 0
    set RECT_state(idx,originy) 1
    set RECT_state(idx,extentx) 2
    set RECT_state(idx,extenty) 3


    if $Application_state(windoze) {
	set GC_state(icon,move) hand2
    }  else {
	set GC_state(icon,move) "[WidgetGfx:get_bitmap_file move.xbm] black"
    }



    set GC_state(move,origx) 0
    set GC_state(move,origy) 0
    set GC_state(move,onlyx) 0
    set GC_state(move,onlyy) 0

    set GC_state(simple) 0
    set GC_state(menu,show) 1
    set GC_state(menu,show,io) 1
    set GC_state(current_canvas) ""
    set GC_state(pbcmd) 0
    set GC_state(palette_ok) 1
    set GC_state(menubar_ok) 1
    set GC_state(scrollbar_ok) 1
    set GC_state(dflt_region)    {0 0 2500 2500} 
    set GC_state(dflt_width)    400
    set GC_state(dflt_height)   300
    set GC_state(bg)        #f4fede
    set GC_state(fixed_args)        ""
    set GC_state(ghost,ok)  1
    set GC_state(snap,on)   [UTIL:get_flag snap]
    set GC_state(move_hint) [UTIL:get_flag move_hint]
    set GC_state(die_hint)  [UTIL:get_flag die_hint]
    set GC_state(modeless)  1
    set GC_state(sel_type)  contained
    set GC_state(colls)      [list]
    set GC_state(canvases)   [list]


    set GC_state(move,type)      VElement
    set GC_state(move,nottype)   ""
    set GC_state(move,shift,type)      VElement
    set GC_state(move,shift,nottype)   ""

    set GC_state(reshape,nottype)         ""
    set GC_state(reshape,shift,nottype)   ""

    set GC_state(select,type)   VElement
    set GC_state(select,nottype)   ""


    set GC_state(clipboard) ""
    trace variable  GC_state(clipboard)  w  "GC:clipboard_change"



    set GC_state(id)  0
    set GC_state(fixed_palette) [list]



    GC:cmd_define delete_node    { \
	-underline 0 -keybind d -label "Delete Node"    -cursor  pirate  \
	-BP1 "GCMD:generic_elt_func %C %x %y {GCMD:delete %C ELT}  VEntity"  \
	-M1 "B1: Select node to delete"  \
    }


GC:cmd_define delete_edge    { 
    -label "Delete Edge"    -cursor  pirate  
    -BP1 "GCMD:generic_elt_func %C %x %y {GCMD:delete %C ELT}  VRelation"  
    -M1 "B1: Select edge to delete"  
}



GC:cmd_define move_elt       [ list   \
    -cursor  "$GC_state(icon,move)"   \
    -label "Move Element"    \
    -command "GCMD:init_move %C  " \
    -M1 "B1:Select node/move" \
    -M2 "B1/shift:Select node/move connected" \
    -M3 "" \
]

GC:cmd_define  snap  {
    -moded 0 
    -label "Snap"  
    -command "GC:snap $c"
}


GC:cmd_define reshape_node   {
    -label "Reshape Node"    
    -cursor sizing 
    -underline 0 
    -keybind r
    -command "GCMD:init_reshape %C  VEntity"   
    -M1 "B1:Select node to reshape"
}


GC:cmd_define shrink_node    {
    -label "Shrink Node" 
    -cursor hand2  
    -BP1 "GCMD:generic_elt_func %C  %x %y {GRAPH:shrink ELT} VEntity"
    -M1 "B1: Select node to shrink"
}

GC:cmd_define  joint_add     {
    -label "Add joint" 
    -keybind j 
    -underline 4  
    -cursor hand2 
    -command "GCMD:init_joint_add %C " 
    -M1 "B1:Select edge to add joint to"
}

GC:cmd_define  joint_remove  {
    -label "Remove joint"    
    -cursor hand2 
    -command "GCMD:init_joint_remove %C" 
    -M1 "B1:Select joint to remove"
}

GC:cmd_define  joint_move    {
    -label "Move joint"     
    -command "GCMD:init_reshape %C VElement GRAPH:closest_joint " 
    -M1 "B1:Select joint to move" 
}





GC:cmd_define cut     {
    -moded 0 -label  "Cut"  -command {GC:sel_cut %C}  -underline  0 -keybind c 
}

GC:cmd_define copy     {
    -moded 0 -label  "Copy"  -command {GC:sel_copy %C}
}

GC:cmd_define paste     {
    -label  "Paste"  
    -BP1 {GC:sel_paste %C %x %y}
    -M1 "B1: Select location to paste"
    -underline  0 
    -keybind p 
}

GC:cmd_define select_all     {
    -moded 0
    -label  "Select All"  
    -command {GC:select %C 0 0 10000 10000}
}


GC:cmd_define undo     {
    -moded 0 -label  "Undo"  -command {GC:undo %C} -underline  0 -keybind u 
}



GC:cmd_define new      {
    -moded 0 -label "New"       -command {Document:new -write_proc  $Document_state(%D,write_proc) } -underline  0 -keybind n 
}



GC:cmd_define open     {
    -moded 0 -label "Open..."      -command "Document:open  %D"    -underline  0 -keybind o 
}


GC:cmd_define merge     {
    -moded 0 -label "Merge..."      -command "Document:merge  %D"    -underline  0 -keybind o 
}

GC:cmd_define save     {
    -moded 0 -label  Save  -command {Document:save %D} -underline  0 -keybind s 
}

GC:cmd_define save_as  {
    -moded 0 -label "Save As..."   -command "Document:save_as %D"  -underline  6 -keybind a 
}


GC:cmd_define save_init  {
    -moded 0 -label "Save Initialization..."   -command "Application:save_init"
}


GC:cmd_define close    {
    -moded 0 -label "Close"        -command "GC:close %C"   -underline 0 -keybind c 
}

GC:cmd_define exit     {
    -moded 0 -label "Exit"         -command  "Application:exit  "   -underline 1 -keybind x 
}
    

GC:cmd_define new_view {
    -moded 0 -label   "Popup New View" -command  "GC:new_view %C"
}

GC:cmd_define clear_mode        {
    -moded 0 -label  "Clear Mode"  -command "GC:clear_mode %C" 
}

}




proc GC:api_tool {base  name  bm  args  } {
    set args "\{base $base \} \{commandName \"$name\"\} $args"
    global GC_state
    lappend GC_state(fixed_palette) [list command "$name" "GCMD:init_add_element %C DynamicCommand  \{$args\}  \{$name\}" $bm ] 
}


proc GC:api_label {lbl} {
    global GC_state
    lappend GC_state(fixed_palette) [list label "$lbl"]
}

proc GC:api_seperator {} {
    global GC_state
    lappend GC_state(fixed_palette) seperator
}



proc GC:api_newpalette {{scroll 1}} {
    global GC_state
    lappend GC_state(fixed_palette) [list new_palette $scroll]
}



proc GC:init_options {} {
    option add *toolbar.*font         [Font:find 12 medium ]
    option add *message_bar.*font     [Font:find 12 medium ]
    option add *copyright.Label.font  [Font:find   10  medium i]
    option add *msgfr.Label.font      [Font:find   12  medium ]
    option add *help.*font            [Font:find   11  medium ]
}









GC:init_once





