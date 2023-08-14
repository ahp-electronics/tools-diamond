#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

namespace eval ipconfig {
    variable _progress 0
    variable _afterid  ""
    variable _status "Compute in progress..."
    variable _homogeneous 0
    variable _save_lpc 0
}

proc ipconfig::createcfg { nb } {

    global Para

    set frame [$nb insert end ipconfig -text "Configuration"]

    set f2 [frame $frame.buttons]
    pack $f2 -side bottom -fill x

    set f1 [frame $frame.image]
    pack $f1 -fill both -expand yes

    set Para(f1) $f1

    if {[string length $Para(sysplnr)] > 0 } {
      set Para(generate_cfg)   [Button $f2.gen -text "Configure" \
                     -repeatdelay 300 \
                     -command  "ipconfig::_generate" \
                     -font {arial 10} \
                     -width 15 \
                     -helptext "Click to configure IP."]
    } else {
      set Para(generate_cfg)   [Button $f2.gen -text "Generate" \
                     -repeatdelay 300 \
                     -command  "ipconfig::_generate" \
                     -font {arial 10} \
                     -width 15 \
                     -helptext "Click to generate IP \nand Simulation files."]
    }

    #tk_messageBox -default ok -icon warning -message "Call Create_Image" -title "ipconfig::createcfg" -type ok

    Create_Image

    set Para(close_cfg)   [Button $f2.cls -text "Close" \
                   -repeatdelay 300 \
                   -command  "ipconfig::_close"  \
                   -font {arial 10} \
                   -width 15 \
                   -helptext "Click to close window."]

    set Para(help_cfg)   [Button $f2.hlp -text "Help" \
                   -repeatdelay 300 \
                   -command  "ispIPBuilder::_OpenBrowser \"$Para(webhelp)\"" \
                   -font {arial 10} \
                   -width 15 \
                   -helptext "Click for Help"]

    pack $Para(help_cfg) -side right -padx 10 -pady 10
    pack $Para(close_cfg) -side right -padx 10 -pady 10
    pack $Para(generate_cfg)  -side right -padx 10 -pady 10

    #tk_messageBox -default ok -icon warning -message "TYPE: $Para(TYPE)\nimport: $Para(import)" -title "ipconfig::createcfg" -type ok
    #if {[string compare -nocase $Para(TYPE) "IPCFG"] != 0} {
         if {([string compare -nocase $Para(import) "0"] != 0)} {
             set Para(lpcbutton) [checkbutton $f2.ck -font {arial 10} -text "Import IPX to Diamond project" -variable ipconfig::_save_lpc]
             pack $Para(lpcbutton) -side left
         }
    #}

    pack $frame -fill both -expand yes

    ipconfig::Create_Log $nb

    return $frame
}

