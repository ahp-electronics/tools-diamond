##$Header: /users/mni/cvs_repo/ice_porting/release_code/basice/s/IceCmGrf.tcl,v 1.1 2011/06/29 06:55:43 mni Exp $



proc Ice:RunBatchMode {cmfile grffile ifiles } {
    global Ice_state    

##Redefine tkerror so that it does not popup a dialog
    proc tkerror {msg} {puts stderr $msg}
    proc tk_messageBox {args} {tkerror "Error: $args";exit 1;}

#Get the cells from the npread derived file
    Ice:cells:parse


    set files [list]
    set cellNames [list]

    foreach file $ifiles {
	lappend cellNames [string toupper [file tail [file rootname $file]]]
    }

##Now if any of the cells are not in the file issue a warning. Also, reorder the
##ice files on the command line to match the cell order in ncinfo.acd
    foreach cell $Ice_state(np_cells) {
	if {[lsearch $cellNames $cell] == -1} {
	    puts  stderr  "Ice Warning:\tMissing ice file for $cell found in *.cellinfo!"
	}
	set pos [lsearch $cellNames $cell]
	if {$pos >=0} {
	  lappend files [lindex $ifiles $pos]
	}
    }
    puts stderr "Ice:\tIce file command line order now matches *.cellinfo file"


##Now go back and make sure that each file  is in the cells
    foreach file $cellNames {
	if {[lsearch $Ice_state(np_cells)  $file] == -1} {
	    if {!$Ice_state(run,dummy_batch) } {
		puts  stderr  "Ice Warning:\tYou are generating a cm from file: $file that does not have a corresponding cell from the npread information"
	    }
	}
    }

##dpk 2/26/98 -- Leave the files unsorted.  This is necessary to maintain compatability
## between 3C and FPSC libraries (FPSC has extra cells that start with "A"..)

    set done_first 0
    foreach file $files {
##If the file does not exist then we want  to simply create an empty cm
	if [file exists $file] {
	    set err [CONFIG:source_file  $file  0 0]
	    if {[UTIL:strck $err]} {
		error   "File: $file\n$err"
		break
	    }
	    if [info exists Ice_state(arg,arch)] {set Ice_state(arch) $Ice_state(arg,arch)}
	    set empty_cell 0
	} else {
	    set empty_cell 1
	    set Ice_state(cellname)          $file
	}


##Do we override the filename in the cell file with command line arguments?
	if [UTIL:strck $cmfile]  {set Ice_state(cm,filename)  $cmfile}
	if [UTIL:strck $grffile] {set Ice_state(grf,filename)  $grffile}

	if {!$done_first} {
	    set done_first 1
	    if [info exists Ice_state(libfilename)] {
		Ice:cm_write_start   $Ice_state(libfilename)
	    } else {
		Ice:cm_write_start  
	    }

	    Ice:grf_write_start $Ice_state(grf,filename)  

	    puts  stderr  "Ice:\tGenerating  for architecture: $Ice_state(arch)"
	    puts  stderr  "Ice:\tWriting cell model to file: $Ice_state(cm,filename)"
	    puts  stderr  "Ice:\tWriting graphics to file: $Ice_state(grf,filename)"
	}


	puts  stderr  "\n**************************************************"
	set Ice_state(cellname) [string toupper $Ice_state(cellname)]
	if $empty_cell  {
	    puts  stderr "Ice:\tGenerating empty  cell for: $Ice_state(cellname) "
	} else {
	    puts  stderr  "Ice:\tReading cell file: $file"
	}



##Now write the cm
	puts  stderr "Ice:\tGenerating cell model for cell $Ice_state(cellname) from file $file"
	Ice:cm_write    $Ice_state(cellname) 

##Now write out any symbols specified for the cell model
	Ice:symbol:write

	puts  stderr  "Ice:\tGenerating grf for cell $Ice_state(cellname) from file $file"
	Ice:grf_write $Ice_state(cellname)

##Buffer delete calls by setting flag delete
	GRAPH:start delete
	GRAPH:delete [GRAPH:get_graphs]
	GRAPH:stop delete
	puts  stderr  "Ice:\tCompleted cm and grf generation for  $Ice_state(cellname) from file $file"
	puts  stderr  "**************************************************\n"
    }


    Ice:grf_write_finish 
    Ice:cm_write_finish  $Ice_state(cm,filename)  



##Now check to make sure all ports in the np world are accounted for
    Ice:ports:check 

    puts  stderr "\n\nIce:\tbatch generation complete"
    puts  stderr "**************************************************\n"
    exit
}










proc  Ice:config:generate  {config_string_file files } {
    global Ice_state
    set f [open $config_string_file w]
    foreach file $files {
##If the file does not exist then we want  to simply create an empty cm
	set err [CONFIG:source_file  $file  0 0]
	if {[UTIL:strck $err]} {
	    error   "File: $file\n$err"
	    break
	}
	set Ice_state(cellname) [string toupper $Ice_state(cellname)]
	Ice:config:print $f
	GRAPH:start delete
	GRAPH:delete [GRAPH:get_graphs]
	GRAPH:stop delete
	puts $f "***************************"
	puts $f "***************************"
    }
    close $f
    exit
}



