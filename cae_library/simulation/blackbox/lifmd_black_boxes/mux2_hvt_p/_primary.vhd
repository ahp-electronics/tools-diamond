library verilog;
use verilog.vl_types.all;
entity mux2_hvt_p is
    port(
        \out\           : out    vl_logic;
        P               : inout  vl_logic;
        in0             : in     vl_logic;
        in1             : in     vl_logic;
        sel             : in     vl_logic
    );
end mux2_hvt_p;
