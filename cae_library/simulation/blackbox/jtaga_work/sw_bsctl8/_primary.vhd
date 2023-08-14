library verilog;
use verilog.vl_types.all;
entity sw_bsctl8 is
    port(
        TDO             : out    vl_logic;
        TRESET          : out    vl_logic;
        PSRSFTN         : out    vl_logic;
        PSRCAP          : out    vl_logic;
        PSRENABLE1      : out    vl_logic;
        PSRENABLE2      : out    vl_logic;
        PSRENABLE3      : out    vl_logic;
        SCANENABLE      : out    vl_logic_vector(8 downto 1);
        JRSTN           : out    vl_logic;
        JTCK            : out    vl_logic;
        JTDI            : out    vl_logic;
        JSHIFT          : out    vl_logic;
        JUPDATE         : out    vl_logic;
        JCE             : out    vl_logic_vector(8 downto 1);
        JRTI            : out    vl_logic_vector(8 downto 1);
        HDC             : out    vl_logic;
        LDCN            : out    vl_logic;
        RCLK            : out    vl_logic;
        SPI_TRI_ION     : out    vl_logic;
        TCK             : in     vl_logic;
        TMS             : in     vl_logic;
        TDI             : in     vl_logic;
        PSROUT1         : in     vl_logic;
        PSROUT2         : in     vl_logic;
        PSROUT3         : in     vl_logic;
        JTDO            : in     vl_logic_vector(8 downto 1);
        D0              : in     vl_logic;
        MC1_EN_SPI_N    : in     vl_logic
    );
end sw_bsctl8;
