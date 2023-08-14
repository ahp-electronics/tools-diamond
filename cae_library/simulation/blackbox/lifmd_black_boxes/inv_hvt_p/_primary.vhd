library verilog;
use verilog.vl_types.all;
entity inv_hvt_p is
    port(
        Y               : out    vl_logic;
        P               : inout  vl_logic;
        A               : in     vl_logic
    );
end inv_hvt_p;
