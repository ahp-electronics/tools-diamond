library verilog;
use verilog.vl_types.all;
entity rom4kx32_wrapper_rom4kx32 is
    port(
        CK              : in     vl_logic;
        CE              : in     vl_logic;
        A               : out    vl_logic_vector(31 downto 0);
        RA              : in     vl_logic_vector(9 downto 0);
        Tclk            : in     vl_logic;
        ByPass          : in     vl_logic;
        bist_ctrl       : in     vl_logic_vector(10 downto 0)
    );
end rom4kx32_wrapper_rom4kx32;
