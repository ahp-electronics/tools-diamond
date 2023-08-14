library verilog;
use verilog.vl_types.all;
entity MPC_MBLK is
    port(
        MPC_CLK         : in     vl_logic;
        MPC_TSIZ        : in     vl_logic_vector(0 to 1);
        MPC_READ        : in     vl_logic;
        MPC_BURST       : in     vl_logic;
        MPC_BDIP        : in     vl_logic;
        MPC_TS          : in     vl_logic;
        MPC_ADDR        : in     vl_logic_vector(17 downto 0);
        MPC_CS0         : in     vl_logic;
        MPC_CS1         : in     vl_logic;
        MPC_TA          : out    vl_logic;
        MPC_RETRY       : out    vl_logic;
        MPC_TEA         : out    vl_logic;
        MPC_TRI_DATA    : out    vl_logic;
        MPC_TRI_CTL     : out    vl_logic;
        MPC_WR_DATA     : in     vl_logic_vector(31 downto 0);
        MPC_WR_PARITY   : in     vl_logic_vector(3 downto 0);
        AHB_RESET_N     : in     vl_logic;
        BUS_SIZE        : in     vl_logic_vector(2 downto 0);
        ahb_rd_retry    : in     vl_logic;
        ahb_rd_error    : in     vl_logic;
        swr_data        : out    vl_logic_vector(35 downto 0);
        swr_tsiz        : out    vl_logic_vector(1 downto 0);
        swr_addr        : out    vl_logic_vector(17 downto 0);
        burst_addr      : out    vl_logic_vector(17 downto 0);
        rd_sel_rdreg    : out    vl_logic_vector(3 downto 0);
        load_wrreg      : out    vl_logic;
        wr_queue        : out    vl_logic_vector(1 downto 0);
        MPC_rd_ef       : in     vl_logic;
        bwr_err         : out    vl_logic;
        AHB_request_pulse: out    vl_logic;
        AHB_request     : out    vl_logic;
        AHB_done        : in     vl_logic
    );
end MPC_MBLK;
