library verilog;
use verilog.vl_types.all;
entity pmu_sci is
    port(
        pmucr           : out    vl_logic_vector(7 downto 0);
        pmuwdtcr0       : out    vl_logic_vector(7 downto 0);
        pmuwdtcr1       : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt1_3    : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt1_2    : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt1_1    : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt1_0    : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt2_3    : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt2_2    : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt2_1    : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt2_0    : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt3_3    : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt3_2    : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt3_1    : out    vl_logic_vector(7 downto 0);
        pmuwdtcnt3_0    : out    vl_logic_vector(7 downto 0);
        pmu_wdt_int     : out    vl_logic;
        uwdt_start_set  : out    vl_logic;
        pmu_rst_async   : in     vl_logic;
        ip_sclk         : in     vl_logic;
        ip_cs           : in     vl_logic;
        ip_stb          : in     vl_logic;
        ip_adr          : in     vl_logic_vector(3 downto 0);
        ip_wdat         : in     vl_logic_vector(7 downto 0);
        pmu_uwdt_inten  : in     vl_logic;
        pmu_wdt_done    : in     vl_logic;
        uwdt_start_ack  : in     vl_logic;
        scan_test_mode  : in     vl_logic
    );
end pmu_sci;
