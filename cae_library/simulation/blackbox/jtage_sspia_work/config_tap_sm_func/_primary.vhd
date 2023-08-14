library verilog;
use verilog.vl_types.all;
entity config_tap_sm_func is
    generic(
        st_tlreset      : integer := 15;
        st_capir        : integer := 14;
        st_upir         : integer := 13;
        st_rti          : integer := 12;
        st_pauseir      : integer := 11;
        st_shiftir      : integer := 10;
        st_exit1ir      : integer := 9;
        st_exit2ir      : integer := 8;
        st_seldr        : integer := 7;
        st_capdr        : integer := 6;
        st_updr         : integer := 5;
        st_selir        : integer := 4;
        st_pausedr      : integer := 3;
        st_shiftdr      : integer := 2;
        st_exit1dr      : integer := 1;
        st_exit2dr      : integer := 0
    );
    port(
        tck             : in     vl_logic;
        tms             : in     vl_logic;
        por             : in     vl_logic;
        jtag_state      : out    vl_logic_vector(3 downto 0);
        tlreset         : out    vl_logic;
        capir           : out    vl_logic;
        upir            : out    vl_logic;
        rti             : out    vl_logic;
        shiftir         : out    vl_logic;
        seldr           : out    vl_logic;
        capdr           : out    vl_logic;
        updr            : out    vl_logic;
        selir           : out    vl_logic;
        shiftdr         : out    vl_logic
    );
end config_tap_sm_func;
