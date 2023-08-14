library verilog;
use verilog.vl_types.all;
entity mult16 is
    generic(
        AB_SIGNED       : integer := 0
    );
    port(
        data_a_i        : in     vl_logic_vector(15 downto 0);
        data_b_i        : in     vl_logic_vector(15 downto 0);
        q               : out    vl_logic_vector(31 downto 0)
    );
end mult16;
