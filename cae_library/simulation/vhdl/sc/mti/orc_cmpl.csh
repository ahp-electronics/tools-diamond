#!/bin/csh -f
cp modelsim.unx modelsim.ini
#
# Compile the MTI SC/M library
#
# Uncomment to include pre-compiled JTAGA model
#rm -rf work
#unzip -d . ../../../blackbox/jtaga-mti_6.3f.zip
#vlog -refresh -work ./jtaga_work
#mv jtaga_work work
#
vlib ./work
echo Compiling the SC/M Component File...
vcom -explicit -work ./work ../src/ORCACOMP.vhd
echo Compiling the SC/M Sequential Cells...
vcom -explicit -work ./work ../src/ORCA_SEQ.vhd
echo Compiling the SC/M I/Os...
vcom -explicit -work ./work ../src/ORCA_IO.vhd
echo Compiling the SC/M Memory Elements...
vcom -explicit -work ./work ../src/ORCA_MEM.vhd
echo Compiling the SC/M Combinational Cells...
vcom -explicit -work ./work ../src/ORCA_CMB.vhd
echo Compiling the SC/M Counters...
vcom -explicit -work ./work ../src/ORCA_CNT.vhd
echo Compiling the SC/M Miscillaneous cells...
vcom -explicit -work ./work ../src/ORCA_MIS.vhd
echo Compiling the SC/M Backanno cells...
vcom -explicit -work ./work ../src/ORCA_SL.vhd

