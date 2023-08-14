// This file is for VHDL simulation.

module pseudo_pullup
(
	output pullup_output
);

// pragma translate_off
pullup pullup_inst1(pullup_output);
// pragma translate_on

endmodule
