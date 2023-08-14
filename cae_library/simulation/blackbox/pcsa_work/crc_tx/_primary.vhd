library verilog;
use verilog.vl_types.all;
entity crc_tx is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_i          : in     vl_logic_vector(11 downto 0);
        data_o          : out    vl_logic_vector(10 downto 0);
        txcrc_swp       : in     vl_logic;
        txcrc_inv       : in     vl_logic;
        txcrc_swp_din   : in     vl_logic;
        txcrc_inv_din   : in     vl_logic;
        crc_initial     : in     vl_logic_vector(31 downto 0);
        crc_mode        : in     vl_logic_vector(1 downto 0);
        crc_disable     : in     vl_logic
    );
end crc_tx;
