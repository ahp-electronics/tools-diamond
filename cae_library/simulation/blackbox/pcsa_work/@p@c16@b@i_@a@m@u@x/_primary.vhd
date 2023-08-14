library verilog;
use verilog.vl_types.all;
entity PC16BI_AMUX is
    generic(
        AWID            : integer := 1
    );
    port(
        BIST            : in     vl_logic;
        AA              : in     vl_logic_vector;
        AB              : in     vl_logic_vector;
        AAM             : in     vl_logic_vector;
        ABLSB           : in     vl_logic;
        AAR             : out    vl_logic_vector;
        ABR             : out    vl_logic_vector
    );
end PC16BI_AMUX;
