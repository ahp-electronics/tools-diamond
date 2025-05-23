var pairs =
{
"spreadsheet":{"view":1}
,"constraints":{"recorded":1,"originate":1,"design":1,"preferences":1}
,"recorded":{"spreadsheet":1}
,"view":{"presents":1,"except":1,"pullmode":1}
,"presents":{"union":1}
,"union":{"constraints":1,"parameters":1}
,"originate":{"hdl":1}
,"hdl":{"schematic":1,"port":1,"exception":1,"attributes":1}
,"schematic":{"source":1,"constraint":1}
,"source":{"logical":1,"constraint":1,"parameter":1,"file":1}
,"logical":{"preference":1}
,"preference":{"file":1,"sheet":1,".lpf":1,"spreadsheet":1,"includes":1,"appear":1,"combines":1}
,"file":{".lpf":1,"record":1,"precedence":1,"iobuf":1,"hdl":1,"completely":1,"new":1}
,".lpf":{"cell":1,"file":1}
,"cell":{"preference":1}
,"sheet":{"color-coded":1}
,"color-coded":{"reflect":1}
,"reflect":{"origin":1}
,"origin":{"status":1}
,"default":{"referenced":1}
,"referenced":{"hdl-based":1}
,"hdl-based":{"source":1}
,"constraint":{"modified":1,"sources":1,"declaration":1,"delete":1,"loc":1}
,"modified":{"diamond":1,"within":1}
,"diamond":{"add":1,"overwrite":1,"write":1}
,"add":{"preference":1}
,"record":{"change":1}
,"change":{"preferences":1}
,"preferences":{".lpf":1,"parameters":1}
,"precedence":{"constraint":1}
,"sources":{"design":1}
,"design":{"mapper":1,"implemented":1}
,"mapper":{"ignore":1}
,"ignore":{"conflicting":1}
,"conflicting":{"constraints":1,"hdl":1,"iobuf":1}
,"implemented":{"diamond":1}
,"overwrite":{"original":1}
,"original":{"hdl":1,"constraint":1}
,"declaration":{"restore":1}
,"restore":{"original":1}
,"delete":{"preference":1}
,"parameters":{"possible":1,".lpf":1}
,"possible":{"therefore":1}
,"therefore":{"assign":1}
,"assign":{"parameter":1}
,"parameter":{"hdl":1,"preference":1,"pullmode":1,"modified":1,"made":1}
,"except":{"iobuf":1}
,"iobuf":{"attributes":1,"preference":1,"port":1,"constraints":1}
,"attributes":{"diamond":1,"exist":1,"constraints":1}
,"write":{"union":1}
,"exist":{".lpf":1}
,"port":{"port":1,"group":1,"given":1,"pullmode":1,"my_signal":1}
,"group":{".lpf":1}
,"completely":{"override":1}
,"override":{"hdl":1}
,"exception":{"rue":1}
,"rue":{"io_type":1}
,"io_type":{"placement":1,"lvcmos12":1,"attribute":1}
,"placement":{"constraint":1}
,"loc":{"overriden":1}
,"example":{"iobuf":1}
,"includes":{"parameter":1}
,"pullmode":{"port":1,"parameter":1,"none":1}
,"given":{"schematic-based":1}
,"schematic-based":{"io_type":1}
,"lvcmos12":{"attribute":1,"pullmode":1}
,"attribute":{"port":1,"source":1}
,"within":{"spreadsheet":1}
,"none":{"following":1}
,"following":{"preference":1}
,"appear":{".lpf":1}
,"my_signal":{"io_type":1}
,"combines":{"io_type":1}
,"new":{"pullmode":1}
,"made":{"spreadsheet":1}
}
;Search.control.loadWordPairs(pairs);
