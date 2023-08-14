          LatticeMico8 Wishbone Interface Adapter Reference Design
===============================================================================

File List
./RD1043/docs/rd1043.pdf                    --> Design document         
./RD1043/docs/rd1043_readme.txt             --> Read me file (this file)
./RD1043/project/xo/lm8_wb.syn              --> Project file
./RD1043/project/xo/lm8_wb_tb_tf.udo        --> Simulation script to add signals to waveform 
./RD1043/project/xo/lm8_wb_tb_tff.udo       --> Simulation script to add signals to waveform
./RD1043/project/xo/lm8_wb_tb_tfr.udo       --> Simulation script to add signals to waveform
./RD1043/source/lm8_wb.v                    --> Source file
./RD1043/source/lm8_wb_vhdl.vhd             --> Source file (VHDL wrapper)
./RD1043/testbench/lm8_wb_tb.v              --> Testbench for simulation


Opening the project in ispLEVER:
1. Unzip the RD1043_rev01.0.zip file using the existing folder names.
2. Open the ispLEVER Project Navigator.
3. From the 'File' menu, select 'Open Project' and browse to the desired project file.

Running simulation
1. In the Project Navigator, highlight the ..\..\testbench\lm8_wb_tb.v file on the
   left-side panel. Three simulation options will then appear on the right-hand side
2. For functional simulation, double-click 'Verilog Functional Simulation with
   Aldec Active-HDL'. The simulator will be brought up. If prompted, click yes to 
   overwrite the existing file.
4. For timing simulation, double-click 'Verilog Post-Route Timing Simulation
   with Aldec Active-HDL'.
   
   Note: Simulation using Aldec Active-HDL may display an error similar to:
         "Cannot find waveform window"
         This error results from a command to clear the window before it may have been opened.
         Simulation is not affected and this message can be safely ignored.
         
   Note: The testbench instantiates the UUT using the name 'lm8_wb'. If using the VHDL wrapper module for
         mixed Verilog/VHDL simulation with this testbench, this name needs to be changed to match that
         used in the VHDL module. Simply change the UUT name in the testbench from 'lm8_wb' to
         'lm8_wb_wrapper'.

Running Place and Route
1. Highlight the device on the left panel of the Project Navigator. In the right-hand 
   panel, double-click 'Place and Route Design'.
