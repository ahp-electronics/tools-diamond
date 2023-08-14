library verilog;
use verilog.vl_types.all;
entity hse_inf is
    generic(
        IDLE            : integer := 0;
        INIT_CORE       : integer := 1;
        INIT_END        : integer := 2;
        KEY_BYTE        : integer := 3;
        WAIT_SIG        : integer := 4;
        SIG_BYTE        : integer := 5;
        WAIT_CFG        : integer := 6;
        CFG_BYTE        : integer := 7;
        AUTH_END        : integer := 8;
        ERROR           : integer := 9;
        INIT_THRES      : integer := 1023
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        rst_sec         : in     vl_logic;
        isc_rst_sync    : in     vl_logic;
        hse_clk         : in     vl_logic;
        scan_mode       : in     vl_logic;
        hse_cfg_active  : in     vl_logic;
        ac_info_cfg_vld : in     vl_logic;
        ac_info_cfg_sel : in     vl_logic_vector(1 downto 0);
        init_done_flag  : out    vl_logic;
        byte_in         : in     vl_logic_vector(7 downto 0);
        byte_vld        : in     vl_logic;
        ecdsa_key_cmd   : in     vl_logic;
        ecdsa_sig_cmd   : in     vl_logic;
        hmac_key_cmd    : in     vl_logic;
        hmac_sig_cmd    : in     vl_logic;
        cfg_byte_cmd    : in     vl_logic;
        cfg_byte_last   : in     vl_logic;
        hse_reset       : out    vl_logic;
        hse_buf_rdy     : out    vl_logic;
        hse_ac_done     : out    vl_logic;
        hse_ac_sts      : out    vl_logic;
        hse_fail_info   : out    vl_logic_vector(4 downto 0);
        hse_busy        : in     vl_logic_vector(1 downto 0);
        hse_buffer_ready: in     vl_logic;
        hse_pass_fail   : in     vl_logic;
        hse_pf_valid    : in     vl_logic;
        hse_ac_alg_sel  : out    vl_logic_vector(1 downto 0);
        hse_data_in     : out    vl_logic_vector(7 downto 0);
        hse_write_en    : out    vl_logic;
        hse_last_byte   : out    vl_logic
    );
end hse_inf;
