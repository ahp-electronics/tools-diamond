library verilog;
use verilog.vl_types.all;
entity rf32x128_1p is
    generic(
        mem_depth       : integer := 127
    );
    port(
        clk             : in     vl_logic;
        dina            : in     vl_logic_vector(31 downto 0);
        addra           : in     vl_logic_vector(6 downto 0);
        wea             : in     vl_logic;
        addrb           : in     vl_logic_vector(6 downto 0);
        doutb           : out    vl_logic_vector(31 downto 0)
    );
end rf32x128_1p;
