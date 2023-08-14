



##This creates the main	mode interface window
proc Ice:mode:create_window {tl	 } {
    global Ice_state

    set	Ice_state(modes) [list]
    set	Ice_state(modes,row) 0
    set	Ice_state(counter) 0
    set	Ice_state(modes,cnt) 0





    set	doc $Ice_state(modes,doc)


    set	mode_f	  [frame $tl.mode_f  -bd 2 -relief raised]
    set	mode_cmds [frame $mode_f.cmds ]
    set	modes	  [frame $mode_f.modes]
    set	Ice_state(modes,frame) $modes



##File things
    set	dataf [frame $tl.dataf -bd 2 -relief raised]
    label  $dataf.l1 -text "Data File Generation"
    pack $dataf.l1 -side top -anchor n

##File generation  frame
    set	genf [frame $dataf.genf]
    pack $genf -side top -expand 1 -fill x


    button $genf.generate_cache	-text "Cache Files" -command "Ice:cache:write"
    button $genf.traverse_path -text "Timing Paths" -command "Ice:traverse_all"
    button $genf.configs -text "Config Strings"	-command "Ice:config:print"
    set	w_grf	[button	$genf.grf_w -text "Write Grf"	 -command  "Ice:CMGRF:Write grf"]
    set	w_cm	[button	$genf.cm_w -text "Write	CM"	 -command  "Ice:CMGRF:Write cm"]
    set	w_both	[button	$genf.both_w -text "Write Both"	 -command  "Ice:CMGRF:Write"]


    grid  $genf.generate_cache $genf.traverse_path $genf.configs   -sticky ew
    grid  $w_grf $w_cm $w_both -sticky ew
    grid columnconfigure $genf 0 -weight 1
    grid columnconfigure $genf 1 -weight 1
    grid columnconfigure $genf 2 -weight 1


    frame $dataf.f
    pack  $dataf.f -fill both -expand 1	 -pady 1

    set	l [label $dataf.f.grf_l	-text "GRF file:"]
    set	e [entry $dataf.f.grf_e	-textvariable Ice_state(grf,filename)]
    set	bb [button $dataf.f.grf_b -text	"Browse" -highlightthickness 0 -bd 1 -command  "Ice:file:set grf {Graphics File:}"]
    grid $l -column 0 -row  0 -sticky e
    grid $e  -sticky ew	-column	1 -row 0
    grid $bb  -column 2	-row 0



    set	l [label $dataf.f.cm_l -text "CM file:"]
    set	e [entry $dataf.f.cm_e -textvariable Ice_state(cm,filename)]
    set	bb [button $dataf.f.cm_b -text "Browse"	-highlightthickness 0 -bd 1 -command  "Ice:file:set cm {CM File:}"]
    grid $l -column 0 -row 1  -sticky e
    grid $e  -sticky ew	-column	1 -row 1
    grid $bb  -column 2	-row 1

    grid columnconfigure $dataf.f 1 -weight 1



    set	name_f [frame $mode_f.name_f]
    pack $name_f -side top -expand 1 -fill x


##    pack [button $name_f.symbols -highlightthickness 0 -bd 1 -text "Define Cell  Symbols"  -command "Ice:symbol:create"]


##Architecture name things
    set	archf [frame $name_f.arch_f]
    set	archl [label $archf.archl -text	"Architecture:"	]
    set	arche [entry $archf.arche -textvariable	Ice_state(arch)	-width 15]
    pack $archl	  $arche  -side	left


##Cell model name stuff
    set	cellf [frame $name_f.cell_f]
    set	celll [label $cellf.celll -text	"    Cell Name:" ]
    set	celle [entry $cellf.celle -textvariable	Ice_state(cellname) -width 15]
    pack $celll	 $celle	-side left


    pack $archf	$cellf -side top -expand 1 -fill x


##Create the mode command widgets
    label $mode_f.l1 -text Modes
    pack $mode_f.l1 -side top -anchor n


    button $mode_cmds.add_mode -text  "New Mode" -command   "Ice:mode:insert  \[Document:create_graph\]	"
    button $mode_cmds.copy_mode	-text "Copy Mode" -command  "Ice:mode:copy "
    grid $mode_cmds.add_mode $mode_cmds.copy_mode   -sticky ew





    grid  [label $modes.l1 -text Select]       -row  $Ice_state(modes,row) -column 3
    grid  [label $modes.l2 -text "Grf Ok"]     -row  $Ice_state(modes,row) -column 4
    grid  [label $modes.l3 -text "Cm Ok"]      -row  $Ice_state(modes,row) -column 5
    incr Ice_state(modes,row)


    set	bottom	  [frame $tl.bottom  -bd 0 ]


    global targetCell
    set	targetCell PFU
    entry $bottom.ncm_l		-textvariable targetCell


    button $bottom.merge	-text "Merge File"	-command "Ice:file:merge"
    button $bottom.write_sel	-text "Write  modes"	-command "Ice:file:write_selected"
    button $bottom.save		-text "Save"		-command "Document:save	$doc"
    button $bottom.saveas	-text "Save as..."	-command "Document:save_as $doc"
    button $bottom.exit		-text "Exit"		-command "Document:close $doc"
    button $bottom.load		-text "Load new	file"	-command "Ice:file:reload"



    grid  $bottom.save	 $bottom.saveas	$bottom.write_sel   -sticky ew
    grid  $bottom.merge	$bottom.load   $bottom.exit	    -sticky ew


    Balloon:help $bottom.write_sel	"Write the set of selected modes"
    Balloon:help $bottom.merge		"Merge file into this session"
    Balloon:help $mode_cmds.copy_mode	"Create	new mode and copy selected modes"
    Balloon:help $mode_cmds.add_mode	"Create	new mode"



    grid columnconfigure $mode_cmds 0 -weight 1
    grid columnconfigure $mode_cmds 1 -weight 1
    grid columnconfigure $bottom 0 -weight 1
    grid columnconfigure $bottom 1 -weight 1

    set	l1 [canvas $mode_f.line_1 -bd 0	  -height 1 -bg	#f4fede]
    set	l2 [canvas $mode_f.line_2 -bd 0	  -height 1 -bg	#f4fede]




    pack $mode_cmds  -side top -expand 1 -fill both
    pack $mode_f.line_1	-side top -expand 1 -fill x -padx 10 -ipady 1 -pady 4
    pack $modes	-side top -expand 1 -fill both
    pack $mode_f.line_2	-side top -expand 1 -fill x -padx 10 -ipady 1 -pady 4

    pack $dataf	$mode_f	 $bottom -side top -expand 1 -fill both	-pady 1	-ipadx 2 -ipady	2


##Now throw all	of the existent	modes into the mode list
    Ice:mode:insert_all


    grid columnconfigure $modes	 2 -weight 1

}


proc Ice:mode:insert_all {} {
##Run through each oif the modes and insert it into the	mode list
    set	graphs [GRAPH:get_graphs]
    foreach g $graphs {
	Ice:mode:insert	$g
    }
}


proc Ice:mode:insert {mode} {
    global Ice_state
##Do we	already	have this mode in the list?
    if [info exists Ice_state(modes,$mode)] {return}


    set	frame $Ice_state(modes,frame)

    Document:changed $Ice_state(modes,doc)

##Set the tcl variables	 for the state of the mode
    set	Ice_state(modes,$mode) $mode
    set	Ice_state(modes,$mode,name)	       [GRAPH:get_attr $mode name]
    set	Ice_state(modes,$mode,modeSelected)    [GRAPH:get_attr $mode modeSelected]
    set	Ice_state(modes,$mode,grfOk)  [GRAPH:get_attr $mode grfOk]
    set	Ice_state(modes,$mode,cmOk)   [GRAPH:get_attr $mode cmOk]

##This is the list of widgets associated with the mode
##We save them so  we can remove them when we remove the mode
    set	Ice_state(modes,$mode,widgets)	[list]

    trace  variable  Ice_state(modes,$mode,name)   w  "Ice:mode:name_change $mode"
    set	sel [checkbutton $frame.sel$Ice_state(counter) -variable  Ice_state(modes,$mode,modeSelected) -command "GRAPH:set_attr $mode modeSelected \$Ice_state(modes,$mode,modeSelected)" ]
    set	grfOk [checkbutton $frame.grfok$Ice_state(counter)  -variable  Ice_state(modes,$mode,grfOk) -command "Ice:ToggleGrfOk $mode" ]
    set	cmOk [checkbutton $frame.cmok$Ice_state(counter)  -variable  Ice_state(modes,$mode,cmOk) -command "Ice:ToggleCmOk $mode" ]

    set	view [button $frame.view$Ice_state(counter) -bitmap [WidgetGfx:get_bitmap_file look.xbm] -command "Ice:mode:show_canvas	$mode "]

    Balloon:help $view	 "Show mode in	canvas"
    Balloon:help $grfOk	 "Is mode  used	when  generating graphics"
    Balloon:help $cmOk	 "Is mode  used	when  generating cm"


    set	mb [eval menubutton  $frame.mb$Ice_state(counter)  -text Tools -menu  $frame.mb$Ice_state(counter).menu	-bd 1 -relief raised]
    set	menu  [menu $mb.menu -font fixed -tearoff 0 -bd	1]

    Ice:mode:add_menu_commands $menu $mode

    set	name [entry	 $frame.name$Ice_state(counter)	-text [GRAPH:get_attr $mode name] -textvariable	Ice_state(modes,$mode,name)]


    set	col 0
    grid $mb   -row  $Ice_state(modes,row) -column $col	-padx 2
    incr col
    grid $view -row  $Ice_state(modes,row) -column $col	-padx 0
    incr col
    grid $name -row  $Ice_state(modes,row) -column $col	-sticky	ew -padx 0
    incr col
    grid $sel  -row  $Ice_state(modes,row) -column $col	-padx 0
    incr col
    grid $grfOk	 -row  $Ice_state(modes,row) -column $col -padx	0
    incr col
    grid $cmOk	-row  $Ice_state(modes,row) -column $col -padx 0

    lappend Ice_state(modes,$mode,widgets) $sel	$mb $name $view	$grfOk $cmOk

    incr Ice_state(modes,row)
    incr Ice_state(counter)
}




proc Ice:mode:show_canvas {mode} {
    global GC_state   Document_state   Ice_state
    set	doc $Ice_state(modes,doc)
    foreach c [GC:get_canvases]	{
	if {[string compare $GC_state($c,graph)	$mode] != 0} {continue;}
	if {[catch "wm deiconify  $GC_state($c,window)"	res]} {continue;}
	raise $GC_state($c,window)
	return
    }
    set	base   [toplevel .gc$GC_state(id)  ]
    set	newc   [GC:create     $doc   $base 1 ]
    GC:set_graph $newc $mode
    GC:set_title $newc {}
}



proc Ice:mode:remove {mode {just_canvas	0} {double_check 1} } {

    if {!$just_canvas && $double_check}	{
	set ck [tk_messageBox -type yesno -default no -message "Are you	sure you want to delete	the  mode?"]
	if {[string compare no $ck]  ==	0} {return}
    }

    global Ice_state  GC_state
    Document:changed $Ice_state(modes,doc)


    foreach c [GC:get_canvases]	{
	if {[string  compare $GC_state($c,graph) $mode]	== 0} {
	    GC:close $c
	}
    }




    if {!$just_canvas} {
	foreach	widget $Ice_state(modes,$mode,widgets) {
	    destroy $widget
	}
	foreach	name [array names Ice_state "modes,$mode*"] {
	    unset Ice_state($name)
	}
	GRAPH:start delete
	GRAPH:delete $mode
	GRAPH:stop delete
    }


}






proc Ice:mode:unique {mode {ask	0} } {
    array names	""
    foreach  prim [GRAPH:get_elements $mode Ice_Primitive] {
	set name [string trim [GRAPH:get_attr $prim name]]
	if [UTIL:strck $name] {
	    if [info exists names($name)] {
		if {$ask} {
		    GRAPH:set_attr $prim hilite	1
		    set	r [tk_messageBox -message "Delete primitive?" -type yesnocancel]
		    GRAPH:set_attr $prim hilite	0
		    if {[string	compare	$r no] == 0} {continue}
		    if {[string	compare	$r cancel] == 0} {return}
		}
		GRAPH:delete $prim
	    } else {
		set names($name) ""
	    }
	}
    }
}


proc Ice:mode:add_menu_commands	{menu mode } {
    $menu add command -label   "Copy to	selected"		-command "Ice:mode:copy_to $mode"
    $menu add command -label   "Delete non-unique primitives"	-command "Ice:mode:show_canvas $mode;Ice:mode:unique $mode 1"
    $menu add command -label   "Delete mode"			-command "Ice:mode:remove $mode"
    $menu add command -label   "Show canvas"			-command "Ice:mode:show_canvas $mode "
    $menu add command -label   "Close canvas"			-command "Ice:mode:remove $mode	1"
}



proc Ice:mode:add_canvas_commands {menu	c } {
    $menu add command -label   "Copy to	selected"		-command "Ice:mode:copy_to \$GC_state($c,graph)"
    $menu add command -label   "Delete non-unique primitives"	-command "Ice:mode:unique \$GC_state($c,graph) 1"
    $menu add command -label   "Delete mode"			-command "Ice:mode:remove \$GC_state($c,graph)"
    $menu add command -label   "Close canvas"			-command "Ice:mode:remove \$GC_state($c,graph) 1"
}



proc Ice:mode:get_selected {} {
    global Ice_state
    set	l [list]
    foreach mode [GRAPH:get_graphs] {
	if {[GRAPH:get_attr $mode modeSelected 0]} {
	    lappend l $mode
	}
    }
    return $l
}




proc Ice:mode:copy { } {
    set	selectedModes [Ice:mode:get_selected]
    set	newMode	[Document:create_graph]
    GRAPH:set_current $newMode
    foreach oldMode  $selectedModes {
	eval  [GRAPH:copy_graph	$oldMode]
    }
    GRAPH:set_current 0
    Ice:mode:insert $newMode
}


proc Ice:mode:copy_to {mode {type VElement}} {
    set	tog  [Ice:mode:get_selected]
    set	elts [GRAPH:get_elements $mode $type]
    foreach  to	 $tog {
	GRAPH:set_current $to
	eval [GRAPH:clone  $elts]
    }
    GRAPH:set_current 0
    Ice:mode:unique $mode
}



proc Ice:mode:name_change {mode	source name op}	{
    global Ice_state
    Document:changed $Ice_state(modes,doc)
    GRAPH:set_attr $mode name $Ice_state(modes,$mode,name)
    Application:apply_to_canvases "GC:set_title	%C {}"

}








proc Ice:ToggleGrfOk {mode} {
    global Ice_state
    Document:changed $Ice_state(modes,doc)
    GRAPH:set_attr $mode grfOk $Ice_state(modes,$mode,grfOk)
}

proc Ice:ToggleCmOk {mode} {
    global Ice_state
    Document:changed $Ice_state(modes,doc)
    GRAPH:set_attr $mode cmOk $Ice_state(modes,$mode,cmOk)
}




proc HOOK:filename_changed {doc	f} {
    wm title .	 "Mode Interface - File: [file tail $f]"
}




proc	 HOOK:write_state {f} {
    global GC_state Ice_state
    puts  $f "global Ice_state;"
    puts  $f "set Ice_state(primdialog,show)   $Ice_state(primdialog,show)"
    puts  $f "set GC_state(select,nottype) \"$GC_state(select,nottype)\" "
    puts  $f "set Ice_state(move,nopin)	   $Ice_state(move,nopin)   "

}



proc Ice:file:comp {f1 f2} {
    return [string compare [string toupper $f1]	[string	toupper	$f2]]
}





##This is legacy code from when	we read	in a pre-existing ncm file
##Currently yhe	IceCMRead code is not being compiled and would need to
##be updated

proc Ice:file:read_ncm { } {
    set	name [tk_getOpenFile -title "Ncm file:"]
    global targetCell
    if [UTIL:strck $name] {
	. config -cursor watch
	update
	Ice:read_ncm $name $targetCell
	Ice:mode:insert
	. config -cursor {}
    }
}






proc Ice:file:set {tag {prompt Filename:}} {
    global Ice_state  Document_state
    set	name [tk_getSaveFile -title "$prompt" -initialfile $Ice_state($tag,filename) ]
    if [UTIL:strck $name] {
	set Ice_state($tag,filename) $name
    }
}





proc Ice:file:load {files} {
    ##GRAPH:start reading
    foreach file $files	{
	set err	[CONFIG:source_file  $file  0 0]
	if {[UTIL:strck	$err]} {
	    tk_messageBox -type	ok -default ok -icon error -message  "File: $file\n$err"
	}
    }
    ##GRAPH:end	reading
}


##This writes out to a file the	set of selected	modes

proc Ice:file:write_selected {}	{
    global Ice_state
    set	name [tk_getSaveFile -title "File to write selected modes to:" ]
    if [UTIL:strck $name] {
	set sel	[Ice:mode:get_selected]
	GRAPH:write_all_graphs "$sel" $name \
"global	Ice_state;\nset	Ice_state(cellname) $Ice_state(cellname); \nset	Ice_state(grf,filename)	 $Ice_state(grf,filename) ; \nset Ice_state(cm,filename)  $Ice_state(cm,filename);\nset	Ice_state(arch)	$Ice_state(arch);"
    }
}







proc Ice:file:merge {} {
    global Document_state
    set	name [tk_getOpenFile -title "File to merge:"   -filetypes $Document_state(file,types)  ]
    if [UTIL:strck $name] {
	set err	[CONFIG:source_file  $name  0 0]
	if {[UTIL:strck	$err]} {
	    tk_messageBox -type	ok -default ok -icon error -message  "$err"
	} else {
	    Ice:mode:insert
	}
    }
}






proc Ice:file:reload {}	    {
    set	new_file  [tk_getOpenFile -title "New Ice  file:"]
    if {![UTIL:strck $new_file]} {return}


    if {![Application:cleanup]}	{return}
    global Ice_state

    foreach mode [GRAPH:get_graphs] {
	Ice:mode:remove	$mode 0	0
    }


    Ice:file:load $new_file
    Ice:mode:insert

}








##Overwrite to get a Mode object as the	graph
proc Document:create_graph {} {
    set	g [GRAPH:create	Ice_Mode  0]
    GRAPH:new_graph $g
    return $g
}


proc GC:set_title {c t}	{
    global GC_state
    set	name [GRAPH:get_attr $GC_state($c,graph) name]
    wm title $GC_state($c,window)   "Mode: $name"
    if [winfo exists	 $GC_state($c,palette_window) ]	{
	wm title $GC_state($c,palette_window) "Tool Palette - $name  "
    }

}



##Overwrite some base functions
proc GC:write_graph {doc filename} {
    global Ice_state

    set	str "# \$Header: /home/dmsys/pvcs/RCSMigTest/rcs/base/pkg/basice/s/RCS/IceModesAndFiles.tcl,v 1.4 2004/12/07 16:44:09 wao Exp $\nglobal Ice_state;\nset Ice_state(cellname)	$Ice_state(cellname);\nset Ice_state(grf,filename)  $Ice_state(grf,filename);\nset Ice_state(cm,filename)  $Ice_state(cm,filename);\nset Ice_state(arch) $Ice_state(arch);\n"

    set	str "$str\n###predefined pin types\narray set pinTypes \"\";"
    foreach type  {Data	Set Reset SetRst Clock CE  Address Write Select	Operand_A Operand_B Carry} {
	set str	"$str\nset pinTypes($type) \t[Ice:get_pin_type $type]"
    }




    set	str "$str\n\n###predefined pin states\narray set pinStates \"\";\n"
    foreach state {Direct Invert Low High}  {
	set str	"$str\nset pinStates($state) \t[Ice:get_pin_state $state]"
    }
    set	str "$str\n\n"


    set	str  "$str\nset	Ice_state(symbols) \[list]\n"
    foreach symbol $Ice_state(symbols) {
	set str	"$str\nlappend Ice_state(symbols) \"$symbol\""
    }




    GRAPH:write_all_graphs "[GRAPH:get_graphs]"	$filename  $str



}





proc Ice:symbol:ok {} {
    global Ice_state
    set	Ice_state(symbols) [list]
    set	row 1
    while {[info exists	Ice_state(symbols,name,$row)]} {
	if [string length [string trim $Ice_state(symbols,name,$row)]] {
	    ##lappend Ice_state(symbols) "$Ice_state(symbols,name,$row)	$Ice_state(symbols,type,$row)"
	    lappend Ice_state(symbols) "$Ice_state(symbols,name,$row)"
	}
	incr row
    }
}


proc Ice:symbol:write {} {
    global Ice_state

    foreach symbol $Ice_state(symbols) {
	set name [lindex $symbol 0]
	##set type [lindex $symbol 1]
puts  stderr  "Writing:	$name $type"
##	Ice:symbol:define $name	$type
	Ice:symbol:define $name
    }
}


proc Ice:symbol:create {} {
    set	tl .symbols
    if [winfo exists $tl] {
	raise $tl
	return
    }
    global Ice_state

    toplevel  $tl
    set	tf [frame $tl.tf -bd 1 -relief raised]
    pack $tf -side top -fill both -expand 1
    grid [label	$tf.l1 -text Name]
    #set col 1
    #foreach type {string int long} {
    #	grid [label $tf.l2$type	-text $type] -row 0 -column $col
    #	incr col
    #}
    for	{set row 1} {$row <= 10} {incr row} {
	set Ice_state(symbols,name,$row) ""
	#set Ice_state(symbols,type,$row) ""
	set name [ entry $tf.name$row -textvariable Ice_state(symbols,name,$row) ]
	#set Ice_state(symbols,type,$row) string
	grid $name  -row $row
	#set col 1
	#foreach type {string int long}	{
	#    set rb [ radiobutton $tf.type$row$type -variable Ice_state(symbols,type,$row) -value $type]
	#    grid $rb -row $row	-column	$col
	#    incr col
	#}
    }
    set	row 1
    foreach symbol $Ice_state(symbols) {
	set Ice_state(symbols,name,$row) [lindex $symbol 0]
	# set Ice_state(symbols,type,$row) [lindex $symbol 1]
	incr row
    }

    set	bf [frame $tl.bf -bd 1 -relief raised]
    pack $bf -side top -fill x -expand 1
    button $bf.ok -text	Ok -command "Ice:symbol:ok; destroy $tl"
    button $bf.apply -text Apply -command "Ice:symbol:ok"
    button $bf.cancel -text Cancel -command "destroy $tl"
    pack $bf.ok	$bf.apply $bf.cancel -side left	-expand	1 -fill	x



}
