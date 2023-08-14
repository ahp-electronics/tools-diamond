library verilog;
use verilog.vl_types.all;
entity algn_ls_if is
    generic(
        GRP             : integer := 4;
        \GRP_SEL\       : integer := 2
    );
    port(
        grp_clk_p1      : in     vl_logic_vector;
        grp_clk_p2      : in     vl_logic_vector;
        grp_start       : in     vl_logic_vector;
        grp_done        : in     vl_logic_vector;
        grp_deskew_error: in     vl_logic_vector;
        quad_clear_hs   : in     vl_logic;
        quad_start_hs   : in     vl_logic;
        quad_done_hs    : in     vl_logic;
        quad_and_fp1_hs : in     vl_logic;
        quad_and_fp0_hs : in     vl_logic;
        quad_or_fp1_hs  : in     vl_logic;
        quad_or_fp0_hs  : in     vl_logic;
        quad_rst_n      : in     vl_logic;
        grp_sel         : in     vl_logic_vector;
        m_rxclk0        : in     vl_logic;
        quad_start_ls   : out    vl_logic;
        quad_done_ls    : out    vl_logic;
        quad_and_fp1_ls : out    vl_logic;
        quad_and_fp0_ls : out    vl_logic;
        quad_or_fp1_ls  : out    vl_logic;
        quad_or_fp0_ls  : out    vl_logic;
        cascade_clk     : out    vl_logic;
        cascade_start   : out    vl_logic;
        cascade_done    : out    vl_logic;
        cascade_and_fp  : out    vl_logic;
        cascade_or_fp   : out    vl_logic
    );
end algn_ls_if;
