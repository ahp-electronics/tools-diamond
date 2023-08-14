library verilog;
use verilog.vl_types.all;
entity hdcp20_trng is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        wb_adr_i        : in     vl_logic_vector(3 downto 2);
        wb_dat_i        : in     vl_logic_vector(31 downto 0);
        wb_we_i         : in     vl_logic;
        wb_sel_i        : in     vl_logic_vector(3 downto 0);
        wb_stb_i        : in     vl_logic;
        wb_dat_o        : out    vl_logic_vector(31 downto 0);
        wb_ack_o        : out    vl_logic;
        otm             : in     vl_logic;
        dpa_en          : in     vl_logic;
        bist_min_cnt    : in     vl_logic_vector(6 downto 0);
        bist_max_cnt    : in     vl_logic_vector(6 downto 0);
        ringosc_bist_start: in     vl_logic;
        ringosc_bist_done: out    vl_logic;
        ringosc_bist_fail: out    vl_logic
    );
end hdcp20_trng;
