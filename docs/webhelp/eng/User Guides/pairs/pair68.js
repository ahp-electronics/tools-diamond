var pairs =
{
"cleaning":{"processes":1}
,"process":{"clean":1,"command":1,"view":1}
,"clean":{"process":1}
,"command":{"reset":1,"returns":1}
,"reset":{"processes":1}
,"processes":{"shown":1,"back":1}
,"shown":{"process":1}
,"view":{"command":1}
,"returns":{"status":1}
,"status":{"processes":1}
,"back":{"initial":1}
,"initial":{"state":1}
}
;Search.control.loadWordPairs(pairs);
