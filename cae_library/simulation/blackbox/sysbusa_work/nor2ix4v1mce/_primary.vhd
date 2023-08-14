library verilog;
use verilog.vl_types.all;
entity nor2ix4v1mce is
    port(
        AN              : in     vl_logic;
        B               : in     vl_logic;
        Z               : out    vl_logic
    );
end nor2ix4v1mce;
