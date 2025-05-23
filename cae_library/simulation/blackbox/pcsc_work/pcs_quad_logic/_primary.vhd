library verilog;
use verilog.vl_types.all;
entity pcs_quad_logic is
    port(
        bist_rx_clk     : in     vl_logic;
        bist_tx_clk     : in     vl_logic;
        bistdone_a1_c   : in     vl_logic_vector(7 downto 0);
        bistf_a1_c      : in     vl_logic_vector(7 downto 0);
        cin             : in     vl_logic_vector(10 downto 0);
        cyawstn         : in     vl_logic;
        ebrd_i_clk      : in     vl_logic_vector(3 downto 0);
        fb_i_clk        : in     vl_logic_vector(3 downto 0);
        ff_tx_clk_sel   : in     vl_logic_vector(2 downto 0);
        ffc_macro_rst   : in     vl_logic;
        ffc_quad_rst    : in     vl_logic;
        ffc_rrst        : in     vl_logic_vector(3 downto 0);
        ffc_trst        : in     vl_logic;
        ffs_ls_sync_status: in     vl_logic_vector(3 downto 0);
        int_cha_out     : in     vl_logic_vector(3 downto 0);
        mc1_qif_ctl     : in     vl_logic_vector(223 downto 0);
        pcie_connect    : in     vl_logic_vector(3 downto 0);
        pcie_det_done   : in     vl_logic_vector(3 downto 0);
        plol            : in     vl_logic;
        qif_macro_rst   : in     vl_logic;
        qif_quad_rst    : in     vl_logic;
        qif_rrst        : in     vl_logic_vector(3 downto 0);
        qif_trst        : in     vl_logic;
        rlol            : in     vl_logic_vector(3 downto 0);
        rlos_hi         : in     vl_logic_vector(3 downto 0);
        rlos_lo         : in     vl_logic_vector(3 downto 0);
        rx_ch           : in     vl_logic_vector(3 downto 0);
        rx_i_clk        : in     vl_logic_vector(3 downto 0);
        sb_rx_d_0       : in     vl_logic_vector(9 downto 0);
        sb_rx_d_1       : in     vl_logic_vector(9 downto 0);
        sb_rx_d_2       : in     vl_logic_vector(9 downto 0);
        sb_rx_d_3       : in     vl_logic_vector(9 downto 0);
        sci_int10       : in     vl_logic;
        sci_int32       : in     vl_logic;
        sci_rdata10     : in     vl_logic_vector(7 downto 0);
        sci_rdata32     : in     vl_logic_vector(7 downto 0);
        sciaddr         : in     vl_logic_vector(5 downto 0);
        scienaux        : in     vl_logic;
        sciench0        : in     vl_logic;
        sciench1        : in     vl_logic;
        sciench2        : in     vl_logic;
        sciench3        : in     vl_logic;
        scird           : in     vl_logic;
        sciselaux       : in     vl_logic;
        sciselch0       : in     vl_logic;
        sciselch1       : in     vl_logic;
        sciselch2       : in     vl_logic;
        sciselch3       : in     vl_logic;
        sciwdata        : in     vl_logic_vector(7 downto 0);
        sciwstn         : in     vl_logic;
        ser_sts_1_qd_25 : in     vl_logic_vector(7 downto 0);
        ser_sts_3_qd_27 : in     vl_logic_vector(7 downto 0);
        ser_sts_4_qd_28 : in     vl_logic_vector(7 downto 0);
        tck_full        : in     vl_logic;
        testclk_i       : in     vl_logic;
        testclk_mst     : in     vl_logic;
        tobist_data_0   : in     vl_logic_vector(9 downto 0);
        tobist_data_1   : in     vl_logic_vector(9 downto 0);
        tobist_data_2   : in     vl_logic_vector(9 downto 0);
        tobist_data_3   : in     vl_logic_vector(9 downto 0);
        tri_ion         : in     vl_logic;
        tx_i_clk        : in     vl_logic_vector(3 downto 0);
        bist_rx_clk_o   : out    vl_logic;
        bist_rx_data_sel: out    vl_logic;
        bist_tx_clk_o   : out    vl_logic;
        bistfc_a1       : out    vl_logic;
        bistrun_a1      : out    vl_logic;
        char_mode       : out    vl_logic;
        char_test_data  : out    vl_logic_vector(9 downto 0);
        char_test_mode  : out    vl_logic;
        cout            : out    vl_logic_vector(19 downto 0);
        fc_mode         : out    vl_logic;
        ff_tx_f_clk     : out    vl_logic;
        ff_tx_h_clk     : out    vl_logic;
        ff_tx_q_clk     : out    vl_logic;
        fmbist_data_0   : out    vl_logic_vector(9 downto 0);
        fmbist_data_1   : out    vl_logic_vector(9 downto 0);
        fmbist_data_2   : out    vl_logic_vector(9 downto 0);
        fmbist_data_3   : out    vl_logic_vector(9 downto 0);
        force_int       : out    vl_logic;
        macro_rst       : out    vl_logic;
        pcie_mode       : out    vl_logic;
        pcs_ctl_10_qd_09: out    vl_logic_vector(7 downto 0);
        pcs_ctl_11_qd_0a: out    vl_logic_vector(7 downto 0);
        pcs_ctl_12_qd_0b: out    vl_logic_vector(7 downto 0);
        pcs_ctl_13_qd_0c: out    vl_logic_vector(7 downto 0);
        pcs_ctl_3_qd_02 : out    vl_logic_vector(7 downto 0);
        pcs_ctl_4_qd_03 : out    vl_logic_vector(7 downto 0);
        pcs_ctl_5_qd_04 : out    vl_logic_vector(7 downto 0);
        pcs_ctl_6_qd_05 : out    vl_logic_vector(7 downto 0);
        pcs_ctl_7_qd_06 : out    vl_logic_vector(7 downto 0);
        pcs_ctl_8_qd_07 : out    vl_logic_vector(7 downto 0);
        pcs_ctl_9_qd_08 : out    vl_logic_vector(7 downto 0);
        quad_reset_all  : out    vl_logic;
        quad_reset_all_n: out    vl_logic;
        rio_mode        : out    vl_logic;
        rrst            : out    vl_logic_vector(3 downto 0);
        rst_ctl_1_qd_17 : out    vl_logic_vector(7 downto 0);
        rst_ctl_2_qd_18 : out    vl_logic_vector(7 downto 0);
        rst_ctl_4_qd_1a : out    vl_logic_vector(7 downto 0);
        rst_ctl_5_qd_1b : out    vl_logic_vector(7 downto 0);
        sci_addr10      : out    vl_logic_vector(5 downto 0);
        sci_addr32      : out    vl_logic_vector(5 downto 0);
        sci_ion_dl10    : out    vl_logic;
        sci_ion_dl32    : out    vl_logic;
        sci_rd10        : out    vl_logic;
        sci_rd32        : out    vl_logic;
        sci_resetn10    : out    vl_logic;
        sci_resetn32    : out    vl_logic;
        sci_wdata10     : out    vl_logic_vector(7 downto 0);
        sci_wdata32     : out    vl_logic_vector(7 downto 0);
        sci_wstb10      : out    vl_logic;
        sci_wstb32      : out    vl_logic;
        sciench0_b      : out    vl_logic;
        sciench1_b      : out    vl_logic;
        sciench2_b      : out    vl_logic;
        sciench3_b      : out    vl_logic;
        sciint          : out    vl_logic;
        scirdata        : out    vl_logic_vector(7 downto 0);
        sciselch0_b     : out    vl_logic;
        sciselch1_b     : out    vl_logic;
        sciselch2_b     : out    vl_logic;
        sciselch3_b     : out    vl_logic;
        sel_sd_rx_clk   : out    vl_logic_vector(3 downto 0);
        ser_ctl_1_qd_11 : out    vl_logic_vector(7 downto 0);
        ser_ctl_2_qd_12 : out    vl_logic_vector(7 downto 0);
        ser_ctl_3_qd_13 : out    vl_logic_vector(7 downto 0);
        ser_ctl_4_qd_14 : out    vl_logic_vector(7 downto 0);
        ser_ctl_5_qd_15 : out    vl_logic_vector(7 downto 0);
        sync_pulse      : out    vl_logic;
        testclk         : out    vl_logic;
        trst            : out    vl_logic;
        uc_mode         : out    vl_logic;
        xge_mode        : out    vl_logic
    );
end pcs_quad_logic;
