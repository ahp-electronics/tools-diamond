library verilog;
use verilog.vl_types.all;
entity mix_columns is
    port(
        \in\            : in     vl_logic_vector(127 downto 0);
        \out\           : out    vl_logic_vector(127 downto 0)
    );
end mix_columns;
