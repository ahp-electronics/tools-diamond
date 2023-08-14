library verilog;
use verilog.vl_types.all;
entity pp_pcie_scram is
    generic(
        COM             : integer := 188;
        SKP             : integer := 28;
        PAD             : integer := 247
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        d_in            : in     vl_logic_vector(10 downto 0);
        scram_disable   : in     vl_logic;
        scram_select    : in     vl_logic;
        d_out           : out    vl_logic_vector(10 downto 0)
    );
end pp_pcie_scram;
