library verilog;
use verilog.vl_types.all;
entity pmu_ckgen is
    port(
        pmu_clk         : out    vl_logic;
        clk_dis_sense   : out    vl_logic;
        pmu_rst_async   : in     vl_logic;
        pmu_lclk        : in     vl_logic;
        pmu_uclk        : in     vl_logic;
        pmu_uclk_sel    : in     vl_logic;
        scan_test_mode  : in     vl_logic
    );
end pmu_ckgen;
