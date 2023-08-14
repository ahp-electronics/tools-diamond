library verilog;
use verilog.vl_types.all;
entity algn_quad is
    generic(
        ADDR_WID        : integer := 6;
        DATA_WID        : integer := 12
    );
    port(
        BIST            : in     vl_logic;
        BFC             : in     vl_logic;
        BC              : out    vl_logic_vector(3 downto 0);
        BF0             : out    vl_logic_vector(3 downto 0);
        scan_mode       : in     vl_logic;
        scan_enable     : in     vl_logic;
        reset_ab_n      : in     vl_logic;
        reset_cd_n      : in     vl_logic;
        reset0_n        : in     vl_logic;
        reset1_n        : in     vl_logic;
        reset2_n        : in     vl_logic;
        reset3_n        : in     vl_logic;
        rxclk_0         : in     vl_logic;
        rxclk_1         : in     vl_logic;
        rxclk_2         : in     vl_logic;
        rxclk_3         : in     vl_logic;
        mrxclk_0        : in     vl_logic;
        mrxclk_1        : in     vl_logic;
        mrxclk_2        : in     vl_logic;
        mrxclk_3        : in     vl_logic;
        data_in_0       : in     vl_logic_vector;
        data_in_1       : in     vl_logic_vector;
        data_in_2       : in     vl_logic_vector;
        data_in_3       : in     vl_logic_vector;
        align_pulse     : in     vl_logic_vector(3 downto 0);
        align_en        : in     vl_logic_vector(3 downto 0);
        abcd_align_en   : in     vl_logic;
        ab_align_en     : in     vl_logic;
        cd_align_en     : in     vl_logic;
        cascade_en      : in     vl_logic;
        cascade_start   : in     vl_logic;
        cascade_done    : in     vl_logic;
        fifo_hi_mark    : in     vl_logic_vector;
        latency         : in     vl_logic_vector;
        data_out_0      : out    vl_logic_vector;
        data_out_1      : out    vl_logic_vector;
        data_out_2      : out    vl_logic_vector;
        data_out_3      : out    vl_logic_vector;
        ab_aligned      : out    vl_logic;
        ab_failed       : out    vl_logic;
        cd_aligned      : out    vl_logic;
        cd_failed       : out    vl_logic;
        quad_clear      : out    vl_logic;
        quad_start      : out    vl_logic;
        quad_done       : out    vl_logic
    );
end algn_quad;
