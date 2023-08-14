#-------------------------------------------------------------------
# Project         : DDR3 Memory Controller Demo Simulation Script
# File            : ddr3_ecp3_demo.do 
#-------------------------------------------------------------------

# To successfully run this script,  the following changes:
# 1. Update the Latticetool path names with your local folder names
# 2. Rename or copy the following core behavioral models and wrapper
#     - $IP_SRC/ddr3core_beh.v to $IP_SRC/ddr3core.v
#     - $IP_TOP/ddr3_sdram_mem_top_wrapper.v to $IP_TOP/ddr3_sdram_mem_top.v
# 3. Change directory to the folder where this script is located
# 4. Run this script by selecting Tools > Excute macro..

#----- Complete your simulation working folder structure (SIM_PWD)
set LatticeTool C:/lscc/diamond/1.2
set SIM_PWD C:/DK-ECP3-DDR3-010/user_logic/sim/aldec

cd $SIM_PWD 

workspace create ddr3_space 
design create ddr3_design . 
design open ddr3_design 
cd $SIM_PWD 

set sim_working_folder .

#----- map IP library
set ECP3_LIB    $LatticeTool/cae_library/simulation/verilog/ecp3
set PMI_LIB     $LatticeTool/cae_library/simulation/verilog/pmi
set IP_SRC      ../../../core
set IP_MDL      ../../../core/ddr_p_eval/models/ecp3
set TST_SRC     ../../src
set PARAMS      ../../../core/ddr_p_eval/ddr3core/src/params
set TB_PARAMS   ../../../core/ddr_p_eval/testbench/tests/ecp3
set IP_TOP      ../../../core/ddr_p_eval/ddr3core/src/rtl/top/ecp3
set MEM         ../../../core/ddr_p_eval/models/mem
set TB          ../../testbench

#----- compiling all files 
vlog +incdir+$TST_SRC+$PARAMS+$TB_PARAMS+$MEM \
              +define+RTL_SIM+SIM \
              +libext+.v \
              -y $ECP3_LIB \
              -y $PMI_LIB \
              -y $TB \
              -y $MEM \
              -y $IP_SRC \
              -y $IP_MDL \
              -y $IP_TOP \
              -y $TST_SRC \
              $TB/ddr3_test_top_tb.v

#----- simulation starts
vsim +access +r -novopt +nowarnPCDPC -t 1ps ddr3_test_top_tb

#----- view the simulation results

radix -hexadecimal

do wave.do
#add wave -rec /*
run 10 us
