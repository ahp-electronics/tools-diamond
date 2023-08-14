library verilog;
use verilog.vl_types.all;
entity MPC_ABLK is
    generic(
        RDWR_IDLE       : integer := 0;
        RDWR_SHLT       : integer := 12;
        RDWR_SREQ       : integer := 14;
        RDWR_SIDL       : integer := 28;
        RDWR_BHLT       : integer := 4;
        RDWR_BREQ       : integer := 6;
        RDWR_BSEQ       : integer := 23;
        RDWR_BWRP       : integer := 22;
        RDWR_BBSY       : integer := 21
    );
    port(
        MC1_PAR_ODD     : in     vl_logic;
        MPI_PAR_CHK     : in     vl_logic;
        MPI_DP_ENABLE   : in     vl_logic;
        HCLK            : in     vl_logic;
        AHB_BUS_GNT     : in     vl_logic;
        AHB_READY       : in     vl_logic;
        AHB_RESP        : in     vl_logic_vector(1 downto 0);
        AHB_BUS_REQ     : out    vl_logic;
        AHB_BUS_LOCK    : out    vl_logic;
        AHB_BURST       : out    vl_logic;
        AHB_SIZE        : out    vl_logic_vector(1 downto 0);
        AHB_WRITE       : out    vl_logic;
        AHB_ADDR        : out    vl_logic_vector(17 downto 0);
        AHB_IRQ         : out    vl_logic;
        AHB_TRANS       : out    vl_logic_vector(1 downto 0);
        AHB_WR_DATA     : out    vl_logic_vector(31 downto 0);
        AHB_WR_PARITY   : out    vl_logic_vector(3 downto 0);
        AHB_RESET_N     : in     vl_logic;
        BUS_SIZE        : in     vl_logic_vector(2 downto 0);
        mpc2ahb_data    : in     vl_logic_vector(35 downto 0);
        mpc2ahb_tsiz    : in     vl_logic_vector(0 to 1);
        mpc2ahb_addr    : in     vl_logic_vector(17 downto 0);
        mpc2ahb_burst   : in     vl_logic;
        mpc2ahb_read    : in     vl_logic;
        ahb_rd_retry    : out    vl_logic;
        ahb_rd_error    : out    vl_logic;
        ahb_rd_cntr     : out    vl_logic_vector(3 downto 0);
        load_rdreg      : out    vl_logic;
        din_sel_rdreg   : out    vl_logic_vector(1 downto 0);
        MPC_bwr_err     : in     vl_logic;
        AHB_rd_ef       : in     vl_logic;
        AHB_request     : in     vl_logic;
        AHB_done_pulse  : out    vl_logic;
        AHB_done        : out    vl_logic
    );
end MPC_ABLK;
