library verilog;
use verilog.vl_types.all;
entity efb_top is
    generic(
        TC_SIZE         : integer := 16;
        dwidth          : integer := 8;
        awidth          : integer := 8
    );
    port(
        int_csspi0n     : out    vl_logic;
        int_mclk        : out    vl_logic;
        int_sispi       : out    vl_logic;
        bsrclk          : out    vl_logic;
        bsrtdi          : out    vl_logic;
        bsmode          : out    vl_logic;
        intest          : out    vl_logic;
        shbsrn          : out    vl_logic;
        treset          : out    vl_logic;
        ts_all          : out    vl_logic;
        updtbsr         : out    vl_logic;
        pll0_usrclk     : out    vl_logic;
        pll0_done       : out    vl_logic;
        pll0_clk_o      : out    vl_logic;
        pll0_rst_o      : out    vl_logic;
        pll0_stb_o      : out    vl_logic;
        pll0_we_o       : out    vl_logic;
        pll0_adr_o      : out    vl_logic_vector(4 downto 0);
        pll0_dat_o      : out    vl_logic_vector(7 downto 0);
        pll1_usrclk     : out    vl_logic;
        pll1_done       : out    vl_logic;
        pll1_clk_o      : out    vl_logic;
        pll1_rst_o      : out    vl_logic;
        pll1_stb_o      : out    vl_logic;
        pll1_we_o       : out    vl_logic;
        pll1_adr_o      : out    vl_logic_vector(4 downto 0);
        pll1_dat_o      : out    vl_logic_vector(7 downto 0);
        bg_trim         : out    vl_logic_vector(15 downto 0);
        bgoff           : out    vl_logic;
        dtr_clk         : out    vl_logic;
        dtr_instr       : out    vl_logic;
        dtr_start       : out    vl_logic;
        osc_dis         : out    vl_logic;
        osc_ena         : out    vl_logic;
        osc_trim        : out    vl_logic_vector(7 downto 0);
        poroff          : out    vl_logic;
        addr_clk        : out    vl_logic;
        asr_addr_in     : out    vl_logic;
        asr_en_addr     : out    vl_logic;
        asr_en_incr     : out    vl_logic;
        asr_init_0      : out    vl_logic;
        asr_shift_1st   : out    vl_logic;
        asr_shift_2nd   : out    vl_logic;
        asr_shift_3rd   : out    vl_logic;
        cfg_addr_slew   : out    vl_logic;
        cfg_addr_por_n  : out    vl_logic;
        cfg_data_cap    : out    vl_logic;
        cfg_data_flt    : out    vl_logic;
        cfg_data_por_n  : out    vl_logic;
        cfg_data_pre    : out    vl_logic;
        cfg_data_wr     : out    vl_logic;
        data_clk        : out    vl_logic;
        dsr_cfg_d       : out    vl_logic_vector(63 downto 0);
        dsr_got_data    : out    vl_logic;
        dsr_ld_rdbkd    : out    vl_logic;
        dsr_reset_n     : out    vl_logic;
        dsr_shift_d     : out    vl_logic_vector(1 downto 0);
        mfg_bits        : out    vl_logic_vector(47 downto 0);
        sram_ppt_addr   : out    vl_logic_vector(3 downto 0);
        trim_bits       : out    vl_logic_vector(63 downto 0);
        trim1_bits      : out    vl_logic_vector(48 downto 0);
        csspin          : out    vl_logic;
        init_n          : out    vl_logic;
        mclk_out        : out    vl_logic;
        pad_done        : out    vl_logic;
        scl             : out    vl_logic;
        sda             : out    vl_logic;
        si              : out    vl_logic;
        so              : out    vl_logic;
        tdo             : out    vl_logic;
        done_md_n       : out    vl_logic;
        done_ts         : out    vl_logic;
        init_md_n       : out    vl_logic;
        init_ts         : out    vl_logic;
        i2c_md_n        : out    vl_logic;
        jtag_md_n       : out    vl_logic;
        mclk_ts         : out    vl_logic;
        mspi_md_n       : out    vl_logic;
        pll_mfg_ts      : out    vl_logic_vector(1 downto 0);
        pll_mfg_md_n    : out    vl_logic_vector(1 downto 0);
        program_md_n    : out    vl_logic;
        scl_ts          : out    vl_logic;
        sda_ts          : out    vl_logic;
        si_md_n         : out    vl_logic;
        si_ts           : out    vl_logic;
        so_md_n         : out    vl_logic;
        so_ts           : out    vl_logic;
        tdo_ts          : out    vl_logic;
        done_goe        : out    vl_logic;
        done_gwe        : out    vl_logic;
        freeze_io       : out    vl_logic;
        freeze_mib      : out    vl_logic;
        gsrn            : out    vl_logic;
        por_n           : out    vl_logic;
        por_n_pre_scan  : out    vl_logic;
        cib_i2c_scl     : out    vl_logic;
        cib_i2c_sclen   : out    vl_logic;
        cib_i2c_sda     : out    vl_logic;
        cib_i2c_sdaen   : out    vl_logic;
        cib_mspi_csn    : out    vl_logic_vector(7 downto 1);
        cib_tc_oc       : out    vl_logic;
        i2c_1st_int     : out    vl_logic;
        i2c_2nd_int     : out    vl_logic;
        spi_int         : out    vl_logic;
        wbcfg_int       : out    vl_logic;
        tc_int          : out    vl_logic;
        jce             : out    vl_logic_vector(2 downto 1);
        jrstn           : out    vl_logic;
        jrti            : out    vl_logic_vector(2 downto 1);
        jshift          : out    vl_logic;
        jtck            : out    vl_logic;
        jtdi            : out    vl_logic;
        jupdate         : out    vl_logic;
        wb_dat_o        : out    vl_logic_vector(7 downto 0);
        wb_ack_o        : out    vl_logic;
        auto_done       : out    vl_logic;
        cib_done        : out    vl_logic;
        cib_freeze_io   : out    vl_logic;
        cib_last_addr   : out    vl_logic_vector(7 downto 0);
        sflag           : out    vl_logic;
        stdby           : out    vl_logic;
        stop            : out    vl_logic;
        usrclk_cib      : out    vl_logic;
        sed_clk_out     : out    vl_logic;
        sed_done        : out    vl_logic;
        sed_inprog      : out    vl_logic;
        sed_err         : out    vl_logic;
        es_o            : out    vl_logic_vector(35 downto 0);
        fl_row_a        : out    vl_logic_vector(14 downto 0);
        fl_ufm_row_sel_all_a: out    vl_logic;
        fl_ufm_row_sel_none_a: out    vl_logic;
        fl_cfg_row_sel_all_a: out    vl_logic;
        fl_cfg_row_sel_none_a: out    vl_logic;
        fl_trim_row_sel_all_a: out    vl_logic;
        fl_trim_row_sel_none_a: out    vl_logic;
        fl_feat_row_sel_all_a: out    vl_logic;
        fl_feat_row_sel_none_a: out    vl_logic;
        fl_era_ufm_a    : out    vl_logic;
        fl_era_cfg_a    : out    vl_logic;
        fl_era_trim_a   : out    vl_logic;
        fl_era_feat_a   : out    vl_logic;
        fl_prg_ufm_a    : out    vl_logic;
        fl_prg_cfg_a    : out    vl_logic;
        fl_prg_tf_a     : out    vl_logic;
        fl_read_ufm_a   : out    vl_logic;
        fl_read_cfg_a   : out    vl_logic;
        fl_read_tf_a    : out    vl_logic;
        fl_erase_setup_a: out    vl_logic;
        fl_erapdis_a    : out    vl_logic;
        fl_erase_pulse_a: out    vl_logic;
        fl_pwtc_well_a  : out    vl_logic;
        fl_prg_pulse_a  : out    vl_logic_vector(3 downto 0);
        fl_prog_disch_a : out    vl_logic;
        fl_prg_pwtc_a   : out    vl_logic;
        fl_en_vreg_mon_a: out    vl_logic;
        fl_era_ver_a    : out    vl_logic;
        fl_scp_a        : out    vl_logic;
        fl_softprg_a    : out    vl_logic;
        fl_verify_a     : out    vl_logic;
        fl_flash_en_a   : out    vl_logic;
        fl_reg_enable_a : out    vl_logic;
        fl_subrow_mvena_ufm_a: out    vl_logic;
        fl_subrow_mvenall_ufm_a: out    vl_logic;
        fl_subrow_hvena_ufm_a: out    vl_logic;
        fl_subrow_hvenall_ufm_a: out    vl_logic;
        fl_subrow_mvena_cfg_a: out    vl_logic;
        fl_subrow_mvenall_cfg_a: out    vl_logic;
        fl_subrow_hvena_cfg_a: out    vl_logic;
        fl_subrow_hvenall_cfg_a: out    vl_logic;
        fl_subrow_mvena_tf_a: out    vl_logic;
        fl_subrow_hvena_tf_a: out    vl_logic;
        fl_sa_enall_a   : out    vl_logic;
        fl_sa_ena_a     : out    vl_logic;
        fl_prgdrv_enall_a: out    vl_logic;
        fl_prgdrv_ena_a : out    vl_logic;
        fl_col_shift_a  : out    vl_logic;
        fl_colstart_a   : out    vl_logic_vector(3 downto 0);
        fl_col_rst_a    : out    vl_logic;
        fl_readpart_a   : out    vl_logic_vector(3 downto 0);
        fl_wor_eval_a   : out    vl_logic;
        fl_wand_eval_a  : out    vl_logic;
        fl_capture_dout_a: out    vl_logic;
        fl_src_clamp_a  : out    vl_logic;
        fl_scpv_a       : out    vl_logic;
        fl_drain_ctrl_a : out    vl_logic;
        fl_sel_6p5v_a   : out    vl_logic;
        fl_prestep_in_neg_a: out    vl_logic_vector(2 downto 0);
        fl_step_in_neg_a: out    vl_logic_vector(2 downto 0);
        fl_ppt_en_a     : out    vl_logic;
        fl_ppt_pset_a   : out    vl_logic;
        fl_ppt_rowsel_a : out    vl_logic;
        fl_ready_rst_a  : out    vl_logic;
        fl_mfg_margin_en_a: out    vl_logic;
        flash_clk_mfg_a : out    vl_logic;
        mux32_out1_mfg_a: out    vl_logic;
        mux32_out2_mfg_a: out    vl_logic;
        fl_row_b        : out    vl_logic_vector(14 downto 0);
        fl_ufm_row_sel_all_b: out    vl_logic;
        fl_ufm_row_sel_none_b: out    vl_logic;
        fl_cfg_row_sel_all_b: out    vl_logic;
        fl_cfg_row_sel_none_b: out    vl_logic;
        fl_trim_row_sel_all_b: out    vl_logic;
        fl_trim_row_sel_none_b: out    vl_logic;
        fl_feat_row_sel_all_b: out    vl_logic;
        fl_feat_row_sel_none_b: out    vl_logic;
        fl_era_ufm_b    : out    vl_logic;
        fl_era_cfg_b    : out    vl_logic;
        fl_era_trim_b   : out    vl_logic;
        fl_era_feat_b   : out    vl_logic;
        fl_prg_ufm_b    : out    vl_logic;
        fl_prg_cfg_b    : out    vl_logic;
        fl_prg_tf_b     : out    vl_logic;
        fl_read_ufm_b   : out    vl_logic;
        fl_read_cfg_b   : out    vl_logic;
        fl_read_tf_b    : out    vl_logic;
        fl_erase_setup_b: out    vl_logic;
        fl_erapdis_b    : out    vl_logic;
        fl_erase_pulse_b: out    vl_logic;
        fl_pwtc_well_b  : out    vl_logic;
        fl_prg_pulse_b  : out    vl_logic_vector(3 downto 0);
        fl_prog_disch_b : out    vl_logic;
        fl_prg_pwtc_b   : out    vl_logic;
        fl_en_vreg_mon_b: out    vl_logic;
        fl_era_ver_b    : out    vl_logic;
        fl_scp_b        : out    vl_logic;
        fl_softprg_b    : out    vl_logic;
        fl_verify_b     : out    vl_logic;
        fl_flash_en_b   : out    vl_logic;
        fl_reg_enable_b : out    vl_logic;
        fl_subrow_mvena_ufm_b: out    vl_logic;
        fl_subrow_mvenall_ufm_b: out    vl_logic;
        fl_subrow_hvena_ufm_b: out    vl_logic;
        fl_subrow_hvenall_ufm_b: out    vl_logic;
        fl_subrow_mvena_cfg_b: out    vl_logic;
        fl_subrow_mvenall_cfg_b: out    vl_logic;
        fl_subrow_hvena_cfg_b: out    vl_logic;
        fl_subrow_hvenall_cfg_b: out    vl_logic;
        fl_subrow_mvena_tf_b: out    vl_logic;
        fl_subrow_hvena_tf_b: out    vl_logic;
        fl_sa_enall_b   : out    vl_logic;
        fl_sa_ena_b     : out    vl_logic;
        fl_prgdrv_enall_b: out    vl_logic;
        fl_prgdrv_ena_b : out    vl_logic;
        fl_col_shift_b  : out    vl_logic;
        fl_colstart_b   : out    vl_logic_vector(3 downto 0);
        fl_col_rst_b    : out    vl_logic;
        fl_readpart_b   : out    vl_logic_vector(3 downto 0);
        fl_wor_eval_b   : out    vl_logic;
        fl_wand_eval_b  : out    vl_logic;
        fl_capture_dout_b: out    vl_logic;
        fl_src_clamp_b  : out    vl_logic;
        fl_scpv_b       : out    vl_logic;
        fl_drain_ctrl_b : out    vl_logic;
        fl_sel_6p5v_b   : out    vl_logic;
        fl_prestep_in_neg_b: out    vl_logic_vector(2 downto 0);
        fl_step_in_neg_b: out    vl_logic_vector(2 downto 0);
        fl_ppt_en_b     : out    vl_logic;
        fl_ppt_pset_b   : out    vl_logic;
        fl_ppt_rowsel_b : out    vl_logic;
        fl_ready_rst_b  : out    vl_logic;
        fl_mfg_margin_en_b: out    vl_logic;
        flash_clk_mfg_b : out    vl_logic;
        mux32_out1_mfg_b: out    vl_logic;
        mux32_out2_mfg_b: out    vl_logic;
        fl_row_c        : out    vl_logic_vector(14 downto 0);
        fl_ufm_row_sel_all_c: out    vl_logic;
        fl_ufm_row_sel_none_c: out    vl_logic;
        fl_cfg_row_sel_all_c: out    vl_logic;
        fl_cfg_row_sel_none_c: out    vl_logic;
        fl_trim_row_sel_all_c: out    vl_logic;
        fl_trim_row_sel_none_c: out    vl_logic;
        fl_feat_row_sel_all_c: out    vl_logic;
        fl_feat_row_sel_none_c: out    vl_logic;
        fl_era_ufm_c    : out    vl_logic;
        fl_era_cfg_c    : out    vl_logic;
        fl_era_trim_c   : out    vl_logic;
        fl_era_feat_c   : out    vl_logic;
        fl_prg_ufm_c    : out    vl_logic;
        fl_prg_cfg_c    : out    vl_logic;
        fl_prg_tf_c     : out    vl_logic;
        fl_read_ufm_c   : out    vl_logic;
        fl_read_cfg_c   : out    vl_logic;
        fl_read_tf_c    : out    vl_logic;
        fl_erase_setup_c: out    vl_logic;
        fl_erapdis_c    : out    vl_logic;
        fl_erase_pulse_c: out    vl_logic;
        fl_pwtc_well_c  : out    vl_logic;
        fl_prg_pulse_c  : out    vl_logic_vector(3 downto 0);
        fl_prog_disch_c : out    vl_logic;
        fl_prg_pwtc_c   : out    vl_logic;
        fl_en_vreg_mon_c: out    vl_logic;
        fl_era_ver_c    : out    vl_logic;
        fl_scp_c        : out    vl_logic;
        fl_softprg_c    : out    vl_logic;
        fl_verify_c     : out    vl_logic;
        fl_flash_en_c   : out    vl_logic;
        fl_reg_enable_c : out    vl_logic;
        fl_subrow_mvena_ufm_c: out    vl_logic;
        fl_subrow_mvenall_ufm_c: out    vl_logic;
        fl_subrow_hvena_ufm_c: out    vl_logic;
        fl_subrow_hvenall_ufm_c: out    vl_logic;
        fl_subrow_mvena_cfg_c: out    vl_logic;
        fl_subrow_mvenall_cfg_c: out    vl_logic;
        fl_subrow_hvena_cfg_c: out    vl_logic;
        fl_subrow_hvenall_cfg_c: out    vl_logic;
        fl_subrow_mvena_tf_c: out    vl_logic;
        fl_subrow_hvena_tf_c: out    vl_logic;
        fl_sa_enall_c   : out    vl_logic;
        fl_sa_ena_c     : out    vl_logic;
        fl_prgdrv_enall_c: out    vl_logic;
        fl_prgdrv_ena_c : out    vl_logic;
        fl_col_shift_c  : out    vl_logic;
        fl_colstart_c   : out    vl_logic_vector(3 downto 0);
        fl_col_rst_c    : out    vl_logic;
        fl_readpart_c   : out    vl_logic_vector(3 downto 0);
        fl_wor_eval_c   : out    vl_logic;
        fl_wand_eval_c  : out    vl_logic;
        fl_capture_dout_c: out    vl_logic;
        fl_src_clamp_c  : out    vl_logic;
        fl_scpv_c       : out    vl_logic;
        fl_drain_ctrl_c : out    vl_logic;
        fl_sel_6p5v_c   : out    vl_logic;
        fl_prestep_in_neg_c: out    vl_logic_vector(2 downto 0);
        fl_step_in_neg_c: out    vl_logic_vector(2 downto 0);
        fl_ppt_en_c     : out    vl_logic;
        fl_ppt_pset_c   : out    vl_logic;
        fl_ppt_rowsel_c : out    vl_logic;
        fl_ready_rst_c  : out    vl_logic;
        fl_mfg_margin_en_c: out    vl_logic;
        flash_clk_mfg_c : out    vl_logic;
        mux32_out1_mfg_c: out    vl_logic;
        mux32_out2_mfg_c: out    vl_logic;
        tie_high        : out    vl_logic;
        tie_low         : out    vl_logic;
        smclk           : out    vl_logic;
        hse_clk         : out    vl_logic;
        hse_reset       : out    vl_logic;
        hse_scan_mode   : out    vl_logic;
        hse_enc_enable  : out    vl_logic;
        hse_cfg_active  : out    vl_logic;
        hse_cfg_noise   : out    vl_logic;
        hse_ac_alg_sel  : out    vl_logic_vector(1 downto 0);
        hse_data_in     : out    vl_logic_vector(7 downto 0);
        hse_write_en    : out    vl_logic;
        hse_last_byte   : out    vl_logic;
        hse_uds_in      : out    vl_logic_vector(255 downto 0);
        mem_bist_en     : out    vl_logic;
        cib_thr_det     : out    vl_logic;
        cib_thr_typ     : out    vl_logic_vector(1 downto 0);
        cib_thr_src     : out    vl_logic_vector(1 downto 0);
        asr_length      : in     vl_logic_vector(13 downto 0);
        chipid          : in     vl_logic_vector(7 downto 0);
        device          : in     vl_logic_vector(2 downto 0);
        dsr_length      : in     vl_logic_vector(15 downto 0);
        idcode          : in     vl_logic_vector(31 downto 0);
        int_spid0       : in     vl_logic;
        bsout           : in     vl_logic;
        asr_addr_out    : in     vl_logic;
        bg_cmp_out      : in     vl_logic;
        bg_stable       : in     vl_logic;
        cfg_osc         : in     vl_logic;
        dtr_out         : in     vl_logic_vector(31 downto 0);
        dsr_rdbk_dout   : in     vl_logic_vector(7 downto 0);
        proc_ring_osc_a : in     vl_logic;
        proc_ring_osc_b : in     vl_logic;
        proc_ring_osc_c : in     vl_logic;
        pwrup_pur_n     : in     vl_logic;
        pll0_ack_i      : in     vl_logic;
        pll0_dat_i      : in     vl_logic_vector(7 downto 0);
        pll1_ack_i      : in     vl_logic;
        pll1_dat_i      : in     vl_logic_vector(7 downto 0);
        cclkin          : in     vl_logic;
        donein          : in     vl_logic;
        initin_n        : in     vl_logic;
        jtagenb         : in     vl_logic;
        pi_mcsn         : in     vl_logic;
        pfsafe          : in     vl_logic;
        programn        : in     vl_logic;
        pi_scl          : in     vl_logic;
        pi_sda          : in     vl_logic;
        pi_si           : in     vl_logic;
        pi_sn           : in     vl_logic;
        pi_so           : in     vl_logic;
        tck             : in     vl_logic;
        tdi             : in     vl_logic;
        tms             : in     vl_logic;
        mc1_auto_sel    : in     vl_logic;
        mc1_bl_float    : in     vl_logic;
        mc1_bypass_timer: in     vl_logic;
        mc1_clk_sel     : in     vl_logic;
        mc1_dis_bg      : in     vl_logic_vector(1 downto 0);
        mc1_dis_osc     : in     vl_logic;
        mc1_dis_ufm     : in     vl_logic;
        mc1_done_phase  : in     vl_logic_vector(1 downto 0);
        mc1_dsr_fctrl   : in     vl_logic_vector(1 downto 0);
        mc1_en_cfgstdby : in     vl_logic;
        mc1_en_cibstdby : in     vl_logic;
        mc1_en_cibwake  : in     vl_logic;
        mc1_en_i2cwake  : in     vl_logic;
        mc1_ents        : in     vl_logic;
        mc1_er1_exist   : in     vl_logic;
        mc1_er2_exist   : in     vl_logic;
        mc1_goe         : in     vl_logic;
        mc1_goe_phase   : in     vl_logic_vector(1 downto 0);
        mc1_gsr_phase   : in     vl_logic_vector(1 downto 0);
        mc1_gsrn        : in     vl_logic;
        mc1_gsrn_cib    : in     vl_logic;
        mc1_gsrn_inv    : in     vl_logic;
        mc1_gsrn_sync   : in     vl_logic;
        mc1_gwe         : in     vl_logic;
        mc1_gwe_phase   : in     vl_logic_vector(1 downto 0);
        mc1_i2c_persist : in     vl_logic;
        mc1_mclk_cib    : in     vl_logic_vector(6 downto 0);
        mc1_mib         : in     vl_logic;
        mc1_mspi_addr   : in     vl_logic_vector(7 downto 0);
        mc1_mspi_persist: in     vl_logic;
        mc1_mspi_sedaddr: in     vl_logic_vector(15 downto 0);
        mc1_pll_set     : in     vl_logic;
        mc1_pll_swap    : in     vl_logic;
        mc1_ppt_qout    : in     vl_logic_vector(7 downto 0);
        mc1_sci_part_cfg: in     vl_logic;
        mc1_sed_once    : in     vl_logic;
        mc1_sed_always  : in     vl_logic;
        mc1_sed_clk     : in     vl_logic_vector(6 downto 0);
        mc1_sed_en      : in     vl_logic_vector(1 downto 0);
        mc1_source_sel  : in     vl_logic;
        mc1_sspi_persist: in     vl_logic;
        mc1_stdby_bg    : in     vl_logic_vector(1 downto 0);
        mc1_syn_ext_done: in     vl_logic;
        mc1_syn_src     : in     vl_logic;
        mc1_tsinv       : in     vl_logic;
        mc1_user_timer  : in     vl_logic;
        mc1_wl_slew     : in     vl_logic;
        cib_i2c_scl_i   : in     vl_logic;
        cib_i2c_sda_i   : in     vl_logic;
        cib_sspi_csn    : in     vl_logic;
        cib_tc_clk      : in     vl_logic;
        cib_tc_ic       : in     vl_logic;
        cib_tc_rstn     : in     vl_logic;
        jtdo            : in     vl_logic_vector(2 downto 1);
        wb_clk_i        : in     vl_logic;
        wb_rst_i        : in     vl_logic;
        wb_cyc_i        : in     vl_logic;
        wb_stb_i        : in     vl_logic;
        wb_we_i         : in     vl_logic;
        wb_adr_i        : in     vl_logic_vector(7 downto 0);
        wb_dat_i        : in     vl_logic_vector(7 downto 0);
        cib_auto_reboot : in     vl_logic;
        cib_clr_flag    : in     vl_logic;
        cib_mspi_addr   : in     vl_logic_vector(7 downto 0);
        cib_osc_dis     : in     vl_logic;
        cib_stdby       : in     vl_logic;
        cib_stdby_clk   : in     vl_logic;
        cib_timeout     : in     vl_logic;
        cib_ts_all      : in     vl_logic;
        gsrn_sync_clk   : in     vl_logic;
        pll_lock        : in     vl_logic;
        sed_clk         : in     vl_logic;
        sed_enable      : in     vl_logic;
        sed_frcerr      : in     vl_logic;
        sed_mode        : in     vl_logic;
        sed_start       : in     vl_logic;
        user_clk        : in     vl_logic;
        usr_gsr         : in     vl_logic;
        es_i            : in     vl_logic_vector(8 downto 0);
        fl_c_bl_a       : in     vl_logic_vector(3 downto 0);
        fl_dout_a       : in     vl_logic_vector(63 downto 0);
        fl_lastcol_a    : in     vl_logic_vector(3 downto 0);
        fl_neg_edge_det_a: in     vl_logic;
        fl_ready_vfy_a  : in     vl_logic;
        fl_vwlp_active_a: in     vl_logic;
        fl_well_active_a: in     vl_logic;
        fl_ready_a      : in     vl_logic;
        fl_l_row_cfg_a  : in     vl_logic;
        fl_l_row_ufm_a  : in     vl_logic;
        fl_c_bl_b       : in     vl_logic_vector(3 downto 0);
        fl_dout_b       : in     vl_logic_vector(63 downto 0);
        fl_lastcol_b    : in     vl_logic_vector(3 downto 0);
        fl_neg_edge_det_b: in     vl_logic;
        fl_ready_vfy_b  : in     vl_logic;
        fl_vwlp_active_b: in     vl_logic;
        fl_well_active_b: in     vl_logic;
        fl_ready_b      : in     vl_logic;
        fl_l_row_cfg_b  : in     vl_logic;
        fl_l_row_ufm_b  : in     vl_logic;
        fl_c_bl_c       : in     vl_logic_vector(3 downto 0);
        fl_dout_c       : in     vl_logic_vector(63 downto 0);
        fl_lastcol_c    : in     vl_logic_vector(3 downto 0);
        fl_neg_edge_det_c: in     vl_logic;
        fl_ready_vfy_c  : in     vl_logic;
        fl_vwlp_active_c: in     vl_logic;
        fl_well_active_c: in     vl_logic;
        fl_ready_c      : in     vl_logic;
        fl_l_row_cfg_c  : in     vl_logic;
        fl_l_row_ufm_c  : in     vl_logic;
        ppt_timer_en    : in     vl_logic;
        jtagen_on_pptfail: in     vl_logic;
        mc1_scan_test_en: in     vl_logic_vector(3 downto 0);
        mc1_erase_all   : in     vl_logic_vector(7 downto 0);
        mc1_off_hse_umode: in     vl_logic;
        hse_busy        : in     vl_logic_vector(1 downto 0);
        hse_buffer_ready: in     vl_logic;
        hse_pass_fail   : in     vl_logic;
        hse_pf_valid    : in     vl_logic;
        hse_trn_out     : in     vl_logic_vector(255 downto 0);
        mem_bist_status : in     vl_logic_vector(127 downto 0);
        cib_thr_det_en  : in     vl_logic;
        cib_lck_thr_src : in     vl_logic;
        cib_thr_det_clk : in     vl_logic;
        mc1_port_lock_en: in     vl_logic_vector(1 downto 0)
    );
end efb_top;
