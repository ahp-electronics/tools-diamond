library verilog;
use verilog.vl_types.all;
entity inv_mix_columns is
    port(
        \in\            : in     vl_logic_vector(127 downto 0);
        \out\           : out    vl_logic_vector(127 downto 0)
    );
end inv_mix_columns;
