

proc Ice:lib:set_name  {elt} {
    global lib_name_ok metaType Ice_state
    set lib_name_ok 0
    global metatype filter_name 
    set metatype(current) $elt
    set metatype($elt)  [GRAPH:get_attr $elt  metaType]


    global prim_name prim_type
    set prim_name [GRAPH:get_attr $elt  name]


    set tl .libname
    set top $tl.top
    set meta_e $top.meta_e

    if {![winfo exists $tl]} {
	set filter_name ""
	set tl [toplevel .libname]
	bind $tl <Return> {set lib_name_ok 1}
	set top  [frame $tl.top]

	label $top.filter_l -text "Filter:" 
	entry $top.filter_e -textvariable filter_name

	label $top.name_l -text "Name:" 
	label $top.name_e -textvariable prim_name

	label $top.meta_l -text Meta:
	entry $meta_e  -textvariable metatype($elt)

	checkbutton $top.push -text "Push" -variable  Ice_state(lib,push_prim)  
	checkbutton $top.autoguess -text "Always Guess" -variable  Ice_state(lib,autoguess)  
	button   $top.guess -text Guess -command Ice:lib:guess -highlightthickness 0 -bd 1

	grid $top.filter_l  $top.filter_e     
	grid $top.name_l    $top.name_e       -row 1
	grid $top.meta_l  $meta_e   $top.push -row 2
	grid $top.guess    $top.autoguess     -row 3
	
	set pinf [frame $tl.pin_frame -border 1 -relief raised]
	set bottom [frame $tl.bottom]
	button $bottom.skip -text Skip -command {set lib_name_ok 2}
	button $bottom.ok -text OK -command {set lib_name_ok 1}
	button $bottom.stop -text Stop -command {set lib_name_ok 0}
	pack $bottom.ok $bottom.skip  $bottom.stop -side left -expand 1 -fill x
	pack $top  [label $tl.pin_label -text "Pins:"] $pinf $bottom -side top -anchor w -expand 1 -fill x

    } else {
	set pinf  $tl.pin_frame
	$meta_e config -textvariable metatype($elt)
	raise $tl
    }


    foreach child [grid slaves  $pinf] {destroy $child}

    set pins [GRAPH:succs $elt Ice_PinOf Ice_Pin]



    set row 0
    set nl [label $pinf.nlbl$row -text "Name"]
    set ml [label $pinf.mlbl$row -text "Meta"]
    grid  $nl $ml  -row $row -sticky ew 
    incr row

    foreach pin $pins {
	label $pinf.lbl$row -text "[GRAPH:get_attr $pin name]:"
	set metatype($pin) [GRAPH:get_attr $pin metaType]
	entry  $pinf.e$row -textvariable metatype($pin)
	grid $pinf.lbl$row  -column 0 -row $row -sticky e
	grid  $pinf.e$row  -row $row -sticky ew -column 1
	incr row

    }

    if $Ice_state(lib,autoguess)   {Ice:lib:guess}


    update
    tkwait variable lib_name_ok

    if {$lib_name_ok == 1} { 
	GRAPH:set_attr $elt  metaType $metatype($elt)
	foreach pin $pins {
	    GRAPH:set_attr $pin metaType $metatype($pin)
	}
    }

    return $lib_name_ok
}




proc Ice:lib:push_prim_meta {elt} {
    set other_prims [Ice:find_matching_primitives $elt]
    set meta [GRAPH:get_attr $elt metaType]
    foreach other_prim $other_prims {
	GRAPH:set_attr $other_prim metaType $meta	
    }
    foreach pin [GRAPH:succs $elt  Ice_PinOf Ice_Pin] {
	set other_pins [Ice:find_matching_pins $pin]
	set meta [GRAPH:get_attr $pin metaType]
	foreach other_pin $other_pins {
	    GRAPH:set_attr $other_pin metaType $meta	
	}

    }

}



global filter_name
set filter_name ""

proc Ice:lib:run_thru_prims {c} {
    global Ice_state GC_state filter_name 
    set Ice_state(lib,push_prim) 1
    set Ice_state(lib,autoguess) 0
    $c configure -xscrollincrement 1  -yscrollincrement 1 
 
    foreach elt [GRAPH:get_elements $GC_state($c,graph) Ice_Primitive] {
	if {[UTIL:is_kind_of $elt  Ice_ModeBox] || \
		[UTIL:is_kind_of $elt  Ice_BlackBox] || \
		[UTIL:is_kind_of $elt  Ice_AttributePrim] || \
		[UTIL:is_kind_of $elt  Ice_CellPort]} {continue}

	set filter_name [string trim $filter_name ]
	if {[UTIL:strck $filter_name]} {
	    if {![regexp $filter_name [GRAPH:get_attr $elt name]]} {continue}
	}

	GRAPH:set_attr $elt hilite 1
	set  origin [GRAPH:get_attr $elt origin]
	set x [expr [lindex $origin 0] -50]
	set y [expr [lindex $origin 1] -50]

	$c xview moveto 0  
	$c yview moveto 0  
	$c xview scroll $x   units
	$c yview scroll $y   units

	set cont  [Ice:lib:set_name $elt] 
	GRAPH:set_attr $elt hilite 0
	if {$cont == 0 } {break}

	if {$cont == 1 && $Ice_state(lib,push_prim)}  {
	    Ice:lib:push_prim_meta $elt
	}
   }
   $c xview moveto 0  
   $c yview moveto 0  
   catch "destroy .libname"
}






