

proc DragAndDrop:create_toplevel {x y} {
    catch "destroy .draganddrop"
    toplevel .draganddrop -bd 0 -cursor based_arrow_down 
    wm overrideredirect .draganddrop 1
    wm transient .draganddrop .
    wm focusmodel .draganddrop active
    wm geometry .draganddrop +${x}+$y
    return .draganddrop
}


proc DragAndDrop:create_text  {top args } {
    pack [eval label $top.label $args] 
}

proc DragAndDrop:create_canvas  {top args } {
    canvas $top.canv -width 50 -height 15 -background yellow -bd 0
    set bm [WidgetGfx:get_bitmap_file $args ""]
    if {![catch "$top.canv create image 1 1  -image [image create bitmap -file  $bm] -anchor nw -tag draganddrop_image"]} {
	set bbox [$top.canv bbox draganddrop_image]
	$top.canv config -width [lindex $bbox 2]  -height [lindex $bbox 3] 
    }
    pack $top.canv -padx 0 -pady 0
}


proc DragAndDrop:create  args {

    array set specs {-src "" -x 0 -y 0 	-func DragAndDrop:create_canvas  -funcargs null32.xbm -listener "" -type "" -data ""}

    array set specs $args
    set d [DragAndDrop:create_toplevel $specs(-x) $specs(-y)]
    bind $d <Motion>          "DragAndDrop:move $d %X %Y \"$specs(-listener)\""

puts "Data:$specs(-data):"
    bind $d <ButtonRelease>   "DragAndDrop:stop $d %X %Y $specs(-type) $specs(-src)  \"$specs(-data)\""
    eval $specs(-func) $d $specs(-funcargs)
    update  idle
    grab  $d
    focus $d
}


proc DragAndDrop:move { DragAndDrop x y listener} {
    if [string length $listener] {
	regsub -all %X  "$listener"  $x listener
	regsub -all %Y  "$listener"  $y listener
	regsub -all %W  "$listener" $DragAndDrop  listener
	eval $listener
    }
    wm geometry $DragAndDrop +${x}+$y
}


proc DragAndDrop:stop { DragAndDrop x y type src data} {
    grab release $DragAndDrop
    destroy $DragAndDrop
    global DragAndDrop_state
    set dest  [winfo containing $x $y]
    set type [string trim $type]
    for {} {[winfo exists $dest]} {set dest [winfo parent $dest] } {
	if {![info exists DragAndDrop_state(rcv,cmd,$dest)]} {continue}
	set ok 0
	foreach t $DragAndDrop_state(rcv,type,$dest)  {
	    if {[string compare  [string trim $t] $type] == 0} {
		set ok 1
		break
	    }
	}
	if {$ok} {
	    set DragAndDrop_state(data) $data
	    set DragAndDrop_state(src) $src
	    set DragAndDrop_state(type) $type
	    set DragAndDrop_state(rcv,x) $x
	    set DragAndDrop_state(rcv,y) $y
	    regsub -all %D "$DragAndDrop_state(rcv,cmd,$dest)" "$data" cmd
	    set DragAndDrop_state(dropped) 1
	    eval $cmd
	    set DragAndDrop_state(dropped) 0
	    return
	}
    }
}


proc DragAndDrop:register_rcv {w cmd {type text}} {
    global DragAndDrop_state
    set DragAndDrop_state(rcv,cmd,$w) "$cmd"
    set DragAndDrop_state(rcv,type,$w) "$type"
}



proc DragAndDrop:register_send {w data {type text} } {
    bind $w <1> "DragAndDrop:create -src $w -x %X -y %Y -type $type -data \{$data\}"
}


proc DragAndDrop:init_once {} {
    global DragAndDrop_state
    if [info exists DragAndDrop_state] {return}
    set DragAndDrop_state(dropped) 0
    set DragAndDrop_state(data) ""
    set DragAndDrop_state(src) ""
    set DragAndDrop_state(type) ""
    set DragAndDrop_state(rcv,x) 0
    set DragAndDrop_state(rcv,y) 0
}

DragAndDrop:init_once



##DragAndDrop:register_rcv   .dest.widget  {"dest_widget_func  \"%D\"" text}
##DragAndDrop:register_send  .src.widget  "src_widget_data "


