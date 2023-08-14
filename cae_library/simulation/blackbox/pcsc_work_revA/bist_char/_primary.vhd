library verilog;
use verilog.vl_types.all;
entity bist_char is
    port(
        bist_rstn       : out    vl_logic;
        do_bist         : out    vl_logic;
        cptdr           : out    vl_logic;
        shdr            : out    vl_logic;
        bistrtcntdone   : out    vl_logic;
        bist_cout       : out    vl_logic_vector(19 downto 0);
        bist_rssigso    : in     vl_logic;
        ubs_bistcomplete: in     vl_logic;
        char_bist_rstn  : in     vl_logic;
        char_do_bist    : in     vl_logic;
        char_cptdr      : in     vl_logic;
        char_shdr       : in     vl_logic;
        char_bistrtcntdone: in     vl_logic;
        bist_flag_in    : in     vl_logic_vector(11 downto 0)
    );
end bist_char;
