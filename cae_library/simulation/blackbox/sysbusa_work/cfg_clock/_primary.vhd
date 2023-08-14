library verilog;
use verilog.vl_types.all;
entity cfg_clock is
    generic(
        MASTER_SERI     : integer := 8;
        MASTER_PARA     : integer := 12;
        ASYNC_PERI      : integer := 13;
        SLAVE_SERI      : integer := 15;
        SLAVE_PARA      : integer := 9;
        FPSC_PARA       : integer := 7;
        MASTER_BYTE     : integer := 6;
        FLASH_SPI03     : integer := 5;
        FLASH_SPIX      : integer := 4;
        MPC_BYTE        : integer := 10;
        MPC_HWORD       : integer := 11;
        MPC_WORD        : integer := 14;
        CHK_PRE         : integer := 0;
        CHK_ID          : integer := 1;
        CHK_HDR         : integer := 2;
        CHK_FPGA        : integer := 3;
        CHK_RAM         : integer := 6;
        CHK_FPSC        : integer := 5;
        CHK_POST        : integer := 7
    );
    port(
        M_CLK           : in     vl_logic;
        RD_CFG_USR      : in     vl_logic;
        PRGM_JTAG       : in     vl_logic;
        RD_CFG_JTAG     : in     vl_logic;
        STOPCCLK_N      : in     vl_logic;
        CFG_CK          : in     vl_logic;
        HCLK            : in     vl_logic;
        DONE            : in     vl_logic;
        CFRONT_INIT_N   : in     vl_logic;
        PWRUP           : in     vl_logic;
        PRGM_SYS        : in     vl_logic_vector(2 downto 0);
        LMODE           : in     vl_logic_vector(3 downto 0);
        OSC_SEL         : in     vl_logic_vector(2 downto 0);
        OSC_DIV_RAM     : in     vl_logic_vector(2 downto 0);
        EN_OSC_RAM      : in     vl_logic;
        EN_SED_RAM      : in     vl_logic;
        HCLK_RST        : in     vl_logic;
        CLKMPI          : in     vl_logic;
        CLKFPSC         : in     vl_logic;
        CLKUSR          : in     vl_logic;
        CLKOSC          : in     vl_logic;
        EXTCCLK         : in     vl_logic;
        SED_RDBK        : out    vl_logic;
        OSC_DIV_EN      : out    vl_logic;
        HCLK_SEL        : out    vl_logic_vector(2 downto 0);
        SCLK_SEL        : out    vl_logic_vector(1 downto 0);
        CCLK_SEL        : out    vl_logic_vector(1 downto 0);
        CK_SEL          : out    vl_logic_vector(2 downto 0);
        EN_OSC          : out    vl_logic;
        MPI_CLK_SEL     : out    vl_logic;
        SYS_MODE        : out    vl_logic;
        HCLK_SWITCH     : out    vl_logic
    );
end cfg_clock;
