library verilog;
use verilog.vl_types.all;
entity pfifo_ctl is
    port(
        resetb          : in     vl_logic;
        wr_clk          : in     vl_logic;
        rd_clk          : in     vl_logic;
        pfifo_clr_sel   : in     vl_logic;
        pfifo_clr       : in     vl_logic;
        fifo_err        : out    vl_logic;
        wr_addr         : out    vl_logic_vector(2 downto 0);
        rd_addr         : out    vl_logic_vector(2 downto 0)
    );
end pfifo_ctl;
