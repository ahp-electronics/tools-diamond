var pairs =
{
"opening":{"symbol":1,"existing":1}
,"symbol":{"library":1}
,"open":{"symbol":1,"existing":1}
,"library":{"either":1,"opening":1,"create":1,"file":1}
,"either":{"open":1}
,"existing":{"library":1,"symbol":1}
,"create":{"new":1}
,"new":{"library":1,"symbol":1}
,"file":{"creating":1}
,"creating":{"new":1}
}
;Search.control.loadWordPairs(pairs);
