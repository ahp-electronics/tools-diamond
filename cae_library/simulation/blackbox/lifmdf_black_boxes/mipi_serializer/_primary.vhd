library verilog;
use verilog.vl_types.all;
entity mipi_serializer is
    generic(
        WIDTH           : integer := 8
    );
    port(
        HS_BYTE_CLKS    : in     vl_logic;
        HS_TXCLK        : in     vl_logic;
        HSTX_DATA       : in     vl_logic_vector;
        HS_SER_EN       : in     vl_logic;
        HS_SER_LD       : in     vl_logic;
        TXHSPD          : in     vl_logic;
        DTXHS           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end mipi_serializer;
