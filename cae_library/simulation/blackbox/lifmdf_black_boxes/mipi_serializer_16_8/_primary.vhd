library verilog;
use verilog.vl_types.all;
entity mipi_serializer_16_8 is
    generic(
        WIDTH           : integer := 16
    );
    port(
        HS_BYTE_CLKS    : in     vl_logic;
        HS_16BIT_EN     : in     vl_logic;
        HSTX_DATA_16    : in     vl_logic_vector;
        HS_SER_EN       : in     vl_logic;
        HSTX_DATA_8     : out    vl_logic_vector(7 downto 0);
        PD              : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end mipi_serializer_16_8;
