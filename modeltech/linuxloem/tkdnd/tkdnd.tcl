#
# mtidnd - MTI Drag-N-Drop
#
# command compatible implementation of tkdnd 1.0
#
# Author: B.S.Griffin
# 2012

package provide tkdnd 0.1

package require cmdline

namespace eval tkdnd {
	variable targets
	variable sources
	variable source ""
	variable target ""
	variable dragging 0
	variable notcursor
	variable dndaddcursor
	variable type2format [list text/plain STRING {text/plain;charset=utf-8} STRING text/uri-list FileName]
	variable logmode off
	variable logfile ""
	variable logfp ""
	variable logtime 0
	# Lamda expression tests if widget $c has a toplevel menu
	variable withmenus {
		{c} {
			expr {
				  [winfo manager $c] eq "wm" && 
				  [winfo class $c] ne "Menu" && 
				  ![catch {$c cget -menu} m] && $m ne ""
			  }
		}
	} 
	variable dragButton 0 ;# Invalid on purpose, will be forced to 1 below
	variable BtnMotionEvnt
	variable BtnReleaseEvnt
	variable BtnEnterEvnt
	variable BtnLeaveEvnt
	variable BtnMotionCmd   {::tkdnd::b1Motion  %W %x %y %X %Y %s}
	variable BtnReleaseCmd	{::tkdnd::b1Release %W %x %y %X %Y %s}
	variable BtnEnterCmd	{::tkdnd::b1Enter   %W %x %y %X %Y %s}
	variable BtnLeaveCmd	{::tkdnd::b1Leave   %W %x %y %X %Y %s}
	variable BtnEscapecmd   {::tkdnd::b1Cancel  %W %x %y %X %Y %s}
proc _setEventButton {n} {
	variable dragButton
	variable BtnMotionEvnt
	variable BtnReleaseEvnt
	variable BtnEnterEvnt
	variable BtnLeaveEvnt
	variable BtnMotionCmd
	variable BtnReleaseCmd
	variable BtnEnterCmd  
	variable BtnLeaveCmd  

	# Error check and optimize
	if {$n ni {1 2 3}} {
		error "n must be 1, 2, or 3"
	}
	if {$n == $dragButton} {
		return
	}
	if {$dragButton > 0} {
		# Remove previous binding
		bind TkdndTag $BtnMotionEvnt  {}
		bind TkdndTag $BtnReleaseEvnt {}
		bind TkdndTag $BtnEnterEvnt   {}
		bind TkdndTag $BtnLeaveEvnt   {}
	}
	# Bind to new button
	set dragButton      $n
	set BtnMotionEvnt   <B${n}-Motion>
	set BtnReleaseEvnt	<ButtonRelease-${n}>
	set BtnEnterEvnt	<B${n}-Enter>
	set BtnLeaveEvnt	<B${n}-Leave>
	bind TkdndTag $BtnMotionEvnt  $BtnMotionCmd
	bind TkdndTag $BtnReleaseEvnt $BtnReleaseCmd
	bind TkdndTag $BtnEnterEvnt   $BtnEnterCmd  
	bind TkdndTag $BtnLeaveEvnt   $BtnLeaveCmd  
	return
}

	_setEventButton 1

	bind TkdndTag <Key-Escape>      {::tkdnd::b1Cancel  %W %x %y %X %Y %s}

	set notbitmap [GetButtonBitmap not32]
	set notmask [GetButtonBitmap not32_mask]
	set notcursor [list $notbitmap [string range $notmask 1 end] red white]
	set dndadd_bitmap [GetButtonBitmap dndadd]
	set dndadd_mask   [GetButtonBitmap dndadd_mask]
	set dndaddcursor [list $dndadd_bitmap [string range $dndadd_mask 1 end] black white]

	namespace export dnd
}


