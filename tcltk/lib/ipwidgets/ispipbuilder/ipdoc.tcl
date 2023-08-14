#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

namespace eval ipdoc {
    variable var
    variable count 0
    variable id    ""
}

proc ipdoc::create { nb } {
    global Para

    set f1 [$nb insert end demoBasic -text "Documentation"]

    set f2 [frame $f1.buttons]
    pack $f2 -side bottom -fill x

    set frame [frame $f1.doc]

    iwidgets::scrolledhtml .doc -labeltext $Para(CoreName) -labelfont {Arial 14 bold} \
        -hscrollmode dynamic -vscrollmode dynamic -height 5i -wrap word -linkcommand ispIPBuilder::_OpenBrowser -padx 10

    pack .doc -in $frame -padx 4 -fill both -expand yes

    .doc import $Para(doc)
    pack $frame -fill both -expand yes

    set close   [Button $f2.cls -text "Close" \
                   -repeatdelay 300 \
                   -command  exit \
                   -font {arial 10} \
                   -width 15 \
                   -helptext "Click to close window."]
    set help   [Button $f2.hlp -text "Help" \
                   -repeatdelay 300 \
                   -command  "ispIPBuilder::_OpenBrowser \"$Para(webhelp)\"" \
                   -font {arial 10} \
                   -width 15 \
                   -helptext "Click for Help"]

    pack $help -side right -padx 10 -pady 10
    pack $close -side right -padx 10 -pady 10

    return $frame
}
