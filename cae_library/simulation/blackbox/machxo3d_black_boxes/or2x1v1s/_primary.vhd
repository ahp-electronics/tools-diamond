library verilog;
use verilog.vl_types.all;
entity or2x1v1s is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Z               : out    vl_logic
    );
end or2x1v1s;
