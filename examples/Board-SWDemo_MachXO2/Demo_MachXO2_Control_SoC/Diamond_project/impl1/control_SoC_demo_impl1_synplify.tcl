#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology MACHXO2
set_option -part LCMXO2_1200HC
set_option -speed_grade -5

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

set_option -force_gsr false
set_option -compiler_compatible true
set_option -dup false
set_option -frequency 1

set_option -default_enum_encoding default

#simulation options
set_option -write_verilog true
set_option -write_vhdl true

#timing analysis options
set_option -num_critical_paths 3
set_option -num_startend_points 0

#automatic place and route (vendor) options
set_option -write_apr_constraint 0

#synplifyPro options
set_option -fixgatedclocks 3
set_option -fixgeneratedclocks 3
set_option -update_models_cp 0

#-- add_file options
set_option -include_path {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project}
add_file -verilog {C:/Diamond1_2beta/diamond/1.2/cae_library/synthesis/verilog/machxo2.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/clk_gen.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/uptime_wb.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1044/Source/Spi_wb.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../latticemico8_v3_1_verilog/source/isp8_core.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/rom_ebr_wb.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1066/source/verilog/box_ave.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1066/source/verilog/sigmadelta_adc.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1066/source/verilog/adc_top.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/adc_wb.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1042/source/modem.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1042/source/uart_core.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/lm8_top.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../latticemico8_v3_1_verilog/source/isp8_io_cntl.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../latticemico8_v3_1_verilog/source/isp8_flow_cntl.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../latticemico8_v3_1_verilog/source/isp8_alu.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../latticemico8_v3_1_verilog/source/isp8_idec.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1043/source/lm8_wb.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/led_sw_wb.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/reset_gen.v}
add_file -verilog {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/control_soc_demo.v}

#-- top module name
set_option -top_module control_soc_demo

#-- set result format/file last
project -result_file {C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/impl1/control_SoC_demo_impl1.edi}

#-- error message log file
project -log_file {control_SoC_demo_impl1.srf}

#-- set any command lines input by customer


#-- run Synplify with 'arrange HDL file'
project -run hdl_info_gen -fileorder
project -run
