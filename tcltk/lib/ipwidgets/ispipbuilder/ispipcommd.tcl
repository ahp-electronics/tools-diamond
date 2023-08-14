#!/bin/sh

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
  set NTPATH nt64
  set LINPATH lin64
} else {
  set NTPATH nt
  set LINPATH lin
}

#puts "\nPara(os_platform): $Para(os_platform) NTPATH: $NTPATH LINPATH: $LINPATH"

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
set Para(result) "-1"
set Para(errmsg) ""
set Para(oprtn) ""
set Para(status) ""
set Para(warn) ""
set Para(error) ""

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

    #puts "argument: $argument  value: $value"
    switch $argument {
        "oprtn" {set Para(oprtn) $value; regsub -all "\"" $Para(oprtn) "" Para(oprtn)}
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

puts ""

set Para(Family) $Para(family)
set Para(FOUNDRY) ""

foreach {key value} [array get env] {
    if {[string compare $key "FOUNDRY"] == 0} {
        set Para(FOUNDRY) $value
        #puts "FOUNDRY: $value"
    }
}

if {[string length $Para(FOUNDRY)] == 0} {
    set index [string first "/bin" $Para(Bin)]
    set Para(FOUNDRY) [string range $Para(Bin) 0 [expr $index-1]]
    #puts "BIN_FOUNDRY: $Para(FOUNDRY)"
}

#puts "path: $Para(path)\nfamily: $Para(family)\nmodule: $Para(module)\ndesign: $Para(design)\ndevice: $Para(device)\nBin: $Para(Bin)"
#puts "ipdir: $Para(ipdir)\nnew: $Para(new)\nprj: $Para(prj)\nnewpath: $Para(newpath)\nnewmodule: $Para(newmodule)"
#
# Set data, bin and root directory for OrcaControl
#
set Para(scriptDir) [file join [pwd] [file dirname [info script]]]
set Para(Root) [file join $Para(Bin) ".." ".."]
#set Para(leverpath) [file join $Para(scriptDir) ".." ".." ".." ".."]
set Para(Config) [file join $Para(Root) "data"]

switch $tcl_platform(platform) {
    windows {set Para(FPGAPath) [file join $Para(Root) "ispfpga" "bin" $NTPATH]}
    unix    {set Para(FPGAPath) [file join $Para(Root) "ispfpga" "bin" "sol"]}
    Linux   {set Para(FPGAPath) [file join $Para(Root) "ispfpga" "bin" $LINPATH]}
}

#puts "bin: $Para(Bin)\nFPGAPath: $Para(FPGAPath)\nConfig: $Para(Config)\nRoot: $Para(Root)\nscriptDir: $Para(scriptDir)"

#
# Check if device family has core_template.tcl file, default to core gui
#
# Change family to lowercase  CR_48472
#
set family [string tolower $Para(family)]
set gui [file join $Para(ipdir) $family gui core_template.tcl]
if {[file exists $gui] == 1} {
    set Para(CoreDir) [file join $Para(ipdir) $family gui]
} else {
    set Para(CoreDir) [file join $Para(ipdir) gui]
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
    set Para(lpc) [file join $Para(ipdir) preference]
}
#
# Check if device family has core_generate.tcl file, default to core script
#
set script [file join $Para(ipdir) $Para(family) script core_generate.tcl]
if {[file exists $script] == 1} {
    set Para(scriptfile) [file join $Para(ipdir) $Para(family) script]
} else {
    set Para(scriptfile) [file join $Para(ipdir) script]
}
#
# Check if device family has doc.html file, default to core doc
#
set doc [file join $Para(ipdir) $Para(family) document doc.html]
if {[file exists $doc] == 1} {
    set Para(doc) $doc
} else {
    set Para(doc) [file join $Para(ipdir) document doc.html]
}
#
# Check if device family has feature.html file, default to core feature
#
set feature [file join $Para(ipdir) $Para(family) document feature.html]
if {[file exists $feature] == 1} {
    set Para(feature) $feature
} else {
    set Para(feature) [file join $Para(ipdir) document feature.html]
}

set Para(runproc_path) [file join $Para(scriptDir) ".." "runproc"]

set Para(OrcaControl) [file join $Para(Root) module gui lattice_orca]
set Para(ArchControl) [file join $Para(Root) module gui lattice_arch]
set Para(FpscControl) [file join $Para(Root) module gui lattice_fpsc]

lappend auto_path $Para(CoreDir)
lappend auto_path $Para(OrcaControl)
lappend auto_path $Para(ArchControl)
lappend auto_path $Para(FpscControl)
lappend auto_path $Para(runproc_path)

#puts "auto_path -> CoreDir: $Para(CoreDir)\nOrcaControl: $Para(OrcaControl)\nArchControl: $Para(ArchControl)\nFpscControl: $Para(FpscControl)\nrunproc_path: $Para(runproc_path)"

package require runcmd
package require core_template

namespace eval ispIPCommd {
    variable _wfont

    variable notebook
    variable mainframe
    variable status
    variable prgtext
    variable prgindic

    set pwd [pwd]
    cd [file dirname [info script]]
    variable ispIPCommdDIR [pwd]
    cd $pwd

    foreach script {
        ipconfig.tcl
    } {
        namespace inscope :: source $ispIPCommdDIR/$script
    }

    #namespace inscope :: source $Para(core_interface)

}
#
# Read nodeinfo.cfg
#
proc ispIPCommd::ReadNodeInfo {} {
    global Para

    set flag 0
    set para_file [file join $Para(ipdir) nodeinfo.cfg]

    if [catch {open $para_file r} fileid] {
        set err_msg "ERROR - Cannot open $para_file."
        puts "ERROR - Cannot open $para_file."
        return
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
                        #puts "parameter: $parameter  temp: $temp"
                    } else {
                        set value [string trim $value]
                        set parameter [string trim $parameter]
                        set Para($parameter) $value
                        #puts "parameter: $parameter  value: $value"
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
                        #puts "parameter: $parameter  temp: $temp"
                    } else {
                        set value [string trim $value]
                        set parameter [string trim $parameter]
                        set Para($parameter) $value
                        #puts "parameter: $parameter  value: $value"
                    }
                } else {
                    break;
                }
            }
        }
    }

    close $fileid
}

