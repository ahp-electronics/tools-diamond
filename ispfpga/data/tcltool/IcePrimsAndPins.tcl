##
##This file contains code that deals with primitives and pins
##e.g., prim and pin dialogs
##creating primitives
##etc.



global couldBeDefaultMap
array set couldBeDefaultMap {0 Sig 1 0 2 1 3 Inv} 


##This gets called  when the user presses ok in the pin dialog
proc Ice:dialog:pin:ok {c pin isInput  } {
    global IceDialog_State 
    GRAPH:set_attr $pin name [string toupper $IceDialog_State($c,$pin,name) ]
    GRAPH:set_attr $pin showName $IceDialog_State($c,$pin,showName) 
    GRAPH:set_attr $pin labelPos $IceDialog_State($c,$pin,labelPos)
    GRAPH:set_attr $pin grfOk $IceDialog_State($c,$pin,grfOk)
    GRAPH:set_attr $pin metaType $IceDialog_State($c,$pin,metaType)



    if {$isInput} {
	GRAPH:set_attr $pin endUserProgrammable  $IceDialog_State($c,$pin,endUserProgrammable)
	GRAPH:set_attr $pin selectable $IceDialog_State($c,$pin,selectable) 

	GRAPH:set_attr $pin couldBeDflt $IceDialog_State($c,$pin,couldBeDflt)  
	foreach s {Sig 0 1  Inv} {
	    GRAPH:set_attr $pin couldBe$s $IceDialog_State($c,$pin,couldBe$s)  
	}

	GRAPH:set_attr $pin pinState $IceDialog_State($c,$pin,pinState) 
	GRAPH:set_attr $pin pinType  $IceDialog_State($c,$pin,pinType) 
    }

    set IceDialog_State(done) 0
}



