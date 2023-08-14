library verilog;
use verilog.vl_types.all;
entity rf32x128_3p is
    generic(
        mem_depth       : integer := 127
    );
    port(
        clk             : in     vl_logic;
        dina            : in     vl_logic_vector(31 downto 0);
        addra           : in     vl_logic_vector(6 downto 0);
        wea             : in     vl_logic;
        wea_fwd         : in     vl_logic;
        addrb0          : in     vl_logic_vector(6 downto 0);
        doutb0          : out    vl_logic_vector(31 downto 0);
        addrb1          : in     vl_logic_vector(6 downto 0);
        addrb1_fwd      : in     vl_logic_vector(6 downto 0);
        doutb1          : out    vl_logic_vector(31 downto 0);
        addrb2          : in     vl_logic_vector(6 downto 0);
        doutb2          : out    vl_logic_vector(31 downto 0)
    );
end rf32x128_3p;
