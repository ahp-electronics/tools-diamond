####################################################
## This file has general editing functionality
####################################################




##This overrides the GC:ghost_get function to return a graphic displayed
##when adding objects of type type
proc GC:ghost_get {c type} {

    set pinline "line 0 0 15 7 0 14 0 0 -fill grey"

    switch $type {
	Ice_TriBuf             	{return "line 0 0 20 10 0 20 0 0  -fill grey"}
	Ice_Buffer             	{return "line 0 0 20 10 0 20 0 0  -fill grey"}
	Ice_SelMux             	{return "line 0 0 30 20 30 40 0 70 0 0  -fill grey"}
	Ice_Mux             	{return "line 0 0 30 20 30 40 0 70 0 0  -fill grey"}
	Ice_DeMux             	{return "line 0 0 -40 30 -40 50 0 80 0 0  -fill grey"}

	Ice_InputPort  		{return "line 0 0 10 0 12 5 10 10 0 10 0 0 -fill grey"}
	Ice_OutputPort          {return "line 0 0 10 0 12 5 10 10 0 10 0 0 -fill grey"}

	Ice_Rectangle             {return "rect  0 0 40 40  -outline grey"}
	Ice_Oval                  {return "oval  0 0 40 40  -outline grey"}
	Ice_Text                  {return "text  0 0 -text text   -fill grey  "}
	Ice_Polygon               {return "line 0 0 40 10 0 20 40 30  -fill grey"}


	Ice_InputPin                {return "$pinline"}
	Ice_LeftPin                 {return "$pinline"}
	Ice_AnyInputPin             {return "line 0 0 0 5 -fill grey"}
	Ice_OutputData              {return "$pinline"}
	

    }

    return "rect 0 0 40 40 -outline grey"
}





proc Ice:PinCompare {pin1 pin2} {
    set y1 [GRAPH:get_attr $pin1 originy]
    set y2 [GRAPH:get_attr $pin2 originy]
    if {$y1 < $y2} {return -1}
    if {$y1 == $y2} {return 0}
    return 1
}


proc Ice:SpacePins {c elt {input 1} {gap 10}} {
    set box [GRAPH:get_rect $elt  ] 
    set ty [expr [lindex $box 1] + $gap]
    set by [expr [lindex $box 3] - $gap]


    if {$input} {

	set pins [GRAPH:succs $elt Ice_LeftPinOf] 

	set lx [lindex $box 0]
	set target W
    } else {
	set pins [GRAPH:succs $elt Ice_OutputPinOf] 
	set lx [lindex $box 2]
	set target E
    }



    set num_pins [llength $pins]
    if {!$num_pins} {return}

    if {$num_pins == 1} {
	eval 	GRAPH:move_point_to $pins CTR  [GRAPH:get_point $elt $target]
	return
    }

    set pins [lsort -command Ice:PinCompare $pins ]
    set step  [expr ($by - $ty)/($num_pins-1)]

    foreach pin  $pins {
	GRAPH:move_point_to $pin CTR  $lx $ty
	incr ty $step
    }
}





##This is a wrapper funciton that gets called when we first are adding an element
##It allows us to set some global variables that are used after the element is
##created to create a certain number of input and output pins

proc Ice:init_add_element {c type {args ""} {inputs 0} {outputs 1} } {
    global Ice_state
    set Ice_state(numInput) $inputs
    set Ice_state(numOutput) $outputs
    GCMD:init_add_element $c $type $args
}


proc Ice:init_add_clock {c } {
    GCMD:init_add_element $c Ice_LeftPin [list {selectable 0} "pinType [Ice:get_pin_type CLOCK]"]
}




proc Ice:hide_show_timing {c w} {
    global GC_state
    set g $GC_state($c,graph)
    foreach edge [GRAPH:get_elements $GC_state($c,graph) Ice_TimingEdge] {
	GRAPH:set_attr $edge showEdge $w
    }
}


proc Ice:hide {p} {
    GRAPH:set_attr $p shown 0
    foreach r [GRAPH:in_rels $p Ice_Connection] {GRAPH:set_attr $r shown 0}
    foreach r [GRAPH:out_rels $p Ice_Connection] {GRAPH:set_attr $r shown 0}
}

