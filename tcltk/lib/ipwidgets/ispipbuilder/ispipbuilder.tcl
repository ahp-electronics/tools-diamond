#$Header: /tcltk/lib/ipwidgets/ispipbuilder/ispipbuilder.tcl 1.3 Exp $

#Rev 1.3: D3.5 Clarity/IPExpress: SNOW support
#Rev 1.15: Diamond 3.4.1 IPExpress: XO3LF support
#Rev 1.14: Diamond 3.2 IPExpress: ECP5 support.
#Rev 1.13: Diamond 3.1 IPExpress: MachXO3L support.
#Rev 1.12: Diamond 2.2 IPExpress: ECP4UM support.
#Rev 1.11: Diamond 2.0 IPExpress: Fixed POJO issues + POJO2 support.

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

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
        set Para(os_platform) windows
		if {$cpu == "amd64"} {
			# Do not check wordSize, win32-x64 is an IL32P64 platform.
			set cpu x86_64
	    }
    }
	unix {
	    if {$tcl_platform(os) == "Linux"}  {
            set Para(os_platform) linux
        } else  {
            set Para(os_platform) unix
        }
	}
}

if {$cpu == "x86_64"} {
	set ntpath nt64
	set linpath lin64
} else {
	set ntpath nt
	set linpath lin
}

proc setAliasFamily {} {
	global Para

	set Para(same_family) $Para(family)

	#tk_messageBox -default ok -icon info -message $Para(family) -title SetArchValue -type ok
	set temp [string tolower $Para(family)]
	switch $temp {
		"platform manager" -
		"pojo" -
		"mj5g00p" {
			set Para(same_family) "machxo"
		}
		"machxo3lf" -
		"xo3c00f" -
		"machxo3l" -
		"machxo3d" -
		"lfmnx" -
		"xo3c00a" -
		"platform manager 2" -
		"pojo2" -
		"xo2c00p" {
			set Para(same_family) "machxo2"
		}
		"lifdb1" -
		"lifmd" -
		"wi5s00" -
		"lifmdf" -
		"sn5w00" {
			set Para(same_family) "sn5w00"
		}
		"latticeecp4u" -
		"latticeecp4um" -
		"ecp5u" -
		"ecp5um" -
		"ecp5um5g" -
		"sa5p00g" -
		"sa5p00m" {
			set Para(same_family) "sa5p00"
		}
        "machxo3h" {
			set Para(same_family) "latticexp2"
		}
	}
}

set Para(proj) ""
set Para(result) "-1"
set Para(new) 0
set Para(import) 0
set Para(gen) 0
set Para(prj) ""
set Para(newpath) ""
set Para(newmodule) ""
set Para(Help) "about.htm"
set Para(sysplnr) ""

#
# Set cpld, config, fpga and root directory for IPs
#
#set cpld_bin [file join $Para(leverpath) "ispcpld" "bin"]
#set config_dir [file join $Para(leverpath) "ispcpld" "config"]
#set fpga_dir [file join $Para(leverpath) "ispfpga"]
#set root_dir [file join $Para(leverpath) "ispcpld"]
#
# Could not use the following argc parse because UNIX/Linux Tcl breaks on space, ignores double-quote
#
#for {set i 0} {$i < $argc} {incr i 2} {
#    set temp [lindex $argv $i]
#    set temp [string range $temp 1 end-1 end]
#    lappend argv_list $temp
#    lappend value_list [lindex $argv [expr $i+1]]
#}

set value ""

foreach arg $argv {
    if {[string first "-" $arg 0] == 0} {
        if {[string length $value] > 0} {
            lappend value_list $value
            set value ""
        }
        lappend argv_list [string range $arg 1 end]
    } else {
        if {[string length $value] > 0} {
            append value " "
        }
        append value $arg
    }
}
if {[string length $value] > 0} {
    lappend value_list $value
    set value ""
}

