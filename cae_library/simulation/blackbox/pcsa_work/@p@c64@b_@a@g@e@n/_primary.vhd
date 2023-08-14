library verilog;
use verilog.vl_types.all;
entity PC64B_AGEN is
    generic(
        ADEP            : integer := 2;
        AWID            : integer := 2
    );
    port(
        BIST            : in     vl_logic;
        INCCNT          : in     vl_logic;
        UPDOWN          : in     vl_logic;
        DISTURB         : in     vl_logic;
        CLK             : in     vl_logic;
        ADDM            : out    vl_logic_vector;
        AB_LSB          : out    vl_logic;
        CNTMAX          : out    vl_logic
    );
end PC64B_AGEN;
