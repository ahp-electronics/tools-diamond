var pairs =
{
"schematic":{"editor":1,"design":1,"file":1}
,"opening":{"schematic":1,"existing":1}
,"open":{"schematic":1,"existing":1}
,"editor":{"either":1}
,"either":{"open":1}
,"existing":{"schematic":1}
,"design":{"opening":1,"create":1}
,"create":{"new":1}
,"new":{"schematic":1,"source":1}
,"file":{"creating":1}
,"creating":{"new":1}
,"source":{"file":1}
}
;Search.control.loadWordPairs(pairs);
