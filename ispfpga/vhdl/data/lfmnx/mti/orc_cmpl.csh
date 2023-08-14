#!/bin/csh -f
cp modelsim.unx modelsim.ini
#
# Compile the MTI LFMNX library
#
#rm -rf lfmnx
#unzip -d . ../../../blackbox/lfmnx_black_boxes_vhdlib-mti_6.3f.zip
#vlog -refresh -work ./lfmnx_black_boxes
#mv lfmnx_black_boxes lfmnx
#
vlib ./lfmnx
echo Compiling the LFMNX Component File...
vcom -explicit -work ./lfmnx ../src/LFMNXCOMP.vhd
echo Compiling the LFMNX Sequential Cells...
vcom -explicit -work ./lfmnx ../src/LFMNX_SEQ.vhd
echo Compiling the LFMNX I/Os...
vcom -explicit -work ./lfmnx ../src/LFMNX_IO.vhd
echo Compiling the LFMNX Combinational Cells...
vcom -explicit -work ./lfmnx ../src/LFMNX_CMB.vhd
echo Compiling the LFMNX Counters...
vcom -explicit -work ./lfmnx ../src/LFMNX_CNT.vhd
echo Compiling the LFMNX Memory Elements...
vcom -explicit -work ./lfmnx ../src/LFMNX_MEM.vhd
echo Compiling the LFMNX Miscillaneous cells...
vcom -explicit -work ./lfmnx ../src/LFMNX_MISC.vhd
echo Compiling the LFMNX LUTs...
vcom -explicit -work ./lfmnx ../src/LFMNX_LUT.vhd

