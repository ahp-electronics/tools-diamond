@echo off
copy modelsim.pc modelsim.ini

rem Uncomment to include pre-compiled JTAGD model
rem
rem rmdir /S /Q work
rem unzip -d . ..\..\..\blackbox\jtagd-mti_6.3f.zip
rem vlog -refresh -work .\jtagd_work
rem ren jtagd_work work

vlib .\work
vmap MACHXO .\work
vmap LPTM .\work

echo Compiling the MACHXO/LPTM Component File...
vcom -87 -explicit -work .\work ..\src\MACHXOCOMP.vhd
echo Compiling the MACHXO/LPTM Sequential Cells...
vcom -87 -explicit -work .\work ..\src\MACHXO_SEQ.vhd
echo Compiling the MACHXO/LPTM I/Os...
vcom -87 -explicit -work .\work ..\src\MACHXO_IO.vhd
echo Compiling the MACHXO/LPTM Memory Elements...
vcom -87 -explicit -work .\work ..\src\MACHXO_MEM.vhd
echo Compiling the MACHXO/LPTM Combinational Cells...
vcom -87 -explicit -work .\work ..\src\MACHXO_CMB.vhd
echo Compiling the MACHXO/LPTM Counters...
vcom -87 -explicit -work .\work ..\src\MACHXO_CNT.vhd
echo Compiling the MACHXO/LPTM Miscillaneous Cells...
vcom -87 -explicit -work .\work ..\src\MACHXO_MISC.vhd
echo Compiling the MACHXO/LPTM LUT Cells...
vcom -87 -explicit -work .\work ..\src\MACHXO_LUT.vhd

