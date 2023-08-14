library verilog;
use verilog.vl_types.all;
entity crc_rx is
    generic(
        IDLE            : integer := 0;
        PRE             : integer := 1;
        DATA            : integer := 3;
        UNUSED          : integer := 2
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_i          : in     vl_logic_vector(11 downto 0);
        data_o          : out    vl_logic_vector(11 downto 0);
        rxcrc_swp_din   : in     vl_logic;
        rxcrc_inv_din   : in     vl_logic;
        rxcrc_sopmk     : in     vl_logic_vector(8 downto 0);
        rxcrc_sopch_0   : in     vl_logic_vector(8 downto 0);
        rxcrc_sopch_1   : in     vl_logic_vector(8 downto 0);
        rxcrc_eopmk     : in     vl_logic_vector(8 downto 0);
        rxcrc_eopch_0   : in     vl_logic_vector(8 downto 0);
        rxcrc_eopch_1   : in     vl_logic_vector(8 downto 0);
        rxcrc_1ch       : in     vl_logic;
        rxcrc_swp_crc   : in     vl_logic;
        rxcrc_inv_crc   : in     vl_logic;
        rxcrc_swp_bytes : in     vl_logic;
        crc_initial     : in     vl_logic_vector(31 downto 0);
        crc_mode        : in     vl_logic_vector(1 downto 0);
        crc_disable     : in     vl_logic;
        crc_sop_enable  : in     vl_logic
    );
end crc_rx;
