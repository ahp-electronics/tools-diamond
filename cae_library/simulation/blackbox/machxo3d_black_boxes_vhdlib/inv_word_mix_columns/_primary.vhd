library verilog;
use verilog.vl_types.all;
entity inv_word_mix_columns is
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end inv_word_mix_columns;
