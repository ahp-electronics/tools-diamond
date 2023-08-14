library verilog;
use verilog.vl_types.all;
entity ROM64KBSVT1V is
    port(
        A               : out    vl_logic_vector(31 downto 0);
        RA              : in     vl_logic_vector(13 downto 0);
        CK              : in     vl_logic;
        CE              : in     vl_logic
    );
end ROM64KBSVT1V;
