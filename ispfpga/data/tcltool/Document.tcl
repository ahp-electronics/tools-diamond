


proc Document:changed {doc} {
    global Document_state
    set Document_state($doc,changed) 1    
}



proc Document:data_changed {data} {
    foreach doc [Document:find_doc_with_data $data] {
	if [UTIL:strck $doc] {
	    Document:changed $doc
	}
    }
}


proc Document:find_doc_with_data {data} {
    global Document_state     Document_array
    foreach doc [array names Document_array] {
	if {[string compare [string trim $data]  [string trim $Document_state($doc,data)] ] == 0} {
	    return $doc
	}
    }
    return ""
}


proc Document:write {doc file} {}


proc Document:create_graph {} {
    set g [GRAPH:create VElement  0]
    GRAPH:new_graph $g
    return $g
}


proc Document:int_open {write_proc {proj ""} } {
    global Document_state
    set name [tk_getOpenFile -title "Open new document" -filetypes $Document_state(file,types)  ]
    if {[UTIL:strck $name] == 0} {return 0}
    Document:new -file $name  -write_proc $write_proc -project $proj
}


proc Document:open {doc {proj ""} } {
    global Document_state
    Document:int_open $Document_state($doc,write_proc) $proj
}



proc Document:merge {doc} {
    global Document_state
    set name [tk_getOpenFile -title "Merge file" -filetypes $Document_state(file,types)  ]
    if {[UTIL:strck $name] == 0} {return 0}
    Document:new -file $name  -write_proc $Document_state($doc,write_proc) -project $proj
}




proc Document:new args {

    set specs {
	{-file "" "" ""}
        {-write_proc "" "" "Document:write"}
        {-project  "" "" ""}
        {-make_canvas "" "" "1"}
        {-make_graph "" "" "1"}
	{-source_file "" "" "1"}
	{-keepcanvas "" "" "0"}
    }

    set w Document_privVar
    upvar #0 $w data
    tclParseConfigSpec $w $specs "" $args



    set g 0
    if $data(-make_graph) {
	set g [Document:create_graph]
    }


    global gDocInfo Document_state  Application_state
    set doc_id $Application_state(doc,count) 

    incr  Application_state(doc,count) 

    GRAPH:set_current $g

    set doc [Document:create $doc_id  $g $data(-file) $data(-write_proc) $data(-project)]


    array set gDocInfo ""


    if {[UTIL:strck $data(-file)]  &&  $data(-source_file) } {
	set err [CONFIG:source_file  $data(-file)  0 0]
	if {[UTIL:strck $err]} {
	    tk_messageBox -type ok -default ok -icon error -message  "$err"
	}
    }



    foreach name [array names gDocInfo]  {
	set Document_state($doc,$name) $gDocInfo($name)
    }


    Document:set_file_proj $doc

    if {$data(-make_canvas)} {
	global  GC_state  
	set tl    [toplevel .gc$GC_state(id)  ] 
	set dummy [frame $tl.dummy_frame]
	set c     [GC:create  $doc_id  $tl 1  ]
	bind $dummy <Destroy>     "Document:remove_canvas $doc $c"
	Document:add_canvas  $doc $c
    }


    GRAPH:set_current 0 


    return $doc
}



proc Document:get_project {doc} {
    global Document_state  
    if {![UTIL:strck  $Document_state($doc,project,name)]} {return untitled}
    return     $Document_state($doc,project,name)
}



proc Document:create {doc  data {filename ""} {write Document:write} {proj ""}  } {    
    global Document_state  ${doc}_canvas_array
    array set   ${doc}_canvas_array ""

    set Document_state($doc,filename) $filename
    set Document_state($doc,project,name)  $proj
    set Document_state($doc,project,version)  1
    set Document_state($doc,project,rev)      1


    set Document_state($doc,data) $data    
    set Document_state($doc,write_proc) $write

    set Document_state($doc,canvases)  "${doc}_canvas_array"

    set Document_state($doc,rev) 0
    set Document_state($doc,archive) ""

    set Document_state($doc,changed)  0
    global Document_array

    if {![info exists Document_array]} {array set Document_array ""}

    set Document_array($doc) $doc

    Document:set_file_proj $doc "$filename" "$proj"

    return $doc

}





