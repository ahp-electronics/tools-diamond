var pairs =
{
"editing":{"goto":1}
,"goto":{"nop":1,"instruction":1,"branch":1}
,"nop":{"halt":1,"properties":1,"instruction":1,"step":1}
,"halt":{"properties":1,"step":1}
,"edit":{"goto":1,"nop":1,"halt":1}
,"instruction":{"properties":1,"output":1,"interruptible":1}
,"properties":{"dialog":1}
,"dialog":{"box":1}
,"box":{"allows":1}
,"allows":{"specify":1,"enter":1}
,"specify":{"destination":1,"whether":1,"nop":1,"output":1,"instruction":1}
,"destination":{"step":1}
,"step":{"goto":1,"essentially":1,"stops":1}
,"branch":{"type":1}
,"type":{"instruction":1}
,"output":{"signal":1,"values":1}
,"signal":{"values":1}
,"values":{"enter":1}
,"enter":{"comment":1}
,"comment":{"specify":1}
,"whether":{"instruction":1}
,"interruptible":{"exception":1}
,"exception":{"nop":1,"halt":1}
,"essentially":{"single-cycle":1}
,"single-cycle":{"delay":1}
,"delay":{"affect":1}
,"affect":{"outputs":1}
,"outputs":{"sequence":1}
,"sequence":{"execution":1,"controller":1}
,"stops":{"execution":1}
,"execution":{"sequence":1}
,"controller":{"instruction":1}
}
;Search.control.loadWordPairs(pairs);
