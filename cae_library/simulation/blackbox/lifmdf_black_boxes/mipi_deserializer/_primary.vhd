library verilog;
use verilog.vl_types.all;
entity mipi_deserializer is
    generic(
        WIDTH           : integer := 8
    );
    port(
        RxDDRClkHS      : in     vl_logic;
        DRXHSP          : in     vl_logic;
        HS_DESER_EN_D   : in     vl_logic;
        HS_DESER_EN     : out    vl_logic;
        HSRX_DATA       : out    vl_logic_vector;
        HS_BYTE_CLKD    : out    vl_logic;
        HS_BYTE_CLKD_16 : in     vl_logic;
        HS_16BIT_EN     : in     vl_logic;
        SYNC            : out    vl_logic;
        ERRSYNC         : out    vl_logic;
        NOSYNC          : out    vl_logic;
        ENP             : in     vl_logic;
        PD              : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end mipi_deserializer;
