library verilog;
use verilog.vl_types.all;
entity cdr_slave is
    port(
        CLK_PHASE       : out    vl_logic_vector(3 downto 0);
        DATA            : out    vl_logic_vector(3 downto 0);
        RETIMED_CLK     : out    vl_logic;
        SLAVE_LOCK      : out    vl_logic;
        AVGING          : in     vl_logic_vector(1 downto 0);
        BIT_WIDTH       : in     vl_logic_vector(1 downto 0);
        CIB_DATA        : in     vl_logic;
        CLK             : in     vl_logic_vector(15 downto 0);
        CLK_WIDTH       : in     vl_logic;
        DATA_SEL        : in     vl_logic;
        EN_CLK_PHASE    : in     vl_logic;
        FIFO_BYPASS     : in     vl_logic;
        CDR_LOCK_ACC    : in     vl_logic_vector(1 downto 0);
        CDR_LOCK_MODE   : in     vl_logic;
        LOCK_IN         : in     vl_logic;
        PAD_DATA        : in     vl_logic;
        RCLK_FIFO_PRIM  : in     vl_logic;
        RCLK_FIFO_SEC   : in     vl_logic;
        RCLK_SEL        : in     vl_logic;
        RST_N           : in     vl_logic;
        TRI_ION         : in     vl_logic
    );
end cdr_slave;
