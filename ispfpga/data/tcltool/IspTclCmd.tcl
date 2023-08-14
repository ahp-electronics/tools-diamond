###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdArch.tcl
##
###############################################################################
# RCS: @(#) $Id$

###############################################################################
#@cmd/dedev arch_report_routing_info "Report the routing info"
###############################################################################
tcl::OptProc arch_report_routing_info {
    {-node_type -boolflag true "Report the usage of node types."}
    {-arc_type -boolflag false "Report the usage of arc types (slow!)"}
    {-pin_type -boolflag true "Report the usage of pin types"}
    {-master_node -boolflag false "Report the usage of master nodes"}
    {-master_arc -boolflag false "Report the ysage of master arcs"}
    {-density -boolflag true "Report the density at channels"}
    {-pin_list -string "" "The pin name list"}
    {-master_node_list -string "" "The master node list"}
    {-master_arc_list -string "" "The master arc list"}
} {
    set ret [basciCmdArchReportRoutingInfo $node_type $arc_type $pin_type $master_node $master_arc $density $pin_list $master_node_list $master_arc_list]
    if {$ret == 0} { error "Error: the command arch_report_routing_info failed." }
}

###############################################################################
#@cmd/dedev arch_convert_routing_table_from_csv_to_swi "Convert routing tables"
###############################################################################
tcl::OptProc arch_convert_routing_table_from_csv_to_swi {
    {-csv_file -string "" ".csv file"}
    {-swi_file -string "" ".swi file"}
} {
    set ret [basciCmdArchConvertRoutingTableFromCsvToSwi $csv_file $swi_file]
    if {$ret == 0} { error "Error: the command arch_convert_routing_table_from_csv_to_swi failed." }
}

###############################################################################
#@cmd/dedev arch_report_switchbox_table_usage "Report the usage of switchbox tables"
###############################################################################
tcl::OptProc arch_report_switchbox_table_usage {
    {-mode -int 0 "Mode"}
    {-exclude -string "" "List of exclude nodes/arcs"}
    {-infile -string "" "The input file for SRT project"}
    {-outfile -string "SRT.OUT" "The output file of SRT"}
    {-csvfile -string "" "Output the result similar to routing tables"}
} {
    set ret [basciCmdArchReportSwitchboxTableUsage $mode $exclude $infile $outfile $csvfile]
    if {$ret == 0} { error "Error: the command arch_report_switchbox_table_usage failed." }
}

###############################################################################
#@cmd/dedev arch_report_global_signal_usage "Report the usage of global signals"
###############################################################################
tcl::OptProc arch_report_global_signal_usage {
    {-mode -int 0 "Mode"}
    {-delta_r -int 1 "Region size for rows"}
    {-delta_c -int 1 "Region size for cols"}
    {-region_min_r -int -1 "The staring row of the region"}
    {-region_min_c -int -1 "The staring column of the region"}
    {-region_max_r -int -1 "The end row of the region"}
    {-region_max_c -int -1 "The end column of the region"}
    {-all_clk -boolflag false "Consider all the clocks no matter is uses global resource or not"}
    {-clk_fanout -int 1 "A signal is considered as a clock if the # of clock pins exceeds the value"}
    {-clk_region -int 1 "Report the clock name if the region clock exceeds the specified value"}
} {
    set ret [basciCmdArchReportGlobalSignalUsage $mode $delta_r $delta_c $region_min_r $region_min_c $region_max_r $region_max_c $all_clk $clk_fanout $clk_region]
    if {$ret == 0} { error "Error: the command arch_report_global_signal_usage failed." }
}

###############################################################################
#@cmd/dedev arch_report_plc_resource_usage "Report the usage of plc"
###############################################################################
tcl::OptProc arch_report_plc_resource_usage {
    {-comp_clk_pin_id -int 18 "nc_comp CLK pin id"}
    {-comp_lsr_pin_id -int 17 "nc_comp LSR pin id"}
    {-comp_ce_pin_id  -int 16 "nc_comp CE  pin id"}

} {
    set ret [basciCmdArchReportPlcResourceUsage $comp_clk_pin_id $comp_lsr_pin_id $comp_ce_pin_id]
    if {$ret == 0} { error "Error: the command arch_report_plc_resource_usage failed." }
}
###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdClock.tcl
##
###############################################################################
# RCS: @(#) $Id: ispcmdclock.tcl,v 1.1 2005/08/19 01:19:38 qzhang Exp $

###############################################################################
#@cmd/opt clk_report_network "Report clock network."
###############################################################################
tcl::OptProc clk_report_network {
} {
    set ret [basciCmdReportClockNetwork]
    if {$ret == 0} { error "Error: the command clk_report_network failed." }
}

###############################################################################
#@cmd/opt clk_list_signal "List clock signals."
###############################################################################
tcl::OptProc clk_list_signal {
    {-verbose -boolflag false "verbose message"}
} {
    set ret [basciCmdListClockSignal $verbose]
    if {$ret == 0} { error "Error: the command clk_list_signal failed." }
}

###############################################################################
#@cmd/opt clk_constrain_all_signals "Constrain all clock signals with the given or default frequency."
###############################################################################
tcl::OptProc clk_constrain_all_signals {
    {-all -boolflag false "All clocks"}
    {-seq -boolflag false "All clocks driven by Q/!Q pins"}
    {-com -boolflag false "All clocks driven by combinational logic"}
    {-prffile -string "clock_signal.prf" "the new prf file name"}
} {
    set ret [basciCmdConstrainAllClockSignals $all $seq $com $prffile]
    if {$ret == 0} { error "Error: the command clk_constrain_all_signals failed."}
}

###############################################################################
#@cmd/dedev clk_plot_network "Plot the clock network into an .egf file."
###############################################################################
if ($ISPTCL_DEDEV_ENABLE) {
tcl::OptProc clk_plot_network {
    {-file -string "epic_clock.egf" "Clock .egf file"}
} {
    set ret [basciCmdPlotClockNetwork $file]
    if {$ret == 0} { error "Error: the command clk_plot_network failed."}
}
}

###############################################################################
#@cmd/opt clk_report_skew "Report the clock skew"
###############################################################################
tcl::OptProc clk_report_skew {
} {
    set ret [basciCmdClkReportSkew]
    if {$ret == 0} { error "Error: the command clk_report_skew failed."}
}

###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdDesign.tcl
##
###############################################################################
# RCS: @(#) $Id: ispcmddesign.tcl,v 1.1 2005/08/19 01:19:38 qzhang Exp $

###############################################################################
#@cmd/opt des_set_top_module "Set the top module in the design."
###############################################################################
tcl::OptProc des_set_top_module {
    {?module_name? -string "" "Top module name"}
} {
    set ret [basciCmdSetTopModule $module_name]
    if {$ret == 0} { error "Error: the command des_set_top_module failed." }
}

###############################################################################
#@cmd/opt des_list_top_module "List the top module."
###############################################################################
tcl::OptProc des_list_top_module {
} {
    set ret [basciCmdListTopModule]
    if {$ret == 0} { error "Error: the command des_list_top_module failed." }
}

###############################################################################
#@cmd/opt des_set_hier_module "Set the hierarchical module for logic synthesis."
###############################################################################
tcl::OptProc des_set_hier_module {
    {?module_names? -list "" "list of hier module names"}
} {
    set ret [basciCmdSetHierModule $module_names]
    if {$ret == 0} { error "Error: the command des_set_hier_module failed." }
}

###############################################################################
#@cmd/opt des_list_hier_module "List all hierarchical modules."
###############################################################################
tcl::OptProc des_list_hier_module {
} {
    set ret [basciCmdListHierModule]
    if {$ret == 0} { error "Error: the command des_list_hier_module failed." }
}

###############################################################################
#@cmd/opt des_report_top_modules "Report the top modules."
###############################################################################
tcl::OptProc des_report_top_modules {
    {-verbose -boolflag false "On/off verbose report"}
    {?module? -string "" "module name"}
} {
    set ret [basciCmdReportTopModules $verbose $module]
    if {$ret == 0} { error "Error: the command des_report_top_modules failed." }
}

