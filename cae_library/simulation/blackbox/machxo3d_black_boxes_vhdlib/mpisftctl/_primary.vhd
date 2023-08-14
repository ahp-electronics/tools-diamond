library verilog;
use verilog.vl_types.all;
entity mpisftctl is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        alu_rdy         : in     vl_logic;
        mpisft_rdy      : out    vl_logic;
        mpisft_go       : in     vl_logic;
        mpisft_ws       : in     vl_logic_vector(2 downto 0);
        mpisft_op       : in     vl_logic_vector(3 downto 0);
        aptr            : in     vl_logic_vector(8 downto 0);
        cptr            : in     vl_logic_vector(8 downto 0);
        alu_a_adr       : out    vl_logic_vector(8 downto 0);
        alu_b_adr       : out    vl_logic_vector(8 downto 0);
        alu_s_adr       : out    vl_logic_vector(8 downto 0);
        alu_s_wr        : out    vl_logic;
        alu_a_rnd       : out    vl_logic;
        alu_a_36        : out    vl_logic;
        alu_a_5c        : out    vl_logic;
        alu_a_is0       : out    vl_logic;
        alu_a_is1       : out    vl_logic;
        sign_ext        : out    vl_logic;
        clear_eq        : out    vl_logic;
        do_set          : out    vl_logic;
        do_chk          : out    vl_logic;
        do_mov          : out    vl_logic;
        do_xor          : out    vl_logic;
        do_sft1         : out    vl_logic;
        do_sft8         : out    vl_logic;
        do_sft24        : out    vl_logic;
        chk_op          : out    vl_logic
    );
end mpisftctl;
