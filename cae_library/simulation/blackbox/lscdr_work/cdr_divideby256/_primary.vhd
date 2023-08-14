library verilog;
use verilog.vl_types.all;
entity cdr_divideby256 is
    port(
        DIV256          : out    vl_logic;
        CLK_IN          : in     vl_logic;
        RST             : in     vl_logic
    );
end cdr_divideby256;