###############################################################################
#@cmd/opt des_report "Report the design."
###############################################################################
tcl::OptProc des_report {
} {
    set ret [basciCmdReportDesign]
    if {$ret == 0} { error "Error: the command des_report failed." }
}

###############################################################################
#@cmd/opt des_change_speed "Change the device speed."
###############################################################################
tcl::OptProc des_change_speed {
    {-speed -string "5" "a different speed"}
} {
    set ret [basciCmdChangeDesignSpeed $speed]
    if {$ret == 0} { error "Error: the command des_change_speed failed." }
}

###############################################################################
#@cmd/opt des_delete_ncd_design "Delete the design."
###############################################################################
tcl::OptProc des_delete_ncd_design {
} {
    set ret [basciCmdDeleteNcdDesign]
    if {$ret == 0} { error "Error: the command des_delete_ncd_design failed." }
}

###############################################################################
#@cmd/opt des_list_signal "List signals."
###############################################################################
tcl::OptProc des_list_signal {
    {-verbose -boolflag false "Deatiled report"}
    {-fanout -int 0 "The fanout \#"}
    {-lsort -int  0 "Sorting method: 0 - id; 1 - all pins; 2 - clk pins; 3 - global control pins; 4 - normal pins"}
    {-lsize -int -1 "The size of signal listed"}
    {?objects? -string "*" "List signals"}
} {
    set ret [basciCmdListSignal $verbose $fanout $lsort $lsize $objects]
    if {$ret == 0} { error "Error: the command des_list_signal failed." }
}

###############################################################################
#@cmd/debug des_list_signal_path "List signal paths."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc des_list_signal_path {
    {-verbose -boolflag false "Deatiled report"}
    {-global -boolflag false "Global signals"}
    {-fanout -int 1000000 "maximum fanout #"}
    {-arc -int 0 "Number of arcs"}
    {?objects? -string "*" "List signals"}
} {
    set ret [basciCmdListSignalPath $verbose $global $fanout $arc $objects]
    if {$ret == 0} { error "Error: the command des_list_signal_path failed." }
}
}

###############################################################################
#@cmd/opt des_report_signal "Report a signal."
###############################################################################
tcl::OptProc des_report_signal {
    {-subnet -int -1 "subnet number"}
    {?objects? -string "" "Report the given signals"}
} {
    set ret [basciCmdReportSignal $subnet $objects]
    if {$ret == 0} { error "Error: the command des_report_signal failed." }
}

###############################################################################
#@cmd/debug des_set_signal_type "Set signal type."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc des_set_signal_type {
    {-type -int 2 "The default signal type"}
    {?signal_names? -string "" "signal names"}
} {
    set ret [basciCmdSetSignalType $type $signal_names]
    if {$ret == 0} { error "Error: the command des_set_signal_type failed." }
}
}

###############################################################################
#@cmd/dedev des_report_node "Report node."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc des_report_node {
    {?node_names? -list "" "node <dist, inst> pairs"}
} {
    set ret [basciCmdReportNode $node_names]
    if {$ret == 0} { error "Error: the command des_report_node failed." }
}
}

###############################################################################
#@cmd/opt des_list_port "List all ports."
###############################################################################
tcl::OptProc des_list_port {
    {-verbose -boolflag false "Deatiled report"}
    {?objects? -string "*" "List ports"}
} {
    set ret [basciCmdListPort $verbose $objects]
    if {$ret == 0} { error "Error: the command des_list_port failed." }
}

###############################################################################
#@cmd/opt des_list_comp "List comp."
###############################################################################
tcl::OptProc des_list_comp {
    {-verbose -boolflag false "Deatiled report"}
	{-sort -boolflag false "Sort by Slack"}
    {?objects? -string "*" "List comps"}
} {
    set ret [basciCmdListComp $verbose $sort $objects]
    if {$ret == 0} { error "Error: the command des_list_comp failed." }
}

###############################################################################
#@cmd/opt des_list_macro_inst "List macro inst."
###############################################################################
tcl::OptProc des_list_macro_inst {
    {-verbose -boolflag false "Deatiled report"}
    {?objects? -string "*" "List macro insts"}
} {
    set ret [basciCmdListMacroInst $verbose $objects]
    if {$ret == 0} { error "Error: the command des_list_macro_inst failed." }
}

###############################################################################
#@cmd/debug des_list_macro_def "List macro def."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc des_list_macro_def {
    {-verbose -boolflag false "Deatiled report"}
    {?objects? -string "*" "List macro definitions"}
} {
    set ret [basciCmdListMacroDef $verbose $objects]
    if {$ret == 0} { error "Error: the command des_list_macro_def failed." }
}
}

###############################################################################
#@cmd/opt des_report_comp "Report comp info."
###############################################################################
tcl::OptProc des_report_comp {
    {-verbose -boolflag false "Deatiled report"}
	{-sort -boolflag false "Sort by Basic Elements"}
    {-slack -boolflag false "Report slack on comp pins"}
    {-samesig_equiv -boolflag false "Report the same signals in the equivs"}
    {?objects? -string "*" "List comps"}
} {
    set ret [basciCmdReportComp $verbose $sort $slack $samesig_equiv $objects]
    if {$ret == 0} { error "Error: the command des_report_comp failed." }
}

###############################################################################
#@cmd/opt des_report_macro_inst "Report macro instance info."
###############################################################################
tcl::OptProc des_report_macro_inst {
    {-verbose -boolflag false "Deatiled report"}
    {-samesig_equiv -boolflag false "Report the same signals in the equivs"}
    {?objects? -string "*" "List macro inst"}
} {
    set ret [basciCmdReportMacroInst $verbose $samesig_equiv $objects]
    if {$ret == 0} { error "Error: the command des_report_macro_inst failed." }
}

###############################################################################
#@cmd/debug des_report_macro_def "Report macro def info."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc des_report_macro_def {
    {-verbose -boolflag false "Deatiled report"}
    {-samesig_equiv -boolflag false "Report the same signals in the equivs"}
    {?objects? -string "*" "List macro def"}
} {
    set ret [basciCmdReportMacroDef $verbose $samesig_equiv $objects]
    if {$ret == 0} { error "Error: the command des_report_macro_def failed." }
}
}

###############################################################################
#@cmd/debug des_swap_comp_pin "Swap to comp pins."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc des_swap_comp_pin {
    {?pin_node_names? -list "" "Pin node name"}
} {
    set ret [basciCmdSwapCompPin $pin_node_names]
    if {$ret == 0} { error "Error: the command des_swap_comp_pin failed." }
}
}

###############################################################################
#@cmd/opt des_compile "Run auto-compiling flow."
###############################################################################
tcl::OptProc des_compile {
} {
    set ret [basciCmdCompile]
    if {$ret == 0} { error "Error: the command des_compile failed." }
}

###############################################################################
#@cmd/opt des_create_ugroup "Create ugroups based on netlist hierarchy."
###############################################################################
tcl::OptProc des_create_ugroup {
    {-verbose -boolflag false "Verbose message"}
    {-rent -float 0.5 "Rent threshold to from a ugroup"}
    {-size -int 500 "Suggested ugroup size"}
    {-file -string "my_tcl_ugroup.out" "Output file"}
} {
    set ret [basciCmdCreateUgroup $verbose $size $rent $file]
    if {$ret == 0} { error "Error: the command des_create_ugroup failed." }
}

###############################################################################
#@cmd/dev des_sort_signal "Sort signals in NCD according to their name."
###############################################################################
tcl::OptProc des_sort_signal {
} {
    set ret [basciCmdDesSortSignal]
    if {$ret == 0} { error "Error: the command des_sort_signal failed." }
}

###############################################################################
#@cmd/dev des_sort_comp "Sort comps in NCD according to their name."
###############################################################################
tcl::OptProc des_sort_comp {
} {
    set ret [basciCmdDesSortComp]
    if {$ret == 0} { error "Error: the command des_sort_comp failed." }
}
###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdDevice.tcl
##
###############################################################################
# RCS: @(#) $Id: ispcmddevice.tcl,v 1.1 2005/08/19 01:19:38 qzhang Exp $

