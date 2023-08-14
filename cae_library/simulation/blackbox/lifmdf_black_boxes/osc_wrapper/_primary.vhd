library verilog;
use verilog.vl_types.all;
entity osc_wrapper is
    port(
        dtr_clk_out     : out    vl_logic;
        gmbias_current_test: out    vl_logic;
        hf_clk_config   : out    vl_logic;
        hf_clk_out      : out    vl_logic;
        hf_vref_test    : out    vl_logic;
        i2c_clk_out     : out    vl_logic;
        lf_clk_out      : out    vl_logic;
        lf_vref_test    : out    vl_logic;
        pmu_clk_out     : out    vl_logic;
        vcc             : inout  vl_logic;
        vss             : inout  vl_logic;
        cfg_clk_persist : in     vl_logic;
        hf_clk_div      : in     vl_logic_vector(1 downto 0);
        hf_output_enable: in     vl_logic;
        hf_trim_fabric  : in     vl_logic_vector(9 downto 0);
        hf_trim_nv      : in     vl_logic_vector(9 downto 0);
        lf_trim_fabric  : in     vl_logic_vector(9 downto 0);
        lf_trim_nv      : in     vl_logic_vector(9 downto 0);
        mc1_dtr_en      : in     vl_logic;
        mc1_hf_fabric_enable: in     vl_logic;
        mc1_hf_osc_enable: in     vl_logic;
        mc1_hfdiv_cbit  : in     vl_logic_vector(1 downto 0);
        mc1_hfdiv_fabric_enable: in     vl_logic;
        mc1_lf_fabric_enable: in     vl_logic;
        mc1_pe_test_lfosc_disable: in     vl_logic;
        mfg_dtr_en      : in     vl_logic;
        pmu_cfgclk_en   : in     vl_logic;
        por_b           : in     vl_logic;
        sleep_b         : in     vl_logic;
        stop_b          : in     vl_logic;
        vccpg           : in     vl_logic
    );
end osc_wrapper;