proc Ice:dialog:pin  {c pin} {
    global GC_state IceDialog_State
    set IceDialog_State(done) 0


##Check if the window exists
   set w $GC_state($c,window).pin_$pin
    if [winfo exists $w] {
	raise $w
	return
    }

set isInput [UTIL:is_kind_of $pin Ice_InputPin]


#create the main window and the top and bottom frames
    toplevel $w
    set tf [frame $w.topfr ]
    set bf [frame $w.bottomfr -bd 1 -relief raised ]
    pack $tf $bf -fill both -expand 1 -side top

#########################################
##pin name
    set namef [frame $tf.namef -bd 1 -relief raised]
    pack $namef -side top -fill both -expand 1
    set IceDialog_State($c,$pin,name) [GRAPH:get_attr $pin name]
    set IceDialog_State($c,$pin,showName) [GRAPH:get_attr $pin showName]
    label $namef.n_l -text "Name:"
    entry $namef.n_e -textvariable IceDialog_State($c,$pin,name) -bd 1 -relief raised
    checkbutton $namef.n_b -variable IceDialog_State($c,$pin,showName)  -text Show

    set IceDialog_State($c,$pin,metaType) [GRAPH:get_attr $pin metaType]
    label $namef.m_l -text "Meta Type:"
    entry $namef.m_e -textvariable IceDialog_State($c,$pin,metaType) -bd 1 -relief raised


    grid  $namef.n_l $namef.n_e $namef.n_b  -sticky ew
    grid  $namef.m_l $namef.m_e -sticky ew


#########################################
##pin pos
    set posf [frame $tf.posf -bd 1 -relief raised]
    pack $posf -side top -fill both -expand 1
    pack [label $posf.pos_l  -text "Label position:"] -side left
    set IceDialog_State($c,$pin,labelPos) [GRAPH:get_attr $pin labelPos]
    set pos 1
    foreach pos_l {NE SE NW SW} {
        pack [radiobutton $posf.pos$pos -variable IceDialog_State($c,$pin,labelPos) -text "$pos_l" -value $pos] -side left
        incr pos
    }
#########################################
    set IceDialog_State($c,$pin,grfOk) [GRAPH:get_attr $pin grfOk]
    set writef [frame $tf.writef -bd 1 -relief raised]
    pack $writef -side top -fill both -expand 1






    checkbutton $writef.grfok -variable IceDialog_State($c,$pin,grfOk)  -text "Graphics ok"
    pack  $writef.grfok  -side left  -expand 1 -fill x  -anchor w




if {$isInput} {
    set otherf [frame $tf.otherf -bd 1 -relief raised]
    pack $otherf -side top -fill both -expand 1
    set IceDialog_State($c,$pin,selectable) [GRAPH:get_attr $pin selectable]

    checkbutton $writef.selectable -variable IceDialog_State($c,$pin,selectable)  -text Selectable
    pack  $writef.selectable  -side left  -anchor w  -expand 1 -fill x


    ##Do the could be dialog
    set cbf [frame $tf.cbf -bd 1 -relief raised]
    pack $cbf -side top -fill both -expand 1

    set IceDialog_State($c,$pin,endUserProgrammable) [GRAPH:get_attr $pin endUserProgrammable]
    set row 0
    grid [checkbutton $cbf.endUserProgrammable -text "End User Programmable" -variable IceDialog_State($c,$pin,endUserProgrammable)] -columnspan 2
    incr row
    grid [label $cbf.lbl -text Default] -row $row -column 1
    incr row

    set IceDialog_State($c,$pin,couldBeDflt) [GRAPH:get_attr $pin couldBeDflt]
    set i 0
    foreach s {Sig 0 1  Inv} {
	set IceDialog_State($c,$pin,couldBe$s) [GRAPH:get_attr $pin couldBe$s]
	set cb [checkbutton $cbf.couldBe$s  -text "Could be $s"  -variable  IceDialog_State($c,$pin,couldBe$s)]
	set rb [radiobutton $cbf.couldBe${s}dflt    -variable  IceDialog_State($c,$pin,couldBeDflt) -value $i]
	grid $cb $rb -row $row -sticky w
	incr row
	incr i 
    }

##Pin type
    set pinTypef [frame $tf.pinTypef -bd 1 -relief raised]
    pack $pinTypef -side top -fill both -expand 1
    grid [label $pinTypef.lbl -text "Pin Type"] -sticky ew -columnspan 4
    set IceDialog_State($c,$pin,pinType) [GRAPH:get_attr $pin pinType]


    set col 0
    set row 1
    foreach pinType  {Data Set Reset SetRst Clock CE Address Write Select Operand_A Operand_B Carry} {
	grid  [radiobutton $pinTypef.pinType_$pinType \
		-text  $pinType -variable IceDialog_State($c,$pin,pinType)  \
		-value [Ice:get_pin_type $pinType]] \
		-column $col -row $row -sticky w
	incr col
	if {$col >=4} {
	    set col 0
	    incr row
	}
    }


    ##pin state 
    set statef [frame $tf.statef -bd 1 -relief raised]
    pack $statef -side top -fill both -expand 1
    set IceDialog_State($c,$pin,pinState) [GRAPH:get_attr $pin pinState]
    pack [label $statef.lbl -text "Pin State"] -anchor n
    foreach v {Direct Invert Low High}  {
	pack  [radiobutton $statef.state_$v -text  $v -variable IceDialog_State($c,$pin,pinState) -value [Ice:get_pin_state $v]] -anchor w -side left
    }
#########################################

}


button $bf.ok -text Ok -command "Ice:dialog:pin:ok $c $pin $isInput; destroy $w"
button $bf.apply -text Apply -command "Ice:dialog:pin:ok $c $pin $isInput"
button $bf.cancel -text Cancel -command "destroy $w"
pack $bf.ok $bf.apply $bf.cancel -side left -expand 1 -fill x

}







proc Ice:dialog:prim:ok {c prim   } {
    global GC_state IceDialog_state

    GRAPH:set_attr $prim name 		[string toupper $IceDialog_state($c,$prim,name) ]
    GRAPH:set_attr $prim dfltString 	[string toupper $IceDialog_state($c,$prim,dflt) ]
    GRAPH:set_attr $prim showName 	$IceDialog_state($c,$prim,showName) 
    GRAPH:set_attr $prim labelPos 	$IceDialog_state($c,$prim,labelPos) 
    GRAPH:set_attr $prim grfOk 	        $IceDialog_state($c,$prim,grfOk) 
    GRAPH:set_attr $prim cmOk 	        $IceDialog_state($c,$prim,cmOk) 
    GRAPH:set_attr $prim metaType       $IceDialog_state($c,$prim,metaType) 


    set str ""
    for {set attr 0} {1} {incr attr} {
	if {![info exists IceDialog_state($c,$prim,attrName$attr)] } {break}
	if [UTIL:strck [string trim $IceDialog_state($c,$prim,attrName$attr)] ] {
####	    if {$attr != 0} {set str "$str ;"}
	    set str "$str [string trim $IceDialog_state($c,$prim,attrName$attr)]:[string trim $IceDialog_state($c,$prim,attrValue$attr)];"
	}
    }
    set str [string toupper $str]
    GRAPH:set_attr $prim attrNameValue $str


}


