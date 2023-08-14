library verilog;
use verilog.vl_types.all;
entity cdr_delchain is
    port(
        DELCLK          : out    vl_logic_vector(17 downto 0);
        DELCLKN         : out    vl_logic_vector(17 downto 0);
        INCLK           : in     vl_logic
    );
end cdr_delchain;