proc ipconfig::Create_Log { nb } {

    global Para ft tcl_platform

    set frame [$nb insert end IPLog -text "Generate Log"]

    set f2 [frame $frame.buttons]
    pack $f2 -side bottom -fill x

    set f1 [frame $frame.doc]
    pack $f1 -fill both -expand yes

    set tnb [NoteBook $f1.tnb]
    pack $tnb -fill both -expand yes

    set subf [$tnb insert end Log -text "Generated Log"]

    #set sw [ScrolledWindow $f2.sw -relief sunken -borderwidth 2 -auto both -scrollbar both]
    #set sf [ScrollableFrame $sw.f -width $W -height $H -constrainedheight "true" -constrainedwidth "true"]
    #$sw setwidget $sf
    #set subf [$sf getframe]

    set ox $subf.tx
    set oy $subf.ty
    set o [supertext::text $subf.text -xscrollcommand "$ox set" -yscrollcommand "$oy set" -exportselection 1 \
        -wrap none -tabs {1c 2c 3c 4c 5c 6c}]

    set Para(genlog) $o

    scrollbar $ox -command "$o xview" -orient h
    pack $ox -side bottom -fill x

    scrollbar $oy -command "$o yview"
    pack $oy -side right -fill y
    pack $o -fill both -expand yes
    #pack $o  -fill x
    #pack $sw -fill x

    #$o tag configure prompt -underline true
    $o tag configure prompt -foreground blue
    $o tag configure result -foreground purple
    $o tag configure error -foreground red
    $o tag configure output -foreground blue
    $o tag configure commad -foreground maroon4
    $o tag configure warn -foreground sienna
    $o tag configure begin -foreground black

    # Insert the prompt and initialize the limit mark

    set Para(prompt) "==>"

    #$o insert insert "$Para(prompt)" prompt
    $o mark set limit insert
    $o mark gravity limit left

    # Key bindings that limit input and eval things. The break in
    # the bindings skips the default Text binding for the event.

    #bind $o <Return> {EvalTypein ; break}
    #bind $o <BackSpace> {
    #    if {[%W tag nextrange sel 1.0 end] != ""} {
    #        %W delete sel.first sel.last
    #    } elseif {[%W compare insert > limit]} {
    #        %W delete insert-1c
    #        %W see insert
    #    }
    #    break
    #}
    #bind $o <Key> {
    #    if [%W compare insert < limit] {
    #        %W mark set insert end
    #    }
    #}
    # keyboard/accelerator bindings
    #bind $o <Control-f> "search_find;break"
    #bind $o <Control-F> "search_find;break"
    #bind $o <F3> "search_find_next;break"

    #bind $o <Control-X> "textCut;break"
    #bind $o <Control-C> "tk_textCopy $t;break"
    #bind $o <Control-V> "textPaste;break"

    # bind control-r for "Run"
    #bind $o <Control-r> "Run;break"
    #bind $o <Control-R> "Run;break"

    # bind control-c for "Clear_Output"
    #bind $o <Control-d> "Clear_Output;break"
    #bind $o <Control-D> "Clear_Output;break"

    #bind $o <Control-plus> "view_font_size 1"
    #bind $o <Control-minus> "view_font_size -1"

    # bind <Up> for previou command
    # bind $o <Up> "previous_cmd -1;break"

    # bind <Down> for next command
    # bind $o <Down> "previous_cmd +1;break"

    # bind <Escape> delete current command
    #bind $o <Escape> {
    #    %W delete limit end
    #}

    # bind <Control-a> and <Home> key, place cursor after prompt
    #bind $o <Control-a> {
    #    if {[%W compare {limit linestart} == {insert linestart}]} {
    #        %W mark set insert limit
    #        break
    #    }
    #}
    #bind $o <Key-Home> [bind $o <Control-a>]

    #bind $o <FocusIn> {set focus_text 2}

    #set s [text $f2.s -xscrollcommand "$f2.tx set" -yscrollcommand "$f2.ty set" -wrap none -width 30 -cursor arrow -state disable]
    #set Para(genlog) $s
    #scrollbar $f2.tx -command "$s xview" -orient h
    #pack $f2.tx -side bottom -fill x
    #scrollbar $f2.ty -command "$s yview"
    #pack $f2.ty -side right -fill y
    #pack $s -side left -fill both -expand yes
    #$s tag configure result -foreground purple
    #$s tag configure error -foreground red
    #$s tag configure output -foreground blue
    #$s tag configure commad -foreground maroon4
    #$s tag configure warn -foreground sienna
    #$o tag configure begin -foreground black

    #$o configure -state normal
    #$o delete 1.0 end

    #$o insert end $Para(data)
    $o configure -state disabled
    #
    # error/warning log
    #
    set subf [$tnb insert end Error -text "Errors/Warnings Msg"]

    set ox $subf.tx
    set oy $subf.ty
    set o [supertext::text $subf.text -xscrollcommand "$ox set" -yscrollcommand "$oy set" -exportselection 1 \
        -wrap none -tabs {1c 2c 3c 4c 5c 6c}]

    set Para(errlog) $o

    scrollbar $ox -command "$o xview" -orient h
    pack $ox -side bottom -fill x

    scrollbar $oy -command "$o yview"
    pack $oy -side right -fill y
    pack $o -fill both -expand yes
    #pack $o  -fill x
    #pack $sw -fill x

    # Text tags give script output, command errors, command
    # results, and the prompt a different appearance

    #$o tag configure prompt -underline true
    $o tag configure prompt -foreground blue
    $o tag configure result -foreground purple
    $o tag configure error -foreground red
    $o tag configure output -foreground blue
    $o tag configure commad -foreground maroon4
    $o tag configure warn -foreground sienna
    $o tag configure begin -foreground black

    # Insert the prompt and initialize the limit mark

    set Para(prompt) "==>"

    #$o insert insert "$Para(prompt)" prompt
    $o mark set limit insert
    $o mark gravity limit left

    # Key bindings that limit input and eval things. The break in
    # the bindings skips the default Text binding for the event.

    #bind $o <Return> {EvalTypein ; break}
    #bind $o <BackSpace> {
    #    if {[%W tag nextrange sel 1.0 end] != ""} {
    #        %W delete sel.first sel.last
    #    } elseif {[%W compare insert > limit]} {
    #        %W delete insert-1c
    #        %W see insert
    #    }
    #    break
    #}
    #bind $o <Key> {
    #    if [%W compare insert < limit] {
    #        %W mark set insert end
    #    }
    #}
    # keyboard/accelerator bindings
    #bind $o <Control-f> "search_find;break"
    #bind $o <Control-F> "search_find;break"
    #bind $o <F3> "search_find_next;break"

    #bind $o <Control-X> "textCut;break"
    #bind $o <Control-C> "tk_textCopy $t;break"
    #bind $o <Control-V> "textPaste;break"

    # bind control-r for "Run"
    #bind $o <Control-r> "Run;break"
    #bind $o <Control-R> "Run;break"

    # bind control-c for "Clear_Output"
    #bind $o <Control-d> "Clear_Output;break"
    #bind $o <Control-D> "Clear_Output;break"

    #bind $o <Control-plus> "view_font_size 1"
    #bind $o <Control-minus> "view_font_size -1"

    # bind <Up> for previou command
    #bind $o <Up> "previous_cmd -1;break"

    # bind <Down> for next command
    #bind $o <Down> "previous_cmd +1;break"

    # bind <Escape> delete current command
    #bind $o <Escape> {
    #    %W delete limit end
    #}

    # bind <Control-a> and <Home> key, place cursor after prompt
    #bind $o <Control-a> {
    #    if {[%W compare {limit linestart} == {insert linestart}]} {
    #        %W mark set insert limit
    #        break
    #    }
    #}
    #bind $o <Key-Home> [bind $o <Control-a>]

    bind $o <FocusIn> {set focus_text 2}

    #set s [text $f2.s -xscrollcommand "$f2.tx set" -yscrollcommand "$f2.ty set" -wrap none -width 30 -cursor arrow -state disable]
    #set Para(genlog) $s
    #scrollbar $f2.tx -command "$s xview" -orient h
    #pack $f2.tx -side bottom -fill x
    #scrollbar $f2.ty -command "$s yview"
    #pack $f2.ty -side right -fill y
    #pack $s -side left -fill both -expand yes
    #$s tag configure result -foreground purple
    #$s tag configure error -foreground red
    #$s tag configure output -foreground blue
    #$s tag configure commad -foreground maroon4
    #$s tag configure warn -foreground sienna
    #$o tag configure begin -foreground black

    #$o configure -state normal
    #$o delete 1.0 end

    #$o insert end $Para(data)
    $o configure -state disabled

    if {([string compare -nocase $Para(TYPE) "IPCFG"] == 0) || ([string compare -nocase $Para(TYPE) "ModuleCFG"] == 0)} {
          set Para(stop)   [Button $f2.gen -text "Stop" \
                         -state disable \
                         -repeatdelay 300 \
                         -command  "ipconfig::_generate" \
                         -font {arial 10} \
                         -width 15 \
                         -helptext "Click to stop processing."]
    }

    set Para(close)   [Button $f2.cls -text "Close" \
                   -repeatdelay 300 \
                   -command  "ipconfig::_close"  \
                   -font {arial 10} \
                   -width 15 \
                   -helptext "Click to close window."]
    set Para(help)   [Button $f2.hlp -text "Help" \
                   -repeatdelay 300 \
                   -command  "ispIPBuilder::_OpenBrowser \"$Para(webhelp)\"" \
                   -font {arial 10} \
                   -width 15 \
                   -helptext "Click for Help"]

    pack $Para(help) -side right -padx 10 -pady 10
    pack $Para(close) -side right -padx 10 -pady 10
    if {([string compare -nocase $Para(TYPE) "IPCFG"] == 0) || ([string compare -nocase $Para(TYPE) "ModuleCFG"] == 0)} {
        pack $Para(stop) -side right -padx 10 -pady 10
    }
    #if {[string length $Para(prj)] > 0 } {
    #    #set ipconfig::_save_lpc 1
    #    set Para(lpcbuttonC) [checkbutton $f2.ck -font {arial 10} -text "Import IPX to Diamond project" -variable ipconfig::_save_lpc]
    #    pack $Para(lpcbuttonC) -side left
    #}

    $tnb raise [$tnb page 0]

    return
}

