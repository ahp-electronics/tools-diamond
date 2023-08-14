library verilog;
use verilog.vl_types.all;
entity LSC_BUF is
    port(
        X               : out    vl_logic;
        A               : in     vl_logic;
        VDD             : in     vl_logic;
        VSS             : in     vl_logic;
        VBP             : in     vl_logic;
        VBN             : in     vl_logic
    );
end LSC_BUF;
