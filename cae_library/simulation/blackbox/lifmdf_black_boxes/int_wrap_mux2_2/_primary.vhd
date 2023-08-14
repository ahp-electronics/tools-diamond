library verilog;
use verilog.vl_types.all;
entity int_wrap_mux2_2 is
    port(
        o               : out    vl_logic;
        d0              : in     vl_logic;
        d1              : in     vl_logic;
        sel             : in     vl_logic;
        sgnd            : in     vl_logic;
        spwr            : in     vl_logic
    );
end int_wrap_mux2_2;
