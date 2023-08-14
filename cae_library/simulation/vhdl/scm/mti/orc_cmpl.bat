@echo off
copy modelsim.pc modelsim.ini

rem Uncomment to include pre-compiled JTAGA model
rem
rem rmdir /S /Q work
rem unzip -d . ..\..\..\blackbox\jtaga-mti_6.3f.zip
rem vlog -refresh -work .\jtaga_work
rem ren jtaga_work work

vlib .\work
vmap SC .\work
vmap SCM .\work

echo Compiling the SC/M Component File...
vcom -explicit -work .\work ..\src\ORCACOMP.vhd
echo Compiling the SC/M Sequential Cells...
vcom -explicit -work .\work ..\src\ORCA_SEQ.vhd
echo Compiling the SC/M I/Os...
vcom -explicit -work .\work ..\src\ORCA_IO.vhd
echo Compiling the SC/M Memory Elements...
vcom -explicit -work .\work ..\src\ORCA_MEM.vhd
echo Compiling the SC/M Combinational Cells...
vcom -explicit -work .\work ..\src\ORCA_CMB.vhd
echo Compiling the SC/M Counters...
vcom -explicit -work .\work ..\src\ORCA_CNT.vhd
echo Compiling the SC/M Miscillaneous Cells...
vcom -explicit -work .\work ..\src\ORCA_MIS.vhd
echo Compiling the SC/M Backanno Cells...
vcom -explicit -work .\work ..\src\ORCA_SL.vhd

