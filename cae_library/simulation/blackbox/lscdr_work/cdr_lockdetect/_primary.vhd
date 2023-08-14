library verilog;
use verilog.vl_types.all;
entity cdr_lockdetect is
    port(
        LOCK_OUT        : out    vl_logic;
        CDR_LOCK_MODE   : in     vl_logic;
        CLK_IN          : in     vl_logic;
        CLKSTATE_PREVIOUS: in     vl_logic_vector(3 downto 0);
        CLKSTATE_PRESENT: in     vl_logic_vector(3 downto 0);
        CDR_LOCK_ACC    : in     vl_logic_vector(1 downto 0);
        DATA_IN         : in     vl_logic;
        LOCK_IN         : in     vl_logic;
        RST_N           : in     vl_logic;
        TRI_ION         : in     vl_logic;
        SEL_WIDTH_8     : in     vl_logic
    );
end cdr_lockdetect;
