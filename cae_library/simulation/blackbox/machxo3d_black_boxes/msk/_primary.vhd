library verilog;
use verilog.vl_types.all;
entity msk is
    port(
        s               : out    vl_logic_vector(31 downto 0);
        t               : out    vl_logic;
        a               : in     vl_logic_vector(31 downto 0);
        idx             : in     vl_logic_vector(4 downto 0);
        set             : in     vl_logic_vector(9 downto 0);
        op              : in     vl_logic_vector(1 downto 0)
    );
end msk;