proc Ice:only_show {c flag} {
    global GC_state
    set g  $GC_state($c,graph)
    foreach e [GRAPH:get_elements $g Ice_Primitive] {
	if {![GRAPH:get_attr $e $flag 1]} {
	    GRAPH:set_attr $e shown 0 
	    Ice:ApplyToPins $e {Ice:hide %P}
	}
    }

}



##This is a tcl wrapper that calls the C++ proc Ice:add_bumps
##that will add "solder bumps" to all of the joints
proc MyIce:add_bumps {c} {
    global GC_state
    Ice:add_bumps $GC_state($c,graph)
}



proc Ice:LockPins {} {
    global Ice_state GC_state
    if $Ice_state(move,nopin) {
	set GC_state(select,nottype) Ice_Pin
    } else {
	set GC_state(select,type) {}
    }
}




proc Ice:TogglePinConn {pin s} {
    foreach  func  {in_rels out_rels} {
	foreach rel  [GRAPH:$func $pin Ice_Connection] {
	    GRAPH:set_attr $rel shown $s
	}
    }
}



proc Ice:TogglePrimConn {prim s} {
    foreach pin   [GRAPH:succs $prim Ice_PinOf Ice_Pin] {
	Ice:TogglePinConn $pin $s
    }
}





##This gets called in the base code to search for an element
##when the user does a right button down

proc HOOK:rmenu_find {g x y} {
    global Application_state
    if $Application_state(key,shift) {
	return [GRAPH:find $g  $x $y -class Ice_Pin]
    }
    return [GRAPH:find $g  $x $y -notclass Ice_Pin]
}


##This gets called when the user does a right button down
##This will fill in the menu with  commands appropriate 
##to the type of the element elt. 