proc Document:save {doc} {
    global Document_state
    set name  $Document_state($doc,filename)
#if bad name call save_as proc which will get good name 
#and will call this proc back
    if {[UTIL:strck $name ] == 0} {
	if {!  [Document:save_as $doc ]} {return 0}
	return 1
    }


    
    $Document_state($doc,write_proc) $doc  $Document_state($doc,filename)


    set Document_state($doc,changed) 0
    return 1
}


proc Document:save_as {doc} {
    global Document_state
    set name [tk_getSaveFile -initialfile $Document_state($doc,filename) -title "Save document as" -filetypes $Document_state(file,types)]
    if {[UTIL:strck $name] == 0} {return 0}
    if {[file exists $name ] && ![file writable $name]} {
	tk_messageBox -icon error -type ok -default ok -message "File $name cannot be written to."
	return 0;
    } 


    Document:set_filename $doc $name
    Document:save $doc
    return 1
}


proc Document:set_file_proj {doc {filename ""}  {proj ""} } {
    global Document_state

    if {![UTIL:strck $filename]} {set filename  $Document_state($doc,filename)}
    if {![UTIL:strck $proj]}     {set proj      $Document_state($doc,project,name)}

    regsub  -all {[^a-zA-Z0-9_]+}  "$proj" "" proj
    if {![UTIL:strck $filename]} {
	if {[UTIL:strck $proj]} {set filename $proj.flow}
    } else {
	if {![UTIL:strck $proj]} {
	    set proj  [file tail $filename]
	    regsub -all {\..*$} "$proj" "_proj" proj
	}
    }

    set Document_state($doc,project,name)   "$proj"
    set Document_state($doc,filename)  "$filename"

    if {![UTIL:strck $proj]}     {set proj untitled}
    if {![UTIL:strck $filename]} {set filename untitled}

    Document:apply_to_canvases $doc "GC:set_title \$c \"Project:$proj    File:$filename\" "
    
}


proc HOOK:filename_changed {doc f} {}
proc Document:set_filename {doc f} {HOOK:filename_changed $doc $f;Document:set_file_proj $doc $f ""}
proc Document:set_projname {doc p} {Document:set_file_proj $doc "" "$p"}



proc Document:close {doc {force 0}  } { 
   global Document_state
   if {$Document_state($doc,changed)  && !$force} { 
	set name $Document_state($doc,filename)
	if {[UTIL:strck $name] == 0} {set name  untitled}
	set ret [tk_messageBox   \
		-message "Save changes to: $name" \
		-type yesnocancel \
		-default yes \
		-icon question  \
		]

	case $ret {
	    cancel {return 0}
	    yes {
		if { [Document:save $doc] == 0} {return 0}
	    }
	}
    }

    set Document_state($doc,changed) 0
    Document:apply_to_canvases $doc "GC:close \$c 0"
    global Document_array
    catch     "unset Document_array($doc)"

    if {[array size Document_array] <=0} {
	Application:exit
    }
    return 1
}



proc Document:add_canvas {doc c} {
    global Document_state 
    set cvs  $Document_state($doc,canvases)
    global $cvs
    set ${cvs}($c) $c
    
    set filename $Document_state($doc,filename)
    set proj $Document_state($doc,project,name)

    if {![UTIL:strck $proj]}     {set proj untitled}
    if {![UTIL:strck $filename]} {set filename untitled}

    GC:set_title $c "Project:$proj     File:$filename"


}


