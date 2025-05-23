library verilog;
use verilog.vl_types.all;
entity asb is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        ci              : in     vl_logic;
        op              : in     vl_logic;
        s               : out    vl_logic_vector(31 downto 0);
        co              : out    vl_logic
    );
end asb;
