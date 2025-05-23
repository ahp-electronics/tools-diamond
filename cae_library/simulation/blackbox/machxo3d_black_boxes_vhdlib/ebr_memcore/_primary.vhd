library verilog;
use verilog.vl_types.all;
entity ebr_memcore is
    port(
        pclka           : in     vl_logic;
        pclkb           : in     vl_logic;
        pcea            : in     vl_logic;
        pceb            : in     vl_logic;
        pcsa            : in     vl_logic;
        pcsb            : in     vl_logic;
        pw_ra           : in     vl_logic;
        pw_rb           : in     vl_logic;
        rdbk_mode       : in     vl_logic;
        async           : in     vl_logic;
        porbuf          : in     vl_logic;
        prsta           : in     vl_logic;
        prsta_del       : in     vl_logic;
        prsta_lookahead : in     vl_logic;
        prstb           : in     vl_logic;
        prstb_del       : in     vl_logic;
        prstb_lookahead : in     vl_logic;
        ir_rsta         : in     vl_logic;
        ir_rstb         : in     vl_logic;
        addra_buf       : in     vl_logic_vector(12 downto 0);
        addrb_buf       : in     vl_logic_vector(12 downto 0);
        dataa_buf       : in     vl_logic_vector(8 downto 0);
        datab_buf       : in     vl_logic_vector(8 downto 0);
        f_wta           : in     vl_logic;
        f_wtb           : in     vl_logic;
        f_rbwa          : in     vl_logic;
        f_rbwb          : in     vl_logic;
        f_mfg_mem       : in     vl_logic_vector(10 downto 0);
        doublewidea     : in     vl_logic;
        f_w_ctrl_a      : in     vl_logic_vector(2 downto 0);
        doublewideb     : in     vl_logic;
        f_w_ctrl_b      : in     vl_logic_vector(2 downto 0);
        f_ebr_enable    : in     vl_logic;
        f_n_edge        : in     vl_logic;
        f_mfg_spc       : in     vl_logic_vector(4 downto 0);
        f_spc           : in     vl_logic;
        f_mfg_clka      : in     vl_logic_vector(1 downto 0);
        f_mfg_clkb      : in     vl_logic_vector(1 downto 0);
        f_fifo_en       : in     vl_logic;
        trim_fifo_hplpn : in     vl_logic;
        f_wdw           : in     vl_logic_vector(3 downto 0);
        f_rdw           : in     vl_logic_vector(3 downto 0);
        f_1shot         : in     vl_logic;
        f_min_delay     : in     vl_logic;
        f_max_delay     : in     vl_logic;
        f_pf            : in     vl_logic_vector(13 downto 0);
        f_pfm1          : in     vl_logic_vector(13 downto 0);
        f_paf           : in     vl_logic_vector(13 downto 0);
        f_pafm1         : in     vl_logic_vector(13 downto 0);
        f_e             : in     vl_logic_vector(4 downto 0);
        f_ep1           : in     vl_logic_vector(5 downto 0);
        f_pae           : in     vl_logic_vector(13 downto 0);
        f_paep1         : in     vl_logic_vector(13 downto 0);
        douta           : out    vl_logic_vector(8 downto 0);
        doutb           : out    vl_logic_vector(8 downto 0);
        empty_flag      : out    vl_logic;
        aempty_flag     : out    vl_logic;
        full_flag       : out    vl_logic;
        afull_flag      : out    vl_logic
    );
end ebr_memcore;
