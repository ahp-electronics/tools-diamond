library verilog;
use verilog.vl_types.all;
entity OSCI is
    generic(
        HFCLKDIV        : integer := 1
    );
    port(
        HFOUTEN         : in     vl_logic;
        HFCLKOUT        : out    vl_logic;
        LFCLKOUT        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of HFCLKDIV : constant is 1;
end OSCI;
