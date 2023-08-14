library verilog;
use verilog.vl_types.all;
entity chif_counter is
    generic(
        max_value       : integer := 255
    );
    port(
        out_data        : out    vl_logic_vector(7 downto 0);
        cor             : in     vl_logic;
        error           : in     vl_logic;
        test_clk        : in     vl_logic;
        test_mode       : in     vl_logic
    );
end chif_counter;
