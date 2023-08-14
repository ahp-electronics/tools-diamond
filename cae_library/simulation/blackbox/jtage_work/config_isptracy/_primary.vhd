library verilog;
use verilog.vl_types.all;
entity config_isptracy is
    port(
        rti_er1b        : out    vl_logic;
        rti_er2b        : out    vl_logic;
        er_shdrb_capdr  : out    vl_logic;
        er_updrb        : out    vl_logic;
        enable_er1b     : out    vl_logic;
        enable_er2b     : out    vl_logic;
        er_rst          : out    vl_logic;
        er1out          : out    vl_logic;
        er2out          : out    vl_logic;
        tdi_er_in       : out    vl_logic;
        por             : in     vl_logic;
        seler1          : in     vl_logic;
        seler2          : in     vl_logic;
        mc1_er1_exist   : in     vl_logic;
        mc1_er2_exist   : in     vl_logic;
        capdr           : in     vl_logic;
        tdi             : in     vl_logic;
        tck             : in     vl_logic;
        rti             : in     vl_logic;
        shiftdr         : in     vl_logic;
        updr            : in     vl_logic;
        tlreset         : in     vl_logic;
        tdo_er1         : in     vl_logic;
        tdo_er2         : in     vl_logic
    );
end config_isptracy;
