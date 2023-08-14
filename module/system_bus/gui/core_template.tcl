#$Header: L:/module/system_bus/gui/rcs/core_template.tcl 1.14 2009/01/13 06:33:57Z mghuang Exp $

#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" ${1+"$@"}

package provide core_template 1.0.0

proc CheckRegenerate {} {
	global Para OldPara

	#new a module
	if {$Para(new) == 1} { return 1}
	
	set para_lst {VendorName CoreType Date Time CoreStatus CoreName CoreRevision ParameterFileVersion \
		Ports360 Ports361 Ports362 Ports363 Ports3E3 Ports3E2 Ports3E1 Ports3E0 \
		Group360 Group361 Group362 Group363 Group3E3 Group3E2 Group3E1 Group3E0 \
		EnMulti EnChip LocalDevice}
	
	foreach pn [array names OldPara] {
		if {[lsearch $para_lst $pn] == -1 &&
			$OldPara($pn) != $Para($pn)} {return 1}
	}
	return 0
}

#***********************
# CreatePpFile: modulename.pp file.
#***********************
proc CreatePpFile {} {
	global Para

	set outPpFile [file join $Para(ProjectPath) $Para(ModuleName).pp]
	if [catch {open $outPpFile w} outputfile] {
		set msg "Cannot open file: $outPpFile!"
		set tit "Write file error"
		tk_messageBox -default ok -icon error -message $msg -title $tit -type ok
		return -1
	}

	set smi_lst {0x410 0x420 0x430 0x440 0x450 0x460 0x470 0x480 0x490 0x4a0 0x4b0 0x4c0 0x4d0 0x4e0 0x4f0 \
		0x500 0x510 0x520 0x530 0x540 0x550 0x560 0x570 0x580 0x590 0x5a0 0x5b0 0x5c0 0x5d0 0x5e0 0x5f0 \
		0x600 0x610 0x620 0x630 0x640 0x650 0x660 0x670 0x680 0x690 0x6a0 0x6b0 0x6c0 0x6d0 0x6e0 0x6f0 \
		0x700 0x710 0x720 0x730 0x740 0x750 0x760 0x770 0x780 0x790 0x7a0 0x7b0 0x7c0 0x7d0 0x7e0 0x7f0}
	
	puts $outputfile "#define  _circuit_name  $Para(ModuleName)"
	puts $outputfile "#define  _enable_mpi  $Para(enMPI)"
	puts $outputfile "#define  _bus_width   $Para(BusWidth)"
	puts $outputfile "#define  _parity_enable  $Para(enParity)"
	puts $outputfile "#define  _dma_interface  $Para(DMA)"
	puts $outputfile "#define  _mpi_clk_async  $Para(MPIAsync)"
	#24426
#	puts $outputfile "#define  _mpi_rst_pad    $Para(ResetPAD)\n"
	puts $outputfile "#define  _enable_umi  $Para(enMaster)"
#	puts $outputfile "#define  JTAG_INTF  $Para(enJTAG)"
	puts $outputfile "#define  _enable_orcastra  $Para(enJTAG)"
	puts $outputfile "#define  _umi_sync_hclk  $Para(MasterSync)"
	puts $outputfile "#define  _auto_retry   $Para(AutoRetry)\n"
	puts $outputfile "#define  _enable_usi   $Para(enSlave)"
	puts $outputfile "#define  _usi_sync_hclk  $Para(SlaveSync)\n"
	puts $outputfile "#define  _enable_smi   $Para(enSMI)\n"
	foreach i $smi_lst  {
		puts $outputfile "#define  _enable_smi_port_$i   $Para($i)\n"
	} 

	set grp_lst {360 361 362 363 3E3 3E2 3E1 3E0}
	foreach i $grp_lst  {
		if {$Para(Ports$i) == 1 } {
			if {$Para(EnMulti) == 0}  {
				puts $outputfile "#define _pcs_[string tolower $i]	on\n"
				set Para(_pcs_[string tolower $i])	on
			} else  {
			   if {$Para(Group$i) == "-"}  {
					puts $outputfile "#define _pcs_[string tolower $i]	on\n"
					set Para(_pcs_[string tolower $i])	on
			   } else  {
					puts $outputfile "#define _pcs_[string tolower $i]	group_$Para(Group$i)\n"
					set Para(_pcs_[string tolower $i])	group_$Para(Group$i)
			   } 
			} 
		} else  {
			puts $outputfile "#define _pcs_[string tolower $i]	off\n"
			set Para(_pcs_[string tolower $i])	off
		} 
	}
	set _driver_group0  none
	set _driver_group1  none
	set _driver_group2  none
	set _driver_group3  none
	foreach i $grp_lst  {
		if {$Para(_pcs_[string tolower $i]) == "group_0"}  {
			set _driver_group0  pcs_$i
		} 
		if {$Para(_pcs_[string tolower $i]) == "group_1"}  {
			set _driver_group1  pcs_$i
		} 
		if {$Para(_pcs_[string tolower $i]) == "group_2"}  {
			set _driver_group2  pcs_$i
		} 
		if {$Para(_pcs_[string tolower $i]) == "group_3"}  {
			set _driver_group3  pcs_$i
		} 
	}
	puts $outputfile "#define _driver_group0 $_driver_group0\n"
	puts $outputfile "#define _driver_group1 $_driver_group1\n"
	puts $outputfile "#define _driver_group2 $_driver_group2\n"
	puts $outputfile "#define _driver_group3 $_driver_group3\n"

#	puts $outputfile "#define  _enable_lpcs_0   $Para(Ports360)"
#	puts $outputfile "#define  _enable_lpcs_1   $Para(Ports361)"
#	puts $outputfile "#define  _enable_lpcs_2   $Para(Ports362)"
#	puts $outputfile "#define  _enable_lpcs_3   $Para(Ports363)"
#	puts $outputfile "#define  _enable_rpcs_0   $Para(Ports3E0)"
#	puts $outputfile "#define  _enable_rpcs_1   $Para(Ports3E1)"
#	puts $outputfile "#define  _enable_rpcs_2   $Para(Ports3E2)"
#	puts $outputfile "#define  _enable_rpcs_3   $Para(Ports3E3)"
	puts $outputfile "#define  _enable_multi_align   $Para(EnChip)\n"
	
	#ISPL_CR_31530
	if {$Para(EnChip) == 1} {	
		puts $outputfile "#define  _local_device   \"[string tolower $Para(LocalDevice)]\"\n"
	}

	puts $outputfile "#define  _read_parity   \"$Para(ReadPriority)\""
	puts $outputfile "#define  _mpi_priority  \"$Para(MPIPriority)\""
	puts $outputfile "#define  _umi_priority   \"$Para(UserMasterPriority)\""
	puts $outputfile "#define  _mpi_sys_reset   $Para(MPIReset)"
	puts $outputfile "#define  _umi_sys_reset   $Para(UserMasterReset)"
#	puts $outputfile "#define  _sys_rst_pad    $Para(PADReset)"
	puts $outputfile "#define  _sys_clock   \"$Para(SBClock)\""
	puts $outputfile "#define  _interrupt_vec1  $Para(Vector1)"
	puts $outputfile "#define  _interrupt_vec2  $Para(Vector2)"
	puts $outputfile "#define  _interrupt_vec3  $Para(Vector3)"
	puts $outputfile "#define  _interrupt_vec4  $Para(Vector4)"
	puts $outputfile "#define  _interrupt_vec5  $Para(Vector5)"
	puts $outputfile "#define  _interrupt_vec6  $Para(Vector6)"
# DTS - 23127
#	puts $outputfile "#define  _ws_time_index   $Para(WaitState)"
#	puts $outputfile "#define  _grant_time_index   $Para(Grant)\n"

	puts $outputfile "#define _syn_attr_option \"[string tolower $Para(Destination)]\"\n"
	
	set ret [CheckRegenerate]
	if {$ret == 0} {
		puts $outputfile "#include <sysbus/sysbus_cfg.txt>"
	} else {
		if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
			[string equal -nocase $Para(SourceFormat) "VHDL"]} {
			puts $outputfile "#define _lang vhdl\n"
			puts $outputfile "#include <sysbus/SYSBUS.vhd>"
			puts $outputfile "#include <sysbus/sysbus_cfg.txt>"
		}
		if {[string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
			[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {
			puts $outputfile "#define _lang verilog\n"
			puts $outputfile "#include <sysbus/SYSBUS.v>"
			puts $outputfile "#include <sysbus/sysbus_cfg.txt>"
		}
	}

	close $outputfile
	return 0
}

proc PCSSetting {} {
	global Para
	
	.cb360 config -state normal
	.cb361 config -state normal
	.cb362 config -state normal
	.cb363 config -state normal
	.cb3E3 config -state normal
	.cb3E2 config -state normal
	.cb3E1 config -state normal
	.cb3E0 config -state normal
	.lbl360 config -state normal
	.lbl361 config -state normal
	.lbl362 config -state normal
	.lbl363 config -state normal
	.lbl3E3 config -state normal
	.lbl3E2 config -state normal
	.lbl3E1 config -state normal
	.lbl3E0 config -state normal
	regexp {(^[a-zA-Z]+)([0-9]+)?.*$} $Para(Package) match x y
	switch $y {
		256  {
			.cb361 config -state disable
			.cb362 config -state disable
			.cb363 config -state disable
			.cb3E3 config -state disable
			.cb3E2 config -state disable
			.cb3E1 config -state disable
			.cb3E0 config -state disable
			.lbl361 config -state disable
			.lbl362 config -state disable
			.lbl363 config -state disable
			.lbl3E3 config -state disable
			.lbl3E2 config -state disable
			.lbl3E1 config -state disable
			.lbl3E0 config -state disable
		}
		900  {
			.cb361 config -state disable
			.cb362 config -state disable
			.cb363 config -state disable
			.cb3E3 config -state disable
			.cb3E2 config -state disable
			.cb3E1 config -state disable
			.lbl361 config -state disable
			.lbl362 config -state disable
			.lbl363 config -state disable
			.lbl3E3 config -state disable
			.lbl3E2 config -state disable
			.lbl3E1 config -state disable
		}
		1020 -
		1152 {
			.cb362 config -state disable
			.cb363 config -state disable
			.cb3E3 config -state disable
			.cb3E2 config -state disable
			.lbl362 config -state disable
			.lbl363 config -state disable
			.lbl3E3 config -state disable
			.lbl3E2 config -state disable
		}
		1704 {
		}
		default {}
	}
}

proc ChangeValueCmd {} {
	global Para
	set grp_lst {360 361 362 363 3E3 3E2 3E1 3E0}

	#ISPL_CR_34762 
	regexp {(^[a-zA-Z]+)([0-9]+)?.*$} $Para(Package) match x y
	if {$y <= 256} {
		.cbMPI config -state disabled
		set Para(enMPI) 0
		.cboBusWidth config -state disabled -foreground gray50
		.lblBusWidth config -state disabled
	} else {
		.cbMPI config -state normal
		.cboBusWidth config -state normal -foreground black
		.lblBusWidth config -state normal
	}
	#1. For 256 and 900 packages the range is 8 and 16 with 16 as the default. v6.2
	#if {$y >= 900 && $y <= 1020} 
	if {$y == 256 || $y == 900} {
		.cboBusWidth clear list
		.cboBusWidth insert list end 8 16
		if {$Para(BusWidth) == "32"} {set Para(BusWidth) 16}
	} else {
		.cboBusWidth clear list
		.cboBusWidth insert list end 8 16 32
	}
	
	set tmp [expr $Para(Ports360)+$Para(Ports361)+$Para(Ports362)+$Para(Ports363) + \
			$Para(Ports3E0)+$Para(Ports3E1)+$Para(Ports3E2)+$Para(Ports3E3)]
	if {$tmp >= 2}  {
		.cbEnMulti config -state normal
	} else  {
		.cbEnMulti config -state disabled
		set Para(EnMulti) 0
	} 
	if {$Para(EnMulti) == 1}  {
		foreach i $grp_lst  {
			if {$Para(Ports$i) == 1}  {
				.cbo$i config -state normal
			} 
		} 
	} else  {
		foreach i $grp_lst  {
			.cbo$i config -state disabled
			set Para(Group$i) "-"
		} 
	} 
	if {$tmp >= 1}  {
		.cbEnChip config -state normal
		if {$Para(EnChip) == 1} {
			.lblLocalDevice config -state normal
			.cboLocalDevice config -state normal
		} else {
			.lblLocalDevice config -state disabled
			.cboLocalDevice config -state disabled
		}
	} else  {
		.cbEnChip config -state disabled
		.lblLocalDevice config -state disabled
		.cboLocalDevice config -state disabled
	} 

	#24735
	if {$Para(enMPI) == "1" && $Para(enMaster) == "1"}  {
		.cboMPIPriority        config -state normal
		.cboUserMasterPriority config -state normal
	} else  {
		.cboMPIPriority        config -state disabled
		.cboUserMasterPriority config -state disabled
	} 
	if {$Para(enMPI) == "1"}  {
		.cbMPIReset config -state normal
		.cboSBClock clear list
		#34194 - remove OSC
		.cboSBClock insert list end MPI USER
		#26662
		#set Para(SBClock) MPI
	} else  {
		.cbMPIReset config -state disabled
		set Para(MPIReset) 0
		.cboSBClock clear list
		#34194 - remove OSC
		.cboSBClock insert list end USER
		if {$Para(SBClock) == "MPI"}  {set Para(SBClock) USER}
	} 
	if {$Para(enMaster) == "1"}  {
		.cbUserMasterReset config -state normal
	} else  {
		.cbUserMasterReset config -state disabled
		set Para(UserMasterReset) 0
	} 

	if {$Para(enMaster) == 0}  {
		.cbJTAGEn config -state disabled
		set Para(enJTAG) 0
		.cbMasterSync config -state normal
		.cbAutoRetry  config -state normal
	} else  {
		if {$Para(MasterSync) == "1" || $Para(AutoRetry) == "1"}  {
			.cbJTAGEn config -state disabled
			set Para(enJTAG) 0
		} else  {
			.cbJTAGEn config -state normal
		}
	} 
	
	PCSSetting
}

proc ChangeJTAGCmd {}  {
	global Para
	if {$Para(enJTAG) == "1"}  {
		.cbMasterSync config -state disabled
		.cbAutoRetry  config -state disabled
		set Para(MasterSync) 0
		set Para(AutoRetry) 0
	} else  {
		.cbMasterSync config -state normal
		.cbAutoRetry  config -state normal
	} 
} 

proc ChangeUMICmd {}  {
	global Para
	if {$Para(MasterSync) == "1" || $Para(AutoRetry) == "1"}  {
		.cbJTAGEn config -state disabled
		set Para(enJTAG) 0
	} else  {
		if {$Para(enMaster) == 0}  {
			.cbJTAGEn config -state disabled
			set Para(enJTAG) 0
		} else  {
			.cbJTAGEn config -state normal
		} 
	} 
} 

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Load Parameter
#  Input: None
# Output: None
#******************************************************************************
proc LoadParaCB {} {
	global Para OldPara

	if {$Para(new) == 0} {LoadParameter $Para(CoreName) $Para(ParaFile)}

	ChangeValueCmd
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Check Parameter
#  Input: None
# Output: 0 - Success, -1 - error
#******************************************************************************
proc CheckParameterCB {} {
	global Para OldPara

	return 0
}

#******************************************************************************
# Public Template Function: 
#		Call Back proc for Generate Command-Line
#  Input: None
# Output: str (Command-line options)
#******************************************************************************
proc GenerateCB {} {
	global Para tcl_platform

	set ret [CheckParameterCB]
	if {$ret == -1} {return -1}

	set out_msg "\tModule Name: $Para(ModuleName)\n\tCore Type: $Para(CoreName)\n\tLPC file : $Para(ModuleName).lpc"

	if {[string equal -nocase $Para(SourceFormat) "Schematic/VHDL"] ||
	    [string equal -nocase $Para(SourceFormat) "Schematic/Verilog HDL"] ||
		[string equal -nocase $Para(SourceFormat) "VHDL"] ||
		[string equal -nocase $Para(SourceFormat) "Verilog HDL"]} {

		set ret [CreatePpFile]
		if {$ret == -1} {return -1}
		append out_msg "\n\tPP File : $Para(ModuleName).pp"
		
		set oldPath [pwd]
		cd $Para(ProjectPath)
		set ppFile  "$Para(ModuleName).pp"
		set orcappFile  [GetFpscEngine]
		catch {exec $orcappFile -Fmaco $ppFile} ret
		cd $oldPath
		# send message to IP Manager
		regsub -all "\n\n\n+" $ret "\n\n" ret
		append out_msg "\n\tCommand line: $orcappFile -Fmaco $ppFile"
		append out_msg "\n\tReturn Value:"
		foreach item [split $ret "\n"] {append out_msg "\n\t$item"}

		set tmp_str [string tolower $out_msg]
		if {[string first "error" $tmp_str] == -1}  {
			append out_msg "\n Module $Para(CoreName) has been generated in $Para(ProjectPath) successfully!\n\n"
		} 

		set out_msg [ReadmeOut $out_msg]
	} else  {
		append out_msg "\n Only Parameter configuration file $Para(ModuleName).lpc has been created in $Para(ProjectPath)."
	} 

	return $out_msg
}

proc Create_Image {} {
	global Para tcl_platform pin_flag

	package require OrcaModule

	#*** set private value ***

	#*** Public Template Functions ***
	# 1. ProjectSet
	# 2. MainInterface
	# 3. AttributeSetting
	ProjectSet
	MainInterface ;#450x450
	switch $tcl_platform(platform) {
		windows {AttributeSetting 480 410}
		unix    {AttributeSetting 530 410}
	}
	set Para(Fdir) "Fmaco"
	set pin_flag orcapp
	DrawImage 270 400
	set tnb $Para(tnb)

	wm title . "ORCA Module -- $Para(CoreName)"
	#*** Here for user to add extra pages ***

	#	pack forget .cbEdif .lblExpression .cboExpression .lblOrder .cboOrder .cbIO

		$tnb pageconfigure 0 -label "General"
	#*** MPI Tab ***
		set page1 [$tnb add -label "MPI"]
		iwidgets::Labeledframe .frmMPI
		set frmMPI [.frmMPI childsite]

		checkbutton .cbMPI -text "Enable MPI" -variable Para(enMPI) -command {
			ChangeValueCmd;
			if {$Para(enMPI) == "1"}  {
				.cbMPIReset config -state normal
				.cboSBClock clear list
				#34194 - remove OSC
				.cboSBClock insert list end MPI USER
				#26662
				set Para(SBClock) MPI
			} else  {
				.cbMPIReset config -state disabled
				set Para(MPIReset) 0
				.cboSBClock clear list
				#34194 - remove OSC
				.cboSBClock insert list end USER
				if {$Para(SBClock) == "MPI"}  {set Para(SBClock) USER}
			} 
			DrawPins
			}
		pack .cbMPI -in $frmMPI -side top -anchor w -padx 40 -pady 5
		set Bus_list {8 16 32}
		CreateLabelCombobox $frmMPI BusWidth "Bus Width" 20 6 Para(BusWidth) $Bus_list {DrawPins}
		checkbutton .cbParity -text "Parity Enable" -variable Para(enParity) -command DrawPins
		checkbutton .cbDMA -text "DMA Interface" -variable Para(DMA) -command DrawPins
		checkbutton .cbHCLK -text "MPI_CLK Async. to Systembus Clock(HCLK)" -variable Para(MPIAsync)
		checkbutton .cbResetPad -text "Dedicated MPI Reset PAD" -variable Para(ResetPAD)
		#24426
	#	pack .cbParity .cbDMA .cbHCLK .cbResetPad -in $frmMPI -side top -anchor w -padx 40 -pady 5
		pack .cbParity .cbDMA .cbHCLK -in $frmMPI -side top -anchor w -padx 40 -pady 5

		pack .frmMPI -in $page1 -side top -fill both -expand 1

	#*** USER_MASTER Tab ***
		set page2 [$tnb add -label "User_Master"]
		iwidgets::Labeledframe .frmMaster
		set frmMaster [.frmMaster childsite]

		checkbutton .cbMasterEn -text "Enable User Master Interface" -variable Para(enMaster) -command {ChangeValueCmd;DrawPins}
		checkbutton .cbMasterSync -text "User Master Sync. to Systembus Clock(HCLK)" -variable Para(MasterSync) -command {ChangeUMICmd}
		checkbutton .cbAutoRetry -text "Automatic Retry" -variable Para(AutoRetry) -command {ChangeUMICmd}
		pack .cbMasterEn .cbMasterSync .cbAutoRetry -in $frmMaster -side top -anchor w -padx 40 -pady 5

		checkbutton .cbJTAGEn -text "Append JTAG Master Interface" -variable Para(enJTAG) -command {ChangeValueCmd;ChangeJTAGCmd;DrawPins}
		#ISPL_CR_41964
		#pack .cbJTAGEn -in $frmMaster -before .cbMasterSync -side top -anchor w -padx 70 -pady 5

		pack .frmMaster -in $page2 -side top -fill x -fill both -expand 1

	#*** User_Slave Tab ***
		set page3 [$tnb add -label "User_Slave"]
		iwidgets::Labeledframe .frmSlave
		set frmSlave [.frmSlave childsite]

		checkbutton .cbSlaveEn -text "Enable User Slave Interface" -variable Para(enSlave) -command DrawPins
		checkbutton .cbSlaveSync -text "User Slave Sync. to Systembus Clock(HCLK)" -variable Para(SlaveSync)
		pack .cbSlaveEn .cbSlaveSync -in $frmSlave -side top -anchor w -padx 40 -pady 5

		pack .frmSlave -in $page3 -side top -fill both -expand 1

	#*** SMI Tab ***
		set page4 [$tnb add -label "SMI"]
		iwidgets::Labeledframe .frmSMI
		set frmSMI [.frmSMI childsite]

		checkbutton .cbSMI -text "Enable Serial Management Interface" -variable Para(enSMI) -command DrawPins
		pack .cbSMI -in $frmSMI -side top -anchor w -padx 40 -pady 5

		set smi_lst {0x410 0x420 0x430 0x440 0x450 0x460 0x470 0x480 0x490 0x4a0 0x4b0 0x4c0 0x4d0 0x4e0 0x4f0 \
			0x500 0x510 0x520 0x530 0x540 0x550 0x560 0x570 0x580 0x590 0x5a0 0x5b0 0x5c0 0x5d0 0x5e0 0x5f0 \
			0x600 0x610 0x620 0x630 0x640 0x650 0x660 0x670 0x680 0x690 0x6a0 0x6b0 0x6c0 0x6d0 0x6e0 0x6f0 \
			0x700 0x710 0x720 0x730 0x740 0x750 0x760 0x770 0x780 0x790 0x7a0 0x7b0 0x7c0 0x7d0 0x7e0 0x7f0}
		iwidgets::scrolledframe .sfSMI -width 4i -height 2.5i -relief sunken -borderwidth 2 -vscrollmode dynamic -hscrollmode none 
		pack .sfSMI -in $frmSMI -side top -anchor w -padx 30
		set win [.sfSMI childsite]
		foreach i $smi_lst  {
			set entry [checkbutton $win.$i -text "Enable SMI Port $i" -variable Para($i) -command DrawPins]
			pack $entry -fill x
	#		checkbutton .cbSMI$i -text "Enable SMI Port $i"
	#		pack .cbSMI$i -in $sfSMI -side top -anchor w -padx 10
		} 

		pack .frmSMI -in $page4 -side top -fill both -expand 1

	#*** PCS Tab ***
		set page5 [$tnb add -label "PCS"]
		iwidgets::Labeledframe .frmPCS
		set frmPCS [.frmPCS childsite]

		set grp_lst {360 361 362 363 3E3 3E2 3E1 3E0}
		iwidgets::Labeledframe .frmPorts -labeltext "Enable PCS Control/Status Ports" -labelpos nw
		set frmPorts [.frmPorts childsite]
		foreach i $grp_lst  {
			label .lbl$i -text "PCS\n$i"
			checkbutton .cb$i -variable Para(Ports$i) -command {ChangeValueCmd;DrawPins}
		}
	#	checkbutton .cbPorts360 -variable Para(Ports360) -command DrawPins
	#	checkbutton .cbPorts361 -variable Para(Ports361) -command DrawPins
	#	checkbutton .cbPorts362 -variable Para(Ports362) -command DrawPins
	#	checkbutton .cbPorts363 -variable Para(Ports363) -command DrawPins

	#	checkbutton .cbPorts3E0 -variable Para(Ports3E0) -command DrawPins
	#	checkbutton .cbPorts3E1 -variable Para(Ports3E1) -command DrawPins
	#	checkbutton .cbPorts3E2 -variable Para(Ports3E2) -command DrawPins
	#	checkbutton .cbPorts3E3 -variable Para(Ports3E3) -command DrawPins
		grid .lbl360 .lbl361 .lbl362 .lbl363 .lbl3E3 .lbl3E2 .lbl3E1 .lbl3E0 -in $frmPorts -padx 10
		grid .cb360 .cb361 .cb362 .cb363 .cb3E3 .cb3E2 .cb3E1 .cb3E0 -in $frmPorts
	#	pack .frmPorts -in $frmPCS -side top -fill x -anchor w -pady 5

		iwidgets::Labeledframe .frmAlign -labeltext "Select Multi-Quad Alignment" -labelpos nw
		set frmAlign [.frmAlign childsite]
		checkbutton .cbEnMulti -text "Enable Multi-Quad Alignment" -variable Para(EnMulti) -command {ChangeValueCmd;DrawPins}
		grid .cbEnMulti -in $frmAlign -columnspan 4 -pady 4

		foreach i $grp_lst  {
			iwidgets::combobox .cbo$i -width 2 -textvariable Para(Group$i) -editable 0
			.cbo$i insert list end - 0 1 2 3
		} 
		grid .cbo360 .cbo361 .cbo362 .cbo363 .cbo3E3 .cbo3E2 .cbo3E1 .cbo3E0 -in $frmAlign -padx 5 -pady 4

		checkbutton .cbEnChip -text "Enable Multi-Chip Alignment" -variable Para(EnChip) -command {ChangeValueCmd;DrawPins}
		pack .frmPorts .frmAlign -in $frmPCS -side top -fill x -anchor w -pady 5
		pack .cbEnChip -in $frmPCS -side top -anchor w -padx 20 -pady 5
		
		CreateLabelCombobox $frmPCS LocalDevice "Local Device" 20 10 Para(LocalDevice) {Slave Master} {}

		pack .frmPCS -in $page5 -side top -fill both -expand 1

	#*** Global Tab ***
		set page6 [$tnb add -label "Global"]
		iwidgets::Labeledframe .frmGlobal
		set frmGlobal [.frmGlobal childsite]

		#24761
	#	iwidgets::combobox .cboReadPriority -labeltext "Read Parity" -width 8 -textvariable Para(ReadPriority) -editable 0
		iwidgets::combobox .cboReadPriority -labeltext "Parity" -width 8 -textvariable Para(ReadPriority) -editable 0
		.cboReadPriority.label config -width 20 -anchor w
		.cboReadPriority insert list end EVEN ODD

		iwidgets::combobox .cboMPIPriority -labeltext "MPI Priority" -width 8 -textvariable Para(MPIPriority) -editable 0
		.cboMPIPriority.label config -width 20 -anchor w
		.cboMPIPriority insert list end LOW MED HIGH

		iwidgets::combobox .cboUserMasterPriority -labeltext "User Master Priority" -width 8 -textvariable Para(UserMasterPriority) -editable 0
		.cboUserMasterPriority.label config -width 20 -anchor w
		.cboUserMasterPriority insert list end LOW MED HIGH
		pack .cboReadPriority .cboMPIPriority .cboUserMasterPriority -in $frmGlobal -side top -anchor w -padx 40 -pady 5

		checkbutton .cbMPIReset -text "Systembus Reset by MPI" -variable Para(MPIReset)
		checkbutton .cbUserMasterReset -text "Systembus Reset by User Master" -variable Para(UserMasterReset)
		checkbutton .cbPADReset -text "Dedicated Systembus Reset PAD" -variable Para(PADReset)
		iwidgets::combobox .cboSBClock -labeltext "Systembus Clock" -width 8 -textvariable Para(SBClock) -editable 0
		.cboSBClock.label config -width 20 -anchor w
		#34194 - remove OSC
		.cboSBClock insert list end MPI USER
		pack .cbMPIReset .cbUserMasterReset .cboSBClock -in $frmGlobal -side top -anchor w -padx 40 -pady 5

		pack .frmGlobal -in $page6 -side top -fill both -expand 1

	#*** Advanced Tab ***
		set page7 [$tnb add -label "Advanced"]
		iwidgets::Labeledframe .frmAdvanced
		set frmAdvanced [.frmAdvanced childsite]

		#24735
		CreateLabelEntryLabel $frmAdvanced Vector1 "Read Only Word #1:" 34 "" "" Para(Vector1)
		CreateLabelEntryLabel $frmAdvanced Vector2 "Read Only Word #2:" 34 "" "" Para(Vector2)
		CreateLabelEntryLabel $frmAdvanced Vector3 "Read Only Word #3:" 34 "" "" Para(Vector3)
		CreateLabelEntryLabel $frmAdvanced Vector4 "Read Only Word #4:" 34 "" "" Para(Vector4)
		CreateLabelEntryLabel $frmAdvanced Vector5 "Read Only Word #5:" 34 "" "" Para(Vector5)
		CreateLabelEntryLabel $frmAdvanced Vector6 "Read Only Word #6:" 34 "" "" Para(Vector6)
		.entryVector1 config -validate {bin %c}
		.entryVector2 config -validate {bin %c}
		.entryVector3 config -validate {bin %c}
		.entryVector4 config -validate {bin %c}
		.entryVector5 config -validate {bin %c}
		.entryVector6 config -validate {bin %c}
		iwidgets::combobox .cboWaitState -labeltext "Wait State Time Out(Systembus Clock Cycle)" -width 4 -textvariable Para(WaitState) -editable 0
		.cboWaitState.label config -width 37 -anchor w
		.cboWaitState insert list end 0 1 2 3 4 5 6 7

		iwidgets::combobox .cboGrant -labeltext "Grant Time Out(Systembus Clock Cycle)" -width 4 -textvariable Para(Grant) -editable 0
		.cboGrant.label config -width 37 -anchor w
		.cboGrant insert list end 0 1 2 3 4 5 6 7

	# DTS - 23127
	#	pack .cboWaitState .cboGrant -in $frmAdvanced -side top -anchor w -padx 40 -pady 5
		pack .frmAdvanced -in $page7 -side top -fill both -expand 1

		ChangeValueCmd	

		$tnb view 0

		pack forget .cbHCLK
		
	#*** Public Template Functions ***
	# 5. FunctionButton
	# 6. CenterPosition
	#FunctionButton
	#CenterPosition
	GeneralConfig
}