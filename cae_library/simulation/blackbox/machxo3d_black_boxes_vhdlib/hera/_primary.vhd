library verilog;
use verilog.vl_types.all;
entity hera is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ck_en           : in     vl_logic;
        hera_addr       : in     vl_logic_vector(8 downto 0);
        hera_data       : out    vl_logic_vector(31 downto 0);
        alu_co          : out    vl_logic;
        alu_ok          : in     vl_logic;
        alu_rdy         : in     vl_logic;
        alu_go          : out    vl_logic;
        glb_w_wr_ext    : in     vl_logic;
        glb_w_adr_ext   : in     vl_logic_vector(8 downto 0);
        glb_w_data_ext  : in     vl_logic_vector(31 downto 0);
        pfrdc_go_ext    : in     vl_logic;
        pfrdc_op_ext    : in     vl_logic_vector(1 downto 0);
        pfasb_go_ext    : in     vl_logic;
        pfasb_op_ext    : in     vl_logic;
        pf_aptr_ext     : in     vl_logic_vector(8 downto 0);
        pf_bptr_ext     : in     vl_logic_vector(8 downto 0);
        pf_cptr_ext     : in     vl_logic_vector(8 downto 0);
        pf_dptr_ext     : in     vl_logic_vector(8 downto 0);
        pf_eptr_ext     : in     vl_logic_vector(8 downto 0);
        pfasb_rdy       : out    vl_logic;
        pfrdc_rdy       : out    vl_logic;
        mpimul_rdy      : out    vl_logic;
        mpiasb_rdy      : out    vl_logic;
        mpisft_rdy      : out    vl_logic
    );
end hera;
