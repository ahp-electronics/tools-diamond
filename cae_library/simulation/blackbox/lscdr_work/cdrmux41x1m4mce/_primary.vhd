library verilog;
use verilog.vl_types.all;
entity cdrmux41x1m4mce is
    port(
        A0              : in     vl_logic;
        A1              : in     vl_logic;
        A2              : in     vl_logic;
        A3              : in     vl_logic;
        S               : in     vl_logic_vector(3 downto 0);
        Z               : out    vl_logic
    );
end cdrmux41x1m4mce;
