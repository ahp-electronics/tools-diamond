library verilog;
use verilog.vl_types.all;
entity qf_int_sub is
    port(
        reg_int         : out    vl_logic;
        status_int_out  : out    vl_logic_vector(7 downto 0);
        int_enable      : in     vl_logic_vector(7 downto 0);
        int_in          : in     vl_logic_vector(7 downto 0);
        force_int       : in     vl_logic;
        cor             : in     vl_logic
    );
end qf_int_sub;
