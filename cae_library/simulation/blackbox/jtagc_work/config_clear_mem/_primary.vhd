library verilog;
use verilog.vl_types.all;
entity config_clear_mem is
    port(
        por             : in     vl_logic;
        cmd_clear_all_r : in     vl_logic;
        mclk_2mhz       : in     vl_logic;
        rti             : in     vl_logic;
        auto_clear_en   : in     vl_logic;
        clear_memory    : in     vl_logic;
        erase_o         : in     vl_logic;
        clear_wdline_on : out    vl_logic;
        clear_asrce     : out    vl_logic;
        isc_wdline_on   : out    vl_logic;
        isc_asrce       : out    vl_logic;
        clear_rst_asr   : out    vl_logic;
        auto_clear      : out    vl_logic;
        auto_rst_asr    : out    vl_logic
    );
end config_clear_mem;