foreach argument $argv_list value $value_list {
    set value [string trim $value]
    set argument [string trim $argument]

    #tk_messageBox -message $value -title $argument
    switch $argument {
        "bin" {set Para(Bin) $value; regsub -all "\"" $Para(Bin) "" Para(Bin); regsub -all "\\\\" $Para(Bin) "/" Para(Bin)}
        "path" {set Para(path) $value; regsub -all "\"" $Para(path) "" Para(path); regsub -all "\\\\" $Para(path) "/" Para(path)}
        "family" {set Para(family) $value; regsub -all "\"" $Para(family) "" Para(family)}
        "module" {set Para(module) $value; regsub -all "\"" $Para(module) "" Para(module)}
        "design" {set Para(design) $value; regsub -all "\"" $Para(design) "" Para(design)}
        "device" {set Para(device) $value; regsub -all "\"" $Para(device) "" Para(device)}
        #"leverpath" {set Para(leverpath) $value; regsub -all "\"" $Para(leverpath) "" Para(leverpath); regsub -all "\\\\" $Para(leverpath) "/" Para(leverpath)}
        "ipdir" {set Para(ipdir) $value; regsub -all "\"" $Para(ipdir) "" Para(ipdir); regsub -all "\\\\" $Para(ipdir) "/" Para(ipdir)}
        "new" {set Para(new) $value; regsub -all "\"" $Para(new) "" Para(new)}
        "prj" {set Para(prj) $value; regsub -all "\"" $Para(prj) "" Para(prj)}
        "newpath" {set Para(newpath) $value; regsub -all "\"" $Para(newpath) "" Para(newpath); regsub -all "\\\\" $Para(newpath) "/" Para(newpath)}
        "newmodule" {set Para(newmodule) $value; regsub -all "\"" $Para(newmodule) "" Para(newmodule)}
        "import" {set Para(import) $value; regsub -all "\"" $Para(import) "" Para(import)}
        "sysplnr" {set Para(sysplnr) $value; regsub -all "\"" $Para(sysplnr) "" Para(sysplnr)}
        "synthesis" {set Para(synthesis) $value; regsub -all "\"" $Para(synthesis) "" Para(synthesis)}
        "ach"    {set Para(ach) $value; regsub -all "\"" $Para(ach) "" Para(ach)}
        "pty"    {set Para(pty) $value; regsub -all "\"" $Para(pty) "" Para(pty)}
        "spd"    {set Para(spd) $value; regsub -all "\"" $Para(spd) "" Para(spd)}
        "pkg"    {set Para(pkg) $value; regsub -all "\"" $Para(pkg) "" Para(pkg)}
        "opt"    {set Para(opt) $value; regsub -all "\"" $Para(opt) "" Para(opt)}
        "sta"    {set Para(sta) $value; regsub -all "\"" $Para(sta) "" Para(sta)}
        "vlt"    {set Para(vlt) $value; regsub -all "\"" $Para(vlt) "" Para(vlt)}
        "lut"    {set Para(lut) $value; regsub -all "\"" $Para(lut) "" Para(lut)}
        "reg"    {set Para(reg) $value; regsub -all "\"" $Para(reg) "" Para(reg)}
        "EBT"    {set Para(EBT) $value; regsub -all "\"" $Para(EBT) "" Para(EBT)}
        "EBB"    {set Para(EBB) $value; regsub -all "\"" $Para(EBB) "" Para(EBB)}
        "RAM"    {set Para(RAM) $value; regsub -all "\"" $Para(RAM) "" Para(RAM)}
        "DSP"    {set Para(DSP) $value; regsub -all "\"" $Para(DSP) "" Para(DSP)}
        "PLL"    {set Para(PLL) $value; regsub -all "\"" $Para(PLL) "" Para(PLL)}
        "DLL"    {set Para(DLL) $value; regsub -all "\"" $Para(DLL) "" Para(DLL)}
        "PCS"    {set Para(PCS) $value; regsub -all "\"" $Para(PCS) "" Para(PCS)}
        "IOC"    {set Para(IOC) $value; regsub -all "\"" $Para(IOC) "" Para(IOC)}
        "IOP"    {set Para(IOP) $value; regsub -all "\"" $Para(IOP) "" Para(IOP)}
  }
}

