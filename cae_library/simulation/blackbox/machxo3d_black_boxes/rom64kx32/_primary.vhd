library verilog;
use verilog.vl_types.all;
entity rom64kx32 is
    port(
        A               : out    vl_logic_vector(31 downto 0);
        RA              : in     vl_logic_vector(13 downto 0);
        CK              : in     vl_logic;
        CE              : in     vl_logic
    );
end rom64kx32;
