library verilog;
use verilog.vl_types.all;
entity cfg_div_hseclk is
    port(
        clk_out         : out    vl_logic;
        clk_in          : in     vl_logic;
        clk_en          : in     vl_logic;
        div             : in     vl_logic
    );
end cfg_div_hseclk;
