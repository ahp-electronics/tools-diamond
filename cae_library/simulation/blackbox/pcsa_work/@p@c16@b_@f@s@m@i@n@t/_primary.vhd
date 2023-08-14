library verilog;
use verilog.vl_types.all;
entity PC16B_FSMINT is
    port(
        MWE_INP         : in     vl_logic;
        RWE_INP         : in     vl_logic;
        RE_INP          : in     vl_logic;
        MINC_INP        : in     vl_logic;
        RINC_INP        : in     vl_logic;
        DISTURB_INP     : in     vl_logic;
        MDATAP_INP      : in     vl_logic;
        RDATAP_INP      : in     vl_logic;
        MCHKRD_INP      : in     vl_logic;
        RCHKRD_INP      : in     vl_logic;
        BWTEST          : in     vl_logic;
        CLK             : in     vl_logic;
        WE              : out    vl_logic;
        RE              : out    vl_logic;
        CHKRD           : out    vl_logic;
        INC             : out    vl_logic;
        DISTURB         : out    vl_logic;
        DM              : out    vl_logic;
        BW1M            : out    vl_logic;
        BW0M            : out    vl_logic;
        ED1             : out    vl_logic;
        ED0             : out    vl_logic
    );
end PC16B_FSMINT;
