library verilog;
use verilog.vl_types.all;
entity ebr_config_inout is
    port(
        cib_addrb       : in     vl_logic_vector(12 downto 0);
        cib_datab       : in     vl_logic_vector(8 downto 0);
        cib_web         : in     vl_logic;
        cib_ceb         : in     vl_logic;
        cib_clkb        : in     vl_logic;
        es_o            : in     vl_logic_vector(35 downto 0);
        f_ren           : in     vl_logic;
        f_rid           : in     vl_logic_vector(8 downto 0);
        f_wen           : in     vl_logic_vector(1 downto 0);
        f_wid           : in     vl_logic_vector(8 downto 0);
        from_prev_sel   : in     vl_logic;
        from_prev_ebr   : in     vl_logic_vector(8 downto 0);
        from_local_ebr  : in     vl_logic_vector(8 downto 0);
        trim_fifo_hplpn : out    vl_logic;
        gwe             : out    vl_logic;
        ebr_addrb       : out    vl_logic_vector(12 downto 0);
        ebr_datab       : out    vl_logic_vector(8 downto 0);
        cfg_cs          : out    vl_logic;
        ebr_web         : out    vl_logic;
        ebr_ceb         : out    vl_logic;
        ebr_clkb        : out    vl_logic;
        es_mode         : out    vl_logic;
        es_mode_rstn    : out    vl_logic;
        rdbk_mode       : out    vl_logic;
        to_next_sel     : out    vl_logic;
        to_next_ebr     : out    vl_logic_vector(8 downto 0)
    );
end ebr_config_inout;
