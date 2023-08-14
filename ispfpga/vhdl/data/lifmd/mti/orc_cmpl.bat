@echo off
copy modelsim.pc modelsim.ini

rem rmdir /S /Q lifmd
rem unzip -d . ..\..\..\blackbox\lifmd_black_boxes_vhdlib-mti_6.3f.zip
rem vlog -refresh -work .\lifmd_black_boxes
rem ren lifmd_black_boxes lifmd

vlib .\lifmd
vmap lifmd .\lifmd

echo Compiling the LIFMD Component File...
vcom -explicit -work .\lifmd ..\src\LIFMDCOMP.vhd
echo Compiling the LIFMD Sequential Cells...
vcom -explicit -work .\lifmd ..\src\LIFMD_SEQ.vhd
echo Compiling the LIFMD I/Os...
vcom -explicit -work .\lifmd ..\src\LIFMD_IO.vhd
echo Compiling the LIFMD Combinational Cells...
vcom -explicit -work .\lifmd ..\src\LIFMD_CMB.vhd
echo Compiling the LIFMD Memory Elements...
vcom -explicit -work .\lifmd ..\src\LIFMD_MEM.vhd
echo Compiling the LIFMD Miscillaneous Cells...
vcom -explicit -work .\lifmd ..\src\LIFMD_MISC.vhd
echo Compiling the LIFMD LUTs Cells...
vcom -explicit -work .\lifmd ..\src\LIFMD_LUT.vhd
echo Compiling the LIFMD mixed-HDL primitives...
vcom -work .\lifmd ..\src\gsr_pur_assign.vhd
vlog -work .\lifmd +define+mixed_hdl ..\src\\*.v
echo Compiling the LIFMD Backanno Cells...
vcom -explicit -work .\lifmd ..\src\LIFMD_SL.vhd

