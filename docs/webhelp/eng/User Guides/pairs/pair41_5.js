var pairs =
{
"bit":{"generation":1}
,"input":{"files":1,"bitstream":1,"file":1}
,"bitstream":{"files":1,"file":1}
,"file":{"process":1,".ncd":1,"bit":1,"file":1,"physical":1}
,"generation":{"input":1,"active":1,"output":1}
,"following":{"files":1}
,"files":{"input":1}
,"process":{"bitgen":1}
,"bitgen":{"program":1}
,"native":{"circuit":1}
,"circuit":{"description":1}
,"description":{"file":1,"design":1}
,".ncd":{"input":1}
,"active":{"fully":1}
,"fully":{"routed":1}
,"routed":{"ncd":1}
,"ncd":{"file":1}
,"physical":{"description":1}
,"design":{"terms":1}
,"terms":{"components":1}
,"components":{"target":1}
,"target":{"device":1}
,"output":{"files":1}
}
;Search.control.loadWordPairs(pairs);
