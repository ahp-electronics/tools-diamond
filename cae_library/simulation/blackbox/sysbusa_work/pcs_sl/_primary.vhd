library verilog;
use verilog.vl_types.all;
entity pcs_sl is
    port(
        HRDATA_ASBS     : out    vl_logic_vector(35 downto 0);
        HREADY_ASBS     : out    vl_logic;
        HRESP_ASBS      : out    vl_logic_vector(1 downto 0);
        PCS_WDATA       : out    vl_logic_vector(7 downto 0);
        PCS_ADDR        : out    vl_logic_vector(7 downto 0);
        PCS_WSTB        : out    vl_logic;
        PCS_RD          : out    vl_logic;
        PCS_3EFXX_SEL   : out    vl_logic;
        PCS_Q           : out    vl_logic_vector(3 downto 0);
        PCS_C           : out    vl_logic_vector(15 downto 0);
        ASB_PAR_ODD     : in     vl_logic;
        PCS_SL_STRAIT   : in     vl_logic;
        HCLK_ASB        : in     vl_logic;
        HCLK            : in     vl_logic;
        HRESET_N        : in     vl_logic;
        HREADY          : in     vl_logic;
        HADDR_ASBS      : in     vl_logic_vector(17 downto 0);
        HTRANS_ASBS     : in     vl_logic_vector(1 downto 0);
        HBURST_ASBS     : in     vl_logic;
        HWRITE_ASBS     : in     vl_logic;
        HSIZE_ASBS      : in     vl_logic_vector(1 downto 0);
        HWDATA_ASBS     : in     vl_logic_vector(35 downto 0);
        HSEL_ASBS       : in     vl_logic;
        PCS_RDATA       : in     vl_logic_vector(7 downto 0)
    );
end pcs_sl;
