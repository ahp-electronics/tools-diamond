library verilog;
use verilog.vl_types.all;
entity rosc_ts_core is
    port(
        osc_out         : in     vl_logic;
        otm             : in     vl_logic;
        test_in         : in     vl_logic;
        test_out        : out    vl_logic;
        osc_in          : out    vl_logic
    );
end rosc_ts_core;
