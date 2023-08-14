# These functions can be used in the tcl scripts in the Bali project manager
# to import the ispLever project
# Copyright (c), 2008, Lattice Semiconductor Corporation, All Rights Reserved

namespace eval bali::utility {

	proc copy_symbol {current_dir dst_dir} {
		set path  [file dirname $current_dir]
		foreach fname [glob -nocomplain -directory ${path} *.sym] {
			copy_source $fname $dst_dir	
		}
	}
					
	proc pass_syn {syn_file proj_info} {
		upvar $proj_info project
		if [catch {open $syn_file r} fileid] {
			return -code error "ERROR - Can not read the $syn_file."
		}
		
		set bStart 1
		while {[gets $fileid line] >= 0} {
			if {$bStart != 0} {
				if {![regexp {^\s*JDF B\s*$} $line]} {
					return -code error "$syn_file is not a valid ispLEVER project."
				}
				set bStart 0
				continue
			} elseif {[regexp {^\s*//} $line]} {
				#ignore the comment
				continue
			}
			if {![regexp {^\s*(\S*)\s+(\S.*)(\s*)?$} $line match token value]} {
				#ignore invalid line
				continue
			}
			set token [string toupper $token]
			switch -exact $token {
				PROJECT { set project(title) $value }
				DESIGN { regexp {\S*} $value project(design) }
				DEVKIT { set project(device) $value }
				ENTRY { 
					if [string match "*Verilog*" $value] {
						lappend project(options) "HDL type"
						set project(HDL\ type) Verilog
                        set project(entry) Verilog
					} elseif [string match "*VHDL" $value] {
						lappend project(options) "HDL type"
						set project(HDL\ type) VHDL
                        set project(entry) VHDL
					} elseif [string match "EDIF" $value] {
						set project(entry) EDIF
					}
				}
				MODULE -
				SOURCE { lappend project(sources) [path::to_unix_path $value] }
				TOPMODULE {
					lappend project(options) "top"
					set project(top) $value 
				}
				RVLFILE { set project(rvl) [path::to_unix_path $value] }
				SYNTHESIS_TOOL { set project(synthesis) $value }
				EXCLUDED { lappend project(excluded) [path::to_unix_path $value] }
				default { #ignore others }
			}
		}
		close $fileid
	}

	proc pass_sty {sty_file proj_info} {
		upvar $proj_info project
		
		if [catch {get_ini_section $sty_file "search-path"} r] {
			return -code error $r
		}
		foreach {src path_list} $r {
			if {[string compare $src "%project%"] == 0} {
				set project(include\ path) [split $path_list \;]
			} else {
				if {[lsearch -exact $project(sources) $src] != -1} {
					upvar $src src_opt
					set src_opt(include\ path) [split $path_list \;]
				}
			}
		}
		
		set r [get_ini_section $sty_file "working-library"]
		foreach {src lib} $r {
			if {[lsearch -exact $project(sources) $src] != -1} {
				upvar $src src_opt
				set src_opt(lib) $lib
			}
		}
		
		foreach {opt val} [get_ini_section $sty_file "Normal"]	 {
			set val [string trim [ join [ lrange [split $val "," ] 3 end ] "," ] ]
			lappend project(properties) $opt $val
		}
	}
	
	proc pass_property_cfg {cfg_file str_cnv_table} {
		upvar $str_cnv_table str_table
		if [catch {get_ini_section $cfg_file "Normal"} r] {
			return -code error $r
		}
		foreach {id cfg} $r {
			set str_table(${id}) [split $cfg ","]
		}
	}
	
	proc copy_source { src target_path } {
		set target_file $target_path/[path::get_file_name $src]
		if [file exists $src] {
			if [catch {file copy -force $src $target_path} err_str] {
				puts $err_str
				set target_file $src
			}
		}
		return $target_file
	}
	
	proc load_lever_prj {syn_file {prj_file {}} {copy_src {0}} } {
		set file_path [path::split_path_file $syn_file]
		set src_path [lindex $file_path 0]
		set src_fname [lindex $file_path 1]
		set src_bname [lindex $file_path 2]
		if {[string compare $src_path "."] == 0} {
			regsub -nocase {/$} [pwd] "" src_path
		}
		set src_path [path::get_absolute_path [pwd] $src_path]
		if {[string length $src_fname] == 0} {
			return -code error "The input ispLEVER project file name is not specified."
		}
		set syn_file "$src_path/$src_fname"
		if {[string length $prj_file] != 0} {
			set file_path [path::split_path_file $prj_file]
			set bdf_path [lindex $file_path 0]
			set bdf_fname [lindex $file_path 1]
			set bdf_bname [lindex $file_path 2]
			set bdf_ename [lindex $file_path 3]
			if {[string length $bdf_fname] == 0} {
				set bdf_bname $src_bname
			}
			if {[string length $bdf_ename] == 0} {
				set bdf_ename ldf
			} elseif {[string compare -nocase $bdf_ename "ldf"] != 0} {
				return -code error "The new bali project file extension name should be '.ldf'"
			}
		} else {
			set bdf_path $src_path
			set bdf_bname $src_bname 
		}
		if {[string length $bdf_bname] == 0} {
			return -code error "The new bali project file base name can't be empty"
		}
		if {[string compare $bdf_path "."] != 0} {
			if [catch {cd "$bdf_path/"} err_str] {
				return -code error $err_str
			}
		}
		if [catch {pass_syn $syn_file prj} err_str] {
			return -code error $err_str
		}	
		#get the sty file name
		regsub -nocase {\.syn$} $syn_file ".sty" sty_file
		if {![string match $syn_file $sty_file]} {
			if [catch {pass_sty $sty_file prj} err_str] {
				puts $err_str
			}
		}
		#avoid the duplicate project naem as impl name
		set impl_name $prj(design)
		if {[string compare -nocase $bdf_bname $impl_name] == 0} {
			set impl_name impl1
		}
		#judge if the target path is the same as the source project path
		set same_dir [path::is_same_path "." $src_path]		
		#copy the lpf file to target dir
		set lpf_path "$src_path/${src_bname}.lpf"
 		if { $copy_src && !$same_dir } {
			if {![catch {file copy -force "$lpf_path" "."} err_str]} {
				set lpf_path ${src_bname}.lpf
			} else {
				puts $err_str
			}	
		}
		if [catch {prj_project new -name $bdf_bname -impl $impl_name -dev $prj(device) -lpf "$lpf_path"} err_str] {
			return -code error $err_str
		}
		if [info exists prj(synthesis)] { 
			prj_impl option synthesis $prj(synthesis) 
		}
		if [info exists prj(properties)] {
			set cfg_file [bali_core::bali_property -env DataPath]/strategy.cfg
			if [catch {pass_property_cfg $cfg_file str_cnv_table} err_str] {
				return -code error $err_str
			}
            set opt_num 0
			foreach {id val} $prj(properties) {
				if [info exists str_cnv_table($id) ] {
					foreach {item_id item_type} $str_cnv_table($id) break
					switch -regexp $item_type {
                    {(?i)^\s*path\s*$} {
						set val [ path::get_absolute_path $src_path [ path::to_unix_path $val ] ]
						set val [ path::get_relative_path [pwd] $val ]
					}					
					{(?i)^\s*pathlist\s*$} {
						set pl [ split [ path::to_unix_path $val ] ";" ]
						set pl [ path::get_relative_path_list [pwd] [ path::get_absolute_path_list $src_path $pl ] ]
						set val [ join $pl ";" ]
					}
					default {}	
					}
                    if { [string compare $item_id "PROP_SYN_EdfInConsFile"] == 0 } {
                        lappend prj(sdc) $val
                    } else {                   
					    append opts_line \ \"${item_id}=$val\"	
                        incr opt_num
                    }
				}
			}
			if { $opt_num > 0 } {
                # Use eval because we need pass $opts_line as arguments not list
				if [catch { eval prj_strgy set_value $opts_line } err_str] {
                    puts $err_str
				}
			}
		}
		foreach opt $prj(options) {
			if [info exists prj($opt)] { 
				if [catch { prj_impl option $opt $prj($opt) } err_str] {
                    puts $err_str
                }
			}
		}
		if [info exists prj(include\ path)] {
			prj_impl option "include path" $prj(include\ path) 
		}
		set src_dir "[bali_core::bali_property Project.defaultimplementation.dir]/source"
		if $copy_src {
			if [catch {	file mkdir $src_dir	} err_str] {
				puts $err_str
			}
			if {![file isdirectory $src_dir] || ![file exists $src_dir]} {
				set copy_src 0
				puts "Error: Sources can not be copied to '$src_dir'" 
			}			
		}
		foreach src $prj(sources) {
			if {![info exists prj(excluded)] || [lsearch -exact $prj(excluded) $src] == -1} {
				if [string match {$(ISPLEVERPATH)*} $src] {
					set add_src [string replace $src 0 14 [bali_core::bali_property -env InstallPath] ]
				} else {
					set src_file_path [path::get_absolute_path $src_path $src]
					set add_src [expr {$copy_src ? [copy_source $src_file_path $src_dir] : [path::get_absolute_path $src_path $src] }]
					set stoken [split $src_file_path "."]
					set type [string equal -nocase [lindex $stoken end] "sch"]
					if {$type == 1 && $copy_src == 1} {
						copy_symbol $src_file_path $src_dir
					}
				}
				prj_src add $add_src
				if [array exists $src] {
					foreach { o v } [array get $src] {
						prj_src option -src $add_src $o $v
					}
				}
			}
		}
        if [info exists prj(sdc)] {
			set add_src [expr {$copy_src ? [copy_source [path::get_absolute_path $src_path $prj(sdc)] $src_dir] : [path::get_absolute_path $src_path $prj(sdc)]} ]
			prj_src add -format sdc $add_src
		}
		if [info exists prj(rvl)] {
			set add_src [expr {$copy_src ? [copy_source [path::get_absolute_path $src_path $prj(rvl)] $src_dir] : [path::get_absolute_path $src_path $prj(rvl)]} ]
			prj_src add -format reveal $add_src
			if $copy_src  {
				set nl [ split $prj(rvl) . ]
				set rvs "[join [lrange $nl 0 end-1] .].rvs"
				copy_source [path::get_absolute_path $src_path $rvs] $src_dir
			}
			if {[info exists prj(entry)] && [string match "EDIF" $prj(entry)]} {
				prj_src option -src $add_src level edif
			}
		}
		prj_project save
	}
}

proc load_lever_prj {args} {
	set usage_error "wrong # args: should be \"load_lever_prj ?-copy_src? syn_file ?prj_file?\""
	set arg_num [llength $args]
	if { $arg_num < 1 || $arg_num > 3} {
		return -code error $usage_error
	}
	set end_switch 0
	set check_switch 1
	set copy_src 0
	set left_arg 3
	foreach arg $args {
	    if {$left_arg <= 0} {
			return -code error $usage_error
		}
		if { $check_switch == 1 } {
		    if {[string compare $arg "--"] == 0} {
				set check_switch 0
				set end_switch 1
				set left_arg 2
				continue
			}
			if {[string index $arg 0] == "-"} {
                if {$end_switch == 1} {
					return -code error $usage_error
				}				
			    if {[string compare $arg "-copy_src"] != 0} {
					return -code error $usage_error
				}
				set copy_src 1
				set end_switch 1
				set check_switch 0
				set left_arg 2
			} else {
				set syn_file $arg
				set end_switch 1
				set check_switch 0
				set left_arg 1
			}					
		} else {
		    set end_switch 1
		    if {$left_arg > 1} {
				set syn_file $arg
			} else {
				set prj_file $arg
			}
			incr left_arg -1
		}	
	}
	if {![info exist syn_file]} {
		return -code error $usage_error
	}
	if {![info exist prj_file]} {
		set prj_file {}
	}
	if [catch {bali::utility::load_lever_prj $syn_file $prj_file $copy_src} err_str] {
		return -code error $err_str
	}
}

