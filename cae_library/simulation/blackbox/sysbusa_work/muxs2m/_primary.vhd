library verilog;
use verilog.vl_types.all;
entity muxs2m is
    port(
        HCLK            : in     vl_logic;
        HCLK_SWITCH     : in     vl_logic;
        HRESET_N        : in     vl_logic;
        Timeout_Index   : in     vl_logic_vector(3 downto 0);
        HSEL_LFPSC      : in     vl_logic;
        HSEL_FPGA       : in     vl_logic;
        HSEL_RFPSC      : in     vl_logic;
        HSEL_RAMT       : in     vl_logic;
        HSEL_SBC        : in     vl_logic;
        HSEL_DEF        : in     vl_logic;
        HRDATA_LFPSC    : in     vl_logic_vector(35 downto 0);
        HRDATA_FPGA     : in     vl_logic_vector(35 downto 0);
        HRDATA_RFPSC    : in     vl_logic_vector(35 downto 0);
        HRDATA_SBC      : in     vl_logic_vector(35 downto 0);
        HREADY_LFPSC    : in     vl_logic;
        HREADY_FPGA     : in     vl_logic;
        HREADY_RFPSC    : in     vl_logic;
        HREADY_RAMT     : in     vl_logic;
        HREADY_SBC      : in     vl_logic;
        HREADY_DEF      : in     vl_logic;
        HRESP_LFPSC     : in     vl_logic_vector(1 downto 0);
        HRESP_FPGA      : in     vl_logic_vector(1 downto 0);
        HRESP_RFPSC     : in     vl_logic_vector(1 downto 0);
        HRESP_RAMT      : in     vl_logic_vector(1 downto 0);
        HRESP_SBC       : in     vl_logic_vector(1 downto 0);
        HRESP_DEF       : in     vl_logic_vector(1 downto 0);
        HRDATA          : out    vl_logic_vector(35 downto 0);
        HREADY          : out    vl_logic;
        HRESP           : out    vl_logic_vector(1 downto 0)
    );
end muxs2m;
