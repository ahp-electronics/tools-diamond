library verilog;
use verilog.vl_types.all;
entity hera_top is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        otm             : in     vl_logic;
        dpa_en          : in     vl_logic;
        ck_en           : in     vl_logic;
        wr_risc         : in     vl_logic;
        rd_risc         : in     vl_logic;
        offs_risc       : in     vl_logic_vector(9 downto 0);
        wdata_risc      : in     vl_logic_vector(31 downto 0);
        rdata_risc      : out    vl_logic_vector(31 downto 0);
        stall_o         : out    vl_logic
    );
end hera_top;
