library verilog;
use verilog.vl_types.all;
entity glitch_filter is
    port(
        A               : in     vl_logic;
        Z               : out    vl_logic
    );
end glitch_filter;
