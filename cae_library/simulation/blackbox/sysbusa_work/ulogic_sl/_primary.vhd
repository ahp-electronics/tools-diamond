library verilog;
use verilog.vl_types.all;
entity ulogic_sl is
    generic(
        H_IDLE          : integer := 5;
        H_READ          : integer := 0;
        H_RDWT          : integer := 1;
        H_WRIT          : integer := 7;
        H_WRWT          : integer := 3;
        FS_ID           : integer := 0;
        FS_WR           : integer := 3;
        FS_RW           : integer := 7;
        FS_RD           : integer := 5
    );
    port(
        HCLK            : in     vl_logic;
        HRESET_N        : in     vl_logic;
        HADDR           : in     vl_logic_vector(17 downto 0);
        HTRANS          : in     vl_logic_vector(1 downto 0);
        HWRITE          : in     vl_logic;
        HSIZE           : in     vl_logic_vector(1 downto 0);
        HWDATA          : in     vl_logic_vector(35 downto 0);
        HSEL_USR        : in     vl_logic;
        HREADY          : in     vl_logic;
        HRDATA_USR      : out    vl_logic_vector(35 downto 0);
        HREADY_USR      : out    vl_logic;
        HRESP_USR       : out    vl_logic_vector(1 downto 0);
        SRESET_N        : in     vl_logic;
        MC1_USR_SL      : in     vl_logic_vector(1 downto 0);
        FSCLK           : in     vl_logic;
        FSRDATA         : in     vl_logic_vector(35 downto 0);
        FSERR           : in     vl_logic;
        FSRDY           : out    vl_logic;
        FSACK           : in     vl_logic;
        FSRETRY         : in     vl_logic;
        FSWDATA         : out    vl_logic_vector(35 downto 0);
        FSADDR          : out    vl_logic_vector(17 downto 0);
        FSWRN           : out    vl_logic;
        FSSIZE          : out    vl_logic_vector(1 downto 0);
        FSSCAN          : in     vl_logic
    );
end ulogic_sl;
