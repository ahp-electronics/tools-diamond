library verilog;
use verilog.vl_types.all;
entity ST_MPG_ebr_hse_spram512x16 is
    port(
        S8              : out    vl_logic_vector(15 downto 0);
        S9              : out    vl_logic_vector(15 downto 0);
        S10             : in     vl_logic;
        S11             : in     vl_logic;
        S12             : in     vl_logic
    );
end ST_MPG_ebr_hse_spram512x16;
