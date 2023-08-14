library verilog;
use verilog.vl_types.all;
entity ip_o_2_cib_sleep_gate is
    port(
        cib_i_out       : out    vl_logic;
        ip_o_in         : in     vl_logic;
        pg_ctrl         : in     vl_logic;
        sgnd            : in     vl_logic;
        spwr            : in     vl_logic
    );
end ip_o_2_cib_sleep_gate;
