



proc GRAPH:dflt_pos {c elt } {
    global GC_state
    set y  $GC_state($c,lasty)
    set x  $GC_state($c,lastx)
    incr GC_state($c,lastx) 150
    if {$GC_state($c,lastx) > 500} {
	set GC_state($c,lastx) 100 
	incr GC_state($c,lasty) 100 
    }
    set GC_state($c,node1) $GC_state($c,node2)
    set GC_state($c,node2) $elt
    return "$x $y"
}


proc GCMD:init_add_element {c type  { attrs "" } {name ""} } {
    global GC_state Application_state DragAndDrop_state
    if {[UTIL:strck $name] == 0}  {set name $type}
    set isrel  [UTIL:is_kind_of  $type VRelation] 

    set GC_state($c,add,type) $type
    set GC_state($c,add,name) $name
    set GC_state($c,add,attrs) "$attrs"


    if {$Application_state(button,double) || $DragAndDrop_state(dropped)} {
	if $isrel {
		if !{[GRAPH:valid $GC_state($c,node1)]} {return}
		if !{[GRAPH:valid $GC_state($c,node2)]} {return}
		set edge [eval "create $GC_state($c,graph) $GC_state($c,add,type)  $GC_state($c,add,attrs)" ] 
		GRAPH:set_tail $edge $GC_state($c,node1)
		GRAPH:set_head $edge $GC_state($c,node2)

		if {! [HOOK:created_rel $edge $GC_state($c,node1) $GC_state($c,node2) ] } {
		    GRAPH:delete $edge
		}
	} else {
	    set elt [eval "create $GC_state($c,graph) $GC_state($c,add,type) $GC_state($c,add,attrs) " ] 
	    GC:undo_add $c "GRAPH:delete $elt" "Add node"
	    if {!$DragAndDrop_state(dropped)} {
		eval GRAPH:move $elt  [GRAPH:dflt_pos $c $elt]
	    } else {
		set cx [expr  $DragAndDrop_state(rcv,x) - [winfo rootx $c]]
		set cy [expr  $DragAndDrop_state(rcv,y) - [winfo rooty $c]]
		GRAPH:move $elt  $cx $cy
	    }
	    HOOK:created_elt $elt $c
	}

	if {!$DragAndDrop_state(dropped)} {
	    GC:continue $c
	} else {
	    GC:dflt_bindings $c
	}
	return
    } 



    GC:dflt_bindings $c
    bind $c <ButtonPress-1> {}
    bind $c <ButtonRelease-1> {}
    bind $c <Motion>         {}
    bind  $GC_state($c,window)  <Control-Key-c>   {}



    if $isrel {
	$c config -cursor  sb_right_arrow
	bind  $c <ButtonPress-1> "GCMD:start_add_relation  $c \[$c canvasx %x\] \[$c canvasy %y\] "
	GC:set_mode $c "Create $name" "B1:Select source node"  "B2: Move node " ""
    } else {
	$c config -cursor  ul_angle
	bind  $c <ButtonPress-1> "GCMD:start_add_node   $c  \[$c canvasx %x\]  \[$c canvasy %y\] "
	GC:set_mode $c "Create $name" "B1:Create $name node at" "B2: Move node"   ""
	GC:ghost_show $c  $type
    }



}



proc GCMD:start_add_node { c x y  } {
    global  GC_state Application_state
    if $Application_state(key,alt) {return}


    set elt [eval create $GC_state($c,graph) $GC_state($c,add,type) "$GC_state($c,add,attrs)"  ] 

    GC:undo_add $c "GRAPH:delete $elt" "Add node"
    GRAPH:move $elt $x $y
    HOOK:created_elt $elt $c

    GC:ghost_hide $c

    if [is_stretchy $elt] {
	GC:set_mode $c 0    "Mouse Move: Reshape Node" 0 0
	bind  $c <Motion>   "GRAPH:reshape $elt P2  \[$c canvasx %x\]  \[$c canvasy %y\]"
	$c config -cursor  sizing
    } else  {
	GC:set_mode $c 0    "Mouse Move: Reposition Node" 0 0 
	GCMD:start_move2 $elt $c $x $y 0 1 0
	$c config -cursor  $GC_state(icon,move)
    }
    bind  $c <ButtonRelease-1> "GCMD:end_add_node  $elt  $c"
    GC:changed $c
}




