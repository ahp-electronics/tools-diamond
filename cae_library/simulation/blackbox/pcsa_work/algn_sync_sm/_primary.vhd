library verilog;
use verilog.vl_types.all;
entity algn_sync_sm is
    generic(
        DNCT_WID        : integer := 6;
        WAIT_WID        : integer := 5;
        rst             : integer := 0;
        count           : integer := 1;
        error           : integer := 2;
        synch           : integer := 3
    );
    port(
        reset_n         : in     vl_logic;
        clk             : in     vl_logic;
        any_fp          : in     vl_logic;
        all_fp          : in     vl_logic;
        fifo_hi_mark    : in     vl_logic_vector;
        latency         : in     vl_logic_vector;
        clear           : out    vl_logic;
        sync_done       : out    vl_logic;
        sync_fail       : out    vl_logic
    );
end algn_sync_sm;
