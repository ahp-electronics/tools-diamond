library verilog;
use verilog.vl_types.all;
entity sguo_sleep_gate is
    port(
        ip_i_out        : out    vl_logic;
        cib_o_in        : in     vl_logic;
        pg_ctrl         : in     vl_logic;
        sgnd            : in     vl_logic;
        spwr            : in     vl_logic
    );
end sguo_sleep_gate;
