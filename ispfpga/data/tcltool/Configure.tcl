



proc CONFIG:called {proc} {
    global CALLED
    if {[info exists CALLED($proc)]} {return 1}
    set CALLED($proc) 1
    return 0
}




proc CONFIG:signal_error {msg} {puts stderr  "Error: $msg"}  ;            


proc CONFIG:add_path {p} {
    global   CONFIG_search_paths 
    AddToList "$p"  CONFIG_search_paths 
}


proc CONFIG:source_file {filename {signal_error 1} {exit_on_error 1} } {    

    set err "";              			                            
    set f  [CONFIG:find_file $filename];                                     
    if [string length $f] {                                                 
	set res ""                                                        
	if [catch "source  $f"  res ] {                                   
	    set err "Sourcing  file -  $f: $res"                          
	    if {$signal_error} {                                            
		CONFIG:signal_error  "$err"                               
	    }                                                               
	    if {$exit_on_error}    {exit 1}                                 
	} else {                                                            
	    return ""                                                     
	}                                                                   
    } else {set err "Unable to locate  file:  $filename"}                 
   if {$signal_error} {CONFIG:signal_error "$err"}                        
   if {$exit_on_error}    {exit 1}                                         
   return $err                                                             
}                                                                           




proc  CONFIG:find_file {filename } {                                    
    global CONFIG_search_paths CONFIG_state;
    foreach path $CONFIG_search_paths {                            
	set full [file join $path $filename];                      
	if [file exists $full] {
	    if $CONFIG_state(verbose) {puts "CONFIG: found file: $full"}
	    return $full
	}           
    }
    return {}                                                     
}


global CONFIG_state CONFIG_search_paths  env
set CONFIG_state(verbose) 0
if {[info exists env(TCL_CONFIG_VERBOSE)  ] } {
    set CONFIG_state(verbose) 1
}


if {![info exists CONFIG_search_paths  ] } {
    set  CONFIG_search_paths [list]                                 
    lappend CONFIG_search_paths  {}              
    if [info exists env(TCL_SEARCH_PATHS)] {                      
	foreach entry [split $env(TCL_SEARCH_PATHS) :] {      
	    lappend CONFIG_search_paths $entry;             
	}
    }                                                             

    lappend CONFIG_search_paths  [file join $env(ATT_ORCA) data tcltool];  
    lappend CONFIG_search_paths  [file join $env(ATT_ORCA) data tclimg];  
}



