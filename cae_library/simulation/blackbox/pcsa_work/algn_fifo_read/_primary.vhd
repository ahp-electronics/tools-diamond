library verilog;
use verilog.vl_types.all;
entity algn_fifo_read is
    generic(
        ADDR_WID        : integer := 6;
        FIRST_ADDR      : integer := 0;
        LAST_ADDR       : integer := 63;
        MID_ADDR        : integer := 32
    );
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        sync_done       : in     vl_logic;
        sync_fail       : in     vl_logic;
        fifo_en         : in     vl_logic;
        rd_addr         : out    vl_logic_vector
    );
end algn_fifo_read;
