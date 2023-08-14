# ypedit.tcl --
#    Shell procedures for Young Programmers Project:
#    It defines several utility commands:
#    ed       - edit a file
#    vw       - view the contents of a file
#
# From: http://wiki.tcl.tk/9600
#
# Modified to use ScintillaTk text widget
#             use ttk widgets

package require Tk
lappend auto_path [file normalize ../../../../build/usr/lib]
package require ScintillaTk

ttk::style theme use clam

# ypshell --
#    Namespace for the commands
#
namespace eval ::ypshell {

   namespace export ed vw

   variable editfile
   set editfile(count) 0
}

# ed --
#    Edit a file
#
# Arguments:
#    filename   Name of the file to edit
#
# Return value:
#    None
#
proc ::ypshell::ed { filename } {
   ::ypshell::EditFile 1 0 $filename
}

# vw --
#    View a file
#
# Arguments:
#    filename   Name of the file to view
#
# Return value:
#    None
#
proc ::ypshell::vw { filename } {
   ::ypshell::EditFile 0 0 $filename
}

# EditFile --
#    Edit or view a file (actual procedure)
#
# Arguments:
#    editable   Select edit mode (1=edit, 0=view)
#    newopen    Allow new/open menu items (1=yes, 0=no)
#    filename   Name of the file to edit/view
#
# Return value:
#    None
#
proc ::ypshell::EditFile { editable newopen filename } {
   variable editfile

   incr editfile(count)
   set  w .edit$editfile(count)
   toplevel $w
   wm withdraw .
   wm title $w "Edit/view: $filename"

   set  mb $w.menubar
   menu      $mb
   #pack       $mb -side top -fill x -pady 0
   $w configure -menu $mb
   #ttk::menubutton $mb.file   -text File   -menu $mb.file.menu    -underline 0
   #ttk::menubutton $mb.edit   -text Edit   -menu $mb.edit.menu    -underline 0
   #ttk::menubutton $mb.search -text Search -menu $mb.search.menu  -underline 0
   #ttk::menubutton $mb.help   -text Help   -menu $mb.help.menu    -underline 0

	menu       $mb.file   -tearoff false; $mb add cascade -label File -menu $mb.file
	menu       $mb.edit   -tearoff false; $mb add cascade -label Edit -menu $mb.edit
	menu       $mb.search -tearoff false; $mb add cascade -label Search -menu $mb.search
	menu       $mb.help   -tearoff false; $mb add cascade -label Help -menu $mb.help

   #pack       $mb.file $mb.edit $mb.search -side left
   #pack       $mb.help -side left ;# Platform-dependent!

   #
   # Set up the "File" menu
   #
   if { $newopen } {
      if { $editable } {
         $mb.file add command -label New -underline 0 \
            -command [list ::ypshell::NewFile]
      }
      $mb.file add command -label Open -underline 0 \
         -command [list ::ypshell::OpenFile]
      $mb.file add separator
   }

   if { $editable } {
      $mb.file add command -label Save -underline 0 \
         -command [list ::ypshell::SaveFile $w $filename 0]
      if { $newopen } {
         $mb.file add command -label "Save as ..." -underline 1 \
            -command [list ::ypshell::SaveFile $w $filename 1]
      }
      $mb.file add separator
   }
   $mb.file add command -label Exit -underline 1 \
      -command [list ::ypshell::ExitEdit $w $newopen $editable $filename]

   #
   # Set up the "Edit" menu
   #
   if { $editable } {
      $mb.edit add command -label "Undo" -underline 0 \
         -command [list ::ypshell::UndoChange]
      $mb.edit add command -label "Redo" -underline 0 \
         -command [list ::ypshell::RedoChange]
      $mb.edit add separator
   }
   $mb.edit add command -label "Mark line(s)" -underline 0 \
      -command [list ::ypshell::MarkLines]
   $mb.edit add command -label "Unmark line(s)" -underline 1 \
      -command [list ::ypshell::UnmarkLines]
   $mb.edit add separator
   $mb.edit add command -label "Copy" -underline 0 \
      -command [list ::ypshell::CopyBlock]
   if { $editable } {
      $mb.edit add command -label "Paste" -underline 0 \
         -command [list ::ypshell::PasteBlock]
      $mb.edit add separator
      $mb.edit add command -label "Delete" -underline 0 \
         -command [list ::ypshell::DeleteBlock]
   }

   #
   # Set up the "Search" menu
   #
   $mb.search add command -label "Find" -underline 0 \
      -command [list ::ypshell::FindText $w]
   if { $editable } {
      $mb.search add command -label "Replace" -underline 0 \
      -command [list ::ypshell::ChangeText]
   }

   #
   # Set up the "Help" menu
   #
   $mb.help add command -label "Overview" -underline 1 \
      -command [list ::ypshell::HelpOverview]
   $mb.help add command -label "About" -underline 0 \
      -command [list ::ypshell::AboutEdit]

   #
   # Create a thin separator
   #
   set ts $w.separator
   #frame $ts -height 2 -relief sunken -borderwidth 1
	ttk::separator $ts -orient horizontal
   pack  $ts -side top -fill x

   #
   # Create the toolbar
   #
   set fnt       "Courier, 10"
   set fnt       "systemfixed"
   set fixedfont "Courier"
   set tb  $w.toolbar
   ttk::frame $tb -height 10
   ttk::button $tb.goto   -text "Go to:" -command [list ::ypshell::GotoLine $w ""]
   ttk::entry  $tb.lineno -textvariable ::ypshell::editfile(lineno,$w) \
      -width 5 -font $fnt
   ttk::button $tb.top    -text "Top"    -command [list ::ypshell::GotoLine $w 1]
   ttk::button $tb.bottom -text "Bottom" -command [list ::ypshell::GotoLine $w end]
   ttk::label  $tb.empty1 -text " "
   ttk::label  $tb.empty2 -text " "

   set ::ypshell::editfile(lineno,$w) 1

   pack   $tb.goto $tb.lineno $tb.empty1 $tb.top $tb.bottom $tb.empty2 -side left

   ttk::button $tb.find   -text "Find:" -command [list ::ypshell::FindText $w]
   ttk::entry  $tb.string -textvariable ::ypshell::editfile(find,$w) \
      -font $fnt

   set ypshell::editfile(find,$w) ""

   pack   $tb.goto $tb.find $tb.string -side left

   pack   $tb -fill x -side top

   #
   # Create the text widget and the scroll bars
   #
   set tf $w.textframe
   set tw $tf.text
   ttk::frame $tf
   ttk::scrollbar $tf.scrollx -orient horiz -command "$tw xview"
   ttk::scrollbar $tf.scrolly               -command "$tw yview"
   if {0} {
      text      $tw         -yscrollcommand "$tf.scrolly set" \
                            -xscrollcommand "$tf.scrollx set" \
                            -font $fixedfont
   } else {
      set bg [ttk::style lookup client -background]
      scintilla $tw         -yscrollcommand "$tf.scrolly set" \
                            -xscrollcommand "$tf.scrollx set" \
                            -font $fixedfont \
	                        -marginbackground $bg \
                            -foldforeground black
      $tw margin configure 0 -type lnums
      $tw margin configure 4 -type fold
      $tw margin show 0
      $tw margin show 4

      $w configure -background $bg
      $mb configure -background $bg
   }

   grid      $tw         $tf.scrolly
   grid      $tf.scrollx x
   grid      $tw         -sticky news
   grid      $tf.scrolly -sticky ns
   grid      $tf.scrollx -sticky ew

   grid columnconfigure $tf 0 -weight 1
   grid rowconfigure    $tf 0 -weight 1

   if {0} {
      $tw configure -wrap none
   }

   pack $tf -fill both -side top -expand 1

   set ypshell::editfile(textwidget,$w) $tw

   LoadFile $tw $filename
}

