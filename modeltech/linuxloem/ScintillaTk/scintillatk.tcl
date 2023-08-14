# scintillatk.tcl --
#
# This file defines the default bindings for Scintilla text widget and provides
# procedures that help in implementing the bindings.
#
# This code was copied from Tk's text.tcl and modified for Scintilla.
#
# Copyright (c) 1992-1994 The Regents of the University of California.
# Copyright (c) 1994-1997 Sun Microsystems, Inc.
# Copyright (c) 1998 by Scriptics Corporation.
# Copyright (c) 2013-2016 Mentor Graphics Corporation
#
# See the file "license.terms" for information on usage and redistribution
# of this file, and for a DISCLAIMER OF ALL WARRANTIES.
#

#-------------------------------------------------------------------------
# Elements of ::tk::Priv that are used in this file:
#
# afterId -             If non-null, it means that auto-scanning is underway
#                       and it gives the "after" id for the next auto-scan
#                       command to be executed.
# char -                Character position on the line;  kept in order
#                       to allow moving up or down past short lines while
#                       still remembering the desired position.
# mouseMoved -          Non-zero means the mouse has moved a significant
#                       amount since the button went down (so, for example,
#                       start dragging out a selection).
# prevPos -             Used when moving up or down lines via the keyboard.
#                       Keeps track of the previous insert position, so
#                       we can distinguish a series of ups and downs, all
#                       in a row, from a new up or down.
# selectMode -          The style of selection currently underway:
#                       char, word, or line.
# x, y -                Last known mouse coordinates for scanning
#                       and auto-scanning.
#
#-------------------------------------------------------------------------

namespace eval ::scintilla {
}

#-------------------------------------------------------------------------
# The code below creates the default class bindings for scintilla widgets.
#-------------------------------------------------------------------------

# Standard Motif bindings:

bind Scintilla <1> {
    ::scintilla::TextButton1 %W %x %y
    %W tag remove sel 0.0 end
}
bind Scintilla <B1-Motion> {
    set tk::Priv(x) %x
    set tk::Priv(y) %y
    ::scintilla::TextSelectTo %W %x %y
}

# We won't assume clients want a default selection action when a multi-click
# event occurs in the margin area - we'll leave that up to the client
bind Scintilla <Double-1> {
    if {[%W margin index @%x,%y] == ""} {
        set tk::Priv(selectMode) word
        ::scintilla::TextSelectTo %W %x %y
        catch {%W mark set insert sel.first}
    }
}
bind Scintilla <Triple-1> {
    if {[%W margin index @%x,%y] == ""} {
        set tk::Priv(selectMode) line
        ::scintilla::TextSelectTo %W %x %y
        catch {%W mark set insert sel.first}
    }
}
bind Scintilla <Shift-1> {
    if {[%W margin index @%x,%y] == ""} {
        tk::TextResetAnchor %W @%x,%y
        set tk::Priv(selectMode) char
        ::scintilla::TextSelectTo %W %x %y
        catch {%W mark set insert sel.first}
    }
}
bind Scintilla <Double-Shift-1> {
    if {[%W margin index @%x,%y] == ""} {
        set tk::Priv(selectMode) word
        ::scintilla::TextSelectTo %W %x %y 1
        catch {%W mark set insert sel.first}
    }
}
bind Scintilla <Triple-Shift-1> {
    if {[%W margin index @%x,%y] == ""} {
        set tk::Priv(selectMode) line
        ::scintilla::TextSelectTo %W %x %y
        catch {%W mark set insert sel.first}
    }
}
bind Scintilla <B1-Leave> {
    set tk::Priv(x) %x
    set tk::Priv(y) %y
    ::scintilla::TextAutoScan %W
}
bind Scintilla <B1-Enter> {
    tk::CancelRepeat
}
bind Scintilla <ButtonRelease-1> {
    tk::CancelRepeat
}
bind Scintilla <Control-1> {
    if {[%W margin index @%x,%y] == ""} {
        catch {%W mark set insert @%x,%y}
    }
}
bind Scintilla <Left> {
    ::scintilla::TextSetCursor %W insert-1displayindices
}
bind Scintilla <Right> {
    ::scintilla::TextSetCursor %W insert+1displayindices
}
bind Scintilla <Up> {
    ::scintilla::TextSetCursor %W [::scintilla::TextUpDownLine %W -1]
}
bind Scintilla <Down> {
    ::scintilla::TextSetCursor %W [::scintilla::TextUpDownLine %W 1]
}
bind Scintilla <Shift-Left> {
    ::scintilla::TextKeySelect %W [%W index {insert - 1displayindices}]
}
bind Scintilla <Shift-Right> {
    ::scintilla::TextKeySelect %W [%W index {insert + 1displayindices}]
}
bind Scintilla <Shift-Up> {
    ::scintilla::TextKeySelect %W [::scintilla::TextUpDownLine %W -1]
}
bind Scintilla <Shift-Down> {
    ::scintilla::TextKeySelect %W [::scintilla::TextUpDownLine %W 1]
}
bind Scintilla <Control-Left> {
    ::scintilla::TextSetCursor %W [::scintilla::TextPrevPos %W insert tcl_startOfPreviousWord]
}
bind Scintilla <Control-Right> {
    ::scintilla::TextSetCursor %W [::scintilla::TextNextWord %W insert]
}
bind Scintilla <Control-Up> {
    ::scintilla::TextSetCursor %W [::scintilla::TextPrevPara %W insert]
}
bind Scintilla <Control-Down> {
    ::scintilla::TextSetCursor %W [::scintilla::TextNextPara %W insert]
}
bind Scintilla <Shift-Control-Left> {
    ::scintilla::TextKeySelect %W [::scintilla::TextPrevPos %W insert tcl_startOfPreviousWord]
}
bind Scintilla <Shift-Control-Right> {
    ::scintilla::TextKeySelect %W [::scintilla::TextNextWord %W insert]
}
bind Scintilla <Shift-Control-Up> {
    ::scintilla::TextKeySelect %W [::scintilla::TextPrevPara %W insert]
}
bind Scintilla <Shift-Control-Down> {
    ::scintilla::TextKeySelect %W [::scintilla::TextNextPara %W insert]
}
bind Scintilla <Prior> {
    ::scintilla::TextSetCursor %W [::scintilla::TextScrollPages %W -1]
}
bind Scintilla <Shift-Prior> {
    ::scintilla::TextKeySelect %W [::scintilla::TextScrollPages %W -1]
}
bind Scintilla <Next> {
    ::scintilla::TextSetCursor %W [::scintilla::TextScrollPages %W 1]
}
bind Scintilla <Shift-Next> {
    ::scintilla::TextKeySelect %W [::scintilla::TextScrollPages %W 1]
}
bind Scintilla <Control-Prior> {
    %W xview scroll -1 page
}
bind Scintilla <Control-Next> {
    %W xview scroll 1 page
}