###############################################################################
#@cmd/opt dev_set_device "Set the device to be used."
###############################################################################
tcl::OptProc dev_set_device {
    {?deviceName? -string "" "device name"}
} {
    set i [basciCmdSetDevice $deviceName]
    if {$i == 0} { error "Error: command dev_set_device failed."}
}

###############################################################################
#@cmd/opt dev_set_option "Set the device options, such as speed grade."
###############################################################################
tcl::OptProc dev_set_option {
    {-family -string "" "device family name"}
    {-package -string "" "package name"}
    {-speed -string "5" "device speed grade"}
} {
    set i [basciCmdSetDeviceOption $family $package $speed]
    if {$i == 0} { error "Error: command dev_set_option failed."}
}

###############################################################################
#@cmd/opt dev_list_option "List the device options."
###############################################################################
tcl::OptProc dev_list_option {
} {
    set i [basciCmdListDeviceOption]
    if {$i == 0} { error "Error: command dev_list_option failed."}
}

###############################################################################
#@cmd/opt dev_report "Report the device info."
###############################################################################
tcl::OptProc dev_report {
    {-verbose -boolflag false "Detailed report"}
} {
    set ret [basciCmdReportDevice $verbose]
    if {$ret == 0} { error "Error: the command dev_report failed." }
}

###############################################################################
#@cmd/debug dev_list_site "List the sites."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc dev_list_site {
    {-verbose -boolflag false "Detailed report"}
    {?objects? -string "*" "List sites"}
} {
    set ret [basciCmdListSite $verbose $objects]
    if {$ret == 0} { error "Error: the command dev_list_site failed." }
}
}

###############################################################################
#@cmd/dedev dev_list_arc_by_node_type "List all the arcs by node types."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc dev_list_arc_by_node_type {
    {-from -int -1 "type id from 0-15"}
    {-to -int -1 "type id from 0-15"}
    {-num -int 100 "number of arcs listed"}
} {
    set ret [basciCmdListArcByNodeType $from $to $num]
    if {$ret == 0} { error "Error: the command dev_list_arc_by_node_type failed." }
}
}

###############################################################################
#@cmd/dedev dev_list_arc_by_node_name "List all the arcs by node names."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc dev_list_arc_by_node_name {
    {-from -string "" "node name"}
    {-to -string "" "node name"}
    {-num -int 100 "number of arcs listed"}
} {
    set ret [basciCmdListArcByNodeName $from $to $num]
    if {$ret == 0} { error "Error: the command dev_list_arc_by_node_name failed." }
}
}

###############################################################################
#@cmd/dedev dev_list_node "List all the specified nodes."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc dev_list_node {
    {-verbose -boolflag false "Detailed report"}
    {-file -string "" "file name"}
    {?objects? -string "*" "List nodes"}
} {
    set ret [basciCmdListNode $verbose $file $objects]
    if {$ret == 0} { error "Error: the command dev_list_node failed." }
}
}

###############################################################################
#@cmd/dedev dev_list_node_at_location "List all the nodes at the given (r, c)."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc dev_list_node_at_location {
    {-row -int -1 "row number"}
    {-col -int -1 "col number"}
} {
    set ret [basciCmdListNodeAtLocation $row $col]
    if {$ret == 0} { error "Error: the command dev_list_node_at_location failed." }
}
}

###############################################################################
#@cmd/dedev dev_list_arc_by_arc_type "List all the arcs by arc types."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc dev_list_arc_by_arc_type {
    {-num -int -1 "number of arcs listed"}
    {-route_thru -boolflag false "route-thru"}
} {
    set ret [basciCmdListArcByArcType $num $route_thru]
    if {$ret == 0} { error "Error: the command dev_list_arc_by_arc_type failed." }
}
}

###############################################################################
#@cmd/dedev dev_drc "Verify the device data."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc dev_drc {
} {
    set ret [basciCmdDevDRC]
    if {$ret == 0} { error "Error: the command dev_drc failed." }
}
}
###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdEdit.tcl
##
###############################################################################
# RCS: @(#) $Id:$

###############################################################################
## Copyright (c) 2005 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdFile.tcl
##
###############################################################################
# RCS: @(#) $Id: ispcmdfile.tcl,v 1.1 2005/08/19 01:19:38 qzhang Exp $

###############################################################################
#@cmd/opt des_add_file "Add a design file into current project."
###############################################################################
tcl::OptProc des_add_file {
    {-edif -boolflag false "type=edif"}
    {-ngd -boolflag false "type=ngd"}
    {-vhdl -boolflag false "type=vhdl"}
    {-verilog -boolflag false "type=verilog"}
    {-sdc -boolflag false "type=sdc"}
    {-lpf -boolflag false "type=lpf"}
    {-lib -string "" "library name"}
    {?fileName? -string "" "file name"}
} {
    set i [basciCmdAddDesignFile $edif $ngd $vhdl $verilog $sdc $lpf $lib $fileName]
    if {$i == 0} { error "Error: command des_add_file failed."}
}

###############################################################################
#@cmd/opt des_list_file "List all the design files."
###############################################################################
tcl::OptProc des_list_file {
} {
    set i [basciCmdListDesignFile]
    if {$i == 0} { error "Error: command des_list_file failed."}
}

###############################################################################
#@cmd/opt des_add_lib "Add a design library."
###############################################################################
tcl::OptProc des_add_lib {
    {-vhdl -boolflag false "type=vhdl"}
    {-verilog -boolflag false "type=verilog"}
    {-lib -string "" "library name"}
    {?fileName? -string "" "file name"}
} {
    set i [basciCmdAddDesignLib $vhdl $verilog $lib $fileName]
    if {$i == 0} { error "Error: command des_add_lib failed."}
}

###############################################################################
#@cmd/opt des_list_lib "List all the design libraries."
###############################################################################
tcl::OptProc des_list_lib {
} {
    set i [basciCmdListDesignLib]
    if {$i == 0} { error "Error: command des_list_lib failed."}
}

###############################################################################
#@cmd/opt des_read_ncd "Read in a .ncd file."
###############################################################################
tcl::OptProc des_read_ncd {
    {?ncdFileName? -string " " "NCD file name"}
} {
    set i [basciCmdReadNcd $ncdFileName]
    if {$i == 0} { error "Error: command des_read_ncd failed."}
}

###############################################################################
#@cmd/opt des_write_ncd "Write the design into a .ncd file."
###############################################################################
tcl::OptProc des_write_ncd {
    {-w -boolflag false "Force to overwrite the existing file"}
    {?ncdFileName? -string "" "NCD file name"}
} {
    set i [basciCmdWriteNcd $w $ncdFileName]
    if {$i == 0} { error "Error: command des_write_ncd failed."}
}

###############################################################################
#@cmd/opt des_read_prf "Read in a .prf file."
###############################################################################
tcl::OptProc des_read_prf {
    {?prfFileNames? -list " " "list of preference files"}
} {
    set i [basciCmdReadPrf $prfFileNames]
    if {$i == 0} { error "Error: command des_read_prf failed."}
}

###############################################################################
#@cmd/opt des_write_prf "Write out a .prf file."
###############################################################################
tcl::OptProc des_write_prf {
    {-w -boolflag false "Force to overwrite the existing file"}
    {?prfFileName? -string "" "preference file name"}
} {
    set i [basciCmdWritePrf $w $prfFileName]
    if {$i == 0} { error "Error: command des_write_prf failed."}
}

###############################################################################
#@cmd/opt des_write_pad "Write out a .pad file."
###############################################################################
tcl::OptProc des_write_pad {
    {-w -boolflag false "Force to overwrite the existing file"}
    {?padFileName? -string "" "pad file name"}
} {
    set i [basciCmdWritePad $w $padFileName]
    if {$i == 0} { error "Error: command des_write_pad failed."}
}

