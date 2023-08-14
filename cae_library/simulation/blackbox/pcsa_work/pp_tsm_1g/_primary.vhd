library verilog;
use verilog.vl_types.all;
entity pp_tsm_1g is
    generic(
        K28_5           : integer := 188;
        K30_7           : integer := 254;
        K27_7           : integer := 251;
        K29_7           : integer := 253;
        K23_7           : integer := 247;
        D21_5           : integer := 181;
        D2_2            : integer := 66;
        D5_6            : integer := 197;
        D16_2           : integer := 80;
        IDLE            : integer := 0;
        \CONFIGURATION\ : integer := 1;
        DATA            : integer := 2;
        IDLE_A          : integer := 0;
        IDLE_B          : integer := 1;
        CFG_A           : integer := 2;
        CFG_B           : integer := 3;
        CFG_C           : integer := 4;
        CFG_D           : integer := 5;
        START_OF_PACKET : integer := 6;
        TX_DATA         : integer := 7;
        END_OF_PACKET_NOEXT: integer := 8;
        EPD2_NOEXT      : integer := 9;
        EPD3            : integer := 10;
        END_OF_PACKET_EXT: integer := 11;
        EXTEND_BY_1     : integer := 12;
        CARRIER_EXTEND  : integer := 13;
        START_ERROR     : integer := 14;
        TX_DATA_ERROR   : integer := 15
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        xmit            : in     vl_logic_vector(1 downto 0);
        txd_i           : in     vl_logic_vector(7 downto 0);
        tx_en           : in     vl_logic;
        tx_er           : in     vl_logic;
        tx_config_reg   : in     vl_logic_vector(15 downto 0);
        txd_o           : out    vl_logic_vector(7 downto 0);
        k_cntrl         : out    vl_logic;
        correct_disp    : out    vl_logic
    );
end pp_tsm_1g;
