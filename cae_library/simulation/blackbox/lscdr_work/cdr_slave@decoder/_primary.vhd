library verilog;
use verilog.vl_types.all;
entity cdr_slaveDecoder is
    port(
        AVGING          : in     vl_logic_vector(1 downto 0);
        CLK             : in     vl_logic_vector(15 downto 0);
        PAD_DATA        : in     vl_logic;
        CIB_DATA        : in     vl_logic;
        DATA_SEL        : in     vl_logic;
        EN_CLK_PHASE    : in     vl_logic;
        LOCK_IN         : in     vl_logic;
        OUTPUT_WIDTH    : in     vl_logic_vector(1 downto 0);
        RST_N           : in     vl_logic;
        SEL_WIDTH       : in     vl_logic;
        CLK_RETIME      : out    vl_logic;
        DATA_RETIME     : out    vl_logic_vector(3 downto 0);
        CLKSTATE        : out    vl_logic_vector(3 downto 0);
        CLKSTATE_FINAL  : out    vl_logic_vector(3 downto 0);
        CLKSTATE_PREVIOUS: out    vl_logic_vector(3 downto 0);
        DATAINT_LOCK    : out    vl_logic;
        RETIMECLK_LOCKDETECT: out    vl_logic
    );
end cdr_slaveDecoder;
