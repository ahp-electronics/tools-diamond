library verilog;
use verilog.vl_types.all;
entity defaultslave is
    port(
        HCLK            : in     vl_logic;
        HRESET_N        : in     vl_logic;
        HTRANS          : in     vl_logic_vector(1 downto 0);
        HSEL_DEF        : in     vl_logic;
        HREADY          : in     vl_logic;
        HREADY_DEF      : out    vl_logic;
        HRESP_DEF       : out    vl_logic_vector(1 downto 0)
    );
end defaultslave;
