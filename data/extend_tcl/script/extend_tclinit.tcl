#!/bin/sh
# \

global env

set comment ";"
set package "Package"
set dll "DLL"
set so  "SO"
set leftb "\["
set righb "\]"
set toolname ""
set machine "";
set apply 0;

set cpu  $tcl_platform(machine)

switch $cpu {
	intel -
	i*86* {
	    set cpu ix86
	}
	x86_64 {
	    if {$tcl_platform(wordSize) == 4} {
			set cpu ix86
	    }
	}
}

switch $tcl_platform(platform) {
    windows {
        set os_platform windows
		if {$cpu == "amd64"} {
			# Do not check wordSize, win32-x64 is an IL32P64 platform.
			set cpu x86_64
	    }
    }
    unix {
        if {$tcl_platform(os) == "Linux"}  {
            set os_platform linux
        } else  {
            set os_platform unix
        }
    }
}

if {$cpu == "x86_64"} {
	set NTPATH nt64
	set LINPATH lin64
} else {
	set NTPATH nt
	set LINPATH lin
}

#puts "os_platform = $os_platform\n"
#puts "NTPATH = $NTPATH; LINPATH = $LINPATH\n"

if {[info exist lsc_appmode]} {
    #puts "App = $lsc_appmode"
    set env(LSC_APPMODE) $lsc_appmode
    set apps_list [split $lsc_appmode ,]
    #puts $env(LSC_APPMODE)
} else {
    #puts "App NOT SET"
    set lsc_appmode "all"
    set env(LSC_APPMODE) $lsc_appmode
    set apps_list "all"
    #puts $env(LSC_APPMODE)
}

lindex apps_list 0

set currentdir $env(TOOLRTF)

set tcllib [file join $currentdir "tcltk" "lib" ]
regsub -all "\\\\" $tcllib "/" tcllib
#puts "--- $tcllib"

if {$os_platform == "windows" } {
    set bin_dir [file join $currentdir "bin" $NTPATH]
    regsub -all "\\\\" $bin_dir "/" bin_dir
    set ispfpga_dir [file join $currentdir "ispfpga" "bin" $NTPATH]
    regsub -all "\\\\" $ispfpga_dir "/" ispfpga_dir
    set env(PATH) "$ispfpga_dir;$bin_dir;$env(PATH)"
    set machine $dll
} elseif {$os_platform == "unix" } {
    set bin_dir [file join $currentdir "bin" "sol"]
    regsub -all "\\\\" $bin_dir "/" bin_dir
    set ispfpga_dir [file join $currentdir "ispfpga" "bin" "sol"]
    regsub -all "\\\\" $ispfpga_dir "/" ispfpga_dir
    set env(PATH) "$ispfpga_dir:$bin_dir:$env(PATH)"
    set machine $so
} elseif {$os_platform == "linux" } {
    set bin_dir [file join $currentdir "bin" $LINPATH]
    regsub -all "\\\\" $bin_dir "/" bin_dir
    set ispfpga_dir [file join $currentdir "ispfpga" "bin" $LINPATH]
    regsub -all "\\\\" $ispfpga_dir "/" ispfpga_dir
    set env(PATH) "$ispfpga_dir:$bin_dir:$env(PATH)"
    set machine $so
} else {
    set bin_dir [file join $currentdir "bin" $NTPATH]
    regsub -all "\\\\" $bin_dir "/" bin_dir
    set ispfpga_dir [file join $currentdir "ispfpga" "bin" $NTPATH]
    regsub -all "\\\\" $ispfpga_dir "/" ispfpga_dir
    set env(PATH) "$ispfpga_dir;$bin_dir;$env(PATH)"
}

#puts "____ $bin_dir"

lappend auto_path $tcllib

set maxl 0
#
# Output env names and values
#
set args [lsort [array names env]]
foreach x $args {
    if {[string length $x] > $maxl} {
        set maxl [string length $x]
    }
}

#incr maxl 2
#foreach x $args {
#    puts stdout [format "%*s = %s" $maxl $x $env($x)]
#}

set inifile [file join $currentdir "data" "extend_tcl" "help" "extend_tclinit.ini"]

if {[catch {set fileid [open $inifile r]} msg]} {
    set err_msg "ERROR - $msg"
    puts "$err_msg\n"
} else {
    #
    # Get toolname
    #
    seek $fileid 0 start
    while {[gets $fileid line] >= 0} {
        set line [string trim $line]
        if {![string equal -nocase [string index $line 0] $comment] && [string length $line] > 0} {
            if {[string equal -nocase [string index $line 0] $leftb] && [string equal -nocase [string index $line end] $righb]} {
                lappend toolname [string range $line 1 end-1]
            }
        }
    }
    set stoolname [lsort -unique $toolname]
    #
    # Load Package and DLL/SO
    #
    seek $fileid 0 start
    while {[gets $fileid line] >= 0} {
        set line [string trim $line]
        if {![string equal -nocase [string index $line 0] $comment] && [string length $line] > 0} {
            if {[string equal -nocase [string index $line 0] $leftb] && [string equal -nocase [string index $line end] $righb]} {
                set appname [string range $line 1 end-1]
                set not_appname "-$appname"
                #puts "\n$line - $appname : $not_appname = [llength $apps_list]"
                set apply 1
                if {[string compare -nocase $lsc_appmode "all"] == 0} {
                    #puts "ALL = $appname"
                    set apply 0;
                } else {
                    if {[string compare -nocase $appname "lsc"] == 0} {
                        #puts "LSC = $appname"
                        set apply 0;
                    } else {
                        set first_app [lindex $apps_list 0]
                        if {[string first "-" $first_app] == 0} {
                            #puts "NotList $not_appname = [lsearch -exact $apps_list $not_appname]"
                            if {[lsearch -exact $apps_list $not_appname] >= 0} {
                                set apply 1
                            } else {
                                set apply 0
                            }

                        } else {
                            #puts "List $appname = [lsearch -exact $apps_list $appname]"
                            if {[lsearch -exact $apps_list $appname] >= 0} {
                                set apply 0;
                            } else {
                                set apply 1;
                            }
                        }
                    }
                }
            } else {
                if {$apply == 0} {
                    #puts "  $line"
                    if [regexp {([^=]*)=(.*)} $line match parameter value] {
                        #puts "    $parameter $value"
                        if [string equal -nocase $parameter $package] {
							eval "set value $value"
                            #puts "parameter: $parameter   value: $value"
							
							set package_path [file dirname $value]
							set package_name [file tail $value]
							set package_dir [file join $currentdir $package_path]
							
							regsub -all "\\\\" $package_dir "/" package_dir
							set auto_path "$auto_path $package_dir"
							
							#puts "package_dir: $package_dir    package_name: $package_name"
							
                            #package require $value							
                            if {[catch {package require $package_name} msg]} {
                                set err_msg "ERROR - $msg"
                                #puts "$err_msg\n"
                            } else {
                                #puts "      Package Require: $package_name"
                            }
                        } elseif [string equal -nocase $parameter $machine] {
							eval "set value $value"
                            #puts "parameter: $parameter value: $value"
                            if {[catch {load [file join $currentdir $value]} msg]} {
                                set err_msg "ERROR - $msg"
                                #puts "$err_msg\n"
                            } else {
                                #puts "      Load DLL/SO : [file join $currentdir $value]"
                            }
                        }
                    }
                }
            }
        }
    }
    close $fileid
}
