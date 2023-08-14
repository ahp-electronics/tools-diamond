library verilog;
use verilog.vl_types.all;
entity mpimskctl is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        alu_rdy         : in     vl_logic;
        mpimsk_rdy      : out    vl_logic;
        mpimsk_go       : in     vl_logic;
        mpimsk_op       : in     vl_logic_vector(1 downto 0);
        set             : in     vl_logic_vector(9 downto 0);
        idx             : in     vl_logic_vector(4 downto 0);
        aptr            : in     vl_logic_vector(8 downto 0);
        alu_a_adr       : out    vl_logic_vector(8 downto 0);
        alu_s_adr       : out    vl_logic_vector(8 downto 0);
        alu_s_wr        : out    vl_logic;
        do_msk          : out    vl_logic;
        msk_op          : out    vl_logic_vector(1 downto 0);
        msk_set         : out    vl_logic_vector(9 downto 0);
        msk_idx         : out    vl_logic_vector(4 downto 0)
    );
end mpimskctl;
