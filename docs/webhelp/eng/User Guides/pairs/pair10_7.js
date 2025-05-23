var pairs =
{
"edit":{"menu":1,"process":1,"paste":1,"move":1}
,"menu":{"consists":1,"commands":1,"adding":1}
,"consists":{"following":1}
,"following":{"commands":1}
,"allows":{"reverse":1}
,"reverse":{"edit":1,"commands":1,"changes":1}
,"process":{"undo":1}
,"undo":{"command":1,"log":1,"sequence":1}
,"command":{"operates":1,"backs":1,"redo":1,"forward":1,"cannot":1,"pasted":1,"edit":1,"selected":1,"combined":1,"produce":1}
,"operates":{"commands":1}
,"commands":{"change":1}
,"change":{"schematic":1,"drawing":1}
,"schematic":{"symbol":1,"editor":1,"saved":1,"places":1,"clipboard":1,"select":1,"drawing":1,"move":1}
,"symbol":{"cut":1,"editor":1,"schematic":1,"instances":1,"different":1,"command":1,"origin":1,"expand":1,"adding":1,"type":1,"overview":1}
,"cut":{"paste":1}
,"paste":{"add":1,"edit":1}
,"add":{"move":1,"menu":1,"symbol":1}
,"move":{"drag":1,"mode":1,"items":1,"selecting":1,"cursor":1,"item":1,"object":1}
,"drag":{"attribute":1,"mode":1,"function":1}
,"attribute":{"window":1,"names":1,"values":1}
,"window":{"object":1,"symbol":1}
,"object":{"properties":1,"remains":1,"reflected":1,"rotated":1}
,"properties":{"clear":1}
,"clear":{"reverse":1}
,"backs":{"event":1}
,"event":{"time":1}
,"time":{"issued":1,"mirror":1,"rotate":1}
,"issued":{"reverse":1}
,"changes":{"file":1,"cannot":1,"current":1}
,"file":{"opened":1,"discards":1}
,"opened":{"saved":1}
,"saved":{"saving":1,"once":1}
,"saving":{"file":1}
,"discards":{"record":1}
,"record":{"preceding":1}
,"preceding":{"changes":1}
,"cannot":{"undone":1,"recover":1}
,"undone":{"redone":1,"events":1,"commands":1}
,"editor":{"symbol":1,"drag":1}
,"keyboard":{"ctrl":1,"delete":1}
,"reverses":{"effects":1}
,"effects":{"undo":1}
,"redo":{"command":1,"log":1}
,"forward":{"playing":1}
,"playing":{"back":1}
,"back":{"undone":1}
,"events":{"until":1}
,"until":{"reaches":1}
,"reaches":{"end":1}
,"end":{"undo":1}
,"log":{"point":1,"discarded":1}
,"point":{"first":1}
,"first":{"undo":1}
,"sequence":{"issued":1}
,"discarded":{"whenever":1,"redo":1}
,"whenever":{"current":1}
,"current":{"version":1,"origin":1}
,"version":{"symbol":1}
,"once":{"log":1}
,"recover":{"undone":1}
,"removes":{"data":1}
,"data":{"nets":1}
,"nets":{"graphics":1}
,"graphics":{"symbols":1}
,"symbols":{"text":1,"wires":1}
,"text":{"schematic":1}
,"places":{"clipboard":1,"contents":1}
,"clipboard":{"previous":1,"erased":1,"schematic":1,"items":1,"clipboard\u0027s":1}
,"previous":{"contents":1}
,"contents":{"clipboard":1,"attached":1,"right":1,"affected":1}
,"erased":{"items":1}
,"items":{"pasted":1,"schematic":1,"copied":1,"three":1,"already":1}
,"pasted":{"clipboard":1,"schematic":1,"contents":1}
,"copies":{"items":1}
,"select":{"command":1}
,"attached":{"mouse":1,"cursor":1}
,"mouse":{"pointer":1,"button":1}
,"pointer":{"click":1,"place":1}
,"click":{"mouse":1}
,"place":{"contents":1,"effect":1,"cursor":1}
,"right":{"spot":1,"mouse":1}
,"finds":{"wire":1}
,"wire":{"symbol":1,"segment":1,"selected":1}
,"instances":{"schematic":1}
,"deletes":{"selected":1}
,"selected":{"items":1,"item":1,"mirror":1,"rotate":1}
,"drawing":{"deleted":1}
,"deleted":{"items":1}
,"copied":{"clipboard":1}
,"clipboard\u0027s":{"contents":1}
,"selects":{"items":1,"whole":1,"attribute":1,"symbol":1}
,"opens":{"menu":1}
,"adding":{"objects":1,"attribute":1}
,"objects":{"add":1,"rest":1}
,"enables":{"move":1,"drag":1}
,"mode":{"moves":1}
,"moves":{"elements":1,"portions":1}
,"elements":{"wire":1}
,"different":{"location":1}
,"location":{"within":1}
,"within":{"schematic":1}
,"three":{"ways":1}
,"ways":{"moving":1}
,"moving":{"symbols":1}
,"portions":{"objects":1}
,"rest":{"object":1}
,"remains":{"place":1}
,"effect":{"stretch":1}
,"stretch":{"reposition":1}
,"reposition":{"item":1}
,"item":{"altering":1,"move":1,"press":1,"desired":1}
,"altering":{"basic":1}
,"basic":{"shape":1}
,"shape":{"direction":1}
,"function":{"move":1}
,"selecting":{"item":1}
,"cursor":{"selected":1,"becomes":1,"add":1}
,"press":{"right":1}
,"button":{"move":1}
,"desired":{"place":1}
,"becomes":{"cross":1}
,"works":{"items":1}
,"already":{"attached":1}
,"reflected":{"imaginary":1}
,"imaginary":{"vertical":1}
,"vertical":{"line":1}
,"line":{"time":1}
,"mirror":{"command":1}
,"combined":{"rotate":1,"mirror":1}
,"rotate":{"command":1}
,"produce":{"eight":1}
,"eight":{"standard":1}
,"standard":{"orientations":1}
,"orientations":{"transforming":1}
,"transforming":{"symbols":1}
,"rotated":{"counter-clockwise":1}
,"counter-clockwise":{"time":1}
,"whole":{"wire":1}
,"segment":{"wire":1}
,"control":{"sheets":1}
,"sheets":{"dialog":1}
,"dialog":{"box":1}
,"assigns":{"origin":1,"attribute":1}
,"origin":{"changes":1,"setting":1}
,"setting":{"symbol":1}
,"expand":{"page":1}
,"increases":{"work":1}
,"work":{"area":1}
,"area":{"symbol":1}
,"names":{"symbol":1}
,"type":{"schematic":1}
,"values":{"symbols":1,"schematic":1}
,"wires":{"assigning":1}
,"assigning":{"attribute":1}
}
;Search.control.loadWordPairs(pairs);
