@echo off
copy modelsim.pc modelsim.ini

rem Uncomment to include pre-compiled JTAGE model
rem
rem rmdir /S /Q work
rem unzip -d . ..\..\..\blackbox\jtage-mti_6.3f.zip
rem vlog -refresh -work .\jtage_work
rem ren jtage_work work

vlib .\work
vmap ECP3 .\work


echo Compiling the ECP3 Component File...
vcom -explicit -work .\work ..\src\ECP3COMP.vhd
echo Compiling the ECP3 Sequential Cells...
vcom -explicit -work .\work ..\src\ECP3_SEQ.vhd
echo Compiling the ECP3 I/Os...
vcom -explicit -work .\work ..\src\ECP3_IO.vhd
echo Compiling the ECP3 Combinational Cells...
vcom -explicit -work .\work ..\src\ECP3_CMB.vhd
echo Compiling the ECP3 Counters...
vcom -explicit -work .\work ..\src\ECP3_CNT.vhd
echo Compiling the ECP3 Memory Elements...
vcom -explicit -work .\work ..\src\ECP3_MEM.vhd
echo Compiling the ECP3 Miscillaneous Cells...
vcom -explicit -work .\work ..\src\ECP3_MISC.vhd
echo Compiling the ECP3 LUTs Cells...
vcom -explicit -work .\work ..\src\ECP3_LUT.vhd
echo Compiling the ECP3 MULTs Cells...
vcom -explicit -work .\work ..\src\ECP3_MULT.vhd
echo Compiling the ECP3 Backanno Cells...
vcom -explicit -work .\work ..\src\ECP3_SL.vhd

