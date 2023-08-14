library verilog;
use verilog.vl_types.all;
entity cdr_master is
    port(
        CLK16           : out    vl_logic_vector(15 downto 0);
        LOCK            : out    vl_logic;
        ALU_BW          : in     vl_logic_vector(1 downto 0);
        TEST_CLK        : out    vl_logic;
        CLK_SEL         : in     vl_logic;
        EN_TEST_CLK     : in     vl_logic;
        FORCE_LOCK      : in     vl_logic;
        HOLD_ALU        : in     vl_logic;
        LOCKACC         : in     vl_logic_vector(1 downto 0);
        PD_N            : in     vl_logic;
        REF_EDGE        : in     vl_logic;
        REF_PRIM        : in     vl_logic;
        RST_N           : in     vl_logic;
        SEL_WIDTH_8     : in     vl_logic;
        TEST_CLK_SEL    : in     vl_logic_vector(3 downto 0);
        TRI_ION         : in     vl_logic
    );
end cdr_master;
