library verilog;
use verilog.vl_types.all;
entity cmux_8_to_1 is
    port(
        \in\            : in     vl_logic_vector(7 downto 0);
        \select\        : in     vl_logic_vector(2 downto 0);
        z               : out    vl_logic
    );
end cmux_8_to_1;
