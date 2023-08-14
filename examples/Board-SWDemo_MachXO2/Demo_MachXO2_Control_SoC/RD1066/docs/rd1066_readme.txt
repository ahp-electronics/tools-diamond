    Simple Sigma-Delta ADC Reference Design
=====================================================================================

File List (34 files):

1.  \RD1066\docs\rd1066_readme.txt                 -->  read me file (this file)
2.  \RD1066\docs\rd1066.pdf                        -->  Simple Sigma-Delta ADC design document

3.  \RD1066\project\xo\verilog\adc_refdes.lpf      -->  ispLEVER preference file
4.  \RD1066\project\xo\verilog\adc_refdes.syn      -->  ispLEVER project file
5.  \RD1066\project\xo\verilog\adc_refdes.sty      -->  ispLEVER system file
6.  \RD1066\project\xo\verilog\adc_tf_tff.udo      -->  functional simulation script file
7.  \RD1066\project\xo\verilog\adc_tf_tfr.udo      -->  post-route functional sim. script file
8.  \RD1066\project\xo\verilog\adc_tf_tf.udo       -->  post-route timing sim. script file
9.  \RD1066\project\xp2\verilog\adc_refdes.lpf     -->  ispLEVER preference file
10. \RD1066\project\xp2\verilog\adc_refdes.syn     -->  ispLEVER project file
11. \RD1066\project\xp2\verilog\adc_refdes.sty     -->  ispLEVER system file
12. \RD1066\project\xp2\verilog\adc_tf_tff.udo     -->  functional simulation script file
13. \RD1066\project\xp2\verilog\adc_tf_tfr.udo     -->  post-route functional sim. script file
14. \RD1066\project\xp2\verilog\adc_tf_tf.udo      -->  post-route timing sim. script file
15. \RD1066\source\verilog\adc_top.v               -->  top level source code file
16. \RD1066\source\verilog\sigmadelta_adc.v        -->  source file
17. \RD1066\source\verilog\box_ave.v               -->  source file
18. \RD1066\testbench\verilog\adc_tf.v             -->  testbench for simulation

19. \RD1066\project\xo\vhdl\adc_refdes.lpf         -->  ispLEVER preference file
20. \RD1066\project\xo\vhdl\adc_refdes.syn         -->  ispLEVER project file
21. \RD1066\project\xo\vhdl\adc_refdes.sty         -->  ispLEVER system file
22. \RD1066\project\xo\vhdl\adc_tf_vhdf.udo        -->  functional simulation script file
23. \RD1066\project\xo\vhdl\adc_tf_vhdr.udo        -->  post-route functional sim. script file
24. \RD1066\project\xo\vhdl\adc_tf_vhd.udo         -->  post-route timing sim. script file
25. \RD1066\project\xp2\vhdl\adc_refdes.lpf        -->  ispLEVER preference file
26. \RD1066\project\xp2\vhdl\adc_refdes.syn        -->  ispLEVER project file
27. \RD1066\project\xp2\vhdl\adc_refdes.sty        -->  ispLEVER system file
28. \RD1066\project\xp2\vhdl\adc_tf_vhdf.udo       -->  functional simulation script file
29. \RD1066\project\xp2\vhdl\adc_tf_vhdr.udo       -->  post-route functional sim. script file
30. \RD1066\project\xp2\vhdl\adc_tf_vhd.udo        -->  post-route timing sim. script file
31. \RD1066\source\vhdl\adc_top.vhd                -->  top level source code file
32. \RD1066\source\vhdl\sigmadelta_adc.vhd         -->  source file
33. \RD1066\source\vhdl\box_ave.vhd                -->  source file
34. \RD1066\testbench\vhdl\adc_tf.vhd              -->  testbench for simulation

(Note:  The following procedures follow a Verilog design flow.
For VHDL designs, the flow is essentially the same,
with the exception of the directory paths.)

How to open the ispLEVER project:
1.  Unzip the RD1066_revyy.y.zip file using the existing folder names, where the yy.y
indicates the current version of the zip file.
2.  Open the ispLEVER project Navigator.
3.  In the File menu, click on Open project, then browse to the directory where the reference
design was unzipped to.  Select the RD1066\project\xo(xp2)\Verilog\adc_refdes.syn file and click open.

How to run simulation:
1.  In the project Navigator, highlight the ..\..\..\testbench\Verilog\adc_tf.v file on the
left-side panel, user will see 3 simulation options on the right panel.
2.  For functional simulation, double click on Verilog Functional Simulation with
Aldec Active-HDL. Aldec simulator will be brought up, click yes to overwrite the
existing file.
3.  Functional simulation will run until completed and the simulation should end
at 2.2ms without error and the console panel of the Aledc Active-HDL simulator will display:
...
# KERNEL: Time:   16472 ns  digital output =   0
# KERNEL: Time:  147544 ns  digital output =  15
# KERNEL: Time:  278616 ns  digital output =  55
# KERNEL: Time:  409688 ns  digital output =  87
# KERNEL: Time:  540760 ns  digital output = 120
# KERNEL: Time:  671832 ns  digital output = 151
# KERNEL: Time:  802904 ns  digital output = 183
# KERNEL: Time:  933976 ns  digital output = 215
# KERNEL: Time: 1065048 ns  digital output = 246
# KERNEL: Time: 1196120 ns  digital output =  12
# KERNEL: Time: 1327192 ns  digital output =  56
# KERNEL: Time: 1458264 ns  digital output =  88
# KERNEL: Time: 1589336 ns  digital output = 120
# KERNEL: Time: 1720408 ns  digital output = 151
# KERNEL: Time: 1851480 ns  digital output = 183
# KERNEL: Time: 1982552 ns  digital output = 215
# KERNEL: Time: 2113624 ns  digital output = 246
...

4.  For timing simulation, double click on Verilog Post-Route Timing Simulation
with Aldec Active-HDL. Similar message will be shown in the console panel of the
Aldec Active-HDL simulator.
5.  For post-route functional simulation, double click on Verilog Post-Route Functional
Simulation with Aldec Active-HDL. Similar message will be shown in the console panel of
the Aldec Active-HDL simulator too.

How to run Place and Route, JEDEC generation, and Timing Analysis:
1. Highlight the device on the left-side panel of the project Navigator. On the
right-side panel, double click on Place and Route Design. This will bring the
design through synthesis, mapping, and place and route.
2. Highlight the device on the left-side panel of the project Navigator. On the
right-side panel, double click on Generate Data File (JEDEC). This will generate
the jedec file for the design.
3. Once Place and Route is done, user can double click on Place and Route Trace
Report on the right-side panel to get the timing analysis result.
