library verilog;
use verilog.vl_types.all;
entity USR_MR_TOP is
    port(
        HWRITE_USR      : out    vl_logic;
        HWDATA_USR      : out    vl_logic_vector(35 downto 0);
        HTRANS_USR      : out    vl_logic_vector(1 downto 0);
        HSIZE_USR       : out    vl_logic_vector(1 downto 0);
        HLOCK_USR       : out    vl_logic;
        HBUSREQ_USR     : out    vl_logic;
        HBURST_USR      : out    vl_logic;
        HADDR_USR       : out    vl_logic_vector(17 downto 0);
        FMRETRY         : out    vl_logic;
        FMRDATA         : out    vl_logic_vector(35 downto 0);
        FMERR           : out    vl_logic;
        FMACK           : out    vl_logic;
        USER_IRQ_MASTER : out    vl_logic;
        MC1_USR_MR      : in     vl_logic_vector(1 downto 0);
        HRESP           : in     vl_logic_vector(1 downto 0);
        HREADY          : in     vl_logic;
        HRDATA          : in     vl_logic_vector(35 downto 0);
        HGRANT_USR      : in     vl_logic;
        HCLK            : in     vl_logic;
        FMWRN           : in     vl_logic;
        FMWDATA         : in     vl_logic_vector(35 downto 0);
        FMSIZE          : in     vl_logic_vector(1 downto 0);
        FMSCAN          : in     vl_logic;
        FMRDY           : in     vl_logic;
        FMLOCK          : in     vl_logic;
        FMCLK           : in     vl_logic;
        FMBURST         : in     vl_logic;
        FMADDR          : in     vl_logic_vector(17 downto 0);
        FMIRQ           : in     vl_logic;
        FMRESET_N       : in     vl_logic;
        HRESET_N        : in     vl_logic
    );
end USR_MR_TOP;
