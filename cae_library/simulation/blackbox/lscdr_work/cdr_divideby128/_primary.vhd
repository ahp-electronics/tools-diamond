library verilog;
use verilog.vl_types.all;
entity cdr_divideby128 is
    port(
        DIV128          : out    vl_logic;
        CLK_IN          : in     vl_logic;
        RST             : in     vl_logic
    );
end cdr_divideby128;
