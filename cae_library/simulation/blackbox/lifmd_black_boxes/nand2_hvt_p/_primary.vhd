library verilog;
use verilog.vl_types.all;
entity nand2_hvt_p is
    port(
        Y               : out    vl_logic;
        P               : inout  vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic
    );
end nand2_hvt_p;
