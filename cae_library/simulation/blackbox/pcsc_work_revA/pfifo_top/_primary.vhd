library verilog;
use verilog.vl_types.all;
entity pfifo_top is
    port(
        pfifo_clr       : in     vl_logic;
        pfifo_clr_sel   : in     vl_logic;
        rd_clk          : in     vl_logic;
        resetb          : in     vl_logic;
        wr_clk          : in     vl_logic;
        wr_data         : in     vl_logic_vector(9 downto 0);
        fifo_err        : out    vl_logic;
        rd_data         : out    vl_logic_vector(9 downto 0)
    );
end pfifo_top;
