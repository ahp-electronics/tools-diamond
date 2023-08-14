library verilog;
use verilog.vl_types.all;
entity fmux_41 is
    port(
        d3              : in     vl_logic;
        d2              : in     vl_logic;
        d1              : in     vl_logic;
        d0              : in     vl_logic;
        s2              : in     vl_logic;
        s1              : in     vl_logic;
        z               : out    vl_logic
    );
end fmux_41;