proc Document:apply_to_canvases {doc cmd} {
    global Document_state GC_state
    set cvs $Document_state($doc,canvases)
    global $cvs
    foreach c [array names $cvs] {
	if {[GC:valid_canvas $c]}  {
	    regsub -all {%C} "$cmd" "$c" ncmd
	    eval "$ncmd"
	} else {
	    unset ${cvs}($c)
	}
    }
}


proc Document:remove_canvas {doc c} {
    global Document_state Application_state
    set cvs $Document_state($doc,canvases)
    global $cvs




##If this is the last canvas on this DOC then 
##close the DOC and tell the caller not to kill their window
    set cnt [array size $cvs] ;
    if {$cnt  <= 1 && $Application_state(exit_on_no_canvas) } {
	Document:close $doc
	return 0
    }  else {
	##Remove the ptrs to this canvas in the C++ world
	CANVAS:delete $c
	catch "unset ${cvs}($c)"
	return 1
    }

}






proc Application:key_press {k} {
    global  Application_state
    switch $k {
	Shift_L {UTIL:set_flag move_hint 1;UTIL:set_flag die_hint 1;set Application_state(key,shift) 1}
	Shift_R {UTIL:set_flag move_hint 1;UTIL:set_flag die_hint 1;set Application_state(key,shift) 1}
	Alt_L   {set Application_state(key,alt) 1}
	Alt_R   {set Application_state(key,alt) 1}
	Control_L   {set Application_state(key,control) 1}
	Control_R   {set Application_state(key,control) 1}
    }
}


proc Application:double { {v 1} } {
    global  Application_state
    set Application_state(button,double) $v
}    

proc Application:key_release {} {
    global GC_state  Application_state
    if $Application_state(key,shift)  {
	UTIL:set_flag move_hint $GC_state(move_hint);
	UTIL:set_flag die_hint $GC_state(die_hint);
	set Application_state(key,shift) 0
    }

    if $Application_state(key,alt)  {
	set Application_state(key,alt) 0
    }

    if $Application_state(key,control)  {
	set Application_state(key,control) 0
    }

}





proc Application:num_open_docs {} {
    global Document_array
    set cnt 0
    foreach doc [array names Document_array] {
	incr cnt
    }
    return $cnt
}


proc Application:cleanup {} {
    global Document_array
    foreach doc [array names Document_array] {
	Document:apply_to_canvases $doc "raise \$GC_state(\$c,window)"
	if {![Document:close $doc]} {
	    return 0
	}
    }
    return 1
}





proc Application:exit {{doCheckSave 1}  } {
##if doCheckSave then we ask each of the documents to close themselves
##if any say no then we do not exit the application 
    if {$doCheckSave} {
	if {[Application:cleanup] == 0} {return}
    }
    destroy .
}


proc Application:apply_to_canvases {cmd} {
    global Document_array
    foreach doc [array names Document_array] {
	Document:apply_to_canvases $doc "$cmd"
    }

}



proc Application:save_init {} {
    global Application_state
    
    set name [tk_getSaveFile -initialfile [file join ~ .$Application_state(name)_init.tcl] -title "Save initialization file as"]
    if {[UTIL:strck $name] == 0} {return 0}
    if {[file exists $name ] && ![file writable $name]} {
	tk_messageBox -icon error -type ok -default ok -message "File: $name, is not writable"
	return 
    }

    set f [open $name w]
    GC:write_init $f
    close $f
}



proc Application:init_once {} {
    
    if [CONFIG:called Application] {return}

    global Application_state   Document_state
    

    set Document_state(file,types) {}

    set Application_state(doc,count) 0
    set Application_state(exit_on_no_canvas) 1

    set Application_state(counter) 0
    set Application_state(name) app
    set Application_state(key,alt) 0
    set Application_state(key,control) 0
    set Application_state(key,shift) 0
    set Application_state(button,double) 0

    set Application_state(path,htmlbrowser)  netscape
    set Application_state(path,pdfbrowser)   acroread
    set Application_state(path,perl)         perl

}

Application:init_once 