proc ispIPCommd::copy { } {

    global Para tcl_platform

    ipconfig::_copy

    close_window
}

#== close window ====================================================#

proc close_window { } {
    global Para tcl_platform

    #set Para(Date) [clock format [clock seconds] -format "%m/%d/%Y"]
    #set Para(Time) [clock format [clock seconds] -format "%H:%M:%S"]

    if {[string compare -nocase $Para(result) "-1"] != 0} {
      if {[info exists Para(Date)] } {
        set cst_file [file join $Para(newpath) "$Para(newmodule).cst"]
        if [catch {open $cst_file w} outputfile] {
            puts "Cannot open $cst_file file!"
        } else {
            puts $outputfile "Date=$Para(Date)"
            puts $outputfile "Time=$Para(Time)\n"
            close $outputfile
        }
      } else {
        if {[string compare -nocase $Para(result) "-1"] != 0} {
          set Para(result) "-1"
          set Para(errmsg) "Missing cst Date and Time"
        }
      }
    }

    puts "\n\nclose_window result: $Para(result): $Para(errmsg)"

    exit $Para(result)
}

proc ispIPCommd::main {} {
    global Para tcl_platform

    variable ispIPCommdDIR

    lappend ::auto_path [file dirname $ispIPCommdDIR]

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
        #puts "IPexpress: Check project path: $str_len"
        set plen 150
        if {$str_len > $plen} {
          puts "Due to operating system limitations, IP core generation and/or \n\
                integrated evaluation capabilities may not function correctly for long \n\
                project paths plus module name(e.g. project paths plus module name \n\
                containing more than $plen characters).\n\n\
                The specified project path plus module name contains $str_len characters. \n"

          exit $Para(result)
        }
      }
    }
    ########################################################################################

    if {[string compare -nocase $Para(oprtn) "clone"] == 0} {
      ispIPCommd::copy
    } else {
      puts "UNKNOWN OPR: $Para(oprtn)"
    }

    close_window
}

ispIPCommd::main

