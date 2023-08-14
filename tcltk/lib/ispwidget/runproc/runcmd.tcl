package provide runcmd 1.0.0

set pending_cmd ""

proc checkResult {result}  {
    if {$result == 0} {
        puts "\nDone: completed successfully.\n"
        return 0
    } else {
        puts stderr "\nDone: failed with exit code $result.\n"
        return 1
    }
}

proc runCmd {command {echo 1}} {
    global done
    global tcl_platform

    #tk_messageBox -message $command -title "Command"

    if {$echo} {
        puts "Starting: '$command'"
    }
    if [catch {open "|$command |& more"} pipe] {
        puts stderr $pipe
        return 1
    } else {
        set done -1
        fileevent $pipe readable "Reader $pipe"
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

proc ispWriteConstraint {secName keyName stringValue fileName} {
#
#   Read file into memory
#
    if {$secName == ""} {
        puts "Error: No section specific"
        return false
    } else {
        append sec "\[" [string trim $secName] "\]"
    }

    if {$keyName == ""} {
        puts "Error: No key specific"
        return false
    } else {
        set key [string trim $keyName]
    }

    set value [string trim $stringValue]

    if {$fileName == ""} {
        puts "Error: No constraint file given"
        return false
    } else {
        set file [string trim $fileName]
    }

    if {[catch {set fid [open $file r]} msg]} {
        puts "Error: $msg."
        return false
    } else {
        set data [read $fid]
        close $fid
     }

    if {[catch {set ofid [open $file w]} msg]} {
        puts "Error: $msg."
        return false
    }
#
# Start with section
#
    set chk_section true
    set chk_key false
    set chk_end false

    foreach line [split $data \n] {
        string trim $line

        if {$chk_end} {
            if {[string index $line end] == ";"} { set chk_end false }
            if {[string index $line 0] == "\["} { set chk_end false }
            continue
        }

        if {$chk_key} {
            set linekey [string trim [lindex [split $line "="] 0]]
            if {[string compare -nocase $key $linekey] == 0} {
                set chk_key false
#                puts "Debug:key found - > $line"
                if {$value != ""} {
                    append newline $key " = " $value ";"
#                    puts "Debug:newline - > $newline"
                    puts $ofid $newline
                }
                if {[string index $line end] != ";"} {
                    set chk_end true
                }
                continue
            } else {
                if {[string match {\[*} $line]} {
                   set chk_key false
                   if {$value != ""} {
                        append newline $key " = " $value ";"
#                        puts "Debug:newline - > $newline"
                        puts $ofid $newline
                    }
                }
            }
        }

        if {$chk_section} {
            if {[string equal -nocase $line $sec]} {
                set chk_section false
                set chk_key true
                puts $ofid $line
#                puts "Debug:Section found - > $line"
                continue
            }
        }

        puts $ofid $line
    }
#
#   Did not find section
#   Add section and key=value if value != ""
#
    if {$chk_section} {
        if {$value != ""} {
            puts $ofid $sec
            append newline $key " = " $value ";"
#            puts "Debug:newline - > $newline"
            puts $ofid $newline
        }
    }

    close $ofid
}

proc ispReadConstraint {secName keyName stringValue fileName} {
    set value $stringValue

    if {$secName == ""} {
        puts "Error: No section specific"
        return $value
    } else {
       append sec "\[" [string trim $secName] "\]"
    }

    if {$keyName == ""} {
        puts "Error: No key specific"
        return $value
    } else {
        set key [string trim $keyName]
    }

    if {$fileName == ""} {
        puts "Error: No constraint file specfic"
        return $value
    } else {
        set file [string trim $fileName]
    }
#
#   Read file into memory
#
    if {[catch {set fid [open $file r]} msg]} {
        puts "Error: $msg."
        return $value
    } else {
        set data [read $fid]
        close $fid
    }
#
# Start with section
#
    set chk_section true
    set chk_key false
    set chk_end false
    foreach line [split $data \n] {
        set line [string trim $line]
        #puts "Debug:line - > $line"

        if {$chk_end} {
            if {[string index $line end] == ";"} {
                append value " " [string range $line [expr {[string first "=" $line]+1}] end-1]
                set value [string trim $value]
                return $value
            } else {
                append value " " [string range $line [expr {[string first "=" $line]+1}] end]
                set value [string trim $value]
                set chk_end true
            }
        }

        if {$chk_key} {
            set linekey [string trim [lindex [split $line "="] 0]]
            if {[string compare -nocase $key $linekey] == 0} {
                set chk_key false
                #puts "Debug:key found - > $line"
                if {[string index $line end] == ";"} {
                    set value [string range $line [expr {[string first "=" $line]+1}] end-1]
                    set value [string trim $value]
                    return $value
                } else {
                    set value [string range $line [expr {[string first "=" $line]+1}] end]
                    set value [string trim $value]
                    set chk_end true
                }
            }
        }

        if {$chk_section} {
            if {[string equal -nocase $line $sec]} {
                set chk_section false
                set chk_key true
                #puts "Debug:Section found - > $line"
            }
        }
    }
    return $value
}

proc callbrowser {command url} {
    global tcl_platform

    #tk_messageBox -message $command -title "Command"
    #tk_messageBox -message $url -title "URL"

    regsub -all "\\\\" $url "/" url


    if [catch {open "|\"$command\" \"$url\" |& more"} pipe] {
        return 1
    } else {
        return 0
    }
}