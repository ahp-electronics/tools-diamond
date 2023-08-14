library verilog;
use verilog.vl_types.all;
entity LSC_MUX2 is
    port(
        X               : out    vl_logic;
        D0              : in     vl_logic;
        D1              : in     vl_logic;
        S               : in     vl_logic;
        VDD             : in     vl_logic;
        VSS             : in     vl_logic;
        VBP             : in     vl_logic;
        VBN             : in     vl_logic
    );
end LSC_MUX2;