proc GCMD:end_add_node {elt  c } {
    GCMD:done_move  "$elt" $c  0 1 0; 
    global GC_state
    if [GC:continue $c] {
	GCMD:init_add_element $c $GC_state($c,add,type)  "$GC_state($c,add,attrs)"  $GC_state($c,add,name)
    }
} 



proc GCMD:abort_add_relation {c e } {

    GRAPH:delete $e
    global GC_state
    GC:enable $c
    if [GC:continue $c] {
	GCMD:init_add_element $c $GC_state($c,add,type)   "$GC_state($c,add,attrs)" $GC_state($c,add,name)
    }

}


proc GCMD:start_add_relation { c x y } {
    global GC_state Application_state
    if $Application_state(key,alt) {return}
    
    set edge [eval "create $GC_state($c,graph) $GC_state($c,add,type) $GC_state($c,add,attrs)" ] 
    
    set tl [GRAPH:find $GC_state($c,graph)  $x $y -foredge $edge -tl]

    if {[string compare $tl "0"] == 0} {
	GRAPH:delete $edge
	return;
    }

# GRAPH:check_tl checks if this is legal and connects the tl

    set ok [GRAPH:check_tl $edge $tl]
    if {[UTIL:strck $ok] } {
	tk_messageBox -icon error -type ok -default ok -message "$ok"
	GRAPH:delete $edge
	return;
    }


global GC_state

GC:disable $c
GRAPH:reshape   $edge  P2 $x $y


GC:set_mode $c 0  "B1: Select destination node"     "B2: Add  joint" "Cntl-C: Cancel" 

bind  $GC_state($c,window)  <Control-Key-c>   "GCMD:abort_add_relation $c $edge "
bind  $c <ButtonPress-1>   "GCMD:end_add_relation  $edge  $c   \[$c canvasx %x\]  \[$c canvasy %y\] "
bind  $c <ButtonPress-2>   "GRAPH:joint_add  $edge   \[$c canvasx %x\]  \[$c canvasy %y\]"
bind  $c <Motion>          "GRAPH:reshape $edge P2  \[$c canvasx %x\]  \[$c canvasy %y\]"

}




proc GCMD:end_add_relation {edge c x y  } {
    global GC_state
    set hd [GRAPH:find $GC_state($c,graph)  $x $y -foredge $edge -hd]
    GC:enable $c

    if {[string compare $hd "0"] == 0} {
	GRAPH:delete  $edge
	GC:signal_error $c "Unable to find destination node"
    } else {
	set ok [GRAPH:check_hd $edge $hd]
	if {[UTIL:strck $ok] } {
	    tk_messageBox -icon error -type ok -default ok -message "$ok"
	    GRAPH:delete $edge
	}  else { 
	    if {! [HOOK:created_rel $edge [GRAPH:tail $edge] $hd ] } {
		GRAPH:delete $edge
	    }
	}
    }

    global GC_state
    GC:changed $c
    GC:undo_add $c "GRAPH:delete $edge" "Add edge"
    if [GC:continue $c] {
	GCMD:init_add_element $c $GC_state($c,add,type)   "$GC_state($c,add,attrs)" $GC_state($c,add,name)
    }




}


proc GCMD:init_joint_remove {c } {
    GC:set_mode $c "Remove  joint" "B1:Select joint to remove"  ""
    bind  $c <ButtonPress-1>   "GCMD:generic_elt_func $c %x %y {GRAPH:joint_remove ELT ARGX ARGY} "
}



proc GCMD:init_joint_add {c } {
    GC:set_mode $c "Add  joint" "B1:Select edge" 
    bind  $c <ButtonPress-1>   "GCMD:start_joint_add  $c  \[$c canvasx %x\]  \[$c canvasy %y\]"
    bind  $c <ButtonRelease-1> "bind $c <Motion> {};"
}




