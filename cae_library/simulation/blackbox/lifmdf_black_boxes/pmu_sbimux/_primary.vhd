library verilog;
use verilog.vl_types.all;
entity pmu_sbimux is
    port(
        ip_sclk         : out    vl_logic;
        ip_cs           : out    vl_logic;
        ip_stb          : out    vl_logic;
        ip_adr          : out    vl_logic_vector(3 downto 0);
        ip_wdat         : out    vl_logic_vector(7 downto 0);
        cfg_sbi_seln    : in     vl_logic;
        sbi_sclk        : in     vl_logic;
        sbi_cs          : in     vl_logic;
        sbi_stb         : in     vl_logic;
        sbi_adr         : in     vl_logic_vector(3 downto 0);
        sbi_wdat        : in     vl_logic_vector(7 downto 0);
        pmu_sclk        : in     vl_logic;
        pmu_cs          : in     vl_logic;
        pmu_stb         : in     vl_logic;
        pmu_adr         : in     vl_logic_vector(3 downto 0);
        pmu_wdat        : in     vl_logic_vector(7 downto 0)
    );
end pmu_sbimux;
