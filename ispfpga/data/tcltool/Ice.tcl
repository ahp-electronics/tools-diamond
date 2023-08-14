


##Source the graph canvas code  and Help code (from bastktool) 
CONFIG:source_file GC.tcl
CONFIG:source_file Help.tcl


##This has support (now not really needed) for defining the meta-type library
##names on primitives
CONFIG:source_file IceLib.tcl


##This file contains the tcl procs that allow us to
##generate cell model and grf files
CONFIG:source_file IceCmGrf.tcl



##This has basic editing and canvas window code (e.g., menu bar, pull down menus, etc)
CONFIG:source_file IceEdit.tcl

## This file has various procs that deal with primitives and pins including
##  Primitive, Pin and Shape dialog boxes
##  Creating new primitives and pins
CONFIG:source_file IcePrimsAndPins.tcl



## This file has the main mode interface code and file handling code
CONFIG:source_file IceModesAndFiles.tcl


CONFIG:source_file IceCache.tcl




proc Ice:usage {} {
puts stderr {
    Usage: ice 
    [-cache ]                (generate the cache code)
    [-tcl tcl_code]          (execute arbitrary tcl code)
    [-c config_string_file]  (generate config strings )
    [-t ]                    (run timing path generator)
    [-t2 ]                   (run timing path generator using timing edges)   
    [-v ]                    (verbose - for timing path this generates sterlings stuff)
    [
    	[-d |  -b ]                (generate cm and grf -d -> dummy (no npread call) -b -> full generation) 
    	[-arch <architecture>]     (what architecture are we generating for)
    	[-cm <cm_file_name>]       (name of the cell model file we write to)
	[-grf <grf_file_name>] 	   (name of the grf file we write to)
    	[-lib <library file name>] (the ncm library file to use for meta-types)
    ] 
    [design_files (*.ice)]
}

    exit
}





##This proc  parses the command line arguments and builds the UI (or runs the 
##batch mode routines

