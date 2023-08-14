library verilog;
use verilog.vl_types.all;
entity int_sub_qif is
    port(
        reg_int         : out    vl_logic;
        status_int_out  : out    vl_logic_vector(7 downto 0);
        int_enable      : in     vl_logic_vector(7 downto 0);
        int             : in     vl_logic_vector(7 downto 0);
        force_int       : in     vl_logic;
        cor             : in     vl_logic
    );
end int_sub_qif;
