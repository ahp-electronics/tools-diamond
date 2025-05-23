library verilog;
use verilog.vl_types.all;
entity sonet_fbrx_resets_buf is
    port(
        scan_mode       : in     vl_logic;
        pwrupres        : in     vl_logic;
        ffc_ab_reset    : in     vl_logic;
        ffc_cd_reset    : in     vl_logic;
        fb_rxclk0       : in     vl_logic;
        fb_rxclk1       : in     vl_logic;
        fb_rxclk2       : in     vl_logic;
        fb_rxclk3       : in     vl_logic;
        ff_rclk0        : in     vl_logic;
        ff_rclk2        : in     vl_logic;
        align_en_ch0    : in     vl_logic;
        align_en_ch1    : in     vl_logic;
        align_en_ch2    : in     vl_logic;
        align_en_ch3    : in     vl_logic;
        pcs_mode        : in     vl_logic;
        x4_mode         : in     vl_logic;
        x2_mode         : in     vl_logic_vector(1 downto 0);
        cascade_en      : in     vl_logic;
        gclksel         : in     vl_logic_vector(1 downto 0);
        is_slave0_in    : in     vl_logic;
        is_slave1_in    : in     vl_logic;
        is_slave2_in    : in     vl_logic;
        is_slave3_in    : in     vl_logic;
        grp0_wrst_in_n  : in     vl_logic;
        grp1_wrst_in_n  : in     vl_logic;
        grp2_wrst_in_n  : in     vl_logic;
        grp3_wrst_in_n  : in     vl_logic;
        grp0_rrst_in_n  : in     vl_logic;
        grp1_rrst_in_n  : in     vl_logic;
        grp2_rrst_in_n  : in     vl_logic;
        grp3_rrst_in_n  : in     vl_logic;
        sonet_fbrx_ab_mode: out    vl_logic;
        sonet_fbrx_ab_wrst_n: out    vl_logic;
        sonet_fbrx_ab_rrst_n: out    vl_logic;
        sonet_fbrx_cd_mode: out    vl_logic;
        sonet_fbrx_cd_wrst_n: out    vl_logic;
        sonet_fbrx_cd_rrst_n: out    vl_logic;
        is_slave0_Lout  : out    vl_logic;
        is_slave1_Lout  : out    vl_logic;
        is_slave2_Lout  : out    vl_logic;
        is_slave3_Lout  : out    vl_logic;
        grp0_wrst_Lout_n: out    vl_logic;
        grp1_wrst_Lout_n: out    vl_logic;
        grp2_wrst_Lout_n: out    vl_logic;
        grp3_wrst_Lout_n: out    vl_logic;
        grp0_rrst_Lout_n: out    vl_logic;
        grp1_rrst_Lout_n: out    vl_logic;
        grp2_rrst_Lout_n: out    vl_logic;
        grp3_rrst_Lout_n: out    vl_logic;
        is_slave0_Rout  : out    vl_logic;
        is_slave1_Rout  : out    vl_logic;
        is_slave2_Rout  : out    vl_logic;
        is_slave3_Rout  : out    vl_logic;
        grp0_wrst_Rout_n: out    vl_logic;
        grp1_wrst_Rout_n: out    vl_logic;
        grp2_wrst_Rout_n: out    vl_logic;
        grp3_wrst_Rout_n: out    vl_logic;
        grp0_rrst_Rout_n: out    vl_logic;
        grp1_rrst_Rout_n: out    vl_logic;
        grp2_rrst_Rout_n: out    vl_logic;
        grp3_rrst_Rout_n: out    vl_logic
    );
end sonet_fbrx_resets_buf;