proc ::tkdnd::log {cmd args} {
	variable logmode
	variable logfile
	variable logfp
	variable logtime
	switch -- $cmd {
		on {
			set logmode on
		}
		off {
			set logmode off
		}
		file {
			set logfile [lindex $args 0]
			set logfp [open $logfile w]
			set logtime 0
		}
		record {
			if {$logmode} {
				if {$logfp eq ""} {
					return ""
				}
				set ticks [clock clicks -milliseconds]
				set dt [expr {($logtime > 0) ? ($ticks - $logtime) : 0}]
				puts $logfp [list $dt $args]
				set logtime $ticks
			}
		}
		close {
			if {$logfp ne ""} {
				close $logfp
				set logfp ""
			}
		}
		replay {
			set file [lindex $args 0]
			replay $file
		}
		default {
			error "unknown log command: $cmd"
		}
	}
	return ""
}

proc ::tkdnd::replay {file} {
	set fp [open $file]
	set t 0
	gets $fp line
	set firstcmd [lindex $line 1 0]
	if {$firstcmd eq "drag"} {
		set w [lindex $line 1 1]
		focus $w
		update idletasks
	}
	lassign $line dt cmd
	incr t $dt
	after $t namespace eval [namespace current] [list catch [list $cmd]]
	while {[gets $fp line] >= 0} {
		lassign $line dt cmd
		incr t $dt
		after $t namespace eval [namespace current] [list catch [list $cmd]]
	}
	return
}

proc ::tkdnd::_find_wdgts {w func} {
	set menus [list]
	if {![winfo exists $w]} {
		return $menus
	}
	foreach c [winfo children $w] {
		if {[apply $func $c]} {
			lappend menus $c
		}
		lconcat menus [_find_wdgts $c $func]
	}
	return $menus
}

proc ::tkdnd::_tlm {w} {
	set top [winfo toplevel $w]
	if {[lsearch -exact [join [$top configure]] -menu] >= 0 &&
		[$top cget -menu] ne ""} {
		set mb [$top cget -menu]
		set mb2 [string map ". \#" $mb]
		if {$top eq "."} {
			set top ""
		}
		return [list $mb "${top}.${mb2}"]
	}
	return [list]
}

proc ::tkdnd::setbindings {toplevel {do_menus 1}} {
	variable original_bindings
	variable notcursor
	variable withmenus
	variable BtnMotionEvnt
	variable BtnReleaseEvnt
	variable BtnEnterEvnt
	variable BtnLeaveEvnt
	if {[lsearch -exact [bindtags $toplevel] TkdndTag] < 0} {
		bindtags $toplevel [concat TkdndTag [bindtags $toplevel]]
		set original_bindings($toplevel)	 [list]
		lappend original_bindings($toplevel) [bind $toplevel $BtnMotionEvnt]
		lappend original_bindings($toplevel) [bind $toplevel $BtnReleaseEvnt]
		lappend original_bindings($toplevel) [bind $toplevel $BtnEnterEvnt]	
		lappend original_bindings($toplevel) [bind $toplevel $BtnLeaveEvnt]
		lappend original_bindings($toplevel) [bind $toplevel <Key-Escape>]
		bind $toplevel $BtnMotionEvnt  {::tkdnd::b1Motion  %W %x %y %X %Y top}
		bind $toplevel $BtnReleaseEvnt {::tkdnd::b1Release %W %x %y %X %Y top}
		bind $toplevel $BtnEnterEvnt   {::tkdnd::b1Enter   %W %x %y %X %Y top}
		bind $toplevel $BtnLeaveEvnt   {::tkdnd::b1Leave   %W %x %y %X %Y top}
		bind $toplevel <Key-Escape>    {::tkdnd::b1Cancel  %W %x %y %X %Y %s}
		$toplevel configure -cursor $notcursor
		if {$do_menus && ![catch {$toplevel cget -menu} mbar] && [winfo exists $mbar]} {
			foreach tl [concat . [_find_wdgts . $withmenus]] {
				foreach mw [_tlm $tl] {
					foreach bt [bindtags $mw] {
						if {$bt eq "all" || 
							$bt eq $tl ||
							$bt eq "."} {
							continue
						}
						foreach e [concat [bind $bt] <Enter> <Leave>] {
							bind TkdndBreak $e break
						}
					}
					bindtags $mw [concat TkdndBreak [bindtags $mw]]
				}
			}
		}
	}
}

