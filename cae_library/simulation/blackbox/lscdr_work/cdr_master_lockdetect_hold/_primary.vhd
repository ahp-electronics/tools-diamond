library verilog;
use verilog.vl_types.all;
entity cdr_master_lockdetect_hold is
    port(
        LOCK_IN         : in     vl_logic;
        CLK             : in     vl_logic;
        RST_N           : in     vl_logic;
        LOCK_OUT        : out    vl_logic
    );
end cdr_master_lockdetect_hold;
