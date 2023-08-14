library verilog;
use verilog.vl_types.all;
entity i2cfifo_clk_switch is
    port(
        clk_o           : out    vl_logic;
        clk_i           : in     vl_logic;
        en              : in     vl_logic;
        sgnd            : in     vl_logic;
        sleep_clk       : in     vl_logic;
        spwr            : in     vl_logic;
        stop            : in     vl_logic
    );
end i2cfifo_clk_switch;
