#!/bin/sh
# \
exec wish "$0" ${1+"$@"}
#===========================================================================#
#     Editor/Execute written in Tcl/Tk for editing and executing scripts    #
#         (c) Lattice Semiconductor Corp (2003)                             #
#===========================================================================#

#
# some features
# ==========
# basic tcl syntax highlighting.
# procedure window, select a procedure to go directly to it.
# right click on a word to have the word "copied" to the "find" window
# multiple windows open simultaneously
# the editor can be invoked with file names on the command line, including wildcards (don't do too many)
# the replace function
# undo/redo
# brace matching - highlight matching braces when cursor is on a brace (also quotes & square brackets)
# goto line number (control-g or "view" menu)
# added "font larger/smaller" to the view menu; 20th June 02 (v1.09)
# changed window system so only opens 1 toplevel window, uses frames & packing for window/file selection
# adjustable window panels
# execute the Tcl/Tk script file and display output
#
# added a splash screen on startup to show "loading file ..." (v1.10)
# added a "search - grep" function
# don't syntax highlight files at startup, do when they are first viewed
# the most recent find/replace strings weren't being stored at the start of the find/replace history
#
# URL = http://fastbase.co.nz/edit/index.html
#
#====================================================================#
#
# this program uses a global array editor() to store editor information
# editor(window_number,window) = frame/window
# editor(window_number,file)     = file name
# editor(window_number,status)   = "" or "modified" (or "READ ONLY")
# editor(window_number,procs)   = list of procedure names

switch $tcl_platform(platform) {
    windows {
        set os_platform windows
    }
    unix {
        set os_platform unix
    }
}

set script_dir [file dirname [info script]]
lappend auto_path [file join $script_dir ".." "runproc"]

package require BWidget
package require runcmd

set cmd_help_dir [file join $script_dir ".." ".." ".." "doc" "contents.htm"]
if {$os_platform == "windows"} {
    set edit_help_dir [file join $script_dir ".." ".." ".." ".." "webhelp" "mergedProjects" "isptcl" "isptcl.htm#about_the_tcl_editor.htm"]
    set isp_help_dir [file join $script_dir ".." ".." ".." ".." "webhelp" "main.htm"]
    set opwebhlp [file join $script_dir  ".." ".." ".." ".." "bin" "opwebhlp.exe"]
} else {
    set edit_help_dir [file join $script_dir ".." ".." ".." ".." ".." "webhelp" "mergedProjects" "isptcl" "isptcl.htm#about_the_tcl_editor.htm"]
    set isp_help_dir [file join $script_dir ".." ".." ".." ".." ".." "webhelp" "main.htm"]
}

proc centre_window { w } {
    after idle "
    update idletasks

    # centre
    set xmax \[winfo screenwidth $w\]
    set ymax \[winfo screenheight $w\]
    set x \[expr \{(\$xmax - \[winfo reqwidth $w\]) / 2\}\]
    set y \[expr \{(\$ymax - \[winfo reqheight $w\]) / 2\}\]

    wm geometry $w \"+\$x+\$y\""
}

# to start things rolling display a "splash screen"
# see "Effective Tcl/Tk Programming" book, page 254-247 for reference
wm withdraw .
toplevel .splash -borderwidth 4 -relief raised
wm overrideredirect .splash 1

centre_window .splash

label .splash.info -text "http://www.latticesemi.com" -font {Arial 9}
pack .splash.info -side bottom -fill x

label .splash.title -text "-- Tcl/Tk Editor --" -font {Arial 18 bold} -fg blue
pack .splash.title -fill x -padx 8 -pady 8

set splash_status "Loading configuration file ..."
label .splash.status -textvariable splash_status -font {Arial 9} -width 50 -fg darkred
pack .splash.status -fill x -pady 8

update

set tclpath [info script]
regsub -all "\\\\" $tclpath "/" tclpath
set binpath [string range $tclpath 0 [string last / $tclpath]]

# note: change this to correct path (should really use "package require" syntax).
if {[catch "source combobox.tcl"]} {
    set combofile [format "%s%s" $binpath "combobox.tcl"]
    source $combofile
}

if {[catch "source supertext.tcl"]} {
    set supertxt [format "%s%s" $binpath "supertext.tcl"]
    source $supertxt
}

# == miscellaneous =================================================#

# temporary procedure for logging debug messages
proc log {message} {
    set fid [open "ml.log" a+]
    set time [clock format [clock seconds] -format "%d-%m-%Y %I:%M:%S %p"]
    puts $fid "$time  $message"
    close $fid
}

#== syntax highlight ================================================#

proc tag_word {editor_no word t line_no startx x {tag_name ""}} {
    global editor
    global syntax
    set ext $editor($editor_no,extension)

    if {$tag_name != ""} {
        $t tag add $tag_name $line_no.$startx $line_no.$x
    } elseif {[array names syntax $ext,$word] != ""} {
        $t tag add command $line_no.$startx $line_no.$x
    } elseif {[string is double -strict $word]} {
        $t tag add number $line_no.$startx $line_no.$x
    } elseif {[string range $word 0 0] == "$"} {
        $t tag add variable $line_no.$startx $line_no.$x
    }
}

proc syntax_highlight { start_line end_line } {
    global editor editor_no

    set t $editor($editor_no,text)

    if {$end_line == "end"} {
        set end $end_line
    } else {
        set end $end_line.end
    }

    # remove all existing tags from the text (excluding the proc tag)
    foreach tag {command comment string number variable} {
        $t tag remove $tag $start_line.0 $end
    }

    set line_no $start_line
    set next_no [expr {$start_line + 1}]

    if {$end_line == "end"} {
        set proc_no 0
        set editor($editor_no,procs) ""
    } else {
        set proc_no $editor($editor_no,proc_no)
    }

    while {[set line [$t get $line_no.0 $next_no.0]] != "" && $line_no <= $end_line} {
        # replace all tabs with spaces for consistency/simpler comparisons
        regsub -all "\t" $line " " line

        set trimmed [string trim $line]
        set we [string wordend $trimmed 0]
        set first_word [string range $trimmed 0 [expr {$we - 1}]]

        if {[string range $trimmed 0 0] == "#"} {
            # comment line, simply colour the whole line
            $t tag add comment $line_no.0 $line_no.end
        } elseif {$first_word == "proc"} {
            # proc statement, colour the whole line and add the proc name to the proc list
            set end [string first " " $trimmed [expr {$we + 1}]]
            if {$end == -1} {
                # provide some extra handling for procedure names ending with semi-colon
                # this to support some other languages besides tcl
                set end [string first ";" $trimmed [expr {$we + 1}]]
            }

            set proc_name [string trim [string range $trimmed [expr {$we + 1}] $end]]
            if {$proc_name != ""} {
                set exists 0
                foreach procs $editor($editor_no,procs) {
                    if {[lindex $procs 0] == $proc_name} {
                        set exists 1
                        break
                    }
                }
                if {!$exists} {
                    incr proc_no
                    $t mark set mark_$proc_no $line_no.0
                    lappend editor($editor_no,procs) [list $proc_name $proc_no]
                    $t tag add proc $line_no.0 $line_no.end
                }
            }
        } else {
            # general line, review all words within the line and colourise appropriately
            set startx 0
            set word ""
            set length [string length $line]
            set quote 0

            for {set x 0} {$x < $length} {incr x} {
                set c [string range $line $x $x]
                if {$quote != 0} {
                    if {$c == $quote} {
                        tag_word $editor_no $word $t $line_no $startx [expr {$x + 1}] "string"
                        set quote 0
                        set word ""
                    }
                } elseif {[string first $c "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.$:"] != -1} {
                    if {$word == ""} { set startx $x }
                    append word $c
                } elseif {$word != ""} {
                    tag_word $editor_no $word $t $line_no $startx $x
                    set word ""
                } elseif {$c == "\"" || $c == "'"} {
                    set startx $x
                    set quote $c
                }
                if {$c == "\\"} { incr x }
            }

            if {$word != ""} {
                tag_word $editor_no $word $t $line_no $startx $x
            }
        }

        incr line_no
        incr next_no
    }

    # store the most recent procedure number (proc_no)
    set editor($editor_no,proc_no) $proc_no

    # set "syntax" flag
    set editor($editor_no,syntax) 1

    update_status $editor_no
}

#== double-click on braces to select text ==================================#

proc selectClosingBrace {widget} {
    if {[string equal [$widget get insert-1chars] \\ ] } {
    return 0
    }
    set mark [$widget index insert]
    set openingChar [$widget get $mark]
    switch $openingChar \{ {
    set closingChar \}
    } \" {
    set closingChar \"
    } \[ {
    set closingChar \]
    } default {
    return 0
    }
    set target [$widget index $mark+1chars]
    while {![info complete [$widget get $mark $target+1chars]]} {
    set target [$widget search $closingChar $target+1chars end]
    if {$target == ""} {
        return 0
    }
    }
    $widget tag add sel $mark $target+1chars
    return 1
}

#== validate procedures =============================================#

# this procedure hasn't been tested to work yet
# the "delete" event needs to be modified to remove all marks within the deleted text
# see "proc $t" the overriding text widget procedure

proc validate_procedures { editor_no } {
    global editor
    set t $editor($editor_no,text)

    # check each procedure mark still exists, if not then delete the procedure name
    set index 0
    foreach procs $editor($editor_no,procs) {
        set no [lindex $procs 1]
        if {[$t index mark_$no] == ""} {
            set editor($editor_no,procs) [lreplace $editor($editor_no,procs) $index $index]
        }
        incr index
    }
}

#== update'status ===================================================#

# this procedure updates the right hand panel which includes the file/directory, status and procedures
# this procedure is normally called after every key/button release to update the cursor position

