library verilog;
use verilog.vl_types.all;
entity gen_cell_2_1_mux is
    generic(
        g_str           : integer := 2
    );
    port(
        sel             : in     vl_logic;
        in0             : in     vl_logic;
        in1             : in     vl_logic;
        \out\           : out    vl_logic
    );
end gen_cell_2_1_mux;
