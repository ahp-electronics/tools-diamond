library verilog;
use verilog.vl_types.all;
entity bstapfsm_1 is
    generic(
        st_tlr          : integer := 15;
        st_idle         : integer := 14;
        st_seldr        : integer := 12;
        st_cptdr        : integer := 8;
        st_shdr         : integer := 6;
        st_ex1dr        : integer := 2;
        st_padr         : integer := 5;
        st_ex2dr        : integer := 0;
        st_updr         : integer := 4;
        st_selir        : integer := 13;
        st_cptir        : integer := 9;
        st_shir         : integer := 11;
        st_ex1ir        : integer := 3;
        st_pair         : integer := 7;
        st_ex2ir        : integer := 1;
        st_upir         : integer := 10
    );
    port(
        TCK             : in     vl_logic;
        TMS             : in     vl_logic;
        RSTN            : in     vl_logic;
        SELIR           : out    vl_logic;
        SHIR            : out    vl_logic;
        CPTIR           : out    vl_logic;
        UPDTIR          : out    vl_logic;
        SHDR            : out    vl_logic;
        CPTDR           : out    vl_logic;
        UPDTDR          : out    vl_logic;
        TLR             : out    vl_logic;
        RUNTST          : out    vl_logic;
        TDOE_D          : out    vl_logic
    );
end bstapfsm_1;
