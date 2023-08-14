set utils_dir           ../../utils
set test_dir            ../../tests
set models_dir          ../../models/$model/sim
set pmi_models          ../../models/pmi
set source_dir          ../../source
set testbench_dir       ../../testbench

#==============================================================================
# Generate prom_init files
#==============================================================================
exec $utils_dir/isp8asm_win -l ./$testcase.lst -vx -o ./prom_init.hex $test_dir/$testcase.s

#==============================================================================
# Generate Instruction Simulator compare file.
#==============================================================================
exec $utils_dir/isp8sim_win -n ./prom_init.hex >./isp8sim_out.txt

file copy -force ./$test_dir/$testcase.v testbench.v

if {![file exists work]} {
   puts "Creating WORK library"
   vlib work
}

#==============================================================================

#==============================================================================
# Compile source files.
#==============================================================================
vlog -novopt  +define+DEBUG=1 +incdir+$source_dir \
                       $source_dir/isp8_alu.v \
                       $source_dir/isp8_flow_cntl.v \
                       $source_dir/isp8_idec.v \
                       $source_dir/isp8_io_cntl.v \
                       $source_dir/isp8_core.v \
                       $testbench_dir/isp8_tb.v \
                       -y $models_dir +libext+.v \
                       -y $pmi_models

#==============================================================================
# Run simulation and create output files.
#==============================================================================
vsim -novopt -GFAMILY_NAME=\"$family_name\" -t 1ps work.isp8_tb
