library verilog;
use verilog.vl_types.all;
entity int_wrap_inv_8 is
    port(
        x               : out    vl_logic;
        a               : in     vl_logic;
        sgnd            : in     vl_logic;
        spwr            : in     vl_logic
    );
end int_wrap_inv_8;
