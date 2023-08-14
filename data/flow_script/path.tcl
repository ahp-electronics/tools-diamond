# These functions can be used in the tcl scripts in the Bali flow engine (BDK)
# Copyright (c), 2008, Lattice Semiconductor Corporation, All Rights Reserved

namespace eval bali::utility::path {
	global tcl_platform
	variable case_sensitive {}
	if [string equal -nocase $tcl_platform(platform) windows] {
		set case_sensitive "-nocase"
	}
	
	# Check if two paths are equale
	proc is_same_path { path1 path2 } {
		variable case_sensitive
		set path1 [file normalize $path1]
		set path2 [file normalize $path2]
		if { [eval string compare $case_sensitive [list $path1 $path2] ] == 0} {
			return 1
		}
		return 0
	}
	
	# Check if the path is in absolute format.
	# The path should only contains TCL format path separator '/'.
	proc is_absolute_path { path } {
		if { [string index $path 0] == "/" } {
			return 1
		}
		if { [regexp {^[a-zA-Z]:/} $path] } {
			return 1
		}
		return 0
	}

	# Caculate the absolute format of a path. 
	# The path maybe in a relative format against to root_dir.
	# The path and root_dir should only contain TCL format path separator '/'.
	# The root_dir should be in absolute format without '..' and '.'.
	# Support '.', '..', but not '...'
	proc get_absolute_path { root_dir path } {
		if { [is_absolute_path $path] } {
			return $path
		}
		set rd [ split $root_dir / ]
		while { [llength $rd] > 1 && [ string length [ lindex $rd end ] ] == 0} {
			set rd [ lrange $rd 0 end-1 ]
		}
		set p [ split $path / ]
		foreach sub_dir $p {
			if { [ string length $sub_dir ] == 0 || [ string equal $sub_dir "." ] } {
				continue
			} elseif { $sub_dir == ".." } {
				while { [ string length [ lindex $rd end ] ] == 0 } {
					set rd [ lrange $rd 0 end-1 ]
				}
				set rd [ lrange $rd 0 end-1 ]
				continue
			} else {
				lappend rd $sub_dir
			}
		}
		return [ join $rd / ]
	}
	
	# Caculate the relative format of a path. 
	# The result path maybe in a relative format against to root_dir.
	# The path and root_dir should only contain TCL format path separator '/'.
	# The root_dir and input path should be in absolute format without '..' and '.'.
	# Support '.', '..', but not '...'
	proc get_relative_path { root_dir path } {
		variable case_sensitive
		set num 0
		set rl [ split $root_dir / ]
		# remove the last '/'
		if { [llength $rl] > 1 && [string length [lindex $rl end] ] == 0 } {
			set rl [lrange $rl 0 end-1]
		}
		set pl [ split $path / ]
        foreach r $rl p $pl {
			if [eval string equal $case_sensitive [list $r $p] ] {
				incr num
			} else {
				break
			}
		}
		if {$num == 0} {
			return $path
		}
		set rlen [ llength $rl ]
		for {set i [ expr { $rlen - $num } ] } { $i > 0 } { incr i -1 } {
			lappend result ".." 
		}
		set rlen [ llength $pl ]
		for {set i $num } { $i < $rlen } { incr i } {
			lappend result [lindex $pl $i] 
		}
		if [info exists result] {
			return [ join $result / ]
		}
		return "."
	}
	
	# Convert a path list to absolute format
	proc get_absolute_path_list {root_dir path_list} {
		set result {}
		foreach path $path_list {
			lappend result [ get_absolute_path $root_dir $path]
		}
		return $result
	}
	
	# Convert a path list to relative format
	proc get_relative_path_list {root_dir path_list} {
		set result {}
		foreach path $path_list {
			lappend result [ get_relative_path $root_dir $path]
		}
		return $result
	}
	
	proc to_unix_path {path} {
		return [regsub -all {\\} $path /]
	}
	
	proc get_file_name {path} {
		set pl [ split $path / ]
		return [lindex $pl end]
	}
	
	proc get_file_path {path} {
		set pl [ split $path / ]
		if {[llength $pl] == 1} {
			return "."
		}
		return [join [lrange $pl 0 end-1] /]
	}
	
	proc split_path_file {path} {
		set pl [ split $path / ]
		set name [lindex $pl end]		
		if {[llength $pl] == 1} {
			set pl [linsert $pl 0 "."]
		}
		if {[string length $name] == 0} {
			return [list [join [lrange $pl 0 end-1] /]] $name
		}
		set nl [ split $name . ]
		return [list [join [lrange $pl 0 end-1] /] $name [join [lrange $nl 0 end-1] .] [lindex $nl end]]
	}
	
	proc get_file_base_name {path} {
		set fn [get_file_name $path]
		set nl [ split $fn . ]
		return [join [lrange $nl 0 end-1] .]
	}
	
	proc get_file_ext_name {path} {
		set fn [get_file_name $path]
		set nl [ split $fn . ]
		return [lindex $nl end]
	}


}