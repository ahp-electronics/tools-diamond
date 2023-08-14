library verilog;
use verilog.vl_types.all;
entity gen_cell_nand_2 is
    generic(
        g_str           : integer := 4
    );
    port(
        in0             : in     vl_logic;
        in1             : in     vl_logic;
        \out\           : out    vl_logic
    );
end gen_cell_nand_2;
