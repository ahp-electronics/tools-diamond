@echo off
copy modelsim.pc modelsim.ini

rem rmdir /S /Q lfmnx
rem unzip -d . ..\..\..\blackbox\lfmnx_black_boxes_vhdlib-mti_6.3f.zip
rem vlog -refresh -work .\lfmnx_black_boxes
rem ren lfmnx_black_boxes lfmnx

vlib .\lfmnx
vmap LFMNX .\lfmnx

echo Compiling the LFMNX Component File...
vcom -explicit -work .\lfmnx ..\src\LFMNXCOMP.vhd
echo Compiling the LFMNX Sequential Cells...
vcom -explicit -work .\lfmnx ..\src\LFMNX_SEQ.vhd
echo Compiling the LFMNX I/Os...
vcom -explicit -work .\lfmnx ..\src\LFMNX_IO.vhd
echo Compiling the LFMNX Combinational Cells...
vcom -explicit -work .\lfmnx ..\src\LFMNX_CMB.vhd
echo Compiling the LFMNX Counters...
vcom -explicit -work .\lfmnx ..\src\LFMNX_CNT.vhd
echo Compiling the LFMNX Memory Elements...
vcom -explicit -work .\lfmnx ..\src\LFMNX_MEM.vhd
echo Compiling the LFMNX Miscillaneous Cells...
vcom -explicit -work .\lfmnx ..\src\LFMNX_MISC.vhd
echo Compiling the LFMNX LUTs Cells...
vcom -explicit -work .\lfmnx ..\src\LFMNX_LUT.vhd

