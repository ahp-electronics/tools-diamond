onerror {resume}
quietly virtual signal -install /ddr3_test_top_tb/UUT/u_ddr3_sdram_mem_top { /ddr3_test_top_tb/UUT/u_ddr3_sdram_mem_top/wl_dyndel[6:0]} WL_DEL_0
quietly virtual signal -install /ddr3_test_top_tb/UUT/u_ddr3_sdram_mem_top { /ddr3_test_top_tb/UUT/u_ddr3_sdram_mem_top/wl_dyndel[13:7]} WL_DEL_1
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Global Signals}
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/clk_in
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/sclk
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/reset_n
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/u_ddr3_sdram_mem_top/clocking/sclk_200
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/u_ddr3_sdram_mem_top/clocking/sclk_400
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/u_ddr3_sdram_mem_top/clocking/eclk_400
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/u_ddr3_sdram_mem_top/clocking/pll_lock
add wave -noupdate -divider {DDR3 Interface}
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/em_ddr_reset_n
add wave -noupdate -format Literal /ddr3_test_top_tb/em_ddr_clk
add wave -noupdate -format Literal /ddr3_test_top_tb/em_ddr_cke
add wave -noupdate -format Literal /ddr3_test_top_tb/em_ddr_addr
add wave -noupdate -format Literal /ddr3_test_top_tb/em_ddr_ba
add wave -noupdate -format Logic /ddr3_test_top_tb/em_ddr_ras_n
add wave -noupdate -format Logic /ddr3_test_top_tb/em_ddr_cas_n
add wave -noupdate -format Logic /ddr3_test_top_tb/em_ddr_we_n
add wave -noupdate -format Literal /ddr3_test_top_tb/em_ddr_cs_n
add wave -noupdate -format Literal /ddr3_test_top_tb/em_ddr_data
add wave -noupdate -format Literal /ddr3_test_top_tb/em_ddr_dm
add wave -noupdate -format Literal /ddr3_test_top_tb/em_ddr_dqs
add wave -noupdate -format Literal /ddr3_test_top_tb/em_ddr_odt
add wave -noupdate -divider {Local Interface}
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/init_start
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/init_done
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/cmd_rdy
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/addr
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/cmd
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/cmd_valid
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/cmd_burst_cnt
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/ofly_burst_len
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/datain_rdy
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/write_data
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/data_mask
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/read_data
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/read_data_valid
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/read_pulse_tap
add wave -noupdate -divider {Data Check}
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/err_det
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/u_ddr_ulogic/byte_ok
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/u_ddr_ulogic/mismatch
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/u_ddr_ulogic/U_data_gen_chk/exp_data
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/u_ddr_ulogic/U_data_gen_chk/read_data_d
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/u_ddr_ulogic/U_data_gen_chk/read_data_valid_d
add wave -noupdate -divider {Backend Parameters}
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/u_ddr_ulogic/Test_Mode
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/u_ddr_ulogic/Data_Mode
add wave -noupdate -format Logic /ddr3_test_top_tb/UUT/u_ddr_ulogic/ClkSel
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/u_ddr_ulogic/Rank_Sel
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/u_ddr_ulogic/Bl_Mode
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/u_ddr_ulogic/Odt
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/u_ddr_ulogic/curr_addr_wr
add wave -noupdate -format Literal /ddr3_test_top_tb/UUT/u_ddr_ulogic/curr_addr_rd
add wave -noupdate -divider {All Others}
TreeUpdate [SetDefaultTree]
configure wave -namecolwidth 479
configure wave -valuecolwidth 99
configure wave -justifyvalue right
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1000000000
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {10500 ns}