#tk_messageBox -message $Para(synthesis) -title "synthesis"

set Para(Family) $Para(family)
set Para(FOUNDRY) ""
setAliasFamily

foreach {key value} [array get env] {
    if {[string compare $key "FOUNDRY"] == 0} {
        set Para(FOUNDRY) $value
  #tk_messageBox -message $value -title $key
    }
}

if {[string length $Para(FOUNDRY)] == 0} {
    set index [string first "/bin" $Para(Bin)]
    set Para(FOUNDRY) [string range $Para(Bin) 0 [expr $index-1]]
    #tk_messageBox -message $Para(FOUNDRY) -title "BIN_FOUNDRY"
}

#tk_messageBox -default ok -icon warning -message "path: $Para(path)\nfamily: $Para(family)\nmodule: $Para(module)\ndesign: $Para(design)\ndevice: $Para(device)\nBin: $Para(Bin)" -title arg -type ok
#tk_messageBox -default ok -icon warning -message "ipdir: $Para(ipdir)\nnew: $Para(new)\nprj: $Para(prj)\nnewpath: $Para(newpath)\nnewmodule: $Para(newmodule)" -title arg -type ok
#
# Set data, bin and root directory for OrcaControl
#
set Para(scriptDir) [file join [pwd] [file dirname [info script]]]
set Para(Root) [file join $Para(Bin) ".." ".."]
#set Para(leverpath) [file join $Para(scriptDir) ".." ".." ".." ".."]
set Para(Config) [file join $Para(Root) "data"]

switch $tcl_platform(platform) {
    windows {
		set Para(FPGAPath) [file join $Para(Root) "ispfpga" "bin" $ntpath]
	}
    unix  {
		if {$tcl_platform(os) == "Linux"} {
			set Para(FPGAPath) [file join $Para(Root) "ispfpga" "bin" $linpath]
		} else {
			set Para(FPGAPath) [file join $Para(Root) "ispfpga" "bin" "sol"]
		}
    }
}

#tk_messageBox -default ok -icon warning -message "bin: $Para(Bin)\nConfig: $Para(Config)\nRoot: $Para(Root)\nscriptDir: $Para(scriptDir)" -title "ispipbuilder" -type ok
#
# Check if device family has core_template.tcl file, default to core gui
#
# Change family to lowercase  CR_48472
#
set family [string tolower $Para(family)]
set gui [file join $Para(ipdir) $family gui core_template.tcl]
if {[file exists $gui] == 1} {
	#! 1. search real family name path
    set Para(CoreDir) [file join $Para(ipdir) $family gui]
} else {
	#! 2. search alias family name path
	set family [string tolower $Para(same_family)]
	set gui [file join $Para(ipdir) $family gui core_template.tcl]
	if {[file exists $gui] == 1} {
	    set Para(CoreDir) [file join $Para(ipdir) $family gui]
	} else {
		#! 3. set default path
	    set Para(CoreDir) [file join $Para(ipdir) gui]
	}
}
#
# Set lib path
#
set Para(lib) [file join $Para(ipdir) lib]
#
# Check if device family has default.lpc file, default to core GUI
#
set lpc [file join $Para(ipdir) $Para(family) preference default.lpc]
if {[file exists $lpc] == 1} {
    set Para(lpc) [file join $Para(ipdir) $Para(family) preference]
} else {
	set lpc [file join $Para(ipdir) $Para(same_family) preference default.lpc]
	if {[file exists $lpc] == 1} {
	    set Para(lpc) [file join $Para(ipdir) $Para(same_family) preference]
	} else {
	    set Para(lpc) [file join $Para(ipdir) preference]
	}
}
#
# Check if device family has core_generate.tcl file, default to core script
#
set script [file join $Para(ipdir) $Para(family) script core_generate.tcl]
if {[file exists $script] == 1} {
    set Para(scriptfile) [file join $Para(ipdir) $Para(family) script]
} else {
	set script [file join $Para(ipdir) $Para(same_family) script core_generate.tcl]
	if {[file exists $script] == 1} {
	    set Para(scriptfile) [file join $Para(ipdir) $Para(same_family) script]
	} else {
	    set Para(scriptfile) [file join $Para(ipdir) script]
	}
}
#
# Check if device family has doc.html file, default to core doc
#
set doc [file join $Para(ipdir) $Para(family) document doc.html]
if {[file exists $doc] == 1} {
    set Para(doc) $doc
} else {
	set doc [file join $Para(ipdir) $Para(same_family) document doc.html]
	if {[file exists $doc] == 1} {
	    set Para(doc) $doc
	} else {
	    set Para(doc) [file join $Para(ipdir) document doc.html]
	}
}
#
# Check if device family has feature.html file, default to core feature
#
set feature [file join $Para(ipdir) $Para(family) document feature.html]
if {[file exists $feature] == 1} {
    set Para(feature) $feature
} else {
	set feature [file join $Para(ipdir) $Para(same_family) document feature.html]
	if {[file exists $feature] == 1} {
	    set Para(feature) $feature
	} else {
	    set Para(feature) [file join $Para(ipdir) document feature.html]
	}
}
set msg "Para(ipdir): $Para(ipdir)\nPara(CoreDir): $Para(CoreDir)\nPara(lpc):  $Para(lpc)\nPara(lib):  $Para(lib)\nPara(scriptfile):  $Para(scriptfile)\nPara(doc):  $Para(doc)\nPara(feature):  $Para(feature)"
set msg "Para(ipdir): $Para(ipdir)\nPara(CoreDir): $Para(CoreDir)\nPara(lpc):  $Para(lpc)"
#tk_messageBox -default ok -icon warning -message $msg -title "ispipbuilder" -type ok

