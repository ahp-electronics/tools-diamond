library verilog;
use verilog.vl_types.all;
entity qf_cor_reset is
    port(
        read_out        : out    vl_logic;
        read_in         : in     vl_logic;
        resetn          : in     vl_logic
    );
end qf_cor_reset;
