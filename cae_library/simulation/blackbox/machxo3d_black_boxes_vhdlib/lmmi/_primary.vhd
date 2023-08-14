library verilog;
use verilog.vl_types.all;
entity lmmi is
    generic(
        LMMI_S0         : integer := 0;
        LMMI_S1         : integer := 1;
        HSE_S0          : integer := 0;
        HSE_S1          : integer := 1;
        HSE_S2          : integer := 2;
        HSE_S3          : integer := 3
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        lmmi_clk        : in     vl_logic;
        lmmi_reset      : in     vl_logic;
        lmmi_request    : in     vl_logic;
        lmmi_wr_rdn     : in     vl_logic;
        lmmi_offset     : in     vl_logic_vector(17 downto 0);
        lmmi_wdata      : in     vl_logic_vector(31 downto 0);
        lmmi_rdata      : out    vl_logic_vector(31 downto 0);
        lmmi_rdata_valid: out    vl_logic;
        lmmi_ready      : out    vl_logic;
        wr_bus          : out    vl_logic;
        rd_bus          : out    vl_logic;
        offs_bus        : out    vl_logic_vector(17 downto 0);
        wdata_bus       : out    vl_logic_vector(31 downto 0);
        rdata_bus       : in     vl_logic_vector(31 downto 0)
    );
end lmmi;