set Para(runproc_path) [file join $Para(scriptDir) ".." "runproc"]

set Para(OrcaControl) [file join $Para(Root) module gui lattice_orca]
set Para(ArchControl) [file join $Para(Root) module gui lattice_arch]
set Para(FpscControl) [file join $Para(Root) module gui lattice_fpsc]

lappend auto_path $Para(CoreDir)
lappend auto_path $Para(OrcaControl)
lappend auto_path $Para(ArchControl)
lappend auto_path $Para(FpscControl)
lappend auto_path $Para(runproc_path)

#tk_messageBox -default ok -icon warning -message "CoreDir: $Para(CoreDir)\nOrcaControl: $Para(OrcaControl)\nArchControl: $Para(ArchControl)\nFpscControl: $Para(FpscControl)\nrunproc_path: $Para(runproc_path)" -title auto_path -type ok

package require runcmd
package require core_template

namespace eval ispIPBuilder {
    variable _wfont

    variable notebook
    variable mainframe
    variable status
    variable prgtext
    variable prgindic

    set pwd [pwd]
    cd [file dirname [info script]]
    variable ispIPBuilderDIR [pwd]
    cd $pwd

    foreach script {
        ipconfig.tcl ipdoc.tcl ipfeature.tcl supertext.tcl
    } {
        namespace inscope :: source $ispIPBuilderDIR/$script
    }

