library verilog;
use verilog.vl_types.all;
entity SYNCP_HLF is
    generic(
        INIT_VAL        : vl_logic := Hi0
    );
    port(
        q               : out    vl_logic;
        d               : in     vl_logic;
        ck              : in     vl_logic;
        cdn             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of INIT_VAL : constant is 1;
end SYNCP_HLF;
