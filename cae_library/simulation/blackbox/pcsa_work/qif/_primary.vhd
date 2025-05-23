library verilog;
use verilog.vl_types.all;
entity qif is
    generic(
        creg            : integer := 70;
        sreg            : integer := 9
    );
    port(
        pcs_addro       : out    vl_logic_vector(7 downto 0);
        pcs_rdo         : out    vl_logic;
        pcs_wdatao      : out    vl_logic_vector(7 downto 0);
        pcs_wstbo       : out    vl_logic;
        pcs_rdata_qxcyo : out    vl_logic_vector(7 downto 0);
        pcs_into        : out    vl_logic;
        int_qua_out     : out    vl_logic;
        rst_rx3         : out    vl_logic;
        rst_rx2         : out    vl_logic;
        rst_rx1         : out    vl_logic;
        rst_rx0         : out    vl_logic;
        rst_tx3         : out    vl_logic;
        rst_tx2         : out    vl_logic;
        rst_tx1         : out    vl_logic;
        rst_tx0         : out    vl_logic;
        quad_pulse_rst  : out    vl_logic;
        gen_ctl_1_ba_00 : out    vl_logic_vector(7 downto 0);
        gen_ctl_2_ba_01 : out    vl_logic_vector(7 downto 0);
        gen_ctl_3_ba_02 : out    vl_logic_vector(7 downto 0);
        gen_ctl_4_ba_03 : out    vl_logic_vector(7 downto 0);
        mca_ctl_1_ba_04 : out    vl_logic_vector(7 downto 0);
        mca_ctl_2_ba_05 : out    vl_logic_vector(7 downto 0);
        mca_ctl_3_ba_06 : out    vl_logic_vector(7 downto 0);
        mca_ctl_4_ba_07 : out    vl_logic_vector(7 downto 0);
        mca_ctl_5_ba_08 : out    vl_logic_vector(7 downto 0);
        mca_ctl_6_ba_09 : out    vl_logic_vector(7 downto 0);
        mca_ctl_7_ba_0a : out    vl_logic_vector(7 downto 0);
        mca_ctl_8_ba_0b : out    vl_logic_vector(7 downto 0);
        pkt_ctl_1_ba_0d : out    vl_logic_vector(7 downto 0);
        pkt_ctl_2_ba_0e : out    vl_logic_vector(7 downto 0);
        pkt_ctl_3_ba_0f : out    vl_logic_vector(7 downto 0);
        pkt_ctl_4_ba_10 : out    vl_logic_vector(7 downto 0);
        pkt_ctl_5_ba_11 : out    vl_logic_vector(7 downto 0);
        pkt_ctl_6_ba_12 : out    vl_logic_vector(7 downto 0);
        pkt_ctl_7_ba_13 : out    vl_logic_vector(7 downto 0);
        pkt_ctl_8_ba_14 : out    vl_logic_vector(7 downto 0);
        pkt_ctl_9_ba_15 : out    vl_logic_vector(7 downto 0);
        pkt_ctl_10_ba_16: out    vl_logic_vector(7 downto 0);
        pkt_ctl_11_ba_17: out    vl_logic_vector(7 downto 0);
        pkt_ctl_12_ba_18: out    vl_logic_vector(7 downto 0);
        pkt_ctl_13_ba_19: out    vl_logic_vector(7 downto 0);
        pkt_ctl_14_ba_1a: out    vl_logic_vector(7 downto 0);
        pkt_ctl_15_ba_1b: out    vl_logic_vector(7 downto 0);
        crc_ctl_1_ba_1d : out    vl_logic_vector(7 downto 0);
        crc_ctl_2_ba_1e : out    vl_logic_vector(7 downto 0);
        crc_ctl_3_ba_1f : out    vl_logic_vector(7 downto 0);
        crc_ctl_4_ba_20 : out    vl_logic_vector(7 downto 0);
        crc_ctl_5_ba_21 : out    vl_logic_vector(7 downto 0);
        crc_ctl_6_ba_22 : out    vl_logic_vector(7 downto 0);
        crc_ctl_7_ba_23 : out    vl_logic_vector(7 downto 0);
        crc_ctl_8_ba_24 : out    vl_logic_vector(7 downto 0);
        crc_ctl_9_ba_25 : out    vl_logic_vector(7 downto 0);
        crc_ctl_10_ba_26: out    vl_logic_vector(7 downto 0);
        crc_ctl_11_ba_27: out    vl_logic_vector(7 downto 0);
        ser_ctl_1_ba_28 : out    vl_logic_vector(7 downto 0);
        ser_ctl_2_ba_29 : out    vl_logic_vector(7 downto 0);
        ser_ctl_3_ba_2a : out    vl_logic_vector(7 downto 0);
        ser_ctl_4_ba_2b : out    vl_logic_vector(7 downto 0);
        ser_ctl_5_ba_2c : out    vl_logic_vector(7 downto 0);
        ser_ctl_6_ba_2d : out    vl_logic_vector(7 downto 0);
        ser_ctl_7_ba_2e : out    vl_logic_vector(7 downto 0);
        ser_ctl_8_ba_2f : out    vl_logic_vector(7 downto 0);
        ser_ctl_9_ba_30 : out    vl_logic_vector(7 downto 0);
        ser_ctl_10_ba_31: out    vl_logic_vector(7 downto 0);
        ser_ctl_11_ba_32: out    vl_logic_vector(7 downto 0);
        ser_ctl_12_ba_33: out    vl_logic_vector(7 downto 0);
        ser_ctl_13_ba_34: out    vl_logic_vector(7 downto 0);
        ser_ctl_14_ba_35: out    vl_logic_vector(7 downto 0);
        ser_ctl_15_ba_36: out    vl_logic_vector(7 downto 0);
        ser_ctl_16_ba_37: out    vl_logic_vector(7 downto 0);
        ser_ctl_17_ba_38: out    vl_logic_vector(7 downto 0);
        ser_ctl_18_ba_39: out    vl_logic_vector(7 downto 0);
        ser_ctl_19_ba_3a: out    vl_logic_vector(7 downto 0);
        ser_ctl_20_ba_3b: out    vl_logic_vector(7 downto 0);
        ser_ctl_21_ba_3c: out    vl_logic_vector(7 downto 0);
        ser_ctl_22_ba_3d: out    vl_logic_vector(7 downto 0);
        ser_ctl_23_ba_3e: out    vl_logic_vector(7 downto 0);
        rst_ctl_2_ba_41 : out    vl_logic_vector(7 downto 0);
        rst_ctl_3_ba_42 : out    vl_logic_vector(7 downto 0);
        gen_ctl_5_ba_44 : out    vl_logic_vector(7 downto 0);
        gen_ctl_6_ba_45 : out    vl_logic_vector(7 downto 0);
        pcs_inti        : in     vl_logic;
        resetn          : in     vl_logic;
        pcs_addri       : in     vl_logic_vector(7 downto 0);
        pcs_wdatai      : in     vl_logic_vector(7 downto 0);
        pcs_wstbi       : in     vl_logic;
        pcs_rdi         : in     vl_logic;
        pcs_qxcyi       : in     vl_logic;
        pcs_rdata_qxcyi : in     vl_logic_vector(7 downto 0);
        force_int       : in     vl_logic;
        pwrupres        : in     vl_logic;
        gen_sts_1_ba_80 : in     vl_logic_vector(7 downto 0);
        gen_sts_2_ba_81 : in     vl_logic_vector(7 downto 0);
        mca_sts_1_ba_82 : in     vl_logic_vector(7 downto 0);
        pkt_sts_1_ba_84 : in     vl_logic_vector(7 downto 0);
        ser_sts_1_ba_86 : in     vl_logic_vector(7 downto 0);
        ser_sts_2_ba_87 : in     vl_logic_vector(7 downto 0)
    );
end qif;