###############################################################################
#@cmd/opt des_load_db "Load a db file."
###############################################################################
tcl::OptProc des_load_db {
    {?dbFileName? -string "" "db file name"}
} {
    set i [basciCmdLoadDb $dbFileName]
    if {$i == 0} { error "Error: command des_load_db failed."}
}

###############################################################################
#@cmd/opt des_save_db "Save the design into a db file."
###############################################################################
tcl::OptProc des_save_db {
    {-w -boolflag false "Force to overwrite the existing file"}
    {?dbFileName? -string "" "db file name"}
} {
    set i [basciCmdSaveDb $w $dbFileName]
    if {$i == 0} { error "Error: command des_save_db failed."}
}
###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdFlow.tcl
##
###############################################################################
# RCS: @(#) $Id: ispcmdflow.tcl,v 1.1 2005/08/19 01:19:38 qzhang Exp $

###############################################################################
#@cmd/opt flw_set_status "Set the status of current flow."
###############################################################################
tcl::OptProc flw_set_status {
    {status_name -string "" "status flag name"}
    {status_flag -choice {1 0} "status flag value"}
} {
    set ret [basciCmdSetFlowStatus $status_name $status_flag]
    if {$ret == 0} { error "Error: the command flw_set_status failed." }
}

###############################################################################
#@cmd/opt flw_report_status "Report the status of current flow."
###############################################################################
tcl::OptProc flw_report_status {
} {
    set ret [basciCmdReportFlowStatus]
    if {$ret == 0} { error "Error: the command flw_report_status failed." }
}
###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdMap.tcl
##
###############################################################################
# RCS: @(#) $Id:$

###############################################################################
#@cmd/dev map_report_unrelated_packing "Report map unrelated packing."
###############################################################################
tcl::OptProc map_report_unrelated_packing {
    {-verbose -boolflag false "Deatiled report"}
} {
    set ret [basciCmdMapReportUnrelatedLogicPacking $verbose]
    if {$ret == 0} { error "Error: the command map_report_unrelated_packing failed." }
}

###############################################################################
#@cmd/dedev map_report_packing_score "Report map packing scores."
###############################################################################
tcl::OptProc map_report_packing_score {
    {-effort -string "low" "Effort level for scoring"}
    {-verbose -int 0 "verbose = [0, 1, 2] Verbose level for deatiled report"}
} {
    set ret [basciCmdMapReportPackingScore $effort $verbose]
    if {$ret == 0} { error "Error: the command map_report_packing_score failed." }
}

###############################################################################
## Copyright (c) 
## 2005 - 2011 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdOpt.tcl
##
###############################################################################
# RCS: @(#) $Id:$

###############################################################################
#@cmd/dedev opt_unpack_slice "Unpack a slice component."
###############################################################################
tcl::OptProc opt_unpack_slice {
    {-b -int 1 "b = [0, 1]"}
    {-lut -boolflag false "unpack lut"}
    {-reg -boolflag false "unpack register"}
    {-loc1 -string "" "new placement location for the 1st split slice"}
    {-loc2 -string "" "new placement location for the 2nd split slice"}
    {?comp_name? -string "" "Comp name"}
} {
    set ret [basciCmdOptUnpack $b $lut $reg $loc1 $loc2 $comp_name]
    if {$ret == 0} { error "Error: the command opt_unpack_slice failed." }
}

###############################################################################
#@cmd/dedev opt_repack_slice "Repack given slice components."
###############################################################################
tcl::OptProc opt_repack_slice {
    {-loc -string "" "new placement location for the repacked slice"}
    {?comp_name1? -string "" "the 1st comp name"}
    {?comp_name2? -string "" "the 2nd comp name"}
} {
    set ret [basciCmdOptRepack $loc $comp_name1 $comp_name2]
    if {$ret == 0} { error "Error: the command opt_repack_slice failed." }
}

###############################################################################
#@cmd/dedev opt_swap_slice "Swap a slice component by bank."
###############################################################################
tcl::OptProc opt_swap_slice {
    {-lut -boolflag false "swap lut"}
    {-reg -boolflag false "swap register"}
    {-loc -string "" "new placement location for the swapped slice"}
    {?comp_name? -string "" "Comp name"}
} {
    set ret [basciCmdOptSwap $lut $reg $loc $comp_name]
    if {$ret == 0} { error "Error: the command opt_swap_slice failed." }
}

###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdPar.tcl
##
###############################################################################
# RCS: @(#) $Id: ispcmdpar.tcl,v 1.1 2005/08/19 01:19:38 qzhang Exp $

###############################################################################
#@cmd/opt par_par "Run par."
###############################################################################
tcl::OptProc par_par {
    {-a -boolflag false "Turn on automatic level skipping for constructive placement.Begins at \"-l <1-5>\" and will automatically skip levels based on completion criteria.  The \"-n <n>\" switch controls the maximum number of iterations per level. Note: \"-n <n>\", when used with \"-a\" will be the maximum number of iterations at each level, not for the total run."}
    {-assemble -boolflag false "(Modular Design)Assemble top-level design and the implemented modules into one design."}
    {-c -int 1 "Run n cleanup passes of the router."}
    {-d -int 0 "Run n delay based cleanup passes of the router, n >= 0."}
    {-e -int 0 "Run n delay based cleanup passes of the router if there are 0 unrouted, n >= 0."}
    {-exp -string "" "Exploration options used in par program."}
    {-g -string "" "Use a guide file to place and route against. 1. Keep matching block names. 2. Keep matching netnames/pins."}
    {-gv -boolflag false "List matched comps/macros/signals in guided par report file"}
    {-i -int 6 "Run n iterations of the router."}
    {-k -boolflag false "Skip constructive placement. Run optimize placement and then enter the router. Note: Use -k -p to do reentrant routing."}
    {-l -int 5 "Effort Level. Level 5 is maximum effort."}
    {-mc -boolflag false "(Modular Design)Compile each module."}
    {-mf -int 100 "Matching factor."}
    {-n -int 1 "Iterations at this level.  Use \"-n 0\" to run until fully routed.  See Note under \"-a\" option."}
    {-p -boolflag false "Don't run placement."}
    {-pe -boolflag false "Error out if there're any Prefence errors."}
    {-q -boolflag false "Placer will attempt to minimize overall clock skew."}
    {-r -boolflag false "Don't run router."}
    {-s -int 100 "Save \"n\" best results for this run."}
    {-t -int 1 "Start at this placer cost table entry."}
    {-u -int 1 "Use this router cost table entry. Valid range varies by device."}
    {-w -boolflag false "Overwrite.  Allows overwrite of an existing file (including input file). If specified output is a directory, allows files in directory to be overwritten."}
    {-x -boolflag false "Ignore Timing preferences in preference file."}
    {-y -boolflag false "Create .dly file and the delay statistics at end of .par file"}
} {
    set ret [basciCmdParPar $a $assemble $c $d $e $exp $g $gv $i $k $l $mc $mf $n $p $pe $q $r $s $t $u $w $x $y]
    if {$ret == 0} { error "Error: the command par_par failed." }
}

###############################################################################
#@cmd/opt par_place "Run par -r."
###############################################################################
tcl::OptProc par_place {
    {-a -boolflag false "Turn on automatic level skipping for constructive placement.Begins at \"-l <1-5>\" and will automatically skip levels based on completion criteria.  The \"-n <n>\" switch controls the maximum number of iterations per level. Note: \"-n <n>\", when used with \"-a\" will be the maximum number of iterations at each level, not for the total run."}
    {-assemble -boolflag false "(Modular Design)Assemble top-level design and the implemented modules into one design."}
    {-exp -string "" "Exploration options used in par."}
    {-g -string "" "Use a guide file to place and route against. 1. Keep matching block names. 2. Keep matching netnames/pins."}
    {-gv -boolflag false "List matched comps/macros/signals in guided par report file"}
    {-k -boolflag false "Skip constructive placement. Run optimize placement and then enter the router. Note: Use -k -p to do reentrant routing."}
    {-l -int 5 "Effort Level. Level 5 is maximum effort."}
    {-mc -boolflag false "(Modular Design)Compile each module."}
    {-mf -int 100 "Matching factor."}
    {-pe -boolflag false "Error out if there're any Prefence errors."}
    {-q -boolflag false "Placer will attempt to minimize overall clock skew."}
    {-t -int 1 "Start at this placer cost table entry."}
    {-w -boolflag false "Overwrite.  Allows overwrite of an existing file (including input file). If specified output is a directory, allows files in directory to be overwritten."}
    {-x -boolflag false "Ignore Timing preferences in preference file."}
    {-y -boolflag false "Create .dly file and the delay statistics at end of .par file"}
} {
    set ret [basciCmdParPlace $a $assemble $exp $g $gv $k $l $mc $mf $pe $q $t $w $x $y]
    if {$ret == 0} { error "Error: the command par_place failed." }
}

