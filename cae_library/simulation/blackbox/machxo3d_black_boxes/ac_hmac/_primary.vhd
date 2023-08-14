library verilog;
use verilog.vl_types.all;
entity ac_hmac is
    generic(
        AC_HMAC_S0      : integer := 0;
        AC_HMAC_I0      : integer := 1;
        AC_HMAC_S1      : integer := 2;
        AC_HMAC_S2      : integer := 3;
        AC_HMAC_S3      : integer := 4;
        AC_HMAC_S4      : integer := 5;
        AC_HMAC_I1      : integer := 6;
        AC_HMAC_S5      : integer := 7;
        AC_HMAC_S6      : integer := 8;
        AC_HMAC_S7      : integer := 9;
        AC_HMAC_S8      : integer := 10;
        AC_HMAC_S9      : integer := 11;
        AC_HMAC_SA      : integer := 12;
        IPAD_PATTN      : integer := 54;
        OPAD_PATTN      : integer := 92
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        init            : in     vl_logic;
        calc_dn         : out    vl_logic;
        pf_strobe       : in     vl_logic;
        pf_result       : in     vl_logic;
        digest_flat     : out    vl_logic_vector(255 downto 0);
        data_in         : in     vl_logic_vector(7 downto 0);
        write_en        : in     vl_logic;
        last_cbyte      : in     vl_logic;
        busy            : out    vl_logic_vector(1 downto 0);
        pass_fail       : out    vl_logic;
        pf_valid        : out    vl_logic;
        sha_init        : out    vl_logic;
        rb_ready        : in     vl_logic;
        data_out        : out    vl_logic_vector(7 downto 0);
        valid_out       : out    vl_logic;
        last_out        : out    vl_logic;
        sha_done        : in     vl_logic;
        sha_digest      : in     vl_logic_vector(255 downto 0)
    );
end ac_hmac;
