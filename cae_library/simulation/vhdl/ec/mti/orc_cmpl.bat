@echo off
copy modelsim.pc modelsim.ini

rem Uncomment to include pre-compiled JTAGB model
rem
rem rmdir /S /Q work
rem unzip -d . ..\..\..\blackbox\jtagb-mti_6.3f.zip
rem vlog -refresh -work .\jtagb_work
rem ren jtagb_work work

vlib .\work
vmap EC .\work
vmap XP .\work

echo Compiling the EC/XP Component File...
vcom -87 -explicit -work .\work ..\src\ORCACOMP.vhd
echo Compiling the EC/XP Sequential Cells...
vcom -87 -explicit -work .\work ..\src\ORCA_SEQ.vhd
echo Compiling the EC/XP I/Os...
vcom -87 -explicit -work .\work ..\src\ORCA_IO.vhd
echo Compiling the EC/XP Combinational Cells...
vcom -87 -explicit -work .\work ..\src\ORCA_CMB.vhd
echo Compiling the EC/XP Counters...
vcom -87 -explicit -work .\work ..\src\ORCA_CNT.vhd
echo Compiling the EC/XP Memory Elements...
vcom -87 -explicit -work .\work ..\src\ORCA_MEM.vhd
echo Compiling the EC/XP Miscillaneous Cells...
vcom -87 -explicit -work .\work ..\src\ORCA_MISC.vhd
echo Compiling the EC/XP LUTs...
vcom -87 -explicit -work .\work ..\src\ORCA_LUT.vhd

