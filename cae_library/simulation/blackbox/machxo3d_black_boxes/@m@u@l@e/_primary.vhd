library verilog;
use verilog.vl_types.all;
entity MULE is
    port(
        \in\            : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end MULE;
