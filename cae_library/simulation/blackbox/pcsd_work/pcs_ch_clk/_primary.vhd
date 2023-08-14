library verilog;
use verilog.vl_types.all;
entity pcs_ch_clk is
    port(
        sel_test_clk    : in     vl_logic;
        sel_sd_rx_clk   : in     vl_logic;
        ff_rx_clk_sel   : in     vl_logic_vector(1 downto 0);
        ff_tx_clk_sel   : in     vl_logic_vector(1 downto 0);
        quad_reset_all_n: in     vl_logic;
        sd_tx_clk       : in     vl_logic;
        sd_rx_clk       : in     vl_logic;
        ff_txi_clk      : in     vl_logic;
        ff_rxi_clk      : in     vl_logic;
        ff_ebrd_clk     : in     vl_logic;
        test_clk        : in     vl_logic;
        tx_clk          : out    vl_logic;
        rx_clk          : out    vl_logic;
        ebrd_clk        : out    vl_logic;
        fb_clk          : out    vl_logic;
        fft_clk         : out    vl_logic;
        ffr_clk         : out    vl_logic;
        ff_rx_f_clk     : out    vl_logic;
        ff_rx_h_clk     : out    vl_logic;
        ff_tx_f_clk     : out    vl_logic;
        ff_tx_h_clk     : out    vl_logic
    );
end pcs_ch_clk;
