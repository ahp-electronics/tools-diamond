library verilog;
use verilog.vl_types.all;
entity fx65_osc_12inv is
    generic(
        g_add_delay     : integer := 0
    );
    port(
        \in\            : in     vl_logic;
        otm             : in     vl_logic;
        clk             : in     vl_logic;
        \out\           : out    vl_logic
    );
end fx65_osc_12inv;
