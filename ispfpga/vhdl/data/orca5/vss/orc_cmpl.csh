#!/bin/csh -f

#
# Compile the ORCA libraries for VSS
#
echo "Compiling ORCA Component file"
vhdlan -c -w ORCA $FOUNDRY/vhdl/data/orca4/src/ORCACOMP.vhd
echo "Compiling ORCA Sequential Cell"
vhdlan -c -w ORCA $FOUNDRY/vhdl/data/orca3/src/ORCA_SEQ.vhd
echo "Compiling ORCA I/Os"
vhdlan -c -w ORCA $FOUNDRY/vhdl/data/orca3/src/ORCA_IO.vhd
echo "Compiling ORCA Memory Elements"
vhdlan -c -w ORCA $FOUNDRY/vhdl/data/orca3/src/ORCA_MEM.vhd
echo "Compiling ORCA Combinational Cells"
vhdlan -c -w ORCA $FOUNDRY/vhdl/data/orca3/src/ORCA_CMB.vhd
echo "Compiling ORCA Counters"
vhdlan -c -w ORCA $FOUNDRY/vhdl/data/orca3/src/ORCA_CNT.vhd
echo "Compiling ORCA Programmable Clock Managers"
vhdlan -c -w ORCA $FOUNDRY/vhdl/data/orca3/src/ORCA_PCM.vhd
echo "Compiling ORCA 4E Miscillaneous Cells"
vhdlan -c -w ORCA $FOUNDRY/vhdl/data/orca4/src/ORCA_MIS.vhd