proc Ice:config:print {{file stdio}} {
    global couldBeDefaultMap
    foreach mode [GRAPH:get_graphs]  {
	if {![GRAPH:get_attr $mode cmOk]} {continue}
	puts $file "Mode: [GRAPH:get_attr $mode name]"
	foreach prim [GRAPH:get_elements $mode Ice_Primitive] {
	    if {![GRAPH:get_attr $prim cmOk]} {continue}
	    set primName [GRAPH:get_attr $prim name]
	    set didpin 0
	    foreach pin [GRAPH:succs  $prim Ice_PinOf Ice_Pin] {
		if [GRAPH:get_attr $pin selectable] {
		    set pinName [GRAPH:get_attr $pin name]		
		    if {!$didpin}  {
			set didpin 1
			puts  -nonewline $file  "${primName}:\t\{"
		    } else {
			puts  -nonewline $file "|"
		    }
		    set comma ""
		    set pinDefault [GRAPH:get_attr $pin couldBeDflt]
		    if [catch "set defaultName $couldBeDefaultMap($pinDefault)"] {
			set defaultName "0"
		    }

		    if [GRAPH:get_attr  $pin couldBeSig] {puts  -nonewline $file "${comma}$pinName";set comma ,}	
		    if [GRAPH:get_attr  $pin couldBeInv] {puts  -nonewline $file "${comma}INV";set comma ,}	
		    if [GRAPH:get_attr  $pin couldBe0]   {puts  -nonewline $file "${comma}0";set comma ,}	
		    if [GRAPH:get_attr  $pin couldBe1]   {puts  -nonewline $file "${comma}1";set comma ,}	
		    ##If there were no couldbes then print out the pin name
		    if {![UTIL:strck $comma]} {puts  -nonewline $file $pinName} 
		}
	    }
	    if $didpin {
		puts $file  "|prim dflt: [GRAPH:get_attr $prim dfltString]\}"
	    }
	}
    }
}






##0 implies return port id
##1 implies return port type

proc Ice:ports:get {cell port {which 0} } {
    set cell [string toupper [string trim $cell]]
    set port [string toupper [string trim $port]]
    global Ice_state  


#############This is the  cell port  hack work around to be used until the cm 
#############and nph worlds match up wrt port names
    if {$Ice_state(run,dummy_batch) } {
	if {$which != 0} {return 1}
	if {![info exists Ice_state(portcnt,$cell,$port)]} {
##	    if {![info exists Ice_state(port,$cell,$port)]} {
##		puts stderr  "Ice ERROR:\t Cell port $cell::$port does not exist in the nph data file"
##	    }
	    if {![info exists Ice_state(portcnt,$cell)]} {set Ice_state(portcnt,$cell) 0}
	    set Ice_state(portcnt,$cell,$port) $Ice_state(portcnt,$cell) 
	    incr Ice_state(portcnt,$cell) 
	}
	return $Ice_state(portcnt,$cell,$port)
    }


    if {$which == 0} {
	if {![info exists Ice_state(port,$cell,$port)]} {return -1}
	catch "unset Ice_state(portcheck,$cell,$port)"
	return  $Ice_state(port,$cell,$port) 
    } else {
	if {![info exists Ice_state(port,$cell,$port,type)]} {return 0x00}
	return  $Ice_state(port,$cell,$port,type) 
    }
}


proc Ice:ports:get_id {cell port } {
    return [Ice:ports:get $cell $port 0 ]
}


proc Ice:ports:get_type {cell port } {
    return [Ice:ports:get $cell $port 1 ]
}



proc Ice:ports:check {} {

    global Ice_state 

    if {$Ice_state(run,dummy_batch)} {
	return
    }


    set didone 0
    puts stderr "\nIce:\tChecking for nph/cm port mismatches"
    foreach cell $Ice_state(np_cells) {
	foreach port [array names Ice_state "portcheck,$cell,*"] {
	    puts stderr "Ice Warning:\tPort: [lindex $Ice_state($port) 1] on cell:\t[lindex $Ice_state($port) 0] from the nph information was not generated by Ice"
	    set didone 1
	}
    }
    if {!$didone} { 
	puts stderr "\nIce:\tAll ports in the nph data file are accounted for in Ice"
    }

}


##This proc  creates a file of cell information using npread.
##It then opens the file and parses it to create a list of cells
##and also to create a cellXport to numeric identifier mapping
##in Ice_state(port,cell,port)

