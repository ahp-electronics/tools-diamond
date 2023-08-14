library verilog;
use verilog.vl_types.all;
entity ubs1x12_bistctl_int is
    generic(
        SIG_LNG         : integer := 5
    );
    port(
        TCK             : in     vl_logic;
        TDI             : in     vl_logic;
        RUNTST          : in     vl_logic;
        DOBIST          : in     vl_logic;
        CPTDR           : in     vl_logic;
        SHDR            : in     vl_logic;
        RSBSIG          : in     vl_logic_vector;
        ARSTN           : in     vl_logic;
        INITN           : out    vl_logic;
        RB              : out    vl_logic;
        RSBSO           : out    vl_logic;
        RSSIG           : out    vl_logic_vector
    );
end ubs1x12_bistctl_int;