    #namespace inscope :: source $Para(core_interface)

}
#
# Read nodeinfo.cfg
#
proc ispIPBuilder::ReadNodeInfo {} {
    global Para

    set flag 0
    set para_file [file join $Para(ipdir) nodeinfo.cfg]

    if [catch {open $para_file r} fileid] {
        tk_messageBox -default ok -icon warning \
            -message "Cannot open $para_file." \
            -title "Open file error" \
            -type ok
        set err_msg "ERROR - Cannot open $para_file."
        close_window
    }
    #
    # Read [General]
    #
    seek $fileid 0 start
    while {[gets $fileid line] >= 0} {
        if {[string compare -nocase $line "\[General\]"] == 0} {
            while {[gets $fileid line] >= 0} {
                if [regexp {([^=]*)=(.*)} $line match parameter value] {
                    if [regexp {([ |\t]*;)} $parameter match] {continue}
                    if [regexp {(.*)[ |\t]*;} $value match temp] {
                        set temp [string trim $temp]
                        set parameter [string trim $parameter]
                        set Para($parameter) $temp
                    } else {
                        set value [string trim $value]
                        set parameter [string trim $parameter]
                        set Para($parameter) $value
                    }
                } else {
                    break
                }
            }
        }
    }
    #
    # Read the DeviceFamily values
    #
    seek $fileid 0 start
    while {[gets $fileid line] >= 0} {
        if {[string compare -nocase $line "\[$Para(family)\]"] == 0} {
            while {[gets $fileid line] >= 0} {
                if [regexp {([^=]*)=(.*)} $line match parameter value] {
                    if [regexp {([ |\t]*;)} $parameter match] {continue}
                    if [regexp {(.*)[ |\t]*;} $value match temp] {
                        set temp [string trim $temp]
                        set parameter [string trim $parameter]
                        set Para($parameter) $temp
                    } else {
                        set value [string trim $value]
                        set parameter [string trim $parameter]
                        set Para($parameter) $value
                    }
                } else {
                    break;
                }
            }
        }
    }

    close $fileid
}

proc ispIPBuilder::create { } {

    global tk_patchLevel Para ft tcl_platform
    variable notebook
    variable mainframe
    variable font
    variable prgtext
    variable prgindic

    #set prgtext "Please wait while loading font..."
    #set prgindic -1
    #_create_intro
    #update
    SelectFont::loadfont

    #set prgtext   "Creating MainFrame..."
    #set prgindic  0
    set mainframe [MainFrame .mainframe \
                       -textvariable ispIPBuilder::status \
                       -progressvar  ispIPBuilder::prgindic]

    #$mainframe addindicator -text "ispIPExpress 1.0"
    #$mainframe addindicator -textvariable tk_patchLevel

    set Para(status) ""

    #wm resizable . 0 0

    switch $tcl_platform(platform) {
        windows {
                set ft {{MS Sans Serif} 8}
        }
        unix {
             set ft {times -12}
        }
    }

    # NoteBook creation
    set frame    [$mainframe getframe]
    set notebook [NoteBook $frame.nb -homogeneous "true"]
    set Para(notebook) $notebook

    #set prgtext   "Creating IPExpress/Configuration..."
    #incr prgindic

    #tk_messageBox -default ok -icon warning -message "ipconfig::createcfg" -title "ispIPBuilder::create" -type ok

    set f0  [ipconfig::createcfg $notebook]

    #set prgtext   "Creating IPExpress/Documentation..."
    #incr prgindic
    #set f2  [ipdoc::create $notebook]

    #set prgtext   "Creating IPExpress/Features..."
    #incr prgindic
    #set f3 [ipfeature::create $notebook]

    if {![interp exists shell_IP]} {
        set Para(slave) [ipconfig::SlaveInit shell_IP]
    } else {
        if {$Para($loadtk)} {interp eval $Para(slave) "wm deiconify ."}
    }

    #set prgtext   "Done"
    #incr prgindic
    $notebook compute_size
    pack $notebook -fill both -expand yes -padx 4 -pady 4
    $notebook raise [$notebook page 0]

    pack $mainframe -fill both -expand yes

    #update idletasks
    #destroy .intro
}

#== close window ====================================================#

