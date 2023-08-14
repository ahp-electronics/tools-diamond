library verilog;
use verilog.vl_types.all;
entity osc_digital is
    generic(
        LF_DIV_STRT_CNT : integer := 1;
        HF_DIV_STRT_CNT : integer := 7
    );
    port(
        hf_clk_div      : in     vl_logic_vector(1 downto 0);
        hf_clk_out      : out    vl_logic;
        hf_fabric_enable: in     vl_logic;
        hf_on           : out    vl_logic;
        hf_osc_enable   : in     vl_logic;
        hf_osc_out      : in     vl_logic;
        hf_output_enable: in     vl_logic;
        hf_therm_trim   : out    vl_logic_vector(14 downto 0);
        hf_trim         : out    vl_logic_vector(3 downto 0);
        hf_trim_fabric  : in     vl_logic_vector(9 downto 0);
        hf_trim_msb     : out    vl_logic;
        hf_trim_nv      : in     vl_logic_vector(9 downto 0);
        hf_config_enable: in     vl_logic;
        hf_clk_config   : out    vl_logic;
        mfg_dtr_en      : in     vl_logic;
        mc1_dtr_en      : in     vl_logic;
        lf_clk_out      : out    vl_logic;
        dtr_clk_out     : out    vl_logic;
        i2c_clk_out     : out    vl_logic;
        pmu_clk_out     : out    vl_logic;
        lf_fabric_enable: in     vl_logic;
        lf_on           : out    vl_logic;
        lf_osc_enable   : in     vl_logic;
        lf_osc_out      : in     vl_logic;
        lf_output_enable: in     vl_logic;
        lf_therm_trim   : out    vl_logic_vector(14 downto 0);
        lf_trim         : out    vl_logic_vector(3 downto 0);
        lf_trim_fabric  : in     vl_logic_vector(9 downto 0);
        lf_trim_msb     : out    vl_logic;
        lf_trim_nv      : in     vl_logic_vector(9 downto 0);
        ref_on          : out    vl_logic;
        spwr            : in     vl_logic;
        sgnd            : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of LF_DIV_STRT_CNT : constant is 1;
    attribute mti_svvh_generic_type of HF_DIV_STRT_CNT : constant is 1;
end osc_digital;
