
########## Tcl recorder starts at 10/22/03 14:10:45 ##########
lappend auto_path "C:/ispLEVER3.1.00.30.41.03/ispcpld/tcltk/lib/ispwidget/runproc"
package require runcmd
cd C:/ispLEVER3.1.00.30.41.03/ispcpld/examples/orca/edif_eg/
# Commands to make the Process: 
# Hierarchy
puts "Starting: 'C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/edfin.exe -i tlc.edn -jhd tlc.jhd -log tlc.log -dev orca -lbp \"C:/ispLEVER3.1.00.30.41.03/ispfpga/data\"'"
if [runCmd "C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/edfin.exe -i tlc.edn -jhd tlc.jhd -log tlc.log -dev orca -lbp \"C:/ispLEVER3.1.00.30.41.03/ispfpga/data\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder starts at 10/22/03 14:10:45 ##########
lappend auto_path "C:/ispLEVER3.1.00.30.41.03/ispcpld/tcltk/lib/ispwidget/runproc"
package require runcmd
cd C:/ispLEVER3.1.00.30.41.03/ispcpld/examples/orca/edif_eg/
# Commands to make the Process: 
# Hierarchy
puts "Starting: 'C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/edfin.exe -i tlc.edn -jhd tlc.jhd -log tlc.log -dev orca -lbp \"C:/ispLEVER3.1.00.30.41.03/ispfpga/data\"'"
if [runCmd "C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/edfin.exe -i tlc.edn -jhd tlc.jhd -log tlc.log -dev orca -lbp \"C:/ispLEVER3.1.00.30.41.03/ispfpga/data\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder starts at 10/22/03 14:10:45 ##########
lappend auto_path "C:/ispLEVER3.1.00.30.41.03/ispcpld/tcltk/lib/ispwidget/runproc"
package require runcmd
cd C:/ispLEVER3.1.00.30.41.03/ispcpld/examples/orca/edif_eg/
# Commands to make the Process: 
# Generate PROM Data
puts "Starting: '\"C:/ispLEVER3.1.00.30.41.03/ispfpga/bin/nt/edif2ngd.exe\" -l or4e00 \"tlc.edn\" \"top.ngo\"'"
if [runCmd "\"C:/ispLEVER3.1.00.30.41.03/ispfpga/bin/nt/edif2ngd.exe\" -l or4e00 \"tlc.edn\" \"top.ngo\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
puts "Starting: '\"C:/ispLEVER3.1.00.30.41.03/ispfpga/bin/nt/ngdbuild.exe\" -a or4e00 -p \"c:/isplever3.1.00.30.41.03/ispcpld/examples/orca/edif_eg\" \"top.ngo\" \"tlc.ngd\"'"
if [runCmd "\"C:/ispLEVER3.1.00.30.41.03/ispfpga/bin/nt/ngdbuild.exe\" -a or4e00 -p \"c:/isplever3.1.00.30.41.03/ispcpld/examples/orca/edif_eg\" \"top.ngo\" \"tlc.ngd\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open tlc.m2t w} rspFile] {
	puts stderr "Cannot create response file tlc.m2t: $rspFile"
} else {
	puts $rspFile "#MAP file
-swl 8
"
	close $rspFile
}
puts "Starting: 'C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/mapwrap.exe -a or4e00 -p or4e04 -t BA352 -s 3 \"tlc.ngd\" -o \"tlc.ncd\" -f tlc.m2t -dep \"tlc.nc1\" -gui'"
if [runCmd "C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/mapwrap.exe -a or4e00 -p or4e04 -t BA352 -s 3 \"tlc.ngd\" -o \"tlc.ncd\" -f tlc.m2t -dep \"tlc.nc1\" -gui"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open tlc.cm2 w} rspFile] {
	puts stderr "Cannot create response file tlc.cm2: $rspFile"
} else {
	puts $rspFile "-t tlc.mt
-to tlc.tw1
-o tlc.tcm
-log tlc.log
-pr tlc.prf
-rpt tlc.mrp
"
	close $rspFile
}
puts "Starting: 'C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/checkpoint.exe -m -f \"tlc.cmm\" -f \"tlc.cm2\" -arch or4e00 \"tlc_map.ncd\"'"
if [runCmd "C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/checkpoint.exe -m -f \"tlc.cmm\" -f \"tlc.cm2\" -arch or4e00 \"tlc_map.ncd\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete tlc.cm2
if [catch {open tlc.p2t w} rspFile] {
	puts stderr "Cannot create response file tlc.p2t: $rspFile"
} else {
	puts $rspFile "-w
-i 2
-l 1
-n 1
-t 1
-s 1
-c 0
-e 0
"
	close $rspFile
}
if [catch {open tlc.p3t w} rspFile] {
	puts stderr "Cannot create response file tlc.p3t: $rspFile"
} else {
	puts $rspFile "-rem
-log tlc.log
-o tlc.par
-pr tlc.prf
"
	close $rspFile
}
puts "Starting: 'C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/multipar.exe -p tlc.p2t -f \"tlc.p3t\" \"tlc_map.ncd\" \"tlc.ncd\"'"
if [runCmd "C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/multipar.exe -p tlc.p2t -f \"tlc.p3t\" \"tlc_map.ncd\" \"tlc.ncd\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open tlc.cm2 w} rspFile] {
	puts stderr "Cannot create response file tlc.cm2: $rspFile"
} else {
	puts $rspFile "-t tlc.pt
-to tlc.twr
-o tlc.tcp
-log tlc.log
-pr tlc.prf
-rpt tlc.par
"
	close $rspFile
}
puts "Starting: 'C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/checkpoint.exe -p -f \"tlc.cmp\" -f \"tlc.cm2\" -arch or4e00 \"tlc.ncd\" -l 60'"
if [runCmd "C:/ispLEVER3.1.00.30.41.03/ispcpld/bin/checkpoint.exe -p -f \"tlc.cmp\" -f \"tlc.cm2\" -arch or4e00 \"tlc.ncd\" -l 60"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete tlc.cm2
if [catch {open tlc.t2b w} rspFile] {
	puts stderr "Cannot create response file tlc.t2b: $rspFile"
} else {
	puts $rspFile "-g LengthBits:24
-g CfgMode:Enable
-g DoneActive:C4
-g DonePin:Pullup
-g ExternalClk:No
-g GSRInactive:DoneIn
-g JTAG:Disable
-g Oscillator:Disable
-g OutputsActive:C2
-g OutputsCfg:Enable
-g RamCfg:Reset
-g ReadBack:Disable
-g ReadCapture:Disable
-g RegisterCfg:Enable
-g StartupClk:Cclk
-g SyncToDone:No
-g Address:Increment
-g ZeroFrames:Yes
-g SysbusCfg:Reset
-g SysbusclkCfg:Reset
-g WaitStateTimeout:0
-g GrantTimeout:0
"
	close $rspFile
}
puts "Starting: '\"C:/ispLEVER3.1.00.30.41.03/ispfpga/bin/nt/bitgen.exe\" -w \"tlc.ncd\" -f \"tlc.t2b\" \"tlc.bit\"'"
if [runCmd "\"C:/ispLEVER3.1.00.30.41.03/ispfpga/bin/nt/bitgen.exe\" -w \"tlc.ncd\" -f \"tlc.t2b\" \"tlc.bit\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
puts "Starting: '\"C:/ispLEVER3.1.00.30.41.03/ispfpga/bin/nt/promgen.exe\" -p mcs -o tlc.mcs -t 256 -u 0 tlc.bit'"
if [runCmd "\"C:/ispLEVER3.1.00.30.41.03/ispfpga/bin/nt/promgen.exe\" -p mcs -o tlc.mcs -t 256 -u 0 tlc.bit"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
