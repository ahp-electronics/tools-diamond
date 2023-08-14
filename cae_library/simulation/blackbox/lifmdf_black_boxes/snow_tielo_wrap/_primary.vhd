library verilog;
use verilog.vl_types.all;
entity snow_tielo_wrap is
    port(
        tielo           : out    vl_logic;
        sgnd            : in     vl_logic;
        spwr            : in     vl_logic
    );
end snow_tielo_wrap;
