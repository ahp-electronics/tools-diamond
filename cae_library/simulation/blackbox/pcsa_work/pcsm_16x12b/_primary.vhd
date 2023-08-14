library verilog;
use verilog.vl_types.all;
entity pcsm_16x12b is
    generic(
        N               : integer := 12;
        W               : integer := 16;
        M               : integer := 4
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
end pcsm_16x12b;
