var pairs =
{
"jtaga":{"primitive":1}
,"jtag":{"joint":1}
,"joint":{"test":1}
,"test":{"action":1,"idle":1,"clock":1,"mode":1,"data":1,"logic":1}
,"action":{"group":1}
,"group":{"controller":1}
,"architectures":{"supported":1}
,"inputs":{"tck":1,"boundary":1}
,"tck":{"tms":1,"test":1,"pins":1}
,"tms":{"tdi":1,"test":1,"tck":1}
,"tdi":{"psrout1":1,"test":1,"tms":1,"scanout":1}
,"psrout1":{"psrout2":1}
,"psrout2":{"psrout3":1}
,"psrout3":{"jtdo1":1}
,"jtdo1":{"jtdo2":1}
,"jtdo2":{"jtdo3":1}
,"jtdo3":{"jtdo4":1}
,"jtdo4":{"jtdo5":1}
,"jtdo5":{"jtdo6":1}
,"jtdo6":{"jtdo7":1}
,"jtdo7":{"jtdo8":1}
,"outputs":{"tdo":1,"last":1,"boundary":1}
,"tdo":{"treset":1,"four":1}
,"treset":{"psrsftn":1}
,"psrsftn":{"psrcap":1}
,"psrcap":{"psrenable1":1}
,"psrenable1":{"psrenable2":1}
,"psrenable2":{"psrenable3":1}
,"psrenable3":{"scanenable1":1}
,"scanenable1":{"scanenable2":1}
,"scanenable2":{"scanenable3":1}
,"scanenable3":{"scanenable4":1}
,"scanenable4":{"scanenable5":1}
,"scanenable5":{"scanenable6":1}
,"scanenable6":{"scanenable7":1}
,"scanenable7":{"scanenable8":1}
,"scanenable8":{"scani":1}
,"scani":{"jtck":1}
,"jtck":{"jtdi":1}
,"jtdi":{"jshift":1}
,"jshift":{"jupdate":1}
,"jupdate":{"jrstn":1}
,"jrstn":{"jce1":1}
,"jce1":{"jce2":1}
,"jce2":{"jce3":1}
,"jce3":{"jce4":1}
,"jce4":{"jce5":1}
,"jce5":{"jce6":1}
,"jce6":{"jce7":1}
,"jce7":{"jce8":1}
,"jce8":{"jrti1":1}
,"jrti1":{"jrti2":1}
,"jrti2":{"jrti3":1}
,"jrti3":{"jrti4":1}
,"jrti4":{"jrti5":1}
,"jrti5":{"jrti6":1}
,"jrti6":{"jrti7":1}
,"jrti7":{"jrti8":1}
,"primitive":{"provides":1,"tdi":1}
,"provides":{"control":1}
,"control":{"interconnect":1}
,"interconnect":{"circuit":1}
,"circuit":{"used":1}
,"used":{"boundary":1,"testing":1}
,"boundary":{"scan":1,"scan-ring":1}
,"scan":{"function":1,"chain":1,"rings":1,"block":1,"macro":1,"ring":1,"1:8":1,"clock":1,"instructions":1}
,"function":{"function":1,"allows":1}
,"allows":{"testing":1}
,"testing":{"increasingly":1,"system":1}
,"increasingly":{"complex":1}
,"complex":{"ics":1}
,"ics":{"packages":1}
,"packages":{"latticesc":1}
,"latticesc":{"device":1}
,"device":{"enhanced":1}
,"enhanced":{"interface":1}
,"interface":{"capability":1,"pins":1}
,"capability":{"plc":1}
,"plc":{"array":1}
,"array":{"increased":1}
,"increased":{"scan":1}
,"chain":{"connectivity":1}
,"connectivity":{"tap":1}
,"tap":{"state":1}
,"state":{"machine":1,"programmable":1,"scan":1,"plc_scan_ring":1,"during":1}
,"machine":{"flags":1}
,"flags":{"shift":1}
,"shift":{"capture":1,"data":1}
,"capture":{"update":1,"data":1,"state":1}
,"update":{"reset":1,"specific":1,"data":1}
,"reset":{"run":1,"state":1}
,"run":{"test":1}
,"example":{"pin":1}
,"pin":{"functions":1,"used":1}
,"clock":{"tck":1,"output":1,"enable":1}
,"mode":{"select":1}
,"select":{"tms":1}
,"data":{"tdi":1,"tdo":1,"register":1,"state":1,"output":1}
,"four":{"interface":1}
,"pins":{"primitive":1,"connected":1}
,"connected":{"dedicated":1}
,"dedicated":{"pads":1}
,"pads":{"device":1}
,"psrout":{"1:3":1}
,"1:3":{"jtdo":1,"scanenable":1,"scan":1}
,"jtdo":{"1:8":1}
,"user":{"boundary":1,"scan":1}
,"scan-ring":{"outputs":1}
,"last":{"registers":1}
,"registers":{"user":1}
,"rings":{"boundary":1}
,"block":{"inputs":1}
,"macro":{"based":1,"routing":1,"test":1,"output":1,"shift":1,"capture":1,"scan":1,"update":1,"run":1}
,"based":{"instruction":1}
,"instruction":{"loaded":1}
,"active":{"high":1,"low":1}
,"high":{"output":1,"boundary":1,"outputs":1,"upon":1}
,"output":{"boundary":1,"high":1,"low":1,"equals":1,"scan":1}
,"routing":{"output":1}
,"logic":{"reset":1}
,"shift_not":{"data":1}
,"low":{"output":1,"boundary":1}
,"programmable":{"scan":1}
,"ring":{"instructions":1}
,"instructions":{"loaded":1,"plc_scan_ring":1,"respectively":1}
,"psrenable":{"1:3":1}
,"scanenable":{"1:8":1}
,"enable":{"flag":1}
,"equals":{"high":1}
,"upon":{"update":1}
,"specific":{"instructions":1}
,"plc_scan_ring":{"1:3":1,"scan":1}
,"1:8":{"respectively":1,"instructions":1}
,"private":{"pin":1}
,"system":{"bus":1}
,"bus":{"multiplexes":1}
,"multiplexes":{"tdi":1}
,"scanout":{"11:14":1}
,"jce":{"1:8":1}
,"during":{"scan":1}
,"jrti":{"1:8":1}
,"idle":{"state":1}
}
;Search.control.loadWordPairs(pairs);
