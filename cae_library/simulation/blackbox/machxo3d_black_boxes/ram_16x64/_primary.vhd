library verilog;
use verilog.vl_types.all;
entity ram_16x64 is
    port(
        clk             : in     vl_logic;
        wr              : in     vl_logic;
        wr_addr         : in     vl_logic_vector(3 downto 0);
        wr_data         : in     vl_logic_vector(63 downto 0);
        rd              : in     vl_logic;
        rd_addr         : in     vl_logic_vector(3 downto 0);
        rd_data         : out    vl_logic_vector(63 downto 0)
    );
end ram_16x64;
