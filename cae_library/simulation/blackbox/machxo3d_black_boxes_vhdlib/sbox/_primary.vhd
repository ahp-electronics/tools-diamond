library verilog;
use verilog.vl_types.all;
entity sbox is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        din             : in     vl_logic_vector(7 downto 0);
        ende            : in     vl_logic;
        en_dout         : out    vl_logic_vector(7 downto 0);
        de_dout         : out    vl_logic_vector(7 downto 0)
    );
end sbox;
