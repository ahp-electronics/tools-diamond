library verilog;
use verilog.vl_types.all;
entity MUL9 is
    port(
        \in\            : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end MUL9;
