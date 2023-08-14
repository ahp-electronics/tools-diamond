#!/bin/csh -f
cp modelsim.unx modelsim.ini
#
# Compile the MTI MACHXO3L library
#
#rm -rf machxo3l
#unzip -d . ../../../blackbox/machxo3l_black_boxes_vhdlib-mti_6.3f.zip
#vlog -refresh -work ./machxo3l_black_boxes
#mv machxo3l_black_boxes machxo3l
#
vlib ./machxo3l
echo Compiling the MACHXO3L Component File...
vcom -explicit -work ./machxo3l ../src/MACHXO3LCOMP.vhd
echo Compiling the MACHXO3L Sequential Cells...
vcom -explicit -work ./machxo3l ../src/MACHXO3L_SEQ.vhd
echo Compiling the MACHXO3L I/Os...
vcom -explicit -work ./machxo3l ../src/MACHXO3L_IO.vhd
echo Compiling the MACHXO3L Combinational Cells...
vcom -explicit -work ./machxo3l ../src/MACHXO3L_CMB.vhd
echo Compiling the MACHXO3L Counters...
vcom -explicit -work ./machxo3l ../src/MACHXO3L_CNT.vhd
echo Compiling the MACHXO3L Memory Elements...
vcom -explicit -work ./machxo3l ../src/MACHXO3L_MEM.vhd
echo Compiling the MACHXO3L Miscillaneous cells...
vcom -explicit -work ./machxo3l ../src/MACHXO3L_MISC.vhd
echo Compiling the MACHXO3L LUTs...
vcom -explicit -work ./machxo3l ../src/MACHXO3L_LUT.vhd
echo Compiling the gsr_pur_assign primitive - only for EFB VHDL sim...
vcom -work ./machxo3l ../src/gsr_pur_assign.vhd