proc ::tkdnd::unsetbindings {toplevel {do_menus 1}} {
	variable original_bindings
	variable withmenus
	variable BtnMotionEvnt
	variable BtnReleaseEvnt
	variable BtnEnterEvnt
	variable BtnLeaveEvnt
	if {[info exists original_bindings($toplevel)]} {
		set b $original_bindings($toplevel)
		bind $toplevel $BtnMotionEvnt  [lindex $b 0]
		bind $toplevel $BtnReleaseEvnt [lindex $b 1]
		bind $toplevel $BtnEnterEvnt   [lindex $b 2]
		bind $toplevel $BtnLeaveEvnt   [lindex $b 3]
		bind $toplevel <Key-Escape>    [lindex $b 4]
		set newtags [lsearch -exact -inline -all -not [bindtags $toplevel] TkdndTag]
		bindtags $toplevel $newtags
		$toplevel configure -cursor {}
		if {$do_menus && ![catch {$toplevel cget -menu} mbar] && [winfo exists $mbar]} {
			foreach tl [concat . [_find_wdgts . $withmenus]] {
				foreach mw [_tlm $tl] {
					set newtags [lsearch -exact -inline -all -not [bindtags $mw] TkdndBreak]
					bindtags $mw $newtags
				}
			}
		}
	}
}

proc ::tkdnd::ex_callback {script args} {
	set options {
		{Widget.arg ""   "Widget"}
		{x.arg      "-1" "window relative x coordinate"}
		{y.arg      "-1" "window relative y coordinate"}
		{X.arg      "-1" "screen absolute x coordinate"}
		{Y.arg      "-1" "screen absolute y coordinate"}
		{Action.arg copy "current action"}
		{alist.arg  copy "action list supported by source"}
		{button.arg 1    "mouse button that is pressed"}
		{clist.arg  ""   "codes of the list of types supported by source"}
		{Code.arg   ""   "code (in octal format) of the current type of the operation"}
		{tlist.arg  ""   "list of supported types"}
		{Type.arg   ""   "current type"}
		{Data.arg   ""   "data that has been dropped"}
	}
	set usage "ex_callback script ?options?"
	set opt [cmdline::getoptions args $options $usage]

	if {[llength [dict get $opt tlist]] > 0 &&
		[llength [dict get $opt clist]] == 0} {
		set ctypes [list]
		foreach t [dict get $opt tlist] {
			lappend ctypes [winfo atom $t]
		}
		dict set opt clist $ctypes
	} elseif {[llength [dict get $opt tlist]] == 0 &&
			  [llength [dict get $opt clist]] > 0} {
		set types [list]
		foreach c [dict get $opt clist] {
			lappend types [winfo atomname $c]
		}
		dict set opt tlist $types
	}
	if {[dict get $opt Code] eq "" &&
		[llength [dict get $opt clist]] > 0} {
		dict set opt Code [lindex [dict get $opt clist] 0]
	}
	if {[dict get $opt Type] eq "" &&
		[llength [dict get $opt tlist]] > 0} {
		dict set opt Type [lindex [dict get $opt tlist] 0]
	}

	set map [list %% %]
	dict for {key value} $opt {
		lappend map "%[string index $key 0]" [list $value]
	}
	set ss [string map $map $script]
	set status [catch {uplevel "#0" $ss} rv]
	if {$status == 1} {
		mti_error_message "status=$status\n$rv\n"
		puts stderr "$::errorInfo\n"
	}
	return $rv
}

proc ::tkdnd::b1Motion {W x y X Y s} {
	variable dragging
	if {$dragging} {
		variable targets
		variable target
		variable toplevel
		#log record b1Motion $W $x $y $X $Y $s
		set widget [winfo containing $X $Y]
		if {[winfo exists $widget]} {
			set wtl [winfo toplevel $widget]
		} else {
			set wtl $toplevel
		}
		if {$wtl ne $toplevel} {
			unsetbindings $toplevel
			grab release $toplevel
			set toplevel $wtl
			setbindings $toplevel
			grab $toplevel
		}
		if {[dict exists $targets $W]} {
			set types [dict keys [dict get $targets $W]]
			foreach t $types {
				set s [dnd bindtarget $W $t <Drag>]
				if {$s ne ""} {
					set status [ex_callback $s -Widget $W -x $x -y $y -X $X -Y $Y -tlist $types -Type $t]
				}
			}
		}
		return -code break
	}	
}

