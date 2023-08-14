library verilog;
use verilog.vl_types.all;
entity ringOsc is
    port(
        Z               : out    vl_logic;
        enable          : in     vl_logic
    );
end ringOsc;
