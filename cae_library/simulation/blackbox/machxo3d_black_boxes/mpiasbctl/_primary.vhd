library verilog;
use verilog.vl_types.all;
entity mpiasbctl is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        alu_rdy         : in     vl_logic;
        mpiasb_rdy      : out    vl_logic;
        mpiasb_go       : in     vl_logic;
        mpiasb_ws       : in     vl_logic;
        mpiasb_op       : in     vl_logic_vector(1 downto 0);
        aptr            : in     vl_logic_vector(8 downto 0);
        bptr            : in     vl_logic_vector(8 downto 0);
        cptr            : in     vl_logic_vector(8 downto 0);
        alu_a_adr       : out    vl_logic_vector(8 downto 0);
        alu_b_adr       : out    vl_logic_vector(8 downto 0);
        alu_s_adr       : out    vl_logic_vector(8 downto 0);
        alu_s_wr        : out    vl_logic;
        do_add          : out    vl_logic;
        do_sub          : out    vl_logic;
        do_xor          : out    vl_logic;
        use_carry       : out    vl_logic
    );
end mpiasbctl;
