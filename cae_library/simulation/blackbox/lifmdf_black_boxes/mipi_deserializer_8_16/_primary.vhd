library verilog;
use verilog.vl_types.all;
entity mipi_deserializer_8_16 is
    generic(
        WIDTH           : integer := 16
    );
    port(
        PD              : in     vl_logic;
        HS_DESER_EN     : in     vl_logic;
        HS_16BIT_EN     : in     vl_logic;
        HSRX_DATA_8     : in     vl_logic_vector(7 downto 0);
        HS_BYTE_CLKD    : in     vl_logic;
        HS_BYTE_CLKD_16 : out    vl_logic;
        HSRX_DATA_16    : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end mipi_deserializer_8_16;
