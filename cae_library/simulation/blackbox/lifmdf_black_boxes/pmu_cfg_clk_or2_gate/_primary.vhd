library verilog;
use verilog.vl_types.all;
entity pmu_cfg_clk_or2_gate is
    port(
        x               : out    vl_logic;
        a1              : in     vl_logic;
        a2              : in     vl_logic;
        sgnd            : in     vl_logic;
        spwr            : in     vl_logic
    );
end pmu_cfg_clk_or2_gate;