# LoadFile --
#    Load the file into the text widget
#
# Arguments:
#    textw      Text widget to use
#    filename   Name of the file to edit/view
#
# Return value:
#    None
#
proc ::ypshell::LoadFile { textw filename } {
    set infile [ open "$filename" "r" ]
	set ext [string range [file extension $filename] 1 end]
	if {$ext ne ""} {
        set pkgName "Lex[string toupper $ext]"
        if {[catch {package require $pkgName}]} {
            catch {$textw configure -language $ext}
        } elseif {[catch {${pkgName}::configure $textw} err]} {
            puts stderr "Configure error: $err"
        }
	}
    while { ! [ eof $infile ] } {
        gets $infile line
        $textw insert end $line
        $textw insert end "\n"
    }

	$textw tag configure pink -annotation -background #ffdddd -italic 1
	$textw annotate set 14 ""
	$textw annotate set 14 "At this point, the scintilla code is loaded." pink
	$textw tag configure bright -annotation -bold 1 -background #4444ff -foreground yellow
	$textw annotate set 16 "Dig those clams man!\nI like clam style because it's the only\nttk style that does not look boring!" bright
	$textw annotate show 2
    
    close $infile
}

# SaveFile --
#    Save the file (possibly under a different name)
#
# Arguments:
#    w          Main widget holding the text
#    filename   Name of the file to edit/view
#    newname    Ask for a new name or not
#
# Return value:
#    None
#
proc ::ypshell::SaveFile { w filename newname } {
   variable editfile

   set tw $editfile(textwidget,$w)

   # Select a new file name -- TODO

   set outfile [ open "$filename" "w" ]

   set lineno 1
   while { [$tw compare $lineno.0 < end] } {
      puts $outfile [$tw get "$lineno.0" "$lineno.0 lineend"]
      incr lineno
   }

   close $outfile
}