proc ::tkdnd::b1Release {W x y X Y s} {
	# Trigger drop
	variable dragging
	variable cursors
	variable BtnReleaseEvnt
	if {$dragging} {
		variable sources
		variable source
		variable targets
		variable target
		variable toplevel
		#log record b1Release $W $x $y $X $Y $s
		if {[dict exists $sources $source] &&
			[dict exists $targets $W]} {
			set srctypes [dict keys [dict get $sources $source]]
			set types [dict keys [dict get $targets $W]]
			foreach t $types {
				if {[lsearch -exact $srctypes $t] < 0} continue
				set s [dnd bindtarget $W $t <Drop>]
				if {$s ne ""} {
					set srcscript [dict get $sources $source $t]
					set D [ex_callback $srcscript -Widget $source -x $x -y $y -X $X -Y $Y -tlist $types -Type $t]
					set rv [ex_callback $s -Widget $W -x $x -y $y -X $X -Y $Y -tlist $types -Type $t -Data $D]
#					after idle [list ::tkdnd::ex_callback $s -Widget $W -x $x -y $y -X $X -Y $Y -tlist $types -Type $t -Data $D]
					break
				}
			}
		}
		grab release $toplevel
		unsetbindings $toplevel
		set dragging 0
		variable dragobjs 
		foreach widget [array names dragobjs] {
			after idle ::tkdnd::sendBtnRelease $widget $x $y $X $Y
		}
		array unset dragobjs
	}
	foreach cw [array names cursors] {
		$cw configure -cursor $cursors($cw)
		unset cursors($cw)
	}
}

proc ::tkdnd::sendBtnRelease {widget x y X Y} {
	variable BtnReleaseEvnt
	# This proc gets called via an after idle so we'll ensure our widget still exists
	if { [winfo exists $widget] } { 
		event generate $widget $BtnReleaseEvnt -x $x -y $y -rootx $X -rooty $Y 
	}
}

proc ::tkdnd::b1Cancel {W x y X Y s} {
	# Trigger drop
	variable dragging
	variable cursors
	if {$dragging} {
		variable toplevel
		#log record b1Cancel $W $x $y $X $Y $s
		grab release $toplevel
		unsetbindings $toplevel
		set dragging 0
	}
	foreach cw [array names cursors] {
		$cw configure -cursor $cursors($cw)
		unset cursors($cw)
	}
}

proc ::tkdnd::b1Enter {W x y X Y s} {
	variable dragging
	if {$dragging} {
		variable targets
		variable target
		variable cursors
		variable notcursor
		variable dndaddcursor
		#log record b1Enter $W $x $y $X $Y $s
		if {[dict exists $targets $W]} {
			set target $W
			set types [dict keys [dict get $targets $W]]
			set allowed_n 0
			foreach t $types {
				incr allowed_n
				set s [dnd bindtarget $W $t <DragEnter>]
				if {$s ne ""} {
					set rv [ex_callback $s -Widget $W -x $x -y $y -X $X -Y $Y -tlist $types -Type $t]
					if { $rv eq "none" } {
						incr allowed_n -1
					}
				}
			}
			if {![info exists cursors($W)]} {
				if {![catch {$W cget -cursor} cx]} {
					set cursors($W) $cx
					if { $allowed_n == 0 } {
						$W configure -cursor $notcursor
					} else {
						$W configure -cursor $dndaddcursor ;#diamond_cross
					}
				}
			}
		} else {
			if {[lsearch -exact [bindtags $W] TkdndTag] < 0} {
				bindtags $W [concat TkdndTag [bindtags $W]]
			}
			if {0 && ![info exists cursors($W)]} {
				if {![catch {$W cget -cursor} cx]} {
					set cursors($W) $cx
					$W configure -cursor $notcursor
				}
			}
		}
	}
}

