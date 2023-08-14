library verilog;
use verilog.vl_types.all;
entity pcs_ch_rst is
    port(
        tx_clk          : in     vl_logic;
        rx_clk          : in     vl_logic;
        ebrd_clk        : in     vl_logic;
        fb_clk          : in     vl_logic;
        rst_tx_clk_n    : out    vl_logic;
        rst_rx_clk_n    : out    vl_logic;
        rst_ebrd_clk_n  : out    vl_logic;
        rst_fb_clk_n    : out    vl_logic;
        lane_tx_rst     : in     vl_logic;
        lane_rx_rst     : in     vl_logic;
        ffc_lane_tx_rst : in     vl_logic;
        ffc_lane_rx_rst : in     vl_logic;
        asyn_mode       : in     vl_logic;
        quad_reset_all  : in     vl_logic
    );
end pcs_ch_rst;
