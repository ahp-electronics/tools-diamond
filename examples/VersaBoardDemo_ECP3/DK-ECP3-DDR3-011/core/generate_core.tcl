
#!/usr/local/bin/wish

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

set Para(ProjectPath) "C:/DK-ECP3-DDR3-010/core"
set Para(ModuleName) "ddr3core"
set Para(lib) "C:/LatticeCore/ddr3_sdram_common_v1.2/lib"
set Para(CoreName) "DDR3 SDRAM Controller"
set Para(arch) "ep5c00"
set Para(family) "latticeecp3"
set Para(Family) "latticeecp3"
set Para(design) "Verilog HDL"
set Para(install_dir) "C:/lscc/diamond/1.2/bin/nt/../.."
set Para(Bin) "C:/lscc/diamond/1.2/bin/nt"
set Para(SpeedGrade) "Para(spd)"
set Para(FPGAPath) "C:/lscc/diamond/1.2/bin/nt/../../ispfpga/bin/nt"

lappend auto_path "C:/LatticeCore/ddr3_sdram_common_v1.2/gui"

lappend auto_path "C:/LatticeCore/ddr3_sdram_common_v1.2/script"
package require Core_Generate

lappend auto_path "C:/lscc/diamond/1.2/tcltk/lib/ipwidgets/ispipbuilder/../runproc"
package require runcmd


set Para(result) [GenerateCore]
