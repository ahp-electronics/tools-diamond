library verilog;
use verilog.vl_types.all;
entity PCNTR_MUX2X2 is
    port(
        z               : out    vl_logic;
        d               : in     vl_logic_vector(1 downto 0);
        s               : in     vl_logic
    );
end PCNTR_MUX2X2;
