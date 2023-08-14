library verilog;
use verilog.vl_types.all;
entity cdr_fifo_reg is
    port(
        DATA_REG_0      : out    vl_logic_vector(7 downto 0);
        DATA_REG_1      : out    vl_logic_vector(7 downto 0);
        DATA_REG_2      : out    vl_logic_vector(7 downto 0);
        DATA_REG_3      : out    vl_logic_vector(7 downto 0);
        RST_N           : in     vl_logic;
        WR_CLK          : in     vl_logic;
        WR_DATA         : in     vl_logic_vector(3 downto 0);
        WR_POINTER      : in     vl_logic_vector(7 downto 0)
    );
end cdr_fifo_reg;
