library verilog;
use verilog.vl_types.all;
entity PC12BBIST is
    port(
        MF0             : in     vl_logic;
        CK              : in     vl_logic;
        BIST            : in     vl_logic;
        BFC             : in     vl_logic;
        AM              : out    vl_logic_vector(3 downto 0);
        DM              : out    vl_logic;
        BW1M            : out    vl_logic;
        BW0M            : out    vl_logic;
        WEM0            : out    vl_logic;
        ABLSB           : out    vl_logic;
        RE_M            : out    vl_logic;
        ED1             : out    vl_logic;
        ED0             : out    vl_logic;
        BF0             : out    vl_logic;
        BC              : out    vl_logic
    );
end PC12BBIST;
