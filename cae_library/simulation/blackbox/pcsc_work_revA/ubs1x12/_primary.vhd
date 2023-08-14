library verilog;
use verilog.vl_types.all;
entity ubs1x12 is
    port(
        TDI             : in     vl_logic;
        TCK             : in     vl_logic;
        ARSTN           : in     vl_logic;
        RUNTST          : in     vl_logic;
        DOBIST          : in     vl_logic;
        BISTRTCNTDONE   : in     vl_logic;
        BISTSKIP_A1     : in     vl_logic;
        CPTDR           : in     vl_logic;
        SHDR            : in     vl_logic;
        CK_A1           : in     vl_logic;
        BISTDONE_A1     : in     vl_logic_vector(11 downto 0);
        BISTF_A1        : in     vl_logic_vector(11 downto 0);
        BIST_RSSIGSO    : out    vl_logic;
        UBS_RSSIG       : out    vl_logic_vector(15 downto 0);
        UBS_DONE_A1     : out    vl_logic;
        UBS_BISTCOMPLETE: out    vl_logic;
        BISTRTCNT       : out    vl_logic;
        BISTRUN_A1      : out    vl_logic;
        BISTFC_A1       : out    vl_logic
    );
end ubs1x12;
