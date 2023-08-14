library verilog;
use verilog.vl_types.all;
entity Bisted_rom4kx32 is
    port(
        Tclk            : in     vl_logic;
        CK              : in     vl_logic;
        CE              : in     vl_logic;
        A               : out    vl_logic_vector(31 downto 0);
        RA              : in     vl_logic_vector(9 downto 0);
        ByPass          : in     vl_logic;
        BistFail        : out    vl_logic;
        ShiftEnd        : out    vl_logic;
        SignatureOut    : out    vl_logic;
        SignatureParallel: out    vl_logic_vector(49 downto 0);
        Finish          : out    vl_logic;
        BistMode        : in     vl_logic
    );
end Bisted_rom4kx32;
