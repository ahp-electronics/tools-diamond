library verilog;
use verilog.vl_types.all;
entity rom64kx32_wrapper_rom64kx32 is
    port(
        CK              : in     vl_logic;
        CE              : in     vl_logic;
        A               : out    vl_logic_vector(31 downto 0);
        RA              : in     vl_logic_vector(13 downto 0);
        Tclk            : in     vl_logic;
        ByPass          : in     vl_logic;
        bist_ctrl       : in     vl_logic_vector(14 downto 0)
    );
end rom64kx32_wrapper_rom64kx32;
