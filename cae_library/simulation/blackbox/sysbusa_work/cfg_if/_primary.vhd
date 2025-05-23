library verilog;
use verilog.vl_types.all;
entity cfg_if is
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
        SER_CCLK        : in     vl_logic;
        SYS_RDBK        : in     vl_logic;
        SYS_BUS_CFG     : in     vl_logic;
        SYS_P2S_DONE    : in     vl_logic;
        STOPCCLK_N      : in     vl_logic;
        RD_SHIFT        : in     vl_logic_vector(1 downto 0);
        SYS_RDBKD       : in     vl_logic_vector(7 downto 0);
        DONE            : in     vl_logic;
        RD_N            : in     vl_logic;
        WR_N            : in     vl_logic;
        CS0_N           : in     vl_logic;
        CS1             : in     vl_logic;
        TRI_ION         : in     vl_logic;
        RDY_BUSY_N      : in     vl_logic;
        CFG_PRGM_N      : in     vl_logic;
        PWRUPRES        : in     vl_logic;
        CFRONT_INIT_N   : in     vl_logic;
        LMODE           : in     vl_logic_vector(3 downto 0);
        CFG_BUS_ERR     : in     vl_logic_vector(1 downto 0);
        ERR_FLAG        : in     vl_logic_vector(1 downto 0);
        SYS_DAISY       : in     vl_logic;
        RDATA_ACK       : in     vl_logic;
        WDATA_READY     : in     vl_logic;
        RDATA_SIZE      : in     vl_logic_vector(1 downto 0);
        WDATA_SIZE      : in     vl_logic_vector(1 downto 0);
        WDATA           : in     vl_logic_vector(31 downto 0);
        MPI_RD_DATA     : in     vl_logic_vector(7 downto 3);
        MPI_TRI_DATA    : in     vl_logic;
        MPI_TRI_CNTL    : in     vl_logic;
        MPI_DP_ENABLE   : in     vl_logic;
        MPI_RST_RAM     : in     vl_logic;
        MPI_ASYNC_RAM   : in     vl_logic;
        MPI_RST_N       : in     vl_logic;
        CFG_RESET_N     : in     vl_logic;
        MPI_CLK_SEL     : in     vl_logic;
        MPI_SYNC        : out    vl_logic;
        MPI_RESET_N     : out    vl_logic;
        SYS_CFGD_BYTE   : out    vl_logic_vector(7 downto 0);
        RDATA           : out    vl_logic_vector(31 downto 0);
        RDATA_READY     : out    vl_logic;
        WDATA_ACK       : out    vl_logic;
        CFG_IRQ_DATA    : out    vl_logic;
        MPI_DATA_PORT   : out    vl_logic_vector(2 downto 0);
        PD_OUT          : out    vl_logic_vector(7 downto 3);
        PD7_3_TS        : out    vl_logic;
        PD2_0_TS        : out    vl_logic;
        PD15_8_TS       : out    vl_logic;
        PD31_16_TS      : out    vl_logic;
        MPI_CNTL_TS     : out    vl_logic;
        MPI_DP_TS       : out    vl_logic_vector(2 downto 0);
        MPI_DP_TRI_ION  : out    vl_logic_vector(2 downto 0);
        MPI_TRI_ION     : out    vl_logic_vector(2 downto 0);
        SYS_DATA_RDY    : out    vl_logic
    );
end cfg_if;