bind Scintilla <Home> {
    ::scintilla::TextSetCursor %W {insert display linestart}
}
bind Scintilla <Shift-Home> {
    ::scintilla::TextKeySelect %W {insert display linestart}
}
bind Scintilla <End> {
    ::scintilla::TextSetCursor %W {insert display lineend}
}
bind Scintilla <Shift-End> {
    ::scintilla::TextKeySelect %W {insert display lineend}
}
bind Scintilla <Control-Home> {
    ::scintilla::TextSetCursor %W 1.0
}
bind Scintilla <Control-Shift-Home> {
    ::scintilla::TextKeySelect %W 1.0
}
bind Scintilla <Control-End> {
    ::scintilla::TextSetCursor %W {end - 1 indices}
}
bind Scintilla <Control-Shift-End> {
    ::scintilla::TextKeySelect %W {end - 1 indices}
}

bind Scintilla <Tab> {
    if {[%W cget -state] ne "disabled"} {
        ::scintilla::TextInsert %W \t
        focus %W
        break
    }
}
bind Scintilla <Shift-Tab> {
    # Needed only to keep <Tab> binding from triggering;  doesn't
    # have to actually do anything.
    break
}
bind Scintilla <Control-Tab> {
    focus [tk_focusNext %W]
}
bind Scintilla <Control-Shift-Tab> {
    focus [tk_focusPrev %W]
}
bind Scintilla <Control-i> {
    ::scintilla::TextInsert %W \t
}
bind Scintilla <Return> {
    ::scintilla::TextInsert %W \n
    if {[%W cget -autoseparators]} {
        %W edit separator
    }
}
bind Scintilla <Delete> {
    if {[%W tag nextrange sel 1.0 end] ne ""} {
       %W delete sel.first sel.last
    } else {
       %W delete insert
       %W see insert
    }
}
bind Scintilla <BackSpace> {
    if {[%W tag nextrange sel 1.0 end] ne ""} {
       %W delete sel.first sel.last
    } elseif {[%W compare insert != 1.0]} {
       %W delete insert-1c
       %W see insert
    }
}

bind Scintilla <Control-KP_Add>      {%W zoomin}
bind Scintilla <Control-KP_Subtract> {%W zoomout}
if { [tk windowingsystem] eq "win32" } {
bind Scintilla <Control-Key-plus>    {%W zoomin}
bind Scintilla <Control-Key-minus>   {%W zoomout}
}
bind Scintilla <Control-space> {
    %W mark set [::scintilla::TextAnchor %W] insert
}
bind Scintilla <Select> {
    %W mark set [::scintilla::TextAnchor %W] insert
}
bind Scintilla <Control-Shift-space> {
    set tk::Priv(selectMode) char
    ::scintilla::TextKeyExtend %W insert
}
bind Scintilla <Shift-Select> {
    set tk::Priv(selectMode) char
    ::scintilla::TextKeyExtend %W insert
}
bind Scintilla <Control-slash> {
    %W tag add sel 1.0 end
}
bind Scintilla <Control-backslash> {
    %W tag remove sel 1.0 end
}
bind Scintilla <<Cut>> {
    tk_textCut %W
}
bind Scintilla <<Copy>> {
    tk_textCopy %W
}
bind Scintilla <<Paste>> {
    tk_textPaste %W
}
bind Scintilla <<Clear>> {
    catch {%W delete sel.first sel.last}
}
bind Scintilla <<PasteSelection>> {
    if {$tk_strictMotif || ![info exists tk::Priv(mouseMoved)]
        || !$tk::Priv(mouseMoved)} {
        ::scintilla::TextPasteSelection %W %x %y
    }
}
bind Scintilla <Insert> {
    catch {::scintilla::TextInsert %W [::tk::GetSelection %W PRIMARY]}
}
bind Scintilla <KeyPress> {
    ::scintilla::TextInsert %W %A
}

