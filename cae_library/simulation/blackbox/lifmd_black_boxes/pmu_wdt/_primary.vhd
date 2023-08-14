library verilog;
use verilog.vl_types.all;
entity pmu_wdt is
    port(
        pmuwdt_fin      : out    vl_logic;
        pmuwdt_fin_m1   : out    vl_logic;
        pmu_rst_async   : in     vl_logic;
        pmu_clk         : in     vl_logic;
        pmuwdt_set      : in     vl_logic;
        pmuwdt_run      : in     vl_logic;
        pmuwdtcnt_sel   : in     vl_logic_vector(1 downto 0);
        pmuwdtcnt1      : in     vl_logic_vector(31 downto 0);
        pmuwdtcnt2      : in     vl_logic_vector(31 downto 0);
        pmuwdtcnt3      : in     vl_logic_vector(31 downto 0)
    );
end pmu_wdt;
