package provide runcmd 1.0.0

set pending_cmd ""

proc checkResult {result}  {
    if {$result == 0} {
        puts "End process: completed successfully.\n"
        return 0
    } else {
        puts stderr "End process: failed with exit code $result.\n"
        return 1
    }
}

proc runCmd {command {echo 1}} {
    global done
    global tcl_platform

    if {$echo} {
        puts "Starting process: '$command'"
    }
    if [catch {open "|$command |& more"} pipe] {
        puts stderr "Error: $pipe"
        return 1
    } else {
        set done -1
        fileevent $pipe readable [list Reader $pipe]

        switch $tcl_platform(platform) {
            windows {
                fconfigure $pipe -blocking 0 -translation crlf
            }
            unix {
                fconfigure $pipe -blocking 0 -translation lf
            }
            default {
                fconfigure $pipe -blocking 0 -translation auto
            }
        }
    }
    return 0
}

proc Reader {pipe} {
    global done
    if {[eof $pipe]} {
        set done [catch {close "$pipe"} ]
        return
     }
    if {[gets $pipe line] < 0} {
    } else {
        puts "$line"
    }
}

proc execCmd {command} {
    global done

    if [catch {runCmd "$command" 0} result] {
        puts "execCmd: failed - $result\n"
        return 1
    } else {
        if {$result == 0} { vwait done }
        return $result
    }
}

proc isp_unknown {args} {

    if {![info exists auto_noexec]} {
        set name $args
        if {[string index $name 0] == "\{"} {set name [string range $name 1 end-1]}
	    set new [auto_execok [lindex $name 0]]
	} else { set new "" }

    if {[lindex $args 1]=="="} {
       # maybe an assignment like "x = 3+4" ? (Blanks matter!)
       upvar [lindex $args 0] _x
       set rest [lrange $args 2 end]
       if [llength [info commands [lindex $args 2]]] {
          return [set _x [uplevel eval $rest]]
       }
       set _x $rest                ;# this should always work...
       catch {set _x [expr $rest]} ;# ...but maybe expr is happy
       return $_x
    } elseif {[regexp {^([^ ]+)\+\+$} $args -> vname]} {
       uplevel [list incr $vname]  ;# allow things like "i++" ...
    } elseif {[regexp {^([^ ]+)--$} $args -> vname]} {
       uplevel [list incr $vname -1]          ;# ... or "j--"
    } elseif {[regexp {^[-+/\*\.0-9 ()]+$} $args]} {
       return [expr $args]         ;# pure expression? "(17+4)/3"
    } elseif {[string compare {} $new]} {
	   set cmd "$new [lrange $name 1 end]"
       return [execCmd "$cmd"]
	} else {uplevel 1 _unknown $args}    ;# let old "unknown" do it
}

proc callbrowser {command url} {
    global tcl_platform

    regsub -all "\\\\" $url "/" url
    if [catch {open "|$command $url |& more"} pipe] {
        return 1
    } else {
        return 0
    }
}

proc dump2log {filename} {

    if {[file exist $filename] == 1 } {
       if {[catch {set fid [open $filename]} msg]} {
          puts "There was an error opening file \"$filename\"; $msg."
          return -1
       } else {
          foreach line [split [read $fid] \n] {
             puts $line
          }
          close $fid
       }
    }
}