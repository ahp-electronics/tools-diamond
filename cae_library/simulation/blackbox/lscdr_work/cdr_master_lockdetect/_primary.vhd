library verilog;
use verilog.vl_types.all;
entity cdr_master_lockdetect is
    port(
        MASTER_LOCK     : out    vl_logic;
        CLK_16_0        : in     vl_logic;
        CLK_8_0         : in     vl_logic;
        CLK_16_P1       : in     vl_logic;
        CLK_16_M1       : in     vl_logic;
        CLK_16_P2       : in     vl_logic;
        CLK_16_M2       : in     vl_logic;
        CLK_16_P3       : in     vl_logic;
        CLK_16_M3       : in     vl_logic;
        CLK_16_P4       : in     vl_logic;
        CLK_16_M4       : in     vl_logic;
        CLK_8_P1        : in     vl_logic;
        CLK_8_P2        : in     vl_logic;
        CLK_8_P3        : in     vl_logic;
        CLK_8_P4        : in     vl_logic;
        CLK_8_M1        : in     vl_logic;
        CLK_8_M2        : in     vl_logic;
        CLK_8_M3        : in     vl_logic;
        CLK_8_M4        : in     vl_logic;
        FORCE_LOCK      : in     vl_logic;
        MASTER_LOCK_ACC : in     vl_logic_vector(1 downto 0);
        REF             : in     vl_logic;
        RST_N           : in     vl_logic;
        SEL_WIDTH       : in     vl_logic
    );
end cdr_master_lockdetect;
