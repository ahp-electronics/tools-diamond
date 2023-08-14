library verilog;
use verilog.vl_types.all;
entity maa is
    port(
        sh              : out    vl_logic_vector(31 downto 0);
        sl              : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        c               : in     vl_logic_vector(31 downto 0)
    );
end maa;
