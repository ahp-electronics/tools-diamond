-- ispLEVER VHDL Timing Simulation Template: adc_tf_vhd.udo.
-- You may edit this file to control your simulation.
-- You may specify your design unit.
vsim ADC_tf -noglitch -ieee_nowarn -PL pmi_work -sdfmax UUT=adc_refdes.sdf
-- You may specify your waveforms.
add wave /ADC_tf/rstn
add wave /ADC_tf/clk
add wave -radix dec -analog -analogmin 0 -analogmax 65535 -height 60 /ADC_tf/analog_input
add wave -radix dec -analog -analogmin 0 -analogmax 65535 -height 60 /ADC_tf/integrator
add wave /ADC_tf/analog_cmp
add wave /ADC_tf/sample_rdy
add wave -radix dec /ADC_tf/digital_out
add wave -analog -analogmin 0 -analogmax 255 -height 30 -radix dec /ADC_tf/digital_out
add wave /ADC_tf/analog_out
add wave -radix dec /ADC_tf/increase
add wave -radix dec /ADC_tf/decrease
add wave -radix dec /ADC_tf/integrator
add wave -radix dec /ADC_tf/analog_input
-- You may specify your simulation run time.
run 2200000 ns