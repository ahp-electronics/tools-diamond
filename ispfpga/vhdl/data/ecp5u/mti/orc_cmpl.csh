#!/bin/csh -f
cp modelsim.unx modelsim.ini
#
# Compile the MTI ECP5U library
#
#rm -rf ecp5u
#unzip -d . ../../../blackbox/ecp5u_black_boxes_vhdlib-mti_6.3f.zip
#vlog -refresh -work ./ecp5u_black_boxes
#mv ecp5u_black_boxes ecp5u
#
vlib ./ecp5u
echo Compiling the ECP5U Component File...
vcom -explicit -work ./ecp5u ../src/ECP5UCOMP.vhd
echo Compiling the ECP5U Sequential Cells...
vcom -explicit -work ./ecp5u ../src/ECP5U_SEQ.vhd
echo Compiling the ECP5U I/Os...
vcom -explicit -work ./ecp5u ../src/ECP5U_IO.vhd
echo Compiling the ECP5U Combinational Cells...
vcom -explicit -work ./ecp5u ../src/ECP5U_CMB.vhd
echo Compiling the ECP5U Memory Elements...
vcom -explicit -work ./ecp5u ../src/ECP5U_MEM.vhd
echo Compiling the ECP5U Miscillaneous cells...
vcom -explicit -work ./ecp5u ../src/ECP5U_MISC.vhd
echo Compiling the ECP5U LUTs...
vcom -explicit -work ./ecp5u ../src/ECP5U_LUT.vhd
echo Compiling the ECP5U mixed-HDL primitives...
vcom -work ./ecp5u ../src/gsr_pur_assign.vhd
vlog -work ./ecp5u +define+mixed_hdl ../src/*.v
echo Compiling the ECP5U Backanno cells...
vcom -explicit -work ./ecp5u ../src/ECP5U_SL.vhd