proc ipconfig::_close  { } {
    global Para tcl_platform

    if {[string compare -nocase $Para(result) "-1"] != 0} {
      if {([string length $Para(newmodule)] > 0) && ([string length $Para(newpath)] > 0)} {
          set cst_file [file join $Para(newpath) "$Para(newmodule).cst"]
      } else {
          set cst_file [file join $Para(ProjectPath) "$Para(ModuleName).cst"]
      }

      if [catch {open $cst_file w} outputfile] {
          tk_messageBox -default ok -icon warning \
                  -message "Cannot open $cst_file file!" \
                  -title "Generate error" \
                  -type ok
      } else {
          puts $outputfile "Date=$Para(Date)"
          puts $outputfile "Time=$Para(Time)\n"
          close $outputfile
      }
    }

    #tk_messageBox -message $Para(result) -title "_close"

    destroy .

    exit $Para(result)
}

proc ipconfig::_generate { } {
    global Para tcl_platform

    set Para(msg) ""
    set Para(error) 0
    set Para(warn) 0
    set Para(synpro) 0
    set Para(gen) 1

    set notebook $Para(notebook)

    $notebook raise [$notebook page 1]

    set s $Para(genlog)
    set e $Para(errlog)

    if {[string length $Para(sysplnr)] > 0 } {
        set process "Configure"
    } else {
        set process "Generate"
    }

    if {[string length $Para(status)] == 0} {
        set Para(status) "Running"
        #interp delete $Para(slave)
        #set Para(slave) [SlaveInit shell_IP]

        if {([string compare -nocase $Para(TYPE) "IPCFG"] == 0) || ([string compare -nocase $Para(TYPE) "ModuleCFG"] == 0)} {
            $Para(stop) configure -state normal
        }
        $Para(generate_cfg) configure "-text" "Stop"

        $s configure -state normal
        $s delete 1.0 end
        $e configure -state normal
        $e delete 1.0 end

        $s configure -cursor watch
        $e configure -cursor watch

        if {[string length $Para(sysplnr)] == 0 } {
           logmsg "Starting process: $Para(TYPE)\n" begin
        }

        if {([string compare -nocase $Para(TYPE) "IPCFG"] != 0) && ([string compare -nocase $Para(TYPE) "ModuleCFG"] != 0)} {
            logmsg "Starting process: \n" begin
        }

        #if {[string length $Para(sysplnr)] > 0 } {
        #    set ret [Configure]
        #} else {
            set ret [Generate]
        #}

        if {$ret < 0} {
            $e insert insert $Para(msg) error
            if {$ret == -2} {
               $notebook raise [$notebook page 0]
            }
        } else {
            if {[string length $Para(sysplnr)] > 0 } {
                logmsg "Configuration data saved\n\n" begin
            }

            if {([string compare -nocase $Para(TYPE) "IPCFG"] != 0) && ([string compare -nocase $Para(TYPE) "ModuleCFG"] != 0)} {
                logmsg $Para(msg) output
                if {$Para(error) != 0} {
                    logmsg "End process: completed with errors.\n" begin
                } else {
                    if {[string length $Para(newmodule)] > 0 } {
                        logmsg "File: $Para(newmodule).lpc created.\n\n" output
                    } else {
                        logmsg "File: $Para(module).lpc created.\n\n" output
                    }
                    logmsg "End process: completed successfully.\n" begin
                }
                logmsg "Total Warnings:  $Para(warn)" warn
                logmsg "Total Errors:  $Para(error)" error
            } else {
                if {([string length $Para(newmodule)] > 0) && ([string length $Para(newpath)] > 0)} {
                    file delete -force [file join $Para(newpath) $Para(newmodule)_filelist.log]
                } else {
                    file delete -force [file join $Para(path) $Para(module)_filelist.log]
                }

                create_core_script
                if {[string length $Para(sysplnr)] == 0 } {
                  run_script
                }
                _output_filelist
                logmsg "Total Warnings:  $Para(warn)\n" warn
                logmsg "Total Errors:  $Para(error)\n" error
            }

            if {([string length $Para(newmodule)] > 0) && ([string length $Para(newpath)] > 0)} {
                set rst_file [file join $Para(newpath) "$Para(newmodule).rst"]
            } else {
                set rst_file [file join $Para(ProjectPath) "$Para(ModuleName).rst"]
            }
            if {$ipconfig::_save_lpc && !$Para(error)} {
                if [catch {open $rst_file w} outputfile] {
                        tk_messageBox -default ok -icon warning \
                                -message "Cannot open $rst_file file!" \
                                -title "Generate error" \
                                -type ok
                        return -1
                }
                puts $outputfile "Date=$Para(Date)"
                puts $outputfile "Time=$Para(Time)\n"
                close $outputfile
            } else {
                #tk_messageBox -message $rst_file -title "delete file"
                file delete $rst_file
            }
        }
    }

    $s configure -state disabled
    $e configure -state disabled
    $s configure -cursor ""
    $e configure -cursor ""

    _savefile

    ResetAlias $Para(slave)

    if {([string compare -nocase $Para(TYPE) "IPCFG"] == 0) || ([string compare -nocase $Para(TYPE) "ModuleCFG"] == 0)} {
        $Para(stop) configure -state disable
    }

    if {[string length $Para(sysplnr)] > 0 } {
        $Para(generate_cfg) configure "-text" "Configure"
    } else {
        $Para(generate_cfg) configure "-text" "Generate"
    }

    set Para(status) ""
    set Para(result) $Para(error)
}

