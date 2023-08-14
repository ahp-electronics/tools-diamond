                    Lattice-Wishbone UART Reference Design                                                         
===============================================================================                                   
                                                                                                                  
File List (17 files)                                                                                              
 1. RD1042/Docs/rd1042.pdf		               --> UART/Wishbone design document                                                             
    /RD1042/docs/RD1042_readme.txt           --> Read me file (this file)                                              
 2. /RD1042/Project/xo/Mico8UART_XO.syn      --> ispLEVER project file                                                 
    /RD1042/Project/xo/mico8uart_xo.lpf      --> preference file                                                       
    /RD1042/Project/xo/uart_tb_tff.udo       --> script for functional simulation                                      
    /RD1042/Project/xo/uart_tb_tf.udo        --> script for timing simulation                                     
 3. /RD1042/source/uart_core.v               --> source file - top level 
    /RD1042/source/UART_VhdlWrapper.vhd      --> source file - top level for VHDL users                                             
    /RD1042/source/intface.v                 --> source file              														                                             
    /RD1042/source/rxcver.v                  --> source file              														                                             
    /RD1042/source/tsmitt.v           	     --> source file              														                                             
    /RD1042/source/rxcver_fifo.v             --> fifo based receive buffer register               														                                             
    /RD1042/source/tsmitt_fifo.v             --> fifo based Transmit hold  register
    /RD1042/source/system_conf.v             --> configuration information for fifo mode
    /RD1042/source/modem.v                   --> source file
 4. /RD1042/testbench/uart_tb.v              --> Testbench for simulation 		
    /RD1042/testbench/transmit_test.v        --> trasmit function check test case for simulation 
    /RD1042/testbench/receive_test.v         --> receive function check test case for simulation 
    /RD1042/testbench/eval_params.v          --> contains all the parameter initialization for the simulation like
							`define CLK_IN_MHZ 25
							`define BAUD_RATE  115200
							`define ADDRWIDTH  5
							`define DATAWIDTH  8
							`define FIFO       0                                                                                                                  
How to bring up the project:                                                                                      
1. Unzip the RD1042_rev01.0.zip file using the existing folder names,                                           
2. Bring up ispLEVER Project Navigator                                                                            
3. In the File menu, click on Open Project, then browse to the directory where the                                
   reference design is placed, select RD1042\Project\<device>\Mico8UART_XO.syn and click Open                       
                                                                                                                  
How to run simulation:                                                                                            
1. In the Project Navigator, highlight the ..\..\testbench\uart_tb.v file on the left-side panel,                  
   user will see 3 simulation options on the right panel    
   For VHDL simulation 
   a. Please create a new ispLEVER project with mixed VHDL/Verilog Design Entry. 
   b. Un-comment the line 62 and comment line 63 of the uart_tb.v.
   c. import the UART_VhdlWrapper.vhd as the top level.
   d. import all the rest of the verilog source file.

2. Please select receive_test and comment the transmit_test which in included on 378 of uart_tb.v for any receiver function test.
3. For functional simulation, double click on Verilog Functional Simulation with Aldec Active-HDL.                
   Aldec simulator will be brought up, click yes to overwrite the existing file                                   
4. Functional simulation will run until complete. user will see a script shown in the Console panel               
   like this:                                                                                                     
   - make sure you select the respective test case for the transmit and receive functions..                                                                                   
   - you need to run the simulation atleast for 3ms for transmit_test and  400us for receive_test.v for the complete test.
   - copy of the message from the console for transmit test..is as shown below.

do uart_tb_tff.udo uart_tb
# -- ispLEVER Verilog Functional Simulation Template: uart_tb_tff.udo.
# -- You may edit this file to control your simulation.
# -- You may specify your design unit.
# -- You may specify your waveforms.
wave *
# -- You may specify your simulation run time.
run 1000 ns
# 53 signal(s) traced.
# KERNEL: stopped at time: 1 us
run @3ms
# KERNEL: end of check the output of case  1, No Tx Error found!
# KERNEL: end of check the output of case  1, No Tx Error found!
# KERNEL: end of check the output of case  1, No Tx Error found!
# KERNEL: end of check the output of case  1, No Tx Error found!
# KERNEL: end of check the output of case  2, No Tx Error found!
# KERNEL: end of check the output of case  2, No Tx Error found!
# KERNEL: end of check the output of case  2, No Tx Error found!
# KERNEL: end of check the output of case  2, No Tx Error found! 
                                                  
5. For timing simulation, double click on Verilog Post-Route Timing Simulation with Aldec Active-HDL. Similar     
   message will be shown in the console panel of the Aldec Active-HDL simulator.                                  
                                                                                                                  
                                                                                                                  
How to run Place and Route, JEDEC generation, and Timing Analysis:                                                
1. Highlight the device on the left-side panel of the Project Navigator. On the right-side panel, double click on 
   Place and Route Design. This will bring the design through synthesis, mapping, and place and route.            
2. Highlight the device on the left-side panel of the Project Navigator. On the right-side panel, double click on 
   Generate Data File (JEDEC). This will generate the jedec file for the design.                                  
3. Once Place and Route is done, user can double click on Place and Route Trace Report on the right-side panel    
   to get the timing analysis result. 