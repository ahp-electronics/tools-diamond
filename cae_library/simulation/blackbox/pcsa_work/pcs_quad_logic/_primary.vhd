library verilog;
use verilog.vl_types.all;
entity pcs_quad_logic is
    generic(
        TIE_LO_STS_QIF  : integer := 0
    );
    port(
        rxclk0          : in     vl_logic;
        rxclk1          : in     vl_logic;
        rxclk2          : in     vl_logic;
        rxclk3          : in     vl_logic;
        m_rxclk0        : in     vl_logic;
        m_rxclk1        : in     vl_logic;
        m_rxclk2        : in     vl_logic;
        m_rxclk3        : in     vl_logic;
        m_rxrst0_n      : in     vl_logic;
        m_rxrst1_n      : in     vl_logic;
        m_rxrst2_n      : in     vl_logic;
        m_rxrst3_n      : in     vl_logic;
        ls_sync_status_0: in     vl_logic;
        ls_sync_status_1: in     vl_logic;
        ls_sync_status_2: in     vl_logic;
        ls_sync_status_3: in     vl_logic;
        mca_rxd_i_0     : in     vl_logic_vector(11 downto 0);
        mca_rxd_i_1     : in     vl_logic_vector(11 downto 0);
        mca_rxd_i_2     : in     vl_logic_vector(11 downto 0);
        mca_rxd_i_3     : in     vl_logic_vector(11 downto 0);
        mca_rxd_o_0     : out    vl_logic_vector(11 downto 0);
        mca_rxd_o_1     : out    vl_logic_vector(11 downto 0);
        mca_rxd_o_2     : out    vl_logic_vector(11 downto 0);
        mca_rxd_o_3     : out    vl_logic_vector(11 downto 0);
        align_status_ab : out    vl_logic;
        align_status_cd : out    vl_logic;
        ffs_ab_aligned  : out    vl_logic;
        ffs_cd_aligned  : out    vl_logic;
        ffs_ab_failed   : out    vl_logic;
        ffs_cd_failed   : out    vl_logic;
        ffc_align_en_0  : in     vl_logic;
        ffc_align_en_1  : in     vl_logic;
        ffc_align_en_2  : in     vl_logic;
        ffc_align_en_3  : in     vl_logic;
        ffc_ab_reset    : in     vl_logic;
        ffc_cd_reset    : in     vl_logic;
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
        cascade_clk     : out    vl_logic;
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
        rx_crc_eopmk    : out    vl_logic_vector(8 downto 0);
        rx_crc_eopch_0  : out    vl_logic_vector(8 downto 0);
        rx_crc_eopch_1  : out    vl_logic_vector(8 downto 0);
        rx_crc_sopmk    : out    vl_logic_vector(8 downto 0);
        rx_crc_sopch_0  : out    vl_logic_vector(8 downto 0);
        rx_crc_sopch_1  : out    vl_logic_vector(8 downto 0);
        rxcrc_inv_din   : out    vl_logic;
        rxcrc_swp_din   : out    vl_logic;
        rxcrc_inv_crc   : out    vl_logic;
        rxcrc_swp_crc   : out    vl_logic;
        rxcrc_swp_bytes : out    vl_logic;
        rxcrc_1ch       : out    vl_logic;
        initial_value   : out    vl_logic;
        crc_mode        : out    vl_logic_vector(1 downto 0);
        txcrc_inv_din   : out    vl_logic;
        txcrc_swp_din   : out    vl_logic;
        txcrc_inv       : out    vl_logic;
        txcrc_swp       : out    vl_logic;
        mclksel_3       : out    vl_logic_vector(1 downto 0);
        mclksel_2       : out    vl_logic_vector(1 downto 0);
        mclksel_1       : out    vl_logic_vector(1 downto 0);
        mclksel_0       : out    vl_logic_vector(1 downto 0);
        qclksel         : out    vl_logic_vector(1 downto 0);
        ff_sysclk_p1_sel: out    vl_logic_vector(1 downto 0);
        ff_rxclk_p1_sel : out    vl_logic_vector(1 downto 0);
        ff_rxclk_p2_sel : out    vl_logic_vector(1 downto 0);
        high_mark       : out    vl_logic_vector(3 downto 0);
        low_mark        : out    vl_logic_vector(3 downto 0);
        match_2_enable  : out    vl_logic;
        match_4_enable  : out    vl_logic;
        min_ipg_cnt     : out    vl_logic_vector(1 downto 0);
        cc_match_4      : out    vl_logic_vector(9 downto 0);
        cc_match_3      : out    vl_logic_vector(9 downto 0);
        cc_match_2      : out    vl_logic_vector(9 downto 0);
        cc_match_1      : out    vl_logic_vector(9 downto 0);
        udf_comma_mask  : out    vl_logic_vector(9 downto 0);
        udf_comma_b     : out    vl_logic_vector(9 downto 0);
        udf_comma_a     : out    vl_logic_vector(9 downto 0);
        pcs_bypass      : out    vl_logic;
        pcs_mode        : out    vl_logic;
        uc_mode         : out    vl_logic;
        fc_mode         : out    vl_logic;
        pcie_mode       : out    vl_logic;
        rio_mode        : out    vl_logic;
        xge_mode        : out    vl_logic;
        x4_mode         : out    vl_logic;
        x2_mode         : out    vl_logic_vector(1 downto 0);
        fb_tx_mode      : out    vl_logic;
        fb_rx_mode      : out    vl_logic;
        prbs_select     : out    vl_logic;
        scram_select    : out    vl_logic;
        cascade_en      : out    vl_logic;
        lsm_disable     : out    vl_logic;
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
        force_int       : out    vl_logic;
        pwrupres        : in     vl_logic;
        qif_rst_n       : in     vl_logic;
        addro           : out    vl_logic_vector(7 downto 0);
        rdo             : out    vl_logic;
        wdatao          : out    vl_logic_vector(7 downto 0);
        wstbo           : out    vl_logic;
        rdatao          : out    vl_logic_vector(7 downto 0);
        into            : out    vl_logic;
        addri           : in     vl_logic_vector(7 downto 0);
        wdatai          : in     vl_logic_vector(7 downto 0);
        rdi             : in     vl_logic;
        wstbi           : in     vl_logic;
        rdatai          : in     vl_logic_vector(7 downto 0);
        inti            : in     vl_logic;
        int_cha_3       : in     vl_logic;
        int_cha_2       : in     vl_logic;
        int_cha_1       : in     vl_logic;
        int_cha_0       : in     vl_logic;
        cs_qif          : in     vl_logic;
        testclk         : out    vl_logic;
        testclk_maco    : in     vl_logic;
        bistdone_a1_c   : in     vl_logic_vector(7 downto 0);
        bistf_a1_c      : in     vl_logic_vector(7 downto 0);
        bistrun_a1      : out    vl_logic;
        bistfc_a1       : out    vl_logic;
        char_out        : out    vl_logic_vector(21 downto 0);
        serdes_char_out : out    vl_logic_vector(21 downto 0);
        tck_fleximac    : out    vl_logic;
        tck_fleximac_prev: in     vl_logic;
        char_td         : out    vl_logic_vector(9 downto 0);
        char_test_mode  : out    vl_logic_vector(2 downto 0);
        scan_mode       : out    vl_logic;
        scan_enable     : out    vl_logic;
        scan_rstn       : out    vl_logic;
        scan_in_tx      : out    vl_logic;
        scan_in_rx      : out    vl_logic;
        rx_ch           : in     vl_logic_vector(3 downto 0);
        char_in         : in     vl_logic_vector(12 downto 0);
        serdes_char_out_prev: in     vl_logic_vector(21 downto 0);
        serdes_rxd_0    : in     vl_logic_vector(9 downto 0);
        serdes_rxd_1    : in     vl_logic_vector(9 downto 0);
        serdes_rxd_2    : in     vl_logic_vector(9 downto 0);
        serdes_rxd_3    : in     vl_logic_vector(9 downto 0);
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
        plol            : in     vl_logic;
        refloc          : in     vl_logic;
        rrefloc         : in     vl_logic;
        scan_out_tx0    : in     vl_logic;
        scan_out_tx1    : in     vl_logic;
        scan_out_tx2    : in     vl_logic;
        scan_out_tx3    : in     vl_logic;
        scan_out_rx0    : in     vl_logic;
        scan_out_rx1    : in     vl_logic;
        scan_out_rx2    : in     vl_logic;
        scan_out_rx3    : in     vl_logic;
        scan_mpif_char_out_prev: in     vl_logic_vector(21 downto 0);
        bist_char_out_prev: in     vl_logic_vector(21 downto 0);
        bstsds_rpt      : in     vl_logic_vector(7 downto 0);
        sds_test_bus    : in     vl_logic_vector(7 downto 0);
        quad_id         : in     vl_logic_vector(1 downto 0);
        comb_ab_reset   : out    vl_logic;
        comb_cd_reset   : out    vl_logic;
        align_en_ch0    : out    vl_logic;
        align_en_ch1    : out    vl_logic;
        align_en_ch2    : out    vl_logic;
        align_en_ch3    : out    vl_logic;
        gclksel         : out    vl_logic_vector(1 downto 0);
        rdatao_char     : in     vl_logic_vector(7 downto 0);
        bstsds_ac       : in     vl_logic_vector(4 downto 0);
        bstsds_b        : in     vl_logic_vector(3 downto 0);
        tx_ctl_c        : in     vl_logic_vector(1 downto 0);
        bstsds_or_ac    : out    vl_logic_vector(4 downto 0);
        bstsds_or_b     : out    vl_logic_vector(3 downto 0);
        tx_ctl_or_c     : out    vl_logic_vector(1 downto 0)
    );
end pcs_quad_logic;