proc ipconfig::_copy {} {
    global Para tcl_platform

    if {([string compare -nocase $Para(TYPE) "Module"] == 0)} {
        package require OrcaModule
    } else {
        package forget OrcaModule
    }

    set Para(msg) ""
    set Para(error) 0
    set Para(warn) 0
    set Para(synpro) 0
    set Para(gen) 1

    set process "Copy"

    if {[string length $Para(status)] == 0} {
        set Para(status) "Running"
        lappend log "Starting copy process: $Para(newmodule)\n\n"

        set ret [Copy]

        if {$ret < 0} {
            lappend log "Error: $Para(msg)\n"
        } else {
            if {[string length $Para(sysplnr)] > 0 } {
                lappend log "Configuration data saved\n\n"
            }

            if {([string compare -nocase $Para(TYPE) "IPCFG"] == 0) || ([string compare -nocase $Para(TYPE) "ModuleCFG"] == 0)} {
                if {([string length $Para(newmodule)] > 0) && ([string length $Para(newpath)] > 0)} {
                    file delete -force [file join $Para(newpath) $Para(newmodule)_filelist.log]
                    set Para(ModuleName) $Para(newmodule)
                } else {
                    file delete -force [file join $Para(path) $Para(module)_filelist.log]
                    set Para(ModuleName) $Para(module)
                }

                create_core_script
            }
            lappend log "Messages: $Para(msg)\n"
            if {$Para(error) != 0} {
                lappend log "End copy process: completed with errors.\n"
            } else {
                if {[string length $Para(newmodule)] > 0 } {
                    lappend log "File: $Para(newmodule).lpc created.\n\n"
                } else {
                    lappend log "File: $Para(module).lpc created.\n\n"
                }
                lappend log "End copy process: completed successfully.\n"
            }
            lappend log "Total Warnings:  $Para(warn)\n"
            lappend log "Total Errors:  $Para(error)\n"

            if {([string length $Para(newmodule)] > 0) && ([string length $Para(newpath)] > 0)} {
                set rst_file [file join $Para(newpath) "$Para(newmodule).rst"]
            } else {
                set rst_file [file join $Para(path) "$Para(ModuleName).rst"]
            }
            if {$ipconfig::_save_lpc && !$Para(error)} {
                if [catch {open $rst_file w} outputfile] {
                    puts "Copy error: Cannot open $rst_file file!"
                    return -1
                }
                puts $outputfile "Date=$Para(Date)"
                puts $outputfile "Time=$Para(Time)\n"
                close $outputfile
            } else {
                #puts "delete file: $rst_file"
                file delete $rst_file
            }
        }
    }

    _save2log $process $log

    #ResetAlias $Para(slave)

    set Para(status) ""
    set process ""
    set Para(result) $Para(error)
}

