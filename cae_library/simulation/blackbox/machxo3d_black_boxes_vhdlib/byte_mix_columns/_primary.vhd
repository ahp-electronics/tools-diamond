library verilog;
use verilog.vl_types.all;
entity byte_mix_columns is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        c               : in     vl_logic_vector(7 downto 0);
        d               : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end byte_mix_columns;