proc update_status { editor_no } {
    global editor

    set sw $editor($editor_no,status_window)
    set t $editor($editor_no,text)

    $sw configure -state normal
    $sw delete 1.0 end

    $sw insert end "File:\t$editor($editor_no,title)\n"
    $sw insert end "Dir:\t[file dirname $editor($editor_no,file)]\n"

    #$sw insert end "Editor:\tVersion $editor(version)\n"
    if {$editor($editor_no,status) != "Running"} {
        $sw insert end "Status:\t$editor($editor_no,status)\n"
    } else {
        $sw insert end "Status:"
        $sw insert end "\t$editor($editor_no,status)\n" running
    }

    $sw insert end "Position:\t[$t index insert]\n\n"

    foreach procs [lsort -index 0 $editor($editor_no,procs)] {
        set proc [lindex $procs 0]
        set no [lindex $procs 1]
        set original_bg [$sw cget -background]
        $sw tag bind proc_$no <Any-Enter> "$sw tag configure proc_$no -background skyblue1"
        $sw tag bind proc_$no <Any-Leave> "$sw tag configure proc_$no -background $original_bg"
        $sw tag bind proc_$no <1> "$t mark set insert mark_$no;$t see insert;update_status $editor_no"
        $sw insert end "$proc\n" proc_$no
    }

    $sw configure -state disabled
}

