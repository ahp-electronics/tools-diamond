library verilog;
use verilog.vl_types.all;
entity PC64B_RTFSM is
    port(
        RUNFSM          : in     vl_logic;
        CNTMAX          : in     vl_logic;
        BFC             : in     vl_logic;
        CLK             : in     vl_logic;
        WE_INP          : out    vl_logic;
        RE_INP          : out    vl_logic;
        INC_INP         : out    vl_logic;
        DATAP_INP       : out    vl_logic;
        RTTEST          : out    vl_logic;
        CHKRD_INP       : out    vl_logic;
        MBFC            : out    vl_logic;
        BC              : out    vl_logic
    );
end PC64B_RTFSM;
