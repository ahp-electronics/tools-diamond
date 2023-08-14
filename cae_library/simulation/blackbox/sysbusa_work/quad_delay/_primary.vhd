library verilog;
use verilog.vl_types.all;
entity quad_delay is
    port(
        A               : in     vl_logic;
        Z               : out    vl_logic
    );
end quad_delay;