proc Ice:cells:parse {} {
    global Ice_state env Application_state 
    set Ice_state(np_cells) [list]

##Get the correct npread path
    set npread npread
    set siteparam siteparam
    if [info exists env(ENV)] {
	set npread $env(ENV)/base/pkg/basnpdevice/sun/npread.dbg
        set siteparam $env(ENV)/or5g00/pkg/o5g2ntm/s/siteparam
	puts stderr "Ice:\tENV = $env(ENV)"
    } else  {
	puts  stderr  "Ice Warning:\tNo ENV environment variable set"
    }

    if [info exists env(FOUNDRY)] {
	puts  stderr "Ice:\tFOUNDRY = $env(FOUNDRY)"
    }  else  {
	puts  stderr  "Ice Warning:\tNo FOUNDRY environment variable set"
    }

############### cell port hack -- See above#################
##    puts  stderr  "Ice: WARNING - the generated cell model has bogus cell port ids" 
####################################


    set   cell_info_file Ice_$Ice_state(arch).cellinfo
	set   platform_dir $Application_state(PLATFORM)opt
	puts stderr "### $platform_dir"

    if {!$Ice_state(run,dummy_batch) } {
	puts  stderr   "Ice:\tGenerating np information using:"
##  This is really a kludge and we need to pass these in so we do not have to hardcode this.
        puts  stderr  "    \t${siteparam} -ini ../$platform_dir/cellorder -dxf ../$platform_dir/$Ice_state(arch)01.dxf > $cell_info_file"
        if [catch "exec  ${siteparam} -ini ../$platform_dir/cellorder -dxf ../$platform_dir/$Ice_state(arch)01.dxf > $cell_info_file"  ret] {
	    puts  stderr  $ret
	}
    } else {
	puts  stderr  "Ice:\tRunning in dummy batch mode - ignoring npread information"
	catch "exec  cat /dev/null >  $cell_info_file" 
    }

    puts  stderr  "Ice:\tchmod 644  $cell_info_file" 
    catch "exec  chmod 644  $cell_info_file" 


    set crnt_cell ""
    set port_cnt 0; ##start at 0 ???


    if [file exists $cell_info_file ] {
	set f [open  $cell_info_file r]
	while {![eof $f]} {
	    if {[catch "gets $f line" num]} {
		break
	    }
	    if {$num <= 0} {break}
	    if [regexp {^[ \t]*NP_SITEPARAM:([0-9]+).*<(.*)>} $line match id name] {
		set port_cnt 0; ##start at 0 
		set crnt_cell [string trim [string toupper $name]]
		lappend Ice_state(np_cells) $crnt_cell
	    } elseif  {[regexp {^[ \t]*NP_PINPARAM.*<(.*)>[ \t]*,[ \t]*type([^,]+)} $line match  port type]} {
		set port [string toupper [string trim $port]]
		set Ice_state(port,$crnt_cell,$port) $port_cnt
		set Ice_state(port,$crnt_cell,$port,type) $type
##use this to flag  ports that do not show up in the ice/cm view
		set Ice_state(portcheck,$crnt_cell,$port) "$crnt_cell $port"
		incr port_cnt
	    }
	}
	close $f
    } else {
	puts  stderr "Ice ERROR:\tnpread file: $cell_info_file does not exist!"
    }
}


proc Ice:CMGRF:Write {{which {cm grf}}} {
    global Ice_state 
    . config -cursor watch
    update
    foreach w $which {
	switch $w {
	    cm  {
		if [info exists Ice_state(libfilename)] {
		    Ice:cm_write_start   $Ice_state(libfilename)
		} else {
		    Ice:cm_write_start  
		}
	    }
	    grf {Ice:grf_write_start $Ice_state(grf,filename) }
	}
    }

    Ice:cells:parse 

    foreach w $which {
	Ice:${w}_write       $Ice_state(cellname)
    }

    foreach w $which {
	switch $w {
	    cm  {Ice:cm_write_finish  $Ice_state(cm,filename)}
	    grf {Ice:grf_write_finish }
	}
    }
    . config -cursor {}
}




proc Ice:GenerateTiming {files use_timing_edges} {
    global Ice_state
    foreach file $files {
##If the file does not exist then we want  to simply create an empty cm
	set err [CONFIG:source_file  $file  0 0]
	if {[UTIL:strck $err]} {
	    error   "File: $file\n$err"
	    break
	}
	set Ice_state(cellname) [string toupper $Ice_state(cellname)]
	Ice:traverse_all $use_timing_edges
	GRAPH:start delete
	GRAPH:delete [GRAPH:get_graphs]
	GRAPH:stop delete
    }


    exit
}






proc MyIce:traverse {c} {
    global GC_state Ice_state
    Ice:traverse $Ice_state(cellname)          $GC_state($c,graph)
}



proc Ice:traverse_all {{use_timing_edges 0}} {
    global GC_state Ice_state
    foreach mode [GRAPH:get_graphs] {
	Ice:traverse 	$Ice_state(cellname) $mode $use_timing_edges
    }
}
