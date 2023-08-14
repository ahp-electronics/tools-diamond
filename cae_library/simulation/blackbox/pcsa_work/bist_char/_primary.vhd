library verilog;
use verilog.vl_types.all;
entity bist_char is
    port(
        bist_rstn       : out    vl_logic;
        do_bist         : out    vl_logic;
        cptdr           : out    vl_logic;
        shdr            : out    vl_logic;
        bistrtcntdone   : out    vl_logic;
        bist_char_out   : out    vl_logic_vector(21 downto 0);
        bist_rssigso    : in     vl_logic;
        ubs_bistcomplete: in     vl_logic;
        char_bist_rstn  : in     vl_logic;
        char_do_bist    : in     vl_logic;
        char_cptdr      : in     vl_logic;
        char_shdr       : in     vl_logic;
        char_bistrtcntdone: in     vl_logic;
        bist_char_out_prev: in     vl_logic_vector(21 downto 0);
        sds_test_bus    : in     vl_logic_vector(7 downto 0);
        quad_id         : in     vl_logic_vector(1 downto 0);
        bist_flag_in    : in     vl_logic_vector(11 downto 0);
        bist_flag_qsel  : in     vl_logic_vector(1 downto 0);
        bist_flag_mode  : in     vl_logic
    );
end bist_char;
