library verilog;
use verilog.vl_types.all;
entity ebr_dff_res is
    port(
        d               : in     vl_logic;
        clk             : in     vl_logic;
        res             : in     vl_logic;
        q               : out    vl_logic
    );
end ebr_dff_res;
