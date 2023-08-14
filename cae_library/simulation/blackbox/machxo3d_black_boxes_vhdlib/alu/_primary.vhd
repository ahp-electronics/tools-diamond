library verilog;
use verilog.vl_types.all;
entity alu is
    generic(
        has_mult        : integer := 0;
        unsigned_mult   : integer := 0
    );
    port(
        data_a_i        : in     vl_logic_vector(31 downto 0);
        data_b_i        : in     vl_logic_vector(31 downto 0);
        funct3_i        : in     vl_logic_vector(2 downto 0);
        funct7_i        : in     vl_logic_vector(6 downto 0);
        r_type_i        : in     vl_logic;
        i_type_i        : in     vl_logic;
        result_o        : out    vl_logic_vector(31 downto 0);
        underflow_o     : out    vl_logic;
        overflow_o      : out    vl_logic;
        br_eq_o         : out    vl_logic;
        br_lt_o         : out    vl_logic;
        br_ltu_o        : out    vl_logic
    );
end alu;
