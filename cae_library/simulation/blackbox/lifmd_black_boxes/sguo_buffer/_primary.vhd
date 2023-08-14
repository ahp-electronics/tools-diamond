library verilog;
use verilog.vl_types.all;
entity sguo_buffer is
    port(
        ip_i_out        : out    vl_logic;
        ip_i_in         : in     vl_logic;
        sgnd            : in     vl_logic;
        spwr            : in     vl_logic
    );
end sguo_buffer;
