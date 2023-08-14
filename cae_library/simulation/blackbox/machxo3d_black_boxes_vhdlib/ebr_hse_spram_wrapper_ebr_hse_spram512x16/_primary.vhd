library verilog;
use verilog.vl_types.all;
entity ebr_hse_spram_wrapper_ebr_hse_spram512x16 is
    port(
        por_n           : in     vl_logic;
        rst_n           : in     vl_logic;
        byte_enable     : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        ce              : in     vl_logic;
        we              : in     vl_logic;
        dout            : out    vl_logic_vector(15 downto 0);
        din             : in     vl_logic_vector(15 downto 0);
        addr            : in     vl_logic_vector(8 downto 0);
        mem_ctrl        : in     vl_logic_vector(1 downto 0);
        mrst_n          : in     vl_logic;
        ByPass          : in     vl_logic;
        clock_gate_te   : in     vl_logic;
        bist_ctrl       : in     vl_logic_vector(26 downto 0)
    );
end ebr_hse_spram_wrapper_ebr_hse_spram512x16;
