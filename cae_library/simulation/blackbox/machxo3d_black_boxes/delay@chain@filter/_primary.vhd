library verilog;
use verilog.vl_types.all;
entity delayChainFilter is
    generic(
        DLYCHAINNUM     : integer := 12;
        FILTERSELNUM    : integer := 2
    );
    port(
        filterOut       : out    vl_logic;
        filterIn        : in     vl_logic;
        filterEnable    : in     vl_logic;
        filterSel       : in     vl_logic
    );
end delayChainFilter;
