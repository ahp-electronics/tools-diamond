library verilog;
use verilog.vl_types.all;
entity USR_SL_TOP is
    port(
        HRESP_USR       : out    vl_logic_vector(1 downto 0);
        HREADY_USR      : out    vl_logic;
        HRDATA_USR      : out    vl_logic_vector(35 downto 0);
        FSWRN           : out    vl_logic;
        FSWDATA         : out    vl_logic_vector(35 downto 0);
        FSSIZE          : out    vl_logic_vector(1 downto 0);
        FSRDY           : out    vl_logic;
        FSADDR          : out    vl_logic_vector(17 downto 0);
        USER_IRQ_SLAVE  : out    vl_logic;
        MC1_USR_SL      : in     vl_logic_vector(1 downto 0);
        HWRITE          : in     vl_logic;
        HWDATA          : in     vl_logic_vector(35 downto 0);
        HTRANS          : in     vl_logic_vector(1 downto 0);
        HSIZE           : in     vl_logic_vector(1 downto 0);
        HSEL_USR        : in     vl_logic;
        HREADY          : in     vl_logic;
        HCLK            : in     vl_logic;
        HADDR           : in     vl_logic_vector(17 downto 0);
        FSSCAN          : in     vl_logic;
        FSRETRY         : in     vl_logic;
        FSRDATA         : in     vl_logic_vector(35 downto 0);
        FSERR           : in     vl_logic;
        FSCLK           : in     vl_logic;
        FSACK           : in     vl_logic;
        HRESET_N        : in     vl_logic;
        FSIRQ           : in     vl_logic;
        FSRESET_N       : in     vl_logic
    );
end USR_SL_TOP;
