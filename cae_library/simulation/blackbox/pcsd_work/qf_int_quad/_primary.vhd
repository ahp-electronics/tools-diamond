library verilog;
use verilog.vl_types.all;
entity qf_int_quad is
    port(
        force_int       : in     vl_logic;
        pcs_int_cor     : in     vl_logic;
        pcs_int_ctl_enable: in     vl_logic_vector(7 downto 0);
        pcs_int_sts_reg : in     vl_logic_vector(7 downto 0);
        resetn          : in     vl_logic;
        ser_int_cor     : in     vl_logic;
        ser_int_ctl_enable: in     vl_logic_vector(7 downto 0);
        ser_int_sts_reg : in     vl_logic_vector(7 downto 0);
        pcs_cor_int_sts_reg: out    vl_logic_vector(7 downto 0);
        pcs_reg_int     : out    vl_logic;
        ser_cor_int_sts_reg: out    vl_logic_vector(7 downto 0);
        ser_reg_int     : out    vl_logic
    );
end qf_int_quad;
