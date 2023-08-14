#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology LATTICE-ECP2
set_option -part LFE2_35E
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

#-- add_file options
add_file -vhdl "C:/lscc/diamond/1.0/cae_library/synthesis/vhdl/ecp2.vhd"
add_file -vhdl -lib "work" "C:/Documents and Settings/bcaslis/My Documents/balidesigns/mixedcounter/vhdl/reveal_workspace/tmpreveal/typecount_rvl_top.vhd"


#-- set result format/file last
project -result_file "C:/Documents and Settings/bcaslis/My Documents/balidesigns/mixedcounter/vhdl/mixedcounter_vhdl.edi"

#-- error message log file
project -log_file "mixedcounter_vhdl.srf"

#-- run Synplify with 'arrange HDL file'
project -run hdl_info_gen -fileorder
project -run