proc Ice:dialog:prim  {c prim} {
    global GC_state IceDialog_state
##Check if the window exists
    set w $GC_state($c,window).prim_$prim
    if [winfo exists $w] {
	raise $w
	return
    }


#create the main window and the top and bottom frames
    toplevel $w
    set tf [frame $w.topfr ]
    set bf [frame $w.bottomfr  -bd 1 -relief raised]
    pack $tf $bf -fill both -expand 1 -side top



#########################################
##prim name
#########################################
    set namef [frame $tf.namef -bd 1 -relief raised]
    pack $namef -side top -fill both -expand 1

    set IceDialog_state($c,$prim,showName) [GRAPH:get_attr $prim showName]
    set IceDialog_state($c,$prim,name) [GRAPH:get_attr $prim name]

    label $namef.n_l -text "Primitive name:" -anchor e
    entry $namef.n_e -textvariable IceDialog_state($c,$prim,name) -bd 1 -relief raised
    checkbutton $namef.n_s -variable IceDialog_state($c,$prim,showName) -text Show

#########################################
##prim default
#########################################

    set IceDialog_state($c,$prim,dflt) [GRAPH:get_attr $prim dfltString]
    label $namef.d_l -text "Default string:" -anchor e
    entry $namef.d_e -textvariable IceDialog_state($c,$prim,dflt) -bd 1 -relief raised

#########################################
##prim meta-type
#########################################

    set IceDialog_state($c,$prim,metaType) [GRAPH:get_attr $prim metaType]
    label $namef.meta_l -text "Meta Type:" -anchor e
    entry $namef.meta_e -textvariable IceDialog_state($c,$prim,metaType) -bd 1 -relief raised

#########################################
##prim graphics generation ok?
#########################################

    set IceDialog_state($c,$prim,grfOk) [GRAPH:get_attr $prim grfOk]
    checkbutton $namef.grf -text "Ok to generate grf" -variable IceDialog_state($c,$prim,grfOk) 

#########################################
##prim cm generation ok?
#########################################

    set IceDialog_state($c,$prim,cmOk) [GRAPH:get_attr $prim cmOk]
    checkbutton $namef.cm -text "Ok to generate cm" -variable IceDialog_state($c,$prim,cmOk) 


#########################################
##prim - where do we put the label
#########################################
    set IceDialog_state($c,$prim,labelPos) [GRAPH:get_attr $prim labelPos]
    set posf [frame $tf.posf -bd 1 -relief raised]
    pack $posf -side top -fill both -expand 1
    pack [label $posf.pos_l  -text "Label position:"] -side left
    set IceDialog_state($c,$prim,labelPos) [GRAPH:get_attr $prim labelPos]
    set pos 1
    foreach pos_l {N1 N2 S1 S2} {
        pack [radiobutton $posf.pos$pos -variable IceDialog_state($c,$prim,labelPos) -text "$pos_l" -value $pos] -side left
        incr pos
    }



    set row 0

    set IceDialog_state($c,$prim,primType) [Ice:get_prim_type $prim ]

    label $namef.type_l -text "Type:" -anchor e

    label $namef.type -text "$IceDialog_state($c,$prim,primType)" -anchor w
    
    grid $namef.type_l -row $row -column 0 -sticky e
    grid $namef.type -row $row -column 1 -sticky ew
    incr row
    grid $namef.meta_l -row $row -column 0 -sticky e
    grid $namef.meta_e -row $row -column 1 -sticky ew
    incr row


    grid $namef.n_l -row $row -column 0  -sticky e
    grid $namef.n_e -row $row -column 1 -sticky ew
    grid $namef.n_s -row $row -column 2 -sticky ew
    incr row
    grid $namef.d_l -row $row -column 0  -sticky e
    grid $namef.d_e -row $row -column 1 -sticky ew
    incr row
    grid $namef.grf -row $row -column 0 -sticky ew
    grid $namef.cm -row $row -column 1 -sticky ew
    incr row
    
    grid columnconfigure $namef 1 -weight 1



#########################################
##prim - attributes
#########################################

    set attrf [frame $tf.attrf -bd 1 -relief raised]
    pack $attrf -side top -fill both -expand 1

    set row 0
    label $attrf.l0 -text "Attribute"


    label $attrf.l1 -text "Name"
    label $attrf.l2 -text "Value"
    grid $attrf.l0 -row $row -columnspan 2
    incr row
    grid $attrf.l1 $attrf.l2  -row $row 
    incr row

##################################################
    if {0} {
	Primitive attributes are kept as a big string.
	attr_string := attr_spec;* 
	## i.e., the string is a set of ; delineated attr_specs of the form:
	attr_spec := attr_name :  attr_value
    }
##################################################

    set pairs     [split  [GRAPH:get_attr $prim attrNameValue ""] ";" ] 
    set num_pairs [llength $pairs]
    set max 10
    if {$num_pairs > $max} {set max $num_pairs}

    set attr 0
    foreach pair $pairs {
	set tmp   [split $pair :]
	set IceDialog_state($c,$prim,attrName$attr)  [lindex $tmp 0] 
	set IceDialog_state($c,$prim,attrValue$attr) [lindex $tmp 1]
	incr attr
    }

    for {set attr 0} {$attr < $max} {incr attr; incr row;} { 
	if {$attr > $num_pairs} {
	    set IceDialog_state($c,$prim,attrName$attr)  ""
	    set IceDialog_state($c,$prim,attrValue$attr) ""
	}
	grid  [entry $attrf.an$attr -textvariable IceDialog_state($c,$prim,attrName$attr) ] -row $row
	grid  [entry $attrf.av$attr -textvariable IceDialog_state($c,$prim,attrValue$attr) ] -row $row -column 1 -sticky ew
    }

    grid columnconfigure $attrf 1 -weight 1

#########################################

    button $bf.ok -text Ok -command "Ice:dialog:prim:ok $c $prim; destroy $w"
    button $bf.apply -text Apply -command "Ice:dialog:prim:ok $c $prim"
    button $bf.cancel -text Cancel -command "destroy $w"
    pack $bf.ok $bf.apply $bf.cancel -side left -expand 1 -fill x

}







