library verilog;
use verilog.vl_types.all;
entity BOXT_HRESETN is
    port(
        SCANEN          : in     vl_logic;
        HRESETN_IN      : in     vl_logic;
        HRESETN_OUT     : out    vl_logic
    );
end BOXT_HRESETN;
