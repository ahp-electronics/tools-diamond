library verilog;
use verilog.vl_types.all;
entity algn_e2p is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        edge_in         : in     vl_logic;
        pulse_out       : out    vl_logic
    );
end algn_e2p;
