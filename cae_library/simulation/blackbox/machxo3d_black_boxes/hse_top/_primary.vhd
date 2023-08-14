library verilog;
use verilog.vl_types.all;
entity hse_top is
    generic(
        PC_RESET_ADDR   : integer := 0;
        HAS_MULT        : integer := 1;
        UNSIGNED_MULT   : integer := 1;
        INC_UART_CON    : integer := 0;
        UART_PERIOD     : integer := 2604
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        otm             : in     vl_logic;
        scan_tm         : in     vl_logic;
        scan_rst        : in     vl_logic;
        enc_enabled     : in     vl_logic;
        uart_tx         : out    vl_logic;
        uart_rx         : in     vl_logic;
        inst_addr       : out    vl_logic_vector(15 downto 0);
        inst_rdata      : in     vl_logic_vector(31 downto 0);
        drom_addr       : out    vl_logic_vector(12 downto 0);
        drom_rdata      : in     vl_logic_vector(31 downto 0);
        dram_addr       : out    vl_logic_vector(14 downto 0);
        dram_wdata      : out    vl_logic_vector(31 downto 0);
        dram_wr_msk     : out    vl_logic_vector(3 downto 0);
        dram_rdata      : in     vl_logic_vector(31 downto 0);
        lmmi_clk        : in     vl_logic;
        lmmi_reset      : in     vl_logic;
        lmmi_request    : in     vl_logic;
        lmmi_wr_rdn     : in     vl_logic;
        lmmi_offset     : in     vl_logic_vector(17 downto 0);
        lmmi_wdata      : in     vl_logic_vector(31 downto 0);
        lmmi_rdata      : out    vl_logic_vector(31 downto 0);
        lmmi_rdata_valid: out    vl_logic;
        lmmi_ready      : out    vl_logic;
        asf_reset_i     : in     vl_logic;
        asf_clk_i       : in     vl_logic;
        asf_wr_i        : in     vl_logic;
        asf_full_o      : out    vl_logic;
        asf_empty_o     : out    vl_logic;
        asf_rd_i        : in     vl_logic;
        cfg_clk         : in     vl_logic;
        off_hse_usrmd   : in     vl_logic;
        cfg_active      : in     vl_logic;
        cfg_noise       : in     vl_logic;
        ac_alg_sel      : in     vl_logic_vector(1 downto 0);
        data_in         : in     vl_logic_vector(7 downto 0);
        write_en        : in     vl_logic;
        last_cbyte      : in     vl_logic;
        busy            : out    vl_logic_vector(1 downto 0);
        buffer_ready    : out    vl_logic;
        pass_fail       : out    vl_logic;
        pf_valid        : out    vl_logic;
        uds_out         : out    vl_logic_vector(255 downto 0);
        uds_in          : in     vl_logic_vector(255 downto 0)
    );
end hse_top;
