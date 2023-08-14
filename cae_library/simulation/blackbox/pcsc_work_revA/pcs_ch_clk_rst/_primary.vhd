library verilog;
use verilog.vl_types.all;
entity pcs_ch_clk_rst is
    port(
        asyn_mode       : in     vl_logic;
        ff_ebrd_clk     : in     vl_logic;
        ff_rx_clk_sel   : in     vl_logic_vector(2 downto 0);
        ff_rxi_clk      : in     vl_logic;
        ff_txi_clk      : in     vl_logic;
        ffc_lane_rx_rst : in     vl_logic;
        ffc_lane_tx_rst : in     vl_logic;
        lane_rx_rst     : in     vl_logic;
        lane_tx_rst     : in     vl_logic;
        quad_reset_all  : in     vl_logic;
        quad_reset_all_n: in     vl_logic;
        sd_rx_clk       : in     vl_logic;
        sd_tx_clk       : in     vl_logic;
        sel_sd_rx_clk   : in     vl_logic;
        sel_test_clk    : in     vl_logic;
        test_clk        : in     vl_logic;
        ebrd_clk_o      : out    vl_logic;
        fb_clk_o        : out    vl_logic;
        ff_rx_f_clk     : out    vl_logic;
        ff_rx_h_clk     : out    vl_logic;
        ff_rx_q_clk     : out    vl_logic;
        ffr_clk_o       : out    vl_logic;
        fft_clk_o       : out    vl_logic;
        rst_ebrd_clk_n_o: out    vl_logic;
        rst_fb_clk_n_o  : out    vl_logic;
        rst_rx_clk_n_o  : out    vl_logic;
        rst_tx_clk_n_o  : out    vl_logic;
        rx_clk_o        : out    vl_logic;
        tx_clk_o        : out    vl_logic
    );
end pcs_ch_clk_rst;