proc  HOOK:rmenu {menu c elt x y } {
    global GC_state
    if [UTIL:is_kind_of $elt Ice_Connection] {
	$menu add separator

	$menu  insert 0  command -label "[GRAPH:get_attr $elt ClassName]"
	$menu add separator

	$menu add command -label "Manhattanize" -command "GRAPH:manhattan $elt 0"
	$menu add command -label "Manhattanize (remove joints)" -command "GRAPH:manhattan $elt 1"
	$menu add command -label "Remove joints" -command "GRAPH:joint_remove $elt "
	if [GRAPH:get_attr $elt grfOk 1] {
	    $menu add command -label "Set Grf Not Ok " -command "GRAPH:set_attr  $elt grfOk 0"
	} else  {
	    $menu add command -label "Set Grf Ok" -command "GRAPH:set_attr  $elt grfOk 1"
	}
	if [GRAPH:get_attr $elt arrow 1] {
	    $menu add command -label "Arrow off" -command "GRAPH:set_attr  $elt arrow 0"
	} else  {

	    $menu add command -label "Arrow on" -command "GRAPH:set_attr  $elt arrow 1"
	}
	return
    }

    if [UTIL:is_kind_of $elt Ice_Primitive] {
	$menu add separator
	$menu  insert 0  command -label "Options: [Ice:get_prim_type $elt ] - [GRAPH:get_attr $elt name]" -command "Ice:dialog:prim  $c $elt"

	$menu add command -label "Name pins" -command "Ice:lib:set_pins_meta_to_name $elt"
	$menu add command -label "Copy this to other modes" -command "Ice:clone_primitive  $elt "
	$menu add command -label "Add Pin" -command "Ice:AddPin $c $elt"	
	$menu add command -label "Space input pins" -command "Ice:SpacePins $c $elt"
	$menu add command -label "Space output pins" -command "Ice:SpacePins $c $elt 0"
	$menu add command -label "Connections on" -command     "Ice:ApplyToPins $elt {Ice:TogglePinConn %P 1}"
	$menu add command -label "Connections off" -command     "Ice:ApplyToPins $elt {Ice:TogglePinConn %P 0}"

	$menu add command -label "Pin names on" -command     "Ice:ApplyToPins $elt {GRAPH:set_attr  %P showName  1}"
	$menu add command -label "Pin names off" -command     "Ice:ApplyToPins $elt {GRAPH:set_attr  %P showName  0}"
	$menu add command -label "Push prim position" -command     "Ice:push_position $elt"


	if [UTIL:is_kind_of $elt Ice_AttributedPrim] {

	if [GRAPH:get_attr $elt showBox] {
	    $menu add command -label "Hide Box" -command "GRAPH:set_attr $elt showBox 0"
	} else {
	    $menu add command -label "Show Box" -command "GRAPH:set_attr $elt showBox 1"
	}	    

	}
	return
    }


    if [UTIL:is_kind_of $elt Ice_Pin] {


	set name "[GRAPH:get_attr $elt name] \{"	
	set didone 0

	foreach s {Sig 0 1  Inv} {
	    if [GRAPH:get_attr $elt couldBe$s]	{
		if {!$didone} {
		    set didone 1
		    set name "$name $s"
		} else {
		    set name "$name,$s"
		}
	    }
	}
	set name "$name \}"
	$menu add separator
	$menu  insert 0  command -label "Pin options: $name" -command "Ice:dialog:pin $c $elt"
	$menu add command -label "Copy this to other modes" -command "Ice:CopyPin  $elt"
	$menu add command -label "Connections on" -command "Ice:TogglePinConn $elt 1"
	$menu add command -label "Connections off" -command "Ice:TogglePinConn $elt 0"


	if [GRAPH:get_attr $elt selectable] {
	    $menu add command -label "Selectable off" -command "GRAPH:set_attr $elt selectable 0"
	} else {
	    $menu add command -label "Selectable on" -command "GRAPH:set_attr $elt selectable 1"
	}

 	if [GRAPH:get_attr $elt showName] {
	    $menu add command -label "Pin name off" -command "GRAPH:set_attr $elt showName 0"
	} else {
	    $menu add command -label "Pin name on" -command "GRAPH:set_attr $elt showName 1"
	}

    }

    if [UTIL:is_kind_of $elt Ice_Shape] {
	$menu add separator
	if [UTIL:is_kind_of $elt Ice_Polygon] {
	    if [GRAPH:get_attr $elt showArrow] {
		$menu add command -label "Hide arrow" -command "GRAPH:set_attr $elt showArrow 0"
	    } else {
		$menu add command -label "Show arrow" -command "GRAPH:set_attr $elt showArrow 1"
	    }
	}
    }
}






##THis registers a set of Ice specific commands with the base code
proc Ice:define_commands {} { 


GC:cmd_define remove_pin    { 
    -BP1 "GCMD:generic_elt_func %C %x %y {GCMD:cut_edges ELT Ice_PinOf   %C %x  %y} Ice_Pin"  
    -label "Remove  Pin"    
    -M1 "B1: Remove Pin from Primitive"  
}

GC:cmd_define toggle_arrow    { 
    -BP1 "GCMD:generic_elt_func %C %x %y {GRAPH:set_attr  ELT arrow 1} Ice_Connection"  
    -BP2 "GCMD:generic_elt_func %C %x %y {GRAPH:set_attr  ELT arrow 0} Ice_Connection"  
    -label "Toggle Arrow"    
    -M1 "B1: Arrow on"  
    -M2 "B2: Arrow off"  

}

}






##Sets up initial canvas grid size
proc HOOK:init_canvas {c doc} {
    global GC_state
    set GC_state($c,grid,x) 20
    set GC_state($c,grid,y) 20
}


proc    HOOK:create_bottom {c doc base} {}
proc    HOOK:imagebutton {tag bitmap w} {}
proc 	HOOK:created_rel {rel tl hd } {    return 1 }



##This gets called from the base code and allows us to create an
##Ice specific menu bar 


