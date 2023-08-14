library verilog;
use verilog.vl_types.all;
entity BLOCKRAM_SL is
    port(
        HREADY          : out    vl_logic;
        HRESP           : out    vl_logic_vector(1 downto 0);
        SBWR_CSW        : out    vl_logic;
        SBWR_D          : out    vl_logic_vector(8 downto 0);
        SBWR_AW         : out    vl_logic_vector(20 downto 0);
        HGRANT_CFG      : in     vl_logic;
        RFR_SEL         : in     vl_logic_vector(3 downto 0);
        RFR_EXP         : in     vl_logic_vector(3 downto 0);
        HCLK            : in     vl_logic;
        HRESET_N        : in     vl_logic;
        HSELRAM         : in     vl_logic;
        HWRITE          : in     vl_logic;
        HBURST          : in     vl_logic;
        HREADY_SB       : in     vl_logic;
        HTRANS          : in     vl_logic_vector(1 downto 0);
        HSIZE           : in     vl_logic_vector(1 downto 0);
        HADDR           : in     vl_logic_vector(17 downto 0);
        HWDATA          : in     vl_logic_vector(35 downto 0)
    );
end BLOCKRAM_SL;
