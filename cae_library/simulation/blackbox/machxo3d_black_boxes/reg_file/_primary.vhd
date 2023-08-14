library verilog;
use verilog.vl_types.all;
entity reg_file is
    port(
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        raddr_a_i       : in     vl_logic_vector(4 downto 0);
        raddr_b_i       : in     vl_logic_vector(4 downto 0);
        waddr_i         : in     vl_logic_vector(4 downto 0);
        wdata_i         : in     vl_logic_vector(31 downto 0);
        wr_en_i         : in     vl_logic;
        rdata_a_o       : out    vl_logic_vector(31 downto 0);
        rdata_b_o       : out    vl_logic_vector(31 downto 0)
    );
end reg_file;
