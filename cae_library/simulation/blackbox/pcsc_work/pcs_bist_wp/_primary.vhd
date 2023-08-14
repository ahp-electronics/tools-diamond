library verilog;
use verilog.vl_types.all;
entity pcs_bist_wp is
    port(
        tx_clk          : in     vl_logic_vector(3 downto 0);
        bist_tx_clk_o   : out    vl_logic;
        rx_clk          : in     vl_logic_vector(3 downto 0);
        bist_rx_clk_o   : out    vl_logic;
        bist_rpt_ch_sel : in     vl_logic_vector(1 downto 0);
        tobist_data_0   : in     vl_logic_vector(9 downto 0);
        tobist_data_1   : in     vl_logic_vector(9 downto 0);
        tobist_data_2   : in     vl_logic_vector(9 downto 0);
        tobist_data_3   : in     vl_logic_vector(9 downto 0);
        tobist_data     : out    vl_logic_vector(9 downto 0);
        fmbist_data     : in     vl_logic_vector(9 downto 0);
        fmbist_data_0   : out    vl_logic_vector(9 downto 0);
        fmbist_data_1   : out    vl_logic_vector(9 downto 0);
        fmbist_data_2   : out    vl_logic_vector(9 downto 0);
        fmbist_data_3   : out    vl_logic_vector(9 downto 0)
    );
end pcs_bist_wp;
