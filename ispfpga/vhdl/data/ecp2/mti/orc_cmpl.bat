@echo off
copy modelsim.pc modelsim.ini

rem Uncomment to include pre-compiled JTAGC model
rem
rem rmdir /S /Q work
rem unzip -d . ..\..\..\blackbox\jtagc-mti_6.3f.zip
rem vlog -refresh -work .\jtagc_work
rem ren jtagc_work work

vlib .\work
vmap ECP2 .\work
vmap ECP2M .\work

echo Compiling the ECP2/M Component File...
vcom -explicit -work .\work ..\src\ECP2COMP.vhd
echo Compiling the ECP2/M Sequential Cells...
vcom -explicit -work .\work ..\src\ECP2_SEQ.vhd
echo Compiling the ECP2/M I/Os...
vcom -explicit -work .\work ..\src\ECP2_IO.vhd
echo Compiling the ECP2/M Combinational Cells...
vcom -explicit -work .\work ..\src\ECP2_CMB.vhd
echo Compiling the ECP2/M Counters...
vcom -explicit -work .\work ..\src\ECP2_CNT.vhd
echo Compiling the ECP2/M Memory Elements...
vcom -explicit -work .\work ..\src\ECP2_MEM.vhd
echo Compiling the ECP2/M Miscillaneous Cells...
vcom -explicit -work .\work ..\src\ECP2_MISC.vhd
echo Compiling the ECP2/M LUTs Cells...
vcom -explicit -work .\work ..\src\ECP2_LUT.vhd
echo Compiling the ECP2/M MULTs Cells...
vcom -explicit -work .\work ..\src\ECP2_MULT.vhd
echo Compiling the ECP2/M Backanno Cells...
vcom -explicit -work .\work ..\src\ECP2_SL.vhd

