library verilog;
use verilog.vl_types.all;
entity inv_shift_rows is
    port(
        si              : in     vl_logic_vector(127 downto 0);
        so              : out    vl_logic_vector(127 downto 0)
    );
end inv_shift_rows;
