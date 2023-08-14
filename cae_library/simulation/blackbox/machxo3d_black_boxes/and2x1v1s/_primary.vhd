library verilog;
use verilog.vl_types.all;
entity and2x1v1s is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Z               : out    vl_logic
    );
end and2x1v1s;
