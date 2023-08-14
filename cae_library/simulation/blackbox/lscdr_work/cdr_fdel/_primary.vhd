library verilog;
use verilog.vl_types.all;
entity cdr_fdel is
    port(
        A               : in     vl_logic;
        DN              : out    vl_logic;
        Z               : out    vl_logic
    );
end cdr_fdel;
