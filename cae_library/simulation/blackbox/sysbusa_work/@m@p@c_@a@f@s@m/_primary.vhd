library verilog;
use verilog.vl_types.all;
entity MPC_AFSM is
    generic(
        FSM_IDLE        : integer := 0;
        FSM_REQ         : integer := 4;
        FSM_REQ_LOCK    : integer := 6;
        FSM_OWN         : integer := 7;
        FSM_OWN_IDLE    : integer := 1
    );
    port(
        AHB_RESET_N     : in     vl_logic;
        HCLK            : in     vl_logic;
        AHB_BUS_GNT     : in     vl_logic;
        AHB_BURST       : in     vl_logic;
        AHB_READY       : in     vl_logic;
        AHB_RESP        : in     vl_logic_vector(1 downto 0);
        AHB_WRITE       : in     vl_logic;
        AHB_BUS_REQ     : out    vl_logic;
        AHB_BUS_LOCK    : out    vl_logic;
        send_irq        : out    vl_logic;
        AHB_request     : in     vl_logic;
        ahb_access      : in     vl_logic;
        last_trans      : in     vl_logic;
        retry_ct_msb2   : in     vl_logic_vector(1 downto 0);
        AHB_own_bus     : out    vl_logic;
        req_error       : out    vl_logic
    );
end MPC_AFSM;
