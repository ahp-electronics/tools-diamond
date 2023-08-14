library verilog;
use verilog.vl_types.all;
entity e2bis_ch_ptn_cmp is
    port(
        clk             : in     vl_logic;
        bus8bit_sel     : in     vl_logic;
        bist_en         : in     vl_logic;
        bist_mode       : in     vl_logic;
        bist_ptn_sel    : in     vl_logic_vector(2 downto 0);
        bist_head_sel   : in     vl_logic_vector(1 downto 0);
        bist_res_sel    : in     vl_logic_vector(1 downto 0);
        bist_time_out   : in     vl_logic;
        latch_bist_err  : in     vl_logic;
        rx_data         : in     vl_logic_vector(9 downto 0);
        sync_head_req   : in     vl_logic_vector(1 downto 0);
        usr_def_head    : in     vl_logic_vector(19 downto 0);
        disable_timer   : out    vl_logic;
        bist_head_found : out    vl_logic;
        bist_start      : out    vl_logic;
        bist_ok         : out    vl_logic;
        bist_done       : out    vl_logic;
        bist_err_rpt    : out    vl_logic_vector(12 downto 0)
    );
end e2bis_ch_ptn_cmp;