proc GCMD:start_joint_add {c x y } {
    global GC_state Application_state
    if $Application_state(key,alt) {return}

    set elt [GRAPH:find $GC_state($c,graph)  $x $y ]
    if {[string compare $elt "0"] == 0} {
	GC:signal_error $c "Unable to find element"
	return
    }


    set lp [GRAPH:joint_add $elt $x $y]
    bind  $c <Motion> "GRAPH:reshape $elt $lp  \[$c canvasx %x\]  \[$c canvasy %y\]"
    GC:changed $c
    GC:continue $c
}



proc GCMD:init_move {c  {signal 1} {button 1} } {
    if {$signal} { 
	GC:set_mode $c "Move node" "B1:Select node to move"
    }


    bind  $c <Motion> {}
    bind  $c <ButtonRelease-$button> "GC:continue $c;"
    bind  $c <ButtonPress-$button>   "GCMD:start_move1  $c  \[$c canvasx %x \]  \[$c canvasy %y \]  $signal $button"
}


proc GCMD:start_move1 {c x y  {signal 1} {button 1} {continue 1}   }  {
    global GC_state Application_state

    if $Application_state(key,shift) {
	set type $GC_state(move,shift,type)
	set nottype $GC_state(move,shift,nottype)
    } else {
	set type $GC_state(move,type)
	set nottype $GC_state(move,nottype)
    }

    set elt [GRAPH:find $GC_state($c,graph)  $x $y -class $type -notclass $nottype ]

    if {[string compare $elt "0"] == 0} {
	if {$signal} {
	    GC:signal_error $c "Unable to find element"
	    GCMD:init_move $c  $signal $button
	    return
	} else {
	    set elt [GC:sel_get $c]
	}

    }

    GCMD:start_move2 "$elt" $c $x $y  $signal $button $continue 
}




proc GCMD:constrain_move {elt c  origx origy nx  ny  lx ly} {
    if {abs($origx-$nx) > abs($origy-$ny)} {
	GCMD:middle_move  "$elt" $c  $nx $ny $lx $ly 1 0
    } else {
	GCMD:middle_move  "$elt" $c  $nx $ny $lx $ly 0 1
    }

}


proc GCMD:start_move2 {elt c x y  {signal 1} {button 1} {continue 1} } {

    bind  $c <ButtonRelease-$button> "GCMD:done_move \"$elt\"  $c  $signal $button $continue"
    set p [warp_point $x $y $elt]
    set nx [lindex $p 0]
    set ny [lindex $p 1]

    global Application_state
##    if $Application_state(key,shift) {
##	bind  $c <Motion>   "GCMD:constrain_move  \"$elt\" $c  $x $y \[$c canvasx %x\]  \[$c canvasy %y\]  $nx $ny;"
##    } else {
	bind  $c <Motion>   "GCMD:middle_move  \"$elt\" $c  \[$c canvasx %x\]  \[$c canvasy %y\]  $nx $ny;"
##    }

### bind $c <Leave> "puts OUT; bind [winfo toplevel $c] <Motion> {puts hello}"
    GC:changed $c

}


proc GCMD:middle_move {elt c  nx  ny  lx ly {onlyx 0} {onlyy 0} } {
    set p [warp_point $nx $ny $elt]
    set nx [lindex $p 0]
    set ny [lindex $p 1]

    if $onlyx {
	set dy 0
    } else {
	set dy [expr $ny - $ly]
    }
    if $onlyy {
	set dx 0
    } else {
	set dx [expr $nx - $lx]
    }

    GRAPH:move_by "$elt" $dx $dy
    bind  $c <Motion>   "GCMD:middle_move  \"$elt\" $c  \[$c canvasx %x\]  \[$c canvasy %y\]  $nx $ny $onlyx $onlyy;"

}


proc GCMD:done_move {elt c   {signal 1} {button 1} {continue 1} }  {
    global GC_state
    GRAPH:notify_moved  $GC_state($c,graph)  "$elt"
    if {$continue && [GC:continue $c ]}  {
	GCMD:init_move $c  $signal $button
    } else {
	bind  $c <Motion> {}
    }
}




proc GCMD:init_reshape {c type {lp_func closest_box_lp} } {
    bind  $c <ButtonPress-1>  "GCMD:start_reshape  $c $type  \[$c canvasx %x\]  \[$c canvasy %y\] $lp_func"
}


