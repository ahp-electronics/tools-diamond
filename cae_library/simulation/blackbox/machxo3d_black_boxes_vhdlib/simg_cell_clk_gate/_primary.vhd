library verilog;
use verilog.vl_types.all;
entity simg_cell_clk_gate is
    port(
        clk             : in     vl_logic;
        clken           : out    vl_logic;
        testmode        : in     vl_logic;
        enable          : in     vl_logic
    );
end simg_cell_clk_gate;
