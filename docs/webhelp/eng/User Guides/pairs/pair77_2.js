var pairs =
{
"schematic":{"editor":1,"drag":1}
,"changing":{"length":1,"wire":1}
,"length":{"direction":1}
,"wire":{"length":1,"ends":1,"end":1,"cursor":1,"instead":1,"overlapping":1}
,"wires":{"placed":1,"want":1,"selected":1,"close":1,"dragging":1,"adjust":1}
,"placed":{"schematic":1}
,"drag":{"wire":1,"linked":1}
,"ends":{"lengthen":1}
,"lengthen":{"shorten":1}
,"shorten":{"change":1,"wires":1}
,"change":{"routing":1,"wire":1}
,"routing":{"directions":1}
,"choose":{"edit":1}
,"edit":{"add":1,"drag":1}
,"add":{"select":1}
,"select":{"click":1,"wires":1}
,"click":{"drawing":1,"drag":1}
,"drawing":{"toolbar":1}
,"want":{"change":1}
,"place":{"mouse":1}
,"mouse":{"cursor":1}
,"cursor":{"near":1,"changes":1}
,"near":{"wire":1}
,"end":{"selected":1,"desired":1,"drag":1,"moves":1}
,"selected":{"wire":1,"wires":1}
,"changes":{"click":1}
,"desired":{"place":1}
,"node":{"connected":1}
,"connected":{"wire":1}
,"linked":{"connection":1}
,"connection":{"dragging":1}
,"dragging":{"wire":1,"requires":1}
,"moves":{"entire":1}
,"entire":{"wire":1}
,"instead":{"changing":1}
,"cannot":{"shorten":1}
,"close":{"shortening":1}
,"shortening":{"wires":1}
,"requires":{"enough":1}
,"enough":{"space":1}
,"space":{"avoid":1}
,"avoid":{"wire":1}
,"overlapping":{"cases":1}
,"cases":{"shorten":1}
,"adjust":{"positions":1}
,"positions":{"shortening":1}
}
;Search.control.loadWordPairs(pairs);
