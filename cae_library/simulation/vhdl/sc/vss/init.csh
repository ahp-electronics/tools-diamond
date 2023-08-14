#!/bin/csh -f

#
# Setup to read Synopsys IEEE, VITAL and other libraries
#
echo ""
echo "****************************************************************"
echo "        ORCA/VHDL Interface: Establishing Environement"
echo "****************************************************************"
echo ""
which vhdlan | grep "/vhdlan" >> /dev/null
if ( $status == 1 ) then
	echo "  ERROR ** Synopsys VSS has not been setup."
	echo "           Please setup VSS and re-execute."
	echo ""
	exit (0)
endif

#
# Setup to read the ORCA VITAL compliant library
#
if !( ${?FOUNDRY} ) then
	echo "  ERROR ** ORCA Foundry has not been setup."
	echo "           Please setup ORCA Foundry and re-execute."
	echo ""
endif

