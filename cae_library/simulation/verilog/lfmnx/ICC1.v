module ICC1(
PFRPRMN, PFRJTAGEN,
PFRMCLKO, PFRMCLKOE,
PFRMOSIO, PFRMOSIOE,
PFRMISOO, PFRMISOOE,
PFRCSNO, PFRCSNOE,
PFRMCSN, PFRMCLKI,
PFRMOSII, PFRMISOI, PFRCSNI);

input  PFRPRMN, PFRJTAGEN;
input PFRMCLKO, PFRMCLKOE;
input PFRMOSIO, PFRMOSIOE;
input PFRMISOO, PFRMISOOE;
input PFRCSNO, PFRCSNOE;

output PFRMCSN, PFRMCLKI;
output PFRMOSII, PFRMISOI;
output PFRCSNI;

// SOF-130504

// This one is a plain output.
// allow simulation, dont force to zero.
// assign PFRMCSN  = 1'b0;

// The following are from BIDI signals.
// OE is the Tristate control (PADDT) of the IO pad.
// When OE=1, IO tristate. IO dir is IN, or icc1 outputs are active.
// When OE=0, IO non-tristate. IO dir is OUT, or icc1 module inputs are used.

// Note: IO dir is OPPOSITE of icc1 port dir.

// Enable icc1 outputs when OE=1
assign PFRMCLKI = (PFRMCLKOE && PFRMCLKI);
assign PFRMOSII = (PFRMOSIOE && PFRMOSII);
assign PFRMISOI = (PFRMISOOE && PFRMISOI);
assign PFRCSNI = (PFRCSNOE && PFRCSNI);


endmodule
