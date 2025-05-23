library verilog;
use verilog.vl_types.all;
entity flash_exec is
    generic(
        CFG_ROWS_640    : integer := 144;
        CFG_ROWS_4k     : integer := 360;
        CFG_ROWS_10k    : integer := 392;
        UFM_ROWS_640    : integer := 24;
        UFM_ROWS_4k     : integer := 48;
        UFM_ROWS_10k    : integer := 112;
        erst_idle       : integer := 0;
        erst_preprg     : integer := 1;
        erst_eraver     : integer := 2;
        erst_erase      : integer := 3;
        erst_scp        : integer := 4;
        erst_softprg    : integer := 5;
        erst_post_erase : integer := 6;
        erst_chkdone    : integer := 7;
        erst_finish_erase: integer := 8;
        erst_error      : integer := 9;
        rowst_idle      : integer := 0;
        rowst_init      : integer := 1;
        rowst_wait_colsm: integer := 2;
        rowst_incrow    : integer := 3;
        rowst_finish    : integer := 4;
        rowst_error     : integer := 5;
        prgst_idle      : integer := 0;
        prgst_wait_colsm1: integer := 1;
        prgst_incrow1   : integer := 2;
        prgst_wait_colsm2: integer := 3;
        prgst_incrow2   : integer := 4;
        prgst_finish    : integer := 5;
        prgst_error     : integer := 6;
        colst_idle      : integer := 0;
        colst_init      : integer := 1;
        colst_verify    : integer := 2;
        colst_erase     : integer := 3;
        colst_program   : integer := 4;
        colst_next_col  : integer := 5;
        colst_finish    : integer := 6;
        colst_error     : integer := 7;
        readst_idle     : integer := 0;
        readst_read1    : integer := 1;
        readst_read2    : integer := 2;
        readst_finish   : integer := 3
    );
    port(
        busy_flash      : out    vl_logic;
        fail_flash      : out    vl_logic;
        row             : out    vl_logic_vector(14 downto 0);
        sect_cfg_sel    : out    vl_logic;
        sect_ufm_sel    : out    vl_logic;
        sect_trim_sel   : out    vl_logic;
        sect_feat_sel   : out    vl_logic;
        sec_row_active  : out    vl_logic;
        trim_row4_active: out    vl_logic;
        ufm_row_sel_all : out    vl_logic;
        ufm_row_sel_none: out    vl_logic;
        cfg_row_sel_all : out    vl_logic;
        cfg_row_sel_none: out    vl_logic;
        trim_row_sel_all: out    vl_logic;
        trim_row_sel_none: out    vl_logic;
        feat_row_sel_all: out    vl_logic;
        feat_row_sel_none: out    vl_logic;
        subrow_mvena_ufm: out    vl_logic;
        subrow_mvenall_ufm: out    vl_logic;
        subrow_hvena_ufm: out    vl_logic;
        subrow_hvenall_ufm: out    vl_logic;
        subrow_mvena_cfg: out    vl_logic;
        subrow_mvenall_cfg: out    vl_logic;
        subrow_hvena_cfg: out    vl_logic;
        subrow_hvenall_cfg: out    vl_logic;
        subrow_mvena_tf : out    vl_logic;
        subrow_hvena_tf : out    vl_logic;
        sa_enall        : out    vl_logic;
        sa_ena          : out    vl_logic;
        wor_eval        : out    vl_logic;
        wand_eval       : out    vl_logic;
        era_all         : out    vl_logic;
        era_ufm         : out    vl_logic;
        era_cfg         : out    vl_logic;
        era_trim        : out    vl_logic;
        era_feat        : out    vl_logic;
        prg_ufm         : out    vl_logic;
        prg_cfg         : out    vl_logic;
        prg_tf          : out    vl_logic;
        read_ufm        : out    vl_logic;
        read_cfg        : out    vl_logic;
        read_tf         : out    vl_logic;
        era_ver         : out    vl_logic;
        scp             : out    vl_logic;
        scpv            : out    vl_logic;
        softprg         : out    vl_logic;
        verify          : out    vl_logic;
        flash_en        : out    vl_logic;
        reg_enable      : out    vl_logic;
        sel_6p5v        : out    vl_logic;
        fl_ready_rst    : out    vl_logic;
        fl_exec_buf     : out    vl_logic_vector(127 downto 0);
        exec_buf_ready  : out    vl_logic;
        fl_erase_cfg    : out    vl_logic;
        fl_erase_ufm    : out    vl_logic;
        fl_erase_trim   : out    vl_logic;
        fl_erase_fea    : out    vl_logic;
        exec_load_udss  : out    vl_logic;
        exec_load_ufs   : out    vl_logic;
        exec_load_trim  : out    vl_logic_vector(5 downto 0);
        exec_load_feat  : out    vl_logic_vector(5 downto 0);
        er_state        : out    vl_logic_vector(3 downto 0);
        col_state       : out    vl_logic_vector(2 downto 0);
        row_state       : out    vl_logic_vector(2 downto 0);
        prg_state       : out    vl_logic_vector(2 downto 0);
        read_state      : out    vl_logic_vector(2 downto 0);
        mfg_tests       : out    vl_logic_vector(2 downto 0);
        flash_clk_mfg   : out    vl_logic;
        mux32_out1      : out    vl_logic;
        mux32_out2      : out    vl_logic;
        erase_phase     : out    vl_logic;
        preprg          : out    vl_logic;
        colsm_idle      : out    vl_logic;
        colsm_init      : out    vl_logic;
        colsm_vfy       : out    vl_logic;
        colsm_nxcol     : out    vl_logic;
        colsm_nxcol_nxst: out    vl_logic;
        colsm_prg       : out    vl_logic;
        prg_all         : out    vl_logic;
        c_dsr           : out    vl_logic_vector(3 downto 0);
        sa64            : out    vl_logic;
        sa128           : out    vl_logic;
        sa256           : out    vl_logic;
        left128col      : out    vl_logic;
        readsm_read1    : out    vl_logic;
        readsm_read2    : out    vl_logic;
        read_cmd_r      : out    vl_logic;
        mfgvfy_cmds     : out    vl_logic;
        eof_cfg         : out    vl_logic;
        eof_ufm         : out    vl_logic;
        ppt_row_nowait  : out    vl_logic;
        read64_r        : out    vl_logic;
        prg_64_cmd_r    : out    vl_logic;
        prg_128_cmd_r   : out    vl_logic;
        rowsm_init      : out    vl_logic;
        isc_rst_scp     : out    vl_logic;
        width64bit      : out    vl_logic;
        mfg_drdis       : out    vl_logic;
        mfg_negon       : out    vl_logic;
        fl_ready_syn    : out    vl_logic;
        isc_rst_async   : in     vl_logic;
        isc_rst_sync    : in     vl_logic;
        smclk           : in     vl_logic;
        isc_exec_a      : in     vl_logic;
        isc_exec_b      : in     vl_logic;
        isc_exec_c      : in     vl_logic;
        isc_exec_d      : in     vl_logic;
        isc_exec_e      : in     vl_logic;
        buf128_dat      : in     vl_logic_vector(127 downto 0);
        sector_dat      : in     vl_logic_vector(7 downto 0);
        exec_buf_reset  : in     vl_logic;
        fl_init_addr_cfg_exec: in     vl_logic;
        fl_init_addr_trim_exec: in     vl_logic;
        fl_init_addr_fea_exec: in     vl_logic;
        fl_init_addr_ufm_exec: in     vl_logic;
        fl_write_addr_exec: in     vl_logic;
        fl_erase_qual   : in     vl_logic;
        fl_erase_all_qual: in     vl_logic;
        fl_erase_tag_qual: in     vl_logic;
        fl_erase_exec   : in     vl_logic;
        fl_prog_incr_nv_exec: in     vl_logic;
        fl_prog_tag_exec: in     vl_logic;
        fl_prog_udss_pulse: in     vl_logic;
        fl_prog_udss_exec: in     vl_logic;
        fl_prog_ufs_exec: in     vl_logic;
        fl_prog_trim_exec: in     vl_logic_vector(5 downto 0);
        fl_prog_feat_exec: in     vl_logic_vector(5 downto 0);
        fl_prog_64_exec : in     vl_logic;
        fl_read_incr_nv_exec: in     vl_logic;
        fl_read_tag_exec: in     vl_logic;
        fl_read_trim3_exec: in     vl_logic;
        fl_mtest_exec   : in     vl_logic;
        cdm_read_udss_exec: in     vl_logic;
        cdm_read_ufs_exec: in     vl_logic;
        cdm_read_trim_exec: in     vl_logic_vector(5 downto 0);
        cdm_read_feat_exec: in     vl_logic_vector(5 downto 0);
        cdm_read_64_exec: in     vl_logic;
        erase_seq       : in     vl_logic;
        erasing0        : in     vl_logic;
        erasing1        : in     vl_logic;
        dnld_row_addr   : in     vl_logic_vector(14 downto 0);
        fl_smclk_mfg    : in     vl_logic;
        access_flash_all: in     vl_logic;
        trim_row_ev     : in     vl_logic;
        trim_sel6p5v    : in     vl_logic;
        sdm_set_addr    : in     vl_logic;
        sdm_read128_incr_exec: in     vl_logic;
        ppt_read128_exec: in     vl_logic;
        ppt_read_rom_exec: in     vl_logic;
        ppt_load_trim   : in     vl_logic;
        dnld_load_trim  : in     vl_logic;
        ppt_rowsel      : in     vl_logic;
        l_row_cfg       : in     vl_logic;
        l_row_ufm       : in     vl_logic;
        device          : in     vl_logic_vector(2 downto 0);
        fl_dout         : in     vl_logic_vector(63 downto 0);
        fl_ready        : in     vl_logic;
        fin_prg_pwtc    : in     vl_logic;
        fin_ers_phase   : in     vl_logic;
        fin_col_init    : in     vl_logic;
        max_prg_cnt     : in     vl_logic;
        max_ers_cnt     : in     vl_logic;
        verify_fail     : in     vl_logic;
        fin_verify      : in     vl_logic;
        lastcol_all     : in     vl_logic;
        read_finish     : in     vl_logic;
        read_incrow     : in     vl_logic;
        exec_cap_rt     : in     vl_logic;
        exec_cap_lt     : in     vl_logic;
        erase_setup     : in     vl_logic;
        vwlp_gnd        : in     vl_logic;
        mvenall_edis    : in     vl_logic;
        mfg_4xprg       : in     vl_logic;
        mfg_skip_era    : in     vl_logic;
        mfg_skip_ev     : in     vl_logic;
        mfg_dis_sel6p5v : in     vl_logic;
        mfg_fl_enable   : in     vl_logic;
        mfg_margin_en   : in     vl_logic;
        mfg_mux1_sel    : in     vl_logic_vector(4 downto 0);
        mfg_mux2_sel    : in     vl_logic_vector(4 downto 0)
    );
end flash_exec;
