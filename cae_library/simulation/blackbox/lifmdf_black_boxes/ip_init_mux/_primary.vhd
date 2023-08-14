library verilog;
use verilog.vl_types.all;
entity ip_init_mux is
    port(
        to_ip           : out    vl_logic;
        cib_i           : in     vl_logic;
        sbi_i           : in     vl_logic;
        sbi_sel_n       : in     vl_logic;
        sgnd            : in     vl_logic;
        spwr            : in     vl_logic
    );
end ip_init_mux;
