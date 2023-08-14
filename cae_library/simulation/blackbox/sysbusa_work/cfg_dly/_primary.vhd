library verilog;
use verilog.vl_types.all;
entity cfg_dly is
    port(
        iSHIFT_ADDR_1ST : in     vl_logic;
        iSHIFT_ADDR_2ND : in     vl_logic;
        iRST_ADDR_REG   : in     vl_logic;
        iINIT_1_DATA    : in     vl_logic;
        iGOT_DATA       : in     vl_logic;
        iLD_RDBKD       : in     vl_logic;
        iCFG_DATA       : in     vl_logic_vector(7 downto 0);
        SHIFT_ADDR_1ST  : out    vl_logic;
        SHIFT_ADDR_2ND  : out    vl_logic;
        RST_ADDR_REG    : out    vl_logic;
        INIT_1_DATA     : out    vl_logic;
        GOT_DATA        : out    vl_logic;
        LD_RDBKD        : out    vl_logic;
        CFG_DATA        : out    vl_logic_vector(7 downto 0)
    );
end cfg_dly;
