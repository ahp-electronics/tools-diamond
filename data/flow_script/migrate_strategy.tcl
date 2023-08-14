#Scripts to call hdl converter engine
#migrate lse strategy to synplify
proc migrate_lse_to_synplify_strategy {strategy_name} {

	set strategyGetCmd [list prj_strgy get_value -strategy $strategy_name ]
	set strategySetCmd [list prj_strgy set_value -strategy $strategy_name ]
	set ignore_frequency 0

	set args ""
	#1. FSM encoding Style => FSM encoding
	set val [eval $strategyGetCmd "lse_fsm_encoding"]
	if {${val} == "Auto"} {
		lappend args "syn_fsm_encoding=True"
	 } else {
		lappend args "syn_fsm_encoding=False"
	}	

	#2. Fixed Gated Clocks => Clock Conversion
	set val [eval $strategyGetCmd "lse_fix_gated_clocks"]
	lappend args "syn_fix_gated_and_generated_clks=${val}"

	#3. Force GSR => Force GSR
	set val [eval $strategyGetCmd "lse_force_gsr"]
	if {${val} == "Auto"} {
		lappend args "syn_force_gsr=Auto"
	} elseif {${val} == "Yes"} {
		lappend args "syn_force_gsr=True"
	} elseif {${val} == "No"}  {
		lappend args "syn_force_gsr=False"
	}

	#4. Hardware Evaluation => Hardware Evaluation (From Translate)
	set val [eval $strategyGetCmd "lse_hardware_eval"]
	lappend args "bd_hardware_eval=${val}"

	#5. Macro Search Path=>Macro Search Path (From Translate)
	set val [eval $strategyGetCmd "lse_macro_search_path"]
	lappend args "bd_macro_search_path=${val}"

	#6. Max Fanout Limit=>Fanout Guide
	set val [eval $strategyGetCmd "lse_max_fanout_limit"]
	lappend args "syn_fanout_limit=${val}"	

	#7. Memory Initial Value File Search Path=>Memory Initial Search Path (From Translate)
	set val [eval $strategyGetCmd "lse_mem_init_file_path"]
	lappend args "bd_mem_init_file_path=${val}"	

	#8. Number of Critical Paths=>Number of Critical Paths
	set val [eval $strategyGetCmd "lse_critical_path_num"]
	lappend args "syn_critical_path_num=${val}"	
	
	#9. Optimization Goal => Area
	set val [eval $strategyGetCmd "lse_opt_goal"]
	if {${val} == "Area"} {
		lappend args "syn_area=True"
		lappend args "syn_frequency=1"
		set ignore_frequency 1
	 } else {
		lappend args "syn_area=False"
	}		
	
	#10. Remove Duplicate registers=>Remove Duplicate registers
	set val [eval $strategyGetCmd "lse_remove_dup_regs"]
	if {${val} == "True"} {
		lappend args "syn_allow_dup_modules=False"
	 } else {
		lappend args "syn_allow_dup_modules=True"
	}	

	#11. Remove LOC Properties=>Remove LOC Properties (From Translate)
	set val [eval $strategyGetCmd "lse_remove_loc_prop"]
	lappend args "bd_remove_loc_prop=${val}"

	#12. Resolved Mixed Drivers=>Resolve Mixed Drivers
	set val [eval $strategyGetCmd "lse_resolved_mixed_drivers"]
	lappend args "syn_resolved_mixed_drivers=${val}"	

	#13. Resource Sharing=>Resource Sharing
	set val [eval $strategyGetCmd "lse_res_sharing"]
	lappend args "syn_res_sharing=${val}"

	#14. Target Frequency (MHz)=>Frequency (MHz)
	if {$ignore_frequency == 0} {
		set val [eval $strategyGetCmd "lse_frequency"]
		lappend args "syn_frequency=${val}"	
    }

	#15. Use IO Insertion=>Use IO Insertion
	set val [eval $strategyGetCmd "lse_use_io_insertion"]
	if {${val} == "True"} {
		lappend args "syn_disable_io_insert=False"
	 } else {
		lappend args "syn_disable_io_insert=True"
	}

	#16. Use LPF Created from SDC in Project =>Use LPF Created from SDC in Project 
	set val [eval $strategyGetCmd "lse_use_lpf_file"]
	lappend args "syn_use_lpf_file=${val}"		

	#17. VHDL2008 =>VHDL2008 
	set val [eval $strategyGetCmd "lse_vhdl2008"]
	lappend args "syn_vhdl2008=${val}"

	#set strategy
	set cmd [concat $strategySetCmd $args]

	#puts "$cmd"
	eval $cmd
}

