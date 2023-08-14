library verilog;
use verilog.vl_types.all;
entity MIPI_CLOCK_UNIV is
    generic(
        WIDTH           : integer := 8
    );
    port(
        HS_16BIT_EN     : in     vl_logic;
        PD              : in     vl_logic;
        DP              : inout  vl_logic;
        DN              : inout  vl_logic;
        DTXLPP          : in     vl_logic;
        DTXLPN          : in     vl_logic;
        TXLPEN          : in     vl_logic;
        DRXLPP          : out    vl_logic;
        DRXLPN          : out    vl_logic;
        RXLPEN          : in     vl_logic;
        DCDP            : out    vl_logic;
        DCDN            : out    vl_logic;
        CDEN            : in     vl_logic;
        PDBIAS          : in     vl_logic;
        TXHSPD          : in     vl_logic;
        TXHSEN          : in     vl_logic;
        TXHSGATE        : in     vl_logic;
        HS_BYTE_CLKS    : in     vl_logic;
        HS_TXCLK        : in     vl_logic;
        HS_SER_EN       : in     vl_logic;
        HS_SER_LD       : in     vl_logic;
        RXHSEN          : in     vl_logic;
        HS_DESER_EN     : in     vl_logic;
        DRXHS           : out    vl_logic;
        HS_RXCLK        : in     vl_logic;
        HSRX_DATA       : out    vl_logic_vector;
        SYNC            : out    vl_logic;
        ERRSYNC         : out    vl_logic;
        NOSYNC          : out    vl_logic;
        BYTECLK         : out    vl_logic;
        ENP             : in     vl_logic;
        ROUT_CAL        : in     vl_logic_vector(1 downto 0);
        LB_EN           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end MIPI_CLOCK_UNIV;
