var pairs =
{
"dqs":{"circuit":1,"input":1,"pin":1,"delay":1,"used":1,"write":1}
,"circuit":{"ddr":1}
,"ddr":{"memory":1}
,"architectures":{"supported":1}
,"inputs":{"dqsi":1}
,"dqsi":{"sclk":1}
,"sclk":{"read0":1,"dyndelay0":1}
,"read0":{"read1":1}
,"read1":{"readclksel0":1}
,"readclksel0":{"readclksel1":1}
,"readclksel1":{"readclksel2":1}
,"readclksel2":{"ddrdel":1}
,"ddrdel":{"eclk":1}
,"eclk":{"sclk":1}
,"dyndelay0":{"dyndelay1":1}
,"dyndelay1":{"dyndelay2":1}
,"dyndelay2":{"dyndelay3":1}
,"dyndelay3":{"dyndelay4":1}
,"dyndelay4":{"dyndelay5":1}
,"dyndelay5":{"dyndelay6":1}
,"dyndelay6":{"dyndelay7":1}
,"dyndelay7":{"rst":1}
,"rst":{"pause":1}
,"pause":{"rdloadn":1,"input":1}
,"rdloadn":{"rdmove":1}
,"rdmove":{"rddirection":1}
,"rddirection":{"wrloadn":1}
,"wrloadn":{"wrmove":1}
,"wrmove":{"wrdirection":1}
,"outputs":{"dwsr90":1}
,"dwsr90":{"dqsw":1}
,"dqsw":{"dqsw270":1}
,"dqsw270":{"rdpntr0":1,"during":1}
,"rdpntr0":{"rdpntr1":1}
,"rdpntr1":{"rdpntr2":1}
,"rdpntr2":{"wrpntr0":1}
,"wrpntr0":{"wrpntr1":1}
,"wrpntr1":{"wrpntr2":1}
,"wrpntr2":{"datavalid":1}
,"datavalid":{"burstdet":1}
,"burstdet":{"rdcflag":1}
,"rdcflag":{"wrcflag":1}
,"dqs_li_del_adj":{"plus":1}
,"plus":{"default":1,"minus":1}
,"default":{"minus":1}
,"dqs_li_del_val":{"integers":1}
,"integers":{"plus":1}
,"minus":{"default":1}
,"dqs_lo_del_adj":{"plus":1}
,"dqs_lo_del_val":{"integers":1}
,"write_leveling":{"values":1}
,"values":{"default":1}
,"dqsbufm":{"element":1}
,"element":{"used":1}
,"used":{"ddr3":1,"reset":1,"change":1,"read":1,"write":1,"dqs":1}
,"ddr3":{"ddr2":1}
,"ddr2":{"mode":1}
,"port":{"name":1}
,"input":{"dqs":1,"width":1,"stop":1}
,"delay":{"code":1,"ddr3":1,"read":1,"settings":1,"direction":1,"count":1,"counter":1,"write":1,"dqs":1,"clock":1}
,"code":{"ddrdll":1,"change":1}
,"edge":{"clock":1,"move":1}
,"system":{"clock":1}
,"reset":{"input":1,"back":1}
,"read":{"1:0":1,"input":1,"clock":1,"side":1,"pointer":1}
,"width":{"dqsbufm":1}
,"clock":{"pulse":1,"used":1}
,"pulse":{"selection":1,"required":1}
,"dyndelay":{"7:0":1}
,"dynamic":{"write":1}
,"write":{"leveling":1,"side":1,"pointer":1}
,"leveling":{"delay":1,"ddrdll":1}
,"stop":{"dqsw":1}
,"during":{"write":1}
,"ddrdll":{"delay":1}
,"back":{"degrees":1}
,"degrees":{"delay":1}
,"side":{"dqs":1}
,"required":{"change":1}
,"change":{"delay":1}
,"settings":{"value":1}
,"value":{"direction":1,"read":1,"write":1}
,"direction":{"sampled":1,"decrease":1}
,"sampled":{"falling":1}
,"falling":{"edge":1}
,"move":{"used":1}
,"indicates":{"delay":1}
,"decrease":{"delay":1}
,"count":{"increase":1,"used":1}
,"increase":{"delay":1}
,"counter":{"reached":1}
,"reached":{"max":1}
,"max":{"value":1}
,"rdpntr":{"2:0":1}
,"pointer":{"ififo":1}
,"ififo":{"module":1}
,"wrpntr":{"2:0":1}
,"signal":{"indicating":1}
,"indicating":{"start":1}
,"start":{"valid":1}
,"valid":{"data":1}
,"burst":{"detect":1}
,"detect":{"indicator":1}
}
;Search.control.loadWordPairs(pairs);
