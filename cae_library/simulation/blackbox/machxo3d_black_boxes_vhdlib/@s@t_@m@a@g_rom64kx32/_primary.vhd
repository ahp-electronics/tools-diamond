library verilog;
use verilog.vl_types.all;
entity ST_MAG_rom64kx32 is
    port(
        Tclk            : in     vl_logic;
        BistMode        : in     vl_logic;
        S0              : out    vl_logic_vector(13 downto 0);
        S1              : in     vl_logic;
        S2              : out    vl_logic;
        S3              : out    vl_logic;
        S4              : in     vl_logic
    );
end ST_MAG_rom64kx32;
