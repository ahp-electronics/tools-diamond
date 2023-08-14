library verilog;
use verilog.vl_types.all;
entity cfg_div is
    generic(
        a_width         : integer := 14;
        b_width         : integer := 10;
        DIV             : integer := 21
    );
    port(
        D               : in     vl_logic_vector(13 downto 0);
        Q               : out    vl_logic_vector(9 downto 0);
        R               : out    vl_logic_vector(4 downto 0)
    );
end cfg_div;
