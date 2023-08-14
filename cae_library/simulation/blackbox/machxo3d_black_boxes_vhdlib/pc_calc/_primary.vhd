library verilog;
use verilog.vl_types.all;
entity pc_calc is
    port(
        opcode_i        : in     vl_logic_vector(6 downto 0);
        jtype_i         : in     vl_logic_vector(31 downto 0);
        btype_i         : in     vl_logic_vector(31 downto 0);
        itype_i         : in     vl_logic_vector(31 downto 0);
        rs1_i           : in     vl_logic_vector(31 downto 0);
        f_pc_i          : in     vl_logic_vector(31 downto 0);
        x_pc_i          : in     vl_logic_vector(31 downto 0);
        x_br_i          : in     vl_logic;
        pc_calc_o       : out    vl_logic_vector(31 downto 0)
    );
end pc_calc;
