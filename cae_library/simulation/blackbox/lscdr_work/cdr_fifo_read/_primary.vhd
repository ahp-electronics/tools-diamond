library verilog;
use verilog.vl_types.all;
entity cdr_fifo_read is
    port(
        RD_POINTER      : out    vl_logic_vector(2 downto 0);
        BYPASS          : in     vl_logic;
        FIFO_START      : in     vl_logic;
        LOCK            : in     vl_logic;
        RST_N           : in     vl_logic;
        RD_CLK          : in     vl_logic
    );
end cdr_fifo_read;
