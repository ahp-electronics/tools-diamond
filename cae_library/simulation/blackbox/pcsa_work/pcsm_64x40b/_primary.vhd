library verilog;
use verilog.vl_types.all;
entity pcsm_64x40b is
    generic(
        N               : integer := 40;
        W               : integer := 64;
        M               : integer := 6
    );
    port(
        DO              : out    vl_logic_vector;
        BC              : out    vl_logic;
        BF0             : out    vl_logic;
        DI              : in     vl_logic_vector;
        WCLK            : in     vl_logic;
        RCLK            : in     vl_logic;
        RESETB          : in     vl_logic;
        WA              : in     vl_logic_vector;
        RA              : in     vl_logic_vector;
        WEN             : in     vl_logic_vector;
        REN             : in     vl_logic;
        BIST            : in     vl_logic;
        BFC             : in     vl_logic
    );
end pcsm_64x40b;
