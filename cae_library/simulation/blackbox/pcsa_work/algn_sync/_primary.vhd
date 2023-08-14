library verilog;
use verilog.vl_types.all;
entity algn_sync is
    generic(
        DNCT_WID        : integer := 6
    );
    port(
        reset_ab_n      : in     vl_logic;
        reset_cd_n      : in     vl_logic;
        ab_clk          : in     vl_logic;
        cd_clk          : in     vl_logic;
        align_en        : in     vl_logic_vector(3 downto 0);
        align_edge      : in     vl_logic_vector(3 downto 0);
        ab_align_en     : in     vl_logic;
        cd_align_en     : in     vl_logic;
        abcd_align_en   : in     vl_logic;
        fifo_hi_mark    : in     vl_logic_vector;
        latency         : in     vl_logic_vector;
        cascade_en      : in     vl_logic;
        cascade_start   : in     vl_logic;
        cascade_done    : in     vl_logic;
        ab_aligned_int  : out    vl_logic;
        ab_aligned      : out    vl_logic;
        ab_failed       : out    vl_logic;
        cd_aligned_int  : out    vl_logic;
        cd_aligned      : out    vl_logic;
        cd_failed       : out    vl_logic;
        quad_clear      : out    vl_logic;
        quad_start      : out    vl_logic;
        quad_done       : out    vl_logic
    );
end algn_sync;