#migrate synplify strategy to lse
proc migrate_synplify_to_lse_strategy {strategy_name} {
	set strategyGetCmd [list prj_strgy get_value -strategy $strategy_name ]
	set strategySetCmd [list prj_strgy set_value -strategy $strategy_name ]
	set ignore_frequency 0

	set args ""
	#1. FSM encoding Style => FSM encoding
	set val [eval $strategyGetCmd "syn_fsm_encoding"]
	if {${val} == "True"} {
		lappend args "lse_fsm_encoding=Auto"
	 } else {
		lappend args "lse_fsm_encoding=binary"
	}	

	#2. Fixed Gated Clocks => Clock Conversion
	set val [eval $strategyGetCmd "syn_fix_gated_and_generated_clks"]
	lappend args "lse_fix_gated_clocks=${val}"

	#3. Force GSR => Force GSR
	set val [eval $strategyGetCmd "syn_force_gsr"]
	if {${val} == "Auto"} {
		lappend args "lse_force_gsr=Auto"
	} elseif {${val} == "True"} {
		lappend args "lse_force_gsr=Yes"
	} elseif {${val} == "False"}  {
		lappend args "lse_force_gsr=No"
	}

	#4. Hardware Evaluation => Hardware Evaluation (From Translate)
	set val [eval $strategyGetCmd "bd_hardware_eval"]
	lappend args "lse_hardware_eval=${val}"

	#5. Macro Search Path=>Macro Search Path (From Translate)
	set val [eval $strategyGetCmd "bd_macro_search_path"]
	lappend args "lse_macro_search_path=${val}"

	#6. Max Fanout Limit=>Fanout Guide
	set val [eval $strategyGetCmd "syn_fanout_limit"]
	lappend args "lse_max_fanout_limit=${val}"	

	#7. Memory Initial Value File Search Path=>Memory Initial Search Path (From Translate)
	set val [eval $strategyGetCmd "bd_mem_init_file_path"]
	lappend args "lse_mem_init_file_path=${val}"	

	#8. Number of Critical Paths=>Number of Critical Paths
	set val [eval $strategyGetCmd "syn_critical_path_num"]
	lappend args "lse_critical_path_num=${val}"	
	
	#9. Optimization Goal => Area
	set val [eval $strategyGetCmd "syn_area"]
	if {${val} == "True"} {
		lappend args "lse_opt_goal=Area"
	 } else {
		lappend args "lse_opt_goal=Balance"
	}		
	
	#10. Remove Duplicate registers=>Remove Duplicate registers
	set val [eval $strategyGetCmd "syn_allow_dup_modules"]
	if {${val} == "True"} {
		lappend args "lse_remove_dup_regs=False"
	 } else {
		lappend args "lse_remove_dup_regs=True"
	}	

	#11. Remove LOC Properties=>Remove LOC Properties (From Translate)
	set val [eval $strategyGetCmd "bd_remove_loc_prop"]
	lappend args "lse_remove_loc_prop=${val}"

	#12. Resolved Mixed Drivers=>Resolve Mixed Drivers
	set val [eval $strategyGetCmd "syn_resolved_mixed_drivers"]
	lappend args "lse_resolved_mixed_drivers=${val}"	

	#13. Resource Sharing=>Resource Sharing
	set val [eval $strategyGetCmd "syn_res_sharing"]
	lappend args "lse_res_sharing=${val}"

	#14. Target Frequency (MHz)=>Frequency (MHz)
	if {$ignore_frequency == 0} {
		set val [eval $strategyGetCmd "syn_frequency"]
		lappend args "lse_frequency=${val}"	
    }

	#15. Use IO Insertion=>Use IO Insertion
	set val [eval $strategyGetCmd "syn_disable_io_insert"]
	if {${val} == "True"} {
		lappend args "lse_use_io_insertion=False"
	 } else {
		lappend args "lse_use_io_insertion=True"
	}

	#16. Use LPF Created from SDC in Project =>Use LPF Created from SDC in Project 
	set val [eval $strategyGetCmd "syn_use_lpf_file"]
	lappend args "lse_use_lpf_file=${val}"		

	#17. VHDL2008 =>VHDL2008 
	set val [eval $strategyGetCmd "syn_vhdl2008"]
	lappend args "lse_vhdl2008=${val}"

	#set strategy
	set cmd [concat $strategySetCmd $args]

	#puts "$cmd"
	eval $cmd
}

