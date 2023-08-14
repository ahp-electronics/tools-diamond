library verilog;
use verilog.vl_types.all;
entity cdr_pd is
    port(
        FB_CLK_15       : in     vl_logic;
        FB_CLK_7        : in     vl_logic;
        REF             : in     vl_logic;
        RST_N           : in     vl_logic;
        SEL_WIDTH_8     : in     vl_logic;
        UP              : out    vl_logic
    );
end cdr_pd;
