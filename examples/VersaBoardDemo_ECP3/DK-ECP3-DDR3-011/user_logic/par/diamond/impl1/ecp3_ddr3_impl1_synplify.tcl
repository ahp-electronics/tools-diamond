#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology LATTICE-ECP3
set_option -part LFE3_35EA
set_option -package FN484C
set_option -speed_grade -8

#compilation/mapping options
set_option -symbolic_fsm_compiler true
set_option -resource_sharing true

#use verilog 2001 standard option
set_option -vlog_std v2001

#map options
set_option -frequency 200
set_option -fanout_limit 100
set_option -auto_constrain_io true
set_option -disable_io_insertion false
set_option -retiming false; set_option -pipe false
set_option -force_gsr false
set_option -compiler_compatible true
set_option -dup false

set_option -default_enum_encoding default

#simulation options


#timing analysis options
set_option -num_critical_paths 3
set_option -num_startend_points 0

#automatic place and route (vendor) options
set_option -write_apr_constraint 0

#synplifyPro options
set_option -fixgatedclocks 3
set_option -fixgeneratedclocks 3
set_option -update_models_cp 0
set_option -resolve_multiple_driver 1

#-- add_file options
set_option -include_path {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/core/ddr_p_eval/ddr3core/src/params}
set_option -include_path {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond}
add_file -verilog {C:/lscc/1.3_20110802-1_3p.92/diamond/1.3/cae_library/synthesis/verilog/ecp3.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../../core/ddr_p_eval/ddr3core/src/params/ddr3_sdram_mem_params.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../src/ddr3_test_params.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../src/led_15seg_drv.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../src/lfsr128.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../src/data_gen_chk.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../src/ddr_ulogic.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../../core/ddr_p_eval/models/ecp3/clk_phase.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../../core/ddr_p_eval/models/ecp3/jitter_filter.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../../core/ddr_p_eval/models/ecp3/clk_stop.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../../core/ddr_p_eval/models/ecp3/pll_control.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../../core/ddr_p_eval/models/ecp3/ddr3_pll.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../../core/ddr_p_eval/models/ecp3/ddr3_clks.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../../core/ddr3core_bb.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../../core/ddr_p_eval/ddr3core/src/rtl/top/ecp3/ddr3_sdram_mem_top_wrapper.v}
add_file -verilog {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/../../src/ddr3_test_top.v}

#-- top module name
set_option -top_module ddr3_test_top

#-- set result format/file last
project -result_file {C:/work/SWDemoProject/VersaBoard/DK-ECP3-DDR3-011/user_logic/par/diamond/impl1/ecp3_ddr3_impl1.edi}

#-- error message log file
project -log_file {ecp3_ddr3_impl1.srf}

#-- set any command lines input by customer


#-- run Synplify with 'arrange HDL file'
project -run
