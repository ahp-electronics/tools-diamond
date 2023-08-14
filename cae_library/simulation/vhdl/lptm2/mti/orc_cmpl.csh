#!/bin/csh -f
cp modelsim.unx modelsim.ini
#
# Compile the MTI LPTM2 library
#
#rm -rf lptm2
#unzip -d . ../../../blackbox/lptm2_black_boxes_vhdlib-mti_6.3f.zip
#vlog -refresh -work ./lptm2_black_boxes
#mv lptm2_black_boxes lptm2
#
vlib ./lptm2
echo Compiling the LPTM2 Component File...
vcom -explicit -work ./lptm2 ../src/MACHXO2COMP.vhd
echo Compiling the LPTM2 Sequential Cells...
vcom -explicit -work ./lptm2 ../src/MACHXO2_SEQ.vhd
echo Compiling the LPTM2 I/Os...
vcom -explicit -work ./lptm2 ../src/MACHXO2_IO.vhd
echo Compiling the LPTM2 Combinational Cells...
vcom -explicit -work ./lptm2 ../src/MACHXO2_CMB.vhd
echo Compiling the LPTM2 Counters...
vcom -explicit -work ./lptm2 ../src/MACHXO2_CNT.vhd
echo Compiling the LPTM2 Memory Elements...
vcom -explicit -work ./lptm2 ../src/MACHXO2_MEM.vhd
echo Compiling the LPTM2 Miscillaneous cells...
vcom -explicit -work ./lptm2 ../src/MACHXO2_MISC.vhd
echo Compiling the LPTM2 LUTs...
vcom -explicit -work ./lptm2 ../src/MACHXO2_LUT.vhd
echo Compiling the gsr_pur_assign primitive - only for EFB VHDL sim...
vcom -work ./lptm2 ../src/gsr_pur_assign.vhd

