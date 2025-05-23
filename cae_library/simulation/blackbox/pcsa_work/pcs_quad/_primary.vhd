library verilog;
use verilog.vl_types.all;
entity pcs_quad is
    port(
        sysclk0         : in     vl_logic;
        sysclk1         : in     vl_logic;
        sysclk2         : in     vl_logic;
        sysclk3         : in     vl_logic;
        sys_txrst0_n    : in     vl_logic;
        sys_txrst1_n    : in     vl_logic;
        sys_txrst2_n    : in     vl_logic;
        sys_txrst3_n    : in     vl_logic;
        sys_rxrst0_n    : in     vl_logic;
        sys_rxrst1_n    : in     vl_logic;
        sys_rxrst2_n    : in     vl_logic;
        sys_rxrst3_n    : in     vl_logic;
        pcs_rxclk0      : in     vl_logic;
        pcs_rxclk1      : in     vl_logic;
        pcs_rxclk2      : in     vl_logic;
        pcs_rxclk3      : in     vl_logic;
        pcs_rxrst0_n    : in     vl_logic;
        pcs_rxrst1_n    : in     vl_logic;
        pcs_rxrst2_n    : in     vl_logic;
        pcs_rxrst3_n    : in     vl_logic;
        m_rxclk0        : in     vl_logic;
        m_rxclk1        : in     vl_logic;
        m_rxclk2        : in     vl_logic;
        m_rxclk3        : in     vl_logic;
        m_rxrst0_n      : in     vl_logic;
        m_rxrst1_n      : in     vl_logic;
        m_rxrst2_n      : in     vl_logic;
        m_rxrst3_n      : in     vl_logic;
        fb_rxclk0       : in     vl_logic;
        fb_rxclk1       : in     vl_logic;
        fb_rxclk2       : in     vl_logic;
        fb_rxclk3       : in     vl_logic;
        fb_rxrst0_n     : in     vl_logic;
        fb_rxrst1_n     : in     vl_logic;
        fb_rxrst2_n     : in     vl_logic;
        fb_rxrst3_n     : in     vl_logic;
        ff_tclk0        : in     vl_logic;
        ff_tclk1        : in     vl_logic;
        ff_tclk2        : in     vl_logic;
        ff_tclk3        : in     vl_logic;
        ff_rclk0        : in     vl_logic;
        ff_rclk1        : in     vl_logic;
        ff_rclk2        : in     vl_logic;
        ff_rclk3        : in     vl_logic;
        cascade_clk     : out    vl_logic;
        serdes_rxd_0    : in     vl_logic_vector(9 downto 0);
        serdes_rxd_1    : in     vl_logic_vector(9 downto 0);
        serdes_rxd_2    : in     vl_logic_vector(9 downto 0);
        serdes_rxd_3    : in     vl_logic_vector(9 downto 0);
        sb_txd_0        : out    vl_logic_vector(9 downto 0);
        sb_txd_1        : out    vl_logic_vector(9 downto 0);
        sb_txd_2        : out    vl_logic_vector(9 downto 0);
        sb_txd_3        : out    vl_logic_vector(9 downto 0);
        ff_txd_0        : in     vl_logic_vector(23 downto 0);
        ff_txd_1        : in     vl_logic_vector(23 downto 0);
        ff_txd_2        : in     vl_logic_vector(23 downto 0);
        ff_txd_3        : in     vl_logic_vector(23 downto 0);
        fb_rxd_0        : out    vl_logic_vector(23 downto 0);
        fb_rxd_1        : out    vl_logic_vector(23 downto 0);
        fb_rxd_2        : out    vl_logic_vector(23 downto 0);
        fb_rxd_3        : out    vl_logic_vector(23 downto 0);
        ffc_pcie_disable_tx_0: in     vl_logic;
        ffc_pcie_disable_tx_1: in     vl_logic;
        ffc_pcie_disable_tx_2: in     vl_logic;
        ffc_pcie_disable_tx_3: in     vl_logic;
        ffc_pcie_disable_rx_0: in     vl_logic;
        ffc_pcie_disable_rx_1: in     vl_logic;
        ffc_pcie_disable_rx_2: in     vl_logic;
        ffc_pcie_disable_rx_3: in     vl_logic;
        ffc_signal_detect_0: in     vl_logic;
        ffc_signal_detect_1: in     vl_logic;
        ffc_signal_detect_2: in     vl_logic;
        ffc_signal_detect_3: in     vl_logic;
        ffc_enable_cgalign_0: in     vl_logic;
        ffc_enable_cgalign_1: in     vl_logic;
        ffc_enable_cgalign_2: in     vl_logic;
        ffc_enable_cgalign_3: in     vl_logic;
        ffc_align_en_0  : in     vl_logic;
        ffc_align_en_1  : in     vl_logic;
        ffc_align_en_2  : in     vl_logic;
        ffc_align_en_3  : in     vl_logic;
        ffc_ab_reset    : in     vl_logic;
        ffc_cd_reset    : in     vl_logic;
        ffs_ls_sync_status_0: out    vl_logic;
        ffs_ls_sync_status_1: out    vl_logic;
        ffs_ls_sync_status_2: out    vl_logic;
        ffs_ls_sync_status_3: out    vl_logic;
        ffs_align_status_ab: out    vl_logic;
        ffs_align_status_cd: out    vl_logic;
        ffs_ab_aligned  : out    vl_logic;
        ffs_cd_aligned  : out    vl_logic;
        ffs_ab_failed   : out    vl_logic;
        ffs_cd_failed   : out    vl_logic;
        ffc_fb_loopback_0: in     vl_logic;
        ffc_fb_loopback_1: in     vl_logic;
        ffc_fb_loopback_2: in     vl_logic;
        ffc_fb_loopback_3: in     vl_logic;
        ffc_sb_inv_rx_0 : in     vl_logic;
        ffc_sb_inv_rx_1 : in     vl_logic;
        ffc_sb_inv_rx_2 : in     vl_logic;
        ffc_sb_inv_rx_3 : in     vl_logic;
        ffs_cc_overrun_0: out    vl_logic;
        ffs_cc_overrun_1: out    vl_logic;
        ffs_cc_overrun_2: out    vl_logic;
        ffs_cc_overrun_3: out    vl_logic;
        ffs_cc_underrun_0: out    vl_logic;
        ffs_cc_underrun_1: out    vl_logic;
        ffs_cc_underrun_2: out    vl_logic;
        ffs_cc_underrun_3: out    vl_logic;
        addro           : out    vl_logic_vector(7 downto 0);
        wdatao          : out    vl_logic_vector(7 downto 0);
        rdo             : out    vl_logic;
        wstbo           : out    vl_logic;
        rdatai          : in     vl_logic_vector(7 downto 0);
        inti            : in     vl_logic;
        rdatao          : out    vl_logic_vector(7 downto 0);
        into            : out    vl_logic;
        addri           : in     vl_logic_vector(7 downto 0);
        wdatai          : in     vl_logic_vector(7 downto 0);
        rdi             : in     vl_logic;
        wstbi           : in     vl_logic;
        cs_chif_0       : in     vl_logic;
        cs_chif_1       : in     vl_logic;
        cs_chif_2       : in     vl_logic;
        cs_chif_3       : in     vl_logic;
        cs_qif          : in     vl_logic;
        pwrupres        : in     vl_logic;
        rst_n           : in     vl_logic;
        testclk         : out    vl_logic;
        testclk_maco    : in     vl_logic;
        grp_clk_p1      : in     vl_logic_vector(3 downto 0);
        grp_clk_p2      : in     vl_logic_vector(3 downto 0);
        grp_start       : in     vl_logic_vector(3 downto 0);
        grp_done        : in     vl_logic_vector(3 downto 0);
        grp_deskew_error: in     vl_logic_vector(3 downto 0);
        iqa_quad_start_ls: out    vl_logic;
        iqa_quad_done_ls: out    vl_logic;
        iqa_quad_and_fp1_ls: out    vl_logic;
        iqa_quad_and_fp0_ls: out    vl_logic;
        iqa_quad_or_fp1_ls: out    vl_logic;
        iqa_quad_or_fp0_ls: out    vl_logic;
        iqa_quad_rst_n  : out    vl_logic;
        char_out        : out    vl_logic_vector(21 downto 0);
        serdes_char_out : out    vl_logic_vector(21 downto 0);
        tck_fleximac    : out    vl_logic;
        tck_fleximac_prev: in     vl_logic;
        char_in         : in     vl_logic_vector(12 downto 0);
        serdes_char_out_prev: in     vl_logic_vector(21 downto 0);
        scan_mpif_char_out_prev: in     vl_logic_vector(21 downto 0);
        bist_char_out_prev: in     vl_logic_vector(21 downto 0);
        quad_id         : in     vl_logic_vector(1 downto 0);
        rpwdnb_0        : out    vl_logic;
        tpwdnb_0        : out    vl_logic;
        rate_mode_rx_0  : out    vl_logic;
        rate_mode_tx_0  : out    vl_logic;
        tdrv_pre_en_0   : out    vl_logic;
        tdrv_pre_set_0  : out    vl_logic_vector(2 downto 0);
        rterm_tx_0      : out    vl_logic_vector(1 downto 0);
        tdrv_amp_0      : out    vl_logic_vector(1 downto 0);
        rterm_rx_0      : out    vl_logic_vector(1 downto 0);
        rcv_dcc_en_0    : out    vl_logic;
        req_en_0        : out    vl_logic;
        req_lvl_set_0   : out    vl_logic;
        rpwdnb_1        : out    vl_logic;
        tpwdnb_1        : out    vl_logic;
        rate_mode_rx_1  : out    vl_logic;
        rate_mode_tx_1  : out    vl_logic;
        tdrv_pre_en_1   : out    vl_logic;
        tdrv_pre_set_1  : out    vl_logic_vector(2 downto 0);
        rterm_tx_1      : out    vl_logic_vector(1 downto 0);
        tdrv_amp_1      : out    vl_logic_vector(1 downto 0);
        rterm_rx_1      : out    vl_logic_vector(1 downto 0);
        rcv_dcc_en_1    : out    vl_logic;
        req_en_1        : out    vl_logic;
        req_lvl_set_1   : out    vl_logic;
        rpwdnb_2        : out    vl_logic;
        tpwdnb_2        : out    vl_logic;
        rate_mode_rx_2  : out    vl_logic;
        rate_mode_tx_2  : out    vl_logic;
        tdrv_pre_en_2   : out    vl_logic;
        tdrv_pre_set_2  : out    vl_logic_vector(2 downto 0);
        rterm_tx_2      : out    vl_logic_vector(1 downto 0);
        tdrv_amp_2      : out    vl_logic_vector(1 downto 0);
        rterm_rx_2      : out    vl_logic_vector(1 downto 0);
        rcv_dcc_en_2    : out    vl_logic;
        req_en_2        : out    vl_logic;
        req_lvl_set_2   : out    vl_logic;
        rpwdnb_3        : out    vl_logic;
        tpwdnb_3        : out    vl_logic;
        rate_mode_rx_3  : out    vl_logic;
        rate_mode_tx_3  : out    vl_logic;
        tdrv_pre_en_3   : out    vl_logic;
        tdrv_pre_set_3  : out    vl_logic_vector(2 downto 0);
        rterm_tx_3      : out    vl_logic_vector(1 downto 0);
        tdrv_amp_3      : out    vl_logic_vector(1 downto 0);
        rterm_rx_3      : out    vl_logic_vector(1 downto 0);
        rcv_dcc_en_3    : out    vl_logic;
        req_en_3        : out    vl_logic;
        req_lvl_set_3   : out    vl_logic;
        rlos_set        : out    vl_logic_vector(2 downto 0);
        refck_dcc_en    : out    vl_logic;
        rxrefck_dcc_en  : out    vl_logic;
        refck_core_en   : out    vl_logic;
        rxrefck_en      : out    vl_logic;
        refck_mode      : out    vl_logic_vector(1 downto 0);
        refck_loc_set   : out    vl_logic_vector(1 downto 0);
        refck_rterm     : out    vl_logic;
        tx_ctl_a        : out    vl_logic_vector(7 downto 0);
        rx_ctl_a        : out    vl_logic_vector(7 downto 0);
        rx_sdi_en_0     : out    vl_logic;
        rx_sdi_en_1     : out    vl_logic;
        rx_sdi_en_2     : out    vl_logic;
        rx_sdi_en_3     : out    vl_logic;
        plol            : in     vl_logic;
        refloc          : in     vl_logic;
        rrefloc         : in     vl_logic;
        rck0            : in     vl_logic;
        tck0            : in     vl_logic;
        rlol_0          : in     vl_logic;
        rlos_lo_0       : in     vl_logic;
        rlos_hi_0       : in     vl_logic;
        pcie_connect_0  : in     vl_logic;
        pcie_det_done_0 : in     vl_logic;
        rck1            : in     vl_logic;
        tck1            : in     vl_logic;
        rlol_1          : in     vl_logic;
        rlos_lo_1       : in     vl_logic;
        rlos_hi_1       : in     vl_logic;
        pcie_connect_1  : in     vl_logic;
        pcie_det_done_1 : in     vl_logic;
        rck2            : in     vl_logic;
        tck2            : in     vl_logic;
        rlol_2          : in     vl_logic;
        rlos_lo_2       : in     vl_logic;
        rlos_hi_2       : in     vl_logic;
        pcie_connect_2  : in     vl_logic;
        pcie_det_done_2 : in     vl_logic;
        rck3            : in     vl_logic;
        tck3            : in     vl_logic;
        rlol_3          : in     vl_logic;
        rlos_lo_3       : in     vl_logic;
        rlos_hi_3       : in     vl_logic;
        pcie_connect_3  : in     vl_logic;
        pcie_det_done_3 : in     vl_logic;
        refck2core      : in     vl_logic;
        rxrefck2core    : in     vl_logic;
        mclksel_3       : out    vl_logic_vector(1 downto 0);
        mclksel_2       : out    vl_logic_vector(1 downto 0);
        mclksel_1       : out    vl_logic_vector(1 downto 0);
        mclksel_0       : out    vl_logic_vector(1 downto 0);
        qclksel         : out    vl_logic_vector(1 downto 0);
        ff_sysclk_p1_sel: out    vl_logic_vector(1 downto 0);
        ff_rxclk_p1_sel : out    vl_logic_vector(1 downto 0);
        ff_rxclk_p2_sel : out    vl_logic_vector(1 downto 0);
        lane_tx_rst0    : out    vl_logic;
        lane_tx_rst1    : out    vl_logic;
        lane_tx_rst2    : out    vl_logic;
        lane_tx_rst3    : out    vl_logic;
        lane_rx_rst0    : out    vl_logic;
        lane_rx_rst1    : out    vl_logic;
        lane_rx_rst2    : out    vl_logic;
        lane_rx_rst3    : out    vl_logic;
        fpga_reset_en   : out    vl_logic;
        rrst_lol        : out    vl_logic;
        trst_lol        : out    vl_logic;
        quad_rst        : out    vl_logic;
        macro_rst       : out    vl_logic;
        macro_pdb       : out    vl_logic;
        fb_tx_mode      : out    vl_logic;
        fb_rx_mode      : out    vl_logic;
        uc_mode         : out    vl_logic;
        pcs_mode        : out    vl_logic;
        x4_mode         : out    vl_logic;
        cascade_en      : out    vl_logic;
        pcie_mode       : out    vl_logic;
        sb_loopback_0   : out    vl_logic;
        sb_loopback_1   : out    vl_logic;
        sb_loopback_2   : out    vl_logic;
        sb_loopback_3   : out    vl_logic;
        char_test_mode  : out    vl_logic_vector(2 downto 0);
        scan_mode       : out    vl_logic;
        scan_rstn       : out    vl_logic;
        bstsds_rpt      : in     vl_logic_vector(7 downto 0);
        sds_test_bus    : in     vl_logic_vector(7 downto 0);
        grp0_wrst_in_n  : in     vl_logic;
        grp1_wrst_in_n  : in     vl_logic;
        grp2_wrst_in_n  : in     vl_logic;
        grp3_wrst_in_n  : in     vl_logic;
        grp0_rrst_in_n  : in     vl_logic;
        grp1_rrst_in_n  : in     vl_logic;
        grp2_rrst_in_n  : in     vl_logic;
        grp3_rrst_in_n  : in     vl_logic;
        is_slave0_in    : in     vl_logic;
        is_slave1_in    : in     vl_logic;
        is_slave2_in    : in     vl_logic;
        is_slave3_in    : in     vl_logic;
        grp0_wrst_Lout_n: out    vl_logic;
        grp1_wrst_Lout_n: out    vl_logic;
        grp2_wrst_Lout_n: out    vl_logic;
        grp3_wrst_Lout_n: out    vl_logic;
        grp0_rrst_Lout_n: out    vl_logic;
        grp1_rrst_Lout_n: out    vl_logic;
        grp2_rrst_Lout_n: out    vl_logic;
        grp3_rrst_Lout_n: out    vl_logic;
        is_slave0_Lout  : out    vl_logic;
        is_slave1_Lout  : out    vl_logic;
        is_slave2_Lout  : out    vl_logic;
        is_slave3_Lout  : out    vl_logic;
        grp0_wrst_Rout_n: out    vl_logic;
        grp1_wrst_Rout_n: out    vl_logic;
        grp2_wrst_Rout_n: out    vl_logic;
        grp3_wrst_Rout_n: out    vl_logic;
        grp0_rrst_Rout_n: out    vl_logic;
        grp1_rrst_Rout_n: out    vl_logic;
        grp2_rrst_Rout_n: out    vl_logic;
        grp3_rrst_Rout_n: out    vl_logic;
        is_slave0_Rout  : out    vl_logic;
        is_slave1_Rout  : out    vl_logic;
        is_slave2_Rout  : out    vl_logic;
        is_slave3_Rout  : out    vl_logic;
        TIE_HIGH        : in     vl_logic;
        TIE_LOW         : in     vl_logic;
        rdatao_char     : in     vl_logic_vector(7 downto 0);
        bstsds_ac       : in     vl_logic_vector(4 downto 0);
        bstsds_b        : in     vl_logic_vector(3 downto 0);
        tx_ctl_c        : in     vl_logic_vector(1 downto 0);
        bstsds_or_ac    : out    vl_logic_vector(4 downto 0);
        bstsds_or_b     : out    vl_logic_vector(3 downto 0);
        tx_ctl_or_c     : out    vl_logic_vector(1 downto 0)
    );
end pcs_quad;
