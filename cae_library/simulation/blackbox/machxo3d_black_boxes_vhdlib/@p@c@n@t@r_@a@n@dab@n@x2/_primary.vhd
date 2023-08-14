library verilog;
use verilog.vl_types.all;
entity PCNTR_ANDabNX2 is
    port(
        z               : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic
    );
end PCNTR_ANDabNX2;
