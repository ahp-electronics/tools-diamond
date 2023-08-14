#!/bin/csh -f
cp modelsim.unx modelsim.ini
#
# Compile the MTI MACHXO2 library
#
#rm -rf machxo2
#unzip -d . ../../../blackbox/machxo2_black_boxes_vhdlib-mti_6.3f.zip
#vlog -refresh -work ./machxo2_black_boxes
#mv machxo2_black_boxes machxo2
#
vlib ./machxo2
echo Compiling the MACHXO2 Component File...
vcom -explicit -work ./machxo2 ../src/MACHXO2COMP.vhd
echo Compiling the MACHXO2 Sequential Cells...
vcom -explicit -work ./machxo2 ../src/MACHXO2_SEQ.vhd
echo Compiling the MACHXO2 I/Os...
vcom -explicit -work ./machxo2 ../src/MACHXO2_IO.vhd
echo Compiling the MACHXO2 Combinational Cells...
vcom -explicit -work ./machxo2 ../src/MACHXO2_CMB.vhd
echo Compiling the MACHXO2 Counters...
vcom -explicit -work ./machxo2 ../src/MACHXO2_CNT.vhd
echo Compiling the MACHXO2 Memory Elements...
vcom -explicit -work ./machxo2 ../src/MACHXO2_MEM.vhd
echo Compiling the MACHXO2 Miscillaneous cells...
vcom -explicit -work ./machxo2 ../src/MACHXO2_MISC.vhd
echo Compiling the MACHXO2 LUTs...
vcom -explicit -work ./machxo2 ../src/MACHXO2_LUT.vhd
echo Compiling the gsr_pur_assign primitive - only for EFB VHDL sim...
vcom -work ./machxo2 ../src/gsr_pur_assign.vhd

