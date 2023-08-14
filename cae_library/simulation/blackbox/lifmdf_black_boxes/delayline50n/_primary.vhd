library verilog;
use verilog.vl_types.all;
entity delayline50n is
    port(
        \out\           : out    vl_logic;
        \in\            : in     vl_logic;
        spwr            : in     vl_logic;
        sgnd            : in     vl_logic
    );
end delayline50n;
