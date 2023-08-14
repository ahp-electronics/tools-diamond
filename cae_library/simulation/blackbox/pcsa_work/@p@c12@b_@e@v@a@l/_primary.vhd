library verilog;
use verilog.vl_types.all;
entity PC12B_EVAL is
    port(
        BIST            : in     vl_logic;
        CHKRD           : in     vl_logic;
        CONETEST        : in     vl_logic;
        RTTEST          : in     vl_logic;
        BFC             : in     vl_logic;
        MBFC            : in     vl_logic;
        CLK             : in     vl_logic;
        CMP_OUT         : in     vl_logic;
        BF              : out    vl_logic
    );
end PC12B_EVAL;
