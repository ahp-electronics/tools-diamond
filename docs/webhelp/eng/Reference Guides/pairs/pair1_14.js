var pairs =
{
"library":{"primitives":1,"latticexp2":1,"includes":1}
,"latticexp2":{"primitives":1,"device":1,"memory":1,"family":1,"configuration":1,"high-speed":1,"soft":1,"sysclock":1,"sysconfig":1,"sysdsp":1,"sysio":1,"devices":1}
,"primitive":{"library":1}
,"includes":{"compatible":1}
,"compatible":{"fpga":1}
,"fpga":{"primitives":1}
,"primitives":{"supported":1}
,"supported":{"latticexp2":1}
,"device":{"family":1}
,"arithmetic":{"functions":1}
,"loadable":{"counters":1,"bidirectional":1,"down":1,"counter":1}
,"input":{"output":1,"data":1,"6ma":1,"buffer":1,"gate":1,"nand":1,"exclusive":1,"pic":1,"full":1,"dqs":1,"gearing":1}
,"output":{"buffers":1,"buffer":1,"complementary":1,"pic":1,"registers":1,"gearing":1}
,"memory":{"primitives":1,"usage":1,"dqs":1}
,"logic":{"gates":1,"2-bit":1,"bit":1,"high":1,"low":1}
,"miscellaneous":{"logic":1}
,"multipliers":{"dsp":1}
,"dsp":{"blocks":1}
,"pic":{"cells":1,"flip-flops":1,"latches":1,"area":1}
,"flip-flops":{"input":1,"output":1}
,"latches":{"input":1}
,"read-only":{"memory":1}
,"special":{"cells":1}
,"clock":{"manager":1,"enable":1,"used":1,"clear":1,"preset":1,"divider":1,"selection":1,"polarity":1,"transfer":1,"cycle":1}
,"manager":{"pll":1}
,"pll":{"dll":1,"design":1}
,"combinatorial":{"primitives":1}
,"dual":{"data":1,"port":1}
,"data":{"rate":1,"mux":1,"select":1,"latch":1}
,"rate":{"cells":1}
,"further":{"information":1}
,"information":{"variety":1}
,"variety":{"technical":1}
,"technical":{"notes":1}
,"notes":{"latticexp2":1}
,"family":{"available":1}
,"available":{"web":1}
,"web":{"site":1}
,"tn1142":{"latticexp2":1}
,"configuration":{"encryption":1,"clock":1}
,"encryption":{"security":1}
,"security":{"usage":1}
,"usage":{"guide":1}
,"tn1138":{"latticexp2":1}
,"high-speed":{"interface":1}
,"tn1137":{"latticexp2":1}
,"tn1130":{"latticexp2":1}
,"soft":{"error":1}
,"error":{"detection":1}
,"detection":{"sed":1}
,"sed":{"usage":1,"basic":1}
,"tn1126":{"latticexp2":1}
,"sysclock":{"pll":1}
,"design":{"usage":1}
,"tn1141":{"latticexp2":1}
,"sysconfig":{"usage":1}
,"tn1140":{"latticexp2":1}
,"sysdsp":{"usage":1}
,"tn1136":{"latticexp2":1}
,"sysio":{"usage":1}
,"tn1139":{"power":1}
,"power":{"estimation":1,"reset":1}
,"estimation":{"management":1}
,"management":{"latticexp2":1}
,"bit":{"fast":1,"subtractor":1,"down":1,"counter":1,"positive":1,"read-only":1}
,"fast":{"adders":1,"adder":1}
,"adders":{"subtractors":1}
,"adder":{"subtractor":1}
,"subtractor":{"two\u0027s":1}
,"two\u0027s":{"complement":1}
,"2x2":{"multiplier":1}
,"multiplier":{"dsp":1,"add":1,"accumulate":1,"multipliers":1}
,"greater":{"equal":1}
,"equal":{"bit":1}
,"less":{"equal":1}
,"combinational":{"logic":1}
,"2-bit":{"bidirectional":1}
,"bidirectional":{"counter":1,"pull-down":1,"pull-up":1,"keepermode":1}
,"down":{"counter":1}
,"positive":{"edge":1,"clock":1,"level":1,"select":1}
,"edge":{"triggered":1,"clock":1}
,"triggered":{"loadable":1,"flip-flop":1}
,"counter":{"positive":1}
,"enable":{"gsr":1,"positive":1,"clear":1,"preset":1,"system":1,"used":1,"edge":1}
,"gsr":{"used":1}
,"used":{"clear":1,"preset":1,"input":1,"output":1,"ddr":1,"selection":1}
,"level":{"asynchronous":1,"synchronous":1,"enable":1,"data":1}
,"asynchronous":{"preset":1,"clear":1}
,"synchronous":{"clear":1,"preset":1,"release":1}
,"clear":{"clear":1,"overrides":1,"positive":1,"system":1,"edge":1}
,"overrides":{"enable":1}
,"preset":{"preset":1,"overrides":1,"positive":1,"system":1,"edge":1}
,"flip-flop":{"positive":1,"gsr":1,"input":1}
,"mux":{"positive":1,"gsr":1,"within":1}
,"select":{"positive":1}
,"cmos":{"input":1}
,"6ma":{"sink":1}
,"sink":{"3ma":1}
,"3ma":{"source":1}
,"source":{"sinklim":1}
,"sinklim":{"output":1}
,"buffer":{"tristate":1,"pull-down":1,"pull-up":1}
,"tristate":{"bidirectional":1,"pull-down":1,"pull-up":1}
,"lvds":{"input":1,"output":1}
,"complementary":{"buffer":1}
,"true":{"dual":1}
,"port":{"block":1,"ram":1}
,"block":{"ram":1}
,"distributed":{"pseudo":1,"single":1}
,"pseudo":{"dual":1}
,"ram":{"within":1}
,"within":{"pfu":1}
,"single":{"port":1}
,"sspi":{"tag":1}
,"tag":{"memory":1}
,"store":{"flash":1}
,"flash":{"primitive":1}
,"nand":{"gate":1}
,"exclusive":{"gate":1}
,"high":{"generator":1}
,"low":{"generator":1}
,"lut-6":{"multiplexer":1}
,"16-input":{"mux":1}
,"pfu":{"slices":1,"used":1}
,"32-input":{"mux":1}
,"18x18":{"multiplier":1}
,"add":{"subtract":1}
,"subtract":{"multipliers":1,"sum":1}
,"sum":{"multipliers":1}
,"accumulate":{"multipliers":1}
,"36x36":{"multiplier":1}
,"9x9":{"multiplier":1}
,"system":{"clock":1}
,"latch":{"positive":1}
,"word":{"bit":1}
,"128":{"word":1}
,"256":{"word":1}
,"dynamic":{"clock":1,"delay":1}
,"selection":{"multiplexer":1,"logic":1,"positive":1}
,"complex":{"pll":1}
,"enhanced":{"pll":1}
,"oscillator":{"configuration":1}
,"4-input":{"look":1}
,"look":{"table":1}
,"5-input":{"look":1}
,"6-input":{"look":1}
,"7-input":{"look":1}
,"8-input":{"look":1}
,"dqs":{"delay":1,"dll":1,"system":1}
,"delay":{"function":1,"pio":1}
,"function":{"clock":1}
,"polarity":{"selection":1}
,"dll":{"used":1}
,"ddr":{"memory":1,"generic":1,"input":1,"output":1}
,"generic":{"input":1,"output":1}
,"full":{"clock":1}
,"transfer":{"gearbox":1,"registers":1}
,"registers":{"full":1,"half":1}
,"cycle":{"transfer":1}
,"half":{"clock":1}
,"gearing":{"ratio":1}
,"global":{"reset":1}
,"xp2":{"wake-up":1,"sed":1,"sspi":1,"store":1}
,"wake-up":{"controller":1}
,"jtag":{"joint":1}
,"joint":{"test":1}
,"test":{"action":1}
,"action":{"group":1}
,"group":{"controller":1}
,"2-input":{"mux":1}
,"basic":{"shot":1}
,"shot":{"mode":1}
,"release":{"global":1}
,"reset":{"interface":1}
,"startup":{"controller":1}
}
;Search.control.loadWordPairs(pairs);
