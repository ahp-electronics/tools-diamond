var pairs =
{
"library":{"primitives":1,"latticesc":1,"includes":1}
,"latticesc":{"primitives":1,"latticescm":1,"memory":1,"family":1,"sysconfig":1,"mpi":1,"purespeed":1,"devices":1,"qdr-ii":1,"sysclock":1,"ddr":1}
,"primitive":{"library":1}
,"includes":{"compatible":1}
,"compatible":{"fpga":1}
,"fpga":{"primitives":1}
,"primitives":{"supported":1}
,"supported":{"latticesc":1}
,"latticescm":{"device":1}
,"device":{"families":1}
,"adders":{"subtractors":1}
,"loadable":{"counters":1,"bidirectional":1,"down":1,"counter":1,"latch":1}
,"input":{"output":1,"data":1,"6ma":1,"buffer":1,"gate":1,"nand":1,"exclusive":1,"pic":1,"1-bit":1,"2-bit":1,"4-bit":1,"delay":1,"ddr":1}
,"output":{"buffers":1,"buffer":1,"pic":1,"1-bit":1,"2-bit":1,"4-bit":1,"ddr":1}
,"memory":{"primitives":1,"usage":1,"interface":1}
,"logic":{"gates":1,"2-bit":1,"bit":1,"high":1,"low":1,"control":1}
,"miscellaneous":{"logic":1}
,"pic":{"cells":1,"flip-flops":1,"latches":1,"shift":1,"area":1}
,"flip-flops":{"input":1,"output":1,"latched":1}
,"latches":{"input":1}
,"shift":{"registers":1,"register":1}
,"read-only":{"memory":1}
,"special":{"cells":1}
,"clock":{"manager":1,"enable":1,"used":1,"clear":1,"preset":1,"injection":1,"controller":1,"detect":1,"divider":1,"selection":1}
,"manager":{"pll":1}
,"pll":{"dll":1}
,"dual":{"data":1,"port":1}
,"data":{"rate":1,"mux":1,"select":1,"latch":1}
,"rate":{"cells":1}
,"further":{"information":1}
,"information":{"variety":1}
,"variety":{"technical":1}
,"technical":{"documents":1}
,"documents":{"latticesc":1}
,"family":{"available":1}
,"available":{"web":1}
,"web":{"site":1}
,"tn1080":{"latticesc":1}
,"sysconfig":{"usage":1}
,"usage":{"guide":1}
,"tn1085":{"latticesc":1}
,"mpi":{"system":1}
,"system":{"bus":1,"clock":1,"clocked":1}
,"tn1088":{"latticesc":1}
,"purespeed":{"usage":1}
,"tn1094":{"on-chip":1}
,"on-chip":{"memory":1}
,"guide":{"latticesc":1}
,"tn1096":{"latticesc":1}
,"qdr-ii":{"sram":1}
,"sram":{"memory":1}
,"interface":{"user\u2019s":1}
,"user\u2019s":{"guide":1}
,"tn1098":{"latticesc":1}
,"sysclock":{"pll":1}
,"dll":{"user\u2019s":1}
,"tn1099":{"latticesc":1}
,"ddr":{"ddr2":1}
,"ddr2":{"sdram":1}
,"sdram":{"memory":1}
,"tn1101":{"power":1}
,"power":{"calculations":1,"reset":1}
,"calculations":{"considerations":1}
,"considerations":{"latticesc":1}
,"bit":{"fast":1,"counter":1,"down":1,"positive":1,"single":1,"read-only":1}
,"fast":{"adder":1,"subtractor":1}
,"subtractor":{"two\u0027s":1}
,"two\u0027s":{"complement":1}
,"greater":{"equal":1}
,"equal":{"bit":1}
,"less":{"equal":1}
,"combinational":{"logic":1}
,"2-bit":{"bidirectional":1,"shift":1}
,"bidirectional":{"counter":1,"pull-down":1,"pull-up":1,"keepermode":1}
,"down":{"counter":1}
,"positive":{"edge":1,"clock":1,"level":1,"select":1}
,"edge":{"triggered":1,"clock":1,"clocked":1}
,"triggered":{"loadable":1,"flip-flop":1,"system":1}
,"counter":{"positive":1}
,"enable":{"gsr":1,"positive":1,"clear":1,"preset":1,"system":1,"used":1,"edge":1}
,"gsr":{"used":1}
,"used":{"clear":1,"preset":1,"input":1,"output":1,"selection":1}
,"level":{"asynchronous":1,"synchronous":1,"enable":1,"data":1,"loadable":1,"edge":1}
,"asynchronous":{"preset":1,"clear":1}
,"synchronous":{"clear":1,"preset":1,"release":1}
,"clear":{"clear":1,"overrides":1,"positive":1,"system":1,"edge":1,"used":1}
,"overrides":{"enable":1}
,"preset":{"preset":1,"overrides":1,"positive":1,"system":1,"edge":1,"used":1}
,"flip-flop":{"positive":1,"gsr":1,"input":1}
,"mux":{"positive":1,"gsr":1,"within":1}
,"select":{"positive":1,"gsr":1}
,"cmos":{"input":1}
,"6ma":{"sink":1}
,"sink":{"3ma":1}
,"3ma":{"source":1}
,"source":{"sinklim":1}
,"sinklim":{"output":1}
,"buffer":{"tristate":1,"pull-down":1,"pull-up":1}
,"tristate":{"bidirectional":1,"pull-down":1,"pull-up":1,"interface":1}
,"lvds":{"input":1,"output":1}
,"latch":{"gsr":1,"positive":1,"feeding":1}
,"16k":{"dual":1,"fifo":1,"pseudo":1}
,"port":{"block":1,"ram":1}
,"block":{"ram":1}
,"word":{"distributed":1,"bit":1}
,"distributed":{"dual":1,"single":1}
,"ram":{"within":1}
,"within":{"pfu":1}
,"pseudo":{"dual":1}
,"single":{"port":1,"delay":1}
,"nand":{"gate":1}
,"exclusive":{"gate":1}
,"high":{"generator":1,"performance":1}
,"low":{"generator":1}
,"lut-6":{"multiplexer":1}
,"16-input":{"mux":1}
,"pfu":{"slices":1,"used":1}
,"32-input":{"mux":1}
,"negative":{"level":1}
,"clocked":{"eclk":1,"sclk":1}
,"eclk":{"latch":1}
,"feeding":{"positive":1}
,"sclk":{"flip-flop":1}
,"1-bit":{"shift":1}
,"4-bit":{"shift":1}
,"128":{"word":1}
,"256":{"word":1}
,"injection":{"delay":1,"match":1}
,"delay":{"removal":1,"control":1,"cell":1}
,"dynamic":{"clock":1,"input":1}
,"selection":{"multiplexer":1,"positive":1}
,"enhanced":{"high":1}
,"performance":{"dynamic":1}
,"control":{"pll":1,"circuit":1}
,"internal":{"oscillator":1}
,"cell":{"dll":1}
,"time":{"reference":1}
,"reference":{"delay":1}
,"global":{"reset":1,"tristate":1}
,"jtag":{"logic":1}
,"2-input":{"mux":1}
,"pvt":{"monitor":1}
,"monitor":{"circuit":1}
,"circuit":{"controller":1}
,"readback":{"controller":1}
,"release":{"global":1}
,"reset":{"interface":1}
,"startup":{"controller":1}
}
;Search.control.loadWordPairs(pairs);