##This is a helper proc  that creates a pin of a given type
##and attaches to the elt (a Ice_Primitive) and centers it 

proc Ice:AddPin {c elt {pintype Ice_LeftPin} {pinedgetype Ice_LeftPinOf} } {
    global GC_state
    set pin [create $GC_state($c,graph) $pintype]
    create $GC_state($c,graph) $pinedgetype  "tail $elt" "head $pin"

    set box [GRAPH:bbox $elt  ] 
    set ty [lindex $box 1]
    set by [lindex $box 3]
    eval 	GRAPH:move_point_to $pin CTR  [GRAPH:get_point $elt W]
    return $pin
}








##All of the Ice:new:... procedures allow us to add on the correct
##types of pins to the given primitive. This is in essence Ice's
##original meta-type library element support to the end user prior
##to the cell model restructuring to support meta-types


proc Ice:new:latch  {elt c} {


    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    GRAPH:set_attr $pin selectable 0  
    GRAPH:set_attr $pin name D


    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    GRAPH:set_attr $pin pinType [Ice:get_pin_type CLOCK]
    GRAPH:set_attr $pin selectable 0  
    GRAPH:set_attr $pin name CK

    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    GRAPH:set_attr $pin pinType [Ice:get_pin_type SETRST]
    GRAPH:set_attr $pin selectable 0  
    GRAPH:set_attr $pin name S/R

    set pin [Ice:AddPin $c $elt  Ice_OutputData Ice_OutputPinOf ]
    GRAPH:set_attr $pin selectable 0  
    GRAPH:set_attr $pin  name Q

    Ice:SpacePins $c $elt 1 15
    Ice:SpacePins $c $elt 0 

}