proc ipconfig::_save2log {process log} {
    global Para

    if {([string length $Para(newmodule)] > 0) && ([string length $Para(newpath)] > 0)} {
        set file [file join $Para(newpath) $Para(newmodule)_$process.log]
    } else {
        set file [file join $Para(path) $Para(module)_$process.log]
    }

    if {[catch {set fid [open $file w]} msg]} {
      puts "There was an error opening file \"$file\"; $msg."
      return -1
    } else {
      foreach tmp $log {
        puts -nonewline $fid $tmp
      }
      close $fid
    }
}

proc ipconfig::_output_filelist { } {
    global Para

    if {([string length $Para(newmodule)] > 0) && ([string length $Para(newpath)] > 0)} {
        set file [file join $Para(newpath) $Para(newmodule)_filelist.log]
    } else {
        set file [file join $Para(path) $Para(module)_filelist.log]
    }

    if {[file exist $file] == 1 } {
       if {[catch {set fid [open $file]} msg]} {
          puts "There was an error opening file \"$file\"; $msg."
          return -1
       } else {
          set s $Para(genlog)
          foreach line [split [read $fid] \n] {
             logmsg $line output
          }
          close $fid
       }
    }
}

proc ipconfig::_savefile { } {
    global Para

    if {([string length $Para(newmodule)] > 0) && ([string length $Para(newpath)] > 0)} {
        set file [file join $Para(newpath) $Para(newmodule)_generate.log]
    } else {
        set file [file join $Para(path) $Para(module)_generate.log]
    }

    set fid [open $file w]
    set t $Para(genlog)
    puts -nonewline $fid [$t get 1.0 end]
    close $fid
}

proc ipconfig::_show_progress { } {
    global Para

    variable _progress
    variable _afterid
    variable _status

    set notebook $Para(notebook)

    $notebook raise [$notebook page 1]
    if { $_progress } {
        set ispIPBuilder::status   "Compute in progress..."
        set ispIPBuilder::prgindic 0
        $ispIPBuilder::mainframe showstatusbar progression
        if { $_afterid == "" } {
            set _afterid [after 30 ipconfig::_update_progress]
        }
    } else {
        set ispIPBuilder::status ""
        $ispIPBuilder::mainframe showstatusbar status
        set _afterid ""
    }
}

proc ipconfig::_update_progress { } {
    variable _progress
    variable _afterid

    if { $_progress } {
        if { $ispIPBuilder::prgindic < 100 } {
            incr ispIPBuilder::prgindic 5
            set _afterid [after 30 ipconfig::_update_progress]
        } else {
            set _progress 0
            $ispIPBuilder::mainframe showstatusbar status
            set ispIPBuilder::status "Done"
            set _afterid ""
            after 500 {set ispIPBuilder::status ""}
        }
    } else {
        set _afterid ""
    }
}

proc ipconfig::_Clear_Output {} {

    variable _out_pane

    $_out_pane delete 1.0 end
    #$_out_pane insert insert "$Para(prompt)" prompt
    $_out_pane mark set limit insert
    $_out_pane mark gravity limit left
    $_out_pane see limit
}
#
# Evaluate everything between limit and end as a Tcl command
#
proc ipconfig::_EvalTypein {} {
    global Para

    set o $Para(genlog)
    $o insert insert \n
    set command [$o get limit end]
    if [info complete $command] {
        $o mark set limit insert
        Eval $command
    }
}
#
# Echo the command and evaluate it
#
proc ipconfig::EvalEcho {} {
    global Para

    set o $Para(genlog)
    #set command [list source $editor($editor_no,file)]
    #set command [list source $Para(data)]
    set command [list source $Para(genscript)]

    $o mark gravity limit right
    $o insert limit "$command\n\n" commad
    $o see limit
    $o mark gravity limit left

    Eval $command
}
##
## Evaluate a command and display its result
##
proc ipconfig::Eval {command} {
    global Para

    #tk_messageBox -default ok -icon warning -message $command -title "Eval" -type ok


    set o $Para(genlog)
    $o mark set insert end

    set Para(cmd) $command

    if [catch {interp eval $Para(slave) $command} result] {
        if {[string length $result] >= 1} {$o insert insert "$result\n" error}
    } else {
        if {[string length $result] >= 1} {$o insert insert "$result\n" result}
    }
    set Para(msg) $result

    $o see insert
    $o mark set limit insert

    return
}
## AddSlaveHistory -
## Command is added to history only if different from previous command.
## This also doesn't cause the history id to be incremented, although the
## command will be evaluated.
## ARGS: cmd    - command to add
##
proc ipconfig::AddSlaveHistory cmd {
    global Para

    set o $Para(genlog)
    set ev [EvalSlave history nextid]
    incr ev -1

    set code [catch {EvalSlave history event $ev} lastCmd]
    if {$code || [string compare $cmd $lastCmd]} {
        EvalSlave history add $cmd
    }
}
## EvalSlave - evaluates the args in the associated slave
## args should be passed to this procedure like they would be at
## the command line (not like to 'eval').
## ARGS:    args    - the command and args to evaluate
##
proc ipconfig::EvalSlave args {
    global Para

    interp eval $Para(slave) $args
}
##
## Create and initialize the slave interpreter
##
proc ipconfig::SlaveInit slave {
    global Para

    interp create $slave

    #if {$editor($editor_no,loadtk)} {
    #    load {} Tk $slave
    #    if [catch {interp eval $slave "wm title . $editor($editor_no,title)"} msg] {
    #        $o insert insert $msg
    #        set editor($editor_no,tkloaded) loadtk
    #    }
    #     if [catch {interp eval $slave "wm iconify ."} msg] {
    #         $o insert insert $msg
    #     }
    #}

    set o $Para(genlog)

    if [catch "interp alias $slave reset {} ResetAlias $slave" msg] {
        $o insert insert $msg
    }
    if [catch "interp eval $slave {rename puts ml_puts}" msg] {
        $o insert insert $msg
    }
    if [catch "interp alias $slave puts {} PutsAlias $slave" msg] {
        $o insert insert $msg
    }

    #if [catch {interp eval $slave "lappend auto_path \"$Para(runproc_path)\""} msg] {
    #    $o insert insert "autopath: $msg"
    #}

    if [catch {interp eval $slave "package require runcmd"} msg] {
        $o insert insert "package: $msg\n"
    }

    if {$Para(os_platform) == "windows" } {
        if [catch {interp eval $slave "rename unknown _unknown"} msg] {
            $o insert insert "rename unknown: $msg\n"
        }

        #if [catch {interp eval $slave "rename isp_unknown unknown"} msg] {
        #    $o insert insert "rename unknown: $msg\n"
        #}
    }
    # Turn off FOUNDRY popup msg boxes
    if [catch {interp eval $slave "set env(NEO_NOMSGBOX) 1"} msg] {
        $o insert insert "NEO_NOMSGBOX: $msg"
    }

    return $slave
}
#
# Run the script file in the shell
#
proc ipconfig::run_script {} {
    global Para

    # Update status to running before starting the command eval
    set Para(status) "Running"
    set command [list source $Para(gen_script)]

    Eval $command
    set Para(status) ""
}
#== create generate_core.tcl file======================================#