###############################################################################
#@cmd/opt par_route "Run par -p."
###############################################################################
tcl::OptProc par_route {
    {-assemble -boolflag false "(Modular Design)Assemble top-level design and the implemented modules into one design."}
    {-c -int 1 "Run n cleanup passes of the router."}
    {-d -int 0 "Run n delay based cleanup passes of the router, n >= 0."}
    {-e -int 0 "Run n delay based cleanup passes of the router if there are 0 unrouted, n >= 0."}
    {-exp -string "" "Exploration options used in par."}
    {-g -string "" "Use a guide file to place and route against. 1. Keep matching block names. 2. Keep matching netnames/pins."}
    {-gv -boolflag false "List matched comps/macros/signals in guided par report file"}
    {-i -int 6 "Run n iterations of the router."}
    {-mc -boolflag false "(Modular Design)Compile each module."}
    {-mf -int 100 "Matching factor."}
    {-n -int 1 "Iterations at this level.  Use \"-n 0\" to run until fully routed.  See Note under \"-a\" option."}
    {-pe -boolflag false "Error out if there're any Prefence errors."}
    {-s -int 100 "Save \"n\" best results for this run."}
    {-u -int 1 "Use this router cost table entry. Valid range varies by device."}
    {-w -boolflag false "Overwrite.  Allows overwrite of an existing file (including input file). If specified output is a directory, allows files in directory to be overwritten."}
    {-x -boolflag false "Ignore Timing preferences in preference file."}
    {-y -boolflag false "Create .dly file and the delay statistics at end of .par file"}
} {
    set ret [basciCmdParRoute $assemble $c $d $e $exp $g $gv $i $mc $mf $n $pe $s $u $w $x $y]
    if {$ret == 0} { error "Error: the command par_route failed." }
}



###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdPlace.tcl
##
###############################################################################
# RCS: @(#) $Id:$

###############################################################################
#@cmd/opt plc_report "Report placement info."
###############################################################################
tcl::OptProc plc_report {
} {
    set ret [basciCmdPlaceReportPlacementInfo]
    if {$ret == 0} { error "Error: the command plc_report failed." }
}

###############################################################################
#@cmd/opt plc_output_comp_location "Output comp's locations in LOCATE format."
###############################################################################
tcl::OptProc plc_output_comp_location {
    {-type -string "" "type =[all, iopad, core]"}
    {-slack_from -float -99.0 "slack_value x1"}
    {-slack_to   -float +99.0 "slack value x2"}
    {-prf -boolflag false "Output in .prf format"}
    {-file -string "" "file name"}
    {?comp_names? -list "" "Comp names"}
} {
    set ret [basciCmdPlaceOutputCompLocation $type $slack_from $slack_to $prf $file $comp_names]
    if {$ret == 0} { error "Error: the command plc_output_comp_location failed." }
}    

###############################################################################
#@cmd/opt plc_unplace_comp "Unplace comps."
###############################################################################
tcl::OptProc plc_unplace_comp {
    {-type -string "" "type =[all, iopad, core]"}
    {?comp_names? -list "" "Comp names"}
} {
    set ret [basciCmdPlaceUnplaceComp $type $comp_names]
    if {$ret == 0} { error "Error: the command plc_unplace_comp failed." }
}

###############################################################################
#@cmd/opt plc_place_comp_to_site "Place comp to the given site."
###############################################################################
tcl::OptProc plc_place_comp_to_site {
    {?comp_site_names? -list "" "Comp/site names"}
} {
    set ret [basciCmdPlacePlaceCompToSite $comp_site_names]
    if {$ret == 0} { error "Error: the command plc_place_comp_to_site failed." }
}

###############################################################################
#@cmd/opt plc_move_comp_to_site "Move comps to the specified sites."
###############################################################################
tcl::OptProc plc_move_comp_to_site {
    {?comp_site_names? -list "" "Comp/site names"}
} {
    set ret [basciCmdPlaceMoveCompToSite $comp_site_names]
    if {$ret == 0} { error "Error: the command plc_move_comp_to_site failed." }
}

###############################################################################
#@cmd/opt plc_swap_comp "Swap the locations of two comps."
###############################################################################
tcl::OptProc plc_swap_comp {
    {?comp_names? -list "" "Comp names"}
} {
    set ret [basciCmdPlaceSwapComp $comp_names]
    if {$ret == 0} { error "Error: the command plc_swap_comp failed." }
}

###############################################################################
#@cmd/debug plc_plot_suggestion "Output placement suggestion for some comps."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc plc_plot_suggestion {
    {-critical -boolflag false "Display the suggestion for critical comps"}
    {-file -string "" "The file name"}
} {
    set ret [basciCmdPlacePlotPlaceSuggestion $critical $file]
    if {$ret == 0} { error "Error: the command plc_plot_suggestion failed." }
}
}

###############################################################################
#@cmd/debug plc_plot_resource_usage "Output placement reesource usage."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc plc_plot_resource_usage {
    {-lut -boolflag false "Display the lut usage"}
    {-reg -boolflag false "Display the reg usage"}
    {-spc -boolflag false "Display the specific-purpose cell(such as CCU2) usage"}
    {-all -boolflag false "Display the lut/reg usage comps"}
    {-file -string "" "The file name"}
} {
    set ret [basciCmdPlacePlotResourceUsage $lut $reg $spc $all $file]
    if {$ret == 0} { error "Error: the command plc_plot_resource_usage failed." }
}
}
###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdPref.tcl
##
###############################################################################
# RCS: @(#) $Id:$

###############################################################################
#@cmd/dedev prf_change_port_name_to_net_name "Change port name to net name in preferences."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc prf_change_port_name_to_net_name {
    {-prffile -string "mydb.prf.port" "New prf file name"}
} {
    set i [basciCmdPrefChangePortNameToNetName $prffile]
    if {$i == 0} { error "Error: command prf_change_port_name_to_net_name failed."}
}
}

###############################################################################
#@cmd/debug prf_modify_clock_frequency "Modify the clock frequencies according to .twr values."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc prf_modify_clock_frequency {
    {-factor -float 1.30 "The factor multiplied to frequency value"}
    {-maxfreq -float 1000.00 "The maximum frequency value"}
    {-twr -string "" "The trce report file"}
    {-prffile -string "mydb.prf.mod" "New prf file name"}
} {
    set i [basciCmdPrefModifyClockFrequency $factor $maxfreq $twr $prffile]
    if {$i == 0} { error "Error: command prf_modify_clock_frequency failed."}
}
}

###############################################################################
#@cmd/opt prf_list_preference "List all the preferences."
###############################################################################
tcl::OptProc prf_list_preference {
    {-prf -boolflag true  "List PRF preferences"}
    {-lpf -boolflag false "List LPF preferences"}
} {
    set i [basciCmdPrefListPreference $lpf $prf]
    if {$i == 0} { error "Error: command prf_list_preference failed."}
}
###############################################################################
## Copyright (c) 
## 2008 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File basciCmdProject.tcl
##
###############################################################################
# RCS: @(#) $Id$

