#!/bin/csh -f
cp modelsim.unx modelsim.ini
#
# Compile the MTI MACHXO/LPTM libraries
#
# Uncomment to include pre-compiled JTAGD model
#rm -rf work
#unzip -d . ../../../blackbox/jtagd-mti_6.3f.zip
#vlog -refresh -work ./jtagd_work
#mv jtagd_work work
#
vlib ./work
echo Compiling the MACHXO/LPTM Component File...
vcom -87 -explicit -work ./work ../src/MACHXOCOMP.vhd
echo Compiling the MACHXO/LPTM Sequential Cells...
vcom -87 -explicit -work ./work ../src/MACHXO_SEQ.vhd
echo Compiling the MACHXO/LPTM I/Os...
vcom -87 -explicit -work ./work ../src/MACHXO_IO.vhd
echo Compiling the MACHXO/LPTM Memory Elements...
vcom -87 -explicit -work ./work ../src/MACHXO_MEM.vhd
echo Compiling the MACHXO/LPTM Combinational Cells...
vcom -87 -explicit -work ./work ../src/MACHXO_CMB.vhd
echo Compiling the MACHXO/LPTM Counters...
vcom -87 -explicit -work ./work ../src/MACHXO_CNT.vhd
echo Compiling the MACHXO/LPTM Miscillaneous cells...
vcom -87 -explicit -work ./work ../src/MACHXO_MISC.vhd
echo Compiling the MACHXO/LPTM LUT cells...
vcom -87 -explicit -work ./work ../src/MACHXO_LUT.vhd

