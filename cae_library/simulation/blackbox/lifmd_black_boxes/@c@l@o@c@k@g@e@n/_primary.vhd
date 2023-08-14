library verilog;
use verilog.vl_types.all;
entity CLOCKGEN is
    port(
        PD              : in     vl_logic;
        HS_16BIT_EN     : in     vl_logic;
        CLKIN           : in     vl_logic;
        BitClk          : out    vl_logic;
        ByteClk_ANA     : out    vl_logic;
        ByteClk_CIL     : out    vl_logic;
        DDRClk          : out    vl_logic;
        Load            : out    vl_logic
    );
end CLOCKGEN;
