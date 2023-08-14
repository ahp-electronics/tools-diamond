library verilog;
use verilog.vl_types.all;
entity int_quad is
    port(
        mca_int_sts_1_ba_83: out    vl_logic_vector(7 downto 0);
        pkt_int_sts_1_ba_85: out    vl_logic_vector(7 downto 0);
        ser_int_sts_1_ba_88: out    vl_logic_vector(7 downto 0);
        int_qua         : out    vl_logic;
        mca_int_ctl_1_ba_0c: in     vl_logic_vector(7 downto 0);
        pkt_int_ctl_1_ba_1c: in     vl_logic_vector(7 downto 0);
        ser_int_ctl_1_ba_3f: in     vl_logic_vector(7 downto 0);
        mca_sts_1_ba_82 : in     vl_logic_vector(7 downto 0);
        pkt_sts_1_ba_84 : in     vl_logic_vector(7 downto 0);
        ser_sts_1_ba_86 : in     vl_logic_vector(7 downto 0);
        cor_mca_int_sts_1_ba_83: in     vl_logic;
        cor_pkt_int_sts_1_ba_85: in     vl_logic;
        cor_ser_int_sts_1_ba_88: in     vl_logic;
        resetn          : in     vl_logic;
        force_int       : in     vl_logic
    );
end int_quad;
