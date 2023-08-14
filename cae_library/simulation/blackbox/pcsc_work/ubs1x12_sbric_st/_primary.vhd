library verilog;
use verilog.vl_types.all;
entity ubs1x12_sbric_st is
    port(
        CK              : in     vl_logic;
        INITN           : in     vl_logic;
        RB              : in     vl_logic;
        TOKENI          : in     vl_logic;
        COUNTDONE       : in     vl_logic;
        ARSTN           : in     vl_logic;
        TOKENO          : out    vl_logic;
        COUNT           : out    vl_logic;
        TC              : out    vl_logic
    );
end ubs1x12_sbric_st;
