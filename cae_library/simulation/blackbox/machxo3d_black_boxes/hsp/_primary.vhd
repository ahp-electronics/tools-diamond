library verilog;
use verilog.vl_types.all;
entity hsp is
    generic(
        WD              : integer := 32;
        DEF_VAL         : integer := 0
    );
    port(
        reset           : in     vl_logic;
        wclk            : in     vl_logic;
        wdata           : in     vl_logic_vector;
        wr              : in     vl_logic;
        full            : out    vl_logic;
        rclk            : in     vl_logic;
        rdata           : out    vl_logic_vector;
        rd              : in     vl_logic;
        empty           : out    vl_logic
    );
end hsp;
