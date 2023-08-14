library verilog;
use verilog.vl_types.all;
entity osc_top is
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
        hf_clk_div      : in     vl_logic_vector(1 downto 0);
        hf_config_enable: in     vl_logic;
        hf_fabric_enable: in     vl_logic;
        hf_osc_enable   : in     vl_logic;
        hf_output_enable: in     vl_logic;
        hf_trim_fabric  : in     vl_logic_vector(9 downto 0);
        hf_trim_nv      : in     vl_logic_vector(9 downto 0);
        lf_fabric_enable: in     vl_logic;
        lf_osc_enable   : in     vl_logic;
        lf_output_enable: in     vl_logic;
        lf_trim_fabric  : in     vl_logic_vector(9 downto 0);
        lf_trim_nv      : in     vl_logic_vector(9 downto 0);
        mc1_dtr_en      : in     vl_logic;
        mfg_dtr_en      : in     vl_logic
    );
end osc_top;
