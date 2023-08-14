#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/impl1/launch_synplify.tcl
#-- Written on Thu Jan 27 17:56:32 2011

project -close
set filename "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/impl1/impl1_syn.prj"
if ([file exists "$filename"]) {
	project -load "$filename"
	project_file -remove *
	} else {
	project -new "$filename"
}

#device options
set_option -technology MACHXO2
set_option -part LCMXO2_1200HC
set_option -speed_grade -5

#-- add_file options
set_option -include_path "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project"
add_file -verilog "C:/lscc/diamond/1.1/cae_library/synthesis/verilog/machxo2.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/clk_gen.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/uptime_wb.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1044/Source/Spi_wb.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../latticemico8_v3_1_verilog/source/isp8_core.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/rom_ebr_wb.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1066/source/verilog/box_ave.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1066/source/verilog/sigmadelta_adc.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1066/source/verilog/adc_top.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/adc_wb.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1042/source/modem.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1042/source/uart_core.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/lm8_top.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../latticemico8_v3_1_verilog/source/isp8_io_cntl.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../latticemico8_v3_1_verilog/source/isp8_flow_cntl.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../latticemico8_v3_1_verilog/source/isp8_alu.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../latticemico8_v3_1_verilog/source/isp8_idec.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../rd1043/source/lm8_wb.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/led_sw_wb.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/reset_gen.v"
add_file -verilog "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/../source/control_soc_demo.v"
#-- top module name
set_option -top_module control_soc_demo
project -result_file "C:/Documents and Settings/shossner/My Documents/shossner/internal_projects/XO2 Control Board/e_production_01_2011/firmware/Demo_MachXO2_Control_SoC/Diamond_project/impl1/impl1.edi"
project -save "$filename"
