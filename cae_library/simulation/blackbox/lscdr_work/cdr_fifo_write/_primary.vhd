library verilog;
use verilog.vl_types.all;
entity cdr_fifo_write is
    port(
        WR_POINTER      : out    vl_logic_vector(7 downto 0);
        BYPASS          : in     vl_logic;
        FIFO_START      : in     vl_logic;
        LOCK            : in     vl_logic;
        RST_N           : in     vl_logic;
        WR_CLK          : in     vl_logic
    );
end cdr_fifo_write;
