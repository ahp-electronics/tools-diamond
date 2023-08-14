		SPI Wishbone Reference Design
=====================================================================================

File List (10 files):

1.  \RD1044\Docs\rd1044.pdf			-->  SPI wb design document
    \RD1044\Docs\rd1044_readme.txt		-->  read me file (this file)
2.  \RD1044\Project\XO\spi_wb.lpf		-->  ispLEVER preference file
    \RD1044\Project\XO\SPI_wb.syn		-->  ispLEVER project file
    \rd1044\Project\XO\spi_wb_tb1_tf.udo	-->  post-route timming sim. script file
    \rd1044\Project\XO\spi_wb_tb1_tff.udo	-->  functional simulation script file
    \rd1044\Project\XO\spi_wb_tb1_tfr.udo	-->  post-route functional sim. script file
3.  \RD1044\Source\Spi_wb.v			-->  source code file - top level 
    \RD1044\Source\Spi_wb_top.vhd		-->  source file - VHDL wrapper
4.  \RD1044\Ttestbench\Spi_wb_tb1.v		-->  testbench for simulation


How to open the ispLEVER project:
1.  Unzip the RD1044_revyy_y.zip file using the existing folder names, where the yy_y 
indicates the current version of the zip file.
2.  Open the ispLEVER Project Navigator.
3.  In the File menu, click on Open Project, then browse to the directory where the reference 
design was unzipped to.  Select the RD1044\Project\XO\SPI_wb.syn file and click open.

How to run simulation:
1.  In the Project Navigator, highlight the ..\..\testbench\spi_wb_tb1.v file on the
left-side panel, user will see 3 simulation options on the right panel.
2.  For functional simulation, double click on Verilog Functional Simulation with
Aldec Active-HDL. Aldec simulator will be brought up, click yes to overwrite the
existing file.
3.  Functional simulation will run until completed and the simulation should end 
at 8us without error.
4.  For timing simulation, double click on Verilog Post-Route Timing Simulation
with Aldec Active-HDL. Similar message will be shown in the console panel of the
Aldec Active-HDL simulator.

How to run simulations when using the VHDL top-level design:
1.  To run the simulation when using the VHDL top-level design module it is necessary 
to change the instantiation to the new top-level module name "spi_wb_wr" in line 95 
of the testbench file.
2.  The simulations will only run for 1 us when using this method.  To run the simulation
for the same length of time as the Verilog design, the user can issue the command 
"run 7 us" at the Active-HDL command line.


How to run Place and Route, JEDEC generation, and Timing Analysis:
1. Highlight the device on the left-side panel of the Project Navigator. On the
right-side panel, double click on Place and Route Design. This will bring the
design through synthesis, mapping, and place and route.
2. Highlight the device on the left-side panel of the Project Navigator. On the
right-side panel, double click on Generate Data File (JEDEC). This will generate
the jedec file for the design.
3. Once Place and Route is done, user can double click on Place and Route Trace
Report on the right-side panel to get the timing analysis result.

