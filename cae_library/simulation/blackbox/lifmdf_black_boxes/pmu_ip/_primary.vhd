library verilog;
use verilog.vl_types.all;
entity pmu_ip is
    generic(
        PMU_NPART       : integer := 1;
        PMUFSMTMR       : integer := 1;
        PMUCREGTMR      : integer := 1
    );
    port(
        pmu_lclk_dis    : out    vl_logic;
        pmu_cfgclk_en   : out    vl_logic;
        pmu_cfgpwr_en   : out    vl_logic;
        pmu_wdt_done    : out    vl_logic;
        pmu_wdt_int     : out    vl_logic;
        pmu_refresh     : out    vl_logic;
        pmu_pseq_run    : out    vl_logic;
        pmu_psave_state : out    vl_logic;
        pmu_idle        : out    vl_logic;
        pmu_norm        : out    vl_logic;
        pmu_lpwr        : out    vl_logic;
        pmu_stby        : out    vl_logic;
        pmu_sslp        : out    vl_logic;
        pmu_dslp        : out    vl_logic;
        pmu_rst_async   : in     vl_logic;
        pmu_lclk        : in     vl_logic;
        pmu_uclk        : in     vl_logic;
        programn        : in     vl_logic;
        pmu_sclk        : in     vl_logic;
        pmu_cs          : in     vl_logic;
        pmu_stb         : in     vl_logic;
        pmu_adr         : in     vl_logic_vector(3 downto 0);
        pmu_wdat        : in     vl_logic_vector(7 downto 0);
        cfg_user_mode   : in     vl_logic;
        cfg_pseq_busy   : in     vl_logic;
        cfg_sbi_seln    : in     vl_logic;
        sbi_sclk        : in     vl_logic;
        sbi_cs          : in     vl_logic;
        sbi_stb         : in     vl_logic;
        sbi_adr         : in     vl_logic_vector(3 downto 0);
        sbi_wdat        : in     vl_logic_vector(7 downto 0);
        cfg_pmu_int     : in     vl_logic;
        cfg_pmu_int_sel : in     vl_logic_vector(1 downto 0);
        sspi_int        : in     vl_logic;
        si2c_int        : in     vl_logic;
        extp_intn       : in     vl_logic;
        cib_int_sel0    : in     vl_logic_vector;
        cib_int_sel1    : in     vl_logic_vector;
        cib_int         : in     vl_logic_vector;
        mcr_uclk_sel    : in     vl_logic;
        mcr_cib_int     : in     vl_logic_vector;
        scan_test_mode  : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of PMU_NPART : constant is 1;
    attribute mti_svvh_generic_type of PMUFSMTMR : constant is 1;
    attribute mti_svvh_generic_type of PMUCREGTMR : constant is 1;
end pmu_ip;
