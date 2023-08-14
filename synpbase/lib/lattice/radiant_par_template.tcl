# Copyright (C) 1994-2018 Synopsys, Inc. This Synopsys software and all associated documentation are proprietary to Synopsys, Inc. and may only be used pursuant to the terms and conditions of a written license agreement with Synopsys, Inc. All other use, reproduction, modification, or distribution of the Synopsys software or the associated documentation is strictly prohibited.
############### RUN_RADIANT.TCL ##################
### Purpose: Default TCL script for Integrated 
### Radiant Place and Route run.
### Target Radiant Release: 
################################################# 	
#################################################
###     SET DESIGN VARIABLES      ###
#################################################
set DesignName  	"$(resultbase)"
set FamilyName  	"$(technology)"
set DeviceName  	"$(part)"
set PackageName 	"$(package)"
set SpeedGrade  	"$(speed)"
set TopModule   	"$(top_module)"
set InputMode   	"$(result_format)"
#set RadiantOptionFiles "$(radiant_option_file)"

## Alias FamilyName 
if {${FamilyName} == "SBTICE40UP"} {
	set FamilyName "iCE40UP"
}

#################################################
###     SETUP DESIGN     ###
#################################################
set ldc " "
set FlagValue       "0"
if {${InputMode} == "vm"} {
	if {[file exists ${DesignName}.vm]} {
		set FlagValue	"1"
	}
}


if {[file exists ${DesignName}.ldc]} {
set ldc "${DesignName}.ldc"
}

#################################################
###     SOURCE OPTION FILES IF THEY EXISTS ###
#################################################
#foreach parOptionFile $RadiantOptionFiles {
#	if {[file exists $parOptionFile]} {
#		source $parOptionFile
#	}
#}

#################################################
###    RUN DESIGN     ###
#################################################
if {${FlagValue} == "1"} {
	if {[catch {exec postsyn -a ${FamilyName} -p ${DeviceName} -t ${PackageName} -sp ${SpeedGrade} -ldc $ldc -keeprtl -w -o ${DesignName}_syn.udb -top ${DesignName}.vm }] } {
		puts "Error: parameter not supported.  Please verify!"
		return 1
	}
	exec map ${DesignName}_syn.udb -o ${DesignName}_map.udb -mp ${DesignName}.mrp
	exec par ${DesignName}_map.udb -w ${DesignName}_par.udb
	exec timing -sethld -v 10 -u 10 -endpoints 10 -nperend 1 -html -o ${DesignName}_twr.html -db-file ${DesignName}_par.udb
}

#################################################
###     SAVE RADIANT PROJECT     ###
#################################################
#prj_saveas -name ${DesignName}

if {[file exists ${DesignName}_par.udb]} {
	puts "Radiant P&R completed successfully!!"
	return 0
} else {
	puts "Radiant P&R failed!"
	return 1
}