###############################################################################
#@cmd/opt prj_create "Create a project."
###############################################################################
tcl::OptProc prj_create {
    {?project_name? -string "" "project name"}
} {
    set ret [basciCmdCreateProject $project_name]
    if {$ret == 0} { error "Error: the command prj_create failed." }
}

###############################################################################
#@cmd/opt prj_list "List current project(s)."
###############################################################################
tcl::OptProc prj_list {
} {
    set ret [basciCmdListProject]
    if {$ret == 0} { error "Error: the command prj_list failed." }
}

###############################################################################
#@cmd/opt prj_close "Close current project(s)."
###############################################################################
tcl::OptProc prj_close {
} {
    set ret [basciCmdCloseProject]
    if {$ret == 0} { error "Error: the command prj_close failed." }
}

###############################################################################
#@cmd/opt prj_delete "Delete a project."
###############################################################################
tcl::OptProc prj_delete {
    {?project_name? -string "" "project name"}
} {
    set ret [basciCmdDeleteProject $project_name]
    if {$ret == 0} { error "Error: the command prj_delete failed." }
}

###############################################################################
#@cmd/dedev prj_save "Save the project.<unfinished>"
###############################################################################
if ($ISPTCL_DEDEV_ENABLE) {
tcl::OptProc prj_save {
    {-file -string "" "The project file"}
} {
    set ret [basciCmdSaveProject $file]
    if {$ret == 0} { error "Error: the command prj_save failed." }
}
}

###############################################################################
#@cmd/dedev prj_load "Load a project.<unfinished>"
###############################################################################
if ($ISPTCL_DEDEV_ENABLE) {
tcl::OptProc prj_load {
} {
    set ret [basciCmdLoadProject]
    if {$ret == 0} { error "Error: the command prj_load failed." }
}
}

###############################################################################
#@cmd/opt prj_set_option "Set a project option."
###############################################################################
tcl::OptProc prj_set_option {
    {-work_dir -string "." "work directory"}
} {
    set ret [basciCmdSetProjectOption $work_dir]
    if {$ret == 0} { error "Error: the command prj_set_option failed." }
}

###############################################################################
#@cmd/opt prj_list_option "List all project options."
###############################################################################
tcl::OptProc prj_list_option {
} {
    set ret [basciCmdListProjectOption]
    if {$ret == 0} { error "Error: the command prj_list_option failed." }
}
###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdRoute.tcl
##
###############################################################################
# RCS: @(#) $Id: ispcmdroute.tcl,v 1.4 2005/10/12 22:49:31 qzhang Exp $

###############################################################################
#@cmd/opt rte_unroute "Unroute all the signals."
###############################################################################
tcl::OptProc rte_unroute {
} {
    set ret [basciCmdUnroute]
    if {$ret == 0} { error "Error: the command rte_unroute failed." }
}

###############################################################################
#@cmd/opt rte_unroute_signal "Unroute the specified signals."
###############################################################################
tcl::OptProc rte_unroute_signal {
    {?signal_names? -list "" "Signal names"}
} {
    set ret [basciCmdUnrouteSignal $signal_names]
    if {$ret == 0} { error "Error: the command rte_unroute_signal failed." }
}

###############################################################################
#@cmd/opt rte_report "Report the routing info."
###############################################################################
tcl::OptProc rte_report {
    {-signal -boolflag false "Report the signals"}
    {-verbose -boolflag false "Report detailed info"}
} {
    set ret [basciCmdRouteReportRoutingInfo $signal $verbose]
    if {$ret == 0} { error "Error: the command rte_report failed." }
}

###############################################################################
#@cmd/debug rte_verify_signal "Verify signal connection."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc rte_verify_signal {
} {
    set ret [basciCmdRouteVerifySignal]
    if {$ret == 0} { error "Error: the command rte_verify_signal failed." }
}
}

###############################################################################
#@cmd/dedev rte_verify_conn_delay "Verify connection delay value."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc rte_verify_conn_delay {
    {-mode -int 1 "mode 1: TA .vs. RCtree; mode 2: TA .vs. arcDelay"}
    {-max_fanout -int 100 "process those signals whose fanout number <= max_fanout"}
    {-tolerance -float 0.02 "The tolerance between TRCE and maze delay estimation."}
} {
    set ret [basciCmdRouteVerifyConnDelay $mode $max_fanout $tolerance]
    if {$ret == 0} { error "Error: the command rte_verify_conn_delay failed." }
}
}

###############################################################################
#@cmd/debug rte_report_conn_delay "Report the delay on specified conns."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc rte_report_conn_delay {
    {-max -boolflag false "use max delay mode"}
    {-min -boolflag false "use min delay mode"}
    {-signal -string "" "The signal name."}
    {-load_pin_node -string "" "The load pin node name"}
} {
    set ret [basciCmdRouteReportConnDelay $max $min $signal $load_pin_node]
    if {$ret == 0} { error "Error: the command rte_report_conn_delay failed." }
}
}



###############################################################################
#@cmd/opt rte_route_signal "Route the specified signals."
###############################################################################
tcl::OptProc rte_route_signal {
    {-ripup -boolflag false "Ripup the existing path if required"}
    {?signal_names? -list "" "Signal names"}
} {
    set ret [basciCmdRouteSignal $ripup $signal_names]
    if {$ret == 0} { error "Error: the command rte_route_signal failed." }
}

###############################################################################
#@cmd/opt rte_reroute_signal "Re-route the specified signals."
###############################################################################
tcl::OptProc rte_reroute_signal {
    {-ripup -boolflag false "Ripup the existing path if required"}
    {?signal_names? -list "" "Signal names"}
} {
    set ret [basciCmdRerouteSignal $ripup $signal_names]
    if {$ret == 0} { error "Error: the command rte_reroute_signal failed." }
}

###############################################################################
#@cmd/opt rte_route "Route all the signals."
###############################################################################
tcl::OptProc rte_route {
    {-effort -choice "medium low high" "Level of effort [medium/low/high]."}
    {-no_timing -boolflag false "Turn off the timing-driven feature"}
    {-skip_preroute -boolflag false "Skip the preroute"}
    {-skip_sigroute -boolflag false "Skip the signal routing"}
    {-skip_cleanup -boolflag false "Skip the cleanup process"}
} {
    set ret [basciCmdRoute $effort $no_timing $skip_preroute $skip_sigroute $skip_cleanup]
    if {$ret == 0} { error "Error: the command rte_route failed." }
}

###############################################################################
#@cmd/opt rte_report_congestion_info "Report routing conesgtion info."
###############################################################################
tcl::OptProc rte_report_congestion_info {
    {-map -boolflag false "Turn on the flag to output congestion map"}
} {
    set ret [basciCmdReportCongestionInfo $map]
    if {$ret == 0} { error "Error: the command rte_report_congestion_info failed." }
}

###############################################################################
#@cmd/opt rte_plot_congestion_map "Plot routing congestion map."
###############################################################################
tcl::OptProc rte_plot_congestion_map {
    {-inpin -boolflag false "Inpin nodes"}
    {-outpin -boolflag false "Outpin nodes"}
    {-by0 -boolflag false "by0 nodes"}
    {-by1 -boolflag false "by1 nodes"}
    {-by2 -boolflag false "by2 nodes"}
    {-by6 -boolflag false "by6 nodes"}
    {-allpin -boolflag false "For all in/out pins"}
    {-allwire -boolflag false "For all by0-by6 nodes"}
    {-all -boolflag false "For all nodes"}
    {-maxutil -float   1.0 "maximum utilization ratio 0.25 - 1.00"}
    {-osautil -float 200.0 "output the signals in area where util is greater than the given value"}
    {-ignutil -float   0.0 "ignore the congestion if sed ratio < ignutil"}
    {-file -string "epic_congestion.egf" "Congestion map file"}
} {
    set ret [basciCmdPlotCongestionMap $inpin $outpin $by0 $by1 $by2 $by6 $allpin $allwire $all $maxutil $osautil $ignutil $file]
    if {$ret == 0} { error "Error: the command rte_plot_congestion_map failed." }
}

