library verilog;
use verilog.vl_types.all;
entity ac_ecdsa is
    generic(
        AC_ECDSA_S0     : integer := 0;
        AC_ECDSA_I0     : integer := 1;
        AC_ECDSA_S1     : integer := 2;
        AC_ECDSA_S2     : integer := 3;
        AC_ECDSA_S3     : integer := 4;
        AC_ECDSA_S4     : integer := 5;
        AC_ECDSA_S5     : integer := 6
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        init            : in     vl_logic;
        calc_dn         : out    vl_logic;
        pf_strobe       : in     vl_logic;
        pf_result       : in     vl_logic;
        kpub_flat       : out    vl_logic_vector(511 downto 0);
        sig_flat        : out    vl_logic_vector(511 downto 0);
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
        sha_done        : in     vl_logic
    );
end ac_ecdsa;
