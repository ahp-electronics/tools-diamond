library verilog;
use verilog.vl_types.all;
entity cor_reset is
    port(
        read_out        : out    vl_logic;
        read_in         : in     vl_logic;
        resetn          : in     vl_logic
    );
end cor_reset;
