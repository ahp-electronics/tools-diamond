library verilog;
use verilog.vl_types.all;
entity b2bis_chbist_jj is
    port(
        txclk           : in     vl_logic;
        rxclk           : in     vl_logic;
        bist_en         : in     vl_logic;
        bist_ch_sel     : in     vl_logic;
        bist_ptn_sel    : in     vl_logic_vector(2 downto 0);
        bist_head_sel   : in     vl_logic_vector(1 downto 0);
        bist_time_sel   : in     vl_logic;
        bist_res_sel    : in     vl_logic_vector(1 downto 0);
        bist_speed_up   : in     vl_logic;
        bus8bit_sel     : in     vl_logic;
        plb_r2t_en      : in     vl_logic;
        rx_data         : in     vl_logic_vector(9 downto 0);
        bstsds_a0       : in     vl_logic;
        bist_sel        : out    vl_logic;
        bist_tx_data    : out    vl_logic_vector(9 downto 0);
        bist_report     : out    vl_logic_vector(5 downto 0)
    );
end b2bis_chbist_jj;
