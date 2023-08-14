library verilog;
use verilog.vl_types.all;
entity sft is
    port(
        s               : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        op              : in     vl_logic_vector(4 downto 0);
        se              : in     vl_logic
    );
end sft;
