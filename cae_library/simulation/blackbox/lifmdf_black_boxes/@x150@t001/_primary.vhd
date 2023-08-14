library verilog;
use verilog.vl_types.all;
entity X150T001 is
    generic(
        clkref_min_freq : integer := 0;
        clkref_max_freq : integer := 0;
        clkref_N_min_freq: integer := 0;
        clkref_N_max_freq: integer := 0;
        clkref_N_M_min_freq: integer := 0;
        clkref_N_M_max_freq: integer := 0;
        TST_DEFAULT     : integer := 0
    );
    port(
        VDDA            : inout  vl_logic;
        VSSA            : inout  vl_logic;
        PD              : in     vl_logic;
        TST             : in     vl_logic_vector(3 downto 0);
        CN              : in     vl_logic_vector(4 downto 0);
        CM              : in     vl_logic_vector(7 downto 0);
        CO              : in     vl_logic_vector(1 downto 0);
        CLKREF          : in     vl_logic;
        OUTP            : out    vl_logic;
        OUTN            : out    vl_logic;
        LOCK            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of clkref_min_freq : constant is 1;
    attribute mti_svvh_generic_type of clkref_max_freq : constant is 1;
    attribute mti_svvh_generic_type of clkref_N_min_freq : constant is 1;
    attribute mti_svvh_generic_type of clkref_N_max_freq : constant is 1;
    attribute mti_svvh_generic_type of clkref_N_M_min_freq : constant is 1;
    attribute mti_svvh_generic_type of clkref_N_M_max_freq : constant is 1;
    attribute mti_svvh_generic_type of TST_DEFAULT : constant is 1;
end X150T001;
