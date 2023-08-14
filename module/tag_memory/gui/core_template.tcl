#$Header: L:/module/tag_memory/gui/rcs/core_template.tcl 1.7 2007/11/02 06:28:10Z mghuang Exp $
#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para

}

proc GetMemorySize {} {
  global Para
  
  regexp {(^[a-zA-Z0-9]+)-([0-9]+)?.*$} $Para(PartType) match x y
  switch $y {
    2  {set Para(MemorySize) 56}
    5  {set Para(MemorySize) 79}
    8  {set Para(MemorySize) 96}
    17 {set Para(MemorySize) 273}
    23 {set Para(MemorySize) 311}
    30 {set Para(MemorySize) 330}
    40 {set Para(MemorySize) 423}
    50 {set Para(MemorySize) 451}
  }
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para

	set tit "Check Parameter"
	#ISPL_CR_38047 
	#if {[string length $Para(MemFile)] == 0} {
	#	set msg "Please specify memory file for Tag Memory!"
	#	tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
	#	return -1
	#}

	if [string length $Para(MemFile)] {
		if {[file exists $Para(MemFile)] == "0"} {
			set msg "Memory file $Para(MemFile) doesn't exist!"
			tk_messageBox -default ok -icon warning -message $msg -title $tit -type ok
			return -1
		}
	}
}

proc GeneralCmdLine {} {
  global Para 

   #set str "-arch mg5a00 -type tag -depth $Para(MemorySize)"
       set str "-arch $Para(arch) -type tag -depth $Para(MemorySize)"
     
  
  
        if {[string length $Para(MemFile)] > 0} {
   	     lappend str -memfile $Para(MemFile) -memformat $Para(MemFormat)
  	}  
 
  
 
  
	return $str
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para
	
	set str [GeneralCmdLine]
#	tk_messageBox -default ok -icon warning -message $str -title "Command Line" -type ok
#	exit
  
	return $str
}

#*** set private value ***
proc Create_Image {} {
    global Para diagram tnb tcl_platform pin_flag ft mem_types
    package require OrcaModule

	set mem_types {
		{"Memory files"		{.mem}	}
		{"All files"		{*.*}	}
	}

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface
	GetMemorySize
	
	#*** Draw Pin ***
	#DrawPin
	switch $tcl_platform(platform) {
		windows {AttributeSetting 420 300}
		unix    {AttributeSetting 450 300}
	}
	set pin_flag 1
	DrawImage 200 300
	set tnb $Para(tnb)

		wm title . "Lattice FPGA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***
	#--- Page #1 ---
		set page [$tnb add -label "Configuration"]
		iwidgets::Labeledframe .frmProperties ;#-labeltext "Properties" -labelpos nw
		set frmProperty [.frmProperties childsite]
		
		#*** Size of RAM ***
		frame .frmSize
		iwidgets::entryfield .entMemorySize -labeltext "Tag Memory Size" -labelpos w -textvariable Para(MemorySize) \
			-width 12 -validate integer -fixed 8
		.entMemorySize config -state disable
		label .lblSizeExt -text "(Bytes)" 
		pack .entMemorySize .lblSizeExt -in .frmSize -side top -anchor w -padx 10 
		pack .frmSize -in $frmProperty -side top -fill x -anchor w -padx 10 -pady 30

    #*** Mem File ***
		frame .frmMemory
		iwidgets::entryfield .entMemFile -labeltext "Memory File" -labelpos w -width 30 \
			-textvariable Para(MemFile)
		button .btnMemFile -text "..." -width 2 -command {
	  		set ret [tk_getOpenFile -filetypes $mem_types -initialdir $Para(ProjectPath)]
	  		if {$ret != "" }  {
	  		 set Para(MemFile) $ret
	  		} 
		}
		pack .entMemFile .btnMemFile -in .frmMemory -side left
		pack .frmMemory -in $frmProperty -side top -fill x -padx 20 -pady 2
		
		Create3RadioItem $frmProperty MFormat "Memory File Format:" 18 "Binary" bin "Hex" hex "Addressed Hex" orca 6 left Para(MemFormat) {}
		.rdo3MFormat config -width 13
		.rdo3MFormat config -state disabled
		
		pack .frmProperties -in $page -side top -fill both -expand 1
		#$tnb delete 0
		$tnb view 0

	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
	pack forget .cboBusOrder
}
