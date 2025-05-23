library verilog;
use verilog.vl_types.all;
entity quad_top is
    port(
        HDINN0          : in     vl_logic;
        HDINN1          : in     vl_logic;
        HDINN2          : in     vl_logic;
        HDINN3          : in     vl_logic;
        HDINP0          : in     vl_logic;
        HDINP1          : in     vl_logic;
        HDINP2          : in     vl_logic;
        HDINP3          : in     vl_logic;
        NC_REFCLKN      : in     vl_logic;
        NC_REFCLKP      : in     vl_logic;
        NC_VCCAX33      : in     vl_logic;
        NC_VCCP         : in     vl_logic;
        NC_VCCRX0       : in     vl_logic;
        NC_VCCRX1       : in     vl_logic;
        NC_VCCRX2       : in     vl_logic;
        NC_VCCRX3       : in     vl_logic;
        NC_VCCTX0       : in     vl_logic;
        NC_VCCTX1       : in     vl_logic;
        NC_VCCTX2       : in     vl_logic;
        NC_VCCTX3       : in     vl_logic;
        NC_VSSQL        : in     vl_logic;
        NC_VSSQR        : in     vl_logic;
        REFCLKN         : in     vl_logic;
        REFCLKP         : in     vl_logic;
        VCCAX33         : in     vl_logic;
        VCCIB0          : in     vl_logic;
        VCCIB1          : in     vl_logic;
        VCCIB2          : in     vl_logic;
        VCCIB3          : in     vl_logic;
        VCCOB0          : in     vl_logic;
        VCCOB1          : in     vl_logic;
        VCCOB2          : in     vl_logic;
        VCCOB3          : in     vl_logic;
        VCCP            : in     vl_logic;
        VCCRX0          : in     vl_logic;
        VCCRX1          : in     vl_logic;
        VCCRX2          : in     vl_logic;
        VCCRX3          : in     vl_logic;
        VCCTX0          : in     vl_logic;
        VCCTX1          : in     vl_logic;
        VCCTX2          : in     vl_logic;
        VCCTX3          : in     vl_logic;
        VSSQ            : in     vl_logic;
        a_rx_bs_mode    : in     vl_logic;
        a_tx_bs_mode    : in     vl_logic;
        a_bs_topad_0    : in     vl_logic;
        a_bs_topad_1    : in     vl_logic;
        a_bs_topad_2    : in     vl_logic;
        a_bs_topad_3    : in     vl_logic;
        cin             : in     vl_logic_vector(11 downto 0);
        cyawstn         : in     vl_logic;
        ff_ebrd_clk     : in     vl_logic_vector(3 downto 0);
        ff_rxi_clk      : in     vl_logic_vector(3 downto 0);
        ff_tx_d_0       : in     vl_logic_vector(23 downto 0);
        ff_tx_d_1       : in     vl_logic_vector(23 downto 0);
        ff_tx_d_2       : in     vl_logic_vector(23 downto 0);
        ff_tx_d_3       : in     vl_logic_vector(23 downto 0);
        ff_txi_clk      : in     vl_logic_vector(3 downto 0);
        ffc_ck_core_rx  : in     vl_logic;
        ffc_ck_core_tx  : in     vl_logic;
        ffc_ei_en       : in     vl_logic_vector(3 downto 0);
        ffc_enable_cgalign: in     vl_logic_vector(3 downto 0);
        ffc_fb_loopback : in     vl_logic_vector(3 downto 0);
        ffc_lane_rx_rst : in     vl_logic_vector(3 downto 0);
        ffc_lane_tx_rst : in     vl_logic_vector(3 downto 0);
        ffc_macro_rst   : in     vl_logic;
        ffc_pci_det_en  : in     vl_logic_vector(3 downto 0);
        ffc_pcie_ct     : in     vl_logic_vector(3 downto 0);
        ffc_pfifo_clr   : in     vl_logic_vector(3 downto 0);
        ffc_quad_rst    : in     vl_logic;
        ffc_rrst        : in     vl_logic_vector(3 downto 0);
        ffc_rxpwdnb     : in     vl_logic_vector(3 downto 0);
        ffc_sb_inv_rx   : in     vl_logic_vector(3 downto 0);
        ffc_sb_pfifo_lp : in     vl_logic_vector(3 downto 0);
        ffc_signal_detect: in     vl_logic_vector(3 downto 0);
        ffc_trst        : in     vl_logic;
        ffc_txpwdnb     : in     vl_logic_vector(3 downto 0);
        mc1_chif_ctl_ch0: in     vl_logic_vector(103 downto 0);
        mc1_chif_ctl_ch1: in     vl_logic_vector(103 downto 0);
        mc1_chif_ctl_ch2: in     vl_logic_vector(103 downto 0);
        mc1_chif_ctl_ch3: in     vl_logic_vector(103 downto 0);
        mc1_qif_ctl     : in     vl_logic_vector(223 downto 0);
        mc1_ser_ctl_ch0 : in     vl_logic_vector(81 downto 0);
        mc1_ser_ctl_ch1 : in     vl_logic_vector(81 downto 0);
        mc1_ser_ctl_ch2 : in     vl_logic_vector(81 downto 0);
        mc1_ser_ctl_ch3 : in     vl_logic_vector(81 downto 0);
        mc1_ser_ctl_qd  : in     vl_logic_vector(71 downto 0);
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
        tri_ion         : in     vl_logic;
        HDOUTN0         : out    vl_logic;
        HDOUTN1         : out    vl_logic;
        HDOUTN2         : out    vl_logic;
        HDOUTN3         : out    vl_logic;
        HDOUTP0         : out    vl_logic;
        HDOUTP1         : out    vl_logic;
        HDOUTP2         : out    vl_logic;
        HDOUTP3         : out    vl_logic;
        a_bs_fmpad_0    : out    vl_logic;
        a_bs_fmpad_1    : out    vl_logic;
        a_bs_fmpad_2    : out    vl_logic;
        a_bs_fmpad_3    : out    vl_logic;
        a_bs_fmrefck    : out    vl_logic;
        cout            : out    vl_logic_vector(19 downto 0);
        ff_rx_d_0       : out    vl_logic_vector(23 downto 0);
        ff_rx_d_1       : out    vl_logic_vector(23 downto 0);
        ff_rx_d_2       : out    vl_logic_vector(23 downto 0);
        ff_rx_d_3       : out    vl_logic_vector(23 downto 0);
        ff_rx_f_clk     : out    vl_logic_vector(3 downto 0);
        ff_rx_h_clk     : out    vl_logic_vector(3 downto 0);
        ff_rx_q_clk     : out    vl_logic_vector(3 downto 0);
        ff_tx_f_clk     : out    vl_logic;
        ff_tx_h_clk     : out    vl_logic;
        ff_tx_q_clk     : out    vl_logic;
        ffs_cc_overrun  : out    vl_logic_vector(3 downto 0);
        ffs_cc_underrun : out    vl_logic_vector(3 downto 0);
        ffs_ls_sync_status: out    vl_logic_vector(3 downto 0);
        ffs_pcie_con    : out    vl_logic_vector(3 downto 0);
        ffs_pcie_done   : out    vl_logic_vector(3 downto 0);
        ffs_plol        : out    vl_logic;
        ffs_rlol        : out    vl_logic_vector(3 downto 0);
        ffs_rlos_lo     : out    vl_logic_vector(3 downto 0);
        ffs_rxfbfifo_error: out    vl_logic_vector(3 downto 0);
        ffs_txfbfifo_error: out    vl_logic_vector(3 downto 0);
        oob_out         : out    vl_logic_vector(3 downto 0);
        refck2core      : out    vl_logic;
        sciint          : out    vl_logic;
        scirdata        : out    vl_logic_vector(7 downto 0)
    );
end quad_top;
