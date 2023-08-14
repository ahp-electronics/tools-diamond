library verilog;
use verilog.vl_types.all;
entity switch_noglitch is
    port(
        CLKOUT          : out    vl_logic;
        VCCM            : in     vl_logic;
        clka            : in     vl_logic;
        clkb            : in     vl_logic;
        sel             : in     vl_logic
    );
end switch_noglitch;
