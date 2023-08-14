library verilog;
use verilog.vl_types.all;
entity ebr_hse_spram is
    port(
        por_n           : in     vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        ce              : in     vl_logic;
        we              : in     vl_logic;
        byte_enable     : in     vl_logic_vector(1 downto 0);
        addr            : in     vl_logic_vector(8 downto 0);
        din             : in     vl_logic_vector(15 downto 0);
        dout            : out    vl_logic_vector(15 downto 0)
    );
end ebr_hse_spram;
