library verilog;
use verilog.vl_types.all;
entity PC16B_MAINFSM is
    port(
        RUNFSM          : in     vl_logic;
        CNTMAX          : in     vl_logic;
        CLK             : in     vl_logic;
        WE_INP          : out    vl_logic;
        INC_INP         : out    vl_logic;
        DISTURB_INP     : out    vl_logic;
        DATAP_INP       : out    vl_logic;
        CHKRD_INP       : out    vl_logic;
        UPDOWN          : out    vl_logic;
        BWTEST          : out    vl_logic;
        CONETEST        : out    vl_logic;
        RUN_NFSM        : out    vl_logic
    );
end PC16B_MAINFSM;
