library verilog;
use verilog.vl_types.all;
entity gen_cell_sdff is
    generic(
        g_str           : integer := 2
    );
    port(
        clk             : in     vl_logic;
        \in\            : in     vl_logic;
        si              : in     vl_logic;
        se              : in     vl_logic;
        \out\           : out    vl_logic;
        out_n           : out    vl_logic
    );
end gen_cell_sdff;
