library verilog;
use verilog.vl_types.all;
entity del6_pulse is
    port(
        A               : in     vl_logic;
        reset           : in     vl_logic;
        Z               : out    vl_logic
    );
end del6_pulse;
