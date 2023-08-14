library verilog;
use verilog.vl_types.all;
entity fx65_4oscillators is
    generic(
        g_add_delay     : integer := 0
    );
    port(
        in_8inv         : in     vl_logic;
        in_10inv        : in     vl_logic;
        in_12inv        : in     vl_logic;
        in_14inv        : in     vl_logic;
        clk             : in     vl_logic;
        otm             : in     vl_logic;
        out_8inv        : out    vl_logic;
        out_10inv       : out    vl_logic;
        out_12inv       : out    vl_logic;
        out_14inv       : out    vl_logic
    );
end fx65_4oscillators;
