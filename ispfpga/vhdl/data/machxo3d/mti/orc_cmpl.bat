@echo off
copy modelsim.pc modelsim.ini

rem rmdir /S /Q machxo3d
rem unzip -d . ..\..\..\blackbox\machxo3d_black_boxes_vhdlib-mti_6.3f.zip
rem vlog -refresh -work .\machxo3d_black_boxes
rem ren machxo3d_black_boxes machxo3d

vlib .\machxo3d
vmap MACHXO3D .\machxo3d

echo Compiling the MACHXO3D Component File...
vcom -explicit -work .\machxo3d ..\src\MACHXO3DCOMP.vhd
echo Compiling the MACHXO3D Sequential Cells...
vcom -explicit -work .\machxo3d ..\src\MACHXO3D_SEQ.vhd
echo Compiling the MACHXO3D I/Os...
vcom -explicit -work .\machxo3d ..\src\MACHXO3D_IO.vhd
echo Compiling the MACHXO3D Combinational Cells...
vcom -explicit -work .\machxo3d ..\src\MACHXO3D_CMB.vhd
echo Compiling the MACHXO3D Counters...
vcom -explicit -work .\machxo3d ..\src\MACHXO3D_CNT.vhd
echo Compiling the MACHXO3D Memory Elements...
vcom -explicit -work .\machxo3d ..\src\MACHXO3D_MEM.vhd
echo Compiling the MACHXO3D Miscillaneous Cells...
vcom -explicit -work .\machxo3d ..\src\MACHXO3D_MISC.vhd
echo Compiling the MACHXO3D LUTs Cells...
vcom -explicit -work .\machxo3d ..\src\MACHXO3D_LUT.vhd

