library verilog;
use verilog.vl_types.all;
entity PC64BI is
    port(
        AA              : in     vl_logic_vector(5 downto 0);
        D               : in     vl_logic_vector(39 downto 0);
        BW              : in     vl_logic_vector(39 downto 0);
        WE              : in     vl_logic;
        AB              : in     vl_logic_vector(5 downto 0);
        CK              : in     vl_logic;
        RE              : in     vl_logic;
        Q               : in     vl_logic_vector(39 downto 0);
        AAM             : in     vl_logic_vector(5 downto 0);
        DM              : in     vl_logic;
        BWM1            : in     vl_logic;
        BWM0            : in     vl_logic;
        WEM             : in     vl_logic;
        ABLSB           : in     vl_logic;
        RE_M            : in     vl_logic;
        ED1             : in     vl_logic;
        ED0             : in     vl_logic;
        BIST            : in     vl_logic;
        AAR             : out    vl_logic_vector(5 downto 0);
        DR              : out    vl_logic_vector(39 downto 0);
        BWR             : out    vl_logic_vector(39 downto 0);
        WER             : out    vl_logic;
        ABR             : out    vl_logic_vector(5 downto 0);
        RER             : out    vl_logic;
        MF              : out    vl_logic
    );
end PC64BI;