proc HOOK:create_menubar2 {base top mb c doc} { 
    global GC_state Balloon_state Application_state 

    Menu:create ${c}_Ice   Ice


    Menu:command ${c}_Ice "Toggle pin labels"	"GCMD:init_toggle $c Ice_Pin showName 1 0 {Toggle Label}  {B1: Turn on}  {B2: Turn off}  {Unable to find node}   "
    Menu:command ${c}_Ice "Run through prims"   "Ice:lib:run_thru_prims $c"

    Menu:command ${c}_Ice "Delete redundant connections"   "Ice:tcl_check_graph $c 1"

    Menu:command ${c}_Ice "Eval dialog"  "GC:eval:create $c"

    Menu:cascade   ${c}_Ice       ${c}_Ice:modes  Modes
    set menu [Menu:get   ${c}_Ice:modes]
    Ice:mode:add_canvas_commands $menu $c

##    Menu:command   ${c}_Ice  "Scale"     "Ice:scale $c"

    Menu:command   ${c}_Ice  "Traverse ports"       "MyIce:traverse  $c"
    Menu:command   ${c}_Ice  "Add Bumps"            "MyIce:add_bumps  $c"



    Menu:cascade   ${c}_Ice       ${c}_Ice:layout  Layout
    Menu:cascade   ${c}_Ice:layout  ${c}_Ice:manhattan Manhattanize



    Menu:command   ${c}_Ice:manhattan  "...All"                        "GC:manhattan_all $c 0 Ice_Connection"
    Menu:command   ${c}_Ice:manhattan  "...All (remove joints)"        "GC:manhattan_all $c 1 Ice_Connection"
    Menu:command   ${c}_Ice:manhattan  "...Selection"                  "GC:manhattan_sel $c 0 Ice_Connection"
    Menu:command   ${c}_Ice:manhattan  "...Selection (remove joints)"  "GC:manhattan_sel $c 1 Ice_Connection"

    Menu:cascade   ${c}_Ice   ${c}_Ice:hide_show  "Hide/Show"

    Menu:command   ${c}_Ice:hide_show  "Hide Attachments"     "GCMD:set_attrs $c showEdge 0 Ice_Attachment"
    Menu:command   ${c}_Ice:hide_show  "Show Attachments"     "GCMD:set_attrs $c showEdge 1 Ice_Attachment"


    Menu:command   ${c}_Ice:hide_show  "Hide Timing Edges"    "GCMD:set_attrs $c showEdge 0 Ice_TimingEdge"
    Menu:command   ${c}_Ice:hide_show  "Show Timing Edges"    "GCMD:set_attrs $c showEdge 1 Ice_TimingEdge"


    Menu:command   ${c}_Ice:hide_show  "Hide Connections"    "GCMD:set_attrs $c showEdge 0 Ice_Connection"
    Menu:command   ${c}_Ice:hide_show  "Show Connections"    "GCMD:set_attrs $c showEdge 1 Ice_Connection"


    Menu:command   ${c}_Ice:hide_show  "Show all  "               "GC:set_shown $c Object 1"
    Menu:command   ${c}_Ice:hide_show  "Show grf view"            "Ice:only_show $c grfOk "
    Menu:command   ${c}_Ice:hide_show  "Show cm view"             "Ice:only_show $c cmOk "


    Menu:command   ${c}_Ice:layout  "Copy primitive positions"     "Ice:push_position_all \$GC_state($c,graph)"
    Menu:command   ${c}_Ice:layout  "Snap primitives"     "GC:snap $c Ice_Primitive"
    Menu:command   ${c}_Ice:layout  "Snap pins"           "GC:snap $c Ice_Pin "
    Menu:command   ${c}_Ice:layout  "Snap connections"    "GC:snap $c Ice_Connection"
    Menu:command   ${c}_Ice:layout  "Space all input pins"    "Ice:ApplyToAll $c Ice_Primitive \"Ice:SpacePins $c %E\""
    Menu:command   ${c}_Ice:layout  "Space all output pins"     "Ice:ApplyToAll $c Ice_Primitive \"Ice:SpacePins $c %E 0\""


    Menu:check  ${c}_Ice  "Lock pins"   Ice_state(move,nopin)     Ice:LockPins
    Menu:check  ${c}_Ice  "Show dialog for  primitive"   Ice_state(primdialog,show)   

    GC:cmd_add    $doc $c  ${c}_Ice remove_pin
    GC:cmd_add    $doc $c  ${c}_Ice toggle_arrow

}
