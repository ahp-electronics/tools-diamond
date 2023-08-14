library verilog;
use verilog.vl_types.all;
entity OSC_DIV is
    port(
        CFG_OSC         : in     vl_logic;
        OSC_DIV_EN      : in     vl_logic;
        CFG_DIV         : out    vl_logic_vector(6 downto 0)
    );
end OSC_DIV;
