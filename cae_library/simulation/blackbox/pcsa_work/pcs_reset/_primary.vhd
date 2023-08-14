library verilog;
use verilog.vl_types.all;
entity pcs_reset is
    port(
        clk             : in     vl_logic;
        mode            : in     vl_logic;
        srst_i          : in     vl_logic;
        arst_i          : in     vl_logic;
        rst_o           : out    vl_logic
    );
end pcs_reset;
