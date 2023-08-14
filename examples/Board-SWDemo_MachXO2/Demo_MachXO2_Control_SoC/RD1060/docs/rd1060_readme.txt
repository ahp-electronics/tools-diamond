						PWM FAN CONTROLLER Reference Design
===============================================================================
File List ( 8 files )
1. /docs/rd1060.pdf                         			 				--> design document
   /docs/rd1060_readme.txt                  			 				--> this document
2. /project/FanControllerWB.syn  									        --> project file
   /project/FanControllerWB.lpf   									      --> preference file
   /project/fan_controller_wb_tb_tff.udo   						    --> Functional Simulation script
   /project/fan_controller_wb_tb_tf.udo   	 						  --> Timing Simulation script
3. /source/fan_controller_wb.v									 					--> Top file(Verilog)
4. fan_controller_wb_tb.v										 							--> Testbench bench

PAR design with ispLEVER
1. Unzip the RD1060_rev01.0.zip file using the existing folder names.
2. Open the ispLEVER 7.2 SP02 Project Navigator.
3. From the 'File' menu, select 'Open Project' and browse to the desired project file.
5. Double click *.syn file
6. Highlight the device on the left panel of the Project Navigator. In the right-hand panel, double
	 -click 'Fit Design' or 'PAR'.

Running simulation
1.In the Project Navigator, highlight fan_controller_wb_tb.v in the left up window.
2.For functional simulation, double-click 'Aldec Verilog Functional Simulation'.
	The simulator will be brought up. If prompted, click yes to overwrite the existing file.
3.For timing simulation, double-click 'Aldec Verilog Timing Simulation'.