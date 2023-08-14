#!/bin/csh -f
cp modelsim.unx modelsim.ini
#
# Compile the MTI LIFMDF library
#
#rm -rf lifmdf
#unzip -d . ../../../blackbox/lifmdf_black_boxes_vhdlib-mti_6.3f.zip
#vlog -refresh -work ./lifmdf_black_boxes
#mv lifmdf_black_boxes lifmdf
#
vlib ./lifmdf
echo Compiling the LIFMDF Component File...
vcom -explicit -work ./lifmdf ../src/LIFMDFCOMP.vhd
echo Compiling the LIFMDF Sequential Cells...
vcom -explicit -work ./lifmdf ../src/LIFMDF_SEQ.vhd
echo Compiling the LIFMDF I/Os...
vcom -explicit -work ./lifmdf ../src/LIFMDF_IO.vhd
echo Compiling the LIFMDF Combinational Cells...
vcom -explicit -work ./lifmdf ../src/LIFMDF_CMB.vhd
echo Compiling the LIFMDF Memory Elements...
vcom -explicit -work ./lifmdf ../src/LIFMDF_MEM.vhd
echo Compiling the LIFMDF Miscillaneous cells...
vcom -explicit -work ./lifmdf ../src/LIFMDF_MISC.vhd
echo Compiling the LIFMDF LUTs...
vcom -explicit -work ./lifmdf ../src/LIFMDF_LUT.vhd
echo Compiling the LIFMDF mixed-HDL primitives...
vcom -work ./lifmdf ../src/gsr_pur_assign.vhd
vlog -work ./lifmdf +define+mixed_hdl ../src/*.v
echo Compiling the LIFMDF Backanno cells...
vcom -explicit -work ./lifmdf ../src/LIFMDF_SL.vhd

