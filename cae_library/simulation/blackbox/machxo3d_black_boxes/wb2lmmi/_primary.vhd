library verilog;
use verilog.vl_types.all;
entity wb2lmmi is
    port(
        wb_clk_i        : in     vl_logic;
        wb_rst_i        : in     vl_logic;
        wb_stb_i        : in     vl_logic;
        wb_cyc_i        : in     vl_logic;
        wb_we_i         : in     vl_logic;
        wb_dat_i        : in     vl_logic_vector(31 downto 0);
        wb_adr_i        : in     vl_logic_vector(17 downto 0);
        wb_dat_o        : out    vl_logic_vector(31 downto 0);
        wb_ack_o        : out    vl_logic;
        lmmi_clk_o      : out    vl_logic;
        lmmi_reset_o    : out    vl_logic;
        lmmi_request_o  : out    vl_logic;
        lmmi_wr_rdn_o   : out    vl_logic;
        lmmi_offset_o   : out    vl_logic_vector(17 downto 0);
        lmmi_wdata_o    : out    vl_logic_vector(31 downto 0);
        lmmi_rdata_i    : in     vl_logic_vector(31 downto 0);
        lmmi_rdata_valid_i: in     vl_logic;
        lmmi_ready_i    : in     vl_logic
    );
end wb2lmmi;