proc close_window { {action ""} } {
    global tk_patchLevel Para ft tcl_platform

    if {[string compare -nocase $Para(result) "-1"] != 0} {
      set cst_file [file join $Para(ProjectPath) "$Para(ModuleName).cst"]
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

    #tk_messageBox -message $Para(result) -title "close_window"

    destroy .

    exit $Para(result)
}

proc ispIPBuilder::_create_intro { } {
    variable ispIPBuilderDIR

    set top [toplevel .intro -relief raised -borderwidth 2]

    wm withdraw $top
    wm overrideredirect $top 1

    set ximg  [label $top.x -bitmap @$ispIPBuilderDIR/x1.xbm \
            -foreground grey90 -background white]
    set bwimg [label $ximg.bw -bitmap @$ispIPBuilderDIR/bwidget.xbm \
            -foreground grey90 -background white]
    set frame [frame $ximg.f -background white]
    set lab1  [label $frame.lab1 -text "Loading ispIPBuilder" \
            -background white -font {times 8}]
    set lab2  [label $frame.lab2 -textvariable ispIPBuilder::prgtext \
            -background white -font {times 8} -width 35]
    set prg   [ProgressBar $frame.prg -width 50 -height 10 -background white \
            -variable ispIPBuilder::prgindic -maximum 10]
    pack $lab1 $lab2 $prg
    place $frame -x 0 -y 0 -anchor nw
    place $bwimg -relx 1 -rely 1 -anchor se
    pack $ximg
    BWidget::place $top 0 0 center
    wm deiconify $top
}

proc ispIPBuilder::_OpenBrowser {url} {
    global tcl_platform Para

    callbrowser $Para(opwebhlp) $url
}

proc ispIPBuilder::main {} {
    global Para tcl_platform

    variable ispIPBuilderDIR

    lappend ::auto_path [file dirname $ispIPBuilderDIR]
    namespace inscope :: package require BWidget

    option add *TitleFrame.l.font {helvetica 11 bold italic}

    wm withdraw .
    wm title . "ispIPBuilder"
    #wm protocol . WM_DELETE_WINDOW "destroy ."
    wm protocol . WM_DELETE_WINDOW "close_window"
    if {$Para(os_platform) == "windows"} {
    	wm iconbitmap . "$Para(Bin)/ipxwrapper.ico"
    }

    # Read nodeinfo.cfg
    ReadNodeInfo

    ########################## Check project path length ###############################
    if {$Para(os_platform) == "windows" } {
      if {[string compare -nocase $Para(TYPE) "Module"] != 0} {
        if {[string length $Para(newmodule)] > 0 } {
      set path_len [string length $Para(newpath)]
      set module_len [string length $Para(newmodule)]
        } else {
      set path_len [string length $Para(path)]
      set module_len [string length $Para(module)]
        }

        set str_len [expr $path_len+$module_len]
        #tk_messageBox -message "$str_len" -title "IPexpress: Check project path"
        set plen 150
        if {$str_len > $plen} {
      set answer [tk_messageBox -icon warning \
        -message " Due to operating system limitations, IP core generation and/or \n\
        integrated evaluation capabilities may not function correctly for long \n\
        project paths plus module name(e.g. project paths plus module name \n\
        containing more than $plen characters).\n\n\
        The specified project path plus module name contains $str_len characters. \n\n\
        Continue?" \
        -title "IPexpress - Warning" \
        -type yesno]
      if {$answer != "yes"} {
        exit $Para(result)
      }
        }
      }
    }
    ########################################################################################

    set Para(opwebhlp) [file join $Para(Bin) opwebhlp]
    if {[string compare -nocase $Para(TYPE) "Module"] != 0} {
       set Para(webhelp)  [file join $Para(ipdir) document $Para(Help)]
       if { [file exists $Para(webhelp)] == 0} {
           set Para(webhelp) [file join $Para(ipdir) document about.htm]
       }
    } else {
       set Para(webhelp)  [file join $Para(Bin) webhelp $Para(Help)]
       if { [file exists $Para(webhelp)] == 0} {
           set Para(webhelp) [file join $Para(Bin) webhelp mergedProjects ipexpress ipexpress.htm]
       }
    }
    #tk_messageBox -message $Para(opwebhlp) -title "opwebhlp"
    #tk_messageBox -message $Para(webhelp) -title $Para(TYPE)
    ispIPBuilder::create

    #bind all <F1> "runCmd \"cmd.exe /C $Para(opwebhlp) $Para(webhelp)\" 0;break"
    bind all <F1> "ispIPBuilder::_OpenBrowser \"$Para(webhelp)\""

    BWidget::place . 0 0 center
    wm deiconify .
    raise .
    focus -force .
}

ispIPBuilder::main
wm geom . [wm geom .]
