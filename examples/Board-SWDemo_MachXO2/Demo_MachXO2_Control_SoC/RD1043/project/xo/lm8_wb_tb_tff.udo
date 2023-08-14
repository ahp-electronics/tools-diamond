-- ispLEVER Verilog Functional Simulation Template: lm8_wb_tb_tff.udo.
-- You may edit this file to control your simulation.
-- You may specify your design unit.
-- You may specify your waveforms.
clear -wave
add wave /lm8_wb_tb/clk_i
add wave /lm8_wb_tb/rst_i
add wave -divider {### LatticeMico8 Signals ###}
add wave -radix hexadecimal /lm8_wb_tb/lm8_addr
add wave -radix hexadecimal /lm8_wb_tb/lm8_ext_io_din
add wave  /lm8_wb_tb/lm8_ext_io_rd
add wave -radix hexadecimal /lm8_wb_tb/lm8_ext_io_dout
add wave /lm8_wb_tb/lm8_ext_io_wr
add wave /lm8_wb_tb/lm8_io_ready
add wave -divider {### Wishbone Master Signals ###}
add wave /lm8_wb_tb/wb_cyc_o
add wave /lm8_wb_tb/wb_sel_o
add wave /lm8_wb_tb/wb_we_o
add wave /lm8_wb_tb/wb_stb_o
add wave /lm8_wb_tb/wb_ack_i
add wave -radix hexadecimal /lm8_wb_tb/wb_adr_o
add wave -radix hexadecimal /lm8_wb_tb/wb_dat_i
add wave -radix hexadecimal /lm8_wb_tb/wb_dat_o

-- You may specify your simulation run time.
run 7500 ns