proc Ice:lib:guess {} {
    global  metatype
    Ice:lib:guess_prim $metatype(current)
}



global cmtype_to_libtype
array set cmtype_to_libtype {\
    {lut,4}     lut4\
    {mux,1}     progmux1\
    {mux,2}     progmux2\
    {mux,3}     progmux3\
    {mux,4}     progmux4\
    {mux,5}     progmux5\
    {buffer}    buffer\
    {tribuf}    tribuf\
    {latch,2}   latchp\
    {latch,4}   ffsre\
    {latch,6}   muxregsre\
    {latch}     latchp\
    {muxed-reg} muxregse\
    {ff}        ffsre\
    {rom}       regrom32x4 \
    {ram}       regrom32x4 \
}


proc Ice:lib:guess_prim {elt} {
    global cmtype_to_libtype metatype



    set base [Ice:get_prim_type $elt]



    set inpins [GRAPH:succs $elt Ice_InputPinOf ]
    set numinpins [llength $inpins]
    set primtype  [string trim [GRAPH:get_attr $elt metaType]]
    if {[string length $primtype] == 0} {
	if $numinpins {
	    set primtype ${base}${numinpins}
	} else {
	    set primtype ${base}
	}

	if [info exists cmtype_to_libtype($base,$numinpins)] {
	    set primtype $cmtype_to_libtype($base,$numinpins)
	} elseif [info exists cmtype_to_libtype($base)] {
	    set primtype $cmtype_to_libtype($base)
	} 
    }

    set metatype($elt)  $primtype

    set cnt 0
    foreach pin [GRAPH:succs $elt Ice_InputPinOf] {
	Ice:lib:guess_pin  $pin $primtype $cnt
	incr cnt
    } 
    foreach pin [GRAPH:succs $elt Ice_OutputPinOf] {
	Ice:lib:guess_pin  $pin $primtype 
    } 
}






proc Ice:lib:guess_pin {pin primtype {cnt 0}  } {
    global pintypes metatype
    array set alpha {0 A 1 B 2 C 3 D 4 E 5 F 6 G 7 H 8 I}

    set pintype  [string trim [GRAPH:get_attr $pin metaType]]
    if [string length $pintype] {return}

    set pinname [string trim [GRAPH:get_attr $pin name]]

    if {[regexp " $pinname " { D D0 D1 CK Q SD SP LSR }]} {
	set pintype $pinname
    } elseif {[UTIL:is_kind_of $pin Ice_InputPin]} {
	if [regexp mux $primtype] {
	    set pintype I$cnt
	} elseif {$cnt <=8} {
	    set pintype $alpha($cnt)
	} else {

	}
    } else  {
	set pintype Z
    }

    set metatype($pin)  $pintype
}





proc    Ice:lib:print_properties {prim out} {

    set pairs [split  [GRAPH:get_attr $prim attrNameValue ""] ";" ] 
    foreach pair $pairs {
	set tmp   [split $pair :]
	set name  [lindex $tmp 0] 
	set values [lindex $tmp 1]
	puts -nonewline $out "\tproperty  \t$name\t\{"
	set first 1
	foreach v $values {
	    if {!$first} {puts -nonewline $out ","}
	    set first 0
	    puts -nonewline $out "$v"
	}
	puts $out "\};"
    }
}


proc Ice:lib:print_prim {prim {out stdout}} {
    global Ice_lib_prims
    set meta [string trim [GRAPH:get_attr $prim metaType]]
    if {[string length $meta ] == 0} {
	set meta [string trim [GRAPH:get_attr $prim name]]
    }
    if [info exists Ice_lib_prims($meta)] {return}
    set  Ice_lib_prims($meta) ""
    set pins [GRAPH:succs $prim Ice_PinOf]
    puts  -nonewline $out "primitive $meta ("
    set first 1
    set pinOutList [list]
    foreach pin $pins {
	set pinMeta [GRAPH:get_attr $pin name]
	if {!$first} {puts -nonewline $out ","}
	set first 0
	puts -nonewline $out $pinMeta
	set type [Ice:get_pin_type_name $pin]
	set dir input
	if [UTIL:is_kind_of $pin Ice_OutputPin] {set dir output}
	lappend pinOutList "pin $pinMeta  $type $dir; "
    }
    puts $out ") is a [Ice:get_prim_type $prim]"
    Ice:lib:print_properties $prim $out

    foreach line $pinOutList {
	puts "\t$line"
    }

    puts "end primitive;\n"



}


proc Ice:lib:print {} {
    global Ice_lib_prims
    catch {unset Ice_lib_prims}
    array set Ice_lib_prims ""
    puts "library"
    Ice:apply 	    Ice:lib:print_prim
    puts "end library;"
}


