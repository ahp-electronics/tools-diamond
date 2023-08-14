library verilog;
use verilog.vl_types.all;
entity pmu_isync is
    generic(
        PMU_NPART       : integer := 1
    );
    port(
        programn_sync   : out    vl_logic;
        cfg_umode_sync  : out    vl_logic;
        cfg_pseq_busy_sync: out    vl_logic;
        cfg_pmu_int_sel_sync: out    vl_logic_vector(1 downto 0);
        cfg_pmu_int_sync: out    vl_logic;
        spiint_sync     : out    vl_logic;
        i2cint_sync     : out    vl_logic;
        extint_sync     : out    vl_logic;
        cibint_sel_sync : out    vl_logic_vector(1 downto 0);
        cibint_sync     : out    vl_logic;
        uwdt_start_set_sync: out    vl_logic;
        pmu_uwdt_en_sync: out    vl_logic;
        pmu_rst_async   : in     vl_logic;
        pmu_clk         : in     vl_logic;
        programn        : in     vl_logic;
        cfg_user_mode   : in     vl_logic;
        cfg_pseq_busy   : in     vl_logic;
        cfg_pmu_int_sel : in     vl_logic_vector(1 downto 0);
        cfg_pmu_int     : in     vl_logic;
        uwdt_start_set  : in     vl_logic;
        sspi_int        : in     vl_logic;
        si2c_int        : in     vl_logic;
        extp_intn       : in     vl_logic;
        cib_int_sel0    : in     vl_logic_vector;
        cib_int_sel1    : in     vl_logic_vector;
        cib_int         : in     vl_logic_vector;
        mcr_cib_int     : in     vl_logic_vector;
        pmu_int_extpen  : in     vl_logic;
        pmu_int_sspien  : in     vl_logic;
        pmu_int_si2cen  : in     vl_logic;
        pmu_ip_en       : in     vl_logic;
        pmu_uwdt_en     : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of PMU_NPART : constant is 1;
end pmu_isync;
