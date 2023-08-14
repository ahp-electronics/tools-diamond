library verilog;
use verilog.vl_types.all;
entity PC16BI_EVAL is
    generic(
        DWID            : integer := 2
    );
    port(
        CK              : in     vl_logic;
        Q               : in     vl_logic_vector;
        ED1             : in     vl_logic;
        ED0             : in     vl_logic;
        MF              : out    vl_logic
    );
end PC16BI_EVAL;
