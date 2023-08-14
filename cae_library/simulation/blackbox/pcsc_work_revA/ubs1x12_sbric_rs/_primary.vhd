library verilog;
use verilog.vl_types.all;
entity ubs1x12_sbric_rs is
    generic(
        NUMBER_GRP      : integer := 12;
        NUMBER_RS       : integer := 12
    );
    port(
        CK              : in     vl_logic;
        INITN           : in     vl_logic;
        RB              : in     vl_logic;
        SKIP            : in     vl_logic;
        TOKENI          : in     vl_logic;
        BISTDONE        : in     vl_logic_vector;
        BISTF           : in     vl_logic_vector;
        ARSTN           : in     vl_logic;
        BISTRUN         : out    vl_logic;
        TOKENO          : out    vl_logic;
        BISTFC          : out    vl_logic;
        DONE            : out    vl_logic;
        BISTFLG         : out    vl_logic_vector;
        Y               : out    vl_logic_vector(3 downto 0);
        n400            : out    vl_logic
    );
end ubs1x12_sbric_rs;
