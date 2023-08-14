library verilog;
use verilog.vl_types.all;
entity delaylineDFFS is
    port(
        CLK             : in     vl_logic;
        D               : in     vl_logic;
        SET             : in     vl_logic;
        Q               : out    vl_logic
    );
end delaylineDFFS;
