library verilog;
use verilog.vl_types.all;
entity snow_tiehi_wrap is
    port(
        tiehi           : out    vl_logic;
        sgnd            : in     vl_logic;
        spwr            : in     vl_logic
    );
end snow_tiehi_wrap;
