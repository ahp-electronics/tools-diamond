library verilog;
use verilog.vl_types.all;
entity CKBUF_STD is
    port(
        cko             : out    vl_logic;
        cki             : in     vl_logic
    );
end CKBUF_STD;