#== dynamic window menu option for selecting any active editor window ============================#
proc create_main_window {} {
    global editor editor_no images_dir loadtk
    #
    # add the "file" menu
    # all windows have the close and exit function
    # new            - opens a new empty window
    # open           - opens a file, user select file using file dialog
    # close          - window function closes the window and remove from the windows list
    # save           - save current window to file
    # save as        - save current window to user specify filename
    # save output    - save the output window to a file
    # save output as - save the output window to a user specify filename
    # refresh        - refresh the edit file by reading file from disk
    # exit           - close all window and editor
    #
    menu .menu -tearoff 0
    set m .menu.file
    menu $m -tearoff 0
    .menu add cascade -label "File" -menu $m
    $m add command -label "New" -command "new_file"
    $m add command -label "Open..." -command "open_file"
    $m add command -label "Close File" -command "close_window"
    $m add command -label "Save" -command "save_file"
    $m add command -label "Save As..." -command "save_file_as"
    $m add separator
    $m add command -label "Save Output" -command "save_output"
    $m add command -label "Save Output As..." -command "save_output_as"
    $m add separator
    $m add command -label "Refresh" -command "refresh_file"
    # windows? include the "Print" option
    #if {$::tcl_platform(platform) == "windows"} {
    #    $m add command -label "Print" -command "print_file $editor_no" -underline 0 -accelerator Ctrl+P
    #}
    #
    # the exit function closes all windows then exits the application
    $m add separator
    $m add command -label "Exit EDITOR" -underline 1 -command "exit_editor"
    #
    # add the "edit" menu
    #
    set m .menu.edit
    menu $m -tearoff 1
    .menu add cascade -label "Edit" -menu $m
    if {$editor(platform) == "windows"} {
        $m add command -label "Undo" -command "textUndo" -accelerator Ctrl+Z
        $m add separator
        $m add command -label "Cut" -command "textCut" -accelerator Ctrl+X
        $m add command -label "Copy" -command "textCopy" -accelerator Ctrl+C
        $m add command -label "Paste" -command "textPaste" -accelerator Ctrl+V
    } else {
        $m add command -label "Undo" -command "textUndo"
        $m add separator
        $m add command -label "Cut" -command "textCut"
        $m add command -label "Copy" -command "textCopy"
        $m add command -label "Paste" -command "textPaste"
    }

    # add the "view" menu
    set m .menu.view
    menu $m -tearoff 1
    .menu add cascade -label "View" -menu $m
    $m add command -label "Goto Line" -command "goto_line"
    $m add check -label "Word Wrap" -command "toggle_word_wrap" -variable editor(wordwrap) -onvalue 1 -offvalue 0
    $m add separator
    $m add command -label "Refresh Highlighting" -command "syntax_highlight 1 end"
    $m add separator
    if {$editor(platform) == "windows"} {
        $m add command -label "Font Larger" -command "view_font_size 1" -accelerator Ctrl+Plus
        $m add command -label "Font Smaller" -command "view_font_size -1" -accelerator Ctrl+Minus
    } else {
        $m add command -label "Font Larger" -command "view_font_size 1"
        $m add command -label "Font Smaller" -command "view_font_size -1"
    }
    $m add separator
    $m add check -label "Show Toolbar" -command "make_window_active" -variable editor(toolbar) -onvalue 1 -offvalue 0

    # add the "Search" menu
    set m .menu.search
    menu $m -tearoff 1
    .menu add cascade -label "Search" -menu $m
    # the following commands are duplicated below, see the keyboard/accelerator bindings
    if {$editor(platform) == "windows"} {
        $m add command -label "Find ..." -accelerator Ctrl+F -command "search_find"
        $m add command -label "Find Next" -accelerator "F3" -command "search_find_next"
        $m add command -label "Replace ..." -accelerator Ctrl+H -command "search_replace"
    } else {
        $m add command -label "Find ..." -command "search_find"
        $m add command -label "Find Next" -command "search_find_next"
        $m add command -label "Replace ..." -command "search_replace"
    }
    $m add separator
    $m add command -label "Grep ..." -command "grep_search $editor_no"

    # add the "test" menu
    set m .menu.run
    menu $m -tearoff 1
    .menu add cascade -label "Run" -menu $m
    $m add command -label "Start" -command "Run"
    $m add separator
    $m add command -label "Reset" -command "Reset"
    $m add check -label "Load Tk" -command "toggle_load_Tk" -variable loadtk -onvalue 1 -offvalue 0
    $m add command -label "Clear Display" -command "Clear_Output"

    # create the "window" menu option
    set m .menu.window
    menu $m -tearoff 0 -postcommand "create_window_menu $m"
    .menu add cascade -label "Window" -menu $m

    # create the "window" menu option
    set m .menu.help
    menu $m -tearoff 0
    .menu add cascade -label "Help" -menu $m
    if {$editor(platform) == "windows"} {
        $m add command -label "Tcl Editor Help" -command {callbrowser $opwebhlp $edit_help_dir}
        $m add command -label "Tcl/Tk Command Help" -command {callbrowser $opwebhlp $cmd_help_dir}
        $m add separator
        $m add command -label "ispLEVER Help" -command {callbrowser $opwebhlp $isp_help_dir}
        #$m add command -label "Tcl Editor Help" -command {runCmd "cmd.exe /C \"$opwebhlp\" \"$edit_help_dir\""}
        #$m add command -label "Tcl/Tk Command Help" -command {runCmd "cmd.exe /C \"$opwebhlp\" \"$cmd_help_dir\""}
        #$m add separator
        #$m add command -label "ispLEVER Help" -command {runCmd "cmd.exe /C \"$opwebhlp\" \"$isp_help_dir\""}
    } else {
        $m add command -label "Tcl Editor Help" -command {runCmd "opwebhlp \"$edit_help_dir\""}
        $m add command -label "Tcl/Tk Command Help" -command {runCmd "opwebhlp \"$cmd_help_dir\""}
        $m add separator
        $m add command -label "ispLEVER Help" -command {runCmd "opwebhlp \"$isp_help_dir\""}
    }

    $m add separator
    $m add command -label "About Tcl Editor..." -command about_window

    . configure -menu .menu
    #
    # create toolbar
    #
    if {$editor(platform) == "unix"} {
        set toolframe [frame .toolframe -relief raised -borderwidth 1 -highlightthickness 0]
    } else {
        set toolframe [frame .toolframe -relief flat -borderwidth 0 -highlightthickness 0]
        set sep [Separator::create $toolframe.sep -orient horizontal -background white]
        pack $sep -fill x
    }
    #
    # For new, open, save, saveAs and close
    #
    set bbox [ButtonBox::create $toolframe.bbox1 -spacing 1 -padx 1 -pady 1]
    set toolbarButtons(new) [ButtonBox::add $bbox -image [Bitmap::get new] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "New" -command "new_file" ]
    set toolbarButtons(open) [ButtonBox::add $bbox -image [Bitmap::get open] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Open" -command "open_file" ]
    set toolbarButtons(save) [ButtonBox::add $bbox -image [Bitmap::get save] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Save" -command "save_file"]
    #set toolbarButtons(saveAll) [ButtonBox::add $bbox -image [Bitmap::get saveAll] \
    #        -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
    #        -helptext "Save File As" -command Editor::save_file_as]
    set toolbarButtons(close) [ButtonBox::add $bbox -image [Bitmap::get delete] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Close" -command "close_window"]
    pack $bbox -side left -anchor w
    set sep0 [Separator::create $toolframe.sep0 -orient vertical]
    pack $sep0 -side left -fill y -padx 4 -anchor w
    #
    # For undo, cut, copy and paste
    #
    set bbox [ButtonBox::create $toolframe.bbox2 -spacing 1 -padx 1 -pady 1]
    set toolbarButtons(undo) [ButtonBox::add $bbox -image [Bitmap::get undo] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Undo" -command "textUndo" ]
    set toolbarButtons(cut) [ButtonBox::add $bbox -image [Bitmap::get cut] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Cut selection" -command "textCut"]
    set toolbarButtons(copy) [ButtonBox::add $bbox -image [Bitmap::get copy] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Copy selection" -command "textCopy"]
    set toolbarButtons(paste) [ButtonBox::add $bbox -image [Bitmap::get paste] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Paste from Clipboard" -command "textPaste"]
    pack $bbox -side left -anchor w
    set sep2 [Separator::create $toolframe.sep2 -orient vertical]
    pack $sep2 -side left -fill y -padx 4 -anchor w
    #
    # For find and replace
    #
    set bbox [ButtonBox::create $toolframe.bbox3 -spacing 1 -padx 1 -pady 1]
    set toolbarButtons(find) [ButtonBox::add $bbox -image [Bitmap::get find] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Find ..." -command "search_find" ]
    set toolbarButtons(replace) [ButtonBox::add $bbox -image [Bitmap::get replace] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Replace ..." -command "search_replace" ]
    pack $bbox -side left -anchor w
    set sep3 [Separator::create $toolframe.sep3 -orient vertical]
    pack $sep3 -side left -fill y -padx 4 -anchor w
    #
    # For increase and decrease font
    #
    set bbox [ButtonBox::create $toolframe.bbox5 -spacing 0 -padx 1 -pady 1]
    set toolbarButtons(incFont) [ButtonBox::add $bbox -image [Bitmap::get incfont] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Increase Fontsize" -command "view_font_size 1"]
    set toolbarButtons(decFont) [ButtonBox::add $bbox -image [Bitmap::get decrfont] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Decrease Fontsize" -command "view_font_size -1"]
    pack $bbox -side left -anchor w
    set sep5 [Separator::create $toolframe.sep5 -orient vertical]
    pack $sep5 -side left -fill y -padx 4 -anchor w
    #
    # For Test run
    #
    set bbox [ButtonBox::create $toolframe.bbox4 -spacing 1 -padx 1 -pady 1]
    set toolbarButtons(find) [ButtonBox::add $bbox -image [Bitmap::get debug] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Start Script" -command "Run" ]
    pack $bbox -side left -anchor w
    set sep4 [Separator::create $toolframe.sep4 -orient vertical]
    pack $sep4 -side left -fill y -padx 4 -anchor w
    #
    # Exit editor
    #
    set bbox [ButtonBox::create $toolframe.bbox6 -spacing 1 -padx 1 -pady 1]
    ButtonBox::add $bbox -image [Bitmap::get exitdoor] \
            -highlightthickness 0 -takefocus 0 -relief link -borderwidth 1 -padx 1 -pady 1 \
            -helptext "Exit Editor" -command "exit_editor"
    pack $bbox -side right -anchor w

    set editor(toolframe) $toolframe
}

proc make_window_active { {window_no -1} } {
    global editor editor_no images_dir loadtk

    set current $editor(current)
    if {$window_no > 0} {
        set editor_no $window_no
        # same file? do nothing (return)
        if {$current == $editor_no} { return }
    }

    if {$current != ""} {
        if {$editor($current,loadtk)} {interp eval $editor($current,slave) "wm iconify ."}
        set w $editor($current,window)
        pack forget $w
    }

    if ($editor(toolbar)) {
        pack $editor(toolframe) -expand no -fill x
    } else {
        pack forget $editor(toolframe)
    }

    # get the text and output widget window
    set t $editor($editor_no,text)
    set o $editor($editor_no,outdsply)

    #if {[catch {set ww $editor($editor_no,slave)} msg]} {set editor($editor_no,slave) [SlaveInit shell_$editor_no]}
    if {![interp exists shell_$editor_no]} {
        set editor($editor_no,slave) [SlaveInit shell_$editor_no]
    } else {
        if {$editor($editor_no,loadtk)} {interp eval $editor($editor_no,slave) "wm deiconify ."}
    }

    # the title of the window is "filename"
    wm title . $editor($editor_no,file)

    # display the selected window on the screen
    set w $editor($editor_no,window)
    pack $w -expand yes -fill both

    # Set the Load Tk menu item
    #set loadtk $editor($editor_no,loadtk)
    #. configure -menu .menu

    # store the current editor number
    set editor(current) $editor_no

    # has window been opened with syntax highlighting?
    if {!$editor($editor_no,syntax)} {
        syntax_highlight 1 end
    }

    # focus on the text widget
    focus -force $t

    update_status $editor_no
}
#
# Run the example in the shell
#
proc Run {} {
    global editor editor_no

    # check status of window before running
    while {$editor($editor_no,status) == "MODIFIED"} {
        set option [tk_messageBox -title "Save changes before running?" -icon question -type yesnocancel -default yes \
            -message "File \"$editor($editor_no,file)\" has been modified.\nDo you want to save the changes?"]

        if {$option == "yes"} {
            save_file
        } elseif {$option != "no"} {
            return 0
        } else {
            break
        }
    }

    # Update status to running before starting the command eval
    set editor($editor_no,status) "Running"
    update_status $editor_no
    EvalEcho $editor_no
    set editor($editor_no,status) ""
    update_status $editor_no
}
#
# Reset the slave Tcl interpreter
#
proc Stop { editor_no } {
    global editor

    set editor($editor_no,slave) [ResetAlias $editor($editor_no,slave)]
    set o $editor($editor_no,outdsply)
    $o mark gravity limit right
    $o insert limit "\n\nRun stop by user\n\n" error
    $o insert limit "<$editor($editor_no,prompt)-$editor($editor_no,event)>" prompt
    $o mark gravity limit left
}
#
# Reset the slave Tcl interpreter
#
proc Reset {} {
    global editor editor_no

    # If no batch was running, clear status
    if {$editor($editor_no,status) != "Running"} {
        set editor($editor_no,slave) [ResetAlias $editor($editor_no,slave)]
        set editor($editor_no,event) 1
        Clear_Output
        set o $editor($editor_no,outdsply)
    }
}
#
# Load Tk when creating slave
#
proc toggle_load_Tk {} {
    global editor editor_no loadtk

    set editor($editor_no,loadtk) $loadtk
    Reset
}
#
# dynamically create the "window" menu with a list of all open files
#
proc about_window {} {
    global editor

    set w .about

    # destroy the find window if it already exists
    if {[winfo exists $w]} { destroy $w }

    # create the new "find" window
    toplevel $w
    wm transient $w .
    wm title $w "About - Tcl/Tk Editor"

    canvas $w.c -height 75 -width 300
    $w.c create image 150 40 -image [Bitmap::get lattice]
    label $w.1 -text "Tcl/Tk Editor" -font {Arial 16 bold} -fg blue
    label $w.2 -text "Developed by Lattice Semiconductor Corp." -font {Arial 11} -fg darkblue
    label $w.3 -text "widgets from Peter Campbell and Bryan Oakley" -font {Arial 11} -fg darkblue
    label $w.4 -text "Web Site: http://www.latticesemi.com" -font {Arial 10} -fg darkblue

    button $w.b -text "Close" -command "destroy $w"

    pack $w.c $w.1 $w.2 $w.3 $w.4 $w.b -pady 5
    focus -force $w.b

    centre_window $w
}
#
# Create window menus
#
proc create_window_menu { m } {
    global editor

    # remove all existing options
    $m delete 0 end

    # starting menu item (1, 2, 3 ... A, B, C ...)
    set number 1

    foreach name [lsort -dictionary [array names editor *,file]] {
        set no [lindex [split $name ","] 0]
        if {$editor($no,status) != "CLOSED"} {
            if {$number < 10} {
                set item $number
            } else {
                set item [format "%2X" [expr {$number + 55}]]
                eval "set item \\\x$item"
            }
            if {$item <= "Z"} {
                $m add check -label "$item. $editor($no,title)" -command "make_window_active $no" \
                    -variable editor($no,status) -onvalue $editor($no,status) -offvalue $editor($no,status) \
                    -indicatoron [expr {$editor($no,status) == "MODIFIED"}]
            } else {
                $m add check -label "$editor($no,title)" -command "make_window_active $no" \
                    -variable editor($no,status) -onvalue $editor($no,status) -offvalue $editor($no,status) \
                    -indicatoron [expr {$editor($no,status) == "MODIFIED"}]
            }
            incr number
        }
    }
}

#== search_find =====================================================#

proc search_find { } {
    global editor editor_no

    set w .find

    # destroy the find window if it already exists
    if {[winfo exists $w]} { destroy $w }

    # create the new "find" window
    toplevel $w
    wm transient $w .
    wm title $w "Find"

    set f1 [frame $w.f1]
    set f2 [frame $w.f2]

    set ft [frame $f1.top]
    label $ft.text -text "Find What?"
    set entry [combobox::combobox $ft.find -width 30 -value [lindex $editor(find_history) 0]]
    pack $ft.text -side left -anchor nw -padx 4 -pady 4
    pack $entry -side left -anchor nw -padx 4 -pady 4
    pack $ft -side top -anchor nw

    checkbutton $f1.case -text "Match Case?" -variable editor(match_case)
    pack $f1.case -side left -padx 4 -pady 4

    # populate the combobox with the editor find history
    foreach string $editor(find_history) {
        $entry list insert end $string
    }

    button $f2.find -text "Find Next" -command "search_find_command $editor_no $w $entry" -width 10
    button $f2.cancel -text "Cancel" -command "destroy $w" -width 10
    pack $f2.find -side top -padx 8 -pady 4
    pack $f2.cancel -side top -padx 8 -pady 4

    pack $f1 -side left -anchor nw
    pack $f2 -side left -anchor nw

    bind $entry.entry <Return> "+search_find_command $editor_no $w $entry"
    bind $entry.entry <Escape> "destroy $w"

    focus -force $entry
    centre_window $w
}

proc search_find_command { editor_no w entry } {
    global editor
    set editor(find_string) [$entry get]
    destroy $w

    # null string? do nothing
    if {$editor(find_string) == ""} {
        return
    }

    # search "again" (starting from current position)
    search_find_next 0
}

proc search_find_next { {incr 1} } {
    global editor editor_no focus_text

    switch $focus_text {
        0 {return}
        1 {set t $editor($editor_no,text)}
        #2 {set t $editor($editor_no,outdsply)}
        default {return}
    }

    # check/add the string to the find history
    set list [lsearch -exact $editor(find_history) $editor(find_string)]
    if {$list != -1} {
        set editor(find_history) [lreplace $editor(find_history) $list $list]
    }
    set editor(find_history) [linsert $editor(find_history) 0 $editor(find_string)]

    set pos [$t index insert]
    set line [lindex [split $pos "."] 0]
    set x [lindex [split $pos "."] 1]
    incr x $incr

    # attempt to find the string
    if {$editor(match_case)} {
        set pos [$t search -- $editor(find_string) $line.$x end]
    } else {
        set pos [$t search -nocase -- $editor(find_string) $line.$x end]
    }

    # if found then move the insert cursor to that position, otherwise beep
    if {$pos != ""} {
        $t mark set insert $pos
        $t see $pos

        # highlight the found word
        set line [lindex [split $pos "."] 0]
        set x [lindex [split $pos "."] 1]
        set x [expr {$x + [string length $editor(find_string)]}]
        $t tag remove sel 1.0 end
        $t tag add sel $pos $line.$x
        focus -force $t
        update_status $editor_no
        return 1
    } else {
        bell
        return 0
    }
}

proc search_replace { } {
    global editor editor_no

    set w .find

    # destroy the find window if it already exists
    if {[winfo exists $w]} { destroy $w }

    # create the new "find" window
    toplevel $w
    wm transient $w .
    wm title $w "Find & Replace"

    set f1 [frame $w.f1]
    set f2 [frame $w.f2]

    set ft [frame $f1.top]
    label $ft.text -text "Find What?" -width 15
    set entry [combobox::combobox $ft.find -width 30 -value [lindex $editor(find_history) 0]]
    pack $ft.text -side left -anchor nw -padx 4 -pady 4
    pack $entry -side left -anchor nw -padx 4 -pady 4
    pack $ft -side top -anchor nw

    set rt [frame $f1.bot]
    label $rt.text -text "Replace with" -width 15
    set replace [combobox::combobox $rt.replace -width 30 -value [lindex $editor(replace_history) 0]]
    pack $rt.text -side left -anchor nw -padx 4 -pady 4
    pack $replace -side left -anchor nw -padx 4 -pady 4
    pack $rt -side top -anchor nw

    checkbutton $f1.case -text "Match Case?" -variable editor(match_case)
    pack $f1.case -side left -padx 4 -pady 4

    # populate the combobox with the editor find history
    foreach string $editor(find_history) {
        $entry list insert end $string
    }

    # populate the combobox with the editor replace history
    foreach string $editor(replace_history) {
        $replace list insert end $string
    }

    button $f2.find -text "Find Next" -command "search_replace_command $editor_no $w $entry $replace find" -width 10 -pady 0
    button $f2.find1 -text "Replace" -command "search_replace_command $editor_no $w $entry $replace replace" -width 10 -pady 0
    button $f2.find2 -text "Replace All" -command "search_replace_command $editor_no $w $entry $replace all" -width 10 -pady 0
    button $f2.cancel -text "Cancel" -command "destroy $w" -width 10 -pady 0
    pack $f2.find -side top -padx 8 -pady 2
    pack $f2.find1 -side top -padx 8 -pady 2
    pack $f2.find2 -side top -padx 8 -pady 2
    pack $f2.cancel -side top -padx 8 -pady 2

    pack $f1 -side left -anchor nw
    pack $f2 -side left -anchor nw

    bind $entry.entry <Escape> "destroy $w"
    bind $replace.entry <Escape> "destroy $w"

    focus -force $entry
    centre_window $w
}

proc search_replace_command { editor_no w entry replace command } {
    global editor
    set editor(find_string) [$entry get]
    set editor(replace_string) [$replace get]

    # check/add the string to the find history
    set list [lsearch -exact $editor(find_history) $editor(find_string)]
    if {$list != -1} {
        set editor(find_history) [lreplace $editor(find_history) $list $list]
    }
    set editor(find_history) [linsert $editor(find_history) 0 $editor(find_string)]

    # check/add the string to the replace history
    set list [lsearch -exact $editor(replace_history) $editor(replace_string)]
    if {$list != -1} {
        set editor(replace_history) [lreplace $editor(replace_history) $list $list]
    }
    set editor(replace_history) [linsert $editor(replace_history) 0 $editor(replace_string)]

    switch -- $command {
        "find" {
            # search "again" (starting from current position)
            search_find_next 1
        }
        "replace" {
            if {[replace_one $editor_no 0]} {
                search_find_next 1
            }
        }
        "all" {
            set replace_count 0
            if {[replace_one $editor_no 0]} {
                incr replace_count
                while {[replace_one $editor_no 1]} {
                    incr replace_count
                }
            }
            tk_messageBox -icon info -title "Replace" -message "$replace_count item(s) replaced."
            destroy $w
        }
    }
}

proc replace_one { editor_no incr } {
    global editor

    if {[search_find_next $incr]} {
        set t $editor($editor_no,text)
        set selected [$t tag ranges sel]
        set start [lindex $selected 0]
        set end [lindex $selected 1]
        $t delete $start $end
        $t insert [$t index insert] $editor(replace_string)
        return 1
    } else {
        return 0
    }
}

#== grep search (mulitple files) ===========================================#

proc grep_search { editor_no } {
    global editor

    set w .grep

    # destroy the find window if it already exists
    if {[winfo exists $w]} { destroy $w }

    # create the new "find" window
    toplevel $w
    wm transient $w .
    wm title $w "Grep"

    set f1 [frame $w.f1]
    set f2 [frame $w.f2]

    set ft [frame $f1.top]
    label $ft.text -text "Find What?" -width 12
    set entry [combobox::combobox $ft.find -width 30 -value [lindex $editor(find_history) 0]]
    pack $ft.text -side left -anchor nw -padx 4 -pady 4
    pack $entry -side left -anchor nw -padx 4 -pady 4
    pack $ft -side top -anchor nw

    set fp [frame $f1.path]
    label $fp.text -text "Search Path" -width 12
    entry $fp.entry -width 30 -textvariable editor(grep_path)
    pack $fp.text -side left -anchor nw -padx 4 -pady 4
    pack $fp.entry -side left -anchor nw -padx 4 -pady 4
    pack $fp -side top -anchor nw

    set editor(grep_ext) $editor(default_ext)
    set fe [frame $f1.ext]
    label $fe.text -text "Search Ext" -width 12
    entry $fe.entry -width 30 -textvariable editor(grep_ext)
    pack $fe.text -side left -anchor nw -padx 4 -pady 4
    pack $fe.entry -side left -anchor nw -padx 4 -pady 4
    pack $fe -side top -anchor nw

    checkbutton $f1.case -text "Match Case?" -variable editor(match_case)
    pack $f1.case -side left -padx 4 -pady 4

    # populate the combobox with the editor find history
    foreach string $editor(find_history) {
        $entry list insert end $string
    }

    button $f2.find -text "Start" -command "grep_search_now $w $entry" -width 10
    button $f2.cancel -text "Cancel" -command "destroy $w" -width 10
    pack $f2.find -side top -padx 8 -pady 4
    pack $f2.cancel -side top -padx 8 -pady 4

    pack $f1 -side left -anchor nw
    pack $f2 -side left -anchor nw

    bind $entry.entry <Return> "+grep_search_now $w $entry"
    bind $entry.entry <Escape> "destroy $w"

    focus -force $entry
    centre_window $w
}

proc grep_search_now { w entry } {
    global editor
    set editor(find_string) [$entry get]
    destroy $w

    # null string? do nothing
    if {$editor(find_string) == ""} {
        return
    }

    # check/add the string to the find history
    set list [lsearch -exact $editor(find_history) $editor(find_string)]
    if {$list != -1} {
        set editor(find_history) [lreplace $editor(find_history) $list $list]
    }
    set editor(Find_History) [linsert $editor(find_history) 0 $editor(find_string)]

    # now get list of all files to open
    # has file already been loaded? if not open it
    # search file, display results in a window

    # make new editor window
    set editor_no [make_editor]
    make_window_active $editor_no

    set editor($editor_no,title) "Grep Search Results: $editor(find_string)"
    wm title . $editor($editor_no,title)

    set t $editor($editor_no,text)

    $t insert end "Search String: $editor(find_string)\nSearch Path: $editor(grep_path)\nSearch Ext: $editor(grep_ext)\n\n"

    # get list of files
    variable file_list {}
    grep_add_files ".[string trim $editor(grep_ext) .]" $editor(grep_path)

    set editor(grep_matches) 0

    set st [text .hidden]
    set tag_no 0

    # search each file
    foreach file [lsort -dictionary $file_list] {
        set file_tag tag[incr tag_no]

        $t insert end "$file ...\n" $file_tag
        $t see end
        update

        set matches 0

        # open the file (if not open already?)
        set fid [open $file]
        $st insert end [read -nonewline $fid]
        close $fid

        # search the file
        # attempt to find the string
        set current "1.0"

        while {1} {
            if {$editor(match_case)} {
                set pos [$st search -- $editor(find_string) $current end]
            } else {
                set pos [$st search -nocase -- $editor(find_string) $current end]
            }

            if {$pos != ""} {
                incr matches

                set line [lindex [split $pos .] 0]
                set current "$line.end"

                set tag tag[incr tag_no]
                set data [string trim [$st get "$line.0" "$line.end"]]
                $t insert end "\t$line: $data\n" $tag

                set bg [$t cget -background]
                $t tag bind $tag <Enter> "$t tag configure $tag -background skyblue"
                $t tag bind $tag <Leave> "$t tag configure $tag -background $bg"

                $t tag bind $tag <1> [list grep_click $file $pos]
            } else {
                break
            }
        }

        # remove contents from file
        $st delete 1.0 end

        # configure the "tag" for highlighting purposes
        if {$matches} {
            $t insert end "\n"
            incr editor(grep_matches) $matches
        } else {
            $t delete $file_tag.first $file_tag.last
        }
    }

    destroy $st

    $t insert end "\n[llength $file_list] file(s) were searched, $editor(grep_matches) match(es) were found.\n"
    $t insert end "Move the mouse over any search result and click to open the file and display the match.\n"
    $t see end

    # clear the status - default is "not modified"
    set editor($editor_no,status) ""
}

proc grep_add_files { ext dir } {
    variable file_list

    set pattern [file join $dir *]

    foreach filename [glob -nocomplain $pattern] {
        if {[file isdirectory $filename]} {
            grep_add_files $ext $filename
        }

        if {[file isfile $filename]} {
            if {[string tolower [file extension $filename]] == [string tolower $ext]} {
                lappend file_list $filename
            }
        }
    }
}

proc grep_click { file pos } {
    global editor

    # is the file already in memory?
    set active 0
    foreach name [lsort -dictionary [array names editor *,file]] {
        set no [lindex [split $name ","] 0]
        if {$editor($no,status) != "CLOSED" && [string equal -nocase $editor($no,file) $file]} {
            set editor_no $no
            set active 1
            break
        }
    }
    if {!$active} {
        set editor_no [make_editor $file]
    }

    set t $editor($editor_no,text)
    make_window_active $editor_no
    $t mark set insert $pos
    $t see insert
}

#== goto_line =======================================================#

proc goto_line {} {
    global editor editor_no

    set w .goto

    # destroy the find window if it already exists
    if {[winfo exists $w]} { destroy $w }

    # create the new "goto" window
    toplevel $w
    wm transient $w .
    wm title $w "Goto Line"

    label $w.text -text "Goto Line"
    entry $w.goto -width 6 -validate key -validatecommand "validate_number %W %P"
    pack $w.text $w.goto -side left -anchor nw

    bind $w.goto <Return> "+goto_line_no $editor_no $w"
    bind $w.goto <Escape> "destroy $w"
    focus -force $w.goto

    centre_window $w
}

proc validate_number { w new_value } {
    if {[string is integer $new_value]} {
        return 1
    } else {
        bell
        return 0
    }
}

proc goto_line_no { editor_no w } {
    global editor
    set line_no [$w.goto get]
    destroy $w

    catch {
        set t $editor($editor_no,text)
        $t mark set insert $line_no.0
        $t see insert
    }
}

#=================================================================#

# right click on any word and a popup menu offers the "find WORD" option.
# this is the same as the user pressing "Search-Find" (ctrl-f) then entering the word to search

proc popup_text_menu {editor_no x y} {
    global editor
    set t $editor($editor_no,text)

    # place the insert cursor at the mouse pointer
    $t mark set insert @$x,$y
    set pos [$t index insert]

    # get the first being clicked-on
    set string [string trim [$t get "insert wordstart" "insert wordend"]]

    # create the pop-up menu for "find word"
    set pw .popup
    catch {destroy $pw}
    menu $pw -tearoff false

    # if the mouse was clicked over a word then offer this word for "find"
    if {$string != ""} {
        $pw add command -label "Find \"$string\"" -command [list popup_find_text $editor_no $string]

        # if the string is a procedure name then allow the user to go directly to the procedure definition
        foreach procs $editor($editor_no,procs) {
            set proc [lindex $procs 0]
            set no [lindex $procs 1]
            if {$proc == $string} {
                $pw add command -label "Goto \"$string\" definition" -command "$t mark set insert mark_$no;$t see insert;update_status $editor_no"
                break
            }
        }

        $pw add separator
    }
    # display the "undo" option
    if {$editor(platform) == "windows"} {
        $pw add command -label "Undo" -command "textUndo" -accelerator Ctrl+Z
        $pw add separator
        # display the usual cut/copy/paste options
        $pw add command -label "Cut" -command "textCut" -accelerator Ctrl+X
        $pw add command -label "Copy" -command "tk_textCopy $t" -accelerator Ctrl+C
        $pw add command -label "Paste" -command "textPaste" -accelerator Ctrl+V
    } else {
        $pw add command -label "Undo" -command "textUndo"
        $pw add separator
        # display the usual cut/copy/paste options
        $pw add command -label "Cut" -command "textCut"
        $pw add command -label "Copy" -command "tk_textCopy $t"
        $pw add command -label "Paste" -command "textPaste"
    }
    tk_popup $pw $x $y
}

proc popup_find_text { editor_no string } {
    global editor
    set editor(find_string) $string
    search_find_next
}

proc toggle_word_wrap {} {
    global editor editor_no

    set t $editor($editor_no,text)
    switch -- $editor(wordwrap) {
        1 { $t configure -wrap word }
        default { $t configure -wrap none }
    }
}

proc view_font_size { increment } {
    global editor editor_no
    set t $editor($editor_no,text)
    set o $editor($editor_no,outdsply)
    set p $editor($editor_no,status_window)
    #
    # get font from editor window
    #
    set font [$t cget -font]
    set size [lindex $font 1]
    incr size $increment
    set font [lreplace $font 1 1 $size]
    #
    # update editor, output and status window
    #
    $t configure -font $font
    $o configure -font $font
    $p configure -font $font

    set editor(font) $font
}

proc previous_cmd { inc } {
    global editor editor_no

    set o $editor($editor_no,outdsply)
    set nextid [interp eval $editor($editor_no,slave) "history nextid"]

    if {$inc > 0} {
        ## Goto next command in history
        if {$editor($editor_no,event) < [expr $nextid - 1]} {
            $o delete limit end
            $o insert limit [interp eval $editor($editor_no,slave) "history event [incr editor($editor_no,event)]"]
            $o mark set insert end
            $o see end
        }
    } else {
        ## Goto previous command in history
        if {$editor($editor_no,event) > 1} {
            $o delete limit end
            $o insert limit [interp eval $editor($editor_no,slave) "history event [incr editor($editor_no,event) -1]"]
            $o mark set insert end
            $o see end
        }
    }
}

#== configure_window =================================================#

proc configure_window {} {

    global tcl_platform opwebhlp edit_help_dir
    # trap the EXIT [X] button "exit editor"
    wm protocol . WM_DELETE_WINDOW "exit_editor"

    # on windows we can maximise the window by default

    #if {$tcl_platform(platform) == "windows" && [info tclversion] >= 8.3} {
    #    #wm state . zoomed
    #}
    if {$tcl_platform(platform) == "windows"} {
        bind all <F1> "callbrowser \"$opwebhlp\" \"$edit_help_dir\";break"
        #bind all <F1> "runCmd \"cmd.exe /C $opwebhlp $edit_help_dir\" 0;break"
    } else {
        bind all <F1> "runCmd \"opwebhlp $edit_help_dir\" 0;break"
    }
}

#== output text window ==============================================#

proc Scrolled_Text { f args } {
    frame $f
    eval {text $f.text -wrap none \
        -xscrollcommand [list $f.xscroll set] \
        -yscrollcommand [list $f.yscroll set]} $args
    scrollbar $f.xscroll -orient horizontal \
        -command [list $f.text xview]
    scrollbar $f.yscroll -orient vertical \
        -command [list $f.text yview]
    grid $f.text $f.yscroll -sticky news
    grid $f.xscroll -sticky news
    grid rowconfigure $f 0 -weight 1
    grid columnconfigure $f 0 -weight 1
    return $f.text
}

#== make_editor =====================================================#

# this procedure makes a new editor window and creates all necessary bindings
# this procudure is called on start-up to load the files specified on the command line and for every "file open"

proc make_editor { {file ""} } {
    global editor editor_no editor_num splash_status focus_text
    #
    #  -----------------------
    #  |       f1      | f2  |
    #  |               |     |
    #  -----------------------
    #  |                     |
    #  |        f3           |
    #  -----------------------
    #
    # Create 2 vertical panel
    #
    set pw1 [PanedWindow::create .pw[incr editor_num] -side left -pad 0]
    set editor_no $editor_num
    #
    # Add top panel:tp and output display panel:f3
    #
    set tp [PanedWindow::add $pw1 -minsize 100]
    set f3 [PanedWindow::add $pw1 -minsize 100]
    #
    # Create another 2 veritcal panel from panel tp
    #
    set pw2 [PanedWindow::create $tp.top -side top -pad 0]
    #
    # Add left panel:f1 and right panel:f2
    #
    set f1 [PanedWindow::add $pw2 -minsize 100 ]
    set f2 [PanedWindow::add $pw2 -minsize 100 ]

    pack $tp -expand yes -fill both
    pack $pw2 -expand yes -fill both

    set editor($editor_num,window) $pw1
    set editor($editor_num,file) $file
    set editor($editor_num,title) [file tail $file]
    set editor($editor_num,status) ""
    set editor($editor_num,procs) ""
    set editor($editor_num,syntax) 0
    set editor($editor_num,outdsply) .out_$editor_num
    set editor($editor_num,slave) ""
    set editor($editor_num,writable) 1
    set editor($editor_num,text) ""
    set editor($editor_num,extension) ""
    set editor($editor_num,status_window) ""
    set editor($editor_num,prompt) ""
    set editor($editor_num,loadtk) 0
    set editor($editor_no,tkloaded) 0
    set editor($editor_num,outfile) ""
    set editor($editor_num,event) 1

    set splash_status "Loading [file tail $file] ..."
    update idletasks

    if {$file == ""} {
        set data ""
        set file "Untitled"
        # new files are always writable
        set editor($editor_num,writable) 1
        if {!$editor($editor_num,writable)} {
            set editor($editor_num,status) "READ ONLY"
        }
    } elseif {[catch {set fid [open $file]} msg]} {
        tk_messageBox -type ok -icon error -title "File Open Error" \
            -message "There was an error opening file \"$file\"; $msg."
        return false
    } else {
        set data [read -nonewline $fid]
        close $fid
        # record whether or not the file can be saved (is the file writable?)
        set editor($editor_num,writable) [file writable $file]
        if {!$editor($editor_num,writable)} {
            set editor($editor_num,status) "READ ONLY"
        }
    }
    #
    # create f1, the editor, top left pane
    #
    set t $f1.text
    set editor($editor_num,text) $t

    # save the file extension, this is used for syntax highlighting commands
    set editor($editor_num,extension) [string tolower [file extension $file]]

    set tx $f1.tx
    set ty $f1.ty

    # has a font been specified in the configuration file (editor.cfg) for this file type?
    if {[array names editor font,$editor($editor_num,extension)] != ""} {
        set font $editor(font,$editor($editor_num,extension))
    } else {
        set font $editor(font)
    }

    supertext::text $t -xscrollcommand "$tx set" -yscrollcommand "$ty set" -exportselection 1 \
        -wrap none -font $font -tabs {1c 2c 3c 4c 5c 6c}

    $t insert end $data
    $t reset_undo

    # provide a calling routine for the $t/text procedure to trap insert/delete commands
    rename $t $t\_
    proc $t {command args} "
        global editor

        # store line number where insert/delete starts
        if \{\[string equal \$command insert\] || \[string equal \$command delete\]\} \{
            set line1 \[lindex \[split \[$t\_ index insert\] .\] 0\]

            if {!$editor($editor_num,writable)} {
                bell
                return \"\"
            }
        \}

        # perform the specified command
        set result \[eval uplevel \[list $t\_ \$command \$args\]\]

        if \{\[string equal \$command insert\] || \[string equal \$command delete\]\} \{
            # insert/delete? syntax highlight the newly inserted text & checkall procedures
            set line2 \[lindex \[split \[$t\_ index insert\] .\] 0\]
            syntax_highlight \$line1 \$line2
            validate_procedures $editor_num
            set editor($editor_num,status) MODIFIED
            $t see insert
        \}

        if \{\[string equal \$command undo\]\} \{
            set editor($editor_num,status) MODIFIED
        \}

        return \$result"

    scrollbar $tx -command "$t xview" -orient h
    pack $tx -side bottom -fill x

    scrollbar $ty -command "$t yview"
    pack $ty -side right -fill y

    pack $t -side left -fill both -expand yes

    if $editor(wordwrap) {
        $t configure -wrap word
    } else {
        $t configure -wrap none
    }

    # update the screen/display status after every key/button release
    bind $t <KeyRelease> "update_status $editor_num"
    bind $t <ButtonRelease> "update_status $editor_num"

    if {$editor(platform) == "windows"} {
        # keyboard/accelerator bindings
        bind $t <Control-f> "search_find;break"
        bind $t <Control-F> "search_find;break"
        bind $t <F3> "search_find_next;break"
        bind $t <Control-h> "search_replace;break"
        bind $t <Control-H> "search_replace;break"

        bind $t <Control-X> "textCut;break"
        bind $t <Control-C> "tk_textCopy $t;break"
        bind $t <Control-V> "textPaste;break"

        # control-s, shortcut to save file
        bind $t <Control-s> "save_file;break"
        bind $t <Control-S> "save_file;break"

        #bind $t <Control-p> "print_file $editor_num;break"
        #bind $t <Control-P> "print_file $editor_num;break"

        bind $t <Control-plus> "view_font_size 1"
        bind $t <Control-minus> "view_font_size -1"

        # bind the right mouse click to select the current word and display a pop-up menu
        bind $t <ButtonPress-3> "popup_text_menu $editor_num %x %y"

        # bind the double click on text brace to select the braces
        bind $t <Double-Button> {if {[selectClosingBrace %W]} {break}}

        # bind control-g for "goto line number"
        bind $t <Control-g> "goto_line;break"
        bind $t <Control-G> "goto_line;break"

        # bind control-r for "Run"
        bind $t <Control-r> "Run;break"
        bind $t <Control-R> "Run;break"

        # bind control-d for "Clear_Output"
        bind $t <Control-d> "Clear_Output;break"
        bind $t <Control-D> "Clear_Output;break"

        # bind control-x to exit window
        #bind all <Control-x> "exit_editor;break"
        #bind all <Control-X> "exit_editor;break"

       # PCS time saving option for converting 4 spaces to Tab
      bind $t <F10> "replace_4_spaces $editor_num;break"
    }

    bind $t <FocusIn> {set focus_text 1}

    # see the syntax_highlighting procedure for details of each tag
    $t tag configure command -foreground blue
    $t tag configure number -foreground DarkGreen
    $t tag configure proc -foreground blue -font {Verdana 9 bold}
    $t tag configure comment -foreground green4
    $t tag configure variable -foreground red
    $t tag configure string -foreground purple
    $t tag configure sel -background skyblue

    # Add the frame assembly to the panedwindow
    pack $f1 -expand yes -fill both
    #
    # create f2, the status window, top right pane
    #
    set s $f2.text
    text $s -xscrollcommand "$f2.tx set" -yscrollcommand "$f2.ty set" \
        -wrap none -font $font -width 30 -cursor arrow
    scrollbar $f2.tx -command "$s xview" -orient h
    pack $f2.tx -side bottom -fill x
    scrollbar $f2.ty -command "$s yview"
    pack $f2.ty -side right -fill y
    pack $s -side left -fill both -expand yes
    $s tag configure running -foreground red
    set editor($editor_num,status_window) $s
    pack $f2 -expand yes -fill both
    #
    # create f3, the output, bottom pane
    #
    set o $f3.text
    set editor($editor_num,outdsply) $o

    set ox $f3.tx
    set oy $f3.ty
    supertext::text $o -xscrollcommand "$ox set" -yscrollcommand "$oy set" -exportselection 1 \
        -wrap none -font $font -tabs {1c 2c 3c 4c 5c 6c}

    scrollbar $ox -command "$o xview" -orient h
    pack $ox -side bottom -fill x

    scrollbar $oy -command "$o yview"
    pack $oy -side right -fill y

    pack $o -side left -fill both -expand yes

    # Text tags give script output, command errors, command
    # results, and the prompt a different appearance

    #$o tag configure prompt -underline true
    $o tag configure prompt -foreground blue
    $o tag configure result -foreground purple
    $o tag configure error -foreground red
    $o tag configure output -foreground blue
    $o tag configure commad -foreground maroon4
    $o tag configure warn -foreground sienna

    # Insert the prompt and initialize the limit mark

    set editor($editor_num,prompt) "tcl"

    $o insert insert "<$editor($editor_num,prompt)-$editor($editor_num,event)>" prompt
    $o mark set limit insert
    $o mark gravity limit left

    # Key bindings that limit input and eval things. The break in
    # the bindings skips the default Text binding for the event.

    bind $o <Return> {EvalTypein ; break}
    bind $o <BackSpace> {
        if {[%W tag nextrange sel 1.0 end] != ""} {
            %W delete sel.first sel.last
        } elseif {[%W compare insert > limit]} {
            %W delete insert-1c
            %W see insert
        }
        break
    }
    bind $o <Key> {
        if [%W compare insert < limit] {
            %W mark set insert end
        }
    }
    # keyboard/accelerator bindings
    #bind $o <Control-f> "search_find;break"
    #bind $o <Control-F> "search_find;break"
    #bind $o <F3> "search_find_next;break"

    #bind $o <Control-X> "textCut;break"
    #bind $o <Control-C> "tk_textCopy $t;break"
    #bind $o <Control-V> "textPaste;break"

    # bind control-r for "Run"
    bind $o <Control-r> "Run;break"
    bind $o <Control-R> "Run;break"

    # bind control-c for "Clear_Output"
    bind $o <Control-d> "Clear_Output;break"
    bind $o <Control-D> "Clear_Output;break"

    bind $o <Control-plus> "view_font_size 1"
    bind $o <Control-minus> "view_font_size -1"

    # bind <Up> for previou command
    bind $o <Up> "previous_cmd -1;break"

    # bind <Down> for next command
    bind $o <Down> "previous_cmd +1;break"

    # bind <Escape> delete current command
    bind $o <Escape> {
        %W delete limit end
    }

    # bind <Control-a> and <Home> key, place cursor after prompt
    bind $o <Control-a> {
    	if {[%W compare {limit linestart} == {insert linestart}]} {
    	    %W mark set insert limit
    	    break
    	}
    }
    bind $o <Key-Home> [bind $o <Control-a>]

    bind $o <FocusIn> {set focus_text 2}

    pack $f3 -expand yes -fill both

    focus -force $t
    $t mark set insert 1.0

    syntax_highlight 1 end

    return $editor_num
}

proc refresh_file {} {
    global editor editor_no

    set file $editor($editor_no,file)

    if {$file == ""} {
        set data ""
        set file "Untitled"
        set editor($editor_no,writable) 1
    } elseif {[catch {set fid [open $file]} msg]} {
        tk_messageBox -type ok -icon error -title "File Open Error" \
            -message "There was an error opening file \"$file\"; $msg."
        return false
    } else {
        set data [read -nonewline $fid]
        close $fid
        # record whether or not the file can be saved (is the file writable?)
        set editor($editor_no,writable) [file writable $file]
        if {!$editor($editor_no,writable)} {
            set editor($editor_no,status) "READ ONLY"
        }
    }

    set t $editor($editor_no,text)
    $t delete 1.0 end

    $t insert end $data
    $t reset_undo

    update_status $editor_no
}

proc replace_4_spaces { editor_no } {
    global editor
    set t $editor($editor_no,text)

    # if the cursor is at the start of 4 spaces then replace them with a tab character
    if {[$t get "insert" "insert+4c"] == "    "} {
        $t delete "insert" "insert+4c"
        $t insert "insert" "\t"
    } elseif {[$t get "insert" "insert+5c"] == "\t    "} {
        $t delete "insert" "insert+5c"
        $t insert "insert" "\t\t\t"
    } elseif {[$t get "insert" "insert+1c"] == "\t"} {
        $t delete "insert" "insert+1c"
        $t insert "insert" "\t\t"
    }

    set pos [$t index "insert"]
    set line_no [expr {[lindex [split $pos "."] 0] + 1}]
    $t mark set insert "$line_no.0"
    $t see $pos
}

#== open file =======================================================#

proc open_file {} {
    global editor editor_no
    global file_types

    set file $editor($editor_no,file)
    if {$file != ""} {
        set pwd [file dirname $file]
        set ext $editor($editor_no,extension)
    } else {
        set pwd [pwd]
        set ext $editor(default_ext)
    }

    set file [tk_getOpenFile -title "Open File" -initialdir $pwd -initialfile "*.[string trim $ext .]" \
        -defaultextension ".[string trim $ext .]" -filetypes $file_types]

    if {$file != ""} {
        make_window_active [make_editor $file]
    }
}

#== new file =======================================================#

proc new_file {} {

    make_window_active [make_editor ]

}

#== save file =======================================================#

proc save_file {} {
    global editor editor_no

    set file $editor($editor_no,file)

    if {$file == ""} {
        save_file_as
    } else {
        set fid [open $file w+]
        set t $editor($editor_no,text)
        puts -nonewline $fid [$t get 1.0 end]
        close $fid
        set editor($editor_no,status) ""
        update_status $editor_no
        # previously we undid the "undo" status after saving
        # now allow undo to go back since the file was originally opened
    }
}

#== save file as ====================================================#

proc save_file_as {} {
    global editor editor_no
    global file_types

    set file $editor($editor_no,file)

    set file [tk_getSaveFile -title "Save File" -initialdir [pwd] -initialfile $file -filetypes $file_types]

    if {$file != ""} {
        set fid [open $file w+]
        set t $editor($editor_no,text)
        puts -nonewline $fid [$t get 1.0 end]
        close $fid
        set editor($editor_no,status) ""
        set editor($editor_no,file) $file
        set editor($editor_no,title) [file tail $file]
        wm title . $editor($editor_no,title)

        # reset the undo status
        set t $editor($editor_no,text)
        $t reset_undo

        # update the file extension, this is used for syntax highlighting commands
        set editor($editor_no,extension) [string tolower [file extension $file]]
    }
}

#== save file =======================================================#

proc save_output {} {
    global editor editor_no

    set file $editor($editor_no,outfile)

    if {$file == ""} {
        save_output_as
    } else {
        set fid [open $file w+]
        set t $editor($editor_no,outdsply)
        puts -nonewline $fid [$t get 1.0 end]
        close $fid
    }
}

#== save output as ====================================================#

proc save_output_as {} {
    global editor editor_no

set file_types {
    {{Log file}   {.log}  }
    {{Data file}  {.data} }
    {{Text Files} {.txt}  }
    {{All Files}    *     }}

    set file $editor($editor_no,outfile)

    set file [tk_getSaveFile -title "Save File" -initialdir [pwd] -initialfile $file -filetypes $file_types]

    if {$file != ""} {
        set fid [open $file w+]
        set t $editor($editor_no,outdsply)
        puts -nonewline $fid [$t get 1.0 end]
        close $fid
        set editor($editor_no,outfile) $file
    }
}

#== close window ====================================================#

proc close_window { {action ""} } {
    global editor editor_no

    # check status of window before closing
    while {$editor($editor_no,status) == "MODIFIED"} {
        set option [tk_messageBox -title "Save Changes?" -icon question -type yesnocancel -default yes \
            -message "File \"$editor($editor_no,file)\" has been modified.\nDo you want to save the changes?"]

        if {$option == "yes"} {
            save_file
        } elseif {$option != "no"} {
            return 0
        } else {
            break
        }
    }

    if {$editor($editor_no,slave) != ""} {
        interp delete $editor($editor_no,slave)
        set editor($editor_no,loadtk) 0
    }

    destroy $editor($editor_no,window)
    set editor($editor_no,status) "CLOSED"

    if {$action != "exit"} {
        # make another window active - if any?
        set active 0
        foreach name [lsort -dictionary [array names editor *,file]] {
            set no [lindex [split $name ","] 0]
            if {$editor($no,status) != "CLOSED"} {
                make_window_active $no
                set active 1
                break
            }
        }

        if {!$active && $action != "exit"} {
            make_window_active [make_editor]
        }
    }

    return 1
}

#== exit editor =====================================================#

proc exit_editor {} {
    global editor
    global syntax
    global editor_cfg
    global editor_no

    # first save the configuration file "editor_cfg.ml"

    if [catch {set fid [open $editor_cfg w]} msg] {
        puts $msg
    } else {
        puts $fid "# ML editor configuration file - AUTO GENERATED"
        puts $fid "# DO NOT EDIT THIS FILE WITH \"ML\", USE ANOTHER EDITOR (BECAUSE ML WILL OVERWRITE YOUR CHANGES)"
        puts $fid ""

        puts $fid "# find & file history"
        set file_history ""
        foreach name [lsort -dictionary [array names editor *,status]] {
            set no [lindex [split $name ","] 0]
            if {$editor($no,status) != "CLOSED"} {
                if {$editor($no,file) != ""} {
                    lappend file_history $editor($no,file)
                }
            }
        }
        puts $fid "set editor(find_history) [list [lrange $editor(find_history) 0 19]]"
        puts $fid "set editor(replace_history) [list [lrange $editor(replace_history) 0 19]]"
        puts $fid "set editor(file_history) [list $file_history]"
        puts $fid ""

        puts $fid "# fonts for each file type"
        puts $fid "# to specify/change the font for a specific file type insert a line as follows;"
        puts $fid "# set editor(font,extension) {FontName FontSize}"
        foreach font [lsort [array names editor font*]] {
            puts $fid [list set editor($font) $editor($font)]
        }
        puts $fid ""

        puts $fid "# default extension (you'll need to edit the file manually to change the default extension)"
        puts $fid "set editor(default_ext) $editor(default_ext)"
        puts $fid ""

        puts $fid "# syntax highlight for different file types"
        puts $fid "# set syntax(.extension,command) 1"
        foreach syn [lsort [array names syntax]] {
            set ext [lindex [split $syn ","] 0]
            if {$ext != ".tcl"} {
                puts $fid [list set syntax($syn) $syntax($syn)]
            }
        }

        puts $fid "\n# display toolbar"
        puts $fid "set editor(toolbar) $editor(toolbar)"

        puts $fid "\n# word wrap"
        puts $fid "set editor(wordwrap) $editor(wordwrap)"

        puts $fid "\n# window geometry"
        puts $fid "wm geometry . [winfo geometry .]"

        close $fid
    }

    # close all files in reverse order... this is done so we don't end up displaying all files (see close_window)
    foreach name [lsort -dictionary -decreasing [array names editor *,status]] {
        set no [lindex [split $name ","] 0]
        if {$editor($no,status) != "CLOSED"} {
            set editor_no $no
            if {![close_window "exit"]} {
                return
            }
        }
    }

    #interp delete $slave
    # exit, close main window
    destroy .
}

#== Undo, copy and paste ===========================================#

proc textUndo { } {
    global editor editor_no

    set t $editor($editor_no,text)
    $t undo
}

proc textCut { } {
    global editor editor_no

    set t $editor($editor_no,text)
    tk_textCut $t
}

proc textCopy { } {
    global editor editor_no

    set t $editor($editor_no,text)
    tk_textCopy $t
}

proc textPaste { } {
    global editor editor_no

    set t $editor($editor_no,text)
    tk_textPaste $t
}

#== print file =====================================================#

proc gdi_init { title } {
    global gdi

    # display the printer dialog, get response {printer exit_status}
    set printer [printer dialog select]
    if {[lindex $printer 1] != 1} {
        return 0
    }

    # set the "hdc", this is used for all graphics/data output
    set gdi(hdc) [lindex $printer 0]

    printer job -hdc $gdi(hdc) start -name $title

    # process the printer attributes, we need to page margins and pixels per inch
    foreach row [printer attr -hdc $gdi(hdc)] {
        set option [lindex $row 0]
        set values [lindex $row 1]
        switch -exact -- $option {
            "page dimensions" {
                set gdi(width) [lindex $values 0]
                set gdi(height) [lindex $values 1]
            }
            "page minimum margins" {
                set gdi(left) [lindex $values 0]
                set gdi(top) [lindex $values 1]
                set gdi(right) [lindex $values 2]
                set gdi(bottom) [lindex $values 3]
            }
            "pixels per inch" {
                set gdi(resx) [lindex $values 0]
                set gdi(resy) [lindex $values 1]
            }
        }
    }

    return 1
}

proc gdi_x { x } {
    # convert x which is specified as a character position to the pixel position
    global gdi
    set x [expr {(($x - 1) / 11.0) * $gdi(resx) + $gdi(left)}]
    return $x
}

proc gdi_y { y } {
    # convert y which is specified as a character position to the pixel position
    global gdi
    set y [expr {(($y - 1) / 6.0) * $gdi(resy) + $gdi(top)}]
    return $y
}

proc gdi_inches { i axis } {
    # convert i which is specified in inches to a pixel size (eg: 1 inch may equal 600 pixels)
    global gdi
    set i [expr {$i * $gdi(res$axis)}]
    return $i
}

proc gdi_page { command } {
    # gdi_page start/end
    global gdi
    printer page -hdc $gdi(hdc) $command
}

proc gdi_close {} {
    global gdi
    printer job -hdc $gdi(hdc) end
    printer close
}

# the print file command relies on the packages "printer" & "gdi" to be installed somewhere
# the system uses the font for the current window, to print smaller make the font smaller

proc print_file { editor_no } {
    global gdi editor

    # load the packages we require, if not installed then just result in an error
    package require printer
    package require gdi

    # initialise gdi print device
    if {![gdi_init "ML: $editor($editor_no,title)"]} { return }

    set t $editor($editor_no,text)

    set font [$t cget -font]

    # get the number of lines (keep insert cursor in original place)
    set insert [$t index insert]
    $t mark set insert end
    set lines [lindex [split [$t index insert] .] 0]
    $t mark set insert $insert

    set page_no 0
    set y 0

    set datetime [clock format [clock seconds] -format "%A, %d %B %Y - %I:%M %p"]

    # process each line
    for {set line 1} {$line <= $lines} {incr line} {
        set next [expr {$line + 1}]
        set text [$t get $line.0 $next.0]

        # before outputting text determine if new page is requried
        if {!$y} {
            gdi_page start
            incr page_no

            gdi text $gdi(hdc) [gdi_x 1] [gdi_y 0] -text $editor($editor_no,title) -font {Arial 13 bold} -justify left -anchor w
            gdi text $gdi(hdc) [gdi_x 1] [gdi_y 64] -text $datetime -font {Arial 8} -justify left -anchor w
            gdi text $gdi(hdc) [gdi_x 80] [gdi_y 64] -text "Page: $page_no" -font {Arial 8} -justify left -anchor e

            set y [gdi_y 2]
        }

        # now output the text for the source code
        gdi text $gdi(hdc) [gdi_x 4] $y -text $line -font $font -anchor ne -justify left
        set height [gdi text $gdi(hdc) [gdi_x 5] $y -text $text -font $font -anchor nw -justify left]

        set y [expr {$y + ($height / 2)}]
        if {$y > [gdi_y 62]} {
            gdi_page end
            set y 0
        }
    }

    if {$y} { gdi_page end }

    gdi_close
}

proc Clear_Output {} {
    global editor editor_no

    set o $editor($editor_no,outdsply)
    $o delete 1.0 end
    $o insert insert "<$editor($editor_no,prompt)-$editor($editor_no,event)>" prompt
    $o mark set limit insert
    $o mark gravity limit left
    $o see limit
}
#
# Evaluate everything between limit and end as a Tcl command
#
proc EvalTypein {} {
    global editor editor_no

    set o $editor($editor_no,outdsply)
    $o insert insert \n
    set command [$o get limit end]
    if [info complete $command] {
        $o mark set limit insert
        Eval $command $editor_no
    }
}
#
# Echo the command and evaluate it
#
proc EvalEcho {editor_no} {
    global editor

    set o $editor($editor_no,outdsply)
    set command [list source $editor($editor_no,file)]

    $o mark gravity limit right
    $o insert limit "$command\n\n" commad
    $o see limit
    $o mark gravity limit left

    Eval $command $editor_no
}
##
## Evaluate a command and display its result
##
proc Eval {command editor_no} {
    global editor

    set o $editor($editor_no,outdsply)
    $o mark set insert end

    set command [string trim $command]
    #
    # check for history commands (i.e. !!...)
    #
    set ev [EvalSlave history nextid]
    incr ev -1
    if {[string match !! $command]} {
        set code [catch {EvalSlave history event $ev} command]
    } elseif {[regexp {^!(.+)$} $command dummy event]} {
        ## Check last event because history event is broken
        set code [catch {EvalSlave history event $ev} command]
        if {!$code && ![string match ${event}* $command]} {
            set code [catch {EvalSlave history event $event} command]
        }
    } elseif {[regexp {^\^([^^]*)\^([^^]*)\^?$} $command dummy old new]} {
        set code [catch {EvalSlave history event $ev} command]
        if {!$code} {
            regsub -all -- $old $command $new command
            $o insert insert $command\n stdin
        }
    }

    if [catch {AddSlaveHistory $command} result] {
        $o insert insert "history: $result\n" error
    } else {
        set editor($editor_no,event) [EvalSlave history nextid]
        set editor($editor_no,cmd) $command

        if [catch {interp eval $editor($editor_no,slave) $command} result] {
            if {[string length $result] >= 1} {$o insert insert "$result\n" error}
        } else {
            if {[string length $result] >= 1} {$o insert insert "$result\n" result}
        }
    }

    #if {[$o compare insert != "insert linestart"]} {
    #    $o insert insert \n
    #}

    $o insert insert "<$editor($editor_no,prompt)-$editor($editor_no,event)>" prompt
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
proc AddSlaveHistory cmd {
    global editor editor_no

    set o $editor($editor_no,outdsply)
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
proc EvalSlave args {
    global editor editor_no

    interp eval $editor($editor_no,slave) $args
}
##
## Create and initialize the slave interpreter
##
proc SlaveInit slave {
    global editor editor_no

    set o $editor($editor_no,outdsply)

    interp create $slave

    if {$editor($editor_no,loadtk)} {
        load {} Tk $slave
        if [catch {interp eval $slave "wm title . $editor($editor_no,title)"} msg] {
            $o insert insert $msg
            set editor($editor_no,tkloaded) loadtk
        }
        #if [catch {interp eval $slave "wm iconify ."} msg] {
        #    $o insert insert $msg
        #}
    }

    if [catch "interp alias $slave reset {} ResetAlias $slave" msg] {
        $o insert insert $msg
    }
    if [catch "interp eval $slave {rename puts ml_puts}" msg] {
        $o insert insert $msg
    }
    if [catch "interp alias $slave puts {} PutsAlias $slave" msg] {
        $o insert insert $msg
    }

    if [catch {interp eval $slave "lappend auto_path \"$editor(runproc_path)\""} msg] {
        $o insert insert "autopath: $msg"
    }

    if [catch {interp eval $slave "package require runcmd"} msg] {
        $o insert insert "package: $msg\n"
    }

    if {$editor(platform) == "windows" } {
        if [catch {interp eval $slave "rename unknown _unknown"} msg] {
            $o insert insert "rename unknown: $msg\n"
        }

        if [catch {interp eval $slave "rename isp_unknown unknown"} msg] {
            $o insert insert "rename unknown: $msg\n"
        }
    }
    # Turn off FOUNDRY popup msg boxes
    if [catch {interp eval $slave "set env(NEO_NOMSGBOX) 1"} msg] {
        $o insert insert "NEO_NOMSGBOX: $msg"
    }

    return $slave
}
##
## The reset alias deletes the slave and starts a new one
##
proc ResetAlias slave {

    interp delete $slave
    SlaveInit $slave

    return $slave
}
#
# The puts alias puts stdout and stderr into the text widget
#
proc PutsAlias {slave args} {
    global editor editor_no

    set o $editor($editor_no,outdsply)

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
            $o insert limit $outstr error
        } elseif {[string first "warn" $temp] == 0} {
            $o insert limit $outstr warn
        } else {
            $o insert limit $outstr output
        }

        $o see limit
        $o mark gravity limit left
    } else {
        if [catch "interp eval $slave {ml_puts $argt}" msg] {
            $o insert insert $msg
        }
    }
}

#
#== open the default windows ========================================#
#
global editor
global syntax
global editor_no
global file_types
global editor_cfg
global focus_text
global images_dir
global loadtk

wm minsize . 500 300

set editor(xmax) [winfo screenwidth .]
set editor(ymax) [winfo screenheight .]

## Do platform specific configuration here, other than defaults
### Use tkcon.cfg filename for resource filename on non-unix systems
### Determine what directory the resource file should be in
switch $tcl_platform(platform) {
    windows {
        set editor(platform) windows
        set editor(rcfile)   editor.cfg
    }
    unix {
        set editor(platform) unix
        set editor(rcfile)   .editorcfg
    }
}

set editor(wordwrap) 0
set focus_text 0
#set editor(version) "2.01"
set editor_no 0
set editor_num 0
set editor(current) ""
set images_dir [file join [file dirname [info script]] "images"]
set editor(runproc_path) [file join [file dirname [info script]] ".." "runproc"]
if {$editor(platform) == "windows"} {
    set editor_cfg [file join [file dirname [info script]] $editor(rcfile)]
} else {
    set editor_cfg [file join [set env(HOME)] $editor(rcfile)]
}

# set default file extension
set editor(default_ext) "tcl"
set editor(initial_dir) [pwd]
set editor(grep_path) $editor(initial_dir)
set editor(toolbar) 1

# set default font - saved in the editor_cfg.ml file (user needs to change manually)
set editor(font) {Verdana 9}

# files loaded since last use of editor (see proc exit_editor)
set editor(file_history) {}

# find history (list of strings previously searched for)
set editor(find_history) {}
set editor(match_case) 0
set editor(replace_history) {}

# load the configuration file (if it exists/is readable)
if {[file readable $editor_cfg]} {
    source $editor_cfg
}

# default the current find string to the last value
set editor(find_string) [lindex $editor(find_history) 0]
set editor(replace_string) [lindex $editor(replace_history) 0]

set file_types {
    {{All Files}    *         }
    {{TCL Scripts}  {.tcl}        }
    {{FastBase Source}  {.fb}         }
    {{Magix Source} {.ms}         }
    {{Html} {.html .htm}          }
    {{Text Files}   {.txt}        }}

# create a global array syntax(file_extension,commands)
# this is used by the "tag_word" procedure to detect words
foreach command [info commands] {
    set syntax(.tcl,$command) 1
}
#
# If we are using the default '.' toplevel, and there appear to be
# children of '.', then make sure we use a disassociated toplevel.
#
#    if {$editor(root) == "." && [llength [winfo children .]]} {
#        set editor(root) .ml
#    }
#
# load the files specified on the command line
# if none then check the "editor(file_history)" variable as saved in the configuration file
#
set any_files 0
set name ""

if {![catch {set a $argc} msg]} {
    if {$argc} {
        foreach name $argv {
            # replace all backslashes with forward slashes so windows filenames will be "globbed" ok.
            regsub -all "\\\\" $name "/" name
            foreach name [glob -nocomplain $name] {
                if {[catch {set fid [open $name]} msg]} {
                    tk_messageBox -type ok -icon error -title "File Open Error" \
                        -message "There was an error opening file \"$name\"; $msg."
                } else {
                    make_editor $name
                    set any_files 1
                }
            }
        }
    }
}

if {$editor(file_history) != ""} {
    foreach file $editor(file_history) {
        if {[file readable $file]} {
            if {$file != $name} {
                make_editor $file
                set any_files 1
            }
        }
    }
}

after idle {
    destroy .splash
    wm deiconify .
}

# configure the window and menus
configure_window

# create main window menu and toolbar
create_main_window

# if no files loaded then open a blank editor window
if {!$any_files} {
    make_window_active [make_editor]
} else {
    make_window_active 1
}
