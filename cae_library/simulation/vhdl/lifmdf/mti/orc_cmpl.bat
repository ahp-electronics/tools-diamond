@echo off
copy modelsim.pc modelsim.ini

rem rmdir /S /Q lifmdf
rem unzip -d . ..\..\..\blackbox\lifmdf_black_boxes_vhdlib-mti_6.3f.zip
rem vlog -refresh -work .\lifmdf_black_boxes
rem ren lifmdf_black_boxes lifmdf

vlib .\lifmdf
vmap lifmdf .\lifmdf

echo Compiling the LIFMDF Component File...
vcom -explicit -work .\lifmdf ..\src\LIFMDFCOMP.vhd
echo Compiling the LIFMDF Sequential Cells...
vcom -explicit -work .\lifmdf ..\src\LIFMDF_SEQ.vhd
echo Compiling the LIFMDF I/Os...
vcom -explicit -work .\lifmdf ..\src\LIFMDF_IO.vhd
echo Compiling the LIFMDF Combinational Cells...
vcom -explicit -work .\lifmdf ..\src\LIFMDF_CMB.vhd
echo Compiling the LIFMDF Memory Elements...
vcom -explicit -work .\lifmdf ..\src\LIFMDF_MEM.vhd
echo Compiling the LIFMDF Miscillaneous Cells...
vcom -explicit -work .\lifmdf ..\src\LIFMDF_MISC.vhd
echo Compiling the LIFMDF LUTs Cells...
vcom -explicit -work .\lifmdf ..\src\LIFMDF_LUT.vhd
echo Compiling the LIFMDF mixed-HDL primitives...
vcom -work .\lifmdf ..\src\gsr_pur_assign.vhd
vlog -work .\lifmdf +define+mixed_hdl ..\src\\*.v
echo Compiling the LIFMDF Backanno Cells...
vcom -explicit -work .\lifmdf ..\src\LIFMDF_SL.vhd

