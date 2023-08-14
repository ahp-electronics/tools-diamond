library verilog;
use verilog.vl_types.all;
entity cfg_sd1 is
    generic(
        RESETVALUE      : integer := 1
    );
    port(
        sd1_bit         : out    vl_logic;
        por             : in     vl_logic;
        smclk           : in     vl_logic;
        erase           : in     vl_logic;
        set             : in     vl_logic;
        set_val         : in     vl_logic;
        update          : in     vl_logic;
        upd_val         : in     vl_logic
    );
end cfg_sd1;
