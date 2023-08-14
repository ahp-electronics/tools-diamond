library verilog;
use verilog.vl_types.all;
entity cfg_spi is
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
        J_SPI_PROG      : in     vl_logic;
        J_SHDR          : in     vl_logic;
        J_SCANIN        : in     vl_logic;
        J_TCK           : in     vl_logic;
        CAP_COMM        : in     vl_logic;
        LMODE           : in     vl_logic_vector(3 downto 0);
        BUS_SIZE        : in     vl_logic_vector(2 downto 0);
        DEL_D           : in     vl_logic_vector(7 downto 0);
        CFRONT_INIT_N   : in     vl_logic;
        SPI_ADDR        : in     vl_logic_vector(31 downto 0);
        RCLK            : in     vl_logic;
        HDC             : out    vl_logic;
        LDC_N           : out    vl_logic;
        DEL_D0          : out    vl_logic;
        RDY_BUSY_N      : out    vl_logic
    );
end cfg_spi;