###############################################################################
#@cmd/dedev rte_set_path_arc_level "Set the level of a patyh arc."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc rte_set_path_arc_level {
    {-global -boolflag false "The level=0 for arc to connect global node"}
} {
    set ret [basciCmdSetPathArcLevel $global]
    if {$ret == 0} { error "Error: the command rte_set_path_arc_level failed." }
}
}

###############################################################################
#@cmd/dedev rte_plot_path_arc_level "Plot path arc levels."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc rte_plot_path_arc_level {
    {-level -int 0 "Starting level"}
    {-file -string "epic_level.egf" "File name"}
    {?signal? -string "" "Signal name"}
} {
    set ret [basciCmdPlotPathArcLevel $level $file $signal]
    if {$ret == 0} { error "Error: the command rte_set_path_arc_level failed." }
}
}

###############################################################################
#@cmd/dedev rte_create_delay_matrix "Create delay matrix."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc rte_create_delay_matrix {
    {-file -string "" "File name"}
} {
    set ret [basciCmdCreateDelayMatrix $file]
    if {$ret == 0} { error "Error: the command rte_create_delay_matrix failed." }
}
}

###############################################################################
#@cmd/dedev rte_list_path_arc_by_node_type "List path arcs by node types."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc rte_list_path_arc_by_node_type {
    {-from -int -1 "type id from 0-15"}
    {-to -int -1 "type id from 0-15"}
    {-num -int 100 "number of arcs listed"}
} {
    set ret [basciCmdListPathArcByNodeType $from $to $num]
    if {$ret == 0} { error "Error: the command rte_list_path_arc_by_node_type failed." }
}
}

###############################################################################
#@cmd/dedev rte_list_path_arc_by_node_name "List path arcs by node names."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc rte_list_path_arc_by_node_name {
    {-from -string "" "node name"}
    {-to -string "" "node name"}
    {-num -int 100 "number of arcs listed"}
} {
    set ret [basciCmdListPathArcByNodeName $from $to $num]
    if {$ret == 0} { error "Error: the command rte_list_path_arc_by_node_name failed." }
}
}

###############################################################################
#@cmd/opt rte_fix_signal_path "Fix signal paths."
###############################################################################
tcl::OptProc rte_fix_signal_path {
    {?objects? -string "" "Fix the paths for the given signals"}
} {
    set ret [basciCmdFixSignalPath $objects]
    if {$ret == 0} { error "Error: the command rte_fix_signal_path failed." }
}

###############################################################################
#@cmd/opt rte_unfix_signal_path "Unfix signal paths."
###############################################################################
tcl::OptProc rte_unfix_signal_path {
    {?objects? -string "" "Unfix the paths for the given signals"}
} {
    set ret [basciCmdUnfixSignalPath $objects]
    if {$ret == 0} { error "Error: the command rte_unfix_signal_path failed." }
}

###############################################################################
#@cmd/dedev rte_plot_comp_conn "Plot the connections to the conn."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc rte_plot_comp_conn {
    {-pad -boolflag false "Display the conns to pads"}
    {-max_fanout -int 1000000 "The maximum fanout"}
    {-file -string "epic_conns.egf" "Conn file"}
    {?comp? -string "*" "comp name"}
} {
    set ret [basciCmdDesignPlotCompConn $pad $max_fanout $file $comp]
    if {$ret == 0} { error "Error: the command rte_plot_comp_conn failed." }
}
}

###############################################################################
#@cmd/dedev rte_get_switch_number_per_conn "Get average switch number per critical connection."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc rte_get_switch_number_per_conn {
} {
    set i [basciCmdGetSwitchNumberPerConn]
    if {$i == 0} { error "Error: command rte_get_switch_number_per_conn failed." }
}
}


###############################################################################
#@cmd/debug rte_report_loop "Report loops in routing if any."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc rte_report_loop {
    {-signal -string "" "The signal name."}
} {
    set ret [basciCmdRouteReportLoop $signal]
    if {$ret == 0} { error "Error: the command rte_report_loop failed." }
}
}



###############################################################################
## Copyright (c) 
## 2005 - 2012 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdSae.tcl
##
###############################################################################
# RCS: @(#) $Id:$

###############################################################################
#@cmd/dev sae_explore "autoSAE exploration."
###############################################################################
tcl::OptProc sae_explore {
    {-verbose -boolflag false "Output detailed messages - [false/true]"}
    {-effort -int 3 "Effort level - [3/1/2/4/5]"}
    {-setup -boolflag true "Apply setup timing constraints - [true/false]"}
    {-setup_cb -int 2 "Turn on clock boost for improving setup timing - [2-auto/0-off/1-on]"}
    {-setup_wst_map -float -2.0 "Worst slack threshold at map check point - [-2.0/x]"}
    {-setup_wst_par -float -1.0 "Worst slack threshold at par check point - [-1.0/x]"}
    {-hold -boolflag true "Apply hold timing constraints - [true/false]"}
    {-hold_cb -int 2 "Turn on clock boost for improving hold timing - [2-auto/0-off/1-on]"}
    {-ngd -string "" "ngd file name - [nil/x]"}
    {-lpf -string "" "lpf file name - [nil/x]"}
    {-n -int 0 "# of multi-seeds run - [0-auto/x]"}
    {-m -string "" "The file contains multi-machine/multi-core - [nil/x]"}
} {
    set ret [basciCmdSaeExplore $verbose $effort $setup $setup_cb $setup_wst_map $setup_wst_par $hold $hold_cb $ngd $lpf $n $m]
    if {$ret == 0} { error "Error: the command sae_explore failed." }
}
###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## FilebasciCmdTest.tcl
##
###############################################################################
# RCS: @(#) $Id:$

###############################################################################
#@cmd/dedev tst_mem "Test memory."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc tst_mem {
   {-mem_size -int 10000000 "memory size for one new int"}
   {-mem_iter -int 10 "The number of iterations"}
} {
    set i [basciCmdTestMem $mem_size $mem_iter]
    if {$i == 0} { error "Error: command tst_mem failed."}
}
}

###############################################################################
#@cmd/dedev tst_mem_ta "Test memory related to module TA."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc tst_mem_ta {
} {
    set i [basciCmdTestMemTA]
    if {$i == 0} { error "Error: command tst_mem_ta failed."}
}
}

###############################################################################
#@cmd/dedev tst_mem_tw "Test memory related to module TW."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc tst_mem_tw {
} {
    set i [basciCmdTestMemTW]
    if {$i == 0} { error "Error: command tst_mem_tw failed."}
}
}

###############################################################################
#@cmd/dedev tst_cpu_ta "Test CPU related to module TA."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc tst_cpu_ta {
   {-times -int 10 "iteration times"}
} {
    set i [basciCmdTestCpuTA $times] 
    if {$i == 0} { error "Error: command tst_cpu_ta failed."}
}
}

###############################################################################
#@cmd/dedev tst_cpu_tw "Test CPU related to module TW."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc tst_cpu_tw {
   {-times -int 10 "iteration times"}
} {
    set i [basciCmdTestCpuTW $times]
    if {$i == 0} { error "Error: command tst_cpu_tw failed."}
}
}
###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdTiming.tcl
##
###############################################################################
# RCS: @(#) $Id: ispcmdtiming.tcl,v 1.1 2005/08/19 01:19:39 qzhang Exp $

###############################################################################
#@cmd/opt tmi_update "Update timing info."
###############################################################################
tcl::OptProc tmi_update {
    {-max -boolflag false "perform max (setup) timing checking"}
    {-max_slack_limit -float 0.0 "slack limit for setup"}
    {-min -boolflag false "perform min (hold) timing checking"}
    {-min_slack_limit -float 0.0 "slack limit for hold"}
    {-clock -boolflag false "perform clock skew checking"}
    {-weighted -boolflag false "half cycle is taken into account"}
    {-slack_method -string "conn" "slack method = [conn, path]"}
} {
    set i [basciCmdUpdateTiming $max $max_slack_limit $min $min_slack_limit $clock $weighted $slack_method]
    if {$i == 0} { error "Error: command tmi_update failed."}
}

