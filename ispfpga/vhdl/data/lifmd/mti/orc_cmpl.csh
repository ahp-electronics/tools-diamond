#!/bin/csh -f
cp modelsim.unx modelsim.ini
#
# Compile the MTI LIFMD library
#
#rm -rf lifmd
#unzip -d . ../../../blackbox/lifmd_black_boxes_vhdlib-mti_6.3f.zip
#vlog -refresh -work ./lifmd_black_boxes
#mv lifmd_black_boxes lifmd
#
vlib ./lifmd
echo Compiling the LIFMD Component File...
vcom -explicit -work ./lifmd ../src/LIFMDCOMP.vhd
echo Compiling the LIFMD Sequential Cells...
vcom -explicit -work ./lifmd ../src/LIFMD_SEQ.vhd
echo Compiling the LIFMD I/Os...
vcom -explicit -work ./lifmd ../src/LIFMD_IO.vhd
echo Compiling the LIFMD Combinational Cells...
vcom -explicit -work ./lifmd ../src/LIFMD_CMB.vhd
echo Compiling the LIFMD Memory Elements...
vcom -explicit -work ./lifmd ../src/LIFMD_MEM.vhd
echo Compiling the LIFMD Miscillaneous cells...
vcom -explicit -work ./lifmd ../src/LIFMD_MISC.vhd
echo Compiling the LIFMD LUTs...
vcom -explicit -work ./lifmd ../src/LIFMD_LUT.vhd
echo Compiling the LIFMD mixed-HDL primitives...
vcom -work ./lifmd ../src/gsr_pur_assign.vhd
vlog -work ./lifmd +define+mixed_hdl ../src/*.v
echo Compiling the LIFMD Backanno cells...
vcom -explicit -work ./lifmd ../src/LIFMD_SL.vhd

