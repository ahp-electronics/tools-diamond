library verilog;
use verilog.vl_types.all;
entity gen_cell_dly is
    generic(
        g_str           : integer := 4
    );
    port(
        \in\            : in     vl_logic;
        \out\           : out    vl_logic
    );
end gen_cell_dly;
