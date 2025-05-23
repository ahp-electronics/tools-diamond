library verilog;
use verilog.vl_types.all;
entity flash_ctrl is
    generic(
        scp_100us       : integer := 13300;
        prg_1us         : integer := 133;
        era_1ms         : integer := 133000;
        disch_xdec_wait_time: integer := 133;
        WELL_SLOWDIS_TIME: integer := 666;
        disch_src_wait_time: integer := 27;
        vpos_wait_2us   : integer := 266;
        fast_nonsa64_rd_t00: integer := 7;
        fast_nonsa64_rd_t01: integer := 11;
        fast_nonsa64_rd_t10: integer := 15;
        fast_nonsa64_rd_t11: integer := 4;
        fast_sa64_rd_t00: integer := 12;
        fast_sa64_rd_t01: integer := 16;
        fast_sa64_rd_t10: integer := 20;
        fast_sa64_rd_t11: integer := 9;
        read_time00     : integer := 15;
        read_time01     : integer := 19;
        read_time10     : integer := 23;
        read_time11     : integer := 12;
        verify_time00   : integer := 15;
        verify_time01   : integer := 19;
        verify_time10   : integer := 23;
        verify_time11   : integer := 12;
        delay_dissrc_prg_cnt: integer := 14;
        delay_dissrc_sp_cnt: integer := 14;
        post_prg_pwtc_cnt: integer := 4;
        delay_softprg_cnt: integer := 14;
        subrowhv_sw_cnt : integer := 30;
        drdis_pw        : integer := 104255;
        erpst_idle      : integer := 0;
        erpst_disxdec_start: integer := 1;
        erpst_wait_disxdec_done: integer := 2;
        erpst_wait_wlgnd: integer := 3;
        erpst_wait_negon: integer := 4;
        erpst_1ms_start : integer := 5;
        erpst_wait_1ms_done: integer := 6;
        erpst_start_welloff: integer := 7;
        erpst_well_slowdis: integer := 8;
        erpst_wait_negoff: integer := 9;
        erpst_wait_readyvfy: integer := 10;
        erpst_srcdis_start: integer := 11;
        erpst_wait_srcdis_done: integer := 12;
        erpst_finish    : integer := 13;
        prgpst_idle     : integer := 0;
        prgpst_dissrc_start: integer := 1;
        prgpst_wait_dissrc_done: integer := 2;
        prgpst_prgpwtc_start: integer := 3;
        prgpst_prgdrv_start: integer := 4;
        prgpst_wait_prgpwtc_done: integer := 5;
        prgpst_del_diswl_start: integer := 6;
        prgpst_wait_del_diswl_done: integer := 7;
        prgpst_wait_wlgnd: integer := 8;
        prgpst_del_softprg_start: integer := 9;
        prgpst_del_softprg_done: integer := 10;
        prgpst_wait_readyvfy: integer := 11;
        prgpst_finish   : integer := 12
    );
    port(
        max_prg_cnt     : out    vl_logic;
        max_ers_cnt     : out    vl_logic;
        fin_col_init    : out    vl_logic;
        fin_verify      : out    vl_logic;
        verify_fail     : out    vl_logic;
        fin_prg_pwtc    : out    vl_logic;
        fin_ers_phase   : out    vl_logic;
        lastcol_all     : out    vl_logic;
        read_finish     : out    vl_logic;
        read_incrow     : out    vl_logic;
        exec_cap_rt     : out    vl_logic;
        exec_cap_lt     : out    vl_logic;
        vwlp_gnd        : out    vl_logic;
        mvenall_edis    : out    vl_logic;
        erase_cnt       : out    vl_logic_vector(11 downto 0);
        prg_cnt         : out    vl_logic_vector(9 downto 0);
        pwtc_well       : out    vl_logic;
        erase_setup     : out    vl_logic;
        erase_pulse     : out    vl_logic;
        erapdis         : out    vl_logic;
        prg_pwtc        : out    vl_logic;
        prog_disch      : out    vl_logic;
        en_vreg_mon     : out    vl_logic;
        prgdrv_ena      : out    vl_logic;
        col_shift       : out    vl_logic;
        colstart        : out    vl_logic_vector(3 downto 0);
        col_rst         : out    vl_logic;
        readpart        : out    vl_logic_vector(3 downto 0);
        capture_dout    : out    vl_logic;
        src_clamp       : out    vl_logic;
        drain_ctrl      : out    vl_logic;
        prestep_in_neg  : out    vl_logic_vector(2 downto 0);
        step_in_neg     : out    vl_logic_vector(2 downto 0);
        prg_pulse       : out    vl_logic_vector(3 downto 0);
        prgdrv_enall    : out    vl_logic;
        smclk           : in     vl_logic;
        isc_rst_async   : in     vl_logic;
        isc_rst_sync    : in     vl_logic;
        read64_r        : in     vl_logic;
        prg_all         : in     vl_logic;
        era_ver         : in     vl_logic;
        scp             : in     vl_logic;
        softprg         : in     vl_logic;
        erase_phase     : in     vl_logic;
        colsm_idle      : in     vl_logic;
        colsm_init      : in     vl_logic;
        colsm_nxcol     : in     vl_logic;
        colsm_nxcol_nxst: in     vl_logic;
        colsm_prg       : in     vl_logic;
        preprg          : in     vl_logic;
        colsm_vfy       : in     vl_logic;
        c_dsr           : in     vl_logic_vector(3 downto 0);
        sa64            : in     vl_logic;
        sa128           : in     vl_logic;
        sa256           : in     vl_logic;
        left128col      : in     vl_logic;
        readsm_read1    : in     vl_logic;
        readsm_read2    : in     vl_logic;
        read_cmd_r      : in     vl_logic;
        sel_6p5v        : in     vl_logic;
        vwlp_active     : in     vl_logic;
        neg_edge_det    : in     vl_logic;
        well_active     : in     vl_logic;
        ready_vfy       : in     vl_logic;
        c_bl            : in     vl_logic_vector(3 downto 0);
        lastcol         : in     vl_logic_vector(3 downto 0);
        trim_verify     : in     vl_logic_vector(1 downto 0);
        trim_ers_pw     : in     vl_logic_vector(2 downto 0);
        trim_prg_pw     : in     vl_logic_vector(2 downto 0);
        trim_scp_pw     : in     vl_logic_vector(2 downto 0);
        trim_neg_init   : in     vl_logic_vector(5 downto 0);
        mfg_ers_cnt     : in     vl_logic_vector(3 downto 0);
        mfg_ers_perstep : in     vl_logic_vector(1 downto 0);
        mfg_ers_steps   : in     vl_logic_vector(1 downto 0);
        mfg_step_size   : in     vl_logic;
        mfg_prg_cnt     : in     vl_logic_vector(2 downto 0);
        mfg_sp_cnt      : in     vl_logic_vector(2 downto 0);
        mfg_scp_cnt     : in     vl_logic_vector(2 downto 0);
        mfg_vreg_mon    : in     vl_logic;
        mfg_skip_prgvfy : in     vl_logic;
        mfg_skip_ev     : in     vl_logic;
        mfg_skip_era    : in     vl_logic;
        mfg_skip_scp    : in     vl_logic;
        mfg_skip_softprg: in     vl_logic;
        mfg_4xprg       : in     vl_logic;
        mfg_nofail      : in     vl_logic;
        mfgvfy_cmds     : in     vl_logic;
        prg_64_cmd_r    : in     vl_logic;
        prg_128_cmd_r   : in     vl_logic;
        rowsm_init      : in     vl_logic;
        isc_rst_scp     : in     vl_logic;
        width64bit      : in     vl_logic;
        wor_eval        : in     vl_logic;
        wand_eval       : in     vl_logic;
        mfg_drdis       : in     vl_logic;
        mfg_negon       : in     vl_logic;
        flash_en        : in     vl_logic
    );
end flash_ctrl;
