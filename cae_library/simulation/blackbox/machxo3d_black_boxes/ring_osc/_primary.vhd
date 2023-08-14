library verilog;
use verilog.vl_types.all;
entity ring_osc is
    generic(
        IDLE            : integer := 0;
        VERIFY_OFF      : integer := 1;
        SET_ENABLE      : integer := 2;
        \WAIT\          : integer := 3;
        START           : integer := 4;
        START_OFF       : integer := 5;
        VERIFY_RANGE    : integer := 6;
        TST_DONE        : integer := 7
    );
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        otm             : in     vl_logic;
        delay_select    : in     vl_logic_vector(31 downto 0);
        rng_start       : in     vl_logic;
        dpa_en          : in     vl_logic;
        rng_group_en    : in     vl_logic_vector(15 downto 0);
        rng_variant_en  : in     vl_logic_vector(15 downto 0);
        ringosc_rdy     : out    vl_logic;
        ringosc_data    : out    vl_logic;
        bist_min_cnt    : in     vl_logic_vector(6 downto 0);
        bist_max_cnt    : in     vl_logic_vector(6 downto 0);
        ringosc_bist_start: in     vl_logic;
        ringosc_bist_done: out    vl_logic;
        ringosc_bist_fail: out    vl_logic
    );
end ring_osc;
