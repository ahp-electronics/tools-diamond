library verilog;
use verilog.vl_types.all;
entity ST_MTC_rom4kx32 is
    generic(
        S21             : integer := 0;
        S22             : integer := 1;
        S23             : integer := 2;
        S24             : integer := 3;
        S25             : integer := 4;
        S26             : integer := 5;
        S27             : integer := 6
    );
    port(
        Tclk            : in     vl_logic;
        BistMode        : in     vl_logic;
        S4              : out    vl_logic;
        S2              : in     vl_logic;
        S3              : in     vl_logic;
        S1              : out    vl_logic;
        S8              : out    vl_logic_vector(1 downto 0);
        ShiftEnd        : out    vl_logic;
        S15             : out    vl_logic;
        Finish          : out    vl_logic
    );
end ST_MTC_rom4kx32;
