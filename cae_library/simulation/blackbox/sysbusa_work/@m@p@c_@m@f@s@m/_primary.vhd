library verilog;
use verilog.vl_types.all;
entity MPC_MFSM is
    generic(
        OUT_IDLE        : integer := 31;
        OUT_RETRY       : integer := 13;
        OUT_TEA         : integer := 10;
        OUT_SWR_WAIT    : integer := 15;
        OUT_SWR_TA      : integer := 11;
        OUT_SRD_WAIT    : integer := 7;
        OUT_SRD_TA      : integer := 3;
        FSM_IDLE        : integer := 0;
        FSM_SWR         : integer := 1;
        FSM_SRD         : integer := 2;
        FSM_BWR         : integer := 4;
        FSM_BRD         : integer := 3
    );
    port(
        AHB_RESET_N     : in     vl_logic;
        MPC_CLK         : in     vl_logic;
        MPC_BDIP        : in     vl_logic;
        MPC_BURST       : in     vl_logic;
        MPC_READ        : in     vl_logic;
        MPC_TS          : in     vl_logic;
        MPC_CS0         : in     vl_logic;
        MPC_CS1         : in     vl_logic;
        siz_cmp_n       : in     vl_logic;
        MPC_rd_ef       : in     vl_logic;
        AHB_done        : in     vl_logic;
        ahb_rd_retry    : in     vl_logic;
        ahb_rd_error    : in     vl_logic;
        MPC_TA          : out    vl_logic;
        MPC_TEA         : out    vl_logic;
        MPC_RETRY       : out    vl_logic;
        MPC_TRI_DATA    : out    vl_logic;
        MPC_TRI_CTL     : out    vl_logic;
        AHB_request     : out    vl_logic;
        AHB_request_pulse: out    vl_logic;
        bwr_err         : out    vl_logic;
        load_single     : out    vl_logic;
        load_burst      : out    vl_logic;
        wr_queue        : out    vl_logic_vector(1 downto 0);
        stepct_zero     : out    vl_logic;
        rd_sel_rdreg    : out    vl_logic_vector(3 downto 0)
    );
end MPC_MFSM;