# Ignore all Alt, Meta, and Control keypresses unless explicitly bound.
# Otherwise, if a widget binding for one of these is defined, the
# <KeyPress> class binding will also fire and insert the character,
# which is wrong.  Ditto for <Escape>.

bind Scintilla <Alt-KeyPress> {# nothing }
bind Scintilla <Meta-KeyPress> {# nothing}
bind Scintilla <Control-KeyPress> {# nothing}
bind Scintilla <Escape> {# nothing}
bind Scintilla <KP_Enter> {# nothing}
if {[tk windowingsystem] eq "aqua"} {
    bind Scintilla <Command-KeyPress> {# nothing}
}

# Additional emacs-like bindings:

bind Scintilla <Control-a> {
    if {!$tk_strictMotif} {
        ::scintilla::TextSetCursor %W {insert display linestart}
    }
}
bind Scintilla <Control-b> {
    if {!$tk_strictMotif} {
        ::scintilla::TextSetCursor %W insert-1displayindices
    }
}
bind Scintilla <Control-d> {
    if {!$tk_strictMotif && [%W compare end != insert+1c]} {
        %W delete insert
    }
}
bind Scintilla <Control-e> {
    if {!$tk_strictMotif} {
        ::scintilla::TextSetCursor %W {insert display lineend}
    }
}
bind Scintilla <Control-f> {
    if {!$tk_strictMotif} {
        ::scintilla::TextSetCursor %W insert+1displayindices
    }
}
bind Scintilla <Control-k> {
    if {!$tk_strictMotif && [%W compare end != insert+1c]} {
        if {[%W compare insert == {insert lineend}]} {
            %W delete insert
        } else {
            %W delete insert {insert lineend}
        }
    }
}
bind Scintilla <Control-n> {
    if {!$tk_strictMotif} {
        ::scintilla::TextSetCursor %W [::scintilla::TextUpDownLine %W 1]
    }
}
bind Scintilla <Control-o> {
    if {!$tk_strictMotif} {
        %W insert insert \n
        %W mark set insert insert-1c
    }
}
bind Scintilla <Control-p> {
    if {!$tk_strictMotif} {
        ::scintilla::TextSetCursor %W [::scintilla::TextUpDownLine %W -1]
    }
}
bind Scintilla <Control-t> {
    if {!$tk_strictMotif} {
        ::scintilla::TextTranspose %W
    }
}

bind Scintilla <<Undo>> {
    catch { %W edit undo }
}

bind Scintilla <<Redo>> {
    catch { %W edit redo }
}

bind Scintilla <Meta-b> {
    if {!$tk_strictMotif} {
        ::scintilla::TextSetCursor %W [::scintilla::TextPrevPos %W insert tcl_startOfPreviousWord]
    }
}
bind Scintilla <Meta-d> {
    if {!$tk_strictMotif && [%W compare end != insert+1c]} {
        %W delete insert [::scintilla::TextNextWord %W insert]
    }
}
bind Scintilla <Meta-f> {
    if {!$tk_strictMotif} {
        ::scintilla::TextSetCursor %W [::scintilla::TextNextWord %W insert]
    }
}
bind Scintilla <Meta-less> {
    if {!$tk_strictMotif} {
        ::scintilla::TextSetCursor %W 1.0
    }
}
bind Scintilla <Meta-greater> {
    if {!$tk_strictMotif} {
        ::scintilla::TextSetCursor %W end-1c
    }
}
bind Scintilla <Meta-BackSpace> {
    if {!$tk_strictMotif} {
        %W delete [::scintilla::TextPrevPos %W insert tcl_startOfPreviousWord] insert
    }
}
bind Scintilla <Meta-Delete> {
    if {!$tk_strictMotif} {
        %W delete [::scintilla::TextPrevPos %W insert tcl_startOfPreviousWord] insert
    }
}

# Macintosh only bindings:

if {[tk windowingsystem] eq "aqua"} {
bind Scintilla <Option-Left> {
    ::scintilla::TextSetCursor %W [::scintilla::TextPrevPos %W insert tcl_startOfPreviousWord]
}
bind Scintilla <Option-Right> {
    ::scintilla::TextSetCursor %W [::scintilla::TextNextWord %W insert]
}
bind Scintilla <Option-Up> {
    ::scintilla::TextSetCursor %W [::scintilla::TextPrevPara %W insert]
}
bind Scintilla <Option-Down> {
    ::scintilla::TextSetCursor %W [::scintilla::TextNextPara %W insert]
}
bind Scintilla <Shift-Option-Left> {
    ::scintilla::TextKeySelect %W [::scintilla::TextPrevPos %W insert tcl_startOfPreviousWord]
}
bind Scintilla <Shift-Option-Right> {
    ::scintilla::TextKeySelect %W [::scintilla::TextNextWord %W insert]
}
bind Scintilla <Shift-Option-Up> {
    ::scintilla::TextKeySelect %W [::scintilla::TextPrevPara %W insert]
}
bind Scintilla <Shift-Option-Down> {
    ::scintilla::TextKeySelect %W [::scintilla::TextNextPara %W insert]
}
bind Scintilla <Control-v> {
    ::scintilla::TextScrollPages %W 1
}

# End of Mac only bindings
}

# A few additional bindings of my own.

bind Scintilla <Control-h> {
    if {!$tk_strictMotif && [%W compare insert != 1.0]} {
        %W delete insert-1c
        %W see insert
    }
}
bind Scintilla <2> {
    if {!$tk_strictMotif} {
        ::scintilla::TextScanMark %W %x %y
    }
}
bind Scintilla <B2-Motion> {
    if {!$tk_strictMotif} {
        ::scintilla::TextScanDrag %W %x %y
    }
}
set ::tk::Priv(prevPos) {}

# The MouseWheel will typically only fire on Windows and MacOS X.
# However, someone could use the "event generate" command to produce one
# on other platforms.  We must be careful not to round -ve values of %D
# down to zero.


if {"win32" eq [tk windowingsystem]} {
    # NOTE: match Tk 8.4 behavior, since 8.5 uses pixel-level scrolling
    bind Scintilla <MouseWheel> {
        %W yview scroll [expr {- (%D / 120) * 4}] units
    }
}

if {"x11" eq [tk windowingsystem]} {
    # Support for mousewheels on Linux/Unix commonly comes through mapping
    # the wheel to the extended buttons.  If you have a mousewheel, find
    # Linux configuration info at:
    #   http://www.inria.fr/koala/colas/mouse-wheel-scroll/
    bind Scintilla <Button> {
        switch -- %b {
            4 { %W yview scroll -5 units }
            5 { %W yview scroll  5 units }
            6 { %W xview scroll -5 units }
            7 { %W xview scroll  5 units }
        }
    }
}

# ::scintilla::TextClosestGap --
# Given x and y coordinates, this procedure finds the closest boundary
# between characters to the given coordinates and returns the index
# of the character just after the boundary.
#
# Arguments:
# w -           The text window.
# x -           X-coordinate within the window.
# y -           Y-coordinate within the window.

proc ::scintilla::TextClosestGap {w x y} {
    set pos [$w index @$x,$y]
    set bbox [$w bbox $pos]
    if {$bbox eq ""} {
        return $pos
    }
    if {($x - [lindex $bbox 0]) < ([lindex $bbox 2]/2)} {
        return $pos
    }
    $w index "$pos + 1 char"
}

# ::scintilla::TextButton1 --
# This procedure is invoked to handle button-1 presses in text
# widgets.  It moves the insertion cursor, sets the selection anchor,
# and claims the input focus.
#
# Arguments:
# w -           The text window in which the button was pressed.
# x -           The x-coordinate of the button press.
# y -           The x-coordinate of the button press.

proc ::scintilla::TextButton1 {w x y} {
    variable ::tk::Priv

    set Priv(selectMode) char
    set Priv(mouseMoved) 0
    set Priv(pressX) $x
    set anchorname [TextAnchor $w]
    $w mark set insert [TextClosestGap $w $x $y]
    $w mark set $anchorname insert
    # Set the anchor mark's gravity depending on the click position
    # relative to the gap
    set bbox [$w bbox [$w index $anchorname]]
    if {$x > [lindex $bbox 0]} {
        $w mark gravity $anchorname right
    } else {
        $w mark gravity $anchorname left
    }
    # Allow focus in any case on Windows, because that will let the
    # selection be displayed even for state disabled text widgets.
    if {[tk windowingsystem] eq "win32" \
            || [$w cget -state] ne "disabled"} {
        focus $w
    }
    if {[$w cget -autoseparators]} {
        $w edit separator
    }
}

# ::scintilla::TextSelectTo --
# This procedure is invoked to extend the selection, typically when
# dragging it with the mouse.  Depending on the selection mode (character,
# word, line) it selects in different-sized units.  This procedure
# ignores mouse motions initially until the mouse has moved from
# one character to another or until there have been multiple clicks.
#
# Note that the 'anchor' is implemented programmatically using
# a text widget mark, and uses a name that will be unique for each
# text widget (even when there are multiple peers).  Currently the
# anchor is considered private to Tk, hence the name 'tk::anchor$w'.
#
# Arguments:
# w -           The text window in which the button was pressed.
# x -           Mouse x position.
# y -           Mouse y position.

set ::tk::Priv(scinanchoruid) 0

proc ::scintilla::TextAnchor {w} {
    variable Priv
    if {![info exists Priv(scinanchor,$w)]} {
        set Priv(scinanchor,$w) tk::anchor[incr Priv(scinanchoruid)]
    }
    return $Priv(scinanchor,$w)
}

proc ::scintilla::TextSelectTo {w x y {extend 0}} {
    variable ::tk::Priv

    set anchorname [TextAnchor $w]
    set cur [TextClosestGap $w $x $y]
    if {[catch {$w index $anchorname}]} {
        $w mark set $anchorname $cur
    }
    set anchor [$w index $anchorname]
    if {[$w compare $cur != $anchor] || (abs($Priv(pressX) - $x) >= 3)} {
        set Priv(mouseMoved) 1
    }
    switch -- $Priv(selectMode) {
        char {
            if {[$w compare $cur < $anchorname]} {
                set first $cur
                set last $anchorname
            } else {
                set first $anchorname
                set last $cur
            }
        }
        word {
            # Set initial range based only on the anchor (1 char min width)
            if {[$w mark gravity $anchorname] eq "right"} {
                set first $anchorname
                set last "$anchorname + 1c"
            } else {
                set first "$anchorname - 1c"
                set last $anchorname
            }
            # Extend range (if necessary) based on the current point
            if {[$w compare $cur < $first]} {
                set first $cur
            } elseif {[$w compare $cur > $last]} {
                set last $cur
            }

            # Now find word boundaries
            set first [TextPrevPos $w "$first + 1c" tcl_wordBreakBefore]
            set last [TextNextPos $w "$last - 1c" tcl_wordBreakAfter]
        }
        line {
            # Set initial range based only on the anchor
            set first "$anchorname linestart"
            set last "$anchorname lineend"

            # Extend range (if necessary) based on the current point
            if {[$w compare $cur < $first]} {
                set first "$cur linestart"
            } elseif {[$w compare $cur > $last]} {
                set last "$cur lineend"
            }
            set first [$w index $first]
            set last [$w index "$last + 1c"]
        }
    }
    if {$Priv(mouseMoved) || ($Priv(selectMode) ne "char")} {
        $w tag remove sel 0.0 end
        $w mark set insert $cur
        $w tag add sel $first $last
        $w tag remove sel $last end
        update idletasks
    }
}

# ::scintilla::TextKeyExtend --
# This procedure handles extending the selection from the keyboard,
# where the point to extend to is really the boundary between two
# characters rather than a particular character.
#
# Arguments:
# w -           The text window.
# index -       The point to which the selection is to be extended.

proc ::scintilla::TextKeyExtend {w index} {

    set anchorname [::scintilla::TextAnchor $w]
    set cur [$w index $index]
    if {[catch {$w index $anchorname}]} {
        $w mark set $anchorname $cur
    }
    set anchor [$w index $anchorname]
    if {[$w compare $cur < $anchorname]} {
        set first $cur
        set last $anchorname
    } else {
        set first $anchorname
        set last $cur
    }
    $w tag remove sel 0.0 $first
    $w tag add sel $first $last
    $w tag remove sel $last end
}

# ::scintilla::TextPasteSelection --
# This procedure sets the insertion cursor to the mouse position,
# inserts the selection, and sets the focus to the window.
#
# Arguments:
# w -           The text window.
# x, y -        Position of the mouse.

proc ::scintilla::TextPasteSelection {w x y} {
    $w mark set insert [TextClosestGap $w $x $y]
    if {![catch {::tk::GetSelection $w PRIMARY} sel]} {
        set oldSeparator [$w cget -autoseparators]
        if {$oldSeparator} {
            $w configure -autoseparators 0
            $w edit separator
        }
        $w insert insert $sel
        if {$oldSeparator} {
            $w edit separator
            $w configure -autoseparators 1
        }
    }
    if {[$w cget -state] eq "normal"} {
        focus $w
    }
}

# ::scintilla::TextAutoScan --
# This procedure is invoked when the mouse leaves a text window
# with button 1 down.  It scrolls the window up, down, left, or right,
# depending on where the mouse is (this information was saved in
# ::tk::Priv(x) and ::tk::Priv(y)), and reschedules itself as an "after"
# command so that the window continues to scroll until the mouse
# moves back into the window or the mouse button is released.
#
# Arguments:
# w -           The text window.

proc ::scintilla::TextAutoScan {w} {
    variable ::tk::Priv
    if {![winfo exists $w]} {
        return
    }
    if {$Priv(y) >= [winfo height $w]} {
        $w yview scroll 2 units
    } elseif {$Priv(y) < 0} {
        $w yview scroll -2 units
    } elseif {$Priv(x) >= [winfo width $w]} {
        $w xview scroll 2 units
    } elseif {$Priv(x) < 0} {
        $w xview scroll -2 units
    } else {
        return
    }
    TextSelectTo $w $Priv(x) $Priv(y)
    set Priv(afterId) [after 50 [list ::scintilla::TextAutoScan $w]]
}

# ::scintilla::TextSetCursor
# Move the insertion cursor to a given position in a text.  Also
# clears the selection, if there is one in the text, and makes sure
# that the insertion cursor is visible.  Also, don't let the insertion
# cursor appear on the dummy last line of the text.
#
# Arguments:
# w -           The text window.
# pos -         The desired new position for the cursor in the window.

proc ::scintilla::TextSetCursor {w pos} {
    if {[$w compare $pos == end]} {
        set pos {end - 1 chars}
    }
    $w mark set insert $pos
    set anchorname [::scintilla::TextAnchor $w]
    $w mark set $anchorname $pos
    $w tag remove sel 1.0 end
    $w see insert
    if {[$w cget -autoseparators]} {
        $w edit separator
    }
}

# ::scintilla::TextKeySelect
# This procedure is invoked when stroking out selections using the
# keyboard.  It moves the cursor to a new position, then extends
# the selection to that position.
#
# Arguments:
# w -           The text window.
# new -         A new position for the insertion cursor (the cursor hasn't
#               actually been moved to this position yet).

proc ::scintilla::TextKeySelect {w new} {
    set new [$w index $new]
    set anchorname [::scintilla::TextAnchor $w]
    if {[$w tag nextrange sel 1.0 end] eq ""} {
        set insert_ix [$w index insert]
        set anchor_ix [$w index $anchorname]
        if {[$w compare $new < insert]} {
            $w tag add sel $new insert
        } else {
            $w tag add sel insert $new
        }
        #----------------------------------------------------------------------
        # This differs from the code in text.tcl because of a fundamental
        # difference between Scintilla selection behavior and Tk Text.
        # The latter allows independent positioning of the insert location
        # relative to the selection; whereas Scintilla requires it to be
        # one of the extents of the selection region. So the problem we face,
        # which is the reason for this overload, is the above call to add
        # the selection: "tag add sel insert $new" will actually cause a change
        # in the location of the insertion point with Scintilla. Since the
        # intent of the next command is to move the anchor to where the insert
        # point was at the start of this function, we get that location first
        # and then reuse it via "$insert_ix"
        #----------------------------------------------------------------------
        $w mark set $anchorname $insert_ix
    } else {
        if {[$w compare $new < $anchorname]} {
            set first [$w index $new]
            set last [$w index $anchorname]
            set anchor_ix $last
        } else {
            set first [$w index $anchorname]
            set last [$w index $new]
            set anchor_ix $first
        }
        $w tag remove sel 1.0 $first
        $w tag add sel $first $last
        $w tag remove sel $last end
    }
    $w mark set insert $new
    $w mark set $anchorname $anchor_ix
    $w see insert
    update idletasks
}

# ::scintilla::TextResetAnchor --
# Set the selection anchor to whichever end is farthest from the
# index argument.  One special trick: if the selection has two or
# fewer characters, just leave the anchor where it is.  In this
# case it doesn't matter which point gets chosen for the anchor,
# and for the things like Shift-Left and Shift-Right this produces
# better behavior when the cursor moves back and forth across the
# anchor.
#
# Arguments:
# w -           The text widget.
# index -       Position at which mouse button was pressed, which determines
#               which end of selection should be used as anchor point.

proc ::scintilla::TextResetAnchor {w index} {
    if {[$w tag ranges sel] eq ""} {
        # Don't move the anchor if there is no selection now; this
        # makes the widget behave "correctly" when the user clicks
        # once, then shift-clicks somewhere -- ie, the area between
        # the two clicks will be selected. [Bug: 5929].
        return
    }
    set anchorname [::scintilla::TextAnchor $w]
    set a [$w index $index]
    set b [$w index sel.first]
    set c [$w index sel.last]
    if {[$w compare $a < $b]} {
        $w mark set $anchorname sel.last
        return
    }
    if {[$w compare $a > $c]} {
        $w mark set $anchorname sel.first
        return
    }
    scan $a "%d.%d" lineA chA
    scan $b "%d.%d" lineB chB
    scan $c "%d.%d" lineC chC
    if {$lineB < $lineC+2} {
        set total [string length [$w get $b $c]]
        if {$total <= 2} {
            return
        }
        if {[string length [$w get $b $a]] < ($total/2)} {
            $w mark set $anchorname sel.last
        } else {
            $w mark set $anchorname sel.first
        }
        return
    }
    if {($lineA-$lineB) < ($lineC-$lineA)} {
        $w mark set $anchorname sel.last
    } else {
        $w mark set $anchorname sel.first
    }
}

# ::scintilla::TextCursorInSelection --
# Check whether the selection exists and contains the insertion cursor. Note
# that it assumes that the selection is contiguous.
#
# Arguments:
# w -           The text widget whose selection is to be checked

proc ::scintilla::TextCursorInSelection {w} {
    expr {
        [llength [$w tag ranges sel]]
        && [$w compare sel.first <= insert]
        && [$w compare sel.last >= insert]
    }
}

# ::scintilla::TextInsert --
# Insert a string into a text at the point of the insertion cursor.
# If there is a selection in the text, and it covers the point of the
# insertion cursor, then delete the selection before inserting.
#
# Arguments:
# w -           The text window in which to insert the string
# s -           The string to insert (usually just a single character)

proc ::scintilla::TextInsert {w s} {
    if {$s eq "" || [$w cget -state] eq "disabled"} {
        return
    }
    set compound 0
    if {[TextCursorInSelection $w]} {
        set compound [$w cget -autoseparators]
        if {$compound} {
            $w configure -autoseparators 0
            $w edit separator
        }
        $w delete sel.first sel.last
    }
    $w insert insert $s
    $w see insert
    if {$compound} {
        $w edit separator
        $w configure -autoseparators 1
    }
}

# ::scintilla::TextUpDownLine --
# Returns the index of the character one display line above or below the
# insertion cursor.  There are two tricky things here.  First, we want to
# maintain the original x position across repeated operations, even though
# some lines that will get passed through don't have enough characters to
# cover the original column.  Second, don't try to scroll past the
# beginning or end of the text.
#
# Arguments:
# w -           The text window in which the cursor is to move.
# n -           The number of display lines to move: -1 for up one line,
#               +1 for down one line.

proc ::scintilla::TextUpDownLine {w n} {
    variable ::tk::Priv

    set i [$w index insert]
    if {$Priv(prevPos) ne $i} {
        set Priv(textPosOrig) $i
    }
    set lines [$w count -displaylines $Priv(textPosOrig) $i]
    set new [$w index \
            "$Priv(textPosOrig) + [expr {$lines + $n}] displaylines"]
    if {[$w compare $new == end] \
            || [$w compare $new == "insert display linestart"]} {
        set new $i
    }
    set Priv(prevPos) $new
    return $new
}

# ::scintilla::TextPrevPara --
# Returns the index of the beginning of the paragraph just before a given
# position in the text (the beginning of a paragraph is the first non-blank
# character after a blank line).
#
# Arguments:
# w -           The text window in which the cursor is to move.
# pos -         Position at which to start search.

proc ::scintilla::TextPrevPara {w pos} {
    set pos [$w index "$pos linestart"]
    while {1} {
        if {([$w get "$pos - 1 line"] eq "\n" && ([$w get $pos] ne "\n")) \
                || $pos eq "1.0"} {
            if {[regexp -indices -- {^[ \t]+(.)} \
                    [$w get $pos "$pos lineend"] -> index]} {
                set pos [$w index "$pos + [lindex $index 0] chars"]
            }
            if {[$w compare $pos != insert] || [lindex [split $pos .] 0]==1} {
                return $pos
            }
        }
        set pos [$w index "$pos - 1 line"]
    }
}

# ::scintilla::TextNextPara --
# Returns the index of the beginning of the paragraph just after a given
# position in the text (the beginning of a paragraph is the first non-blank
# character after a blank line).
#
# Arguments:
# w -           The text window in which the cursor is to move.
# start -       Position at which to start search.

proc ::scintilla::TextNextPara {w start} {
    set pos [$w index "$start linestart + 1 line"]
    while {[$w get $pos] ne "\n"} {
        if {[$w compare $pos == end]} {
            return [$w index "end - 1c"]
        }
        set pos [$w index "$pos + 1 line"]
    }
    while {[$w get $pos] eq "\n"} {
        set pos [$w index "$pos + 1 line"]
        if {[$w compare $pos == end]} {
            return [$w index "end - 1c"]
        }
    }
    if {[regexp -indices -- {^[ \t]+(.)} \
            [$w get $pos "$pos lineend"] -> index]} {
        return [$w index "$pos + [lindex $index 0] chars"]
    }
    return $pos
}

# ::scintilla::TextScrollPages --
# This is a utility procedure used in bindings for moving up and down
# pages and possibly extending the selection along the way.  It scrolls
# the view in the widget by the number of pages, and it returns the
# index of the character that is at the same position in the new view
# as the insertion cursor used to be in the old view.
#
# Arguments:
# w -           The text window in which the cursor is to move.
# count -       Number of pages forward to scroll;  may be negative
#               to scroll backwards.

proc ::scintilla::TextScrollPages {w count} {
    set bbox [$w bbox insert]
    $w yview scroll $count pages
    if {$bbox eq ""} {
        return [$w index @[expr {[winfo height $w]/2}],0]
    }
    return [$w index @[lindex $bbox 0],[lindex $bbox 1]]
}

# ::scintilla::TextTranspose --
# This procedure implements the "transpose" function for text widgets.
# It tranposes the characters on either side of the insertion cursor,
# unless the cursor is at the end of the line.  In this case it
# transposes the two characters to the left of the cursor.  In either
# case, the cursor ends up to the right of the transposed characters.
#
# Arguments:
# w -           Text window in which to transpose.

proc ::scintilla::TextTranspose w {
    set pos insert
    if {[$w compare $pos != "$pos lineend"]} {
        set pos [$w index "$pos + 1 char"]
    }
    set new [$w get "$pos - 1 char"][$w get  "$pos - 2 char"]
    if {[$w compare "$pos - 1 char" == 1.0]} {
        return
    }
    # ensure this is seen as an atomic op to undo
    set autosep [$w cget -autoseparators]
    if {$autosep} {
        $w configure -autoseparators 0
        $w edit separator
    }
    $w delete "$pos - 2 char" $pos
    $w insert insert $new
    $w see insert
    if {$autosep} {
        $w edit separator
        $w configure -autoseparators $autosep
    }
}

# ::tk_textCopy --
# This procedure copies the selection from a text widget into the
# clipboard.
#
# Arguments:
# w -           Name of a text widget.

proc ::tk_textCopy w {
    if {![catch {set data [$w get sel.first sel.last]}]} {
        clipboard clear -displayof $w
        clipboard append -displayof $w $data
    }
}

# ::tk_textCut --
# This procedure copies the selection from a text widget into the
# clipboard, then deletes the selection (if it exists in the given
# widget).
#
# Arguments:
# w -           Name of a text widget.

proc ::tk_textCut w {
    if {![catch {set data [$w get sel.first sel.last]}]} {
        clipboard clear -displayof $w
        clipboard append -displayof $w $data
        $w delete sel.first sel.last
    }
}

# ::tk_textPaste --
# This procedure pastes the contents of the clipboard to the insertion
# point in a text widget.
#
# Arguments:
# w -           Name of a text widget.

proc ::tk_textPaste w {
    global tcl_platform
    if {![catch {::tk::GetSelection $w CLIPBOARD} sel]} {
        set oldSeparator [$w cget -autoseparators]
        if {$oldSeparator} {
            $w configure -autoseparators 0
            $w edit separator
        }
        if {[tk windowingsystem] ne "x11"} {
            catch { $w delete sel.first sel.last }
        }
        $w insert insert $sel
        if {$oldSeparator} {
            $w edit separator
            $w configure -autoseparators 1
        }
    }
}

# ::scintilla::TextNextWord --
# Returns the index of the next word position after a given position in the
# text.  The next word is platform dependent and may be either the next
# end-of-word position or the next start-of-word position after the next
# end-of-word position.
#
# Arguments:
# w -           The text window in which the cursor is to move.
# start -       Position at which to start search.

if {[tk windowingsystem] eq "win32"}  {
    proc ::scintilla::TextNextWord {w start} {
        TextNextPos $w [TextNextPos $w $start tcl_endOfWord] \
                tcl_startOfNextWord
    }
} else {
    proc ::scintilla::TextNextWord {w start} {
        TextNextPos $w $start tcl_endOfWord
    }
}

# ::scintilla::TextNextPos --
# Returns the index of the next position after the given starting
# position in the text as computed by a specified function.
#
# Arguments:
# w -           The text window in which the cursor is to move.
# start -       Position at which to start search.
# op -          Function to use to find next position.

proc ::scintilla::TextNextPos {w start op} {
    set text ""
    set cur $start
    while {[$w compare $cur < end]} {
        set text $text[$w get -displaychars $cur "$cur lineend + 1c"]
        set pos [$op $text 0]
        if {$pos >= 0} {
            return [$w index "$start + $pos display chars"]
        }
        set cur [$w index "$cur lineend +1c"]
    }
    return end
}

# ::scintilla::TextPrevPos --
# Returns the index of the previous position before the given starting
# position in the text as computed by a specified function.
#
# Arguments:
# w -           The text window in which the cursor is to move.
# start -       Position at which to start search.
# op -          Function to use to find next position.

proc ::scintilla::TextPrevPos {w start op} {
    set text ""
    set cur $start
    while {[$w compare $cur > 0.0]} {
        set text [$w get -displaychars "$cur linestart - 1c" $cur]$text
        set pos [$op $text end]
        if {$pos >= 0} {
            return [$w index "$cur linestart - 1c + $pos display chars"]
        }
        set cur [$w index "$cur linestart - 1c"]
    }
    return 0.0
}

# ::scintilla::TextScanMark --
#
# Marks the start of a possible scan drag operation
#
# Arguments:
# w -   The text window from which the text to get
# x -   x location on screen
# y -   y location on screen

proc ::scintilla::TextScanMark {w x y} {
    variable ::tk::Priv
    $w scan mark $x $y
    set Priv(x) $x
    set Priv(y) $y
    set Priv(mouseMoved) 0
}

# ::scintilla::TextScanDrag --
#
# Marks the start of a possible scan drag operation
#
# Arguments:
# w -   The text window from which the text to get
# x -   x location on screen
# y -   y location on screen

proc ::scintilla::TextScanDrag {w x y} {
    variable ::tk::Priv
    # Make sure these exist, as some weird situations can trigger the
    # motion binding without the initial press.  [Bug #220269]
    if {![info exists Priv(x)]} {
        set Priv(x) $x
    }
    if {![info exists Priv(y)]} {
        set Priv(y) $y
    }
    if {($x != $Priv(x)) || ($y != $Priv(y))} {
        set Priv(mouseMoved) 1
    }
    if {[info exists Priv(mouseMoved)] && $Priv(mouseMoved)} {
        $w scan dragto $x $y
    }
}