proc Ice:new:muxedreg  {elt c} {

    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    GRAPH:set_attr $pin selectable 0  
    GRAPH:set_attr $pin name D0

    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    GRAPH:set_attr $pin selectable 0  
    GRAPH:set_attr $pin name D1


    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    GRAPH:set_attr $pin pinType [Ice:get_pin_type CLOCK]
    GRAPH:set_attr $pin selectable 0  
    GRAPH:set_attr $pin name CK

    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    GRAPH:set_attr $pin pinType [Ice:get_pin_type SETRST]
    GRAPH:set_attr $pin selectable 0  
    GRAPH:set_attr $pin name S/R

    set pin [Ice:AddPin $c $elt  Ice_OutputData Ice_OutputPinOf ]
    GRAPH:set_attr $pin selectable 0  
    GRAPH:set_attr $pin  name ""

    Ice:SpacePins $c $elt 1 15
    Ice:SpacePins $c $elt 0 
}


proc Ice:new:pad  {elt c } {
##create a pin and place it on the south side of the pad
    set pin [Ice:AddPin $c $elt  Ice_AnyInputPin  Ice_InputPinOf ]
    eval GRAPH:move_point_to $pin CTR     [GRAPH:get_point $elt S]
    GRAPH:set_attr $pin selectable 0  
    GRAPH:set_attr $pin name PAD  
    GRAPH:set_attr $elt name PAD  
    GRAPH:set_attr $pin showName 0		
}


proc Ice:new:io  {elt c} {
    global GC_state
    set g $GC_state($c,graph)

    set center [GRAPH:get_point $elt CTR]
    set west   [GRAPH:get_point $elt W]
    set westx  [lindex $west 0] 
    set westy  [lindex $west 1] 

    
    UTIL:set snap 0


##Move the pad to the center of the io
    set pad [create $g Ice_Pad {extent 20X20}]
    eval  GRAPH:move_point_to $pad CTR   $center
    Ice:new:pad $pad $c


    set pin [Ice:AddPin $c $elt  Ice_OutputData Ice_OutputPinOf ]
    eval GRAPH:move_point_to $pin CTR [GRAPH:get_point $elt E]
    GRAPH:set_attr $pin selectable 0  

    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    eval  GRAPH:move_point_to $pin CTR   $west
    GRAPH:set_attr $pin selectable 0  

    set pin [Ice:AddPin $c $elt  Ice_AnyInputPin  Ice_InputPinOf ]
    GRAPH:move_point_to $pin CTR     [expr $westx+6] [expr $westy+5]
    GRAPH:set_attr $pin selectable 0  
    GRAPH:set_attr $pin pinType  [Ice:get_pin_type SELECT]

    UTIL:set snap 1

}


proc Ice:new:tribuf  {elt c} {

    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    GRAPH:set_attr $pin selectable 0  


    set pin [Ice:AddPin $c $elt  Ice_AnyInputPin  Ice_InputPinOf ]
    eval   GRAPH:move $pin [GRAPH:get_point $elt N]
    GRAPH:set_attr $pin pinType  [Ice:get_pin_type SELECT]

    set pin [Ice:AddPin $c $elt  Ice_OutputData Ice_OutputPinOf ]
    GRAPH:set_attr $pin selectable 0  


##   Ice:SpacePins $c $elt 1 15
#    Ice:SpacePins $c $elt 0 

}


proc Ice:new:selmux  {elt c} {

    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    GRAPH:set_attr $pin selectable 0  

    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    GRAPH:set_attr $pin selectable 0  


    set pin [Ice:AddPin $c $elt  Ice_AnyInputPin  Ice_InputPinOf ]
    eval   GRAPH:move $pin [GRAPH:get_point $elt N]
    GRAPH:set_attr $pin pinType  [Ice:get_pin_type SELECT]

    set pin [Ice:AddPin $c $elt  Ice_OutputData Ice_OutputPinOf ]
    GRAPH:set_attr $pin selectable 0  


   Ice:SpacePins $c $elt 1 15
   Ice:SpacePins $c $elt 0 

}


proc Ice:new:buf  {elt c} {

    set pin [Ice:AddPin $c $elt  Ice_LeftPin  Ice_LeftPinOf ]
    GRAPH:set_attr $pin selectable 0  


    set pin [Ice:AddPin $c $elt  Ice_OutputData Ice_OutputPinOf ]
    GRAPH:set_attr $pin selectable 0  


    Ice:SpacePins $c $elt 1 15
    Ice:SpacePins $c $elt 0 

}





