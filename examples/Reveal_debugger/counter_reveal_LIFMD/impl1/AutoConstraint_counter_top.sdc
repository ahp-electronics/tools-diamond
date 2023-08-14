
#Begin clock constraint
define_clock -name {counter_top|clk1} {n:counter_top|clk1} -period 4.435 -clockgroup Autoconstr_clkgroup_0 -rise 0.000 -fall 2.218 -route 0.000 
#End clock constraint

#Begin clock constraint
define_clock -name {counter_top|JTAG_TCK} {p:counter_top|JTAG_TCK} -period 5.775 -clockgroup Autoconstr_clkgroup_1 -rise 0.000 -fall 2.888 -route 0.000 
#End clock constraint
