library verilog;
use verilog.vl_types.all;
entity ST_MTC_ebr_hse_spram512x16 is
    generic(
        S35             : integer := 0;
        S36             : integer := 1;
        S37             : integer := 2;
        S38             : integer := 3;
        S39             : integer := 4;
        S40             : integer := 5;
        S41             : integer := 6;
        S42             : integer := 7;
        S43             : integer := 8;
        S44             : integer := 9;
        S45             : integer := 10;
        S46             : integer := 11;
        S47             : integer := 12;
        S48             : integer := 13;
        S49             : integer := 14;
        S50             : integer := 15;
        S51             : integer := 16;
        S52             : integer := 17;
        S53             : integer := 18;
        S54             : integer := 19;
        S55             : integer := 20;
        S56             : integer := 21;
        S57             : integer := 22;
        S58             : integer := 23;
        S59             : integer := 24;
        S60             : integer := 25;
        S61             : integer := 26;
        S62             : integer := 27;
        S63             : integer := 28;
        S64             : integer := 29;
        S65             : integer := 30;
        S66             : integer := 31;
        S67             : integer := 32;
        S68             : integer := 33
    );
    port(
        Tclk            : in     vl_logic;
        mrst_n          : in     vl_logic;
        BistMode        : in     vl_logic;
        S22             : out    vl_logic;
        S23             : out    vl_logic;
        S4              : out    vl_logic;
        S2              : in     vl_logic;
        S3              : in     vl_logic;
        S1              : out    vl_logic;
        S11             : out    vl_logic;
        S12             : out    vl_logic;
        S10             : out    vl_logic;
        S24             : out    vl_logic;
        retention_test_en: in     vl_logic;
        S25             : out    vl_logic;
        Finish          : out    vl_logic
    );
end ST_MTC_ebr_hse_spram512x16;
