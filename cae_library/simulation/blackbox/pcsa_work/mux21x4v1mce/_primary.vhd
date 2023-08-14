library verilog;
use verilog.vl_types.all;
entity mux21x4v1mce is
    port(
        D0              : in     vl_logic;
        D1              : in     vl_logic;
        SD              : in     vl_logic;
        Z               : out    vl_logic
    );
end mux21x4v1mce;
