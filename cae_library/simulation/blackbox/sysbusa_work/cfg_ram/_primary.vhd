library verilog;
use verilog.vl_types.all;
entity cfg_ram is
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
        CCLK            : in     vl_logic;
        DONE            : in     vl_logic;
        PWR_ON          : in     vl_logic;
        BAD_ADDR        : in     vl_logic;
        FSM_INIT_RAM    : in     vl_logic;
        CFRONT_INIT_N   : in     vl_logic;
        ADDR_HIGH_DEL_N : in     vl_logic;
        CHK_STATE       : in     vl_logic_vector(2 downto 0);
        GOT_ADDR        : in     vl_logic;
        READ_START      : in     vl_logic;
        GOT_DHEADER     : in     vl_logic;
        CFG_DATA_WR     : out    vl_logic;
        CFG_DATA_PC     : out    vl_logic;
        CLR_WR_EN       : out    vl_logic;
        RDBK_PC_EN      : out    vl_logic;
        EN_ADDR         : out    vl_logic
    );
end cfg_ram;
