library verilog;
use verilog.vl_types.all;
entity PC12BI_DMUX is
    generic(
        DWID            : integer := 1
    );
    port(
        BIST            : in     vl_logic;
        D               : in     vl_logic_vector;
        DM              : in     vl_logic;
        DR              : out    vl_logic_vector
    );
end PC12BI_DMUX;
