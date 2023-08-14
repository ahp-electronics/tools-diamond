library verilog;
use verilog.vl_types.all;
entity mpimulctl is
    generic(
        t               : integer := 1;
        f               : integer := 0;
        x               : integer := 0;
        nusd            : integer := 0
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        alu_rdy         : in     vl_logic;
        mpimul_rdy      : out    vl_logic;
        mpimul_go       : in     vl_logic;
        aptr            : in     vl_logic_vector(8 downto 0);
        bptr            : in     vl_logic_vector(8 downto 0);
        cptr            : in     vl_logic_vector(8 downto 0);
        mul_b_adr       : out    vl_logic_vector(8 downto 0);
        alu_a_adr       : out    vl_logic_vector(8 downto 0);
        mul_s_adr       : out    vl_logic_vector(8 downto 0);
        mul_s_wr        : out    vl_logic;
        alu_s_adr       : out    vl_logic_vector(8 downto 0);
        alu_s_wr        : out    vl_logic;
        do_add          : out    vl_logic;
        do_mul          : out    vl_logic;
        use_carry       : out    vl_logic;
        alu_a_is0       : out    vl_logic;
        alu_b_sel_u     : out    vl_logic
    );
end mpimulctl;
