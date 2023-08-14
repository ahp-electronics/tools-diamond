library verilog;
use verilog.vl_types.all;
entity PC12BI_CMUX is
    generic(
        DWID            : integer := 1
    );
    port(
        BIST            : in     vl_logic;
        BW              : in     vl_logic_vector;
        WE              : in     vl_logic;
        RE              : in     vl_logic;
        BWM1            : in     vl_logic;
        BWM0            : in     vl_logic;
        WEM             : in     vl_logic;
        RE_M            : in     vl_logic;
        BWR             : out    vl_logic_vector;
        WER             : out    vl_logic;
        RER             : out    vl_logic
    );
end PC12BI_CMUX;
