
source Configure.tcl
source WidgetUtils.tcl
source EscalanteWidgets.tcl


proc Widget:Multifile:create {base     var     index       {widget_args ""}     {filter "*"} } {

    set top [eval frame $base.widget $widget_args]
    pack $top -expand 1 -fill both
    button $top.add -text "Add File" -command "Widget:Multifile:add $base"
    pack $top.add -side top -fill x -expand 1


    set c_f [frame  $top.c_f -bd 1 -relief raised]
    pack $c_f -expand 1 -fill y
    set c [canvas $c_f.c  -yscrollcommand "$c_f.scr set"  -height 200]
    set scr [scrollbar $c_f.scr -orient vertical -command "$c yview"]


    pack $c -side left -expand 1 -fill y -padx 2 -pady 2
    pack $scr -side left -expand 1 -fill y



    set filelist  [frame $c.frame ]
    $c create window 2 2  -window $filelist -anchor nw

    global Widget_state

    set Widget_state(Multifile,$base,id) 0
    set Widget_state(Multifile,$base,row) 0
    set Widget_state(Multifile,$base,filelist) $filelist
    set Widget_state(Multifile,$base,filter) $filter

    grid columnconfigure $filelist 1 -weight 1
    Widget:Multifile:add $base


    tkwait visibility $filelist  
    set w [expr [winfo width  $filelist] +2] 
    $c  config -width $w  -scrollregion "0 0 $w 500" 




    return  $top
}



proc Widget:Multifile:remove {base my_id} {
    global Widget_state

    if {![info exists Widget_state(Multifile,$base,$my_id,widgets)] } {return}


    foreach widget $Widget_state(Multifile,$base,$my_id,widgets) {
	destroy $widget
    }
    set row $Widget_state(Multifile,$base,$my_id,row)
    unset Widget_state(Multifile,$base,$row,id)        

    foreach name [array names Widget_state Multifile,$base,$my_id,*] {
	unset Widget_state($name)
    }

    incr Widget_state(Multifile,$base,row)  -1

    while {1} {
	incr row
	if {![info exists Widget_state(Multifile,$base,$row,id)] } {return}
	set id $Widget_state(Multifile,$base,$row,id)
	incr  Widget_state(Multifile,$base,$id,row) -1

	set col 0
	set new_row [expr $row - 1]
	foreach w $Widget_state(Multifile,$base,$id,widgets)   {
	    grid $w -row $new_row -column $col -sticky ew; incr col    
	}
	set Widget_state(Multifile,$base,$id,row) $new_row
    }
}




proc Widget:Multifile:up_down {base my_id {incr -1} } {
    global Widget_state
    set my_row  $Widget_state(Multifile,$base,$my_id,row)

    set other_row  [expr $my_row+$incr]

    if {![info exists Widget_state(Multifile,$base,$other_row,id)] } {return}        

    set other_id $Widget_state(Multifile,$base,$other_row,id)        

    set col 0
    foreach w $Widget_state(Multifile,$base,$my_id,widgets)   {
	grid $w -row $other_row -column $col -sticky ew; incr col    
    }

    set col 0
    foreach w $Widget_state(Multifile,$base,$other_id,widgets)   {
	grid $w -row $my_row -column $col -sticky ew; incr col    
    }


    set Widget_state(Multifile,$base,$my_row,id)           $other_id
    set Widget_state(Multifile,$base,$other_row,id)        $my_id
    set Widget_state(Multifile,$base,$my_id,row)           $other_row
    set Widget_state(Multifile,$base,$other_id,row)        $my_row


}



proc Widget:Multifile:add {base} {

    global Widget_state


    set my_id $Widget_state(Multifile,$base,id) 
    incr Widget_state(Multifile,$base,id) 

    set row $Widget_state(Multifile,$base,row) 
    incr Widget_state(Multifile,$base,row) 



    set f $Widget_state(Multifile,$base,filelist) 
    set row_f [frame $f.row_f$my_id]


    set Widget_state(Multifile,$base,$my_id,widgets)   $row_f
    set Widget_state(Multifile,$base,$my_id,row)       $row
    set Widget_state(Multifile,$base,$row,id)          $my_id


    set entry  [entry $row_f.entry -bd 1 -relief sunken]

    set ud_f [frame $row_f.ud_f]
    set up [button $ud_f.up -bitmap [WidgetGfx:get_bitmap_file up.xbm] -command "Widget:Multifile:up_down $base $my_id"  -highlightthickness 0 ]
    set dn [button $ud_f.dn -bitmap [WidgetGfx:get_bitmap_file down.xbm] -command "Widget:Multifile:up_down $base $my_id +1"  -highlightthickness 0 ]

    set mb [eval menubutton  $row_f.mb -text Tools -menu  $row_f.mb.menu -bd 1 -relief raised]
    set menu  [menu $mb.menu -font fixed -tearoff 0 -bd 1]
    $menu add command -label   "Browse..."	-command  "Widget:Multifile:browse $base $my_id"  
    $menu add command -label   "Remove"	        -command  "Widget:Multifile:remove $base $my_id"  



    set remove [button $row_f.remove -text "Remove" -bd 1 -relief raised -command "Widget:Multifile:remove $base $my_id"  -highlightthickness 0 -width 0 ] 



    grid $row_f -sticky ew -row $row
    pack $up $dn   -side top
    pack $ud_f   -side left  -pady 2
    pack $entry  -side left -expand 1 -fill  x -pady 2
    pack $mb -side left  -pady 2

}



frame .f
pack .f -expand 1 -fill both

Widget:Multifile:create .f var index





