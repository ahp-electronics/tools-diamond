var pairs =
{
"coarse":{"hdl":1,"cdel0":1}
,"hdl":{"attribute":1}
,"cdel0":{"cdel1":1}
,"cdel1":{"cdel2":1}
,"cdel2":{"cdel3":1}
,"course":{"delay":1}
,"delay":{"attached":1,"element":1,"parameters":1}
,"attached":{"delay":1}
,"element":{"attribute":1}
,"attribute":{"takes":1}
,"takes":{"cdel":1}
,"cdel":{"delay":1}
,"parameters":{"opposite":1}
,"opposite":{"fine":1}
,"device":{"support":1}
,"adding":{"fpga":1}
,"fpga":{"attributes":1}
,"attributes":{"hdl":1}
}
;Search.control.loadWordPairs(pairs);
