library verilog;
use verilog.vl_types.all;
entity pp_an is
    generic(
        IDLE            : integer := 0;
        \CONFIGURATION\ : integer := 1;
        DATA            : integer := 2;
        AN_ENABLE       : integer := 0;
        AN_RESTART      : integer := 1;
        AN_DISABLE_LINK_OK: integer := 2;
        ABILITY_DETECT  : integer := 3;
        ACKNOWLEDGE_DETECT: integer := 4;
        COMPLETE_ACKNOWLEDGE: integer := 5;
        NEXT_PAGE_WAIT  : integer := 6;
        IDLE_DETECT     : integer := 7;
        LINK_OK         : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        mr_restart_an   : in     vl_logic;
        mr_an_enable    : in     vl_logic;
        mr_adv_ability  : in     vl_logic_vector(16 downto 1);
        mr_lp_adv_ability: out    vl_logic_vector(16 downto 1);
        mr_np_tx        : in     vl_logic_vector(16 downto 1);
        mr_lp_np_rx     : out    vl_logic_vector(16 downto 1);
        set_np_loaded_wstr: in     vl_logic;
        link_timer_short: in     vl_logic;
        mr_page_rx      : out    vl_logic;
        mr_an_complete  : out    vl_logic;
        mr_np_loaded    : out    vl_logic;
        resolve_priority: out    vl_logic;
        sync_status     : in     vl_logic;
        rudi_invalid    : in     vl_logic;
        rudi_idle       : in     vl_logic;
        rudi_config     : in     vl_logic;
        rx_config_reg   : in     vl_logic_vector(15 downto 0);
        tx_config_reg   : out    vl_logic_vector(15 downto 0);
        xmit            : out    vl_logic_vector(1 downto 0)
    );
end pp_an;
