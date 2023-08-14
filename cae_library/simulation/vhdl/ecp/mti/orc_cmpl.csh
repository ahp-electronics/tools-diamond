#!/bin/csh -f
cp modelsim.unx modelsim.ini
#
# Compile the MTI ECP library
#
# Uncomment to include pre-compiled JTAGB model
#rm -rf work
#unzip -d . ../../../blackbox/jtagb-mti_6.3f.zip
#vlog -refresh -work ./jtagb_work
#mv jtagb_work work
#
vlib ./work
echo Compiling the ECP Component File...
vcom -87 -explicit -work ./work ../src/ORCACOMP.vhd
echo Compiling the ECP Sequential Cells...
vcom -87 -explicit -work ./work ../src/ORCA_SEQ.vhd
echo Compiling the ECP I/Os...
vcom -87 -explicit -work ./work ../src/ORCA_IO.vhd
echo Compiling the ECP Combinatorial...
vcom -87 -explicit -work ./work ../src/ORCA_CMB.vhd
echo Compiling the ECP Counters...
vcom -87 -explicit -work ./work ../src/ORCA_CNT.vhd
echo Compiling the ECP Memories...
vcom -87 -explicit -work ./work ../src/ORCA_MEM.vhd
echo Compiling the ECP Miscillaneous cells...
vcom -87 -explicit -work ./work ../src/ORCA_MISC.vhd
echo Compiling the ECP LUTs...
vcom -87 -explicit -work ./work ../src/ORCA_LUT.vhd
echo Compiling the ECP MULTs...
vcom -87 -explicit -work ./work ../src/ORCA_MULT.vhd

