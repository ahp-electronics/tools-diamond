library verilog;
use verilog.vl_types.all;
entity pp_rsm_1g is
    generic(
        K28_5           : integer := 188;
        K27_7           : integer := 251;
        K29_7           : integer := 253;
        K23_7           : integer := 247;
        D21_5           : integer := 181;
        D2_2            : integer := 66;
        D0_0            : integer := 0;
        \CONFIGURATION\ : integer := 1;
        DATA            : integer := 2;
        WAIT_FOR_K      : integer := 0;
        LINK_FAILED     : integer := 1;
        RX_K            : integer := 2;
        RX_CB           : integer := 3;
        RX_CC           : integer := 4;
        RX_CD           : integer := 5;
        RX_INVALID      : integer := 6;
        IDLE_D          : integer := 7;
        FALSE_CARRIER   : integer := 9;
        START_OF_PACKET : integer := 10;
        EARLY_END       : integer := 11;
        TRI_RRI         : integer := 12;
        TRR_EXTEND      : integer := 13;
        RX_DATA_ERROR   : integer := 14;
        RX_DATA         : integer := 15;
        EARLY_END_EXT   : integer := 16;
        PACKET_BURST_N_RRS: integer := 17;
        EXTEND_ERR      : integer := 18
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        sync_status     : in     vl_logic;
        rx_d_in         : in     vl_logic_vector(7 downto 0);
        k_cntrl_in      : in     vl_logic;
        disp_err_in     : in     vl_logic;
        code_violation_in: in     vl_logic;
        rx_even_in      : in     vl_logic;
        xmit            : in     vl_logic_vector(1 downto 0);
        rx_er           : out    vl_logic;
        rx_dv           : out    vl_logic;
        rx_d_out        : out    vl_logic_vector(7 downto 0);
        rx_config_reg   : out    vl_logic_vector(15 downto 0);
        rudi_config     : out    vl_logic;
        rudi_idle       : out    vl_logic;
        rudi_invalid    : out    vl_logic
    );
end pp_rsm_1g;
