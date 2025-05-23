#!/usr/local/bin/tclsh

set Para(cmd) ""
if ![catch {set temp $argc} result] {
    if {$argc > 0} {
        for {set i 0} {$i < $argc} {incr i 2} {
            set temp [lindex $argv $i]
            set temp [string range $temp 1 end]
            lappend argv_list $temp
            lappend value_list [lindex $argv [expr $i+1]]
        }
        foreach argument $argv_list value $value_list {
            switch $argument {
                "cmd" {set Para(cmd) $value;}
            }
        }
    }
}
#IP Core information
set Para(ProjectPath) "C:/Users/Public/DTS/reveal_ex/ECP3/impl1"
set Para(BuildDir) "C:/Users/Public/DTS/reveal_ex/ECP3/impl1/reveal_workspace/tmpreveal"
set Para(Module) "reveal"
set Reveal_Cores {counter_top_la0 }
set Para(lib) "C:/lscc/diamond/3.8_x64/module/reveal/lib"
set Para(CoreName) "reveal"
set Para(Family) "LatticeECP3"
set Para(design) "Schematic/Verilog HDL"
set Para(synthesis) "synplify"

#environment
lappend auto_path "C:/lscc/diamond/3.8_x64/module/reveal/gui"
lappend auto_path "C:/lscc/diamond/3.8_x64/module/reveal/script"
lappend auto_path "C:/lscc/diamond/3.8_x64/tcltk/lib/ipwidgets/runproc"
set Para(install_dir) "C:/lscc/diamond/3.8_x64"

#include tcl package
package require Core_Generate
package require runcmd
#excute GenerateCore
foreach core $Reveal_Cores {
	set Para(ModuleName) $core
	set Para(result) [GenerateCore 1]
}

