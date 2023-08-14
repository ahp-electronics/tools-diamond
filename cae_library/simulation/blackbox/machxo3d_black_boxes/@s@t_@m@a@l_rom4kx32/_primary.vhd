library verilog;
use verilog.vl_types.all;
entity ST_MAL_rom4kx32 is
    port(
        Tclk            : in     vl_logic;
        BistMode        : in     vl_logic;
        BistFail        : out    vl_logic;
        S7              : in     vl_logic;
        MemDo           : in     vl_logic_vector(31 downto 0);
        SignatureParallel: out    vl_logic_vector(49 downto 0);
        S8              : in     vl_logic_vector(1 downto 0);
        SignatureOut    : out    vl_logic
    );
end ST_MAL_rom4kx32;
