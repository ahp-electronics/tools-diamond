#$Header: L:/module/scripts/sbpgen.tcl 1.3 mghuang Exp $

#Rev 1.3: Diamond 3.3 IPExpress: Fixed SOF-118002
#Rev 1.2: Diamond 3.2 IPExpress: Fixed SOF-120614 miss Para(family)
#Rev 1.1: Diamond 3.2 IPExpress: ECP4 to ECP5
#rev 1.0: Diamond 3.2 IPExpress: init ver

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
#exec wish "$0" ${1+"$@"}

proc LoadLpcFile {para_file} {
	global Para

	if [catch {open $para_file r} fileid] {
		puts stderr "ERROR: Cannot open $para_file file!"
		exit -1
	}

	seek $fileid 0 start
	while {[gets $fileid line] >= 0} {
		if [regexp {([^=]*)=(.*)} $line match parameter value] {
			if [regexp {([ |\t]*;)} $parameter match] {continue}
			if [regexp {(.*)[ |\t]*;} $value match temp] {
				set Para($parameter) $temp
			} else {
				set Para($parameter) $value
			}
		}
	}
	close $fileid
}

proc LoadCfgFile {para_file} {
	if [catch {open $para_file r} fileid] {
		puts stderr "ERROR: Cannot open $para_file file!"
		exit -1
	}

	seek $fileid 0 start
	while {[gets $fileid line] >= 0} {
		if [regexp {([^=]*)=(.*)} $line match parameter value] {
			if [regexp {([ |\t]*;)} $parameter match] {continue}
			if [regexp {(.*)[ |\t]*;} $value match temp] {
				set parameter [string trim $parameter]
				set temp [string trim $temp]
				set $parameter $temp
			} else {
				set parameter [string trim $parameter]
				set value [string trim $value]
				set $parameter $value
			}
		}
	}
	close $fileid
	
	return $CoreName
}

proc FindTemplateFile {core_dir} {
	global Para
	
	set family "sa5p00"
	set dirname [file join $core_dir $family gui core_template.tcl]
	if {[file exists $dirname]==0} {
		set template_file [file join $core_dir gui core_template.tcl]
	} else {
		set template_file $dirname
	}
	return $template_file
}

proc doFPGAdir {dirname} {
	global Para
	set filename "nodeinfo.cfg"

	cd $dirname
	foreach dir [glob *] {
		if {[file isdirectory $dir]} {
			set cfg_file [file join $dirname $dir $filename]
			if {[file exists $cfg_file]==0} {continue}
			set core_name [LoadCfgFile $cfg_file]
			if {$core_name == $Para(CoreName)} {
				cd $Para(ProjectPath)
				return $dir
			}
		}
	}
}

proc FindCoreDir {} {
	global Para
	
	set module_dir [file join $Para(Root) module]
	set core_dir [doFPGAdir $module_dir]
	set core_dir [file join $module_dir $core_dir]
	return $core_dir
}

proc DoFPGAFlow {} {
	global Para
	
	set core_dir [FindCoreDir]
	set template_file [FindTemplateFile $core_dir]
	set family "sa5p00"
	set default_lpc [file join $core_dir $family "preference" "default.lpc"]
	if {[file exists $default_lpc] == 0} {
		set default_lpc [file join $core_dir "preference" "default.lpc"]
	}
	set Para(lpc) [file dirname $default_lpc]
	LoadLpcFile $default_lpc
	set lpc_file [file join $Para(ProjectPath) $Para(LpcFile)]
	LoadLpcFile $lpc_file
	
	source $template_file
}

proc SbpGenerate {} {
	global Para pin_flag env

	set core_name [string tolower $Para(CoreName)]
	if {$core_name == "pcs" || $core_name == "extref"} {
		CreateGenerateFile
		
	} else {
		set str [GenerateCB]
		
		set Para(EDIF) 1

		set scuba [GetScubaEngine]

		#*** General Options Command arguments ***
		set cmd [GetGeneralArgs]

		append cmd_line $scuba " -w -n" " " $Para(ModuleName) $cmd " " $str
		append command_line [list $scuba] " -w -n" " " $Para(ModuleName) $cmd " " $str

		set ret [catch {eval exec $command_line} msg]
		
		if {$ret != 0}  {
		# run failure. return !0.
			set msg "ERROR: Child process exited abnormally."
			puts stderr $msg
			set ret -1
		}

		set Para(family) $Para(Family)
		#output generate_core.tcl
		CreateGenerateCoreFile
	}

	#output generate_ngd.tcl
	CreateGenerateNGDFile
	
	set generate_core_file $Para(ProjectPath)/generate_core.tcl
	if {[file exists $generate_core_file] == -1} {
		puts stderr "ERROR: Cannot open $generate_core_file file!"
		exit -1
	}
	source $generate_core_file
	
	set generate_ngd_file $Para(ProjectPath)/generate_ngd.tcl
	if {[file exists $generate_ngd_file] == -1} {
		puts stderr "ERROR: Cannot open $generate_ngd_file file!"
		exit -1
	}
	source $generate_ngd_file
}

proc sbp_lpcgen {prj_path lpc root args} {
	global Para pin_flag env

	#set pin_flag 1
	set Para(bali) "true"
	
	set Para(ProjectPath) $prj_path
	regsub -all "\"" $Para(ProjectPath) "" Para(ProjectPath)
	regsub -all "\"" $Para(ProjectPath) "" Para(ProjectPath)

	set Para(LpcFile) $lpc
	regsub -all "\"" $Para(LpcFile) "" Para(LpcFile)
	
	set Para(Root) $root
	regsub -all "\"" $Para(Root) "" Para(Root)
	set Para(FOUNDRY) $Para(Root)/ispfpga
	set env(TOOLRTF) $Para(Root)
	
	eval $args
	
	set Para(OrcaControl) [file join $Para(Root) module gui lattice_orca] 
	source $Para(OrcaControl)/OrcaControl.tcl
	wm withdraw .
	
	LoadLpcFile $Para(LpcFile)

	set Para(arch) $Para(Family)
	set Para(family) $Para(Family)
	#puts $Para(Family)
	SetArchValue
	
	DoFPGAFlow

	cd $Para(ProjectPath)
	SbpGenerate
}
