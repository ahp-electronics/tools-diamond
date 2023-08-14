library verilog;
use verilog.vl_types.all;
entity pcs_ch_buffers is
    port(
        fft_clk         : in     vl_logic;
        ff_tx_d         : in     vl_logic_vector(23 downto 0);
        ff_tx_p         : out    vl_logic_vector(23 downto 0);
        ff_rx_d         : out    vl_logic_vector(23 downto 0);
        ff_rx_p         : in     vl_logic_vector(23 downto 0);
        rx_clk          : in     vl_logic;
        serdes_rxd      : in     vl_logic_vector(9 downto 0);
        serdes_rxd_p    : out    vl_logic_vector(9 downto 0);
        tobist_data     : out    vl_logic_vector(9 downto 0);
        tobist_data_p   : in     vl_logic_vector(9 downto 0);
        tx_clk          : in     vl_logic;
        sb_txd          : out    vl_logic_vector(9 downto 0);
        sb_txd_p        : in     vl_logic_vector(9 downto 0);
        fmbist_data     : in     vl_logic_vector(9 downto 0);
        fmbist_data_p   : out    vl_logic_vector(9 downto 0)
    );
end pcs_ch_buffers;
