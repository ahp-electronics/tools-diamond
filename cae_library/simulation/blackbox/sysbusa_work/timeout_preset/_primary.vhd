library verilog;
use verilog.vl_types.all;
entity timeout_preset is
    port(
        Timeout_Index   : in     vl_logic_vector(3 downto 0);
        TO_Ld           : out    vl_logic_vector(30 downto 0)
    );
end timeout_preset;