##This HOOK gets called when a canvas (c) has created a new element elt
##We use this to add on pins, etc. to the new element
proc HOOK:created_elt {elt c} {

    if [UTIL:is_kind_of $elt Ice_Primitive] {
	global Ice_state
##Check for special primitives

	if [UTIL:is_kind_of $elt Ice_Latch] {
	    Ice:new:latch $elt $c
	    return 
	}

	if [UTIL:is_kind_of $elt Ice_TriBuf] {
	    Ice:new:tribuf $elt $c
	    return 
	}

	if [UTIL:is_kind_of $elt Ice_Buffer] {
	    Ice:new:buf $elt $c
	    return 
	}

	if [UTIL:is_kind_of $elt Ice_SelMux] {
	    Ice:new:selmux $elt $c
	    return 
	}

	if [UTIL:is_kind_of $elt Ice_MuxedReg] {
	    Ice:new:muxedreg $elt $c
	    return 
	}


	if [UTIL:is_kind_of $elt Ice_IO] {
	    Ice:new:io $elt $c
	    return 
	}

	if [UTIL:is_kind_of $elt Ice_Pad] {
	    Ice:new:pad $elt $c
	    return 
	}


##Here we use the global numOutput and numInput  variables
##to automatically add on input and output pins 

	set labelPos 1
	if [UTIL:is_kind_of $elt Ice_OutputPort] {set labelPos 3}

	for {set cnt 0;} {$cnt < $Ice_state(numInput)} {incr cnt} {
	    set pin [Ice:AddPin $c $elt  Ice_LeftPin Ice_LeftPinOf ]
	    GRAPH:set_attr $pin selectable 0 		    
	    GRAPH:set_attr $pin showName 0		
	}

	for {set cnt 0;} {$cnt < $Ice_state(numOutput)} {incr cnt} {
	    set pin [Ice:AddPin $c $elt  Ice_OutputData Ice_OutputPinOf ]
	    GRAPH:set_attr $pin selectable 0 		    
	    GRAPH:set_attr $pin showName 0		
	}


	Ice:SpacePins $c $elt 1 
	Ice:SpacePins $c $elt 0 

	global Ice_state

	if $Ice_state(primdialog,show) "Ice:dialog:prim $c $elt"

	return
    }
}




##This runs thru the set of files in the files arg, sources each
##calls  Ice:cache:write 

proc Ice:GenerateCache {files} {
    global Ice_state
    foreach file $files {
	set err [CONFIG:source_file  $file  0 0]
	if {[UTIL:strck $err]} {
	    error   "File: $file\n$err"
	    break
	}

	puts   "Ice:\t Writing cache code for: $file"
	Ice:cache:write
	GRAPH:start delete
	GRAPH:delete [GRAPH:get_graphs]
	GRAPH:stop delete
    }


    exit
}





##This calls the C++ code that runs thru this canvas' graph and
##deletes any edges that are duplicates (i.e., 2 edges connecting 2 pins 
proc Ice:tcl_check_graph {c {deleteDups 0}} {
    global GC_state
    Ice:check_graph $GC_state($c,graph) $deleteDups
}






##Apply a func to all of the objects of type type
proc Ice:apply {func {type Ice_Primitive}} {
    foreach mode [GRAPH:get_graphs] {
	foreach prim [GRAPH:get_elements $mode $type] {
	    eval $func $prim
	}
    }
}


##Applies proc f to all of the pins on the primitive prim
proc Ice:ApplyToPins {prim f {type Ice_Pin}} {
    foreach pin   [GRAPH:succs $prim Ice_PinOf $type] {
	regsub -all {%P} $f  $pin func
	eval $func
    }
}


proc Ice:ApplyToAll {c type f} {
    global GC_state
    foreach elt  [GRAPH:get_elements $GC_state($c,graph) $type] {
	regsub -all {%E} $f  $elt func
	eval $func
    }
}



proc Ice:CopyPin {new  {in_graph 0} {keep_pos 1} } {
    global Ice_state nodes
    GRAPH:set_current 0
    set pins [Ice:find_matching_pins $new $in_graph]
    set didone 0
    foreach target $pins {
	set didone 1
	eval [GRAPH:clone $new]
	set old_loc [GRAPH:get_attr $target origin]
	GRAPH:swap_elt $nodes($new) $target 1
	if {$keep_pos} {
	    eval GRAPH:move  $nodes($new)  $old_loc
	}
    }
    return $didone

}