# GotoLine --
#    Go to a specified line number
#
# Arguments:
#    w          Main widget containing the text widget
#    pos        Position
#
# Return value:
#    None
#
proc ::ypshell::GotoLine { w pos } {
   variable editfile

   set tw $editfile(textwidget,$w)
   if { $pos == "" } {
      set pos $editfile(lineno,$w)
   }

   if { $pos == "end" } {
      $tw mark set current "end linestart"
   } else {
      $tw mark set current "$pos.0"
   }
   $tw mark set insert [$tw index current]
	$tw see [$tw index current]

   focus $tw
}

# FindText --
#    Find a text string
#
# Arguments:
#    w          Main widget containing the text widget
#
# Return value:
#    None
#
proc ::ypshell::FindText { w } {
   variable editfile

   set string $editfile(find,$w)
   set tw     $editfile(textwidget,$w)

   if { $string != "" } {
      set newpos [$editfile(textwidget,$w) search -forwards -exact -- $string "insert + 1 chars"]

      if { $newpos != "" } {
         $tw mark set current $newpos
         $tw mark set insert [$tw index current]
		  $tw see [$tw index current]
         focus $tw
      }
   }
}

# ExitEdit --
#    Exit and save the file (if wanted)
#
# Arguments:
#    w          Widget from which it is called
#    editable   Select edit mode (1=edit, 0=view)
#    newopen    Allow new/open menu items (1=yes, 0=no)
#    filename   Name of the file to edit/view
#
# Return value:
#    None
#
proc ::ypshell::ExitEdit { w editable newopen filename } {
   if { $editable } {
      if { !$newopen } {
         SaveFile $w $filename 0
      } else {
         # Ask whether to save or not
      }
   }

   destroy $w
}

#
# Simple test code
#
namespace import ::ypshell::ed
namespace import ::ypshell::vw

ed [file join [file dirname [info script]] ypedit.tcl]
#vw [file join [file dirname [info script]] ypedit.tcl]
#$tw annotate set 210 "This is where margins are configured to show\ndifferent contents."