proc Ice:init_once {} {

##If for some reason we have already been here then don't call init again
if [CONFIG:called Ice] {return}


##These are globals from tcl
global argv argc  env  

##These are global associative arrays  from bastktool 
global Application_state  GC_state  Document_state     

##This is a  global associative arrays  used locally
global Ice_state


set Application_state(name) Ice 



##Do some bastktool initializations
GC:init_options

##Color me yellow
GC:init_bg #f4fede

##Source the  options files (the 0 0 says to ignore any errors)
CONFIG:source_file  IceOptions.tcl  0 0
CONFIG:source_file  .IceOptions.tcl  0 0



##Create any Ice specific commands (in IceEdit.tcl)
Ice:define_commands



#Set the predefined entries in the palette

set  GC_state(fixed_palette)  [ list   \
	{new_menu} \
	{label   "Editing Tools"} \
	{command "Select"        "GC:dflt_bindings %C" select.xbm} \
	{command "Move"          "GC:cmd_exec %D %C move_elt" move.xbm} \
	{command "Delete Node"   "GC:cmd_exec %D %C delete_node" delete.xbm} \
        {command "Delete Edge"   "GC:cmd_exec %D %C delete_edge" delete.xbm} \
	{new_menu} \
	{label "Edges"} \
	{command Connection          {Ice:init_add_element %C Ice_Connection} "edge.xbm"} \
	{command ClockConnection     {Ice:init_add_element %C Ice_ClockConnection} "edge.xbm"} \
	{command Attachment          {Ice:init_add_element %C Ice_Attachment} "edge.xbm"} \
	{command AttributeOf          {Ice:init_add_element %C Ice_AttributeOf} "edge.xbm"} \
	{command "Timing Edge"       {Ice:init_add_element %C Ice_TimingEdge} "edge.xbm"} \
	{new_menu} \
	{label "Basic Primitives"} \
        {command Attribute      {Ice:init_add_element %C Ice_AttributePrim   {} 0 0} } \
        {command ModeBox        {Ice:init_add_element %C Ice_ModeBox         {} 0 0} } \
	{command BlackBox       {Ice:init_add_element %C Ice_BlackBox        {} 0 0} } \
	{command FlipFlop       {Ice:init_add_element %C Ice_FlipFlop         }} \
	{command Latch          {Ice:init_add_element %C Ice_Latch           {{extent 60X80}} } } \
	{command Lut            {Ice:init_add_element %C Ice_Lut               }} \
	{command TriBuf         {Ice:init_add_element %C Ice_TriBuf            }} \
	{command Buffer         {Ice:init_add_element %C Ice_Buffer            }} \
	{command MuxedReg       {Ice:init_add_element %C Ice_MuxedReg    { {extent 60X80}} } } \
	{command Alu            {Ice:init_add_element %C Ice_Alu    { {extent 60X80}} } } \
	{command Delay          {Ice:init_add_element %C Ice_Delay    { {extent 60X40}} } } \
	{command IO             {Ice:init_add_element %C Ice_IO    { {extent 25X25}} } } \
	{command PAD            {Ice:init_add_element %C Ice_Pad    { {extent 20X20}} 0 0 } } \
	{new_menu} \
	{label "Muxes"} \
	{command Mux            {Ice:init_add_element %C Ice_Mux    {{extent 20X30}} 1 }  mux.xbm } \
	{command "2-input Mux"  {Ice:init_add_element %C Ice_Mux    {{extent 20X40}} 2 }  mux.xbm } \
	{command "3-input Mux"  {Ice:init_add_element %C Ice_Mux    {{extent 20X60}} 3 }  mux.xbm } \
	{command "4-input Mux"  {Ice:init_add_element %C Ice_Mux    {{extent 20X80}} 4 }  mux.xbm } \
	{command DeMux          {Ice:init_add_element %C Ice_DeMux  {{extent 20X30}} 1 }  mux.xbm } \
	{command SelMux         {Ice:init_add_element %C Ice_SelMux {{extent 20X30}} 1 }  mux.xbm } \
	{new_menu} \
	{label "Gates"} \
	{command AndGate        {Ice:init_add_element %C Ice_AndGate }} \
	{command OrGate         {Ice:init_add_element %C Ice_OrGate  }} \
	{new_menu} \
	{label   Ports} \
	{command "Input Port"   {Ice:init_add_element %C Ice_InputPort } "cellpin.xbm"}\
	{command "Output Port"  {Ice:init_add_element %C Ice_OutputPort {} 1 0} "cellpin.xbm"}\
	{new_menu} \
	{label   Pins} \
	{command "Input Clock"      {Ice:init_add_clock    %C} "clock.xbm"} \
	{command "Input Data"       {GCMD:init_add_element %C Ice_LeftPin   } "pin.xbm"}\
	{command "Any Input Pin"    {GCMD:init_add_element %C Ice_AnyInputPin   } "pin.xbm"}\
	{command "Output Data"      {GCMD:init_add_element %C Ice_OutputData {{selectable 0}} } "pin.xbm"}\
	{new_menu} \
	{label   Shapes} \
	{command Rectangle   	{GCMD:init_add_element %C Ice_Rectangle} }\
	{command Oval   	{GCMD:init_add_element %C Ice_Oval} }\
	{command Text   	{GCMD:init_add_element %C Ice_Text} }\
	{command Polygon   	{GCMD:init_add_element %C Ice_Polygon} }\
]





##These are the attributes we pass to the c code when an element is created
##It is used to initialize the sel flag and the hilite flags to FALSE
set GC_state(fixed_args) { {sel 0} {hilite 0} }

##THis is the default size of the canvas screen 
set GC_state(dflt_region)   {0 0 2500 5000} 

##When we do file things this is sued in the file dialog
set Document_state(file,types) [list  {"Ice files" .ice} {"Any" *}]


##The symbol stuff is currently not used but can be used to create Cell model
##symbol tables
set Ice_state(symbols) [list]



##This says do we popup the primitive dialog every time we add a new prim
set Ice_state(primdialog,show)  1

##Do we let users move the pins arbitrarily or with a shift button
set Ice_state(move,nopin)   1
Ice:LockPins
set GC_state(move,shift,type) Ice_Pin
set GC_state(move,nottype)    Ice_Pin


##Various vars used in Ice
set Ice_state(grf,filename) lbe.grf
set Ice_state(cm,filename) test.ncm
set Ice_state(cellname) PFU
set Ice_state(numInput) 0
set Ice_state(numOutput) 0
set Ice_state(verbose) 0

##Don't show the new, save , save as file menu
set GC_state(menu,show,io) 0


#Read in the user's init file 
CONFIG:source_file  [file join ~ .$Application_state(name)_init.tcl]  0 0




##Parse the arg vector
array set myargs ""
set myargc 0
foreach arg $argv {
    set myargs($myargc) $arg
    incr myargc
}

set files [list]
set firstFile ""

set Ice_state(cmfile)  ""
set Ice_state(grffile) ""


set Ice_state(run,dummy_batch) 0
set Ice_state(run,batch) 0


set Ice_state(run,generate_timing) 0
set use_timing_edges  0


set Ice_state(run,config_string) 0
set Ice_state(run,config_string_file) ""

set Ice_state(run,cache) 0


##Now run through the args 
set idx 0
while {$idx < $myargc} {
    set arg $myargs($idx)
    incr idx
    switch -- $arg {
	-tcl {
	    if {$idx == $myargc} {Ice:usage }
	    if [catch "eval  $myargs($idx)" res] {
		tk_messageBox -icon error -type ok -default ok -message "$res"
	    }
	    incr idx
	}

	-cache {set Ice_state(run,cache) 1}

	-t  {
	    set Ice_state(run,generate_timing) 1
	}

	-t2 {
	    set Ice_state(run,generate_timing) 1;
	    set use_timing_edges  1
	}

	-c {
	    if {$idx == $myargc} {Ice:usage }
	    set Ice_state(run,config_string_file) $myargs($idx)
	    incr idx
	    set Ice_state(run,config_string) 1
	}


	-v {set Ice_state(verbose)  1}

	-b {set Ice_state(run,batch) 1}


	-lib {
	    if {$idx == $myargc} {Ice:usage }
	    if [file exists $myargs($idx)] {
		set Ice_state(libfilename)   $myargs($idx)
	    } else {
		puts  stderr   "Ice: \tERROR: Library file: $myargs($idx) does not exist"
		exit 1
	    }
	    incr idx
	}


	-d {
	    set Ice_state(run,dummy_batch) 1
	    set Ice_state(run,batch) 1
	}

	-cm {	    
	    if {$idx == $myargc} {Ice:usage }
	    set Ice_state(cmfile)  $myargs($idx)
	    incr idx
	}

	-arch {	    
	    if {$idx == $myargc} {Ice:usage }
 	    set Ice_state(arg,arch)  $myargs($idx)
            set Ice_state(arch)  $myargs($idx)
	    incr idx
	}


	-grf {	    
	    if {$idx == $myargc} {Ice:usage }
	    set Ice_state(grffile)  $myargs($idx)
	    incr idx
	}


	default {
	    if [regexp "^\-" $arg] {
		Ice:usage 
	    } else {
		if {![UTIL:strck  $firstFile ]} {
		    set firstFile $arg
		}
		lappend files  $arg
	    }
	} 
    }
}

##Set the global verbose message flag (for cm, grf and path generation)
if {$Ice_state(verbose)} {
    Ice:set_verbose
}


if {$Ice_state(run,batch)} {
    Ice:RunBatchMode  $Ice_state(cmfile) $Ice_state(grffile) $files 
}



if {$Ice_state(run,generate_timing)} {
    Ice:GenerateTiming $files $use_timing_edges
}





if {$Ice_state(run,cache)} {
    Ice:GenerateCache $files
}



if {$Ice_state(run,config_string)} {
    if [regexp {.*\.ice} $Ice_state(run,config_string_file)] {
	puts stderr "Error: The config string file you specified ends in .ice -- do you really want to do this?"
	Ice:usage
   }
   Ice:config:generate   $Ice_state(run,config_string_file) $files
}


##Here we are running normally


##We don't want to exit the app when all of the canvases go away
set Application_state(exit_on_no_canvas)  0

wm title .   "Ice Modes - File: $firstFile"

Ice:file:load $files


##Create a new document
set Ice_state(modes,doc) [Document:new  -file $firstFile  -write_proc GC:write_graph -make_graph  0 -make_canvas 0 -source_file 0]

##now create the main window
Ice:mode:create_window  "" 

}






Ice:init_once 