proc GCMD:start_reshape {c type x y lp_func } {
    global GC_state Application_state
    if $Application_state(key,alt) {return}
    set elt [GRAPH:find $GC_state($c,graph)  $x $y -class $type -notclass $GC_state(reshape,nottype)]
    if {[string compare $elt "0"] == 0} {
	GC:signal_error $c "Unable to find element"
	return
    }
    set lp [$lp_func $elt $x $y]

    bind  $c <Motion>          "GRAPH:reshape $elt $lp   \[$c canvasx %x\]  \[$c canvasy %y\];"
    bind  $c <ButtonRelease-1> "bind $c <Motion> {};GC:continue $c;"
	
    GC:changed $c
}



proc GCMD:init_shrink {c type} {
    bind  $c <ButtonPress-1>    
}





proc GCMD:start_shrink {c type x y  } {
    global GC_state Application_state
    if $Application_state(key,alt) {return}
    set elt [GRAPH:find $GC_state($c,graph)  $x $y -class $type ]
    if {[string compare $elt 0] == 0} {
	GC:signal_error $c "Unable to find element"
	return
    }
   
    GRAPH:shrink $elt
    GC:changed $c
    GC:continue $c
}









proc GCMD:generic_elt_func {c  x y command {type VElement} {signal 1}  } {
    global GC_state  Application_state
    if $Application_state(key,alt) {return}

    set x [$c canvasx $x]
    set y [$c canvasy $y]
    set elt [GRAPH:find $GC_state($c,graph)   $x $y -class $type ]

    if {[string compare $elt  0] == 0} {
	if {$signal} {GC:signal_error $c "Unable to find element of type $type"}
	return
    }

    set cmd ""
    regsub -all ELT "$command" $elt  cmd
    regsub -all ARGX    "$cmd" $x  cmd
    regsub -all ARGY    "$cmd" $y  cmd
    GC:continue $c
    eval $cmd
    GC:changed $c
}



proc GCMD:init_toggle {c type var lmvalue mmvalue m1 m2 m3 err} {
    GC:set_mode $c "$m1" "$m2" "$m3"
    $c config -cursor hand2
    bind  $c <ButtonPress-1>   "GCMD:start_toggle  $c  \[$c canvasx %x\]  \[$c canvasy %y\] $type $var \"$lmvalue\" \"$err\""
    bind  $c <ButtonPress-2>   "GCMD:start_toggle  $c  \[$c canvasx %x\]  \[$c canvasy %y\] $type $var \"$mmvalue\" \"$err\""
}


proc GCMD:start_toggle {c x y type var value err} {
    global GC_state
    set elt [GRAPH:find $GC_state($c,graph)  $x $y -class $type]
    catch "GRAPH:set_attr  $elt  $var $value"
}



proc GCMD:toggle {elt var  } {
    GRAPH:set_attr  $elt  $var [expr ![GRAPH:get_attr $elt $var 0]]
}



proc GCMD:delete {c elt} {
    set undo [GRAPH:delete $elt]
    GC:undo_add $c "GC:clone $c \{$undo\}" "Delete"
}


proc GCMD:dflt_move {c x y} {
    GCMD:start_move1 $c $x $y  0 2
}


proc GCMD:manhattan {c {type VRelation} } {
    global GC_state
    set g $GC_state($c,graph)
    set elts [GRAPH:get_elements $g $type]
    foreach elt $elts {
	set p1 [GRAPH:get_attr $elt p1]
	set p2 [GRAPH:get_attr $elt p2]
	
    }
    

}

proc GCMD:set_attrs {c attr value {type VElement}} {
    global GC_state
    foreach elt [GRAPH:get_elements $GC_state($c,graph) $type] {
	GRAPH:set_attr $elt $attr $value
    }
}



proc GCMD:cut_edges  {elt  type c x y {move 1} } {
    set x [$c canvasx $x]
    set y [$c canvasy $y]
    set rel [GRAPH:in_rels $elt $type] 
    if {![UTIL:strck $rel]} {return}
    GRAPH:delete $rel
    if {$move} {
	GCMD:start_move2 $elt $c $x $y  0 1 0
    }
}