###############################################################################
#@cmd/opt tmi_report "Report timing info."
###############################################################################
tcl::OptProc tmi_report {
    {-verbose -boolflag true "in verbose mode"}
    {-slack_limit -float 0.0 "slack limit"}
    {-num -int 10 "number limit of paths"}
    {-file -string "" "file name"}
} {
    set i [basciCmdReportTiming $verbose $slack_limit $num $file]
    if {$i == 0} { error "Error: command tmi_report failed."}
}

###############################################################################
#@cmd/opt tmi_report_summary "Report timing summary."
###############################################################################
tcl::OptProc tmi_report_summary {
    {-verbose -boolflag false "in verbose mode"}
} {
    set i [basciCmdReportTimingSummary $verbose]
    if {$i == 0} { error "Error: command tme_report_summary failed."}
}

###############################################################################
#@cmd/dedev tmi_use_module "Use different STA modules."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc tmi_use_module {
    {?sta_module? -string "tw_conn" "sta type: tw_path/tw_conn/ta_conn"}
} {
    set i [basciCmdUseTimingModule $sta_module]
    if {$i == 0} { error "Error: command tmi_use_module failed."}
}
}

###############################################################################
#@cmd/dedev tmi_report_twr "Report .twr file."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc tmi_report_twr {
    {-design -string "" "design name"}
    {-clock -boolflag false "clock-based"}
    {-ref -string "" "reference twr file"}
    {?twr_file? -string "" "twr file"}
} {
    set i [basciCmdReportTwr $design $clock $ref $twr_file]
    if {$i == 0} { error "Error: command tmi_report_twr failed."}
}
}

###############################################################################
#@cmd/dedev tmi_report_ta "Report .ta file."
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc tmi_report_ta {
    {-design -string "" "design name"}
    {-clock -boolflag false "clock-based"}
    {-ref -string "" "reference twr file"}
    {?twr_file? -string "" "twr file"}
} {
    set i [basciCmdReportTa $design $clock $ref $twr_file]
    if {$i == 0} { error "Error: command tmi_report_ta failed."}
}
}

###############################################################################
#@cmd/opt tmi_plot_slack_distribution "Plot slack distribution."
###############################################################################
tcl::OptProc tmi_plot_slack_distribution {
    {-file -string "epic_slack.egf" "File name"}
} {
    set i [basciCmdPlotSlackDistribution $file]
    if {$i == 0} { error "Error: command tmo_plot_slack_distribution failed."}
}

###############################################################################
#@cmd/debug tmi_report_conn_slack "Report connection's slack."
###############################################################################
if {$ISPTCL_DEBUG_ENABLE} {
tcl::OptProc tmi_report_conn_slack {
    {-slack_limit -float 1000.0 "slack threshold"}
    {-signal -string "*" "Signal name"}
    {-file -string "" "File name"}
} {
    set i [basciCmdReportConnSlack $slack_limit $signal $file]
    if {$i == 0} { error "Error: command tmi_report_conn_slack failed."}
}
}

###############################################################################
#@cmd/opt tmi_plot_critical_instance "Plot critical instances."
###############################################################################
tcl::OptProc tmi_plot_critical_instance {
    {-file -string "epic_inst.egf" "File name"}
} {
    set i [basciCmdPlotCriticalInstance $file]
    if {$i == 0} { error "Error: command tmi_plot_critical_instance failed."}
}

###############################################################################
#@cmd/opt tmi_set_slack_threshold "Set slack threshold [s1, s2]."
###############################################################################
tcl::OptProc tmi_set_slack_threshold {
    {?slacks? -list " " "{slack1, [slack2]}"}
} {
    set i [basciCmdSetSlackThreshold $slacks]
    if {$i == 0} { error "Error: command tmi_set_slack_threshold failed."}   
} 

###############################################################################
#@cmd/opt tmi_list_critical_conn "List critical connections."
###############################################################################
tcl::OptProc tmi_list_critical_conn {
    {-percent -float 5.0 "connection percentage to report"}
    {-num -int 10 "connection num to report"}
    {-verbose -boolflag false "Detailed report"}
} {
    set ret [basciCmdListConn $percent $num $verbose]
    if {$ret == 0} { error "Error: the command tmi_list_critical_conn failed." }
}

###############################################################################
#@cmd/opt tmi_report_timing_score "Report timing score."
###############################################################################
tcl::OptProc tmi_report_timing_score {
} {
    set ret [basciCmdTmiReportTimingScore]
    if {$ret == 0} { error "Error: the command tmi_report_timing_score failed." }
}

###############################################################################
#@cmd/dbg tmi_allocate_slack "do slack allocation."
###############################################################################
tcl::OptProc tmi_allocate_slack {
    {-max -boolflag false "Do SETUP slack allocation"}
    {-min -boolflag false "Do HOLD  slack allocation"}
} {
    set ret [basciCmdTmiAllocateSlack $max $min]
    if {$ret == 0} { error "Error: the command tmi_allocate_slack failed." }
}

###############################################################################
#@cmd/dev tmi_report_conn_info "report tw conn info."
###############################################################################
tcl::OptProc tmi_report_conn_info {
    {-signal -string "" "Signal name"}
    {-load_pin_node -string "" "Load pin node"}
} {
    set ret [basciCmdTmiReportConnInfo $signal $load_pin_node]
    if {$ret == 0} { error "Error: the command tmi_report_conn_info failed." }
}

###############################################################################
## Copyright (c) 
## 2005 - 2009 Lattice Semiconductor Corporation. All rights reserved.
##
## File: basciCmdUtil.tcl
##
###############################################################################
# RCS: @(#) $Id: ispcmdutil.tcl,v 1.1 2005/08/19 01:19:39 qzhang Exp $

###############################################################################
#@cmd/opt ls "Unix ls command." 
###############################################################################
tcl::OptProc ls {
    {-l -boolflag false "Use a long list format"}
    {?objects? -string " " "All objects"}
} {
    set i [basciCmdLs $l $objects]
    if {$i == 0} { error "Error: command ls failed."}
}

###############################################################################
#@cmd/opt quit "Quit the program."
###############################################################################
tcl::OptProc quit {
} {
    set i [basciCmdQuit]
    if {$i == 0} { error "Error: command quit failed."}
}

###############################################################################
#@cmd/opt exit "Exit the program."
###############################################################################
tcl::OptProc exit {
} {
    set i [basciCmdExit]
    if {$i == 0} { error "Error: command exit failed."}
}

###############################################################################
#@cmd/opt help "Display the help page."
#notes: to get all procedures "info procs $objects"
###############################################################################
tcl::OptProc help {
    {?objects? -string "*" "All objects"}
} {
    set i [basciCmdHelp $objects]
    if {$i == 0} { error "Error: command help failed."}
}

###############################################################################
#@cmd/opt mem "Output the curremt memory usage."
###############################################################################
tcl::OptProc mem {
} {
    set i [basciCmdMem]
    if {$i == 0} { error "Error: command mem failed."}
}

###############################################################################
#@cmd/opt run "Run other commands."
###############################################################################
tcl::OptProc run {
    {?object? -list "" "Run object"}
} {
    set i [basciCmdRun $object]
    if {$i == 0} { error "Error: command run failed."}
}

###############################################################################
#@cmd/dedev setenv "Set environmental variables."
#notes: 
#Qinhai - 03/13/2009: This command doesn't work.Need more check.
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc setenv {
    {?objects? -list "" "All objects"}
} {
    set i [basciCmdSetenv $objects]
    if {$i == 0} { error "Error: command setenv failed."}
}
}

###############################################################################
#@cmd/dedev getenv "Get the environmental variables."
#notes:
#Qinhai - 03/13/2009: Need more check.
###############################################################################
if {$ISPTCL_DEDEV_ENABLE} {
tcl::OptProc getenv {
    {?var? -string "" "Env. variable"}
} {
    set i [basciCmdGetenv $var]
    if {$i == 0} { error "Error: command getenv failed."}
}
}
