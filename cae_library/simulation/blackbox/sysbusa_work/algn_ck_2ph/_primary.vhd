library verilog;
use verilog.vl_types.all;
entity algn_ck_2ph is
    port(
        ck              : in     vl_logic;
        rst_n           : in     vl_logic;
        ck_p1           : out    vl_logic;
        ck_p2           : out    vl_logic
    );
end algn_ck_2ph;
