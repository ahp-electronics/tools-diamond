library verilog;
use verilog.vl_types.all;
entity int_lane is
    port(
        gen_sts_2_ba_81 : out    vl_logic_vector(7 downto 0);
        gen_int_sts_1_ba_84: out    vl_logic_vector(7 downto 0);
        pkt_int_sts_1_ba_8a: out    vl_logic_vector(7 downto 0);
        son_int_sts_1_ba_93: out    vl_logic_vector(7 downto 0);
        son_sts_2_ba_8c : out    vl_logic_vector(7 downto 0);
        ser_int_sts_1_ba_97: out    vl_logic_vector(7 downto 0);
        gen_int_sts_4_ba_98: out    vl_logic_vector(7 downto 0);
        int_cha         : out    vl_logic;
        gen_int_ctl_1_ba_04: in     vl_logic_vector(7 downto 0);
        pkt_int_ctl_1_ba_0a: in     vl_logic_vector(7 downto 0);
        son_int_ctl_1_ba_12: in     vl_logic_vector(7 downto 0);
        ser_int_ctl_1_ba_17: in     vl_logic_vector(7 downto 0);
        gen_int_ctl_4_ba_03: in     vl_logic_vector(7 downto 0);
        gen_sts_1_ba_80 : in     vl_logic_vector(7 downto 0);
        pkt_sts_1_ba_85 : in     vl_logic_vector(7 downto 0);
        son_sts_1_ba_8b : in     vl_logic_vector(7 downto 0);
        ser_sts_1_ba_94 : in     vl_logic_vector(7 downto 0);
        gen_sts_4_ba_83 : in     vl_logic_vector(7 downto 0);
        cor_gen_sts_2_ba_81: in     vl_logic;
        cor_gen_int_sts_1_ba_84: in     vl_logic;
        cor_pkt_int_sts_1_ba_8a: in     vl_logic;
        cor_son_int_sts_1_ba_93: in     vl_logic;
        cor_son_sts_2_ba_8c: in     vl_logic;
        cor_ser_int_sts_1_ba_97: in     vl_logic;
        cor_gen_int_sts_4_ba_98: in     vl_logic;
        resetn          : in     vl_logic;
        test_clk        : in     vl_logic;
        test_mode       : in     vl_logic;
        force_int       : in     vl_logic;
        prbs_error      : in     vl_logic;
        bip_error       : in     vl_logic
    );
end int_lane;
