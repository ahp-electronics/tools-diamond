library verilog;
use verilog.vl_types.all;
entity qf_cor_int_reg is
    port(
        cor             : in     vl_logic;
        force_int       : in     vl_logic;
        int_ctl_enable  : in     vl_logic_vector(7 downto 0);
        int_sts_reg     : in     vl_logic_vector(7 downto 0);
        resetn          : in     vl_logic;
        cor_int_sts_reg : out    vl_logic_vector(7 downto 0);
        reg_int         : out    vl_logic
    );
end qf_cor_int_reg;
