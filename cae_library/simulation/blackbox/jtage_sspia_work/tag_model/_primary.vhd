library verilog;
use verilog.vl_types.all;
entity tag_model is
    port(
        clk             : in     vl_logic;
        csspi           : in     vl_logic;
        sispi           : in     vl_logic;
        sospi           : out    vl_logic
    );
end tag_model;
