library verilog;
use verilog.vl_types.all;
entity pcsm_64x40 is
    generic(
        N               : integer := 40;
        W               : integer := 64;
        M               : integer := 6
    );
    port(
        DI              : in     vl_logic_vector;
        DO              : out    vl_logic_vector;
        RA              : in     vl_logic_vector;
        RCLK            : in     vl_logic;
        REN             : in     vl_logic;
        RESETB          : in     vl_logic;
        WA              : in     vl_logic_vector;
        WCLK            : in     vl_logic;
        WEN             : in     vl_logic_vector
    );
end pcsm_64x40;
