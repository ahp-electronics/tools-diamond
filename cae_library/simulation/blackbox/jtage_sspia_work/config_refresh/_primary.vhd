library verilog;
use verilog.vl_types.all;
entity config_refresh is
    port(
        fl_edit_dwnld   : out    vl_logic;
        latch_shadow    : in     vl_logic;
        edee            : in     vl_logic;
        por             : in     vl_logic;
        progdis_o       : in     vl_logic;
        rti             : in     vl_logic;
        tlreset         : in     vl_logic;
        edsram_tran     : in     vl_logic;
        tck             : in     vl_logic
    );
end config_refresh;
