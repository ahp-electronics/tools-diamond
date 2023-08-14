#! /bin/bash

#####################################
###     SET DESIGN VARIABLES      ###
#####################################

if [[ -f run_options.txt && -f $(ls *.vm) && -f $(ls *.*dc) ]]
then
	export DesignName="$(resultbase)"
	export FamilyName="$(technology)"
	export DeviceName="$(part)"
	export PackageName="$(package)"
	export SpeedGrade="$(speed)"
	export TopModule="$(top_module)"
	export VmFile="$(resultbase).vm"
	
	if [[ -f $(ls *.ldc) ]]
	then
		export ConstraintFile="$(resultbase).ldc"
	else
		export ConstraintFile="$(resultbase).xdc"
	fi
	
else
	export DesignName="`grep "project.*-result_file.*" ../run_options.txt | awk '{print $3}' | sed -re 's/\"(.*)\.vm\"/\1/g' | awk -F/ '{print $NF}'`"
	export FamilyName="`grep "set_option.*-technology.*" ../run_options.txt | awk '{print $3}' | sed -re 's/\"(.*)\"/\1/g' | sed -re 's/^SBT//g'`"
	export DeviceName="`grep "set_option.*-part .*" ../run_options.txt | awk '{print $3}'`"
	export PackageName="`grep "set_option.*-package .*" ../run_options.txt | awk '{print $3}'`"
	export SpeedGrade="`grep "set_option.*-speed_grade .*" ../run_options.txt | awk '{print $3}'`"
	export TopModule="` grep "set_option.*-top_module.*" ../run_options.txt | awk '{print $3}' | sed -re 's/\"(.*)\"/\1/g'`"
	export VmFile="../${DesignName}.vm"
	
	if [[ -f $(ls ../*.ldc) ]]
	then
		export ConstraintFile="../${DesignName}.ldc"
	else
		export ConstraintFile="../${DesignName}.xdc"
	fi
	
fi

### Modify the family name ###
if echo $FamilyName | grep -q "ICE.*"
then
	export FamilyName="`echo $FamilyName | sed -re 's/^ICE/iCE/g'`"
fi


##########################################
###       USER DEFINED VARIABLES       ###
##########################################

if [ "$LATTICE" != "" ]
then
	export LATTICE=$LATTICE
else
################ USER DEFINED PLACE AND ROUTE TOOL PATH ################
 
	export LATTICE="/remote/sbgindia_toolkits/Lattice/Radiant_1.0.6_x64"
	#export LATTICE="X:/Pango/PDS_2018.1-patch5_win64"
fi

### Platform ###

if [ `uname | grep -ic "Windows"` -eq 1 -o \
     `uname | grep -ic "CYGWIN"` -eq 1 ]
then
	plat=nt64
	export FOUNDRY="$LATTICE/ispfpga"
else
	plat=lin64
	export FOUNDRY="$LATTICE"
fi

#######################################################################################
###        SETUP ENVIRONMENT VARIABLES TO RUN LATTICE RADIANT PLACE AND ROUTE		###
#######################################################################################
case `uname` in
	Win*)
		export PATH="$LATTICE/bin/$plat:$FOUNDRY/bin/$plat:$PATH"
		export FOUNDRY="$LATTICE/ispfpga";;
	CYGWIN*)
		export FOUNDRY="$LATTICE/ispfpga"
		export PATH="$LATTICE/bin/$plat:$FOUNDRY/bin/$plat:$PATH";;
	SunOS)
		export LD_LIBRARY_PATH="$FOUNDRY/bin/sol:$LD_LIBRARY_PATH"
		export PATH="$FOUNDRY/bin/sol:$PATH";;
################ USER DEFINED LM_LICENSE_FILE ################		
		#export LM_LICENSE_FILE="$LM_LICENSE_FILE:1702@nsparky";;
	Linux)
		export FOUNDRY="$LATTICE/ispfpga"
		export bindir="$LATTICE/bin/$plat"
		export LD_LIBRARY_PATH=$FOUNDRY/bin/$plat:$LD_LIBRARY_PATH
		export PATH="$LATTICE/bin/$plat:${FOUNDRY}/bin/$plat:${PATH}";;
################ USER DEFINED LM_LICENSE_FILE ################
		#export LM_LICENSE_FILE="$LM_LICENSE_FILE:1702@nsparky";;
	*)
		echo "ERROR: Unsupported platform!!"
		exit 1;;
esac

echo "Running lattice version $LATTICE"

if [ `uname | grep -ic "Linux"` -eq 1  ]
        then
	source $LATTICE/bin/$plat/radiant_env
else
	export bindir="$FOUNDRY/bin/$plat"
fi

#######################################
###       RUN PLACE AND ROUTE       ###
#######################################

#### Run postsyn ####
postsyn -top ${VmFile} -ldc ${ConstraintFile} -a ${FamilyName} -p ${DeviceName} -t ${PackageName} -sp ${SpeedGrade}  -keeprtl -w -o ${DesignName}_syn.udb 

rc=$?
if [ "$rc" -ne 0 ]
then
        echo "ERROR: postsyn return code was $rc"
        exit 1
fi

#### Run map ####
map ${DesignName}_syn.udb -o ${DesignName}_map.udb -mp ${DesignName}.mrp

rc=$?
if [ "$rc" -ne 0 ]
then
        echo "ERROR: map return code was $rc"
        exit 1
fi

#### Run par ####
par ${DesignName}_map.udb -w ${DesignName}_par.udb

rc=$?
if [ "$rc" -ne 0 ]
then
        echo "ERROR: par return code was $rc"
        exit 1
fi

#### Run timing ####
timing -sethld -v 10 -u 10 -endpoints 10 -nperend 1 -html -rpt ${DesignName}_twr.html ${DesignName}_par.udb 

rc=$?
if [ "$rc" -ne 0 ]
then
	echo "ERROR: timing return code was $rc"
	exit 1
fi


####################################################
###       Check if output file was created       ###
####################################################

if [ -s ${DesignName}_par.udb ]
then
	echo "Lattice Place and Route Completed successfully"
	exit 0
else
	echo "Lattice Place and Route failed."
	exit 1
fi
