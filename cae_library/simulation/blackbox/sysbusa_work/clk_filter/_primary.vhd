library verilog;
use verilog.vl_types.all;
entity clk_filter is
    port(
        A               : in     vl_logic;
        Z               : out    vl_logic
    );
end clk_filter;