proc ::tkdnd::b1Leave {W x y X Y s} {
	variable dragging
	if {$dragging} {
		variable targets
		variable target
		variable cursors
		#log record b1Leave $W $x $y $X $Y $s
		set target ""
		if {[dict exists $targets $W]} {
			set types [dict keys [dict get $targets $W]]
			foreach t $types {
				set s [dnd bindtarget $W $t <DragLeave>]
				if {$s ne ""} {
					set rv [ex_callback $s -Widget $W -x $x -y $y -X $X -Y $Y -tlist $types -Type $t]

				}
			}
		} else {
			if {[set ix [lsearch -exact [bindtags $W] TkdndTag]] >= 0} {
				bindtags $W [lreplace [bindtags $W] $ix $ix]
			}
		}
		return -code break
	}
}

proc tkdnd::cleartarget {args} {
	variable targets
	lassign $args widget
	dict unset targets $widget
}

proc tkdnd::clearsource {args} {
	variable sources
	lassign $args widget
	dict unset sources $widget
}

proc tkdnd::bindsource {args} {
	# bindsource widget type script
	variable sources
	lassign $args widget type script
	switch [llength $args] {
		0 {
			return [dict keys $sources]
		}
		1 {
			if {[dict exists $sources $widget]} {
				return [dict keys [dict get $sources $widget]]
			} else {
				return ""
			}
		}
		2 {
			if {[dict exists $sources $widget $type]} {
				return [dict get $sources $widget $type]
			} else {
				return ""
			}
		}
		3 -
		4 {
			dict set sources $widget $type $script
		}
		default {
			error "wrong number of args"
		}
	}
}

proc tkdnd::bindtarget {args} {
	# bindtarget widget type event script
	variable targets
	lassign $args widget type event script priority
	switch [llength $args] {
		0 {
			return [dict keys $targets]
		}
		1 {
			if {[dict get $targets $widget]} {
				return [dict keys [dict get $targets $widget]]
			} else {
				return ""
			}
		}
		2 {
			if {[dict exists $targets $widget $type]} {
				return [dict keys [dict get $targets $widget $type]]
			} else {
				return ""
			}
		}
		3 {
			if {[dict exists $targets $widget $type $event]} {
				return [dict get $targets $widget $type $event]
			} else {
				return ""
			}
		}
		4 -
		5 {
			dict set targets $widget $type $event $script
			if {$script ne ""} {
				if {[lsearch -exact [bindtags $widget] TkdndTag] < 0} {
					bindtags $widget [concat TkdndTag [bindtags $widget]]
				}
			} elseif {[set ix [lsearch -exact [bindtags $widget] TkdndTag]] >= 0} {
				bindtags $widget [lreplace [bindtags $widget] $ix $ix]
			}
		}
		default {
			error "wrong number of args"
		}
	}
}

proc tkdnd::drag {args} {
	variable sources
	variable source
	variable dragging
	variable toplevel
	variable ctop
	variable wa
	variable dragimages
	variable notimage
	variable notmask
	variable dragobjs 
	#log record drag $args
	lassign [winfo pointerxy .] X Y
	set widget [winfo containing $X $Y]
	set dragobjs($widget) ""
	set x [expr {$X - [winfo rootx $widget]}]
	set y [expr {$Y - [winfo rooty $widget]}]
	if {[dict exists $sources $widget]} {
		set source $widget
		selection own -selection XdndSelection $widget
	}
	set toplevel [winfo toplevel $widget]
	setbindings $toplevel
	grab $toplevel
	set dragging 1
	b1Enter $widget $x $y $X $Y {}
	return ""
}

proc tkdnd::find_cursor {w c} {
	set matches [list]
	if {[winfo exists $w] &&
		![catch {$w cget -cursor} cx] &&
		$cx eq $c} {
		lappend matches $w
	}
	foreach child [winfo children $w] {
		set matches [concat $matches [find_cursor $child $c]]
	}
	return $matches
}

proc tkdnd::dnd {cmd args} {
	$cmd {*}$args
}


namespace import tkdnd::dnd
