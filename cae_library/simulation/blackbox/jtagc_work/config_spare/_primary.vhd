library verilog;
use verilog.vl_types.all;
entity config_spare is
    port(
        clk_in1         : in     vl_logic;
        clk_in2         : in     vl_logic
    );
end config_spare;
