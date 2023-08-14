library verilog;
use verilog.vl_types.all;
entity cdr_slave_fifo is
    port(
        RD_DATA         : out    vl_logic_vector(3 downto 0);
        BYPASS          : in     vl_logic;
        LOCK            : in     vl_logic;
        RD_CLK          : in     vl_logic;
        RST_N           : in     vl_logic;
        WR_CLK          : in     vl_logic;
        WR_DATA         : in     vl_logic_vector(3 downto 0)
    );
end cdr_slave_fifo;
