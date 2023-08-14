library verilog;
use verilog.vl_types.all;
entity rosc_ts is
    port(
        osc_out         : in     vl_logic;
        otm             : in     vl_logic;
        clk             : in     vl_logic;
        osc_in          : out    vl_logic
    );
end rosc_ts;