proc ipconfig::create_core_script {} {
    global editor editor_no Para auto_path tcl_platform

    #set Para(gen_script) [file join $Para(path) generate_core.tcl]
    if {([string length $Para(newmodule)] > 0) && ([string length $Para(newpath)] > 0)} {
      set Para(gen_script) [file join $Para(newpath) generate_core.tcl]
    } else {
      set Para(gen_script) [file join $Para(path) generate_core.tcl]
    }
    set fid [open $Para(gen_script) w+]

    #puts $fid "#!/bin/sh"
    #puts $fid "# The next line is executed by /bin/sh, but not tcl "
    #puts $fid "exec wish \"$0\" ${1+\"$@\"}"
    puts $fid ""
    puts $fid "#!/usr/local/bin/wish"
    puts $fid ""
    puts $fid "set cpu  \$tcl_platform(machine)"
    puts $fid ""
    puts $fid "switch \$cpu {"
    puts $fid " intel -"
    puts $fid " i*86* {"
    puts $fid "     set cpu ix86"
    puts $fid " }"
    puts $fid " x86_64 {"
    puts $fid "     if {\$tcl_platform(wordSize) == 4} {"
    puts $fid "     set cpu ix86"
    puts $fid "     }"
    puts $fid " }"
    puts $fid "}"
    puts $fid ""
    puts $fid "switch \$tcl_platform(platform) {"
    puts $fid "    windows {"
    puts $fid "        set Para(os_platform) windows"
    puts $fid "   if {\$cpu == \"amd64\"} {"
    puts $fid "     # Do not check wordSize, win32-x64 is an IL32P64 platform."
    puts $fid "     set cpu x86_64"
    puts $fid "     }"
    puts $fid "    }"
    puts $fid "    unix {"
    puts $fid "        if {\$tcl_platform(os) == \"Linux\"}  {"
    puts $fid "            set Para(os_platform) linux"
    puts $fid "        } else  {"
    puts $fid "            set Para(os_platform) unix"
    puts $fid "        }"
    puts $fid "    }"
    puts $fid "}"
    puts $fid ""
    puts $fid "if {\$cpu == \"x86_64\"} {"
    puts $fid " set NTPATH nt64"
    puts $fid " set LINPATH lin64"
    puts $fid "} else {"
    puts $fid " set NTPATH nt"
    puts $fid " set LINPATH lin"
    puts $fid "}"
    puts $fid ""
    puts $fid "if {\$Para(os_platform) == \"linux\" } {"
    puts $fid "    set os \$LINPATH"
    puts $fid "    set idxfile \[file join \$env(HOME) ipsetting_l.lst\]"
    puts $fid "} else {"
    puts $fid "    set os \$NTPATH"
    puts $fid "    set idxfile \[file join c:/lsc_env ipsetting.lst\]"
    puts $fid "}"
    puts $fid ""
    puts $fid "set Para(cmd) \"\""
    puts $fid "if !\[catch \{set temp \$argc\} result\] \{"
    puts $fid "    if \{\$argc > 0\} \{"
    puts $fid "        for \{set i 0\} \{\$i < \$argc\} \{incr i 2\} \{"
    puts $fid "            set temp \[lindex \$argv \$i\]"
    puts $fid "            set temp \[string range \$temp 1 end\]"
    puts $fid "            lappend argv_list \$temp"
    puts $fid "            lappend value_list \[lindex \$argv \[expr \$i+1\]\]"
    puts $fid "        \}"
    puts $fid "        foreach argument \$argv_list value \$value_list \{"
    puts $fid "            switch \$argument \{"
    puts $fid "                \"cmd\" \{set Para(cmd) \$value;\}"
    puts $fid "            \}"
    puts $fid "        \}"
    puts $fid "    \}"
    puts $fid "\}"
    puts $fid ""
    #
    # As of 04/10/2009, Diamond does not set SYNPLIFY_USEOEM and SYNPLIFY_USEPRO
    # synpwrap does not run correctly unless the 2 env are set to true
    #
    #puts $fid "set env(SYNPLIFY_USEOEM) \"true\""
    #puts $fid "set env(SYNPLIFY_USEPRO) \"true\""
    #
    #for all
    puts $fid "set Para(ProjectPath) \[file dirname \[info script\]\]"
    #for Diamond Systemplanner only
    puts $fid "package forget core_template"
    puts $fid "package forget LatticeIPCore"
    puts $fid "package forget IP_Control"
    puts $fid "package forget Core_Generate"
    puts $fid "package forget IP_Generate"
    puts $fid "package forget IP_Templates"
    puts $fid "set auto_path \"\$auto_path\""
    puts $fid "set Para(install_dir) \$env(TOOLRTF)"
    puts $fid "set Para(CoreIndex) \"[lindex [file split $Para(ipdir)] end]\""
    puts $fid "set Para(CoreRoot) \"\""
    puts $fid "set fid \[open \$idxfile r\]"
    puts $fid "while {\[gets \$fid line \]>=0} {"
    puts $fid "    if \[regexp {(\[^=\]*)=(.*)} \$line match parameter value\] {"
    puts $fid "        if \[regexp {(\[ |\\t\]*;)} \$parameter match\] {continue}"
    puts $fid "        set parameter \[string trim \$parameter\]"
    puts $fid "        set value \[string trim \$value\]"
    puts $fid "        if {\$parameter==\$Para(CoreIndex)} {"
    puts $fid "            if \[regexp {(.*)\[ |\\t\]*;} \$value match temp\] {"
    puts $fid "                set Para(CoreRoot) \$temp"
    puts $fid "            } else {"
    puts $fid "                set Para(CoreRoot) \$value"
    puts $fid "            }"
    puts $fid "        }"
    puts $fid "    }"
    puts $fid "}"
    puts $fid "if {\[string length \$Para(CoreRoot)\]==0} {"
    puts $fid "    puts stderr \"Error: IP \$Para(CoreIndex) is not found!\""
    puts $fid "    exit"
    puts $fid "}"
    puts $fid ""
    puts $fid "set Para(ModuleName) \"$Para(ModuleName)\""
    puts $fid "set Para(lib) \"\[file join \$Para(CoreRoot) \$Para(CoreIndex) lib\]\""
    puts $fid "set Para(CoreName) \"$Para(CoreName)\""
    puts $fid "set Para(arch) \"$Para(arch)\""
    puts $fid "set Para(family) \"$Para(family)\""
    puts $fid "set Para(Family) \"$Para(family)\""
    puts $fid "set Para(design) \"$Para(design)\""
    #puts $fid "set Para(tech) \"$Para(tech)\""
    #puts $fid "set Para(install_dir) \"$Para(Root)\""
    puts $fid "set Para(Bin) \"\[file join \$Para(install_dir) bin \$os\]\""
    puts $fid "set Para(SpeedGrade) \"$Para(spd)\""
    #
    # As of 04/10/2009, Diamond still have 2 bin areas
    # "<TOOLRTF>/bin/nt" and "<TOOLRTF>/ispFPGA\bin\nt"
    # Future release may merge the 2 bin to a single bin
    # when that happens uncomment the following statement
    # and remove the next statement
    # puts $fid "set Para(FPGAPath) \"$Para(Bin)\""
    #
    puts $fid "set Para(FPGAPath) \"\[file join \$Para(install_dir) ispfpga bin \$os\]\""
    #
    puts $fid ""
    puts $fid "lappend auto_path \"\[file join \$Para(CoreRoot) \$Para(CoreIndex) gui\]\""
    puts $fid ""
    puts $fid "lappend auto_path \"\[file join \$Para(CoreRoot) \$Para(CoreIndex) script\]\""
    puts $fid "package require Core_Generate"
    puts $fid ""
    puts $fid "lappend auto_path \"\$Para(install_dir)/tcltk/lib/ipwidgets/ispipbuilder/../runproc\""
    puts $fid "package require runcmd"
    puts $fid ""
    puts $fid ""
    puts $fid "set Para(result) \[GenerateCore\]"
    close $fid
}
##
## The reset alias deletes the slave and starts a new one
##
proc ipconfig::ResetAlias slave {

    interp delete $slave
    SlaveInit $slave

    return $slave
}
#
# Scan message for errors and warnings
#
proc ipconfig::logmsg {msg mode} {
    global Para

    set o $Para(genlog)
    set e $Para(errlog)
    set Para(synpro) 0

    $o mark gravity limit right
    # Error or Warning
    foreach outstr [split $msg \n] {
        set temp [string tolower [string trim $outstr]]
        if {[string first "error" $temp] == 0} {
            incr Para(error)
            $o insert limit $outstr error
            $e insert insert $outstr error
            $o insert insert "\n"
            $e insert insert "\n"
        } elseif {[string first "warn" $temp] == 0} {
            incr Para(warn)
            $o insert limit $outstr warn
            $e insert insert $outstr warn
            $o insert insert "\n"
            $e insert insert "\n"
        } elseif {[string first "@e:" $temp] == 0} {
            incr Para(error)
            $o insert limit $outstr error
            $e insert insert $outstr error
            $o insert insert "\n"
            $e insert insert "\n"
        } elseif {[string first "@e|" $temp] == 0} {
            incr Para(error)
            $o insert limit $outstr error
            $e insert insert $outstr error
            $o insert insert "\n"
            $e insert insert "\n"
        } elseif {[string first "starting process:" $temp] == 0} {
            $o insert limit $outstr $mode
            $e insert insert $outstr $mode
            $o insert insert "\n"
            $e insert insert "\n"
            if {[string first "synpwrap" $temp] > 0} {
               set Para(synpro) 1
               $o insert insert "\n"
            }
        } elseif {[string first "end process: " $temp] == 0} {
            #if {[string compare -nocase $mode "error"] == 0} {
            #    $o insert limit "End process: " begin
            #    $o insert limit "completed with errors." error
            #    $e insert insert "End process: " begin
            #    $e insert insert "completed with errors." error
            #    $o insert insert "\n"
            #    $e insert insert "\n"
            #} elseif {[string compare -nocase $mode "warn"] == 0} {
            #    $o insert limit "End process: " begin
            #    $o insert limit "completed with warnings." warn
            #    $e insert insert "End process: " begin
            #    $e insert insert "completed with warnings." warn
            #    $o insert insert "\n"
            #    $e insert insert "\n"
            #} else {
                $o insert limit $outstr $mode
                $e insert insert $outstr $mode
                $o insert insert "\n"
                $e insert insert "\n"
                set Para(synpro) 0
            #}
        } elseif {[string first "total warnings: " $temp] == 0} {
            $o insert insert "\n"
            $e insert insert "\n"
            $o insert limit $outstr warn
            $e insert insert $outstr warn
            $o insert insert "\n"
            $e insert insert "\n"
        } elseif {[string first "total errors: " $temp] == 0} {
            $o insert insert "\n"
            $e insert insert "\n"
            $o insert limit $outstr error
            $e insert insert $outstr error
            $o insert insert "\n\n"
            $e insert insert "\n\n"
        } elseif {[string first "@w:" $temp] == 0} {
            #incr Para(warn)
            #$o insert limit $outstr warn
            #$e insert insert $outstr warn
            #$o insert insert "\n"
            #$e insert insert "\n"
        } else {
            if {[string length $temp] > 0 } {
               if {$Para(synpro) == 0 } {
                   $o insert limit $outstr $mode
               }
            }
            $o insert insert "\n"
        }
    }
    $o see limit
    $o mark gravity limit left
}
#
# The puts alias puts stdout and stderr into the text widget
#
proc PutsAlias {slave args} {
    global Para

    set o $Para(genlog)
    set e $Para(errlog)

    if {[llength $args] > 3} {
        error "invalid arguments"
    }

    set argt $args

    set newline "\n"
    if {[string match "-nonewline" [lindex $args 0]]} {
        set newline ""
        set args [lreplace $args 0 0]
    }
    if {[llength $args] == 1} {
        set chan stdout
        set outstr [lindex $args 0]$newline
    } else {
        set chan [lindex $args 0]
        set outstr [lindex $args 1]$newline
    }
    if [regexp (stdout|stderr) $chan] {
        $o mark gravity limit right
        # Error or Warning
        set temp [string tolower [string trim $outstr]]
        if {[string first "error" $temp] == 0} {
            incr Para(error)
            $o insert limit $outstr error
            $e insert insert $outstr error
        } elseif {[string first "warn" $temp] == 0} {
            incr Para(warn)
            $o insert limit $outstr warn
            $e insert insert $outstr warn
        } elseif {[string first "@e:" $temp] == 0} {
            incr Para(error)
            $o insert limit $outstr error
            $e insert insert $outstr error
        } elseif {[string first "@e|" $temp] == 0} {
            incr Para(error)
            $o insert limit $outstr error
            $e insert insert $outstr error
        } elseif {[string first "starting process: " $temp] == 0} {
            $o insert limit $outstr begin
            $e insert insert $outstr begin
            if {[string first "synpwrap" $temp] > 0} {
               set Para(synpro) 1
               $o insert insert "\n"
            }
        } elseif {[string first "end process: " $temp] == 0} {
            $o insert limit $outstr begin
            $e insert insert $outstr begin
            set Para(synpro) 0
        } elseif {[string first "@w:" $temp] == 0} {
            #incr Para(warn)
            #$o insert limit $outstr warn
            #$e insert insert $outstr warn
        } else {
            if {$Para(synpro) == 0 } {
               $o insert limit $outstr output
            }
        }

        $o see limit
        $o mark gravity limit left
    } else {
        if [catch "interp eval $slave {ml_puts $argt}" msg] {
            $o insert insert $msg
        }
    }
}
