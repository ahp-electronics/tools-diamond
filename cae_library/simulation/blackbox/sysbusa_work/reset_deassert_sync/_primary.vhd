library verilog;
use verilog.vl_types.all;
entity reset_deassert_sync is
    port(
        Clk             : in     vl_logic;
        iResetN         : in     vl_logic;
        oResetN         : out    vl_logic
    );
end reset_deassert_sync;
