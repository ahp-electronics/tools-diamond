library verilog;
use verilog.vl_types.all;
entity PC12B_CNTL is
    port(
        BIST            : in     vl_logic;
        CNTMAX          : in     vl_logic;
        BFC             : in     vl_logic;
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
        ED0             : out    vl_logic;
        UPDOWN          : out    vl_logic;
        CONETEST        : out    vl_logic;
        RTTEST          : out    vl_logic;
        MBFC            : out    vl_logic;
        BC              : out    vl_logic
    );
end PC12B_CNTL;
