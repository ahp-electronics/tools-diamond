library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        PAD_DONE        : in     vl_logic;
        HADDR           : in     vl_logic_vector(17 downto 0);
        LASB_SLAVE_ENABLE: in     vl_logic;
        RASB_SLAVE_ENABLE: in     vl_logic;
        HTRANS          : in     vl_logic_vector(1 downto 0);
        HSEL_LFPSC      : out    vl_logic;
        HSEL_RFPSC      : out    vl_logic;
        HSEL_RAMT       : out    vl_logic;
        HSEL_FPGA       : out    vl_logic;
        HSEL_SBC        : out    vl_logic;
        HSEL_DEF        : out    vl_logic
    );
end decoder;
